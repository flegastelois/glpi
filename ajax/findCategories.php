<?php
/*
 * @version $Id: find_categories.php 20129 2013-02-04 16:53:59Z moyo $
-------------------------------------------------------------------------
GLPI - Gestionnaire Libre de Parc Informatique
Copyright (C) 2003-2013 by the INDEPNET Development Team.

http://indepnet.net/   http://glpi-project.org
-------------------------------------------------------------------------

LICENSE

This file is part of GLPI.

GLPI is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

GLPI is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with GLPI. If not, see <http://www.gnu.org/licenses/>.
--------------------------------------------------------------------------
*/

include ('../inc/includes.php');


function haveChild($id){

   global $DB;


         $query = 'SELECT id, name FROM glpi_itilcategories WHERE itilcategories_id = '.$id ;


         $result = $DB->query($query);
   
      if($DB->numrows($result) > 0) {
         return true;
      }else{
         return  false;
      }
      

}

function getChildOf($current = 0, $previous_code = '', $initial = 0 , $count = 1) {

   $plop = $current;

   global $DB;
   $output = '';

   
   if($current > 0) {
      $query = 'SELECT itilcategories_id, is_incident, is_request
                  FROM glpi_itilcategories
                  WHERE id = '.$current;
      $result = $DB->query($query);
      list($parent, $is_incident, $is_request) = $result->fetch_array();
     
   }else{
      $parent = 0;
      $is_incident = 1;
      $is_request = 1;
   }
   
   if((($_POST['type'] == 1) && ($is_incident == 1)) 
         || (($_POST['type'] == 2) && ($is_request == 1))
         || ($current == 0)) {
      $allowed = true;
   }else{
      $allowed = false;
   }


   if(haveChild($initial)){


         if($initial == 0 || $current == 0){
   $query = 'SELECT id, name
               FROM glpi_itilcategories
               WHERE itilcategories_id = '.$current.' order by name' ;
   }else{
         $query = 'SELECT id, name
               FROM glpi_itilcategories
               WHERE id = '.$initial;
   }
   

   $result = $DB->query($query);
   
   if($DB->numrows($result) > 0) {
      $output = PHP_EOL . '<div id="category_' . $parent . '">'. PHP_EOL
               . "\t" . '<select name="category_select' . $initial . '" id="category_select'
               . rand(1000,100000) . '" onchange="getChildCategories(this.value, '.$_POST['type'].')">' . PHP_EOL;
      
      // Si la categorie ne peut être sélectionner pour le type de ticket, on masque la ligne vide 
      //    des sous-categorie pour imposer la sélection d'une sous catégorie
      if($allowed) {
         $output .= "\t\t".'<option value="0">---</option>'.PHP_EOL;
      }

while($cat = $result->fetch_array()) {

               //get subcategories
               $querySubCat = 'SELECT id, name FROM glpi_itilcategories WHERE itilcategories_id = '.$cat['id'].' order by name' ;
               $resultSubCat = $DB->query($querySubCat);


               if($DB->numrows($resultSubCat) > 0) {

                  $output .= "\t\t".'<optgroup  label="'.$cat['name'].'">'.PHP_EOL;

                  while($subCat = $resultSubCat->fetch_array()) {

                     $selected = '';
                     if($initial != 0 && $initial == $subCat['id']) $selected = ' selected="selected"';
                     $output .= "\t\t".'<option '.$selected.' value="'.$subCat['id'].'">'."\t\t".$subCat['name'].'</option>'.PHP_EOL;

                  }

                  $output .= "\t\t".'</optgroup>'.PHP_EOL;

               }else{

      $output .= "\t\t".'<optgroup  label="'.$cat['name'].'">'.PHP_EOL;
      $output .= "\t\t".'</optgroup>'.PHP_EOL;
                 // $selected = '';
                 // if($initial != 0 && $initial == $cat['id']) $selected = ' selected="selected"';

                 // $output .= "\t\t".'<option '.$selected.' value="'.$cat['id'].'">'."\t\t".$cat['name'].'</option>'.PHP_EOL;


               }

         }


       
      $output .=  "\t".'</select>'.PHP_EOL;
      $output .=  $previous_code;
      $output .=  '</div>'.PHP_EOL;

      $output .= '<script type="text/javascript">'.PHP_EOL;
      $output .= '$("select[name=\'category_select' . $current . '\']").val(\''.$initial.'\');'.PHP_EOL;
      $output .= '</script>';
   }
   }else{

      $output .= '<script type="text/javascript">'.PHP_EOL;
      $output .= '$("select[name=\'category_select' . $plop . '\']").val(\''.$initial.'\');'.PHP_EOL;
      $output .= '</script>';

   }



   if($count == 1 && $current > 0) {
      $output = '';
      $count++;
   }

   if($current > 0 ) getChildOf($parent, $output, $current, $count);
   else echo $output;
}

getChildOf($_POST['id']);

$query = 'SELECT is_incident, is_request
                  FROM glpi_itilcategories
                  WHERE id = '.$_POST['id'];
$result = $DB->query($query);
list($is_incident, $is_request) = $result->fetch_array();

if((($_POST['type'] == 1) && ($is_incident == 1))
      || (($_POST['type'] == 2) && ($is_request == 1))
      || ($_POST['id'] == 0)) {
   $return_id = $_POST['id'];
}else{
   $field = ($_POST['type'] == 1) ? 'is_incident' : 'is_request';
   $query = 'SELECT id
               FROM glpi_itilcategories
               WHERE itilcategories_id = '.$_POST['id'].'
               AND '.$field.' = 1
               LIMIT 0, 1';
   $result = $DB->query($query);
   if($DB->numrows($result) > 0) {
      list($return_id) = $result->fetch_array();
   }
}

echo '<script type="text/javascript">'.PHP_EOL;
echo 'document.getElementById("itilcategories_id").value = '.$return_id.';'.PHP_EOL;
echo '</script>';
<?php
/*
 -------------------------------------------------------------------------
 GLPI - Gestionnaire Libre de Parc Informatique
 Copyright (C) 2015-2016 Teclib'.

 http://glpi-project.org

 based on GLPI - Gestionnaire Libre de Parc Informatique
 Copyright (C) 2003-2014 by the INDEPNET Development Team.

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

/** @file
* @brief
*/

// ----------------------------------------------------------------------
// Based on the original file:
//* Author  : Roberto B.               *
//* E-Mail  : roberto.butti@libero.it  *
//* Version : 1.0.3                    *
// Purpose of file:
// ----------------------------------------------------------------------

if (!defined('GLPI_ROOT')) {
   die("Sorry. You can't access this file directly");
}


/// XML class
class XML {

   /// Array of SQL requests to export
   public $SqlString    = "";
   /// 1 there is a problem !!!
   public $IsError      = 0;
   /// If there is an error, this string explains it
   public $ErrorString  = "NO errors ;)";
   ///path where the file will be saved.
   public $FilePath;

   /**
    * Do XML export
   **/
   function DoXML() {
      global $DB;

      $xmlE = new SimpleXMLElement('<tables/>');

      foreach ($this->SqlString as $qrytab) {
         $table = $qrytab['table'];
         $strqry = $qrytab['query'];

         if ($strqry == "") {
            $this->IsError     = 1;
            $this->ErrorString = "Error the query can't be a null string";
            return -1;
         }
         $result = $DB->query($strqry);

         if ($result == FALSE) {
            $this->IsError     = 1;
            $this->ErrorString = "Error in SQL Query: ".$strqry;
            return -1;
         }

         $xmlETable = $xmlE->addChild('table');
         $xmlETable->addAttribute('name', $table);

         $xmlEFields = $xmlETable->addChild('fields');

         $i = 0;
         $FieldsVector = array();
         while ($i < $DB->num_fields ($result)) {
            $name = $DB->field_name($result,$i);
            $xmlEFields->$name = "";
            $FieldsVector[] = $name;
            $i++;
         }

         $xmlERows = $xmlETable->addChild('rows');

         $r = 1;
         while ($row = $DB->fetch_row($result)) {
            $xmlERow = $xmlERows->addChild('row');
            $xmlERow->addAttribute('num', $r);

            for ($j=0 ; $j<$i ; $j++) {
               $FieldName = $FieldsVector[$j];
               $xmlERow->$FieldName = Toolbox::encodeInUtf8(htmlspecialchars($row[$j]));
            }
            $r++;
         }
      }

      $xmlE->asXML($this->FilePath);

   } // End  Function : DoXML

} // Fine Class XML


<?php
/**
 * ---------------------------------------------------------------------
 * GLPI - Gestionnaire Libre de Parc Informatique
 * Copyright (C) 2015-2018 Teclib' and contributors.
 *
 * http://glpi-project.org
 *
 * based on GLPI - Gestionnaire Libre de Parc Informatique
 * Copyright (C) 2003-2014 by the INDEPNET Development Team.
 *
 * ---------------------------------------------------------------------
 *
 * LICENSE
 *
 * This file is part of GLPI.
 *
 * GLPI is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * GLPI is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with GLPI. If not, see <http://www.gnu.org/licenses/>.
 * ---------------------------------------------------------------------
 */

include (__DIR__ . '/../inc/includes.php');

$DB->disableTableCaching();

$RELATION = [];

$tables_iterator = $DB->listTables();
while ($table = $tables_iterator->next()) {
  $RELATION[$table['TABLE_NAME']] = [];
}

$tables_iterator = $DB->listTables();
while ($table = $tables_iterator->next()) {
   $fields = $DB->list_fields($table['TABLE_NAME']);
   foreach ($fields as $field) {

      $fk_table = getTableNameForForeignKeyField($field['Field']);

      if ($fk_table !== "" && array_key_exists($fk_table, $RELATION)) {

         if (array_key_exists($table['TABLE_NAME'], $RELATION[$fk_table])) {
            if (is_array($RELATION[$fk_table][$table['TABLE_NAME']])) {
               array_push($RELATION[$fk_table][$table['TABLE_NAME']], $field['Field']);
            } else {
               $RELATION[$fk_table][$table['TABLE_NAME']] = [
                  $RELATION[$fk_table][$table['TABLE_NAME']],
                  $field['Field']
               ];
            }
         } else {
            $RELATION[$fk_table][$table['TABLE_NAME']] = $field['Field'];
         }
      }
   }
}

$nbTables = count($RELATION);
$i = 1;

echo "[\n";
foreach($RELATION as $table_name => $relations) {
  echo "'".$table_name."'\n";
  $nbRelations = count($relations);
  $j = 1;
  if ($nbRelations > 0) {
    echo "   => [";

   $relations_keys = array_keys($relations);
   $longest = max(array_map('strlen', $relations_keys));

    foreach($relations as $relation_name => $field) {

      if (is_array($field)) {
         foreach ($field as $key => $value) {
            $field[$key] = "'".$value."'";
         }
         $fieldEcho = "[";
         $fieldEcho.= implode(', ', $field);
         $fieldEcho.= "]";
      } else {
         $fieldEcho = "'".$field."'";
      }

      if ($j != 1) {
        echo "\n       '".$relation_name."'";
        for ($k = 0; $k < ($longest-strlen($relation_name)); $k++) {
         echo " ";
        }
        echo "=> ".$fieldEcho."";
      } else {
        echo "'".$relation_name."'";
        for ($k = 0; $k < ($longest-strlen($relation_name)); $k++) {
         echo " ";
        }
        echo "=> ".$fieldEcho."";
      }
      if ($j == $nbRelations) {
        echo "]";
      } else {
        echo ",";
      }
      $j++;
    }
  } else {
    echo "   => []";
  }

  if ($i == $nbTables) {
    echo "\n";
  } else {
    echo ",\n";
  }
  $i++;
}
echo "]\n";

function mysort($a,$b){
    return strlen($b)-strlen($a);
}

/*
$DB->query("SET FOREIGN_KEY_CHECKS = '0';");
$result = $DB->list_tables();
$numtab = 0;

while ($t=$DB->fetch_array($result)) {
   $query = "ALTER TABLE `$t[0]`
             TYPE = innodb";
   $DB->query($query);
}

$relations = getDbRelations();

$query = [];
foreach ($relations as $totable => $rels) {
   foreach ($rels as $fromtable => $fromfield) {

      if ($fromtable[0]=="_") {
         $fromtable = substr($fromtable, 1);
      }

      if (!is_array($fromfield)) {
         $query[$fromtable][] = " ADD CONSTRAINT `". $fromtable."_".$fromfield."`
                                  FOREIGN KEY (`$fromfield`)
                                  REFERENCES `$totable` (`id`) ";
      } else {
         foreach ($fromfield as $f) {
            $query[$fromtable][] = " ADD CONSTRAINT `".$fromtable."_".$f."`
                                     FOREIGN KEY (`$f`)
                                     REFERENCES `$totable` (`id`) ";
         }
      }

   }
}


foreach ($query as $table => $constraints) {
   $q = "ALTER TABLE `$table` ";
   $first = true;

   foreach ($constraints as $c) {
      if ($first) {
         $first = false;
      } else {
         $q .= ", ";
      }
      $q .= $c;
   }

   echo $q."<br><br>";
   $DB->query($q) or die($q." ".$DB->error());

}

$DB->query("SET FOREIGN_KEY_CHECKS = 1;");
*/
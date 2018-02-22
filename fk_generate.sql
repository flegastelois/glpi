ALTER TABLE `glpi_authldapreplicates` ADD CONSTRAINT `glpi_authldapreplicates_authldaps_id`
FOREIGN KEY (`authldaps_id`) REFERENCES `glpi_authldaps` (`id`) ;


ALTER TABLE `glpi_entities` ADD CONSTRAINT `glpi_entities_authldaps_id`
FOREIGN KEY (`authldaps_id`) REFERENCES `glpi_authldaps` (`id`),
                                        ADD CONSTRAINT `glpi_entities_calendars_id`
FOREIGN KEY (`calendars_id`) REFERENCES `glpi_calendars` (`id`),
                                        ADD CONSTRAINT `glpi_entities_entities_id`
FOREIGN KEY (`entities_id`) REFERENCES `glpi_entities` (`id`),
                                       ADD CONSTRAINT `glpi_entities_entities_id_software`
FOREIGN KEY (`entities_id_software`) REFERENCES `glpi_entities` (`id`),
                                                ADD CONSTRAINT `glpi_entities_tickettemplates_id`
FOREIGN KEY (`tickettemplates_id`) REFERENCES `glpi_tickettemplates` (`id`) ;


ALTER TABLE `glpi_computers` ADD CONSTRAINT `glpi_computers_autoupdatesystems_id`
FOREIGN KEY (`autoupdatesystems_id`) REFERENCES `glpi_autoupdatesystems` (`id`),
                                                ADD CONSTRAINT `glpi_computers_computermodels_id`
FOREIGN KEY (`computermodels_id`) REFERENCES `glpi_computermodels` (`id`),
                                             ADD CONSTRAINT `glpi_computers_computertypes_id`
FOREIGN KEY (`computertypes_id`) REFERENCES `glpi_computertypes` (`id`),
                                            ADD CONSTRAINT `glpi_computers_domains_id`
FOREIGN KEY (`domains_id`) REFERENCES `glpi_domains` (`id`),
                                      ADD CONSTRAINT `glpi_computers_entities_id`
FOREIGN KEY (`entities_id`) REFERENCES `glpi_entities` (`id`),
                                       ADD CONSTRAINT `glpi_computers_groups_id_tech`
FOREIGN KEY (`groups_id_tech`) REFERENCES `glpi_groups` (`id`),
                                          ADD CONSTRAINT `glpi_computers_groups_id`
FOREIGN KEY (`groups_id`) REFERENCES `glpi_groups` (`id`),
                                     ADD CONSTRAINT `glpi_computers_locations_id`
FOREIGN KEY (`locations_id`) REFERENCES `glpi_locations` (`id`),
                                        ADD CONSTRAINT `glpi_computers_manufacturers_id`
FOREIGN KEY (`manufacturers_id`) REFERENCES `glpi_manufacturers` (`id`),
                                            ADD CONSTRAINT `glpi_computers_networks_id`
FOREIGN KEY (`networks_id`) REFERENCES `glpi_networks` (`id`),
                                       ADD CONSTRAINT `glpi_computers_states_id`
FOREIGN KEY (`states_id`) REFERENCES `glpi_states` (`id`),
                                     ADD CONSTRAINT `glpi_computers_users_id_tech`
FOREIGN KEY (`users_id_tech`) REFERENCES `glpi_users` (`id`),
                                         ADD CONSTRAINT `glpi_computers_users_id`
FOREIGN KEY (`users_id`) REFERENCES `glpi_users` (`id`) ;


ALTER TABLE `glpi_savedsearches_users` ADD CONSTRAINT `glpi_savedsearches_users_savedsearches_id`
FOREIGN KEY (`savedsearches_id`) REFERENCES `glpi_savedsearches` (`id`),
                                            ADD CONSTRAINT `glpi_savedsearches_users_users_id`
FOREIGN KEY (`users_id`) REFERENCES `glpi_users` (`id`) ;


ALTER TABLE `glpi_infocoms` ADD CONSTRAINT `glpi_infocoms_budgets_id`
FOREIGN KEY (`budgets_id`) REFERENCES `glpi_budgets` (`id`),
                                      ADD CONSTRAINT `glpi_infocoms_entities_id`
FOREIGN KEY (`entities_id`) REFERENCES `glpi_entities` (`id`),
                                       ADD CONSTRAINT `glpi_infocoms_suppliers_id`
FOREIGN KEY (`suppliers_id`) REFERENCES `glpi_suppliers` (`id`);


ALTER TABLE `glpi_calendarsegments` ADD CONSTRAINT `glpi_calendarsegments_calendars_id`
FOREIGN KEY (`calendars_id`) REFERENCES `glpi_calendars` (`id`),
                                        ADD CONSTRAINT `glpi_calendarsegments_entities_id`
FOREIGN KEY (`entities_id`) REFERENCES `glpi_entities` (`id`) ;


ALTER TABLE `glpi_calendars_holidays` ADD CONSTRAINT `glpi_calendars_holidays_calendars_id`
FOREIGN KEY (`calendars_id`) REFERENCES `glpi_calendars` (`id`),
                                        ADD CONSTRAINT `glpi_calendars_holidays_holidays_id`
FOREIGN KEY (`holidays_id`) REFERENCES `glpi_holidays` (`id`) ;


ALTER TABLE `glpi_slms` ADD CONSTRAINT `glpi_slms_calendars_id`
FOREIGN KEY (`calendars_id`) REFERENCES `glpi_calendars` (`id`),
                                        ADD CONSTRAINT `glpi_slms_entities_id`
FOREIGN KEY (`entities_id`) REFERENCES `glpi_entities` (`id`) ;


ALTER TABLE `glpi_cartridges` ADD CONSTRAINT `glpi_cartridges_cartridgeitems_id`
FOREIGN KEY (`cartridgeitems_id`) REFERENCES `glpi_cartridgeitems` (`id`),
                                             ADD CONSTRAINT `glpi_cartridges_entities_id`
FOREIGN KEY (`entities_id`) REFERENCES `glpi_entities` (`id`),
                                       ADD CONSTRAINT `glpi_cartridges_printers_id`
FOREIGN KEY (`printers_id`) REFERENCES `glpi_printers` (`id`) ;


ALTER TABLE `glpi_cartridgeitems_printermodels` ADD CONSTRAINT `glpi_cartridgeitems_printermodels_cartridgeitems_id`
FOREIGN KEY (`cartridgeitems_id`) REFERENCES `glpi_cartridgeitems` (`id`),
                                             ADD CONSTRAINT `glpi_cartridgeitems_printermodels_printermodels_id`
FOREIGN KEY (`printermodels_id`) REFERENCES `glpi_printermodels` (`id`) ;


ALTER TABLE `glpi_cartridgeitems` ADD CONSTRAINT `glpi_cartridgeitems_cartridgeitemtypes_id`
FOREIGN KEY (`cartridgeitemtypes_id`) REFERENCES `glpi_cartridgeitemtypes` (`id`),
                                                 ADD CONSTRAINT `glpi_cartridgeitems_entities_id`
FOREIGN KEY (`entities_id`) REFERENCES `glpi_entities` (`id`),
                                       ADD CONSTRAINT `glpi_cartridgeitems_groups_id_tech`
FOREIGN KEY (`groups_id_tech`) REFERENCES `glpi_groups` (`id`),
                                          ADD CONSTRAINT `glpi_cartridgeitems_locations_id`
FOREIGN KEY (`locations_id`) REFERENCES `glpi_locations` (`id`),
                                        ADD CONSTRAINT `glpi_cartridgeitems_manufacturers_id`
FOREIGN KEY (`manufacturers_id`) REFERENCES `glpi_manufacturers` (`id`),
                                            ADD CONSTRAINT `glpi_cartridgeitems_users_id_tech`
FOREIGN KEY (`users_id_tech`) REFERENCES `glpi_users` (`id`) ;


ALTER TABLE `glpi_changes_groups` ADD CONSTRAINT `glpi_changes_groups_changes_id`
FOREIGN KEY (`changes_id`) REFERENCES `glpi_changes` (`id`),
                                      ADD CONSTRAINT `glpi_changes_groups_groups_id`
FOREIGN KEY (`groups_id`) REFERENCES `glpi_groups` (`id`) ;


ALTER TABLE `glpi_changes_items` ADD CONSTRAINT `glpi_changes_items_changes_id`
FOREIGN KEY (`changes_id`) REFERENCES `glpi_changes` (`id`) ;


ALTER TABLE `glpi_changes_problems` ADD CONSTRAINT `glpi_changes_problems_changes_id`
FOREIGN KEY (`changes_id`) REFERENCES `glpi_changes` (`id`),
                                      ADD CONSTRAINT `glpi_changes_problems_problems_id`
FOREIGN KEY (`problems_id`) REFERENCES `glpi_problems` (`id`) ;


ALTER TABLE `glpi_changes_projects` ADD CONSTRAINT `glpi_changes_projects_changes_id`
FOREIGN KEY (`changes_id`) REFERENCES `glpi_changes` (`id`),
                                      ADD CONSTRAINT `glpi_changes_projects_projects_id`
FOREIGN KEY (`projects_id`) REFERENCES `glpi_projects` (`id`) ;


ALTER TABLE `glpi_changes_suppliers` ADD CONSTRAINT `glpi_changes_suppliers_changes_id`
FOREIGN KEY (`changes_id`) REFERENCES `glpi_changes` (`id`),
                                      ADD CONSTRAINT `glpi_changes_suppliers_suppliers_id`
FOREIGN KEY (`suppliers_id`) REFERENCES `glpi_suppliers` (`id`) ;


ALTER TABLE `glpi_changes_tickets` ADD CONSTRAINT `glpi_changes_tickets_changes_id`
FOREIGN KEY (`changes_id`) REFERENCES `glpi_changes` (`id`),
                                      ADD CONSTRAINT `glpi_changes_tickets_tickets_id`
FOREIGN KEY (`tickets_id`) REFERENCES `glpi_tickets` (`id`) ;


ALTER TABLE `glpi_changes_users` ADD CONSTRAINT `glpi_changes_users_changes_id`
FOREIGN KEY (`changes_id`) REFERENCES `glpi_changes` (`id`),
                                      ADD CONSTRAINT `glpi_changes_users_users_id`
FOREIGN KEY (`users_id`) REFERENCES `glpi_users` (`id`) ;


ALTER TABLE `glpi_changetasks` ADD CONSTRAINT `glpi_changetasks_changes_id`
FOREIGN KEY (`changes_id`) REFERENCES `glpi_changes` (`id`),
                                          ADD CONSTRAINT `glpi_changetasks_taskcategories_id`
FOREIGN KEY (`taskcategories_id`) REFERENCES `glpi_taskcategories` (`id`),
                                             ADD CONSTRAINT `glpi_changetasks_users_id`
FOREIGN KEY (`users_id`) REFERENCES `glpi_users` (`id`),
                                    ADD CONSTRAINT `glpi_changetasks_users_id_tech`
FOREIGN KEY (`users_id_tech`) REFERENCES `glpi_users` (`id`) ;


ALTER TABLE `glpi_computers_items` ADD CONSTRAINT `glpi_computers_items_computers_id`
FOREIGN KEY (`computers_id`) REFERENCES `glpi_computers` (`id`) ;


ALTER TABLE `glpi_computers_softwarelicenses` ADD CONSTRAINT `glpi_computers_softwarelicenses_computers_id`
FOREIGN KEY (`computers_id`) REFERENCES `glpi_computers` (`id`),
                                        ADD CONSTRAINT `glpi_computers_softwarelicenses_softwarelicenses_id`
FOREIGN KEY (`softwarelicenses_id`) REFERENCES `glpi_softwarelicenses` (`id`) ;


ALTER TABLE `glpi_computers_softwareversions` ADD CONSTRAINT `glpi_computers_softwareversions_computers_id`
FOREIGN KEY (`computers_id`) REFERENCES `glpi_computers` (`id`),
                                        ADD CONSTRAINT `glpi_computers_softwareversions_softwareversions_id`
FOREIGN KEY (`softwareversions_id`) REFERENCES `glpi_softwareversions` (`id`) ;


ALTER TABLE `glpi_computervirtualmachines` ADD CONSTRAINT `glpi_computervirtualmachines_computers_id`
FOREIGN KEY (`computers_id`) REFERENCES `glpi_computers` (`id`),
                                        ADD CONSTRAINT `glpi_computervirtualmachines_entities_id`
FOREIGN KEY (`entities_id`) REFERENCES `glpi_entities` (`id`),
                                       ADD CONSTRAINT `glpi_computervirtualmachines_virtualmachinestates_id`
FOREIGN KEY (`virtualmachinestates_id`) REFERENCES `glpi_virtualmachinestates` (`id`),
                                                   ADD CONSTRAINT `glpi_computervirtualmachines_virtualmachinesystems_id`
FOREIGN KEY (`virtualmachinesystems_id`) REFERENCES `glpi_virtualmachinesystems` (`id`),
                                                    ADD CONSTRAINT `glpi_computervirtualmachines_virtualmachinetypes_id`
FOREIGN KEY (`virtualmachinetypes_id`) REFERENCES `glpi_virtualmachinetypes` (`id`) ;


ALTER TABLE `glpi_consumables` ADD CONSTRAINT `glpi_consumables_consumableitems_id`
FOREIGN KEY (`consumableitems_id`) REFERENCES `glpi_consumableitems` (`id`),
                                              ADD CONSTRAINT `glpi_consumables_entities_id`
FOREIGN KEY (`entities_id`) REFERENCES `glpi_entities` (`id`) ;


ALTER TABLE `glpi_consumableitems` ADD CONSTRAINT `glpi_consumableitems_consumableitemtypes_id`
FOREIGN KEY (`consumableitemtypes_id`) REFERENCES `glpi_consumableitemtypes` (`id`),
                                                  ADD CONSTRAINT `glpi_consumableitems_entities_id`
FOREIGN KEY (`entities_id`) REFERENCES `glpi_entities` (`id`),
                                       ADD CONSTRAINT `glpi_consumableitems_groups_id_tech`
FOREIGN KEY (`groups_id_tech`) REFERENCES `glpi_groups` (`id`),
                                          ADD CONSTRAINT `glpi_consumableitems_locations_id`
FOREIGN KEY (`locations_id`) REFERENCES `glpi_locations` (`id`),
                                        ADD CONSTRAINT `glpi_consumableitems_manufacturers_id`
FOREIGN KEY (`manufacturers_id`) REFERENCES `glpi_manufacturers` (`id`),
                                            ADD CONSTRAINT `glpi_consumableitems_users_id_tech`
FOREIGN KEY (`users_id_tech`) REFERENCES `glpi_users` (`id`) ;


ALTER TABLE `glpi_contacts_suppliers` ADD CONSTRAINT `glpi_contacts_suppliers_contacts_id`
FOREIGN KEY (`contacts_id`) REFERENCES `glpi_contacts` (`id`),
                                       ADD CONSTRAINT `glpi_contacts_suppliers_suppliers_id`
FOREIGN KEY (`suppliers_id`) REFERENCES `glpi_suppliers` (`id`) ;


ALTER TABLE `glpi_contacts` ADD CONSTRAINT `glpi_contacts_contacttypes_id`
FOREIGN KEY (`contacttypes_id`) REFERENCES `glpi_contacttypes` (`id`),
                                           ADD CONSTRAINT `glpi_contacts_entities_id`
FOREIGN KEY (`entities_id`) REFERENCES `glpi_entities` (`id`),
                                       ADD CONSTRAINT `glpi_contacts_usertitles_id`
FOREIGN KEY (`usertitles_id`) REFERENCES `glpi_usertitles` (`id`) ;


ALTER TABLE `glpi_contracts_items` ADD CONSTRAINT `glpi_contracts_items_contracts_id`
FOREIGN KEY (`contracts_id`) REFERENCES `glpi_contracts` (`id`);


ALTER TABLE `glpi_contracts_suppliers` ADD CONSTRAINT `glpi_contracts_suppliers_contracts_id`
FOREIGN KEY (`contracts_id`) REFERENCES `glpi_contracts` (`id`),
                                        ADD CONSTRAINT `glpi_contracts_suppliers_suppliers_id`
FOREIGN KEY (`suppliers_id`) REFERENCES `glpi_suppliers` (`id`) ;


ALTER TABLE `glpi_contracts` ADD CONSTRAINT `glpi_contracts_contracttypes_id`
FOREIGN KEY (`contracttypes_id`) REFERENCES `glpi_contracttypes` (`id`),
                                            ADD CONSTRAINT `glpi_contracts_entities_id`
FOREIGN KEY (`entities_id`) REFERENCES `glpi_entities` (`id`) ;


ALTER TABLE `glpi_items_devicecases` ADD CONSTRAINT `glpi_items_devicecases_devicecases_id`
FOREIGN KEY (`devicecases_id`) REFERENCES `glpi_devicecases` (`id`) ;


ALTER TABLE `glpi_devicecases` ADD CONSTRAINT `glpi_devicecases_devicecasetypes_id`
FOREIGN KEY (`devicecasetypes_id`) REFERENCES `glpi_devicecasetypes` (`id`),
                                              ADD CONSTRAINT `glpi_devicecases_manufacturers_id`
FOREIGN KEY (`manufacturers_id`) REFERENCES `glpi_manufacturers` (`id`) ;


ALTER TABLE `glpi_items_devicecontrols` ADD CONSTRAINT `glpi_items_devicecontrols_devicecontrols_id`
FOREIGN KEY (`devicecontrols_id`) REFERENCES `glpi_devicecontrols` (`id`) ;


ALTER TABLE `glpi_items_devicedrives` ADD CONSTRAINT `glpi_items_devicedrives_devicedrives_id`
FOREIGN KEY (`devicedrives_id`) REFERENCES `glpi_devicedrives` (`id`) ;


ALTER TABLE `glpi_items_devicegraphiccards` ADD CONSTRAINT `glpi_items_devicegraphiccards_devicegraphiccards_id`
FOREIGN KEY (`devicegraphiccards_id`) REFERENCES `glpi_devicegraphiccards` (`id`) ;


ALTER TABLE `glpi_items_deviceharddrives` ADD CONSTRAINT `glpi_items_deviceharddrives_deviceharddrives_id`
FOREIGN KEY (`deviceharddrives_id`) REFERENCES `glpi_deviceharddrives` (`id`) ;


ALTER TABLE `glpi_items_devicememories` ADD CONSTRAINT `glpi_items_devicememories_devicememories_id`
FOREIGN KEY (`devicememories_id`) REFERENCES `glpi_devicememories` (`id`) ;


ALTER TABLE `glpi_devicememories` ADD CONSTRAINT `glpi_devicememories_devicememorytypes_id`
FOREIGN KEY (`devicememorytypes_id`) REFERENCES `glpi_devicememorytypes` (`id`),
                                                ADD CONSTRAINT `glpi_devicememories_manufacturers_id`
FOREIGN KEY (`manufacturers_id`) REFERENCES `glpi_manufacturers` (`id`) ;


ALTER TABLE `glpi_items_devicegenerics` ADD CONSTRAINT `glpi_items_devicegenerics_devicegenerics_id`
FOREIGN KEY (`devicegenerics_id`) REFERENCES `glpi_devicemotherboards` (`id`) ;


ALTER TABLE `glpi_items_devicenetworkcards` ADD CONSTRAINT `glpi_items_devicenetworkcards_devicenetworkcards_id`
FOREIGN KEY (`devicenetworkcards_id`) REFERENCES `glpi_devicenetworkcards` (`id`) ;


ALTER TABLE `glpi_items_devicepcis` ADD CONSTRAINT `glpi_items_devicepcis_devicepcis_id`
FOREIGN KEY (`devicepcis_id`) REFERENCES `glpi_devicepcis` (`id`) ;


ALTER TABLE `glpi_items_devicepowersupplies` ADD CONSTRAINT `glpi_items_devicepowersupplies_devicepowersupplies_id`
FOREIGN KEY (`devicepowersupplies_id`) REFERENCES `glpi_devicepowersupplies` (`id`) ;


ALTER TABLE `glpi_items_deviceprocessors` ADD CONSTRAINT `glpi_items_deviceprocessors_deviceprocessors_id`
FOREIGN KEY (`deviceprocessors_id`) REFERENCES `glpi_deviceprocessors` (`id`) ;


ALTER TABLE `glpi_items_devicesoundcards` ADD CONSTRAINT `glpi_items_devicesoundcards_devicesoundcards_id`
FOREIGN KEY (`devicesoundcards_id`) REFERENCES `glpi_devicesoundcards` (`id`) ;


ALTER TABLE `glpi_items_devicebatteries` ADD CONSTRAINT `glpi_items_devicebatteries_devicebatteries_id`
FOREIGN KEY (`devicebatteries_id`) REFERENCES `glpi_devicebatteries` (`id`) ;


ALTER TABLE `glpi_items_devicefirmwares` ADD CONSTRAINT `glpi_items_devicefirmwares_devicefirmwares_id`
FOREIGN KEY (`devicefirmwares_id`) REFERENCES `glpi_devicefirmwares` (`id`) ;


ALTER TABLE `glpi_items_devicesensors` ADD CONSTRAINT `glpi_items_devicesensors_devicesensors_id`
FOREIGN KEY (`devicesensors_id`) REFERENCES `glpi_devicesensors` (`id`) ;


ALTER TABLE `glpi_items_devicesimcards` ADD CONSTRAINT `glpi_items_devicesimcards_devicesimcards_id`
FOREIGN KEY (`devicesimcards_id`) REFERENCES `glpi_devicesimcards` (`id`) ;


ALTER TABLE `glpi_documents` ADD CONSTRAINT `glpi_documents_documentcategories_id`
FOREIGN KEY (`documentcategories_id`) REFERENCES `glpi_documentcategories` (`id`),
                                                 ADD CONSTRAINT `glpi_documents_entities_id`
FOREIGN KEY (`entities_id`) REFERENCES `glpi_entities` (`id`),
                                       ADD CONSTRAINT `glpi_documents_tickets_id`
FOREIGN KEY (`tickets_id`) REFERENCES `glpi_tickets` (`id`),
                                      ADD CONSTRAINT `glpi_documents_users_id`
FOREIGN KEY (`users_id`) REFERENCES `glpi_users` (`id`) ;


ALTER TABLE `glpi_documentcategories` ADD CONSTRAINT `glpi_documentcategories_documentcategories_id`
FOREIGN KEY (`documentcategories_id`) REFERENCES `glpi_documentcategories` (`id`) ;


ALTER TABLE `glpi_documents_items` ADD CONSTRAINT `glpi_documents_items_documents_id`
FOREIGN KEY (`documents_id`) REFERENCES `glpi_documents` (`id`),
                                        ADD CONSTRAINT `glpi_documents_items_entities_id`
FOREIGN KEY (`entities_id`) REFERENCES `glpi_entities` (`id`);


ALTER TABLE `glpi_printers` ADD CONSTRAINT `glpi_printers_domains_id`
FOREIGN KEY (`domains_id`) REFERENCES `glpi_domains` (`id`),
                                      ADD CONSTRAINT `glpi_printers_entities_id`
FOREIGN KEY (`entities_id`) REFERENCES `glpi_entities` (`id`),
                                       ADD CONSTRAINT `glpi_printers_groups_id_tech`
FOREIGN KEY (`groups_id_tech`) REFERENCES `glpi_groups` (`id`),
                                          ADD CONSTRAINT `glpi_printers_groups_id`
FOREIGN KEY (`groups_id`) REFERENCES `glpi_groups` (`id`),
                                     ADD CONSTRAINT `glpi_printers_locations_id`
FOREIGN KEY (`locations_id`) REFERENCES `glpi_locations` (`id`),
                                        ADD CONSTRAINT `glpi_printers_manufacturers_id`
FOREIGN KEY (`manufacturers_id`) REFERENCES `glpi_manufacturers` (`id`),
                                            ADD CONSTRAINT `glpi_printers_networks_id`
FOREIGN KEY (`networks_id`) REFERENCES `glpi_networks` (`id`),
                                       ADD CONSTRAINT `glpi_printers_printermodels_id`
FOREIGN KEY (`printermodels_id`) REFERENCES `glpi_printermodels` (`id`),
                                            ADD CONSTRAINT `glpi_printers_printertypes_id`
FOREIGN KEY (`printertypes_id`) REFERENCES `glpi_printertypes` (`id`),
                                           ADD CONSTRAINT `glpi_printers_states_id`
FOREIGN KEY (`states_id`) REFERENCES `glpi_states` (`id`),
                                     ADD CONSTRAINT `glpi_printers_users_id_tech`
FOREIGN KEY (`users_id_tech`) REFERENCES `glpi_users` (`id`),
                                         ADD CONSTRAINT `glpi_printers_users_id`
FOREIGN KEY (`users_id`) REFERENCES `glpi_users` (`id`) ;


ALTER TABLE `glpi_networkequipments` ADD CONSTRAINT `glpi_networkequipments_domains_id`
FOREIGN KEY (`domains_id`) REFERENCES `glpi_domains` (`id`),
                                      ADD CONSTRAINT `glpi_networkequipments_entities_id`
FOREIGN KEY (`entities_id`) REFERENCES `glpi_entities` (`id`),
                                       ADD CONSTRAINT `glpi_networkequipments_groups_id_tech`
FOREIGN KEY (`groups_id_tech`) REFERENCES `glpi_groups` (`id`),
                                          ADD CONSTRAINT `glpi_networkequipments_groups_id`
FOREIGN KEY (`groups_id`) REFERENCES `glpi_groups` (`id`),
                                     ADD CONSTRAINT `glpi_networkequipments_locations_id`
FOREIGN KEY (`locations_id`) REFERENCES `glpi_locations` (`id`),
                                        ADD CONSTRAINT `glpi_networkequipments_manufacturers_id`
FOREIGN KEY (`manufacturers_id`) REFERENCES `glpi_manufacturers` (`id`),
                                            ADD CONSTRAINT `glpi_networkequipments_networkequipmentmodels_id`
FOREIGN KEY (`networkequipmentmodels_id`) REFERENCES `glpi_networkequipmentmodels` (`id`),
                                                     ADD CONSTRAINT `glpi_networkequipments_networkequipmenttypes_id`
FOREIGN KEY (`networkequipmenttypes_id`) REFERENCES `glpi_networkequipmenttypes` (`id`),
                                                    ADD CONSTRAINT `glpi_networkequipments_networks_id`
FOREIGN KEY (`networks_id`) REFERENCES `glpi_networks` (`id`),
                                       ADD CONSTRAINT `glpi_networkequipments_states_id`
FOREIGN KEY (`states_id`) REFERENCES `glpi_states` (`id`),
                                     ADD CONSTRAINT `glpi_networkequipments_users_id_tech`
FOREIGN KEY (`users_id_tech`) REFERENCES `glpi_users` (`id`),
                                         ADD CONSTRAINT `glpi_networkequipments_users_id`
FOREIGN KEY (`users_id`) REFERENCES `glpi_users` (`id`) ;


ALTER TABLE `glpi_savedsearches` ADD CONSTRAINT `glpi_savedsearches_entities_id`
FOREIGN KEY (`entities_id`) REFERENCES `glpi_entities` (`id`),
                                       ADD CONSTRAINT `glpi_savedsearches_users_id`
FOREIGN KEY (`users_id`) REFERENCES `glpi_users` (`id`) ;


ALTER TABLE `glpi_budgets` ADD CONSTRAINT `glpi_budgets_entities_id`
FOREIGN KEY (`entities_id`) REFERENCES `glpi_entities` (`id`),
                                       ADD CONSTRAINT `glpi_budgets_locations_id`
FOREIGN KEY (`locations_id`) REFERENCES `glpi_locations` (`id`) ;


ALTER TABLE `glpi_calendars` ADD CONSTRAINT `glpi_calendars_entities_id`
FOREIGN KEY (`entities_id`) REFERENCES `glpi_entities` (`id`) ;


ALTER TABLE `glpi_changes` ADD CONSTRAINT `glpi_changes_entities_id`
FOREIGN KEY (`entities_id`) REFERENCES `glpi_entities` (`id`),
                                            ADD CONSTRAINT `glpi_changes_itilcategories_id`
FOREIGN KEY (`itilcategories_id`) REFERENCES `glpi_itilcategories` (`id`),
                                             ADD CONSTRAINT `glpi_changes_users_id_recipient`
FOREIGN KEY (`users_id_recipient`) REFERENCES `glpi_users` (`id`),
                                              ADD CONSTRAINT `glpi_changes_users_id_lastupdater`
FOREIGN KEY (`users_id_lastupdater`) REFERENCES `glpi_users` (`id`) ;


ALTER TABLE `glpi_entities_knowbaseitems` ADD CONSTRAINT `glpi_entities_knowbaseitems_entities_id`
FOREIGN KEY (`entities_id`) REFERENCES `glpi_entities` (`id`),
                                       ADD CONSTRAINT `glpi_entities_knowbaseitems_knowbaseitems_id`
FOREIGN KEY (`knowbaseitems_id`) REFERENCES `glpi_knowbaseitems` (`id`) ;


ALTER TABLE `glpi_entities_reminders` ADD CONSTRAINT `glpi_entities_reminders_entities_id`
FOREIGN KEY (`entities_id`) REFERENCES `glpi_entities` (`id`),
                                       ADD CONSTRAINT `glpi_entities_reminders_reminders_id`
FOREIGN KEY (`reminders_id`) REFERENCES `glpi_reminders` (`id`) ;


ALTER TABLE `glpi_fieldblacklists` ADD CONSTRAINT `glpi_fieldblacklists_entities_id`
FOREIGN KEY (`entities_id`) REFERENCES `glpi_entities` (`id`) ;


ALTER TABLE `glpi_fieldunicities` ADD CONSTRAINT `glpi_fieldunicities_entities_id`
FOREIGN KEY (`entities_id`) REFERENCES `glpi_entities` (`id`) ;


ALTER TABLE `glpi_fqdns` ADD CONSTRAINT `glpi_fqdns_entities_id`
FOREIGN KEY (`entities_id`) REFERENCES `glpi_entities` (`id`) ;


ALTER TABLE `glpi_groups` ADD CONSTRAINT `glpi_groups_entities_id`
FOREIGN KEY (`entities_id`) REFERENCES `glpi_entities` (`id`),
                                       ADD CONSTRAINT `glpi_groups_groups_id`
FOREIGN KEY (`groups_id`) REFERENCES `glpi_groups` (`id`) ;


ALTER TABLE `glpi_groups_knowbaseitems` ADD CONSTRAINT `glpi_groups_knowbaseitems_entities_id`
FOREIGN KEY (`entities_id`) REFERENCES `glpi_entities` (`id`),
                                       ADD CONSTRAINT `glpi_groups_knowbaseitems_groups_id`
FOREIGN KEY (`groups_id`) REFERENCES `glpi_groups` (`id`),
                                     ADD CONSTRAINT `glpi_groups_knowbaseitems_knowbaseitems_id`
FOREIGN KEY (`knowbaseitems_id`) REFERENCES `glpi_knowbaseitems` (`id`) ;


ALTER TABLE `glpi_groups_reminders` ADD CONSTRAINT `glpi_groups_reminders_entities_id`
FOREIGN KEY (`entities_id`) REFERENCES `glpi_entities` (`id`),
                                       ADD CONSTRAINT `glpi_groups_reminders_groups_id`
FOREIGN KEY (`groups_id`) REFERENCES `glpi_groups` (`id`),
                                     ADD CONSTRAINT `glpi_groups_reminders_reminders_id`
FOREIGN KEY (`reminders_id`) REFERENCES `glpi_reminders` (`id`) ;


ALTER TABLE `glpi_holidays` ADD CONSTRAINT `glpi_holidays_entities_id`
FOREIGN KEY (`entities_id`) REFERENCES `glpi_entities` (`id`) ;


ALTER TABLE `glpi_ipaddresses` ADD CONSTRAINT `glpi_ipaddresses_entities_id`
FOREIGN KEY (`entities_id`) REFERENCES `glpi_entities` (`id`) ;


ALTER TABLE `glpi_ipnetworks` ADD CONSTRAINT `glpi_ipnetworks_entities_id`
FOREIGN KEY (`entities_id`) REFERENCES `glpi_entities` (`id`),
                                       ADD CONSTRAINT `glpi_ipnetworks_ipnetworks_id`
FOREIGN KEY (`ipnetworks_id`) REFERENCES `glpi_ipnetworks` (`id`) ;


ALTER TABLE `glpi_itilcategories` ADD CONSTRAINT `glpi_itilcategories_entities_id`
FOREIGN KEY (`entities_id`) REFERENCES `glpi_entities` (`id`),
                                       ADD CONSTRAINT `glpi_itilcategories_groups_id`
FOREIGN KEY (`groups_id`) REFERENCES `glpi_groups` (`id`),
                                     ADD CONSTRAINT `glpi_itilcategories_knowbaseitemcategories_id`
FOREIGN KEY (`knowbaseitemcategories_id`) REFERENCES `glpi_knowbaseitemcategories` (`id`),
                                                     ADD CONSTRAINT `glpi_itilcategories_itilcategories_id`
FOREIGN KEY (`itilcategories_id`) REFERENCES `glpi_itilcategories` (`id`),
                                             ADD CONSTRAINT `glpi_itilcategories_tickettemplates_id_incident`
FOREIGN KEY (`tickettemplates_id_incident`) REFERENCES `glpi_tickettemplates` (`id`),
                                                       ADD CONSTRAINT `glpi_itilcategories_tickettemplates_id_demand`
FOREIGN KEY (`tickettemplates_id_demand`) REFERENCES `glpi_tickettemplates` (`id`),
                                                     ADD CONSTRAINT `glpi_itilcategories_users_id`
FOREIGN KEY (`users_id`) REFERENCES `glpi_users` (`id`) ;


ALTER TABLE `glpi_knowbaseitemcategories` ADD CONSTRAINT `glpi_knowbaseitemcategories_entities_id`
FOREIGN KEY (`entities_id`) REFERENCES `glpi_entities` (`id`),
                                       ADD CONSTRAINT `glpi_knowbaseitemcategories_knowbaseitemcategories_id`
FOREIGN KEY (`knowbaseitemcategories_id`) REFERENCES `glpi_knowbaseitemcategories` (`id`) ;


ALTER TABLE `glpi_knowbaseitems_profiles` ADD CONSTRAINT `glpi_knowbaseitems_profiles_entities_id`
FOREIGN KEY (`entities_id`) REFERENCES `glpi_entities` (`id`),
                                       ADD CONSTRAINT `glpi_knowbaseitems_profiles_knowbaseitems_id`
FOREIGN KEY (`knowbaseitems_id`) REFERENCES `glpi_knowbaseitems` (`id`),
                                            ADD CONSTRAINT `glpi_knowbaseitems_profiles_profiles_id`
FOREIGN KEY (`profiles_id`) REFERENCES `glpi_profiles` (`id`) ;


ALTER TABLE `glpi_links` ADD CONSTRAINT `glpi_links_entities_id`
FOREIGN KEY (`entities_id`) REFERENCES `glpi_entities` (`id`) ;


ALTER TABLE `glpi_locations` ADD CONSTRAINT `glpi_locations_entities_id`
FOREIGN KEY (`entities_id`) REFERENCES `glpi_entities` (`id`),
                                       ADD CONSTRAINT `glpi_locations_locations_id`
FOREIGN KEY (`locations_id`) REFERENCES `glpi_locations` (`id`) ;


ALTER TABLE `glpi_monitors` ADD CONSTRAINT `glpi_monitors_entities_id`
FOREIGN KEY (`entities_id`) REFERENCES `glpi_entities` (`id`),
                                       ADD CONSTRAINT `glpi_monitors_groups_id_tech`
FOREIGN KEY (`groups_id_tech`) REFERENCES `glpi_groups` (`id`),
                                          ADD CONSTRAINT `glpi_monitors_groups_id`
FOREIGN KEY (`groups_id`) REFERENCES `glpi_groups` (`id`),
                                     ADD CONSTRAINT `glpi_monitors_locations_id`
FOREIGN KEY (`locations_id`) REFERENCES `glpi_locations` (`id`),
                                        ADD CONSTRAINT `glpi_monitors_manufacturers_id`
FOREIGN KEY (`manufacturers_id`) REFERENCES `glpi_manufacturers` (`id`),
                                            ADD CONSTRAINT `glpi_monitors_monitormodels_id`
FOREIGN KEY (`monitormodels_id`) REFERENCES `glpi_monitormodels` (`id`),
                                            ADD CONSTRAINT `glpi_monitors_monitortypes_id`
FOREIGN KEY (`monitortypes_id`) REFERENCES `glpi_monitortypes` (`id`),
                                           ADD CONSTRAINT `glpi_monitors_states_id`
FOREIGN KEY (`states_id`) REFERENCES `glpi_states` (`id`),
                                     ADD CONSTRAINT `glpi_monitors_users_id_tech`
FOREIGN KEY (`users_id_tech`) REFERENCES `glpi_users` (`id`),
                                         ADD CONSTRAINT `glpi_monitors_users_id`
FOREIGN KEY (`users_id`) REFERENCES `glpi_users` (`id`) ;


ALTER TABLE `glpi_netpoints` ADD CONSTRAINT `glpi_netpoints_entities_id`
FOREIGN KEY (`entities_id`) REFERENCES `glpi_entities` (`id`),
                                       ADD CONSTRAINT `glpi_netpoints_locations_id`
FOREIGN KEY (`locations_id`) REFERENCES `glpi_locations` (`id`) ;


ALTER TABLE `glpi_networkaliases` ADD CONSTRAINT `glpi_networkaliases_entities_id`
FOREIGN KEY (`entities_id`) REFERENCES `glpi_entities` (`id`),
                                       ADD CONSTRAINT `glpi_networkaliases_fqdns_id`
FOREIGN KEY (`fqdns_id`) REFERENCES `glpi_fqdns` (`id`),
                                    ADD CONSTRAINT `glpi_networkaliases_networknames_id`
FOREIGN KEY (`networknames_id`) REFERENCES `glpi_networknames` (`id`) ;


ALTER TABLE `glpi_networknames` ADD CONSTRAINT `glpi_networknames_entities_id`
FOREIGN KEY (`entities_id`) REFERENCES `glpi_entities` (`id`),
                                       ADD CONSTRAINT `glpi_networknames_fqdns_id`
FOREIGN KEY (`fqdns_id`) REFERENCES `glpi_fqdns` (`id`) ;


ALTER TABLE `glpi_networkports` ADD CONSTRAINT `glpi_networkports_entities_id`
FOREIGN KEY (`entities_id`) REFERENCES `glpi_entities` (`id`) ;


ALTER TABLE `glpi_notifications` ADD CONSTRAINT `glpi_notifications_entities_id`
FOREIGN KEY (`entities_id`) REFERENCES `glpi_entities` (`id`) ;


ALTER TABLE `glpi_peripherals` ADD CONSTRAINT `glpi_peripherals_entities_id`
FOREIGN KEY (`entities_id`) REFERENCES `glpi_entities` (`id`),
                                       ADD CONSTRAINT `glpi_peripherals_groups_id_tech`
FOREIGN KEY (`groups_id_tech`) REFERENCES `glpi_groups` (`id`),
                                          ADD CONSTRAINT `glpi_peripherals_groups_id`
FOREIGN KEY (`groups_id`) REFERENCES `glpi_groups` (`id`),
                                     ADD CONSTRAINT `glpi_peripherals_locations_id`
FOREIGN KEY (`locations_id`) REFERENCES `glpi_locations` (`id`),
                                        ADD CONSTRAINT `glpi_peripherals_manufacturers_id`
FOREIGN KEY (`manufacturers_id`) REFERENCES `glpi_manufacturers` (`id`),
                                            ADD CONSTRAINT `glpi_peripherals_ peripheralmodels_id`
FOREIGN KEY (`peripheralmodels_id`) REFERENCES `glpi_peripheralmodels` (`id`),
                                                ADD CONSTRAINT `glpi_peripherals_peripheraltypes_id`
FOREIGN KEY (`peripheraltypes_id`) REFERENCES `glpi_peripheraltypes` (`id`),
                                              ADD CONSTRAINT `glpi_peripherals_states_id`
FOREIGN KEY (`states_id`) REFERENCES `glpi_states` (`id`),
                                     ADD CONSTRAINT `glpi_peripherals_users_id_tech`
FOREIGN KEY (`users_id_tech`) REFERENCES `glpi_users` (`id`),
                                         ADD CONSTRAINT `glpi_peripherals_users_id`
FOREIGN KEY (`users_id`) REFERENCES `glpi_users` (`id`) ;


ALTER TABLE `glpi_phones` ADD CONSTRAINT `glpi_phones_entities_id`
FOREIGN KEY (`entities_id`) REFERENCES `glpi_entities` (`id`),
                                       ADD CONSTRAINT `glpi_phones_groups_id_tech`
FOREIGN KEY (`groups_id_tech`) REFERENCES `glpi_groups` (`id`),
                                          ADD CONSTRAINT `glpi_phones_groups_id`
FOREIGN KEY (`groups_id`) REFERENCES `glpi_groups` (`id`),
                                     ADD CONSTRAINT `glpi_phones_locations_id`
FOREIGN KEY (`locations_id`) REFERENCES `glpi_locations` (`id`),
                                        ADD CONSTRAINT `glpi_phones_manufacturers_id`
FOREIGN KEY (`manufacturers_id`) REFERENCES `glpi_manufacturers` (`id`),
                                            ADD CONSTRAINT `glpi_phones_phonemodels_id`
FOREIGN KEY (`phonemodels_id`) REFERENCES `glpi_phonemodels` (`id`),
                                          ADD CONSTRAINT `glpi_phones_phonepowersupplies_id`
FOREIGN KEY (`phonepowersupplies_id`) REFERENCES `glpi_phonepowersupplies` (`id`),
                                                 ADD CONSTRAINT `glpi_phones_phonetypes_id`
FOREIGN KEY (`phonetypes_id`) REFERENCES `glpi_phonetypes` (`id`),
                                         ADD CONSTRAINT `glpi_phones_states_id`
FOREIGN KEY (`states_id`) REFERENCES `glpi_states` (`id`),
                                     ADD CONSTRAINT `glpi_phones_users_id_tech`
FOREIGN KEY (`users_id_tech`) REFERENCES `glpi_users` (`id`),
                                         ADD CONSTRAINT `glpi_phones_users_id`
FOREIGN KEY (`users_id`) REFERENCES `glpi_users` (`id`) ;


ALTER TABLE `glpi_problems` ADD CONSTRAINT `glpi_problems_entities_id`
FOREIGN KEY (`entities_id`) REFERENCES `glpi_entities` (`id`),
                                            ADD CONSTRAINT `glpi_problems_itilcategories_id`
FOREIGN KEY (`itilcategories_id`) REFERENCES `glpi_itilcategories` (`id`),
                                             ADD CONSTRAINT `glpi_problems_users_id_recipient`
FOREIGN KEY (`users_id_recipient`) REFERENCES `glpi_users` (`id`),
                                              ADD CONSTRAINT `glpi_problems_users_id_lastupdater`
FOREIGN KEY (`users_id_lastupdater`) REFERENCES `glpi_users` (`id`) ;


ALTER TABLE `glpi_projects` ADD CONSTRAINT `glpi_projects_entities_id`
FOREIGN KEY (`entities_id`) REFERENCES `glpi_entities` (`id`),
                                       ADD CONSTRAINT `glpi_projects_groups_id`
FOREIGN KEY (`groups_id`) REFERENCES `glpi_groups` (`id`),
                                     ADD CONSTRAINT `glpi_projects_projects_id`
FOREIGN KEY (`projects_id`) REFERENCES `glpi_projects` (`id`),
                                       ADD CONSTRAINT `glpi_projects_projectstates_id`
FOREIGN KEY (`projectstates_id`) REFERENCES `glpi_projectstates` (`id`),
                                            ADD CONSTRAINT `glpi_projects_projecttypes_id`
FOREIGN KEY (`projecttypes_id`) REFERENCES `glpi_projecttypes` (`id`),
                                           ADD CONSTRAINT `glpi_projects_users_id`
FOREIGN KEY (`users_id`) REFERENCES `glpi_users` (`id`) ;


ALTER TABLE `glpi_projecttasks` ADD CONSTRAINT `glpi_projecttasks_entities_id`
FOREIGN KEY (`entities_id`) REFERENCES `glpi_entities` (`id`),
                                       ADD CONSTRAINT `glpi_projecttasks_projects_id`
FOREIGN KEY (`projects_id`) REFERENCES `glpi_projects` (`id`),
                                       ADD CONSTRAINT `glpi_projecttasks_projectstates_id`
FOREIGN KEY (`projectstates_id`) REFERENCES `glpi_projectstates` (`id`),
                                            ADD CONSTRAINT `glpi_projecttasks_projecttasks_id`
FOREIGN KEY (`projecttasks_id`) REFERENCES `glpi_projecttasks` (`id`),
                                           ADD CONSTRAINT `glpi_projecttasks_projecttasktypes_id`
FOREIGN KEY (`projecttasktypes_id`) REFERENCES `glpi_projecttasktypes` (`id`),
                                               ADD CONSTRAINT `glpi_projecttasks_users_id`
FOREIGN KEY (`users_id`) REFERENCES `glpi_users` (`id`) ;


ALTER TABLE `glpi_profiles_reminders` ADD CONSTRAINT `glpi_profiles_reminders_entities_id`
FOREIGN KEY (`entities_id`) REFERENCES `glpi_entities` (`id`),
                                       ADD CONSTRAINT `glpi_profiles_reminders_profiles_id`
FOREIGN KEY (`profiles_id`) REFERENCES `glpi_profiles` (`id`),
                                       ADD CONSTRAINT `glpi_profiles_reminders_reminders_id`
FOREIGN KEY (`reminders_id`) REFERENCES `glpi_reminders` (`id`) ;


ALTER TABLE `glpi_profiles_users` ADD CONSTRAINT `glpi_profiles_users_entities_id`
FOREIGN KEY (`entities_id`) REFERENCES `glpi_entities` (`id`),
                                       ADD CONSTRAINT `glpi_profiles_users_profiles_id`
FOREIGN KEY (`profiles_id`) REFERENCES `glpi_profiles` (`id`),
                                       ADD CONSTRAINT `glpi_profiles_users_users_id`
FOREIGN KEY (`users_id`) REFERENCES `glpi_users` (`id`) ;


ALTER TABLE `glpi_reservationitems` ADD CONSTRAINT `glpi_reservationitems_entities_id`
FOREIGN KEY (`entities_id`) REFERENCES `glpi_entities` (`id`) ;


ALTER TABLE `glpi_rules` ADD CONSTRAINT `glpi_rules_entities_id`
FOREIGN KEY (`entities_id`) REFERENCES `glpi_entities` (`id`) ;


ALTER TABLE `glpi_slalevels` ADD CONSTRAINT `glpi_slalevels_entities_id`
FOREIGN KEY (`entities_id`) REFERENCES `glpi_entities` (`id`),
                                       ADD CONSTRAINT `glpi_slalevels_slas_id`
FOREIGN KEY (`slas_id`) REFERENCES `glpi_slas` (`id`) ;


ALTER TABLE `glpi_softwarelicenses` ADD CONSTRAINT `glpi_softwarelicenses_entities_id`
FOREIGN KEY (`entities_id`) REFERENCES `glpi_entities` (`id`),
                                       ADD CONSTRAINT `glpi_softwarelicenses_groups_id_tech`
FOREIGN KEY (`groups_id_tech`) REFERENCES `glpi_groups` (`id`),
                                          ADD CONSTRAINT `glpi_softwarelicenses_groups_id`
FOREIGN KEY (`groups_id`) REFERENCES `glpi_groups` (`id`),
                                     ADD CONSTRAINT `glpi_softwarelicenses_locations_id`
FOREIGN KEY (`locations_id`) REFERENCES `glpi_locations` (`id`),
                                        ADD CONSTRAINT `glpi_softwarelicenses_manufacturers_id`
FOREIGN KEY (`manufacturers_id`) REFERENCES `glpi_manufacturers` (`id`),
                                            ADD CONSTRAINT `glpi_softwarelicenses_softwarelicensetypes_id`
FOREIGN KEY (`softwarelicensetypes_id`) REFERENCES `glpi_softwarelicensetypes` (`id`),
                                                   ADD CONSTRAINT `glpi_softwarelicenses_softwareversions_id_buy`
FOREIGN KEY (`softwareversions_id_buy`) REFERENCES `glpi_softwareversions` (`id`),
                                                   ADD CONSTRAINT `glpi_softwarelicenses_softwareversions_id_use`
FOREIGN KEY (`softwareversions_id_use`) REFERENCES `glpi_softwareversions` (`id`),
                                                   ADD CONSTRAINT `glpi_softwarelicenses_softwares_id`
FOREIGN KEY (`softwares_id`) REFERENCES `glpi_softwares` (`id`),
                                        ADD CONSTRAINT `glpi_softwarelicenses_states_id`
FOREIGN KEY (`states_id`) REFERENCES `glpi_states` (`id`),
                                     ADD CONSTRAINT `glpi_softwarelicenses_users_id_tech`
FOREIGN KEY (`users_id_tech`) REFERENCES `glpi_users` (`id`),
                                         ADD CONSTRAINT `glpi_softwarelicenses_users_id`
FOREIGN KEY (`users_id`) REFERENCES `glpi_users` (`id`) ;


ALTER TABLE `glpi_softwareversions` ADD CONSTRAINT `glpi_softwareversions_entities_id`
FOREIGN KEY (`entities_id`) REFERENCES `glpi_entities` (`id`),
                                       ADD CONSTRAINT `glpi_softwareversions_operatingsystems_id`
FOREIGN KEY (`operatingsystems_id`) REFERENCES `glpi_operatingsystems` (`id`),
                                               ADD CONSTRAINT `glpi_softwareversions_softwares_id`
FOREIGN KEY (`softwares_id`) REFERENCES `glpi_softwares` (`id`),
                                        ADD CONSTRAINT `glpi_softwareversions_states_id`
FOREIGN KEY (`states_id`) REFERENCES `glpi_states` (`id`) ;


ALTER TABLE `glpi_softwares` ADD CONSTRAINT `glpi_softwares_entities_id`
FOREIGN KEY (`entities_id`) REFERENCES `glpi_entities` (`id`),
                                       ADD CONSTRAINT `glpi_softwares_groups_id_tech`
FOREIGN KEY (`groups_id_tech`) REFERENCES `glpi_groups` (`id`),
                                          ADD CONSTRAINT `glpi_softwares_groups_id`
FOREIGN KEY (`groups_id`) REFERENCES `glpi_groups` (`id`),
                                     ADD CONSTRAINT `glpi_softwares_locations_id`
FOREIGN KEY (`locations_id`) REFERENCES `glpi_locations` (`id`),
                                        ADD CONSTRAINT `glpi_softwares_manufacturers_id`
FOREIGN KEY (`manufacturers_id`) REFERENCES `glpi_manufacturers` (`id`),
                                            ADD CONSTRAINT `glpi_softwares_softwarecategories_id`
FOREIGN KEY (`softwarecategories_id`) REFERENCES `glpi_softwarecategories` (`id`),
                                                 ADD CONSTRAINT `glpi_softwares_softwares_id`
FOREIGN KEY (`softwares_id`) REFERENCES `glpi_softwares` (`id`),
                                        ADD CONSTRAINT `glpi_softwares_users_id_tech`
FOREIGN KEY (`users_id_tech`) REFERENCES `glpi_users` (`id`),
                                         ADD CONSTRAINT `glpi_softwares_users_id`
FOREIGN KEY (`users_id`) REFERENCES `glpi_users` (`id`) ;


ALTER TABLE `glpi_solutiontemplates` ADD CONSTRAINT `glpi_solutiontemplates_entities_id`
FOREIGN KEY (`entities_id`) REFERENCES `glpi_entities` (`id`),
                                       ADD CONSTRAINT `glpi_solutiontemplates_solutiontypes_id`
FOREIGN KEY (`solutiontypes_id`) REFERENCES `glpi_solutiontypes` (`id`) ;


ALTER TABLE `glpi_solutiontypes` ADD CONSTRAINT `glpi_solutiontypes_entities_id`
FOREIGN KEY (`entities_id`) REFERENCES `glpi_entities` (`id`) ;


ALTER TABLE `glpi_taskcategories` ADD CONSTRAINT `glpi_taskcategories_entities_id`
FOREIGN KEY (`entities_id`) REFERENCES `glpi_entities` (`id`),
                                       ADD CONSTRAINT `glpi_taskcategories_taskcategories_id`
FOREIGN KEY (`taskcategories_id`) REFERENCES `glpi_taskcategories` (`id`) ;


ALTER TABLE `glpi_tasktemplates` ADD CONSTRAINT `glpi_tasktemplates_entities_id`
FOREIGN KEY (`entities_id`) REFERENCES `glpi_entities` (`id`),
                                       ADD CONSTRAINT `glpi_tasktemplates_taskcategories_id`
FOREIGN KEY (`taskcategories_id`) REFERENCES `glpi_taskcategories` (`id`) ;


ALTER TABLE `glpi_projecttasktemplates` ADD CONSTRAINT `glpi_projecttasktemplates_entities_id`
FOREIGN KEY (`entities_id`) REFERENCES `glpi_entities` (`id`) ;


ALTER TABLE `glpi_suppliers` ADD CONSTRAINT `glpi_suppliers_entities_id`
FOREIGN KEY (`entities_id`) REFERENCES `glpi_entities` (`id`),
                                       ADD CONSTRAINT `glpi_suppliers_suppliertypes_id`
FOREIGN KEY (`suppliertypes_id`) REFERENCES `glpi_suppliertypes` (`id`) ;


ALTER TABLE `glpi_ticketrecurrents` ADD CONSTRAINT `glpi_ticketrecurrents_entities_id`
FOREIGN KEY (`entities_id`) REFERENCES `glpi_entities` (`id`),
                                       ADD CONSTRAINT `glpi_ticketrecurrents_tickettemplates_id`
FOREIGN KEY (`tickettemplates_id`) REFERENCES `glpi_tickettemplates` (`id`) ;


ALTER TABLE `glpi_tickettemplates` ADD CONSTRAINT `glpi_tickettemplates_entities_id`
FOREIGN KEY (`entities_id`) REFERENCES `glpi_entities` (`id`) ;


ALTER TABLE `glpi_tickets` ADD CONSTRAINT `glpi_tickets_entities_id`
FOREIGN KEY (`entities_id`) REFERENCES `glpi_entities` (`id`),
                                       ADD CONSTRAINT `glpi_tickets_locations_id`
FOREIGN KEY (`locations_id`) REFERENCES `glpi_locations` (`id`),
                                        ADD CONSTRAINT `glpi_tickets_requesttypes_id`
FOREIGN KEY (`requesttypes_id`) REFERENCES `glpi_requesttypes` (`id`),
                                           ADD CONSTRAINT `glpi_tickets_ttr_slalevels_id`
FOREIGN KEY (`ttr_slalevels_id`) REFERENCES `glpi_slalevels` (`id`),
                                            ADD CONSTRAINT `glpi_tickets_slas_ttr_id`
FOREIGN KEY (`slas_ttr_id`) REFERENCES `glpi_slas` (`id`),
                                       ADD CONSTRAINT `glpi_tickets_slas_tto_id`
FOREIGN KEY (`slas_tto_id`) REFERENCES `glpi_slas` (`id`),
                                       ADD CONSTRAINT `glpi_tickets_ttr_olalevels_id`
FOREIGN KEY (`ttr_olalevels_id`) REFERENCES `glpi_olalevels` (`id`),
                                            ADD CONSTRAINT `glpi_tickets_olas_ttr_id`
FOREIGN KEY (`olas_ttr_id`) REFERENCES `glpi_olas` (`id`),
                                       ADD CONSTRAINT `glpi_tickets_olas_tto_id`
FOREIGN KEY (`olas_tto_id`) REFERENCES `glpi_olas` (`id`),
                                            ADD CONSTRAINT `glpi_tickets_itilcategories_id`
FOREIGN KEY (`itilcategories_id`) REFERENCES `glpi_itilcategories` (`id`),
                                             ADD CONSTRAINT `glpi_tickets_users_id_recipient`
FOREIGN KEY (`users_id_recipient`) REFERENCES `glpi_users` (`id`),
                                              ADD CONSTRAINT `glpi_tickets_users_id_lastupdater`
FOREIGN KEY (`users_id_lastupdater`) REFERENCES `glpi_users` (`id`) ;


ALTER TABLE `glpi_ticketvalidations` ADD CONSTRAINT `glpi_ticketvalidations_entities_id`
FOREIGN KEY (`entities_id`) REFERENCES `glpi_entities` (`id`),
                                       ADD CONSTRAINT `glpi_ticketvalidations_tickets_id`
FOREIGN KEY (`tickets_id`) REFERENCES `glpi_tickets` (`id`),
                                      ADD CONSTRAINT `glpi_ticketvalidations_users_id_validate`
FOREIGN KEY (`users_id_validate`) REFERENCES `glpi_users` (`id`) ;


ALTER TABLE `glpi_users` ADD CONSTRAINT `glpi_users_entities_id`
FOREIGN KEY (`entities_id`) REFERENCES `glpi_entities` (`id`),
                                       ADD CONSTRAINT `glpi_users_locations_id`
FOREIGN KEY (`locations_id`) REFERENCES `glpi_locations` (`id`),
                                        ADD CONSTRAINT `glpi_users_profiles_id`
FOREIGN KEY (`profiles_id`) REFERENCES `glpi_profiles` (`id`),
                                       ADD CONSTRAINT `glpi_users_default_requesttypes_id`
FOREIGN KEY (`default_requesttypes_id`) REFERENCES `glpi_requesttypes` (`id`),
                                                   ADD CONSTRAINT `glpi_users_usercategories_id`
FOREIGN KEY (`usercategories_id`) REFERENCES `glpi_usercategories` (`id`),
                                             ADD CONSTRAINT `glpi_users_usertitles_id`
FOREIGN KEY (`usertitles_id`) REFERENCES `glpi_usertitles` (`id`) ;


ALTER TABLE `glpi_certificates` ADD CONSTRAINT `glpi_certificates_entities_id`
FOREIGN KEY (`entities_id`) REFERENCES `glpi_entities` (`id`),
                                       ADD CONSTRAINT `glpi_certificates_groups_id_tech`
FOREIGN KEY (`groups_id_tech`) REFERENCES `glpi_groups` (`id`),
                                          ADD CONSTRAINT `glpi_certificates_groups_id`
FOREIGN KEY (`groups_id`) REFERENCES `glpi_groups` (`id`),
                                     ADD CONSTRAINT `glpi_certificates_locations_id`
FOREIGN KEY (`locations_id`) REFERENCES `glpi_locations` (`id`),
                                        ADD CONSTRAINT `glpi_certificates_manufacturers_id`
FOREIGN KEY (`manufacturers_id`) REFERENCES `glpi_manufacturers` (`id`),
                                            ADD CONSTRAINT `glpi_certificates_states_id`
FOREIGN KEY (`states_id`) REFERENCES `glpi_states` (`id`),
                                     ADD CONSTRAINT `glpi_certificates_users_id_tech`
FOREIGN KEY (`users_id_tech`) REFERENCES `glpi_users` (`id`),
                                         ADD CONSTRAINT `glpi_certificates_users_id`
FOREIGN KEY (`users_id`) REFERENCES `glpi_users` (`id`) ;


ALTER TABLE `glpi_items_disks` ADD CONSTRAINT `glpi_items_disks_filesystems_id`
FOREIGN KEY (`filesystems_id`) REFERENCES `glpi_filesystems` (`id`) ;


ALTER TABLE `glpi_groups_problems` ADD CONSTRAINT `glpi_groups_problems_groups_id`
FOREIGN KEY (`groups_id`) REFERENCES `glpi_groups` (`id`),
                                     ADD CONSTRAINT `glpi_groups_problems_problems_id`
FOREIGN KEY (`problems_id`) REFERENCES `glpi_problems` (`id`) ;


ALTER TABLE `glpi_groups_tickets` ADD CONSTRAINT `glpi_groups_tickets_groups_id`
FOREIGN KEY (`groups_id`) REFERENCES `glpi_groups` (`id`),
                                     ADD CONSTRAINT `glpi_groups_tickets_tickets_id`
FOREIGN KEY (`tickets_id`) REFERENCES `glpi_tickets` (`id`) ;


ALTER TABLE `glpi_groups_users` ADD CONSTRAINT `glpi_groups_users_groups_id`
FOREIGN KEY (`groups_id`) REFERENCES `glpi_groups` (`id`),
                                     ADD CONSTRAINT `glpi_groups_users_users_id`
FOREIGN KEY (`users_id`) REFERENCES `glpi_users` (`id`) ;


ALTER TABLE `glpi_deviceharddrives` ADD CONSTRAINT `glpi_deviceharddrives_interfacetypes_id`
FOREIGN KEY (`interfacetypes_id`) REFERENCES `glpi_interfacetypes` (`id`),
                                             ADD CONSTRAINT `glpi_deviceharddrives_manufacturers_id`
FOREIGN KEY (`manufacturers_id`) REFERENCES `glpi_manufacturers` (`id`) ;


ALTER TABLE `glpi_devicedrives` ADD CONSTRAINT `glpi_devicedrives_interfacetypes_id`
FOREIGN KEY (`interfacetypes_id`) REFERENCES `glpi_interfacetypes` (`id`),
                                             ADD CONSTRAINT `glpi_devicedrives_manufacturers_id`
FOREIGN KEY (`manufacturers_id`) REFERENCES `glpi_manufacturers` (`id`) ;


ALTER TABLE `glpi_devicegraphiccards` ADD CONSTRAINT `glpi_devicegraphiccards_interfacetypes_id`
FOREIGN KEY (`interfacetypes_id`) REFERENCES `glpi_interfacetypes` (`id`),
                                             ADD CONSTRAINT `glpi_devicegraphiccards_manufacturers_id`
FOREIGN KEY (`manufacturers_id`) REFERENCES `glpi_manufacturers` (`id`) ;


ALTER TABLE `glpi_devicecontrols` ADD CONSTRAINT `glpi_devicecontrols_interfacetypes_id`
FOREIGN KEY (`interfacetypes_id`) REFERENCES `glpi_interfacetypes` (`id`),
                                             ADD CONSTRAINT `glpi_devicecontrols_manufacturers_id`
FOREIGN KEY (`manufacturers_id`) REFERENCES `glpi_manufacturers` (`id`) ;


ALTER TABLE `glpi_ipaddresses_ipnetworks` ADD CONSTRAINT `glpi_ipaddresses_ipnetworks_ipaddresses_id`
FOREIGN KEY (`ipaddresses_id`) REFERENCES `glpi_ipaddresses` (`id`),
                                          ADD CONSTRAINT `glpi_ipaddresses_ipnetworks_ipnetworks_id`
FOREIGN KEY (`ipnetworks_id`) REFERENCES `glpi_ipnetworks` (`id`) ;


ALTER TABLE `glpi_ipnetworks_vlans` ADD CONSTRAINT `glpi_ipnetworks_vlans_ipnetworks_id`
FOREIGN KEY (`ipnetworks_id`) REFERENCES `glpi_ipnetworks` (`id`) ;


ALTER TABLE `glpi_knowbaseitems` ADD CONSTRAINT `glpi_knowbaseitems_knowbaseitemcategories_id`
FOREIGN KEY (`knowbaseitemcategories_id`) REFERENCES `glpi_knowbaseitemcategories` (`id`),
                                                     ADD CONSTRAINT `glpi_knowbaseitems_users_id`
FOREIGN KEY (`users_id`) REFERENCES `glpi_users` (`id`) ;


ALTER TABLE `glpi_knowbaseitems_users` ADD CONSTRAINT `glpi_knowbaseitems_users_knowbaseitems_id`
FOREIGN KEY (`knowbaseitems_id`) REFERENCES `glpi_knowbaseitems` (`id`),
                                            ADD CONSTRAINT `glpi_knowbaseitems_users_users_id`
FOREIGN KEY (`users_id`) REFERENCES `glpi_users` (`id`) ;


ALTER TABLE `glpi_links_itemtypes` ADD CONSTRAINT `glpi_links_itemtypes_links_id`
FOREIGN KEY (`links_id`) REFERENCES `glpi_links` (`id`) ;


ALTER TABLE `glpi_devicenetworkcards` ADD CONSTRAINT `glpi_devicenetworkcards_manufacturers_id`
FOREIGN KEY (`manufacturers_id`) REFERENCES `glpi_manufacturers` (`id`) ;


ALTER TABLE `glpi_devicemotherboards` ADD CONSTRAINT `glpi_devicemotherboards_manufacturers_id`
FOREIGN KEY (`manufacturers_id`) REFERENCES `glpi_manufacturers` (`id`) ;


ALTER TABLE `glpi_devicepcis` ADD CONSTRAINT `glpi_devicepcis_manufacturers_id`
FOREIGN KEY (`manufacturers_id`) REFERENCES `glpi_manufacturers` (`id`) ;


ALTER TABLE `glpi_devicepowersupplies` ADD CONSTRAINT `glpi_devicepowersupplies_manufacturers_id`
FOREIGN KEY (`manufacturers_id`) REFERENCES `glpi_manufacturers` (`id`) ;


ALTER TABLE `glpi_deviceprocessors` ADD CONSTRAINT `glpi_deviceprocessors_manufacturers_id`
FOREIGN KEY (`manufacturers_id`) REFERENCES `glpi_manufacturers` (`id`) ;


ALTER TABLE `glpi_devicesoundcards` ADD CONSTRAINT `glpi_devicesoundcards_manufacturers_id`
FOREIGN KEY (`manufacturers_id`) REFERENCES `glpi_manufacturers` (`id`) ;


ALTER TABLE `glpi_devicefirmwares` ADD CONSTRAINT `glpi_devicefirmwares_manufacturers_id`
FOREIGN KEY (`manufacturers_id`) REFERENCES `glpi_manufacturers` (`id`) ;


ALTER TABLE `glpi_devicebatteries` ADD CONSTRAINT `glpi_devicebatteries_manufacturers_id`
FOREIGN KEY (`manufacturers_id`) REFERENCES `glpi_manufacturers` (`id`) ;


ALTER TABLE `glpi_devicegenerics` ADD CONSTRAINT `glpi_devicegenerics_manufacturers_id`
FOREIGN KEY (`manufacturers_id`) REFERENCES `glpi_manufacturers` (`id`) ;


ALTER TABLE `glpi_devicesensors` ADD CONSTRAINT `glpi_devicesensors_manufacturers_id`
FOREIGN KEY (`manufacturers_id`) REFERENCES `glpi_manufacturers` (`id`) ;


ALTER TABLE `glpi_devicesimcards` ADD CONSTRAINT `glpi_devicesimcards_manufacturers_id`
FOREIGN KEY (`manufacturers_id`) REFERENCES `glpi_manufacturers` (`id`);


ALTER TABLE `glpi_networkportethernets` ADD CONSTRAINT `glpi_networkportethernets_netpoints_id`
FOREIGN KEY (`netpoints_id`) REFERENCES `glpi_netpoints` (`id`),
                                        ADD CONSTRAINT `glpi_networkportethernets_networkports_id`
FOREIGN KEY (`networkports_id`) REFERENCES `glpi_networkports` (`id`) ;


ALTER TABLE `glpi_networkportaggregates` ADD CONSTRAINT `glpi_networkportaggregates_networkports_id`
FOREIGN KEY (`networkports_id`) REFERENCES `glpi_networkports` (`id`) ;


ALTER TABLE `glpi_networkportaliases` ADD CONSTRAINT `glpi_networkportaliases_networkports_id`
FOREIGN KEY (`networkports_id`) REFERENCES `glpi_networkports` (`id`),
                                           ADD CONSTRAINT `glpi_networkportaliases_networkports_id_alias`
FOREIGN KEY (`networkports_id_alias`) REFERENCES `glpi_networkports` (`id`) ;


ALTER TABLE `glpi_networkportdialups` ADD CONSTRAINT `glpi_networkportdialups_networkports_id`
FOREIGN KEY (`networkports_id`) REFERENCES `glpi_networkports` (`id`) ;


ALTER TABLE `glpi_networkportlocals` ADD CONSTRAINT `glpi_networkportlocals_networkports_id`
FOREIGN KEY (`networkports_id`) REFERENCES `glpi_networkports` (`id`) ;


ALTER TABLE `glpi_networkports_vlans` ADD CONSTRAINT `glpi_networkports_vlans_networkports_id`
FOREIGN KEY (`networkports_id`) REFERENCES `glpi_networkports` (`id`),
                                           ADD CONSTRAINT `glpi_networkports_vlans_vlans_id`
FOREIGN KEY (`vlans_id`) REFERENCES `glpi_vlans` (`id`) ;


ALTER TABLE `glpi_networkports_networkports` ADD CONSTRAINT `glpi_networkports_networkports_networkports_id_1`
FOREIGN KEY (`networkports_id_1`) REFERENCES `glpi_networkports` (`id`),
                                             ADD CONSTRAINT `glpi_networkports_networkports_networkports_id_2`
FOREIGN KEY (`networkports_id_2`) REFERENCES `glpi_networkports` (`id`) ;


ALTER TABLE `glpi_networkportwifis` ADD CONSTRAINT `glpi_networkportwifis_networkports_id`
FOREIGN KEY (`networkports_id`) REFERENCES `glpi_networkports` (`id`),
                                           ADD CONSTRAINT `glpi_networkportwifis_networkportwifis_id`
FOREIGN KEY (`networkportwifis_id`) REFERENCES `glpi_networkportwifis` (`id`),
                                               ADD CONSTRAINT `glpi_networkportwifis_wifinetworks_id`
FOREIGN KEY (`wifinetworks_id`) REFERENCES `glpi_wifinetworks` (`id`) ;


ALTER TABLE `glpi_items_operatingsystems` ADD CONSTRAINT `glpi_items_operatingsystems_operatingsystems_id`
FOREIGN KEY (`operatingsystems_id`) REFERENCES `glpi_operatingsystems` (`id`),
                                               ADD CONSTRAINT `glpi_items_operatingsystems_operatingsystemservicepacks_id`
FOREIGN KEY (`operatingsystemservicepacks_id`) REFERENCES `glpi_operatingsystemservicepacks` (`id`),
                                                          ADD CONSTRAINT `glpi_items_operatingsystems_operatingsystemversions_id`
FOREIGN KEY (`operatingsystemversions_id`) REFERENCES `glpi_operatingsystemversions` (`id`) ;


ALTER TABLE `glpi_projectteams` ADD CONSTRAINT `glpi_projectteams_projects_id`
FOREIGN KEY (`projects_id`) REFERENCES `glpi_projects` (`id`) ;


ALTER TABLE `glpi_items_projects` ADD CONSTRAINT `glpi_items_projects_projects_id`
FOREIGN KEY (`projects_id`) REFERENCES `glpi_projects` (`id`) ;


ALTER TABLE `glpi_projecttasks_tickets` ADD CONSTRAINT `glpi_projecttasks_tickets_projecttasks_id`
FOREIGN KEY (`projecttasks_id`) REFERENCES `glpi_projecttasks` (`id`),
                                           ADD CONSTRAINT `glpi_projecttasks_tickets_tickets_id`
FOREIGN KEY (`tickets_id`) REFERENCES `glpi_tickets` (`id`) ;


ALTER TABLE `glpi_projecttaskteams` ADD CONSTRAINT `glpi_projecttaskteams_projecttasks_id`
FOREIGN KEY (`projecttasks_id`) REFERENCES `glpi_projecttasks` (`id`) ;


ALTER TABLE `glpi_items_problems` ADD CONSTRAINT `glpi_items_problems_problems_id`
FOREIGN KEY (`problems_id`) REFERENCES `glpi_problems` (`id`) ;


ALTER TABLE `glpi_problems_suppliers` ADD CONSTRAINT `glpi_problems_suppliers_problems_id`
FOREIGN KEY (`problems_id`) REFERENCES `glpi_problems` (`id`),
                                       ADD CONSTRAINT `glpi_problems_suppliers_suppliers_id`
FOREIGN KEY (`suppliers_id`) REFERENCES `glpi_suppliers` (`id`) ;


ALTER TABLE `glpi_problems_tickets` ADD CONSTRAINT `glpi_problems_tickets_problems_id`
FOREIGN KEY (`problems_id`) REFERENCES `glpi_problems` (`id`),
                                       ADD CONSTRAINT `glpi_problems_tickets_tickets_id`
FOREIGN KEY (`tickets_id`) REFERENCES `glpi_tickets` (`id`) ;


ALTER TABLE `glpi_problems_users` ADD CONSTRAINT `glpi_problems_users_problems_id`
FOREIGN KEY (`problems_id`) REFERENCES `glpi_problems` (`id`),
                                       ADD CONSTRAINT `glpi_problems_users_users_id`
FOREIGN KEY (`users_id`) REFERENCES `glpi_users` (`id`) ;


ALTER TABLE `glpi_problemtasks` ADD CONSTRAINT `glpi_problemtasks_problems_id`
FOREIGN KEY (`problems_id`) REFERENCES `glpi_problems` (`id`),
                                       ADD CONSTRAINT `glpi_problemtasks_taskcategories_id`
FOREIGN KEY (`taskcategories_id`) REFERENCES `glpi_taskcategories` (`id`),
                                             ADD CONSTRAINT `glpi_problemtasks_users_id`
FOREIGN KEY (`users_id`) REFERENCES `glpi_users` (`id`),
                                    ADD CONSTRAINT `glpi_problemtasks_users_id_tech`
FOREIGN KEY (`users_id_tech`) REFERENCES `glpi_users` (`id`) ;


ALTER TABLE `glpi_profilerights` ADD CONSTRAINT `glpi_profilerights_profiles_id`
FOREIGN KEY (`profiles_id`) REFERENCES `glpi_profiles` (`id`) ;


ALTER TABLE `glpi_reminders_users` ADD CONSTRAINT `glpi_reminders_users_reminders_id`
FOREIGN KEY (`reminders_id`) REFERENCES `glpi_reminders` (`id`),
                                        ADD CONSTRAINT `glpi_reminders_users_users_id`
FOREIGN KEY (`users_id`) REFERENCES `glpi_users` (`id`) ;


ALTER TABLE `glpi_ticketfollowups` ADD CONSTRAINT `glpi_ticketfollowups_requesttypes_id`
FOREIGN KEY (`requesttypes_id`) REFERENCES `glpi_requesttypes` (`id`),
                                           ADD CONSTRAINT `glpi_ticketfollowups_tickets_id`
FOREIGN KEY (`tickets_id`) REFERENCES `glpi_tickets` (`id`),
                                      ADD CONSTRAINT `glpi_ticketfollowups_users_id`
FOREIGN KEY (`users_id`) REFERENCES `glpi_users` (`id`) ;


ALTER TABLE `glpi_reservations` ADD CONSTRAINT `glpi_reservations_reservationitems_id`
FOREIGN KEY (`reservationitems_id`) REFERENCES `glpi_reservationitems` (`id`),
                                               ADD CONSTRAINT `glpi_reservations_users_id`
FOREIGN KEY (`users_id`) REFERENCES `glpi_users` (`id`) ;


ALTER TABLE `glpi_ruleactions` ADD CONSTRAINT `glpi_ruleactions_rules_id`
FOREIGN KEY (`rules_id`) REFERENCES `glpi_rules` (`id`) ;


ALTER TABLE `glpi_rulecriterias` ADD CONSTRAINT `glpi_rulecriterias_rules_id`
FOREIGN KEY (`rules_id`) REFERENCES `glpi_rules` (`id`) ;


ALTER TABLE `glpi_slalevelactions` ADD CONSTRAINT `glpi_slalevelactions_slalevels_id`
FOREIGN KEY (`slalevels_id`) REFERENCES `glpi_slalevels` (`id`) ;


ALTER TABLE `glpi_slalevelcriterias` ADD CONSTRAINT `glpi_slalevelcriterias_slalevels_id`
FOREIGN KEY (`slalevels_id`) REFERENCES `glpi_slalevels` (`id`) ;


ALTER TABLE `glpi_slalevels_tickets` ADD CONSTRAINT `glpi_slalevels_tickets_slalevels_id`
FOREIGN KEY (`slalevels_id`) REFERENCES `glpi_slalevels` (`id`),
                                        ADD CONSTRAINT `glpi_slalevels_tickets_tickets_id`
FOREIGN KEY (`tickets_id`) REFERENCES `glpi_tickets` (`id`) ;


ALTER TABLE `glpi_olalevelactions` ADD CONSTRAINT `glpi_olalevelactions_olalevels_id`
FOREIGN KEY (`olalevels_id`) REFERENCES `glpi_olalevels` (`id`) ;


ALTER TABLE `glpi_olalevelcriterias` ADD CONSTRAINT `glpi_olalevelcriterias_olalevels_id`
FOREIGN KEY (`olalevels_id`) REFERENCES `glpi_olalevels` (`id`) ;


ALTER TABLE `glpi_olalevels_tickets` ADD CONSTRAINT `glpi_olalevels_tickets_olalevels_id`
FOREIGN KEY (`olalevels_id`) REFERENCES `glpi_olalevels` (`id`) ;


ALTER TABLE `glpi_states` ADD CONSTRAINT `glpi_states_states_id`
FOREIGN KEY (`states_id`) REFERENCES `glpi_states` (`id`) ;


ALTER TABLE `glpi_suppliers_tickets` ADD CONSTRAINT `glpi_suppliers_tickets_suppliers_id`
FOREIGN KEY (`suppliers_id`) REFERENCES `glpi_suppliers` (`id`),
                                        ADD CONSTRAINT `glpi_suppliers_tickets_tickets_id`
FOREIGN KEY (`tickets_id`) REFERENCES `glpi_tickets` (`id`) ;


ALTER TABLE `glpi_tickettasks` ADD CONSTRAINT `glpi_tickettasks_taskcategories_id`
FOREIGN KEY (`taskcategories_id`) REFERENCES `glpi_taskcategories` (`id`),
                                             ADD CONSTRAINT `glpi_tickettasks_tickets_id`
FOREIGN KEY (`tickets_id`) REFERENCES `glpi_tickets` (`id`),
                                      ADD CONSTRAINT `glpi_tickettasks_users_id`
FOREIGN KEY (`users_id`) REFERENCES `glpi_users` (`id`),
                                    ADD CONSTRAINT `glpi_tickettasks_users_id_tech`
FOREIGN KEY (`users_id_tech`) REFERENCES `glpi_users` (`id`) ;


ALTER TABLE `glpi_tickettemplatehiddenfields` ADD CONSTRAINT `glpi_tickettemplatehiddenfields_tickettemplates_id`
FOREIGN KEY (`tickettemplates_id`) REFERENCES `glpi_tickettemplates` (`id`) ;


ALTER TABLE `glpi_tickettemplatepredefinedfields` ADD CONSTRAINT `glpi_tickettemplatepredefinedfields_tickettemplates_id`
FOREIGN KEY (`tickettemplates_id`) REFERENCES `glpi_tickettemplates` (`id`) ;


ALTER TABLE `glpi_tickettemplatemandatoryfields` ADD CONSTRAINT `glpi_tickettemplatemandatoryfields_tickettemplates_id`
FOREIGN KEY (`tickettemplates_id`) REFERENCES `glpi_tickettemplates` (`id`) ;


ALTER TABLE `glpi_ticketsatisfactions` ADD CONSTRAINT `glpi_ticketsatisfactions_tickets_id`
FOREIGN KEY (`tickets_id`) REFERENCES `glpi_tickets` (`id`) ;


ALTER TABLE `glpi_tickets_tickets` ADD CONSTRAINT `glpi_tickets_tickets_tickets_id_1`
FOREIGN KEY (`tickets_id_1`) REFERENCES `glpi_tickets` (`id`),
                                        ADD CONSTRAINT `glpi_tickets_tickets_tickets_id_2`
FOREIGN KEY (`tickets_id_2`) REFERENCES `glpi_tickets` (`id`) ;


ALTER TABLE `glpi_tickets_users` ADD CONSTRAINT `glpi_tickets_users_tickets_id`
FOREIGN KEY (`tickets_id`) REFERENCES `glpi_tickets` (`id`),
                                      ADD CONSTRAINT `glpi_tickets_users_users_id`
FOREIGN KEY (`users_id`) REFERENCES `glpi_users` (`id`) ;


ALTER TABLE `glpi_displaypreferences` ADD CONSTRAINT `glpi_displaypreferences_users_id`
FOREIGN KEY (`users_id`) REFERENCES `glpi_users` (`id`) ;


ALTER TABLE `glpi_notimportedemails` ADD CONSTRAINT `glpi_notimportedemails_users_id`
FOREIGN KEY (`users_id`) REFERENCES `glpi_users` (`id`) ;


ALTER TABLE `glpi_reminders` ADD CONSTRAINT `glpi_reminders_users_id`
FOREIGN KEY (`users_id`) REFERENCES `glpi_users` (`id`) ;


ALTER TABLE `glpi_useremails` ADD CONSTRAINT `glpi_useremails_users_id`
FOREIGN KEY (`users_id`) REFERENCES `glpi_users` (`id`) ;


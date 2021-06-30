INSERT INTO mass_balance.position_accuracy (pk, name, description) 
   VALUES (0, 'NotDefinedUnknown', 'Not defined or unknown');
INSERT INTO mass_balance.position_accuracy (pk, name, description) 
   VALUES (1, 'dGPS', 'measured by differential GPS, accuracy ~0.1m');
INSERT INTO mass_balance.position_accuracy (pk, name, description) 
   VALUES (2, 'GPS', 'measured by handheld GPS, accuracy ~3-5m');
INSERT INTO mass_balance.position_accuracy (pk, name, description) 
   VALUES (3, 'alternative method', 'measured using an alternative method (e.g. theodolite, triangulation)');
INSERT INTO mass_balance.position_accuracy (pk, name, description) 
   VALUES (4, 'estimated', 'estimated from previous measurements');
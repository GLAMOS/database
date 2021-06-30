INSERT INTO mass_balance.date_accuracy (pk, name, description) 
   VALUES (0, 'NotDefinedUnknown', 'Not defined or unknown');
INSERT INTO mass_balance.date_accuracy (pk, name, description) 
   VALUES (1, 'exactly known', 'start and end dates exactly known');
INSERT INTO mass_balance.date_accuracy (pk, name, description) 
   VALUES (2, 'start known, end estimated/unknown', 'start date exactly known and end date estimated/unknown');
INSERT INTO mass_balance.date_accuracy (pk, name, description) 
   VALUES (3, 'start estimated/unknown, end known', 'start date estimated/unknown and end date exactly known');
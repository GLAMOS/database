INSERT INTO mass_balance.value_type (pk, name, description,fk_mass_balance_type) 
   VALUES (0, 'NotDefinedUnknown', 'Not defined or unknown',0);
INSERT INTO mass_balance.value_type (pk, name, description,fk_mass_balance_type) 
   VALUES (1, 'b_w_meas', 'measured winter balance of period date_fmeas - date_smeas  [mm w.e.]',3);
INSERT INTO mass_balance.value_type (pk, name, description,fk_mass_balance_type) 
   VALUES (2, 'b_a_meas', 'measured annual balance of period date_fmeas - date1  [mm w.e.]',3);
INSERT INTO mass_balance.value_type (pk, name, description,fk_mass_balance_type) 
   VALUES (3, 'c_w_obs', 'total winter accumulation of period date0 - date_smeas  [mm w.e.]',1);   
INSERT INTO mass_balance.value_type (pk, name, description,fk_mass_balance_type) 
   VALUES (4, 'a_w_obs', 'total winter ablation of period date0 - date_smeas  [mm w.e.]',1);  
INSERT INTO mass_balance.value_type (pk, name, description,fk_mass_balance_type) 
   VALUES (5, 'c_a_obs', 'total annual accumulation of period date0 - date1  [mm w.e.]',1);  
INSERT INTO mass_balance.value_type (pk, name, description,fk_mass_balance_type) 
   VALUES (6, 'a_a_obs', 'total annual ablation of period date0 - date1  [mm w.e.]',1);
INSERT INTO mass_balance.value_type (pk, name, description,fk_mass_balance_type) 
   VALUES (7, 'b_w_fix', 'winter balance of fixed date period 1.Oct - 30.Apr  [mm w.e.]',2);
INSERT INTO mass_balance.value_type (pk, name, description,fk_mass_balance_type) 
   VALUES (8, 'b_a_fix', 'annual balance of fixed date period 1.Oct - 30.Sep  [mm w.e.]',2);
INSERT INTO mass_balance.value_type (pk, name, description,fk_mass_balance_type) 
   VALUES (9, 'c_w_fix', 'total winter accumulation of fixed date period 1.Oct - 30.Apr  [mm w.e.]',2);
INSERT INTO mass_balance.value_type (pk, name, description,fk_mass_balance_type) 
   VALUES (10, 'a_w_fix', 'total winter ablation of fixed date period 1.Oct - 30.Apr  [mm w.e.]',2);
INSERT INTO mass_balance.value_type (pk, name, description,fk_mass_balance_type) 
   VALUES (11, 'c_a_fix', 'total annual accumulation of fixed date period 1.Oct - 30.Sep  [mm w.e.]',2);
INSERT INTO mass_balance.value_type (pk, name, description,fk_mass_balance_type) 
   VALUES (12, 'a_a_fix', 'total annual ablation of fixed date period 1.Oct - 30.Sep  [mm w.e.]',2);
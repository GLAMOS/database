-- ------------------------- --
-- UPDATE DATA OF EKK-PORTAL --
-- ------------------------- --

/*
DAV = Davos | GSB = Grand St-Bernard | LUG = Lugano | SAE = Säntis | SIO = Sion
Replace 99999 with the corresponding values of meteoschweiz datasets.
*/

/* Mean annual air temperature (31) */
-- The update of this value is done by Andreas Linsbauer (UniZH) 
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES (5752, 'DAV', 31, 2022, 99999 ); -- Davos
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES (5753, 'GSB', 31, 2022, 99999 ); -- Col du Grand St-Bernard
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES (5754, 'LUG', 31, 2022, 99999 ); -- Lugano
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES (5755, 'SAE', 31, 2022, 99999 ); -- Säntis
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES (5756, 'SIO', 31, 2022, 99999 ); -- Sion

/* Total annual preciptation (32) */  
-- The update of this value is done by Andreas Linsbauer (UniZH)                                                          
INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5757, 'DAV', 32, 2022, 99999 ); -- Davos
INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5758, 'GSB', 32, 2022, 99999 ); -- Col du Grand St-Bernard
INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5759, 'LUG', 32, 2022, 99999 ); -- Lugano
INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5760, 'SAE', 32, 2022, 99999 ); -- Säntis
INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5761, 'SIO', 32, 2022, 99999 ); -- Sion

/* Mean annual air temperature anomalies (33) */  
-- The update of this value is done by Andreas Linsbauer (UniZH)                                              
INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5747, 'DAV', 33, 2022, 99999 ); -- Davos
INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5748, 'GSB', 33, 2022, 99999 ); -- Col du Grand St-Bernard
INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5749, 'LUG', 33, 2022, 99999 ); -- Lugano
INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5750, 'SAE', 33, 2022, 99999 ); -- Säntis
INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5751, 'SIO', 33, 2022, 99999 ); -- Sion

/* Total annual preciptation anomalies (34) */ 
-- The update of this value is done by Andreas Linsbauer (UniZH)                                                 
INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5742, 'DAV', 34, 2022, 99999 ); -- Davos
INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5743, 'GSB', 34, 2022, 99999 ); -- Col du Grand St-Bernard
INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5744, 'LUG', 34, 2022, 99999 ); -- Lugano
INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5745, 'SAE', 34, 2022, 99999 ); -- Säntis
INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5746, 'SIO', 34, 2022, 99999 ); -- Sion

/* Annual Length Change (110) */ 
-- The update of this value is done by Elias Hodel (VAW)                                                
INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5735, 'B45_4',  110, 2021, -20.4 ); -- Griessgletscher
INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5736, 'A10G_5', 110, 2021, -8.7 ); -- Silvretta
INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5737, 'C14_10', 110, 2021, -9.2 ); -- Basodino
INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5738, 'A50D_1', 110, 2021, -3.6 ); -- Pizol
INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5739, 'B90_2',  110, 2021, -40 ); -- Trient
INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5740, 'B36_26', 110, 2021, -51.6 ); -- Aletsch
INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5741, 'B43_3',  110, 2021, -14.5 ); -- Rhone

/* Cumulative Length Change (111) */  
-- no updated need, derived automatically from (110)

/* Annual Mass Balance (112) */
-- no change needed (we add the null values to adjust the size of the graphic)
INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5708, 'B45_4',  112, 2022, NULL ); -- Griessgletscher
INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5709, 'A10G_5', 112, 2022, NULL ); -- Silvretta
INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5710, 'C14_10', 112, 2022, NULL ); -- Basodino
INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5711, 'A50D_1', 112, 2022, NULL ); -- Pizol
INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5712, 'B90_2',  112, 2022, NULL ); -- Trient
INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5713, 'B36_26', 112, 2022, NULL ); -- Aletsch
INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5714, 'B43_3',  112, 2022, NULL ); -- Rhone

/* Annual Mass Balance (measured) (113) */ 
-- The update of this value is done by Elias Hodel (VAW)
INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5715, 'B45_4',  113, 2022, -3895 );  -- Griessgletscher
INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5716, 'A10G_5', 113, 2022, -3339 );  -- Silvretta
INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5717, 'C14_10', 113, 2022, -3512 );  -- Basodino
INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5718, 'A50D_1', 113, 2022, NULL );  -- Pizol
INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5719, 'B90_2',  113, 2022, NULL );  -- Trient
INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5720, 'B36_26', 113, 2022, -2810 );  -- Aletsch
INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5721, 'B43_3',  113, 2022, -2416 );  -- Rhone
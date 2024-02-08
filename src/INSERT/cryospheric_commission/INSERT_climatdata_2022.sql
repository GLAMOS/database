-- ------------------------- --
-- UPDATE DATA OF EKK-PORTAL --
-- ------------------------- --

/*
DAV = Davos | GSB = Grand St-Bernard | LUG = Lugano | SAE = Säntis | SIO = Sion
Replace 99999 with the corresponding values of meteoschweiz datasets.
*/

/* Mean annual air temperature (31) */
-- The update of this value is done by Andreas Linsbauer (UniZH) 
INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5752, 'DAV', 31, 2022, 5.3 ); -- Davos
INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5753, 'GSB', 31, 2022, 1.7 ); -- Col du Grand St-Bernard
INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5754, 'LUG', 31, 2022, 14.4 ); -- Lugano
INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5755, 'SAE', 31, 2022, 0.7 ); -- Säntis
INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5756, 'SIO', 31, 2022, 12.2 ); -- Sion

/* Total annual preciptation (32) */  
-- The update of this value is done by Andreas Linsbauer (UniZH)                                                          
INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5757, 'DAV', 32, 2022, 831.4 ); -- Davos
INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5758, 'GSB', 32, 2022, 1184.4 ); -- Col du Grand St-Bernard
INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5759, 'LUG', 32, 2022, 1096.4 ); -- Lugano
INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5760, 'SAE', 32, 2022, 2639.8 ); -- Säntis
INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5761, 'SIO', 32, 2022, 486.1 ); -- Sion

/* Mean annual air temperature anomalies (33) */  
-- The update of this value is done by Andreas Linsbauer (UniZH)                                              
INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5747, 'DAV', 33, 2022, 1.3 ); -- Davos
INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5748, 'GSB', 33, 2022, 1.8 ); -- Col du Grand St-Bernard
INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5749, 'LUG', 33, 2022, 1.4 ); -- Lugano
INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5750, 'SAE', 33, 2022, 1.4 ); -- Säntis
INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5751, 'SIO', 33, 2022, 1.5 ); -- Sion

/* Total annual preciptation anomalies (34) */ 
-- The update of this value is done by Andreas Linsbauer (UniZH)                                                 
INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5742, 'DAV', 34, 2022, 16.7 ); -- Davos
INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5743, 'GSB', 34, 2022, 46.8 ); -- Col du Grand St-Bernard
INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5744, 'LUG', 34, 2022, 29 ); -- Lugano
INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5745, 'SAE', 34, 2022, 2.3 ); -- Säntis
INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5746, 'SIO', 34, 2022, 18.7 ); -- Sion

/* Annual Length Change (110) */ 
-- The update of this value is done by Elias Hodel (VAW)                                                
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5735, 'B45_4',  110, 2022, -70.7 ); -- Griessgletscher
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5736, 'A10G_5', 110, 2022, -30.7 ); -- Silvretta
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5737, 'C14_10', 110, 2022, -30 ); -- Basodino
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5738, 'A50D_1', 110, 2022, -8 ); -- Pizol
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5739, 'B90_2',  110, 2022, -61 ); -- Trient
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5740, 'B36_26', 110, 2022, -17.1 ); -- Aletsch
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5741, 'B43_3',  110, 2022, -44.8 ); -- Rhone

/* Cumulative Length Change (111) */  
-- no updated need, derived automatically from (110)

/* Annual Mass Balance (112) */
-- no change needed (we add the null values to adjust the size of the graphic)
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5708, 'B45_4',  112, 2022, NULL ); -- Griessgletscher
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5709, 'A10G_5', 112, 2022, NULL ); -- Silvretta
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5710, 'C14_10', 112, 2022, NULL ); -- Basodino
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5711, 'A50D_1', 112, 2022, NULL ); -- Pizol
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5712, 'B90_2',  112, 2022, NULL ); -- Trient
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5713, 'B36_26', 112, 2022, NULL ); -- Aletsch
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5714, 'B43_3',  112, 2022, NULL ); -- Rhone

/* Annual Mass Balance (measured) (113) */ 
-- The update of this value is done by Elias Hodel (VAW)
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5715, 'B45_4',  113, 2022, -3895 );  -- Griessgletscher
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5716, 'A10G_5', 113, 2022, -3339 );  -- Silvretta
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5717, 'C14_10', 113, 2022, -3512 );  -- Basodino
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5718, 'A50D_1', 113, 2022, NULL );  -- Pizol
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5719, 'B90_2',  113, 2022, NULL );  -- Trient
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5720, 'B36_26', 113, 2022, -2810 );  -- Aletsch
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5721, 'B43_3',  113, 2022, -2416 );  -- Rhone
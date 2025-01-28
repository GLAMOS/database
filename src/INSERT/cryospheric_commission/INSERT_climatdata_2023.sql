-- ------------------------- --
-- UPDATE DATA OF EKK-PORTAL --
-- ------------------------- --

/*
DAV = Davos | GSB = Grand St-Bernard | LUG = Lugano | SAE = Säntis | SIO = Sion
Replace 99999 with the corresponding values of meteoschweiz datasets.
*/

/* Mean annual air temperature (31) Meteoswiss variable name: -- tre200y0 --*/ 
-- The update of this value is done by Andreas Linsbauer (UniZH) 
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5762, 'DAV', 31, 2023, 5.2  ); -- Davos
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5763, 'GSB', 31, 2023, 1.3  ); -- Col du Grand St-Bernard
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5764, 'LUG', 31, 2023, 14.2 ); -- Lugano
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5765, 'SAE', 31, 2023, 0.3  ); -- Säntis
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5766, 'SIO', 31, 2023, 11.8  ); -- Sion

/* Total annual preciptation (32) Meteoswiss variable name: -- rre150y0 --*/  
-- The update of this value is done by Andreas Linsbauer (UniZH)                                                          
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5767, 'DAV', 32, 2023, 1203.2 ); -- Davos
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5768, 'GSB', 32, 2023, 1458.8 ); -- Col du Grand St-Bernard
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5769, 'LUG', 32, 2023, 1461.8 ); -- Lugano
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5770, 'SAE', 32, 2023, 3947.3 ); -- Säntis
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5771, 'SIO', 32, 2023, 822.1 ); -- Sion

/* Mean annual air temperature anomalies (33) Meteoswiss variable name: -- tre200yv --*/  
-- The update of this value is done by Andreas Linsbauer (UniZH)                                              
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5772, 'DAV', 33, 2023, 1.2 ); -- Davos
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5773, 'GSB', 33, 2023, 1.4 ); -- Col du Grand St-Bernard
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5774, 'LUG', 33, 2023, 1.2 ); -- Lugano
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5775, 'SAE', 33, 2023, 1.0 ); -- Säntis
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5776, 'SIO', 33, 2023, 1.1 ); -- Sion

/* Total annual preciptation anomalies (34) */ 
-- -- use xls-file GLAMOS_EKK_update_precip_annomalies_calc-table.xlsx for calculation                                             
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5777, 'DAV', 34, 2023, -20.5 ); -- Davos
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5778, 'GSB', 34, 2023, 34.4 ); -- Col du Grand St-Bernard
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5779, 'LUG', 34, 2023, 5.4 ); -- Lugano
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5780, 'SAE', 34, 2023, -46.2 ); -- Säntis
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5781, 'SIO', 34, 2023, -37.5 ); -- Sion

/* Annual Length Change (110) */ 
-- The update of this value is done by Elias Hodel (VAW)                                                
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5782, 'B45_4',  110, 2023, -27 ); -- Griessgletscher
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5783, 'A10G_5', 110, 2023, -12 ); -- Silvretta
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5784, 'C14_10', 110, 2023, -15 ); -- Basodino
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5785, 'A50D_1', 110, 2023, -5 ); -- Pizol
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5786, 'B90_2',  110, 2023, -20 ); -- Trient
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5787, 'B36_26', 110, 2023, -36 ); -- Aletsch
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5788, 'B43_3',  110, 2023, -95 ); -- Rhone

/* Cumulative Length Change (111) */  
-- no updated need, derived automatically from (110)

/* Annual Mass Balance (112) */
-- no change needed (we add the null values to adjust the size of the graphic)
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5789, 'B45_4',  112, 2023, NULL ); -- Griessgletscher
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5722, 'A10G_5', 112, 2023, NULL ); -- Silvretta
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5723, 'C14_10', 112, 2023, NULL ); -- Basodino
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5724, 'A50D_1', 112, 2023, NULL ); -- Pizol
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5725, 'B90_2',  112, 2023, NULL ); -- Trient
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5726, 'B36_26', 112, 2023, NULL ); -- Aletsch
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5727, 'B43_3',  112, 2023, NULL ); -- Rhone

/* Annual Mass Balance (measured) (113) */ 
-- The update of this value is done by Elias Hodel (VAW)
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5728, 'B45_4',  113, 2023, -3086 );  -- Griessgletscher
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5729, 'A10G_5', 113, 2023, -2434 );  -- Silvretta
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5730, 'C14_10', 113, 2023, -2689 );  -- Basodino
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5731, 'A50D_1', 113, 2023, NULL );  -- Pizol
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5732, 'B90_2',  113, 2023, NULL );  -- Trient
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5733, 'B36_26', 113, 2023, -1962 );  -- Aletsch
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5734, 'B43_3',  113, 2023, -1974 );  -- Rhone
-- ------------------------- --
-- UPDATE DATA OF EKK-PORTAL --
-- ------------------------- --

/*
DAV = Davos | GSB = Grand St-Bernard | LUG = Lugano | SAE = Säntis | SIO = Sion
Replace 99999 with the corresponding values of meteoschweiz datasets.
*/

/* Mean annual air temperature (31) Meteoswiss variable name: -- tre200y0 --**/
-- The update of this value is done by Andreas Linsbauer (UniZH) 
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5797, 'DAV', 31, 2024, 11.600 ); -- Davos
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5798, 'GSB', 31, 2024, 6.460 ); -- Col du Grand St-Bernard
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5799, 'LUG', 31, 2024, 20.460 ); -- Lugano
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5800, 'SAE', 31, 2024, 5.640 ); -- Säntis
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5801, 'SIO', 31, 2024, 18.520 ); -- Sion

/* Total annual preciptation (32) Meteoswiss variable name: -- rre150y0 --*/  
-- The update of this value is done by Andreas Linsbauer (UniZH)                                                          
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5837, 'DAV', 32, 2024, 2.559 ); -- Davos
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5802, 'GSB', 32, 2024, 2.047 ); -- Col du Grand St-Bernard
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5803, 'LUG', 32, 2024, 2.084 ); -- Lugano
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5804, 'SAE', 32, 2024, 2.663 ); -- Säntis
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5805, 'SIO', 32, 2024, 2.058 ); -- Sion

/* Mean annual air temperature anomalies (33) Meteoswiss variable name: -- tre200yv --*/  
-- The update of this value is done by Andreas Linsbauer (UniZH)                                              
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5806, 'DAV', 33, 2024, 1269.000 ); -- Davos
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5807, 'GSB', 33, 2024, 2948.660 ); -- Col du Grand St-Bernard
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5808, 'LUG', 33, 2024, 1887.100 ); -- Lugano
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5809, 'SAE', 33, 2024, 3993.900 ); -- Säntis
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5810, 'SIO', 33, 2024,  787.500 ); -- Sion

/* Total annual preciptation anomalies (34) */ 
-- use xls-file GLAMOS_EKK_update_precip_annomalies_calc-table.xlsx for calculation                                               
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5811, 'DAV', 34, 2024, 26.804 ); -- Davos
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5812, 'GSB', 34, 2024, 32.146 ); -- Col du Grand St-Bernard
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5813, 'LUG', 34, 2024, 21.443 ); -- Lugano
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5814, 'SAE', 34, 2024, 48.091 ); -- Säntis
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5815, 'SIO', 34, 2024, 32.245 ); -- Sion

/* Annual Length Change (110) */ 
-- The update of this value is done by Elias Hodel (VAW)                                                
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('B45_4',  110, 2023, 99999 ); -- Griessgletscher
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('A10G_5', 110, 2023, 99999 ); -- Silvretta
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('C14_10', 110, 2023, 99999 ); -- Basodino
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('A50D_1', 110, 2023, 99999 ); -- Pizol
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('B90_2',  110, 2023, 99999 ); -- Trient
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('B36_26', 110, 2023, 99999 ); -- Aletsch
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('B43_3',  110, 2023, 99999 ); -- Rhone

/* Cumulative Length Change (111) */  
-- no updated need, derived automatically from (110)

/* Annual Mass Balance (112) */
-- no change needed (we add the null values to adjust the size of the graphic)
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5823, 'B45_4',  112, 2024, NULL ); -- Griessgletscher
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5824, 'A10G_5', 112, 2024, NULL ); -- Silvretta
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5825, 'C14_10', 112, 2024, NULL ); -- Basodino
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5826, 'A50D_1', 112, 2024, NULL ); -- Pizol
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5827, 'B90_2',  112, 2024, NULL ); -- Trient
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5828, 'B36_26', 112, 2024, NULL ); -- Aletsch
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5829, 'B43_3',  112, 2024, NULL ); -- Rhone

/* Annual Mass Balance (measured) (113) */ 
-- The update of this value is done by Elias Hodel (VAW)
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5830, 'B45_4',  113, 2024, -1251 );  -- Griessgletscher
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5831, 'A10G_5', 113, 2024, -1375 );  -- Silvretta
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5832, 'C14_10', 113, 2024, -643 );  -- Basodino
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5833, 'A50D_1', 113, 2024, NULL );  -- Pizol
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5834, 'B90_2',  113, 2024, NULL );  -- Trient
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5835, 'B36_26', 113, 2024, -1311 );  -- Aletsch
/* already added */ INSERT INTO cryospheric_commission.data2d (id, objid, objtyp, xval, yval) VALUES (5836, 'B43_3',  113, 2024, -547 );  -- Rhone
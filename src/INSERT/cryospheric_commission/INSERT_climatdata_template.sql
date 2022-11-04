-- ------------------------- --
-- UPDATE DATA OF EKK-PORTAL --
-- ------------------------- --

/*
DAV = Davos | GSB = Grand St-Bernard | LUG = Lugano | SAE = Säntis | SIO = Sion
Replace 99999 with the corresponding values of meteoschweiz datasets.
*/

/* Mean annual air temperature (31) */
-- The update of this value is done by Andreas Linsbauer (UniZH) 
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('DAV', 31, 2019, 99999 ); -- Davos
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('GSB', 31, 2019, 99999 ); -- Col du Grand St-Bernard
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('LUG', 31, 2019, 99999 ); -- Lugano
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('SAE', 31, 2019, 99999 ); -- Säntis
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('SIO', 31, 2019, 99999 ); -- Sion

/* Total annual preciptation (32) */  
-- The update of this value is done by Andreas Linsbauer (UniZH)                                                          
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('DAV', 32, 2019, 99999 ); -- Davos
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('GSB', 32, 2019, 99999 ); -- Col du Grand St-Bernard
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('LUG', 32, 2019, 99999 ); -- Lugano
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('SAE', 32, 2019, 99999 ); -- Säntis
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('SIO', 32, 2019, 99999 ); -- Sion

/* Mean annual air temperature anomalies (33) */  
-- The update of this value is done by Andreas Linsbauer (UniZH)                                              
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('DAV', 33, 2019, 99999 ); -- Davos
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('GSB', 33, 2019, 99999 ); -- Col du Grand St-Bernard
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('LUG', 33, 2019, 99999 ); -- Lugano
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('SAE', 33, 2019, 99999 ); -- Säntis
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('SIO', 33, 2019, 99999 ); -- Sion

/* Total annual preciptation anomalies (34) */ 
-- The update of this value is done by Andreas Linsbauer (UniZH)                                                 
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('DAV', 34, 2019, 99999 ); -- Davos
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('GSB', 34, 2019, 99999 ); -- Col du Grand St-Bernard
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('LUG', 34, 2019, 99999 ); -- Lugano
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('SAE', 34, 2019, 99999 ); -- Säntis
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('SIO', 34, 2019, 99999 ); -- Sion

/* Annual Length Change (110) */ 
-- The update of this value is done by Elias Hodel (VAW)                                                
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('B45_4',  110, 2019, 99999 ); -- Griessgletscher
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('A10G_5', 110, 2019, 99999 ); -- Silvretta
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('C14_10', 110, 2019, 99999 ); -- Basodino
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('A50D_1', 110, 2019, 99999 ); -- Pizol
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('B90_2',  110, 2019, 99999 ); -- Trient
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('B36_26', 110, 2019, 99999 ); -- Aletsch
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('B43_3',  110, 2019, 99999 ); -- Rhone

/* Cumulative Length Change (111) */  
-- no updated need, derived automatically from (110)

/* Annual Mass Balance (112) */
-- no change needed (we add the null values to adjust the size of the graphic)
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('B45_4',  112, 2019, NULL ); -- Griessgletscher
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('A10G_5', 112, 2019, NULL ); -- Silvretta
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('C14_10', 112, 2019, NULL ); -- Basodino
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('A50D_1', 112, 2019, NULL ); -- Pizol
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('B90_2',  112, 2019, NULL ); -- Trient
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('B36_26', 112, 2019, NULL ); -- Aletsch
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('B43_3',  112, 2019, NULL ); -- Rhone

/* Annual Mass Balance (measured) (113) */ 
-- The update of this value is done by Elias Hodel (VAW)
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('B45_4',  113, 2019, 99999 );  -- Griessgletscher
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('A10G_5', 113, 2019, 99999 );  -- Silvretta
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('C14_10', 113, 2019, 99999 );  -- Basodino
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('A50D_1', 113, 2019, 99999 );  -- Pizol
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('B90_2',  113, 2019, 99999 );  -- Trient
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('B36_26', 113, 2019, 99999 );  -- Aletsch
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('B43_3',  113, 2019, 99999 );  -- Rhone
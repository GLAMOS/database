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
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('DAV', 31, 2020, 99999 ); -- Davos
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('GSB', 31, 2020, 99999 ); -- Col du Grand St-Bernard
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('LUG', 31, 2020, 99999 ); -- Lugano
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('SAE', 31, 2020, 99999 ); -- Säntis
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('SIO', 31, 2020, 99999 ); -- Sion
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('DAV', 31, 2021, 99999 ); -- Davos
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('GSB', 31, 2021, 99999 ); -- Col du Grand St-Bernard
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('LUG', 31, 2021, 99999 ); -- Lugano
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('SAE', 31, 2021, 99999 ); -- Säntis
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('SIO', 31, 2021, 99999 ); -- Sion

/* Total annual preciptation (32) */  
-- The update of this value is done by Andreas Linsbauer (UniZH)                                                          
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('DAV', 32, 2019, 99999 ); -- Davos
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('GSB', 32, 2019, 99999 ); -- Col du Grand St-Bernard
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('LUG', 32, 2019, 99999 ); -- Lugano
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('SAE', 32, 2019, 99999 ); -- Säntis
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('SIO', 32, 2019, 99999 ); -- Sion
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('DAV', 32, 2020, 99999 ); -- Davos
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('GSB', 32, 2020, 99999 ); -- Col du Grand St-Bernard
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('LUG', 32, 2020, 99999 ); -- Lugano
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('SAE', 32, 2020, 99999 ); -- Säntis
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('SIO', 32, 2020, 99999 ); -- Sion
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('DAV', 32, 2021, 99999 ); -- Davos
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('GSB', 32, 2021, 99999 ); -- Col du Grand St-Bernard
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('LUG', 32, 2021, 99999 ); -- Lugano
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('SAE', 32, 2021, 99999 ); -- Säntis
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('SIO', 32, 2021, 99999 ); -- Sion

/* Mean annual air temperature anomalies (33) */  
-- The update of this value is done by Andreas Linsbauer (UniZH)                                              
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('DAV', 33, 2019, 99999 ); -- Davos
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('GSB', 33, 2019, 99999 ); -- Col du Grand St-Bernard
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('LUG', 33, 2019, 99999 ); -- Lugano
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('SAE', 33, 2019, 99999 ); -- Säntis
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('SIO', 33, 2019, 99999 ); -- Sion
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('DAV', 33, 2020, 99999 ); -- Davos
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('GSB', 33, 2020, 99999 ); -- Col du Grand St-Bernard
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('LUG', 33, 2020, 99999 ); -- Lugano
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('SAE', 33, 2020, 99999 ); -- Säntis
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('SIO', 33, 2020, 99999 ); -- Sion
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('DAV', 33, 2021, 99999 ); -- Davos
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('GSB', 33, 2021, 99999 ); -- Col du Grand St-Bernard
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('LUG', 33, 2021, 99999 ); -- Lugano
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('SAE', 33, 2021, 99999 ); -- Säntis
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('SIO', 33, 2021, 99999 ); -- Sion

/* Total annual preciptation anomalies (34) */ 
-- The update of this value is done by Andreas Linsbauer (UniZH)                                                 
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('DAV', 34, 2019, 99999 ); -- Davos
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('GSB', 34, 2019, 99999 ); -- Col du Grand St-Bernard
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('LUG', 34, 2019, 99999 ); -- Lugano
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('SAE', 34, 2019, 99999 ); -- Säntis
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('SIO', 34, 2019, 99999 ); -- Sion
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('DAV', 34, 2020, 99999 ); -- Davos
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('GSB', 34, 2020, 99999 ); -- Col du Grand St-Bernard
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('LUG', 34, 2020, 99999 ); -- Lugano
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('SAE', 34, 2020, 99999 ); -- Säntis
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('SIO', 34, 2020, 99999 ); -- Sion
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('DAV', 34, 2021, 99999 ); -- Davos
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('GSB', 34, 2021, 99999 ); -- Col du Grand St-Bernard
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('LUG', 34, 2021, 99999 ); -- Lugano
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('SAE', 34, 2021, 99999 ); -- Säntis
INSERT INTO cryospheric_commission.data2d (objid, objtyp, xval, yval) VALUES ('SIO', 34, 2021, 99999 ); -- Sion
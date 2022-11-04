-- ------------------------- --
-- UPDATE DATA OF EKK-PORTAL --
-- ------------------------- --

/*
DAV = Davos | GSB = Grand St-Bernard | LUG = Lugano | SAE = Säntis | SIO = Sion
Replace 99999 with the corresponding values of meteoschweiz datasets.
*/

/* Mean annual air temperature (31) */
-- The update of this value is done by Andreas Linsbauer (UniZH) 
INSERT INTO public.data2d (id, objid, objtyp, xval, yval) VALUES (07,'DAV', 31, 2019, 4.5 ); -- Davos
INSERT INTO public.data2d (id, objid, objtyp, xval, yval) VALUES (48,'GSB', 31, 2019, 0.5 ); -- Col du Grand St-Bernard
INSERT INTO public.data2d (id, objid, objtyp, xval, yval) VALUES (49,'LUG', 31, 2019, 13.9 ); -- Lugano
INSERT INTO public.data2d (id, objid, objtyp, xval, yval) VALUES (50,'SAE', 31, 2019, -0.1 ); -- Säntis
INSERT INTO public.data2d (id, objid, objtyp, xval, yval) VALUES (51,'SIO', 31, 2019, 11.5 ); -- Sion
INSERT INTO public.data2d (id, objid, objtyp, xval, yval) VALUES (52,'DAV', 31, 2020, 4.9 ); -- Davos
INSERT INTO public.data2d (id, objid, objtyp, xval, yval) VALUES (53,'GSB', 31, 2020, 1.0 ); -- Col du Grand St-Bernard
INSERT INTO public.data2d (id, objid, objtyp, xval, yval) VALUES (54,'LUG', 31, 2020, 13.7 ); -- Lugano
INSERT INTO public.data2d (id, objid, objtyp, xval, yval) VALUES (55,'SAE', 31, 2020, 0.3 ); -- Säntis
INSERT INTO public.data2d (id, objid, objtyp, xval, yval) VALUES (56,'SIO', 31, 2020, 11.5 ); -- Sion
INSERT INTO public.data2d (id, objid, objtyp, xval, yval) VALUES (57,'DAV', 31, 2021, 3.7 ); -- Davos
INSERT INTO public.data2d (id, objid, objtyp, xval, yval) VALUES (58,'GSB', 31, 2021, -0.1 ); -- Col du Grand St-Bernard
INSERT INTO public.data2d (id, objid, objtyp, xval, yval) VALUES (59,'LUG', 31, 2021, 13.1 ); -- Lugano
INSERT INTO public.data2d (id, objid, objtyp, xval, yval) VALUES (60,'SAE', 31, 2021, -0.9 ); -- Säntis
INSERT INTO public.data2d (id, objid, objtyp, xval, yval) VALUES (61,'SIO', 31, 2021, 10.3 ); -- Sion
INSERT INTO public.data2d (id, objid, objtyp, xval, yval) VALUES (62,'DAV', 32, 2019, 1314.1 ); -- Davos
INSERT INTO public.data2d (id, objid, objtyp, xval, yval) VALUES (63,'GSB', 32, 2019, 2582.8 ); -- Col du Grand St-Bernard
INSERT INTO public.data2d (id, objid, objtyp, xval, yval) VALUES (64,'LUG', 32, 2019, 1675.2 ); -- Lugano
INSERT INTO public.data2d (id, objid, objtyp, xval, yval) VALUES (65,'SAE', 32, 2019, 3549.9 ); -- Säntis
INSERT INTO public.data2d (id, objid, objtyp, xval, yval) VALUES (66,'SIO', 32, 2019, 607.5 ); -- Sion
INSERT INTO public.data2d (id, objid, objtyp, xval, yval) VALUES (67,'DAV', 32, 2020, 1031.9 ); -- Davos
INSERT INTO public.data2d (id, objid, objtyp, xval, yval) VALUES (68,'GSB', 32, 2020, 1280.9 ); -- Col du Grand St-Bernard
INSERT INTO public.data2d (id, objid, objtyp, xval, yval) VALUES (69,'LUG', 32, 2020, 1542.0 ); -- Lugano
INSERT INTO public.data2d (id, objid, objtyp, xval, yval) VALUES (70,'SAE', 32, 2020, 2837.4 ); -- Säntis
INSERT INTO public.data2d (id, objid, objtyp, xval, yval) VALUES (71,'SIO', 32, 2020, 545.0 ); -- Sion
INSERT INTO public.data2d (id, objid, objtyp, xval, yval) VALUES (72,'DAV', 32, 2021, 956.6 ); -- Davos
INSERT INTO public.data2d (id, objid, objtyp, xval, yval) VALUES (73,'GSB', 32, 2021, 1694.8 ); -- Col du Grand St-Bernard
INSERT INTO public.data2d (id, objid, objtyp, xval, yval) VALUES (74,'LUG', 32, 2021, 1443.6 ); -- Lugano
INSERT INTO public.data2d (id, objid, objtyp, xval, yval) VALUES (75,'SAE', 32, 2021, 3508.8 ); -- Säntis
INSERT INTO public.data2d (id, objid, objtyp, xval, yval) VALUES (76,'SIO', 32, 2021, 695.7 ); -- Sion
INSERT INTO public.data2d (id, objid, objtyp, xval, yval) VALUES (77,'DAV', 33, 2019, 1.7 ); -- Davos
INSERT INTO public.data2d (id, objid, objtyp, xval, yval) VALUES (78,'GSB', 33, 2019, 1.9 ); -- Col du Grand St-Bernard
INSERT INTO public.data2d (id, objid, objtyp, xval, yval) VALUES (79,'LUG', 33, 2019, 2.3 ); -- Lugano
INSERT INTO public.data2d (id, objid, objtyp, xval, yval) VALUES (80,'SAE', 33, 2019, 1.9 ); -- Säntis
INSERT INTO public.data2d (id, objid, objtyp, xval, yval) VALUES (81,'SIO', 33, 2019, 2.3 ); -- Sion
INSERT INTO public.data2d (id, objid, objtyp, xval, yval) VALUES (82,'DAV', 33, 2020, 2.1 ); -- Davos
INSERT INTO public.data2d (id, objid, objtyp, xval, yval) VALUES (83,'GSB', 33, 2020, 2.4 ); -- Col du Grand St-Bernard
INSERT INTO public.data2d (id, objid, objtyp, xval, yval) VALUES (84,'LUG', 33, 2020, 2.1 ); -- Lugano
INSERT INTO public.data2d (id, objid, objtyp, xval, yval) VALUES (85,'SAE', 33, 2020, 2.3 ); -- Säntis
INSERT INTO public.data2d (id, objid, objtyp, xval, yval) VALUES (86,'SIO', 33, 2020, 2.3 ); -- Sion
INSERT INTO public.data2d (id, objid, objtyp, xval, yval) VALUES (87,'DAV', 33, 2021, 0.9 ); -- Davos
INSERT INTO public.data2d (id, objid, objtyp, xval, yval) VALUES (88,'GSB', 33, 2021, 1.3 ); -- Col du Grand St-Bernard
INSERT INTO public.data2d (id, objid, objtyp, xval, yval) VALUES (89,'LUG', 33, 2021, 1.5 ); -- Lugano
INSERT INTO public.data2d (id, objid, objtyp, xval, yval) VALUES (90,'SAE', 33, 2021, 1.1 ); -- Säntis
INSERT INTO public.data2d (id, objid, objtyp, xval, yval) VALUES (91,'SIO', 33, 2021, 1.1 ); -- Sion
INSERT INTO public.data2d (id, objid, objtyp, xval, yval) VALUES (92,'DAV', 34, 2019, -31.6 ); -- Davos
INSERT INTO public.data2d (id, objid, objtyp, xval, yval) VALUES (93,'GSB', 34, 2019, -16.1 ); -- Col du Grand St-Bernard
INSERT INTO public.data2d (id, objid, objtyp, xval, yval) VALUES (94,'LUG', 34, 2019, -8.4 ); -- Lugano
INSERT INTO public.data2d (id, objid, objtyp, xval, yval) VALUES (95,'SAE', 34, 2019, -31.4 ); -- Säntis
INSERT INTO public.data2d (id, objid, objtyp, xval, yval) VALUES (96,'SIO', 34, 2019, -1.6 ); -- Sion
INSERT INTO public.data2d (id, objid, objtyp, xval, yval) VALUES (97,'DAV', 34, 2020, -3.3 ); -- Davos
INSERT INTO public.data2d (id, objid, objtyp, xval, yval) VALUES (98,'GSB', 34, 2020, 42.4 ); -- Col du Grand St-Bernard
INSERT INTO public.data2d (id, objid, objtyp, xval, yval) VALUES (99,'LUG', 34, 2020, 0.2 ); -- Lugano
INSERT INTO public.data2d (id, objid, objtyp, xval, yval) VALUES (00,'SAE', 34, 2020, -5.1 ); -- Säntis
INSERT INTO public.data2d (id, objid, objtyp, xval, yval) VALUES (01,'SIO', 34, 2020, 8.8 ); -- Sion
INSERT INTO public.data2d (id, objid, objtyp, xval, yval) VALUES (02,'DAV', 34, 2021, 4.2 ); -- Davos
INSERT INTO public.data2d (id, objid, objtyp, xval, yval) VALUES (03,'GSB', 34, 2021, 23.8 ); -- Col du Grand St-Bernard
INSERT INTO public.data2d (id, objid, objtyp, xval, yval) VALUES (04,'LUG', 34, 2021, 6.6 ); -- Lugano
INSERT INTO public.data2d (id, objid, objtyp, xval, yval) VALUES (05,'SAE', 34, 2021, -29.9 ); -- Säntis
INSERT INTO public.data2d (id, objid, objtyp, xval, yval) VALUES (06,'SIO', 34, 2021, -16.4 ); -- Sion
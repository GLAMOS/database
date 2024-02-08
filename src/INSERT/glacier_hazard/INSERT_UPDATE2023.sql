--event
INSERT INTO glacier_hazard.event(pk, fk_glacier, start_year, start_month, start_day, start_time, start_text, end_year, end_month, end_day, end_time, end_text, volume_m3, area_damaged_m2, dead_people, injured_people, description_de, description_en, secondary_source)VALUES('de102c83-177d-4e93-9054-e42370c58099','80e4bc9e-4ec8-11e8-a0f7-985fd331b2ee','2023','5','27','','','2023','5','27','','','','',NULL,NULL, 'kleines Kalbungsereignis zwischen den beiden Aufnahmen von 12:00 und 13:00 UTC der automatischen Kamera','Fotos Acam VAW','GLAMOS');
INSERT INTO glacier_hazard.event(pk, fk_glacier, start_year, start_month, start_day, start_time, start_text, end_year, end_month, end_day, end_time, end_text, volume_m3, area_damaged_m2, dead_people, injured_people, description_de, description_en, secondary_source)VALUES('ed2ac4dc-c715-43d5-83a4-038cc77543e7','81f430cf-4ec8-11e8-8fd6-985fd331b2ee','2023','6','17','13.45','','2023','6','17','','','','', NULL,NULL , 'Eisabbruch von unbekanntem Volumen an einem Haengegletscher ostseitig am Scerscen','https://www.blick.ch/life/natur/hobbyfotograf-filmt-spektakulaere-szene-grosses-stueck-von-tschiervagletscher-bricht-ab-id18680392.html','GLAMOS');
INSERT INTO glacier_hazard.event(pk, fk_glacier, start_year, start_month, start_day, start_time, start_text, end_year, end_month, end_day, end_time, end_text, volume_m3, area_damaged_m2, dead_people, injured_people, description_de, description_en, secondary_source)VALUES('bb4d563c-e88a-4b59-84d5-8b9e031dadc5','7f6f33a1-4ec8-11e8-88b8-985fd331b2ee','2023','7','17','','','2023','8','18','','','','', NULL,NULL , 'Zwischen 17 und 22 Juli Auslaufen durch den oberflaechlichen Kanal und Absinken des Seespiegels um 10m. Danach stabiliserte sich der Seespiegel und bis sich der See schliesslich vom 16. bis 28. August komplett subglazial entleerte.','Infos gemäss Seepegel und Webcam des Geopraevent Datenportals.','GLAMOS');
INSERT INTO glacier_hazard.event(pk, fk_glacier, start_year, start_month, start_day, start_time, start_text, end_year, end_month, end_day, end_time, end_text, volume_m3, area_damaged_m2, dead_people, injured_people, description_de, description_en, secondary_source)VALUES('f6a0118b-e933-407d-9f27-a607b1bab2b8','80644200-4ec8-11e8-aa15-985fd331b2ee','2023','8','14','','','2023','8','14','','','','', 2,NULL, 'Gemäss Mitteilung der Kantonspolizei Bern (siehe auch BZ 21.08.2023) ereignete sich oberhalb der Zustiegsroute zur Mittellegihütte ein Eisabbruch mit anschliessendem Lawinenniedergang.  Zwei vermisste österreichische Bergsteiger wurden Mitte September in einer Spalte tot aufgefunden und geborgen.','https://www.police.be.ch/de/start/themen/news/medienmitteilungen.html?newsID=b577d87a-a5bd-44ed-964e-5aa84488fae5, https://www.police.be.ch/de/start/themen/news/medienmitteilungen.html?newsID=1f8611f8-ec64-4fb4-8fc6-87b3bbe00cfb, https://www.police.be.ch/de/start/themen/news/medienmitteilungen.html?newsID=c0730b47-f046-4c8a-8d3c-854a9dff6741, https://www.berneroberlaender.ch/bei-mittellegihuette-ob-grindelwald-nach-eisabbruch-werden-zwei-personen-vermisst-232729547482','GLAMOS');

-- event2damage_type
INSERT INTO glacier_hazard.event2damage_type(fk_event, fk_damage_type) VALUES ('de102c83-177d-4e93-9054-e42370c58099',300);
INSERT INTO glacier_hazard.event2damage_type(fk_event, fk_damage_type) VALUES ('ed2ac4dc-c715-43d5-83a4-038cc77543e7',300);
INSERT INTO glacier_hazard.event2damage_type(fk_event, fk_damage_type) VALUES ('bb4d563c-e88a-4b59-84d5-8b9e031dadc5',300);
INSERT INTO glacier_hazard.event2damage_type(fk_event, fk_damage_type) VALUES ('f6a0118b-e933-407d-9f27-a607b1bab2b8',110);



-- event3hazard_type
INSERT INTO glacier_hazard.event2hazard_type(fk_event, fk_hazard_type) VALUES ('de102c83-177d-4e93-9054-e42370c58099',13);
INSERT INTO glacier_hazard.event2hazard_type(fk_event, fk_hazard_type) VALUES ('ed2ac4dc-c715-43d5-83a4-038cc77543e7',31);
INSERT INTO glacier_hazard.event2hazard_type(fk_event, fk_hazard_type) VALUES ('bb4d563c-e88a-4b59-84d5-8b9e031dadc5',22);
INSERT INTO glacier_hazard.event2hazard_type(fk_event, fk_hazard_type) VALUES ('f6a0118b-e933-407d-9f27-a607b1bab2b8',32);

-- event2geometries

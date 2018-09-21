/* ------------------------------------------ */
/*  GLAMOS, Yvo Weidmann                      */
/*  Created On : 21-September-2018 16:16:20   */
/*  DBMS       : PostgreSQL                   */
/* ------------------------------------------ */

CREATE OR REPLACE FUNCTION 
get_pk_hades (river_level_3 TEXT, river_level_2 INT, river_level_1 INT, river_level_0 TEXT)
RETURNS INT
AS $$
	BEGIN
		CASE
			WHEN river_level_3 = 'E' THEN
				RETURN 80;
			WHEN river_level_3 = 'C' THEN
				RETURN 60;
			WHEN river_level_3 = 'B' THEN
				RETURN 50;
			WHEN river_level_3 = 'A' and river_level_2 = 5 and river_level_1 >= 4 THEN
				RETURN 20;
			WHEN river_level_3 = 'A' and river_level_2 = 5 and river_level_1 = 1 THEN
				RETURN 30;
			WHEN river_level_3 = 'A' and river_level_2 = 5 and river_level_1 = 0 THEN
				RETURN 40;
			WHEN river_level_3 = 'A' and river_level_2 = 1 THEN
				RETURN 10;
			ELSE
				RETURN -10;
		END CASE;
	END;
$$ LANGUAGE plpgsql;
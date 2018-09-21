/* ------------------------------------------ */
/*  GLAMOS, Yvo Weidmann                      */
/*  Created On : 21-September-2018 16:16:20   */
/*  DBMS       : PostgreSQL                   */
/* ------------------------------------------ */

CREATE OR REPLACE FUNCTION 
get_pk_sgi (river_level_3 TEXT, river_level_2 INT, river_level_1 INT, river_level_0 TEXT, inventory_code INT)
RETURNS INT
AS $$
	BEGIN
		RETURN 
			get_pk_sgi (river_level_3, river_level_2, river_level_1, river_level_0) || lpad(inventory_code::text, 2, '0');
	END;
$$ LANGUAGE plpgsql;
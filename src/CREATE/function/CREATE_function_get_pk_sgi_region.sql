/* ------------------------------------------ */
/*  GLAMOS, Yvo Weidmann                      */
/*  Created On : 21-September-2018 16:16:20   */
/*  DBMS       : PostgreSQL                   */
/* ------------------------------------------ */

CREATE OR REPLACE FUNCTION 
get_pk_sgi_region (river_level_3 TEXT, river_level_2 INT, river_level_1 INT, river_level_0 TEXT)
RETURNS TEXT
AS $$
	BEGIN
		RETURN ((((upper(river_level_3::text) || btrim(to_char(river_level_2::double precision, '9'::text))) || btrim(to_char(river_level_1::double precision, '9'::text))) ||
		CASE
		    WHEN river_level_0 IS NOT NULL THEN river_level_0
		    ELSE ''::character varying
		END::text));
	END;
$$ LANGUAGE plpgsql;
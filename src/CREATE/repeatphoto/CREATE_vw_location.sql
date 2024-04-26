/* ------------------------------------ */
/*  GLAMOS, Elias Hodel         		*/
/*  Created On : 13-August-2024 16:16:20*/
/*  DBMS       : PostgreSQL 			*/
/* ------------------------------------ */

/* Drop View */
-- DROP VIEW repeatphoto.vw_location;

/* Create View */
CREATE VIEW repeatphoto.vw_location AS
	SELECT
		pk,
		name,
		x_lv95,
		y_lv95,
		z_ln02,
		st_setsrid(st_makepoint(x_lv95, y_lv95),2056) as geom,
		accuracy,
		programm, 
		remarks
	FROM repeatphoto.location;
	
GRANT SELECT ON base_data.vw_glacier TO glro;
GRANT SELECT ON base_data.vw_glacier TO glrw;
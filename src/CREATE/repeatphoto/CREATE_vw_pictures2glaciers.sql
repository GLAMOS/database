/* ------------------------------------ */
/*  GLAMOS, Elias Hodel         		*/
/*  Created On : 13-August-2024 16:16:20*/
/*  DBMS       : PostgreSQL 			*/
/* ------------------------------------ */

/* Drop View */
-- DROP VIEW repeatphoto.vw_picture2glacier;

/* Create View */
CREATE VIEW repeatphoto.vw_picture2glacier AS
	SELECT
		pk,
		name,
		st_makepoint(x_lv95 numeric(9,2),y_lv95 numeric(9,2)) as geom,
		x_lv95,
		y_lv95,
		z_ln02,
		accuracy,
		programm
	FROM repeatphoto.location;
	
GRANT SELECT ON base_data.vw_picture2glacier TO glro;
GRANT SELECT ON base_data.vw_picture2glacier TO glrw;
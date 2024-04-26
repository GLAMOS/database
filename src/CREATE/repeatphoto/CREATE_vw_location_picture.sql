/* ------------------------------------ */
/*  GLAMOS, Elias Hodel         		*/
/*  Created On : 13-August-2024 16:16:20*/
/*  DBMS       : PostgreSQL 			*/
/* ------------------------------------ */

/* Drop View */
-- DROP VIEW repeatphoto.vw_location_picture;

/* Create View */
CREATE VIEW repeatphoto.vw_location_picture AS
	SELECT
		pic.pk as pk_pic,
		loc.pk as pk_loc,
		pic.name as name_pic,
		loc.name as name_loc,
		pic.date_taken,
		pic.view_direction,
		st_setSRID(st_makepoint(loc.x_lv95,loc.y_lv95),2056) as geom,
		CONCAT (x_lv95 || ' ' || y_lv95 || ' ' || z_ln02) as coordinates,
		CONCAT('https://doi.glamos.ch/repeatphoto/pictures/' || filename)as url,
		pic.photographer,
		loc.programm
	FROM repeatphoto.location loc
		FULL JOIN repeatphoto.picture pic on pic.fk_location = loc.pk;
	
GRANT SELECT ON repeatphoto.vw_location_picture TO glro;
GRANT SELECT ON repeatphoto.vw_location_picture TO glrw;
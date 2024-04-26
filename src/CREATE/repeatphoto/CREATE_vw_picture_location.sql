/* ------------------------------------ */
/*  GLAMOS, Elias Hodel         		*/
/*  Created On : 13-August-2024 16:16:20*/
/*  DBMS       : PostgreSQL 			*/
/* ------------------------------------ */

/* Drop View */
--DROP VIEW repeatphoto.vw_picture_location;

/* Create View */
CREATE VIEW repeatphoto.vw_picture_location AS
	SELECT
		pic.pk as pk_pic,
		loc.pk as pk_loc,
		pic.name as name_pic,
		loc.name as name_loc,
		pic.date_taken,
		pic.view_direction,
		st_setSRID(st_makepoint(loc.x_lv95,loc.y_lv95),2056) as geom,
		CONCAT (x_lv95 || ' ' || y_lv95 || ' ' || z_ln02) as coordinates,
		CONCAT('/thumb/' || filename)as thumbnail,
		CONCAT('https://doi.glamos.ch/repeatphoto/picture/' || filename)as url,
		pic.photographer,
		loc.programm
	FROM repeatphoto.picture pic
		LEFT JOIN repeatphoto.vw_location loc on loc.pk = pic.fk_location;
	
GRANT ALL ON TABLE repeatphoto.vw_picture_location TO gladmin;
GRANT SELECT ON TABLE repeatphoto.vw_picture_location TO glrw;
GRANT SELECT ON TABLE repeatphoto.vw_picture_location TO glro;
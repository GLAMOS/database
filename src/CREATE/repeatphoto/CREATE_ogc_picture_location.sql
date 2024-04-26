/* ------------------------------------ */
/*  GLAMOS, Elias Hodel         		*/
/*  Created On : 13-August-2024 16:16:20*/
/*  DBMS       : PostgreSQL 			*/
/* ------------------------------------ */

/* Drop View */
--DROP VIEW repeatphoto.ogc_picture_location;

/* Create View */
CREATE VIEW repeatphoto.ogc_picture_location AS
	SELECT
		row_number() OVER() AS gid,
		loc.name as name_loc,
		count(pic.pk) as number_of_pictures,
		MIN(date_part('year', date_taken)) as first_picture,
		MAX(date_part('year', date_taken)) as last_picture,
		string_agg(to_char(pic.date_taken, 'YYYY'),', ') as year_of_pictures,
		string_agg(to_char(pic.date_taken, 'DD.MM.YYYY'),', ') as date_of_pictures,
		st_setSRID(st_makepoint(loc.x_lv95,loc.y_lv95),2056) as geom,
		CONCAT(x_lv95 || ' ' || y_lv95 || ' ' || z_ln02) as coordinates,
		pic.view_direction,
		string_agg((CONCAT('https://doi.glamos.ch/repeatphoto/picture/' || filename)),', ') as link_to_pictures
	FROM repeatphoto.location loc
		FULL JOIN repeatphoto.picture pic on pic.fk_location = loc.pk
	GROUP BY loc.pk, loc.name, loc.x_lv95, loc.y_lv95, z_ln02, pic.view_direction
	ORDER BY loc.name;
	
GRANT ALL ON TABLE repeatphoto.ogc_picture_location TO gladmin;
GRANT SELECT ON TABLE repeatphoto.ogc_picture_location TO glrw;
GRANT SELECT ON TABLE repeatphoto.ogc_picture_location TO glro;
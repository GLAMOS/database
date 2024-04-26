/* ------------------------------------ */
/*  GLAMOS, Elias Hodel         		*/
/*  Created On : 13-August-2024 16:16:20*/
/*  DBMS       : PostgreSQL 			*/
/* ------------------------------------ */

/* Drop View */
--DROP VIEW repeatphoto.gpx_picture_location;

/* Create View */
CREATE VIEW repeatphoto.gpx_picture_location AS
	SELECT
		row_number() OVER() AS gid,
		loc.name as name,
		loc.z_ln02 as elevation,
		CONCAT('View direction is: ', pic.view_direction, '°') as comment,
		CONCAT('Pictures have been taken on the following dates: ', string_agg(to_char(pic.date_taken, 'DD.MM.YYYY'),', ')) as description,
		'unknown' as source,
		'https://doi.glamos.ch/repeatphoto/index.html' as url,
		'GLAMOS Repeat Photography' as url_name,
		ST_Transform(st_setSRID(st_makepoint(loc.x_lv95,loc.y_lv95),2056),4326) as geom
	FROM repeatphoto.location loc
		FULL JOIN repeatphoto.picture pic on pic.fk_location = loc.pk
	GROUP BY loc.pk, loc.name, loc.x_lv95, loc.y_lv95, z_ln02, pic.view_direction;
	
GRANT ALL ON TABLE repeatphoto.gpx_picture_location TO gladmin;
GRANT SELECT ON TABLE repeatphoto.gpx_picture_location TO glrw;
GRANT SELECT ON TABLE repeatphoto.gpx_picture_location TO glro;
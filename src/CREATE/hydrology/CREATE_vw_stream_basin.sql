/* ------------------------------------------ */
/*  GLAMOS, Yvo Weidmann         		      */
/*  Created On : 21-September-2018 16:16:20   */
/*  DBMS       : PostgreSQL 		       	*/
/* ------------------------------------------ */

CREATE OR REPLACE VIEW hydrology.vw_stream_basin AS
	SELECT  
		sb.pk_hades       AS pk_hades,
		st_union(sb.geom) AS geom,
		sbt.name          AS river_basin_name
	FROM hydrology.stream_basin AS sb
	JOIN hydrology.stream_basin_type AS sbt ON 
		(sb.pk_hades = sbt.pk_hades)
	GROUP BY sb.pk_hades, sbt.name;

GRANT SELECT ON hydrology.vw_stream_basin TO glro;
GRANT SELECT ON hydrology.vw_stream_basin TO glrw;
/* ------------------------------------------ */
/*  GLAMOS, Yvo Weidmann         		      */
/*  Created On : 21-September-2018 16:16:20   */
/*  DBMS       : PostgreSQL 		       	*/
/* ------------------------------------------ */

CREATE OR REPLACE VIEW base_data.vw_glaciological_report_region AS
WITH report_region AS (
	SELECT 
		row_number() OVER()     AS gid,
		g.pk_sgi                AS pk_sgi,
		g.pk_vaw                AS pk_report,
		get_pk_hades(g.river_level_3, g.river_level_2, g.river_level_1, g.river_level_0) AS pk_hades,
		g.river_level_3       AS river_level_3,
		g.river_level_2       AS river_level_2,
		g.river_level_1       AS river_level_1,
		g.river_level_0       AS river_level_0,
		grs.geom                AS geom,
		g.name_full             AS name_full
	FROM base_data.glaciological_report_region AS grs
	LEFT JOIN base_data.vw_glacier AS g ON
		grs.fk_glacier = g.pk)
	SELECT 
			rr.gid,
			rr.pk_sgi,
			rr.pk_report,
			rr.pk_hades,
			rr.river_level_3,
			rr.river_level_2,
			rr.river_level_1,
			rr.river_level_0,
			rr.geom,
			rr.name_full,
			sbt.name AS river_basin_name
	FROM report_region AS rr
	LEFT JOIN hydrology.stream_basin_type AS sbt ON 
		(rr.pk_hades = sbt.pk_hades);

GRANT SELECT ON base_data.vw_glaciological_report_region TO glro;
GRANT SELECT ON base_data.vw_glaciological_report_region TO glrw;
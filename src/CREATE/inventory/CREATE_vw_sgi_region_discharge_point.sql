/* ------------------------------------------ */
/*  GLAMOS, Yvo Weidmann                      */
/*  Created On : 21-September-2018 16:16:20   */
/*  DBMS       : PostgreSQL                   */
/* ------------------------------------------ */

CREATE OR REPLACE VIEW inventory.vw_sgi_region_discharge_point AS
WITH sgi_region_discharge_point AS (
	SELECT
		row_number() OVER() AS gid, 
		pk                  AS pk,
		get_pk_hades(river_level_3, river_level_2, river_level_1, river_level_0) AS pk_hades,
		get_pk_sgi_region(river_level_3, river_level_2, river_level_1, river_level_0)  pk_sgi,
		river_level_3       AS river_level_3,
		river_level_2       AS river_level_2,
		river_level_1       AS river_level_1,
		river_level_0       AS river_level_0,
		gwlnr               AS gwlnr,
		measure             AS measure,
		geom                AS geom
	FROM inventory.sgi_region_discharge_point)
	SELECT 
			srdp.gid,
			srdp.pk_sgi,
			srdp.pk_hades,
			srdp.river_level_3,
			srdp.river_level_2,
			srdp.river_level_1,
			srdp.river_level_0,
			srdp.geom,
			sbt.name AS river_basin_name
	FROM sgi_region_discharge_point AS srdp
	LEFT JOIN hydrology.stream_basin_type AS sbt ON 
		(srdp.pk_hades = sbt.pk_hades);

GRANT SELECT ON inventory.vw_sgi_region_discharge_point TO glro;
GRANT SELECT ON inventory.vw_sgi_region_discharge_point TO glrw;
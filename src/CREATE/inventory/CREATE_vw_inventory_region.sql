/* ------------------------------------------ */
/*  GLAMOS, Yvo Weidmann                      */
/*  Created On : 21-September-2018 16:16:20   */
/*  DBMS       : PostgreSQL                   */
/* ------------------------------------------ */

CREATE OR REPLACE VIEW inventory.vw_inventory_region AS
WITH inventory_region AS (
	SELECT 
			row_number() OVER() AS gid, 
			sr.geom                AS geom,
			sr.river_level_3       AS river_level_3,
			sr.river_level_2       AS river_level_2,
			sr.river_level_1       AS river_level_1,
			sr.river_level_0       AS river_level_0,
			get_pk_sgi_region (sr.river_level_3, sr.river_level_2, sr.river_level_1, sr.river_level_0) AS pk_sgi_region,
			get_pk_hades (sr.river_level_3, sr.river_level_2, sr.river_level_1, sr.river_level_0) AS pk_hades
		FROM inventory.sgi_region AS sr)
	SELECT 
			gid,
			geom,
			river_level_3,
			river_level_2,
			river_level_1,
			river_level_0,
			pk_sgi_region,
			inventory_region.pk_hades,
			name AS river_basin_name
	FROM inventory_region
	LEFT JOIN hydrology.stream_basin_type AS sbt ON 
		(inventory_region.pk_hades = sbt.pk_hades);

GRANT SELECT ON inventory.vw_inventory_region TO glro;
GRANT SELECT ON inventory.vw_inventory_region TO glrw;
	
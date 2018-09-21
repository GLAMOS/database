/* ------------------------------------------ */
/*  GLAMOS, Yvo Weidmann                      */
/*  Created On : 21-September-2018 16:16:20   */
/*  DBMS       : PostgreSQL                   */
/* ------------------------------------------ */

CREATE OR REPLACE VIEW inventory.vw_inventory AS
	SELECT 
				row_number() OVER() AS gid,
				g.pk_sgi            AS pk_sgi,
				g.pk_wgms           AS pk_wgms,
				g.pk_glims          AS pk_glims,
				g.river_level_3     AS river_level_3,
				g.river_level_2     AS river_level_2,
				g.river_level_1     AS river_level_1,
				g.river_level_0     AS river_level_0,
				get_pk_hades (g.river_level_3, g.river_level_2, g.river_level_1, g.river_level_0) AS pk_hades,
				ig.geom             AS geom,
				g.name_full         AS name_full,
				ig.acquisition      AS year_acquisition,
				ig.release          AS sgi_release
	FROM inventory.inventory_geometry AS ig

	LEFT JOIN base_data.vw_glacier AS g ON 
			(ig.fk_glacier = g.pk);

GRANT SELECT ON inventory.vw_inventory TO glro;
GRANT SELECT ON inventory.vw_inventory TO glrw;
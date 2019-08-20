/* ------------------------------------------ */
/*  GLAMOS, Yvo Weidmann                      */
/*  Created On : 21-September-2018 16:16:20   */
/*  DBMS       : PostgreSQL                   */
/* ------------------------------------------ */

CREATE OR REPLACE VIEW base_data.vw_outline AS
	SELECT 
			row_number() OVER() AS gid, 
			g.pk_sgi            AS pk_sgi,
			g.pk_vaw			AS pk_vaw,
			g.pk_wgms           AS pk_wgms,
			g.pk_glims          AS pk_glims,
			g.river_level_3     AS river_level_3,
			g.river_level_2     AS river_level_2,
			g.river_level_1     AS river_level_1,
			g.river_level_0     AS river_level_0,
			get_pk_hades (g.river_level_3, g.river_level_2, g.river_level_1, g.river_level_0) AS pk_hades,
			o.geom              AS geom,
			o.measure_date      AS measure_date,
			g.name_full         AS name_full,
			oot.short_name      AS object_origin,
			pcm.short_name      AS position_capture_method,
			hcm.short_name      AS height_capture_method,
			ot.short_name       AS object_type
	FROM base_data.outline AS o

	LEFT JOIN base_data.vw_glacier AS g ON 
			(o.fk_glacier = g.pk)
	LEFT JOIN administration.object_origin_type AS oot ON 
			(o.fk_object_origin_type = oot.pk)
	LEFT JOIN administration.position_capture_method_type AS pcm ON 
			(o.fk_position_capture_method_type = pcm.pk)
	LEFT JOIN administration.height_capture_method_type AS hcm ON 
			(o.fk_height_capture_method_type = hcm.pk)
	LEFT JOIN base_data.object_type AS ot ON 
			(o.fk_object_type = ot.pk);

GRANT SELECT ON base_data.vw_outline TO glro;
GRANT SELECT ON base_data.vw_outline TO glrw;
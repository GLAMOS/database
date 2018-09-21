/* ------------------------------------------ */
/*  GLAMOS, Yvo Weidmann                      */
/*  Created On : 21-September-2018 16:16:20   */
/*  DBMS       : PostgreSQL                   */
/* ------------------------------------------ */

CREATE OR REPLACE VIEW volume_change.vw_volume_change_data AS
	SELECT
		row_number() OVER()            AS gid, 
		g.pk_sgi                       AS pk_sgi,
		g.pk_wgms                      AS pk_wgms,
		g.pk_glims                     AS pk_glims,
		g.river_level_3                AS river_level_3,
		g.river_level_2                AS river_level_2,
		g.river_level_1                AS river_level_1,
		g.river_level_0                AS river_level_0,
		get_pk_hades (g.river_level_3, g.river_level_2, g.river_level_1, g.river_level_0) AS pk_hades,
		date_from,
		date_to,
		area_from,
		area_to,
		vcat.short_name                AS analysis_method,
		hcmt_from.short_name           AS height_capture_method_from,
		hcmt_to.short_name             AS height_capture_method_to,
		elevation_maximum_from,
		elevation_minimum_from,
		elevation_maximum_to,
		elevation_minimum_to,
		volume_change,
		height_change_mean
	FROM
		volume_change.volume_change AS vc
	LEFT JOIN base_data.vw_glacier AS g ON 
			(vc.fk_glacier = g.pk)
	LEFT JOIN volume_change.volume_change_analysis_type AS vcat ON 
			(vc.fk_analysis_method = vcat.pk)
	LEFT JOIN administration.height_capture_method_type AS hcmt_from ON 
			(vc.fk_height_capture_method_from = hcmt_from.pk)
	LEFT JOIN administration.height_capture_method_type AS hcmt_to ON 
			(vc.fk_height_capture_method_to = hcmt_to.pk);
			
GRANT SELECT ON volume_change.vw_volume_change_data TO glro;
GRANT SELECT ON volume_change.vw_volume_change_data TO glrw;
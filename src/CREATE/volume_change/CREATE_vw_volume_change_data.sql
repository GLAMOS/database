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
		height_change_mean,
		g.pk                           AS pk_glacier,
		g.name_short                   AS glacier_short_name,
		g.name_full                    AS glacier_full_name,
		vc.fk_date_from_quality        AS date_from_quality_type,
		dqt_from.description           AS date_from_quality_description,
		vc.fk_date_to_quality          AS date_to_quality_type,
		dqt_to.description             AS date_to_quality_description,
		vc.fk_data_embargo_type        AS data_embargo_type,
		det.description                AS data_embargo_description
		
	FROM
		volume_change.volume_change AS vc
	LEFT JOIN base_data.vw_glacier AS g ON 
			(vc.fk_glacier = g.pk)
	LEFT JOIN volume_change.volume_change_analysis_type AS vcat ON 
			(vc.fk_analysis_method = vcat.pk)
	LEFT JOIN administration.height_capture_method_type AS hcmt_from ON 
			(vc.fk_height_capture_method_from = hcmt_from.pk)
	LEFT JOIN administration.height_capture_method_type AS hcmt_to ON 
			(vc.fk_height_capture_method_to = hcmt_to.pk)
	LEFT JOIN administration.date_quality_type AS dqt_from ON
			(vc.fk_date_from_quality = dqt_from.pk)
	LEFT JOIN administration.date_quality_type AS dqt_to ON
			(vc.fk_date_to_quality = dqt_to.pk)
	LEFT JOIN administration.data_embargo_type AS det ON
			(vc.fk_data_embargo_type = det.pk);
			
GRANT SELECT ON volume_change.vw_volume_change_data TO glro;
GRANT SELECT ON volume_change.vw_volume_change_data TO glrw;
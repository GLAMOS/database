CREATE OR REPLACE VIEW volume_change.vw_volume_change AS
	SELECT
		g.pk                             AS pk_glacier,	
		g.pk_vaw                         AS pk_vaw,
		g.pk_sgi                         AS pk_sgi,
		g.name_short                     AS glacier_short_name,
		g.name_full                      AS glacier_full_name,

		vc.fk_height_capture_method_from AS height_capture_method_from_type_key,
		hcmt_from.short_name             AS height_capture_method_from_type,
		vc.fk_height_capture_method_to   AS height_capture_method_to_type_key,
		hcmt_to.short_name               AS height_capture_method_to_type,
		vc.fk_analysis_method            AS analysis_method_type_key,
		vcat.short_name                  AS analysis_method_type,

		vc.date_from,
		vc.date_to,
		vc.area_from,
		vc.area_to,

		vc.elevation_maximum_from,
		vc.elevation_minimum_from,
		vc.elevation_maximum_to,
		vc.elevation_minimum_to,
		vc.height_change_mean,

		vc.volume_change,
		sum(volume_change) OVER (PARTITION BY g.pk ORDER BY date_to) AS volume_change_cumulative

	FROM volume_change.volume_change vc

	LEFT JOIN base_data.vw_glacier g ON 
		(g.pk = vc.fk_glacier)
	LEFT JOIN administration.height_capture_method_type AS hcmt_from ON 
		(hcmt_from.pk = vc.fk_height_capture_method_from)
	LEFT JOIN administration.height_capture_method_type AS hcmt_to ON 
		(hcmt_to.pk = vc.fk_height_capture_method_to)
	LEFT JOIN volume_change.volume_change_analysis_type AS vcat ON 
		(vcat.pk = vc.fk_analysis_method);
	
GRANT SELECT ON length_change.vw_length_change TO glro;
GRANT SELECT ON length_change.vw_length_change TO glrw;
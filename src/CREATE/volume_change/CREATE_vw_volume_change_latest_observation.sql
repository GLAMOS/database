CREATE OR REPLACE VIEW volume_change.vw_volume_change_latest_observation AS
	SELECT 
		vc.pk_glacier,	
		vc.pk_vaw,
		vc.pk_sgi,
		vc.glacier_short_name,
		vc.glacier_full_name,

		vc.height_capture_method_from_type_key,
		vc.height_capture_method_from_type,
		vc.height_capture_method_to_type_key,
		vc.height_capture_method_to_type,
		vc.analysis_method_type_key,
		vc.analysis_method_type,

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
		vc.volume_change_cumulative
	FROM volume_change.vw_volume_change_latest_observation_date AS vclod
	LEFT JOIN volume_change.vw_volume_change AS vc ON
		(vc.pk_glacier = vclod.pk_glacier AND vc.date_to = vclod.latest_observation_date);

ALTER TABLE volume_change.vw_volume_change_latest_observation
    OWNER TO gladmin;

GRANT ALL ON TABLE volume_change.vw_volume_change_latest_observation TO gladmin;
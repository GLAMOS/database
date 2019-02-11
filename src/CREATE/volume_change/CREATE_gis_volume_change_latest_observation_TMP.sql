CREATE OR REPLACE VIEW volume_change.gis_volume_change_latest_observation AS
	SELECT 
		row_number() OVER() AS gid,
		vc.pk_glacier,	
		vc.pk_vaw,
		g.river_level_3,
		g.river_level_2,
		g.river_level_1,
		g.river_level_0,
		g.inventory_code,			
		vc.pk_sgi,
		vc.glacier_short_name    AS name_short,
		vc.glacier_full_name     AS name_full,
		g.geom,

		vc.height_capture_method_from_type_key,
		vc.height_capture_method_from_type,
		vc.height_capture_method_to_type_key,
		vc.height_capture_method_to_type,
		vc.analysis_method_type_key,
		vc.analysis_method_type,
		
		vcfod.first_observation_date,
		extract(YEAR vcfod.first_observation_date) AS first_observation_year,
		vc.date_from,
		extract(YEAR vc.date_from) AS year_from,
		vc.date_to,
		extract(YEAR vc.date_to) AS year_to,
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
		(vc.pk_glacier = vclod.pk_glacier AND vc.date_to = vclod.latest_observation_date)
	LEFT JOIN base_data.vw_glacier AS g ON
		(g.pk = vclod.pk_glacier)
	LEFT JOIN volume_change.vw_volume_change_first_observation_date AS vcfod ON
		(vcfod.pk_glacier = vclod.pk_glacier);

ALTER TABLE volume_change.gis_volume_change_latest_observation
    OWNER TO gladmin;

GRANT ALL ON TABLE volume_change.gis_volume_change_latest_observation TO gladmin;
GRANT SELECT ON volume_change.gis_volume_change_latest_observation TO glro;
GRANT SELECT ON volume_change.gis_volume_change_latest_observation TO glrw;
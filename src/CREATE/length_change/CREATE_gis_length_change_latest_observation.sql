CREATE OR REPLACE VIEW length_change.gis_length_change_latest_observation AS
	SELECT 
		row_number() OVER() AS gid,
		lclod.pk_glacier,
		lclod.pk_vaw,
		g.river_level_3,
		g.river_level_2,
		g.river_level_1,
		g.river_level_0,
		g.inventory_code,		
		lclod.pk_sgi,
		g.name_short,
		g.name_full,
		g.geom,
		lclod.latest_observation_date,
		lclod.latest_observation_variation_quantitative,
		lclod.latest_observation_variation_quantitative_cumulative
	FROM length_change.vw_length_change_latest_observation AS lclod
	LEFT JOIN base_data.vw_glacier AS g ON
		(g.pk = lclod.pk_glacier);

ALTER TABLE length_change.gis_length_change_latest_observation
    OWNER TO gladmin;

GRANT SELECT ON length_change.gis_length_change_latest_observation TO glro;
GRANT SELECT ON length_change.gis_length_change_latest_observation TO glrw;

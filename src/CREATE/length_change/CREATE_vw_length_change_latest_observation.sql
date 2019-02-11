CREATE OR REPLACE VIEW length_change.vw_length_change_latest_observation AS
	SELECT 
		lc.pk_glacier,
		lc.pk_vaw,
		lc.pk_sgi,
		lcfod.first_observation_date,
		EXTRACT(YEAR FROM lcfod.first_observation_date) AS first_observation_year,
		lc.date_from,
		EXTRACT(YEAR FROM lc.date_from) AS year_from,
		lclod.latest_observation_date,
		EXTRACT(YEAR FROM lclod.latest_observation_date) AS latest_observation_year,
		lc.variation_quantitative            AS latest_observation_variation_quantitative,
		lc.variation_quantitative_cumulative AS latest_observation_variation_quantitative_cumulative
	FROM length_change.vw_length_change_latest_observation_date AS lclod
	LEFT JOIN length_change.vw_length_change AS lc ON
		(lc.pk_glacier = lclod.pk_glacier AND lc.date_to = lclod.latest_observation_date)
	LEFT JOIN length_change.vw_length_change_first_observation_date AS lcfod ON lcfod.pk_glacier = lclod.pk_glacier;

ALTER TABLE length_change.vw_length_change_latest_observation
    OWNER TO gladmin;

GRANT ALL ON TABLE length_change.vw_length_change_latest_observation TO gladmin;
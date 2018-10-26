CREATE OR REPLACE VIEW length_change.vw_length_change_latest_observation AS
	SELECT 
		lc.pk_glacier,
		lc.pk_vaw,
		lc.pk_sgi,
		lclod.latest_observation_date,
		lc.variation_quantitative            AS latest_observation_variation_quantitative,
		lc.variation_quantitative_cumulative AS latest_observation_variation_quantitative_cumulative
	FROM length_change.vw_length_change_latest_observation_date AS lclod
	LEFT JOIN length_change.vw_length_change AS lc ON
		(lc.pk_glacier = lclod.pk_glacier AND lc.date_to = lclod.latest_observation_date);

ALTER TABLE length_change.vw_length_change_latest_observation
    OWNER TO gladmin;

GRANT ALL ON TABLE length_change.vw_length_change_latest_observation TO gladmin;
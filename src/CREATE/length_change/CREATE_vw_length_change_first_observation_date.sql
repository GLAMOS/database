CREATE OR REPLACE VIEW length_change.vw_length_change_first_observation_date AS
	SELECT
		pk_glacier,
		MIN(date_from)              AS first_observation_date
	FROM length_change.vw_length_change
	GROUP BY (pk_glacier);

ALTER TABLE length_change.vw_length_change_first_observation_date
    OWNER TO gladmin;

GRANT ALL ON TABLE length_change.vw_length_change_first_observation_date TO gladmin;
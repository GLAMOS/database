CREATE OR REPLACE VIEW length_change.vw_length_change_latest_observation_date AS
	SELECT
		pk_glacier,
		pk_vaw,
		pk_sgi,
		MAX(date_to) AS latest_observation_date
		
	FROM length_change.vw_length_change
	GROUP BY (pk_glacier, pk_vaw, pk_sgi);

ALTER TABLE length_change.vw_length_change_latest_observation_date
    OWNER TO gladmin;

GRANT ALL ON TABLE length_change.vw_length_change_latest_observation_date TO gladmin;
CREATE OR REPLACE VIEW length_change.vw_length_change_observation_window AS
	SELECT
		pk_glacier,
		pk_vaw,
		pk_sgi,
		date_part('year'::text, MIN(date_from))   AS first_year,
		date_part('year'::text, MAX(date_to))     AS last_year
	FROM length_change.vw_length_change
	GROUP BY (pk_glacier, pk_vaw, pk_sgi);

ALTER TABLE length_change.vw_length_change_observation_window
    OWNER TO gladmin;

GRANT ALL ON TABLE length_change.vw_length_change_observation_window TO gladmin;
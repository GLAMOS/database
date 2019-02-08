CREATE OR REPLACE VIEW volume_change.vw_volume_change_first_observation_date AS
	SELECT
		pk_glacier,
		MIN(date_from)              AS first_observation_date
	FROM volume_change.vw_volume_change
	GROUP BY (pk_glacier);

ALTER TABLE volume_change.vw_volume_change_first_observation_date
    OWNER TO gladmin;

GRANT ALL ON TABLE volume_change.vw_volume_change_first_observation_date TO gladmin;
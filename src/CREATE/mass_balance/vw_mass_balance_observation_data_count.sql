CREATE OR REPLACE VIEW mass_balance.vw_mass_balance_observation_data_count AS
	SELECT
		mb.pk_glacier,
		mb.pk_vaw,
		mb.pk_sgi,
		COUNT(*) AS mass_balance_observation_data_count
	FROM mass_balance.vw_mass_balance AS mb 
	WHERE mb.mass_balance_type_key = 1
	GROUP BY (mb.pk_glacier, mb.pk_vaw, mb.pk_sgi);

ALTER TABLE mass_balance.vw_mass_balance_observation_data_count
    OWNER TO gladmin;

GRANT ALL ON TABLE mass_balance.vw_mass_balance_observation_data_count TO gladmin;
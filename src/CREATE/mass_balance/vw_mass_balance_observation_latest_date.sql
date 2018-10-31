CREATE OR REPLACE VIEW mass_balance.vw_mass_balance_observation_latest_date AS
	SELECT 
		mb.pk_glacier,
    	mb.pk_vaw,
    	mb.pk_sgi,
    	max(mb.date_to_annual) AS latest_observation_date
		FROM mass_balance.vw_mass_balance AS mb 
		WHERE mb.mass_balance_type_key = 1
	GROUP BY pk_glacier, pk_vaw, pk_sgi;

ALTER TABLE mass_balance.vw_mass_balance_observation_latest_date
    OWNER TO gladmin;

GRANT ALL ON TABLE mass_balance.vw_mass_balance_observation_latest_date TO gladmin;
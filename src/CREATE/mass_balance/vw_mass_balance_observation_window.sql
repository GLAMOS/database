CREATE OR REPLACE VIEW mass_balance.vw_mass_balance_observation_window AS
	SELECT
		mb.pk_glacier,
    	mb.pk_vaw,
		mb.pk_sgi,
		date_part('year'::text, min(mb.date_from_annual)) AS first_year_annual,
		date_part('year'::text, max(mb.date_to_annual)) AS last_year_annual,
		date_part('year'::text, min(mb.date_from_winter)) AS first_year_winter,
		date_part('year'::text, max(mb.date_to_winter)) AS last_year_winter
	FROM mass_balance.vw_mass_balance AS mb
	WHERE mb.mass_balance_type_key = 1
	GROUP BY mb.pk_glacier, mb.pk_vaw, mb.pk_sgi;

ALTER TABLE mass_balance.vw_mass_balance_observation_window
    OWNER TO gladmin;

GRANT ALL ON TABLE mass_balance.vw_mass_balance_observation_window TO gladmin;

CREATE OR REPLACE VIEW mass_balance.vw_mass_balance_observation_latest AS
	SELECT
		mboc.pk_glacier,
    	mboc.pk_vaw,
    	mboc.pk_sgi,
    	mblod.latest_observation_date,
    	mboc.mass_balance_annual            AS latest_mass_balance_annual,
		mboc.mass_balance_annual_cumulative AS latest_mass_balance_annual_cumulative,
    	mboc.mass_balance_winter            AS latest_mass_balance_winter,
		mboc.mass_balance_winter_cumulative AS latest_mass_balance_cumulative
	FROM mass_balance.vw_mass_balance_observation_latest_date AS mblod
	LEFT JOIN mass_balance.vw_mass_balance_observation_cumulative AS mboc ON 
		mboc.pk_glacier = mblod.pk_glacier AND mboc.date_to_annual = mblod.latest_observation_date;

ALTER TABLE mass_balance.vw_mass_balance_observation_latest
    OWNER TO gladmin;

GRANT ALL ON TABLE mass_balance.vw_mass_balance_observation_latest TO gladmin;

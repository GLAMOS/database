-- View: mass_balance.web_mass_balance_observation_glacier_json

-- DROP VIEW mass_balance.web_mass_balance_observation_glacier_json;

CREATE OR REPLACE VIEW mass_balance.web_mass_balance_observation_glacier_json AS
 SELECT data.pk_glacier, data.glacier_short_name, data.glacier_full_name, data.pk_sgi,
 json_agg(data.mass_balance_observation ) AS json
 FROM (
	SELECT mbo.pk_glacier, mbo.glacier_short_name, mbo.glacier_full_name, mbo.pk_sgi,
	jsonb_build_object('year_from', mbo.year_from, 'year_to', mbo.year_to, 'varition', mbo.annual_mass_balance, 'variation_cumulative', mbo.annual_mass_balance_cumulative) AS mass_balance_observation
	FROM mass_balance.web_mass_balance_observation mbo 
	ORDER BY mbo.year_from, mbo.year_to
 ) AS data
 GROUP BY data.pk_glacier, data.pk_sgi, data.glacier_full_name, data.glacier_short_name;

ALTER TABLE mass_balance.web_mass_balance_observation_glacier_json
    OWNER TO gladmin;

GRANT ALL ON TABLE mass_balance.web_mass_balance_observation_glacier_json TO gladmin;
GRANT SELECT ON TABLE mass_balance.web_mass_balance_observation_glacier_json TO glporo;

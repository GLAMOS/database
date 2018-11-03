CREATE OR REPLACE VIEW mass_balance.web_mass_balance_json AS
	SELECT
		JSONB_BUILD_OBJECT(
			'pk_glacier', mb.pk_glacier,
			'glacier_short_name', mb.glacier_short_name,
			'glacier_full_name', mb.glacier_full_name,
			'pk_sgi', mb.pk_sgi,
					
			'year_from', mb.year_from,
			'year_to', mb.year_to,

			'annual_mass_balance', mb.annual_mass_balance,
			'annual_mass_balance_cumulative', mb.annual_mass_balance_cumulative
		)
	FROM mass_balance.web_mass_balance AS mb;
	

ALTER TABLE mass_balance.web_mass_balance_json
    OWNER TO gladmin;

GRANT SELECT ON mass_balance.web_mass_balance_json TO glporo;
GRANT SELECT ON mass_balance.web_mass_balance_json TO glro;
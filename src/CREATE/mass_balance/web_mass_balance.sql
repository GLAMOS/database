CREATE OR REPLACE VIEW mass_balance.web_mass_balance AS
	SELECT
		mboc.pk_glacier                           AS pk_glacier,
		g.name_short                              AS glacier_short_name,
		g.name_full                               AS glacier_full_name,
		g.pk_sgi                                  AS pk_sgi,
		
		EXTRACT (YEAR FROM mboc.date_from_annual) AS year_from,
		EXTRACT (YEAR FROM mboc.date_to_annual)   AS year_to,

		mboc.mass_balance_annual                           AS annual_mass_balance,
		mboc.mass_balance_annual_cumulative                AS annual_mass_balance_cumulative
	FROM mass_balance.vw_mass_balance_observation_cumulative AS mboc
	LEFT JOIN base_data.vw_glacier AS g ON (mboc.pk_glacier = g.pk);

GRANT SELECT ON mass_balance.web_mass_balance TO glporo;
GRANT SELECT ON mass_balance.web_mass_balance TO glro;
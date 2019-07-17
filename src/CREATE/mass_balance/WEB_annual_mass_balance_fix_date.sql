CREATE OR REPLACE VIEW mass_balance.web_mass_balance_fix_date AS
	SELECT
		mbfd.pk_glacier                           AS pk_glacier,
		g.name_short                              AS glacier_short_name,
		g.name_full                               AS glacier_full_name,
		g.pk_sgi                                  AS pk_sgi,
		
		EXTRACT (YEAR FROM mbfd.date_from_annual) AS year_from,
		EXTRACT (YEAR FROM mbfd.date_to_annual)   AS year_to,

		mbfd.mass_balance_annual                           AS annual_mass_balance,
		mbfd.mass_balance_annual_cumulative                AS annual_mass_balance_cumulative
	
	FROM mass_balance.vw_mass_balance_fix_date_cumulative AS mbfd
	LEFT JOIN base_data.vw_glacier AS g ON (mbfd.pk_glacier = g.pk);

GRANT SELECT ON mass_balance.web_mass_balance TO glporo;
GRANT SELECT ON mass_balance.web_mass_balance TO glro;
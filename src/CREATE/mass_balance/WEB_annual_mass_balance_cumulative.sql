CREATE OR REPLACE VIEW mass_balance.web_mass_balance_annual_cumulative AS

SELECT
	fk_glacier,
	glacier_short_name,
	name,
	EXTRACT (YEAR FROM date_annual_to) xval,
	sum(annual_mass_balance) OVER (PARTITION BY fk_glacier ORDER BY date_annual_to) AS yval
FROM mass_balance.vw_mass_balance_annual WHERE fk_mass_balance_glacier_type = 1 ORDER BY fk_glacier ASC, xval ASC;
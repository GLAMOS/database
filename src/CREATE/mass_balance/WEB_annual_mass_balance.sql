CREATE OR REPLACE VIEW mass_balance.web_mass_balance_annual AS

SELECT
	fk_glacier,
	glacier_short_name,
	name,
	EXTRACT (YEAR FROM date_annual_to) xval,
	annual_mass_balance yval

FROM mass_balance.vw_mass_balance_annual WHERE fk_mass_balance_glacier_type = 1 ORDER BY xval ASC;
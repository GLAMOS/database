CREATE OR REPLACE VIEW mass_balance.web_mass_balance_annual AS

SELECT
	fk_glacier,
	glacier_short_name,
	name,
	EXTRACT (YEAR FROM date_annual_to) xval,
	annual_mass_balance yval

FROM mass_balance.vw_mass_balance_annual WHERE fk_mass_balance_glacier_type = 1 ORDER BY xval ASC;

GRANT SELECT ON mass_balance.web_mass_balance_annual TO glro;
GRANT SELECT ON mass_balance.web_mass_balance_annual TO glrw;









CREATE OR REPLACE VIEW mass_balance.web_mass_balance_annual AS

SELECT
	lcd.pk_glacier                             AS pk_glacier,
	g.name_short                               AS glacier_short_name,
	g.name_full                                AS glacier_full_name,
	lcd.pk_sgi                                 AS pk_sgi,
	EXTRACT (YEAR FROM lcd.measure_date_start) AS year_from,
	EXTRACT (YEAR FROM lcd.measure_date_end)   AS year_to,
	lcd.length_change                           AS varition,
	lcd.length_change_cumulative                AS variation_cumulative
FROM length_change.vw_length_change_data AS lcd 
LEFT JOIN base_data.vw_glacier AS g ON (lcd.pk_glacier = g.pk)
ORDER BY lcd.pk_glacier ASC, lcd.measure_date_start ASC;

GRANT SELECT ON mass_balance.web_mass_balance_annual TO glporo;
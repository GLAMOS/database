CREATE OR REPLACE VIEW length_change.web_length_change AS

SELECT
	lcd.pk_glacier                              AS pk_glacier,
	g.name_short                                AS glacier_short_name,
	g.name_full                                 AS glacier_full_name,
	lcd.pk_sgi                                  AS pk_sgi,
	EXTRACT (YEAR FROM lcd.measure_date_start)  AS year_from,
	EXTRACT (YEAR FROM lcd.measure_date_end)    AS year_to,
	lcd.length_change                           AS varition,
	lcd.length_change_cumulative                AS variation_cumulative
FROM length_change.vw_length_change_data AS lcd 
LEFT JOIN base_data.vw_glacier AS g ON (lcd.pk_glacier = g.pk)
ORDER BY lcd.pk_glacier ASC, lcd.measure_date_start ASC;

GRANT SELECT ON length_change.web_length_change TO glporo;
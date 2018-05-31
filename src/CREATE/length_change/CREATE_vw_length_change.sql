CREATE OR REPLACE VIEW length_change.vw_length_change AS
	SELECT
	 lcd.fk_glacier,
	 g.name_short glacier_short_name,
	 g.name_full glacier_full_name,
	 g.pk_vaw,
	 g.pk_sgi,
	 lcd.date_from,
	 lcd.date_to,
	 lcd.variation_quantitative,
	 sum(variation_quantitative) OVER (PARTITION BY fk_glacier ORDER BY date_to) AS variation_quantitative_cumulative
	FROM
	 length_change.length_change_data lcd
	INNER JOIN base_data.vw_glacier g ON g.pk_vaw = lcd.fk_glacier;

GRANT SELECT ON length_change.vw_length_change TO glro;
GRANT SELECT ON length_change.vw_length_change TO glrw;
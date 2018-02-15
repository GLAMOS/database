CREATE OR REPLACE VIEW length_change.vw_length_change AS
	SELECT
	 lcd.fk_glacier,
	 g.short_name glacier_short_name,
	 g.full_name glacier_full_name,
	 g.pk_vaw,
	 g.sgi_code,
	 lcd.date_from,
	 lcd.date_to,
	 lcd.variation_quantitative,
	 sum(variation_quantitative) OVER (PARTITION BY fk_glacier ORDER BY date_to) AS variation_quantitative_cumulative
	FROM
	 length_change.length_change_data lcd
	INNER JOIN base_data.vw_glacier_identification g ON g.pk_vaw = lcd.fk_glacier;

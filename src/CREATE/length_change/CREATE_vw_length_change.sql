CREATE OR REPLACE VIEW length_change.vw_length_change AS
	SELECT
		g.pk                        AS pk_glacier,	
		g.pk_vaw                    AS pk_vaw,
		g.pk_sgi                    AS pk_sgi,
		g.name_short                AS glacier_short_name,
		g.name_full                 AS glacier_full_name,
		lcd.date_from,
		lcd.date_to,
		lcd.variation_quantitative,
		sum(variation_quantitative) OVER (PARTITION BY fk_glacier ORDER BY date_to) AS variation_quantitative_cumulative
	FROM
		length_change.length_change_data lcd
	LEFT JOIN base_data.vw_glacier g ON 
		(g.pk_vaw = lcd.fk_glacier);

GRANT SELECT ON length_change.vw_length_change TO glro;
GRANT SELECT ON length_change.vw_length_change TO glrw;
CREATE OR REPLACE VIEW length_change.vw_length_change_summary AS
	SELECT
		lc.pk_glacier                         AS pk_glacier,
		lc.pk_vaw                             AS pk_vaw,
		lc.pk_sgi                             AS pk_sgi,
		lc.glacier_short_name,
		lc.glacier_full_name,
		date_part('year'::text, lc.date_from) AS year_from,
		date_part('year'::text, lc.date_to)   AS year_to,
		lc.variation_quantitative             AS variation,
		lc.variation_quantitative_cumulative  AS variation_cumulative
	FROM length_change.vw_length_change       AS lc
	LEFT JOIN base_data.vw_glacier            AS g ON
		(lc.pk_vaw = g.pk_vaw)
	ORDER BY lc.pk_glacier, (date_part('year'::text, lc.date_from));

ALTER TABLE length_change.vw_length_change_summary
    OWNER TO gladmin;

GRANT ALL ON TABLE length_change.vw_length_change_summary TO gladmin;
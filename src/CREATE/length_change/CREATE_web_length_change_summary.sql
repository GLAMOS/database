CREATE OR REPLACE VIEW length_change.web_length_change_summary AS

SELECT
	fk_glacier,
	glacier_short_name,
	glacier_full_name,
	sgi_code,
	EXTRACT (YEAR FROM date_from) year_from,
	EXTRACT (YEAR FROM date_to) year_to,
	variation_quantitative AS variation,
	variation_quantitative_cumulative AS variation_cumulative
FROM length_change.vw_length_change ORDER BY fk_glacier ASC, year_from ASC;
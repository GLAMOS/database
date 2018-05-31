CREATE OR REPLACE VIEW length_change.web_length_change AS

SELECT
	fk_glacier,
	glacier_short_name,
	glacier_full_name,
	EXTRACT (YEAR FROM date_to) xval,
	variation_quantitative AS yval,
	variation_quantitative_cumulative AS yval_cumulative
FROM length_change.vw_length_change ORDER BY fk_glacier ASC, xval ASC;

GRANT SELECT ON length_change.web_length_change TO glporo;
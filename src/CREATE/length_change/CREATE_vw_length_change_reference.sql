CREATE OR REPLACE VIEW length_change.vw_length_change_reference AS

	SELECT
		fk_glacier,
		date_from,
		date_to,
		variation_quantitative
	FROM
		length_change.length_change_data
	WHERE 
		date_from = '1850-09-01' AND fk_data_embargo_type = 11;
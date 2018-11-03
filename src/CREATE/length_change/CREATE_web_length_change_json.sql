CREATE OR REPLACE VIEW length_change.web_length_change_json AS

SELECT
	JSONB_BUILD_OBJECT (
		'pk_glacier',           wlc.pk_glacier, 
	 	'glacier_short_name',   wlc.glacier_short_name,
		'glacier_full_name',    wlc.glacier_full_name,
		'pk_sgi',               wlc.pk_sgi,
		'year_from',            wlc.year_from,
		'year_to',              wlc.year_to,
		'varition',             wlc.varition,
		'variation_cumulative', wlc.variation_cumulative
 	) AS json_build_object
	
FROM length_change.web_length_change AS wlc;

GRANT SELECT ON length_change.web_length_change_json TO glporo;
GRANT SELECT ON TABLE base_data.web_glacier_base_data_json TO glro;
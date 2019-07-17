-- View: length_change.web_length_change_glacier_json

-- DROP VIEW length_change.web_length_change_glacier_json;

CREATE OR REPLACE VIEW length_change.web_length_change_glacier_json AS
 SELECT data.pk_glacier, data.glacier_short_name, data.glacier_full_name, data.pk_sgi,
 json_agg(data.length_change ) AS json
 FROM (
	SELECT wlc.pk_glacier, wlc.glacier_short_name, wlc.glacier_full_name, wlc.pk_sgi,
	jsonb_build_object('year_from', wlc.year_from, 'year_to', wlc.year_to, 'varition', wlc.varition, 'variation_cumulative', wlc.variation_cumulative) AS length_change
	FROM length_change.web_length_change wlc
	ORDER BY wlc.year_from, wlc.year_to
 ) AS data
 GROUP BY data.pk_glacier, data.pk_sgi, data.glacier_full_name, data.glacier_short_name;

ALTER TABLE length_change.web_length_change_glacier_json
    OWNER TO gladmin;

GRANT ALL ON TABLE length_change.web_length_change_glacier_json TO gladmin;
GRANT SELECT ON TABLE length_change.web_length_change_glacier_json TO glporo;

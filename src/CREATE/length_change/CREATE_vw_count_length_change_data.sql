CREATE OR REPLACE VIEW length_change.vw_count_length_change_data AS
	SELECT
		pk_glacier,
		pk_vaw,
		pk_sgi,
		COUNT(*) AS count_length_change_data
	FROM length_change.vw_length_change
	GROUP BY (pk_glacier, pk_vaw, pk_sgi);

ALTER TABLE length_change.vw_count_length_change_data
    OWNER TO gladmin;

GRANT ALL ON TABLE length_change.vw_count_length_change_data TO gladmin;
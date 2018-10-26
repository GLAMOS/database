CREATE OR REPLACE VIEW length_change.vw_has_length_change_data AS
	SELECT
		g.pk                   AS pk_glacier,
		g.pk_vaw               AS pk_vaw,
		g.pk_sgi               AS pk_sgi,
		clcd.count_length_change_data,
		CASE
			WHEN clcd.count_length_change_data > 0 
				THEN 1
				ELSE 0
		END AS has_length
		
	FROM base_data.vw_glacier    AS g
	LEFT JOIN length_change.vw_count_length_change_data clcd ON
		(g.pk = clcd.pk_glacier);

ALTER TABLE length_change.vw_has_length_change_data
    OWNER TO gladmin;

GRANT ALL ON TABLE length_change.vw_has_length_change_data TO gladmin;
CREATE OR REPLACE VIEW volume_change.vw_has_volume_change_data AS
	
	SELECT g.pk AS pk_glacier,
		g.pk_vaw,
		g.pk_sgi,
		clcd.count_volume_change_data,
			CASE
				WHEN clcd.count_volume_change_data > 0 THEN 1
				ELSE 0
			END AS has_volume
			
	FROM base_data.vw_glacier g
	
		LEFT JOIN volume_change.vw_count_volume_change_data clcd ON g.pk = clcd.pk_glacier;

ALTER TABLE volume_change.vw_has_volume_change_data
    OWNER TO gladmin;

GRANT ALL ON TABLE volume_change.vw_has_volume_change_data TO gladmin;

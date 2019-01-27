CREATE OR REPLACE VIEW base_data.web_glacier_picture AS
	SELECT
		g.pk AS pk_glacier,
		g.pk_sgi,
		g.name_full AS glacier_full_name,
		g.name_short AS glacier_short_name,
		gp.picture_name,
		g.name_full || ' (' || gp.picture_date || ', ' || gp.photograph || ')' AS legend,
		CASE
			WHEN gp.fk_glacier_picture_type = 1 THEN true
			ELSE false
		END AS is_factsheet_picture
	FROM
		base_data.vw_glacier_picture AS gp
	LEFT JOIN
		base_data.vw_glacier AS g
	ON gp.pk_glacier = g.pk;
	
ALTER TABLE base_data.web_glacier_picture
    OWNER TO gladmin;

GRANT SELECT ON TABLE base_data.web_glacier_picture TO glporo;
GRANT SELECT ON TABLE base_data.web_glacier_picture TO glro;
CREATE OR REPLACE VIEW base_data.web_glacier_description AS
	SELECT
		gd.pk,
		g.pk_sgi,
		g.name_short,
		g.name_full,
		g.geom,
		gd.fk_language_type,
		gdt.description AS description_type,
		gd.description
	FROM
		base_data.glacier_description AS gd
	LEFT JOIN
		base_data.glacier_description_type AS gdt ON gd.fk_glacier_description_type = gdt.pk
	LEFT JOIN
		base_data.vw_glacier AS g ON gd.fk_glacier = g.pk
	WHERE
		gd.fk_glacier_description_type = 0;
	
ALTER TABLE base_data.web_glacier_description
    OWNER TO gladmin;

GRANT SELECT ON TABLE base_data.web_glacier_description TO glporo;
GRANT SELECT ON TABLE base_data.web_glacier_description TO glro;
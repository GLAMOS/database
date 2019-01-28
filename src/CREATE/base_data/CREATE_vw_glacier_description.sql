CREATE OR REPLACE VIEW base_data.vw_glacier_description AS
	SELECT
		g.pk                 AS pk_glacier,
		g.pk_sgi,
		g.name_short,
		g.name_full,
		gd.fk_language_type,
		gdt.description      AS description_type,
		gd.description
	FROM
		base_data.glacier_description AS gd
	LEFT JOIN
		base_data.glacier_description_type AS gdt ON gd.fk_glacier_description_type = gdt.pk
	LEFT JOIN
		base_data.vw_glacier AS g ON gd.fk_glacier = g.pk
	WHERE
		gd.fk_glacier_description_type = 0;
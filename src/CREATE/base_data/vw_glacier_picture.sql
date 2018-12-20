CREATE OR REPLACE VIEW base_data.vw_glacier_picture AS
	SELECT
		gp.pk            AS pk,
		gp.fk_glacier    AS pk_glacier,
		vg.pk_sgi        AS pk_sgi,
		g.pk_vaw         AS pk_vaw,
		gp.picture_name,
		gp.picture_date,
		CASE
			  WHEN gp.photograph_name_first IS NULL THEN gp.photograph_name_last
			  ELSE gp.photograph_name_first || ' ' || gp.photograph_name_last
		END 
		                 AS photograph,
		gp.fk_glacier_picture_type,
		gpt.short_name
	FROM base_data.glacier_picture AS gp
	LEFT JOIN base_data.vw_glacier AS vg ON gp.fk_glacier = vg.pk
	LEFT JOIN base_data.glacier AS g ON gp.fk_glacier = g.pk
	LEFT JOIN base_data.glacier_picture_type AS gpt ON gp.fk_glacier_picture_type = gpt.pk;
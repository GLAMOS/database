CREATE OR REPLACE VIEW length_change.vw_length_change_citation AS
	SELECT
		g.pk                        AS pk_glacier,
		g.pk_sgi,
		g.name_short,
		g.name_full,
		citation.fk_language_type,
		gdt.description             AS citation_type,
		citation.description        AS citation
	FROM
		(
		SELECT
			hlcd.pk_glacier, 
			citation.fk_language_type,
			citation.fk_glacier_description_type,
			citation.description
		FROM
			length_change.vw_has_length_change_data as hlcd
			
		/* Joining all glaciers with data with the citations in all available languages */
		CROSS JOIN 
		(
			SELECT
				*
			FROM
				base_data.glacier_description
			WHERE
				fk_glacier_description_type = 1 AND fk_glacier = '00000000-0000-0000-0000-000000000000'
		) AS citation
		WHERE
			has_length = 1
		) AS citation
		
	/* Joining the base information about the glacier */
	LEFT JOIN
		base_data.vw_glacier AS g
		ON
		(citation.pk_glacier = g.pk)
		
	/* Joining the description of the text */
	LEFT JOIN
		base_data.glacier_description_type AS gdt
		ON 
		(citation.fk_glacier_description_type = gdt.pk)
	
	ORDER BY
		pk_glacier, fk_language_type;
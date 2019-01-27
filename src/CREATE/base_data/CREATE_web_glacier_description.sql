CREATE OR REPLACE VIEW base_data.web_glacier_description AS 
SELECT
	null::uuid         AS pk,
	g.pk               AS pk_glacier,
	g.pk_sgi,
	g.name_short,
	g.name_full,
	g.geom,
	citation.fk_language_type,
	null::varchar(250) AS description_type,
	description.description,
	citation.citation
FROM
(
	SELECT
		*
	FROM
	(
		SELECT
			CASE
				WHEN citation.pk_glacier IS NULL THEN description.pk_glacier
				ELSE citation.pk_glacier
			END AS pk_glacier
		FROM
		(
			SELECT
				pk_glacier
			FROM
				base_data.vw_data_citation
			GROUP BY
				pk_glacier
		) AS citation
		FULL OUTER JOINJ
			(
			SELECT
				pk_glacier
			FROM
				base_data.vw_glacier_description
			GROUP BY pk_glacier
			) AS description
		ON
			citation.pk_glacier = description.pk_glacier
	) AS citation_vs_description
	/* Joining all glaciers with data with the citations in all available languages */
	CROSS JOIN 
	(
		SELECT
			fk_language_type,
			description AS citation
		FROM
			base_data.glacier_description
		WHERE
			fk_glacier_description_type = 1 AND fk_glacier = '00000000-0000-0000-0000-000000000000'
	) AS citation
) AS citation

LEFT JOIN
	base_data.vw_glacier_description AS description
ON
	citation.pk_glacier = description.pk_glacier AND citation.fk_language_type = description.fk_language_type
	
LEFT JOIN
	base_data.vw_glacier AS g
ON
	citation.pk_glacier = g.pk
	
ORDER BY citation.pk_glacier, citation.fk_language_type;
	
ALTER TABLE base_data.web_glacier_description
    OWNER TO gladmin;

GRANT SELECT ON TABLE base_data.web_glacier_description TO glporo;
GRANT SELECT ON TABLE base_data.web_glacier_description TO glro;
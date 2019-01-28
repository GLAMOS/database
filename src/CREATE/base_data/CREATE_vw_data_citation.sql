CREATE OR REPLACE VIEW base_data.vw_data_citation AS
	SELECT
			*
		FROM
		(
			SELECT 
				CASE
					WHEN lcc.pk_glacier IS NOT NULL THEN lcc.pk_glacier
					ELSE mboc.pk_glacier
				END AS pk_glacier
			FROM
			(
				SELECT
					lcc.pk_glacier 
				FROM
					length_change.vw_length_change_citation AS lcc
				GROUP BY
				pk_glacier
			) AS lcc
			FULL OUTER JOIN 
			(
				SELECT pk_glacier FROM 
				mass_balance.vw_mass_balance_observation_citation AS mboc 
				GROUP BY pk_glacier
			) AS mboc
			ON
			(lcc.pk_glacier = mboc.pk_glacier)
		) AS all_glacier_with_data

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
		) AS citation;
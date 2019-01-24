
CREATE OR REPLACE VIEW base_data.web_glacier_description_json AS
	SELECT pk_sgi, json_agg(data.point) AS json
	  FROM (
		SELECT pk_sgi,
		  json_build_object(
			  'language', fk_language_type,
			  'description', description /*,*/
			) AS point
		FROM base_data.web_glacier_description
		/* ORDER BY pk_vaw ASC */
	  ) AS data
	  GROUP BY pk_sgi;

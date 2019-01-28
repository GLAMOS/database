
CREATE OR REPLACE VIEW base_data.web_glacier_description_json AS
	SELECT
		pk_glacier,
		pk_sgi,
		name_short           AS glacier_short_name,
		name_full            AS glacier_full_name,
		json_agg(data.point) AS json
	  FROM (
		SELECT 
		  pk_glacier,
		  pk_sgi,
		  name_short,
		  name_full,
		  jsonb_build_object(
			  'language', fk_language_type
			  /*,*/
			) 
		/* JSON entry in case of existing description(s) */
		|| CASE
			WHEN description IS NULL THEN '{}'::jsonb
			ELSE jsonb_build_object('description', description)
		END 
		  
		/* JSON entry in case of existing citation(s) */
		|| CASE
			WHEN citation IS NULL THEN '{}'::jsonb
			ELSE jsonb_build_object('citation', citation)
		END AS point
		FROM base_data.web_glacier_description
	  ) AS data
	  GROUP BY pk_glacier, pk_sgi, name_short, name_full;

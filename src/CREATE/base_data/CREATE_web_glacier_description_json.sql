
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
		  json_build_object(
			  'language', fk_language_type,
			  'description', description,
			  'citation', citation /*,*/
			) AS point
		FROM base_data.web_glacier_description
	  ) AS data
	  GROUP BY pk_glacier, pk_sgi, name_short, name_full;

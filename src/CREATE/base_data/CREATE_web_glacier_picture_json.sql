CREATE OR REPLACE VIEW base_data.web_glacier_picture_json AS
  SELECT pk_glacier, json_agg(data.point) AS json
  FROM (
    SELECT pk_glacier,
      json_build_object(
        'filename', picture_name,
        'legend', legend,
		'is_factsheet_picture', is_factsheet_picture /*,*/
	    ) AS point
    FROM base_data.web_glacier_picture
  ) AS data
  GROUP BY pk_glacier;
  
GRANT SELECT ON TABLE base_data.web_glacier_picture_json TO glporo;
GRANT SELECT ON TABLE base_data.web_glacier_picture_json TO glro;
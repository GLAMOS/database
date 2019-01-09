CREATE OR REPLACE VIEW base_data.web_glacier_details_json AS
 SELECT
 	glacier_details.pk_glacier,
    jsonb_build_object(
		'pk_sgi', glacier_details.pk_sgi, 
		'glacier_short_name', glacier_details.glacier_short_name,
		'glacier_full_name', glacier_details.glacier_full_name,
		'texts', glacier_details.json_description, 
		'pictures', glacier_details.json_picture
	) AS json
   FROM ( SELECT
		 	gd.pk_sgi,
		 	gd.pk_glacier,
		 	gd.glacier_short_name,
		 	gd.glacier_full_name,
            gd.json AS json_description,
            gp.json AS json_picture
           FROM base_data.web_glacier_description_json gd
             LEFT JOIN base_data.web_glacier_picture_json gp ON gd.pk_glacier = gp.pk_glacier) glacier_details;

ALTER TABLE base_data.web_glacier_details_json
    OWNER TO gladmin;

GRANT ALL ON TABLE base_data.web_glacier_details_json TO gladmin;
GRANT SELECT ON TABLE base_data.web_glacier_details_json TO glporo;
GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE base_data.web_glacier_details_json TO glrw;

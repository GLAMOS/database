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
				/* Get the SGI-ID from the description or picture table */
				CASE
					WHEN gd.pk_sgi IS NULL THEN gp.pk_sgi
					ELSE gd.pk_sgi
				END AS pk_sgi,
				/* Get the glacier ID from the description or picture table */
				CASE
					WHEN gd.pk_glacier IS NULL THEN gp.pk_glacier
					ELSE gd.pk_glacier
				END AS pk_glacier, 
				/* Get the short name from the description or picture table */
				CASE 
					WHEN gd.glacier_short_name IS NULL THEN gp.glacier_short_name
					ELSE gd.glacier_short_name
				END AS glacier_short_name,
				/* Get the full name from the description or picture table */
				CASE 
					WHEN gd.glacier_full_name is null then gp.glacier_full_name
					ELSE gd.glacier_full_name
				END AS glacier_full_name,
				gd.json AS json_description,
				gp.json AS json_picture
			   FROM base_data.web_glacier_description_json gd
				 FULL OUTER JOIN base_data.web_glacier_picture_json gp ON gd.pk_glacier = gp.pk_glacier) glacier_details;

ALTER TABLE base_data.web_glacier_details_json
    OWNER TO gladmin;

GRANT ALL ON TABLE base_data.web_glacier_details_json TO gladmin;
GRANT SELECT ON TABLE base_data.web_glacier_details_json TO glporo;
GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE base_data.web_glacier_details_json TO glrw;

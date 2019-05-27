-- View: base_data.test_glacier_json

-- DROP VIEW base_data.test_glacier_json;

CREATE OR REPLACE VIEW base_data.vw_test_glacier_json AS
 SELECT glacier_details.pk_glacier,
    (jsonb_build_object('pk_sgi', glacier_details.pk_sgi, 'glacier_short_name', glacier_details.glacier_short_name, 'glacier_full_name', glacier_details.glacier_full_name) ||
        
		
		CASE /* Description */
            WHEN glacier_details.json_description IS NULL THEN '{}'::jsonb
            ELSE jsonb_build_object('texts', glacier_details.json_description)
        END) ||
		CASE /* LENGTH CHANGE */
			WHEN length_change.pk_sgi IS NULL THEN '{}'::jsonb
			ELSE jsonb_bulid_object('year_from', length_change.year_from, 'year_to', length_change.year_to, 'variation', length_change.variation, 'cumulative', length_change.variation_cumulative)
        END ||
		CASE /* Pictures */
            WHEN glacier_details.json_picture IS NULL THEN '{}'::jsonb
            ELSE jsonb_build_object('pictures', glacier_details.json_picture)
        END AS json
   FROM ( SELECT
                CASE
                    WHEN gd.pk_sgi IS NULL THEN gp.pk_sgi
                    ELSE gd.pk_sgi
                END AS pk_sgi,
                CASE
                    WHEN gd.pk_glacier IS NULL THEN gp.pk_glacier
                    ELSE gd.pk_glacier
                END AS pk_glacier,
                CASE
                    WHEN gd.glacier_short_name IS NULL THEN gp.glacier_short_name
                    ELSE gd.glacier_short_name
                END AS glacier_short_name,
                CASE
                    WHEN gd.glacier_full_name IS NULL THEN gp.glacier_full_name
                    ELSE gd.glacier_full_name
                END AS glacier_full_name,
            gd.json AS json_description,
            gp.json AS json_picture
           FROM base_data.web_glacier_description_json gd
             FULL JOIN base_data.web_glacier_picture_json gp ON gd.pk_glacier = gp.pk_glacier) glacier_details 
			 LEFT JOIN length_change.web_length_change lc ON gd.pk_glacier = lc.pk_glacier;


ALTER TABLE base_data.test_glacier_json
    OWNER TO gladmin;

GRANT ALL ON TABLE base_data.test_glacier_json TO gladmin;
GRANT SELECT ON TABLE base_data.test_glacier_json TO glporo;
GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE base_data.test_glacier_json TO glrw;


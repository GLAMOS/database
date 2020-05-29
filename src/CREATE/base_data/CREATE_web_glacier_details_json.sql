-- View: base_data.web_glacier_details_json

-- DROP VIEW base_data.web_glacier_details_json;

CREATE OR REPLACE VIEW base_data.web_glacier_details_json AS
 SELECT glacier_details.pk_glacier,
    ((((((jsonb_build_object('pk_sgi', glacier_details.pk_sgi, 'glacier_short_name', glacier_details.glacier_short_name, 'glacier_full_name', glacier_details.glacier_full_name) ||
        CASE
            WHEN glacier_details.json_description IS NULL THEN '{}'::jsonb
            ELSE jsonb_build_object('texts', glacier_details.json_description)
        END) ||
        CASE
            WHEN glacier_details.json_picture IS NULL THEN '{}'::jsonb
            ELSE jsonb_build_object('pictures', glacier_details.json_picture)
        END) ||
        CASE
            WHEN glacier_details.json_length_change IS NULL THEN '{}'::jsonb
            ELSE jsonb_build_object('length_change', glacier_details.json_length_change)
        END) ||
        CASE
            WHEN glacier_details.json_mass_balance_observation IS NULL THEN '{}'::jsonb
            ELSE jsonb_build_object('mass_balance_observation', glacier_details.json_mass_balance_observation)
        END) ||
		CASE
            WHEN glacier_details.json_mass_balance_observation_winter IS NULL THEN '{}'::jsonb
            ELSE jsonb_build_object('mass_balance_observation_winter', glacier_details.json_mass_balance_observation_winter)
        END) ||
        CASE
            WHEN glacier_details.json_mass_balance_fix_date IS NULL THEN '{}'::jsonb
            ELSE jsonb_build_object('mass_balance_fix_date', glacier_details.json_mass_balance_fix_date)
        END) ||
        CASE
            WHEN glacier_details.json_mass_balance_fix_date_winter IS NULL THEN '{}'::jsonb
            ELSE jsonb_build_object('mass_balance_fix_date_winter', glacier_details.json_mass_balance_fix_date_winter)
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
            gp.json AS json_picture,
            lc.json AS json_length_change,
            mbo.json AS json_mass_balance_observation,
			mbow.json AS json_mass_balance_observation_winter,
            mbf.json AS json_mass_balance_fix_date,
            mbfw.json AS json_mass_balance_fix_date_winter
           FROM base_data.web_glacier_description_json gd
             FULL JOIN base_data.web_glacier_picture_json gp ON gd.pk_glacier = gp.pk_glacier
             FULL JOIN length_change.web_length_change_glacier_json lc ON gd.pk_glacier = lc.pk_glacier
             FULL JOIN mass_balance.web_mass_balance_observation_glacier_json mbo ON gd.pk_glacier = mbo.pk_glacier
			 FULL JOIN mass_balance.web_mass_balance_observation_winter_glacier_json mbow ON gd.pk_glacier = mbow.pk_glacier
             FULL JOIN mass_balance.web_mass_balance_fix_date_glacier_json mbf ON gd.pk_glacier = mbf.pk_glacier
             FULL JOIN mass_balance.web_mass_balance_fix_date_winter_glacier_json mbfw ON gd.pk_glacier = mbfw.pk_glacier) glacier_details;

ALTER TABLE base_data.web_glacier_details_json
    OWNER TO gladmin;

GRANT ALL ON TABLE base_data.web_glacier_details_json TO gladmin;
GRANT SELECT ON TABLE base_data.web_glacier_details_json TO glporo;
GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE base_data.web_glacier_details_json TO glrw;
CREATE OR REPLACE VIEW base_data.web_glacier_details_json AS
	SELECT
		glacier_details.pk_glacier,
		/* JSON objects written in all cases */
		jsonb_build_object(
			'pk_sgi', glacier_details.pk_sgi, 
			'glacier_short_name', glacier_details.glacier_short_name,
			'glacier_full_name', glacier_details.glacier_full_name
		)
		/* JSON object in case of existing description(s) */
		|| CASE
			WHEN glacier_details.json_description IS NULL THEN '{}'::jsonb
			ELSE jsonb_build_object('texts', glacier_details.json_description)
		END
		/* JSON object in case of existing picture(s) */
		|| CASE
			WHEN glacier_details.json_picture IS NULL THEN '{}'::jsonb
			ELSE jsonb_build_object('pictures', glacier_details.json_picture)
		END		
		/* JSON object in case of existing length change data */
		|| CASE
			WHEN glacier_details.json_length_change IS NULL THEN '{}'::jsonb
			ELSE jsonb_build_object('length_change', glacier_details.json_length_change)
		END
		/* JSON object in case of existing mass balance observation data */
		|| CASE
			WHEN glacier_details.json_mass_balance_observation IS NULL THEN '{}'::jsonb
			ELSE jsonb_build_object('mass_balance_observation', glacier_details.json_mass_balance_observation)
		END
		/* JSON object in case of existing WINTER mass balance observation data */
		/* || CASE
			WHEN glacier_details.json_mass_balance_observation_winter_winter IS NULL THEN '{}'::jsonb
			ELSE jsonb_build_object('mass_balance_obser_winter_winter', glacier_details.json_mass_balance_observation_winter)
		END */
		/* JSON object in case of existing mass balance fix date data */
		|| CASE
			WHEN glacier_details.json_mass_balance_fix_date IS NULL THEN '{}'::jsonb
			ELSE jsonb_build_object('mass_balance_fix_date', glacier_details.json_mass_balance_fix_date)
		END
		/* JSON object in case of existing WINTER mass balance fix date data */
		|| CASE
			WHEN glacier_details.json_mass_balance_fix_date_winter IS NULL THEN '{}'::jsonb
			ELSE jsonb_build_object('mass_balance_fix_date_winter', glacier_details.json_mass_balance_fix_date_winter)
		END

		AS json
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
				gp.json AS json_picture,
				lc.json AS json_length_change,
				mbo.json AS json_mass_balance_observation,
				/* mbow.json AS json_mass_balance_observation_winter, */
				mbf.json AS json_mass_balance_fix_date,
				mbfw.json AS json_mass_balance_fix_date_winter
			   FROM base_data.web_glacier_description_json gd
				 FULL OUTER JOIN base_data.web_glacier_picture_json AS gp ON gd.pk_glacier = gp.pk_glacier
				 FULL OUTER JOIN length_change.web_length_change_glacier_json AS lc ON gd.pk_glacier = lc.pk_glacier
				 FULL OUTER JOIN mass_balance.web_mass_balance_observation_glacier_json AS mbo ON gd.pk_glacier = mbo.pk_glacier
				 /* FULL OUTER JOIN mass_balance.web_mass_balance_observation_winter_glacier_json AS mbow ON gd.pk_glacier = mbow.pk_glacier */
				 FULL OUTER JOIN mass_balance.web_mass_balance_fix_date_glacier_json AS mbf ON gd.pk_glacier = mbf.pk_glacier
				 FULL OUTER JOIN mass_balance.web_mass_balance_fix_date_winter_glacier_json AS mbfw ON gd.pk_glacier = mbfw.pk_glacier
		) AS glacier_details;

ALTER TABLE base_data.web_glacier_details_json
    OWNER TO gladmin;

GRANT ALL ON TABLE base_data.web_glacier_details_json TO gladmin;
GRANT SELECT ON TABLE base_data.web_glacier_details_json TO glporo;
GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE base_data.web_glacier_details_json TO glrw;

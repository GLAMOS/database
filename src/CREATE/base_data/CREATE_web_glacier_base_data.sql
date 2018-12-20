CREATE OR REPLACE VIEW base_data.web_glacier_base_data AS

	SELECT
		g.name_short                                              AS glacier_short_name,
		g.name_full                                               AS glacier_full_name,
		g.pk_sgi                                                  AS pk_sgi,
		round(ST_X(ST_TRANSFORM(g.geom, 3857))::numeric, 3)       AS coordx,
		round(ST_Y(ST_TRANSFORM(g.geom, 3857))::numeric, 3)       AS coordy,
		ST_TRANSFORM(g.geom, 3857)                                AS geom,
		
		hlcd.has_length                                           AS has_length,
		lclo.latest_observation_variation_quantitative_cumulative AS last_length_change_cumulative,
		lcow.first_year                                           AS first_year_length,
		lcow.last_year                                            AS last_year_length,
		
		mbohd.mass_balance_observation_has_data                   AS has_mass,
		mblo.latest_mass_balance_annual_cumulative                AS last_mass_change_cumulative,
		mbow.first_year_annual                                    AS first_year_mass,
		mbow.last_year_annual                                     AS last_year_mass,
		
		CASE
			WHEN hlcd.has_length = 0 AND mbohd.mass_balance_observation_has_data = 0
				THEN 1
				ELSE 0
		END AS no_data

	FROM base_data.vw_glacier AS g 
	
	LEFT JOIN length_change.vw_has_length_change_data AS hlcd ON
		(hlcd.pk_glacier = g.pk)
	LEFT JOIN length_change.vw_length_change_observation_window AS lcow ON
		(lcow.pk_glacier = g.pk)
	LEFT JOIN length_change.vw_length_change_latest_observation AS lclo ON
		(lclo.pk_glacier = g.pk)
		
	LEFT JOIN mass_balance.vw_mass_balance_observation_has_data AS mbohd ON
		(mbohd.pk_glacier = g.pk)
	LEFT JOIN mass_balance.vw_mass_balance_observation_window AS mbow ON
		(mbow.pk_glacier = g.pk)
	LEFT JOIN mass_balance.vw_mass_balance_observation_latest AS mblo ON
		(mblo.pk_glacier = g.pk);

ALTER TABLE base_data.web_glacier_base_data
    OWNER TO gladmin;

GRANT ALL ON TABLE    base_data.web_glacier_base_data TO gladmin;
GRANT SELECT ON TABLE base_data.web_glacier_base_data TO glporo;
GRANT SELECT ON TABLE base_data.web_glacier_base_data TO glro;
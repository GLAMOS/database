CREATE OR REPLACE VIEW base_data.web_glacier_base_data AS

	SELECT
		g.name_short                                              AS glacier_short_name,
		g.name_full                                               AS glacier_full_name,
		g.pk_sgi                                                  AS pk_sgi,
		ST_X(ST_TRANSFORM(g.geom, 3857))                          AS coordx,
		ST_Y(ST_TRANSFORM(g.geom, 3857))                          AS coordy,
		ST_AsGeoJSON(ST_TRANSFORM(g.geom, 3857), 3, 0)            AS geom,
		hlcd.has_length                                           AS has_length,
		lclo.latest_observation_variation_quantitative_cumulative AS last_length_change_cumulative,
		lcow.first_year                                           AS first_year_length,
		lcow.last_year                                            AS last_year_length
	FROM base_data.vw_glacier AS g 
	LEFT JOIN length_change.vw_has_length_change_data AS hlcd ON
		(hlcd.pk_glacier = g.pk)
	LEFT JOIN length_change.vw_length_change_observation_window AS lcow ON
		(lcow.pk_glacier = g.pk)
	LEFT JOIN length_change.vw_length_change_latest_observation AS lclo ON
		(lclo.pk_glacier = g.pk);

ALTER TABLE base_data.web_glacier_base_data
    OWNER TO gladmin;

GRANT ALL ON TABLE    base_data.web_glacier_base_data TO gladmin;
GRANT SELECT ON TABLE base_data.web_glacier_base_data TO glporo;
GRANT SELECT ON TABLE base_data.web_glacier_base_data TO glro;
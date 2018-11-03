CREATE OR REPLACE VIEW base_data.web_glacier_base_data_json AS

	SELECT
		JSONB_BUILD_OBJECT(
			'glacier_short_name',            gbd.glacier_short_name,
			'glacier_full_name',             gbd.glacier_full_name,
			'pk_sgi',                        gbd.pk_sgi,
			
			'coordx',                        gbd.coordx,
			'coordy',                        gbd.coordy,
			
			'geom',                          gbd.geom,
			
			'has_length',                    gbd.has_length,
			'last_length_change_cumulative', gbd.last_length_change_cumulative,
			'first_year_length',             gbd.first_year_length,
			'last_year_length',              gbd.last_year_length,
			
			'has_mass',                      gbd.has_mass,
			'last_mass_change_cumulative',   gbd.last_mass_change_cumulative,
			'first_year_mass',               gbd.first_year_mass,
			'last_year_mass',                gbd.last_year_mass,
			'no_data',                       gbd.no_data
		)
	FROM base_data.web_glacier_base_data AS gbd; 

GRANT SELECT ON TABLE base_data.web_glacier_base_data_json TO glporo;
GRANT SELECT ON TABLE base_data.web_glacier_base_data_json TO glro;
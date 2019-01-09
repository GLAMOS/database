CREATE OR REPLACE VIEW mass_balance.csv_mass_balance_observation_elevation_bins_data AS
	SELECT
		/* Key information about the glacier */
 		mbd.name_full                                   AS glacier_name,
		mbd.pk_sgi                                      AS glacier_id,
		
		/* Information about the observation periode */
		mbd.date_from_annual                            AS start_date_of_observation,
		mbd.date_to_winter                              AS end_date_of_winter_observation,
		mbd.date_to_annual                              AS end_date_of_observation,
		
		/* Mass-balance data */
		ed.mass_balance_winter                          AS winter_mass_balance,
		ed.mass_balance_annual - ed.mass_balance_winter AS summer_mass_balance,
		ed.mass_balance_annual                          AS annual_mass_balance,
		
		/* Information about the elevation bins */
		ed.area                                         AS area,
		ed.elevation_from                               AS lower_elevation_of_bin,
		ed.elevation_to                                 AS upper_elevation_of_bin,
		mbd.reference                                   AS observer
	FROM mass_balance.elevation_distribution AS ed
	LEFT JOIN mass_balance.vw_mass_balance_data AS mbd ON (ed.fk_mass_balance = mbd.pk)
	WHERE fk_mass_balance_type = 1
	ORDER BY glacier_id ASC, start_date_of_observation ASC, lower_elevation_of_bin ASC;
	
ALTER TABLE mass_balance.csv_mass_balance_observation_elevation_bins_data
    OWNER TO gladmin;

GRANT ALL ON TABLE    mass_balance.csv_mass_balance_observation_elevation_bins_data TO gladmin;
GRANT SELECT ON TABLE mass_balance.csv_mass_balance_observation_elevation_bins_data TO glporo;
GRANT SELECT ON TABLE mass_balance.csv_mass_balance_observation_elevation_bins_data TO glro;
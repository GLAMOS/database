CREATE OR REPLACE VIEW mass_balance.csv_mass_balance_fix_date_data AS
	SELECT 
		name_full                                 AS glacier_name,
		pk_sgi                                    AS glacier_id,
		date_from_annual                          AS start_date_of_observation,
		date_to_winter                            AS end_date_of_winter_observation,
		date_to_annual                            AS end_date_of_observation,
		mass_balance_winter                       AS winter_mass_balance,
		mass_balance_annual - mass_balance_winter AS summer_mass_balance,
		mass_balance_annual                       AS annual_mass_balance,
		equilibrium_line_altitude                 AS equilibrium_line_altitude,
		accumulation_area_ratio                   AS accumulation_area_ratio,
		area                                      AS glacier_area,
		elevation_minimum                         AS minimum_elevation_of_glacier,
		elevation_maximum                         AS maximum_elevation_of_glacier,
		reference                                 AS observer

	FROM mass_balance.vw_mass_balance_data AS mbd
	WHERE fk_mass_balance_type = 2
	ORDER BY glacier_id ASC, start_date_of_observation ASC;
	
ALTER TABLE mass_balance.csv_mass_balance_fix_date_data
    OWNER TO gladmin;

GRANT ALL ON TABLE    mass_balance.csv_mass_balance_fix_date_data TO gladmin;
GRANT SELECT ON TABLE mass_balance.csv_mass_balance_fix_date_data TO glporo;
GRANT SELECT ON TABLE mass_balance.csv_mass_balance_fix_date_data TO glro;
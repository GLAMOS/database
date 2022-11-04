-- View: mass_balance.vw_mass_balance_point_data_location

DROP VIEW mass_balance.vw_mass_balance_point_data_location;

CREATE OR REPLACE VIEW mass_balance.vw_mass_balance_point_data_location
 AS
 SELECT row_number() OVER () AS gid,
	pk_sgi, 
	glacier_name, 
	glacier_short, 
	point_name, 
	observation_type, 
	max(date_from), 
	st_transform(st_setsrid(st_makepoint(latitude, longitude), 21781), 4326) as geom, 
	latitude, 
	longitude, 
	altitude

   FROM mass_balance.vw_mass_balance_point_data
   WHERE date_from > (CURRENT_DATE-1000) and observation_type = 'annual' 
   GROUP BY pk_sgi, glacier_name, glacier_short, point_name, observation_type, latitude, longitude, altitude;
     

ALTER TABLE mass_balance.vw_mass_balance_point_data_location
    OWNER TO gladmin;

GRANT ALL ON TABLE mass_balance.vw_mass_balance_point_data_location TO gladmin;
GRANT SELECT ON TABLE mass_balance.vw_mass_balance_point_data_location TO glrw;
GRANT SELECT ON TABLE mass_balance.vw_mass_balance_point_data_location TO glro;


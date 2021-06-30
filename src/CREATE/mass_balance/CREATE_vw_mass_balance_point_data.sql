-- View: mass_balance.vw_mass_balance_point_data

-- DROP VIEW mass_balance.vw_mass_balance_point_data;

CREATE OR REPLACE VIEW mass_balance.vw_mass_balance_point_data AS
SELECT row_number() OVER () AS gid,
    g.pk_sgi,
    g.name_full as glacier_name,
	g.name_short as glacier_short,
	mbp.name as point_name,
	ot.name as observation_type,
	date_from,
	time_from,
	date_to,
	time_to,
	datea.name as date_accuracy,
	period,
	latitude,
	longitude,
	altitude,
	pa.name as position_accuracy,
	massbalance_raw,
	density,
	densa.name as density_accuracy,
	massbalance_we,
	mq.name as measurement_quality,
	mt.name as measurement_type,
	massbalance_error,
	reading_error,
	density_error,
	source
	

   FROM mass_balance.point mbp
     LEFT JOIN base_data.vw_glacier g ON mbp.fk_glacier = g.pk
	 LEFT JOIN mass_balance.observation_type ot ON mbp.fk_observation_type = ot.pk
	 LEFT JOIN mass_balance.date_accuracy datea ON mbp.fk_date_accuracy = datea.pk
	 LEFT JOIN mass_balance.position_accuracy pa ON mbp.fk_position_accuracy = pa.pk
	 LEFT JOIN mass_balance.density_accuracy densa ON mbp.fk_density_accuracy = densa.pk
	 LEFT JOIN mass_balance.measurement_quality mq ON mbp.fk_measurement_quality = mq.pk
	 LEFT JOIN mass_balance.measurement_type mt ON mbp.fk_measurement_type = mt.pk;

ALTER TABLE mass_balance.vw_mass_balance_point_data
    OWNER TO gladmin;

GRANT ALL ON TABLE mass_balance.vw_mass_balance_point_data TO gladmin;
GRANT SELECT ON TABLE mass_balance.vw_mass_balance_point_data TO glrw;
GRANT SELECT ON TABLE mass_balance.vw_mass_balance_point_data TO glro;
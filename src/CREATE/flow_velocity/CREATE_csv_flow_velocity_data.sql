-- View: flow_velocity.csv_flow_velocity_data

-- DROP VIEW flow_velocity.csv_flow_velocity_data;

CREATE OR REPLACE VIEW flow_velocity.csv_flow_velocity_data
 AS
 SELECT
    fvp.name AS stake_name,
    g.name_full AS glacier_name,
    g.pk_sgi,
    g.pk_wgms,
    fvp.date_from,
	fvp.time_from,
    fvp.date_to,
	fvp.time_to,
    fvp.latitude_from,
    fvp.longitude_from,
    fvp.altitude_from,
	fvp.d_t,
	fvp.d_x,
	fvp.d_y,
	fvp.d_z,
	fvp.d_h,
    fvp.velocity_xy,
    fvp.velocity_z,
    mt.description AS marker_type,
    pcm.description AS position_method_type,
	fvp.source,
	fvp.investigator,
	fvp.remarks
   FROM flow_velocity.flow_velocity_point fvp
     LEFT JOIN base_data.vw_glacier g ON fvp.fk_glacier = g.pk
     LEFT JOIN flow_velocity.marker_type mt ON fvp.fk_marker_type = mt.pk
     LEFT JOIN flow_velocity.position_capture_method pcm ON fvp.fk_position_method_type = pcm.pk
	ORDER BY g.pk_sgi, fvp.date_from;

ALTER TABLE flow_velocity.csv_flow_velocity_data
    OWNER TO gladmin;

GRANT ALL ON TABLE flow_velocity.csv_flow_velocity_data TO gladmin;
GRANT SELECT ON TABLE flow_velocity.csv_flow_velocity_data TO glrw;
GRANT SELECT ON TABLE flow_velocity.csv_flow_velocity_data TO glro;
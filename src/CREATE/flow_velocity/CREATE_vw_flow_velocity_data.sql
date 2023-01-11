-- View: flow_velocity.vw_flow_velocity_data

-- DROP VIEW flow_velocity.vw_flow_velocity_data;

CREATE OR REPLACE VIEW flow_velocity.vw_flow_velocity_data
 AS
 SELECT row_number() OVER () AS gid,
    g.pk AS pk_glacier,
	g.name_full AS glacier_name,
    g.pk_sgi,
    g.pk_wgms,
	fvd.name as stake_name,
	fvd.date_from,
	fvd.date_to,
	fvd.latitude_from,
	fvd.longitude_from,
	fvd.altitude_from,
	fvd.velocity_xy,
	fvd.velocity_z,
	mt.description AS marker_type,
	pcm.description AS position_method_type

   FROM flow_velocity.flow_velocity_point fvd
     LEFT JOIN base_data.vw_glacier g ON fvd.fk_glacier = g.pk
     LEFT JOIN flow_velocity.marker_type mt ON fvd.fk_marker_type = mt.pk
     LEFT JOIN flow_velocity.position_capture_method pcm ON fvd.fk_position_method_type = pcm.pk;


ALTER TABLE flow_velocity.vw_flow_velocity_data
    OWNER TO gladmin;

GRANT ALL ON TABLE flow_velocity.vw_flow_velocity_data TO gladmin;
GRANT SELECT ON TABLE flow_velocity.vw_flow_velocity_data TO glrw;
GRANT SELECT ON TABLE flow_velocity.vw_flow_velocity_data TO glro;


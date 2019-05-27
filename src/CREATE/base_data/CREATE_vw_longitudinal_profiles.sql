-- View: base_data.vw_glacier

-- DROP VIEW base_data.vw_glacier;

CREATE OR REPLACE VIEW base_data.vw_longitudinal_profile AS
	SELECT row_number() OVER () AS gid,
		g.pk_sgi,
		g.name_short,
		g.name_full,
		lp.acquisition,
		lp.release,
		lpt.short_name AS profile_type,
		lps.short_name AS profile_state,
		lp.geom,
		st_length(st_transform(lp.geom, 2056)) / 1000::double precision AS length_km
				
	FROM base_data.longitudinal_profiles lp
		LEFT JOIN base_data.vw_glacier g ON lp.fk_glacier = g.pk
		LEFT JOIN administration.observer o ON lp.fk_observer = o.pk
		LEFT JOIN administration.object_origin_type oot ON lp.fk_object_origin_type = oot.pk
		LEFT JOIN administration.position_capture_method_type pcmt ON lp.fk_position_capture_method_type = pcmt.pk
		LEFT JOIN administration.height_capture_method_type hcmt ON lp.fk_height_capture_method_type = hcmt.pk
		LEFT JOIN administration.longitudinal_profile_type lpt ON lp.fk_long_profile_type = lpt.pk
		LEFT JOIN administration.longitudinal_profile_state lps ON lp.fk_long_profile_type = lps.pk;
		
ALTER TABLE base_data.vw_longitudinal_profile
    OWNER TO gladmin;

GRANT ALL ON TABLE base_data.vw_longitudinal_profile TO gladmin;
GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE base_data.vw_longitudinal_profile TO glrw;
GRANT SELECT ON TABLE base_data.vw_longitudinal_profile TO glro;
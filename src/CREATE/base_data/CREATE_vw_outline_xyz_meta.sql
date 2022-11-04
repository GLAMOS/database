-- View: base_data.vw_outline_xyz_meta

DROP VIEW base_data.vw_outline_xyz_meta;

CREATE OR REPLACE VIEW base_data.vw_outline_xyz_meta AS
 SELECT row_number() OVER () AS gid,
	o.pk,
    g.pk_sgi,
    g.pk_vaw,
    g.pk_wgms,
	g.name_short,
	g.name_full,
    o.measure_date,
    ot.short_name AS object_type,
	oot.short_name AS object_origin,
    pcm.short_name AS position_capture_method,
    hcm.short_name AS height_capture_method,
    obs.name AS institution,
    (obs.name_first::text || ' '::text) || obs.name_last::text AS observer
   FROM base_data.outline o
     LEFT JOIN base_data.vw_glacier g ON o.fk_glacier = g.pk
     LEFT JOIN administration.object_origin_type oot ON o.fk_object_origin_type = oot.pk
     LEFT JOIN administration.position_capture_method_type pcm ON o.fk_position_capture_method_type = pcm.pk
     LEFT JOIN administration.height_capture_method_type hcm ON o.fk_height_capture_method_type = hcm.pk
     LEFT JOIN base_data.object_type ot ON o.fk_object_type = ot.pk
	 LEFT JOIN administration.vw_observer obs ON o.fk_observer = obs.pk
GROUP BY o.pk, g.pk_sgi, g.pk_vaw, g.pk_wgms, o.measure_date, g.name_full, g.name_short, oot.short_name, pcm.short_name, hcm.short_name, ot.short_name, obs.name, obs.name_first, obs.name_last
ORDER BY g.pk_sgi, o.measure_date;
ALTER TABLE base_data.vw_outline
    OWNER TO gladmin;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE base_data.vw_outline TO gldirw;
GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE base_data.vw_outline TO glrw;
GRANT SELECT ON TABLE base_data.vw_outline TO glro;
GRANT SELECT ON TABLE base_data.vw_outline TO gldiro;
GRANT ALL ON TABLE base_data.vw_outline TO gladmin;

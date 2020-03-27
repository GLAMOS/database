-- View: base_data.vw_outline

-- DROP VIEW base_data.vw_outline;

CREATE OR REPLACE VIEW base_data.vw_outline AS
 SELECT row_number() OVER () AS gid,
    g.pk_sgi,
    g.pk_vaw,
    g.pk_wgms,
    g.pk_glims,
    g.river_level_3,
    g.river_level_2,
    g.river_level_1,
    g.river_level_0,
    get_pk_hades(g.river_level_3::text, g.river_level_2::integer, g.river_level_1::integer, g.river_level_0::text) AS pk_hades,
    o.geom,
    o.measure_date,
    g.name_full,
    g.name_short,
    oot.short_name AS object_origin,
    pcm.short_name AS position_capture_method,
    hcm.short_name AS height_capture_method,
    ot.short_name AS object_type
   FROM base_data.outline o
     LEFT JOIN base_data.vw_glacier g ON o.fk_glacier = g.pk
     LEFT JOIN administration.object_origin_type oot ON o.fk_object_origin_type = oot.pk
     LEFT JOIN administration.position_capture_method_type pcm ON o.fk_position_capture_method_type = pcm.pk
     LEFT JOIN administration.height_capture_method_type hcm ON o.fk_height_capture_method_type = hcm.pk
     LEFT JOIN base_data.object_type ot ON o.fk_object_type = ot.pk;

ALTER TABLE base_data.vw_outline
    OWNER TO gladmin;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE base_data.vw_outline TO gldirw;
GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE base_data.vw_outline TO glrw;
GRANT SELECT ON TABLE base_data.vw_outline TO glro;
GRANT SELECT ON TABLE base_data.vw_outline TO gldiro;
GRANT ALL ON TABLE base_data.vw_outline TO gladmin;

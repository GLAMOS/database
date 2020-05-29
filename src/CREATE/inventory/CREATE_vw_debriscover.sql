CREATE OR REPLACE VIEW inventory.vw_debris_cover AS
 SELECT row_number() OVER () AS gid,
    g.pk AS fk_glacier,
    g.pk_sgi,
    g.pk_wgms,
    g.pk_glims,
    g.river_level_3,
    g.river_level_2,
    g.river_level_1,
    g.river_level_0,
    get_pk_hades(g.river_level_3::text, g.river_level_2::integer, g.river_level_1::integer, g.river_level_0::text) AS pk_hades,
    dcg.geom,
    g.name_full,
    dcg.acquisition AS year_acquisition,
    dcg.release AS sgi_release,
    st_area(st_transform(dcg.geom, 2056)) / 1000000::double precision AS area,
    det.short_name AS embargo,
    g.name_short
   FROM inventory.debriscover_geometry dcg
     LEFT JOIN base_data.vw_glacier g ON dcg.fk_glacier = g.pk
     LEFT JOIN administration.data_embargo_type det ON dcg.fk_data_embargo_type = det.pk;

ALTER TABLE inventory.vw_debris_cover
    OWNER TO gladmin;

GRANT SELECT ON TABLE inventory.vw_debris_cover TO gldiro;
GRANT ALL ON TABLE inventory.vw_debris_cover TO gladmin;
GRANT SELECT ON TABLE inventory.vw_debris_cover TO glro;
GRANT SELECT ON TABLE inventory.vw_debris_cover TO glrw;
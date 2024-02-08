-- View: inventory.vw_inventory_bbox

DROP VIEW inventory.vw_inventory_bbox;

CREATE OR REPLACE VIEW inventory.vw_inventory_bbox
 AS
 SELECT row_number() OVER () AS gid,
    vw_inventory.pk_sgi,
    vw_inventory.name_short,
    vw_inventory.name_full,
    count(*) AS count_features,
    st_xmin(st_envelope(st_transform(st_collect(vw_inventory.geom), 2056))::box3d) AS x_ll,
    st_ymin(st_envelope(st_transform(st_collect(vw_inventory.geom), 2056))::box3d) AS y_ll,
    st_xmax(st_envelope(st_transform(st_collect(vw_inventory.geom), 2056))::box3d) AS x_ur,
    st_ymax(st_envelope(st_transform(st_collect(vw_inventory.geom), 2056))::box3d) AS y_ur,
    floor(st_xmin(st_envelope(st_transform(st_collect(vw_inventory.geom), 2056))::box3d) / 10::double precision) * 10::double precision - 50::double precision AS x_ll_corr,
    floor(st_ymin(st_envelope(st_transform(st_collect(vw_inventory.geom), 2056))::box3d) / 10::double precision) * 10::double precision - 50::double precision AS y_ll_corr,
    ceiling(st_xmax(st_envelope(st_transform(st_collect(vw_inventory.geom), 2056))::box3d) / 10::double precision) * 10::double precision + 50::double precision AS x_ur_corr,
    ceiling(st_ymax(st_envelope(st_transform(st_collect(vw_inventory.geom), 2056))::box3d) / 10::double precision) * 10::double precision + 50::double precision AS y_ur_corr,
    st_setsrid(ST_MakePolygon(ST_MakeLine(ARRAY[ST_POINT(floor(st_xmin(st_envelope(st_transform(st_collect(vw_inventory.geom), 2056))::box3d) / 10::double precision) * 10::double precision - 50::double precision, floor(st_ymin(st_envelope(st_transform(st_collect(vw_inventory.geom), 2056))::box3d) / 10::double precision) * 10::double precision - 50::double precision),
ST_POINT(floor(st_xmin(st_envelope(st_transform(st_collect(vw_inventory.geom), 2056))::box3d) / 10::double precision) * 10::double precision - 50::double precision, ceiling(st_ymax(st_envelope(st_transform(st_collect(vw_inventory.geom), 2056))::box3d) / 10::double precision) * 10::double precision + 50::double precision),
ST_POINT(ceiling(st_xmax(st_envelope(st_transform(st_collect(vw_inventory.geom), 2056))::box3d) / 10::double precision) * 10::double precision + 50::double precision, ceiling(st_ymax(st_envelope(st_transform(st_collect(vw_inventory.geom), 2056))::box3d) / 10::double precision) * 10::double precision + 50::double precision),
ST_POINT(ceiling(st_xmax(st_envelope(st_transform(st_collect(vw_inventory.geom), 2056))::box3d) / 10::double precision) * 10::double precision + 50::double precision, floor(st_ymin(st_envelope(st_transform(st_collect(vw_inventory.geom), 2056))::box3d) / 10::double precision) * 10::double precision - 50::double precision),
ST_POINT(floor(st_xmin(st_envelope(st_transform(st_collect(vw_inventory.geom), 2056))::box3d) / 10::double precision) * 10::double precision - 50::double precision, floor(st_ymin(st_envelope(st_transform(st_collect(vw_inventory.geom), 2056))::box3d) / 10::double precision) * 10::double precision - 50::double precision)])),2056) as bbox
   FROM inventory.vw_inventory
  GROUP BY vw_inventory.pk_sgi, vw_inventory.name_short, vw_inventory.name_full;

ALTER TABLE inventory.vw_inventory_bbox
    OWNER TO gladmin;

GRANT ALL ON TABLE inventory.vw_inventory_bbox TO gladmin;
GRANT SELECT ON TABLE inventory.vw_inventory_bbox TO glrw;
GRANT SELECT ON TABLE inventory.vw_inventory_bbox TO glro;
GRANT SELECT ON TABLE inventory.vw_inventory_bbox TO gldiro;


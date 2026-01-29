-- View: inventory.vw_inventory_sgi2022

-- DROP VIEW inventory.vw_inventory_sgi2022;

CREATE OR REPLACE VIEW inventory.vw_inventory_sgi2022
 AS
 SELECT row_number() OVER () AS gid,
    g.pk AS pk_glacier,
    g.pk_sgi AS sgi_id,
    g.pk_wgms AS wgms_id,
    g.name_full,
    g.name_short,
    max(ig.acquisition) AS year_acquisition,
    max(ig.release) AS sgi_release,
    st_union(ig.geom) AS geom,
    sum(st_area(st_transform(ig.geom, 2056)) / 1000000::double precision) AS area
   FROM inventory.inventory_geometry ig
     LEFT JOIN base_data.vw_glacier g ON ig.fk_glacier = g.pk
     LEFT JOIN administration.data_embargo_type det ON ig.fk_data_embargo_type = det.pk
  WHERE ig.release = 2025
  GROUP BY g.pk, g.pk_sgi, g.pk_wgms, g.name_full, g.name_short
  ORDER BY g.pk_sgi;

ALTER TABLE inventory.vw_inventory_sgi2022
    OWNER TO gladmin;

GRANT ALL ON TABLE inventory.vw_inventory_sgi2022 TO gladmin;
GRANT SELECT ON TABLE inventory.vw_inventory_sgi2022 TO gldiro;
GRANT SELECT ON TABLE inventory.vw_inventory_sgi2022 TO glro;
GRANT SELECT ON TABLE inventory.vw_inventory_sgi2022 TO glrw;
-- View: inventory.vw_inventory_sgi2016

-- DROP VIEW inventory.vw_inventory_sgi2016;

CREATE OR REPLACE VIEW inventory.vw_inventory_sgi2016
 AS
 SELECT row_number() OVER () AS gid,
    g.pk AS pk_glacier,
    g.pk_sgi as sgi_id,
    g.pk_wgms as wgms_id,
	g.name_full,
	g.name_short,
	MAX(ig.acquisition) AS year_acquisition,
    MAX(ig.release) AS sgi_release,
    ST_UNION(ig.geom) as geom,
    SUM(st_area(st_transform(ig.geom, 2056)) / 1000000::double precision) AS area
   FROM inventory.inventory_geometry ig
     LEFT JOIN base_data.vw_glacier g ON ig.fk_glacier = g.pk
     LEFT JOIN administration.data_embargo_type det ON ig.fk_data_embargo_type = det.pk
   WHERE ig.release=2020
   GROUP BY pk_glacier, sgi_id, wgms_id, name_full, name_short
   ORDER BY g.pk_sgi;

ALTER TABLE inventory.vw_inventory_sgi2016
    OWNER TO gladmin;

GRANT ALL ON TABLE inventory.vw_inventory_sgi2016 TO gladmin;
GRANT SELECT ON TABLE inventory.vw_inventory_sgi2016 TO glrw;
GRANT SELECT ON TABLE inventory.vw_inventory_sgi2016 TO glro;
GRANT SELECT ON TABLE inventory.vw_inventory_sgi2016 TO gldiro;
GRANT SELECT ON TABLE inventory.vw_inventory_sgi2016 TO glpro;


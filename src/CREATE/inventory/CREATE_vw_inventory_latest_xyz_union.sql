-- View: inventory.vw_inventory_latest_xyz_union

-- DROP VIEW inventory.vw_inventory_latest_xyz_union;

CREATE OR REPLACE VIEW inventory.vw_inventory_latest_xyz_union AS
 SELECT row_number() OVER () AS gid,
    latest_inventory.pk_glacier,
    latest_inventory.geom,
    latest_inventory.sgi_release,
    latest_inventory.pk_sgi,
    latest_inventory.year_acquisition,
    latest_inventory.name_short,
    st_area(st_transform(latest_inventory.geom, 2056))::bigint AS area
   FROM ( SELECT i.pk_glacier,
            st_union(i.geom) AS geom,
            i.sgi_release,
            i.pk_sgi,
            i.year_acquisition,
            i.name_short
           FROM inventory.vw_inventory i
             JOIN inventory.vw_inventory_latest_year liry ON i.sgi_release = liry.latest_inventory_release_year
          GROUP BY i.pk_glacier, i.sgi_release, i.pk_sgi, i.year_acquisition, i.name_short, i.geom) latest_inventory;

ALTER TABLE inventory.vw_inventory_latest_xyz_union
    OWNER TO gladmin;

GRANT SELECT ON TABLE inventory.vw_inventory_latest_xyz_union TO gldiro;
GRANT ALL ON TABLE inventory.vw_inventory_latest_xyz_union TO gladmin;
GRANT SELECT ON TABLE inventory.vw_inventory_latest_xyz_union TO glporo;
GRANT SELECT ON TABLE inventory.vw_inventory_latest_xyz_union TO glro;
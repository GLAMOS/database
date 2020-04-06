CREATE OR REPLACE VIEW inventory.vw_inventory AS
 SELECT
    row_number() OVER () AS gid,
    g.pk AS pk_glacier,
    g.pk_sgi,
    g.pk_wgms,
    g.pk_glims,
    g.river_level_3,
    g.river_level_2,
    g.river_level_1,
    g.river_level_0,
    get_pk_hades(g.river_level_3::text, g.river_level_2::integer, g.river_level_1::integer, g.river_level_0::text) AS pk_hades,
    ig.geom,
    g.name_full,
	ig.acquisition AS year_acquisition,
    ig.release AS sgi_release,
    st_area(st_transform(ig.geom, 2056)) / 1000000::double precision AS area,
	det.short_name AS embargo,
	g.name_short
   FROM inventory.inventory_geometry ig
     LEFT JOIN base_data.vw_glacier g ON ig.fk_glacier = g.pk
	 LEFT JOIN administration.data_embargo_type det ON ig.fk_data_embargo_type = det.pk;

ALTER TABLE inventory.vw_inventory
    OWNER TO gladmin;

GRANT ALL ON TABLE inventory.vw_inventory TO gladmin;
GRANT SELECT ON TABLE inventory.vw_inventory TO glro;
GRANT SELECT ON TABLE inventory.vw_inventory TO glrw;
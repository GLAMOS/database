DROP TABLE IF EXISTS test.edge_test_polyline_3d_woc CASCADE;

CREATE TABLE test.edge_test_polyline_3d_woc (
    pk          uuid        NOT NULL,
	fk_glacier  uuid        NOT NULL,
    geom        geometry(MultiLineStringZ)    NOT NULL,
    CONSTRAINT enforce_dims_geom_3d CHECK ((st_ndims(geom) = 3)),
    CONSTRAINT enforce_srid_geom_wgs84 CHECK ((st_srid(geom) = 4326))
);

ALTER TABLE test.edge_test_polyline_3d_woc ADD CONSTRAINT pk_edge_test_polyline_3d_woc
	PRIMARY KEY (pk);

GRANT ALL ON test.edge_test_polyline_3d_woc TO glrw_test;
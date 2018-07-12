DROP TABLE IF EXISTS test.geometry_test_polygon_woc CASCADE;

CREATE TABLE test.geometry_test_polygon_woc (
    pk uuid NOT NULL,
    remarks varchar(200),
    geom geometry NOT NULL,
    CONSTRAINT enforce_dims_geom_2d CHECK (st_ndims(geom) = 2),
    CONSTRAINT enforce_geotype_geom_point CHECK (geometrytype(geom) = 'POLYGON'::text)
);

ALTER TABLE test.geometry_test_polygon_woc ADD CONSTRAINT pk_geometry_test_polygon_woc
	PRIMARY KEY (pk);

GRANT ALL ON test.geometry_test_polygon_woc TO glrw_test;
DROP TABLE IF EXISTS test.geometry_test_polygon_3d CASCADE;

CREATE TABLE test.geometry_test_polygon_3d (
    pk uuid NOT NULL,
    remarks varchar(200),
    geom geometry NOT NULL,
    CONSTRAINT enforce_dims_geom_2d CHECK ((st_ndims(geom) = 3)),
    CONSTRAINT enforce_geotype_geom_polygon CHECK ((geometrytype(geom) = 'POLYGON'::text)),
    CONSTRAINT enforce_srid_geom_wgs84 CHECK ((st_srid(geom) = 4326))
);

ALTER TABLE test.geometry_test_polygon_3d ADD CONSTRAINT pk_geometry_test_polygon_3d
	PRIMARY KEY (pk);

GRANT ALL ON test.geometry_test_polygon_3d TO glrw_test;
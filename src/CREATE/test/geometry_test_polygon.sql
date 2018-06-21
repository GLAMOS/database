DROP TABLE IF EXISTS test.geometry_test_polygon CASCADE;

CREATE TABLE test.geometry_test_polygon (
    pk uuid NOT NULL,
    remarks varchar(200),
    geom geometry NOT NULL,
    CONSTRAINT enforce_dims_geom_2d CHECK ((st_ndims(geom) = 2)),
    CONSTRAINT enforce_geotype_geom_point CHECK ((geometrytype(geom) = 'POLYGON'::text)),
    CONSTRAINT enforce_srid_geom_wgs84 CHECK ((st_srid(geom) = 4326))
);

ALTER TABLE test.geometry_test_polygon ADD CONSTRAINT pk_geometry_test_polygon
	PRIMARY KEY (pk);

GRANT ALL ON test.geometry_test_polygon TO glrw_test;
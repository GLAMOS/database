DROP TABLE IF EXISTS test.geometry_test_polyline CASCADE;

CREATE TABLE test.geometry_test_polyline (
    pk uuid NOT NULL,
    remarks varchar(200),
    geom geometry NOT NULL,
    CONSTRAINT enforce_dims_geom_2d CHECK ((st_ndims(geom) = 2)),
    CONSTRAINT enforce_geotype_geom_point CHECK ((geometrytype(geom) = 'LINESTRING'::text)),
    CONSTRAINT enforce_srid_geom_wgs84 CHECK ((st_srid(geom) = 4326))
);

ALTER TABLE test.geometry_test_polyline ADD CONSTRAINT pk_geometry_test_polyline
	PRIMARY KEY (pk);

GRANT ALL ON test.geometry_test_polyline TO glrw_test;
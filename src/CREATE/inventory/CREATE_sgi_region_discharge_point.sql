DROP TABLE IF EXISTS inventory.sgi_region_discharge_point CASCADE;

CREATE TABLE inventory.sgi_region_discharge_point (
    pk             uuid                   NOT NULL,
    geom           geometry(POINT, 4326)  NOT NULL, 
	gwlnr          varchar(20)            NOT NULL,
	measure        integer                NOT NULL,
	river_level_3  varchar(1)             NOT NULL,
	river_level_2  smallint               NOT NULL,
	river_level_1  smallint               NOT NULL,
	river_level_0  varchar(1)             NULL
);

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE inventory.sgi_region_discharge_point ADD CONSTRAINT uq_sgi_region_discharge_point_pk
	PRIMARY KEY (pk);
	
CREATE INDEX IXGEOM_sgi_region_discharge_point ON inventory.sgi_region_discharge_point 
	USING GIST (geom);

/* Create Foreign Key Constraints */

GRANT ALL ON inventory.sgi_region_discharge_point TO glrw;
GRANT SELECT ON inventory.sgi_region_discharge_point TO glro;
GRANT SELECT ON inventory.sgi_region_discharge_point TO gldirw;
GRANT SELECT ON inventory.sgi_region_discharge_point TO gldiro;
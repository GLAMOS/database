DROP TABLE IF EXISTS inventory.inventory_geometry CASCADE;

CREATE TABLE inventory.inventory_geometry (
    pk          uuid                     NOT NULL,
	fk_glacier  uuid                     NOT NULL,
	acquisition smallint                 NOT NULL,
	release     smallint                 NOT NULL,
    geom        geometry(POLYGON, 4326)  NOT NULL
);

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE inventory.inventory_geometry ADD CONSTRAINT uq_inventory_geometry_pk
	PRIMARY KEY (pk);
	
CREATE INDEX IXGEOM_inventory_geometry ON inventory.inventory_geometry 
	USING GIST (geom);
	
CREATE INDEX IXFK_inventory_geometry_glacier ON inventory.inventory_geometry (fk_glacier ASC);
	
/* Create Foreign Key Constraints */

ALTER TABLE inventory.inventory_geometry ADD CONSTRAINT "fk_glacier"
	FOREIGN KEY (fk_glacier) REFERENCES base_data.glacier (pk) ON DELETE Cascade ON UPDATE Cascade;
	
GRANT ALL ON inventory.inventory_geometry TO glrw;
GRANT SELECT ON inventory.inventory_geometry TO glro;
GRANT SELECT ON inventory.inventory_geometry TO gldirw;
GRANT SELECT ON inventory.inventory_geometry TO gldiro;
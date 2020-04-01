DROP TABLE IF EXISTS inventory.icedivides_geometry CASCADE;

CREATE TABLE inventory.icedivides_geometry (
    pk          	uuid                     NOT NULL,
	fk_glacier_A    uuid                     ,
	fk_glacier_A_sgi	varchar(8)				 NOT NULL,
	fk_glacier_B 	uuid					 ,
	fk_glacier_B_sgi	varchar(8)			 NOT NULL,
	acquisition     smallint                 NOT NULL,
	release     	smallint                 NOT NULL,
    geom        	geometry(LINESTRING, 4326)  NOT NULL
);

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE inventory.icedivides_geometry ADD CONSTRAINT uq_inventory_icedivides_geometry_pk
	PRIMARY KEY (pk);
	
CREATE INDEX IXGEOM_inventory_icedivides_geometry ON inventory.icedivides_geometry 
	USING GIST (geom);

/* Create Foreign Key Constraints */
ALTER TABLE inventory.inventory_geometry
    OWNER to gladmin;
GRANT ALL ON TABLE inventory.icedivides_geometry TO glrw;
GRANT ALL ON TABLE inventory.icedivides_geometry TO gladmin;
GRANT SELECT ON TABLE inventory.icedivides_geometry TO glro;
GRANT SELECT ON TABLE inventory.inventory_geometry TO gldiro;

GRANT ALL ON TABLE inventory.inventory_geometry TO gldirw;
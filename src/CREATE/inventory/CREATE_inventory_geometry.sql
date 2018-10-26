DROP TABLE IF EXISTS unconsolidated_deposit CASCADE;

CREATE TABLE unconsolidated_deposit (
    pk          uuid                     NOT NULL,
	pk_tlm      uuid                     NOT NULL,
	acquisition smallint                 NOT NULL,
	release     smallint                 NOT NULL,
    geom        geometry(POLYGON, 2056)  NOT NULL
);

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE unconsolidated_deposit ADD CONSTRAINT uq_unconsolidated_deposit_pk
	PRIMARY KEY (pk);
	
CREATE INDEX IXGEOM_unconsolidated_deposit ON unconsolidated_deposit 
	USING GIST (geom);

/* Create Foreign Key Constraints */
GRANT ALL ON unconsolidated_deposit TO glrw;
GRANT SELECT ON unconsolidated_deposit TO glro;
-- object: mass_balance.index_spatial_daily | type: TABLE --

/* Drop Tables */
-- DROP TABLE IF EXISTS mass_balance.index_spatial_daily CASCADE;

/* Create Tables */
CREATE TABLE mass_balance.index_spatial_daily 
(
	pk uuid NOT NULL,
	fk_glacier uuid NOT NULL,
	name varchar(50) NOT NULL,
	date date NOT NULL,
	latitude float,
	longitude float,
	altitude float,
	balance integer NOT NULL,
	accumulation integer NOT NULL,
	melt integer NOT NULL,
	fk_surface_type smallint NOT NULL,
	temperature float NOT NULL,
	precipitation float NOT NULL,
	reference text,
	investigator varchar(100),
	creation_date date
	
);

/* Create Primary Keys, Indexes, Uniques, Checks */
ALTER TABLE mass_balance.index_spatial_daily 
	ADD CONSTRAINT pk_index_spatial_daily PRIMARY KEY (pk)
;

ALTER TABLE mass_balance.index_daily 
	ADD CONSTRAINT uq_index_spatial_daily_pk UNIQUE (pk)
;

/* Create Foreign Key Constraints */
ALTER TABLE mass_balance.index_spatial_daily ADD CONSTRAINT
	"fk_glacier_daily_surface_type" FOREIGN KEY (fk_surface_type) REFERENCES mass_balance.surface_type
	(pk) ON DELETE No Action ON UPDATE no Action
;

ALTER TABLE mass_balance.index_spatial_daily ADD CONSTRAINT
	"fk_glacier_index_spatial_daily" FOREIGN KEY (fk_glacier) REFERENCES base_data.glacier
	(pk) ON DELETE No Action ON UPDATE no Action
;

ALTER TABLE mass_balance.index_spatial_daily
    OWNER to gladmin;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE mass_balance.index_spatial_daily TO gldirw;

GRANT ALL ON TABLE mass_balance.index_spatial_daily TO gladmin;

GRANT SELECT ON TABLE mass_balance.index_spatial_daily TO glporo;
-- object: mass_balance.glacier_seasonal_dem | type: TABLE --

/* Drop Tables */
-- DROP TABLE IF EXISTS mass_balance.glacier_seasonal_dem CASCADE;

/* Create Tables */
CREATE TABLE mass_balance.glacier_seasonal_dem 
(
	pk uuid NOT NULL,
	fk_glacier_seasonal uuid NOT NULL,
	date_from date NOT NULL,
	date_to date NOT NULL,
	dem raster,
	fk_mass_balance_type smallint NOT NULL,
	investigator varchar(100) NOT NULL,
	creation_date date NOT NULL,
	reference text NOT NULL
);

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE mass_balance.glacier_seasonal_dem 
	ADD CONSTRAINT pk_glacier_seasonal_dem PRIMARY KEY (pk)
;

ALTER TABLE mass_balance.glacier_seasonal_dem 
	ADD CONSTRAINT uq_glacier_seasonal_dem_pk UNIQUE (pk)
;

/* Create Foreign Key Constraints */

ALTER TABLE mass_balance.glacier_seasonal_dem ADD CONSTRAINT
	"FK_glacier_seasonal_dem_glacier" FOREIGN KEY (fk_glacier_seasonal) REFERENCES mass_balance.glacier_seasonal
	(pk) ON DELETE No Action ON UPDATE no Action
;

ALTER TABLE mass_balance.glacier_seasonal_dem
    OWNER to gladmin;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE mass_balance.glacier_seasonal_dem TO gldirw;

GRANT ALL ON TABLE mass_balance.glacier_seasonal_dem TO gladmin;

GRANT SELECT ON TABLE mass_balance.glacier_seasonal_dem TO glporo;
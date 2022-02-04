-- object: mass_balance.glacier_seasonal_grid_test | type: TABLE --

/* Drop Tables */
--DROP TABLE IF EXISTS mass_balance.glacier_seasonal_grid_test CASCADE;

/* Create Tables */
CREATE TABLE mass_balance.glacier_seasonal_grid_test 
(
	rid uuid NOT NULL,
	fk_glacier_seasonal uuid NOT NULL,
	date_from date NOT NULL,
	date_to date NOT NULL,
	mb_grid raster,
	fk_mass_balance_type smallint NOT NULL,
	fk_observation_type smallint NOT NULL,
	investigator varchar(100) NOT NULL,
	creation_date date NOT NULL,
	reference text NOT NULL
);

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE mass_balance.glacier_seasonal_grid_test 
	ADD CONSTRAINT pk_glacier_seasonal_grid_test PRIMARY KEY (pk)
;

ALTER TABLE mass_balance.glacier_seasonal_grid_test 
	ADD CONSTRAINT uq_glacier_seasonal_grid_test_pk UNIQUE (pk)
;

/* Create Foreign Key Constraints */

ALTER TABLE mass_balance.glacier_seasonal_grid_test ADD CONSTRAINT
	"FK_glacier_seasonal_grid_test_glacier" FOREIGN KEY (fk_glacier_seasonal) REFERENCES mass_balance.glacier_seasonal
	(pk) ON DELETE No Action ON UPDATE no Action
;

ALTER TABLE mass_balance.glacier_seasonal_grid_test ADD CONSTRAINT
	"FK_glacier_seasonal_grid_test_mass_balance_type" FOREIGN KEY (fk_mass_balance_type) REFERENCES mass_balance.mass_balance_type
	(pk) ON DELETE No Action ON UPDATE no Action
;

ALTER TABLE mass_balance.glacier_seasonal_grid_test ADD CONSTRAINT
	"FK_glacier_seasonal_grid_test_observation_type" FOREIGN KEY (fk_observation_type) REFERENCES mass_balance.observation_type
	(pk) ON DELETE No Action ON UPDATE no Action
;

ALTER TABLE mass_balance.glacier_seasonal_grid_test
    OWNER to gladmin;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE mass_balance.glacier_seasonal_grid_test TO gldirw;

GRANT ALL ON TABLE mass_balance.glacier_seasonal_grid_test TO gladmin;

GRANT SELECT ON TABLE mass_balance.glacier_seasonal_grid_test TO glporo;
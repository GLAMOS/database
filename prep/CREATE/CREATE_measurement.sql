-- object: mass_balance.measurement | type: TABLE --

/* Drop Tables */
-- DROP TABLE IF EXISTS mass_balance.measurement CASCADE;

/* Create Tables */
CREATE TABLE mass_balance.measurement 
(
	pk uuid NOT NULL,
	fk_index uuid NOT NULL,
	fk_observation_type smallint NOT NULL,
	date_from date NOT NULL,
	time_from time with time zone NOT NULL,
	date_to date NOT NULL,
	time_to time with time zone NOT NULL,
	fk_date_accuracy smallint NOT NULL,
	latitude numeric(12,10) NOT NULL,
	longitude numeric(12,10) NOT NULL,
	altitude numeric(6,2) NOT NULL,
	fk_position_accuracy smallint NOT NULL,
	density numeric(6,2) NOT NULL,
	fk_density_accuracy smallint NOT NULL,
	massbalance integer NOT NULL,
	fk_measurement_quality smallint NOT NULL,
	fk_measurement_type smallint NOT NULL,
	investigator varchar(100) NOT NULL,
	creation_date date NOT NULL,
	reference text NOT NULL
);

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE mass_balance.measurement 
	ADD CONSTRAINT pk_measurement PRIMARY KEY (pk)
;

ALTER TABLE mass_balance.measurement 
	ADD CONSTRAINT uq_measurement_pk UNIQUE (pk)
;

/* Create Foreign Key Constraints */

ALTER TABLE mass_balance.measurement ADD CONSTRAINT
	"FK_measurement_index" FOREIGN KEY (fk_index) REFERENCES mass_balance.index
	(pk) ON DELETE No Action ON UPDATE no Action
;

ALTER TABLE mass_balance.measurement ADD CONSTRAINT
	"FK_measurement_observation_type" FOREIGN KEY (fk_observation_type) REFERENCES mass_balance.observation_type
	(pk) ON DELETE No Action ON UPDATE no Action
;

ALTER TABLE mass_balance.measurement ADD CONSTRAINT
	"FK_measurement_date_accuracy" FOREIGN KEY (fk_date_accuracy) REFERENCES mass_balance.date_accuracy
	(pk) ON DELETE No Action ON UPDATE no Action
;

ALTER TABLE mass_balance.measurement ADD CONSTRAINT
	"FK_measurement_position_accuracy" FOREIGN KEY (fk_position_accuracy) REFERENCES mass_balance.position_accuracy
	(pk) ON DELETE No Action ON UPDATE no Action
;

ALTER TABLE mass_balance.measurement ADD CONSTRAINT
	"FK_measurement_density_accuracy" FOREIGN KEY (fk_density_accuracy) REFERENCES mass_balance.density_accuracy
	(pk) ON DELETE No Action ON UPDATE no Action
;

ALTER TABLE mass_balance.measurement ADD CONSTRAINT
	"FK_measurement_measurement_type" FOREIGN KEY (fk_measurement_type) REFERENCES mass_balance.measurement_type
	(pk) ON DELETE No Action ON UPDATE no Action
;

ALTER TABLE mass_balance.measurement ADD CONSTRAINT
	"FK_measurement_measurement_quality" FOREIGN KEY (fk_measurement_quality) REFERENCES mass_balance.measurement_quality
	(pk) ON DELETE No Action ON UPDATE no Action
;


ALTER TABLE mass_balance.measurement
    OWNER to gladmin;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE mass_balance.measurement TO gldirw;

GRANT ALL ON TABLE mass_balance.measurement TO gladmin;

GRANT SELECT ON TABLE mass_balance.measurement TO glporo;
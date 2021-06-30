-- object: mass_balance.point | type: TABLE --

/* Drop Tables */
DROP TABLE IF EXISTS mass_balance.point CASCADE;

/* Create Tables */
CREATE TABLE mass_balance.point 
(
	pk uuid NOT NULL,
	fk_glacier uuid NOT NULL,
	name varchar(50) NOT NULL,
	fk_observation_type smallint NOT NULL,
	date_from date,
	time_from time without time zone NOT NULL,
	date_to date NOT NULL,
	time_to time without time zone NOT NULL,
	fk_date_accuracy smallint NOT NULL,
	period numeric(10,2),
	latitude numeric(10,2) NOT NULL,
	longitude numeric(10,2) NOT NULL,
	altitude numeric(6,2) NOT NULL,
	fk_position_accuracy smallint NOT NULL,
	massbalance_raw integer NOT NULL,
	density numeric(6,2) NOT NULL,
	fk_density_accuracy smallint NOT NULL,
	massbalance_we integer NOT NULL,
	fk_measurement_quality smallint NOT NULL,
	fk_measurement_type smallint NOT NULL,
	massbalance_error integer NOT NULL,
	reading_error integer NOT NULL,
	density_error integer NOT NULL,
	source varchar(100) NOT NULL
);

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE mass_balance.point 
	ADD CONSTRAINT pk_point PRIMARY KEY (pk)
;

ALTER TABLE mass_balance.point 
	ADD CONSTRAINT uq_point_pk UNIQUE (pk)
;

/* Create Foreign Key Constraints */

ALTER TABLE mass_balance.point ADD CONSTRAINT
	"FK_point_glacier" FOREIGN KEY (fk_glacier) REFERENCES base_data.glacier
	(pk) ON DELETE No Action ON UPDATE no Action
;

ALTER TABLE mass_balance.point ADD CONSTRAINT
	"FK_point_observation_type" FOREIGN KEY (fk_observation_type) REFERENCES mass_balance.observation_type
	(pk) ON DELETE No Action ON UPDATE no Action
;

ALTER TABLE mass_balance.point ADD CONSTRAINT
	"FK_point_date_accuracy" FOREIGN KEY (fk_date_accuracy) REFERENCES mass_balance.date_accuracy
	(pk) ON DELETE No Action ON UPDATE no Action
;

ALTER TABLE mass_balance.point ADD CONSTRAINT
	"FK_point_position_accuracy" FOREIGN KEY (fk_position_accuracy) REFERENCES mass_balance.position_accuracy
	(pk) ON DELETE No Action ON UPDATE no Action
;

ALTER TABLE mass_balance.point ADD CONSTRAINT
	"FK_point_density_accuracy" FOREIGN KEY (fk_density_accuracy) REFERENCES mass_balance.density_accuracy
	(pk) ON DELETE No Action ON UPDATE no Action
;

ALTER TABLE mass_balance.point ADD CONSTRAINT
	"FK_point_measurement_type" FOREIGN KEY (fk_measurement_type) REFERENCES mass_balance.measurement_type
	(pk) ON DELETE No Action ON UPDATE no Action
;

ALTER TABLE mass_balance.point ADD CONSTRAINT
	"FK_point_measurement_quality" FOREIGN KEY (fk_measurement_quality) REFERENCES mass_balance.measurement_quality
	(pk) ON DELETE No Action ON UPDATE no Action
;


ALTER TABLE mass_balance.point
    OWNER to gladmin;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE mass_balance.point TO gldirw;

GRANT ALL ON TABLE mass_balance.point TO gladmin;

GRANT SELECT ON TABLE mass_balance.point TO glporo;
-- object: mass_balance.measurement_type | type: TABLE --

/* Drop Tables */
-- DROP TABLE IF EXISTS mass_balance.measurement_type CASCADE;

/* Create Tables */
CREATE TABLE mass_balance.measurement_type 
(
	pk smallint NOT NULL,
	name varchar(100) NOT NULL,
	description varchar(250) NOT NULL
);

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE mass_balance.measurement_type 
	ADD CONSTRAINT pk_measurement_type PRIMARY KEY (pk)
;

ALTER TABLE mass_balance.measurement_type 
	ADD CONSTRAINT uq_measurement_type_pk UNIQUE (pk)
;


ALTER TABLE mass_balance.measurement_type
    OWNER to gladmin;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE mass_balance.measurement_type TO gldirw;

GRANT ALL ON TABLE mass_balance.measurement_type TO gladmin;

GRANT SELECT ON TABLE mass_balance.measurement_type TO glporo;
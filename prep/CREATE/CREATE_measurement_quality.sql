-- object: mass_balance.measurement_quality | type: TABLE --

/* Drop Tables */
-- DROP TABLE IF EXISTS mass_balance.measurement_quality CASCADE;

/* Create Tables */
CREATE TABLE mass_balance.measurement_quality 
(
	pk smallint NOT NULL,
	name varchar(100) NOT NULL,
	description varchar(250) NOT NULL
);

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE mass_balance.measurement_quality 
	ADD CONSTRAINT pk_measurement_quality PRIMARY KEY (pk)
;

ALTER TABLE mass_balance.measurement_quality 
	ADD CONSTRAINT uq_measurement_quality_pk UNIQUE (pk)
;


ALTER TABLE mass_balance.measurement_quality
    OWNER to gladmin;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE mass_balance.measurement_quality TO gldirw;

GRANT ALL ON TABLE mass_balance.measurement_quality TO gladmin;

GRANT SELECT ON TABLE mass_balance.measurement_quality TO glporo;
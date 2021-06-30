-- object: mass_balance.observation_type | type: TABLE --

/* Drop Tables */
-- DROP TABLE IF EXISTS mass_balance.observation_type CASCADE;

/* Create Tables */
CREATE TABLE mass_balance.observation_type 
(
	pk smallint NOT NULL,
	name varchar(100) NOT NULL,
	description varchar(250) NOT NULL
);

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE mass_balance.observation_type 
	ADD CONSTRAINT pk_observation_type PRIMARY KEY (pk)
;

ALTER TABLE mass_balance.observation_type 
	ADD CONSTRAINT uq_observation_type_pk UNIQUE (pk)
;


ALTER TABLE mass_balance.observation_type
    OWNER to gladmin;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE mass_balance.observation_type TO gldirw;

GRANT ALL ON TABLE mass_balance.observation_type TO gladmin;

GRANT SELECT ON TABLE mass_balance.observation_type TO glporo;
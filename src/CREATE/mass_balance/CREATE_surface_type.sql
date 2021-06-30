-- object: mass_balance.surface_type | type: TABLE --

/* Drop Tables */
-- DROP TABLE IF EXISTS mass_balance.surface_type CASCADE;

/* Create Tables */
CREATE TABLE mass_balance.surface_type 
(
	pk smallint NOT NULL,
	name varchar(100) NOT NULL,
	description varchar(250)
);

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE mass_balance.surface_type 
	ADD CONSTRAINT pk_surface_type PRIMARY KEY (pk)
;

ALTER TABLE mass_balance.surface_type 
	ADD CONSTRAINT uq_surface_type_pk UNIQUE (pk)
;


ALTER TABLE mass_balance.surface_type
    OWNER to gladmin;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE mass_balance.surface_type TO gldirw;

GRANT ALL ON TABLE mass_balance.surface_type TO gladmin;

GRANT SELECT ON TABLE mass_balance.surface_type TO glporo;
-- object: mass_balance.value_type | type: TABLE --

/* Drop Tables */
-- DROP TABLE IF EXISTS mass_balance.value_type CASCADE;

/* Create Tables */
CREATE TABLE mass_balance.value_type 
(
	pk smallint NOT NULL,
	name varchar(100) NOT NULL,
	description varchar(250),
	fk_mass_balance_type smallint NOT NULL
);

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE mass_balance.value_type 
	ADD CONSTRAINT pk_value_type PRIMARY KEY (pk)
;

ALTER TABLE mass_balance.value_type 
	ADD CONSTRAINT uq_value_type_pk UNIQUE (pk)
;

ALTER TABLE mass_balance.value_type 
	ADD CONSTRAINT uq_value_type_name UNIQUE (name)
;

CREATE INDEX "IXFK_mass_balance_value_type" ON mass_balance.value_type (fk_mass_balance_type ASC)
;

/* Create Foreign Key Constraints */

ALTER TABLE mass_balance.value_type ADD CONSTRAINT
	"FK_mass_balance_value_type" FOREIGN KEY (fk_mass_balance_type) REFERENCES mass_balance.mass_balance_type
	(pk) ON DELETE No Action ON UPDATE no Action
;


ALTER TABLE mass_balance.value_type
    OWNER to gladmin;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE mass_balance.value_type TO gldirw;

GRANT ALL ON TABLE mass_balance.value_type TO gladmin;

GRANT SELECT ON TABLE mass_balance.value_type TO glporo;
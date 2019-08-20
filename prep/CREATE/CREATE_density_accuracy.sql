-- object: mass_balance.density_accuracy | type: TABLE --

/* Drop Tables */
-- DROP TABLE IF EXISTS mass_balance.density_accuracy CASCADE;

/* Create Tables */
CREATE TABLE mass_balance.density_accuracy 
(
	pk smallint NOT NULL,
	name varchar(100) NOT NULL,
	description varchar(250) NOT NULL
);

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE mass_balance.density_accuracy 
	ADD CONSTRAINT pk_density_accuracy PRIMARY KEY (pk)
;

ALTER TABLE mass_balance.density_accuracy 
	ADD CONSTRAINT uq_density_accuracy_pk UNIQUE (pk)
;


ALTER TABLE mass_balance.density_accuracy
    OWNER to gladmin;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE mass_balance.density_accuracy TO gldirw;

GRANT ALL ON TABLE mass_balance.density_accuracy TO gladmin;

GRANT SELECT ON TABLE mass_balance.density_accuracy TO glporo;
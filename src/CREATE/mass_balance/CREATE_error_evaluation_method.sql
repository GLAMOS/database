-- object: mass_balance.error_evaluation_method | type: TABLE --

/* Drop Tables */
-- DROP TABLE IF EXISTS mass_balance.error_evaluation_method CASCADE;

/* Create Tables */
CREATE TABLE mass_balance.error_evaluation_method 
(
	pk smallint NOT NULL,
	name varchar(100) NOT NULL,
	description varchar(250) NOT NULL
);

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE mass_balance.error_evaluation_method 
	ADD CONSTRAINT pk_error_evaluation_method PRIMARY KEY (pk)
;

ALTER TABLE mass_balance.error_evaluation_method 
	ADD CONSTRAINT uq_error_evaluation_method_pk UNIQUE (pk)
;


ALTER TABLE mass_balance.error_evaluation_method
    OWNER to gladmin;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE mass_balance.error_evaluation_method TO gldirw;

GRANT ALL ON TABLE mass_balance.error_evaluation_method TO gladmin;

GRANT SELECT ON TABLE mass_balance.error_evaluation_method TO glporo;
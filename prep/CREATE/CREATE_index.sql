-- object: mass_balance.index | type: TABLE --

/* Drop Tables */
-- DROP TABLE IF EXISTS mass_balance.index CASCADE;

/* Create Tables */
CREATE TABLE mass_balance.index 
(
	pk uuid NOT NULL,
	fk_glacier uuid NOT NULL, 
	name text NOT NULL,
	description text
);

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE mass_balance.index 
	ADD CONSTRAINT pk_index PRIMARY KEY (pk)
;

ALTER TABLE mass_balance.index 
	ADD CONSTRAINT uq_index_pk UNIQUE (pk)
;

ALTER TABLE mass_balance.index 
	ADD CONSTRAINT uq_index_name UNIQUE (name)
;

ALTER TABLE mass_balance.index ADD CONSTRAINT "FK_index_glacier" 
	FOREIGN KEY (fk_glacier) REFERENCES base_data.glacier (pk) ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE mass_balance.index
    OWNER to gladmin;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE mass_balance.index TO gldirw;

GRANT ALL ON TABLE mass_balance.index TO gladmin;

GRANT SELECT ON TABLE mass_balance.index TO glporo;
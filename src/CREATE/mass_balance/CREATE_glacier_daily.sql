-- object: mass_balance.glacier_daily | type: TABLE --

/* Drop Tables */
-- DROP TABLE IF EXISTS mass_balance.glacier_daily CASCADE;

/* Create Tables */
CREATE TABLE mass_balance.glacier_daily 
(
	pk uuid NOT NULL,
	fk_glacier uuid NOT NULL,
	date date NOT NULL,
	balance integer NOT NULL,
	accumulation integer NOT NULL,
	melt integer NOT NULL,
	investigator varchar(100) NOT NULL,
	creation_date date NOT NULL,
	reference text NOT NULL
);

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE mass_balance.glacier_daily 
	ADD CONSTRAINT pk_glacier_daily PRIMARY KEY (pk)
;

ALTER TABLE mass_balance.glacier_daily 
	ADD CONSTRAINT uq_glacier_daily_pk UNIQUE (pk)
;

/* Create Foreign Key Constraints */

ALTER TABLE mass_balance.glacier_daily ADD CONSTRAINT
	"FK_glacier_daily_glacier" FOREIGN KEY (fk_glacier) REFERENCES base_data.glacier
	(pk) ON DELETE No Action ON UPDATE no Action
;

ALTER TABLE mass_balance.glacier_daily
    OWNER to gladmin;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE mass_balance.glacier_daily TO gldirw;

GRANT ALL ON TABLE mass_balance.glacier_daily TO gladmin;

GRANT SELECT ON TABLE mass_balance.glacier_daily TO glporo;
-- object: mass_balance.index_daily | type: TABLE --

/* Drop Tables */
-- DROP TABLE IF EXISTS mass_balance.index_daily CASCADE;

/* Create Tables */
CREATE TABLE mass_balance.index_daily 
(
	pk uuid NOT NULL,
	fk_index uuid NOT NULL,
	date date NOT NULL,
	latitude numeric(12,10) NOT NULL,
	longitude numeric(12,10) NOT NULL,
	altitude numeric(6,2) NOT NULL,
	balance integer NOT NULL,
	accumulation integer NOT NULL,
	melt integer NOT NULL,
	reference text NOT NULL,
	investigator varchar(100) NOT NULL,
	creation_date date NOT NULL,
	fk_surface_type smallint NOT NULL
);

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE mass_balance.index_daily 
	ADD CONSTRAINT pk_index_daily PRIMARY KEY (pk)
;

ALTER TABLE mass_balance.index_daily 
	ADD CONSTRAINT uq_index_daily_pk UNIQUE (pk)
;

/* Create Foreign Key Constraints */

ALTER TABLE mass_balance.index_daily ADD CONSTRAINT
	"FK_index_daily_surface_type" FOREIGN KEY (fk_surface_type) REFERENCES mass_balance.surface_type
	(pk) ON DELETE No Action ON UPDATE no Action
;

ALTER TABLE mass_balance.index_daily ADD CONSTRAINT
	"FK_index_daily_index" FOREIGN KEY (fk_index) REFERENCES mass_balance.index
	(pk) ON DELETE No Action ON UPDATE no Action
;

ALTER TABLE mass_balance.index_daily
    OWNER to gladmin;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE mass_balance.index_daily TO gldirw;

GRANT ALL ON TABLE mass_balance.index_daily TO gladmin;

GRANT SELECT ON TABLE mass_balance.index_daily TO glporo;
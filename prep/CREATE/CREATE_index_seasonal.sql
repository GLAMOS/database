-- object: mass_balance.index_seasonal | type: TABLE --

/* Drop Tables */
-- DROP TABLE IF EXISTS mass_balance.index_seasonal CASCADE;

/* Create Tables */
CREATE TABLE mass_balance.index_seasonal 
(
	pk uuid NOT NULL,
	fk_index uuid NOT NULL,
	date_from date NOT NULL,
	date_to date NOT NULL,
	latitude numeric(12,10) NOT NULL,
	longitude numeric(12,10) NOT NULL,
	altitude numeric(6,2) NOT NULL,
	massbalance integer NOT NULL,
	investigator varchar(100) NOT NULL,
	creation_date date NOT NULL,
	reference text NOT NULL,
	fk_value_type smallint NOT NULL,
	fk_analysis_method_type smallint NOT NULL
);

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE mass_balance.index_seasonal 
	ADD CONSTRAINT pk_index_seasonal PRIMARY KEY (pk)
;

ALTER TABLE mass_balance.index_seasonal 
	ADD CONSTRAINT uq_index_seasonal_pk UNIQUE (pk)
;

/* Create Foreign Key Constraints */

ALTER TABLE mass_balance.index_seasonal ADD CONSTRAINT
	"FK_index_seasonal_value_type" FOREIGN KEY (fk_value_type) REFERENCES mass_balance.value_type
	(pk) ON DELETE No Action ON UPDATE no Action
;

ALTER TABLE mass_balance.index_seasonal ADD CONSTRAINT
	"FK_index_seasonal_analysis_method_type" FOREIGN KEY (fk_analysis_method_type) REFERENCES mass_balance.analysis_method_type
	(pk) ON DELETE No Action ON UPDATE no Action
;

ALTER TABLE mass_balance.index_seasonal ADD CONSTRAINT
	"FK_index_daily_index" FOREIGN KEY (fk_index) REFERENCES mass_balance.index
	(pk) ON DELETE No Action ON UPDATE no Action
;

ALTER TABLE mass_balance.index_seasonal
    OWNER to gladmin;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE mass_balance.index_seasonal TO gldirw;

GRANT ALL ON TABLE mass_balance.index_seasonal TO gladmin;

GRANT SELECT ON TABLE mass_balance.index_seasonal TO glporo;
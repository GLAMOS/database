-- object: mass_balance.index_seasonal_with_comments | type: TABLE --

/* Drop Tables */
-- DROP TABLE IF EXISTS mass_balance.index_seasonal_with_comments CASCADE;

/* Create Tables */
CREATE TABLE mass_balance.index_seasonal_with_comments 
(
	pk uuid NOT NULL,
	fk_glacier uuid NOT NULL,
	fk_embargo_type smallint NOT NULL,
	fk_analysis_method_type smallint NOT NULL,
	name varchar(50) NOT NULL,
	date_from_annual date NOT NULL,
	date_to_annual date NOT NULL,
	date_from_winter date NOT NULL,
	date_to_winter date NOT NULL,
	date_fall_min date NOT NULL,
	date_spring_max date NOT NULL,
	latitude numeric(9,2) NOT NULL,
	longitude numeric(9,2) NOT NULL,
	altitude numeric(6,2) NOT NULL,
	b_w_meas integer NOT NULL, /* date_from_winter to date_to_winter */
	b_a_meas integer NOT NULL, /* date_from_winter to date_to_annual */
	c_w_obs integer NOT NULL, /* date_from_annual to date_to_winter */
	c_a_obs integer NOT NULL, /* date_from_annual to date_to_annual */
	a_w_obs integer NOT NULL, /* date_from_annual to date_to_winter */
	a_a_obs integer NOT NULL, /* date_from_annual to date_to_annual */
	b_w_fix integer NOT NULL, /* Hydrological year: 1.Oct to 30. April */
	b_a_fix integer NOT NULL, /* Hydrological year: 1.Oct to 30. April */
	c_w_fix integer NOT NULL, /* Hydrological year: 1.Oct to 30. April */
	c_a_fix integer NOT NULL, /* Hydrological year: 1.Oct to 30. April */
	a_w_fix integer NOT NULL, /* Hydrological year: 1.Oct to 30. April */
	a_a_fix integer NOT NULL, /* Hydrological year: 1.Oct to 30. April */
	investigator varchar(100),
	reference text NOT NULL
);

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE mass_balance.index_seasonal_with_comments 
	ADD CONSTRAINT pk_index_seasonal_with_comments PRIMARY KEY (pk)
;

ALTER TABLE mass_balance.index_seasonal_with_comments 
	ADD CONSTRAINT uq_index_seasonal_with_comments_pk UNIQUE (pk)
;

/* Create Foreign Key Constraints */

ALTER TABLE mass_balance.index_seasonal_with_comments ADD CONSTRAINT
	"fk_mass_balance_period_data_embargo_type" FOREIGN KEY (fk_embargo_type) REFERENCES administration.data_embargo_type
	(pk) ON DELETE No Action ON UPDATE no Action
;

ALTER TABLE mass_balance.index_seasonal_with_comments ADD CONSTRAINT
	"FK_index_seasonal_analysis_method_type" FOREIGN KEY (fk_analysis_method_type) REFERENCES mass_balance.analysis_method_type
	(pk) ON DELETE No Action ON UPDATE no Action
;

ALTER TABLE mass_balance.index_seasonal_with_comments ADD CONSTRAINT
	"fk_glacier_index_seasonal" FOREIGN KEY (fk_glacier) REFERENCES base_data.glacier
	(pk) ON DELETE No Action ON UPDATE no Action
;

ALTER TABLE mass_balance.index_seasonal_with_comments
    OWNER to gladmin;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE mass_balance.index_seasonal_with_comments TO gldirw;

GRANT ALL ON TABLE mass_balance.index_seasonal_with_comments TO gladmin;

GRANT SELECT ON TABLE mass_balance.index_seasonal_with_comments TO glporo;
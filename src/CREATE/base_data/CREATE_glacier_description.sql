DROP TABLE IF EXISTS base_data.glacier_description CASCADE
;

/* Create Tables */

CREATE TABLE base_data.glacier_description
(
	pk uuid NOT NULL,
	fk_glacier uuid NOT NULL,
	fk_language_type varchar(2) NOT NULL,
	fk_glacier_description_type smallint NOT NULL,
	description text NOT NULL
);

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE base_data.glacier_description ADD CONSTRAINT pk_glacier_description
	PRIMARY KEY (pk);

ALTER TABLE base_data.glacier_description 
  ADD CONSTRAINT uq_glacier_description_pk UNIQUE (pk);

CREATE INDEX "IXFK_glacier_description_language_type" ON base_data.glacier_description (fk_language_type ASC);

CREATE INDEX "IXFK_glacier_description_glacier" ON base_data.glacier_description (fk_glacier ASC);

CREATE INDEX ixfk_glacier_description_type ON base_data.glacier_description (fk_glacier_description_type ASC);

/* Create Foreign Key Constraints */

ALTER TABLE base_data.glacier_description ADD CONSTRAINT "FK_language_type"
	FOREIGN KEY (fk_language_type) REFERENCES administration.language_type (pk) ON DELETE No Action ON UPDATE No Action;

ALTER TABLE base_data.glacier_description ADD CONSTRAINT "FK_glacier_description_glacier"
	FOREIGN KEY (fk_glacier) REFERENCES base_data.glacier (pk) ON DELETE No Action ON UPDATE No Action;

ALTER TABLE base_data.glacier_description ADD CONSTRAINT fk_glacier_description_type
	FOREIGN KEY (fk_glacier_description_type) REFERENCES base_data.glacier_description_type (pk) ON DELETE No Action ON UPDATE No Action;

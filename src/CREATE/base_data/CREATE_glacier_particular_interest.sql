DROP TABLE IF EXISTS base_data.glacier_particular_interest CASCADE
;

/* Create Tables */

CREATE TABLE base_data.glacier_particular_interest
(
	pk uuid NOT NULL,
	fk_glacier uuid NOT NULL,
	fk_glacier_particular_interest_type smallint NOT NULL
);

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE base_data.glacier_particular_interest ADD CONSTRAINT pk_glacier_particular_interest
	PRIMARY KEY (pk);

ALTER TABLE base_data.glacier_particular_interest 
  ADD CONSTRAINT uq_glacier_particular_interest_pk UNIQUE (pk);

CREATE INDEX "IXFK_glacier_particular_interest_type" ON base_data.glacier_particular_interest (fk_glacier_particular_interest_type ASC);


/* Create Foreign Key Constraints */

ALTER TABLE base_data.glacier_particular_interest ADD CONSTRAINT "FK_glacier_particular_interest_type"
	FOREIGN KEY (fk_glacier_particular_interest_type) REFERENCES base_data.glacier_particular_interest_type (pk) ON DELETE No Action ON UPDATE No Action;

ALTER TABLE base_data.glacier_particular_interest ADD CONSTRAINT "FK_glacier_glacier"
	FOREIGN KEY (fk_glacier) REFERENCES base_data.glacier (pk) ON DELETE No Action ON UPDATE No Action;


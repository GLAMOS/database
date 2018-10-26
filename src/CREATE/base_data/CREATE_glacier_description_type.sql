DROP TABLE IF EXISTS base_data.glacier_description_type CASCADE
;

/* Create Tables */

CREATE TABLE base_data.glacier_description_type
(
	pk smallint NOT NULL,
	short_name varchar(100) NOT NULL,
	description varchar(250) NOT NULL
)
;

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE base_data.glacier_description_type ADD CONSTRAINT "pk_glacier_description_type"
	PRIMARY KEY (pk)
;

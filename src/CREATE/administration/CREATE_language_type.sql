DROP TABLE IF EXISTS administration.language_type CASCADE
;

/* Create Tables */

CREATE TABLE administration.language_type
(
	pk varchar(2) NOT NULL,
	short_name varchar(100) NOT NULL,
	description varchar(250) NOT NULL
)
;

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE administration.language_type ADD CONSTRAINT "pk_language_type"
	PRIMARY KEY (pk)
;

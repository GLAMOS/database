/* ---------------------------------------------------- */
/*  Generated by Enterprise Architect Version 14.0 		*/
/*  Created On : 14-Sep-2018 13:42:09 				*/
/*  DBMS       : PostgreSQL 						*/
/* ---------------------------------------------------- */

/* Drop Tables */

DROP TABLE IF EXISTS base_data.object_type CASCADE
;

/* Create Tables */

CREATE TABLE base_data.object_type
(
	pk integer NOT NULL,
	short_name varchar(50) NOT NULL,
	description text NULL
)
;

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE base_data.object_type ADD CONSTRAINT "PK_object_type"
	PRIMARY KEY (pk)
;

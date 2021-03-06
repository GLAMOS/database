/* ---------------------------------------------------- */
/*  Generated by Enterprise Architect Version 14.0 		*/
/*  Created On : 02-Aug-2018 16:40:47 				*/
/*  DBMS       : PostgreSQL 						*/
/* ---------------------------------------------------- */

/* Drop Tables */

DROP TABLE IF EXISTS administration.height_capture_method_type CASCADE
;

/* Create Tables */

CREATE TABLE administration.height_capture_method_type
(
	pk smallint NOT NULL,
	short_name varchar(100) NOT NULL,
	description varchar(250) NOT NULL
)
;

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE administration.height_capture_method_type ADD CONSTRAINT "PK_height_capture_method_type"
	PRIMARY KEY (pk)
;

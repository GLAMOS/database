/* ---------------------------------------------------- */
/*  Generated by Elias Hodel                 		*/
/*  Created On : 21.02.2020          				*/
/*  DBMS       : PostgreSQL, GLAMOS-DB				*/
/* ---------------------------------------------------- */


DROP TABLE IF EXISTS glacier_hazard.event2geometries CASCADE
;

/* Create Tables */

CREATE TABLE glacier_hazard.event2geometries
(
	fk_event uuid NOT NULL,
	fk_geometries uuid NOT NULL

);

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE glacier_hazard.event2geometries ADD CONSTRAINT pk_event2geometries
	PRIMARY KEY (fk_event,fk_geometries);

ALTER TABLE glacier_hazard.event2geometries 
  ADD CONSTRAINT uq_event2geometries_pk UNIQUE (fk_event,fk_geometries);
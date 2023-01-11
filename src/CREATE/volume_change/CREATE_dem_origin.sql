/* Drop Tables */

-- DROP TABLE IF EXISTS volume_change.dem_origin CASCADE;

/* Create Tables */

CREATE TABLE volume_change.dem_origin
(
	pk integer NOT NULL,
	name varchar(50) NOT NULL
	
)
;

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE volume_change.dem_origin ADD CONSTRAINT "PK_object_type"
	PRIMARY KEY (pk)
;

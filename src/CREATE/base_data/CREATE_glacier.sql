/* ------------------------------------ */
/*  GLAMOS, Yvo Weidmann         		*/
/*  Created On : 05-Mai-2018 10:06:20   */
/*  DBMS       : PostgreSQL 			*/
/* ------------------------------------ */

/* Drop Tables */

DROP TABLE IF EXISTS base_data.glacier CASCADE
;

/* Create Tables */

CREATE TABLE base_data.glacier
(
	pk uuid NOT NULL,
	pk_vaw integer NULL,
	pk_wgms varchar(14) NULL,
	name_short varchar(20) NULL,
	name varchar(256) NULL,
	name_vaw varchar(256) NULL,
	name_tlm varchar(256) NULL,
	river_level_3 varchar(1) NOT NULL,
	river_level_2 smallint NOT NULL,
	river_level_1 smallint NOT NULL,
	river_level_0 varchar(1) NULL,
	inventory_code smallint NOT NULL,
	latitude numeric(12,10) NOT NULL,
	longitude numeric(12,10) NOT NULL
)
TABLESPACE	vector
;

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE base_data.glacier ADD CONSTRAINT pk_glacier
	PRIMARY KEY (pk)
;

ALTER TABLE base_data.glacier 
  ADD CONSTRAINT uq_glacier_pk UNIQUE (pk)
;

ALTER TABLE base_data.glacier 
  ADD CONSTRAINT uq_glacier_pk_vaw UNIQUE (pk_vaw)
;

ALTER TABLE base_data.glacier 
  ADD CONSTRAINT uq_glacier_pk_wgms UNIQUE (pk_wgms)
;

CREATE INDEX ix_glacier_pk_vaw ON base_data.glacier (pk_vaw ASC)
;

CREATE INDEX ix_glacier_name ON base_data.glacier (name ASC)
;

CREATE INDEX ix_glacier_latitude ON base_data.glacier (latitude ASC)
;

CREATE INDEX ix_glacier_longitude ON base_data.glacier (longitude ASC)
;

CREATE INDEX ix_glacier_river_level_3 ON base_data.glacier (river_level_3 ASC)
;

CREATE INDEX ix_glacier_river_level_2 ON base_data.glacier (river_level_2 ASC)
;

CREATE INDEX ix_glacier_river_level_1 ON base_data.glacier (river_level_1 ASC)
;

CREATE INDEX ix_glacier_river_level_0 ON base_data.glacier (river_level_0 ASC)
;

CREATE INDEX ix_glacier_inventory_code ON base_data.glacier (inventory_code ASC)
;

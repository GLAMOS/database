/* ---------------------------------------------------- */
/*  Generated by Enterprise Architect Version 14.0 		*/
/*  Created On : 17-Aug-2018 15:35:09 				*/
/*  DBMS       : PostgreSQL 						*/
/* ---------------------------------------------------- */

/* Drop Tables */

DROP TABLE IF EXISTS inventory.sgi_region CASCADE
;

/* Create Tables */

CREATE TABLE inventory.sgi_region
(
	pk uuid NOT NULL,
	gwlnr varchar(12) NOT NULL,
	measure integer NOT NULL,
	river_level_3 varchar(1) NOT NULL,
	river_level_2 smallint NOT NULL,
	river_level_1 smallint NOT NULL,
	river_level_0 varchar(1) NULL,
	geom geometry(POLYGON, 4326) NOT NULL
)
;

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE inventory.sgi_region ADD CONSTRAINT "PK_sgi_region"
	PRIMARY KEY (pk)
;


CREATE INDEX IXFK_sgi_region_pk ON inventory.sgi_region (pk ASC);

CREATE INDEX IXFK_sgi_region_river_level_3 ON inventory.sgi_region (river_level_3 ASC);
CREATE INDEX IXFK_sgi_region_river_level_2 ON inventory.sgi_region (river_level_2 ASC);
CREATE INDEX IXFK_sgi_region_river_level_1 ON inventory.sgi_region (river_level_1 ASC);
CREATE INDEX IXFK_sgi_region_river_level_0 ON inventory.sgi_region (river_level_0 ASC);

CREATE INDEX IXGEOM_sgi_region_geometry ON inventory.sgi_region 
	USING GIST (geom);

GRANT ALL ON inventory.sgi_region TO glrw;
GRANT SELECT ON inventory.sgi_region TO glro;
GRANT SELECT ON inventory.sgi_region TO gldirw;
GRANT SELECT ON inventory.sgi_region TO gldiro;
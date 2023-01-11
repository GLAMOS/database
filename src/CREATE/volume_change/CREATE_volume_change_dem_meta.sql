-- Table: volume_change.dem_meta

-- DROP TABLE volume_change.dem_meta;

CREATE TABLE volume_change.dem_meta
(
    fk_glacier uuid NOT NULL,
	filename varchar(100),
    year integer NOT NULL,
    date date,
    spatial_resolution integer NOT NULL,
    crs_v character varying COLLATE pg_catalog."default" NOT NULL,
    crs_h character varying COLLATE pg_catalog."default" NOT NULL,
    fk_origin integer NOT NULL,
    CONSTRAINT dem_meta_pkey PRIMARY KEY (filename)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE volume_change.dem_meta
    OWNER to gladmin;
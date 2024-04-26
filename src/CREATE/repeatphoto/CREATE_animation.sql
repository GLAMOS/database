-- Table: repeatphoto.animation

-- DROP TABLE repeatphoto.animation;

CREATE TABLE repeatphoto.animation
(
    pk uuid NOT NULL,
	fk_location uuid,
    name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    year_start smallint NOT NULL,
    year_end smallint NOT NULL,
    view_direction smallint NOT NULL,
    filename character varying(50) COLLATE pg_catalog."default",
    source character varying(100) COLLATE pg_catalog."default",
    copyright character varying(100) COLLATE pg_catalog."default",
	license character varying(100) COLLATE pg_catalog."default",

    CONSTRAINT pk PRIMARY KEY (pk),
    CONSTRAINT fk_location FOREIGN KEY (fk_location)
        REFERENCES repeatphoto.location (pk) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE repeatphoto.animation
    OWNER to gladmin;
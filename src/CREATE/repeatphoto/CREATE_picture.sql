-- Table: repeatphoto.picture

-- DROP TABLE repeatphoto.picture;

CREATE TABLE repeatphoto.picture
(
    pk uuid NOT NULL,
	fk_location uuid,
    name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    year_taken smallint NOT NULL,
    date_taken date,
    view_direction smallint NOT NULL,
    photographer character varying(100) COLLATE pg_catalog."default",
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

ALTER TABLE repeatphoto.picture
    OWNER to gladmin;
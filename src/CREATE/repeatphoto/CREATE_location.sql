-- Table: repeatphoto.location

-- DROP TABLE repeatphoto.location;

CREATE TABLE repeatphoto.location
(
    pk uuid NOT NULL,
    name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    x_lv95 numeric(9,2) NOT NULL,
    y_lv95 numeric(9,2),
    z_ln02 smallint,
    accuracy smallint NOT NULL,
    programm character varying(50) COLLATE pg_catalog."default",
    CONSTRAINT location_pkey PRIMARY KEY (pk)
)

TABLESPACE pg_default;

ALTER TABLE repeatphoto.location
    OWNER to gladmin;
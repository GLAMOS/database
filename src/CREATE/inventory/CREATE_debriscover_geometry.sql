-- Table: inventory.debriscover_geometry

-- DROP TABLE inventory.debriscover_geometry;

CREATE TABLE inventory.debriscover_geometry
(
    pk uuid NOT NULL,
    fk_glacier uuid,
    acquisition smallint NOT NULL,
    release smallint NOT NULL,
    geom geometry(Polygon,4326) NOT NULL,
    fk_data_embargo_type smallint NOT NULL,
    CONSTRAINT uq_debriscover_geometry_pk PRIMARY KEY (pk),
    CONSTRAINT fk_data_embargo_type FOREIGN KEY (fk_data_embargo_type)
        REFERENCES administration.data_embargo_type (pk) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_glacier FOREIGN KEY (fk_glacier)
        REFERENCES base_data.glacier (pk) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE inventory.debriscover_geometry
    OWNER to gladmin;

GRANT ALL ON TABLE inventory.debriscover_geometry TO gladmin;

GRANT SELECT ON TABLE inventory.debriscover_geometry TO gldiro;

GRANT SELECT ON TABLE inventory.debriscover_geometry TO gldirw;

GRANT SELECT ON TABLE inventory.debriscover_geometry TO glro;

GRANT ALL ON TABLE inventory.debriscover_geometry TO glrw;

-- Index: fki2_fk_data_embargo_type

-- DROP INDEX inventory.fki2_fk_data_embargo_type;

CREATE INDEX fki2_fk_data_embargo_type
    ON inventory.debriscover_geometry USING btree
    (fk_data_embargo_type)
    TABLESPACE pg_default;

-- Index: ixfk_debriscover_geometry_glacier

-- DROP INDEX inventory.ixfk_debriscover_geometry_glacier;

CREATE INDEX ixfk_debriscover_geometry_glacier
    ON inventory.debriscover_geometry USING btree
    (fk_glacier)
    TABLESPACE pg_default;

-- Index: ixgeom_debriscover_geometry

-- DROP INDEX inventory.ixgeom_debriscover_geometry;

CREATE INDEX ixgeom_debriscover_geometry
    ON inventory.debriscover_geometry USING gist
    (geom)
    TABLESPACE pg_default;
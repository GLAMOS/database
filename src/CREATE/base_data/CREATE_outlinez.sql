-- Table: base_data.outlinez

-- DROP TABLE base_data.outlinez;

CREATE TABLE base_data.outlinez
(
    pk uuid NOT NULL,
    fk_glacier uuid NOT NULL,
    fk_observer uuid NOT NULL,
    fk_object_origin_type integer NOT NULL,
    fk_position_capture_method_type integer NOT NULL,
    fk_height_capture_method_type integer NOT NULL,
    fk_object_type integer NOT NULL,
    geom geometry(LineStringZ,4326) NOT NULL,
    measure_date date NOT NULL,
    CONSTRAINT "PK_outlineZ" PRIMARY KEY (pk),
    CONSTRAINT "FK_outlineZ_glacier" FOREIGN KEY (fk_glacier)
        REFERENCES base_data.glacier (pk) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT "FK_outlineZ_height_capture_method_type" FOREIGN KEY (fk_height_capture_method_type)
        REFERENCES administration.height_capture_method_type (pk) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "FK_outlineZ_object_origin_type" FOREIGN KEY (fk_object_origin_type)
        REFERENCES administration.object_origin_type (pk) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT "FK_outlineZ_object_type" FOREIGN KEY (fk_object_type)
        REFERENCES base_data.object_type (pk) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT "FK_outlineZ_observer" FOREIGN KEY (fk_observer)
        REFERENCES administration.observer (pk) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT "FK_outlineZ_position_capture_method_type" FOREIGN KEY (fk_position_capture_method_type)
        REFERENCES administration.position_capture_method_type (pk) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE base_data.outlinez
    OWNER to gladmin;

GRANT ALL ON TABLE base_data.outlinez TO gladmin;

GRANT SELECT ON TABLE base_data.outlinez TO gldiro;

GRANT SELECT ON TABLE base_data.outlinez TO gldirw;

GRANT SELECT ON TABLE base_data.outlinez TO glro;

GRANT ALL ON TABLE base_data.outlinez TO glrw;

-- Index: IXFK_outlineZ_glacier

-- DROP INDEX base_data."IXFK_outlineZ_glacier";

CREATE INDEX "IXFK_outlineZ_glacier"
    ON base_data.outlinez USING btree
    (fk_glacier)
    TABLESPACE pg_default;

-- Index: IXFK_outlineZ_height_capture_method_type

-- DROP INDEX base_data."IXFK_outlineZ_height_capture_method_type";

CREATE INDEX "IXFK_outlineZ_height_capture_method_type"
    ON base_data.outlinez USING btree
    (fk_height_capture_method_type)
    TABLESPACE pg_default;

-- Index: IXFK_outlineZ_object_origin_type

-- DROP INDEX base_data."IXFK_outlineZ_object_origin_type";

CREATE INDEX "IXFK_outlineZ_object_origin_type"
    ON base_data.outlinez USING btree
    (fk_object_origin_type)
    TABLESPACE pg_default;

-- Index: IXFK_outlineZ_object_type

-- DROP INDEX base_data."IXFK_outlineZ_object_type";

CREATE INDEX "IXFK_outlineZ_object_type"
    ON base_data.outlinez USING btree
    (fk_object_type)
    TABLESPACE pg_default;

-- Index: IXFK_outlineZ_observer

-- DROP INDEX base_data."IXFK_outlineZ_observer";

CREATE INDEX "IXFK_outlineZ_observer"
    ON base_data.outlinez USING btree
    (fk_observer)
    TABLESPACE pg_default;

-- Index: IXFK_outlineZ_position_capture_method_type

-- DROP INDEX base_data."IXFK_outlineZ_position_capture_method_type";

CREATE INDEX "IXFK_outlineZ_position_capture_method_type"
    ON base_data.outlinez USING btree
    (fk_position_capture_method_type)
    TABLESPACE pg_default;

-- Index: IXGEOM_outlineZ_geometry

-- DROP INDEX base_data."IXGEOM_outlineZ_geometry";

CREATE INDEX "IXGEOM_outlineZ_geometry"
    ON base_data.outlinez USING gist
    (geom)
    TABLESPACE pg_default;
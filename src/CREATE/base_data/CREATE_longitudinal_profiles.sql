-- Table: base_data.longitudinal_profiles

-- DROP TABLE base_data.longitudinal_profiles;

CREATE TABLE base_data.longitudinal_profiles
(
    pk uuid NOT NULL,
    fk_glacier uuid NOT NULL,
    fk_observer uuid NOT NULL,
    fk_object_origin_type smallint NOT NULL,
    fk_position_capture_method_type smallint NOT NULL,
    fk_height_capture_method_type smallint NOT NULL,
    fk_long_profile_type smallint NOT NULL,
    fk_long_profile_state smallint NOT NULL,
    acquisition smallint NOT NULL,
    release smallint NOT NULL,
    geom geometry(LineString,4326) NOT NULL,
    length numeric NOT NULL,
    CONSTRAINT longitudinal_profiles_pkey PRIMARY KEY (pk)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE base_data.longitudinal_profiles
    OWNER to gladmin;

GRANT ALL ON TABLE base_data.longitudinal_profiles TO gladmin;

GRANT SELECT ON TABLE base_data.longitudinal_profiles TO glro;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE base_data.longitudinal_profiles TO glrw;
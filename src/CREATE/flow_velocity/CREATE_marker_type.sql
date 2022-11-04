CREATE TABLE flow_velocity.marker_type (
    pk              smallint      NOT NULL CONSTRAINT date_quality_pk PRIMARY KEY,
    description     varchar(50)   NOT NULL
) TABLESPACE vector;

INSERT INTO flow_velocity.marker_type (PK, description) VALUES (0,'not defined / unknown');
INSERT INTO flow_velocity.marker_type (PK, description) VALUES (1,'stake');
INSERT INTO flow_velocity.marker_type (PK, description) VALUES (2,'stone/flag');
INSERT INTO flow_velocity.marker_type (PK, description) VALUES (3,'profile_mean');
INSERT INTO flow_velocity.marker_type (PK, description) VALUES (4,'profile_max');
INSERT INTO flow_velocity.marker_type (PK, description) VALUES (5,'none (virtual, natural feature)');
INSERT INTO flow_velocity.marker_type (PK, description) VALUES (9,'other');

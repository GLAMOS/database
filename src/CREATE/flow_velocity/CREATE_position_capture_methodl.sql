CREATE TABLE flow_velocity.position_capture_method (
    pk              smallint      NOT NULL CONSTRAINT date_quality_pk PRIMARY KEY,
    description     varchar(50)   NOT NULL
) TABLESPACE vector;

INSERT INTO flow_velocity.position_capture_method (PK, description) VALUES (0,'not defined / unknown');
INSERT INTO flow_velocity.position_capture_method (PK, description) VALUES (1,'estimate (steps)');
INSERT INTO flow_velocity.position_capture_method (PK, description) VALUES (2,'tape measurement');
INSERT INTO flow_velocity.position_capture_method (PK, description) VALUES (3,'range finder / elect dist');
INSERT INTO flow_velocity.position_capture_method (PK, description) VALUES (4,'theodolite / tachymeter  (3D -> sub-meter accuracy, orthometric hights)');
INSERT INTO flow_velocity.position_capture_method (PK, description) VALUES (5,'GPS handheld (2D or 3D elipsoidic height, -> meter/decameter accuracy)');
INSERT INTO flow_velocity.position_capture_method (PK, description) VALUES (6,'GPS differential (3D -> sub-meter accuracy, orthometric hights)');
INSERT INTO flow_velocity.position_capture_method (PK, description) VALUES (7,'planar digitising (maps, orthoimage, satellite)');
INSERT INTO flow_velocity.position_capture_method (PK, description) VALUES (8,'stereo photogrammetry (sub-meter accuracy)');

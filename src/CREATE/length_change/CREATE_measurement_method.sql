

CREATE TABLE length_change.measurement_method (
    pk              varchar(1)    NOT NULL CONSTRAINT length_change_measurement_method_pk PRIMARY KEY,
    description     varchar(50)   NOT NULL
) TABLESPACE vector;

INSERT INTO length_change.measurement_method (PK, description) VALUES ('0', 'not defined or unknown');
INSERT INTO length_change.measurement_method (PK, description) VALUES ('1', 'estimate');
INSERT INTO length_change.measurement_method (PK, description) VALUES ('2', 'tape measurement');
INSERT INTO length_change.measurement_method (PK, description) VALUES ('3', 'range finder / elect dist');
INSERT INTO length_change.measurement_method (PK, description) VALUES ('4', 'theodolite / tachymeter  (-> 3D high accuracy)');
INSERT INTO length_change.measurement_method (PK, description) VALUES ('5', 'GPS handheld (2D or 3D elipsoidic height, -> meter accuracy)');
INSERT INTO length_change.measurement_method (PK, description) VALUES ('6', 'GPS differential (3D -> sub-meter accuracy, orthometric hights)');
INSERT INTO length_change.measurement_method (PK, description) VALUES ('7', 'planar digitising (maps, orthoimage, satellite)');
INSERT INTO length_change.measurement_method (PK, description) VALUES ('8', 'stereo digitising (3D  sub-meter accuracy)');
INSERT INTO length_change.measurement_method (PK, description) VALUES ('9', 'other');
INSERT INTO length_change.measurement_method (PK, description) VALUES ('f', 'photo only');
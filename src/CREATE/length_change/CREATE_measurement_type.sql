

CREATE TABLE length_change.measurement_type (
    pk              varchar(1)    NOT NULL CONSTRAINT length_change_measurement_type_pk PRIMARY KEY,
    description     varchar(50)   NOT NULL
) TABLESPACE vector;

INSERT INTO length_change.measurement_type (PK, description) VALUES ('r', 'Reconstructed');
INSERT INTO length_change.measurement_type (PK, description) VALUES ('m', 'Measured');
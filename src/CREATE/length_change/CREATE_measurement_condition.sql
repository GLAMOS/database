

CREATE TABLE length_change.measurement_condition (
    pk              varchar(1)    NOT NULL CONSTRAINT length_change_measurement_condition_pk PRIMARY KEY,
    description     varchar(50)   NOT NULL
) TABLESPACE vector;
INSERT INTO length_change.measurement_condition (PK, description) VALUES ('0', 'no information');
INSERT INTO length_change.measurement_condition (PK, description) VALUES ('i', 'ice (clear margin)');
INSERT INTO length_change.measurement_condition (PK, description) VALUES ('d', 'debris covered (unclear margin)');
INSERT INTO length_change.measurement_condition (PK, description) VALUES ('s', 'snow covered');
INSERT INTO length_change.measurement_condition (PK, description) VALUES ('a', 'avalanche deposit');
INSERT INTO length_change.measurement_condition (PK, description) VALUES ('l', 'ending in lake');
INSERT INTO length_change.measurement_condition (PK, description) VALUES ('x', 'split / detachment of larger part / break off');
INSERT INTO length_change.measurement_condition (PK, description) VALUES ('c', 'calving');
INSERT INTO length_change.measurement_condition (PK, description) VALUES ('r', 'disintegration)');
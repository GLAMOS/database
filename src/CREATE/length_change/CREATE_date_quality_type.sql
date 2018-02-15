DROP TABLE length_change.date_quality_type;

CREATE TABLE length_change.date_quality_type (
    pk              smallint      NOT NULL CONSTRAINT date_quality_pk PRIMARY KEY,
    description     varchar(50)   NOT NULL
) TABLESPACE vector;

INSERT INTO length_change.date_quality_type (PK, description) VALUES (1, 'Precise value known');
INSERT INTO length_change.date_quality_type (PK, description) VALUES (11, 'Estimated value, only year is known');
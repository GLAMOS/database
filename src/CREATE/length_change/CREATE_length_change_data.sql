

CREATE TABLE length_change.length_change_data (
    pk                                uuid          NOT NULL CONSTRAINT length_change_data_pk PRIMARY KEY,
    fk_glacier                        bigint        NOT NULL REFERENCES base_data.glacier,
    date_from                         date          NOT NULL,
    date_from_quality                 smallint      NOT NULL REFERENCES length_change.date_quality_type,
    date_to                           date          NOT NULL,
    date_to_quality                   smallint      NOT NULL REFERENCES length_change.date_quality_type,
    fk_measurement_type               varchar(1)    NOT NULL REFERENCES length_change.measurement_type,
    variation_quantitative            decimal(10,2) NOT NULL,
    variation_quantitative_accuracy   decimal(10,2),
    elevation_min                     decimal(10,2),
    observer                          varchar(50),
    remarks                           text
) TABLESPACE vector;
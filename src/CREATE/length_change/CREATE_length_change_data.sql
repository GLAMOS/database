

CREATE TABLE length_change.length_change_data (
    pk                                uuid          NOT NULL CONSTRAINT length_change_data_pk PRIMARY KEY,
    fk_glacier                        bigint        NOT NULL REFERENCES base_data.glacier,
    date_from                         date          NOT NULL,
    date_from_quality                 smallint      NOT NULL,
    date_to                           date          NOT NULL,
    date_to_quality                   smallint      NOT NULL,
    fk_measurement_type               varchar(1)    NOT NULL REFERENCES length_change.measurement_type,
    variation_quantitative            decimal(10,2) NOT NULL,
    variation_quantitative_accuracy   decimal(10,2),
    elevation_min                     decimal(10,2),
    observer                          varchar(50),
    remarks                           text
) TABLESPACE vector;



ALTER TABLE length_change.length_change_data ADD CONSTRAINT fk_length_change_date_from_quality
	FOREIGN KEY (date_from_quality) REFERENCES administration.date_quality_type (pk) ON DELETE No Action ON UPDATE No Action;
	
ALTER TABLE length_change.length_change_data ADD CONSTRAINT fk_length_change_date_to_quality
	FOREIGN KEY (date_to_quality) REFERENCES administration.date_quality_type (pk) ON DELETE No Action ON UPDATE No Action;
ALTER TABLE length_change.length_change_data ADD COLUMN fk_measurement_method varchar(2)
CONSTRAINT length_change_data_fk_measurement_method_fkey REFERENCES length_change.measurement_method (pk) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
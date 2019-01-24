/* ------------------------------------------------------ */
/*  GLAMOS, Yvo Weidmann                                  */
/*  Created On : 24-January-2019 16:16:20                 */
/*  DBMS       : PostgreSQL                               */
/*  Description:                                          */
/*               - Adding the column fk_data_embargo_type */
/*                 for more selective data export.        */
/* ------------------------------------------------------ */

ALTER TABLE length_change.length_change_data ADD COLUMN fk_data_embargo_type smallint;
UPDATE length_change.length_change_data SET fk_data_embargo_type = 0;
ALTER TABLE length_change.length_change_data ALTER COLUMN fk_data_embargo_type SET NOT NULL;
ALTER TABLE length_change.length_change_data ALTER COLUMN fk_data_embargo_type SET DEFAULT 0;

CREATE INDEX ixfk_length_change_data_embargo_type ON length_change.length_change_data (fk_data_embargo_type ASC);

ALTER TABLE length_change.length_change_data ADD CONSTRAINT fk_length_change_data_embargo_type
	FOREIGN KEY (fk_data_embargo_type) REFERENCES administration.data_embargo_type (pk) ON DELETE No Action ON UPDATE No Action;
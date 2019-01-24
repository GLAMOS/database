/* ------------------------------------------------------ */
/*  GLAMOS, Yvo Weidmann                                  */
/*  Created On : 24-January-2019 16:16:20                 */
/*  DBMS       : PostgreSQL                               */
/*  Description:                                          */
/*               - Adding the column fk_data_embargo_type */
/*                 for more selective data export.        */
/* ------------------------------------------------------ */

ALTER TABLE volume_change.volume_change ADD COLUMN fk_data_embargo_type smallint;
UPDATE volume_change.volume_change SET fk_data_embargo_type = 0;
ALTER TABLE volume_change.volume_change ALTER COLUMN fk_data_embargo_type SET NOT NULL;
ALTER TABLE volume_change.volume_change ALTER COLUMN fk_data_embargo_type SET DEFAULT 0;

CREATE INDEX ixfk_volume_change_data_embargo_type ON volume_change.volume_change (fk_data_embargo_type ASC);

ALTER TABLE volume_change.volume_change ADD CONSTRAINT fk_volume_change_data_embargo_type
	FOREIGN KEY (fk_data_embargo_type) REFERENCES administration.data_embargo_type (pk) ON DELETE No Action ON UPDATE No Action;
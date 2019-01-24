/* ------------------------------------------------------- */
/*  GLAMOS, Yvo Weidmann                                   */
/*  Created On : 24-January-2019 16:16:20                  */
/*  DBMS       : PostgreSQL                                */
/*  Description:                                           */
/*               - Adding the columns fk_date_from_quality */
/*                 and fk_date_to_quality for tagging the  */
/*                 date information.                       */
/* ------------------------------------------------------- */

ALTER TABLE volume_change.volume_change ADD COLUMN fk_date_from_quality smallint;
UPDATE volume_change.volume_change SET fk_date_from_quality = 11;
ALTER TABLE volume_change.volume_change ALTER COLUMN fk_date_from_quality SET NOT NULL;
ALTER TABLE volume_change.volume_change ALTER COLUMN fk_date_from_quality SET DEFAULT 1;

CREATE INDEX ixfk_volume_change_date_from_quality_type ON volume_change.volume_change (fk_date_from_quality ASC);

ALTER TABLE volume_change.volume_change ADD CONSTRAINT fk_volume_change_date_from_quality_type
	FOREIGN KEY (fk_date_from_quality) REFERENCES administration.date_quality_type (pk) ON DELETE No Action ON UPDATE No Action;
	
ALTER TABLE volume_change.volume_change ADD COLUMN fk_date_to_quality smallint;
UPDATE volume_change.volume_change SET fk_date_to_quality = 11;
ALTER TABLE volume_change.volume_change ALTER COLUMN fk_date_to_quality SET NOT NULL;
ALTER TABLE volume_change.volume_change ALTER COLUMN fk_date_to_quality SET DEFAULT 1;

CREATE INDEX ixfk_volume_change_date_to_quality_type ON volume_change.volume_change (fk_date_to_quality ASC);

ALTER TABLE volume_change.volume_change ADD CONSTRAINT fk_volume_change_date_to_quality_type
	FOREIGN KEY (fk_date_to_quality) REFERENCES administration.date_quality_type (pk) ON DELETE No Action ON UPDATE No Action;
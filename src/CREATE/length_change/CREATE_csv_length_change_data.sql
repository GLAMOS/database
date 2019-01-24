CREATE OR REPLACE VIEW length_change.csv_length_change_data AS
	SELECT
		/* Key information about the glacier */
		g.name_full AS glacier_name,
		g.pk_sgi    AS glacier_id,

		/* Information about the start date */
		lcd.measure_date_start AS start_date_of_observation,
		CASE
			WHEN fk_measure_date_start_quality = 11 THEN 
				'x'
			WHEN fk_measure_date_start_quality = 1 THEN
				''
			ELSE
				'-'
		END
					AS quality_of_start_date,

		/* Information about the end date */
		lcd.measure_date_end AS end_date_of_observation,
		CASE
			WHEN fk_measure_date_endquality = 11 THEN 
				'x'
			WHEN fk_measure_date_endquality = 1 THEN
				''
			ELSE
				'-'
		END
					AS quality_of_end_date,

		/* Measured length change */
		lcd.length_change   AS length_change,
		lcd.elvation_tongue AS elevation_of_glacier_tongue,

		/* Information about the observer*/
		CASE
			WHEN observer IS NOT NULL THEN 
				observer
			ELSE
				'-'
		END
					AS observer

	FROM length_change.vw_length_change_data AS lcd
	
	/*
	ONLY PUBLIC DATA
	*/
	WHERE 
	
	LEFT JOIN base_data.vw_glacier AS g ON (lcd.pk_glacier = g.pk);
	
ALTER TABLE length_change.csv_length_change_data
    OWNER TO gladmin;

GRANT ALL ON TABLE    length_change.csv_length_change_data TO gladmin;
GRANT SELECT ON TABLE length_change.csv_length_change_data TO glporo;
GRANT SELECT ON TABLE length_change.csv_length_change_data TO glro;
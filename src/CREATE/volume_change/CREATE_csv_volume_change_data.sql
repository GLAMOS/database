CREATE OR REPLACE VIEW volume_change.csv_volume_change_data AS
	SELECT
		/* Key information about the glacier */
		vcd.glacier_full_name AS glacier_name,
		vcd.pk_sgi            AS glacier_id,

		/* Information about the start date */
		vcd.date_from         AS start_date_of_observation,

		CASE
				WHEN date_from_quality_type = 11 THEN 
					'x'
				WHEN date_from_quality_type = 1 THEN
					''
				ELSE
					'-'
		END AS quality_of_start_date,


		/* Information about the end date */
		vcd.date_to           AS end_date_of_observation,
		CASE
				WHEN date_to_quality_type = 11 THEN 
					'x'
				WHEN date_to_quality_type = 1 THEN
					''
				ELSE
					'-'
		END AS quality_of_end_date,

		/* Information about the area at the start and at the end */
		vcd.area_from             AS glacier_area_at_start_date,
		vcd.area_to               AS  glacier_area_at_end_date,

		/* Information about the volume change, mean thickness change */
		vcd.volume_change         AS volume_change,
		vcd.height_change_mean    AS mean_thickness_change,

		/* Calculation of the annual geodetic mass balance */
		round(vcd.volume_change / (vcd.area_from + vcd.area_to) / 2 * 1000 * 1000 * 0.85 / (date_part('YEAR', vcd.date_to) - date_part('YEAR', vcd.date_from)))::bigint
								  AS annual_geodetic_mass_balance,
																																	   
	    /* Information about the observer */
		'-'::varchar(1)           AS observer
		/*
		NOT IMPLEMENTED YET IN THE DB
		*/																											   
																													   
	FROM volume_change.vw_volume_change_data AS vcd
	
	/*
	ONLY PUBLIC DATA
	*/
	WHERE data_embargo_type = 0
	
	ORDER BY glacier_id ASC, start_date_of_observation ASC;
																																	   
ALTER TABLE volume_change.csv_volume_change_data
    OWNER TO gladmin;

GRANT ALL ON TABLE    volume_change.csv_volume_change_data TO gladmin;
GRANT SELECT ON TABLE volume_change.csv_volume_change_data TO glporo;
GRANT SELECT ON TABLE volume_change.csv_volume_change_data TO glro;
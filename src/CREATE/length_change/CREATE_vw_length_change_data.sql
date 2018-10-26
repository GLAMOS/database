/* ------------------------------------------ */
/*  GLAMOS, Yvo Weidmann                      */
/*  Created On : 21-September-2018 16:16:20   */
/*  DBMS       : PostgreSQL                   */
/* ------------------------------------------ */

CREATE OR REPLACE VIEW length_change.vw_length_change_data AS
	SELECT
		row_number() OVER()            AS gid, 
			g.pk                       AS pk_glacier,
			g.pk_sgi                   AS pk_sgi,
			g.pk_wgms                  AS pk_wgms,
			g.pk_glims                 AS pk_glims,
			g.river_level_3            AS river_level_3,
			g.river_level_2            AS river_level_2,
			g.river_level_1            AS river_level_1,
			g.river_level_0            AS river_level_0,
			get_pk_hades (g.river_level_3, g.river_level_2, g.river_level_1, g.river_level_0) AS pk_hades,
		    lc.date_from               AS measure_date_start,
		    dqt1.description           AS measure_date_start_quality,
		    lc.date_to                 AS measure_date_end,
		    dqt2.description           AS measure_date_endquality,
			lc.variation_quantitative  AS length_change,
			sum(variation_quantitative) OVER (PARTITION BY pk_sgi ORDER BY date_to) AS length_change_cumulative
	FROM
		length_change.length_change_data AS lc
	LEFT JOIN base_data.vw_glacier AS g ON 
			(lc.fk_glacier = g.pk_vaw)
			
	LEFT JOIN length_change.date_quality_type AS dqt1 ON 
			(lc.date_from_quality = dqt1.pk)
	LEFT JOIN length_change.date_quality_type AS dqt2 ON 
			(lc.date_to_quality = dqt2.pk);

GRANT SELECT ON length_change.vw_length_change_data TO glro;
GRANT SELECT ON length_change.vw_length_change_data TO glrw;
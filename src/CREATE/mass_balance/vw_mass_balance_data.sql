/* ------------------------------------------ */
/*  GLAMOS, Yvo Weidmann                      */
/*  Created On : 21-September-2018 16:16:20   */
/*  DBMS       : PostgreSQL                   */
/* ------------------------------------------ */

CREATE OR REPLACE VIEW mass_balance.vw_mass_balance_data AS
	SELECT
		row_number() OVER()            AS gid, 
		g.pk                           AS pk_glacier,
		g.pk_sgi                       AS pk_sgi,
		g.pk_wgms                      AS pk_wgms,
		g.pk_glims                     AS pk_glims,
		g.river_level_3                AS river_level_3,
		g.river_level_2                AS river_level_2,
		g.river_level_1                AS river_level_1,
		g.river_level_0                AS river_level_0,
		get_pk_hades (g.river_level_3, g.river_level_2, g.river_level_1, g.river_level_0) AS pk_hades,
		g.name_full,
		mbt.short_name                 AS mass_balance_type,
		amt.short_name                 AS analysis_method,
		date_from_annual,
		date_to_annual,
		date_from_winter,
		date_to_winter,
		area,
		mass_balance_annual,
		sum(mass_balance_annual) OVER (PARTITION BY pk_sgi ORDER BY date_to) AS mass_balance_annual_cumulative
		mass_balance_winter,
		equilibrium_line_altitude,
		accumulation_area_ratio,
		elevation_minimum,
		elevation_maximum,
		reference
	FROM
		mass_balance.mass_balance AS mb WHERE g.name_short = 'rhone'
	LEFT JOIN base_data.vw_glacier AS g ON 
			(mb.fk_glacier = g.pk)
	LEFT JOIN mass_balance.analysis_method_type AS amt ON 
			(mb.fk_analysis_method = amt.pk)
	LEFT JOIN mass_balance.mass_balance_type AS mbt ON 
			(mb.fk_mass_balance_type = mbt.pk)
			
GRANT SELECT ON mass_balance.vw_mass_balance_data TO glro;
GRANT SELECT ON mass_balance.vw_mass_balance_data TO glrw;
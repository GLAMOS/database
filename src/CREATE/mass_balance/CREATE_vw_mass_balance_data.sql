/* ------------------------------------------ */
/*  GLAMOS, Yvo Weidmann                      */
/*  Created On : 21-September-2018 16:16:20   */
/*  DBMS       : PostgreSQL                   */
/* ------------------------------------------ */

CREATE OR REPLACE VIEW mass_balance.vw_mass_balance_data AS
 SELECT
 	row_number() OVER () AS gid,
    g.pk_sgi,
    g.pk_wgms,
    g.pk_glims,
    g.river_level_3,
    g.river_level_2,
    g.river_level_1,
    g.river_level_0,
    get_pk_hades(g.river_level_3::text, g.river_level_2::integer, g.river_level_1::integer, g.river_level_0::text) AS pk_hades,
    g.name_full,
    mbt.short_name AS mass_balance_type,
    amt.short_name AS analysis_method,
    mb.date_from_annual,
    mb.date_to_annual,
    mb.date_from_winter,
    mb.date_to_winter,
    mb.area,
    mb.mass_balance_annual,
    mb.mass_balance_winter,
    mb.equilibrium_line_altitude,
    mb.accumulation_area_ratio,
    mb.elevation_minimum,
    mb.elevation_maximum,
    mb.reference,
	mbt.pk AS fk_mass_balance_type,
    amt.pk AS fk_analysis_method,
	mb.pk
   FROM mass_balance.mass_balance mb
     LEFT JOIN base_data.vw_glacier g ON mb.fk_glacier = g.pk
     LEFT JOIN mass_balance.analysis_method_type amt ON mb.fk_analysis_method = amt.pk
     LEFT JOIN mass_balance.mass_balance_type mbt ON mb.fk_mass_balance_type = mbt.pk;

ALTER TABLE mass_balance.vw_mass_balance_data
    OWNER TO gladmin;

GRANT ALL ON TABLE mass_balance.vw_mass_balance_data TO gladmin;
GRANT SELECT ON TABLE mass_balance.vw_mass_balance_data TO glro;
GRANT SELECT ON TABLE mass_balance.vw_mass_balance_data TO glrw;
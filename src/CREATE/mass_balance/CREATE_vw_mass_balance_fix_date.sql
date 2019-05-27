-- View: mass_balance.vw_mass_balance_fix_date

-- DROP VIEW mass_balance.vw_mass_balance_fix_date;

CREATE OR REPLACE VIEW mass_balance.vw_mass_balance_fix_date AS
 SELECT g.pk AS pk_glacier,
    g.pk_vaw,
    g.pk_sgi,
    g.name_short AS glacier_short_name,
    g.name_full AS glacier_full_name,
    mb.fk_mass_balance_type AS mass_balance_type_key,
    mbt.short_name AS mass_balance_type,
    mb.fk_embargo_type AS data_embargo_type_key,
    det.short_name AS data_embargo_type,
    mb.fk_analysis_method AS analysis_method_type_key,
    amt.short_name AS analysis_method_type,
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
    mb.remarks,
    mb.reference
   FROM mass_balance.mass_balance mb
     LEFT JOIN mass_balance.mass_balance_type mbt ON mbt.pk = mb.fk_mass_balance_type
     LEFT JOIN administration.data_embargo_type det ON det.pk = mb.fk_embargo_type
     LEFT JOIN mass_balance.analysis_method_type amt ON amt.pk = mb.fk_analysis_method
     LEFT JOIN base_data.vw_glacier g ON g.pk = mb.fk_glacier
  WHERE mb.fk_mass_balance_type = 2;

ALTER TABLE mass_balance.vw_mass_balance_fix_date
    OWNER TO gladmin;

GRANT ALL ON TABLE mass_balance.vw_mass_balance_fix_date TO gladmin;
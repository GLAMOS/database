-- View: mass_balance.web_mass_balance_fix_date_winter

-- DROP VIEW mass_balance.web_mass_balance_fix_date_winter;

CREATE OR REPLACE VIEW mass_balance.web_mass_balance_fix_date_winter AS
 SELECT mbfd.pk_glacier,
    g.name_short AS glacier_short_name,
    g.name_full AS glacier_full_name,
    g.pk_sgi,
    date_part('year'::text, mbfd.date_from_winter) AS year_from,
    date_part('year'::text, mbfd.date_to_winter) AS year_to,
    mbfd.date_from_winter AS date_from,
    mbfd.date_to_winter AS date_to,
    mbfd.mass_balance_annual AS annual_mass_balance,
    mbfd.mass_balance_annual_cumulative AS annual_mass_balance_cumulative,
    mbfd.mass_balance_winter AS winter_mass_balance,
    mbfd.mass_balance_winter_cumulative AS winter_mass_balance_cumulative
   FROM mass_balance.vw_mass_balance_fix_date_cumulative mbfd
     LEFT JOIN base_data.vw_glacier g ON mbfd.pk_glacier = g.pk;

ALTER TABLE mass_balance.web_mass_balance_fix_date_winter
    OWNER TO gladmin;
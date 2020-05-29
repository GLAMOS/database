-- View: mass_balance.web_mass_balance_fix_date_winter_glacier_json

-- DROP VIEW mass_balance.web_mass_balance_fix_date_winter_glacier_json;

CREATE OR REPLACE VIEW mass_balance.web_mass_balance_fix_date_winter_glacier_json AS
 SELECT data.pk_glacier,
    data.glacier_short_name,
    data.glacier_full_name,
    data.pk_sgi,
    json_agg(data.mass_balance_fix_date) AS json
   FROM ( SELECT mbfdw.pk_glacier,
            mbfdw.glacier_short_name,
            mbfdw.glacier_full_name,
            mbfdw.pk_sgi,
            jsonb_build_object('year_from', mbfdw.year_from, 'year_to', mbfdw.year_to, 'date_from', mbfdw.date_from, 'date_to', mbfdw.date_to,'variation', mbfdw.winter_mass_balance, 'variation_cumulative', mbfdw.winter_mass_balance_cumulative) AS mass_balance_fix_date
           FROM mass_balance.web_mass_balance_fix_date_winter mbfdw
          ORDER BY mbfdw.year_from, mbfdw.year_to) data
  GROUP BY data.pk_glacier, data.pk_sgi, data.glacier_full_name, data.glacier_short_name;

ALTER TABLE mass_balance.web_mass_balance_fix_date_winter_glacier_json
    OWNER TO gladmin;

GRANT ALL ON TABLE mass_balance.web_mass_balance_fix_date_winter_glacier_json TO gladmin;
GRANT SELECT ON TABLE mass_balance.web_mass_balance_fix_date_winter_glacier_json TO glporo;

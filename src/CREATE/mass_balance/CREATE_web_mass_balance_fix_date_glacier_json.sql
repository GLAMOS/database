-- View: mass_balance.web_mass_balance_fix_date_glacier_json

-- DROP VIEW mass_balance.web_mass_balance_fix_date_glacier_json;

CREATE OR REPLACE VIEW mass_balance.web_mass_balance_fix_date_glacier_json AS
 SELECT data.pk_glacier,
    data.glacier_short_name,
    data.glacier_full_name,
    data.pk_sgi,
    json_agg(data.mass_balance_fix_date) AS json
   FROM ( SELECT mbfd.pk_glacier,
            mbfd.glacier_short_name,
            mbfd.glacier_full_name,
            mbfd.pk_sgi,
            jsonb_build_object('year_from', mbfd.year_from, 'year_to', mbfd.year_to, 'variation', mbfd.annual_mass_balance, 'variation_cumulative', mbfd.annual_mass_balance_cumulative) AS mass_balance_fix_date
           FROM mass_balance.web_mass_balance_fix_date mbfd
          ORDER BY mbfd.year_from, mbfd.year_to) data
  GROUP BY data.pk_glacier, data.pk_sgi, data.glacier_full_name, data.glacier_short_name;

ALTER TABLE mass_balance.web_mass_balance_fix_date_glacier_json
    OWNER TO gladmin;

GRANT ALL ON TABLE mass_balance.web_mass_balance_fix_date_glacier_json TO gladmin;
GRANT SELECT ON TABLE mass_balance.web_mass_balance_fix_date_glacier_json TO glporo;
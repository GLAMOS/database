GRANT USAGE ON SCHEMA base_data TO glro;
GRANT SELECT ON base_data.web_glacier_picture TO glro;

GRANT USAGE ON SCHEMA length_change TO glro;
GRANT SELECT ON length_change.web_length_change TO glro;
GRANT SELECT ON length_change.web_length_change_summary TO glro;

GRANT USAGE ON SCHEMA mass_balance TO glro;
GRANT SELECT ON mass_balance.web_mass_balance_annual TO glro;
GRANT SELECT ON mass_balance.web_mass_balance_annual_cumulative TO glro;
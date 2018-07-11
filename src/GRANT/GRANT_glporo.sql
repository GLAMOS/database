GRANT USAGE ON SCHEMA base_data TO glporo;
GRANT SELECT ON base_data.web_glacier_picture TO glporo;

GRANT USAGE ON SCHEMA length_change TO glporo;
GRANT SELECT ON length_change.web_length_change TO glporo;
GRANT SELECT ON length_change.web_length_change_summary TO glporo;

GRANT USAGE ON SCHEMA mass_balance TO glporo;
GRANT SELECT ON mass_balance.web_mass_balance_annual TO glporo;
GRANT SELECT ON mass_balance.web_mass_balance_annual_cumulative TO glporo;

GRANT USAGE ON SCHEMA volume_change TO glporo;
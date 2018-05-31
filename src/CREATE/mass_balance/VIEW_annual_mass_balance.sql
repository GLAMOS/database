
CREATE OR REPLACE VIEW mass_balance.vw_mass_balance_annual AS

SELECT
 mb.fk_glacier,
 g.name_short as glacier_short_name,
 g.name_full as name,
 mb.fk_mass_balance_glacier_type,
 mbt.short_name,
 mb.date_annual_from,
 mb.date_annual_to,
 mb.annual_mass_balance,
 mb.equilibrium_line_altitude,
 mb.accumulation_area_ratio
FROM
 mass_balance.mass_balance_glacier mb
INNER JOIN mass_balance.mass_balance_glacier_type mbt ON mbt.pk = mb.fk_mass_balance_glacier_type
INNER JOIN base_data.vw_glacier g ON g.pk_vaw = mb.fk_glacier;

GRANT SELECT ON mass_balance.vw_mass_balance_annual TO glro;
GRANT SELECT ON mass_balance.vw_mass_balance_annual TO glrw;
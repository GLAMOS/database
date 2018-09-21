CREATE OR REPLACE VIEW mass_balance.vw_elevation_distribution AS
SELECT
 *
FROM
 mass_balance.elevation_distribution ed;

GRANT SELECT ON mass_balance.vw_mass_balance TO glro;
GRANT SELECT ON mass_balance.vw_mass_balance TO glrw;
GRANT SELECT ON mass_balance.vw_mass_balance TO glporo;
GRANT SELECT ON mass_balance.vw_mass_balance TO gldiro;
GRANT SELECT ON mass_balance.vw_mass_balance TO gldirw;
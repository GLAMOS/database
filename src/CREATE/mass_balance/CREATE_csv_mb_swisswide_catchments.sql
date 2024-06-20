-- View: mass_balance.csv_mb_swisswide_catchment

-- DROP VIEW mass_balance.csv_mb_swisswide_catchment;

CREATE OR REPLACE VIEW mass_balance.csv_mb_swisswide_catchment
 AS
 SELECT 
	main_catchment, 
	year, 
	ROUND(area_km2,2) as area_km2, 
	ROUND(mb_evolution_mwe,3) as mb_evolution_mwe,
	ROUND(vol_evolution_km3,3) as vol_evolution_km3,
	ROUND(vol_evolution_per,2) as vol_evolution_per
   FROM mass_balance.vw_mb_swisswide_catchments;

ALTER TABLE mass_balance.csv_mb_swisswide_catchment
    OWNER TO gladmin;

GRANT ALL ON TABLE mass_balance.csv_mb_swisswide_catchment TO gladmin;
GRANT SELECT ON TABLE mass_balance.csv_mb_swisswide_catchment TO glporo;
GRANT SELECT ON TABLE mass_balance.csv_mb_swisswide_catchment TO glro;


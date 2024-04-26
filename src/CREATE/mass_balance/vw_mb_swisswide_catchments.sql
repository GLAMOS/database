-- View: mass_balance.vw_mb_swisswide_catchments

DROP VIEW mass_balance.vw_mb_swisswide_catchments;

CREATE OR REPLACE VIEW mass_balance.vw_mb_swisswide_catchments
 AS
 SELECT 
	CASE WHEN g.river_level_3 = 'A' AND g.river_level_2 = 1 AND g.river_level_1 >=0 THEN 'Alpenrhein'
		WHEN g.river_level_3 = 'A' AND g.river_level_2 = 2 AND g.river_level_1 >=0 THEN 'Thur'
		WHEN g.river_level_3 = 'A' AND g.river_level_2 = 5 AND g.river_level_1 = 0 THEN 'Linth'
		WHEN g.river_level_3 = 'A' AND g.river_level_2 = 5 AND g.river_level_1 = 1 THEN 'Reuss'
		WHEN g.river_level_3 = 'A' AND g.river_level_2 = 5 AND g.river_level_1 >=4 AND g.river_level_1 <=5 THEN 'Aare'
		WHEN g.river_level_3 = 'A' AND g.river_level_2 = 5 AND g.river_level_1 = 6 THEN 'Saane'
		WHEN g.river_level_3 = 'B' THEN 'Rhone'
		WHEN g.river_level_3 = 'C' AND g.river_level_2 <= 5 THEN 'Tessin/Simplon'
		WHEN g.river_level_3 = 'C' AND g.river_level_2 >= 5 THEN 'Bergell/Poschiavo'
		WHEN g.river_level_3 = 'D' THEN 'Adige'
		WHEN g.river_level_3 = 'E' THEN 'Inn'
		END as main_catchment,
    mbsw.year,
	ROUND(SUM(mbsw.area),2) as area_km2,
	ROUND(SUM(mbsw.mb_evolution),3) as mb_evolution_mwe,
	ROUND(SUM(mbsw.vol_evolution),6) as vol_evolution_km3
   FROM mass_balance.swisswide mbsw
     LEFT JOIN base_data.vw_glacier g ON g.pk = mbsw.fk_glacier
   
   group by g.river_level_3, g.river_level_2, g.river_level_1, year
   order by g.river_level_3, g.river_level_2, g.river_level_1, year;

ALTER TABLE mass_balance.vw_mb_swisswide_catchments
    OWNER TO gladmin;

GRANT ALL ON TABLE mass_balance.vw_mb_swisswide_catchments TO gladmin;
GRANT SELECT ON TABLE mass_balance.vw_mb_swisswide_catchments TO glrw;
GRANT SELECT ON TABLE mass_balance.vw_mb_swisswide_catchments TO glporo;
GRANT SELECT ON TABLE mass_balance.vw_mb_swisswide_catchments TO gldirw;
GRANT SELECT ON TABLE mass_balance.vw_mb_swisswide_catchments TO glro;
GRANT SELECT ON TABLE mass_balance.vw_mb_swisswide_catchments TO gldiro;


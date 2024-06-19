-- View: mass_balance.vw_mb_swisswide

-- DROP VIEW mass_balance.vw_mb_swisswide;

CREATE OR REPLACE VIEW mass_balance.vw_mb_swisswide
 AS
 SELECT 
	'Switzerland' as main_catchment,
    mbsw.year,
	ROUND(SUM(mbsw.area),2) as area_km2,
	ROUND(((((SUM(mbsw.vol_evolution)) - (LAG(SUM(mbsw.vol_evolution),1) OVER (ORDER by mbsw.year)))*0.85)/SUM(mbsw.area))*1000,3) as mb_evolution_mwe,
	ROUND(SUM(mbsw.vol_evolution),6) as vol_evolution_km3
   FROM mass_balance.swisswide mbsw
     LEFT JOIN base_data.vw_glacier g ON g.pk = mbsw.fk_glacier

   GROUP BY main_catchment, year
   ORDER BY main_catchment, year;

ALTER TABLE mass_balance.vw_mb_swisswide
    OWNER TO gladmin;

GRANT ALL ON TABLE mass_balance.vw_mb_swisswide TO gladmin;
GRANT SELECT ON TABLE mass_balance.vw_mb_swisswide TO glrw;
GRANT SELECT ON TABLE mass_balance.vw_mb_swisswide TO glporo;
GRANT SELECT ON TABLE mass_balance.vw_mb_swisswide TO gldirw;
GRANT SELECT ON TABLE mass_balance.vw_mb_swisswide TO glro;
GRANT SELECT ON TABLE mass_balance.vw_mb_swisswide TO gldiro;


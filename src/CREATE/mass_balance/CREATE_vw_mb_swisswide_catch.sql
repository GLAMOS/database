-- View: mass_balance.vw_mb_swisswide_catchments

DROP VIEW mass_balance.vw_mb_swisswide_catchments;

CREATE OR REPLACE VIEW mass_balance.vw_mb_swisswide_catchments
 AS
 SELECT 
	mbsw.main_catchment,
    mbsw.year,
	ROUND(SUM(mbsw.area_km2),2) as area_km2,
	ROUND(SUM(mbsw.vol_evolution_km3),6) as vol_evolution_km3_km3,
	SUM(mbsw.vol_evolution_km3) as jahr_t,
	ROUND(LAG(SUM(mbsw.vol_evolution_km3),1) OVER (ORDER by main_catchment, mbsw.year),3) as jahr_t_1,
	ROUND((SUM(mbsw.vol_evolution_km3)) - (LAG(SUM(mbsw.vol_evolution_km3),1) OVER (ORDER by main_catchment,mbsw.year)),3) as dV,
	ROUND(((SUM(mbsw.vol_evolution_km3)) - (LAG(SUM(mbsw.vol_evolution_km3),1) OVER (ORDER by main_catchment,mbsw.year)))*0.85,3) as dM,
	ROUND(((((SUM(mbsw.vol_evolution_km3)) - (LAG(SUM(mbsw.vol_evolution_km3),1) OVER (ORDER by main_catchment,mbsw.year)))*0.85)/NULLIF(SUM(mbsw.area_km2),0))*1000,3) as mb_evolution_mwe
   FROM mass_balance.vw_mb_swisswide_glacier mbsw
     LEFT JOIN base_data.vw_glacier g ON g.pk = mbsw.pk
   
   group by main_catchment, year
   order by main_catchment, year;

ALTER TABLE mass_balance.vw_mb_swisswide_catchments
    OWNER TO gladmin;

GRANT ALL ON TABLE mass_balance.vw_mb_swisswide_catchments TO gladmin;
GRANT SELECT ON TABLE mass_balance.vw_mb_swisswide_catchments TO glrw;
GRANT SELECT ON TABLE mass_balance.vw_mb_swisswide_catchments TO glporo;
GRANT SELECT ON TABLE mass_balance.vw_mb_swisswide_catchments TO gldirw;
GRANT SELECT ON TABLE mass_balance.vw_mb_swisswide_catchments TO glro;
GRANT SELECT ON TABLE mass_balance.vw_mb_swisswide_catchments TO gldiro;


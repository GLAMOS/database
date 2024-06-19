-- View: mass_balance.csv_mb_swisswide

-- DROP VIEW mass_balance.csv_mb_swisswide;

CREATE OR REPLACE VIEW mass_balance.csv_mb_swisswide
 AS
 SELECT *
   FROM mass_balance.vw_mb_swisswide
 UNION

SELECT *
   FROM mass_balance.vw_mb_swisswide_catchments;

ALTER TABLE mass_balance.csv_mb_swisswide
    OWNER TO gladmin;

GRANT ALL ON TABLE mass_balance.csv_mb_swisswide TO gladmin;
GRANT SELECT ON TABLE mass_balance.csv_mb_swisswide TO glporo;
GRANT SELECT ON TABLE mass_balance.csv_mb_swisswide TO glro;


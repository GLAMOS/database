DROP VIEW vw_unconsolidated_deposit_glacier CASCADE;

CREATE MATERIALIZED VIEW vw_unconsolidated_deposit_glacier AS
	SELECT
		sgi.id,
		sgi.pk_sgi,
		ST_INTERSECTION(sgi.geom, ucd.geom) AS geom,
		sgi.year_acquisition                AS year_acquisition_glacier,
		ucd.acquisition                     AS year_acquisition_deposit
	FROM vw_sgi_selected AS sgi, vw_unconsolidated_deposit_selected AS ucd;
	
CREATE INDEX IXGEOM_vw_unconsolidated_deposit_glacier ON vw_unconsolidated_deposit_glacier 
	USING GIST (geom);

GRANT SELECT ON vw_unconsolidated_deposit_glacier TO glro;
GRANT SELECT ON vw_unconsolidated_deposit_glacier TO glrw;
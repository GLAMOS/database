CREATE OR REPLACE VIEW vw_glacier_debris_cover AS
	SELECT
		*,
		ST_AREA(geom) / 1000000                                  AS area,
		ABS(year_acquisition_glacier - year_acquisition_deposit) AS year_acquisition_difference
	FROM vw_unconsolidated_deposit_glacier;

GRANT SELECT ON vw_glacier_debris_cover TO glro;
GRANT SELECT ON vw_glacier_debris_cover TO glrw;
CREATE OR REPLACE VIEW cryospheric_commission.ekk_lengthchange_cumulative AS
	SELECT 
		id,
		objid,
		xval,
		SUM(yval) OVER (PARTITION BY objid ORDER BY xval) AS yval,
		111::integer AS objtyp
	FROM
		cryospheric_commission.data2d
	WHERE
		objtyp = 110
	ORDER BY
		objid, xval;
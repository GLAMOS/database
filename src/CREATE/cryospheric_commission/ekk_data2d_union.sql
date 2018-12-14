CREATE OR REPLACE VIEW cryospheric_commission.ekk_data2d_union AS 
	SELECT
		id,
		objid,
		objtyp::INTEGER,
		xval,
		yval
	FROM
		cryospheric_commission.data2d
	UNION ALL
	SELECT
		id,
		objid,
		objtyp::INTEGER,
		xval,
		yval
	FROM
		cryospheric_commission.ekk_lengthchange_cumulative;
CREATE OR REPLACE VIEW length_change.web_length_change_latest AS
	SELECT 
		g.pk AS pk_glacier,
		lc.date_from,
		lc.date_to,
		lc.variation_quantitative
	FROM
		length_change.length_change_data AS lc
	LEFT JOIN
	(
			SELECT
				lc.fk_glacier,
				MAX(lc.date_to) AS latest_observation_date
			FROM
				length_change.length_change_data lc
			GROUP BY 
				lc.fk_glacier) AS latest
	ON
		latest.fk_glacier = lc.fk_glacier
		AND
		latest.latest_observation_date = lc.date_to
	LEFT JOIN
		base_data.vw_glacier AS g
	ON 
		lc.fk_glacier = g.pk_vaw
	WHERE
		latest.latest_observation_date IS NOT NULL
	ORDER BY
		lc.fk_glacier;
		
ALTER TABLE length_change.web_length_change_latest
    OWNER TO gladmin;

GRANT SELECT ON length_change.web_length_change_latest TO glporo;
GRANT SELECT ON length_change.web_length_change_latest TO glro;
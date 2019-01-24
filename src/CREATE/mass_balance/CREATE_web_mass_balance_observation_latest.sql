CREATE OR REPLACE VIEW mass_balance.web_mass_balance_observation_latest AS
	SELECT 
		mb.fk_glacier AS pk_glacier,
		mb.date_from_annual,
		mb.date_to_annual,
		mb.mass_balance_annual
	FROM
		mass_balance.mass_balance AS mb
	LEFT JOIN
	(
			SELECT
				mb.fk_glacier,
				MAX(mb.date_to_annual) AS latest_observation_date
			FROM
				mass_balance.mass_balance mb
			WHERE
				mb.fk_mass_balance_type = 1
			GROUP BY 
				mb.fk_glacier) AS latest
	ON
		latest.fk_glacier = mb.fk_glacier
		AND
		latest.latest_observation_date = mb.date_to_annual
	WHERE
		latest.latest_observation_date IS NOT NULL
	ORDER BY
		mb.fk_glacier;
		
ALTER TABLE mass_balance.web_mass_balance_observation_latest
    OWNER TO gladmin;

GRANT SELECT ON mass_balance.web_mass_balance_observation_latest TO glporo;
GRANT SELECT ON mass_balance.web_mass_balance_observation_latest TO glro;
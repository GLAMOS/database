CREATE OR REPLACE VIEW mass_balance.vw_mass_balance_observation_has_data AS
	SELECT
		g.pk                   AS pk_glacier,
		g.pk_vaw               AS pk_vaw,
		g.pk_sgi               AS pk_sgi,
		mbodc.mass_balance_observation_data_count,
		CASE
			WHEN mbodc.mass_balance_observation_data_count > 0 
				THEN 1
				ELSE 0
		END AS mass_balance_observation_has_data
	FROM base_data.vw_glacier    AS g
	LEFT JOIN mass_balance.vw_mass_balance_observation_data_count AS mbodc ON
		(g.pk = mbodc.pk_glacier);

ALTER TABLE mass_balance.vw_mass_balance_observation_has_data
    OWNER TO gladmin;

GRANT ALL ON TABLE mass_balance.vw_mass_balance_observation_has_data TO gladmin;
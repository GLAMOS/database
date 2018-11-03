CREATE OR REPLACE VIEW mass_balance.gis_mass_balance_observation_latest AS
	SELECT 
		row_number() OVER() AS gid,
		mb.pk_glacier,
		mb.pk_vaw,
		g.river_level_3,
		g.river_level_2,
		g.river_level_1,
		g.river_level_0,
		g.inventory_code,
		mb.pk_sgi,
		g.name_short,
		g.name_full,
		g.geom,
		mb.latest_observation_date,
		mb.latest_mass_balance_annual,
		mb.latest_mass_balance_annual_cumulative,
		mb.latest_mass_balance_winter,
		mb.latest_mass_balance_cumulative AS latest_mass_balance_cumulative_winter
	FROM mass_balance.vw_mass_balance_observation_latest AS mb
	LEFT JOIN base_data.vw_glacier AS g ON
		(g.pk = mb.pk_glacier);
	
GRANT SELECT ON mass_balance.gis_mass_balance_observation_latest TO glro;
GRANT SELECT ON mass_balance.gis_mass_balance_observation_latest TO glrw;
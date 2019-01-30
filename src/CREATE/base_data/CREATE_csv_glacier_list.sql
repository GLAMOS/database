/* ------------------------------------------ */
/*  GLAMOS, Elias Hodel                       */
/*  Created On : 30-January-2019 15:00:00     */
/*  DBMS       : PostgreSQL                   */
/* ------------------------------------------ */
CREATE OR REPLACE VIEW base_data.csv_glacier_list AS
	SELECT 
		g.name_full     AS glacier_full_name,
		g.pk_sgi,
		round(st_x(st_transform(g.geom, 2056))::numeric, 3) AS coordx,
		round(st_y(st_transform(g.geom, 2056))::numeric, 3) AS coordy,
		round((il.area/1000000::numeric)::numeric, 3)  AS area_km2,
		il.sgi_release  AS area_year,
		hlcd.has_length,
		mbohd.mass_balance_observation_has_data             AS has_mass,
		hvcd.has_volume

	FROM base_data.vw_glacier g
		LEFT JOIN length_change.vw_has_length_change_data hlcd ON hlcd.pk_glacier = g.pk
		LEFT JOIN volume_change.vw_has_volume_change_data hvcd ON hvcd.pk_glacier = g.pk
		LEFT JOIN mass_balance.vw_mass_balance_observation_has_data mbohd ON mbohd.pk_glacier = g.pk
		LEFT JOIN base_data.vw_glacier_particular_interest gpi ON gpi.pk = g.pk
		LEFT JOIN inventory.vw_inventory_latest il ON il.pk_glacier = g.pk
	
	WHERE hlcd.has_length = 1 OR mbohd.mass_balance_observation_has_data = 1 OR hlcd.has_length = 1;
	
ALTER TABLE base_data.web_glacier_base_data
    OWNER TO gladmin;

GRANT ALL ON TABLE base_data.web_glacier_base_data TO gladmin;
GRANT SELECT ON TABLE base_data.web_glacier_base_data TO glporo;
GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE base_data.web_glacier_base_data TO glrw;
GRANT SELECT ON TABLE base_data.web_glacier_base_data TO glro;
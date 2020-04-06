CREATE OR REPLACE VIEW inventory.vw_inventory_latest_xyz AS
	SELECT
		row_number() OVER() AS gid,
		latest_inventory.*,
		st_area(st_transform(latest_inventory.geom, 4326))::bigint AS area
	FROM (
		SELECT
		i.pk_glacier,
		ST_UNION(i.geom) AS geom,
		i.sgi_release,
		i.pk_sgi,
		i.year_acquisition,
		i.name_short

		FROM inventory.vw_inventory AS i

		JOIN inventory.vw_inventory_latest_year AS liry ON i.sgi_release = liry.latest_inventory_release_year

		GROUP BY i.pk_glacier, i.sgi_release, i.pk_sgi, i.year_acquisition,i.name_short) AS latest_inventory;
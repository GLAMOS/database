CREATE OR REPLACE VIEW inventory.vw_inventory_latest AS
	SELECT
		row_number() OVER() AS gid,
		latest_inventory.*,
		st_area(st_transform(latest_inventory.geom, 2056))::bigint AS area
		latest_inventor.year_acquisition
	FROM (
		SELECT
		i.pk_glacier,
		ST_UNION(i.geom) AS geom,
		i.sgi_release,

		FROM inventory.vw_inventory AS i

		JOIN inventory.vw_inventory_latest_year AS liry ON i.sgi_release = liry.latest_inventory_release_year

		GROUP BY i.pk_glacier, i.sgi_release) AS latest_inventory;
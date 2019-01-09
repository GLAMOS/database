CREATE OR REPLACE VIEW inventory.vw_inventory_latest_year AS
	SELECT MAX(sgi_release) AS latest_inventory_release_year
	FROM inventory.vw_inventory;
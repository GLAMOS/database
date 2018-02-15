CREATE OR REPLACE VIEW base_data.vw_glacier_identification AS
	SELECT glacier.pk, glacier.pk_vaw, pk_wgms, short_name, name as full_name,
	    (((((upper(glacier.river_level_3::text) || btrim(to_char(glacier.river_level_2::double precision, '9'::text))) || btrim(to_char(glacier.river_level_1::double precision, '9'::text))) ||
		CASE
		    WHEN glacier.river_level_0 IS NOT NULL THEN glacier.river_level_0
		    ELSE ''::character varying
		END::text) || '/'::text) || lpad(glacier.inventory_number::text, 2, '0')) AS sgi_code,
	    glacier.river_level_3,
	    glacier.river_level_2,
	    glacier.river_level_1,
	    glacier.river_level_0,
	    glacier.inventory_number
	FROM base_data.glacier;
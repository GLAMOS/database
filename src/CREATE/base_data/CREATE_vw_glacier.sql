DROP VIEW base_data.vw_glacier;

CREATE VIEW base_data.vw_glacier AS
	SELECT 
		row_number() OVER() AS gid, 
		glacier.pk, 
		glacier.pk_vaw, 
		pk_wgms,
		((('G00'::text || btrim(to_char(longitude * 1000::numeric, '9999'::text))) || 'E'::text) 
			|| btrim(to_char(latitude * 1000::numeric, '99999'::text))) || 'N'::text AS pk_glims,
		(((((upper(glacier.river_level_3::text) || btrim(to_char(glacier.river_level_2::double precision, '9'::text))) || btrim(to_char(glacier.river_level_1::double precision, '9'::text))) ||
		CASE
		    WHEN glacier.river_level_0 IS NOT NULL THEN glacier.river_level_0
		    ELSE ''::character varying
		END::text) || '/'::text) || lpad(glacier.inventory_code::text, 2, '0')) AS pk_sgi,
		name_short, 
		name as name_full,
		st_transform(st_setsrid(st_makepoint(
		longitude::double precision,
		latitude::double precision), 4326), 2056) AS geom,
	    glacier.river_level_3,
	    glacier.river_level_2,
	    glacier.river_level_1,
	    glacier.river_level_0,
	    glacier.inventory_code
	FROM base_data.glacier;
	
GRANT SELECT ON base_data.vw_glacier TO glro;
GRANT SELECT ON base_data.vw_glacier TO glrw;
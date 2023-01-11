CREATE OR REPLACE VIEW mass_balance.wgms_mass_balance_point_annual
 AS SELECT
	'CH' as POLITICAL_UNIT,
	g.name_full as NAME,
	g.pk_wgms as WGMS_ID,	
	date_part('year',(mbp.date_to)) as YEAR,
	mbp.name as POINT_ID,	
	mbp.date_from as FROM_DATE,
	mbp.date_to as TO_DATE,	
	ST_Y(st_transform(st_setsrid(st_makepoint(mbp.latitude::double precision, mbp.longitude::double precision), 21781), 4326)) as POINT_LAT,	-- to LV03 to WGS84
	ST_X(st_transform(st_setsrid(st_makepoint(mbp.latitude::double precision, mbp.longitude::double precision), 21781), 4326)) as POINT_LON,	-- to LV03 to WGS84
	mbp.altitude as POINT_ELEVATION,	
	mbp.massbalance_we as POINT_BALANCE,	
	mbp.massbalance_error as POINT_BALANCE_UNCERTAINTY,	
	mbp.density as DENSITY,	
	mbp.density_error as DENSITY_UNCERTAINTY,	
	CASE
		WHEN ot.name = 'annual' THEN 'BA'
		WHEN ot.name = 'wintersnow' THEN 'BW'
		WHEN ot.name = 'intermediate' THEN 'IN'
	END as BALANCE_CODE,	-- 'BS' does not exist for GLAMOS
	'' as REMARKS -- maybe add source
FROM mass_balance.point mbp
     LEFT JOIN base_data.vw_glacier g ON mbp.fk_glacier = g.pk
     LEFT JOIN mass_balance.observation_type ot ON mbp.fk_observation_type = ot.pk
WHERE date_part('year',(mbp.date_to)) = date_part('year', CURRENT_DATE)-1 AND ot.name = 'annual';

ALTER TABLE mass_balance.wgms_mass_balance_point_annual
    OWNER TO gladmin;
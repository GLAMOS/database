-- View: mass_balance.vw_mass_balance_index_seasonal_stake_location

-- DROP VIEW mass_balance.vw_mass_balance_index_seasonal_stake_location;

CREATE OR REPLACE VIEW mass_balance.vw_mass_balance_index_seasonal_stake_location AS
SELECT row_number() OVER () AS gid,
    g.pk_sgi,
    g.name_full as glacier_name,
	g.name_short as glacier_short,
	name as stake_name,
	amt.short_name as analysis_method_type,
	date_from_annual,
	date_from_winter,
	date_to_annual,
	date_to_winter,
	st_transform(st_setsrid(st_makepoint(longitude::double precision, latitude::double precision), 4326), 2056) AS geom,
	latitude,
	longitude,
	altitude,
	b_a_meas as annual_mass_balance,
	b_w_meas as winter_mass_balance,
	reference
	

   FROM mass_balance.index_seasonal ins
     LEFT JOIN base_data.vw_glacier g ON ins.fk_glacier = g.pk
	 LEFT JOIN mass_balance.analysis_method_type amt ON ins.fk_analysis_method_type = amt.pk;

ALTER TABLE mass_balance.vw_mass_balance_index_seasonal_stake_location
    OWNER TO gladmin;

GRANT ALL ON TABLE mass_balance.vw_mass_balance_index_seasonal_stake_location TO gladmin;
GRANT SELECT ON TABLE mass_balance.vw_mass_balance_index_seasonal_stake_location TO glrw;
GRANT SELECT ON TABLE mass_balance.vw_mass_balance_index_seasonal_stake_location TO glro;
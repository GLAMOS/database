-- View: mass_balance.vw_mb_index_spatial_seasonal_stake_location

-- DROP VIEW mass_balance.vw_mb_index_spatial_seasonal_stake_location;

CREATE OR REPLACE VIEW mass_balance.vw_mb_index_spatial_seasonal_stake_location
 AS
 SELECT row_number() OVER () AS gid,
    g.pk_sgi,
    g.name_full AS glacier_name,
    g.name_short AS glacier_short,
    ins.name AS stake_name,
    amt.short_name AS analysis_method_type,
    ins.date_from_annual,
    ins.date_from_winter,
    ins.date_to_annual,
    ins.date_to_winter,
    st_transform(st_setsrid(st_makepoint(ins.latitude::double precision, ins.longitude::double precision), 21781), 4326) AS geom,
    ins.latitude,
    ins.longitude,
    ins.altitude,
    ins.b_a_meas AS annual_mass_balance,
    ins.b_w_meas AS winter_mass_balance,
    ins.reference
   FROM mass_balance.index_spatial_seasonal ins
     LEFT JOIN base_data.vw_glacier g ON ins.fk_glacier = g.pk
     LEFT JOIN mass_balance.analysis_method_type amt ON ins.fk_analysis_method_type = amt.pk;

ALTER TABLE mass_balance.vw_mb_index_spatial_seasonal_stake_location
    OWNER TO gladmin;

GRANT ALL ON TABLE mass_balance.vw_mb_index_spatial_seasonal_stake_location TO gladmin;
GRANT SELECT ON TABLE mass_balance.vw_mb_index_spatial_seasonal_stake_location TO glrw;
GRANT SELECT ON TABLE mass_balance.vw_mb_index_spatial_seasonal_stake_location TO glro;
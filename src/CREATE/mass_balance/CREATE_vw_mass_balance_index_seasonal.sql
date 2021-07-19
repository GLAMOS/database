-- View: mass_balance.vw_mass_balance_index_seasonal

-- DROP VIEW mass_balance.vw_mass_balance_index_seasonal;

CREATE OR REPLACE VIEW mass_balance.vw_mass_balance_index_seasonal AS
SELECT row_number() OVER () AS gid,
    g.pk as pk_glacier,
	g.pk_sgi,
    g.name_full as glacier_name,
	g.name_short as glacier_short,
	name as stake_name,
	amt.short_name as analysis_method_type,
	det.short_name as embargo_type,
	date_from_annual,
	date_from_winter,
	date_fall_min,
	date_to_annual,
	date_to_winter,
	date_spring_max,
	st_transform(st_setsrid(st_makepoint(latitude::double precision, longitude::double precision), 21781), 4326) AS geom,
	latitude,
	longitude,
	altitude,
	b_a_meas as annual_mass_balance,
	b_w_meas as winter_mass_balance,
	c_a_obs as annual_accumulation,
	c_w_obs as winter_accumulation,
	a_a_obs as annual_ablation,
	a_w_obs as winter_ablation,
	b_a_fix as annual_mass_balance_fixed_period,
	b_w_fix as winter_mass_balance_fixed_period,
	c_a_fix as annual_accumulation_fixed_period,
	c_w_fix as winter_accumulation_fixed_period,
	a_a_fix as annual_ablation_fixed_period,
	a_w_fix as winter_ablation_fixed_period,
	reference
	

   FROM mass_balance.index_seasonal ins
     LEFT JOIN base_data.vw_glacier g ON ins.fk_glacier = g.pk
	 LEFT JOIN mass_balance.analysis_method_type amt ON ins.fk_analysis_method_type = amt.pk
	 LEFT JOIN administration.data_embargo_type det ON ins.fk_embargo_type = det.pk;

ALTER TABLE mass_balance.vw_mass_balance_index_seasonal
    OWNER TO gladmin;

GRANT ALL ON TABLE mass_balance.vw_mass_balance_index_seasonal TO gladmin;
GRANT SELECT ON TABLE mass_balance.vw_mass_balance_index_seasonal TO glrw;
GRANT SELECT ON TABLE mass_balance.vw_mass_balance_index_seasonal TO glro;
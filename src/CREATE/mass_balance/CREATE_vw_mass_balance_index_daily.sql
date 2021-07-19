-- View: mass_balance.vw_mass_balance_index_daily

-- DROP VIEW mass_balance.vw_mass_balance_index_daily;

CREATE OR REPLACE VIEW mass_balance.vw_mass_balance_index_daily AS
SELECT row_number() OVER () AS gid,
    g.pk as pk_glacier,
	g.pk_sgi,
    g.name_full as glacier_name,
	g.name_short as glacier_short,
	ind.name as stake_name,
	date,
	st_transform(st_setsrid(st_makepoint(latitude::double precision, longitude::double precision), 21781), 4326) AS geom,
	latitude,
	longitude,
	altitude,
	balance as mass_balance,
	accumulation,
	melt,
	st.name,
	temperature,
	precipitation,
	reference,
	investigator,
	creation_date
	

   FROM mass_balance.index_daily ind
     LEFT JOIN base_data.vw_glacier g ON ind.fk_glacier = g.pk
	 LEFT JOIN mass_balance.surface_type st ON ind.fk_surface_type = st.pk;

ALTER TABLE mass_balance.vw_mass_balance_index_daily
    OWNER TO gladmin;

GRANT ALL ON TABLE mass_balance.vw_mass_balance_index_daily TO gladmin;
GRANT SELECT ON TABLE mass_balance.vw_mass_balance_index_daily TO glrw;
GRANT SELECT ON TABLE mass_balance.vw_mass_balance_index_daily TO glro;
-- View: base_data.web_glacier_base_data

-- DROP VIEW base_data.web_glacier_base_data;

CREATE OR REPLACE VIEW base_data.web_glacier_base_data AS
 SELECT g.pk AS pk_glacier,
    g.name_short AS glacier_short_name,
    g.name_full AS glacier_full_name,
    g.pk_sgi,
    round(st_x(st_transform(g.geom, 3857))::numeric, 3) AS coordx,
    round(st_y(st_transform(g.geom, 3857))::numeric, 3) AS coordy,
    st_transform(g.geom, 3857) AS geom,
        CASE
            WHEN gpi.fk_glacier_particular_interest_type = 0 THEN true
            ELSE false
        END AS is_vig,
    il.area AS area_m2,
    il.year_acquisition AS area_year,
    hlcd.has_length,
    lc_latest.variation_quantitative AS last_length_change,
    lc_latest.date_from AS last_length_change_from,
    lc_latest.date_to AS last_length_change_to,
    lclo.latest_observation_variation_quantitative_cumulative AS last_length_change_cumulative,
    lcow.first_year AS first_year_length,
    lcow.last_year AS last_year_length,
    mbohd.mass_balance_observation_has_data AS has_mass,
    mblo.latest_mass_balance_annual_cumulative AS last_mass_change_cumulative,
    mbow.first_year_annual AS first_year_mass,
    mbow.last_year_annual AS last_year_mass,
    mb_observation_latest.mass_balance_annual AS last_mass_balance_observation,
    mb_observation_latest.date_from_annual AS last_mass_balance_observation_from,
    mb_observation_latest.date_to_annual AS last_mass_balance_observation_to,
    mb_fix_date_latest.mass_balance_annual AS last_mass_balance_fix_date,
    mb_fix_date_latest.date_from_annual AS last_mass_balance_fix_date_from,
    mb_fix_date_latest.date_to_annual AS last_mass_balance_fix_date_to,
        CASE
            WHEN hlcd.has_length = 0 AND mbohd.mass_balance_observation_has_data = 0 THEN 1
            ELSE 0
        END AS no_data
   FROM base_data.vw_glacier g
     LEFT JOIN length_change.vw_has_length_change_data hlcd ON hlcd.pk_glacier = g.pk
     LEFT JOIN length_change.web_length_change_latest lc_latest ON lc_latest.pk_glacier = g.pk
     LEFT JOIN length_change.vw_length_change_observation_window lcow ON lcow.pk_glacier = g.pk
     LEFT JOIN length_change.vw_length_change_latest_observation lclo ON lclo.pk_glacier = g.pk
     LEFT JOIN mass_balance.vw_mass_balance_observation_has_data mbohd ON mbohd.pk_glacier = g.pk
     LEFT JOIN mass_balance.web_mass_balance_observation_latest mb_observation_latest ON mb_observation_latest.pk_glacier = g.pk
     LEFT JOIN mass_balance.web_mass_balance_fix_date_latest mb_fix_date_latest ON mb_fix_date_latest.pk_glacier = g.pk
     LEFT JOIN mass_balance.vw_mass_balance_observation_window mbow ON mbow.pk_glacier = g.pk
     LEFT JOIN mass_balance.vw_mass_balance_observation_latest mblo ON mblo.pk_glacier = g.pk
     LEFT JOIN base_data.vw_glacier_particular_interest gpi ON gpi.pk = g.pk
     LEFT JOIN inventory.vw_inventory_latest_xyz il ON il.pk_glacier = g.pk;

ALTER TABLE base_data.web_glacier_base_data
    OWNER TO gladmin;

GRANT ALL ON TABLE base_data.web_glacier_base_data TO gladmin;
GRANT SELECT ON TABLE base_data.web_glacier_base_data TO glporo;
GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE base_data.web_glacier_base_data TO glrw;
GRANT SELECT ON TABLE base_data.web_glacier_base_data TO glro;

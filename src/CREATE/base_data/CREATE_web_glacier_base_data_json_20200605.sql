-- View: base_data.web_glacier_base_data_json

-- DROP VIEW base_data.web_glacier_base_data_json;

CREATE OR REPLACE VIEW base_data.web_glacier_base_data_json AS
 SELECT jsonb_build_object('name', 'gletscher_inventar', 'type', 'FeatureCollection', 'crs', json_build_object('type', 'name', 'properties', json_build_object('name', 'EPSG:3857')), 'features', jsonb_agg(features.feature)) AS jsonb_build_object
   FROM ( SELECT jsonb_build_object('type', 'Feature', 'id', inputs.pk_sgi, 'geometry', st_asgeojson(inputs.geom, 3, 0)::jsonb, 'properties', to_jsonb(inputs.*) - 'gid'::text - 'geom'::text) AS feature
           FROM ( SELECT web_glacier_base_data.pk_glacier,
                    web_glacier_base_data.glacier_short_name,
                    web_glacier_base_data.glacier_full_name,
                    web_glacier_base_data.pk_sgi,
                    web_glacier_base_data.coordx,
                    web_glacier_base_data.coordy,
                    web_glacier_base_data.geom,
                    web_glacier_base_data.is_vig,
                    web_glacier_base_data.area_m2,
                    web_glacier_base_data.area_year,
                    web_glacier_base_data.has_length,
                    web_glacier_base_data.last_length_change,
                    web_glacier_base_data.last_length_change_from,
                    web_glacier_base_data.last_length_change_to,
                    web_glacier_base_data.last_length_change_cumulative,
                    web_glacier_base_data.first_year_length,
                    web_glacier_base_data.last_year_length,
                    web_glacier_base_data.has_mass,
                    web_glacier_base_data.last_mass_change_cumulative,
                    web_glacier_base_data.first_year_mass,
                    web_glacier_base_data.last_year_mass,
                    web_glacier_base_data.last_mass_balance_observation,
                    web_glacier_base_data.last_mass_balance_observation_from,
                    web_glacier_base_data.last_mass_balance_observation_to,
                    web_glacier_base_data.last_mass_balance_fix_date,
                    web_glacier_base_data.last_mass_balance_fix_date_from,
                    web_glacier_base_data.last_mass_balance_fix_date_to,
                    web_glacier_base_data.no_data
                   FROM base_data.web_glacier_base_data) inputs) features;

ALTER TABLE base_data.web_glacier_base_data_json
    OWNER TO gladmin;
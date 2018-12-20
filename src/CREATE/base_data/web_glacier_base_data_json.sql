CREATE OR REPLACE VIEW base_data.web_glacier_base_data_json AS

SELECT jsonb_build_object(

        'name', 'gletscher_inventar',

        'type',     'FeatureCollection',

        'crs',  json_build_object(

        'type',      'name', 

        'properties', json_build_object(

            'name', 'EPSG:3857')),

    'features', jsonb_agg(features.feature)

)

FROM (

  SELECT jsonb_build_object(

    'type',       'Feature',

    'id',         pk_sgi,

    'geometry',   ST_AsGeoJson(geom, 3, 0)::jsonb,

    'properties', to_jsonb(inputs) - 'gid' - 'geom'

  ) AS feature

  FROM (SELECT * FROM  base_data.web_glacier_base_data) inputs) features;
  
  
GRANT ALL ON TABLE    base_data.web_glacier_base_data_json TO gladmin;
GRANT SELECT ON TABLE base_data.web_glacier_base_data_json TO glporo;
GRANT SELECT ON TABLE base_data.web_glacier_base_data_json TO glro;

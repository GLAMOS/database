-- View: base_data.vw_outline_polygons

-- DROP VIEW base_data.vw_outline_polygons;

CREATE OR REPLACE VIEW base_data.vw_outline_polygons
 AS

SELECT row_number() OVER () AS gid,
    o.pk as pk_outline,
	g.pk as pk_glacier,
    g.pk_sgi,
    g.pk_vaw,
	ST_MakePolygon(ST_ForceClosed(o.geom)) as geom,
	ST_IsClosed(o.geom) as isclosed,
    ST_IsPolygonCW(ST_MakePolygon(ST_ForceClosed(o.geom))) AS isGlacier,
	ST_IsPolygonCCW(ST_MakePolygon(ST_ForceClosed(o.geom))) AS isIsland,
    o.measure_date,
    g.name_full,
    g.name_short,
    oot.short_name AS object_origin,
    pcm.short_name AS position_capture_method,
    hcm.short_name AS height_capture_method,
    ot.short_name AS object_type,
    obs.name AS institution,
    (obs.name_first::text || ' '::text) || obs.name_last::text AS observer
   FROM base_data.outline o
     LEFT JOIN base_data.vw_glacier g ON o.fk_glacier = g.pk
     LEFT JOIN administration.object_origin_type oot ON o.fk_object_origin_type = oot.pk
     LEFT JOIN administration.position_capture_method_type pcm ON o.fk_position_capture_method_type = pcm.pk
     LEFT JOIN administration.height_capture_method_type hcm ON o.fk_height_capture_method_type = hcm.pk
     LEFT JOIN base_data.object_type ot ON o.fk_object_type = ot.pk
     LEFT JOIN administration.vw_observer obs ON o.fk_observer = obs.pk
  WHERE ot.short_name = 'Outline' 
  ORDER BY g.pk_sgi, o.measure_date, (st_length(o.geom)) DESC;
  
  ALTER TABLE base_data.vw_outline_polygons
    OWNER TO gladmin;

GRANT ALL ON TABLE base_data.vw_outline_polygons TO gladmin;
GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE base_data.vw_outline_polygons TO glrw;
GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE base_data.vw_outline_polygons TO gldirw;
GRANT SELECT ON TABLE base_data.vw_outline_polygons TO glro;
GRANT SELECT ON TABLE base_data.vw_outline_polygons TO gldiro;
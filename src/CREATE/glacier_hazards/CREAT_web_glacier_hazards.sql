-- View: glacier_hazard.web_glacier_hazards

-- DROP VIEW glacier_hazard.web_glacier_hazards;

CREATE OR REPLACE VIEW glacier_hazard.web_glacier_hazards AS
 SELECT row_number() OVER () AS gid,
    gl.name_full,
    e.start_year,
    string_agg(DISTINCT ht.hazard_maintype_name::text, ', '::text) AS hazard_maintype,
    string_agg(DISTINCT dt.damage_maintype_name::text, ', '::text) AS damage_maintype,
    e.pk AS event_id,
    st_union(g.geom) AS geom,
    g.symbology
   FROM glacier_hazard.event e
     LEFT JOIN base_data.vw_glacier gl ON e.fk_glacier = gl.pk
     LEFT JOIN glacier_hazard.event2hazard_type e2ht ON e.pk = e2ht.fk_event
     LEFT JOIN glacier_hazard.hazard_type ht ON e2ht.fk_hazard_type = ht.pk
     LEFT JOIN glacier_hazard.event2damage_type e2dt ON e.pk = e2dt.fk_event
     LEFT JOIN glacier_hazard.damage_type dt ON e2dt.fk_damage_type = dt.pk
     LEFT JOIN glacier_hazard.event2geometries e2g ON e.pk = e2g.fk_event
     LEFT JOIN glacier_hazard.geometries g ON e2g.fk_geometries = g.pk
  GROUP BY e.pk, gl.name_full, g.symbology
  ORDER BY e.start_year;

ALTER TABLE glacier_hazard.web_glacier_hazards
    OWNER TO gladmin;

GRANT SELECT ON TABLE glacier_hazard.web_glacier_hazards TO gldiro;
GRANT ALL ON TABLE glacier_hazard.web_glacier_hazards TO gladmin;
GRANT SELECT ON TABLE glacier_hazard.web_glacier_hazards TO glro;

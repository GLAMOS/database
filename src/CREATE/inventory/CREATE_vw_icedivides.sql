CREATE OR REPLACE VIEW inventory.vw_icedivides AS
 SELECT row_number() OVER () AS gid,
    g.pk AS fk_glacier_a,
    g.pk_sgi AS pk_sgi_a,
    g.name_full AS name_full_a,
	g.name_short AS name_short_a,
	g2.pk AS fk_glacier_b,
    g2.pk_sgi AS pk_sgi_b,
    g2.name_full AS name_full_b,
	g2.name_short AS name_short_b,
    idg.acquisition AS year_acquisition,
    idg.release AS sgi_release,
	idg.geom,
    st_length(st_transform(idg.geom, 2056))/1000::double precision AS length_km
    
   FROM inventory.icedivides_geometry idg
     LEFT JOIN base_data.vw_glacier g ON idg.fk_glacier_a = g.pk
	 LEFT JOIN base_data.vw_glacier g2 on idg.fk_glacier_b = g2.pk;
     

ALTER TABLE inventory.vw_icedivides
    OWNER TO gladmin;

GRANT SELECT ON TABLE inventory.vw_icedivides TO gldiro;
GRANT ALL ON TABLE inventory.vw_icedivides TO gladmin;
GRANT SELECT ON TABLE inventory.vw_icedivides TO glro;
GRANT SELECT ON TABLE inventory.vw_icedivides TO glrw;
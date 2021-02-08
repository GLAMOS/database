-- View: glacier_hazard.vw_glacier_hazard_agg

-- DROP VIEW glacier_hazard.vw_glacier_hazard_agg;

CREATE OR REPLACE VIEW glacier_hazard.vw_glacier_hazard_agg AS
SELECT 
	e.pk,
	e.fk_glacier,
	gl.name_full as glacier_name,
	gl.pk_sgi as sgi_id,
	concat(e.start_year,'-',start_month,'-',start_day) as start_date,
	e.start_time,
	e.start_text as start_date_remark,
	concat(e.end_year,'-',end_month,'-',end_day) as end_date,
	e.end_time,
	e.end_text as end_date_remark,
	string_agg(ht.hazard_maintype_name,', ') as hazard_main_type,
	string_agg(ht.hazard_subtype_name,', ') as hazard_sub_type,
	string_agg(dt.damage_maintype_name,', ') as damage_main_type,
	string_agg(dt.damage_subtype_name,', ') as damage_sub_type,
	string_agg(dt.damage_detailtype_name,', ') as damage_detail_type,
	e.volume_m3,
	e.area_damaged_m2,
	e.dead_people,
	e.injured_people,
	e.description_de,
	e.description_en,
	string_agg(concat(pub.author,' (',pub.date_of_publication,') ', pub.title),' ;') as primary_source,
	e.secondary_source,
	st_union(geom.geom) as geometries
	
FROM glacier_hazard.event e
    LEFT JOIN glacier_hazard.event2hazard_type e2ht ON e.pk = e2ht.fk_event
    LEFT JOIN glacier_hazard.hazard_type ht ON e2ht.fk_hazard_type = ht.pk
    LEFT JOIN glacier_hazard.event2damage_type e2dt ON e.pk = e2dt.fk_event
    LEFT JOIN glacier_hazard.damage_type dt ON e2dt.fk_damage_type = dt.pk
	LEFT JOIN glacier_hazard.event2publication e2p ON e.pk = e2p.fk_event
	LEFT JOIN glacier_hazard.publication pub ON e2p.fk_publication = pub.pk
	LEFT JOIN glacier_hazard.event2geometries e2g ON e.pk = e2g.fk_event
	LEFT JOIN glacier_hazard.geometries geom ON e2g.fk_geometries = geom.pk
    LEFT JOIN base_data.vw_glacier gl ON e.fk_glacier = gl.pk
GROUP BY e.pk, gl.name_full, gl.pk_sgi
ORDER BY start_date;

ALTER TABLE glacier_hazard.vw_glacier_hazard_agg
    OWNER TO gladmin;

GRANT ALL ON TABLE glacier_hazard.vw_glacier_hazard_agg TO gladmin;
GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE glacier_hazard.vw_glacier_hazard_agg TO glrw;
GRANT SELECT ON TABLE glacier_hazard.vw_glacier_hazard_agg TO glro;
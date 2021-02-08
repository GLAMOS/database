-- View: glacier_hazard.vw_glacier_hazard

-- DROP VIEW glacier_hazard.vw_glacier_hazard;

CREATE OR REPLACE VIEW glacier_hazard.vw_glacier_hazard AS
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
	ht.hazard_maintype_name   as hazard_main_type,
	ht.hazard_subtype_name    as hazard_sub_type,
	dt.damage_maintype_name   as damage_main_type,
	dt.damage_subtype_name    as damage_sub_type,
	dt.damage_detailtype_name as damage_detail_type,
	e.volume_m3,
	e.area_damaged_m2,
	e.dead_people,
	e.injured_people,
	e.description_de,
	e.description_en,
	e.secondary_source
	
FROM glacier_hazard.event e
    LEFT JOIN glacier_hazard.event2hazard_type e2ht ON e.pk = e2ht.fk_event
    LEFT JOIN glacier_hazard.hazard_type ht ON e2ht.fk_hazard_type = ht.pk
    LEFT JOIN glacier_hazard.event2damage_type e2dt ON e.pk = e2dt.fk_event
    LEFT JOIN glacier_hazard.damage_type dt ON e2dt.fk_damage_type = dt.pk
    LEFT JOIN base_data.vw_glacier gl ON e.fk_glacier = gl.pk
ORDER BY start_date;

ALTER TABLE glacier_hazard.vw_glacier_hazard
    OWNER TO gladmin;

GRANT ALL ON TABLE glacier_hazard.vw_glacier_hazard TO gladmin;
GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE glacier_hazard.vw_glacier_hazard TO glrw;
GRANT SELECT ON TABLE glacier_hazard.vw_glacier_hazard TO glro;
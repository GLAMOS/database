/* ---------------------------------------------------- */
/*  Generated by Elias Hodel                 		*/
/*  Created On : 11.03.2020          				*/
/*  DBMS       : PostgreSQL, GLAMOS-DB				*/
/* ---------------------------------------------------- */

CREATE OR REPLACE VIEW glacier_hazard.vw_geometries AS
	SELECT 
			row_number() OVER() AS gid,
			g.pk                AS geom_pk,
			g.symbology         AS symbology,
			e2g.fk_event        AS e2g_fk_event,
			e2g.fk_geometries   AS e2g_fk_geometries,
			e.pk                AS e_pk,
			g.geom              AS geom,
			e.start_year        AS start_year,
			e.start_month		AS start_month,
			e.start_day			AS start_day,
			e.end_year			AS end_year,
			e.end_month			AS end_month,
			e.end_day			AS end_day,
			ht.pk				AS hazard_pk,
			ht.hazard_maintype_name	AS hazard_maintype,
			ht.hazard_subtype_name	AS hazard_subtype,
			dt.pk 				AS damage_pk,
			dt.damage_maintype_name AS damage_maintype,
			dt.damage_subtype_name AS damage_subtype,
			dt.damage_detailtype_name AS damage_detailtype,
			gl.name_full   AS name
			

	FROM glacier_hazard.geometries AS g

	LEFT JOIN glacier_hazard.event2geometries AS e2g ON 
			(g.pk = e2g.fk_geometries)
	LEFT JOIN glacier_hazard.event AS e ON 
			(e2g.fk_event = e.pk)
	LEFT JOIN glacier_hazard.event2hazard_type AS e2ht ON 
			(e.pk = e2ht.fk_event)
	LEFT JOIN glacier_hazard.hazard_type AS ht ON 
			(e2ht.fk_hazard_type = ht.pk)			
	LEFT JOIN glacier_hazard.event2damage_type AS e2dt ON 
			(e.pk = e2dt.fk_event)
	LEFT JOIN glacier_hazard.damage_type AS dt ON 
			(e2dt.fk_damage_type = dt.pk)
	LEFT JOIN base_data.vw_glacier AS gl ON 
			(e.fk_glacier = gl.pk);

GRANT ALL ON TABLE glacier_hazard.vw_geometries TO gladmin;
GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE glacier_hazard.vw_geometries TO glrw;
GRANT SELECT ON TABLE glacier_hazard.vw_geometries TO glro;
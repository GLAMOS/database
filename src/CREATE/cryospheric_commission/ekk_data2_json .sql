CREATE OR REPLACE VIEW cryospheric_commission.ekk_data2_json AS
 SELECT json_build_object(
				'id', d2d.objid, 
				'type', d2d.objtyp, 
				'name', json_build_object(
							'de', obj.name_de, 
							'fr', obj.name_fr, 
							'it', obj.name_it, 
							'en', obj.name_en), 
				'point', json_build_object(
							'x', obj.xpos, 
							'y', obj.ypos, 
							'z', obj.zpos), 
				'data', json_agg(json_build_object(
							'x', d2d.xval, 'y', d2d.yval)), 
				'xAxis', json_build_object(
							'label', json_build_object(
									'de', t2d.xname_de, 
									'fr', t2d.xname_fr, 
									'it', t2d.xname_it, 
									'en', t2d.xname_en), 
							'unit', json_build_object(
									'de', t2d.xunit_de, 
									'fr', t2d.xunit_fr, 
									'it', t2d.xunit_it, 
									'en', t2d.xunit_en)), 
				'yAxis', json_build_object(
								'label', json_build_object(
									'de', t2d.yname_de, 
									'fr', t2d.yname_fr, 
									'it', t2d.yname_it, 
									'en', t2d.yname_en), 
								'unit', json_build_object(
									'de', t2d.yunit_de, 
									'fr', t2d.yunit_fr, 
									'it', t2d.yunit_it, 
									'en', t2d.yunit_en))) AS json_build_object
   FROM cryospheric_commission.data2d d2d
     JOIN cryospheric_commission.obj ON d2d.objid = obj.objid
     JOIN cryospheric_commission.datatype2d t2d ON d2d.objtyp = t2d.objtyp
  GROUP BY d2d.objid, d2d.objtyp, obj.name_de, obj.name_fr, obj.name_it, obj.name_en, 
		   obj.xpos, obj.ypos, obj.zpos, t2d.xname_de, t2d.xname_fr, t2d.xname_it, 
		   t2d.xname_en, t2d.xunit_de, t2d.xunit_fr, t2d.xunit_it, t2d.xunit_en, 
		   t2d.yname_de, t2d.yname_fr, t2d.yname_it, t2d.yname_en, t2d.yunit_de, 
		   t2d.yunit_fr, t2d.yunit_it, t2d.yunit_en
  ORDER BY d2d.objid, d2d.objtyp;
 
ALTER TABLE cryospheric_commission.ekk_data2_json
    OWNER TO gladmin;
 
GRANT ALL ON TABLE cryospheric_commission.ekk_data2_json TO gladmin;
GRANT SELECT ON TABLE cryospheric_commission.ekk_data2_json TO ekk;
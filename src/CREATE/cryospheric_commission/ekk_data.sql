CREATE OR REPLACE VIEW cryospheric_commission.ekk_data AS
 SELECT d.objid,
    d.objtyp,
    d.xval,
    d.yval,
    o.name_de,
    o.name_fr,
    o.name_it,
    o.name_en,
    o.xpos,
    o.ypos,
    o.zpos,
    t.xname_de,
    t.xname_fr,
    t.xname_it,
    t.xname_en,
    t.xunit_de,
    t.xunit_fr,
    t.xunit_it,
    t.xunit_en,
    t.yname_de,
    t.yname_fr,
    t.yname_it,
    t.yname_en,
    t.yunit_de,
    t.yunit_fr,
    t.yunit_it,
    t.yunit_en
   FROM cryospheric_commission.ekk_data2d_union d
     JOIN cryospheric_commission.obj o ON d.objid = o.objid
     JOIN cryospheric_commission.datatype2d t ON d.objtyp = t.objtyp;
 
ALTER TABLE cryospheric_commission.ekk_data
    OWNER TO gladmin;
 
GRANT ALL ON TABLE cryospheric_commission.ekk_data TO gladmin;
GRANT SELECT ON TABLE cryospheric_commission.ekk_data TO ekk;
CREATE TABLE cryospheric_commission.obj (
    gid SERIAL PRIMARY KEY,
    objid TEXT NOT NULL UNIQUE,
    name_de TEXT NOT NULL,
    name_fr TEXT NOT NULL,
    name_it TEXT NOT NULL,
    name_en TEXT NOT NULL,
    xpos FLOAT8 NOT NULL,
    ypos FLOAT8 NOT NULL,
    zpos FLOAT8 NOT NULL
);
CREATE INDEX obj_objid_idx ON cryospheric_commission.obj (objid);
CREATE INDEX obj_xpos_idx ON cryospheric_commission.obj (xpos);
CREATE INDEX obj_ypos_idx ON cryospheric_commission.obj (ypos);
CREATE INDEX obj_zpos_idx ON cryospheric_commission.obj (zpos);
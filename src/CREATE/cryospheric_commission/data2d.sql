CREATE TABLE cryospheric_commission.data2d (
    id SERIAL PRIMARY KEY,
    objid TEXT NOT NULL
        REFERENCES cryospheric_commission.obj(objid) ON DELETE SET DEFAULT,
    objtyp INT NOT NULL
        REFERENCES cryospheric_commission.datatype2d(objtyp) ON DELETE SET DEFAULT,
    xval REAL NOT NULL,
    yval REAL NOT NULL
);
CREATE INDEX data2d_objid_idx ON cryospheric_commission.data2d (objid);
CREATE INDEX data2d_objtyp_idx ON cryospheric_commission.data2d (objtyp);
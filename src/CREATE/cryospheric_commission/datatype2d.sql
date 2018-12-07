CREATE TABLE cryospheric_commission.datatype2d (
    id SERIAL PRIMARY KEY,
    objtyp INT NOT NULL UNIQUE,
    xname_de TEXT NOT NULL,
    xname_fr TEXT NOT NULL,
    xname_it TEXT NOT NULL,
    xname_en TEXT NOT NULL,
    xunit_de TEXT NOT NULL,
    xunit_fr TEXT NOT NULL,
    xunit_it TEXT NOT NULL,
    xunit_en TEXT NOT NULL,
    yname_de TEXT NOT NULL,
    yname_fr TEXT NOT NULL,
    yname_it TEXT NOT NULL,
    yname_en TEXT NOT NULL,
    yunit_de TEXT NOT NULL,
    yunit_fr TEXT NOT NULL,
    yunit_it TEXT NOT NULL,
    yunit_en TEXT NOT NULL
);
CREATE INDEX datatype2d_objtyp_idx ON cryospheric_commission.datatype2d (objtyp);

CREATE SCHEMA cryospheric_commission
    AUTHORIZATION postgres;

COMMENT ON SCHEMA cryospheric_commission
    IS 'Schema for data and views used by the web portal of the cryospheric_commission of Switzerland';

GRANT USAGE ON SCHEMA cryospheric_commission TO ekk;

GRANT ALL ON SCHEMA public TO postgres;

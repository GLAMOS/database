CREATE OR REPLACE VIEW cryospheric_commission.ekk_data_json AS
 SELECT row_to_json(ekk.*) AS row_to_json
   FROM cryospheric_commission.ekk_data ekk;
 
ALTER TABLE cryospheric_commission.ekk_data_json
    OWNER TO gladmin;
 
GRANT ALL ON TABLE cryospheric_commission.ekk_data_json TO gladmin;
GRANT SELECT ON TABLE cryospheric_commission.ekk_data_json TO ekk;
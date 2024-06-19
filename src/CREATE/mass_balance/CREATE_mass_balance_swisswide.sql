-- Table: mass_balance.swisswide

-- DROP TABLE mass_balance.swisswide;

CREATE TABLE mass_balance.swisswide
(
    pk uuid NOT NULL,
    fk_glacier uuid NOT NULL,
    year integer NOT NULL,
    area numeric(9,6) NOT NULL,
    mb_evolution numeric(5,3) NOT NULL,
    vol_evolution numeric(15,12) NOT NULL,
    CONSTRAINT swisswide_pkey PRIMARY KEY (pk),
    CONSTRAINT fk_glacier FOREIGN KEY (fk_glacier)
        REFERENCES base_data.glacier (pk) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE mass_balance.swisswide
    OWNER to gladmin;

GRANT ALL ON TABLE mass_balance.swisswide TO gladmin;

GRANT DELETE, UPDATE, INSERT, SELECT ON TABLE mass_balance.swisswide TO gldirw;
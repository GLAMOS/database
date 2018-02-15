DROP TABLE mass_balance.mass_balance_glacier;

CREATE TABLE mass_balance.mass_balance_glacier (
    pk                           uuid      NOT NULL CONSTRAINT mass_balance_glacier_pk PRIMARY KEY,
    fk_glacier                   bigint    NOT NULL REFERENCES base_data.glacier,
    fk_mass_balance_glacier_type smallint  NOT NULL REFERENCES mass_balance.mass_balance_glacier_type,
    date_annual_from             date,
    date_annual_to               date,
    date_winter_start            date,
    date_winter_end              date,
    annual_mass_balance          integer,
    winter_mass_balance          integer,
    equilibrium_line_altitude    smallint,
    accumulation_area_ratio      smallint
);
DROP TABLE mass_balance.mass_balance_glacier_type;

CREATE TABLE mass_balance.mass_balance_glacier_type (
    pk           smallint   NOT NULL CONSTRAINT pk PRIMARY KEY,
    short_name   varchar(5) NOT NULL,
    description  varchar(50)
);
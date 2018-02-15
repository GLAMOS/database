DROP TABLE base_data.glacier_picture;

CREATE TABLE base_data.glacier_picture (
    pk                       uuid              NOT NULL CONSTRAINT pk_glacier_picture PRIMARY KEY,
    fk_glacier               bigint            NOT NULL REFERENCES base_data.glacier,
    picture_name             varchar(256)      NOT NULL,
    picture_date             date              NOT NULL,
    photograph_name_last     varchar(50)       NOT NULL,
    photograph_name_first    varchar(50),
    mass_balance_title       smallint          NOT NULL,
    length_change_title      smallint          NOT NULL
) TABLESPACE vector;
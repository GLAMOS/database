DROP TABLE base_data.glacier;

CREATE TABLE base_data.glacier (
    pk         uuid  NOT NULL,
    pk_vaw     bigint  NOT NULL CONSTRAINT pk_vaw PRIMARY KEY,
    pk_wgms    varchar(14),
    short_name varchar(20),
    name       varchar(50),
    river_level_3 varchar(1) NOT NULL,
    river_level_2 smallint NOT NULL,
    river_level_1 smallint NOT NULL,
    river_level_0 varchar(1),
    inventory_number smallint NOT NULL
);
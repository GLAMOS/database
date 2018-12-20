DROP TABLE base_data.glacier_picture;

CREATE TABLE base_data.glacier_picture (
    pk                       uuid              NOT NULL CONSTRAINT pk_glacier_picture PRIMARY KEY,
    fk_glacier               uuid              NOT NULL,
    fk_glacier_picture_type  smallint          NOT NULL,
    picture_name             varchar(256)      NOT NULL,
    picture_date             date              NOT NULL,
    photograph_name_last     varchar(50)       NOT NULL,
    photograph_name_first    varchar(50)
) TABLESPACE vector;

ALTER TABLE base_data.glacier_picture ADD CONSTRAINT "FK_glacier_picture_glacier"
    FOREIGN KEY (fk_glacier) REFERENCES base_data.glacier (pk) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE base_data.glacier_picture ADD CONSTRAINT "FK_glacier_picture_type"
    FOREIGN KEY (fk_glacier_picture_type) REFERENCES base_data.glacier_picture_type (pk) ON DELETE CASCADE ON UPDATE CASCADE;
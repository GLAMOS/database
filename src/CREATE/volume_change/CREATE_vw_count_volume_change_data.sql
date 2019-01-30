-- View: volume_change.vw_count_volume_change_data

-- DROP VIEW volume_change.vw_count_volume_change_data;

CREATE OR REPLACE VIEW volume_change.vw_count_volume_change_data AS
 SELECT vw_volume_change.pk_glacier,
    vw_volume_change.pk_vaw,
    vw_volume_change.pk_sgi,
    count(*) AS count_volume_change_data
   FROM volume_change.vw_volume_change
  GROUP BY vw_volume_change.pk_glacier, vw_volume_change.pk_vaw, vw_volume_change.pk_sgi;

ALTER TABLE volume_change.vw_count_volume_change_data
    OWNER TO gladmin;

GRANT ALL ON TABLE volume_change.vw_count_volume_change_data TO gladmin;

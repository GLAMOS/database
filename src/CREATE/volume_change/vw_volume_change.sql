CREATE OR REPLACE VIEW volume_change.vw_volume_change AS
SELECT
 *
FROM
 volume_change.volume_change vc;

GRANT SELECT ON volume_change.vw_volume_change TO glro;
GRANT SELECT ON volume_change.vw_volume_change TO glrw;
GRANT SELECT ON volume_change.vw_volume_change TO glporo;
GRANT SELECT ON volume_change.vw_volume_change TO gldiro;
GRANT SELECT ON volume_change.vw_volume_change TO gldirw;
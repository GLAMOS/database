CREATE OR REPLACE VIEW length_change.vw_length_change_data AS
	SELECT
		*
	FROM
		length_change.length_change_data;

GRANT SELECT ON volume_change.vw_volume_change TO glro;
GRANT SELECT ON volume_change.vw_volume_change TO glrw;
GRANT SELECT ON volume_change.vw_volume_change TO glporo;
GRANT SELECT ON volume_change.vw_volume_change TO gldiro;
GRANT SELECT ON volume_change.vw_volume_change TO gldirw;
CREATE OR REPLACE VIEW base_data.web_glacier_home_screen_json AS

	SELECT
		JSONB_BUILD_OBJECT(
			'pk_glacier', ghs.pk_glacier,
			'pk_sgi', ghs.pk_sgi,
			'glacier_full_name', ghs.glacier_full_name
		)
	FROM base_data.web_glacier_home_screen AS ghs;

ALTER TABLE base_data.web_glacier_home_screen_json
    OWNER TO gladmin;

GRANT SELECT ON TABLE base_data.web_glacier_home_screen_json TO glporo;
GRANT SELECT ON TABLE base_data.web_glacier_home_screen_json TO glro;
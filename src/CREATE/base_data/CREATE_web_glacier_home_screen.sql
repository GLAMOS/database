CREATE OR REPLACE VIEW base_data.web_glacier_home_screen AS

	SELECT
		g.pk                 AS pk_glacier,
		g.pk_sgi             AS pk_sgi,
		g.name_full          AS glacier_full_name
	FROM base_data.glacier_particular_interest AS gpi

	LEFT JOIN base_data.vw_glacier AS g ON
		(gpi.fk_glacier = g.pk)
	LEFT JOIN base_data.glacier_particular_interest_type AS gpit ON
		(gpi.fk_glacier_particular_interest_type = gpit.pk)
	WHERE gpit.pk = 0; 

ALTER TABLE base_data.web_glacier_home_screen
    OWNER TO gladmin;

GRANT ALL ON TABLE base_data.web_glacier_home_screen TO gladmin;
GRANT SELECT ON TABLE base_data.web_glacier_home_screen TO glporo;
GRANT SELECT ON TABLE base_data.web_glacier_home_screen TO glro;
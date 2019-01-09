CREATE OR REPLACE VIEW vw_glacier_particular_interest AS
	SELECT 
		row_number() OVER() AS gid, 
		g.pk,
		g.pk_sgi,
		g.name_full,
		gpi.fk_glacier_particular_interest_type,
		gpit.short_name,
		gpit.description
		
	FROM base_data.glacier_particular_interest AS gpi
	LEFT JOIN base_data.vw_glacier AS g ON g.pk = gpi.fk_glacier
	LEFT JOIN base_data.glacier_particular_interest_type AS gpit ON gpit.pk = gpi.fk_glacier_particular_interest_type;

GRANT SELECT ON base_data.vw_glacier_particular_interest TO glro;
GRANT SELECT ON base_data.vw_glacier_particular_interest TO glrw;
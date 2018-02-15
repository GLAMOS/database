CREATE OR REPLACE VIEW base_data.web_glacier_picture AS

SELECT
	fk_glacier,
	picture_name,
	picture_date,
	CASE
          WHEN photograph_name_first IS NULL THEN photograph_name_last
          ELSE photograph_name_first || ' ' || photograph_name_last
	END AS photograph
	

FROM base_data.glacier_picture;
-- View: repeatphoto.vw_doi_picture_summary

-- DROP VIEW repeatphoto.vw_doi_picture_summary;

CREATE OR REPLACE VIEW repeatphoto.vw_doi_picture_summary
 AS
 SELECT pic.name AS Picture_Name,
    concat((((loc.x_lv95 || ' '::text) || loc.y_lv95) || ' '::text) || loc.z_ln02) AS Coordinates,
	pic.view_direction as View_direction,
    pic.date_taken as Date,
	pic.year_taken as Year,
    string_agg(((g.name_full::text || ' ('::text) || g.pk_sgi) || ')'::text, ', '::text) AS Glaciers,
	pic.copyright As Copyright,
	concat('https://doi.glamos.ch/repeatphoto/pictures/'::text || pic.filename::text) AS Thumbnail,
    concat('https://doi.glamos.ch/repeatphoto/pictures/'::text || pic.filename::text) AS Download

   FROM repeatphoto.picture pic
     LEFT JOIN repeatphoto.vw_location loc ON loc.pk = pic.fk_location
	 LEFT JOIN repeatphoto.vw_pictures2glaciers p2g ON p2g.fk_picture = pic.pk
	 LEFT JOIN base_data.vw_glacier g ON g.pk = p2g.fk_glacier
   GROUP BY pic.name, coordinates, Date, year, pic.view_direction, Copyright, Thumbnail, Download
   Order BY Picture_name;

ALTER TABLE repeatphoto.vw_doi_picture_summary
    OWNER TO gladmin;

GRANT ALL ON TABLE repeatphoto.vw_doi_picture_summary TO gladmin;
GRANT SELECT ON TABLE repeatphoto.vw_doi_picture_summary TO glrw;
GRANT SELECT ON TABLE repeatphoto.vw_doi_picture_summary TO glro;
/* ------------------------------------ */
/*  GLAMOS, Elias Hodel         		*/
/*  Created On : 13-August-2024 16:16:20*/
/*  DBMS       : PostgreSQL 			*/
/* ------------------------------------ */

/* Drop View */
-- DROP VIEW repeatphoto.vw_glaciersONpicture;

/* Create View */
CREATE OR REPLACE VIEW repeatphoto.vw_glaciers_on_picture
 AS
 SELECT p2g.fk_picture,
    pic.name AS picture_name,
    string_agg(((g.name_full::text || ' ('::text) || g.pk_sgi) || ')'::text, ', '::text) AS glaciers
   FROM repeatphoto.pictures2glaciers p2g
     LEFT JOIN repeatphoto.picture pic ON pic.pk = p2g.fk_picture
     LEFT JOIN base_data.vw_glacier g ON g.pk = p2g.fk_glacier
  GROUP BY p2g.fk_picture, pic.name;

ALTER TABLE repeatphoto.vw_glaciers_on_picture
    OWNER TO gladmin;

GRANT ALL ON TABLE repeatphoto.vw_glaciers_on_picture TO gladmin;
GRANT SELECT ON TABLE repeatphoto.vw_glaciers_on_picture TO glrw;
GRANT SELECT ON TABLE repeatphoto.vw_glaciers_on_picture TO glro;
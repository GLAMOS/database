COPY (SELECT * FROM base_data.web_glacier_home_screen_json) TO '/usr/vawsrv01/data-vaw-01/glamos/public_html/temp/json/web_glacier_home_screen.json' WITH CSV DELIMITER ',';



\COPY (SELECT * FROM base_data.web_glacier_home_screen_json) TO '/usr/vawsrv01/data-vaw-01/glamos/public_html/temp/json/web_glacier_home_screen.json' WITH CSV DELIMITER ','
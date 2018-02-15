SELECT 
	CASE 
		WHEN (path[1] = 1) THEN 21
		WHEN (path[1] = n) THEN 23
		ELSE 22
	END AS vertex_type, 
	n AS vertex_count, 
	path[1] AS vertex_order, 
	cast((regexp_matches(ST_AsText(geom), '[0-9]+.[0-9]+'))[1] AS FLOAT) AS easting,
	cast(regexp_replace((regexp_matches(ST_AsText(geom), ' [0-9]+.[0-9]+'))[1], ' ', '') AS FLOAT) AS northing
FROM (
  SELECT (ST_DumpPoints(g.geom)).*, n
  FROM
    (SELECT
	geom,
	sum(ST_NPoints(geom)) n
       FROM public.temp_test group by geom
    ) AS g
  ) j;
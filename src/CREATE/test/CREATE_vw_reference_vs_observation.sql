CREATE OR REPLACE VIEW test.reference_vs_observation 
	as
		select
			r.pk as pk,
			geom as geom,
			o.value_observation,
			o.value_year,
			r.pk_level_1 as pk_level_1,
			r.pk_level_2 as pk_level_2,
			r.pk_level_3 as pk_level_3
		
		from test.observation as o, test.reference as r where o.fk_reference = r.pk;
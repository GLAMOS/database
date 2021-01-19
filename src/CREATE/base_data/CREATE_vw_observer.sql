

/* Drop View */
DROP VIEW administration.vw_observer;

/* Create View */
CREATE VIEW administration.vw_observer AS
	SELECT 
		o.pk,
		o.fk_institution,
		i.name,
		i.departement,
		i.description,
		o.fk_person,
		p.name_first,
		p.name_last
		
	FROM administration.observer AS o
		LEFT JOIN administration.person AS p ON 
			(o.fk_person = p.pk)
			LEFT JOIN administration.institution AS i ON 
			(o.fk_institution = i.pk);
	
GRANT SELECT ON administration.vw_observer TO glro;
GRANT SELECT ON administration.vw_observer TO glrw;
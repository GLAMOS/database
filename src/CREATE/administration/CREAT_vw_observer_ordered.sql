-- View: administration.vw_observer_ordered

-- DROP VIEW administration.vw_observer_ordered;

CREATE OR REPLACE VIEW administration.vw_observer_ordered
 AS
 SELECT o.pk,
    o.fk_institution,
    i.name,
    i.departement,
    i.description,
    o.fk_person,
    p.name_first,
    p.name_last
   FROM administration.observer o
     LEFT JOIN administration.person p ON o.fk_person = p.pk
     LEFT JOIN administration.institution i ON o.fk_institution = i.pk
   ORDER BY i.name, p.name_last, p.name_first;

ALTER TABLE administration.vw_observer_ordered
    OWNER TO gladmin;

GRANT ALL ON TABLE administration.vw_observer_ordered TO gladmin;
GRANT SELECT ON TABLE administration.vw_observer_ordered TO glrw;
GRANT SELECT ON TABLE administration.vw_observer_ordered TO glro;
DROP VIEW v_new_e;

CREATE VIEW v_new_e AS
SELECT
    f.fachname fach,
    (SELECT fachname FROM fach WHERE fach_id = f.oberfach) oberfach,
    g.gebietname gebiet,
    t.themaname thema,
    s.stichwort stichwort,
    n.notiz notiz
FROM lerneinheit le
LEFT JOIN fach f ON le.fach_id = f.fach_id
LEFT JOIN gebiet g ON le.gebiet_id = g.gebiet_id
LEFT JOIN thema t ON le.thema_id = t.thema_id
LEFT JOIN stichwort s ON le.stichwort_id = s.stichwort_id
LEFT JOIN notiz n ON le.notiz_id = n.notiz_id;

DROP TABLE vars;
CREATE TABLE vars (fach_id INT, gebiet_id INT, thema_id INT, stichwort_id INT, notiz_id INT);

DROP TRIGGER tr_v_new_e;

CREATE TRIGGER tr_v_new_e
INSTEAD OF INSERT ON v_new_e
BEGIN
    DELETE FROM vars WHERE 1=1;

    INSERT INTO fach (fachname, oberfach) VALUES (new.fach, new.oberfach);
    INSERT INTO vars (fach_id) VALUES (last_insert_rowid());

    INSERT INTO gebiet (gebietname) VALUES (new.gebiet);
    UPDATE vars SET gebiet_id = last_insert_rowid();

    INSERT INTO thema (themaname) VALUES (new.thema);
    UPDATE vars SET thema_id = last_insert_rowid();

    INSERT INTO stichwort (stichwort) VALUES (new.stichwort);
    UPDATE vars SET stichwort_id = last_insert_rowid();

    INSERT INTO notiz (notiz) VALUES (new.notiz);
    UPDATE vars SET notiz_id = last_insert_rowid();

    INSERT INTO lerneinheit (fach_id, gebiet_id, thema_id, stichwort_id, notiz_id)
                         SELECT * FROM vars;
END;
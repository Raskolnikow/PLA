DROP TABLE Fach;
DROP TABLE Gebiet;
DROP TABLE Thema;
DROP TABLE Stichwort;
DROP TABLE Notiz;
DROP TABLE Lerneinheit;

DROP VIEW v_all;

CREATE TABLE Fach (
	fach_id INTEGER PRIMARY KEY,
	fachname VARCHAR(30) NOT NULL,
	oberfach INT NOT NULL
);

CREATE TABLE Gebiet (
	gebiet_id INTEGER PRIMARY KEY,
	gebietname VARCHAR(30) NOT NULL
);

CREATE TABLE Thema (
	thema_id INTEGER PRIMARY KEY,
	themaname VARCHAR(30) NOT NULL
);

CREATE TABLE Stichwort (
    stichwort_id INT PRIMARY KEY,
    stichwort VARCHAR(900) NOT NULL
);

CREATE TABLE Notiz (
	notiz_id INTEGER PRIMARY KEY,
	notiz VARCHAR(900) NOT NULL
);

CREATE TABLE Lerneinheit (
    lerneinheit_id INTEGER PRIMARY KEY,
    datum DATETIME DEFAULT current_timestamp,
    fach_id INT NOT NULL,
    gebiet_id INT NOT NULL,
    thema_id INT NOT NULL,
    stichwort_id INT,
    notiz_id INT,
    w_1 DATETIME,
    w_2 DATETIME,
    w_3 DATETIME,
    w_4 DATETIME,
    w_5 DATETIME
);

CREATE VIEW v_all AS
SELECT
	le.datum,
	b.fachname Fach,
    g.gebietname Gebiet,
	t.themaname Thema,
    s.stichwort Stichwort,
    n.notiz Notiz,
    le.w_1 `1. Wieder`,
    le.w_2 `2. Wieder`
FROM Lerneinheit le
LEFT JOIN Fach b ON le.fach_id = b.fach_id
LEFT JOIN Gebiet g ON le.gebiet_id = g.gebiet_id
LEFT JOIN Thema t ON le.thema_id = t.thema_id
LEFT JOIN Stichwort s ON le.stichwort_id = s.stichwort_id
LEFT JOIN Notiz n ON le.notiz_id = n.notiz_id;


INSERT INTO Fach (fachname, oberfach) VALUES('Stoff', 1);
INSERT INTO Fach (fachname, oberfach) VALUES('Wirtschaft', 1);
INSERT INTO Fach (fachname, oberfach) VALUES('BWL', 2);
INSERT INTO Fach (fachname, oberfach) VALUES('VWL', 2);

INSERT INTO Gebiet (gebietname) VALUES('Investition');
INSERT INTO Gebiet (gebietname) VALUES('Finanzierung');
INSERT INTO Gebiet (gebietname) VALUES('Beschaffung');
INSERT INTO Gebiet (gebietname) VALUES('Produktion');

INSERT INTO Thema (themaname) VALUES('Kapitalwert');
INSERT INTO Thema (themaname) VALUES('Endwert');
INSERT INTO Thema (themaname) VALUES('Interner Zinsfuss');
INSERT INTO Thema (themaname) VALUES('VOFI');

INSERT INTO Lerneinheit (fach_id, gebiet_id, thema_id) VALUES (3, 1, 1);
INSERT INTO Lerneinheit (fach_id, gebiet_id, thema_id) VALUES (3, 1, 2);
INSERT INTO Lerneinheit (fach_id, gebiet_id, thema_id) VALUES (3, 1, 3);
INSERT INTO Lerneinheit (fach_id, gebiet_id, thema_id) VALUES (3, 1, 4);
-- Wie viele Bücher eines Genres hat ein Verlag veröffentlicht
DROP VIEW IF EXISTS view_verlag_buecher_pro_genre;

CREATE VIEW view_verlag_buecher_pro_genre AS
SELECT
	p.description AS verlag,
	g.name AS genre,
	COUNT(
		b.b_id) AS 'buecher_pro_genre'
FROM
	book b
	RIGHT JOIN publisher p ON p.p_id = b.p_id
	JOIN genre g ON g.g_id = b.g_id
GROUP BY
	g.g_id,
	p.p_id;


-- Bücher ausgeliehen pro Monat
DROP VIEW IF EXISTS view_buecher_ausgeliehen_januar;

CREATE VIEW view_buecher_ausgeliehen_januar AS
SELECT
	COUNT(*) AS anzahl
FROM
	lending l
WHERE
	l.start_date BETWEEN '2023-1-1' AND '2023-1-31';

DROP VIEW IF EXISTS view_buecher_ausgeliehen_februar;

CREATE VIEW view_buecher_ausgeliehen_februar AS
SELECT
	COUNT(*) AS anzahl
FROM
	lending l
WHERE
	l.start_date BETWEEN '2023-2-1' AND '2023-2-28';

DROP VIEW IF EXISTS view_buecher_ausgeliehen_maerz;

CREATE VIEW view_buecher_ausgeliehen_maerz AS
SELECT
	COUNT(*) AS anzahl
FROM
	lending l
WHERE
	l.start_date BETWEEN '2023-3-1' AND '2023-3-31';

-- Bücher ausgeliehen pro Q1
DROP VIEW IF EXISTS view_buecher_ausgeliehen_q1;

CREATE VIEW view_buecher_ausgeliehen_q1 AS
SELECT
	(j.anzahl + f.anzahl + m.anzahl) AS anzahl
FROM
	view_buecher_ausgeliehen_januar j
	JOIN view_buecher_ausgeliehen_februar f
	JOIN view_buecher_ausgeliehen_maerz m;
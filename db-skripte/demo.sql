-- lendings hinzufügen mit aktivem trigger
INSERT INTO lending(start_date, end_date, return_date, u_id, b_id)
		values('2023-03-14', '2023-03-28', null, 2, 2),
        ('2023-03-18', '2023-04-01', null, 2, 4),
        ('2023-02-14', '2023-02-28', null, 3, 11);

-- lending hinzufügen bei einem Buch das bereits ausgeliehen ist => fehler
INSERT INTO lending(start_date, end_date, return_date, u_id, b_id)
		values('2023-03-14', '2023-03-28', null, 2, 4);

-- user 2 fünf bücher ausleihen lassen um fehler zu provozieren
INSERT INTO lending(start_date, end_date, return_date, u_id, b_id)
		values('2023-03-14', '2023-03-28', null, 2, 6),
		values('2023-03-14', '2023-03-28', null, 2, 5),
		values('2023-03-14', '2023-03-28', null, 2, 7);

-- ausführen damit user 2 mehr als fünf bücher hat => fehler
INSERT INTO lending(start_date, end_date, return_date, u_id, b_id)
		values('2023-03-14', '2023-03-28', null, 2, 8);
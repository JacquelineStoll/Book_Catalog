ALTER TABLE book DROP CONSTRAINT autor_id, DROP CONSTRAINT verlag_id, DROP CONSTRAINT genre_id;

ALTER TABLE lending DROP CONSTRAINT user_id, DROP CONSTRAINT book_id;

DROP TABLE IF EXISTS book;

CREATE TABLE book (
	b_id int PRIMARY KEY AUTO_INCREMENT,
	title varchar(255),
	edition varchar(255),
	description text,
	release_date date,
	a_id int,
	p_id int,
	g_id int,
	is_available BOOLEAN DEFAULT 1
);

DROP TABLE IF EXISTS author;

CREATE TABLE author (
	a_id int PRIMARY KEY AUTO_INCREMENT,
	forename varchar(255),
	surname varchar(255),
	date_of_birth date
);

DROP TABLE IF EXISTS lending;

CREATE TABLE lending (
	l_id int PRIMARY KEY AUTO_INCREMENT,
	start_date date,
	end_date date,
	return_date date,
	u_id int,
	b_id int
);

DROP TABLE IF EXISTS genre;

CREATE TABLE genre (
	g_id int PRIMARY KEY AUTO_INCREMENT,
	name varchar(255)
);

DROP TABLE IF EXISTS user;

CREATE TABLE user (
	u_id int PRIMARY KEY AUTO_INCREMENT,
	forename varchar(255),
	surname varchar(255),
	date_of_birth date,
	street varchar(255),
	house_number varchar(255),
	postal_code varchar(255),
	city varchar(255),
	username varchar(255),
	`password` varchar(255)
);

DROP TABLE IF EXISTS publisher;

CREATE TABLE publisher (
	p_id int PRIMARY KEY AUTO_INCREMENT,
	description varchar(255),
	`location` varchar(255)
);

ALTER TABLE book
	ADD CONSTRAINT autor_id FOREIGN KEY (a_id) REFERENCES author (a_id),
		ADD CONSTRAINT verlag_id FOREIGN KEY (p_id) REFERENCES publisher (p_id),
			ADD CONSTRAINT genre_id FOREIGN KEY (g_id) REFERENCES genre (g_id);

ALTER TABLE lending
	ADD CONSTRAINT user_id FOREIGN KEY (u_id) REFERENCES user (u_id),
		ADD CONSTRAINT book_id FOREIGN KEY (b_id) REFERENCES book (b_id);

INSERT INTO author (forename, surname, date_of_birth)
		values('J. R. R.', 'Tolkien', '1892-01-03'), ('E. L.', 'James', '1963-03-07'), ('Stephen', 'King', '1947-09-21'), ('Frank', 'Herbert', '1920-10-08'), ('Charles', 'Dickens', '1812-02-07'), ('Antoine', 'de Saint-Exupéry', '1900-06-29'), ('Astrid', 'Lindgren', '1907-11-14'), ('Herman', 'Melville', '1819-08-01'), ('Johann Wolfgang', 'von Goethe', '1832-03-22'), ('Georg', 'Büchner', '1813-08-17');
INSERT INTO genre (`name`)
		values('Horror'), ('Sci-Fi'), ('Fantasy'), ('Romantisch'), ('Historischer Roman'), ('Kinderbuch'), ('Abenteuer'), ('Tragödie'), ('Drama');
INSERT INTO publisher (description, LOCATION)
		values('Heyne Verlag', 'München'), ('Klett-Cotta Verlag', 'Stuttgard'), ('Goldmann Verlag', 'München'), ('Boer Verlag', 'München'), ('Anaconda Verlag', 'Köln'), ('Verlagsgruppe Oetinger', 'Hamburg'), ('Reclam-Verlag', 'Ditzingen');
INSERT INTO book (title, edition, description, release_date, a_id, p_id, g_id)
		values('Der Herr der Ringe - Die Gefährten', '5. Auflage', 'Der Schauplatz des Herrn der Ringe ist Mittelerde, eine alternative Welt, und erzählt wird von der gefahrvollen Quest einiger Gefährten, die in einem dramatischen Kampf gegen das Böse endet. Durch einen merkwürdigen Zufall fällt dem Hobbit Bilbo Beutlin ein Zauberring zu, dessen Kraft, käme er in die falschen Hände, zu einer absoluten Herrschaft des Bösen führen würde. Bilbo übergibt den Ring an seinen Neffen Frodo, der den Ring in der Schicksalskluft zerstören soll. Hobbits sind kleine, gemütliche Leute, dabei aber erstaunlich zäh. Sie leben in einem ländlichen Idyll, dem Auenland.', '2012-09-17', 1, 2, 3), ('Der Herr der Ringe - Die zwei Türme', '8. Auflage', 'Durch einen merkwürdigen Zufall fällt dem Hobbit Bilbo Beutlin ein Zauberring zu, dessen Kraft, käme er in die falschen Hände, zu einer absoluten Herrschaft des Bösen führen würde. Bilbo übergibt den Ring an seinen Neffen Frodo, der den Ring in der Schicksalskluft zerstören soll. Hobbits sind kleine, gemütliche Leute, dabei aber erstaunlich zäh. Sie leben in einem ländlichen Idyll, dem Auenland.', '2012-09-17', 1, 2, 3), ('Der Herr der Ringe - Die Rückkehr des Königs', '8. Auflage', 'Der Schauplatz des Herrn der Ringe ist Mittelerde, eine alternative Welt, und erzählt wird von der gefahrvollen Quest einiger Gefährten, die in einem dramatischen Kampf gegen das Böse endet. Durch einen merkwürdigen Zufall fällt dem Hobbit Bilbo Beutlin ein Zauberring zu, dessen Kraft, käme er in die falschen Hände, zu einer absoluten Herrschaft des Bösen führen würde. Bilbo übergibt den Ring an seinen Neffen Frodo, der den Ring in der Schicksalskluft zerstören soll. Hobbits sind kleine, gemütliche Leute, dabei aber erstaunlich zäh. Sie leben in einem ländlichen Idyll, dem Auenland.', '2012-09-17', 1, 2, 3), ('Der Hobbit', '20. Auflage 2012', 'Es war ein schöner Morgen, als ein alter Mann bei Bilbo anklopfte. »Wir wollen hier keine Abenteuer, vielen Dank«, wimmelte er den ungebetenen Besucher ab. »Überhaupt, wie heißen Sie eigentlich?« - »Ich bin Gandalf«, antwortete dieser. Und damit dämmerte es Bilbo: Das Abenteuer hatte schon begonnen. Vor sechzig Jahren hat Tolkien die Geschichte von Bilbo und dem Drachenschatz für seine Kinder niedergeschrieben. Und seit dieser Zeit ist Bilbos gefährliche Reise ein Klassiker der Kinderliteratur. Sehr zum Verdruß Tolkiens übrigens: Um den Eindruck eines Kinderbuches zu korrigieren, hat er später vielfach Überarbeitungen vorgenommen. Diese Neuübersetzung von Tolkien-Kenner Wolfgang Krege basiert - im Unterschied zu der 1957 veröffentlichten Übersetzung - auf der autorisierten Fassung letzter Hand. Somit ist nun eine deutsche Fassung zugänglich, wie Tolkien selbst sie gutheißen würde.', '2010-02-19', 1, 2, 3), ('Dune - Der Wüstenplanet', '1. Auflage', 'Das atemberaubende Panorama unserer Zivilisation in ferner Zukunft - und eine Welt, die man nie vergisst: Arrakis, der Wüstenplanet. Einzigartig, herrlich – und grausam. Und doch haben es die Menschen geschafft, sich dieser lebensfeindlichen Umwelt anzupassen... Frank Herberts Bestseller gilt als Meilenstein der Zukunftsliteratur – ein monumentales Epos, das jede Generation von Leserinnen und Lesern neu für sich entdeckt. Im September 2021 startet die spektakuläre Neuverfilmung dieses Klassikers in den Kinos!', '2021-08-09', 4, 1, 2), ('Eine Geschichte aus zwei Städten', '1. Auflage', '»Eine Geschichte aus zwei Städten« (Originaltitel: »A Tale of Two Cities«) ist ein historischer Roman des erfolgreichen Autors aus dem Jahr 1859. Er gehört zu den berühmtesten Werken der Weltliteratur. Schauplatz des Romans sind Paris und London. Die Idee zu der Geschichte hatte Charles Dickens, wie er selbst im Vorwort der 1859er Ausgabe schrieb, während der Teilnahme an dem Theaterdrama The Frozen Deep von Wilkie Collins, das er zusammen mit seinen Kindern und Freunden aufführte. Mithilfe der Eindrücke von seinem Aufenthalt in Paris im Winter 1855 und basierend auf den Berichten des Schotten Thomas Carlyle über die französische Revolution schrieb er ein Buch voller Traurigkeit, aber auch voller Enthusiasmus. Erzählt wird die Lebensgeschichte von Dr. Manette, seiner Tochter Lucie und deren Ehemann Charles Darnay in den Wirren der Französischen Revolution. Als Charles von den Revolutionären zum Tode verurteilt wird, rettet ihm der junge Anwalt Sydney Carton, der in Lucie verliebt ist, das Leben: Anstelle von Lucies Gatten besteigt Sydney das Schafott und geht für ihn in den Tod.', '2021-01-01', 5, 4, 5), ('Der kleine Prinz', '1. Auflage', 'Als der Berufspilot und Schriftsteller Antoine de Saint-Exupéry im Jahr 1943 seinen ‘Kleinen Prinzen’ erfand, konnte er nicht ahnen, welch gewaltiger Welterfolg sein Büchlein werden sollte. Die philosophisch-poetische Geschichte vom kleinen Prinzen, der auf der Suche nach Freunden allerlei seltsame Planeten bereist, übt ungebrochene Faszination aus. Das moderne Märchen berührt mit seinem Plädoyer für Menschlichkeit Leserinnen und Leser jeden Alters und wurde vom Autor selbst mit Illustrationen versehen. Das ideale Buch zum Verschenken oder Geschenktbekommen.', '2015-01-31', 6, 5, 6), ('Pippi Langstrumpf. Gesamtausgabe in einem Band', '47. Auflage', 'Pippilotta Viktualia Rollgardina Pfefferminz Efraimstochter Langstrumpf, kurz Pippi Langstrumpf genannt, wohnt mit ihrem Pferd und dem kleinen Affen Herrn Nilsson in der Villa Kunterbunt und macht, was sie will. Sie ist das stärkste Mädchen der Welt und hat vor nichts und niemandem Angst. Für Thomas und Annika steckt jeder Tag mit Pippi voller Abenteuer und aufregender Erlebnisse! Die Gesamtausgabe enthält die Einzelbände Pippi Langstrumpf, Pippi Langstrumpf geht an Bord und Pippi in Taka-Tuka-Land.', '1987-02-01', 7, 6, 6), ('Moby Dick oder Der weiße Wal', '1. Auflage', 'Seit er auf hoher See im Kampf mit dem legendären weißen Wal ein Bein verloren hat, ist Ahab, der selbstherrliche Kapitän des Walfängers "Pequod", von grenzenlosem Hass erfüllt. Von Rachegelüsten getrieben und ohne Rücksicht auf Verluste macht sich Ahab auf die erbitterte Jagd nach seinem gespenstischen Widersacher. Mit "Moby Dick" schuf Herman Melville (Melville, Herman 1819 - 1891) im Gewand eines packenden Seefahrer- und Abenteuerromans eine grandiose Allegorie auf die Unbezwingbarkeit der Natur und des Schicksals.', '2012-12-31', 8, 5, 7), ('Faust. Der Tragödie erster Teil', '1. Auflage', 'Goethe schrieb über 60 Jahre an seinem »Faust« und nannte »diese sehr ernsten Scherze« am Ende sein »Hauptgeschäft«: Dabei entstand eines der großartigsten und gleichzeitig komplexesten Werke der Weltliteratur.', '1986-01-01', 9, 7, 8), ('Woyzeck', 'Durchgesehene Ausgabe 2021', 'Die Reihe "Reclam XL - Text und Kontext" bietet Klassikertexte mit Kommentar und ist damit speziell auf die Bedürfnisse des Deutschunterrichts zugeschnitten. Die Bände haben nicht nur ein größeres Format als die Universal-Bibliothek, sie sind vor allem auch inhaltlich gewachsen. Auf die sorgfältig edierten Texte folgt ein Anhang mit Materialien, die das Verständnis des Werkes erleichtern und Impulse für Diskussionen im Unterricht liefern: Text- und Bilddokumente zu Quellen und Stoff, zur Biographie des Autors, zu seiner Epoche sowie zur Rezeptionsgeschichte. Die Herausgeber sind erfahrene Schulpraktiker, die die Materialien nach den gegenwärtigen Erkenntnissen von Germanistik und Schuldidaktik für jeden Band neu erarbeitet haben.', '2013-07-24', 10, 7, 9);
INSERT INTO user(forename, surname, date_of_birth, street, house_number, postal_code, city, username, PASSWORD)
		values('Finn', 'Schulz', '1999-08-20', 'Dortmunder Straße', '36', 48155, 'Münster', 'fschulz', 'password'), ('Max', 'Mustermann', '1980-10-30', 'Musterweg', '17', 78976, 'Musterhausen', 'mustermax', 'password'), ('Dieter', 'Bohlen', '1954-02-07', 'Bohlenweg', '1', 27804, 'Berne', 'dBohlen', 'ichliebedieterbohlen');
INSERT INTO lending(start_date, end_date, return_date, u_id, b_id)
		values('2023-01-06', '2023-01-16', '2023-01-16', 1, 5), ('2023-03-14', '2023-03-28', null, 2, 2), ('2023-02-25', '2023-03-04', '2023-03-04', 1, 6), ('2023-03-18', '2023-04-01', null, 2, 4), ('2023-01-25', '2023-02-12', '2023-02-12', 1, 9), ('2023-02-14', '2023-02-28', null, 3, 11), ('2023-01-13', '2023-01-20', '2023-01-20', 3, 7);
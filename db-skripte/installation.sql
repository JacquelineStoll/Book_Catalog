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
	g_id int
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
	c_id int,
	b_id int
);

DROP TABLE IF EXISTS genre;

CREATE TABLE genre (
	g_id int PRIMARY KEY AUTO_INCREMENT,
	name varchar(255)
);

DROP TABLE IF EXISTS user;

CREATE TABLE user (
	c_id int PRIMARY KEY AUTO_INCREMENT,
	forename varchar(255),
	surname varchar(255),
	date_of_birth date,
	street varchar(255),
	house_number varchar(255),
	postal_code varchar(255),
	city varchar(255),
	username varchar(255),
	password varchar(255)
);

DROP TABLE IF EXISTS publisher;

CREATE TABLE publisher (
	p_id int PRIMARY KEY AUTO_INCREMENT,
	description varchar(255),
	LOCATION varchar(255)
);

ALTER TABLE book
	ADD CONSTRAINT autor_id FOREIGN KEY (a_id) REFERENCES author (a_id),
		ADD CONSTRAINT verlag_id FOREIGN KEY (p_id) REFERENCES publisher (p_id),
			ADD CONSTRAINT genre_id FOREIGN KEY (g_id) REFERENCES genre (g_id);

ALTER TABLE lending
	ADD CONSTRAINT user_id FOREIGN KEY (c_id) REFERENCES user (c_id),
		ADD CONSTRAINT book_id FOREIGN KEY (b_id) REFERENCES book (b_id);

INSERT INTO author (forename, surname, date_of_birth)
		values('J. R. R.', 'Tolkien', '1892-01-03'), ('E. L.', 'James', '1963-03-07'), ('Stephen', 'King', '1947-09-21'), ('Frank', 'Herbert', '1920-10-08');
INSERT INTO genre (`name`)
		values('Horror'), ('Sci-Fi'), ('Fantasy'), ('Romantisch');
INSERT INTO publisher (description, location)
		values('Heyne Verlag', 'München'), ('Klett-Cotta Verlag', 'Stuttgard'), ('Goldmann Verlag', 'München');
INSERT INTO book (title, edition, description, release_date, a_id, p_id, g_id)
		values('Der Herr der Ringe - Die Gefährten', '5. Auflage', 'Der Schauplatz des Herrn der Ringe ist Mittelerde, eine alternative Welt, und erzählt wird von der gefahrvollen Quest einiger Gefährten, die in einem dramatischen Kampf gegen das Böse endet. Durch einen merkwürdigen Zufall fällt dem Hobbit Bilbo Beutlin ein Zauberring zu, dessen Kraft, käme er in die falschen Hände, zu einer absoluten Herrschaft des Bösen führen würde. Bilbo übergibt den Ring an seinen Neffen Frodo, der den Ring in der Schicksalskluft zerstören soll. Hobbits sind kleine, gemütliche Leute, dabei aber erstaunlich zäh. Sie leben in einem ländlichen Idyll, dem Auenland.', '2012-09-17', 1, 2, 3), ('Der Herr der Ringe - Die zwei Türme', '8. Auflage', 'Durch einen merkwürdigen Zufall fällt dem Hobbit Bilbo Beutlin ein Zauberring zu, dessen Kraft, käme er in die falschen Hände, zu einer absoluten Herrschaft des Bösen führen würde. Bilbo übergibt den Ring an seinen Neffen Frodo, der den Ring in der Schicksalskluft zerstören soll. Hobbits sind kleine, gemütliche Leute, dabei aber erstaunlich zäh. Sie leben in einem ländlichen Idyll, dem Auenland.', '2012-09-17', 1, 2, 3), ('Der Herr der Ringe - Die Rückkehr des Königs', '8. Auflage', 'Der Schauplatz des Herrn der Ringe ist Mittelerde, eine alternative Welt, und erzählt wird von der gefahrvollen Quest einiger Gefährten, die in einem dramatischen Kampf gegen das Böse endet. Durch einen merkwürdigen Zufall fällt dem Hobbit Bilbo Beutlin ein Zauberring zu, dessen Kraft, käme er in die falschen Hände, zu einer absoluten Herrschaft des Bösen führen würde. Bilbo übergibt den Ring an seinen Neffen Frodo, der den Ring in der Schicksalskluft zerstören soll. Hobbits sind kleine, gemütliche Leute, dabei aber erstaunlich zäh. Sie leben in einem ländlichen Idyll, dem Auenland.', '2012-09-17', 1, 2, 3), ('Der Hobbit', '20. Auflage 2012', 'Es war ein schöner Morgen, als ein alter Mann bei Bilbo anklopfte. »Wir wollen hier keine Abenteuer, vielen Dank«, wimmelte er den ungebetenen Besucher ab. »Überhaupt, wie heißen Sie eigentlich?« - »Ich bin Gandalf«, antwortete dieser. Und damit dämmerte es Bilbo: Das Abenteuer hatte schon begonnen. Vor sechzig Jahren hat Tolkien die Geschichte von Bilbo und dem Drachenschatz für seine Kinder niedergeschrieben. Und seit dieser Zeit ist Bilbos gefährliche Reise ein Klassiker der Kinderliteratur. Sehr zum Verdruß Tolkiens übrigens: Um den Eindruck eines Kinderbuches zu korrigieren, hat er später vielfach Überarbeitungen vorgenommen. Diese Neuübersetzung von Tolkien-Kenner Wolfgang Krege basiert - im Unterschied zu der 1957 veröffentlichten Übersetzung - auf der autorisierten Fassung letzter Hand. Somit ist nun eine deutsche Fassung zugänglich, wie Tolkien selbst sie gutheißen würde.', '2010-02-19', 1, 2, 3), ('Dune - Der Wüstenplanet', '1. Auflage', 'Das atemberaubende Panorama unserer Zivilisation in ferner Zukunft - und eine Welt, die man nie vergisst: Arrakis, der Wüstenplanet. Einzigartig, herrlich – und grausam. Und doch haben es die Menschen geschafft, sich dieser lebensfeindlichen Umwelt anzupassen... Frank Herberts Bestseller gilt als Meilenstein der Zukunftsliteratur – ein monumentales Epos, das jede Generation von Leserinnen und Lesern neu für sich entdeckt. Im September 2021 startet die spektakuläre Neuverfilmung dieses Klassikers in den Kinos!', '2021-08-09', 4, 1, 2);
INSERT INTO user (forename, surname, date_of_birth, street, house_number, postal_code, city, username, password)
		values('Finn', 'Schulz', '1999-08-20', 'Dortmunder Straße', '36', 48155, 'Münster', 'fschulz', 'password'), ('Max', 'Mustermann', '1980-10-30', 'Musterweg', '17', 78976, 'Musterhausen', 'mustermax', 'password');
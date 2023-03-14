-- check if a boook can be lent and update available
DELIMITER //
CREATE TRIGGER tr_book_can_be_lent
	BEFORE INSERT ON lending
	FOR EACH ROW IF(
		SELECT
			COUNT(*) FROM lending
	WHERE
		NEW.u_id = lending.u_id) >= 5 THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Du darfst keine Bücher mehr ausleihen';
ELSEIF(
		SELECT
			book.is_available FROM book
		WHERE
			book.b_id = NEW.b_id) = 0 THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Das Buch ist bereits verliehen';
ELSE
	UPDATE
		book
	SET
		book.is_available = 0
	WHERE
		book.b_id = NEW.b_id;
END IF//
DELIMITER ;

-- update available after returning a book
DELIMITER //
CREATE TRIGGER tr_book_returned
	AFTER UPDATE ON lending
	FOR EACH ROW IF(ISNULL(OLD.return_date)) THEN
	UPDATE
		book
	SET
		book.is_available = 1
	WHERE
		book.b_id = NEW.b_id;
END IF//
DELIMITER ;
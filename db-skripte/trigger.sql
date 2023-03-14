DELIMITER //
CREATE TRIGGER tr_validate_max_lended_books
	BEFORE INSERT ON lending
	FOR EACH ROW IF(
		SELECT
			COUNT(*) FROM lending
	WHERE
		NEW.u_id = lending.u_id) >= 5 THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Du darfst keine Bücher mehr ausleihen';
		END IF//
DELIMITER ;
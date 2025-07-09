DROP TRIGGER IF EXISTS check_phlid_exists_before_insert;

DELIMITER //

CREATE TRIGGER check_phlid_exists_before_insert
BEFORE INSERT ON Thought
FOR EACH ROW
BEGIN

    IF NOT EXISTS (SELECT 1 FROM PHLogger WHERE phlid = NEW.phlid) THEN
    
        SIGNAL SQLSTATE '02000'
        SET MESSAGE_TEXT = 'ERROR: PHLogger does not exist!';
    END IF;
END //

DELIMITER ;

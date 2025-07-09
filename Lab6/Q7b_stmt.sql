DROP TRIGGER IF EXISTS auto_register_and_add_thought;

DELIMITER //

CREATE TRIGGER auto_register_and_add_thought
AFTER INSERT ON PHLogger
FOR EACH ROW
BEGIN
    DECLARE random_iname VARCHAR(20);

    SELECT iname INTO random_iname
    FROM Interest
    ORDER BY RAND()
    LIMIT 1;

    INSERT INTO Member (phlid, iname) VALUES (NEW.phlid, random_iname);

    CALL AddThought(NEW.phlid, random_iname, 'Hello!');
END //

DELIMITER ;

INSERT INTO User (phlid, email, pswd) VALUES (10005, "george@scu.edu", "simple password");
INSERT INTO PHLogger (phlid, name, address_street, address_city, address_state, address_pcode) VALUES (10005, "George", "this street", "that city", "CA", "95053");
SELECT * FROM Member WHERE phlid = 10005;
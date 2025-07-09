DROP PROCEDURE IF EXISTS AddThought;  
DELIMITER //  
CREATE PROCEDURE AddThought (
    IN phlid VARCHAR(8),
    IN iname VARCHAR(20),
    IN text VARCHAR(300)
)  
BEGIN  
    DECLARE new_tnum INT;  
    
    SELECT IFNULL(MAX(tnum), 0) + 1 INTO new_tnum  
    FROM Thought  
    WHERE phlid = phlid;  

    INSERT INTO Thought (phlid, tnum, text, date)  
    VALUES (phlid, new_tnum, text, NOW());  

    INSERT INTO About (phlid, tnum, iname)  
    VALUES (phlid, new_tnum, iname);  
END //  
DELIMITER ;  

CALL AddThought('1', 'alcoholism 0', 'PHLogger APP IS THE BEST!');

SELECT * 
FROM About a, Thought t  
WHERE a.phlid = '1'  
AND t.phlid = a.phlid  
AND a.tnum = t.tnum  
AND t.text LIKE 'PHLogger%';
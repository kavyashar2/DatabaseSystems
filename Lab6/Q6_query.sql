ALTER TABLE Thought DROP FOREIGN KEY Thought_ibfk_1;

DELETE FROM PHLogger WHERE (`phlid` = '4');
SELECT count(*) from Thought where phlid = 4;
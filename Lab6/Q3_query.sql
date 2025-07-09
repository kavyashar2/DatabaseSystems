SELECT COUNT(DISTINCT m.phlid) AS num_users
FROM Member m, PHLogger p
WHERE NOT EXISTS (
    SELECT a.phlid 
    FROM About a
    WHERE m.phlid = a.phlid 
    AND m.iname = a.iname
);

SELECT o.phlid
FROM Observer o, PHLogger p
WHERE o.phlid = p.phlid
GROUP BY o.phlid
HAVING COUNT(DISTINCT o.kind) = (SELECT COUNT(DISTINCT kind) FROM Observer);

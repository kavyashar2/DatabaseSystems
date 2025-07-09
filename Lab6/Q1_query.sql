SELECT p.phlid, p.name, MAX(e.start) AS most_recent_event
FROM PHLogger p, Member m, Interest i, About a, Thought t, Event e
WHERE p.phlid = m.phlid
AND m.iname = i.iname
AND p.phlid = a.phlid
AND a.phlid = t.phlid 
AND a.tnum = t.tnum
AND p.phlid = e.phlid
AND i.topic = 'alcoholism'
AND t.text LIKE '%wasted%'
GROUP BY p.phlid, p.name
ORDER BY p.phlid;
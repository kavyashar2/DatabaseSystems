SELECT *
FROM PHLogger
WHERE phlid IN (
SELECT phlid
    FROM Member
    JOIN Interest ON Member.iname = Interest.iname
    WHERE Interest.topic LIKE '%exercise%'
INTERSECT
    SELECT Observation.phlid
    FROM Observation
    JOIN PHLG_obs ON Observation.observation_id = PHLG_obs.observation_id
    JOIN Indicate ON Observation.observation_id = Indicate.observation_id
    JOIN Event ON Indicate.eid = Event.eid
    WHERE PHLG_obs.text LIKE '%jet skiing%'
      AND Event.ename = 'camping'
);

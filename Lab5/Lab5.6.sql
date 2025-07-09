SELECT Event.ename, COUNT(Observation.observation_id) AS observation_count
FROM Event, Indicate, Observation
WHERE Event.eid = Indicate.eid 
  AND Indicate.observation_id = Observation.observation_id
  AND Event.ename LIKE '%ball%'
GROUP BY Event.ename
HAVING COUNT(Observation.observation_id) > 3;

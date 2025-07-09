SELECT Event.eid, Event.ename
FROM Event, Indicate, Observation
WHERE Event.eid = Indicate.eid 
  AND Indicate.observation_id = Observation.observation_id
  AND TIMEDIFF(Event.end, Event.start) > '00:45:00'
GROUP BY Event.eid, Event.ename
HAVING COUNT(Observation.observation_id) > 3;

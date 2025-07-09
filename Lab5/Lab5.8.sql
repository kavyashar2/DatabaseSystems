SELECT U.phlid, O1.diastolic, O1.systolic, O2.rate, Obs1.start
FROM User U, Observation Obs1, Observable O1, Observation Obs2, Observable O2
WHERE U.phlid = Obs1.phlid 
  AND Obs1.observation_id = O1.observation_id
  AND U.phlid = Obs2.phlid
  AND Obs2.observation_id = O2.observation_id
  AND O1.kind = 'bloodpressure' 
  AND O1.diastolic > 97 
  AND O1.systolic > 196
  AND O2.kind = 'heartrate'
  AND Obs1.start = Obs2.start;
  
  -- Q: Could the same user (phlid) appear multiple times in the result? 
  -- Yes, the same user can appear multiple times. 
  -- If a user has multiple qualifying blood pressure and heart rate observations at different times, they will be listed multiple times in the result.
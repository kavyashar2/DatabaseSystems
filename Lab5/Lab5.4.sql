SELECT DISTINCT Observer.model, Observer.manufacturer
FROM Observer, Observable, Observation
WHERE Observer.observer_id = Observable.observer_id
AND Observable.observation_id = Observation.observation_id
AND Observer.kind = 'smartwatch'
AND Observable.kind = 'bloodpressure'
AND Observable.diastolic = (
    SELECT MIN(diastolic)
    FROM Observable
    WHERE kind = 'bloodpressure'
);
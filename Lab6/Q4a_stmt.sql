DROP VIEW IF EXISTS Heart_rate_view;

CREATE VIEW Heart_rate_view AS
SELECT 
    o.observation_id,
    ph.phlid,
    ph.name,
    ob.rate AS heart_rate,
    obs.manufacturer,
    obs.model,
    obs.kind,
    obs.software_version
FROM Observable ob, Observation o, Observer obs, PHLogger ph
WHERE ob.observation_id = o.observation_id
AND ob.observer_id = obs.observer_id
AND obs.phlid = ph.phlid
AND ob.kind = 'heartrate';
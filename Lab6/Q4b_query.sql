WITH PHLogger_Avg AS (

    SELECT 
        phlid, 
        AVG(heart_rate) AS overall_avg_hr,
        name
    FROM Heart_rate_view
    GROUP BY phlid
),
Series_Avg AS (

    SELECT 
        phlid,
        kind,
        manufacturer,
        model,
        software_version,
        AVG(heart_rate) AS series_avg_hr
    FROM Heart_rate_view
    GROUP BY phlid, kind, manufacturer, model, software_version
)

SELECT 
    pa.phlid,
    pa.name,
    sa.kind,
    sa.manufacturer,
    sa.model,
    sa.software_version,
    sa.series_avg_hr,
    pa.overall_avg_hr
FROM Series_Avg sa, PHLogger_Avg pa
WHERE sa.phlid = pa.phlid
AND sa.series_avg_hr < (pa.overall_avg_hr * 0.8);

SELECT 
    m.record_id,
    m.redcap_event_name,
    m.madrs_date,
    d.psych_med1,
    d.psych_med_start,
    d.psych_med_end,
    CASE 
        WHEN d.psych_med_start <= m.madrs_date AND (d.psych_med_end IS NULL OR d.psych_med_end >= m.madrs_date)
            THEN 'Yes'
        ELSE 'No'
    END AS was_on_medication
FROM baard.optn_madrs_20250228 m
LEFT JOIN baard.optn_psych_meds_arm_6_8_20250228 d
    ON m.record_id = d.record_id
    AND d.psych_med_start <= m.madrs_date
    AND (d.psych_med_end IS NULL OR d.psych_med_end >= m.madrs_date)
WHERE m.redcap_event_name IN ("week_10end_arm_8") AND 
	(psych_med1 LIKE lower("bup%") OR psych_med1 LIKE lower("ari%") OR psych_med1 LIKE lower("wel%") OR psych_med1 LIKE lower("abil%"))
ORDER BY m.record_id, m.redcap_event_name;

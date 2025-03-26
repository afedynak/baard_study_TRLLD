SELECT 
    p.record_id,
    p.redcap_event_name,
    p.phq9_date,
    d.psych_med1,
    d.psych_med_start,
    d.psych_med_end,
    
    -- Check if medication was taken at the Week 2 PHQ9 date
    CASE 
        WHEN p.redcap_event_name = 'week_2_arm_8' AND d.psych_med_start <= p.phq9_date AND 
             (d.psych_med_end IS NULL OR d.psych_med_end >= p.phq9_date)
            THEN 'Yes'
        ELSE 'No'
    END AS `week_2`,
    
    -- Check if medication was taken at the Week 4 PHQ9 date
    CASE 
        WHEN p.redcap_event_name = 'week_4_arm_8' AND d.psych_med_start <= p.phq9_date AND 
             (d.psych_med_end IS NULL OR d.psych_med_end >= p.phq9_date)
            THEN 'Yes'
        ELSE 'No'
    END AS `week_4`,
    
    -- Check if medication was taken at the Week 6 PHQ9 date
    CASE 
        WHEN p.redcap_event_name = 'week_6_arm_8' AND d.psych_med_start <= p.phq9_date AND 
             (d.psych_med_end IS NULL OR d.psych_med_end >= p.phq9_date)
            THEN 'Yes'
        ELSE 'No'
    END AS `week_6`,
    
    -- Check if medication was taken at the Week 8 PHQ9 date
    CASE 
        WHEN p.redcap_event_name = 'week_8_arm_8' AND d.psych_med_start <= p.phq9_date AND 
             (d.psych_med_end IS NULL OR d.psych_med_end >= p.phq9_date)
            THEN 'Yes'
        ELSE 'No'
    END AS `week_8`,
    
    -- Check if medication was taken at the Week 10 PHQ9 date
    CASE 
        WHEN p.redcap_event_name = 'week_10end_arm_8' AND d.psych_med_start <= p.phq9_date AND 
             (d.psych_med_end IS NULL OR d.psych_med_end >= p.phq9_date)
            THEN 'Yes'
        ELSE 'No'
    END AS `week_10`

FROM baard.optn_phq9_20250228 p
LEFT JOIN baard.optn_psych_meds_arm_6_8_20250228 d
    ON p.record_id = d.record_id
    AND d.psych_med_start <= p.phq9_date
    AND (d.psych_med_end IS NULL OR d.psych_med_end >= p.phq9_date)
WHERE p.redcap_event_name IN ('week_2_arm_8', 'week_4_arm_8', 'week_6_arm_8', 'week_8_arm_8', 'week_10end_arm_8')
  AND (d.psych_med1 LIKE lower('bup%') OR d.psych_med1 LIKE lower('ari%') OR d.psych_med1 LIKE lower('wel%') OR d.psych_med1 LIKE lower('abil%'))
ORDER BY p.record_id, p.redcap_event_name;

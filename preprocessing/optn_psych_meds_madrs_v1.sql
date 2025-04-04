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
    END AS was_on_medication,
    
    -- New column to check if the drug was taken 8 weeks before MADRS date (Week 2)
    CASE 
        WHEN d.psych_med_start <= DATE_SUB(m.madrs_date, INTERVAL 8 WEEK) AND 
             (d.psych_med_end IS NULL OR d.psych_med_end >= DATE_SUB(m.madrs_date, INTERVAL 8 WEEK))
            THEN 'Yes'
        ELSE 'No'
    END AS `week 2`,
    
    -- New column to check if the drug was taken 6 weeks before MADRS date (Week 4)
    CASE 
        WHEN d.psych_med_start <= DATE_SUB(m.madrs_date, INTERVAL 6 WEEK) AND 
             (d.psych_med_end IS NULL OR d.psych_med_end >= DATE_SUB(m.madrs_date, INTERVAL 6 WEEK))
            THEN 'Yes'
        ELSE 'No'
    END AS `week 4`,
    
    -- New column to check if the drug was taken 4 weeks before MADRS date (Week 6)
    CASE 
        WHEN d.psych_med_start <= DATE_SUB(m.madrs_date, INTERVAL 4 WEEK) AND 
             (d.psych_med_end IS NULL OR d.psych_med_end >= DATE_SUB(m.madrs_date, INTERVAL 4 WEEK))
            THEN 'Yes'
        ELSE 'No'
    END AS `week 6`,
    
    -- New column to check if the drug was taken 2 weeks before MADRS date (Week 8)
    CASE 
        WHEN d.psych_med_start <= DATE_SUB(m.madrs_date, INTERVAL 2 WEEK) AND 
             (d.psych_med_end IS NULL OR d.psych_med_end >= DATE_SUB(m.madrs_date, INTERVAL 2 WEEK))
            THEN 'Yes'
        ELSE 'No'
    END AS `week 8`,
    
    -- New column to check if the drug was taken 0 weeks before MADRS date (Week 10)
    CASE 
        WHEN d.psych_med_start <= m.madrs_date AND 
             (d.psych_med_end IS NULL OR d.psych_med_end >= m.madrs_date)
            THEN 'Yes'
        ELSE 'No'
    END AS `week 10`

FROM baard.optn_madrs_20250228 m
LEFT JOIN baard.optn_psych_meds_arm_6_8_20250228 d
    ON m.record_id = d.record_id
    AND d.psych_med_start <= m.madrs_date
    AND (d.psych_med_end IS NULL OR d.psych_med_end >= m.madrs_date)
WHERE m.redcap_event_name IN ("week_10end_arm_8") AND 
    (psych_med1 LIKE lower("bup%") OR psych_med1 LIKE lower("ari%") OR psych_med1 LIKE lower("wel%") OR psych_med1 LIKE lower("abil%"))
ORDER BY m.record_id, m.redcap_event_name;

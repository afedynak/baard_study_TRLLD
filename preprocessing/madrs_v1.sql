(SELECT 
    upper(record_id) as record_id,
    
    -- Baseline date and score with GROUP_CONCAT
    GROUP_CONCAT(
        CASE 
            WHEN redcap_event_name = "baseline_arm_1" THEN madrs_date 
            ELSE NULL 
        END
        ORDER BY madrs_date
        SEPARATOR ', '
    ) AS baseline_date,

    GROUP_CONCAT(
        CASE 
            WHEN redcap_event_name = "baseline_arm_1" THEN madrs_tot_scr 
            ELSE NULL 
        END
        ORDER BY madrs_tot_scr
        SEPARATOR ', '
    ) AS baseline_score,

    -- Week 10 date and score with GROUP_CONCAT
    GROUP_CONCAT(
        CASE 
            WHEN redcap_event_name = "step_1_week_10_end_arm_2" THEN madrs_date 
            ELSE NULL 
        END
        ORDER BY madrs_date
        SEPARATOR ', '
    ) AS week10_date,

    GROUP_CONCAT(
        CASE 
            WHEN redcap_event_name = "step_1_week_10_end_arm_2" THEN madrs_tot_scr 
            ELSE NULL 
        END
        ORDER BY madrs_tot_scr
        SEPARATOR ', '
    ) AS week10_score
    
FROM 
    madras.madrs_1_24_25_yi
WHERE 
    redcap_event_name IN ("baseline_arm_1", "step_1_week_10_end_arm_2")
GROUP BY 
    record_id
HAVING 
    SUM(CASE WHEN redcap_event_name = "baseline_arm_1" THEN 1 ELSE 0 END) > 0 
    AND (
        SUM(CASE WHEN redcap_event_name = "step_1_week_10_end_arm_2" THEN 1 ELSE 0 END) > 0
    ))
    UNION
    (SELECT 
    a.record_id,
    a.madrs_date AS baseline_date,
    a.madrs_tot_scr AS baseline_score,
    b.madrs_date AS week10_date,
    b.madrs_tot_scr AS week10_score
FROM 
    optn_madrs_20250228 AS a
JOIN 
    optn_madrs_20250228 AS b
    ON a.record_id = b.record_id
WHERE 
    a.redcap_event_name = 'baseline_arm_8'
    AND b.redcap_event_name = 'week_10end_arm_8')
    UNION
    (SELECT 
    a.record_id,
    GROUP_CONCAT(CASE WHEN a.redcap_event_name = 'baseline_arm_1' THEN a.madrs_date_locrep END ORDER BY a.madrs_date_locrep SEPARATOR ', ') AS baseline_date,
    GROUP_CONCAT(CASE WHEN a.redcap_event_name = 'baseline_arm_1' THEN a.madrs_tot_scr_locrep END ORDER BY a.madrs_date_locrep SEPARATOR ', ') AS baseline_score,
    
    GROUP_CONCAT(CASE WHEN b.redcap_event_name = 'step_1_week_10_end_arm_2' THEN b.madrs_date_locrep END ORDER BY b.madrs_date_locrep SEPARATOR ', ') AS week10_date,
    GROUP_CONCAT(CASE WHEN b.redcap_event_name = 'step_1_week_10_end_arm_2' THEN b.madrs_tot_scr_locrep END ORDER BY b.madrs_date_locrep SEPARATOR ', ') AS week10_score
FROM 
    opt_madrs_fall_20250225_extra81 AS a
JOIN 
    opt_madrs_fall_20250225_extra81 AS b
    ON a.record_id = b.record_id
WHERE 
    a.redcap_event_name = 'baseline_arm_1'
    AND b.redcap_event_name = 'step_1_week_10_end_arm_2'
GROUP BY 
    a.record_id
);


SELECT 
    record_id,
    
    -- Concatenate baseline_date values for all rows with the same record_id
    GROUP_CONCAT(DISTINCT CASE WHEN baseline_date IS NOT NULL AND baseline_score IS NOT NULL THEN baseline_date END ORDER BY baseline_date SEPARATOR ', ') AS baseline_date,
    GROUP_CONCAT(DISTINCT CASE WHEN baseline_date IS NOT NULL AND baseline_score IS NOT NULL THEN baseline_score END ORDER BY baseline_date SEPARATOR ', ') AS baseline_score,
    
    -- Concatenate week10_date values for all rows with the same record_id
    GROUP_CONCAT(DISTINCT CASE WHEN week10_date IS NOT NULL AND week10_score IS NOT NULL THEN week10_date END ORDER BY week10_date SEPARATOR ', ') AS week10_date,
    GROUP_CONCAT(DISTINCT CASE WHEN week10_date IS NOT NULL AND week10_score IS NOT NULL THEN week10_score END ORDER BY week10_date SEPARATOR ', ') AS week10_score

FROM 
    baard.madrs_af
GROUP BY 
    record_id
HAVING 
    COUNT(record_id) > 1;
    
    SELECT 
    record_id,
    
    -- Concatenate baseline_date values for all rows with the same record_id
    GROUP_CONCAT(CASE WHEN baseline_date IS NOT NULL AND baseline_score IS NOT NULL THEN baseline_date END ORDER BY baseline_date SEPARATOR ', ') AS baseline_date,
    GROUP_CONCAT(CASE WHEN baseline_date IS NOT NULL AND baseline_score IS NOT NULL THEN baseline_score END ORDER BY baseline_date SEPARATOR ', ') AS baseline_score,
    
    -- Concatenate week10_date values for all rows with the same record_id
    GROUP_CONCAT(CASE WHEN week10_date IS NOT NULL AND week10_score IS NOT NULL THEN week10_date END ORDER BY week10_date SEPARATOR ', ') AS week10_date,
    GROUP_CONCAT(CASE WHEN week10_date IS NOT NULL AND week10_score IS NOT NULL THEN week10_score END ORDER BY week10_date SEPARATOR ', ') AS week10_score

FROM 
    baard.madrs_af
GROUP BY 
    record_id;


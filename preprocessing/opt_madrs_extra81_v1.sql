USE baard;

SELECT 
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
    a.record_id;



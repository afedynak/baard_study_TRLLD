-- Set the working database
USE baard;

SELECT DISTINCT 
    a.record_id,
    a.redcap_event_name AS baseline_event,
    a.madrs_date AS baseline_date,
    a.madrs_tot_scr AS baseline_score,
    b.redcap_event_name AS week10_event,
    b.madrs_date AS week10_date,
    b.madrs_tot_scr AS week10_score
FROM 
    madrs_baseline_arm_8_20250228 AS a
JOIN 
    madrs_week10_arm_8_20250228 AS b
    ON a.record_id = b.record_id;


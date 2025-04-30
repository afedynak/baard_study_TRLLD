-- Author: Amber Fedynak
-- Date: April 30, 2025
USE baard;

SELECT DISTINCT
    b.record_id,
    a.madrs_date AS baseline_date,
    a.madrs_tot_scr AS baseline_score,
    b.madrs_date AS week10_date,
    b.madrs_tot_scr AS week10_score
FROM 
    optn_madrs_20250228 AS b
LEFT JOIN 
    optn_madrs_20250228 AS a
    ON a.record_id = b.record_id AND a.redcap_event_name = 'baseline_arm_8'
WHERE 
    b.redcap_event_name = 'week_10end_arm_8';



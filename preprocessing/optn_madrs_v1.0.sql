-- Author: Amber Fedynak
-- Date: March 11, 2025
-- Query to join baseline and week 10 event data for distinct records

SELECT 
    a.record_id,
    a.redcap_event_name AS baseline_event,
    a.madrs_date AS baseline_date,
    a.madrs_tot_scr AS baseline_score,
    b.redcap_event_name AS week10_event,
    b.madrs_date AS week10_date,
    b.madrs_tot_scr AS week10_score
FROM 
    optn_madrs_20250228 AS a
JOIN 
    optn_madrs_20250228 AS b
    ON a.record_id = b.record_id
WHERE 
    a.redcap_event_name = 'baseline_arm_8'
    AND b.redcap_event_name = 'week_10end_arm_8';


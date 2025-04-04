USE baard;

SELECT 
    record_id,
    GROUP_CONCAT(CASE WHEN redcap_event_name = "baseline_arm_8" THEN phq9_date END ORDER BY phq9_date SEPARATOR ', ') AS baseline_date,
    GROUP_CONCAT(CASE WHEN redcap_event_name = "baseline_arm_8" THEN phq9_total END ORDER BY phq9_total SEPARATOR ', ') AS baseline_score,
    GROUP_CONCAT(CASE WHEN redcap_event_name = "week_2_arm_8" THEN phq9_date END ORDER BY phq9_date SEPARATOR ', ') AS week2_date,
    GROUP_CONCAT(CASE WHEN redcap_event_name = "week_2_arm_8" THEN phq9_total END ORDER BY phq9_total SEPARATOR ', ') AS week2_score,
    GROUP_CONCAT(CASE WHEN redcap_event_name = "week_4_arm_8" THEN phq9_date END ORDER BY phq9_date SEPARATOR ', ') AS week4_date,
    GROUP_CONCAT(CASE WHEN redcap_event_name = "week_4_arm_8" THEN phq9_total END ORDER BY phq9_total SEPARATOR ', ') AS week4_score,
    GROUP_CONCAT(CASE WHEN redcap_event_name = "week_6_arm_8" THEN phq9_date END ORDER BY phq9_date SEPARATOR ', ') AS week6_date,
    GROUP_CONCAT(CASE WHEN redcap_event_name = "week_6_arm_8" THEN phq9_total END ORDER BY phq9_total SEPARATOR ', ') AS week6_score,
    GROUP_CONCAT(CASE WHEN redcap_event_name = "week_8_arm_8" THEN phq9_date END ORDER BY phq9_date SEPARATOR ', ') AS week8_date,
    GROUP_CONCAT(CASE WHEN redcap_event_name = "week_8_arm_8" THEN phq9_total END ORDER BY phq9_total SEPARATOR ', ') AS week8_score,
    GROUP_CONCAT(CASE WHEN redcap_event_name = "week_10end_arm_8" THEN phq9_date END ORDER BY phq9_date SEPARATOR ', ') AS week10_date,
    GROUP_CONCAT(CASE WHEN redcap_event_name = "week_10end_arm_8" THEN phq9_total END ORDER BY phq9_total SEPARATOR ', ') AS week10_score
FROM 
    optn_phq9_20250228
WHERE 
    redcap_event_name IN ("baseline_arm_8", "week_2_arm_8", "week_4_arm_8", "week_6_arm_8", "week_8_arm_8", "week_10end_arm_8")
GROUP BY 
    record_id
HAVING 
    SUM(CASE WHEN redcap_event_name = "baseline_arm_8" THEN 1 ELSE 0 END) > 0 
    AND (
        SUM(CASE WHEN redcap_event_name = "week_2_arm_8" THEN 1 ELSE 0 END) > 0 OR
        SUM(CASE WHEN redcap_event_name = "week_4_arm_8" THEN 1 ELSE 0 END) > 0 OR
        SUM(CASE WHEN redcap_event_name = "week_6_arm_8" THEN 1 ELSE 0 END) > 0 OR
        SUM(CASE WHEN redcap_event_name = "week_8_arm_8" THEN 1 ELSE 0 END) > 0 OR
        SUM(CASE WHEN redcap_event_name = "week_10end_arm_8" THEN 1 ELSE 0 END) > 0
    );
-- Author: Amber Fedynak
-- Date: March 11, 2025
USE madras;

SELECT 
    record_id,

    -- For baseline_arm_1 event
    GROUP_CONCAT(CASE WHEN redcap_event_name = "baseline_arm_1" THEN phq9_date END ORDER BY phq9_date SEPARATOR ', ') AS baseline_date,
    GROUP_CONCAT(CASE WHEN redcap_event_name = "baseline_arm_1" THEN phq9_score END ORDER BY phq9_score SEPARATOR ', ') AS baseline_score,

    -- For step_1_week_2_arm_2 event
    GROUP_CONCAT(CASE WHEN redcap_event_name = "step_1_week_2_arm_2" THEN phq9_date END ORDER BY phq9_date SEPARATOR ', ') AS week2_date,
    GROUP_CONCAT(CASE WHEN redcap_event_name = "step_1_week_2_arm_2" THEN phq9_score END ORDER BY phq9_score SEPARATOR ', ') AS week2_score,

    -- For step_1_week_4_arm_2 event
    GROUP_CONCAT(CASE WHEN redcap_event_name = "step_1_week_4_arm_2" THEN phq9_date END ORDER BY phq9_date SEPARATOR ', ') AS week4_date,
    GROUP_CONCAT(CASE WHEN redcap_event_name = "step_1_week_4_arm_2" THEN phq9_score END ORDER BY phq9_score SEPARATOR ', ') AS week4_score,

    -- For step_1_week_6_arm_2 event
    GROUP_CONCAT(CASE WHEN redcap_event_name = "step_1_week_6_arm_2" THEN phq9_date END ORDER BY phq9_date SEPARATOR ', ') AS week6_date,
    GROUP_CONCAT(CASE WHEN redcap_event_name = "step_1_week_6_arm_2" THEN phq9_score END ORDER BY phq9_score SEPARATOR ', ') AS week6_score,

    -- For step_1_week_8_arm_2 event
    GROUP_CONCAT(CASE WHEN redcap_event_name = "step_1_week_8_arm_2" THEN phq9_date END ORDER BY phq9_date SEPARATOR ', ') AS week8_date,
    GROUP_CONCAT(CASE WHEN redcap_event_name = "step_1_week_8_arm_2" THEN phq9_score END ORDER BY phq9_score SEPARATOR ', ') AS week8_score,

    -- For step_1_week_10_end_arm_2 event
    GROUP_CONCAT(CASE WHEN redcap_event_name = "step_1_week_10_end_arm_2" THEN phq9_date END ORDER BY phq9_date SEPARATOR ', ') AS week10_date,
    GROUP_CONCAT(CASE WHEN redcap_event_name = "step_1_week_10_end_arm_2" THEN phq9_score END ORDER BY phq9_score SEPARATOR ', ') AS week10_score

FROM 
    madras.phq9_1_24_25_yi
WHERE 
    redcap_event_name IN ("baseline_arm_1", "step_1_week_2_arm_2", "step_1_week_4_arm_2", "step_1_week_6_arm_2", "step_1_week_8_arm_2", "step_1_week_10_end_arm_2")
GROUP BY 
    record_id
HAVING 
    SUM(CASE WHEN redcap_event_name = "baseline_arm_1" THEN 1 ELSE 0 END) > 0 
    AND (
        SUM(CASE WHEN redcap_event_name = "step_1_week_2_arm_2" THEN 1 ELSE 0 END) > 0 OR
        SUM(CASE WHEN redcap_event_name = "step_1_week_4_arm_2" THEN 1 ELSE 0 END) > 0 OR
        SUM(CASE WHEN redcap_event_name = "step_1_week_6_arm_2" THEN 1 ELSE 0 END) > 0 OR
        SUM(CASE WHEN redcap_event_name = "step_1_week_8_arm_2" THEN 1 ELSE 0 END) > 0 OR
        SUM(CASE WHEN redcap_event_name = "step_1_week_10_end_arm_2" THEN 1 ELSE 0 END) > 0
    );



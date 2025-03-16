-- Author: Amber Fedynak
-- Date: March 11, 2025
USE baard;

SELECT 
    record_id,
    
    -- For baseline_arm_1 event
    CASE WHEN redcap_event_name = "baseline_arm_1" THEN decision_fall_1 END AS baseline_date,
    CASE WHEN redcap_event_name = "baseline_arm_1" THEN phq9_score END AS baseline_score,
    
    -- For step_1_week_2_arm_2 event
    CASE WHEN redcap_event_name = "step_1_week_2_arm_2" THEN phq9_date END AS week2_date,
    CASE WHEN redcap_event_name = "step_1_week_2_arm_2" THEN phq9_score END AS week2_score,
    
    -- For step_1_week_4_arm_2 event
    CASE WHEN redcap_event_name = "step_1_week_4_arm_2" THEN phq9_date END AS week4_date,
    CASE WHEN redcap_event_name = "step_1_week_4_arm_2" THEN phq9_score END AS week4_score,
    
    -- For step_1_week_6_arm_2 event
    CASE WHEN redcap_event_name = "step_1_week_6_arm_2" THEN phq9_date END AS week6_date,
    CASE WHEN redcap_event_name = "step_1_week_6_arm_2" THEN phq9_score END AS week6_score,
    
    -- For step_1_week_8_arm_2 event
    CASE WHEN redcap_event_name = "step_1_week_8_arm_2" THEN phq9_date END AS week8_date,
    CASE WHEN redcap_event_name = "step_1_week_8_arm_2" THEN phq9_score END AS week8_score,
    
    -- For step_1_week_10_end_arm_2 event
    CASE WHEN redcap_event_name = "step_1_week_10_end_arm_2" THEN phq9_date END AS week10_date,
    CASE WHEN redcap_event_name = "step_1_week_10_end_arm_2" THEN phq9_score END AS week10_score

FROM 
    baard.phq9_1_24_25
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



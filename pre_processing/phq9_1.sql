-- Author: Amber Fedynak
-- Date: March 11, 2025
USE baard;

SELECT 
    record_id,
    
    -- For baseline_arm_8
    CASE WHEN redcap_event_name = "baseline_arm_8" THEN phq9_date END AS baseline_date,
    CASE WHEN redcap_event_name = "baseline_arm_8" THEN phq9_total END AS baseline_score,
    
    -- For week_2_arm_8
    CASE WHEN redcap_event_name = "week_2_arm_8" THEN phq9_date END AS week2_date,
    CASE WHEN redcap_event_name = "week_2_arm_8" THEN phq9_total END AS week2_score,

    -- For week_4_arm_8
    CASE WHEN redcap_event_name = "week_4_arm_8" THEN phq9_date END AS week4_date,
    CASE WHEN redcap_event_name = "week_4_arm_8" THEN phq9_total END AS week4_score,

    -- For week_6_arm_8
    CASE WHEN redcap_event_name = "week_6_arm_8" THEN phq9_date END AS week6_date,
    CASE WHEN redcap_event_name = "week_6_arm_8" THEN phq9_total END AS week6_score,

    -- For week_8_arm_8
    CASE WHEN redcap_event_name = "week_8_arm_8" THEN phq9_date END AS week8_date,
    CASE WHEN redcap_event_name = "week_8_arm_8" THEN phq9_total END AS week8_score,

    -- For week_10end_arm_8
    CASE WHEN redcap_event_name = "week_10end_arm_8" THEN phq9_date END AS week10_date,
    CASE WHEN redcap_event_name = "week_10end_arm_8" THEN phq9_total END AS week10_score

FROM 
    baard.optn_phq9
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

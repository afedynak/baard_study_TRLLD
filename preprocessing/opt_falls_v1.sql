USE baard;

SELECT 
    record_id,
    
    -- Baseline data
    CASE WHEN redcap_event_name = "baseline_arm_1" THEN decision_fall_1 END AS baseline_fall,
    CASE WHEN redcap_event_name = "baseline_arm_1" THEN fall_inj END AS baseline_fall_inj,
    
    -- Week 2 data
    CASE WHEN redcap_event_name = "step_1_week_2_arm_2" THEN decision_fall_1 END AS week2_fall,
    CASE WHEN redcap_event_name = "step_1_week_2_arm_2" THEN fall_inj END AS week2_fall_inj,
    
    -- Week 4 data
    CASE WHEN redcap_event_name = "step_1_week_4_arm_2" THEN decision_fall_1 END AS week4_fall,
    CASE WHEN redcap_event_name = "step_1_week_4_arm_2" THEN fall_inj END AS week4_fall_inj,
    
    -- Week 6 data
    CASE WHEN redcap_event_name = "step_1_week_6_arm_2" THEN decision_fall_1 END AS week6_fall,
    CASE WHEN redcap_event_name = "step_1_week_6_arm_2" THEN fall_inj END AS week6_fall_inj,
    
    -- Week 8 data
    CASE WHEN redcap_event_name = "step_1_week_8_arm_2" THEN decision_fall_1 END AS week8_fall,
    CASE WHEN redcap_event_name = "step_1_week_8_arm_2" THEN fall_inj END AS week8_fall_inj,
    
    -- Week 10 data
    CASE WHEN redcap_event_name = "step_1_week_10_end_arm_2" THEN decision_fall_1 END AS week10_fall,
    CASE WHEN redcap_event_name = "step_1_week_10_end_arm_2" THEN fall_inj END AS week10_fall_inj
    
FROM 
    baard.opt_falls
WHERE 
    redcap_event_name IN (
        "baseline_arm_1", 
        "step_1_week_2_arm_2", 
        "step_1_week_4_arm_2", 
        "step_1_week_6_arm_2", 
        "step_1_week_8_arm_2", 
        "step_1_week_10_end_arm_2"
    ) 
    AND record_id NOT LIKE "CU%"
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

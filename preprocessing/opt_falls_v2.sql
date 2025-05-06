USE baard;

SELECT 
    record_id,

    -- Baseline data
    GROUP_CONCAT(CASE WHEN redcap_event_name = 'baseline_arm_1' THEN decision_fall_1 END SEPARATOR ',') AS baseline_fall,
    GROUP_CONCAT(CASE WHEN redcap_event_name = 'baseline_arm_1' THEN fall_inj END SEPARATOR ',') AS baseline_fall_inj,

    -- Week 2 data
    GROUP_CONCAT(CASE WHEN redcap_event_name = 'step_1_week_2_arm_2' THEN decision_fall_1 END SEPARATOR ',') AS week2_fall,
    GROUP_CONCAT(CASE WHEN redcap_event_name = 'step_1_week_2_arm_2' THEN fall_inj END SEPARATOR ',') AS week2_fall_inj,

    -- Week 4 data
    GROUP_CONCAT(CASE WHEN redcap_event_name = 'step_1_week_4_arm_2' THEN decision_fall_1 END SEPARATOR ',') AS week4_fall,
    GROUP_CONCAT(CASE WHEN redcap_event_name = 'step_1_week_4_arm_2' THEN fall_inj END SEPARATOR ',') AS week4_fall_inj,

    -- Week 6 data
    GROUP_CONCAT(CASE WHEN redcap_event_name = 'step_1_week_6_arm_2' THEN decision_fall_1 END SEPARATOR ',') AS week6_fall,
    GROUP_CONCAT(CASE WHEN redcap_event_name = 'step_1_week_6_arm_2' THEN fall_inj END SEPARATOR ',') AS week6_fall_inj,

    -- Week 8 data
    GROUP_CONCAT(CASE WHEN redcap_event_name = 'step_1_week_8_arm_2' THEN decision_fall_1 END SEPARATOR ',') AS week8_fall,
    GROUP_CONCAT(CASE WHEN redcap_event_name = 'step_1_week_8_arm_2' THEN fall_inj END SEPARATOR ',') AS week8_fall_inj,

    -- Week 10 data
    GROUP_CONCAT(CASE WHEN redcap_event_name = 'step_1_week_10_end_arm_2' THEN decision_fall_1 END SEPARATOR ',') AS week10_fall,
    GROUP_CONCAT(CASE WHEN redcap_event_name = 'step_1_week_10_end_arm_2' THEN fall_inj END SEPARATOR ',') AS week10_fall_inj

FROM 
    baard.opt_fall_20250225
WHERE 
    redcap_event_name IN (
        'baseline_arm_1', 
        'step_1_week_2_arm_2', 
        'step_1_week_4_arm_2', 
        'step_1_week_6_arm_2', 
        'step_1_week_8_arm_2', 
        'step_1_week_10_end_arm_2'
    )
GROUP BY 
    record_id
HAVING 
    SUM(CASE WHEN redcap_event_name = "step_1_week_2_arm_2" THEN 1 ELSE 0 END) > 0 OR
    SUM(CASE WHEN redcap_event_name = "step_1_week_4_arm_2" THEN 1 ELSE 0 END) > 0 OR
    SUM(CASE WHEN redcap_event_name = "step_1_week_6_arm_2" THEN 1 ELSE 0 END) > 0 OR
    SUM(CASE WHEN redcap_event_name = "step_1_week_8_arm_2" THEN 1 ELSE 0 END) > 0 OR
    SUM(CASE WHEN redcap_event_name = "step_1_week_10_end_arm_2" THEN 1 ELSE 0 END) > 0;

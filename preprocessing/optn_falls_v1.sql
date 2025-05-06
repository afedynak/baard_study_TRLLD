USE baard;

SELECT 
    record_id,

    -- Baseline data
    -- Note: No baseline data for falls
    -- GROUP_CONCAT(CASE WHEN redcap_event_name = 'baseline_arm_1' THEN decision_fall_1 END SEPARATOR ',') AS baseline_fall,
    -- GROUP_CONCAT(CASE WHEN redcap_event_name = 'baseline_arm_1' THEN fall_inj END SEPARATOR ',') AS baseline_fall_inj,

    -- Week 2 data
    GROUP_CONCAT(CASE WHEN redcap_event_name = 'week_2_arm_8' THEN decision_fall_1 END SEPARATOR ',') AS week2_fall,
    GROUP_CONCAT(CASE WHEN redcap_event_name = 'week_2_arm_8' THEN decision_fall_2___5 END SEPARATOR ',') AS week2_fall_inj,

    -- Week 4 data
    GROUP_CONCAT(CASE WHEN redcap_event_name = 'week_4_arm_8' THEN decision_fall_1 END SEPARATOR ',') AS week4_fall,
    GROUP_CONCAT(CASE WHEN redcap_event_name = 'week_4_arm_8' THEN decision_fall_2___5 END SEPARATOR ',') AS week4_fall_inj,

    -- Week 6 data
    GROUP_CONCAT(CASE WHEN redcap_event_name = 'week_6_arm_8' THEN decision_fall_1 END SEPARATOR ',') AS week6_fall,
    GROUP_CONCAT(CASE WHEN redcap_event_name = 'week_6_arm_8' THEN decision_fall_2___5 END SEPARATOR ',') AS week6_fall_inj,

    -- Week 8 data
    GROUP_CONCAT(CASE WHEN redcap_event_name = 'week_8_arm_8' THEN decision_fall_1 END SEPARATOR ',') AS week8_fall,
    GROUP_CONCAT(CASE WHEN redcap_event_name = 'week_8_arm_8' THEN decision_fall_2___5 END SEPARATOR ',') AS week8_fall_inj,

    -- Week 10 data
    GROUP_CONCAT(CASE WHEN redcap_event_name = 'week_10end_arm_8' THEN decision_fall_1 END SEPARATOR ',') AS week10_fall,
    GROUP_CONCAT(CASE WHEN redcap_event_name = 'week_10end_arm_8' THEN decision_fall_2___5 END SEPARATOR ',') AS week10_fall_inj

FROM 
    baard.optn_decision_support_form_arm_7_8_20250315
WHERE 
    redcap_event_name IN (
        'week_2_arm_8', 
        'week_4_arm_8', 
        'week_6_arm_8', 
        'week_8_arm_8', 
        'week_10end_arm_8'
    )
GROUP BY 
    record_id
HAVING 
    SUM(CASE WHEN redcap_event_name = "week_2_arm_8" THEN 1 ELSE 0 END) > 0 OR
    SUM(CASE WHEN redcap_event_name = "week_4_arm_8" THEN 1 ELSE 0 END) > 0 OR
    SUM(CASE WHEN redcap_event_name = "week_6_arm_8" THEN 1 ELSE 0 END) > 0 OR
    SUM(CASE WHEN redcap_event_name = "week_8_arm_8" THEN 1 ELSE 0 END) > 0 OR
    SUM(CASE WHEN redcap_event_name = "week_10end_arm_8" THEN 1 ELSE 0 END) > 0;

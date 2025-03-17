-- Author: Amber Fedynak
-- Date: March 11, 2025
USE baard;

SELECT 
    record_id,
    
    -- Baseline date and score
    CASE 
        WHEN redcap_event_name = "baseline_arm_1" THEN madrs_date 
        ELSE NULL 
    END AS baseline_date,

    CASE 
        WHEN redcap_event_name = "baseline_arm_1" THEN madrs_tot_scr 
        ELSE NULL 
    END AS baseline_score,

    -- Week 10 date and score
    CASE 
        WHEN redcap_event_name = "step_1_week_10_end_arm_2" THEN madrs_date 
        ELSE NULL 
    END AS week10_date,

    CASE 
        WHEN redcap_event_name = "step_1_week_10_end_arm_2" THEN madrs_tot_scr 
        ELSE NULL 
    END AS week10_score
    
FROM 
    baard.opt_madrs
WHERE 
    redcap_event_name IN ("baseline_arm_1", "step_1_week_10_end_arm_2")
    AND record_id NOT LIKE "CU%"
GROUP BY 
    record_id
HAVING 
    SUM(CASE WHEN redcap_event_name = "baseline_arm_1" THEN 1 ELSE 0 END) > 0 
    AND (
        SUM(CASE WHEN redcap_event_name = "step_1_week_10_end_arm_2" THEN 1 ELSE 0 END) > 0
    );


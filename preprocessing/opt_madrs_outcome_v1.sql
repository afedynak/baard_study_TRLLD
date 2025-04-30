-- Author: Amber Fedynak
-- Date: April 30, 2025
USE baard;  
    
SELECT 
    UPPER(record_id) AS record_id,

    -- Baseline date and score (only if it exists)
    GROUP_CONCAT(
        CASE 
            WHEN redcap_event_name = "baseline_arm_1" THEN madrs_date 
            ELSE NULL 
        END
        ORDER BY madrs_date
        SEPARATOR ', '
    ) AS baseline_date,

    GROUP_CONCAT(
        CASE 
            WHEN redcap_event_name = "baseline_arm_1" THEN madrs_tot_scr 
            ELSE NULL 
        END
        ORDER BY madrs_tot_scr
        SEPARATOR ', '
    ) AS baseline_score,

    -- Week 10 date and score (always included)
    GROUP_CONCAT(
        CASE 
            WHEN redcap_event_name = "step_1_week_10_end_arm_2" THEN madrs_date 
            ELSE NULL 
        END
        ORDER BY madrs_date
        SEPARATOR ', '
    ) AS week10_date,

    GROUP_CONCAT(
        CASE 
            WHEN redcap_event_name = "step_1_week_10_end_arm_2" THEN madrs_tot_scr 
            ELSE NULL 
        END
        ORDER BY madrs_tot_scr
        SEPARATOR ', '
    ) AS week10_score

FROM 
    madras.madrs_1_24_25_yi
WHERE 
    redcap_event_name IN ("baseline_arm_1", "step_1_week_10_end_arm_2")
GROUP BY 
    record_id
HAVING 
    SUM(CASE WHEN redcap_event_name = "step_1_week_10_end_arm_2" THEN 1 ELSE 0 END) > 0;




-- Author: Amber Fedynak
-- Date: April 30, 2025
USE baard;  
    
(SELECT 
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
    SUM(CASE WHEN redcap_event_name = "step_1_week_10_end_arm_2" THEN 1 ELSE 0 END) > 0)
UNION
(SELECT DISTINCT
    b.record_id,
    a.madrs_date AS baseline_date,
    a.madrs_tot_scr AS baseline_score,
    b.madrs_date AS week10_date,
    b.madrs_tot_scr AS week10_score
FROM 
    optn_madrs_20250228 AS b
LEFT JOIN 
    optn_madrs_20250228 AS a
    ON a.record_id = b.record_id AND a.redcap_event_name = 'baseline_arm_8'
WHERE 
    b.redcap_event_name = 'week_10end_arm_8')
UNION
(SELECT 
    UPPER(b.record_id),

    -- Include baseline data if it exists
    GROUP_CONCAT(
        CASE 
            WHEN a.redcap_event_name = 'baseline_arm_1' THEN a.madrs_date_locrep 
            ELSE NULL 
        END 
        ORDER BY a.madrs_date_locrep 
        SEPARATOR ', '
    ) AS baseline_date,

    GROUP_CONCAT(
        CASE 
            WHEN a.redcap_event_name = 'baseline_arm_1' THEN a.madrs_tot_scr_locrep 
            ELSE NULL 
        END 
        ORDER BY a.madrs_date_locrep 
        SEPARATOR ', '
    ) AS baseline_score,

    -- Always include week 10 data
    GROUP_CONCAT(
        CASE 
            WHEN b.redcap_event_name = 'step_1_week_10_end_arm_2' THEN b.madrs_date_locrep 
            ELSE NULL 
        END 
        ORDER BY b.madrs_date_locrep 
        SEPARATOR ', '
    ) AS week10_date,

    GROUP_CONCAT(
        CASE 
            WHEN b.redcap_event_name = 'step_1_week_10_end_arm_2' THEN b.madrs_tot_scr_locrep 
            ELSE NULL 
        END 
        ORDER BY b.madrs_date_locrep 
        SEPARATOR ', '
    ) AS week10_score

FROM 
    opt_madrs_fall_20250225_extra81 AS b
LEFT JOIN 
    opt_madrs_fall_20250225_extra81 AS a
    ON a.record_id = b.record_id AND a.redcap_event_name = 'baseline_arm_1'
WHERE 
    b.redcap_event_name = 'step_1_week_10_end_arm_2'
GROUP BY 
    b.record_id)
    
    




-- Author: Amber Fedynak
-- Date: April 30, 2025

SELECT 
    b.record_id,

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
    b.record_id;

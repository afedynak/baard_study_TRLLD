SELECT 
    cd.record_id,
    cv.site,
    cv.gender,
    cv.race,
    cv.ethnicity,
    cv.bmi,
    cv.age,
    cv.marital_status,
    cv.education_level
FROM (
    -- Combine and deduplicate record_ids from various PHQ9 and MADRS datasets
    SELECT DISTINCT record_id
    FROM (
        SELECT record_id
        FROM madras.madrs_1_24_25_yi
        WHERE redcap_event_name IN ('baseline_arm_1', 'step_1_week_10_end_arm_2')

        UNION

        SELECT record_id
        FROM optn_madrs_20250228
        WHERE redcap_event_name IN ('baseline_arm_8', 'week_10end_arm_8')

        UNION

        SELECT record_id
        FROM madras.phq9_1_24_25_yi
        WHERE redcap_event_name IN (
            'baseline_arm_1', 'step_1_week_2_arm_2', 'step_1_week_4_arm_2',
            'step_1_week_6_arm_2', 'step_1_week_8_arm_2', 'step_1_week_10_end_arm_2'
        )

        UNION

        SELECT record_id
        FROM baard.optn_phq9_20250228
        WHERE redcap_event_name IN (
            'baseline_arm_8', 'week_2_arm_8', 'week_4_arm_8',
            'week_6_arm_8', 'week_8_arm_8', 'week_10end_arm_8'
        )

        UNION

        SELECT record_id
        FROM opt_madrs_fall_20250225_extra81
        WHERE redcap_event_name IN ('baseline_arm_1', 'step_1_week_10_end_arm_2')
    ) AS combined_data
) AS cd
JOIN core_variables_af cv
    ON cd.record_id = cv.record_id;
-- 801 records in step1
-- 791 records with core variables

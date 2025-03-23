WITH adherence_data AS (
    SELECT adherence_3_med1 AS adherence_value, redcap_event_name
    FROM baard.opt_adherence_20250124
    WHERE (adherence_3_med1 LIKE lower('ari%') OR adherence_3_med1 LIKE lower('abi%'))
        AND redcap_event_name IN (
            'Step 1 Week 2 (Arm 2: Step 1 Acute)',
            'Step 1 Week 4 (Arm 2: Step 1 Acute)',
            'Step 1 Week 6 (Arm 2: Step 1 Acute)',
            'Step 1 Week 8 (Arm 2: Step 1 Acute)',
            'Step 1 Week 10/ End (Arm 2: Step 1 Acute)'
        )
    UNION ALL
    SELECT adherence_3_med2 AS adherence_value, redcap_event_name
    FROM baard.opt_adherence_20250124
    WHERE (adherence_3_med2 LIKE lower('ari%') OR adherence_3_med2 LIKE lower('abi%'))
        AND redcap_event_name IN (
            'Step 1 Week 2 (Arm 2: Step 1 Acute)',
            'Step 1 Week 4 (Arm 2: Step 1 Acute)',
            'Step 1 Week 6 (Arm 2: Step 1 Acute)',
            'Step 1 Week 8 (Arm 2: Step 1 Acute)',
            'Step 1 Week 10/ End (Arm 2: Step 1 Acute)'
        )
)

SELECT redcap_event_name, adherence_value, COUNT(*) AS value_count
FROM adherence_data
GROUP BY redcap_event_name, adherence_value
ORDER BY redcap_event_name, adherence_value DESC;

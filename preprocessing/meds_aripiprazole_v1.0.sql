WITH adherence_data AS (
    SELECT adherence_3_med1 AS adherence_value
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
    SELECT adherence_3_med2 AS adherence_value
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

SELECT adherence_value, COUNT(*) AS value_count
FROM adherence_data
GROUP BY adherence_value
ORDER BY adherence_value DESC;




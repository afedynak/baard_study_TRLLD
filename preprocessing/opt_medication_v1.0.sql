USE baard;

SELECT 
    record_id,

    -- For week 2 event
    CASE 
        WHEN BINARY redcap_event_name = 'Step 1 Week 2 (Arm 2: Step 1 Acute)' AND 
             (LOWER(adherence_3_med1) = 'bupropion' OR LOWER(adherence_3_med1) = 'aripiprazole') 
        THEN adherence_3_med1 
        ELSE NULL 
    END AS week2_med1,
    
    CASE 
        WHEN BINARY redcap_event_name = 'Step 1 Week 2 (Arm 2: Step 1 Acute)' AND 
             (LOWER(adherence_3_med1) = 'bupropion' OR LOWER(adherence_3_med1) = 'aripiprazole') 
        THEN adherence_3_freq1 
        ELSE NULL 
    END AS week2_med1_freq,
    
    CASE 
        WHEN BINARY redcap_event_name = 'Step 1 Week 2 (Arm 2: Step 1 Acute)' AND 
             (LOWER(adherence_3_med2) = 'bupropion' OR LOWER(adherence_3_med2) = 'aripiprazole') 
        THEN adherence_3_med2 
        ELSE NULL 
    END AS week2_med2,
    
    CASE 
        WHEN BINARY redcap_event_name = 'Step 1 Week 2 (Arm 2: Step 1 Acute)' AND 
             (LOWER(adherence_3_med2) = 'bupropion' OR LOWER(adherence_3_med2) = 'aripiprazole') 
        THEN adherence_3_freq2 
        ELSE NULL 
    END AS week2_med2_freq,

    -- For week 4 event
    CASE 
        WHEN BINARY redcap_event_name = 'Step 1 Week 4 (Arm 2: Step 1 Acute)' AND 
             (LOWER(adherence_3_med1) = 'bupropion' OR LOWER(adherence_3_med1) = 'aripiprazole') 
        THEN adherence_3_med1 
        ELSE NULL 
    END AS week4_med1,
    
    CASE 
        WHEN BINARY redcap_event_name = 'Step 1 Week 4 (Arm 2: Step 1 Acute)' AND 
             (LOWER(adherence_3_med1) = 'bupropion' OR LOWER(adherence_3_med1) = 'aripiprazole') 
        THEN adherence_3_freq1 
        ELSE NULL 
    END AS week4_med1_freq,
    
    CASE 
        WHEN BINARY redcap_event_name = 'Step 1 Week 4 (Arm 2: Step 1 Acute)' AND 
             (LOWER(adherence_3_med2) = 'bupropion' OR LOWER(adherence_3_med2) = 'aripiprazole') 
        THEN adherence_3_med2 
        ELSE NULL 
    END AS week4_med2,
    
    CASE 
        WHEN BINARY redcap_event_name = 'Step 1 Week 4 (Arm 2: Step 1 Acute)' AND 
             (LOWER(adherence_3_med2) = 'bupropion' OR LOWER(adherence_3_med2) = 'aripiprazole') 
        THEN adherence_3_freq2 
        ELSE NULL 
    END AS week4_med2_freq,

    -- For week 6 event
    CASE 
        WHEN BINARY redcap_event_name = 'Step 1 Week 6 (Arm 2: Step 1 Acute)' AND 
             (LOWER(adherence_3_med1) = 'bupropion' OR LOWER(adherence_3_med1) = 'aripiprazole') 
        THEN adherence_3_med1 
        ELSE NULL 
    END AS week6_med1,
    
    CASE 
        WHEN BINARY redcap_event_name = 'Step 1 Week 6 (Arm 2: Step 1 Acute)' AND 
             (LOWER(adherence_3_med1) = 'bupropion' OR LOWER(adherence_3_med1) = 'aripiprazole') 
        THEN adherence_3_freq1 
        ELSE NULL 
    END AS week6_med1_freq,
    
    CASE 
        WHEN BINARY redcap_event_name = 'Step 1 Week 6 (Arm 2: Step 1 Acute)' AND 
             (LOWER(adherence_3_med2) = 'bupropion' OR LOWER(adherence_3_med2) = 'aripiprazole') 
        THEN adherence_3_med2 
        ELSE NULL 
    END AS week6_med2,
    
    CASE 
        WHEN BINARY redcap_event_name = 'Step 1 Week 6 (Arm 2: Step 1 Acute)' AND 
             (LOWER(adherence_3_med2) = 'bupropion' OR LOWER(adherence_3_med2) = 'aripiprazole') 
        THEN adherence_3_freq2 
        ELSE NULL 
    END AS week6_med2_freq,

    -- For week 8 event
    CASE 
        WHEN BINARY redcap_event_name = 'Step 1 Week 8 (Arm 2: Step 1 Acute)' AND 
             (LOWER(adherence_3_med1) = 'bupropion' OR LOWER(adherence_3_med1) = 'aripiprazole') 
        THEN adherence_3_med1 
        ELSE NULL 
    END AS week8_med1,
    
    CASE 
        WHEN BINARY redcap_event_name = 'Step 1 Week 8 (Arm 2: Step 1 Acute)' AND 
             (LOWER(adherence_3_med1) = 'bupropion' OR LOWER(adherence_3_med1) = 'aripiprazole') 
        THEN adherence_3_freq1 
        ELSE NULL 
    END AS week8_med1_freq,
    
    CASE 
        WHEN BINARY redcap_event_name = 'Step 1 Week 8 (Arm 2: Step 1 Acute)' AND 
             (LOWER(adherence_3_med2) = 'bupropion' OR LOWER(adherence_3_med2) = 'aripiprazole') 
        THEN adherence_3_med2 
        ELSE NULL 
    END AS week8_med2,
    
    CASE 
        WHEN BINARY redcap_event_name = 'Step 1 Week 8 (Arm 2: Step 1 Acute)' AND 
             (LOWER(adherence_3_med2) = 'bupropion' OR LOWER(adherence_3_med2) = 'aripiprazole') 
        THEN adherence_3_freq2 
        ELSE NULL 
    END AS week8_med2_freq,

    -- For week 10 event
    CASE 
        WHEN BINARY redcap_event_name = 'Step 1 Week 10/ End (Arm 2: Step 1 Acute)' AND 
             (LOWER(adherence_3_med1) = 'bupropion' OR LOWER(adherence_3_med1) = 'aripiprazole') 
        THEN adherence_3_med1 
        ELSE NULL 
    END AS week10_med1,
    
    CASE 
        WHEN BINARY redcap_event_name = 'Step 1 Week 10/ End (Arm 2: Step 1 Acute)' AND 
             (LOWER(adherence_3_med1) = 'bupropion' OR LOWER(adherence_3_med1) = 'aripiprazole') 
        THEN adherence_3_freq1 
        ELSE NULL 
    END AS week10_med1_freq,
    
    CASE 
        WHEN BINARY redcap_event_name = 'Step 1 Week 10/ End (Arm 2: Step 1 Acute)' AND 
             (LOWER(adherence_3_med2) = 'bupropion' OR LOWER(adherence_3_med2) = 'aripiprazole') 
        THEN adherence_3_med2 
        ELSE NULL 
    END AS week10_med2,
    
    CASE 
        WHEN BINARY redcap_event_name = 'Step 1 Week 10/ End (Arm 2: Step 1 Acute)' AND 
             (LOWER(adherence_3_med2) = 'bupropion' OR LOWER(adherence_3_med2) = 'aripiprazole') 
        THEN adherence_3_freq2 
        ELSE NULL 
    END AS week10_med2_freq

FROM 
    baard.opt_medication
WHERE 
    (LOWER(adherence_3_med1) = 'bupropion' OR LOWER(adherence_3_med1) = 'aripiprazole')
    OR 
    (LOWER(adherence_3_med2) = 'bupropion' OR LOWER(adherence_3_med2) = 'aripiprazole')
    AND redcap_event_name IN ('Step 1 Week 2 (Arm 2: Step 1 Acute)', 'Step 1 Week 4 (Arm 2: Step 1 Acute)', 'Step 1 Week 6 (Arm 2: Step 1 Acute)', 'Step 1 Week 8 (Arm 2: Step 1 Acute)', 'Step 1 Week 10/ End (Arm 2: Step 1 Acute)')
GROUP BY 
    record_id
HAVING 
    -- Ensure at least one entry for week2, week4, week6, or week8
    SUM(CASE WHEN BINARY redcap_event_name = 'Step 1 Week 2 (Arm 2: Step 1 Acute)' THEN 1 ELSE 0 END) > 0
    OR 
    SUM(CASE WHEN BINARY redcap_event_name = 'Step 1 Week 4 (Arm 2: Step 1 Acute)' THEN 1 ELSE 0 END) > 0
    OR 
    SUM(CASE WHEN BINARY redcap_event_name = 'Step 1 Week 6 (Arm 2: Step 1 Acute)' THEN 1 ELSE 0 END) > 0
    OR 
    SUM(CASE WHEN BINARY redcap_event_name = 'Step 1 Week 8 (Arm 2: Step 1 Acute)' THEN 1 ELSE 0 END) > 0
    OR 
    SUM(CASE WHEN BINARY redcap_event_name = 'Step 1 Week 10/ End (Arm 2: Step 1 Acute)' THEN 1 ELSE 0 END) > 0;

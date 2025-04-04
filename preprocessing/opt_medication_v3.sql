USE baard;

SELECT record_id,
       -- Week 2
       GROUP_CONCAT(CASE WHEN BINARY redcap_event_name = 'Step 1 Week 2 (Arm 2: Step 1 Acute)' THEN decision_date ELSE NULL END ORDER BY decision_date SEPARATOR ', ') AS week2_decision_date,
       GROUP_CONCAT(CASE 
                    WHEN BINARY redcap_event_name = 'Step 1 Week 2 (Arm 2: Step 1 Acute)' AND (LOWER(adherence_3_med1) LIKE '%bupropion%' OR LOWER(adherence_3_med1) LIKE '%wellbutrin%') 
                    THEN 'Bupropion' 
                    WHEN BINARY redcap_event_name = 'Step 1 Week 2 (Arm 2: Step 1 Acute)' AND (LOWER(adherence_3_med1) LIKE '%aripiprazole%' OR LOWER(adherence_3_med1) LIKE '%abilify%') 
                    THEN 'Aripiprazole' 
                    ELSE NULL 
                    END ORDER BY adherence_3_med1 SEPARATOR ', ') AS week2_med1,
       GROUP_CONCAT(CASE WHEN BINARY redcap_event_name = 'Step 1 Week 2 (Arm 2: Step 1 Acute)' AND (LOWER(adherence_3_med1) LIKE '%bupropion%' OR LOWER(adherence_3_med1) LIKE '%wellbutrin%' OR LOWER(adherence_3_med1) LIKE '%aripiprazole%' OR LOWER(adherence_3_med1) LIKE '%abilify%') THEN adherence_3_freq1 ELSE NULL END ORDER BY adherence_3_freq1 SEPARATOR ', ') AS week2_med1_freq,
       GROUP_CONCAT(CASE 
                    WHEN BINARY redcap_event_name = 'Step 1 Week 2 (Arm 2: Step 1 Acute)' AND (LOWER(adherence_3_med2) LIKE '%bupropion%' OR LOWER(adherence_3_med2) LIKE '%wellbutrin%') 
                    THEN 'Bupropion' 
                    WHEN BINARY redcap_event_name = 'Step 1 Week 2 (Arm 2: Step 1 Acute)' AND (LOWER(adherence_3_med2) LIKE '%aripiprazole%' OR LOWER(adherence_3_med2) LIKE '%abilify%') 
                    THEN 'Aripiprazole' 
                    ELSE NULL 
                    END ORDER BY adherence_3_med2 SEPARATOR ', ') AS week2_med2,
       GROUP_CONCAT(CASE WHEN BINARY redcap_event_name = 'Step 1 Week 2 (Arm 2: Step 1 Acute)' AND (LOWER(adherence_3_med2) LIKE '%bupropion%' OR LOWER(adherence_3_med2) LIKE '%wellbutrin%' OR LOWER(adherence_3_med2) LIKE '%aripiprazole%' OR LOWER(adherence_3_med2) LIKE '%abilify%') THEN adherence_3_freq2 ELSE NULL END ORDER BY adherence_3_freq2 SEPARATOR ', ') AS week2_med2_freq,
       
       -- Week 4
       GROUP_CONCAT(CASE WHEN BINARY redcap_event_name = 'Step 1 Week 4 (Arm 2: Step 1 Acute)' THEN decision_date ELSE NULL END ORDER BY decision_date SEPARATOR ', ') AS week4_decision_date,
       GROUP_CONCAT(CASE 
                    WHEN BINARY redcap_event_name = 'Step 1 Week 4 (Arm 2: Step 1 Acute)' AND (LOWER(adherence_3_med1) LIKE '%bupropion%' OR LOWER(adherence_3_med1) LIKE '%wellbutrin%') 
                    THEN 'Bupropion' 
                    WHEN BINARY redcap_event_name = 'Step 1 Week 4 (Arm 2: Step 1 Acute)' AND (LOWER(adherence_3_med1) LIKE '%aripiprazole%' OR LOWER(adherence_3_med1) LIKE '%abilify%') 
                    THEN 'Aripiprazole' 
                    ELSE NULL 
                    END ORDER BY adherence_3_med1 SEPARATOR ', ') AS week4_med1,
       GROUP_CONCAT(CASE WHEN BINARY redcap_event_name = 'Step 1 Week 4 (Arm 2: Step 1 Acute)' AND (LOWER(adherence_3_med1) LIKE '%bupropion%' OR LOWER(adherence_3_med1) LIKE '%wellbutrin%' OR LOWER(adherence_3_med1) LIKE '%aripiprazole%' OR LOWER(adherence_3_med1) LIKE '%abilify%') THEN adherence_3_freq1 ELSE NULL END ORDER BY adherence_3_freq1 SEPARATOR ', ') AS week4_med1_freq,
       GROUP_CONCAT(CASE 
                    WHEN BINARY redcap_event_name = 'Step 1 Week 4 (Arm 2: Step 1 Acute)' AND (LOWER(adherence_3_med2) LIKE '%bupropion%' OR LOWER(adherence_3_med2) LIKE '%wellbutrin%') 
                    THEN 'Bupropion' 
                    WHEN BINARY redcap_event_name = 'Step 1 Week 4 (Arm 2: Step 1 Acute)' AND (LOWER(adherence_3_med2) LIKE '%aripiprazole%' OR LOWER(adherence_3_med2) LIKE '%abilify%') 
                    THEN 'Aripiprazole' 
                    ELSE NULL 
                    END ORDER BY adherence_3_med2 SEPARATOR ', ') AS week4_med2,
       GROUP_CONCAT(CASE WHEN BINARY redcap_event_name = 'Step 1 Week 4 (Arm 2: Step 1 Acute)' AND (LOWER(adherence_3_med2) LIKE '%bupropion%' OR LOWER(adherence_3_med2) LIKE '%wellbutrin%' OR LOWER(adherence_3_med2) LIKE '%aripiprazole%' OR LOWER(adherence_3_med2) LIKE '%abilify%') THEN adherence_3_freq2 ELSE NULL END ORDER BY adherence_3_freq2 SEPARATOR ', ') AS week4_med2_freq,

       -- Week 6
       GROUP_CONCAT(CASE WHEN BINARY redcap_event_name = 'Step 1 Week 6 (Arm 2: Step 1 Acute)' THEN decision_date ELSE NULL END ORDER BY decision_date SEPARATOR ', ') AS week6_decision_date,
       GROUP_CONCAT(CASE 
                    WHEN BINARY redcap_event_name = 'Step 1 Week 6 (Arm 2: Step 1 Acute)' AND (LOWER(adherence_3_med1) LIKE '%bupropion%' OR LOWER(adherence_3_med1) LIKE '%wellbutrin%') 
                    THEN 'Bupropion' 
                    WHEN BINARY redcap_event_name = 'Step 1 Week 6 (Arm 2: Step 1 Acute)' AND (LOWER(adherence_3_med1) LIKE '%aripiprazole%' OR LOWER(adherence_3_med1) LIKE '%abilify%') 
                    THEN 'Aripiprazole' 
                    ELSE NULL 
                    END ORDER BY adherence_3_med1 SEPARATOR ', ') AS week6_med1,
       GROUP_CONCAT(CASE WHEN BINARY redcap_event_name = 'Step 1 Week 6 (Arm 2: Step 1 Acute)' AND (LOWER(adherence_3_med1) LIKE '%bupropion%' OR LOWER(adherence_3_med1) LIKE '%wellbutrin%' OR LOWER(adherence_3_med1) LIKE '%aripiprazole%' OR LOWER(adherence_3_med1) LIKE '%abilify%') THEN adherence_3_freq1 ELSE NULL END ORDER BY adherence_3_freq1 SEPARATOR ', ') AS week6_med1_freq,
       GROUP_CONCAT(CASE 
                    WHEN BINARY redcap_event_name = 'Step 1 Week 6 (Arm 2: Step 1 Acute)' AND (LOWER(adherence_3_med2) LIKE '%bupropion%' OR LOWER(adherence_3_med2) LIKE '%wellbutrin%') 
                    THEN 'Bupropion' 
                    WHEN BINARY redcap_event_name = 'Step 1 Week 6 (Arm 2: Step 1 Acute)' AND (LOWER(adherence_3_med2) LIKE '%aripiprazole%' OR LOWER(adherence_3_med2) LIKE '%abilify%') 
                    THEN 'Aripiprazole' 
                    ELSE NULL 
                    END ORDER BY adherence_3_med2 SEPARATOR ', ') AS week6_med2,
       GROUP_CONCAT(CASE WHEN BINARY redcap_event_name = 'Step 1 Week 6 (Arm 2: Step 1 Acute)' AND (LOWER(adherence_3_med2) LIKE '%bupropion%' OR LOWER(adherence_3_med2) LIKE '%wellbutrin%' OR LOWER(adherence_3_med2) LIKE '%aripiprazole%' OR LOWER(adherence_3_med2) LIKE '%abilify%') THEN adherence_3_freq2 ELSE NULL END ORDER BY adherence_3_freq2 SEPARATOR ', ') AS week6_med2_freq,
       
       -- Week 8
       GROUP_CONCAT(CASE WHEN BINARY redcap_event_name = 'Step 1 Week 8 (Arm 2: Step 1 Acute)' THEN decision_date ELSE NULL END ORDER BY decision_date SEPARATOR ', ') AS week8_decision_date,
       GROUP_CONCAT(CASE 
                    WHEN BINARY redcap_event_name = 'Step 1 Week 8 (Arm 2: Step 1 Acute)' AND (LOWER(adherence_3_med1) LIKE '%bupropion%' OR LOWER(adherence_3_med1) LIKE '%wellbutrin%') 
                    THEN 'Bupropion' 
                    WHEN BINARY redcap_event_name = 'Step 1 Week 8 (Arm 2: Step 1 Acute)' AND (LOWER(adherence_3_med1) LIKE '%aripiprazole%' OR LOWER(adherence_3_med1) LIKE '%abilify%') 
                    THEN 'Aripiprazole' 
                    ELSE NULL 
                    END ORDER BY adherence_3_med1 SEPARATOR ', ') AS week8_med1,
       GROUP_CONCAT(CASE WHEN BINARY redcap_event_name = 'Step 1 Week 8 (Arm 2: Step 1 Acute)' AND (LOWER(adherence_3_med1) LIKE '%bupropion%' OR LOWER(adherence_3_med1) LIKE '%wellbutrin%' OR LOWER(adherence_3_med1) LIKE '%aripiprazole%' OR LOWER(adherence_3_med1) LIKE '%abilify%') THEN adherence_3_freq1 ELSE NULL END ORDER BY adherence_3_freq1 SEPARATOR ', ') AS week8_med1_freq,
       GROUP_CONCAT(CASE 
                    WHEN BINARY redcap_event_name = 'Step 1 Week 8 (Arm 2: Step 1 Acute)' AND (LOWER(adherence_3_med2) LIKE '%bupropion%' OR LOWER(adherence_3_med2) LIKE '%wellbutrin%') 
                    THEN 'Bupropion' 
                    WHEN BINARY redcap_event_name = 'Step 1 Week 8 (Arm 2: Step 1 Acute)' AND (LOWER(adherence_3_med2) LIKE '%aripiprazole%' OR LOWER(adherence_3_med2) LIKE '%abilify%') 
                    THEN 'Aripiprazole' 
                    ELSE NULL 
                    END ORDER BY adherence_3_med2 SEPARATOR ', ') AS week8_med2,
       GROUP_CONCAT(CASE WHEN BINARY redcap_event_name = 'Step 1 Week 8 (Arm 2: Step 1 Acute)' AND (LOWER(adherence_3_med2) LIKE '%bupropion%' OR LOWER(adherence_3_med2) LIKE '%wellbutrin%' OR LOWER(adherence_3_med2) LIKE '%aripiprazole%' OR LOWER(adherence_3_med2) LIKE '%abilify%') THEN adherence_3_freq2 ELSE NULL END ORDER BY adherence_3_freq2 SEPARATOR ', ') AS week8_med2_freq,

       -- Week 10
       GROUP_CONCAT(CASE WHEN BINARY redcap_event_name = 'Step 1 Week 10/ End (Arm 2: Step 1 Acute)' THEN decision_date ELSE NULL END ORDER BY decision_date SEPARATOR ', ') AS week10_decision_date,
       GROUP_CONCAT(CASE 
                    WHEN BINARY redcap_event_name = 'Step 1 Week 10/ End (Arm 2: Step 1 Acute)' AND (LOWER(adherence_3_med1) LIKE '%bupropion%' OR LOWER(adherence_3_med1) LIKE '%wellbutrin%') 
                    THEN 'Bupropion' 
                    WHEN BINARY redcap_event_name = 'Step 1 Week 10/ End (Arm 2: Step 1 Acute)' AND (LOWER(adherence_3_med1) LIKE '%aripiprazole%' OR LOWER(adherence_3_med1) LIKE '%abilify%') 
                    THEN 'Aripiprazole' 
                    ELSE NULL 
                    END ORDER BY adherence_3_med1 SEPARATOR ', ') AS week10_med1,
       GROUP_CONCAT(CASE WHEN BINARY redcap_event_name = 'Step 1 Week 10/ End (Arm 2: Step 1 Acute)' AND (LOWER(adherence_3_med1) LIKE '%bupropion%' OR LOWER(adherence_3_med1) LIKE '%wellbutrin%' OR LOWER(adherence_3_med1) LIKE '%aripiprazole%' OR LOWER(adherence_3_med1) LIKE '%abilify%') THEN adherence_3_freq1 ELSE NULL END ORDER BY adherence_3_freq1 SEPARATOR ', ') AS week10_med1_freq,
       GROUP_CONCAT(CASE 
                    WHEN BINARY redcap_event_name = 'Step 1 Week 10/ End (Arm 2: Step 1 Acute)' AND (LOWER(adherence_3_med2) LIKE '%bupropion%' OR LOWER(adherence_3_med2) LIKE '%wellbutrin%') 
                    THEN 'Bupropion' 
                    WHEN BINARY redcap_event_name = 'Step 1 Week 10/ End (Arm 2: Step 1 Acute)' AND (LOWER(adherence_3_med2) LIKE '%aripiprazole%' OR LOWER(adherence_3_med2) LIKE '%abilify%') 
                    THEN 'Aripiprazole' 
                    ELSE NULL 
                    END ORDER BY adherence_3_med2 SEPARATOR ', ') AS week10_med2,
       GROUP_CONCAT(CASE WHEN BINARY redcap_event_name = 'Step 1 Week 10/ End (Arm 2: Step 1 Acute)' AND (LOWER(adherence_3_med2) LIKE '%bupropion%' OR LOWER(adherence_3_med2) LIKE '%wellbutrin%' OR LOWER(adherence_3_med2) LIKE '%aripiprazole%' OR LOWER(adherence_3_med2) LIKE '%abilify%') THEN adherence_3_freq2 ELSE NULL END ORDER BY adherence_3_freq2 SEPARATOR ', ') AS week10_med2_freq
FROM baard.opt_adherence_20250124
WHERE redcap_event_name IN (
    'Step 1 Week 2 (Arm 2: Step 1 Acute)',
    'Step 1 Week 4 (Arm 2: Step 1 Acute)',
    'Step 1 Week 6 (Arm 2: Step 1 Acute)',
    'Step 1 Week 8 (Arm 2: Step 1 Acute)',
    'Step 1 Week 10/ End (Arm 2: Step 1 Acute)'
)
GROUP BY record_id;

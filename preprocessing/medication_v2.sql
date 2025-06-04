(SELECT upper(record_id) AS record_id,
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
GROUP BY record_id)
UNION
(SELECT 
    upper(record_id) AS record_id,
    -- For week 2 event
	GROUP_CONCAT(CASE WHEN BINARY redcap_event_name = 'week_2_arm_8' THEN decision_date ELSE NULL END ORDER BY decision_date SEPARATOR ', ') AS week2_decision_date,
    GROUP_CONCAT(CASE WHEN BINARY redcap_event_name = 'week_2_arm_8' AND 
                         (LOWER(adherence_3_med1) LIKE '%bupropion%' OR LOWER(adherence_3_med1) LIKE '%wellbutrin%')
                         THEN 'Bupropion' 
                     WHEN BINARY redcap_event_name = 'week_2_arm_8' AND 
                         (LOWER(adherence_3_med1) LIKE '%aripiprazole%' OR LOWER(adherence_3_med1) LIKE '%abilify%')
                         THEN 'Aripiprazole' 
                     END ORDER BY adherence_3_med1 SEPARATOR ', ') AS week2_med1,
                     
    GROUP_CONCAT(CASE WHEN BINARY redcap_event_name = 'week_2_arm_8' AND 
                         (LOWER(adherence_3_med1) LIKE '%bupropion%' OR LOWER(adherence_3_med1) LIKE '%wellbutrin%')
                         THEN adherence_3_freq1 END ORDER BY adherence_3_med1 SEPARATOR ', ') AS week2_med1_freq,
    
    GROUP_CONCAT(CASE WHEN BINARY redcap_event_name = 'week_2_arm_8' AND 
                         (LOWER(adherence_3_med2) LIKE '%bupropion%' OR LOWER(adherence_3_med2) LIKE '%wellbutrin%')
                         THEN 'Bupropion' 
                     WHEN BINARY redcap_event_name = 'week_2_arm_8' AND 
                         (LOWER(adherence_3_med2) LIKE '%aripiprazole%' OR LOWER(adherence_3_med2) LIKE '%abilify%')
                         THEN 'Aripiprazole' 
                     END ORDER BY adherence_3_med2 SEPARATOR ', ') AS week2_med2,
                     
    GROUP_CONCAT(CASE WHEN BINARY redcap_event_name = 'week_2_arm_8' AND 
                         (LOWER(adherence_3_med2) LIKE '%bupropion%' OR LOWER(adherence_3_med2) LIKE '%wellbutrin%')
                         THEN adherence_3_freq2 END ORDER BY adherence_3_freq2 SEPARATOR ', ') AS week2_med2_freq,

    -- For week 4 event
	GROUP_CONCAT(CASE WHEN BINARY redcap_event_name = 'week_4_arm_8' THEN decision_date ELSE NULL END ORDER BY decision_date SEPARATOR ', ') AS week4_decision_date,
	GROUP_CONCAT(CASE WHEN BINARY redcap_event_name = 'week_4_arm_8' AND 
                         (LOWER(adherence_3_med1) LIKE '%bupropion%' OR LOWER(adherence_3_med1) LIKE '%wellbutrin%')
                         THEN 'Bupropion' 
                     WHEN BINARY redcap_event_name = 'week_4_arm_8' AND 
                         (LOWER(adherence_3_med1) LIKE '%aripiprazole%' OR LOWER(adherence_3_med1) LIKE '%abilify%')
                         THEN 'Aripiprazole' 
                     END ORDER BY adherence_3_med1 SEPARATOR ', ') AS week4_med1,
                     
    GROUP_CONCAT(CASE WHEN BINARY redcap_event_name = 'week_4_arm_8' AND 
                         (LOWER(adherence_3_med1) LIKE '%bupropion%' OR LOWER(adherence_3_med1) LIKE '%wellbutrin%')
                         THEN adherence_3_freq1 END ORDER BY adherence_3_freq1 SEPARATOR ', ') AS week4_med1_freq,
    
    GROUP_CONCAT(CASE WHEN BINARY redcap_event_name = 'week_4_arm_8' AND 
                         (LOWER(adherence_3_med2) LIKE '%bupropion%' OR LOWER(adherence_3_med2) LIKE '%wellbutrin%')
                         THEN 'Bupropion' 
                     WHEN BINARY redcap_event_name = 'week_4_arm_8' AND 
                         (LOWER(adherence_3_med2) LIKE '%aripiprazole%' OR LOWER(adherence_3_med2) LIKE '%abilify%')
                         THEN 'Aripiprazole' 
                     END ORDER BY adherence_3_med2 SEPARATOR ', ') AS week4_med2,
                     
    GROUP_CONCAT(CASE WHEN BINARY redcap_event_name = 'week_4_arm_8' AND 
                         (LOWER(adherence_3_med2) LIKE '%bupropion%' OR LOWER(adherence_3_med2) LIKE '%wellbutrin%')
                         THEN adherence_3_freq2 END ORDER BY adherence_3_freq2 SEPARATOR ', ') AS week4_med2_freq,

    -- For week 6 event
	GROUP_CONCAT(CASE WHEN BINARY redcap_event_name = 'week_6_arm_8' THEN decision_date ELSE NULL END ORDER BY decision_date SEPARATOR ', ') AS week6_decision_date,
    GROUP_CONCAT(CASE WHEN BINARY redcap_event_name = 'week_6_arm_8' AND 
                         (LOWER(adherence_3_med1) LIKE '%bupropion%' OR LOWER(adherence_3_med1) LIKE '%wellbutrin%')
                         THEN 'Bupropion' 
                     WHEN BINARY redcap_event_name = 'week_6_arm_8' AND 
                         (LOWER(adherence_3_med1) LIKE '%aripiprazole%' OR LOWER(adherence_3_med1) LIKE '%abilify%')
                         THEN 'Aripiprazole' 
                     END ORDER BY adherence_3_med1 SEPARATOR ', ') AS week6_med1,
                     
    GROUP_CONCAT(CASE WHEN BINARY redcap_event_name = 'week_6_arm_8' AND 
                         (LOWER(adherence_3_med1) LIKE '%bupropion%' OR LOWER(adherence_3_med1) LIKE '%wellbutrin%')
                         THEN adherence_3_freq1 END ORDER BY adherence_3_freq1 SEPARATOR ', ') AS week6_med1_freq,
    
    GROUP_CONCAT(CASE WHEN BINARY redcap_event_name = 'week_6_arm_8' AND 
                         (LOWER(adherence_3_med2) LIKE '%bupropion%' OR LOWER(adherence_3_med2) LIKE '%wellbutrin%')
                         THEN 'Bupropion' 
                     WHEN BINARY redcap_event_name = 'week_6_arm_8' AND 
                         (LOWER(adherence_3_med2) LIKE '%aripiprazole%' OR LOWER(adherence_3_med2) LIKE '%abilify%')
                         THEN 'Aripiprazole' 
                     END ORDER BY adherence_3_med2 SEPARATOR ', ') AS week6_med2,
                     
    GROUP_CONCAT(CASE WHEN BINARY redcap_event_name = 'week_6_arm_8' AND 
                         (LOWER(adherence_3_med2) LIKE '%bupropion%' OR LOWER(adherence_3_med2) LIKE '%wellbutrin%')
                         THEN adherence_3_freq2 END ORDER BY adherence_3_freq2 SEPARATOR ', ') AS week6_med2_freq,

    -- For week 8 event
	GROUP_CONCAT(CASE WHEN BINARY redcap_event_name = 'week_8_arm_8' THEN decision_date ELSE NULL END ORDER BY decision_date SEPARATOR ', ') AS week8_decision_date,
	GROUP_CONCAT(CASE WHEN BINARY redcap_event_name = 'week_8_arm_8' AND 
                         (LOWER(adherence_3_med1) LIKE '%bupropion%' OR LOWER(adherence_3_med1) LIKE '%wellbutrin%')
                         THEN 'Bupropion' 
                     WHEN BINARY redcap_event_name = 'week_8_arm_8' AND 
                         (LOWER(adherence_3_med1) LIKE '%aripiprazole%' OR LOWER(adherence_3_med1) LIKE '%abilify%')
                         THEN 'Aripiprazole' 
                     END ORDER BY adherence_3_med1 SEPARATOR ', ') AS week8_med1,
                     
    GROUP_CONCAT(CASE WHEN BINARY redcap_event_name = 'week_8_arm_8' AND 
                         (LOWER(adherence_3_med1) LIKE '%bupropion%' OR LOWER(adherence_3_med1) LIKE '%wellbutrin%')
                         THEN adherence_3_freq1 END ORDER BY adherence_3_freq1 SEPARATOR ', ') AS week8_med1_freq,
    
    GROUP_CONCAT(CASE WHEN BINARY redcap_event_name = 'week_8_arm_8' AND 
                         (LOWER(adherence_3_med2) LIKE '%bupropion%' OR LOWER(adherence_3_med2) LIKE '%wellbutrin%')
                         THEN 'Bupropion' 
                     WHEN BINARY redcap_event_name = 'week_8_arm_8' AND 
                         (LOWER(adherence_3_med2) LIKE '%aripiprazole%' OR LOWER(adherence_3_med2) LIKE '%abilify%')
                         THEN 'Aripiprazole' 
                     END ORDER BY adherence_3_med2 SEPARATOR ', ') AS week8_med2,
                     
    GROUP_CONCAT(CASE WHEN BINARY redcap_event_name = 'week_8_arm_8' AND 
                         (LOWER(adherence_3_med2) LIKE '%bupropion%' OR LOWER(adherence_3_med2) LIKE '%wellbutrin%')
                         THEN adherence_3_freq2 END ORDER BY adherence_3_freq2 SEPARATOR ', ') AS week8_med2_freq,

    -- For week 10 event
	GROUP_CONCAT(CASE WHEN BINARY redcap_event_name = 'week_10end_arm_8' THEN decision_date ELSE NULL END ORDER BY decision_date SEPARATOR ', ') AS week10_decision_date,
    GROUP_CONCAT(CASE WHEN BINARY redcap_event_name = 'week_10end_arm_8' AND 
                         (LOWER(adherence_3_med1) LIKE '%bupropion%' OR LOWER(adherence_3_med1) LIKE '%wellbutrin%')
                         THEN 'Bupropion' 
                     WHEN BINARY redcap_event_name = 'week_10end_arm_8' AND 
                         (LOWER(adherence_3_med1) LIKE '%aripiprazole%' OR LOWER(adherence_3_med1) LIKE '%abilify%')
                         THEN 'Aripiprazole' 
                     END ORDER BY adherence_3_med1 SEPARATOR ', ') AS week10_med1,
                     
    GROUP_CONCAT(CASE WHEN BINARY redcap_event_name = 'week_10end_arm_8' AND 
                         (LOWER(adherence_3_med1) LIKE '%bupropion%' OR LOWER(adherence_3_med1) LIKE '%wellbutrin%')
                         THEN adherence_3_freq1 END ORDER BY adherence_3_freq1 SEPARATOR ', ') AS week10_med1_freq,
    
    GROUP_CONCAT(CASE WHEN BINARY redcap_event_name = 'week_10end_arm_8' AND 
                         (LOWER(adherence_3_med2) LIKE '%bupropion%' OR LOWER(adherence_3_med2) LIKE '%wellbutrin%')
                         THEN 'Bupropion' 
                     WHEN BINARY redcap_event_name = 'week_10end_arm_8' AND 
                         (LOWER(adherence_3_med2) LIKE '%aripiprazole%' OR LOWER(adherence_3_med2) LIKE '%abilify%')
                         THEN 'Aripiprazole' 
                     END ORDER BY adherence_3_med2 SEPARATOR ', ') AS week10_med2,
                     
    GROUP_CONCAT(CASE WHEN BINARY redcap_event_name = 'week_10end_arm_8' AND 
                         (LOWER(adherence_3_med2) LIKE '%bupropion%' OR LOWER(adherence_3_med2) LIKE '%wellbutrin%')
                         THEN adherence_3_freq2 END ORDER BY adherence_3_freq2 SEPARATOR ', ') AS week10_med2_freq
FROM 
    baard.optn_decision_support_form_arm_7_8_20250315
WHERE 
    (LOWER(adherence_3_med1) LIKE '%bupropion%' OR LOWER(adherence_3_med1) LIKE '%wellbutrin%')
    OR 
    (LOWER(adherence_3_med2) LIKE '%bupropion%' OR LOWER(adherence_3_med2) LIKE '%wellbutrin%')
    OR
    (LOWER(adherence_3_med1) LIKE '%aripiprazole%' OR LOWER(adherence_3_med1) LIKE '%abilify%')
    OR 
    (LOWER(adherence_3_med2) LIKE '%aripiprazole%' OR LOWER(adherence_3_med2) LIKE '%abilify%')
    AND redcap_event_name IN ('week_2_arm_8', 'week_4_arm_8', 'week_6_arm_8', 'week_8_arm_8', 'week_10end_arm_8')
GROUP BY 
    record_id
HAVING 
    -- Ensure at least one entry for week2, week4, week6, week8, or week10
    SUM(CASE WHEN BINARY redcap_event_name = 'week_2_arm_8' THEN 1 ELSE 0 END) > 0
    OR 
    SUM(CASE WHEN BINARY redcap_event_name = 'week_4_arm_8' THEN 1 ELSE 0 END) > 0
    OR 
    SUM(CASE WHEN BINARY redcap_event_name = 'week_6_arm_8' THEN 1 ELSE 0 END) > 0
    OR 
    SUM(CASE WHEN BINARY redcap_event_name = 'week_8_arm_8' THEN 1 ELSE 0 END) > 0
    OR 
    SUM(CASE WHEN BINARY redcap_event_name = 'week_10end_arm_8' THEN 1 ELSE 0 END) > 0);

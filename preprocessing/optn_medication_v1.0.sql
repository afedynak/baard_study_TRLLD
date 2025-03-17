USE baard;

SET SQL_SAFE_UPDATES=0;

UPDATE optn_decision_support_form_arm_7_8_20250315 
SET adherence_3_med1 = "Aripiprazole"
WHERE adherence_3_med1 = "89013";

UPDATE optn_decision_support_form_arm_7_8_20250315 
SET adherence_3_med1 = "Bupropion"
WHERE adherence_3_med1 = "42347";

UPDATE optn_decision_support_form_arm_7_8_20250315 
SET adherence_3_med2 = "Aripiprazole"
WHERE adherence_3_med2 = "89013";

UPDATE optn_decision_support_form_arm_7_8_20250315 
SET adherence_3_med2 = "Bupropion"
WHERE adherence_3_med2 = "42347";

# Medication

UPDATE optn_decision_support_form_arm_7_8_20250315 
SET adherence_3_freq1 = "Not taking it at all (missed all doses)"
WHERE adherence_3_freq1 = "1";

UPDATE optn_decision_support_form_arm_7_8_20250315
SET adherence_3_freq1 = "Missed dose more often than not"
WHERE adherence_3_freq1 = "2";

UPDATE optn_decision_support_form_arm_7_8_20250315
SET adherence_3_freq1 = "Missed dose more often than 2 times a week"
WHERE adherence_3_freq1 = "3";

UPDATE optn_decision_support_form_arm_7_8_20250315
SET adherence_3_freq1 = "Missed dose more often than 1 time a week"
WHERE adherence_3_freq1 = "4";

UPDATE optn_decision_support_form_arm_7_8_20250315
SET adherence_3_freq1 = "Missed dose 1 time a week"
WHERE adherence_3_freq1 = "5";

UPDATE optn_decision_support_form_arm_7_8_20250315
SET adherence_3_freq1 = "Missed dose less than 1 time a week"
WHERE adherence_3_freq1 = "6";

UPDATE optn_decision_support_form_arm_7_8_20250315
SET adherence_3_freq1 = "Never missed a dose"
WHERE adherence_3_freq1 = "7";

UPDATE optn_decision_support_form_arm_7_8_20250315 
SET adherence_3_freq2 = "Not taking it at all (missed all doses)"
WHERE adherence_3_freq2 = "1";

UPDATE optn_decision_support_form_arm_7_8_20250315
SET adherence_3_freq2 = "Missed dose more often than not"
WHERE adherence_3_freq2 = "2";

UPDATE optn_decision_support_form_arm_7_8_20250315
SET adherence_3_freq2 = "Missed dose more often than 2 times a week"
WHERE adherence_3_freq2 = "3";

UPDATE optn_decision_support_form_arm_7_8_20250315
SET adherence_3_freq2 = "Missed dose more often than 1 time a week"
WHERE adherence_3_freq2 = "4";

UPDATE optn_decision_support_form_arm_7_8_20250315
SET adherence_3_freq2 = "Missed dose 1 time a week"
WHERE adherence_3_freq2 = "5";

UPDATE optn_decision_support_form_arm_7_8_20250315
SET adherence_3_freq2 = "Missed dose less than 1 time a week"
WHERE adherence_3_freq2 = "6";

UPDATE optn_decision_support_form_arm_7_8_20250315
SET adherence_3_freq2 = "Never missed a dose"
WHERE adherence_3_freq2 = "7";

SELECT 
    record_id,
    -- For week 2 event
    GROUP_CONCAT(CASE WHEN BINARY redcap_event_name = 'week_2_arm_8' AND 
                         (LOWER(adherence_3_med1) = 'bupropion' OR LOWER(adherence_3_med1) = 'aripiprazole') 
                         THEN adherence_3_med1 END ORDER BY adherence_3_med1 SEPARATOR ', ') AS week2_med1,
    GROUP_CONCAT(CASE WHEN BINARY redcap_event_name = 'week_2_arm_8' AND 
                         (LOWER(adherence_3_med1) = 'bupropion' OR LOWER(adherence_3_med1) = 'aripiprazole') 
                         THEN adherence_3_freq1 END ORDER BY adherence_3_med1 SEPARATOR ', ') AS week2_med1_freq,
	GROUP_CONCAT(CASE WHEN BINARY redcap_event_name = 'week_2_arm_8' AND 
                         (LOWER(adherence_3_med2) = 'bupropion' OR LOWER(adherence_3_med2) = 'aripiprazole') 
                         THEN adherence_3_med2 END ORDER BY adherence_3_med2 SEPARATOR ', ') AS week2_med2,
    GROUP_CONCAT(CASE WHEN BINARY redcap_event_name = 'week_2_arm_8' AND 
                         (LOWER(adherence_3_med2) = 'bupropion' OR LOWER(adherence_3_med2) = 'aripiprazole') 
                         THEN adherence_3_freq2 END ORDER BY adherence_3_freq2 SEPARATOR ', ') AS week2_med2_freq,
   # 
    #-- For week 4 event
    GROUP_CONCAT(CASE WHEN BINARY redcap_event_name = 'week_4_arm_8' AND 
                         (LOWER(adherence_3_med1) = 'bupropion' OR LOWER(adherence_3_med1) = 'aripiprazole') 
                         THEN adherence_3_med1 END ORDER BY adherence_3_med1 SEPARATOR ', ') AS week4_med1,
    GROUP_CONCAT(CASE WHEN BINARY redcap_event_name = 'week_4_arm_8' AND 
                         (LOWER(adherence_3_med1) = 'bupropion' OR LOWER(adherence_3_med1) = 'aripiprazole') 
                         THEN adherence_3_freq1 END ORDER BY adherence_3_freq1 SEPARATOR ', ') AS week4_med1_freq,
    GROUP_CONCAT(CASE WHEN BINARY redcap_event_name = 'week_4_arm_8' AND 
                         (LOWER(adherence_3_med2) = 'bupropion' OR LOWER(adherence_3_med2) = 'aripiprazole') 
                         THEN adherence_3_med2 END ORDER BY adherence_3_med2 SEPARATOR ', ') AS week4_med2,
    GROUP_CONCAT(CASE WHEN BINARY redcap_event_name = 'week_4_arm_8' AND 
                         (LOWER(adherence_3_med2) = 'bupropion' OR LOWER(adherence_3_med2) = 'aripiprazole') 
                         THEN adherence_3_freq2 END ORDER BY adherence_3_freq2 SEPARATOR ', ') AS week4_med2_freq,
    
    #-- For week 6 event
    GROUP_CONCAT(CASE WHEN BINARY redcap_event_name = 'week_6_arm_8' AND 
                         (LOWER(adherence_3_med1) = 'bupropion' OR LOWER(adherence_3_med1) = 'aripiprazole') 
                         THEN adherence_3_med1 END ORDER BY adherence_3_med1 SEPARATOR ', ') AS week6_med1,
    GROUP_CONCAT(CASE WHEN BINARY redcap_event_name = 'week_6_arm_8' AND 
                         (LOWER(adherence_3_med1) = 'bupropion' OR LOWER(adherence_3_med1) = 'aripiprazole') 
                         THEN adherence_3_freq1 END ORDER BY adherence_3_freq1 SEPARATOR ', ') AS week6_med1_freq,
    GROUP_CONCAT(CASE WHEN BINARY redcap_event_name = 'week_6_arm_8' AND 
                         (LOWER(adherence_3_med2) = 'bupropion' OR LOWER(adherence_3_med2) = 'aripiprazole') 
                         THEN adherence_3_med2 END ORDER BY adherence_3_med2 SEPARATOR ', ') AS week6_med2,
    GROUP_CONCAT(CASE WHEN BINARY redcap_event_name = 'week_6_arm_8' AND 
                         (LOWER(adherence_3_med2) = 'bupropion' OR LOWER(adherence_3_med2) = 'aripiprazole') 
                         THEN adherence_3_freq2 END ORDER BY adherence_3_freq2 SEPARATOR ', ') AS week6_med2_freq,
   # 
    #-- For week 8 event
    GROUP_CONCAT(CASE WHEN BINARY redcap_event_name = 'week_8_arm_8' AND 
                         (LOWER(adherence_3_med1) = 'bupropion' OR LOWER(adherence_3_med1) = 'aripiprazole') 
                         THEN adherence_3_med1 END ORDER BY adherence_3_med1 SEPARATOR ', ') AS week8_med1,
    GROUP_CONCAT(CASE WHEN BINARY redcap_event_name = 'week_8_arm_8' AND 
                         (LOWER(adherence_3_med1) = 'bupropion' OR LOWER(adherence_3_med1) = 'aripiprazole') 
                         THEN adherence_3_freq1 END ORDER BY adherence_3_freq1 SEPARATOR ', ') AS week8_med1_freq,
    GROUP_CONCAT(CASE WHEN BINARY redcap_event_name = 'week_8_arm_8' AND 
                         (LOWER(adherence_3_med2) = 'bupropion' OR LOWER(adherence_3_med2) = 'aripiprazole') 
                         THEN adherence_3_med2 END ORDER BY adherence_3_med2 SEPARATOR ', ') AS week8_med2,
    GROUP_CONCAT(CASE WHEN BINARY redcap_event_name = 'week_8_arm_8' AND 
                         (LOWER(adherence_3_med2) = 'bupropion' OR LOWER(adherence_3_med2) = 'aripiprazole') 
                         THEN adherence_3_freq2 END ORDER BY adherence_3_freq2 SEPARATOR ', ') AS week8_med2_freq,
   #                  
#-- For week 10 event
    GROUP_CONCAT(CASE WHEN BINARY redcap_event_name = 'week_10end_arm_8' AND 
                         (LOWER(adherence_3_med1) = 'bupropion' OR LOWER(adherence_3_med1) = 'aripiprazole') 
                         THEN adherence_3_med1 END ORDER BY adherence_3_med1 SEPARATOR ', ') AS week10_med1,
    GROUP_CONCAT(CASE WHEN BINARY redcap_event_name = 'week_10end_arm_8' AND 
                         (LOWER(adherence_3_med1) = 'bupropion' OR LOWER(adherence_3_med1) = 'aripiprazole') 
                         THEN adherence_3_freq1 END ORDER BY adherence_3_freq1 SEPARATOR ', ') AS week10_med1_freq,
    GROUP_CONCAT(CASE WHEN BINARY redcap_event_name = 'week_10end_arm_8' AND 
                         (LOWER(adherence_3_med2) = 'bupropion' OR LOWER(adherence_3_med2) = 'aripiprazole') 
                         THEN adherence_3_med2 END ORDER BY adherence_3_med2 SEPARATOR ', ') AS week10_med2,
    GROUP_CONCAT(CASE WHEN BINARY redcap_event_name = 'week_10end_arm_8' AND 
                         (LOWER(adherence_3_med2) = 'bupropion' OR LOWER(adherence_3_med2) = 'aripiprazole') 
                         THEN adherence_3_freq2 END ORDER BY adherence_3_freq2 SEPARATOR ', ') AS week10_med2_freq
FROM 
    baard.optn_decision_support_form_arm_7_8_20250315
WHERE 
    (LOWER(type_in_rec_med1) = 'bupropion' OR LOWER(type_in_rec_med1) = 'aripiprazole')
    OR 
    (LOWER(type_in_rec_med2) = 'bupropion' OR LOWER(type_in_rec_med2) = 'aripiprazole')
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
    SUM(CASE WHEN BINARY redcap_event_name = 'week_10end_arm_8' THEN 1 ELSE 0 END) > 0;


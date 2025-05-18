
-- Bupropion switch
-- 68
(SELECT t2.record_id,
       t2.week2_med1,
       t2.week2_med2,
       t2.week4_med1,
       t2.week4_med2,
       t2.week6_med1,
       t2.week6_med2,
       t2.week8_med1,
       t2.week8_med2,
       t2.week10_med1,
       t2.week10_med2
FROM baard.medication_all_af t2
JOIN ( 
    SELECT record_id,
           -- Week 2: Only bupropion in med1 or med2, the other must be NULL or empty
           CASE 
               WHEN ((LOWER(IFNULL(week2_med1, '')) = 'bupropion' AND (LOWER(IFNULL(week2_med2, '')) = '' OR week2_med2 IS NULL)) 
                     OR (LOWER(IFNULL(week2_med2, '')) = 'bupropion' AND (LOWER(IFNULL(week2_med1, '')) = '' OR week2_med1 IS NULL)))
               THEN 1 ELSE 0 END AS week2_check,

           -- Week 4: Only bupropion in med1 or med2, the other must be NULL or empty
           CASE 
               WHEN ((LOWER(IFNULL(week4_med1, '')) = 'bupropion' AND (LOWER(IFNULL(week4_med2, '')) = '' OR week4_med2 IS NULL)) 
                     OR (LOWER(IFNULL(week4_med2, '')) = 'bupropion' AND (LOWER(IFNULL(week4_med1, '')) = '' OR week4_med1 IS NULL)))
               THEN 1 ELSE 0 END AS week4_check,

           -- Week 6: Only bupropion in med1 or med2, the other must be NULL or empty
           CASE 
               WHEN ((LOWER(IFNULL(week6_med1, '')) = 'bupropion' AND (LOWER(IFNULL(week6_med2, '')) = '' OR week6_med2 IS NULL)) 
                     OR (LOWER(IFNULL(week6_med2, '')) = 'bupropion' AND (LOWER(IFNULL(week6_med1, '')) = '' OR week6_med1 IS NULL)))
               THEN 1 ELSE 0 END AS week6_check,

           -- Week 8: Only bupropion in med1 or med2, the other must be NULL or empty
           CASE 
               WHEN ((LOWER(IFNULL(week8_med1, '')) = 'bupropion' AND (LOWER(IFNULL(week8_med2, '')) = '' OR week8_med2 IS NULL)) 
                     OR (LOWER(IFNULL(week8_med2, '')) = 'bupropion' AND (LOWER(IFNULL(week8_med1, '')) = '' OR week8_med1 IS NULL)))
               THEN 1 ELSE 0 END AS week8_check,

           -- Week 10: Only bupropion in med1 or med2, the other must be NULL or empty
           CASE 
               WHEN ((LOWER(IFNULL(week10_med1, '')) = 'bupropion' AND (LOWER(IFNULL(week10_med2, '')) = '' OR week10_med2 IS NULL)) 
                     OR (LOWER(IFNULL(week10_med2, '')) = 'bupropion' AND (LOWER(IFNULL(week10_med1, '')) = '' OR week10_med1 IS NULL)))
               THEN 1 ELSE 0 END AS week10_check

    FROM baard.medication_all_af
) t3 ON t2.record_id = t3.record_id
WHERE (t3.week2_check = 1
   AND t3.week4_check = 1
   AND t3.week6_check = 1
   AND t3.week8_check = 1
   AND t3.week10_check = 1)
   ) UNION
   (SELECT record_id,
       week2_med1,
       week2_med2,
       week4_med1,
       week4_med2,
       week6_med1,
       week6_med2,
       week8_med1,
       week8_med2,
       week10_med1,
       week10_med2
   from baard.medication_all_af 
   WHERE record_id IN ("CU10018", "CU10046", "CU10085", "CU10095", "CU10104", "CU10125", 
   "CU10140", "LA10036", "LA10052", "UP10275", "UP10003", "UP10038", "UP10072", 
   "UP10091", "UP10186", "UP10202", "UP10219", "UP10257", "UT10001", "UT10013",
   "UT10026", "UT10051", "UT10081", "UT10142", "UT10147", "LA20023",
   "LA20026", "LA20044", "UT30035", "UT30028"));




-- Aripiprazole augmentation
-- 203
-- Aripiprazole only (no other drugs) augmentation
SELECT t2.record_id,
       t2.week2_med1,
       t2.week2_med2,
       t2.week4_med1,
       t2.week4_med2,
       t2.week6_med1,
       t2.week6_med2,
       t2.week8_med1,
       t2.week8_med2,
       t2.week10_med1,
       t2.week10_med2
FROM baard.medication_all_af t2
JOIN ( 
    SELECT record_id,
           -- Week 2: Aripiprazole and another drug
           CASE 
               WHEN (LOWER(IFNULL(week2_med1, '')) LIKE '%aripiprazole%' AND LOWER(IFNULL(week2_med2, '')) NOT LIKE '%aripiprazole%' AND TRIM(IFNULL(week2_med2, '')) <> '') 
                    OR (LOWER(IFNULL(week2_med2, '')) LIKE '%aripiprazole%' AND LOWER(IFNULL(week2_med1, '')) NOT LIKE '%aripiprazole%' AND TRIM(IFNULL(week2_med1, '')) <> '')
               THEN 1 ELSE 0 END AS week2_check,

           -- Week 4: Aripiprazole and another drug
           CASE 
               WHEN (LOWER(IFNULL(week4_med1, '')) LIKE '%aripiprazole%' AND LOWER(IFNULL(week4_med2, '')) NOT LIKE '%aripiprazole%' AND TRIM(IFNULL(week4_med2, '')) <> '') 
                    OR (LOWER(IFNULL(week4_med2, '')) LIKE '%aripiprazole%' AND LOWER(IFNULL(week4_med1, '')) NOT LIKE '%aripiprazole%' AND TRIM(IFNULL(week4_med1, '')) <> '')
               THEN 1 ELSE 0 END AS week4_check,

           -- Week 6: Aripiprazole and another drug
           CASE 
               WHEN (LOWER(IFNULL(week6_med1, '')) LIKE '%aripiprazole%' AND LOWER(IFNULL(week6_med2, '')) NOT LIKE '%aripiprazole%' AND TRIM(IFNULL(week6_med2, '')) <> '') 
                    OR (LOWER(IFNULL(week6_med2, '')) LIKE '%aripiprazole%' AND LOWER(IFNULL(week6_med1, '')) NOT LIKE '%aripiprazole%' AND TRIM(IFNULL(week6_med1, '')) <> '')
               THEN 1 ELSE 0 END AS week6_check,

           -- Week 8: Aripiprazole and another drug
           CASE 
               WHEN (LOWER(IFNULL(week8_med1, '')) LIKE '%aripiprazole%' AND LOWER(IFNULL(week8_med2, '')) NOT LIKE '%aripiprazole%' AND TRIM(IFNULL(week8_med2, '')) <> '') 
                    OR (LOWER(IFNULL(week8_med2, '')) LIKE '%aripiprazole%' AND LOWER(IFNULL(week8_med1, '')) NOT LIKE '%aripiprazole%' AND TRIM(IFNULL(week8_med1, '')) <> '')
               THEN 1 ELSE 0 END AS week8_check,

           -- Week 10: Aripiprazole and another drug
           CASE 
               WHEN (LOWER(IFNULL(week10_med1, '')) LIKE '%aripiprazole%' AND LOWER(IFNULL(week10_med2, '')) NOT LIKE '%aripiprazole%' AND TRIM(IFNULL(week10_med2, '')) <> '') 
                    OR (LOWER(IFNULL(week10_med2, '')) LIKE '%aripiprazole%' AND LOWER(IFNULL(week10_med1, '')) NOT LIKE '%aripiprazole%' AND TRIM(IFNULL(week10_med1, '')) <> '')
               THEN 1 ELSE 0 END AS week10_check

    FROM baard.medication_all_af
) t3 ON t2.record_id = t3.record_id
WHERE t3.week2_check = 1
   OR t3.week4_check = 1
   OR t3.week6_check = 1
   OR t3.week8_check = 1
   OR t3.week10_check = 1;


--
-- Records without Aripiprazole or Bupropion in weeks 2, 4, 6, 8, and 10
SELECT t2.record_id,
       t2.week2_med1,
       t2.week2_med2,
       t2.week4_med1,
       t2.week4_med2,
       t2.week6_med1,
       t2.week6_med2,
       t2.week8_med1,
       t2.week8_med2,
       t2.week10_med1,
       t2.week10_med2
FROM baard.medication_all_af t2
JOIN ( 
    SELECT record_id,
           -- Week 2: No Aripiprazole or Bupropion
           CASE 
               WHEN (LOWER(IFNULL(week2_med1, '')) NOT LIKE '%aripiprazole%' AND LOWER(IFNULL(week2_med1, '')) NOT LIKE '%bupropion%' AND TRIM(IFNULL(week2_med1, '')) <> '') 
                    AND (LOWER(IFNULL(week2_med2, '')) NOT LIKE '%aripiprazole%' AND LOWER(IFNULL(week2_med2, '')) NOT LIKE '%bupropion%' AND TRIM(IFNULL(week2_med2, '')) <> '')
               THEN 1 ELSE 0 END AS week2_check,

           -- Week 4: No Aripiprazole or Bupropion
           CASE 
               WHEN (LOWER(IFNULL(week4_med1, '')) NOT LIKE '%aripiprazole%' AND LOWER(IFNULL(week4_med1, '')) NOT LIKE '%bupropion%' AND TRIM(IFNULL(week4_med1, '')) <> '') 
                    AND (LOWER(IFNULL(week4_med2, '')) NOT LIKE '%aripiprazole%' AND LOWER(IFNULL(week4_med2, '')) NOT LIKE '%bupropion%' AND TRIM(IFNULL(week4_med2, '')) <> '')
               THEN 1 ELSE 0 END AS week4_check,

           -- Week 6: No Aripiprazole or Bupropion
           CASE 
               WHEN (LOWER(IFNULL(week6_med1, '')) NOT LIKE '%aripiprazole%' AND LOWER(IFNULL(week6_med1, '')) NOT LIKE '%bupropion%' AND TRIM(IFNULL(week6_med1, '')) <> '') 
                    AND (LOWER(IFNULL(week6_med2, '')) NOT LIKE '%aripiprazole%' AND LOWER(IFNULL(week6_med2, '')) NOT LIKE '%bupropion%' AND TRIM(IFNULL(week6_med2, '')) <> '')
               THEN 1 ELSE 0 END AS week6_check,

           -- Week 8: No Aripiprazole or Bupropion
           CASE 
               WHEN (LOWER(IFNULL(week8_med1, '')) NOT LIKE '%aripiprazole%' AND LOWER(IFNULL(week8_med1, '')) NOT LIKE '%bupropion%' AND TRIM(IFNULL(week8_med1, '')) <> '') 
                    AND (LOWER(IFNULL(week8_med2, '')) NOT LIKE '%aripiprazole%' AND LOWER(IFNULL(week8_med2, '')) NOT LIKE '%bupropion%' AND TRIM(IFNULL(week8_med2, '')) <> '')
               THEN 1 ELSE 0 END AS week8_check,

           -- Week 10: No Aripiprazole or Bupropion
           CASE 
               WHEN (LOWER(IFNULL(week10_med1, '')) NOT LIKE '%aripiprazole%' AND LOWER(IFNULL(week10_med1, '')) NOT LIKE '%bupropion%' AND TRIM(IFNULL(week10_med1, '')) <> '') 
                    AND (LOWER(IFNULL(week10_med2, '')) NOT LIKE '%aripiprazole%' AND LOWER(IFNULL(week10_med2, '')) NOT LIKE '%bupropion%' AND TRIM(IFNULL(week10_med2, '')) <> '')
               THEN 1 ELSE 0 END AS week10_check

    FROM baard.medication_all_af
) t3 ON t2.record_id = t3.record_id
WHERE t3.week2_check = 1
   OR t3.week4_check = 1
   OR t3.week6_check = 1
   OR t3.week8_check = 1
   OR t3.week10_check = 1;




SELECT t2.record_id,
       t2.week2_med1,
       t2.week2_med2,
       t2.week4_med1,
       t2.week4_med2,
       t2.week6_med1,
       t2.week6_med2,
       t2.week8_med1,
       t2.week8_med2,
       t2.week10_med1,
       t2.week10_med2
FROM baard.medication_all_af t2
JOIN ( 
    SELECT record_id,
           -- Week 2: Bupropion and another drug
           CASE 
               WHEN (LOWER(week2_med1) LIKE '%bupropion%' AND LOWER(week2_med2) NOT LIKE '%bupropion%' AND week2_med2 IS NOT NULL) 
                    OR (LOWER(week2_med2) LIKE '%bupropion%' AND LOWER(week2_med1) NOT LIKE '%bupropion%' AND week2_med1 IS NOT NULL)
               THEN 1 ELSE 0 END AS week2_check,

           -- Week 4: Bupropion and another drug
           CASE 
               WHEN (LOWER(week4_med1) LIKE '%bupropion%' AND LOWER(week4_med2) NOT LIKE '%bupropion%' AND week4_med2 IS NOT NULL) 
                    OR (LOWER(week4_med2) LIKE '%bupropion%' AND LOWER(week4_med1) NOT LIKE '%bupropion%' AND week4_med1 IS NOT NULL)
               THEN 1 ELSE 0 END AS week4_check,

           -- Week 6: Bupropion and another drug
           CASE 
               WHEN (LOWER(week6_med1) LIKE '%bupropion%' AND LOWER(week6_med2) NOT LIKE '%bupropion%' AND week6_med2 IS NOT NULL) 
                    OR (LOWER(week6_med2) LIKE '%bupropion%' AND LOWER(week6_med1) NOT LIKE '%bupropion%' AND week6_med1 IS NOT NULL)
               THEN 1 ELSE 0 END AS week6_check,

           -- Week 8: Bupropion and another drug
           CASE 
               WHEN (LOWER(week8_med1) LIKE '%bupropion%' AND LOWER(week8_med2) NOT LIKE '%bupropion%' AND week8_med2 IS NOT NULL) 
                    OR (LOWER(week8_med2) LIKE '%bupropion%' AND LOWER(week8_med1) NOT LIKE '%bupropion%' AND week8_med1 IS NOT NULL)
               THEN 1 ELSE 0 END AS week8_check,

           -- Week 10: Bupropion and another drug
           CASE 
               WHEN (LOWER(week10_med1) LIKE '%bupropion%' AND LOWER(week10_med2) NOT LIKE '%bupropion%' AND week10_med2 IS NOT NULL) 
                    OR (LOWER(week10_med2) LIKE '%bupropion%' AND LOWER(week10_med1) NOT LIKE '%bupropion%' AND week10_med1 IS NOT NULL)
               THEN 1 ELSE 0 END AS week10_check

    FROM baard.medication_all_af
) t3 ON t2.record_id = t3.record_id
WHERE t3.week2_check = 1
   OR t3.week4_check = 1
   OR t3.week6_check = 1
   OR t3.week8_check = 1
   OR t3.week10_check = 1;




SELECT t2.record_id,
       t2.week2_med1,
       t2.week2_med2,
       t2.week4_med1,
       t2.week4_med2,
       t2.week6_med1,
       t2.week6_med2,
       t2.week8_med1,
       t2.week8_med2,
       t2.week10_med1,
       t2.week10_med2
FROM baard.medication_all_af t2
JOIN ( 
    SELECT record_id,
           -- Week 2
           CASE 
               WHEN (LOWER(week2_med1) LIKE '%bupropion%' AND (week2_med2 IS NULL OR LOWER(week2_med2) NOT LIKE '%bupropion%')) 
                    OR (LOWER(week2_med2) LIKE '%bupropion%' AND (week2_med1 IS NULL OR LOWER(week2_med1) NOT LIKE '%bupropion%')) 
               THEN 1 ELSE 0 END AS week2_check,

           -- Week 4
           CASE 
               WHEN (LOWER(week4_med1) LIKE '%bupropion%' AND (week4_med2 IS NULL OR LOWER(week4_med2) NOT LIKE '%bupropion%')) 
                    OR (LOWER(week4_med2) LIKE '%bupropion%' AND (week4_med1 IS NULL OR LOWER(week4_med1) NOT LIKE '%bupropion%')) 
               THEN 1 ELSE 0 END AS week4_check,

           -- Week 6
           CASE 
               WHEN (LOWER(week6_med1) LIKE '%bupropion%' AND (week6_med2 IS NULL OR LOWER(week6_med2) NOT LIKE '%bupropion%')) 
                    OR (LOWER(week6_med2) LIKE '%bupropion%' AND (week6_med1 IS NULL OR LOWER(week6_med1) NOT LIKE '%bupropion%')) 
               THEN 1 ELSE 0 END AS week6_check,

           -- Week 8
           CASE 
               WHEN (LOWER(week8_med1) LIKE '%bupropion%' AND (week8_med2 IS NULL OR LOWER(week8_med2) NOT LIKE '%bupropion%')) 
                    OR (LOWER(week8_med2) LIKE '%bupropion%' AND (week8_med1 IS NULL OR LOWER(week8_med1) NOT LIKE '%bupropion%')) 
               THEN 1 ELSE 0 END AS week8_check,

           -- Week 10
           CASE 
               WHEN (LOWER(week10_med1) LIKE '%bupropion%' AND (week10_med2 IS NULL OR LOWER(week10_med2) NOT LIKE '%bupropion%')) 
                    OR (LOWER(week10_med2) LIKE '%bupropion%' AND (week10_med1 IS NULL OR LOWER(week10_med1) NOT LIKE '%bupropion%')) 
               THEN 1 ELSE 0 END AS week10_check

    FROM baard.medication_all_af
) t3 ON t2.record_id = t3.record_id
WHERE t3.week2_check = 1
   OR t3.week4_check = 1
   OR t3.week6_check = 1
   OR t3.week8_check = 1
   OR t3.week10_check = 1;




SELECT t2.record_id,
	t2.step1_randomization AS step1_group,
    t3.week2_med1,
    t3.week2_med2,
    t3.week4_med1,
    t3.week4_med2,
    t3.week6_med1,
    t3.week6_med2,
    t3.week8_med1,
    t3.week8_med2,
    t3.week10_med1,
    t3.week10_med2
FROM baard.master_af t1,
	baard.core_variables_af t2,
    baard.medication_all_af t3
WHERE t1.record_id = t2.record_id AND
	t2.record_id = t3.record_id AND
	t2.step1_randomization = "Augmentation with Bupropion";

    -- t2.step1_randomization = "Switch to Bupropion"
	-- t2.step1_randomization = "Augmentation with Bupropion"
    -- t2.step1_randomization = "Augmentation with Aripiprazole"


-- 206 switch
-- 210 aug with Ari
-- 203 aug with Bup

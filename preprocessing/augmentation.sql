-- bupropion or aripiprazole augmentation
-- 292
SELECT * FROM baard.medication_all_af
WHERE record_id NOT IN (
SELECT record_id FROM baard.bupropion_switch_af);


SELECT * FROM baard.medication_all_af
WHERE record_id NOT IN (
SELECT t2.record_id as record_id
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
   AND t3.week10_check = 1) )
   UNION
   (SELECT * from baard.medication_all_af WHERE record_id IN ("CU10018", "CU10046", "CU10085", "CU10095", "CU10104", "CU10125", 
   "CU10140", "LA10036", "LA10052", "UP10275", "UP10003", "UP10038", "UP10072", 
   "UP10091", "UP10186", "UP10202", "UP10219", "UP10257", "UT10001", "UT10013",
   "UT10026", "UT10051", "UT10081", "UT10142", "UT10147", "LA20023",
   "LA20026", "LA20044", "UT30035", "UT30028")
   );

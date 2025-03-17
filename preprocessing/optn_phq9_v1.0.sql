USE baard;

SELECT 
    record_id,
    GROUP_CONCAT(CASE WHEN redcap_event_name = "baseline_arm_8" THEN phq9_date END ORDER BY phq9_date SEPARATOR ', ') AS baseline_date,
    GROUP_CONCAT(CASE WHEN redcap_event_name = "baseline_arm_8" THEN phq9_total END ORDER BY phq9_total SEPARATOR ', ') AS baseline_score,
    GROUP_CONCAT(CASE WHEN redcap_event_name = "week_2_arm_8" THEN phq9_date END ORDER BY phq9_date SEPARATOR ', ') AS week2_date,
    GROUP_CONCAT(CASE WHEN redcap_event_name = "week_2_arm_8" THEN phq9_total END ORDER BY phq9_total SEPARATOR ', ') AS week2_score,
    GROUP_CONCAT(CASE WHEN redcap_event_name = "week_4_arm_8" THEN phq9_date END ORDER BY phq9_date SEPARATOR ', ') AS week4_date,
    GROUP_CONCAT(CASE WHEN redcap_event_name = "week_4_arm_8" THEN phq9_total END ORDER BY phq9_total SEPARATOR ', ') AS week4_score,
    GROUP_CONCAT(CASE WHEN redcap_event_name = "week_6_arm_8" THEN phq9_date END ORDER BY phq9_date SEPARATOR ', ') AS week6_date,
    GROUP_CONCAT(CASE WHEN redcap_event_name = "week_6_arm_8" THEN phq9_total END ORDER BY phq9_total SEPARATOR ', ') AS week6_score,
    GROUP_CONCAT(CASE WHEN redcap_event_name = "week_8_arm_8" THEN phq9_date END ORDER BY phq9_date SEPARATOR ', ') AS week8_date,
    GROUP_CONCAT(CASE WHEN redcap_event_name = "week_8_arm_8" THEN phq9_total END ORDER BY phq9_total SEPARATOR ', ') AS week8_score,
    GROUP_CONCAT(CASE WHEN redcap_event_name = "week_10end_arm_8" THEN phq9_date END ORDER BY phq9_date SEPARATOR ', ') AS week10_date,
    GROUP_CONCAT(CASE WHEN redcap_event_name = "week_10end_arm_8" THEN phq9_total END ORDER BY phq9_total SEPARATOR ', ') AS week10_score
FROM 
    optn_phq9_camh_20250228
WHERE 
    redcap_event_name IN ("baseline_arm_8", "week_2_arm_8", "week_4_arm_8", "week_6_arm_8", "week_8_arm_8", "week_10end_arm_8")
GROUP BY 
    record_id
HAVING 
    SUM(CASE WHEN redcap_event_name = "baseline_arm_8" THEN 1 ELSE 0 END) > 0 
    AND (
        SUM(CASE WHEN redcap_event_name = "week_2_arm_8" THEN 1 ELSE 0 END) > 0 OR
        SUM(CASE WHEN redcap_event_name = "week_4_arm_8" THEN 1 ELSE 0 END) > 0 OR
        SUM(CASE WHEN redcap_event_name = "week_6_arm_8" THEN 1 ELSE 0 END) > 0 OR
        SUM(CASE WHEN redcap_event_name = "week_8_arm_8" THEN 1 ELSE 0 END) > 0 OR
        SUM(CASE WHEN redcap_event_name = "week_10end_arm_8" THEN 1 ELSE 0 END) > 0
    );


SELECT 
    record_id,
    GROUP_CONCAT(CASE WHEN redcap_event_name = "baseline_arm_8" THEN phq9_date END ORDER BY phq9_date SEPARATOR ', ') AS baseline_date,
    GROUP_CONCAT(CASE WHEN redcap_event_name = "baseline_arm_8" THEN phq9_total END ORDER BY phq9_total SEPARATOR ', ') AS baseline_score,
    GROUP_CONCAT(CASE WHEN redcap_event_name = "week_2_arm_8" THEN phq9_date END ORDER BY phq9_date SEPARATOR ', ') AS week2_date,
    GROUP_CONCAT(CASE WHEN redcap_event_name = "week_2_arm_8" THEN phq9_total END ORDER BY phq9_total SEPARATOR ', ') AS week2_score,
    GROUP_CONCAT(CASE WHEN redcap_event_name = "week_4_arm_8" THEN phq9_date END ORDER BY phq9_date SEPARATOR ', ') AS week4_date,
    GROUP_CONCAT(CASE WHEN redcap_event_name = "week_4_arm_8" THEN phq9_total END ORDER BY phq9_total SEPARATOR ', ') AS week4_score,
    GROUP_CONCAT(CASE WHEN redcap_event_name = "week_6_arm_8" THEN phq9_date END ORDER BY phq9_date SEPARATOR ', ') AS week6_date,
    GROUP_CONCAT(CASE WHEN redcap_event_name = "week_6_arm_8" THEN phq9_total END ORDER BY phq9_total SEPARATOR ', ') AS week6_score,
    GROUP_CONCAT(CASE WHEN redcap_event_name = "week_8_arm_8" THEN phq9_date END ORDER BY phq9_date SEPARATOR ', ') AS week8_date,
    GROUP_CONCAT(CASE WHEN redcap_event_name = "week_8_arm_8" THEN phq9_total END ORDER BY phq9_total SEPARATOR ', ') AS week8_score,
    GROUP_CONCAT(CASE WHEN redcap_event_name = "week_10end_arm_8" THEN phq9_date END ORDER BY phq9_date SEPARATOR ', ') AS week10_date,
    GROUP_CONCAT(CASE WHEN redcap_event_name = "week_10end_arm_8" THEN phq9_total END ORDER BY phq9_total SEPARATOR ', ') AS week10_score
FROM 
    optn_phq9_camh_20250228
WHERE redcap_event_name IN ("baseline_arm_8", "week_2_arm_8", "week_4_arm_8", "week_6_arm_8", "week_8_arm_8", "week_10end_arm_8")
GROUP BY 
    record_id;

SELECT redcap_event_name, COUNT(*)
FROM optn_phq9_camh_20250228
GROUP BY redcap_event_name;

SELECT * 
FROM optn_phq9_camh_20250228
WHERE redcap_event_name = "time_point_1_arm_9";
-- 192

SELECT * 
FROM optn_phq9_camh_20250228
WHERE redcap_event_name = "extra_visit_2_acut_arm_8";
-- 192

SELECT DISTINCT 
    a.record_id,
    a.redcap_event_name AS baseline_event,
    a.phq9_date AS baseline_date,
    a.phq9_total AS baseline_score,
    b.redcap_event_name AS week10_event,
    b.phq9_date AS week10_date,
    b.phq9_total AS week10_score
FROM 
    optn_phq9_camh_20250228 AS a
JOIN 
    optn_phq9_camh_20250228 AS b
    ON a.record_id = b.record_id
WHERE 
    a.redcap_event_name = 'baseline_arm_8'
    AND b.redcap_event_name = 'week_10end_arm_8';
-- 2 duplicates



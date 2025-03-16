-- Set the working database
USE baard;

-- Query to count the occurrences of each event name in the 'optn_madrs_arms6_8_nicole_20250228' table
SELECT 
    redcap_event_name, 
    COUNT(*) AS event_count
FROM 
    baard.optn_madrs_arms6_8_nicole_20250228
GROUP BY 
    redcap_event_name;

-- Query to retrieve records that have both 'baseline_arm_8' and 'week_10end_arm_8' for the same record_id
SELECT *
FROM 
    optn_madrs_arms6_8_nicole_20250228
WHERE 
    record_id IN (
        SELECT record_id
        FROM optn_madrs_arms6_8_nicole_20250228
        WHERE redcap_event_name IN ('baseline_arm_8', 'week_10end_arm_8')
        GROUP BY record_id
        HAVING COUNT(DISTINCT redcap_event_name) = 2
    )
    AND redcap_event_name IN ('baseline_arm_8', 'week_10end_arm_8');

-- Query to retrieve record_ids that have both 'baseline_arm_8' and 'week_10end_arm_8'
SELECT 
    record_id
FROM 
    optn_madrs_arms6_8_nicole_20250228
WHERE 
    record_id IN (
        SELECT record_id
        FROM optn_madrs_arms6_8_nicole_20250228
        WHERE redcap_event_name IN ('baseline_arm_8', 'week_10end_arm_8')
        GROUP BY record_id
        HAVING COUNT(DISTINCT redcap_event_name) = 2
    )
GROUP BY 
    record_id;

-- Query to select all rows for record_id 'LA20004' from the 'yi_demo_1_24_25' table
SELECT * 
FROM 
    madras.yi_demo_1_24_25
WHERE 
    id = 'LA20004';

-- Query to select all rows for record_id 'LA20004' from the 'madrs_fall_1_24_25_yi' table
SELECT * 
FROM 
    madras.madrs_fall_1_24_25_yi
WHERE 
    record_id = 'LA20004';

-- Query to select record_ids that exist in both the 'optn_madrs_arms6_8_nicole_20250228' table
-- and the 'yi_demo_1_24_25' table
SELECT 
    record_id
FROM 
    optn_madrs_arms6_8_nicole_20250228
WHERE 
    record_id IN (
        SELECT record_id
        FROM optn_madrs_arms6_8_nicole_20250228
        WHERE redcap_event_name IN ('baseline_arm_8', 'week_10end_arm_8')
        GROUP BY record_id
        HAVING COUNT(DISTINCT redcap_event_name) = 2
    )
    AND record_id IN (
        SELECT id
        FROM madras.yi_demo_1_24_25
    );

-- Query to select record_ids that exist in both the 'optn_madrs_arms6_8_nicole_20250228' table
-- and the 'madrs_1_24_25_yi' table
SELECT 
    record_id
FROM 
    optn_madrs_arms6_8_nicole_20250228
WHERE 
    record_id IN (
        SELECT record_id
        FROM optn_madrs_arms6_8_nicole_20250228
        WHERE redcap_event_name IN ('baseline_arm_8', 'week_10end_arm_8')
        GROUP BY record_id
        HAVING COUNT(DISTINCT redcap_event_name) = 2
    )
    AND record_id IN (
        SELECT record_id
        FROM madras.madrs_1_24_25_yi
    );

-- Query to select record_ids that exist in both the 'optn_madrs_arms6_8_nicole_20250228' table
-- and the 'baseline_s1_nick_ubc' table
SELECT 
    record_id
FROM 
    optn_madrs_arms6_8_nicole_20250228
WHERE 
    record_id IN (
        SELECT record_id
        FROM optn_madrs_arms6_8_nicole_20250228
        WHERE redcap_event_name IN ('baseline_arm_8', 'week_10end_arm_8')
        GROUP BY record_id
        HAVING COUNT(DISTINCT redcap_event_name) = 2
    )
    AND record_id IN (
        SELECT record_id
        FROM madras.baseline_s1_nick_ubc
    )
GROUP BY 
    record_id;

-- Drop the existing table if it exists and create a new one to store 'week_10end_arm_8' data
DROP TABLE IF EXISTS madrs_week10_arm_8_nicole_20250228;

CREATE TABLE madrs_week10_arm_8_nicole_20250228 AS
SELECT *
FROM 
    optn_madrs_arms6_8_nicole_20250228
WHERE 
    redcap_event_name = 'week_10end_arm_8';

-- Query to join baseline and week 10 events data and select distinct records
SELECT DISTINCT 
    a.record_id,
    a.redcap_event_name AS baseline_event,
    a.madrs_date AS baseline_date,
    a.madrs_tot_scr AS baseline_score,
    b.redcap_event_name AS week10_event,
    b.madrs_date AS week10_date,
    b.madrs_tot_scr AS week10_score
FROM 
    madrs_baseline_arm_8_nicole_20250228 AS a
JOIN 
    madrs_week10_arm_8_nicole_20250228 AS b
    ON a.record_id = b.record_id;


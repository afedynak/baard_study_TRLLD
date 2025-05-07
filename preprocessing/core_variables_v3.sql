(WITH combined_data AS (
    SELECT 
		upper(t1.record_id) AS record_id,
		upper(COALESCE(t1.redcap_data_access_group, t2.redcap_data_access_group)) AS site,
        COALESCE(t1.demo_sex, t2.gender) AS gender,
        COALESCE(t1.demo_race, t2.race) AS race,
        COALESCE(t1.demo_ethnicity, t2.ethnicity) AS ethnicity,
        t1.demo_edu AS education_level
    FROM optn_demo_arm_6_20250313 t1
    LEFT JOIN optn_demo_arm_7_8_20250315 t2 ON
		t1.record_id = t2.record_id
    UNION
    SELECT 
		upper(t1.record_id) AS record_id,
        upper(COALESCE(t1.redcap_data_access_group, t2.redcap_data_access_group)) AS site,
        COALESCE(t1.demo_sex, t2.gender) AS gender,
        COALESCE(t1.demo_race, t2.race) AS race,
        COALESCE(t1.demo_ethnicity, t2.ethnicity) AS ethnicity,
		t1.demo_edu AS education_level
    FROM optn_demo_arm_6_20250313 t1
    RIGHT JOIN optn_demo_arm_7_8_20250315 t2 ON
		t1.record_id = t2.record_id
)
-- SELECT * FROM combined_data;

SELECT DISTINCT t1.record_id,
	t1.site,
    t1.gender,
    COALESCE(NULLIF(t3.Age_Step1, ''), NULLIF(t3.Age_Consent, ''), t3.Age_Step1, t3.Age_Consent) AS age,
    t1.race AS race,
    t1.ethnicity AS ethnicity,
    t1.education_level AS education_level,
    "NULL" AS marital_status,
    t2.bmi AS bmi,
    t4.step1_rand_group AS step1_randomization
FROM combined_data t1,
	baard.optn_height_weight_arm_8_20250401 t2,
    baard.optn_age_arms_7_8_20250404 t3,
    baard.optn_randomization_groups_dates_20250401 t4
WHERE t1.record_id = t2.record_id AND
	t3.record_id = t1.record_id AND
    t2.record_id = t3.record_id AND
    t4.record_id = t1.record_id AND
    (t2.redcap_event_name = "baseline_arm_8" OR t2.redcap_event_name = "baseline_arm_6")
)
UNION
(SELECT 
    id AS record_id,
    upper(site) AS site,
    gender AS gender,
    race AS race,
    ethnicity AS ethnicity,
    edu_lvl AS education_level,
    age AS age,
    mar_status AS marital_status,
    bmi AS bmi,
    s1_group as step1_randomization
FROM 
    baard.opt_corevariables_20250417);
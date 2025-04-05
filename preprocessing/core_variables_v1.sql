(SELECT DISTINCT t1.record_id,
	upper(SUBSTRING(t1.record_id, 1, 2)) AS site,
	t1.demo_sex AS gender,
    COALESCE(t3.Age_Step1, t3.Age_Consent) AS age,
    t1.demo_race AS race,
    t1.demo_ethnicity AS ethnicity,
    t1.demo_edu AS education_level,
    "NULL" AS marital_status,
    t2.bmi AS bmi
FROM baard.optn_demo_arm_6_20250313 t1,
	baard.optn_height_weight_arm_8_20250401 t2,
    baard.optn_age_arms_7_8_20250404 t3
WHERE t1.record_id = t2.record_id AND
	t3.record_id = t1.record_id AND
    t2.record_id = t3.record_id AND
    t2.redcap_event_name = "baseline_arm_8"
)
UNION
(SELECT 
    id AS record_id,
    upper(site) AS site,
    gender AS gender,
    age AS age,
    race AS race,
    ethnicity AS ethnicity,
    edu_lvl AS education_level,
    mar_status AS marital_status,
    bmi AS bmi
FROM 
    baard.opt_corevariables_20250326);
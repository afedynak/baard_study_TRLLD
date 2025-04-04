USE baard;

SET SQL_SAFE_UPDATES=0;

UPDATE baard.optn_demo_arm_6_20250313  
SET demo_sex = "Male"
WHERE demo_sex = "1";

UPDATE baard.optn_demo_arm_6_20250313  
SET demo_sex = "Female"
WHERE demo_sex = "2";

UPDATE baard.optn_demo_arm_6_20250313 
SET demo_ethnicity = "Hispanic/Latino"
WHERE demo_ethnicity = "1";

UPDATE baard.optn_demo_arm_6_20250313 
SET demo_ethnicity = "Non-Hispanic"
WHERE demo_ethnicity = "2";

UPDATE baard.optn_demo_arm_6_20250313 
SET demo_race = "Black/African American"
WHERE demo_race = "1";

UPDATE baard.optn_demo_arm_6_20250313 
SET demo_race = "White"
WHERE demo_race = "2";

UPDATE baard.optn_demo_arm_6_20250313 
SET demo_race = "Hawaiian/Pacific Islander"
WHERE demo_race = "3";

UPDATE baard.optn_demo_arm_6_20250313 
SET demo_race = "Asian"
WHERE demo_race = "4";

UPDATE baard.optn_demo_arm_6_20250313 
SET demo_race = "American Indian/Alaska Native (includes First Nations)"
WHERE demo_race = "5";

UPDATE baard.optn_demo_arm_6_20250313 
SET demo_race = "Multi-race"
WHERE demo_race = "6";

UPDATE baard.optn_demo_arm_6_20250313 
SET demo_race = "Other"
WHERE demo_race = "7";
    
SELECT DISTINCT t1.record_id,
	upper(SUBSTRING(t1.record_id, 1, 2)) AS site,
	t1.demo_sex AS gender,
    t1.demo_age AS age,
    t1.demo_race AS race,
    t1.demo_ethnicity AS ethnicity,
    t1.demo_edu AS education_level,
    "NULL" AS marital_status,
    t2.bmi AS bmi
FROM baard.optn_demo_arm_6_20250313 t1,
	baard.optn_height_weight_arm_8_20250401 t2
WHERE t1.record_id = t2.record_id AND t2.redcap_event_name = "baseline_arm_8";
    

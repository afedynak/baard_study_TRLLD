USE baard;

SET SQL_SAFE_UPDATES=0;

UPDATE baard.optn_demo_arm_7_8_20250315 
SET gender = "Male"
WHERE gender = "1";

UPDATE baard.optn_demo_arm_7_8_20250315 
SET gender = "Female"
WHERE gender = "2";

UPDATE baard.optn_demo_arm_7_8_20250315 
SET race = "Black/African American"
WHERE race = "1";

UPDATE baard.optn_demo_arm_7_8_20250315 
SET race = "White"
WHERE race = "2";

UPDATE baard.optn_demo_arm_7_8_20250315 
SET race = "Hawaiian/Pacific Islander"
WHERE race = "3";

UPDATE baard.optn_demo_arm_7_8_20250315 
SET race = "Asian"
WHERE race = "4";

UPDATE baard.optn_demo_arm_7_8_20250315 
SET race = "American Indian/Alaska Native (includes First Nations)"
WHERE race = "5";

UPDATE baard.optn_demo_arm_7_8_20250315 
SET race = "Multi-race"
WHERE race = "6";

UPDATE baard.optn_demo_arm_7_8_20250315 
SET race = "Other"
WHERE race = "7";

UPDATE baard.optn_demo_arm_7_8_20250315 
SET ethnicity = "Hispanic/Latino"
WHERE ethnicity = "1";

UPDATE baard.optn_demo_arm_7_8_20250315 
SET ethnicity = "Non-Hispanic"
WHERE ethnicity = "2";

SELECT 
    record_id,
    upper(redcap_data_access_group) as site,
    gender AS gender,
    race AS race,
    ethnicity AS ethnicity
FROM 
    baard.optn_demo_arm_7_8_20250315;

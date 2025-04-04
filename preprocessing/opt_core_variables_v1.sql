USE baard;

SET SQL_SAFE_UPDATES=0;

UPDATE baard.opt_corevariables_20250326
SET s1_group = "Augmentation with Aripiprazole"
WHERE s1_group = "1";

UPDATE baard.opt_corevariables_20250326
SET s1_group = "Augmentation with Bupropion"
WHERE s1_group = "2";

UPDATE baard.opt_corevariables_20250326
SET s1_group = "Switch to Bupropion"
WHERE s1_group = "3";

SELECT 
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
    baard.opt_corevariables_20250326;

USE baard;

SELECT 
    id AS record_id,
    site AS site,
    gender AS gender,
    race AS race,
    ethnicity AS ethnicity,
    edu_lvl AS education_level,
    age AS age,
    mar_status AS marital_status,
    bmi AS bmi
FROM 
    baard.opt_corevariables
WHERE 
    site != 'CU';


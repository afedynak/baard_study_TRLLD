SELECT record_id, site, gender, race, ethnicity, education_level, age, marital_status, ROUND(bmi, 2) AS bmi
FROM baard.core_variables_af
WHERE record_id IN ("LA10048", "LA20021", "UP10098", "UP10101", "UP10209",
 "UP10250", "UT10033", "UT10081", "UT10090", "UT10111", "UT10126",
 "UT30019", "UT30042", "WU10008", "WU10071", "WU10077", "WU10087")
 ORDER BY record_id;
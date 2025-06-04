USE baard;

SELECT 
    COALESCE(cv.record_id, meds.record_id) AS record_id,
    cv.site,
    cv.gender,
    cv.race,
    cv.ethnicity,
    cv.bmi,
    cv.age,
    cv.marital_status,
    cv.education_level,

	meds.week2_decision_date,
    meds.week2_med1,
    meds.week2_med1_freq,
    meds.week2_med2,
    meds.week2_med2_freq,

	meds.week4_decision_date,
	meds.week4_med1,
    meds.week4_med1_freq,
    meds.week4_med2,
    meds.week4_med2_freq,

	meds.week6_decision_date,
	meds.week6_med1,
    meds.week6_med1_freq,
    meds.week6_med2,
    meds.week6_med2_freq,

	meds.week8_decision_date,
	meds.week8_med1,
    meds.week8_med1_freq,
    meds.week8_med2,
    meds.week8_med2_freq,

	meds.week10_decision_date,
	meds.week10_med1,
    meds.week10_med1_freq,
    meds.week10_med2,
    meds.week10_med2_freq

FROM step1_core_variables_3jun2025_af cv
LEFT JOIN medication_3jun2025_af meds ON cv.record_id = meds.record_id

UNION

SELECT 
    COALESCE(cv.record_id, meds.record_id) AS record_id,
    cv.site,
    cv.gender,
    cv.race,
    cv.ethnicity,
    cv.bmi,
    cv.age,
    cv.marital_status,
    cv.education_level,

	meds.week2_decision_date,
	meds.week2_med1,
    meds.week2_med1_freq,
    meds.week2_med2,
    meds.week2_med2_freq,

	meds.week4_decision_date,
	meds.week4_med1,
    meds.week4_med1_freq,
    meds.week4_med2,
    meds.week4_med2_freq,

	meds.week6_decision_date,
	meds.week6_med1,
    meds.week6_med1_freq,
    meds.week6_med2,
    meds.week6_med2_freq,

	meds.week8_decision_date,
	meds.week8_med1,
    meds.week8_med1_freq,
    meds.week8_med2,
    meds.week8_med2_freq,

	meds.week10_decision_date,
	meds.week10_med1,
    meds.week10_med1_freq,
    meds.week10_med2,
    meds.week10_med2_freq

FROM baard.medication_3jun2025_af meds
LEFT JOIN step1_core_variables_3jun2025_af cv ON cv.record_id = meds.record_id;

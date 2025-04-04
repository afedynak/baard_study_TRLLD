SELECT *
FROM medication_af
WHERE record_id = "UP10027";

SELECT record_id
FROM medication_af
WHERE (
    -- Check if missed medication exactly once for week2, week4, week6, week8, or week10
    (CASE WHEN (week2_med1_freq = 'Not taking it at all (missed all doses)' OR week2_med2_freq = 'Not taking it at all (missed all doses)') THEN 1 ELSE 0 END +
     CASE WHEN (week4_med1_freq = 'Not taking it at all (missed all doses)' OR week4_med2_freq = 'Not taking it at all (missed all doses)') THEN 1 ELSE 0 END +
     CASE WHEN (week6_med1_freq = 'Not taking it at all (missed all doses)' OR week6_med2_freq = 'Not taking it at all (missed all doses)') THEN 1 ELSE 0 END +
     CASE WHEN (week8_med1_freq = 'Not taking it at all (missed all doses)' OR week8_med2_freq = 'Not taking it at all (missed all doses)') THEN 1 ELSE 0 END +
     CASE WHEN (week10_med1_freq = 'Not taking it at all (missed all doses)' OR week10_med2_freq = 'Not taking it at all (missed all doses)') THEN 1 ELSE 0 END
    ) = 1  -- Exactly 1 missed dose across any of the 5 weeks (with the phrase "Not taking it at all (missed all doses)")
AND (
    -- Check if only 1 timepoint has data for the participant
    (CASE WHEN week2_med1_freq IS NOT NULL OR week2_med2_freq IS NOT NULL THEN 1 ELSE 0 END) +
    (CASE WHEN week4_med1_freq IS NOT NULL OR week4_med2_freq IS NOT NULL THEN 1 ELSE 0 END) +
    (CASE WHEN week6_med1_freq IS NOT NULL OR week6_med2_freq IS NOT NULL THEN 1 ELSE 0 END) +
    (CASE WHEN week8_med1_freq IS NOT NULL OR week8_med2_freq IS NOT NULL THEN 1 ELSE 0 END) +
    (CASE WHEN week10_med1_freq IS NOT NULL OR week10_med2_freq IS NOT NULL THEN 1 ELSE 0 END)
) = 1 -- Only 1 week has data
);
# LA10023, UP10150, UT10001, UT10097

SELECT record_id
FROM medication_af
WHERE (
    -- Check if missed medication exactly once for week2, week4, week6, week8, or week10
    (CASE WHEN (week2_med1_freq = 'Not taking it at all (missed all doses)' OR week2_med2_freq = 'Not taking it at all (missed all doses)') THEN 1 ELSE 0 END +
     CASE WHEN (week4_med1_freq = 'Not taking it at all (missed all doses)' OR week4_med2_freq = 'Not taking it at all (missed all doses)') THEN 1 ELSE 0 END +
     CASE WHEN (week6_med1_freq = 'Not taking it at all (missed all doses)' OR week6_med2_freq = 'Not taking it at all (missed all doses)') THEN 1 ELSE 0 END +
     CASE WHEN (week8_med1_freq = 'Not taking it at all (missed all doses)' OR week8_med2_freq = 'Not taking it at all (missed all doses)') THEN 1 ELSE 0 END +
     CASE WHEN (week10_med1_freq = 'Not taking it at all (missed all doses)' OR week10_med2_freq = 'Not taking it at all (missed all doses)') THEN 1 ELSE 0 END
    ) = 1  -- Exactly 2 missed dose across any of the 5 weeks (with the phrase "Not taking it at all (missed all doses)")
AND (
    -- Check if only 2 timepoint has data for the participant
    (CASE WHEN week2_med1_freq IS NOT NULL OR week2_med2_freq IS NOT NULL THEN 1 ELSE 0 END) +
    (CASE WHEN week4_med1_freq IS NOT NULL OR week4_med2_freq IS NOT NULL THEN 1 ELSE 0 END) +
    (CASE WHEN week6_med1_freq IS NOT NULL OR week6_med2_freq IS NOT NULL THEN 1 ELSE 0 END) +
    (CASE WHEN week8_med1_freq IS NOT NULL OR week8_med2_freq IS NOT NULL THEN 1 ELSE 0 END) +
    (CASE WHEN week10_med1_freq IS NOT NULL OR week10_med2_freq IS NOT NULL THEN 1 ELSE 0 END)
) = 2 -- Only 2 weeks have data
);
# 2 out of 2: CU10106, UT10044
# 1 out of 2: CU10095, UT10090, LA20011

SELECT record_id
FROM medication_af
WHERE (
    -- Check if missed medication exactly once for week2, week4, week6, week8, or week10
    (CASE WHEN (week2_med1_freq = 'Not taking it at all (missed all doses)' OR week2_med2_freq = 'Not taking it at all (missed all doses)') THEN 1 ELSE 0 END +
     CASE WHEN (week4_med1_freq = 'Not taking it at all (missed all doses)' OR week4_med2_freq = 'Not taking it at all (missed all doses)') THEN 1 ELSE 0 END +
     CASE WHEN (week6_med1_freq = 'Not taking it at all (missed all doses)' OR week6_med2_freq = 'Not taking it at all (missed all doses)') THEN 1 ELSE 0 END +
     CASE WHEN (week8_med1_freq = 'Not taking it at all (missed all doses)' OR week8_med2_freq = 'Not taking it at all (missed all doses)') THEN 1 ELSE 0 END +
     CASE WHEN (week10_med1_freq = 'Not taking it at all (missed all doses)' OR week10_med2_freq = 'Not taking it at all (missed all doses)') THEN 1 ELSE 0 END
    ) = 3  -- Exactly 2 missed dose across any of the 5 weeks (with the phrase "Not taking it at all (missed all doses)")
AND (
    -- Check if only 2 timepoint has data for the participant
    (CASE WHEN week2_med1_freq IS NOT NULL OR week2_med2_freq IS NOT NULL THEN 1 ELSE 0 END) +
    (CASE WHEN week4_med1_freq IS NOT NULL OR week4_med2_freq IS NOT NULL THEN 1 ELSE 0 END) +
    (CASE WHEN week6_med1_freq IS NOT NULL OR week6_med2_freq IS NOT NULL THEN 1 ELSE 0 END) +
    (CASE WHEN week8_med1_freq IS NOT NULL OR week8_med2_freq IS NOT NULL THEN 1 ELSE 0 END) +
    (CASE WHEN week10_med1_freq IS NOT NULL OR week10_med2_freq IS NOT NULL THEN 1 ELSE 0 END)
) = 3 -- Only 3 weeks have data
);
# 3 out of 3: None
# 2 out of 3: CU10111, LA10077, UT10043


SELECT record_id
FROM medication_af
WHERE (
    -- Check if missed medication exactly once for week2, week4, week6, week8, or week10
    (CASE WHEN (week2_med1_freq = 'Not taking it at all (missed all doses)' OR week2_med2_freq = 'Not taking it at all (missed all doses)') THEN 1 ELSE 0 END +
     CASE WHEN (week4_med1_freq = 'Not taking it at all (missed all doses)' OR week4_med2_freq = 'Not taking it at all (missed all doses)') THEN 1 ELSE 0 END +
     CASE WHEN (week6_med1_freq = 'Not taking it at all (missed all doses)' OR week6_med2_freq = 'Not taking it at all (missed all doses)') THEN 1 ELSE 0 END +
     CASE WHEN (week8_med1_freq = 'Not taking it at all (missed all doses)' OR week8_med2_freq = 'Not taking it at all (missed all doses)') THEN 1 ELSE 0 END +
     CASE WHEN (week10_med1_freq = 'Not taking it at all (missed all doses)' OR week10_med2_freq = 'Not taking it at all (missed all doses)') THEN 1 ELSE 0 END
    ) = 3  -- Exactly 3 missed dose across any of the 5 weeks (with the phrase "Not taking it at all (missed all doses)")
AND (
    -- Check if only 2 timepoint has data for the participant
    (CASE WHEN week2_med1_freq IS NOT NULL OR week2_med2_freq IS NOT NULL THEN 1 ELSE 0 END) +
    (CASE WHEN week4_med1_freq IS NOT NULL OR week4_med2_freq IS NOT NULL THEN 1 ELSE 0 END) +
    (CASE WHEN week6_med1_freq IS NOT NULL OR week6_med2_freq IS NOT NULL THEN 1 ELSE 0 END) +
    (CASE WHEN week8_med1_freq IS NOT NULL OR week8_med2_freq IS NOT NULL THEN 1 ELSE 0 END) +
    (CASE WHEN week10_med1_freq IS NOT NULL OR week10_med2_freq IS NOT NULL THEN 1 ELSE 0 END)
) = 4 -- Only 4 weeks have data
);
# 4 out of 4 = 0
# 3 out of 4; LA10082, UT10136

SELECT record_id
FROM medication_af
WHERE (
    -- Check if missed medication exactly once for week2, week4, week6, week8, or week10
    (CASE WHEN (week2_med1_freq = 'Not taking it at all (missed all doses)' OR week2_med2_freq = 'Not taking it at all (missed all doses)') THEN 1 ELSE 0 END +
     CASE WHEN (week4_med1_freq = 'Not taking it at all (missed all doses)' OR week4_med2_freq = 'Not taking it at all (missed all doses)') THEN 1 ELSE 0 END +
     CASE WHEN (week6_med1_freq = 'Not taking it at all (missed all doses)' OR week6_med2_freq = 'Not taking it at all (missed all doses)') THEN 1 ELSE 0 END +
     CASE WHEN (week8_med1_freq = 'Not taking it at all (missed all doses)' OR week8_med2_freq = 'Not taking it at all (missed all doses)') THEN 1 ELSE 0 END +
     CASE WHEN (week10_med1_freq = 'Not taking it at all (missed all doses)' OR week10_med2_freq = 'Not taking it at all (missed all doses)') THEN 1 ELSE 0 END
    ) = 4  -- Exactly 5 missed dose across any of the 5 weeks (with the phrase "Not taking it at all (missed all doses)")
AND (
    -- Check if only 2 timepoint has data for the participant
    (CASE WHEN week2_med1_freq IS NOT NULL OR week2_med2_freq IS NOT NULL THEN 1 ELSE 0 END) +
    (CASE WHEN week4_med1_freq IS NOT NULL OR week4_med2_freq IS NOT NULL THEN 1 ELSE 0 END) +
    (CASE WHEN week6_med1_freq IS NOT NULL OR week6_med2_freq IS NOT NULL THEN 1 ELSE 0 END) +
    (CASE WHEN week8_med1_freq IS NOT NULL OR week8_med2_freq IS NOT NULL THEN 1 ELSE 0 END) +
    (CASE WHEN week10_med1_freq IS NOT NULL OR week10_med2_freq IS NOT NULL THEN 1 ELSE 0 END)
) = 5 -- Only 5 weeks have data
);
# 5 out of 5: None
# 4 out of 5: UP10027, UT10020

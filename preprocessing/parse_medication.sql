SELECT adherence_value, COUNT(*) AS value_count
FROM (
    SELECT adherence_3_med1 AS adherence_value
    FROM baard.opt_adherence_20250124
    WHERE adherence_3_med1 LIKE lower("bup%") OR adherence_3_med1 LIKE lower("wel%")
    UNION
    SELECT adherence_3_med2 AS adherence_value
    FROM baard.opt_adherence_20250124
	WHERE adherence_3_med2 LIKE lower("bup%") OR adherence_3_med2 LIKE lower("wel%")

) AS combined_adherence
GROUP BY adherence_value
ORDER BY adherence_value DESC;

SELECT adherence_value, COUNT(*) AS value_count
FROM (
    SELECT adherence_3_med1 AS adherence_value
    FROM baard.opt_adherence_20250124
    WHERE adherence_3_med1 LIKE lower("ari%") OR adherence_3_med1 LIKE lower("abi%")
    UNION
    SELECT adherence_3_med2 AS adherence_value
    FROM baard.opt_adherence_20250124
	WHERE adherence_3_med2 LIKE lower("ari%") OR adherence_3_med2 LIKE lower("abi%")

) AS combined_adherence
GROUP BY adherence_value
ORDER BY adherence_value DESC;



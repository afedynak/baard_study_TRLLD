USE baard;

SELECT 
    id AS record_id,  -- Selecting the 'id' column and aliasing it as 'record_id'
    end_reason AS end_reason_reason -- Selecting the 'end_reason' column and aliasing it as 'end_reason_reason'
FROM 
    baard.opt_corevariables -- From the table 'opt_corevariables' located in the 'baard' database
WHERE 
    SITE != 'CU';  -- Filtering the results where the 'SITE' column is not equal to 'CU'

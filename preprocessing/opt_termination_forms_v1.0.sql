USE baard;

SELECT 
    id AS record_id, 
    end_reason AS end_reason_reason
FROM 
    baard.opt_corevariables
WHERE 
    SITE != 'CU'; 

USE baard;

SELECT 
    id AS record_id,
    
    -- For baseline event (time = "OPTBL")
    GROUP_CONCAT(DISTINCT CASE WHEN time = "OPTBL" THEN vdate END) AS baseline_vdate,
    GROUP_CONCAT(DISTINCT CASE WHEN time = "OPTBL" THEN fcc END) AS baseline_fcc,
    GROUP_CONCAT(DISTINCT CASE WHEN time = "OPTBL" THEN dccs END) AS baseline_dccs,
    GROUP_CONCAT(DISTINCT CASE WHEN time = "OPTBL" THEN flanker END) AS baseline_flanker,
    GROUP_CONCAT(DISTINCT CASE WHEN time = "OPTBL" THEN listSort END) AS baseline_listSort,
    GROUP_CONCAT(DISTINCT CASE WHEN time = "OPTBL" THEN pattComp END) AS baseline_pattComp,
    GROUP_CONCAT(DISTINCT CASE WHEN time = "OPTBL" THEN psm END) AS baseline_psm,
    
    -- For Week 10 event (time = "OPTS1End")
    GROUP_CONCAT(DISTINCT CASE WHEN time = "OPTS1End" THEN vdate END) AS week10_vdate,
    GROUP_CONCAT(DISTINCT CASE WHEN time = "OPTS1End" THEN fcc END) AS week10_fcc,
    GROUP_CONCAT(DISTINCT CASE WHEN time = "OPTS1End" THEN dccs END) AS week10_dccs,
    GROUP_CONCAT(DISTINCT CASE WHEN time = "OPTS1End" THEN flanker END) AS week10_flanker,
    GROUP_CONCAT(DISTINCT CASE WHEN time = "OPTS1End" THEN listSort END) AS week10_listSort,
    GROUP_CONCAT(DISTINCT CASE WHEN time = "OPTS1End" THEN pattComp END) AS week10_pattComp,
    GROUP_CONCAT(DISTINCT CASE WHEN time = "OPTS1End" THEN psm END) AS week10_psm

FROM 
    baard.opt_nihtb_s1_acute_20250205
WHERE 
    time IN ("OPTBL", "OPTS1End")
GROUP BY 
    id;


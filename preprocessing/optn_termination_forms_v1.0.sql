USE baard;

SET SQL_SAFE_UPDATES=0;

UPDATE optn_termination_arm_7_8 
SET end_reason = "Participant was not eligible for randomization"
WHERE end_reason = "1";

UPDATE optn_termination_arm_7_8 
SET end_reason = "Participant Withdrew"
WHERE end_reason = "2";

UPDATE optn_termination_arm_7_8 
SET end_reason = "Study Completion"
WHERE end_reason = "3";

UPDATE optn_termination_arm_7_8 
SET end_reason = "Lost to follow-up (i.e. unable to contact after several attempts)"
WHERE end_reason = "4";

UPDATE optn_termination_arm_7_8 
SET end_reason = "Death"
WHERE end_reason = "5";

UPDATE optn_termination_arm_7_8 
SET end_reason = "Investigator discretion"
WHERE end_reason = "6";

UPDATE optn_termination_arm_7_8 
SET end_reason = "Other"
WHERE end_reason = "7";

SELECT 
    record_id AS record_id,
    end_reason AS end_reason
FROM 
    baard.optn_termination_arm_7_8 
WHERE 
    redcap_event_name = "tracking_arm_8";

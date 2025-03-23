USE baard;

SELECT 
    id AS record_id,
    
    -- For baseline event (time = "OPTBL") and task = "4mWalk"
    GROUP_CONCAT(DISTINCT NULLIF(CASE WHEN time = "OPTBL" AND task = "4mWalk" THEN vdate END, '')) AS baseline_4mWalk_vdate,
    GROUP_CONCAT(DISTINCT NULLIF(CASE WHEN time = "OPTBL" AND task = "4mWalk" THEN raw_scr END, '')) AS baseline_4mWalk_raw_scr,
    GROUP_CONCAT(DISTINCT NULLIF(CASE WHEN time = "OPTBL" AND task = "4mWalk" THEN comp_scr END, '')) AS baseline_4mWalk_comp_scr,
    GROUP_CONCAT(DISTINCT NULLIF(CASE WHEN time = "OPTBL" AND task = "4mWalk" THEN unc_scr END, '')) AS baseline_4mWalk_unc_scr,
    GROUP_CONCAT(DISTINCT NULLIF(CASE WHEN time = "OPTBL" AND task = "4mWalk" THEN unc_scr_dom END, '')) AS baseline_4mWalk_unc_scr_dom,
    GROUP_CONCAT(DISTINCT NULLIF(CASE WHEN time = "OPTBL" AND task = "4mWalk" THEN dom_scr END, '')) AS baseline_4mWalk_dom_scr,
    GROUP_CONCAT(DISTINCT NULLIF(CASE WHEN time = "OPTBL" AND task = "4mWalk" THEN ndom_scr END, '')) AS baseline_4mWalk_ndom_scr,
    GROUP_CONCAT(DISTINCT NULLIF(CASE WHEN time = "OPTBL" AND task = "4mWalk" THEN notes END, '')) AS baseline_4mWalk_notes,

    -- For baseline event (time = "OPTBL") and task = "9HolePegboard"
    GROUP_CONCAT(DISTINCT NULLIF(CASE WHEN time = "OPTBL" AND task = "9HolePegboard" THEN vdate END, '')) AS baseline_9HolePegboard_vdate,
    GROUP_CONCAT(DISTINCT NULLIF(CASE WHEN time = "OPTBL" AND task = "9HolePegboard" THEN raw_scr END, '')) AS baseline_9HolePegboard_raw_scr,
    GROUP_CONCAT(DISTINCT NULLIF(CASE WHEN time = "OPTBL" AND task = "9HolePegboard" THEN comp_scr END, '')) AS baseline_9HolePegboard_comp_scr,
    GROUP_CONCAT(DISTINCT NULLIF(CASE WHEN time = "OPTBL" AND task = "9HolePegboard" THEN unc_scr END, '')) AS baseline_9HolePegboard_unc_scr,
    GROUP_CONCAT(DISTINCT NULLIF(CASE WHEN time = "OPTBL" AND task = "9HolePegboard" THEN unc_scr_dom END, '')) AS baseline_9HolePegboard_unc_scr_dom,
    GROUP_CONCAT(DISTINCT NULLIF(CASE WHEN time = "OPTBL" AND task = "9HolePegboard" THEN dom_scr END, '')) AS baseline_9HolePegboard_dom_scr,
    GROUP_CONCAT(DISTINCT NULLIF(CASE WHEN time = "OPTBL" AND task = "9HolePegboard" THEN ndom_scr END, '')) AS baseline_9HolePegboard_ndom_scr,
    GROUP_CONCAT(DISTINCT NULLIF(CASE WHEN time = "OPTBL" AND task = "9HolePegboard" THEN notes END, '')) AS baseline_9HolePegboard_notes,

    -- For baseline event (time = "OPTBL") and task = "StandingBalance"
    GROUP_CONCAT(DISTINCT NULLIF(CASE WHEN time = "OPTBL" AND task = "StandingBalance" THEN vdate END, '')) AS baseline_StandingBalance_vdate,
    GROUP_CONCAT(DISTINCT NULLIF(CASE WHEN time = "OPTBL" AND task = "StandingBalance" THEN raw_scr END, '')) AS baseline_StandingBalance_raw_scr,
    GROUP_CONCAT(DISTINCT NULLIF(CASE WHEN time = "OPTBL" AND task = "StandingBalance" THEN comp_scr END, '')) AS baseline_StandingBalance_comp_scr,
    GROUP_CONCAT(DISTINCT NULLIF(CASE WHEN time = "OPTBL" AND task = "StandingBalance" THEN unc_scr END, '')) AS baseline_StandingBalance_unc_scr,
    GROUP_CONCAT(DISTINCT NULLIF(CASE WHEN time = "OPTBL" AND task = "StandingBalance" THEN unc_scr_dom END, '')) AS baseline_StandingBalance_unc_scr_dom,
    GROUP_CONCAT(DISTINCT NULLIF(CASE WHEN time = "OPTBL" AND task = "StandingBalance" THEN dom_scr END, '')) AS baseline_StandingBalance_dom_scr,
    GROUP_CONCAT(DISTINCT NULLIF(CASE WHEN time = "OPTBL" AND task = "StandingBalance" THEN ndom_scr END, '')) AS baseline_StandingBalance_ndom_scr,
    GROUP_CONCAT(DISTINCT NULLIF(CASE WHEN time = "OPTBL" AND task = "StandingBalance" THEN notes END, '')) AS baseline_StandingBalance_notes,

    -- For baseline event (time = "OPTBL") and task = "gripStrength"
    GROUP_CONCAT(DISTINCT NULLIF(CASE WHEN time = "OPTBL" AND task = "gripStrength" THEN vdate END, '')) AS baseline_gripStrength_vdate,
    GROUP_CONCAT(DISTINCT NULLIF(CASE WHEN time = "OPTBL" AND task = "gripStrength" THEN raw_scr END, '')) AS baseline_gripStrength_raw_scr,
    GROUP_CONCAT(DISTINCT NULLIF(CASE WHEN time = "OPTBL" AND task = "gripStrength" THEN comp_scr END, '')) AS baseline_gripStrength_comp_scr,
    GROUP_CONCAT(DISTINCT NULLIF(CASE WHEN time = "OPTBL" AND task = "gripStrength" THEN unc_scr END, '')) AS baseline_gripStrength_unc_scr,
    GROUP_CONCAT(DISTINCT NULLIF(CASE WHEN time = "OPTBL" AND task = "gripStrength" THEN unc_scr_dom END, '')) AS baseline_gripStrength_unc_scr_dom,
    GROUP_CONCAT(DISTINCT NULLIF(CASE WHEN time = "OPTBL" AND task = "gripStrength" THEN dom_scr END, '')) AS baseline_gripStrength_dom_scr,
    GROUP_CONCAT(DISTINCT NULLIF(CASE WHEN time = "OPTBL" AND task = "gripStrength" THEN ndom_scr END, '')) AS baseline_gripStrength_ndom_scr,
    GROUP_CONCAT(DISTINCT NULLIF(CASE WHEN time = "OPTBL" AND task = "gripStrength" THEN notes END, '')) AS baseline_gripStrength_notes,

    -- For Week 10 event (time = "OPTS1End") and task = "4mWalk"
    GROUP_CONCAT(DISTINCT NULLIF(CASE WHEN time = "OPTS1End" AND task = "4mWalk" THEN vdate END, '')) AS week10_4mWalk_vdate,
    GROUP_CONCAT(DISTINCT NULLIF(CASE WHEN time = "OPTS1End" AND task = "4mWalk" THEN raw_scr END, '')) AS week10_4mWalk_raw_scr,
    GROUP_CONCAT(DISTINCT NULLIF(CASE WHEN time = "OPTS1End" AND task = "4mWalk" THEN comp_scr END, '')) AS week10_4mWalk_comp_scr,
    GROUP_CONCAT(DISTINCT NULLIF(CASE WHEN time = "OPTS1End" AND task = "4mWalk" THEN unc_scr END, '')) AS week10_4mWalk_unc_scr,
    GROUP_CONCAT(DISTINCT NULLIF(CASE WHEN time = "OPTS1End" AND task = "4mWalk" THEN unc_scr_dom END, '')) AS week10_4mWalk_unc_scr_dom,
    GROUP_CONCAT(DISTINCT NULLIF(CASE WHEN time = "OPTS1End" AND task = "4mWalk" THEN dom_scr END, '')) AS week10_4mWalk_dom_scr,
    GROUP_CONCAT(DISTINCT NULLIF(CASE WHEN time = "OPTS1End" AND task = "4mWalk" THEN ndom_scr END, '')) AS week10_4mWalk_ndom_scr,
    GROUP_CONCAT(DISTINCT NULLIF(CASE WHEN time = "OPTS1End" AND task = "4mWalk" THEN notes END, '')) AS week10_4mWalk_notes,

    -- For Week 10 event (time = "OPTS1End") and task = "9HolePegboard"
    GROUP_CONCAT(DISTINCT NULLIF(CASE WHEN time = "OPTS1End" AND task = "9HolePegboard" THEN vdate END, '')) AS week10_9HolePegboard_vdate,
    GROUP_CONCAT(DISTINCT NULLIF(CASE WHEN time = "OPTS1End" AND task = "9HolePegboard" THEN raw_scr END, '')) AS week10_9HolePegboard_raw_scr,
    GROUP_CONCAT(DISTINCT NULLIF(CASE WHEN time = "OPTS1End" AND task = "9HolePegboard" THEN comp_scr END, '')) AS week10_9HolePegboard_comp_scr,
    GROUP_CONCAT(DISTINCT NULLIF(CASE WHEN time = "OPTS1End" AND task = "9HolePegboard" THEN unc_scr END, '')) AS week10_9HolePegboard_unc_scr,
    GROUP_CONCAT(DISTINCT NULLIF(CASE WHEN time = "OPTS1End" AND task = "9HolePegboard" THEN unc_scr_dom END, '')) AS week10_9HolePegboard_unc_scr_dom,
    GROUP_CONCAT(DISTINCT NULLIF(CASE WHEN time = "OPTS1End" AND task = "9HolePegboard" THEN dom_scr END, '')) AS week10_9HolePegboard_dom_scr,
    GROUP_CONCAT(DISTINCT NULLIF(CASE WHEN time = "OPTS1End" AND task = "9HolePegboard" THEN ndom_scr END, '')) AS week10_9HolePegboard_ndom_scr,
    GROUP_CONCAT(DISTINCT NULLIF(CASE WHEN time = "OPTS1End" AND task = "9HolePegboard" THEN notes END, '')) AS week10_9HolePegboard_notes,

    -- For Week 10 event (time = "OPTS1End") and task = "StandingBalance"
    GROUP_CONCAT(DISTINCT NULLIF(CASE WHEN time = "OPTS1End" AND task = "StandingBalance" THEN vdate END, '')) AS week10_StandingBalance_vdate,
    GROUP_CONCAT(DISTINCT NULLIF(CASE WHEN time = "OPTS1End" AND task = "StandingBalance" THEN raw_scr END, '')) AS week10_StandingBalance_raw_scr,
    GROUP_CONCAT(DISTINCT NULLIF(CASE WHEN time = "OPTS1End" AND task = "StandingBalance" THEN comp_scr END, '')) AS week10_StandingBalance_comp_scr,
    GROUP_CONCAT(DISTINCT NULLIF(CASE WHEN time = "OPTS1End" AND task = "StandingBalance" THEN unc_scr END, '')) AS week10_StandingBalance_unc_scr,
    GROUP_CONCAT(DISTINCT NULLIF(CASE WHEN time = "OPTS1End" AND task = "StandingBalance" THEN unc_scr_dom END, '')) AS week10_StandingBalance_unc_scr_dom,
    GROUP_CONCAT(DISTINCT NULLIF(CASE WHEN time = "OPTS1End" AND task = "StandingBalance" THEN dom_scr END, '')) AS week10_StandingBalance_dom_scr,
    GROUP_CONCAT(DISTINCT NULLIF(CASE WHEN time = "OPTS1End" AND task = "StandingBalance" THEN ndom_scr END, '')) AS week10_StandingBalance_ndom_scr,
    GROUP_CONCAT(DISTINCT NULLIF(CASE WHEN time = "OPTS1End" AND task = "StandingBalance" THEN notes END, '')) AS week10_StandingBalance_notes,

    -- For Week 10 event (time = "OPTS1End") and task = "gripStrength"
    GROUP_CONCAT(DISTINCT NULLIF(CASE WHEN time = "OPTS1End" AND task = "gripStrength" THEN vdate END, '')) AS week10_gripStrength_vdate,
    GROUP_CONCAT(DISTINCT NULLIF(CASE WHEN time = "OPTS1End" AND task = "gripStrength" THEN raw_scr END, '')) AS week10_gripStrength_raw_scr,
    GROUP_CONCAT(DISTINCT NULLIF(CASE WHEN time = "OPTS1End" AND task = "gripStrength" THEN comp_scr END, '')) AS week10_gripStrength_comp_scr,
    GROUP_CONCAT(DISTINCT NULLIF(CASE WHEN time = "OPTS1End" AND task = "gripStrength" THEN unc_scr END, '')) AS week10_gripStrength_unc_scr,
    GROUP_CONCAT(DISTINCT NULLIF(CASE WHEN time = "OPTS1End" AND task = "gripStrength" THEN unc_scr_dom END, '')) AS week10_gripStrength_unc_scr_dom,
    GROUP_CONCAT(DISTINCT NULLIF(CASE WHEN time = "OPTS1End" AND task = "gripStrength" THEN dom_scr END, '')) AS week10_gripStrength_dom_scr,
    GROUP_CONCAT(DISTINCT NULLIF(CASE WHEN time = "OPTS1End" AND task = "gripStrength" THEN ndom_scr END, '')) AS week10_gripStrength_ndom_scr,
    GROUP_CONCAT(DISTINCT NULLIF(CASE WHEN time = "OPTS1End" AND task = "gripStrength" THEN notes END, '')) AS week10_gripStrength_notes

FROM 
    baard.opt_step1_tb_motor_20240224
WHERE 
    time IN ("OPTBL", "OPTS1End")
GROUP BY 
    id;

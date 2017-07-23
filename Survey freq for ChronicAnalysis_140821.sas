/* Survey freq for ChronicAnalysis*/

data comb ; set neds_cmb.neds_comb6_anlys_08212014 ;
run ;
/* HCUP by demographics, HCUP by pay categ and demographics, HCUP by outcome variables */
proc surveyfreq data=comb;
	stratum neds_stratum;
	cluster hosp_ed;
	weight discwt_6;
	tables HCUPFILE * (pay_chron female ZIPINC_QRTL pt_urban hosp_region hosp_urban teach_categ trauma_categ)/CL row col;
run;

proc surveyfreq data=comb;
	stratum neds_stratum;
	cluster hosp_ed;
	weight discwt_6;
	tables HCUPFILE * pay_chron * (female ZIPINC_QRTL pt_urban hosp_region hosp_urban teach_categ trauma_categ)/CL row col;
run;

proc surveyfreq data=comb;
	stratum neds_stratum;
	cluster hosp_ed;
	weight discwt_6;
	tables HCUPFILE * (DM_OA_DX1_An Cardio_DX1_AN AWP_DX1_An HF_DX1_An HTN_DX1_OA Asthma_DX1_AN COPD_AN SC_DX1_AN CF_DX1_AN Chron1_AN Chron2_AN)/CL row col;
run;



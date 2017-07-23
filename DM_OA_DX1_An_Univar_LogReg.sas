/* DM_OA_DX1_An_Univar_LogReg.sas */

data comb ; set neds_cmb.neds_comb6_anlys_08222014 ;
run ;

Title 'Univariate models for pay_chron, DM_OA_DX1_An';
proc surveylogistic data=comb ;
stratum neds_stratum ;
cluster hosp_ed ;
weight discwt_6 ;
class pay_chron/param=ref ref=first;
model  DM_OA_DX1_An (event='1') = pay_chron;
domain hcupfile ;
run;

Title 'Univariate models for age_categ, DM_OA_DX1_An';
proc surveylogistic data=comb ;
stratum neds_stratum ;
cluster hosp_ed ;
weight discwt_6 ;
class age_categ/param=ref ref=first;
model  DM_OA_DX1_An (event='1') = age_categ;
domain hcupfile ;
run;

Title 'Univariate models for female, DM_OA_DX1_An';
proc surveylogistic data=comb ;
stratum neds_stratum ;
cluster hosp_ed ;
weight discwt_6 ;
class female/param=ref ref=first;
model  DM_OA_DX1_An (event='1') = female;
domain hcupfile ;
run;

Title 'Univariate models for zipinc_qrtl, DM_OA_DX1_An';
proc surveylogistic data=comb ;
stratum neds_stratum ;
cluster hosp_ed ;
weight discwt_6 ;
class zipinc_qrtl/param=ref ref=first;
model  DM_OA_DX1_An (event='1') = zipinc_qrtl;
domain hcupfile ;
run;

Title 'Univariate models for pt_urban, DM_OA_DX1_An';
proc surveylogistic data=comb ;
stratum neds_stratum ;
cluster hosp_ed ;
weight discwt_6 ;
class pt_urban/param=ref ref=first;
model  DM_OA_DX1_An (event='1') = pt_urban;
domain hcupfile ;
run; 

Title 'Univariate models for hops_region, DM_OA_DX1_An';
proc surveylogistic data=comb ;
stratum neds_stratum ;
cluster hosp_ed ;
weight discwt_6 ;
class hosp_region/param=ref ref=first;
model  DM_OA_DX1_An (event='1') = hosp_region;
domain hcupfile ;
run;

Title 'Univariate models for hosp_urban, DM_OA_DX1_An';
proc surveylogistic data=comb ;
stratum neds_stratum ;
cluster hosp_ed ;
weight discwt_6 ;
class hosp_urban/param=ref ref=first;
model  DM_OA_DX1_An (event='1') = hosp_urban;
domain hcupfile ;
run;

Title 'Univariate models for teach_categ, DM_OA_DX1_An';
proc surveylogistic data=comb ;
stratum neds_stratum ;
cluster hosp_ed ;
weight discwt_6 ;
class teach_categ/param=ref ref=first;
model  DM_OA_DX1_An (event='1') = teach_categ;
domain hcupfile ;
run;

Title 'Univariate models for trauma_categ, DM_OA_DX1_An';
proc surveylogistic data=comb ;
stratum neds_stratum ;
cluster hosp_ed ;
weight discwt_6 ;
class trauma_categ/param=ref ref=first;
model  DM_OA_DX1_An (event='1') = trauma_categ;
domain hcupfile ;
run;


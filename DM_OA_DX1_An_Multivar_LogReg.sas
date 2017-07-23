/* DM_OA_DX1_An_Multivar_LogReg.sas */

data comb ; set neds_cmb.neds_comb6_anlys_08222014 ;
run ;


Title 'Multivariable model for DM_OA_DX1_An';
proc surveylogistic data=comb ;
stratum neds_stratum ;
cluster hosp_ed ;
weight discwt_6 ;
class pay_chron age_categ female zipinc_qrtl pt_urban hosp_region hosp_urban / param=ref ref=first;
model  DM_OA_DX1_An (event='1') = 
       pay_chron age_categ female zipinc_qrtl pt_urban hosp_region hosp_urban ;
domain hcupfile ;
run;

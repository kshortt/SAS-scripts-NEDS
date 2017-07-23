data comb ; set neds_cmb.neds_comb6_anlys_08222014 ;
run ;

Title 'Multivariable model for HTN_DX1_AN_noexcl';
proc surveylogistic data=comb ;
stratum neds_stratum ;
cluster hosp_ed ;
weight discwt_6 ;
class pay_chron age_categ female zipinc_qrtl pt_urban hosp_region hosp_urban teach_categ trauma_categ/param=ref ref=first;
model  HTN_DX1_AN_noexcl (event='1') = pay_chron age_categ female zipinc_qrtl pt_urban hosp_region hosp_urban;
domain hcupfile ;
run;
data comb ; set neds_cmb.neds_comb6_anlys_08222014 ;
run ;

Title 'Univariate models for pay_chron, HTN_DX1_AN_noexcl';
proc surveylogistic data=comb ;
stratum neds_stratum ;
cluster hosp_ed ;
weight discwt_6 ;
class pay_chron/param=ref ref=first;
model  HTN_DX1_AN_noexcl (event='1') = pay_chron;
domain hcupfile ;
run;

Title 'Univariate models for age_categ, HTN_DX1_AN_noexcl';
proc surveylogistic data=comb ;
stratum neds_stratum ;
cluster hosp_ed ;
weight discwt_6 ;
class age_categ/param=ref ref=first;
model  HTN_DX1_AN_noexcl (event='1') = age_categ;
domain hcupfile ;
run;

Title 'Univariate models for female, HTN_DX1_AN_noexcl';
proc surveylogistic data=comb ;
stratum neds_stratum ;
cluster hosp_ed ;
weight discwt_6 ;
class female/param=ref ref=first;
model  HTN_DX1_AN_noexcl (event='1') = female;
domain hcupfile ;
run;

Title 'Univariate models for zipinc_qrtl, HTN_DX1_AN_noexcl';
proc surveylogistic data=comb ;
stratum neds_stratum ;
cluster hosp_ed ;
weight discwt_6 ;
class zipinc_qrtl/param=ref ref=first;
model  HTN_DX1_AN_noexcl (event='1') = zipinc_qrtl;
domain hcupfile ;
run;

Title 'Univariate models for pt_urban, HTN_DX1_AN_noexcl';
proc surveylogistic data=comb ;
stratum neds_stratum ;
cluster hosp_ed ;
weight discwt_6 ;
class pt_urban/param=ref ref=first;
model  HTN_DX1_AN_noexcl (event='1') = pt_urban;
domain hcupfile ;
run; 

Title 'Univariate models for hops_region, HTN_DX1_AN_noexcl';
proc surveylogistic data=comb ;
stratum neds_stratum ;
cluster hosp_ed ;
weight discwt_6 ;
class hosp_region/param=ref ref=first;
model  HTN_DX1_AN_noexcl (event='1') = hosp_region;
domain hcupfile ;
run;

Title 'Univariate models for hosp_urban, HTN_DX1_AN_noexcl';
proc surveylogistic data=comb ;
stratum neds_stratum ;
cluster hosp_ed ;
weight discwt_6 ;
class hosp_urban/param=ref ref=first;
model  HTN_DX1_AN_noexcl (event='1') = hosp_urban;
domain hcupfile ;
run;
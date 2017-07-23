data temp1 ; Set neds_cmb.neds_comb6_anlys_04242014 ; 
run ; 

/*correct incorrect column name ht_csht_an*/
Proc freq data =temp1 ;
 Tables htn_csht_an ht_csht_an ;
Run ;
Data temp2 ; set temp1 ;
	If HT_CSht_An ne . then HTN_CSht_An = HT_CSht_An ;
Run ;
Data temp3 ; set temp2 ;
 	Drop HT_CSht_An ;
Run ;
Proc freq data=temp3 ;
 Tables htn_csht_an ;
 Run ;

Data temp4 ; set temp3 ;
 
/*HTN_DX1_AN_noexcl without exclusions*/
HTN_DX1_An_noexcl = 0 ;
    if dx1 in("4010" "4019" "40200" "40210" 
                "40290" "40300" "40310" "40390" 
                "40400" "40410" "40490") then HTN_DX1_An_noexcl = 1 ;

/*HTN_dx1_overall any HTN DX1*/
HTN_DX1_OA = 0 ; 
	if HTN_DX1_An_noexcl = 1 or HTN_esntl_DX1_An = 1 or HTN_Csht_DX1_An then HTN_DX1_OA = 1 ;
    
/*Cardio_DX1_AN*/
 Cardio_DX1_AN = 0 ;
    if HTN_DX1_OA = 1 or AWP_DX1_AN = 1 or HF_DX1_AN = 1 then Cardio_DX1_AN = 1 ;

/*Asthma_DX1_AN all ages*/
 Asthma_DX1_AN = 0 ;
    if dx1 in("49300" "49301" "49302" "49310" "49311" "49312" "49320" "49321" "49322" "49381" "49382" "49390" 
"49391" "49392") then Asthma_DX1_AN = 1 ;

/*Acute_Bronchitis for COPD exclusion*/
 Acute_Bronchitis = 0 ;
    if dx1 in("4660" "490") then Acute_Bronchitis = 1 ;

/*COPD*/
 COPD = 0 ;
 	array COPD {15} dx2-dx15 ;
  	do i = 1 to 15 ;
   	if COPD{i} in("4910" "4911" "49120" "49121" "4918" "4919" "4920" "4928" "494" "4940" "4941" "496") then COPD = 1 ; end ;

/*COPD_AN or Acute_Bronchitis with COPD_AN*/
COPD_AN = 0 ;
	if dx1 in("4910" "4911" "49120" "49121" "4918" "4919" "4920" "4928" "494" "4940" "4941" "496") 
	or COPD = 1 AND Acute_Bronchitis = 1
	then COPD_AN = 1 ; 

/*SC_DX1_AN*/
 SC_DX1_AN = 0 ;
    if dx1 in("28241"	"28242"	"2825"	"28260"	"28261"	"28262"	"28263"	"28264"	"28268"	"28269") then SC_DX1_AN = 1 ;
    
/*CF_DX1_AN*/
CF_DX1_AN = 0 ;
    if dx1 in("27700"	"27701"	"27702"	"27703"	"27709") then CF_DX1_AN = 1 ;

/*Chron_An if any chronic analysis DX1 variable =1*/
Chron1_An = 0 ; 
	if  Cardio_DX1_AN = 1 
	or Asthma_DX1_AN = 1 
	or COPD_DX1_AN = 1 
	or DM_OA_DX1_AN = 1
	then Chron1_An = 1 ;

Chron2_An = 0 ; 
	if  Cardio_DX1_AN = 1 
	or Asthma_DX1_AN = 1 
	or COPD_DX1_AN = 1 
	or DM_OA_DX1_AN = 1
	or SC_DX1_AN = 1 
	or CF=DX1_AN = 1 
	then Chron2_An = 1 ;

/*pay category for chronic analysis- 1=medicare, 2=medicaid, 3=private, 4=self and no-charge, 5=other*/    
 	if pay1 = 1 then pay_chron1 = 2 ;
 	if pay1 = 2 then pay_chron1 = 3 ;
	if pay1 = 3 then pay_chron1 = 4 ;
	if pay1 in(4,5)then pay_chron1 = 1 ;
 	if pay1 = 6 then pay_chron1 = 5 ;

	if pay2 = 1 then pay_chron2 = 2 ;
	if pay2 = 2 then pay_chron2 = 3 ;
 	if pay2 = 3 then pay_chron2 = 4 ;
 	if pay2 in(4,5)then pay_chron2 = 1 ;
 	if pay2 = 6 then pay_chron2 = 5 ;

pay_chron = pay_chron1 ;
 if pay1 = . then pay_chron = pay_chron2 ;

 
 
 Data neds_cmb.neds_comb6_anlys_08012014 ; set temp4 ;
 proc contents position data=neds_cmb.neds_comb6_anlys_08212014 ;
Run ;
! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.8.1 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 15:44 on 9.3.2016   
! ----------------------------------------------------------------------  
 
 
Module BranchingRatios_DMLR 
 
Use Control 
Use Couplings_DMLR 
Use Model_Data_DMLR 
Use LoopCouplings_DMLR 
Use Fu3Decays_DMLR 
Use Fe3Decays_DMLR 
Use Fd3Decays_DMLR 
Use Fv3Decays_DMLR 
Use SUSYDecays_DMLR 
 
Contains 
 
Subroutine CalculateBR(CTBD,fac3,epsI,deltaM,kont,MAh,MAh2,MFc,MFc2,MFcp,             & 
& MFcp2,MFcpp,MFcpp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,            & 
& MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,UV,TW,               & 
& UC,UCC,ZDR,ZER,UP,UT,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,v1,v2,vtl,vtr,gBL,g2,gR,g3,              & 
& RHO2,RHO1,rh3,ALP3,ALP1,LAM1,BETA2,LAM3,YDR,YL1,YDL,YQ1,M23,mudl2,mudr2,               & 
& MU12,gPFu,gTFu,BRFu,gPFe,gTFe,BRFe,gPFd,gTFd,BRFd,gPhh,gThh,BRhh,gPFv,gTFv,            & 
& BRFv,gPVZ,gTVZ,BRVZ,gPVZR,gTVZR,BRVZR,gPHppmm,gTHppmm,BRHppmm,gPHpm,gTHpm,             & 
& BRHpm,gPAh,gTAh,BRAh,gPVWLm,gTVWLm,BRVWLm,gPVWRm,gTVWRm,BRVWRm)

Real(dp), Intent(in) :: epsI, deltaM, fac3 
Integer, Intent(inout) :: kont 
Logical, Intent(in) :: CTBD 
Real(dp),Intent(in) :: gBL,g2,gR,g3,RHO2,RHO1,ALP3,ALP1,LAM1,BETA2,LAM3,M23,MU12

Complex(dp),Intent(in) :: rh3,YDR(3,3),YL1(3,3),YDL(3,3),YQ1(3,3),mudl2,mudr2

Real(dp),Intent(in) :: MAh(4),MAh2(4),MFc(2),MFc2(2),MFcp,MFcp2,MFcpp,MFcpp2,MFd(3),MFd2(3),MFe(3),          & 
& MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),Mhh(4),Mhh2(4),MHpm(4),MHpm2(4),MHppmm(2),       & 
& MHppmm2(2),MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,TW,UC(4,4),              & 
& UCC(2,2),UP(4,4),ZH(4,4)

Complex(dp),Intent(in) :: UV(6,6),ZDR(3,3),ZER(3,3),UT(2,2),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZW(4,4),ZZ(3,3)

Real(dp),Intent(in) :: v1,v2,vtl,vtr

Real(dp),Intent(inout) :: gPFu(3,252),gTFu(3),BRFu(3,252),gPFe(3,237),gTFe(3),BRFe(3,237),gPFd(3,252),          & 
& gTFd(3),BRFd(3,252),gPhh(4,87),gThh(4),BRhh(4,87),gPFv(6,462),gTFv(6),BRFv(6,462),     & 
& gPVZ(1,84),gTVZ,BRVZ(1,84),gPVZR(1,84),gTVZR,BRVZR(1,84),gPHppmm(2,32),gTHppmm(2),     & 
& BRHppmm(2,32),gPHpm(4,49),gTHpm(4),BRHpm(4,49),gPAh(4,79),gTAh(4),BRAh(4,79),          & 
& gPVWLm(1,50),gTVWLm,BRVWLm(1,50),gPVWRm(1,50),gTVWRm,BRVWRm(1,50)

Complex(dp) :: cplHiggsPP(4),cplHiggsGG(4),cplPseudoHiggsPP(4),cplPseudoHiggsGG(4),cplHiggsZZvirt(4),& 
& cplHiggsWWvirt(4)

Real(dp) :: gFuFucFdFd(3,3,3,3),gFuFucFeFe(3,3,3,3),gFuFucFuFu(3,3,3,3),gFuFuFvFv(3,3,6,6),       & 
& gFuFdFcpFc(3,3,1,2),gFuFdcFcpFcpp(3,3,1,1),gFuFuFcFc(3,3,2,2),gFuFucFcpFcp(3,3,1,1),   & 
& gFuFucFcppFcpp(3,3,1,1),gFeFecFdFd(3,3,3,3),gFeFecFeFe(3,3,3,3),gFeFecFuFu(3,3,3,3),   & 
& gFeFeFvFv(3,3,6,6),gFeFeFcFc(3,3,2,2),gFeFecFcpFcp(3,3,1,1),gFeFecFcppFcpp(3,3,1,1),   & 
& gFdFdcFdFd(3,3,3,3),gFdFdcFeFe(3,3,3,3),gFdFdcFuFu(3,3,3,3),gFdFdFvFv(3,3,6,6),        & 
& gFdFdFcFc(3,3,2,2),gFdFdcFcpFcp(3,3,1,1),gFdFdcFcppFcpp(3,3,1,1),gFdFucFcpFc(3,3,1,2), & 
& gFdFucFcppFcp(3,3,1,1),gFvFvcFdFd(6,6,3,3),gFvFvcFeFe(6,6,3,3),gFvFvcFuFu(6,6,3,3),    & 
& gFvFvFvFv(6,6,6,6),gFvFvFcFc(6,6,2,2),gFvFvcFcpFcp(6,6,1,1),gFvFvcFcppFcpp(6,6,1,1)

Complex(dp) :: coup 
Real(dp) :: vev 
Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateBR'
 
Write(*,*) "Calculating branching ratios and decay widths" 
gTVWLm = gamW 
gTVZ = gamZ 
gPFu = 0._dp 
gTFu = 0._dp 
BRFu = 0._dp 
Call FuTwoBodyDecay(-1,DeltaM,MAh,MAh2,MFc,MFc2,MFcp,MFcp2,MFcpp,MFcpp2,              & 
& MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,          & 
& MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,UT,               & 
& ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,RHO2,RHO1,rh3,ALP3,ALP1,LAM1,BETA2,              & 
& LAM3,YDR,YL1,YDL,YQ1,M23,mudl2,mudr2,MU12,v1,v2,vtl,vtr,gPFu(:,1:36),gTFu,             & 
& BRFu(:,1:36))

Do i1=1,3
gTFu(i1) =Sum(gPFu(i1,:)) 
If (gTFu(i1).Gt.0._dp) BRFu(i1,: ) =gPFu(i1,:)/gTFu(i1) 
End Do 
 

gPFe = 0._dp 
gTFe = 0._dp 
BRFe = 0._dp 
Call FeTwoBodyDecay(-1,DeltaM,MAh,MAh2,MFc,MFc2,MFcp,MFcp2,MFcpp,MFcpp2,              & 
& MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,          & 
& MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,UT,               & 
& ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,RHO2,RHO1,rh3,ALP3,ALP1,LAM1,BETA2,              & 
& LAM3,YDR,YL1,YDL,YQ1,M23,mudl2,mudr2,MU12,v1,v2,vtl,vtr,gPFe(:,1:30),gTFe,             & 
& BRFe(:,1:30))

Do i1=1,3
gTFe(i1) =Sum(gPFe(i1,:)) 
If (gTFe(i1).Gt.0._dp) BRFe(i1,: ) =gPFe(i1,:)/gTFe(i1) 
End Do 
 

gPFd = 0._dp 
gTFd = 0._dp 
BRFd = 0._dp 
Call FdTwoBodyDecay(-1,DeltaM,MAh,MAh2,MFc,MFc2,MFcp,MFcp2,MFcpp,MFcpp2,              & 
& MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,          & 
& MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,UT,               & 
& ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,RHO2,RHO1,rh3,ALP3,ALP1,LAM1,BETA2,              & 
& LAM3,YDR,YL1,YDL,YQ1,M23,mudl2,mudr2,MU12,v1,v2,vtl,vtr,gPFd(:,1:36),gTFd,             & 
& BRFd(:,1:36))

Do i1=1,3
gTFd(i1) =Sum(gPFd(i1,:)) 
If (gTFd(i1).Gt.0._dp) BRFd(i1,: ) =gPFd(i1,:)/gTFd(i1) 
End Do 
 

gPhh = 0._dp 
gThh = 0._dp 
BRhh = 0._dp 
Call hhTwoBodyDecay(-1,DeltaM,MAh,MAh2,MFc,MFc2,MFcp,MFcp2,MFcpp,MFcpp2,              & 
& MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,          & 
& MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,UT,               & 
& ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,RHO2,RHO1,rh3,ALP3,ALP1,LAM1,BETA2,              & 
& LAM3,YDR,YL1,YDL,YQ1,M23,mudl2,mudr2,MU12,v1,v2,vtl,vtr,gPhh,gThh,BRhh)

gPFv = 0._dp 
gTFv = 0._dp 
BRFv = 0._dp 
Call FvTwoBodyDecay(-1,DeltaM,MAh,MAh2,MFc,MFc2,MFcp,MFcp2,MFcpp,MFcpp2,              & 
& MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,          & 
& MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,UT,               & 
& ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,RHO2,RHO1,rh3,ALP3,ALP1,LAM1,BETA2,              & 
& LAM3,YDR,YL1,YDL,YQ1,M23,mudl2,mudr2,MU12,v1,v2,vtl,vtr,gPFv(:,1:48),gTFv,             & 
& BRFv(:,1:48))

Do i1=1,6
gTFv(i1) =Sum(gPFv(i1,:)) 
If (gTFv(i1).Gt.0._dp) BRFv(i1,: ) =gPFv(i1,:)/gTFv(i1) 
End Do 
 

gPVZ = 0._dp 
gTVZ = 0._dp 
BRVZ = 0._dp 
Call VZTwoBodyDecay(-1,DeltaM,MAh,MAh2,MFc,MFc2,MFcp,MFcp2,MFcpp,MFcpp2,              & 
& MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,          & 
& MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,UT,               & 
& ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,RHO2,RHO1,rh3,ALP3,ALP1,LAM1,BETA2,              & 
& LAM3,YDR,YL1,YDL,YQ1,M23,mudl2,mudr2,MU12,v1,v2,vtl,vtr,gPVZ,gTVZ,BRVZ)

! Set Goldstone Widhts 
gTAh(1)=gTVZ


gPVZR = 0._dp 
gTVZR = 0._dp 
BRVZR = 0._dp 
Call VZRTwoBodyDecay(-1,DeltaM,MAh,MAh2,MFc,MFc2,MFcp,MFcp2,MFcpp,MFcpp2,             & 
& MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,          & 
& MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,UT,               & 
& ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,RHO2,RHO1,rh3,ALP3,ALP1,LAM1,BETA2,              & 
& LAM3,YDR,YL1,YDL,YQ1,M23,mudl2,mudr2,MU12,v1,v2,vtl,vtr,gPVZR,gTVZR,BRVZR)

! Set Goldstone Widhts 
gTAh(2)=gTVZR


gPHppmm = 0._dp 
gTHppmm = 0._dp 
BRHppmm = 0._dp 
Call HppmmTwoBodyDecay(-1,DeltaM,MAh,MAh2,MFc,MFc2,MFcp,MFcp2,MFcpp,MFcpp2,           & 
& MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,          & 
& MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,UT,               & 
& ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,RHO2,RHO1,rh3,ALP3,ALP1,LAM1,BETA2,              & 
& LAM3,YDR,YL1,YDL,YQ1,M23,mudl2,mudr2,MU12,v1,v2,vtl,vtr,gPHppmm,gTHppmm,BRHppmm)

gPHpm = 0._dp 
gTHpm = 0._dp 
BRHpm = 0._dp 
Call HpmTwoBodyDecay(-1,DeltaM,MAh,MAh2,MFc,MFc2,MFcp,MFcp2,MFcpp,MFcpp2,             & 
& MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,          & 
& MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,UT,               & 
& ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,RHO2,RHO1,rh3,ALP3,ALP1,LAM1,BETA2,              & 
& LAM3,YDR,YL1,YDL,YQ1,M23,mudl2,mudr2,MU12,v1,v2,vtl,vtr,gPHpm,gTHpm,BRHpm)

! Set Goldstone Widhts 
gTHpm(1)=gTVWLm
gTHpm(2)=gTVWRm


gPAh = 0._dp 
gTAh = 0._dp 
BRAh = 0._dp 
Call AhTwoBodyDecay(-1,DeltaM,MAh,MAh2,MFc,MFc2,MFcp,MFcp2,MFcpp,MFcpp2,              & 
& MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,          & 
& MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,UT,               & 
& ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,RHO2,RHO1,rh3,ALP3,ALP1,LAM1,BETA2,              & 
& LAM3,YDR,YL1,YDL,YQ1,M23,mudl2,mudr2,MU12,v1,v2,vtl,vtr,gPAh,gTAh,BRAh)

! Set Goldstone Widhts 
gTAh(1)=gTVZ
gTAh(2)=gTVZR


gPVWLm = 0._dp 
gTVWLm = 0._dp 
BRVWLm = 0._dp 
Call VWLmTwoBodyDecay(-1,DeltaM,MAh,MAh2,MFc,MFc2,MFcp,MFcp2,MFcpp,MFcpp2,            & 
& MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,          & 
& MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,UT,               & 
& ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,RHO2,RHO1,rh3,ALP3,ALP1,LAM1,BETA2,              & 
& LAM3,YDR,YL1,YDL,YQ1,M23,mudl2,mudr2,MU12,v1,v2,vtl,vtr,gPVWLm,gTVWLm,BRVWLm)

! Set Goldstone Widhts 
gTHpm(1)=gTVWLm


gPVWRm = 0._dp 
gTVWRm = 0._dp 
BRVWRm = 0._dp 
Call VWRmTwoBodyDecay(-1,DeltaM,MAh,MAh2,MFc,MFc2,MFcp,MFcp2,MFcpp,MFcpp2,            & 
& MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,          & 
& MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,UT,               & 
& ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,RHO2,RHO1,rh3,ALP3,ALP1,LAM1,BETA2,              & 
& LAM3,YDR,YL1,YDL,YQ1,M23,mudl2,mudr2,MU12,v1,v2,vtl,vtr,gPVWRm,gTVWRm,BRVWRm)

! Set Goldstone Widhts 
gTHpm(2)=gTVWRm


If (.Not.CTBD) Then 
If (Enable3BDecaysF) Then 
If (MaxVal(gTFu).Lt.MaxVal(fac3*Abs(MFu))) Then 
Call FuThreeBodyDecay(-1,MAh,MAh2,MFc,MFc2,MFcp,MFcp2,MFcpp,MFcpp2,MFd,               & 
& MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,              & 
& MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,UT,               & 
& ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,RHO2,RHO1,rh3,ALP3,ALP1,LAM1,BETA2,              & 
& LAM3,YDR,YL1,YDL,YQ1,M23,mudl2,mudr2,MU12,v1,v2,vtl,vtr,gTAh,gThh,gTHpm,               & 
& gTVWLm,gTVWRm,gTVZ,gTVZR,gFuFucFdFd,gFuFucFeFe,gFuFucFuFu,gFuFuFvFv,gFuFdFcpFc,        & 
& gFuFdcFcpFcpp,gFuFuFcFc,gFuFucFcpFcp,gFuFucFcppFcpp,epsI,deltaM,.False.,               & 
& gTFu,gPFu(:,37:252),BRFu(:,37:252))

Else 
Call FuThreeBodyDecay(-1,MAh,MAh2,MFc,MFc2,MFcp,MFcp2,MFcpp,MFcpp2,MFd,               & 
& MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,              & 
& MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,UT,               & 
& ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,RHO2,RHO1,rh3,ALP3,ALP1,LAM1,BETA2,              & 
& LAM3,YDR,YL1,YDL,YQ1,M23,mudl2,mudr2,MU12,v1,v2,vtl,vtr,gTAh,gThh,gTHpm,               & 
& gTVWLm,gTVWRm,gTVZ,gTVZR,gFuFucFdFd,gFuFucFeFe,gFuFucFuFu,gFuFuFvFv,gFuFdFcpFc,        & 
& gFuFdcFcpFcpp,gFuFuFcFc,gFuFucFcpFcp,gFuFucFcppFcpp,epsI,deltaM,.True.,gTFu,           & 
& gPFu(:,37:252),BRFu(:,37:252))

End If 
 
End If 
Else 
Call FuThreeBodyDecay(-1,MAh,MAh2,MFc,MFc2,MFcp,MFcp2,MFcpp,MFcpp2,MFd,               & 
& MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,              & 
& MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,UT,               & 
& ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,RHO2,RHO1,rh3,ALP3,ALP1,LAM1,BETA2,              & 
& LAM3,YDR,YL1,YDL,YQ1,M23,mudl2,mudr2,MU12,v1,v2,vtl,vtr,gTAh,gThh,gTHpm,               & 
& gTVWLm,gTVWRm,gTVZ,gTVZR,gFuFucFdFd,gFuFucFeFe,gFuFucFuFu,gFuFuFvFv,gFuFdFcpFc,        & 
& gFuFdcFcpFcpp,gFuFuFcFc,gFuFucFcpFcp,gFuFucFcppFcpp,epsI,deltaM,.False.,               & 
& gTFu,gPFu(:,37:252),BRFu(:,37:252))

End If 
Do i1=1,3
gTFu(i1) =Sum(gPFu(i1,:)) 
If (gTFu(i1).Gt.0._dp) BRFu(i1,: ) =gPFu(i1,:)/gTFu(i1) 
End Do 
 

If (.Not.CTBD) Then 
If (Enable3BDecaysF) Then 
If (MaxVal(gTFe).Lt.MaxVal(fac3*Abs(MFe))) Then 
Call FeThreeBodyDecay(-1,MAh,MAh2,MFc,MFc2,MFcp,MFcp2,MFcpp,MFcpp2,MFd,               & 
& MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,              & 
& MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,UT,               & 
& ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,RHO2,RHO1,rh3,ALP3,ALP1,LAM1,BETA2,              & 
& LAM3,YDR,YL1,YDL,YQ1,M23,mudl2,mudr2,MU12,v1,v2,vtl,vtr,gTAh,gThh,gTHppmm,             & 
& gTVZ,gTVZR,gFeFecFdFd,gFeFecFeFe,gFeFecFuFu,gFeFeFvFv,gFeFeFcFc,gFeFecFcpFcp,          & 
& gFeFecFcppFcpp,epsI,deltaM,.False.,gTFe,gPFe(:,31:237),BRFe(:,31:237))

Else 
Call FeThreeBodyDecay(-1,MAh,MAh2,MFc,MFc2,MFcp,MFcp2,MFcpp,MFcpp2,MFd,               & 
& MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,              & 
& MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,UT,               & 
& ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,RHO2,RHO1,rh3,ALP3,ALP1,LAM1,BETA2,              & 
& LAM3,YDR,YL1,YDL,YQ1,M23,mudl2,mudr2,MU12,v1,v2,vtl,vtr,gTAh,gThh,gTHppmm,             & 
& gTVZ,gTVZR,gFeFecFdFd,gFeFecFeFe,gFeFecFuFu,gFeFeFvFv,gFeFeFcFc,gFeFecFcpFcp,          & 
& gFeFecFcppFcpp,epsI,deltaM,.True.,gTFe,gPFe(:,31:237),BRFe(:,31:237))

End If 
 
End If 
Else 
Call FeThreeBodyDecay(-1,MAh,MAh2,MFc,MFc2,MFcp,MFcp2,MFcpp,MFcpp2,MFd,               & 
& MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,              & 
& MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,UT,               & 
& ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,RHO2,RHO1,rh3,ALP3,ALP1,LAM1,BETA2,              & 
& LAM3,YDR,YL1,YDL,YQ1,M23,mudl2,mudr2,MU12,v1,v2,vtl,vtr,gTAh,gThh,gTHppmm,             & 
& gTVZ,gTVZR,gFeFecFdFd,gFeFecFeFe,gFeFecFuFu,gFeFeFvFv,gFeFeFcFc,gFeFecFcpFcp,          & 
& gFeFecFcppFcpp,epsI,deltaM,.False.,gTFe,gPFe(:,31:237),BRFe(:,31:237))

End If 
Do i1=1,3
gTFe(i1) =Sum(gPFe(i1,:)) 
If (gTFe(i1).Gt.0._dp) BRFe(i1,: ) =gPFe(i1,:)/gTFe(i1) 
End Do 
 

If (.Not.CTBD) Then 
If (Enable3BDecaysF) Then 
If (MaxVal(gTFd).Lt.MaxVal(fac3*Abs(MFd))) Then 
Call FdThreeBodyDecay(-1,MAh,MAh2,MFc,MFc2,MFcp,MFcp2,MFcpp,MFcpp2,MFd,               & 
& MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,              & 
& MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,UT,               & 
& ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,RHO2,RHO1,rh3,ALP3,ALP1,LAM1,BETA2,              & 
& LAM3,YDR,YL1,YDL,YQ1,M23,mudl2,mudr2,MU12,v1,v2,vtl,vtr,gTAh,gThh,gTHpm,               & 
& gTVWLm,gTVWRm,gTVZ,gTVZR,gFdFdcFdFd,gFdFdcFeFe,gFdFdcFuFu,gFdFdFvFv,gFdFdFcFc,         & 
& gFdFdcFcpFcp,gFdFdcFcppFcpp,gFdFucFcpFc,gFdFucFcppFcp,epsI,deltaM,.False.,             & 
& gTFd,gPFd(:,37:252),BRFd(:,37:252))

Else 
Call FdThreeBodyDecay(-1,MAh,MAh2,MFc,MFc2,MFcp,MFcp2,MFcpp,MFcpp2,MFd,               & 
& MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,              & 
& MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,UT,               & 
& ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,RHO2,RHO1,rh3,ALP3,ALP1,LAM1,BETA2,              & 
& LAM3,YDR,YL1,YDL,YQ1,M23,mudl2,mudr2,MU12,v1,v2,vtl,vtr,gTAh,gThh,gTHpm,               & 
& gTVWLm,gTVWRm,gTVZ,gTVZR,gFdFdcFdFd,gFdFdcFeFe,gFdFdcFuFu,gFdFdFvFv,gFdFdFcFc,         & 
& gFdFdcFcpFcp,gFdFdcFcppFcpp,gFdFucFcpFc,gFdFucFcppFcp,epsI,deltaM,.True.,              & 
& gTFd,gPFd(:,37:252),BRFd(:,37:252))

End If 
 
End If 
Else 
Call FdThreeBodyDecay(-1,MAh,MAh2,MFc,MFc2,MFcp,MFcp2,MFcpp,MFcpp2,MFd,               & 
& MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,              & 
& MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,UT,               & 
& ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,RHO2,RHO1,rh3,ALP3,ALP1,LAM1,BETA2,              & 
& LAM3,YDR,YL1,YDL,YQ1,M23,mudl2,mudr2,MU12,v1,v2,vtl,vtr,gTAh,gThh,gTHpm,               & 
& gTVWLm,gTVWRm,gTVZ,gTVZR,gFdFdcFdFd,gFdFdcFeFe,gFdFdcFuFu,gFdFdFvFv,gFdFdFcFc,         & 
& gFdFdcFcpFcp,gFdFdcFcppFcpp,gFdFucFcpFc,gFdFucFcppFcp,epsI,deltaM,.False.,             & 
& gTFd,gPFd(:,37:252),BRFd(:,37:252))

End If 
Do i1=1,3
gTFd(i1) =Sum(gPFd(i1,:)) 
If (gTFd(i1).Gt.0._dp) BRFd(i1,: ) =gPFd(i1,:)/gTFd(i1) 
End Do 
 

! No 3-body decays for hh  
If (.Not.CTBD) Then 
If (Enable3BDecaysF) Then 
If (MaxVal(gTFv).Lt.MaxVal(fac3*Abs(MFv))) Then 
Call FvThreeBodyDecay(-1,MAh,MAh2,MFc,MFc2,MFcp,MFcp2,MFcpp,MFcpp2,MFd,               & 
& MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,              & 
& MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,UT,               & 
& ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,RHO2,RHO1,rh3,ALP3,ALP1,LAM1,BETA2,              & 
& LAM3,YDR,YL1,YDL,YQ1,M23,mudl2,mudr2,MU12,v1,v2,vtl,vtr,gTAh,gThh,gTVZ,gTVZR,          & 
& gFvFvcFdFd,gFvFvcFeFe,gFvFvcFuFu,gFvFvFvFv,gFvFvFcFc,gFvFvcFcpFcp,gFvFvcFcppFcpp,      & 
& epsI,deltaM,.False.,gTFv,gPFv(:,49:462),BRFv(:,49:462))

Else 
Call FvThreeBodyDecay(-1,MAh,MAh2,MFc,MFc2,MFcp,MFcp2,MFcpp,MFcpp2,MFd,               & 
& MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,              & 
& MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,UT,               & 
& ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,RHO2,RHO1,rh3,ALP3,ALP1,LAM1,BETA2,              & 
& LAM3,YDR,YL1,YDL,YQ1,M23,mudl2,mudr2,MU12,v1,v2,vtl,vtr,gTAh,gThh,gTVZ,gTVZR,          & 
& gFvFvcFdFd,gFvFvcFeFe,gFvFvcFuFu,gFvFvFvFv,gFvFvFcFc,gFvFvcFcpFcp,gFvFvcFcppFcpp,      & 
& epsI,deltaM,.True.,gTFv,gPFv(:,49:462),BRFv(:,49:462))

End If 
 
End If 
Else 
Call FvThreeBodyDecay(-1,MAh,MAh2,MFc,MFc2,MFcp,MFcp2,MFcpp,MFcpp2,MFd,               & 
& MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,              & 
& MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,UT,               & 
& ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,RHO2,RHO1,rh3,ALP3,ALP1,LAM1,BETA2,              & 
& LAM3,YDR,YL1,YDL,YQ1,M23,mudl2,mudr2,MU12,v1,v2,vtl,vtr,gTAh,gThh,gTVZ,gTVZR,          & 
& gFvFvcFdFd,gFvFvcFeFe,gFvFvcFuFu,gFvFvFvFv,gFvFvFcFc,gFvFvcFcpFcp,gFvFvcFcppFcpp,      & 
& epsI,deltaM,.False.,gTFv,gPFv(:,49:462),BRFv(:,49:462))

End If 
Do i1=1,6
gTFv(i1) =Sum(gPFv(i1,:)) 
If (gTFv(i1).Gt.0._dp) BRFv(i1,: ) =gPFv(i1,:)/gTFv(i1) 
End Do 
 

! No 3-body decays for VZ  
! No 3-body decays for VZR  
! No 3-body decays for Hppmm  
! No 3-body decays for Hpm  
! No 3-body decays for Ah  
! No 3-body decays for VWLm  
! No 3-body decays for VWRm  
Iname = Iname - 1 
 
End Subroutine CalculateBR 
End Module BranchingRatios_DMLR 
 
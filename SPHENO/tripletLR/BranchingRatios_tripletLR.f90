! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.8.1 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 13:05 on 11.3.2016   
! ----------------------------------------------------------------------  
 
 
Module BranchingRatios_tripletLR 
 
Use Control 
Use Couplings_tripletLR 
Use Model_Data_tripletLR 
Use LoopCouplings_tripletLR 
Use Fu3Decays_tripletLR 
Use Fe3Decays_tripletLR 
Use Fd3Decays_tripletLR 
Use Fv3Decays_tripletLR 
Use SUSYDecays_tripletLR 
 
Contains 
 
Subroutine CalculateBR(CTBD,fac3,epsI,deltaM,kont,MAh,MAh2,MdeltaRpp,MdeltaRpp2,      & 
& MFc,MFc2,MFcp,MFcp2,MFcpp,MFcpp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,              & 
& Mhh2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,phaT,PhiW,               & 
& UV,TW,UC,ZDR,ZER,UP,UT,UTE,ZUR,ZDL,ZEL,VTE,ZUL,ZH,ZW,ZZ,vd,vu,vR,gBL,g2,               & 
& gR,g3,RHO2,RHO1,ALP1,LAM1,ALP3,ALP2,LAM4,LAM2,LAM3,LAMT1,YDR,YL1,YQ1,LAMT2,            & 
& YL2,YQ2,M1,M23,mu32,MU22,MU12,gPFu,gTFu,BRFu,gPFe,gTFe,BRFe,gPFd,gTFd,BRFd,            & 
& gPhh,gThh,BRhh,gPFv,gTFv,BRFv,gPVZ,gTVZ,BRVZ,gPVZR,gTVZR,BRVZR,gPdeltaRpp,             & 
& gTdeltaRpp,BRdeltaRpp,gPHpm,gTHpm,BRHpm,gPAh,gTAh,BRAh,gPVWLm,gTVWLm,BRVWLm,           & 
& gPVWRm,gTVWRm,BRVWRm)

Real(dp), Intent(in) :: epsI, deltaM, fac3 
Integer, Intent(inout) :: kont 
Logical, Intent(in) :: CTBD 
Real(dp),Intent(in) :: gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,ALP3,ALP2,LAM4,LAM2,LAM3,LAMT1,LAMT2,M1,             & 
& M23,mu32,MU22,MU12

Complex(dp),Intent(in) :: YDR(3,3),YL1(3,3),YQ1(3,3),YL2(3,3),YQ2(3,3)

Real(dp),Intent(in) :: MAh(3),MAh2(3),MdeltaRpp,MdeltaRpp2,MFc(3),MFc2(3),MFcp(2),MFcp2(2),MFcpp,            & 
& MFcpp2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),Mhh(3),             & 
& Mhh2(3),MHpm(3),MHpm2(3),MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,           & 
& TW,UC(3,3),UP(3,3),ZH(3,3)

Complex(dp),Intent(in) :: phaT,UV(6,6),ZDR(3,3),ZER(3,3),UT(3,3),UTE(2,2),ZUR(3,3),ZDL(3,3),ZEL(3,3),           & 
& VTE(2,2),ZUL(3,3),ZW(4,4),ZZ(3,3)

Real(dp),Intent(in) :: vd,vu,vR

Real(dp),Intent(inout) :: gPFu(3,336),gTFu(3),BRFu(3,336),gPFe(3,393),gTFe(3),BRFe(3,393),gPFd(3,336),          & 
& gTFd(3),BRFd(3,336),gPhh(3,81),gThh(3),BRhh(3,81),gPFv(6,558),gTFv(6),BRFv(6,558),     & 
& gPVZ(1,75),gTVZ,BRVZ(1,75),gPVZR(1,75),gTVZR,BRVZR(1,75),gPdeltaRpp(1,23),             & 
& gTdeltaRpp,BRdeltaRpp(1,23),gPHpm(3,56),gTHpm(3),BRHpm(3,56),gPAh(3,73),               & 
& gTAh(3),BRAh(3,73),gPVWLm(1,55),gTVWLm,BRVWLm(1,55),gPVWRm(1,55),gTVWRm,               & 
& BRVWRm(1,55)

Complex(dp) :: cplHiggsPP(3),cplHiggsGG(3),cplPseudoHiggsPP(3),cplPseudoHiggsGG(3),cplHiggsZZvirt(3),& 
& cplHiggsWWvirt(3)

Real(dp) :: gFuFuFcFc(3,3,3,3),gFuFucFcpFcp(3,3,2,2),gFuFucFdFd(3,3,3,3),gFuFucFeFe(3,3,3,3),     & 
& gFuFucFuFu(3,3,3,3),gFuFuFvFv(3,3,6,6),gFuFdFcpFc(3,3,2,3),gFuFdcFcpFcpp(3,3,2,1),     & 
& gFuFdFvFe(3,3,6,3),gFuFucFcppFcpp(3,3,1,1),gFeFeFcFc(3,3,3,3),gFeFecFcpFcp(3,3,2,2),   & 
& gFeFecFdFd(3,3,3,3),gFeFecFeFe(3,3,3,3),gFeFecFuFu(3,3,3,3),gFeFeFvFv(3,3,6,6),        & 
& gFecFeFcppFc(3,3,1,3),gFecFeFcpFcp(3,3,2,2),gFeFecFcppFcpp(3,3,1,1),gFeFvFcpFc(3,6,2,3),& 
& gFeFvcFcpFcpp(3,6,2,1),gFeFvcFdFu(3,6,3,3),gFdFdFcFc(3,3,3,3),gFdFdcFcpFcp(3,3,2,2),   & 
& gFdFdcFdFd(3,3,3,3),gFdFdcFeFe(3,3,3,3),gFdFdcFuFu(3,3,3,3),gFdFdFvFv(3,3,6,6),        & 
& gFdFdcFcppFcpp(3,3,1,1),gFdFucFcpFc(3,3,2,3),gFdFucFcppFcp(3,3,1,2),gFdFucFeFv(3,3,3,6),& 
& gFvFvFcFc(6,6,3,3),gFvFvcFcpFcp(6,6,2,2),gFvFvcFdFd(6,6,3,3),gFvFvcFeFe(6,6,3,3),      & 
& gFvFvcFuFu(6,6,3,3),gFvFvFvFv(6,6,6,6),gFvFecFcpFc(6,3,2,3),gFvFecFcppFcp(6,3,1,2),    & 
& gFvFecFuFd(6,3,3,3),gFvFvcFcppFcpp(6,6,1,1)

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
Call FuTwoBodyDecay(-1,DeltaM,MAh,MAh2,MdeltaRpp,MdeltaRpp2,MFc,MFc2,MFcp,            & 
& MFcp2,MFcpp,MFcpp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,            & 
& MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,phaT,PhiW,UV,TW,UC,ZDR,ZER,              & 
& UP,UT,UTE,ZUR,ZDL,ZEL,VTE,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,               & 
& ALP3,ALP2,LAM4,LAM2,LAM3,LAMT1,YDR,YL1,YQ1,LAMT2,YL2,YQ2,M1,M23,mu32,MU22,             & 
& MU12,vd,vu,vR,gPFu(:,1:27),gTFu,BRFu(:,1:27))

Do i1=1,3
gTFu(i1) =Sum(gPFu(i1,:)) 
If (gTFu(i1).Gt.0._dp) BRFu(i1,: ) =gPFu(i1,:)/gTFu(i1) 
End Do 
 

gPFe = 0._dp 
gTFe = 0._dp 
BRFe = 0._dp 
Call FeTwoBodyDecay(-1,DeltaM,MAh,MAh2,MdeltaRpp,MdeltaRpp2,MFc,MFc2,MFcp,            & 
& MFcp2,MFcpp,MFcpp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,            & 
& MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,phaT,PhiW,UV,TW,UC,ZDR,ZER,              & 
& UP,UT,UTE,ZUR,ZDL,ZEL,VTE,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,               & 
& ALP3,ALP2,LAM4,LAM2,LAM3,LAMT1,YDR,YL1,YQ1,LAMT2,YL2,YQ2,M1,M23,mu32,MU22,             & 
& MU12,vd,vu,vR,gPFe(:,1:39),gTFe,BRFe(:,1:39))

Do i1=1,3
gTFe(i1) =Sum(gPFe(i1,:)) 
If (gTFe(i1).Gt.0._dp) BRFe(i1,: ) =gPFe(i1,:)/gTFe(i1) 
End Do 
 

gPFd = 0._dp 
gTFd = 0._dp 
BRFd = 0._dp 
Call FdTwoBodyDecay(-1,DeltaM,MAh,MAh2,MdeltaRpp,MdeltaRpp2,MFc,MFc2,MFcp,            & 
& MFcp2,MFcpp,MFcpp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,            & 
& MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,phaT,PhiW,UV,TW,UC,ZDR,ZER,              & 
& UP,UT,UTE,ZUR,ZDL,ZEL,VTE,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,               & 
& ALP3,ALP2,LAM4,LAM2,LAM3,LAMT1,YDR,YL1,YQ1,LAMT2,YL2,YQ2,M1,M23,mu32,MU22,             & 
& MU12,vd,vu,vR,gPFd(:,1:27),gTFd,BRFd(:,1:27))

Do i1=1,3
gTFd(i1) =Sum(gPFd(i1,:)) 
If (gTFd(i1).Gt.0._dp) BRFd(i1,: ) =gPFd(i1,:)/gTFd(i1) 
End Do 
 

gPhh = 0._dp 
gThh = 0._dp 
BRhh = 0._dp 
Call hhTwoBodyDecay(-1,DeltaM,MAh,MAh2,MdeltaRpp,MdeltaRpp2,MFc,MFc2,MFcp,            & 
& MFcp2,MFcpp,MFcpp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,            & 
& MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,phaT,PhiW,UV,TW,UC,ZDR,ZER,              & 
& UP,UT,UTE,ZUR,ZDL,ZEL,VTE,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,               & 
& ALP3,ALP2,LAM4,LAM2,LAM3,LAMT1,YDR,YL1,YQ1,LAMT2,YL2,YQ2,M1,M23,mu32,MU22,             & 
& MU12,vd,vu,vR,gPhh,gThh,BRhh)

gPFv = 0._dp 
gTFv = 0._dp 
BRFv = 0._dp 
Call FvTwoBodyDecay(-1,DeltaM,MAh,MAh2,MdeltaRpp,MdeltaRpp2,MFc,MFc2,MFcp,            & 
& MFcp2,MFcpp,MFcpp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,            & 
& MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,phaT,PhiW,UV,TW,UC,ZDR,ZER,              & 
& UP,UT,UTE,ZUR,ZDL,ZEL,VTE,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,               & 
& ALP3,ALP2,LAM4,LAM2,LAM3,LAMT1,YDR,YL1,YQ1,LAMT2,YL2,YQ2,M1,M23,mu32,MU22,             & 
& MU12,vd,vu,vR,gPFv(:,1:45),gTFv,BRFv(:,1:45))

Do i1=1,6
gTFv(i1) =Sum(gPFv(i1,:)) 
If (gTFv(i1).Gt.0._dp) BRFv(i1,: ) =gPFv(i1,:)/gTFv(i1) 
End Do 
 

gPVZ = 0._dp 
gTVZ = 0._dp 
BRVZ = 0._dp 
Call VZTwoBodyDecay(-1,DeltaM,MAh,MAh2,MdeltaRpp,MdeltaRpp2,MFc,MFc2,MFcp,            & 
& MFcp2,MFcpp,MFcpp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,            & 
& MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,phaT,PhiW,UV,TW,UC,ZDR,ZER,              & 
& UP,UT,UTE,ZUR,ZDL,ZEL,VTE,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,               & 
& ALP3,ALP2,LAM4,LAM2,LAM3,LAMT1,YDR,YL1,YQ1,LAMT2,YL2,YQ2,M1,M23,mu32,MU22,             & 
& MU12,vd,vu,vR,gPVZ,gTVZ,BRVZ)

! Set Goldstone Widhts 
gTAh(1)=gTVZ


gPVZR = 0._dp 
gTVZR = 0._dp 
BRVZR = 0._dp 
Call VZRTwoBodyDecay(-1,DeltaM,MAh,MAh2,MdeltaRpp,MdeltaRpp2,MFc,MFc2,MFcp,           & 
& MFcp2,MFcpp,MFcpp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,            & 
& MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,phaT,PhiW,UV,TW,UC,ZDR,ZER,              & 
& UP,UT,UTE,ZUR,ZDL,ZEL,VTE,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,               & 
& ALP3,ALP2,LAM4,LAM2,LAM3,LAMT1,YDR,YL1,YQ1,LAMT2,YL2,YQ2,M1,M23,mu32,MU22,             & 
& MU12,vd,vu,vR,gPVZR,gTVZR,BRVZR)

! Set Goldstone Widhts 
gTAh(2)=gTVZR


gPdeltaRpp = 0._dp 
gTdeltaRpp = 0._dp 
BRdeltaRpp = 0._dp 
Call deltaRppTwoBodyDecay(-1,DeltaM,MAh,MAh2,MdeltaRpp,MdeltaRpp2,MFc,MFc2,           & 
& MFcp,MFcp2,MFcpp,MFcpp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,             & 
& MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,phaT,PhiW,UV,TW,UC,ZDR,            & 
& ZER,UP,UT,UTE,ZUR,ZDL,ZEL,VTE,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,           & 
& ALP3,ALP2,LAM4,LAM2,LAM3,LAMT1,YDR,YL1,YQ1,LAMT2,YL2,YQ2,M1,M23,mu32,MU22,             & 
& MU12,vd,vu,vR,gPdeltaRpp,gTdeltaRpp,BRdeltaRpp)

gPHpm = 0._dp 
gTHpm = 0._dp 
BRHpm = 0._dp 
Call HpmTwoBodyDecay(-1,DeltaM,MAh,MAh2,MdeltaRpp,MdeltaRpp2,MFc,MFc2,MFcp,           & 
& MFcp2,MFcpp,MFcpp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,            & 
& MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,phaT,PhiW,UV,TW,UC,ZDR,ZER,              & 
& UP,UT,UTE,ZUR,ZDL,ZEL,VTE,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,               & 
& ALP3,ALP2,LAM4,LAM2,LAM3,LAMT1,YDR,YL1,YQ1,LAMT2,YL2,YQ2,M1,M23,mu32,MU22,             & 
& MU12,vd,vu,vR,gPHpm,gTHpm,BRHpm)

! Set Goldstone Widhts 
gTHpm(1)=gTVWLm
gTHpm(2)=gTVWRm


gPAh = 0._dp 
gTAh = 0._dp 
BRAh = 0._dp 
Call AhTwoBodyDecay(-1,DeltaM,MAh,MAh2,MdeltaRpp,MdeltaRpp2,MFc,MFc2,MFcp,            & 
& MFcp2,MFcpp,MFcpp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,            & 
& MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,phaT,PhiW,UV,TW,UC,ZDR,ZER,              & 
& UP,UT,UTE,ZUR,ZDL,ZEL,VTE,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,               & 
& ALP3,ALP2,LAM4,LAM2,LAM3,LAMT1,YDR,YL1,YQ1,LAMT2,YL2,YQ2,M1,M23,mu32,MU22,             & 
& MU12,vd,vu,vR,gPAh,gTAh,BRAh)

! Set Goldstone Widhts 
gTAh(1)=gTVZ
gTAh(2)=gTVZR


gPVWLm = 0._dp 
gTVWLm = 0._dp 
BRVWLm = 0._dp 
Call VWLmTwoBodyDecay(-1,DeltaM,MAh,MAh2,MdeltaRpp,MdeltaRpp2,MFc,MFc2,               & 
& MFcp,MFcp2,MFcpp,MFcpp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,             & 
& MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,phaT,PhiW,UV,TW,UC,ZDR,            & 
& ZER,UP,UT,UTE,ZUR,ZDL,ZEL,VTE,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,           & 
& ALP3,ALP2,LAM4,LAM2,LAM3,LAMT1,YDR,YL1,YQ1,LAMT2,YL2,YQ2,M1,M23,mu32,MU22,             & 
& MU12,vd,vu,vR,gPVWLm,gTVWLm,BRVWLm)

! Set Goldstone Widhts 
gTHpm(1)=gTVWLm


gPVWRm = 0._dp 
gTVWRm = 0._dp 
BRVWRm = 0._dp 
Call VWRmTwoBodyDecay(-1,DeltaM,MAh,MAh2,MdeltaRpp,MdeltaRpp2,MFc,MFc2,               & 
& MFcp,MFcp2,MFcpp,MFcpp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,             & 
& MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,phaT,PhiW,UV,TW,UC,ZDR,            & 
& ZER,UP,UT,UTE,ZUR,ZDL,ZEL,VTE,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,           & 
& ALP3,ALP2,LAM4,LAM2,LAM3,LAMT1,YDR,YL1,YQ1,LAMT2,YL2,YQ2,M1,M23,mu32,MU22,             & 
& MU12,vd,vu,vR,gPVWRm,gTVWRm,BRVWRm)

! Set Goldstone Widhts 
gTHpm(2)=gTVWRm


If (.Not.CTBD) Then 
If (Enable3BDecaysF) Then 
If (MaxVal(gTFu).Lt.MaxVal(fac3*Abs(MFu))) Then 
Call FuThreeBodyDecay(-1,MAh,MAh2,MdeltaRpp,MdeltaRpp2,MFc,MFc2,MFcp,MFcp2,           & 
& MFcpp,MFcpp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MVWLm,            & 
& MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,phaT,PhiW,UV,TW,UC,ZDR,ZER,UP,UT,              & 
& UTE,ZUR,ZDL,ZEL,VTE,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,ALP3,ALP2,           & 
& LAM4,LAM2,LAM3,LAMT1,YDR,YL1,YQ1,LAMT2,YL2,YQ2,M1,M23,mu32,MU22,MU12,vd,               & 
& vu,vR,gTAh,gThh,gTHpm,gTVWLm,gTVWRm,gTVZ,gTVZR,gFuFuFcFc,gFuFucFcpFcp,gFuFucFdFd,      & 
& gFuFucFeFe,gFuFucFuFu,gFuFuFvFv,gFuFdFcpFc,gFuFdcFcpFcpp,gFuFdFvFe,gFuFucFcppFcpp,     & 
& epsI,deltaM,.False.,gTFu,gPFu(:,28:336),BRFu(:,28:336))

Else 
Call FuThreeBodyDecay(-1,MAh,MAh2,MdeltaRpp,MdeltaRpp2,MFc,MFc2,MFcp,MFcp2,           & 
& MFcpp,MFcpp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MVWLm,            & 
& MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,phaT,PhiW,UV,TW,UC,ZDR,ZER,UP,UT,              & 
& UTE,ZUR,ZDL,ZEL,VTE,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,ALP3,ALP2,           & 
& LAM4,LAM2,LAM3,LAMT1,YDR,YL1,YQ1,LAMT2,YL2,YQ2,M1,M23,mu32,MU22,MU12,vd,               & 
& vu,vR,gTAh,gThh,gTHpm,gTVWLm,gTVWRm,gTVZ,gTVZR,gFuFuFcFc,gFuFucFcpFcp,gFuFucFdFd,      & 
& gFuFucFeFe,gFuFucFuFu,gFuFuFvFv,gFuFdFcpFc,gFuFdcFcpFcpp,gFuFdFvFe,gFuFucFcppFcpp,     & 
& epsI,deltaM,.True.,gTFu,gPFu(:,28:336),BRFu(:,28:336))

End If 
 
End If 
Else 
Call FuThreeBodyDecay(-1,MAh,MAh2,MdeltaRpp,MdeltaRpp2,MFc,MFc2,MFcp,MFcp2,           & 
& MFcpp,MFcpp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MVWLm,            & 
& MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,phaT,PhiW,UV,TW,UC,ZDR,ZER,UP,UT,              & 
& UTE,ZUR,ZDL,ZEL,VTE,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,ALP3,ALP2,           & 
& LAM4,LAM2,LAM3,LAMT1,YDR,YL1,YQ1,LAMT2,YL2,YQ2,M1,M23,mu32,MU22,MU12,vd,               & 
& vu,vR,gTAh,gThh,gTHpm,gTVWLm,gTVWRm,gTVZ,gTVZR,gFuFuFcFc,gFuFucFcpFcp,gFuFucFdFd,      & 
& gFuFucFeFe,gFuFucFuFu,gFuFuFvFv,gFuFdFcpFc,gFuFdcFcpFcpp,gFuFdFvFe,gFuFucFcppFcpp,     & 
& epsI,deltaM,.False.,gTFu,gPFu(:,28:336),BRFu(:,28:336))

End If 
Do i1=1,3
gTFu(i1) =Sum(gPFu(i1,:)) 
If (gTFu(i1).Gt.0._dp) BRFu(i1,: ) =gPFu(i1,:)/gTFu(i1) 
End Do 
 

If (.Not.CTBD) Then 
If (Enable3BDecaysF) Then 
If (MaxVal(gTFe).Lt.MaxVal(fac3*Abs(MFe))) Then 
Call FeThreeBodyDecay(-1,MAh,MAh2,MdeltaRpp,MdeltaRpp2,MFc,MFc2,MFcp,MFcp2,           & 
& MFcpp,MFcpp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MVWLm,            & 
& MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,phaT,PhiW,UV,TW,UC,ZDR,ZER,UP,UT,              & 
& UTE,ZUR,ZDL,ZEL,VTE,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,ALP3,ALP2,           & 
& LAM4,LAM2,LAM3,LAMT1,YDR,YL1,YQ1,LAMT2,YL2,YQ2,M1,M23,mu32,MU22,MU12,vd,               & 
& vu,vR,gTAh,gTdeltaRpp,gThh,gTHpm,gTVWLm,gTVWRm,gTVZ,gTVZR,gFeFeFcFc,gFeFecFcpFcp,      & 
& gFeFecFdFd,gFeFecFeFe,gFeFecFuFu,gFeFeFvFv,gFecFeFcppFc,gFecFeFcpFcp,gFeFecFcppFcpp,   & 
& gFeFvFcpFc,gFeFvcFcpFcpp,gFeFvcFdFu,epsI,deltaM,.False.,gTFe,gPFe(:,40:393)            & 
& ,BRFe(:,40:393))

Else 
Call FeThreeBodyDecay(-1,MAh,MAh2,MdeltaRpp,MdeltaRpp2,MFc,MFc2,MFcp,MFcp2,           & 
& MFcpp,MFcpp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MVWLm,            & 
& MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,phaT,PhiW,UV,TW,UC,ZDR,ZER,UP,UT,              & 
& UTE,ZUR,ZDL,ZEL,VTE,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,ALP3,ALP2,           & 
& LAM4,LAM2,LAM3,LAMT1,YDR,YL1,YQ1,LAMT2,YL2,YQ2,M1,M23,mu32,MU22,MU12,vd,               & 
& vu,vR,gTAh,gTdeltaRpp,gThh,gTHpm,gTVWLm,gTVWRm,gTVZ,gTVZR,gFeFeFcFc,gFeFecFcpFcp,      & 
& gFeFecFdFd,gFeFecFeFe,gFeFecFuFu,gFeFeFvFv,gFecFeFcppFc,gFecFeFcpFcp,gFeFecFcppFcpp,   & 
& gFeFvFcpFc,gFeFvcFcpFcpp,gFeFvcFdFu,epsI,deltaM,.True.,gTFe,gPFe(:,40:393)             & 
& ,BRFe(:,40:393))

End If 
 
End If 
Else 
Call FeThreeBodyDecay(-1,MAh,MAh2,MdeltaRpp,MdeltaRpp2,MFc,MFc2,MFcp,MFcp2,           & 
& MFcpp,MFcpp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MVWLm,            & 
& MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,phaT,PhiW,UV,TW,UC,ZDR,ZER,UP,UT,              & 
& UTE,ZUR,ZDL,ZEL,VTE,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,ALP3,ALP2,           & 
& LAM4,LAM2,LAM3,LAMT1,YDR,YL1,YQ1,LAMT2,YL2,YQ2,M1,M23,mu32,MU22,MU12,vd,               & 
& vu,vR,gTAh,gTdeltaRpp,gThh,gTHpm,gTVWLm,gTVWRm,gTVZ,gTVZR,gFeFeFcFc,gFeFecFcpFcp,      & 
& gFeFecFdFd,gFeFecFeFe,gFeFecFuFu,gFeFeFvFv,gFecFeFcppFc,gFecFeFcpFcp,gFeFecFcppFcpp,   & 
& gFeFvFcpFc,gFeFvcFcpFcpp,gFeFvcFdFu,epsI,deltaM,.False.,gTFe,gPFe(:,40:393)            & 
& ,BRFe(:,40:393))

End If 
Do i1=1,3
gTFe(i1) =Sum(gPFe(i1,:)) 
If (gTFe(i1).Gt.0._dp) BRFe(i1,: ) =gPFe(i1,:)/gTFe(i1) 
End Do 
 

If (.Not.CTBD) Then 
If (Enable3BDecaysF) Then 
If (MaxVal(gTFd).Lt.MaxVal(fac3*Abs(MFd))) Then 
Call FdThreeBodyDecay(-1,MAh,MAh2,MdeltaRpp,MdeltaRpp2,MFc,MFc2,MFcp,MFcp2,           & 
& MFcpp,MFcpp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MVWLm,            & 
& MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,phaT,PhiW,UV,TW,UC,ZDR,ZER,UP,UT,              & 
& UTE,ZUR,ZDL,ZEL,VTE,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,ALP3,ALP2,           & 
& LAM4,LAM2,LAM3,LAMT1,YDR,YL1,YQ1,LAMT2,YL2,YQ2,M1,M23,mu32,MU22,MU12,vd,               & 
& vu,vR,gTAh,gThh,gTHpm,gTVWLm,gTVWRm,gTVZ,gTVZR,gFdFdFcFc,gFdFdcFcpFcp,gFdFdcFdFd,      & 
& gFdFdcFeFe,gFdFdcFuFu,gFdFdFvFv,gFdFdcFcppFcpp,gFdFucFcpFc,gFdFucFcppFcp,              & 
& gFdFucFeFv,epsI,deltaM,.False.,gTFd,gPFd(:,28:336),BRFd(:,28:336))

Else 
Call FdThreeBodyDecay(-1,MAh,MAh2,MdeltaRpp,MdeltaRpp2,MFc,MFc2,MFcp,MFcp2,           & 
& MFcpp,MFcpp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MVWLm,            & 
& MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,phaT,PhiW,UV,TW,UC,ZDR,ZER,UP,UT,              & 
& UTE,ZUR,ZDL,ZEL,VTE,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,ALP3,ALP2,           & 
& LAM4,LAM2,LAM3,LAMT1,YDR,YL1,YQ1,LAMT2,YL2,YQ2,M1,M23,mu32,MU22,MU12,vd,               & 
& vu,vR,gTAh,gThh,gTHpm,gTVWLm,gTVWRm,gTVZ,gTVZR,gFdFdFcFc,gFdFdcFcpFcp,gFdFdcFdFd,      & 
& gFdFdcFeFe,gFdFdcFuFu,gFdFdFvFv,gFdFdcFcppFcpp,gFdFucFcpFc,gFdFucFcppFcp,              & 
& gFdFucFeFv,epsI,deltaM,.True.,gTFd,gPFd(:,28:336),BRFd(:,28:336))

End If 
 
End If 
Else 
Call FdThreeBodyDecay(-1,MAh,MAh2,MdeltaRpp,MdeltaRpp2,MFc,MFc2,MFcp,MFcp2,           & 
& MFcpp,MFcpp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MVWLm,            & 
& MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,phaT,PhiW,UV,TW,UC,ZDR,ZER,UP,UT,              & 
& UTE,ZUR,ZDL,ZEL,VTE,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,ALP3,ALP2,           & 
& LAM4,LAM2,LAM3,LAMT1,YDR,YL1,YQ1,LAMT2,YL2,YQ2,M1,M23,mu32,MU22,MU12,vd,               & 
& vu,vR,gTAh,gThh,gTHpm,gTVWLm,gTVWRm,gTVZ,gTVZR,gFdFdFcFc,gFdFdcFcpFcp,gFdFdcFdFd,      & 
& gFdFdcFeFe,gFdFdcFuFu,gFdFdFvFv,gFdFdcFcppFcpp,gFdFucFcpFc,gFdFucFcppFcp,              & 
& gFdFucFeFv,epsI,deltaM,.False.,gTFd,gPFd(:,28:336),BRFd(:,28:336))

End If 
Do i1=1,3
gTFd(i1) =Sum(gPFd(i1,:)) 
If (gTFd(i1).Gt.0._dp) BRFd(i1,: ) =gPFd(i1,:)/gTFd(i1) 
End Do 
 

! No 3-body decays for hh  
If (.Not.CTBD) Then 
If (Enable3BDecaysF) Then 
If (MaxVal(gTFv).Lt.MaxVal(fac3*Abs(MFv))) Then 
Call FvThreeBodyDecay(-1,MAh,MAh2,MdeltaRpp,MdeltaRpp2,MFc,MFc2,MFcp,MFcp2,           & 
& MFcpp,MFcpp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MVWLm,            & 
& MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,phaT,PhiW,UV,TW,UC,ZDR,ZER,UP,UT,              & 
& UTE,ZUR,ZDL,ZEL,VTE,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,ALP3,ALP2,           & 
& LAM4,LAM2,LAM3,LAMT1,YDR,YL1,YQ1,LAMT2,YL2,YQ2,M1,M23,mu32,MU22,MU12,vd,               & 
& vu,vR,gTAh,gThh,gTHpm,gTVWLm,gTVWRm,gTVZ,gTVZR,gFvFvFcFc,gFvFvcFcpFcp,gFvFvcFdFd,      & 
& gFvFvcFeFe,gFvFvcFuFu,gFvFvFvFv,gFvFecFcpFc,gFvFecFcppFcp,gFvFecFuFd,gFvFvcFcppFcpp,   & 
& epsI,deltaM,.False.,gTFv,gPFv(:,46:558),BRFv(:,46:558))

Else 
Call FvThreeBodyDecay(-1,MAh,MAh2,MdeltaRpp,MdeltaRpp2,MFc,MFc2,MFcp,MFcp2,           & 
& MFcpp,MFcpp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MVWLm,            & 
& MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,phaT,PhiW,UV,TW,UC,ZDR,ZER,UP,UT,              & 
& UTE,ZUR,ZDL,ZEL,VTE,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,ALP3,ALP2,           & 
& LAM4,LAM2,LAM3,LAMT1,YDR,YL1,YQ1,LAMT2,YL2,YQ2,M1,M23,mu32,MU22,MU12,vd,               & 
& vu,vR,gTAh,gThh,gTHpm,gTVWLm,gTVWRm,gTVZ,gTVZR,gFvFvFcFc,gFvFvcFcpFcp,gFvFvcFdFd,      & 
& gFvFvcFeFe,gFvFvcFuFu,gFvFvFvFv,gFvFecFcpFc,gFvFecFcppFcp,gFvFecFuFd,gFvFvcFcppFcpp,   & 
& epsI,deltaM,.True.,gTFv,gPFv(:,46:558),BRFv(:,46:558))

End If 
 
End If 
Else 
Call FvThreeBodyDecay(-1,MAh,MAh2,MdeltaRpp,MdeltaRpp2,MFc,MFc2,MFcp,MFcp2,           & 
& MFcpp,MFcpp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MVWLm,            & 
& MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,phaT,PhiW,UV,TW,UC,ZDR,ZER,UP,UT,              & 
& UTE,ZUR,ZDL,ZEL,VTE,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,ALP3,ALP2,           & 
& LAM4,LAM2,LAM3,LAMT1,YDR,YL1,YQ1,LAMT2,YL2,YQ2,M1,M23,mu32,MU22,MU12,vd,               & 
& vu,vR,gTAh,gThh,gTHpm,gTVWLm,gTVWRm,gTVZ,gTVZR,gFvFvFcFc,gFvFvcFcpFcp,gFvFvcFdFd,      & 
& gFvFvcFeFe,gFvFvcFuFu,gFvFvFvFv,gFvFecFcpFc,gFvFecFcppFcp,gFvFecFuFd,gFvFvcFcppFcpp,   & 
& epsI,deltaM,.False.,gTFv,gPFv(:,46:558),BRFv(:,46:558))

End If 
Do i1=1,6
gTFv(i1) =Sum(gPFv(i1,:)) 
If (gTFv(i1).Gt.0._dp) BRFv(i1,: ) =gPFv(i1,:)/gTFv(i1) 
End Do 
 

! No 3-body decays for VZ  
! No 3-body decays for VZR  
! No 3-body decays for deltaRpp  
! No 3-body decays for Hpm  
! No 3-body decays for Ah  
! No 3-body decays for VWLm  
! No 3-body decays for VWRm  
Iname = Iname - 1 
 
End Subroutine CalculateBR 
End Module BranchingRatios_tripletLR 
 
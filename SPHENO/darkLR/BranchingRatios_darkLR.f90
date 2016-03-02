! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.7.0 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 20:18 on 1.3.2016   
! ----------------------------------------------------------------------  
 
 
Module BranchingRatios_darkLR 
 
Use Control 
Use Couplings_darkLR 
Use Model_Data_darkLR 
Use LoopCouplings_darkLR 
Use Fu3Decays_darkLR 
Use Fe3Decays_darkLR 
Use Fd3Decays_darkLR 
Use Fv3Decays_darkLR 
Use SUSYDecays_darkLR 
 
Contains 
 
Subroutine CalculateBR(CTBD,fac3,epsI,deltaM,kont,MAh,MAh2,MFd,MFd2,MFe,              & 
& MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,          & 
& MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,               & 
& ZH,ZW,ZZ,v1,v2,vhl,vtl,vhr,vtr,gBL,g2,gR,g3,alp,RHO2,RHO1,rh3,ALP3,ALP1,               & 
& LAM1,etall,etalr,laml,lamlr,betl,err2,etarl,etarr,lamr,betr,err1,BETA2,LAM3,           & 
& YQ2,YDR,YL1,yq3,YDL,YQ1,xiLR,xiR,mudl2,mudr2,MU12,mul2,mur2,gPFu,gTFu,BRFu,            & 
& gPFe,gTFe,BRFe,gPFd,gTFd,BRFd,gPhh,gThh,BRhh,gPFv,gTFv,BRFv,gPVZ,gTVZ,BRVZ,            & 
& gPVZR,gTVZR,BRVZR,gPHppmm,gTHppmm,BRHppmm,gPHpm,gTHpm,BRHpm,gPAh,gTAh,BRAh,            & 
& gPVWLm,gTVWLm,BRVWLm,gPVWRm,gTVWRm,BRVWRm)

Real(dp), Intent(in) :: epsI, deltaM, fac3 
Integer, Intent(inout) :: kont 
Logical, Intent(in) :: CTBD 
Real(dp),Intent(in) :: gBL,g2,gR,g3,alp,RHO2,RHO1,ALP3,ALP1,LAM1,BETA2,LAM3,xiLR,xiR,MU12

Complex(dp),Intent(in) :: rh3,etall,etalr,laml,lamlr,betl,err2,etarl,etarr,lamr,betr,err1,YQ2(3,3),             & 
& YDR(3,3),YL1(3,3),yq3(3,3),YDL(3,3),YQ1(3,3),mudl2,mudr2,mul2,mur2

Real(dp),Intent(in) :: MAh(6),MAh2(6),MFd(6),MFd2(6),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),           & 
& Mhh(6),Mhh2(6),MHpm(6),MHpm2(6),MHppmm(2),MHppmm2(2),MVWLm,MVWLm2,MVWRm,               & 
& MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,TW,UC(6,6),UCC(2,2),UP(6,6),ZH(6,6)

Complex(dp),Intent(in) :: UV(6,6),ZDR(6,6),ZER(3,3),ZUR(3,3),ZDL(6,6),ZEL(3,3),ZUL(3,3),ZW(4,4),ZZ(3,3)

Real(dp),Intent(in) :: v1,v2,vhl,vtl,vhr,vtr

Real(dp),Intent(inout) :: gPFu(3,342),gTFu(3),BRFu(3,342),gPFe(3,312),gTFe(3),BRFe(3,312),gPFd(6,630),          & 
& gTFd(6),BRFd(6,630),gPhh(6,152),gThh(6),BRhh(6,152),gPFv(6,612),gTFv(6),               & 
& BRFv(6,612),gPVZ(1,142),gTVZ,BRVZ(1,142),gPVZR(1,142),gTVZR,BRVZR(1,142),              & 
& gPHppmm(2,51),gTHppmm(2),BRHppmm(2,51),gPHpm(6,102),gTHpm(6),BRHpm(6,102),             & 
& gPAh(6,142),gTAh(6),BRAh(6,142),gPVWLm(1,98),gTVWLm,BRVWLm(1,98),gPVWRm(1,98),         & 
& gTVWRm,BRVWRm(1,98)

Complex(dp) :: cplHiggsPP(6),cplHiggsGG(6),cplPseudoHiggsPP(6),cplPseudoHiggsGG(6),cplHiggsZZvirt(6),& 
& cplHiggsWWvirt(6)

Real(dp) :: gFuFucFdFd(3,3,6,6),gFuFucFeFe(3,3,3,3),gFuFucFuFu(3,3,3,3),gFuFuFvFv(3,3,6,6),       & 
& gFeFecFdFd(3,3,6,6),gFeFecFeFe(3,3,3,3),gFeFecFuFu(3,3,3,3),gFeFeFvFv(3,3,6,6),        & 
& gFdFdcFdFd(6,6,6,6),gFdFdcFeFe(6,6,3,3),gFdFdcFuFu(6,6,3,3),gFdFdFvFv(6,6,6,6),        & 
& gFvFvcFdFd(6,6,6,6),gFvFvcFeFe(6,6,3,3),gFvFvcFuFu(6,6,3,3),gFvFvFvFv(6,6,6,6)

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
If (.Not.CTBD) Then 
Call FuTwoBodyDecay(-1,DeltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,           & 
& Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,            & 
& MVZR2,PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,              & 
& alp,RHO2,RHO1,rh3,ALP3,ALP1,LAM1,etall,etalr,laml,lamlr,betl,err2,etarl,               & 
& etarr,lamr,betr,err1,BETA2,LAM3,YQ2,YDR,YL1,yq3,YDL,YQ1,xiLR,xiR,mudl2,mudr2,          & 
& MU12,mul2,mur2,v1,v2,vtl,vtr,vhl,vhr,gPFu(:,1:72),gTFu,BRFu(:,1:72))

If (Enable3BDecaysF) Then 
If (MaxVal(gTFu).Lt.MaxVal(fac3*Abs(MFu))) Then 
Call FuThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,            & 
& Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,          & 
& PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,alp,RHO2,           & 
& RHO1,rh3,ALP3,ALP1,LAM1,etall,etalr,laml,lamlr,betl,err2,etarl,etarr,lamr,             & 
& betr,err1,BETA2,LAM3,YQ2,YDR,YL1,yq3,YDL,YQ1,xiLR,xiR,mudl2,mudr2,MU12,mul2,           & 
& mur2,v1,v2,vtl,vtr,vhl,vhr,gTAh,gThh,gTHpm,gTVWLm,gTVWRm,gTVZ,gTVZR,gFuFucFdFd,        & 
& gFuFucFeFe,gFuFucFuFu,gFuFuFvFv,epsI,deltaM,.False.,gTFu,gPFu(:,73:342),               & 
& BRFu(:,73:342))

Else 
Call FuThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,            & 
& Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,          & 
& PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,alp,RHO2,           & 
& RHO1,rh3,ALP3,ALP1,LAM1,etall,etalr,laml,lamlr,betl,err2,etarl,etarr,lamr,             & 
& betr,err1,BETA2,LAM3,YQ2,YDR,YL1,yq3,YDL,YQ1,xiLR,xiR,mudl2,mudr2,MU12,mul2,           & 
& mur2,v1,v2,vtl,vtr,vhl,vhr,gTAh,gThh,gTHpm,gTVWLm,gTVWRm,gTVZ,gTVZR,gFuFucFdFd,        & 
& gFuFucFeFe,gFuFucFuFu,gFuFuFvFv,epsI,deltaM,.True.,gTFu,gPFu(:,73:342),BRFu(:,73:342))

End If 
 
End If 
Else 
Call FuThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,            & 
& Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,          & 
& PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,alp,RHO2,           & 
& RHO1,rh3,ALP3,ALP1,LAM1,etall,etalr,laml,lamlr,betl,err2,etarl,etarr,lamr,             & 
& betr,err1,BETA2,LAM3,YQ2,YDR,YL1,yq3,YDL,YQ1,xiLR,xiR,mudl2,mudr2,MU12,mul2,           & 
& mur2,v1,v2,vtl,vtr,vhl,vhr,gTAh,gThh,gTHpm,gTVWLm,gTVWRm,gTVZ,gTVZR,gFuFucFdFd,        & 
& gFuFucFeFe,gFuFucFuFu,gFuFuFvFv,epsI,deltaM,.False.,gTFu,gPFu(:,73:342),               & 
& BRFu(:,73:342))

End If 
Do i1=1,3
gTFu(i1) =Sum(gPFu(i1,:)) 
If (gTFu(i1).Gt.0._dp) BRFu(i1,: ) =gPFu(i1,:)/gTFu(i1) 
End Do 
 

gPFe = 0._dp 
gTFe = 0._dp 
BRFe = 0._dp 
If (.Not.CTBD) Then 
Call FeTwoBodyDecay(-1,DeltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,           & 
& Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,            & 
& MVZR2,PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,              & 
& alp,RHO2,RHO1,rh3,ALP3,ALP1,LAM1,etall,etalr,laml,lamlr,betl,err2,etarl,               & 
& etarr,lamr,betr,err1,BETA2,LAM3,YQ2,YDR,YL1,yq3,YDL,YQ1,xiLR,xiR,mudl2,mudr2,          & 
& MU12,mul2,mur2,v1,v2,vtl,vtr,vhl,vhr,gPFe(:,1:42),gTFe,BRFe(:,1:42))

If (Enable3BDecaysF) Then 
If (MaxVal(gTFe).Lt.MaxVal(fac3*Abs(MFe))) Then 
Call FeThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,            & 
& Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,          & 
& PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,alp,RHO2,           & 
& RHO1,rh3,ALP3,ALP1,LAM1,etall,etalr,laml,lamlr,betl,err2,etarl,etarr,lamr,             & 
& betr,err1,BETA2,LAM3,YQ2,YDR,YL1,yq3,YDL,YQ1,xiLR,xiR,mudl2,mudr2,MU12,mul2,           & 
& mur2,v1,v2,vtl,vtr,vhl,vhr,gTAh,gThh,gTHppmm,gTVZ,gTVZR,gFeFecFdFd,gFeFecFeFe,         & 
& gFeFecFuFu,gFeFeFvFv,epsI,deltaM,.False.,gTFe,gPFe(:,43:312),BRFe(:,43:312))

Else 
Call FeThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,            & 
& Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,          & 
& PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,alp,RHO2,           & 
& RHO1,rh3,ALP3,ALP1,LAM1,etall,etalr,laml,lamlr,betl,err2,etarl,etarr,lamr,             & 
& betr,err1,BETA2,LAM3,YQ2,YDR,YL1,yq3,YDL,YQ1,xiLR,xiR,mudl2,mudr2,MU12,mul2,           & 
& mur2,v1,v2,vtl,vtr,vhl,vhr,gTAh,gThh,gTHppmm,gTVZ,gTVZR,gFeFecFdFd,gFeFecFeFe,         & 
& gFeFecFuFu,gFeFeFvFv,epsI,deltaM,.True.,gTFe,gPFe(:,43:312),BRFe(:,43:312))

End If 
 
End If 
Else 
Call FeThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,            & 
& Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,          & 
& PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,alp,RHO2,           & 
& RHO1,rh3,ALP3,ALP1,LAM1,etall,etalr,laml,lamlr,betl,err2,etarl,etarr,lamr,             & 
& betr,err1,BETA2,LAM3,YQ2,YDR,YL1,yq3,YDL,YQ1,xiLR,xiR,mudl2,mudr2,MU12,mul2,           & 
& mur2,v1,v2,vtl,vtr,vhl,vhr,gTAh,gThh,gTHppmm,gTVZ,gTVZR,gFeFecFdFd,gFeFecFeFe,         & 
& gFeFecFuFu,gFeFeFvFv,epsI,deltaM,.False.,gTFe,gPFe(:,43:312),BRFe(:,43:312))

End If 
Do i1=1,3
gTFe(i1) =Sum(gPFe(i1,:)) 
If (gTFe(i1).Gt.0._dp) BRFe(i1,: ) =gPFe(i1,:)/gTFe(i1) 
End Do 
 

gPFd = 0._dp 
gTFd = 0._dp 
BRFd = 0._dp 
If (.Not.CTBD) Then 
Call FdTwoBodyDecay(-1,DeltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,           & 
& Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,            & 
& MVZR2,PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,              & 
& alp,RHO2,RHO1,rh3,ALP3,ALP1,LAM1,etall,etalr,laml,lamlr,betl,err2,etarl,               & 
& etarr,lamr,betr,err1,BETA2,LAM3,YQ2,YDR,YL1,yq3,YDL,YQ1,xiLR,xiR,mudl2,mudr2,          & 
& MU12,mul2,mur2,v1,v2,vtl,vtr,vhl,vhr,gPFd(:,1:90),gTFd,BRFd(:,1:90))

If (Enable3BDecaysF) Then 
If (MaxVal(gTFd).Lt.MaxVal(fac3*Abs(MFd))) Then 
Call FdThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,            & 
& Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,          & 
& PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,alp,RHO2,           & 
& RHO1,rh3,ALP3,ALP1,LAM1,etall,etalr,laml,lamlr,betl,err2,etarl,etarr,lamr,             & 
& betr,err1,BETA2,LAM3,YQ2,YDR,YL1,yq3,YDL,YQ1,xiLR,xiR,mudl2,mudr2,MU12,mul2,           & 
& mur2,v1,v2,vtl,vtr,vhl,vhr,gTAh,gThh,gTHpm,gTVWLm,gTVWRm,gTVZ,gTVZR,gFdFdcFdFd,        & 
& gFdFdcFeFe,gFdFdcFuFu,gFdFdFvFv,epsI,deltaM,.False.,gTFd,gPFd(:,91:630),               & 
& BRFd(:,91:630))

Else 
Call FdThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,            & 
& Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,          & 
& PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,alp,RHO2,           & 
& RHO1,rh3,ALP3,ALP1,LAM1,etall,etalr,laml,lamlr,betl,err2,etarl,etarr,lamr,             & 
& betr,err1,BETA2,LAM3,YQ2,YDR,YL1,yq3,YDL,YQ1,xiLR,xiR,mudl2,mudr2,MU12,mul2,           & 
& mur2,v1,v2,vtl,vtr,vhl,vhr,gTAh,gThh,gTHpm,gTVWLm,gTVWRm,gTVZ,gTVZR,gFdFdcFdFd,        & 
& gFdFdcFeFe,gFdFdcFuFu,gFdFdFvFv,epsI,deltaM,.True.,gTFd,gPFd(:,91:630),BRFd(:,91:630))

End If 
 
End If 
Else 
Call FdThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,            & 
& Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,          & 
& PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,alp,RHO2,           & 
& RHO1,rh3,ALP3,ALP1,LAM1,etall,etalr,laml,lamlr,betl,err2,etarl,etarr,lamr,             & 
& betr,err1,BETA2,LAM3,YQ2,YDR,YL1,yq3,YDL,YQ1,xiLR,xiR,mudl2,mudr2,MU12,mul2,           & 
& mur2,v1,v2,vtl,vtr,vhl,vhr,gTAh,gThh,gTHpm,gTVWLm,gTVWRm,gTVZ,gTVZR,gFdFdcFdFd,        & 
& gFdFdcFeFe,gFdFdcFuFu,gFdFdFvFv,epsI,deltaM,.False.,gTFd,gPFd(:,91:630),               & 
& BRFd(:,91:630))

End If 
Do i1=1,6
gTFd(i1) =Sum(gPFd(i1,:)) 
If (gTFd(i1).Gt.0._dp) BRFd(i1,: ) =gPFd(i1,:)/gTFd(i1) 
End Do 
 

gPhh = 0._dp 
gThh = 0._dp 
BRhh = 0._dp 
Call hhTwoBodyDecay(-1,DeltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,           & 
& Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,            & 
& MVZR2,PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,              & 
& alp,RHO2,RHO1,rh3,ALP3,ALP1,LAM1,etall,etalr,laml,lamlr,betl,err2,etarl,               & 
& etarr,lamr,betr,err1,BETA2,LAM3,YQ2,YDR,YL1,yq3,YDL,YQ1,xiLR,xiR,mudl2,mudr2,          & 
& MU12,mul2,mur2,v1,v2,vtl,vtr,vhl,vhr,gPhh,gThh,BRhh)

gPFv = 0._dp 
gTFv = 0._dp 
BRFv = 0._dp 
If (.Not.CTBD) Then 
Call FvTwoBodyDecay(-1,DeltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,           & 
& Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,            & 
& MVZR2,PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,              & 
& alp,RHO2,RHO1,rh3,ALP3,ALP1,LAM1,etall,etalr,laml,lamlr,betl,err2,etarl,               & 
& etarr,lamr,betr,err1,BETA2,LAM3,YQ2,YDR,YL1,yq3,YDL,YQ1,xiLR,xiR,mudl2,mudr2,          & 
& MU12,mul2,mur2,v1,v2,vtl,vtr,vhl,vhr,gPFv(:,1:72),gTFv,BRFv(:,1:72))

If (Enable3BDecaysF) Then 
If (MaxVal(gTFv).Lt.MaxVal(fac3*Abs(MFv))) Then 
Call FvThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,            & 
& Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,          & 
& PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,alp,RHO2,           & 
& RHO1,rh3,ALP3,ALP1,LAM1,etall,etalr,laml,lamlr,betl,err2,etarl,etarr,lamr,             & 
& betr,err1,BETA2,LAM3,YQ2,YDR,YL1,yq3,YDL,YQ1,xiLR,xiR,mudl2,mudr2,MU12,mul2,           & 
& mur2,v1,v2,vtl,vtr,vhl,vhr,gTAh,gThh,gTVZ,gTVZR,gFvFvcFdFd,gFvFvcFeFe,gFvFvcFuFu,      & 
& gFvFvFvFv,epsI,deltaM,.False.,gTFv,gPFv(:,73:612),BRFv(:,73:612))

Else 
Call FvThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,            & 
& Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,          & 
& PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,alp,RHO2,           & 
& RHO1,rh3,ALP3,ALP1,LAM1,etall,etalr,laml,lamlr,betl,err2,etarl,etarr,lamr,             & 
& betr,err1,BETA2,LAM3,YQ2,YDR,YL1,yq3,YDL,YQ1,xiLR,xiR,mudl2,mudr2,MU12,mul2,           & 
& mur2,v1,v2,vtl,vtr,vhl,vhr,gTAh,gThh,gTVZ,gTVZR,gFvFvcFdFd,gFvFvcFeFe,gFvFvcFuFu,      & 
& gFvFvFvFv,epsI,deltaM,.True.,gTFv,gPFv(:,73:612),BRFv(:,73:612))

End If 
 
End If 
Else 
Call FvThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,            & 
& Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,          & 
& PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,alp,RHO2,           & 
& RHO1,rh3,ALP3,ALP1,LAM1,etall,etalr,laml,lamlr,betl,err2,etarl,etarr,lamr,             & 
& betr,err1,BETA2,LAM3,YQ2,YDR,YL1,yq3,YDL,YQ1,xiLR,xiR,mudl2,mudr2,MU12,mul2,           & 
& mur2,v1,v2,vtl,vtr,vhl,vhr,gTAh,gThh,gTVZ,gTVZR,gFvFvcFdFd,gFvFvcFeFe,gFvFvcFuFu,      & 
& gFvFvFvFv,epsI,deltaM,.False.,gTFv,gPFv(:,73:612),BRFv(:,73:612))

End If 
Do i1=1,6
gTFv(i1) =Sum(gPFv(i1,:)) 
If (gTFv(i1).Gt.0._dp) BRFv(i1,: ) =gPFv(i1,:)/gTFv(i1) 
End Do 
 

gPVZ = 0._dp 
gTVZ = 0._dp 
BRVZ = 0._dp 
Call VZTwoBodyDecay(-1,DeltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,           & 
& Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,            & 
& MVZR2,PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,              & 
& alp,RHO2,RHO1,rh3,ALP3,ALP1,LAM1,etall,etalr,laml,lamlr,betl,err2,etarl,               & 
& etarr,lamr,betr,err1,BETA2,LAM3,YQ2,YDR,YL1,yq3,YDL,YQ1,xiLR,xiR,mudl2,mudr2,          & 
& MU12,mul2,mur2,v1,v2,vtl,vtr,vhl,vhr,gPVZ,gTVZ,BRVZ)

! Set Goldstone Widhts 
gTAh(1)=gTVZ


gPVZR = 0._dp 
gTVZR = 0._dp 
BRVZR = 0._dp 
Call VZRTwoBodyDecay(-1,DeltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,               & 
& MFv2,Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,            & 
& MVZR,MVZR2,PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,g2,               & 
& gR,g3,alp,RHO2,RHO1,rh3,ALP3,ALP1,LAM1,etall,etalr,laml,lamlr,betl,err2,               & 
& etarl,etarr,lamr,betr,err1,BETA2,LAM3,YQ2,YDR,YL1,yq3,YDL,YQ1,xiLR,xiR,mudl2,          & 
& mudr2,MU12,mul2,mur2,v1,v2,vtl,vtr,vhl,vhr,gPVZR,gTVZR,BRVZR)

! Set Goldstone Widhts 
gTAh(2)=gTVZR


gPHppmm = 0._dp 
gTHppmm = 0._dp 
BRHppmm = 0._dp 
Call HppmmTwoBodyDecay(-1,DeltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,             & 
& MFv2,Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,            & 
& MVZR,MVZR2,PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,g2,               & 
& gR,g3,alp,RHO2,RHO1,rh3,ALP3,ALP1,LAM1,etall,etalr,laml,lamlr,betl,err2,               & 
& etarl,etarr,lamr,betr,err1,BETA2,LAM3,YQ2,YDR,YL1,yq3,YDL,YQ1,xiLR,xiR,mudl2,          & 
& mudr2,MU12,mul2,mur2,v1,v2,vtl,vtr,vhl,vhr,gPHppmm,gTHppmm,BRHppmm)

gPHpm = 0._dp 
gTHpm = 0._dp 
BRHpm = 0._dp 
Call HpmTwoBodyDecay(-1,DeltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,               & 
& MFv2,Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,            & 
& MVZR,MVZR2,PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,g2,               & 
& gR,g3,alp,RHO2,RHO1,rh3,ALP3,ALP1,LAM1,etall,etalr,laml,lamlr,betl,err2,               & 
& etarl,etarr,lamr,betr,err1,BETA2,LAM3,YQ2,YDR,YL1,yq3,YDL,YQ1,xiLR,xiR,mudl2,          & 
& mudr2,MU12,mul2,mur2,v1,v2,vtl,vtr,vhl,vhr,gPHpm,gTHpm,BRHpm)

! Set Goldstone Widhts 
gTHpm(1)=gTVWLm
gTHpm(2)=gTVWRm


gPAh = 0._dp 
gTAh = 0._dp 
BRAh = 0._dp 
Call AhTwoBodyDecay(-1,DeltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,           & 
& Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,            & 
& MVZR2,PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,              & 
& alp,RHO2,RHO1,rh3,ALP3,ALP1,LAM1,etall,etalr,laml,lamlr,betl,err2,etarl,               & 
& etarr,lamr,betr,err1,BETA2,LAM3,YQ2,YDR,YL1,yq3,YDL,YQ1,xiLR,xiR,mudl2,mudr2,          & 
& MU12,mul2,mur2,v1,v2,vtl,vtr,vhl,vhr,gPAh,gTAh,BRAh)

! Set Goldstone Widhts 
gTAh(1)=gTVZ
gTAh(2)=gTVZR


gPVWLm = 0._dp 
gTVWLm = 0._dp 
BRVWLm = 0._dp 
Call VWLmTwoBodyDecay(-1,DeltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,              & 
& MFv2,Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,            & 
& MVZR,MVZR2,PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,g2,               & 
& gR,g3,alp,RHO2,RHO1,rh3,ALP3,ALP1,LAM1,etall,etalr,laml,lamlr,betl,err2,               & 
& etarl,etarr,lamr,betr,err1,BETA2,LAM3,YQ2,YDR,YL1,yq3,YDL,YQ1,xiLR,xiR,mudl2,          & 
& mudr2,MU12,mul2,mur2,v1,v2,vtl,vtr,vhl,vhr,gPVWLm,gTVWLm,BRVWLm)

! Set Goldstone Widhts 
gTHpm(1)=gTVWLm


gPVWRm = 0._dp 
gTVWRm = 0._dp 
BRVWRm = 0._dp 
Call VWRmTwoBodyDecay(-1,DeltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,              & 
& MFv2,Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,            & 
& MVZR,MVZR2,PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,g2,               & 
& gR,g3,alp,RHO2,RHO1,rh3,ALP3,ALP1,LAM1,etall,etalr,laml,lamlr,betl,err2,               & 
& etarl,etarr,lamr,betr,err1,BETA2,LAM3,YQ2,YDR,YL1,yq3,YDL,YQ1,xiLR,xiR,mudl2,          & 
& mudr2,MU12,mul2,mur2,v1,v2,vtl,vtr,vhl,vhr,gPVWRm,gTVWRm,BRVWRm)

! Set Goldstone Widhts 
gTHpm(2)=gTVWRm


Iname = Iname - 1 
 
End Subroutine CalculateBR 
End Module BranchingRatios_darkLR 
 
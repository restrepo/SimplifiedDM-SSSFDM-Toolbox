! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.5.8 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 11:42 on 28.11.2015   
! ----------------------------------------------------------------------  
 
 
Module BranchingRatios_Scotogenic 
 
Use Control 
Use Couplings_Scotogenic 
Use Model_Data_Scotogenic 
Use LoopCouplings_Scotogenic 
Use Fu3Decays_Scotogenic 
Use Fe3Decays_Scotogenic 
Use Fd3Decays_Scotogenic 
Use SUSYDecays_Scotogenic 
 
Contains 
 
Subroutine CalculateBR(CTBD,fac3,epsI,deltaM,kont,MAh,MAh2,MChi,MChi2,MetI,           & 
& MetI2,Metp,Metp2,MetR,MetR2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,              & 
& MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZW,ZX,ZZ,v,g1,              & 
& g2,g3,lam1,lam2,lam4,lam3,lam5,Yn,Yu,Yd,Ye,Mn,mH2,mEt2,gPFu,gTFu,BRFu,gPFe,            & 
& gTFe,BRFe,gPFd,gTFd,BRFd,gPFv,gTFv,BRFv,gPVZ,gTVZ,BRVZ,gPVWp,gTVWp,BRVWp,              & 
& gPhh,gThh,BRhh,gPetR,gTetR,BRetR,gPetI,gTetI,BRetI,gPetp,gTetp,BRetp,gPChi,            & 
& gTChi,BRChi)

Real(dp), Intent(in) :: epsI, deltaM, fac3 
Integer, Intent(inout) :: kont 
Logical, Intent(in) :: CTBD 
Real(dp),Intent(in) :: g1,g2,g3,lam5

Complex(dp),Intent(in) :: lam1,lam2,lam4,lam3,Yn(3,3),Yu(3,3),Yd(3,3),Ye(3,3),Mn(3,3),mH2,mEt2

Real(dp),Intent(in) :: MAh,MAh2,MChi(3),MChi2(3),MetI,MetI2,Metp,Metp2,MetR,MetR2,MFd(3),MFd2(3),            & 
& MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(3),MFv2(3),Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,             & 
& MVZ,MVZ2,TW,ZZ(2,2)

Complex(dp),Intent(in) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),UV(3,3),ZW(2,2),ZX(3,3)

Real(dp),Intent(in) :: v

Real(dp),Intent(inout) :: gPFu(3,144),gTFu(3),BRFu(3,144),gPFe(3,174),gTFe(3),BRFe(3,174),gPFd(3,144),          & 
& gTFd(3),BRFd(3,144),gPFv(3,12),gTFv(3),BRFv(3,12),gPVZ(1,37),gTVZ,BRVZ(1,37),          & 
& gPVWp(1,22),gTVWp,BRVWp(1,22),gPhh(1,37),gThh,BRhh(1,37),gPetR(1,12),gTetR,            & 
& BRetR(1,12),gPetI(1,12),gTetI,BRetI(1,12),gPetp(1,13),gTetp,BRetp(1,13),               & 
& gPChi(3,9),gTChi(3),BRChi(3,9)

Complex(dp) :: cplHiggsPP,cplHiggsGG,cplPseudoHiggsPP,cplPseudoHiggsGG,cplHiggsZZvirt,               & 
& cplHiggsWWvirt

Real(dp) :: gTAh 
Real(dp) :: gFuFucFdFd(3,3,3,3),gFuFdcFeFv(3,3,3,3),gFuFucFeFe(3,3,3,3),gFuFucFuFu(3,3,3,3),      & 
& gFuFuFvFv(3,3,3,3),gFeChiFeChi(3,3,3,3),gFeFecFdFd(3,3,3,3),gFeFecFeFe(3,3,3,3),       & 
& gFeFecFuFu(3,3,3,3),gFeFeFvFv(3,3,3,3),gFeFvcFuFd(3,3,3,3),gFdFdcFdFd(3,3,3,3),        & 
& gFdFdcFeFe(3,3,3,3),gFdFdcFuFu(3,3,3,3),gFdFdFvFv(3,3,3,3),gFdFuFvFe(3,3,3,3)

Complex(dp) :: coup 
Real(dp) :: vev 
Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateBR'
 
Write(*,*) "Calculating branching ratios and decay widths" 
gTVWp = gamW 
gTVZ = gamZ 
gPFu = 0._dp 
gTFu = 0._dp 
BRFu = 0._dp 
If (.Not.CTBD) Then 
Call FuTwoBodyDecay(-1,DeltaM,MAh,MAh2,MChi,MChi2,MetI,MetI2,Metp,Metp2,              & 
& MetR,MetR2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,           & 
& MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZW,ZX,ZZ,g1,g2,g3,lam1,lam2,lam4,               & 
& lam3,lam5,Yn,Yu,Yd,Ye,Mn,mH2,mEt2,v,gPFu(:,1:9),gTFu,BRFu(:,1:9))

If (Enable3BDecaysF) Then 
If (MaxVal(gTFu).Lt.MaxVal(fac3*Abs(MFu))) Then 
Call FuThreeBodyDecay(-1,MAh,MAh2,MChi,MChi2,MetI,MetI2,Metp,Metp2,MetR,              & 
& MetR2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,            & 
& MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZW,ZX,ZZ,g1,g2,g3,lam1,lam2,lam4,lam3,              & 
& lam5,Yn,Yu,Yd,Ye,Mn,mH2,mEt2,v,gThh,gTVWp,gTVZ,gFuFucFdFd,gFuFdcFeFv,gFuFucFeFe,       & 
& gFuFucFuFu,gFuFuFvFv,epsI,deltaM,.False.,gTFu,gPFu(:,10:144),BRFu(:,10:144))

Else 
Call FuThreeBodyDecay(-1,MAh,MAh2,MChi,MChi2,MetI,MetI2,Metp,Metp2,MetR,              & 
& MetR2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,            & 
& MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZW,ZX,ZZ,g1,g2,g3,lam1,lam2,lam4,lam3,              & 
& lam5,Yn,Yu,Yd,Ye,Mn,mH2,mEt2,v,gThh,gTVWp,gTVZ,gFuFucFdFd,gFuFdcFeFv,gFuFucFeFe,       & 
& gFuFucFuFu,gFuFuFvFv,epsI,deltaM,.True.,gTFu,gPFu(:,10:144),BRFu(:,10:144))

End If 
 
End If 
Else 
Call FuThreeBodyDecay(-1,MAh,MAh2,MChi,MChi2,MetI,MetI2,Metp,Metp2,MetR,              & 
& MetR2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,            & 
& MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZW,ZX,ZZ,g1,g2,g3,lam1,lam2,lam4,lam3,              & 
& lam5,Yn,Yu,Yd,Ye,Mn,mH2,mEt2,v,gThh,gTVWp,gTVZ,gFuFucFdFd,gFuFdcFeFv,gFuFucFeFe,       & 
& gFuFucFuFu,gFuFuFvFv,epsI,deltaM,.False.,gTFu,gPFu(:,10:144),BRFu(:,10:144))

End If 
Do i1=1,3
gTFu(i1) =Sum(gPFu(i1,:)) 
If (gTFu(i1).Gt.0._dp) BRFu(i1,: ) =gPFu(i1,:)/gTFu(i1) 
End Do 
 

gPFe = 0._dp 
gTFe = 0._dp 
BRFe = 0._dp 
If (.Not.CTBD) Then 
Call FeTwoBodyDecay(-1,DeltaM,MAh,MAh2,MChi,MChi2,MetI,MetI2,Metp,Metp2,              & 
& MetR,MetR2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,           & 
& MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZW,ZX,ZZ,g1,g2,g3,lam1,lam2,lam4,               & 
& lam3,lam5,Yn,Yu,Yd,Ye,Mn,mH2,mEt2,v,gPFe(:,1:12),gTFe,BRFe(:,1:12))

If (Enable3BDecaysF) Then 
If (MaxVal(gTFe).Lt.MaxVal(fac3*Abs(MFe))) Then 
Call FeThreeBodyDecay(-1,MAh,MAh2,MChi,MChi2,MetI,MetI2,Metp,Metp2,MetR,              & 
& MetR2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,            & 
& MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZW,ZX,ZZ,g1,g2,g3,lam1,lam2,lam4,lam3,              & 
& lam5,Yn,Yu,Yd,Ye,Mn,mH2,mEt2,v,gTetp,gThh,gTVWp,gTVZ,gFeChiFeChi,gFeFecFdFd,           & 
& gFeFecFeFe,gFeFecFuFu,gFeFeFvFv,gFeFvcFuFd,epsI,deltaM,.False.,gTFe,gPFe(:,13:174)     & 
& ,BRFe(:,13:174))

Else 
Call FeThreeBodyDecay(-1,MAh,MAh2,MChi,MChi2,MetI,MetI2,Metp,Metp2,MetR,              & 
& MetR2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,            & 
& MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZW,ZX,ZZ,g1,g2,g3,lam1,lam2,lam4,lam3,              & 
& lam5,Yn,Yu,Yd,Ye,Mn,mH2,mEt2,v,gTetp,gThh,gTVWp,gTVZ,gFeChiFeChi,gFeFecFdFd,           & 
& gFeFecFeFe,gFeFecFuFu,gFeFeFvFv,gFeFvcFuFd,epsI,deltaM,.True.,gTFe,gPFe(:,13:174)      & 
& ,BRFe(:,13:174))

End If 
 
End If 
Else 
Call FeThreeBodyDecay(-1,MAh,MAh2,MChi,MChi2,MetI,MetI2,Metp,Metp2,MetR,              & 
& MetR2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,            & 
& MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZW,ZX,ZZ,g1,g2,g3,lam1,lam2,lam4,lam3,              & 
& lam5,Yn,Yu,Yd,Ye,Mn,mH2,mEt2,v,gTetp,gThh,gTVWp,gTVZ,gFeChiFeChi,gFeFecFdFd,           & 
& gFeFecFeFe,gFeFecFuFu,gFeFeFvFv,gFeFvcFuFd,epsI,deltaM,.False.,gTFe,gPFe(:,13:174)     & 
& ,BRFe(:,13:174))

End If 
Do i1=1,3
gTFe(i1) =Sum(gPFe(i1,:)) 
If (gTFe(i1).Gt.0._dp) BRFe(i1,: ) =gPFe(i1,:)/gTFe(i1) 
End Do 
 

gPFd = 0._dp 
gTFd = 0._dp 
BRFd = 0._dp 
If (.Not.CTBD) Then 
Call FdTwoBodyDecay(-1,DeltaM,MAh,MAh2,MChi,MChi2,MetI,MetI2,Metp,Metp2,              & 
& MetR,MetR2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,           & 
& MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZW,ZX,ZZ,g1,g2,g3,lam1,lam2,lam4,               & 
& lam3,lam5,Yn,Yu,Yd,Ye,Mn,mH2,mEt2,v,gPFd(:,1:9),gTFd,BRFd(:,1:9))

If (Enable3BDecaysF) Then 
If (MaxVal(gTFd).Lt.MaxVal(fac3*Abs(MFd))) Then 
Call FdThreeBodyDecay(-1,MAh,MAh2,MChi,MChi2,MetI,MetI2,Metp,Metp2,MetR,              & 
& MetR2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,            & 
& MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZW,ZX,ZZ,g1,g2,g3,lam1,lam2,lam4,lam3,              & 
& lam5,Yn,Yu,Yd,Ye,Mn,mH2,mEt2,v,gThh,gTVWp,gTVZ,gFdFdcFdFd,gFdFdcFeFe,gFdFdcFuFu,       & 
& gFdFdFvFv,gFdFuFvFe,epsI,deltaM,.False.,gTFd,gPFd(:,10:144),BRFd(:,10:144))

Else 
Call FdThreeBodyDecay(-1,MAh,MAh2,MChi,MChi2,MetI,MetI2,Metp,Metp2,MetR,              & 
& MetR2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,            & 
& MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZW,ZX,ZZ,g1,g2,g3,lam1,lam2,lam4,lam3,              & 
& lam5,Yn,Yu,Yd,Ye,Mn,mH2,mEt2,v,gThh,gTVWp,gTVZ,gFdFdcFdFd,gFdFdcFeFe,gFdFdcFuFu,       & 
& gFdFdFvFv,gFdFuFvFe,epsI,deltaM,.True.,gTFd,gPFd(:,10:144),BRFd(:,10:144))

End If 
 
End If 
Else 
Call FdThreeBodyDecay(-1,MAh,MAh2,MChi,MChi2,MetI,MetI2,Metp,Metp2,MetR,              & 
& MetR2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,            & 
& MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZW,ZX,ZZ,g1,g2,g3,lam1,lam2,lam4,lam3,              & 
& lam5,Yn,Yu,Yd,Ye,Mn,mH2,mEt2,v,gThh,gTVWp,gTVZ,gFdFdcFdFd,gFdFdcFeFe,gFdFdcFuFu,       & 
& gFdFdFvFv,gFdFuFvFe,epsI,deltaM,.False.,gTFd,gPFd(:,10:144),BRFd(:,10:144))

End If 
Do i1=1,3
gTFd(i1) =Sum(gPFd(i1,:)) 
If (gTFd(i1).Gt.0._dp) BRFd(i1,: ) =gPFd(i1,:)/gTFd(i1) 
End Do 
 

gPFv = 0._dp 
gTFv = 0._dp 
BRFv = 0._dp 
Call FvTwoBodyDecay(-1,DeltaM,MAh,MAh2,MChi,MChi2,MetI,MetI2,Metp,Metp2,              & 
& MetR,MetR2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,           & 
& MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZW,ZX,ZZ,g1,g2,g3,lam1,lam2,lam4,               & 
& lam3,lam5,Yn,Yu,Yd,Ye,Mn,mH2,mEt2,v,gPFv,gTFv,BRFv)

gPVZ = 0._dp 
gTVZ = 0._dp 
BRVZ = 0._dp 
Call VZTwoBodyDecay(-1,DeltaM,MAh,MAh2,MChi,MChi2,MetI,MetI2,Metp,Metp2,              & 
& MetR,MetR2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,           & 
& MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZW,ZX,ZZ,g1,g2,g3,lam1,lam2,lam4,               & 
& lam3,lam5,Yn,Yu,Yd,Ye,Mn,mH2,mEt2,v,gPVZ,gTVZ,BRVZ)

! Set Goldstone Widhts 
gTAh=gTVZ


gPVWp = 0._dp 
gTVWp = 0._dp 
BRVWp = 0._dp 
Call VWpTwoBodyDecay(-1,DeltaM,MAh,MAh2,MChi,MChi2,MetI,MetI2,Metp,Metp2,             & 
& MetR,MetR2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,           & 
& MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZW,ZX,ZZ,g1,g2,g3,lam1,lam2,lam4,               & 
& lam3,lam5,Yn,Yu,Yd,Ye,Mn,mH2,mEt2,v,gPVWp,gTVWp,BRVWp)

! Set Goldstone Widhts 
gTHp=gTVWp


gPhh = 0._dp 
gThh = 0._dp 
BRhh = 0._dp 
Call hhTwoBodyDecay(-1,DeltaM,MAh,MAh2,MChi,MChi2,MetI,MetI2,Metp,Metp2,              & 
& MetR,MetR2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,           & 
& MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZW,ZX,ZZ,g1,g2,g3,lam1,lam2,lam4,               & 
& lam3,lam5,Yn,Yu,Yd,Ye,Mn,mH2,mEt2,v,gPhh,gThh,BRhh)

gPetR = 0._dp 
gTetR = 0._dp 
BRetR = 0._dp 
Call etRTwoBodyDecay(-1,DeltaM,MAh,MAh2,MChi,MChi2,MetI,MetI2,Metp,Metp2,             & 
& MetR,MetR2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,           & 
& MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZW,ZX,ZZ,g1,g2,g3,lam1,lam2,lam4,               & 
& lam3,lam5,Yn,Yu,Yd,Ye,Mn,mH2,mEt2,v,gPetR,gTetR,BRetR)

gPetI = 0._dp 
gTetI = 0._dp 
BRetI = 0._dp 
Call etITwoBodyDecay(-1,DeltaM,MAh,MAh2,MChi,MChi2,MetI,MetI2,Metp,Metp2,             & 
& MetR,MetR2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,           & 
& MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZW,ZX,ZZ,g1,g2,g3,lam1,lam2,lam4,               & 
& lam3,lam5,Yn,Yu,Yd,Ye,Mn,mH2,mEt2,v,gPetI,gTetI,BRetI)

gPetp = 0._dp 
gTetp = 0._dp 
BRetp = 0._dp 
Call etpTwoBodyDecay(-1,DeltaM,MAh,MAh2,MChi,MChi2,MetI,MetI2,Metp,Metp2,             & 
& MetR,MetR2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,           & 
& MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZW,ZX,ZZ,g1,g2,g3,lam1,lam2,lam4,               & 
& lam3,lam5,Yn,Yu,Yd,Ye,Mn,mH2,mEt2,v,gPetp,gTetp,BRetp)

gPChi = 0._dp 
gTChi = 0._dp 
BRChi = 0._dp 
Call ChiTwoBodyDecay(-1,DeltaM,MAh,MAh2,MChi,MChi2,MetI,MetI2,Metp,Metp2,             & 
& MetR,MetR2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,           & 
& MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZW,ZX,ZZ,g1,g2,g3,lam1,lam2,lam4,               & 
& lam3,lam5,Yn,Yu,Yd,Ye,Mn,mH2,mEt2,v,gPChi,gTChi,BRChi)

Iname = Iname - 1 
 
End Subroutine CalculateBR 
End Module BranchingRatios_Scotogenic 
 
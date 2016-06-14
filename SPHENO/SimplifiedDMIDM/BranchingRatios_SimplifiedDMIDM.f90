! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.8.5 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 21:35 on 13.6.2016   
! ----------------------------------------------------------------------  
 
 
Module BranchingRatios_SimplifiedDMIDM 
 
Use Control 
Use Couplings_SimplifiedDMIDM 
Use Model_Data_SimplifiedDMIDM 
Use LoopCouplings_SimplifiedDMIDM 
Use Fu3Decays_SimplifiedDMIDM 
Use Fe3Decays_SimplifiedDMIDM 
Use Fd3Decays_SimplifiedDMIDM 
Use SUSYDecays_SimplifiedDMIDM 
 
Contains 
 
Subroutine CalculateBR(CTBD,fac3,epsI,deltaM,kont,MAh,MAh2,MetI,MetI2,Metp,           & 
& Metp2,MetR,MetR2,MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,              & 
& MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,ZW,ZZ,v,g1,g2,g3,lam1,lam2,lam4,lam3,              & 
& lam5,Yu,Yd,Ye,mH2,mEt2,gPFu,gTFu,BRFu,gPFe,gTFe,BRFe,gPFd,gTFd,BRFd,gPFv,              & 
& gTFv,BRFv,gPVZ,gTVZ,BRVZ,gPVWp,gTVWp,BRVWp,gPhh,gThh,BRhh,gPetR,gTetR,BRetR,           & 
& gPetI,gTetI,BRetI,gPetp,gTetp,BRetp)

Real(dp), Intent(in) :: epsI, deltaM, fac3 
Integer, Intent(inout) :: kont 
Logical, Intent(in) :: CTBD 
Real(dp),Intent(in) :: g1,g2,g3,lam5

Complex(dp),Intent(in) :: lam1,lam2,lam4,lam3,Yu(3,3),Yd(3,3),Ye(3,3),mH2,mEt2

Real(dp),Intent(in) :: MAh,MAh2,MetI,MetI2,Metp,Metp2,MetR,MetR2,MFd(3),MFd2(3),MFe(3),MFe2(3),              & 
& MFu(3),MFu2(3),Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZZ(2,2)

Complex(dp),Intent(in) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZW(2,2)

Real(dp),Intent(in) :: v

Real(dp),Intent(inout) :: gPFu(3,144),gTFu(3),BRFu(3,144),gPFe(3,141),gTFe(3),BRFe(3,141),gPFd(3,144),          & 
& gTFd(3),BRFd(3,144),gPFv(3,3),gTFv(3),BRFv(3,3),gPVZ(1,40),gTVZ,BRVZ(1,40),            & 
& gPVWp(1,22),gTVWp,BRVWp(1,22),gPhh(1,37),gThh,BRhh(1,37),gPetR(1,3),gTetR,             & 
& BRetR(1,3),gPetI(1,3),gTetI,BRetI(1,3),gPetp(1,4),gTetp,BRetp(1,4)

Complex(dp) :: cplHiggsPP,cplHiggsGG,cplPseudoHiggsPP,cplPseudoHiggsGG,cplHiggsZZvirt,               & 
& cplHiggsWWvirt

Real(dp) :: gTAh 
Real(dp) :: gFuFucFdFd(3,3,3,3),gFuFdcFeFv(3,3,3,3),gFuFucFeFe(3,3,3,3),gFuFucFuFu(3,3,3,3),      & 
& gFuFucFvFv(3,3,3,3),gFeFecFdFd(3,3,3,3),gFeFecFeFe(3,3,3,3),gFeFecFuFu(3,3,3,3),       & 
& gFeFecFvFv(3,3,3,3),gFeFvcFuFd(3,3,3,3),gFdFdcFdFd(3,3,3,3),gFdFdcFeFe(3,3,3,3),       & 
& gFdFdcFuFu(3,3,3,3),gFdFdcFvFv(3,3,3,3),gFdFucFvFe(3,3,3,3)

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
Call FuTwoBodyDecay(-1,DeltaM,MAh,MAh2,MetI,MetI2,Metp,Metp2,MetR,MetR2,              & 
& MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,               & 
& ZER,ZUR,ZDL,ZEL,ZUL,ZW,ZZ,g1,g2,g3,lam1,lam2,lam4,lam3,lam5,Yu,Yd,Ye,mH2,              & 
& mEt2,v,gPFu(:,1:9),gTFu,BRFu(:,1:9))

Do i1=1,3
gTFu(i1) =Sum(gPFu(i1,:)) 
If (gTFu(i1).Gt.0._dp) BRFu(i1,: ) =gPFu(i1,:)/gTFu(i1) 
End Do 
 

gPFe = 0._dp 
gTFe = 0._dp 
BRFe = 0._dp 
Call FeTwoBodyDecay(-1,DeltaM,MAh,MAh2,MetI,MetI2,Metp,Metp2,MetR,MetR2,              & 
& MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,               & 
& ZER,ZUR,ZDL,ZEL,ZUL,ZW,ZZ,g1,g2,g3,lam1,lam2,lam4,lam3,lam5,Yu,Yd,Ye,mH2,              & 
& mEt2,v,gPFe(:,1:6),gTFe,BRFe(:,1:6))

Do i1=1,3
gTFe(i1) =Sum(gPFe(i1,:)) 
If (gTFe(i1).Gt.0._dp) BRFe(i1,: ) =gPFe(i1,:)/gTFe(i1) 
End Do 
 

gPFd = 0._dp 
gTFd = 0._dp 
BRFd = 0._dp 
Call FdTwoBodyDecay(-1,DeltaM,MAh,MAh2,MetI,MetI2,Metp,Metp2,MetR,MetR2,              & 
& MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,               & 
& ZER,ZUR,ZDL,ZEL,ZUL,ZW,ZZ,g1,g2,g3,lam1,lam2,lam4,lam3,lam5,Yu,Yd,Ye,mH2,              & 
& mEt2,v,gPFd(:,1:9),gTFd,BRFd(:,1:9))

Do i1=1,3
gTFd(i1) =Sum(gPFd(i1,:)) 
If (gTFd(i1).Gt.0._dp) BRFd(i1,: ) =gPFd(i1,:)/gTFd(i1) 
End Do 
 

gPFv = 0._dp 
gTFv = 0._dp 
BRFv = 0._dp 
Call FvTwoBodyDecay(-1,DeltaM,MAh,MAh2,MetI,MetI2,Metp,Metp2,MetR,MetR2,              & 
& MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,               & 
& ZER,ZUR,ZDL,ZEL,ZUL,ZW,ZZ,g1,g2,g3,lam1,lam2,lam4,lam3,lam5,Yu,Yd,Ye,mH2,              & 
& mEt2,v,gPFv,gTFv,BRFv)

gPVZ = 0._dp 
gTVZ = 0._dp 
BRVZ = 0._dp 
Call VZTwoBodyDecay(-1,DeltaM,MAh,MAh2,MetI,MetI2,Metp,Metp2,MetR,MetR2,              & 
& MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,               & 
& ZER,ZUR,ZDL,ZEL,ZUL,ZW,ZZ,g1,g2,g3,lam1,lam2,lam4,lam3,lam5,Yu,Yd,Ye,mH2,              & 
& mEt2,v,gPVZ,gTVZ,BRVZ)

! Set Goldstone Widhts 


gPVWp = 0._dp 
gTVWp = 0._dp 
BRVWp = 0._dp 
Call VWpTwoBodyDecay(-1,DeltaM,MAh,MAh2,MetI,MetI2,Metp,Metp2,MetR,MetR2,             & 
& MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,               & 
& ZER,ZUR,ZDL,ZEL,ZUL,ZW,ZZ,g1,g2,g3,lam1,lam2,lam4,lam3,lam5,Yu,Yd,Ye,mH2,              & 
& mEt2,v,gPVWp,gTVWp,BRVWp)

! Set Goldstone Widhts 


gPhh = 0._dp 
gThh = 0._dp 
BRhh = 0._dp 
Call hhTwoBodyDecay(-1,DeltaM,MAh,MAh2,MetI,MetI2,Metp,Metp2,MetR,MetR2,              & 
& MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,               & 
& ZER,ZUR,ZDL,ZEL,ZUL,ZW,ZZ,g1,g2,g3,lam1,lam2,lam4,lam3,lam5,Yu,Yd,Ye,mH2,              & 
& mEt2,v,gPhh,gThh,BRhh)

gPetR = 0._dp 
gTetR = 0._dp 
BRetR = 0._dp 
Call etRTwoBodyDecay(-1,DeltaM,MAh,MAh2,MetI,MetI2,Metp,Metp2,MetR,MetR2,             & 
& MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,               & 
& ZER,ZUR,ZDL,ZEL,ZUL,ZW,ZZ,g1,g2,g3,lam1,lam2,lam4,lam3,lam5,Yu,Yd,Ye,mH2,              & 
& mEt2,v,gPetR,gTetR,BRetR)

gPetI = 0._dp 
gTetI = 0._dp 
BRetI = 0._dp 
Call etITwoBodyDecay(-1,DeltaM,MAh,MAh2,MetI,MetI2,Metp,Metp2,MetR,MetR2,             & 
& MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,               & 
& ZER,ZUR,ZDL,ZEL,ZUL,ZW,ZZ,g1,g2,g3,lam1,lam2,lam4,lam3,lam5,Yu,Yd,Ye,mH2,              & 
& mEt2,v,gPetI,gTetI,BRetI)

gPetp = 0._dp 
gTetp = 0._dp 
BRetp = 0._dp 
Call etpTwoBodyDecay(-1,DeltaM,MAh,MAh2,MetI,MetI2,Metp,Metp2,MetR,MetR2,             & 
& MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,               & 
& ZER,ZUR,ZDL,ZEL,ZUL,ZW,ZZ,g1,g2,g3,lam1,lam2,lam4,lam3,lam5,Yu,Yd,Ye,mH2,              & 
& mEt2,v,gPetp,gTetp,BRetp)

If (.Not.CTBD) Then 
If (Enable3BDecaysF) Then 
If (MaxVal(gTFu).Lt.MaxVal(fac3*Abs(MFu))) Then 
Call FuThreeBodyDecay(-1,MAh,MAh2,MetI,MetI2,Metp,Metp2,MetR,MetR2,MFd,               & 
& MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,               & 
& ZUR,ZDL,ZEL,ZUL,ZW,ZZ,g1,g2,g3,lam1,lam2,lam4,lam3,lam5,Yu,Yd,Ye,mH2,mEt2,             & 
& v,gThh,gTVWp,gTVZ,gFuFucFdFd,gFuFdcFeFv,gFuFucFeFe,gFuFucFuFu,gFuFucFvFv,              & 
& epsI,deltaM,.False.,gTFu,gPFu(:,10:144),BRFu(:,10:144))

Else 
Call FuThreeBodyDecay(-1,MAh,MAh2,MetI,MetI2,Metp,Metp2,MetR,MetR2,MFd,               & 
& MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,               & 
& ZUR,ZDL,ZEL,ZUL,ZW,ZZ,g1,g2,g3,lam1,lam2,lam4,lam3,lam5,Yu,Yd,Ye,mH2,mEt2,             & 
& v,gThh,gTVWp,gTVZ,gFuFucFdFd,gFuFdcFeFv,gFuFucFeFe,gFuFucFuFu,gFuFucFvFv,              & 
& epsI,deltaM,.True.,gTFu,gPFu(:,10:144),BRFu(:,10:144))

End If 
 
End If 
Else 
Call FuThreeBodyDecay(-1,MAh,MAh2,MetI,MetI2,Metp,Metp2,MetR,MetR2,MFd,               & 
& MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,               & 
& ZUR,ZDL,ZEL,ZUL,ZW,ZZ,g1,g2,g3,lam1,lam2,lam4,lam3,lam5,Yu,Yd,Ye,mH2,mEt2,             & 
& v,gThh,gTVWp,gTVZ,gFuFucFdFd,gFuFdcFeFv,gFuFucFeFe,gFuFucFuFu,gFuFucFvFv,              & 
& epsI,deltaM,.False.,gTFu,gPFu(:,10:144),BRFu(:,10:144))

End If 
Do i1=1,3
gTFu(i1) =Sum(gPFu(i1,:)) 
If (gTFu(i1).Gt.0._dp) BRFu(i1,: ) =gPFu(i1,:)/gTFu(i1) 
End Do 
 

If (.Not.CTBD) Then 
If (Enable3BDecaysF) Then 
If (MaxVal(gTFe).Lt.MaxVal(fac3*Abs(MFe))) Then 
Call FeThreeBodyDecay(-1,MAh,MAh2,MetI,MetI2,Metp,Metp2,MetR,MetR2,MFd,               & 
& MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,               & 
& ZUR,ZDL,ZEL,ZUL,ZW,ZZ,g1,g2,g3,lam1,lam2,lam4,lam3,lam5,Yu,Yd,Ye,mH2,mEt2,             & 
& v,gThh,gTVWp,gTVZ,gFeFecFdFd,gFeFecFeFe,gFeFecFuFu,gFeFecFvFv,gFeFvcFuFd,              & 
& epsI,deltaM,.False.,gTFe,gPFe(:,7:141),BRFe(:,7:141))

Else 
Call FeThreeBodyDecay(-1,MAh,MAh2,MetI,MetI2,Metp,Metp2,MetR,MetR2,MFd,               & 
& MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,               & 
& ZUR,ZDL,ZEL,ZUL,ZW,ZZ,g1,g2,g3,lam1,lam2,lam4,lam3,lam5,Yu,Yd,Ye,mH2,mEt2,             & 
& v,gThh,gTVWp,gTVZ,gFeFecFdFd,gFeFecFeFe,gFeFecFuFu,gFeFecFvFv,gFeFvcFuFd,              & 
& epsI,deltaM,.True.,gTFe,gPFe(:,7:141),BRFe(:,7:141))

End If 
 
End If 
Else 
Call FeThreeBodyDecay(-1,MAh,MAh2,MetI,MetI2,Metp,Metp2,MetR,MetR2,MFd,               & 
& MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,               & 
& ZUR,ZDL,ZEL,ZUL,ZW,ZZ,g1,g2,g3,lam1,lam2,lam4,lam3,lam5,Yu,Yd,Ye,mH2,mEt2,             & 
& v,gThh,gTVWp,gTVZ,gFeFecFdFd,gFeFecFeFe,gFeFecFuFu,gFeFecFvFv,gFeFvcFuFd,              & 
& epsI,deltaM,.False.,gTFe,gPFe(:,7:141),BRFe(:,7:141))

End If 
Do i1=1,3
gTFe(i1) =Sum(gPFe(i1,:)) 
If (gTFe(i1).Gt.0._dp) BRFe(i1,: ) =gPFe(i1,:)/gTFe(i1) 
End Do 
 

If (.Not.CTBD) Then 
If (Enable3BDecaysF) Then 
If (MaxVal(gTFd).Lt.MaxVal(fac3*Abs(MFd))) Then 
Call FdThreeBodyDecay(-1,MAh,MAh2,MetI,MetI2,Metp,Metp2,MetR,MetR2,MFd,               & 
& MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,               & 
& ZUR,ZDL,ZEL,ZUL,ZW,ZZ,g1,g2,g3,lam1,lam2,lam4,lam3,lam5,Yu,Yd,Ye,mH2,mEt2,             & 
& v,gThh,gTVWp,gTVZ,gFdFdcFdFd,gFdFdcFeFe,gFdFdcFuFu,gFdFdcFvFv,gFdFucFvFe,              & 
& epsI,deltaM,.False.,gTFd,gPFd(:,10:144),BRFd(:,10:144))

Else 
Call FdThreeBodyDecay(-1,MAh,MAh2,MetI,MetI2,Metp,Metp2,MetR,MetR2,MFd,               & 
& MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,               & 
& ZUR,ZDL,ZEL,ZUL,ZW,ZZ,g1,g2,g3,lam1,lam2,lam4,lam3,lam5,Yu,Yd,Ye,mH2,mEt2,             & 
& v,gThh,gTVWp,gTVZ,gFdFdcFdFd,gFdFdcFeFe,gFdFdcFuFu,gFdFdcFvFv,gFdFucFvFe,              & 
& epsI,deltaM,.True.,gTFd,gPFd(:,10:144),BRFd(:,10:144))

End If 
 
End If 
Else 
Call FdThreeBodyDecay(-1,MAh,MAh2,MetI,MetI2,Metp,Metp2,MetR,MetR2,MFd,               & 
& MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,               & 
& ZUR,ZDL,ZEL,ZUL,ZW,ZZ,g1,g2,g3,lam1,lam2,lam4,lam3,lam5,Yu,Yd,Ye,mH2,mEt2,             & 
& v,gThh,gTVWp,gTVZ,gFdFdcFdFd,gFdFdcFeFe,gFdFdcFuFu,gFdFdcFvFv,gFdFucFvFe,              & 
& epsI,deltaM,.False.,gTFd,gPFd(:,10:144),BRFd(:,10:144))

End If 
Do i1=1,3
gTFd(i1) =Sum(gPFd(i1,:)) 
If (gTFd(i1).Gt.0._dp) BRFd(i1,: ) =gPFd(i1,:)/gTFd(i1) 
End Do 
 

! No 3-body decays for Fv  
! No 3-body decays for VZ  
! No 3-body decays for VWp  
! No 3-body decays for hh  
! No 3-body decays for etR  
! No 3-body decays for etI  
! No 3-body decays for etp  
Iname = Iname - 1 
 
End Subroutine CalculateBR 
End Module BranchingRatios_SimplifiedDMIDM 
 
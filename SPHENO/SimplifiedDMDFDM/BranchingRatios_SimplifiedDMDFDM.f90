! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.8.5 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 10:58 on 18.6.2016   
! ----------------------------------------------------------------------  
 
 
Module BranchingRatios_SimplifiedDMDFDM 
 
Use Control 
Use Couplings_SimplifiedDMDFDM 
Use Model_Data_SimplifiedDMDFDM 
Use LoopCouplings_SimplifiedDMDFDM 
Use Fu3Decays_SimplifiedDMDFDM 
Use Fe3Decays_SimplifiedDMDFDM 
Use Fd3Decays_SimplifiedDMDFDM 
Use Nv03Decays_SimplifiedDMDFDM 
Use Fre3Decays_SimplifiedDMDFDM 
Use SUSYDecays_SimplifiedDMDFDM 
 
Contains 
 
Subroutine CalculateBR(CTBD,fac3,epsI,deltaM,kont,MAh,MAh2,MFd,MFd2,MFe,              & 
& MFe2,MFre,MFre2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MNv0,MNv02,MVWp,MVWp2,MVZ,MVZ2,             & 
& TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,ZW,ZZ,v,g1,g2,g3,lam1,Yu,Yd,Ye,MDF,mH2,gPFu,gTFu,           & 
& BRFu,gPFe,gTFe,BRFe,gPFd,gTFd,BRFd,gPFv,gTFv,BRFv,gPVZ,gTVZ,BRVZ,gPVWp,gTVWp,          & 
& BRVWp,gPhh,gThh,BRhh,gPNv0,gTNv0,BRNv0,gPFre,gTFre,BRFre)

Real(dp), Intent(in) :: epsI, deltaM, fac3 
Integer, Intent(inout) :: kont 
Logical, Intent(in) :: CTBD 
Real(dp),Intent(in) :: g1,g2,g3,MDF

Complex(dp),Intent(in) :: lam1,Yu(3,3),Yd(3,3),Ye(3,3),mH2

Real(dp),Intent(in) :: MAh,MAh2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFre,MFre2,MFu(3),MFu2(3),Mhh,Mhh2,            & 
& MHp,MHp2,MNv0,MNv02,MVWp,MVWp2,MVZ,MVZ2,TW,ZZ(2,2)

Complex(dp),Intent(in) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZW(2,2)

Real(dp),Intent(in) :: v

Real(dp),Intent(inout) :: gPFu(3,153),gTFu(3),BRFu(3,153),gPFe(3,150),gTFe(3),BRFe(3,150),gPFd(3,153),          & 
& gTFd(3),BRFd(3,153),gPFv(3,3),gTFv(3),BRFv(3,3),gPVZ(1,40),gTVZ,BRVZ(1,40),            & 
& gPVWp(1,21),gTVWp,BRVWp(1,21),gPhh(1,34),gThh,BRhh(1,34),gPNv0(1,20),gTNv0,            & 
& BRNv0(1,20),gPFre(1,20),gTFre,BRFre(1,20)

Complex(dp) :: cplHiggsPP,cplHiggsGG,cplPseudoHiggsPP,cplPseudoHiggsGG,cplHiggsZZvirt,               & 
& cplHiggsWWvirt

Real(dp) :: gTAh 
Real(dp) :: gFuFucFdFd(3,3,3,3),gFuFdcFeFv(3,3,3,3),gFuFdcFreNv0(3,3,1,1),gFuFucFeFe(3,3,3,3),    & 
& gFuFucFuFu(3,3,3,3),gFuFucFreFre(3,3,1,1),gFuFucFvFv(3,3,3,3),gFuFucNv0Nv0(3,3,1,1),   & 
& gFeFecFdFd(3,3,3,3),gFeFecFeFe(3,3,3,3),gFeFecFuFu(3,3,3,3),gFeFecFreFre(3,3,1,1),     & 
& gFeFecFvFv(3,3,3,3),gFeFecNv0Nv0(3,3,1,1),gFeFvcFuFd(3,3,3,3),gFeFvcNv0Fre(3,3,1,1),   & 
& gFdFdcFdFd(3,3,3,3),gFdFdcFeFe(3,3,3,3),gFdFdcFuFu(3,3,3,3),gFdFdcFreFre(3,3,1,1),     & 
& gFdFdcFvFv(3,3,3,3),gFdFdcNv0Nv0(3,3,1,1),gFdFucFvFe(3,3,3,3),gFdFucNv0Fre(3,3,1,1),   & 
& gNv0FrecFdFu(1,1,3,3),gNv0FrecFeFv(1,1,3,3),gFreNv0cFuFd(1,1,3,3),gFreNv0cFvFe(1,1,3,3)

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
Call FuTwoBodyDecay(-1,DeltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,MFu,              & 
& MFu2,Mhh,Mhh2,MHp,MHp2,MNv0,MNv02,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,              & 
& ZEL,ZUL,ZW,ZZ,g1,g2,g3,lam1,Yu,Yd,Ye,MDF,mH2,v,gPFu(:,1:9),gTFu,BRFu(:,1:9))

Do i1=1,3
gTFu(i1) =Sum(gPFu(i1,:)) 
If (gTFu(i1).Gt.0._dp) BRFu(i1,: ) =gPFu(i1,:)/gTFu(i1) 
End Do 
 

gPFe = 0._dp 
gTFe = 0._dp 
BRFe = 0._dp 
Call FeTwoBodyDecay(-1,DeltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,MFu,              & 
& MFu2,Mhh,Mhh2,MHp,MHp2,MNv0,MNv02,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,              & 
& ZEL,ZUL,ZW,ZZ,g1,g2,g3,lam1,Yu,Yd,Ye,MDF,mH2,v,gPFe(:,1:6),gTFe,BRFe(:,1:6))

Do i1=1,3
gTFe(i1) =Sum(gPFe(i1,:)) 
If (gTFe(i1).Gt.0._dp) BRFe(i1,: ) =gPFe(i1,:)/gTFe(i1) 
End Do 
 

gPFd = 0._dp 
gTFd = 0._dp 
BRFd = 0._dp 
Call FdTwoBodyDecay(-1,DeltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,MFu,              & 
& MFu2,Mhh,Mhh2,MHp,MHp2,MNv0,MNv02,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,              & 
& ZEL,ZUL,ZW,ZZ,g1,g2,g3,lam1,Yu,Yd,Ye,MDF,mH2,v,gPFd(:,1:9),gTFd,BRFd(:,1:9))

Do i1=1,3
gTFd(i1) =Sum(gPFd(i1,:)) 
If (gTFd(i1).Gt.0._dp) BRFd(i1,: ) =gPFd(i1,:)/gTFd(i1) 
End Do 
 

gPFv = 0._dp 
gTFv = 0._dp 
BRFv = 0._dp 
Call FvTwoBodyDecay(-1,DeltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,MFu,              & 
& MFu2,Mhh,Mhh2,MHp,MHp2,MNv0,MNv02,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,              & 
& ZEL,ZUL,ZW,ZZ,g1,g2,g3,lam1,Yu,Yd,Ye,MDF,mH2,v,gPFv,gTFv,BRFv)

gPVZ = 0._dp 
gTVZ = 0._dp 
BRVZ = 0._dp 
Call VZTwoBodyDecay(-1,DeltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,MFu,              & 
& MFu2,Mhh,Mhh2,MHp,MHp2,MNv0,MNv02,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,              & 
& ZEL,ZUL,ZW,ZZ,g1,g2,g3,lam1,Yu,Yd,Ye,MDF,mH2,v,gPVZ,gTVZ,BRVZ)

! Set Goldstone Widhts 


gPVWp = 0._dp 
gTVWp = 0._dp 
BRVWp = 0._dp 
Call VWpTwoBodyDecay(-1,DeltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,MFu,             & 
& MFu2,Mhh,Mhh2,MHp,MHp2,MNv0,MNv02,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,              & 
& ZEL,ZUL,ZW,ZZ,g1,g2,g3,lam1,Yu,Yd,Ye,MDF,mH2,v,gPVWp,gTVWp,BRVWp)

! Set Goldstone Widhts 


gPhh = 0._dp 
gThh = 0._dp 
BRhh = 0._dp 
Call hhTwoBodyDecay(-1,DeltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,MFu,              & 
& MFu2,Mhh,Mhh2,MHp,MHp2,MNv0,MNv02,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,              & 
& ZEL,ZUL,ZW,ZZ,g1,g2,g3,lam1,Yu,Yd,Ye,MDF,mH2,v,gPhh,gThh,BRhh)

gPNv0 = 0._dp 
gTNv0 = 0._dp 
BRNv0 = 0._dp 
Call Nv0TwoBodyDecay(-1,DeltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,MFu,             & 
& MFu2,Mhh,Mhh2,MHp,MHp2,MNv0,MNv02,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,              & 
& ZEL,ZUL,ZW,ZZ,g1,g2,g3,lam1,Yu,Yd,Ye,MDF,mH2,v,gPNv0(:,1:2),gTNv0,BRNv0(:,1:2))

Do i1=1,1
gTNv0 =Sum(gPNv0(i1,:)) 
If (gTNv0.Gt.0._dp) BRNv0(i1,: ) =gPNv0(i1,:)/gTNv0 
End Do 
 

gPFre = 0._dp 
gTFre = 0._dp 
BRFre = 0._dp 
Call FreTwoBodyDecay(-1,DeltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,MFu,             & 
& MFu2,Mhh,Mhh2,MHp,MHp2,MNv0,MNv02,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,              & 
& ZEL,ZUL,ZW,ZZ,g1,g2,g3,lam1,Yu,Yd,Ye,MDF,mH2,v,gPFre(:,1:2),gTFre,BRFre(:,1:2))

Do i1=1,1
gTFre =Sum(gPFre(i1,:)) 
If (gTFre.Gt.0._dp) BRFre(i1,: ) =gPFre(i1,:)/gTFre 
End Do 
 

If (.Not.CTBD) Then 
If (Enable3BDecaysF) Then 
If (MaxVal(gTFu).Lt.MaxVal(fac3*Abs(MFu))) Then 
Call FuThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,MFu,MFu2,              & 
& Mhh,Mhh2,MHp,MHp2,MNv0,MNv02,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,               & 
& ZUL,ZW,ZZ,g1,g2,g3,lam1,Yu,Yd,Ye,MDF,mH2,v,gThh,gTVWp,gTVZ,gFuFucFdFd,gFuFdcFeFv,      & 
& gFuFdcFreNv0,gFuFucFeFe,gFuFucFuFu,gFuFucFreFre,gFuFucFvFv,gFuFucNv0Nv0,               & 
& epsI,deltaM,.False.,gTFu,gPFu(:,10:153),BRFu(:,10:153))

Else 
Call FuThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,MFu,MFu2,              & 
& Mhh,Mhh2,MHp,MHp2,MNv0,MNv02,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,               & 
& ZUL,ZW,ZZ,g1,g2,g3,lam1,Yu,Yd,Ye,MDF,mH2,v,gThh,gTVWp,gTVZ,gFuFucFdFd,gFuFdcFeFv,      & 
& gFuFdcFreNv0,gFuFucFeFe,gFuFucFuFu,gFuFucFreFre,gFuFucFvFv,gFuFucNv0Nv0,               & 
& epsI,deltaM,.True.,gTFu,gPFu(:,10:153),BRFu(:,10:153))

End If 
 
End If 
Else 
Call FuThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,MFu,MFu2,              & 
& Mhh,Mhh2,MHp,MHp2,MNv0,MNv02,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,               & 
& ZUL,ZW,ZZ,g1,g2,g3,lam1,Yu,Yd,Ye,MDF,mH2,v,gThh,gTVWp,gTVZ,gFuFucFdFd,gFuFdcFeFv,      & 
& gFuFdcFreNv0,gFuFucFeFe,gFuFucFuFu,gFuFucFreFre,gFuFucFvFv,gFuFucNv0Nv0,               & 
& epsI,deltaM,.False.,gTFu,gPFu(:,10:153),BRFu(:,10:153))

End If 
Do i1=1,3
gTFu(i1) =Sum(gPFu(i1,:)) 
If (gTFu(i1).Gt.0._dp) BRFu(i1,: ) =gPFu(i1,:)/gTFu(i1) 
End Do 
 

If (.Not.CTBD) Then 
If (Enable3BDecaysF) Then 
If (MaxVal(gTFe).Lt.MaxVal(fac3*Abs(MFe))) Then 
Call FeThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,MFu,MFu2,              & 
& Mhh,Mhh2,MHp,MHp2,MNv0,MNv02,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,               & 
& ZUL,ZW,ZZ,g1,g2,g3,lam1,Yu,Yd,Ye,MDF,mH2,v,gThh,gTVWp,gTVZ,gFeFecFdFd,gFeFecFeFe,      & 
& gFeFecFuFu,gFeFecFreFre,gFeFecFvFv,gFeFecNv0Nv0,gFeFvcFuFd,gFeFvcNv0Fre,               & 
& epsI,deltaM,.False.,gTFe,gPFe(:,7:150),BRFe(:,7:150))

Else 
Call FeThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,MFu,MFu2,              & 
& Mhh,Mhh2,MHp,MHp2,MNv0,MNv02,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,               & 
& ZUL,ZW,ZZ,g1,g2,g3,lam1,Yu,Yd,Ye,MDF,mH2,v,gThh,gTVWp,gTVZ,gFeFecFdFd,gFeFecFeFe,      & 
& gFeFecFuFu,gFeFecFreFre,gFeFecFvFv,gFeFecNv0Nv0,gFeFvcFuFd,gFeFvcNv0Fre,               & 
& epsI,deltaM,.True.,gTFe,gPFe(:,7:150),BRFe(:,7:150))

End If 
 
End If 
Else 
Call FeThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,MFu,MFu2,              & 
& Mhh,Mhh2,MHp,MHp2,MNv0,MNv02,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,               & 
& ZUL,ZW,ZZ,g1,g2,g3,lam1,Yu,Yd,Ye,MDF,mH2,v,gThh,gTVWp,gTVZ,gFeFecFdFd,gFeFecFeFe,      & 
& gFeFecFuFu,gFeFecFreFre,gFeFecFvFv,gFeFecNv0Nv0,gFeFvcFuFd,gFeFvcNv0Fre,               & 
& epsI,deltaM,.False.,gTFe,gPFe(:,7:150),BRFe(:,7:150))

End If 
Do i1=1,3
gTFe(i1) =Sum(gPFe(i1,:)) 
If (gTFe(i1).Gt.0._dp) BRFe(i1,: ) =gPFe(i1,:)/gTFe(i1) 
End Do 
 

If (.Not.CTBD) Then 
If (Enable3BDecaysF) Then 
If (MaxVal(gTFd).Lt.MaxVal(fac3*Abs(MFd))) Then 
Call FdThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,MFu,MFu2,              & 
& Mhh,Mhh2,MHp,MHp2,MNv0,MNv02,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,               & 
& ZUL,ZW,ZZ,g1,g2,g3,lam1,Yu,Yd,Ye,MDF,mH2,v,gThh,gTVWp,gTVZ,gFdFdcFdFd,gFdFdcFeFe,      & 
& gFdFdcFuFu,gFdFdcFreFre,gFdFdcFvFv,gFdFdcNv0Nv0,gFdFucFvFe,gFdFucNv0Fre,               & 
& epsI,deltaM,.False.,gTFd,gPFd(:,10:153),BRFd(:,10:153))

Else 
Call FdThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,MFu,MFu2,              & 
& Mhh,Mhh2,MHp,MHp2,MNv0,MNv02,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,               & 
& ZUL,ZW,ZZ,g1,g2,g3,lam1,Yu,Yd,Ye,MDF,mH2,v,gThh,gTVWp,gTVZ,gFdFdcFdFd,gFdFdcFeFe,      & 
& gFdFdcFuFu,gFdFdcFreFre,gFdFdcFvFv,gFdFdcNv0Nv0,gFdFucFvFe,gFdFucNv0Fre,               & 
& epsI,deltaM,.True.,gTFd,gPFd(:,10:153),BRFd(:,10:153))

End If 
 
End If 
Else 
Call FdThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,MFu,MFu2,              & 
& Mhh,Mhh2,MHp,MHp2,MNv0,MNv02,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,               & 
& ZUL,ZW,ZZ,g1,g2,g3,lam1,Yu,Yd,Ye,MDF,mH2,v,gThh,gTVWp,gTVZ,gFdFdcFdFd,gFdFdcFeFe,      & 
& gFdFdcFuFu,gFdFdcFreFre,gFdFdcFvFv,gFdFdcNv0Nv0,gFdFucFvFe,gFdFucNv0Fre,               & 
& epsI,deltaM,.False.,gTFd,gPFd(:,10:153),BRFd(:,10:153))

End If 
Do i1=1,3
gTFd(i1) =Sum(gPFd(i1,:)) 
If (gTFd(i1).Gt.0._dp) BRFd(i1,: ) =gPFd(i1,:)/gTFd(i1) 
End Do 
 

! No 3-body decays for Fv  
! No 3-body decays for VZ  
! No 3-body decays for VWp  
! No 3-body decays for hh  
If (.Not.CTBD) Then 
If (Enable3BDecaysF) Then 
If (gTNv0.Lt.fac3*Abs(MNv0)) Then 
Call Nv0ThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,MFu,MFu2,             & 
& Mhh,Mhh2,MHp,MHp2,MNv0,MNv02,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,               & 
& ZUL,ZW,ZZ,g1,g2,g3,lam1,Yu,Yd,Ye,MDF,mH2,v,gTVWp,gNv0FrecFdFu,gNv0FrecFeFv,            & 
& epsI,deltaM,.False.,gTNv0,gPNv0(:,3:20),BRNv0(:,3:20))

Else 
Call Nv0ThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,MFu,MFu2,             & 
& Mhh,Mhh2,MHp,MHp2,MNv0,MNv02,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,               & 
& ZUL,ZW,ZZ,g1,g2,g3,lam1,Yu,Yd,Ye,MDF,mH2,v,gTVWp,gNv0FrecFdFu,gNv0FrecFeFv,            & 
& epsI,deltaM,.True.,gTNv0,gPNv0(:,3:20),BRNv0(:,3:20))

End If 
 
End If 
Else 
Call Nv0ThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,MFu,MFu2,             & 
& Mhh,Mhh2,MHp,MHp2,MNv0,MNv02,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,               & 
& ZUL,ZW,ZZ,g1,g2,g3,lam1,Yu,Yd,Ye,MDF,mH2,v,gTVWp,gNv0FrecFdFu,gNv0FrecFeFv,            & 
& epsI,deltaM,.False.,gTNv0,gPNv0(:,3:20),BRNv0(:,3:20))

End If 
Do i1=1,1
gTNv0 =Sum(gPNv0(i1,:)) 
If (gTNv0.Gt.0._dp) BRNv0(i1,: ) =gPNv0(i1,:)/gTNv0 
End Do 
 

If (.Not.CTBD) Then 
If (Enable3BDecaysF) Then 
If (gTFre.Lt.fac3*Abs(MFre)) Then 
Call FreThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,MFu,MFu2,             & 
& Mhh,Mhh2,MHp,MHp2,MNv0,MNv02,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,               & 
& ZUL,ZW,ZZ,g1,g2,g3,lam1,Yu,Yd,Ye,MDF,mH2,v,gTVWp,gFreNv0cFuFd,gFreNv0cFvFe,            & 
& epsI,deltaM,.False.,gTFre,gPFre(:,3:20),BRFre(:,3:20))

Else 
Call FreThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,MFu,MFu2,             & 
& Mhh,Mhh2,MHp,MHp2,MNv0,MNv02,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,               & 
& ZUL,ZW,ZZ,g1,g2,g3,lam1,Yu,Yd,Ye,MDF,mH2,v,gTVWp,gFreNv0cFuFd,gFreNv0cFvFe,            & 
& epsI,deltaM,.True.,gTFre,gPFre(:,3:20),BRFre(:,3:20))

End If 
 
End If 
Else 
Call FreThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,MFu,MFu2,             & 
& Mhh,Mhh2,MHp,MHp2,MNv0,MNv02,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,               & 
& ZUL,ZW,ZZ,g1,g2,g3,lam1,Yu,Yd,Ye,MDF,mH2,v,gTVWp,gFreNv0cFuFd,gFreNv0cFvFe,            & 
& epsI,deltaM,.False.,gTFre,gPFre(:,3:20),BRFre(:,3:20))

End If 
Do i1=1,1
gTFre =Sum(gPFre(i1,:)) 
If (gTFre.Gt.0._dp) BRFre(i1,: ) =gPFre(i1,:)/gTFre 
End Do 
 

Iname = Iname - 1 
 
End Subroutine CalculateBR 
End Module BranchingRatios_SimplifiedDMDFDM 
 
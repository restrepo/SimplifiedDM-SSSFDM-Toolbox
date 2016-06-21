! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.8.5 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 22:35 on 20.6.2016   
! ----------------------------------------------------------------------  
 
 
Module BranchingRatios_SimplifiedDMSDFDM 
 
Use Control 
Use Couplings_SimplifiedDMSDFDM 
Use Model_Data_SimplifiedDMSDFDM 
Use LoopCouplings_SimplifiedDMSDFDM 
Use Fu3Decays_SimplifiedDMSDFDM 
Use Fe3Decays_SimplifiedDMSDFDM 
Use Fd3Decays_SimplifiedDMSDFDM 
Use Chi3Decays_SimplifiedDMSDFDM 
Use Fre3Decays_SimplifiedDMSDFDM 
Use SUSYDecays_SimplifiedDMSDFDM 
 
Contains 
 
Subroutine CalculateBR(CTBD,fac3,epsI,deltaM,kont,MAh,MAh2,MChi,MChi2,MFd,            & 
& MFd2,MFe,MFe2,MFre,MFre2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,               & 
& TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,ZW,ZX,ZZ,v,g1,g2,g3,lam1,Yu,Yd,Ye,lamd,lamu,Mn,             & 
& MDF,mH2,gPFu,gTFu,BRFu,gPFe,gTFe,BRFe,gPFd,gTFd,BRFd,gPFv,gTFv,BRFv,gPVZ,              & 
& gTVZ,BRVZ,gPVWp,gTVWp,BRVWp,gPhh,gThh,BRhh,gPChi,gTChi,BRChi,gPFre,gTFre,BRFre)

Real(dp), Intent(in) :: epsI, deltaM, fac3 
Integer, Intent(inout) :: kont 
Logical, Intent(in) :: CTBD 
Real(dp),Intent(in) :: g1,g2,g3,lamd,lamu,MDF

Complex(dp),Intent(in) :: lam1,Yu(3,3),Yd(3,3),Ye(3,3),Mn,mH2

Real(dp),Intent(in) :: MAh,MAh2,MChi(3),MChi2(3),MFd(3),MFd2(3),MFe(3),MFe2(3),MFre,MFre2,MFu(3),            & 
& MFu2(3),Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZZ(2,2)

Complex(dp),Intent(in) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZW(2,2),ZX(3,3)

Real(dp),Intent(in) :: v

Real(dp),Intent(inout) :: gPFu(3,183),gTFu(3),BRFu(3,183),gPFe(3,180),gTFe(3),BRFe(3,180),gPFd(3,183),          & 
& gTFd(3),BRFd(3,183),gPFv(3,3),gTFv(3),BRFv(3,3),gPVZ(1,45),gTVZ,BRVZ(1,45),            & 
& gPVWp(1,23),gTVWp,BRVWp(1,23),gPhh(1,40),gThh,BRhh(1,40),gPChi(3,163),gTChi(3),        & 
& BRChi(3,163),gPFre(1,58),gTFre,BRFre(1,58)

Complex(dp) :: cplHiggsPP,cplHiggsGG,cplPseudoHiggsPP,cplPseudoHiggsGG,cplHiggsZZvirt,               & 
& cplHiggsWWvirt

Real(dp) :: gTAh 
Real(dp) :: gFuFdcFreChi(3,3,1,3),gFuFucFdFd(3,3,3,3),gFuFdcFeFv(3,3,3,3),gFuFuChiChi(3,3,3,3),   & 
& gFuFucFeFe(3,3,3,3),gFuFucFuFu(3,3,3,3),gFuFucFreFre(3,3,1,1),gFuFucFvFv(3,3,3,3),     & 
& gFeFeChiChi(3,3,3,3),gFeFecFdFd(3,3,3,3),gFeFecFeFe(3,3,3,3),gFeFecFuFu(3,3,3,3),      & 
& gFeFecFreFre(3,3,1,1),gFeFecFvFv(3,3,3,3),gFeFvFreChi(3,3,1,3),gFeFvcFuFd(3,3,3,3),    & 
& gFdFdChiChi(3,3,3,3),gFdFdcFdFd(3,3,3,3),gFdFdcFeFe(3,3,3,3),gFdFdcFuFu(3,3,3,3),      & 
& gFdFdcFreFre(3,3,1,1),gFdFdcFvFv(3,3,3,3),gFdFuFreChi(3,3,1,3),gFdFucFvFe(3,3,3,3),    & 
& gChiChiChiChi(3,3,3,3),gChiChicFdFd(3,3,3,3),gChiChicFeFe(3,3,3,3),gChiChicFuFu(3,3,3,3),& 
& gChiChicFreFre(3,3,1,1),gChiChicFvFv(3,3,3,3),gChiFrecFdFu(3,1,3,3),gChiFrecFeFv(3,1,3,3),& 
& gFreChicFuFd(1,3,3,3),gFreChicFvFe(1,3,3,3)

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
Call FuTwoBodyDecay(-1,DeltaM,MAh,MAh2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFre,             & 
& MFre2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,               & 
& ZEL,ZUL,ZW,ZX,ZZ,g1,g2,g3,lam1,Yu,Yd,Ye,lamd,lamu,Mn,MDF,mH2,v,gPFu(:,1:9)             & 
& ,gTFu,BRFu(:,1:9))

Do i1=1,3
gTFu(i1) =Sum(gPFu(i1,:)) 
If (gTFu(i1).Gt.0._dp) BRFu(i1,: ) =gPFu(i1,:)/gTFu(i1) 
End Do 
 

gPFe = 0._dp 
gTFe = 0._dp 
BRFe = 0._dp 
Call FeTwoBodyDecay(-1,DeltaM,MAh,MAh2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFre,             & 
& MFre2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,               & 
& ZEL,ZUL,ZW,ZX,ZZ,g1,g2,g3,lam1,Yu,Yd,Ye,lamd,lamu,Mn,MDF,mH2,v,gPFe(:,1:6)             & 
& ,gTFe,BRFe(:,1:6))

Do i1=1,3
gTFe(i1) =Sum(gPFe(i1,:)) 
If (gTFe(i1).Gt.0._dp) BRFe(i1,: ) =gPFe(i1,:)/gTFe(i1) 
End Do 
 

gPFd = 0._dp 
gTFd = 0._dp 
BRFd = 0._dp 
Call FdTwoBodyDecay(-1,DeltaM,MAh,MAh2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFre,             & 
& MFre2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,               & 
& ZEL,ZUL,ZW,ZX,ZZ,g1,g2,g3,lam1,Yu,Yd,Ye,lamd,lamu,Mn,MDF,mH2,v,gPFd(:,1:9)             & 
& ,gTFd,BRFd(:,1:9))

Do i1=1,3
gTFd(i1) =Sum(gPFd(i1,:)) 
If (gTFd(i1).Gt.0._dp) BRFd(i1,: ) =gPFd(i1,:)/gTFd(i1) 
End Do 
 

gPFv = 0._dp 
gTFv = 0._dp 
BRFv = 0._dp 
Call FvTwoBodyDecay(-1,DeltaM,MAh,MAh2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFre,             & 
& MFre2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,               & 
& ZEL,ZUL,ZW,ZX,ZZ,g1,g2,g3,lam1,Yu,Yd,Ye,lamd,lamu,Mn,MDF,mH2,v,gPFv,gTFv,BRFv)

gPVZ = 0._dp 
gTVZ = 0._dp 
BRVZ = 0._dp 
Call VZTwoBodyDecay(-1,DeltaM,MAh,MAh2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFre,             & 
& MFre2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,               & 
& ZEL,ZUL,ZW,ZX,ZZ,g1,g2,g3,lam1,Yu,Yd,Ye,lamd,lamu,Mn,MDF,mH2,v,gPVZ,gTVZ,BRVZ)

! Set Goldstone Widhts 


gPVWp = 0._dp 
gTVWp = 0._dp 
BRVWp = 0._dp 
Call VWpTwoBodyDecay(-1,DeltaM,MAh,MAh2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFre,            & 
& MFre2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,               & 
& ZEL,ZUL,ZW,ZX,ZZ,g1,g2,g3,lam1,Yu,Yd,Ye,lamd,lamu,Mn,MDF,mH2,v,gPVWp,gTVWp,BRVWp)

! Set Goldstone Widhts 


gPhh = 0._dp 
gThh = 0._dp 
BRhh = 0._dp 
Call hhTwoBodyDecay(-1,DeltaM,MAh,MAh2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFre,             & 
& MFre2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,               & 
& ZEL,ZUL,ZW,ZX,ZZ,g1,g2,g3,lam1,Yu,Yd,Ye,lamd,lamu,Mn,MDF,mH2,v,gPhh,gThh,BRhh)

gPChi = 0._dp 
gTChi = 0._dp 
BRChi = 0._dp 
Call ChiTwoBodyDecay(-1,DeltaM,MAh,MAh2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFre,            & 
& MFre2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,               & 
& ZEL,ZUL,ZW,ZX,ZZ,g1,g2,g3,lam1,Yu,Yd,Ye,lamd,lamu,Mn,MDF,mH2,v,gPChi(:,1:7)            & 
& ,gTChi,BRChi(:,1:7))

Do i1=1,3
gTChi(i1) =Sum(gPChi(i1,:)) 
If (gTChi(i1).Gt.0._dp) BRChi(i1,: ) =gPChi(i1,:)/gTChi(i1) 
End Do 
 

gPFre = 0._dp 
gTFre = 0._dp 
BRFre = 0._dp 
Call FreTwoBodyDecay(-1,DeltaM,MAh,MAh2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFre,            & 
& MFre2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,               & 
& ZEL,ZUL,ZW,ZX,ZZ,g1,g2,g3,lam1,Yu,Yd,Ye,lamd,lamu,Mn,MDF,mH2,v,gPFre(:,1:4)            & 
& ,gTFre,BRFre(:,1:4))

Do i1=1,1
gTFre =Sum(gPFre(i1,:)) 
If (gTFre.Gt.0._dp) BRFre(i1,: ) =gPFre(i1,:)/gTFre 
End Do 
 

If (.Not.CTBD) Then 
If (Enable3BDecaysF) Then 
If (MaxVal(gTFu).Lt.MaxVal(fac3*Abs(MFu))) Then 
Call FuThreeBodyDecay(-1,MAh,MAh2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFre,MFre2,            & 
& MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,             & 
& ZW,ZX,ZZ,g1,g2,g3,lam1,Yu,Yd,Ye,lamd,lamu,Mn,MDF,mH2,v,gThh,gTVWp,gTVZ,gFuFdcFreChi,   & 
& gFuFucFdFd,gFuFdcFeFv,gFuFuChiChi,gFuFucFeFe,gFuFucFuFu,gFuFucFreFre,gFuFucFvFv,       & 
& epsI,deltaM,.False.,gTFu,gPFu(:,10:183),BRFu(:,10:183))

Else 
Call FuThreeBodyDecay(-1,MAh,MAh2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFre,MFre2,            & 
& MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,             & 
& ZW,ZX,ZZ,g1,g2,g3,lam1,Yu,Yd,Ye,lamd,lamu,Mn,MDF,mH2,v,gThh,gTVWp,gTVZ,gFuFdcFreChi,   & 
& gFuFucFdFd,gFuFdcFeFv,gFuFuChiChi,gFuFucFeFe,gFuFucFuFu,gFuFucFreFre,gFuFucFvFv,       & 
& epsI,deltaM,.True.,gTFu,gPFu(:,10:183),BRFu(:,10:183))

End If 
 
End If 
Else 
Call FuThreeBodyDecay(-1,MAh,MAh2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFre,MFre2,            & 
& MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,             & 
& ZW,ZX,ZZ,g1,g2,g3,lam1,Yu,Yd,Ye,lamd,lamu,Mn,MDF,mH2,v,gThh,gTVWp,gTVZ,gFuFdcFreChi,   & 
& gFuFucFdFd,gFuFdcFeFv,gFuFuChiChi,gFuFucFeFe,gFuFucFuFu,gFuFucFreFre,gFuFucFvFv,       & 
& epsI,deltaM,.False.,gTFu,gPFu(:,10:183),BRFu(:,10:183))

End If 
Do i1=1,3
gTFu(i1) =Sum(gPFu(i1,:)) 
If (gTFu(i1).Gt.0._dp) BRFu(i1,: ) =gPFu(i1,:)/gTFu(i1) 
End Do 
 

If (.Not.CTBD) Then 
If (Enable3BDecaysF) Then 
If (MaxVal(gTFe).Lt.MaxVal(fac3*Abs(MFe))) Then 
Call FeThreeBodyDecay(-1,MAh,MAh2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFre,MFre2,            & 
& MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,             & 
& ZW,ZX,ZZ,g1,g2,g3,lam1,Yu,Yd,Ye,lamd,lamu,Mn,MDF,mH2,v,gThh,gTVWp,gTVZ,gFeFeChiChi,    & 
& gFeFecFdFd,gFeFecFeFe,gFeFecFuFu,gFeFecFreFre,gFeFecFvFv,gFeFvFreChi,gFeFvcFuFd,       & 
& epsI,deltaM,.False.,gTFe,gPFe(:,7:180),BRFe(:,7:180))

Else 
Call FeThreeBodyDecay(-1,MAh,MAh2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFre,MFre2,            & 
& MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,             & 
& ZW,ZX,ZZ,g1,g2,g3,lam1,Yu,Yd,Ye,lamd,lamu,Mn,MDF,mH2,v,gThh,gTVWp,gTVZ,gFeFeChiChi,    & 
& gFeFecFdFd,gFeFecFeFe,gFeFecFuFu,gFeFecFreFre,gFeFecFvFv,gFeFvFreChi,gFeFvcFuFd,       & 
& epsI,deltaM,.True.,gTFe,gPFe(:,7:180),BRFe(:,7:180))

End If 
 
End If 
Else 
Call FeThreeBodyDecay(-1,MAh,MAh2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFre,MFre2,            & 
& MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,             & 
& ZW,ZX,ZZ,g1,g2,g3,lam1,Yu,Yd,Ye,lamd,lamu,Mn,MDF,mH2,v,gThh,gTVWp,gTVZ,gFeFeChiChi,    & 
& gFeFecFdFd,gFeFecFeFe,gFeFecFuFu,gFeFecFreFre,gFeFecFvFv,gFeFvFreChi,gFeFvcFuFd,       & 
& epsI,deltaM,.False.,gTFe,gPFe(:,7:180),BRFe(:,7:180))

End If 
Do i1=1,3
gTFe(i1) =Sum(gPFe(i1,:)) 
If (gTFe(i1).Gt.0._dp) BRFe(i1,: ) =gPFe(i1,:)/gTFe(i1) 
End Do 
 

If (.Not.CTBD) Then 
If (Enable3BDecaysF) Then 
If (MaxVal(gTFd).Lt.MaxVal(fac3*Abs(MFd))) Then 
Call FdThreeBodyDecay(-1,MAh,MAh2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFre,MFre2,            & 
& MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,             & 
& ZW,ZX,ZZ,g1,g2,g3,lam1,Yu,Yd,Ye,lamd,lamu,Mn,MDF,mH2,v,gThh,gTVWp,gTVZ,gFdFdChiChi,    & 
& gFdFdcFdFd,gFdFdcFeFe,gFdFdcFuFu,gFdFdcFreFre,gFdFdcFvFv,gFdFuFreChi,gFdFucFvFe,       & 
& epsI,deltaM,.False.,gTFd,gPFd(:,10:183),BRFd(:,10:183))

Else 
Call FdThreeBodyDecay(-1,MAh,MAh2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFre,MFre2,            & 
& MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,             & 
& ZW,ZX,ZZ,g1,g2,g3,lam1,Yu,Yd,Ye,lamd,lamu,Mn,MDF,mH2,v,gThh,gTVWp,gTVZ,gFdFdChiChi,    & 
& gFdFdcFdFd,gFdFdcFeFe,gFdFdcFuFu,gFdFdcFreFre,gFdFdcFvFv,gFdFuFreChi,gFdFucFvFe,       & 
& epsI,deltaM,.True.,gTFd,gPFd(:,10:183),BRFd(:,10:183))

End If 
 
End If 
Else 
Call FdThreeBodyDecay(-1,MAh,MAh2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFre,MFre2,            & 
& MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,             & 
& ZW,ZX,ZZ,g1,g2,g3,lam1,Yu,Yd,Ye,lamd,lamu,Mn,MDF,mH2,v,gThh,gTVWp,gTVZ,gFdFdChiChi,    & 
& gFdFdcFdFd,gFdFdcFeFe,gFdFdcFuFu,gFdFdcFreFre,gFdFdcFvFv,gFdFuFreChi,gFdFucFvFe,       & 
& epsI,deltaM,.False.,gTFd,gPFd(:,10:183),BRFd(:,10:183))

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
If (MaxVal(gTChi).Lt.MaxVal(fac3*Abs(MChi))) Then 
Call ChiThreeBodyDecay(-1,MAh,MAh2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFre,MFre2,           & 
& MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,             & 
& ZW,ZX,ZZ,g1,g2,g3,lam1,Yu,Yd,Ye,lamd,lamu,Mn,MDF,mH2,v,gThh,gTVWp,gTVZ,gChiChiChiChi,  & 
& gChiChicFdFd,gChiChicFeFe,gChiChicFuFu,gChiChicFreFre,gChiChicFvFv,gChiFrecFdFu,       & 
& gChiFrecFeFv,epsI,deltaM,.False.,gTChi,gPChi(:,8:163),BRChi(:,8:163))

Else 
Call ChiThreeBodyDecay(-1,MAh,MAh2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFre,MFre2,           & 
& MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,             & 
& ZW,ZX,ZZ,g1,g2,g3,lam1,Yu,Yd,Ye,lamd,lamu,Mn,MDF,mH2,v,gThh,gTVWp,gTVZ,gChiChiChiChi,  & 
& gChiChicFdFd,gChiChicFeFe,gChiChicFuFu,gChiChicFreFre,gChiChicFvFv,gChiFrecFdFu,       & 
& gChiFrecFeFv,epsI,deltaM,.True.,gTChi,gPChi(:,8:163),BRChi(:,8:163))

End If 
 
End If 
Else 
Call ChiThreeBodyDecay(-1,MAh,MAh2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFre,MFre2,           & 
& MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,             & 
& ZW,ZX,ZZ,g1,g2,g3,lam1,Yu,Yd,Ye,lamd,lamu,Mn,MDF,mH2,v,gThh,gTVWp,gTVZ,gChiChiChiChi,  & 
& gChiChicFdFd,gChiChicFeFe,gChiChicFuFu,gChiChicFreFre,gChiChicFvFv,gChiFrecFdFu,       & 
& gChiFrecFeFv,epsI,deltaM,.False.,gTChi,gPChi(:,8:163),BRChi(:,8:163))

End If 
Do i1=1,3
gTChi(i1) =Sum(gPChi(i1,:)) 
If (gTChi(i1).Gt.0._dp) BRChi(i1,: ) =gPChi(i1,:)/gTChi(i1) 
End Do 
 

If (.Not.CTBD) Then 
If (Enable3BDecaysF) Then 
If (gTFre.Lt.fac3*Abs(MFre)) Then 
Call FreThreeBodyDecay(-1,MAh,MAh2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFre,MFre2,           & 
& MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,             & 
& ZW,ZX,ZZ,g1,g2,g3,lam1,Yu,Yd,Ye,lamd,lamu,Mn,MDF,mH2,v,gTVWp,gFreChicFuFd,             & 
& gFreChicFvFe,epsI,deltaM,.False.,gTFre,gPFre(:,5:58),BRFre(:,5:58))

Else 
Call FreThreeBodyDecay(-1,MAh,MAh2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFre,MFre2,           & 
& MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,             & 
& ZW,ZX,ZZ,g1,g2,g3,lam1,Yu,Yd,Ye,lamd,lamu,Mn,MDF,mH2,v,gTVWp,gFreChicFuFd,             & 
& gFreChicFvFe,epsI,deltaM,.True.,gTFre,gPFre(:,5:58),BRFre(:,5:58))

End If 
 
End If 
Else 
Call FreThreeBodyDecay(-1,MAh,MAh2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFre,MFre2,           & 
& MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,             & 
& ZW,ZX,ZZ,g1,g2,g3,lam1,Yu,Yd,Ye,lamd,lamu,Mn,MDF,mH2,v,gTVWp,gFreChicFuFd,             & 
& gFreChicFvFe,epsI,deltaM,.False.,gTFre,gPFre(:,5:58),BRFre(:,5:58))

End If 
Do i1=1,1
gTFre =Sum(gPFre(i1,:)) 
If (gTFre.Gt.0._dp) BRFre(i1,: ) =gPFre(i1,:)/gTFre 
End Do 
 

Iname = Iname - 1 
 
End Subroutine CalculateBR 
End Module BranchingRatios_SimplifiedDMSDFDM 
 
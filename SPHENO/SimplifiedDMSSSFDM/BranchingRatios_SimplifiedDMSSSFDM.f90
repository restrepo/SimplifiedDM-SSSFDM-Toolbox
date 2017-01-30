! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.9.1 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 16:52 on 30.1.2017   
! ----------------------------------------------------------------------  
 
 
Module BranchingRatios_SimplifiedDMSSSFDM 
 
Use Control 
Use Couplings_SimplifiedDMSSSFDM 
Use Model_Data_SimplifiedDMSSSFDM 
Use LoopCouplings_SimplifiedDMSSSFDM 
Use Fu3Decays_SimplifiedDMSSSFDM 
Use Fe3Decays_SimplifiedDMSSSFDM 
Use Fd3Decays_SimplifiedDMSSSFDM 
Use Fre3Decays_SimplifiedDMSSSFDM 
Use TreeLevelDecays_SimplifiedDMSSSFDM 


 Contains 
 
Subroutine CalculateBR(CTBD,fac3,epsI,deltaM,kont,MAh,MAh2,MFd,MFd2,MFe,              & 
& MFe2,MFre,MFre2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,Mss,Mss2,MVWp,MVWp2,               & 
& MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZW,ZZ,v,g1,g2,g3,LS,LSH,Lam,Yu,Ys,              & 
& Yd,Ye,MFS,MS2,Mu,gPFu,gTFu,BRFu,gPFe,gTFe,BRFe,gPFd,gTFd,BRFd,gPhh,gThh,               & 
& BRhh,gPFre,gTFre,BRFre,gPss,gTss,BRss)

Real(dp), Intent(in) :: epsI, deltaM, fac3 
Integer, Intent(inout) :: kont 
Logical, Intent(in) :: CTBD 
Real(dp),Intent(in) :: g1,g2,g3,Ys(3),MS2

Complex(dp),Intent(in) :: LS,LSH,Lam,Yu(3,3),Yd(3,3),Ye(3,3),MFS,Mu

Real(dp),Intent(in) :: MAh,MAh2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFre,MFre2,MFu(3),MFu2(3),MFv(3),              & 
& MFv2(3),Mhh,Mhh2,MHp,MHp2,Mss,Mss2,MVWp,MVWp2,MVZ,MVZ2,TW,ZZ(2,2)

Complex(dp),Intent(in) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),UV(3,3),ZW(2,2)

Real(dp),Intent(in) :: v

Real(dp),Intent(inout) :: gPFu(3,147),gTFu(3),BRFu(3,147),gPFe(3,151),gTFe(3),BRFe(3,151),gPFd(3,147),          & 
& gTFd(3),BRFd(3,147),gPhh(1,35),gThh,BRhh(1,35),gPFre(1,4),gTFre,BRFre(1,4),            & 
& gPss(1,4),gTss,BRss(1,4)

Complex(dp) :: cplHiggsPP,cplHiggsGG,cplPseudoHiggsPP,cplPseudoHiggsGG,cplHiggsZZvirt,               & 
& cplHiggsWWvirt

Real(dp) :: gTAh 
Real(dp) :: gFuFucFdFd(3,3,3,3),gFuFdcFeFv(3,3,3,3),gFuFucFeFe(3,3,3,3),gFuFucFuFu(3,3,3,3),      & 
& gFuFucFreFre(3,3,1,1),gFuFucFvFv(3,3,3,3),gFeFecFdFd(3,3,3,3),gFeFecFeFe(3,3,3,3),     & 
& gFeFecFuFu(3,3,3,3),gFeFecFreFre(3,3,1,1),gFeFecFvFv(3,3,3,3),gFeFrecFeFre(3,1,3,1),   & 
& gFeFvcFuFd(3,3,3,3),gFdFdcFdFd(3,3,3,3),gFdFdcFeFe(3,3,3,3),gFdFdcFuFu(3,3,3,3),       & 
& gFdFdcFreFre(3,3,1,1),gFdFdcFvFv(3,3,3,3),gFdFucFvFe(3,3,3,3)

Complex(dp) :: coup 
Real(dp) :: vev 
Real(dp) :: gTVZ,gTVWp

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateBR'
 
Write(*,*) "Calculating branching ratios and decay widths" 
gTVWp = gamW 
gTVZ = gamZ 
gPFu = 0._dp 
gTFu = 0._dp 
BRFu = 0._dp 
Call FuTwoBodyDecay(-1,DeltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,MFu,              & 
& MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,Mss,Mss2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,               & 
& ZUR,ZDL,ZEL,ZUL,UV,ZW,ZZ,g1,g2,g3,LS,LSH,Lam,Yu,Ys,Yd,Ye,MFS,MS2,Mu,v,gPFu(:,1:9)      & 
& ,gTFu,BRFu(:,1:9))

Do i1=1,3
gTFu(i1) =Sum(gPFu(i1,:)) 
If (gTFu(i1).Gt.0._dp) BRFu(i1,: ) =gPFu(i1,:)/gTFu(i1) 
End Do 
 

gPFe = 0._dp 
gTFe = 0._dp 
BRFe = 0._dp 
Call FeTwoBodyDecay(-1,DeltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,MFu,              & 
& MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,Mss,Mss2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,               & 
& ZUR,ZDL,ZEL,ZUL,UV,ZW,ZZ,g1,g2,g3,LS,LSH,Lam,Yu,Ys,Yd,Ye,MFS,MS2,Mu,v,gPFe(:,1:10)     & 
& ,gTFe,BRFe(:,1:10))

Do i1=1,3
gTFe(i1) =Sum(gPFe(i1,:)) 
If (gTFe(i1).Gt.0._dp) BRFe(i1,: ) =gPFe(i1,:)/gTFe(i1) 
End Do 
 

gPFd = 0._dp 
gTFd = 0._dp 
BRFd = 0._dp 
Call FdTwoBodyDecay(-1,DeltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,MFu,              & 
& MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,Mss,Mss2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,               & 
& ZUR,ZDL,ZEL,ZUL,UV,ZW,ZZ,g1,g2,g3,LS,LSH,Lam,Yu,Ys,Yd,Ye,MFS,MS2,Mu,v,gPFd(:,1:9)      & 
& ,gTFd,BRFd(:,1:9))

Do i1=1,3
gTFd(i1) =Sum(gPFd(i1,:)) 
If (gTFd(i1).Gt.0._dp) BRFd(i1,: ) =gPFd(i1,:)/gTFd(i1) 
End Do 
 

gPhh = 0._dp 
gThh = 0._dp 
BRhh = 0._dp 
Call hhTwoBodyDecay(-1,DeltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,MFu,              & 
& MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,Mss,Mss2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,               & 
& ZUR,ZDL,ZEL,ZUL,UV,ZW,ZZ,g1,g2,g3,LS,LSH,Lam,Yu,Ys,Yd,Ye,MFS,MS2,Mu,v,gPhh,            & 
& gThh,BRhh)

gPFre = 0._dp 
gTFre = 0._dp 
BRFre = 0._dp 
Call FreTwoBodyDecay(-1,DeltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,MFu,             & 
& MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,Mss,Mss2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,               & 
& ZUR,ZDL,ZEL,ZUL,UV,ZW,ZZ,g1,g2,g3,LS,LSH,Lam,Yu,Ys,Yd,Ye,MFS,MS2,Mu,v,gPFre(:,1:4)     & 
& ,gTFre,BRFre(:,1:4))

Do i1=1,1
gTFre =Sum(gPFre(i1,:)) 
If (gTFre.Gt.0._dp) BRFre(i1,: ) =gPFre(i1,:)/gTFre 
End Do 
 

gPss = 0._dp 
gTss = 0._dp 
BRss = 0._dp 
Call ssTwoBodyDecay(-1,DeltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,MFu,              & 
& MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,Mss,Mss2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,               & 
& ZUR,ZDL,ZEL,ZUL,UV,ZW,ZZ,g1,g2,g3,LS,LSH,Lam,Yu,Ys,Yd,Ye,MFS,MS2,Mu,v,gPss,            & 
& gTss,BRss)

If (.Not.CTBD) Then 
If (Enable3BDecaysF) Then 
If (MaxVal(gTFu).Lt.MaxVal(fac3*Abs(MFu))) Then 
Call FuThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,MFu,MFu2,              & 
& MFv,MFv2,Mhh,Mhh2,MHp,MHp2,Mss,Mss2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,            & 
& ZEL,ZUL,UV,ZW,ZZ,g1,g2,g3,LS,LSH,Lam,Yu,Ys,Yd,Ye,MFS,MS2,Mu,v,gThh,gTVWp,              & 
& gTVZ,gFuFucFdFd,gFuFdcFeFv,gFuFucFeFe,gFuFucFuFu,gFuFucFreFre,gFuFucFvFv,              & 
& epsI,deltaM,.False.,gTFu,gPFu(:,10:147),BRFu(:,10:147))

Else 
Call FuThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,MFu,MFu2,              & 
& MFv,MFv2,Mhh,Mhh2,MHp,MHp2,Mss,Mss2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,            & 
& ZEL,ZUL,UV,ZW,ZZ,g1,g2,g3,LS,LSH,Lam,Yu,Ys,Yd,Ye,MFS,MS2,Mu,v,gThh,gTVWp,              & 
& gTVZ,gFuFucFdFd,gFuFdcFeFv,gFuFucFeFe,gFuFucFuFu,gFuFucFreFre,gFuFucFvFv,              & 
& epsI,deltaM,.True.,gTFu,gPFu(:,10:147),BRFu(:,10:147))

End If 
 
End If 
Else 
Call FuThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,MFu,MFu2,              & 
& MFv,MFv2,Mhh,Mhh2,MHp,MHp2,Mss,Mss2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,            & 
& ZEL,ZUL,UV,ZW,ZZ,g1,g2,g3,LS,LSH,Lam,Yu,Ys,Yd,Ye,MFS,MS2,Mu,v,gThh,gTVWp,              & 
& gTVZ,gFuFucFdFd,gFuFdcFeFv,gFuFucFeFe,gFuFucFuFu,gFuFucFreFre,gFuFucFvFv,              & 
& epsI,deltaM,.False.,gTFu,gPFu(:,10:147),BRFu(:,10:147))

End If 
Do i1=1,3
gTFu(i1) =Sum(gPFu(i1,:)) 
If (gTFu(i1).Gt.0._dp) BRFu(i1,: ) =gPFu(i1,:)/gTFu(i1) 
End Do 
 

If (.Not.CTBD) Then 
If (Enable3BDecaysF) Then 
If (MaxVal(gTFe).Lt.MaxVal(fac3*Abs(MFe))) Then 
Call FeThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,MFu,MFu2,              & 
& MFv,MFv2,Mhh,Mhh2,MHp,MHp2,Mss,Mss2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,            & 
& ZEL,ZUL,UV,ZW,ZZ,g1,g2,g3,LS,LSH,Lam,Yu,Ys,Yd,Ye,MFS,MS2,Mu,v,gThh,gTss,               & 
& gTVWp,gTVZ,gFeFecFdFd,gFeFecFeFe,gFeFecFuFu,gFeFecFreFre,gFeFecFvFv,gFeFrecFeFre,      & 
& gFeFvcFuFd,epsI,deltaM,.False.,gTFe,gPFe(:,11:151),BRFe(:,11:151))

Else 
Call FeThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,MFu,MFu2,              & 
& MFv,MFv2,Mhh,Mhh2,MHp,MHp2,Mss,Mss2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,            & 
& ZEL,ZUL,UV,ZW,ZZ,g1,g2,g3,LS,LSH,Lam,Yu,Ys,Yd,Ye,MFS,MS2,Mu,v,gThh,gTss,               & 
& gTVWp,gTVZ,gFeFecFdFd,gFeFecFeFe,gFeFecFuFu,gFeFecFreFre,gFeFecFvFv,gFeFrecFeFre,      & 
& gFeFvcFuFd,epsI,deltaM,.True.,gTFe,gPFe(:,11:151),BRFe(:,11:151))

End If 
 
End If 
Else 
Call FeThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,MFu,MFu2,              & 
& MFv,MFv2,Mhh,Mhh2,MHp,MHp2,Mss,Mss2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,            & 
& ZEL,ZUL,UV,ZW,ZZ,g1,g2,g3,LS,LSH,Lam,Yu,Ys,Yd,Ye,MFS,MS2,Mu,v,gThh,gTss,               & 
& gTVWp,gTVZ,gFeFecFdFd,gFeFecFeFe,gFeFecFuFu,gFeFecFreFre,gFeFecFvFv,gFeFrecFeFre,      & 
& gFeFvcFuFd,epsI,deltaM,.False.,gTFe,gPFe(:,11:151),BRFe(:,11:151))

End If 
Do i1=1,3
gTFe(i1) =Sum(gPFe(i1,:)) 
If (gTFe(i1).Gt.0._dp) BRFe(i1,: ) =gPFe(i1,:)/gTFe(i1) 
End Do 
 

If (.Not.CTBD) Then 
If (Enable3BDecaysF) Then 
If (MaxVal(gTFd).Lt.MaxVal(fac3*Abs(MFd))) Then 
Call FdThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,MFu,MFu2,              & 
& MFv,MFv2,Mhh,Mhh2,MHp,MHp2,Mss,Mss2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,            & 
& ZEL,ZUL,UV,ZW,ZZ,g1,g2,g3,LS,LSH,Lam,Yu,Ys,Yd,Ye,MFS,MS2,Mu,v,gThh,gTVWp,              & 
& gTVZ,gFdFdcFdFd,gFdFdcFeFe,gFdFdcFuFu,gFdFdcFreFre,gFdFdcFvFv,gFdFucFvFe,              & 
& epsI,deltaM,.False.,gTFd,gPFd(:,10:147),BRFd(:,10:147))

Else 
Call FdThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,MFu,MFu2,              & 
& MFv,MFv2,Mhh,Mhh2,MHp,MHp2,Mss,Mss2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,            & 
& ZEL,ZUL,UV,ZW,ZZ,g1,g2,g3,LS,LSH,Lam,Yu,Ys,Yd,Ye,MFS,MS2,Mu,v,gThh,gTVWp,              & 
& gTVZ,gFdFdcFdFd,gFdFdcFeFe,gFdFdcFuFu,gFdFdcFreFre,gFdFdcFvFv,gFdFucFvFe,              & 
& epsI,deltaM,.True.,gTFd,gPFd(:,10:147),BRFd(:,10:147))

End If 
 
End If 
Else 
Call FdThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,MFu,MFu2,              & 
& MFv,MFv2,Mhh,Mhh2,MHp,MHp2,Mss,Mss2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,            & 
& ZEL,ZUL,UV,ZW,ZZ,g1,g2,g3,LS,LSH,Lam,Yu,Ys,Yd,Ye,MFS,MS2,Mu,v,gThh,gTVWp,              & 
& gTVZ,gFdFdcFdFd,gFdFdcFeFe,gFdFdcFuFu,gFdFdcFreFre,gFdFdcFvFv,gFdFucFvFe,              & 
& epsI,deltaM,.False.,gTFd,gPFd(:,10:147),BRFd(:,10:147))

End If 
Do i1=1,3
gTFd(i1) =Sum(gPFd(i1,:)) 
If (gTFd(i1).Gt.0._dp) BRFd(i1,: ) =gPFd(i1,:)/gTFd(i1) 
End Do 
 

! No 3-body decays for hh  
If (.Not.CTBD) Then 
If (Enable3BDecaysF) Then 
If (gTFre.Lt.fac3*Abs(MFre)) Then 
Call FreThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,MFu,MFu2,             & 
& MFv,MFv2,Mhh,Mhh2,MHp,MHp2,Mss,Mss2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,            & 
& ZEL,ZUL,UV,ZW,ZZ,g1,g2,g3,LS,LSH,Lam,Yu,Ys,Yd,Ye,MFS,MS2,Mu,v,epsI,deltaM,             & 
& .False.,gTFre,gPFre(:,5:4),BRFre(:,5:4))

Else 
Call FreThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,MFu,MFu2,             & 
& MFv,MFv2,Mhh,Mhh2,MHp,MHp2,Mss,Mss2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,            & 
& ZEL,ZUL,UV,ZW,ZZ,g1,g2,g3,LS,LSH,Lam,Yu,Ys,Yd,Ye,MFS,MS2,Mu,v,epsI,deltaM,             & 
& .True.,gTFre,gPFre(:,5:4),BRFre(:,5:4))

End If 
 
End If 
Else 
Call FreThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,MFu,MFu2,             & 
& MFv,MFv2,Mhh,Mhh2,MHp,MHp2,Mss,Mss2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,            & 
& ZEL,ZUL,UV,ZW,ZZ,g1,g2,g3,LS,LSH,Lam,Yu,Ys,Yd,Ye,MFS,MS2,Mu,v,epsI,deltaM,             & 
& .False.,gTFre,gPFre(:,5:4),BRFre(:,5:4))

End If 
Do i1=1,1
gTFre =Sum(gPFre(i1,:)) 
If (gTFre.Gt.0._dp) BRFre(i1,: ) =gPFre(i1,:)/gTFre 
End Do 
 

! No 3-body decays for ss  
Iname = Iname - 1 
 
End Subroutine CalculateBR 
End Module BranchingRatios_SimplifiedDMSSSFDM 
 
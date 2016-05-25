! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.8.5 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 23:13 on 24.5.2016   
! ----------------------------------------------------------------------  
 
 
Module BranchingRatios_Zee 
 
Use Control 
Use Couplings_Zee 
Use Model_Data_Zee 
Use LoopCouplings_Zee 
Use Fu3Decays_Zee 
Use Fe3Decays_Zee 
Use Fd3Decays_Zee 
Use SUSYDecays_Zee 
 
Contains 
 
Subroutine CalculateBR(CTBD,fac3,epsI,deltaM,kont,MAh,MAh2,MFd,MFd2,MFe,              & 
& MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHm,MHm2,MVWm,MVWm2,MVZ,MVZ2,TW,ZDR,ZER,               & 
& ZUR,v,ZDL,ZEL,ZUL,UV,ZA,ZH,ZP,ZW,ZZ,alphaH,betaH,vd,vu,g1,g2,g3,Lam6,Lam5,             & 
& Lam7,Lam10,Lam1,Lam4,Lam3,Lam2,Lam8,Lam9,Lamh,epsU,Yu,Yd,Ye,epsD,epsE,Yh,              & 
& Mu,M12,M112,M222,Mh,gPFu,gTFu,BRFu,gPFe,gTFe,BRFe,gPFd,gTFd,BRFd,gPFv,gTFv,            & 
& BRFv,gPhh,gThh,BRhh,gPAh,gTAh,BRAh,gPHm,gTHm,BRHm)

Real(dp), Intent(in) :: epsI, deltaM, fac3 
Integer, Intent(inout) :: kont 
Logical, Intent(in) :: CTBD 
Real(dp),Intent(in) :: g1,g2,g3,Lam6,Lam5,Lam7,Lam10,Mu,M12

Complex(dp),Intent(in) :: Lam1,Lam4,Lam3,Lam2,Lam8,Lam9,Lamh,epsU(3,3),Yu(3,3),Yd(3,3),Ye(3,3),epsD(3,3),       & 
& epsE(3,3),Yh(3,3),M112,M222,Mh

Real(dp),Intent(in) :: MAh(2),MAh2(2),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(3),MFv2(3),           & 
& Mhh(2),Mhh2(2),MHm(3),MHm2(3),MVWm,MVWm2,MVZ,MVZ2,TW,v,ZA(2,2),ZH(2,2),ZZ(2,2),        & 
& alphaH,betaH

Complex(dp),Intent(in) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),UV(3,3),ZP(3,3),ZW(2,2)

Real(dp),Intent(in) :: vd,vu

Real(dp),Intent(inout) :: gPFu(3,156),gTFu(3),BRFu(3,156),gPFe(3,156),gTFe(3),BRFe(3,156),gPFd(3,156),          & 
& gTFd(3),BRFd(3,156),gPFv(3,12),gTFv(3),BRFv(3,12),gPhh(2,44),gThh(2),BRhh(2,44),       & 
& gPAh(2,39),gTAh(2),BRAh(2,39),gPHm(3,30),gTHm(3),BRHm(3,30)

Complex(dp) :: cplHiggsPP(2),cplHiggsGG(2),cplPseudoHiggsPP(2),cplPseudoHiggsGG(2),cplHiggsZZvirt(2),& 
& cplHiggsWWvirt(2)

Real(dp) :: gFuFucFdFd(3,3,3,3),gFuFucFeFe(3,3,3,3),gFuFucFuFu(3,3,3,3),gFuFdcFeFv(3,3,3,3),      & 
& gFuFuFvFv(3,3,3,3),gFeFecFdFd(3,3,3,3),gFeFecFeFe(3,3,3,3),gFeFecFuFu(3,3,3,3),        & 
& gFeFeFvFv(3,3,3,3),gFeFvcFuFd(3,3,3,3),gFdFdcFdFd(3,3,3,3),gFdFdcFeFe(3,3,3,3),        & 
& gFdFdcFuFu(3,3,3,3),gFdFdFvFv(3,3,3,3),gFdFuFvFe(3,3,3,3)

Complex(dp) :: coup 
Real(dp) :: vev 
Real(dp) :: gTVZ,gTVWm

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateBR'
 
Write(*,*) "Calculating branching ratios and decay widths" 
gTVWm = gamW 
gTVZ = gamZ 
gPFu = 0._dp 
gTFu = 0._dp 
BRFu = 0._dp 
Call FuTwoBodyDecay(-1,DeltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,           & 
& Mhh,Mhh2,MHm,MHm2,MVWm,MVWm2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,v,ZDL,ZEL,ZUL,UV,ZA,              & 
& ZH,ZP,ZW,ZZ,alphaH,betaH,g1,g2,g3,Lam6,Lam5,Lam7,Lam10,Lam1,Lam4,Lam3,Lam2,            & 
& Lam8,Lam9,Lamh,epsU,Yu,Yd,Ye,epsD,epsE,Yh,Mu,M12,M112,M222,Mh,vd,vu,gPFu(:,1:21)       & 
& ,gTFu,BRFu(:,1:21))

Do i1=1,3
gTFu(i1) =Sum(gPFu(i1,:)) 
If (gTFu(i1).Gt.0._dp) BRFu(i1,: ) =gPFu(i1,:)/gTFu(i1) 
End Do 
 

gPFe = 0._dp 
gTFe = 0._dp 
BRFe = 0._dp 
Call FeTwoBodyDecay(-1,DeltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,           & 
& Mhh,Mhh2,MHm,MHm2,MVWm,MVWm2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,v,ZDL,ZEL,ZUL,UV,ZA,              & 
& ZH,ZP,ZW,ZZ,alphaH,betaH,g1,g2,g3,Lam6,Lam5,Lam7,Lam10,Lam1,Lam4,Lam3,Lam2,            & 
& Lam8,Lam9,Lamh,epsU,Yu,Yd,Ye,epsD,epsE,Yh,Mu,M12,M112,M222,Mh,vd,vu,gPFe(:,1:21)       & 
& ,gTFe,BRFe(:,1:21))

Do i1=1,3
gTFe(i1) =Sum(gPFe(i1,:)) 
If (gTFe(i1).Gt.0._dp) BRFe(i1,: ) =gPFe(i1,:)/gTFe(i1) 
End Do 
 

gPFd = 0._dp 
gTFd = 0._dp 
BRFd = 0._dp 
Call FdTwoBodyDecay(-1,DeltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,           & 
& Mhh,Mhh2,MHm,MHm2,MVWm,MVWm2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,v,ZDL,ZEL,ZUL,UV,ZA,              & 
& ZH,ZP,ZW,ZZ,alphaH,betaH,g1,g2,g3,Lam6,Lam5,Lam7,Lam10,Lam1,Lam4,Lam3,Lam2,            & 
& Lam8,Lam9,Lamh,epsU,Yu,Yd,Ye,epsD,epsE,Yh,Mu,M12,M112,M222,Mh,vd,vu,gPFd(:,1:21)       & 
& ,gTFd,BRFd(:,1:21))

Do i1=1,3
gTFd(i1) =Sum(gPFd(i1,:)) 
If (gTFd(i1).Gt.0._dp) BRFd(i1,: ) =gPFd(i1,:)/gTFd(i1) 
End Do 
 

gPFv = 0._dp 
gTFv = 0._dp 
BRFv = 0._dp 
Call FvTwoBodyDecay(-1,DeltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,           & 
& Mhh,Mhh2,MHm,MHm2,MVWm,MVWm2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,v,ZDL,ZEL,ZUL,UV,ZA,              & 
& ZH,ZP,ZW,ZZ,alphaH,betaH,g1,g2,g3,Lam6,Lam5,Lam7,Lam10,Lam1,Lam4,Lam3,Lam2,            & 
& Lam8,Lam9,Lamh,epsU,Yu,Yd,Ye,epsD,epsE,Yh,Mu,M12,M112,M222,Mh,vd,vu,gPFv,              & 
& gTFv,BRFv)

gPhh = 0._dp 
gThh = 0._dp 
BRhh = 0._dp 
Call hhTwoBodyDecay(-1,DeltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,           & 
& Mhh,Mhh2,MHm,MHm2,MVWm,MVWm2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,v,ZDL,ZEL,ZUL,UV,ZA,              & 
& ZH,ZP,ZW,ZZ,alphaH,betaH,g1,g2,g3,Lam6,Lam5,Lam7,Lam10,Lam1,Lam4,Lam3,Lam2,            & 
& Lam8,Lam9,Lamh,epsU,Yu,Yd,Ye,epsD,epsE,Yh,Mu,M12,M112,M222,Mh,vd,vu,gPhh,              & 
& gThh,BRhh)

gPAh = 0._dp 
gTAh = 0._dp 
BRAh = 0._dp 
Call AhTwoBodyDecay(-1,DeltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,           & 
& Mhh,Mhh2,MHm,MHm2,MVWm,MVWm2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,v,ZDL,ZEL,ZUL,UV,ZA,              & 
& ZH,ZP,ZW,ZZ,alphaH,betaH,g1,g2,g3,Lam6,Lam5,Lam7,Lam10,Lam1,Lam4,Lam3,Lam2,            & 
& Lam8,Lam9,Lamh,epsU,Yu,Yd,Ye,epsD,epsE,Yh,Mu,M12,M112,M222,Mh,vd,vu,gPAh,              & 
& gTAh,BRAh)

! Set Goldstone Widhts 
gTAh(1)=gTVZ


gPHm = 0._dp 
gTHm = 0._dp 
BRHm = 0._dp 
Call HmTwoBodyDecay(-1,DeltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,           & 
& Mhh,Mhh2,MHm,MHm2,MVWm,MVWm2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,v,ZDL,ZEL,ZUL,UV,ZA,              & 
& ZH,ZP,ZW,ZZ,alphaH,betaH,g1,g2,g3,Lam6,Lam5,Lam7,Lam10,Lam1,Lam4,Lam3,Lam2,            & 
& Lam8,Lam9,Lamh,epsU,Yu,Yd,Ye,epsD,epsE,Yh,Mu,M12,M112,M222,Mh,vd,vu,gPHm,              & 
& gTHm,BRHm)

! Set Goldstone Widhts 
gTHm(1)=gTVWm


If (.Not.CTBD) Then 
If (Enable3BDecaysF) Then 
If (MaxVal(gTFu).Lt.MaxVal(fac3*Abs(MFu))) Then 
Call FuThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,            & 
& Mhh2,MHm,MHm2,MVWm,MVWm2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,v,ZDL,ZEL,ZUL,UV,ZA,ZH,               & 
& ZP,ZW,ZZ,alphaH,betaH,g1,g2,g3,Lam6,Lam5,Lam7,Lam10,Lam1,Lam4,Lam3,Lam2,               & 
& Lam8,Lam9,Lamh,epsU,Yu,Yd,Ye,epsD,epsE,Yh,Mu,M12,M112,M222,Mh,vd,vu,gTAh,              & 
& gThh,gTHm,gTVWm,gTVZ,gFuFucFdFd,gFuFucFeFe,gFuFucFuFu,gFuFdcFeFv,gFuFuFvFv,            & 
& epsI,deltaM,.False.,gTFu,gPFu(:,22:156),BRFu(:,22:156))

Else 
Call FuThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,            & 
& Mhh2,MHm,MHm2,MVWm,MVWm2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,v,ZDL,ZEL,ZUL,UV,ZA,ZH,               & 
& ZP,ZW,ZZ,alphaH,betaH,g1,g2,g3,Lam6,Lam5,Lam7,Lam10,Lam1,Lam4,Lam3,Lam2,               & 
& Lam8,Lam9,Lamh,epsU,Yu,Yd,Ye,epsD,epsE,Yh,Mu,M12,M112,M222,Mh,vd,vu,gTAh,              & 
& gThh,gTHm,gTVWm,gTVZ,gFuFucFdFd,gFuFucFeFe,gFuFucFuFu,gFuFdcFeFv,gFuFuFvFv,            & 
& epsI,deltaM,.True.,gTFu,gPFu(:,22:156),BRFu(:,22:156))

End If 
 
End If 
Else 
Call FuThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,            & 
& Mhh2,MHm,MHm2,MVWm,MVWm2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,v,ZDL,ZEL,ZUL,UV,ZA,ZH,               & 
& ZP,ZW,ZZ,alphaH,betaH,g1,g2,g3,Lam6,Lam5,Lam7,Lam10,Lam1,Lam4,Lam3,Lam2,               & 
& Lam8,Lam9,Lamh,epsU,Yu,Yd,Ye,epsD,epsE,Yh,Mu,M12,M112,M222,Mh,vd,vu,gTAh,              & 
& gThh,gTHm,gTVWm,gTVZ,gFuFucFdFd,gFuFucFeFe,gFuFucFuFu,gFuFdcFeFv,gFuFuFvFv,            & 
& epsI,deltaM,.False.,gTFu,gPFu(:,22:156),BRFu(:,22:156))

End If 
Do i1=1,3
gTFu(i1) =Sum(gPFu(i1,:)) 
If (gTFu(i1).Gt.0._dp) BRFu(i1,: ) =gPFu(i1,:)/gTFu(i1) 
End Do 
 

If (.Not.CTBD) Then 
If (Enable3BDecaysF) Then 
If (MaxVal(gTFe).Lt.MaxVal(fac3*Abs(MFe))) Then 
Call FeThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,            & 
& Mhh2,MHm,MHm2,MVWm,MVWm2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,v,ZDL,ZEL,ZUL,UV,ZA,ZH,               & 
& ZP,ZW,ZZ,alphaH,betaH,g1,g2,g3,Lam6,Lam5,Lam7,Lam10,Lam1,Lam4,Lam3,Lam2,               & 
& Lam8,Lam9,Lamh,epsU,Yu,Yd,Ye,epsD,epsE,Yh,Mu,M12,M112,M222,Mh,vd,vu,gTAh,              & 
& gThh,gTHm,gTVWm,gTVZ,gFeFecFdFd,gFeFecFeFe,gFeFecFuFu,gFeFeFvFv,gFeFvcFuFd,            & 
& epsI,deltaM,.False.,gTFe,gPFe(:,22:156),BRFe(:,22:156))

Else 
Call FeThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,            & 
& Mhh2,MHm,MHm2,MVWm,MVWm2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,v,ZDL,ZEL,ZUL,UV,ZA,ZH,               & 
& ZP,ZW,ZZ,alphaH,betaH,g1,g2,g3,Lam6,Lam5,Lam7,Lam10,Lam1,Lam4,Lam3,Lam2,               & 
& Lam8,Lam9,Lamh,epsU,Yu,Yd,Ye,epsD,epsE,Yh,Mu,M12,M112,M222,Mh,vd,vu,gTAh,              & 
& gThh,gTHm,gTVWm,gTVZ,gFeFecFdFd,gFeFecFeFe,gFeFecFuFu,gFeFeFvFv,gFeFvcFuFd,            & 
& epsI,deltaM,.True.,gTFe,gPFe(:,22:156),BRFe(:,22:156))

End If 
 
End If 
Else 
Call FeThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,            & 
& Mhh2,MHm,MHm2,MVWm,MVWm2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,v,ZDL,ZEL,ZUL,UV,ZA,ZH,               & 
& ZP,ZW,ZZ,alphaH,betaH,g1,g2,g3,Lam6,Lam5,Lam7,Lam10,Lam1,Lam4,Lam3,Lam2,               & 
& Lam8,Lam9,Lamh,epsU,Yu,Yd,Ye,epsD,epsE,Yh,Mu,M12,M112,M222,Mh,vd,vu,gTAh,              & 
& gThh,gTHm,gTVWm,gTVZ,gFeFecFdFd,gFeFecFeFe,gFeFecFuFu,gFeFeFvFv,gFeFvcFuFd,            & 
& epsI,deltaM,.False.,gTFe,gPFe(:,22:156),BRFe(:,22:156))

End If 
Do i1=1,3
gTFe(i1) =Sum(gPFe(i1,:)) 
If (gTFe(i1).Gt.0._dp) BRFe(i1,: ) =gPFe(i1,:)/gTFe(i1) 
End Do 
 

If (.Not.CTBD) Then 
If (Enable3BDecaysF) Then 
If (MaxVal(gTFd).Lt.MaxVal(fac3*Abs(MFd))) Then 
Call FdThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,            & 
& Mhh2,MHm,MHm2,MVWm,MVWm2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,v,ZDL,ZEL,ZUL,UV,ZA,ZH,               & 
& ZP,ZW,ZZ,alphaH,betaH,g1,g2,g3,Lam6,Lam5,Lam7,Lam10,Lam1,Lam4,Lam3,Lam2,               & 
& Lam8,Lam9,Lamh,epsU,Yu,Yd,Ye,epsD,epsE,Yh,Mu,M12,M112,M222,Mh,vd,vu,gTAh,              & 
& gThh,gTHm,gTVWm,gTVZ,gFdFdcFdFd,gFdFdcFeFe,gFdFdcFuFu,gFdFdFvFv,gFdFuFvFe,             & 
& epsI,deltaM,.False.,gTFd,gPFd(:,22:156),BRFd(:,22:156))

Else 
Call FdThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,            & 
& Mhh2,MHm,MHm2,MVWm,MVWm2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,v,ZDL,ZEL,ZUL,UV,ZA,ZH,               & 
& ZP,ZW,ZZ,alphaH,betaH,g1,g2,g3,Lam6,Lam5,Lam7,Lam10,Lam1,Lam4,Lam3,Lam2,               & 
& Lam8,Lam9,Lamh,epsU,Yu,Yd,Ye,epsD,epsE,Yh,Mu,M12,M112,M222,Mh,vd,vu,gTAh,              & 
& gThh,gTHm,gTVWm,gTVZ,gFdFdcFdFd,gFdFdcFeFe,gFdFdcFuFu,gFdFdFvFv,gFdFuFvFe,             & 
& epsI,deltaM,.True.,gTFd,gPFd(:,22:156),BRFd(:,22:156))

End If 
 
End If 
Else 
Call FdThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,            & 
& Mhh2,MHm,MHm2,MVWm,MVWm2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,v,ZDL,ZEL,ZUL,UV,ZA,ZH,               & 
& ZP,ZW,ZZ,alphaH,betaH,g1,g2,g3,Lam6,Lam5,Lam7,Lam10,Lam1,Lam4,Lam3,Lam2,               & 
& Lam8,Lam9,Lamh,epsU,Yu,Yd,Ye,epsD,epsE,Yh,Mu,M12,M112,M222,Mh,vd,vu,gTAh,              & 
& gThh,gTHm,gTVWm,gTVZ,gFdFdcFdFd,gFdFdcFeFe,gFdFdcFuFu,gFdFdFvFv,gFdFuFvFe,             & 
& epsI,deltaM,.False.,gTFd,gPFd(:,22:156),BRFd(:,22:156))

End If 
Do i1=1,3
gTFd(i1) =Sum(gPFd(i1,:)) 
If (gTFd(i1).Gt.0._dp) BRFd(i1,: ) =gPFd(i1,:)/gTFd(i1) 
End Do 
 

! No 3-body decays for Fv  
! No 3-body decays for hh  
! No 3-body decays for Ah  
! No 3-body decays for Hm  
Iname = Iname - 1 
 
End Subroutine CalculateBR 
End Module BranchingRatios_Zee 
 
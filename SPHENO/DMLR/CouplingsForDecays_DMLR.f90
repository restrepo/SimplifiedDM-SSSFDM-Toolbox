! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.8.5 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 8:41 on 17.5.2016   
! ----------------------------------------------------------------------  
 
 
Module CouplingsForDecays_DMLR
 
Use Control 
Use Model_Data_DMLR 
Use Couplings_DMLR 
Use LoopCouplings_DMLR 
Use Tadpoles_DMLR 
 Use SusyMasses_DMLR 
Use Mathematics, Only: CompareMatrices, Adjungate 
 
Use StandardModel 
Contains 
 
 
 
Subroutine CouplingsFor_Fu_decays_2B(m_in,i1,MAhinput,MAh2input,MdeltaRppinput,       & 
& MdeltaRpp2input,MFcinput,MFc2input,MFcpinput,MFcp2input,MFcppinput,MFcpp2input,        & 
& MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,MFu2input,MFvinput,MFv2input,           & 
& Mhhinput,Mhh2input,MHpminput,MHpm2input,MVWLminput,MVWLm2input,MVWRminput,             & 
& MVWRm2input,MVZinput,MVZ2input,MVZRinput,MVZR2input,phaTinput,PhiWinput,               & 
& UVinput,TWinput,UCinput,ZDRinput,ZERinput,UPinput,ZURinput,ZDLinput,ZELinput,          & 
& ZULinput,ZHinput,ZWinput,ZZinput,gBLinput,g2input,gRinput,g3input,RHO2input,           & 
& RHO1input,ALP1input,LAM1input,ALP3input,ALP2input,LAM4input,LAM2input,LAM3input,       & 
& YDRinput,YL1input,YQ1input,YL2input,YQ2input,M23input,mu32input,MU22input,             & 
& MU12input,vdinput,vuinput,vRinput,cplcFuFuAhL,cplcFuFuAhR,cplcFuFdcHpmL,               & 
& cplcFuFdcHpmR,cplcFuFdcVWLmL,cplcFuFdcVWLmR,cplcFuFdcVWRmL,cplcFuFdcVWRmR,             & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZRL,cplcFuFuVZRR,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: gBLinput,g2input,gRinput,g3input,RHO2input,RHO1input,ALP1input,LAM1input,             & 
& ALP3input,ALP2input,LAM4input,LAM2input,LAM3input,M23input,mu32input,MU22input,        & 
& MU12input,vdinput,vuinput,vRinput

Complex(dp),Intent(in) :: YDRinput(3,3),YL1input(3,3),YQ1input(3,3),YL2input(3,3),YQ2input(3,3)

Real(dp),Intent(in) :: MAhinput(3),MAh2input(3),MdeltaRppinput,MdeltaRpp2input,MFcinput,MFc2input,           & 
& MFcpinput,MFcp2input,MFcppinput,MFcpp2input,MFdinput(3),MFd2input(3),MFeinput(3),      & 
& MFe2input(3),MFuinput(3),MFu2input(3),MFvinput(6),MFv2input(6),Mhhinput(3),            & 
& Mhh2input(3),MHpminput(3),MHpm2input(3),MVWLminput,MVWLm2input,MVWRminput,             & 
& MVWRm2input,MVZinput,MVZ2input,MVZRinput,MVZR2input,PhiWinput,TWinput,UCinput(3,3),    & 
& UPinput(3,3),ZHinput(3,3)

Complex(dp),Intent(in) :: phaTinput,UVinput(6,6),ZDRinput(3,3),ZERinput(3,3),ZURinput(3,3),ZDLinput(3,3),       & 
& ZELinput(3,3),ZULinput(3,3),ZWinput(4,4),ZZinput(3,3)

Real(dp) :: gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,ALP3,ALP2,LAM4,LAM2,LAM3,M23,mu32,MU22,              & 
& MU12,vd,vu,vR

Complex(dp) :: YDR(3,3),YL1(3,3),YQ1(3,3),YL2(3,3),YQ2(3,3)

Complex(dp),Intent(out) :: cplcFuFuAhL(3,3,3),cplcFuFuAhR(3,3,3),cplcFuFdcHpmL(3,3,3),cplcFuFdcHpmR(3,3,3),      & 
& cplcFuFdcVWLmL(3,3),cplcFuFdcVWLmR(3,3),cplcFuFdcVWRmL(3,3),cplcFuFdcVWRmR(3,3),       & 
& cplcFuFuhhL(3,3,3),cplcFuFuhhR(3,3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),               & 
& cplcFuFuVZRL(3,3),cplcFuFuVZRR(3,3)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(3),MAh2(3),MdeltaRpp,MdeltaRpp2,MFc,MFc2,MFcp,MFcp2,MFcpp,MFcpp2,MFd(3),          & 
& MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),Mhh(3),Mhh2(3),MHpm(3),           & 
& MHpm2(3),MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,TW,UC(3,3),UP(3,3),ZH(3,3)

Complex(dp) :: phaT,UV(6,6),ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZW(4,4),ZZ(3,3)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Fu_2B'
 
sinW2=1._dp-mW2/mZ2 
gBL = gBLinput 
g2 = g2input 
gR = gRinput 
g3 = g3input 
RHO2 = RHO2input 
RHO1 = RHO1input 
ALP1 = ALP1input 
LAM1 = LAM1input 
ALP3 = ALP3input 
ALP2 = ALP2input 
LAM4 = LAM4input 
LAM2 = LAM2input 
LAM3 = LAM3input 
YDR = YDRinput 
YL1 = YL1input 
YQ1 = YQ1input 
YL2 = YL2input 
YQ2 = YQ2input 
M23 = M23input 
mu32 = mu32input 
MU22 = MU22input 
MU12 = MU12input 
vd = vdinput 
vu = vuinput 
vR = vRinput 
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,ALP3,ALP2,LAM4,           & 
& LAM2,LAM3,YDR,YL1,YQ1,YL2,YQ2,M23,mu32,MU22,MU12,vd,vu,vR,(/ ZeroC, ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MdeltaRpp,MdeltaRpp2,MFc,MFc2,MFcp,MFcp2,MFcpp,              & 
& MFcpp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MVWLm,MVWLm2,           & 
& MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,phaT,PhiW,UV,TW,UC,ZDR,ZER,UP,ZUR,ZDL,ZEL,            & 
& ZUL,ZH,ZW,ZZ,vd,vu,vR,gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,ALP3,ALP2,LAM4,LAM2,            & 
& LAM3,YDR,YL1,YQ1,YL2,YQ2,M23,mu32,MU22,MU12,.True.,kont)

ZH = ZHinput 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UV = UVinput 
UC = UCinput 
UP = UPinput 
ZH = ZHinput 
ZW = ZWinput 
ZZ = ZZinput 
cplcFuFuAhL = 0._dp 
cplcFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFuFuAhT(gt1,gt2,gt3,YQ1,YQ2,UP,ZUL,ZUR,cplcFuFuAhL(gt1,gt2,gt3)         & 
& ,cplcFuFuAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFdcHpmL = 0._dp 
cplcFuFdcHpmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFuFdcHpmT(gt1,gt2,gt3,YQ1,YQ2,UC,ZDL,ZDR,ZUL,ZUR,cplcFuFdcHpmL(gt1,gt2,gt3)& 
& ,cplcFuFdcHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFuFuhhT(gt1,gt2,gt3,YQ1,YQ2,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)         & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFdcVWLmL = 0._dp 
cplcFuFdcVWLmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdcVWLmT(gt1,gt2,g2,gR,ZDL,ZDR,ZUL,ZUR,PhiW,cplcFuFdcVWLmL(gt1,gt2)   & 
& ,cplcFuFdcVWLmR(gt1,gt2))

 End Do 
End Do 


cplcFuFdcVWRmL = 0._dp 
cplcFuFdcVWRmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdcVWRmT(gt1,gt2,g2,gR,ZDL,ZDR,ZUL,ZUR,PhiW,cplcFuFdcVWRmL(gt1,gt2)   & 
& ,cplcFuFdcVWRmR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZL = 0._dp 
cplcFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZT(gt1,gt2,gBL,g2,gR,ZZ,cplcFuFuVZL(gt1,gt2),cplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZRL = 0._dp 
cplcFuFuVZRR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZRT(gt1,gt2,gBL,g2,gR,ZZ,cplcFuFuVZRL(gt1,gt2),cplcFuFuVZRR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Fu_decays_2B
 
Subroutine CouplingsFor_Fe_decays_2B(m_in,i1,MAhinput,MAh2input,MdeltaRppinput,       & 
& MdeltaRpp2input,MFcinput,MFc2input,MFcpinput,MFcp2input,MFcppinput,MFcpp2input,        & 
& MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,MFu2input,MFvinput,MFv2input,           & 
& Mhhinput,Mhh2input,MHpminput,MHpm2input,MVWLminput,MVWLm2input,MVWRminput,             & 
& MVWRm2input,MVZinput,MVZ2input,MVZRinput,MVZR2input,phaTinput,PhiWinput,               & 
& UVinput,TWinput,UCinput,ZDRinput,ZERinput,UPinput,ZURinput,ZDLinput,ZELinput,          & 
& ZULinput,ZHinput,ZWinput,ZZinput,gBLinput,g2input,gRinput,g3input,RHO2input,           & 
& RHO1input,ALP1input,LAM1input,ALP3input,ALP2input,LAM4input,LAM2input,LAM3input,       & 
& YDRinput,YL1input,YQ1input,YL2input,YQ2input,M23input,mu32input,MU22input,             & 
& MU12input,vdinput,vuinput,vRinput,cplcFeFeAhL,cplcFeFeAhR,cplcFecFedeltaRppL,          & 
& cplcFecFedeltaRppR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZRL,       & 
& cplcFeFeVZRR,cplcFeFvcHpmL,cplcFeFvcHpmR,cplcFeFvcVWLmL,cplcFeFvcVWLmR,cplcFeFvcVWRmL, & 
& cplcFeFvcVWRmR,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: gBLinput,g2input,gRinput,g3input,RHO2input,RHO1input,ALP1input,LAM1input,             & 
& ALP3input,ALP2input,LAM4input,LAM2input,LAM3input,M23input,mu32input,MU22input,        & 
& MU12input,vdinput,vuinput,vRinput

Complex(dp),Intent(in) :: YDRinput(3,3),YL1input(3,3),YQ1input(3,3),YL2input(3,3),YQ2input(3,3)

Real(dp),Intent(in) :: MAhinput(3),MAh2input(3),MdeltaRppinput,MdeltaRpp2input,MFcinput,MFc2input,           & 
& MFcpinput,MFcp2input,MFcppinput,MFcpp2input,MFdinput(3),MFd2input(3),MFeinput(3),      & 
& MFe2input(3),MFuinput(3),MFu2input(3),MFvinput(6),MFv2input(6),Mhhinput(3),            & 
& Mhh2input(3),MHpminput(3),MHpm2input(3),MVWLminput,MVWLm2input,MVWRminput,             & 
& MVWRm2input,MVZinput,MVZ2input,MVZRinput,MVZR2input,PhiWinput,TWinput,UCinput(3,3),    & 
& UPinput(3,3),ZHinput(3,3)

Complex(dp),Intent(in) :: phaTinput,UVinput(6,6),ZDRinput(3,3),ZERinput(3,3),ZURinput(3,3),ZDLinput(3,3),       & 
& ZELinput(3,3),ZULinput(3,3),ZWinput(4,4),ZZinput(3,3)

Real(dp) :: gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,ALP3,ALP2,LAM4,LAM2,LAM3,M23,mu32,MU22,              & 
& MU12,vd,vu,vR

Complex(dp) :: YDR(3,3),YL1(3,3),YQ1(3,3),YL2(3,3),YQ2(3,3)

Complex(dp),Intent(out) :: cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),cplcFecFedeltaRppL(3,3),cplcFecFedeltaRppR(3,3),& 
& cplcFeFehhL(3,3,3),cplcFeFehhR(3,3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),               & 
& cplcFeFeVZRL(3,3),cplcFeFeVZRR(3,3),cplcFeFvcHpmL(3,6,3),cplcFeFvcHpmR(3,6,3),         & 
& cplcFeFvcVWLmL(3,6),cplcFeFvcVWLmR(3,6),cplcFeFvcVWRmL(3,6),cplcFeFvcVWRmR(3,6)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(3),MAh2(3),MdeltaRpp,MdeltaRpp2,MFc,MFc2,MFcp,MFcp2,MFcpp,MFcpp2,MFd(3),          & 
& MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),Mhh(3),Mhh2(3),MHpm(3),           & 
& MHpm2(3),MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,TW,UC(3,3),UP(3,3),ZH(3,3)

Complex(dp) :: phaT,UV(6,6),ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZW(4,4),ZZ(3,3)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Fe_2B'
 
sinW2=1._dp-mW2/mZ2 
gBL = gBLinput 
g2 = g2input 
gR = gRinput 
g3 = g3input 
RHO2 = RHO2input 
RHO1 = RHO1input 
ALP1 = ALP1input 
LAM1 = LAM1input 
ALP3 = ALP3input 
ALP2 = ALP2input 
LAM4 = LAM4input 
LAM2 = LAM2input 
LAM3 = LAM3input 
YDR = YDRinput 
YL1 = YL1input 
YQ1 = YQ1input 
YL2 = YL2input 
YQ2 = YQ2input 
M23 = M23input 
mu32 = mu32input 
MU22 = MU22input 
MU12 = MU12input 
vd = vdinput 
vu = vuinput 
vR = vRinput 
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,ALP3,ALP2,LAM4,           & 
& LAM2,LAM3,YDR,YL1,YQ1,YL2,YQ2,M23,mu32,MU22,MU12,vd,vu,vR,(/ ZeroC, ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MdeltaRpp,MdeltaRpp2,MFc,MFc2,MFcp,MFcp2,MFcpp,              & 
& MFcpp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MVWLm,MVWLm2,           & 
& MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,phaT,PhiW,UV,TW,UC,ZDR,ZER,UP,ZUR,ZDL,ZEL,            & 
& ZUL,ZH,ZW,ZZ,vd,vu,vR,gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,ALP3,ALP2,LAM4,LAM2,            & 
& LAM3,YDR,YL1,YQ1,YL2,YQ2,M23,mu32,MU22,MU12,.True.,kont)

ZH = ZHinput 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UV = UVinput 
UC = UCinput 
UP = UPinput 
ZH = ZHinput 
ZW = ZWinput 
ZZ = ZZinput 
cplcFeFeAhL = 0._dp 
cplcFeFeAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFeFeAhT(gt1,gt2,gt3,YL1,YL2,UP,ZEL,ZER,cplcFeFeAhL(gt1,gt2,gt3)         & 
& ,cplcFeFeAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFecFedeltaRppL = 0._dp 
cplcFecFedeltaRppR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFecFedeltaRppT(gt1,gt2,YDR,ZER,cplcFecFedeltaRppL(gt1,gt2)              & 
& ,cplcFecFedeltaRppR(gt1,gt2))

 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFeFehhT(gt1,gt2,gt3,YL1,YL2,ZH,ZEL,ZER,cplcFeFehhL(gt1,gt2,gt3)         & 
& ,cplcFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFvcHpmL = 0._dp 
cplcFeFvcHpmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
  Do gt3 = 1, 3
Call CouplingcFeFvcHpmT(gt1,gt2,gt3,YDR,YL1,YL2,UC,ZEL,ZER,UV,cplcFeFvcHpmL(gt1,gt2,gt3)& 
& ,cplcFeFvcHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFeVZL = 0._dp 
cplcFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZT(gt1,gt2,gBL,g2,gR,ZZ,cplcFeFeVZL(gt1,gt2),cplcFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZRL = 0._dp 
cplcFeFeVZRR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZRT(gt1,gt2,gBL,g2,gR,ZZ,cplcFeFeVZRL(gt1,gt2),cplcFeFeVZRR(gt1,gt2))

 End Do 
End Do 


cplcFeFvcVWLmL = 0._dp 
cplcFeFvcVWLmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
Call CouplingcFeFvcVWLmT(gt1,gt2,g2,gR,ZEL,ZER,UV,PhiW,cplcFeFvcVWLmL(gt1,gt2)        & 
& ,cplcFeFvcVWLmR(gt1,gt2))

 End Do 
End Do 


cplcFeFvcVWRmL = 0._dp 
cplcFeFvcVWRmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
Call CouplingcFeFvcVWRmT(gt1,gt2,g2,gR,ZEL,ZER,UV,PhiW,cplcFeFvcVWRmL(gt1,gt2)        & 
& ,cplcFeFvcVWRmR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Fe_decays_2B
 
Subroutine CouplingsFor_Fd_decays_2B(m_in,i1,MAhinput,MAh2input,MdeltaRppinput,       & 
& MdeltaRpp2input,MFcinput,MFc2input,MFcpinput,MFcp2input,MFcppinput,MFcpp2input,        & 
& MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,MFu2input,MFvinput,MFv2input,           & 
& Mhhinput,Mhh2input,MHpminput,MHpm2input,MVWLminput,MVWLm2input,MVWRminput,             & 
& MVWRm2input,MVZinput,MVZ2input,MVZRinput,MVZR2input,phaTinput,PhiWinput,               & 
& UVinput,TWinput,UCinput,ZDRinput,ZERinput,UPinput,ZURinput,ZDLinput,ZELinput,          & 
& ZULinput,ZHinput,ZWinput,ZZinput,gBLinput,g2input,gRinput,g3input,RHO2input,           & 
& RHO1input,ALP1input,LAM1input,ALP3input,ALP2input,LAM4input,LAM2input,LAM3input,       & 
& YDRinput,YL1input,YQ1input,YL2input,YQ2input,M23input,mu32input,MU22input,             & 
& MU12input,vdinput,vuinput,vRinput,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,     & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZRL,cplcFdFdVZRR,cplcFdFuHpmL,cplcFdFuHpmR,           & 
& cplcFdFuVWLmL,cplcFdFuVWLmR,cplcFdFuVWRmL,cplcFdFuVWRmR,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: gBLinput,g2input,gRinput,g3input,RHO2input,RHO1input,ALP1input,LAM1input,             & 
& ALP3input,ALP2input,LAM4input,LAM2input,LAM3input,M23input,mu32input,MU22input,        & 
& MU12input,vdinput,vuinput,vRinput

Complex(dp),Intent(in) :: YDRinput(3,3),YL1input(3,3),YQ1input(3,3),YL2input(3,3),YQ2input(3,3)

Real(dp),Intent(in) :: MAhinput(3),MAh2input(3),MdeltaRppinput,MdeltaRpp2input,MFcinput,MFc2input,           & 
& MFcpinput,MFcp2input,MFcppinput,MFcpp2input,MFdinput(3),MFd2input(3),MFeinput(3),      & 
& MFe2input(3),MFuinput(3),MFu2input(3),MFvinput(6),MFv2input(6),Mhhinput(3),            & 
& Mhh2input(3),MHpminput(3),MHpm2input(3),MVWLminput,MVWLm2input,MVWRminput,             & 
& MVWRm2input,MVZinput,MVZ2input,MVZRinput,MVZR2input,PhiWinput,TWinput,UCinput(3,3),    & 
& UPinput(3,3),ZHinput(3,3)

Complex(dp),Intent(in) :: phaTinput,UVinput(6,6),ZDRinput(3,3),ZERinput(3,3),ZURinput(3,3),ZDLinput(3,3),       & 
& ZELinput(3,3),ZULinput(3,3),ZWinput(4,4),ZZinput(3,3)

Real(dp) :: gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,ALP3,ALP2,LAM4,LAM2,LAM3,M23,mu32,MU22,              & 
& MU12,vd,vu,vR

Complex(dp) :: YDR(3,3),YL1(3,3),YQ1(3,3),YL2(3,3),YQ2(3,3)

Complex(dp),Intent(out) :: cplcFdFdAhL(3,3,3),cplcFdFdAhR(3,3,3),cplcFdFdhhL(3,3,3),cplcFdFdhhR(3,3,3),          & 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFdFdVZRL(3,3),cplcFdFdVZRR(3,3),cplcFdFuHpmL(3,3,3),& 
& cplcFdFuHpmR(3,3,3),cplcFdFuVWLmL(3,3),cplcFdFuVWLmR(3,3),cplcFdFuVWRmL(3,3),          & 
& cplcFdFuVWRmR(3,3)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(3),MAh2(3),MdeltaRpp,MdeltaRpp2,MFc,MFc2,MFcp,MFcp2,MFcpp,MFcpp2,MFd(3),          & 
& MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),Mhh(3),Mhh2(3),MHpm(3),           & 
& MHpm2(3),MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,TW,UC(3,3),UP(3,3),ZH(3,3)

Complex(dp) :: phaT,UV(6,6),ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZW(4,4),ZZ(3,3)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Fd_2B'
 
sinW2=1._dp-mW2/mZ2 
gBL = gBLinput 
g2 = g2input 
gR = gRinput 
g3 = g3input 
RHO2 = RHO2input 
RHO1 = RHO1input 
ALP1 = ALP1input 
LAM1 = LAM1input 
ALP3 = ALP3input 
ALP2 = ALP2input 
LAM4 = LAM4input 
LAM2 = LAM2input 
LAM3 = LAM3input 
YDR = YDRinput 
YL1 = YL1input 
YQ1 = YQ1input 
YL2 = YL2input 
YQ2 = YQ2input 
M23 = M23input 
mu32 = mu32input 
MU22 = MU22input 
MU12 = MU12input 
vd = vdinput 
vu = vuinput 
vR = vRinput 
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,ALP3,ALP2,LAM4,           & 
& LAM2,LAM3,YDR,YL1,YQ1,YL2,YQ2,M23,mu32,MU22,MU12,vd,vu,vR,(/ ZeroC, ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MdeltaRpp,MdeltaRpp2,MFc,MFc2,MFcp,MFcp2,MFcpp,              & 
& MFcpp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MVWLm,MVWLm2,           & 
& MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,phaT,PhiW,UV,TW,UC,ZDR,ZER,UP,ZUR,ZDL,ZEL,            & 
& ZUL,ZH,ZW,ZZ,vd,vu,vR,gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,ALP3,ALP2,LAM4,LAM2,            & 
& LAM3,YDR,YL1,YQ1,YL2,YQ2,M23,mu32,MU22,MU12,.True.,kont)

ZH = ZHinput 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UV = UVinput 
UC = UCinput 
UP = UPinput 
ZH = ZHinput 
ZW = ZWinput 
ZZ = ZZinput 
cplcFdFdAhL = 0._dp 
cplcFdFdAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFdFdAhT(gt1,gt2,gt3,YQ1,YQ2,UP,ZDL,ZDR,cplcFdFdAhL(gt1,gt2,gt3)         & 
& ,cplcFdFdAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFdFdhhT(gt1,gt2,gt3,YQ1,YQ2,ZH,ZDL,ZDR,cplcFdFdhhL(gt1,gt2,gt3)         & 
& ,cplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFuHpmL = 0._dp 
cplcFdFuHpmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFdFuHpmT(gt1,gt2,gt3,YQ1,YQ2,UC,ZDL,ZDR,ZUL,ZUR,cplcFdFuHpmL(gt1,gt2,gt3)& 
& ,cplcFdFuHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFdVZL = 0._dp 
cplcFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZT(gt1,gt2,gBL,g2,gR,ZZ,cplcFdFdVZL(gt1,gt2),cplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVZRL = 0._dp 
cplcFdFdVZRR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZRT(gt1,gt2,gBL,g2,gR,ZZ,cplcFdFdVZRL(gt1,gt2),cplcFdFdVZRR(gt1,gt2))

 End Do 
End Do 


cplcFdFuVWLmL = 0._dp 
cplcFdFuVWLmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFuVWLmT(gt1,gt2,g2,gR,ZDL,ZDR,ZUL,ZUR,PhiW,cplcFdFuVWLmL(gt1,gt2)     & 
& ,cplcFdFuVWLmR(gt1,gt2))

 End Do 
End Do 


cplcFdFuVWRmL = 0._dp 
cplcFdFuVWRmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFuVWRmT(gt1,gt2,g2,gR,ZDL,ZDR,ZUL,ZUR,PhiW,cplcFdFuVWRmL(gt1,gt2)     & 
& ,cplcFdFuVWRmR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Fd_decays_2B
 
Subroutine CouplingsFor_hh_decays_2B(m_in,i1,MAhinput,MAh2input,MdeltaRppinput,       & 
& MdeltaRpp2input,MFcinput,MFc2input,MFcpinput,MFcp2input,MFcppinput,MFcpp2input,        & 
& MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,MFu2input,MFvinput,MFv2input,           & 
& Mhhinput,Mhh2input,MHpminput,MHpm2input,MVWLminput,MVWLm2input,MVWRminput,             & 
& MVWRm2input,MVZinput,MVZ2input,MVZRinput,MVZR2input,phaTinput,PhiWinput,               & 
& UVinput,TWinput,UCinput,ZDRinput,ZERinput,UPinput,ZURinput,ZDLinput,ZELinput,          & 
& ZULinput,ZHinput,ZWinput,ZZinput,gBLinput,g2input,gRinput,g3input,RHO2input,           & 
& RHO1input,ALP1input,LAM1input,ALP3input,ALP2input,LAM4input,LAM2input,LAM3input,       & 
& YDRinput,YL1input,YQ1input,YL2input,YQ2input,M23input,mu32input,MU22input,             & 
& MU12input,vdinput,vuinput,vRinput,cplHiggsPP,cplHiggsGG,cplHiggsZZvirt,cplHiggsWWvirt, & 
& cplAhAhhh,cplAhhhVZ,cplAhhhVZR,cpldeltaRpphhcdeltaRpp,cplcFdFdhhL,cplcFdFdhhR,         & 
& cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplFvFvhhL,cplFvFvhhR,cplhhhhhh,       & 
& cplhhHpmcHpm,cplhhHpmcVWLm,cplhhHpmcVWRm,cplhhcVWLmVWLm,cplhhcVWRmVWLm,cplhhcVWRmVWRm, & 
& cplhhVZVZ,cplhhVZVZR,cplhhVZRVZR,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: gBLinput,g2input,gRinput,g3input,RHO2input,RHO1input,ALP1input,LAM1input,             & 
& ALP3input,ALP2input,LAM4input,LAM2input,LAM3input,M23input,mu32input,MU22input,        & 
& MU12input,vdinput,vuinput,vRinput

Complex(dp),Intent(in) :: YDRinput(3,3),YL1input(3,3),YQ1input(3,3),YL2input(3,3),YQ2input(3,3)

Real(dp),Intent(in) :: MAhinput(3),MAh2input(3),MdeltaRppinput,MdeltaRpp2input,MFcinput,MFc2input,           & 
& MFcpinput,MFcp2input,MFcppinput,MFcpp2input,MFdinput(3),MFd2input(3),MFeinput(3),      & 
& MFe2input(3),MFuinput(3),MFu2input(3),MFvinput(6),MFv2input(6),Mhhinput(3),            & 
& Mhh2input(3),MHpminput(3),MHpm2input(3),MVWLminput,MVWLm2input,MVWRminput,             & 
& MVWRm2input,MVZinput,MVZ2input,MVZRinput,MVZR2input,PhiWinput,TWinput,UCinput(3,3),    & 
& UPinput(3,3),ZHinput(3,3)

Complex(dp),Intent(in) :: phaTinput,UVinput(6,6),ZDRinput(3,3),ZERinput(3,3),ZURinput(3,3),ZDLinput(3,3),       & 
& ZELinput(3,3),ZULinput(3,3),ZWinput(4,4),ZZinput(3,3)

Real(dp) :: gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,ALP3,ALP2,LAM4,LAM2,LAM3,M23,mu32,MU22,              & 
& MU12,vd,vu,vR

Complex(dp) :: YDR(3,3),YL1(3,3),YQ1(3,3),YL2(3,3),YQ2(3,3)

Complex(dp),Intent(out) :: cplHiggsPP(3),cplHiggsGG(3),cplHiggsZZvirt(3),cplHiggsWWvirt(3),cplAhAhhh(3,3,3),     & 
& cplAhhhVZ(3,3),cplAhhhVZR(3,3),cpldeltaRpphhcdeltaRpp(3),cplcFdFdhhL(3,3,3),           & 
& cplcFdFdhhR(3,3,3),cplcFeFehhL(3,3,3),cplcFeFehhR(3,3,3),cplcFuFuhhL(3,3,3),           & 
& cplcFuFuhhR(3,3,3),cplFvFvhhL(6,6,3),cplFvFvhhR(6,6,3),cplhhhhhh(3,3,3),               & 
& cplhhHpmcHpm(3,3,3),cplhhHpmcVWLm(3,3),cplhhHpmcVWRm(3,3),cplhhcVWLmVWLm(3),           & 
& cplhhcVWRmVWLm(3),cplhhcVWRmVWRm(3),cplhhVZVZ(3),cplhhVZVZR(3),cplhhVZRVZR(3)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(3),MAh2(3),MdeltaRpp,MdeltaRpp2,MFc,MFc2,MFcp,MFcp2,MFcpp,MFcpp2,MFd(3),          & 
& MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),Mhh(3),Mhh2(3),MHpm(3),           & 
& MHpm2(3),MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,TW,UC(3,3),UP(3,3),ZH(3,3)

Complex(dp) :: phaT,UV(6,6),ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZW(4,4),ZZ(3,3)

Complex(dp) :: ratdeltaRpp,ratFd(3),ratFe(3),ratFu(3),ratHpm(3),ratVWLm,ratVWRm

Complex(dp) :: ratPdeltaRpp,ratPFd(3),ratPFe(3),ratPFu(3),ratPHpm(3),ratPVWLm,ratPVWRm

Complex(dp) :: coup 
Real(dp) :: vev, gNLO, NLOqcd, NNLOqcd, NNNLOqcd, AlphaSQ, AlphaSQhlf 
Real(dp) :: g1SM,g2SM,g3SM,vSM
Complex(dp) ::YuSM(3,3),YdSM(3,3),YeSM(3,3)
Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_hh_2B'
 
sinW2=1._dp-mW2/mZ2 
gBL = gBLinput 
g2 = g2input 
gR = gRinput 
g3 = g3input 
RHO2 = RHO2input 
RHO1 = RHO1input 
ALP1 = ALP1input 
LAM1 = LAM1input 
ALP3 = ALP3input 
ALP2 = ALP2input 
LAM4 = LAM4input 
LAM2 = LAM2input 
LAM3 = LAM3input 
YDR = YDRinput 
YL1 = YL1input 
YQ1 = YQ1input 
YL2 = YL2input 
YQ2 = YQ2input 
M23 = M23input 
mu32 = mu32input 
MU22 = MU22input 
MU12 = MU12input 
vd = vdinput 
vu = vuinput 
vR = vRinput 
Qin=sqrt(getRenormalizationScale()) 
! Run always SM gauge couplings if present 
  Qin=sqrt(getRenormalizationScale()) 
  Call RunSMohdm(m_in,deltaM,g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,vSM) 
   ! SM pole masses needed for diphoton/digluon rate 
   ! But only top and W play a role. 
   vSM=1/Sqrt((G_F*Sqrt(2._dp))) ! On-Shell VEV needed for loop 
   YuSM(3,3)=sqrt(2._dp)*mf_u(3)/vSM  ! On-Shell top needed in loop 
   ! Other running values kept to get H->ff correct 
g3=g3SM
g2=g2SM
gBL=(g1SM*gR)/Sqrt(-g1SM**2 + gR**2)
vd=vSM/Sqrt(1 + TanBeta**2)
vu=(TanBeta*vSM)/Sqrt(1 + TanBeta**2)
YQ2=-((vd*vSM*Transpose(YdSM) - vu*vSM*Transpose(YuSM))/(-vd**2 + vu**2))
YQ1=(vu*vSM*Transpose(YdSM) - vd*vSM*Transpose(YuSM))/(-vd**2 + vu**2)
AlphaSQhlf=g3**2/(4._dp*Pi) 
AlphaSQ=g3**2/(4._dp*Pi) 
Call SolveTadpoleEquations(gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,ALP3,ALP2,LAM4,           & 
& LAM2,LAM3,YDR,YL1,YQ1,YL2,YQ2,M23,mu32,MU22,MU12,vd,vu,vR,(/ ZeroC, ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MdeltaRpp,MdeltaRpp2,MFc,MFc2,MFcp,MFcp2,MFcpp,              & 
& MFcpp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MVWLm,MVWLm2,           & 
& MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,phaT,PhiW,UV,TW,UC,ZDR,ZER,UP,ZUR,ZDL,ZEL,            & 
& ZUL,ZH,ZW,ZZ,vd,vu,vR,gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,ALP3,ALP2,LAM4,LAM2,            & 
& LAM3,YDR,YL1,YQ1,YL2,YQ2,M23,mu32,MU22,MU12,.True.,kont)

ZH = ZHinput 
cplAhAhhh = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingAhAhhhT(gt1,gt2,gt3,RHO1,ALP1,LAM1,ALP3,ALP2,LAM4,LAM2,LAM3,             & 
& vd,vu,vR,ZH,UP,cplAhAhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cpldeltaRpphhcdeltaRpp = 0._dp 
Do gt2 = 1, 3
Call CouplingdeltaRpphhcdeltaRppT(gt2,RHO2,RHO1,ALP1,ALP3,ALP2,vd,vu,vR,              & 
& ZH,cpldeltaRpphhcdeltaRpp(gt2))

End Do 


cplhhhhhh = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplinghhhhhhT(gt1,gt2,gt3,RHO1,ALP1,LAM1,ALP3,ALP2,LAM4,LAM2,LAM3,             & 
& vd,vu,vR,ZH,cplhhhhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhHpmcHpm = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplinghhHpmcHpmT(gt1,gt2,gt3,RHO1,ALP1,LAM1,ALP3,ALP2,LAM4,LAM2,               & 
& LAM3,vd,vu,vR,ZH,UC,cplhhHpmcHpm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhhhVZ = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingAhhhVZT(gt1,gt2,gBL,g2,gR,ZZ,ZH,UP,cplAhhhVZ(gt1,gt2))

 End Do 
End Do 


cplAhhhVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingAhhhVZRT(gt1,gt2,gBL,g2,gR,ZZ,ZH,UP,cplAhhhVZR(gt1,gt2))

 End Do 
End Do 


cplhhHpmcVWLm = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplinghhHpmcVWLmT(gt1,gt2,g2,gR,ZH,UC,PhiW,cplhhHpmcVWLm(gt1,gt2))

 End Do 
End Do 


cplhhHpmcVWRm = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplinghhHpmcVWRmT(gt1,gt2,g2,gR,ZH,UC,PhiW,cplhhHpmcVWRm(gt1,gt2))

 End Do 
End Do 


cplhhcVWLmVWLm = 0._dp 
Do gt1 = 1, 3
Call CouplinghhcVWLmVWLmT(gt1,g2,gR,vd,vu,vR,ZH,PhiW,cplhhcVWLmVWLm(gt1))

End Do 


cplhhcVWRmVWLm = 0._dp 
Do gt1 = 1, 3
Call CouplinghhcVWRmVWLmT(gt1,g2,gR,vd,vu,vR,ZH,PhiW,cplhhcVWRmVWLm(gt1))

End Do 


cplhhcVWRmVWRm = 0._dp 
Do gt1 = 1, 3
Call CouplinghhcVWRmVWRmT(gt1,g2,gR,vd,vu,vR,ZH,PhiW,cplhhcVWRmVWRm(gt1))

End Do 


cplhhVZVZ = 0._dp 
Do gt1 = 1, 3
Call CouplinghhVZVZT(gt1,gBL,g2,gR,vd,vu,vR,ZZ,ZH,cplhhVZVZ(gt1))

End Do 


cplhhVZVZR = 0._dp 
Do gt1 = 1, 3
Call CouplinghhVZVZRT(gt1,gBL,g2,gR,vd,vu,vR,ZZ,ZH,cplhhVZVZR(gt1))

End Do 


cplhhVZRVZR = 0._dp 
Do gt1 = 1, 3
Call CouplinghhVZRVZRT(gt1,gBL,g2,gR,vd,vu,vR,ZZ,ZH,cplhhVZRVZR(gt1))

End Do 


cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFdFdhhT(gt1,gt2,gt3,YQ1,YQ2,ZH,ZDL,ZDR,cplcFdFdhhL(gt1,gt2,gt3)         & 
& ,cplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFeFehhT(gt1,gt2,gt3,YL1,YL2,ZH,ZEL,ZER,cplcFeFehhL(gt1,gt2,gt3)         & 
& ,cplcFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFuFuhhT(gt1,gt2,gt3,YQ1,YQ2,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)         & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFvhhL = 0._dp 
cplFvFvhhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 3
Call CouplingFvFvhhT(gt1,gt2,gt3,YDR,YL1,YL2,ZH,UV,cplFvFvhhL(gt1,gt2,gt3)            & 
& ,cplFvFvhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


vev=1/Sqrt((G_F*Sqrt(2._dp)))
cplHiggsWWvirt = cplhhcVWLmVWLm/vev 
cplHiggsZZvirt = cplhhVZVZ*Sqrt(7._dp/12._dp-10._dp/9._dp*Sin(TW)**2+40._dp/27._dp*Sin(TW)**4)/vev 
 

!----------------------------------------------------
! Scalar Higgs coupling ratios 
!----------------------------------------------------
 
ratdeltaRpp = 0.5_dp*cpldeltaRpphhcdeltaRpp(i1)*vev/MdeltaRpp2 
Do i2=1, 3
ratFd(i2) = cplcFdFdhhL(i2,i2,i1)*1._dp*vev/MFd(i2) 
End Do 
Do i2=1, 3
ratFe(i2) = cplcFeFehhL(i2,i2,i1)*1._dp*vev/MFe(i2) 
End Do 
Do i2=1, 3
ratFu(i2) = cplcFuFuhhL(i2,i2,i1)*1._dp*vev/MFu(i2) 
End Do 
Do i2=1, 3
ratHpm(i2) = 0.5_dp*cplhhHpmcHpm(i1,i2,i2)*vev/MHpm2(i2) 
End Do 
ratVWLm = -0.5_dp*cplhhcVWLmVWLm(i1)*vev/MVWLm2 
ratVWRm = -0.5_dp*cplhhcVWRmVWRm(i1)*vev/MVWRm2 
If (HigherOrderDiboson) Then 
  gNLO = Sqrt(AlphaSQhlf*4._dp*Pi) 
Else  
  gNLO = -1._dp 
End if 
Call CoupHiggsToPhoton(m_in,i1,ratdeltaRpp,ratFd,ratFe,ratFu,ratHpm,ratVWLm,          & 
& ratVWRm,MdeltaRpp,MFd,MFe,MFu,MHpm,MVWLm,MVWRm,gNLO,coup)

cplHiggsPP(i1) = coup*Alpha 
CoupHPP(i1) = coup 
Call CoupHiggsToPhotonSM(m_in,MdeltaRpp,MFd,MFe,MFu,MHpm,MVWLm,MVWRm,gNLO,coup)

ratioPP(i1) = Abs(cplHiggsPP(i1)/(coup*Alpha))**2 
  gNLO = -1._dp 
Call CoupHiggsToGluon(m_in,i1,ratFd,ratFu,MFd,MFu,gNLO,coup)

cplHiggsGG(i1) = coup*AlphaSQ 
CoupHGG(i1) = coup 
Call CoupHiggsToGluonSM(m_in,MFd,MFu,gNLO,coup)

If (HigherOrderDiboson) Then 
  NLOqcd = 12._dp*oo48pi2*(95._dp/4._dp - 7._dp/6._dp*NFlav(m_in))*g3**2 
  NNLOqcd = 0.0005785973353112832_dp*(410.52103034222284_dp - 52.326413200014684_dp*NFlav(m_in)+NFlav(m_in)**2 & 
 & +(2.6337085360233763_dp +0.7392866066030529_dp *NFlav(m_in))*Log(m_in**2/mf_u(3)**2))*g3**4 
  NNNLOqcd = 0.00017781840290519607_dp*(42.74607514668917_dp + 11.191050460173795_dp*Log(m_in**2/mf_u(3)**2) + Log(m_in**2/mf_u(3)**2)**2)*g3**6 
Else 
  NLOqcd = 0._dp 
  NNLOqcd = 0._dp 
  NNNLOqcd = 0._dp 
End if 
coup = coup*Sqrt(1._dp + NLOqcd+NNLOqcd+NNNLOqcd) 
cplHiggsGG(i1) = cplHiggsGG(i1)*Sqrt(1._dp + NLOqcd+NNLOqcd+NNNLOqcd) 
CoupHGG(i1)=cplHiggsGG(i1) 
ratioGG(i1) = Abs(cplHiggsGG(i1)/(coup*AlphaSQ))**2 
!----------------------------------------------------
! Coupling ratios for HiggsBounds 
!----------------------------------------------------
 
Do i2=1, 3
rHB_S_S_Fe(i1,i2) = Abs((cplcFeFehhL(i2,i2,i1)+cplcFeFehhR(i2,i2,i1))*vev/(2._dp*MFe(i2)))**2 
rHB_S_P_Fe(i1,i2) = Abs((cplcFeFehhL(i2,i2,i1)-cplcFeFehhR(i2,i2,i1))*vev/(2._dp*MFe(i2)))**2 
End Do 
Do i2=1, 3
rHB_S_S_Fu(i1,i2) = Abs((cplcFuFuhhL(i2,i2,i1)+cplcFuFuhhR(i2,i2,i1))*vev/(2._dp*MFu(i2)))**2 
rHB_S_P_Fu(i1,i2) = Abs((cplcFuFuhhL(i2,i2,i1)-cplcFuFuhhR(i2,i2,i1))*vev/(2._dp*MFu(i2)))**2 
End Do 
Do i2=1, 3
rHB_S_S_Fd(i1,i2) = Abs((cplcFdFdhhL(i2,i2,i1)+cplcFdFdhhR(i2,i2,i1))*vev/(2._dp*MFd(i2)))**2 
rHB_S_P_Fd(i1,i2) = Abs((cplcFdFdhhL(i2,i2,i1)-cplcFdFdhhR(i2,i2,i1))*vev/(2._dp*MFd(i2)))**2 
End Do 
rHB_S_VZ(i1) = Abs(-0.5_dp*cplhhVZVZ(i1)*vev/MVZ2)**2 
rHB_S_VWLm(i1) = Abs(-0.5_dp*cplhhcVWLmVWLm(i1)*vev/MVWLm2)**2 
Do i2=1, 6
rHB_S_S_Fv(i1,i2) = Abs((cplFvFvhhL(i2,i2,i1)+cplFvFvhhR(i2,i2,i1))*vev/(2._dp*MFv(i2)))**2 
rHB_S_P_Fv(i1,i2) = Abs((cplFvFvhhL(i2,i2,i1)-cplFvFvhhR(i2,i2,i1))*vev/(2._dp*MFv(i2)))**2 
End Do 
If (i1.eq.1) Then 
CPL_A_H_Z = Abs(cplAhhhVZ**2/(g2**2/(cos(TW)*4._dp)))
CPL_H_H_Z = 0._dp 
End if 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UV = UVinput 
UC = UCinput 
UP = UPinput 
ZH = ZHinput 
ZW = ZWinput 
ZZ = ZZinput 
cplAhAhhh = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingAhAhhhT(gt1,gt2,gt3,RHO1,ALP1,LAM1,ALP3,ALP2,LAM4,LAM2,LAM3,             & 
& vd,vu,vR,ZH,UP,cplAhAhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cpldeltaRpphhcdeltaRpp = 0._dp 
Do gt2 = 1, 3
Call CouplingdeltaRpphhcdeltaRppT(gt2,RHO2,RHO1,ALP1,ALP3,ALP2,vd,vu,vR,              & 
& ZH,cpldeltaRpphhcdeltaRpp(gt2))

End Do 


cplhhhhhh = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplinghhhhhhT(gt1,gt2,gt3,RHO1,ALP1,LAM1,ALP3,ALP2,LAM4,LAM2,LAM3,             & 
& vd,vu,vR,ZH,cplhhhhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhHpmcHpm = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplinghhHpmcHpmT(gt1,gt2,gt3,RHO1,ALP1,LAM1,ALP3,ALP2,LAM4,LAM2,               & 
& LAM3,vd,vu,vR,ZH,UC,cplhhHpmcHpm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhhhVZ = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingAhhhVZT(gt1,gt2,gBL,g2,gR,ZZ,ZH,UP,cplAhhhVZ(gt1,gt2))

 End Do 
End Do 


cplAhhhVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingAhhhVZRT(gt1,gt2,gBL,g2,gR,ZZ,ZH,UP,cplAhhhVZR(gt1,gt2))

 End Do 
End Do 


cplhhHpmcVWLm = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplinghhHpmcVWLmT(gt1,gt2,g2,gR,ZH,UC,PhiW,cplhhHpmcVWLm(gt1,gt2))

 End Do 
End Do 


cplhhHpmcVWRm = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplinghhHpmcVWRmT(gt1,gt2,g2,gR,ZH,UC,PhiW,cplhhHpmcVWRm(gt1,gt2))

 End Do 
End Do 


cplhhcVWLmVWLm = 0._dp 
Do gt1 = 1, 3
Call CouplinghhcVWLmVWLmT(gt1,g2,gR,vd,vu,vR,ZH,PhiW,cplhhcVWLmVWLm(gt1))

End Do 


cplhhcVWRmVWLm = 0._dp 
Do gt1 = 1, 3
Call CouplinghhcVWRmVWLmT(gt1,g2,gR,vd,vu,vR,ZH,PhiW,cplhhcVWRmVWLm(gt1))

End Do 


cplhhcVWRmVWRm = 0._dp 
Do gt1 = 1, 3
Call CouplinghhcVWRmVWRmT(gt1,g2,gR,vd,vu,vR,ZH,PhiW,cplhhcVWRmVWRm(gt1))

End Do 


cplhhVZVZ = 0._dp 
Do gt1 = 1, 3
Call CouplinghhVZVZT(gt1,gBL,g2,gR,vd,vu,vR,ZZ,ZH,cplhhVZVZ(gt1))

End Do 


cplhhVZVZR = 0._dp 
Do gt1 = 1, 3
Call CouplinghhVZVZRT(gt1,gBL,g2,gR,vd,vu,vR,ZZ,ZH,cplhhVZVZR(gt1))

End Do 


cplhhVZRVZR = 0._dp 
Do gt1 = 1, 3
Call CouplinghhVZRVZRT(gt1,gBL,g2,gR,vd,vu,vR,ZZ,ZH,cplhhVZRVZR(gt1))

End Do 


cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFdFdhhT(gt1,gt2,gt3,YQ1,YQ2,ZH,ZDL,ZDR,cplcFdFdhhL(gt1,gt2,gt3)         & 
& ,cplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFeFehhT(gt1,gt2,gt3,YL1,YL2,ZH,ZEL,ZER,cplcFeFehhL(gt1,gt2,gt3)         & 
& ,cplcFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFuFuhhT(gt1,gt2,gt3,YQ1,YQ2,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)         & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFvhhL = 0._dp 
cplFvFvhhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 3
Call CouplingFvFvhhT(gt1,gt2,gt3,YDR,YL1,YL2,ZH,UV,cplFvFvhhL(gt1,gt2,gt3)            & 
& ,cplFvFvhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_hh_decays_2B
 
Subroutine CouplingsFor_Fv_decays_2B(m_in,i1,MAhinput,MAh2input,MdeltaRppinput,       & 
& MdeltaRpp2input,MFcinput,MFc2input,MFcpinput,MFcp2input,MFcppinput,MFcpp2input,        & 
& MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,MFu2input,MFvinput,MFv2input,           & 
& Mhhinput,Mhh2input,MHpminput,MHpm2input,MVWLminput,MVWLm2input,MVWRminput,             & 
& MVWRm2input,MVZinput,MVZ2input,MVZRinput,MVZR2input,phaTinput,PhiWinput,               & 
& UVinput,TWinput,UCinput,ZDRinput,ZERinput,UPinput,ZURinput,ZDLinput,ZELinput,          & 
& ZULinput,ZHinput,ZWinput,ZZinput,gBLinput,g2input,gRinput,g3input,RHO2input,           & 
& RHO1input,ALP1input,LAM1input,ALP3input,ALP2input,LAM4input,LAM2input,LAM3input,       & 
& YDRinput,YL1input,YQ1input,YL2input,YQ2input,M23input,mu32input,MU22input,             & 
& MU12input,vdinput,vuinput,vRinput,cplFvFvAhL,cplFvFvAhR,cplFvFeHpmL,cplFvFeHpmR,       & 
& cplFvFeVWLmL,cplFvFeVWLmR,cplFvFeVWRmL,cplFvFeVWRmR,cplFvFvhhL,cplFvFvhhR,             & 
& cplFvFvVZL,cplFvFvVZR,cplFvFvVZRL,cplFvFvVZRR,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: gBLinput,g2input,gRinput,g3input,RHO2input,RHO1input,ALP1input,LAM1input,             & 
& ALP3input,ALP2input,LAM4input,LAM2input,LAM3input,M23input,mu32input,MU22input,        & 
& MU12input,vdinput,vuinput,vRinput

Complex(dp),Intent(in) :: YDRinput(3,3),YL1input(3,3),YQ1input(3,3),YL2input(3,3),YQ2input(3,3)

Real(dp),Intent(in) :: MAhinput(3),MAh2input(3),MdeltaRppinput,MdeltaRpp2input,MFcinput,MFc2input,           & 
& MFcpinput,MFcp2input,MFcppinput,MFcpp2input,MFdinput(3),MFd2input(3),MFeinput(3),      & 
& MFe2input(3),MFuinput(3),MFu2input(3),MFvinput(6),MFv2input(6),Mhhinput(3),            & 
& Mhh2input(3),MHpminput(3),MHpm2input(3),MVWLminput,MVWLm2input,MVWRminput,             & 
& MVWRm2input,MVZinput,MVZ2input,MVZRinput,MVZR2input,PhiWinput,TWinput,UCinput(3,3),    & 
& UPinput(3,3),ZHinput(3,3)

Complex(dp),Intent(in) :: phaTinput,UVinput(6,6),ZDRinput(3,3),ZERinput(3,3),ZURinput(3,3),ZDLinput(3,3),       & 
& ZELinput(3,3),ZULinput(3,3),ZWinput(4,4),ZZinput(3,3)

Real(dp) :: gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,ALP3,ALP2,LAM4,LAM2,LAM3,M23,mu32,MU22,              & 
& MU12,vd,vu,vR

Complex(dp) :: YDR(3,3),YL1(3,3),YQ1(3,3),YL2(3,3),YQ2(3,3)

Complex(dp),Intent(out) :: cplFvFvAhL(6,6,3),cplFvFvAhR(6,6,3),cplFvFeHpmL(6,3,3),cplFvFeHpmR(6,3,3),            & 
& cplFvFeVWLmL(6,3),cplFvFeVWLmR(6,3),cplFvFeVWRmL(6,3),cplFvFeVWRmR(6,3),               & 
& cplFvFvhhL(6,6,3),cplFvFvhhR(6,6,3),cplFvFvVZL(6,6),cplFvFvVZR(6,6),cplFvFvVZRL(6,6),  & 
& cplFvFvVZRR(6,6)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(3),MAh2(3),MdeltaRpp,MdeltaRpp2,MFc,MFc2,MFcp,MFcp2,MFcpp,MFcpp2,MFd(3),          & 
& MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),Mhh(3),Mhh2(3),MHpm(3),           & 
& MHpm2(3),MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,TW,UC(3,3),UP(3,3),ZH(3,3)

Complex(dp) :: phaT,UV(6,6),ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZW(4,4),ZZ(3,3)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Fv_2B'
 
sinW2=1._dp-mW2/mZ2 
gBL = gBLinput 
g2 = g2input 
gR = gRinput 
g3 = g3input 
RHO2 = RHO2input 
RHO1 = RHO1input 
ALP1 = ALP1input 
LAM1 = LAM1input 
ALP3 = ALP3input 
ALP2 = ALP2input 
LAM4 = LAM4input 
LAM2 = LAM2input 
LAM3 = LAM3input 
YDR = YDRinput 
YL1 = YL1input 
YQ1 = YQ1input 
YL2 = YL2input 
YQ2 = YQ2input 
M23 = M23input 
mu32 = mu32input 
MU22 = MU22input 
MU12 = MU12input 
vd = vdinput 
vu = vuinput 
vR = vRinput 
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,ALP3,ALP2,LAM4,           & 
& LAM2,LAM3,YDR,YL1,YQ1,YL2,YQ2,M23,mu32,MU22,MU12,vd,vu,vR,(/ ZeroC, ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MdeltaRpp,MdeltaRpp2,MFc,MFc2,MFcp,MFcp2,MFcpp,              & 
& MFcpp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MVWLm,MVWLm2,           & 
& MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,phaT,PhiW,UV,TW,UC,ZDR,ZER,UP,ZUR,ZDL,ZEL,            & 
& ZUL,ZH,ZW,ZZ,vd,vu,vR,gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,ALP3,ALP2,LAM4,LAM2,            & 
& LAM3,YDR,YL1,YQ1,YL2,YQ2,M23,mu32,MU22,MU12,.True.,kont)

ZH = ZHinput 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UV = UVinput 
UC = UCinput 
UP = UPinput 
ZH = ZHinput 
ZW = ZWinput 
ZZ = ZZinput 
cplFvFvAhL = 0._dp 
cplFvFvAhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 3
Call CouplingFvFvAhT(gt1,gt2,gt3,YDR,YL1,YL2,UP,UV,cplFvFvAhL(gt1,gt2,gt3)            & 
& ,cplFvFvAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFeHpmL = 0._dp 
cplFvFeHpmR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingFvFeHpmT(gt1,gt2,gt3,YDR,YL1,YL2,UC,ZEL,ZER,UV,cplFvFeHpmL(gt1,gt2,gt3)  & 
& ,cplFvFeHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFvhhL = 0._dp 
cplFvFvhhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 3
Call CouplingFvFvhhT(gt1,gt2,gt3,YDR,YL1,YL2,ZH,UV,cplFvFvhhL(gt1,gt2,gt3)            & 
& ,cplFvFvhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFeVWLmL = 0._dp 
cplFvFeVWLmR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 3
Call CouplingFvFeVWLmT(gt1,gt2,g2,gR,ZEL,ZER,UV,PhiW,cplFvFeVWLmL(gt1,gt2)            & 
& ,cplFvFeVWLmR(gt1,gt2))

 End Do 
End Do 


cplFvFeVWRmL = 0._dp 
cplFvFeVWRmR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 3
Call CouplingFvFeVWRmT(gt1,gt2,g2,gR,ZEL,ZER,UV,PhiW,cplFvFeVWRmL(gt1,gt2)            & 
& ,cplFvFeVWRmR(gt1,gt2))

 End Do 
End Do 


cplFvFvVZL = 0._dp 
cplFvFvVZR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingFvFvVZT(gt1,gt2,gBL,g2,gR,ZZ,UV,cplFvFvVZL(gt1,gt2),cplFvFvVZR(gt1,gt2))

 End Do 
End Do 


cplFvFvVZRL = 0._dp 
cplFvFvVZRR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingFvFvVZRT(gt1,gt2,gBL,g2,gR,ZZ,UV,cplFvFvVZRL(gt1,gt2),cplFvFvVZRR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Fv_decays_2B
 
Subroutine CouplingsFor_VZ_decays_2B(m_in,i1,MAhinput,MAh2input,MdeltaRppinput,       & 
& MdeltaRpp2input,MFcinput,MFc2input,MFcpinput,MFcp2input,MFcppinput,MFcpp2input,        & 
& MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,MFu2input,MFvinput,MFv2input,           & 
& Mhhinput,Mhh2input,MHpminput,MHpm2input,MVWLminput,MVWLm2input,MVWRminput,             & 
& MVWRm2input,MVZinput,MVZ2input,MVZRinput,MVZR2input,phaTinput,PhiWinput,               & 
& UVinput,TWinput,UCinput,ZDRinput,ZERinput,UPinput,ZURinput,ZDLinput,ZELinput,          & 
& ZULinput,ZHinput,ZWinput,ZZinput,gBLinput,g2input,gRinput,g3input,RHO2input,           & 
& RHO1input,ALP1input,LAM1input,ALP3input,ALP2input,LAM4input,LAM2input,LAM3input,       & 
& YDRinput,YL1input,YQ1input,YL2input,YQ2input,M23input,mu32input,MU22input,             & 
& MU12input,vdinput,vuinput,vRinput,cplAhhhVZ,cpldeltaRppcdeltaRppVZ,cplcFcFcVZL,        & 
& cplcFcFcVZR,cplcFcpFcpVZL,cplcFcpFcpVZR,cplcFcppFcppVZL,cplcFcppFcppVZR,               & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplFvFvVZL,cplFvFvVZR,cplhhVZVZ,cplhhVZVZR,cplHpmcHpmVZ,cplHpmcVWLmVZ,cplHpmcVWRmVZ,   & 
& cplcVWLmVWLmVZ,cplcVWRmVWLmVZ,cplcVWRmVWRmVZ,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: gBLinput,g2input,gRinput,g3input,RHO2input,RHO1input,ALP1input,LAM1input,             & 
& ALP3input,ALP2input,LAM4input,LAM2input,LAM3input,M23input,mu32input,MU22input,        & 
& MU12input,vdinput,vuinput,vRinput

Complex(dp),Intent(in) :: YDRinput(3,3),YL1input(3,3),YQ1input(3,3),YL2input(3,3),YQ2input(3,3)

Real(dp),Intent(in) :: MAhinput(3),MAh2input(3),MdeltaRppinput,MdeltaRpp2input,MFcinput,MFc2input,           & 
& MFcpinput,MFcp2input,MFcppinput,MFcpp2input,MFdinput(3),MFd2input(3),MFeinput(3),      & 
& MFe2input(3),MFuinput(3),MFu2input(3),MFvinput(6),MFv2input(6),Mhhinput(3),            & 
& Mhh2input(3),MHpminput(3),MHpm2input(3),MVWLminput,MVWLm2input,MVWRminput,             & 
& MVWRm2input,MVZinput,MVZ2input,MVZRinput,MVZR2input,PhiWinput,TWinput,UCinput(3,3),    & 
& UPinput(3,3),ZHinput(3,3)

Complex(dp),Intent(in) :: phaTinput,UVinput(6,6),ZDRinput(3,3),ZERinput(3,3),ZURinput(3,3),ZDLinput(3,3),       & 
& ZELinput(3,3),ZULinput(3,3),ZWinput(4,4),ZZinput(3,3)

Real(dp) :: gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,ALP3,ALP2,LAM4,LAM2,LAM3,M23,mu32,MU22,              & 
& MU12,vd,vu,vR

Complex(dp) :: YDR(3,3),YL1(3,3),YQ1(3,3),YL2(3,3),YQ2(3,3)

Complex(dp),Intent(out) :: cplAhhhVZ(3,3),cpldeltaRppcdeltaRppVZ,cplcFcFcVZL,cplcFcFcVZR,cplcFcpFcpVZL,          & 
& cplcFcpFcpVZR,cplcFcppFcppVZL,cplcFcppFcppVZR,cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),       & 
& cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplFvFvVZL(6,6),   & 
& cplFvFvVZR(6,6),cplhhVZVZ(3),cplhhVZVZR(3),cplHpmcHpmVZ(3,3),cplHpmcVWLmVZ(3),         & 
& cplHpmcVWRmVZ(3),cplcVWLmVWLmVZ,cplcVWRmVWLmVZ,cplcVWRmVWRmVZ

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(3),MAh2(3),MdeltaRpp,MdeltaRpp2,MFc,MFc2,MFcp,MFcp2,MFcpp,MFcpp2,MFd(3),          & 
& MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),Mhh(3),Mhh2(3),MHpm(3),           & 
& MHpm2(3),MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,TW,UC(3,3),UP(3,3),ZH(3,3)

Complex(dp) :: phaT,UV(6,6),ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZW(4,4),ZZ(3,3)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_VZ_2B'
 
sinW2=1._dp-mW2/mZ2 
gBL = gBLinput 
g2 = g2input 
gR = gRinput 
g3 = g3input 
RHO2 = RHO2input 
RHO1 = RHO1input 
ALP1 = ALP1input 
LAM1 = LAM1input 
ALP3 = ALP3input 
ALP2 = ALP2input 
LAM4 = LAM4input 
LAM2 = LAM2input 
LAM3 = LAM3input 
YDR = YDRinput 
YL1 = YL1input 
YQ1 = YQ1input 
YL2 = YL2input 
YQ2 = YQ2input 
M23 = M23input 
mu32 = mu32input 
MU22 = MU22input 
MU12 = MU12input 
vd = vdinput 
vu = vuinput 
vR = vRinput 
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,ALP3,ALP2,LAM4,           & 
& LAM2,LAM3,YDR,YL1,YQ1,YL2,YQ2,M23,mu32,MU22,MU12,vd,vu,vR,(/ ZeroC, ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MdeltaRpp,MdeltaRpp2,MFc,MFc2,MFcp,MFcp2,MFcpp,              & 
& MFcpp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MVWLm,MVWLm2,           & 
& MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,phaT,PhiW,UV,TW,UC,ZDR,ZER,UP,ZUR,ZDL,ZEL,            & 
& ZUL,ZH,ZW,ZZ,vd,vu,vR,gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,ALP3,ALP2,LAM4,LAM2,            & 
& LAM3,YDR,YL1,YQ1,YL2,YQ2,M23,mu32,MU22,MU12,.True.,kont)

ZH = ZHinput 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UV = UVinput 
UC = UCinput 
UP = UPinput 
ZH = ZHinput 
ZW = ZWinput 
ZZ = ZZinput 
cplAhhhVZ = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingAhhhVZT(gt1,gt2,gBL,g2,gR,ZZ,ZH,UP,cplAhhhVZ(gt1,gt2))

 End Do 
End Do 


cpldeltaRppcdeltaRppVZ = 0._dp 
Call CouplingdeltaRppcdeltaRppVZT(gBL,gR,ZZ,cpldeltaRppcdeltaRppVZ)



cplHpmcHpmVZ = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingHpmcHpmVZT(gt1,gt2,gBL,g2,gR,ZZ,UC,cplHpmcHpmVZ(gt1,gt2))

 End Do 
End Do 


cplhhVZVZ = 0._dp 
Do gt1 = 1, 3
Call CouplinghhVZVZT(gt1,gBL,g2,gR,vd,vu,vR,ZZ,ZH,cplhhVZVZ(gt1))

End Do 


cplhhVZVZR = 0._dp 
Do gt1 = 1, 3
Call CouplinghhVZVZRT(gt1,gBL,g2,gR,vd,vu,vR,ZZ,ZH,cplhhVZVZR(gt1))

End Do 


cplHpmcVWLmVZ = 0._dp 
Do gt1 = 1, 3
Call CouplingHpmcVWLmVZT(gt1,gBL,g2,gR,vd,vu,vR,ZZ,UC,PhiW,cplHpmcVWLmVZ(gt1))

End Do 


cplHpmcVWRmVZ = 0._dp 
Do gt1 = 1, 3
Call CouplingHpmcVWRmVZT(gt1,gBL,g2,gR,vd,vu,vR,ZZ,UC,PhiW,cplHpmcVWRmVZ(gt1))

End Do 


cplcVWLmVWLmVZ = 0._dp 
Call CouplingcVWLmVWLmVZT(g2,gR,ZZ,PhiW,cplcVWLmVWLmVZ)



cplcVWRmVWLmVZ = 0._dp 
Call CouplingcVWRmVWLmVZT(g2,gR,ZZ,PhiW,cplcVWRmVWLmVZ)



cplcVWRmVWRmVZ = 0._dp 
Call CouplingcVWRmVWRmVZT(g2,gR,ZZ,PhiW,cplcVWRmVWRmVZ)



cplcFcFcVZL = 0._dp 
cplcFcFcVZR = 0._dp 
Call CouplingcFcFcVZT(gBL,gR,ZZ,cplcFcFcVZL,cplcFcFcVZR)



cplcFcpFcpVZL = 0._dp 
cplcFcpFcpVZR = 0._dp 
Call CouplingcFcpFcpVZT(gBL,ZZ,cplcFcpFcpVZL,cplcFcpFcpVZR)



cplcFcppFcppVZL = 0._dp 
cplcFcppFcppVZR = 0._dp 
Call CouplingcFcppFcppVZT(gBL,gR,ZZ,phaT,cplcFcppFcppVZL,cplcFcppFcppVZR)



cplcFdFdVZL = 0._dp 
cplcFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZT(gt1,gt2,gBL,g2,gR,ZZ,cplcFdFdVZL(gt1,gt2),cplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZL = 0._dp 
cplcFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZT(gt1,gt2,gBL,g2,gR,ZZ,cplcFeFeVZL(gt1,gt2),cplcFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZL = 0._dp 
cplcFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZT(gt1,gt2,gBL,g2,gR,ZZ,cplcFuFuVZL(gt1,gt2),cplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplFvFvVZL = 0._dp 
cplFvFvVZR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingFvFvVZT(gt1,gt2,gBL,g2,gR,ZZ,UV,cplFvFvVZL(gt1,gt2),cplFvFvVZR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_VZ_decays_2B
 
Subroutine CouplingsFor_VZR_decays_2B(m_in,i1,MAhinput,MAh2input,MdeltaRppinput,      & 
& MdeltaRpp2input,MFcinput,MFc2input,MFcpinput,MFcp2input,MFcppinput,MFcpp2input,        & 
& MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,MFu2input,MFvinput,MFv2input,           & 
& Mhhinput,Mhh2input,MHpminput,MHpm2input,MVWLminput,MVWLm2input,MVWRminput,             & 
& MVWRm2input,MVZinput,MVZ2input,MVZRinput,MVZR2input,phaTinput,PhiWinput,               & 
& UVinput,TWinput,UCinput,ZDRinput,ZERinput,UPinput,ZURinput,ZDLinput,ZELinput,          & 
& ZULinput,ZHinput,ZWinput,ZZinput,gBLinput,g2input,gRinput,g3input,RHO2input,           & 
& RHO1input,ALP1input,LAM1input,ALP3input,ALP2input,LAM4input,LAM2input,LAM3input,       & 
& YDRinput,YL1input,YQ1input,YL2input,YQ2input,M23input,mu32input,MU22input,             & 
& MU12input,vdinput,vuinput,vRinput,cplAhhhVZR,cpldeltaRppcdeltaRppVZR,cplcFcFcVZRL,     & 
& cplcFcFcVZRR,cplcFcpFcpVZRL,cplcFcpFcpVZRR,cplcFcppFcppVZRL,cplcFcppFcppVZRR,          & 
& cplcFdFdVZRL,cplcFdFdVZRR,cplcFeFeVZRL,cplcFeFeVZRR,cplcFuFuVZRL,cplcFuFuVZRR,         & 
& cplFvFvVZRL,cplFvFvVZRR,cplhhVZVZR,cplhhVZRVZR,cplHpmcHpmVZR,cplHpmcVWLmVZR,           & 
& cplHpmcVWRmVZR,cplcVWLmVWLmVZR,cplcVWRmVWLmVZR,cplcVWRmVWRmVZR,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: gBLinput,g2input,gRinput,g3input,RHO2input,RHO1input,ALP1input,LAM1input,             & 
& ALP3input,ALP2input,LAM4input,LAM2input,LAM3input,M23input,mu32input,MU22input,        & 
& MU12input,vdinput,vuinput,vRinput

Complex(dp),Intent(in) :: YDRinput(3,3),YL1input(3,3),YQ1input(3,3),YL2input(3,3),YQ2input(3,3)

Real(dp),Intent(in) :: MAhinput(3),MAh2input(3),MdeltaRppinput,MdeltaRpp2input,MFcinput,MFc2input,           & 
& MFcpinput,MFcp2input,MFcppinput,MFcpp2input,MFdinput(3),MFd2input(3),MFeinput(3),      & 
& MFe2input(3),MFuinput(3),MFu2input(3),MFvinput(6),MFv2input(6),Mhhinput(3),            & 
& Mhh2input(3),MHpminput(3),MHpm2input(3),MVWLminput,MVWLm2input,MVWRminput,             & 
& MVWRm2input,MVZinput,MVZ2input,MVZRinput,MVZR2input,PhiWinput,TWinput,UCinput(3,3),    & 
& UPinput(3,3),ZHinput(3,3)

Complex(dp),Intent(in) :: phaTinput,UVinput(6,6),ZDRinput(3,3),ZERinput(3,3),ZURinput(3,3),ZDLinput(3,3),       & 
& ZELinput(3,3),ZULinput(3,3),ZWinput(4,4),ZZinput(3,3)

Real(dp) :: gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,ALP3,ALP2,LAM4,LAM2,LAM3,M23,mu32,MU22,              & 
& MU12,vd,vu,vR

Complex(dp) :: YDR(3,3),YL1(3,3),YQ1(3,3),YL2(3,3),YQ2(3,3)

Complex(dp),Intent(out) :: cplAhhhVZR(3,3),cpldeltaRppcdeltaRppVZR,cplcFcFcVZRL,cplcFcFcVZRR,cplcFcpFcpVZRL,     & 
& cplcFcpFcpVZRR,cplcFcppFcppVZRL,cplcFcppFcppVZRR,cplcFdFdVZRL(3,3),cplcFdFdVZRR(3,3),  & 
& cplcFeFeVZRL(3,3),cplcFeFeVZRR(3,3),cplcFuFuVZRL(3,3),cplcFuFuVZRR(3,3),               & 
& cplFvFvVZRL(6,6),cplFvFvVZRR(6,6),cplhhVZVZR(3),cplhhVZRVZR(3),cplHpmcHpmVZR(3,3),     & 
& cplHpmcVWLmVZR(3),cplHpmcVWRmVZR(3),cplcVWLmVWLmVZR,cplcVWRmVWLmVZR,cplcVWRmVWRmVZR

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(3),MAh2(3),MdeltaRpp,MdeltaRpp2,MFc,MFc2,MFcp,MFcp2,MFcpp,MFcpp2,MFd(3),          & 
& MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),Mhh(3),Mhh2(3),MHpm(3),           & 
& MHpm2(3),MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,TW,UC(3,3),UP(3,3),ZH(3,3)

Complex(dp) :: phaT,UV(6,6),ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZW(4,4),ZZ(3,3)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_VZR_2B'
 
sinW2=1._dp-mW2/mZ2 
gBL = gBLinput 
g2 = g2input 
gR = gRinput 
g3 = g3input 
RHO2 = RHO2input 
RHO1 = RHO1input 
ALP1 = ALP1input 
LAM1 = LAM1input 
ALP3 = ALP3input 
ALP2 = ALP2input 
LAM4 = LAM4input 
LAM2 = LAM2input 
LAM3 = LAM3input 
YDR = YDRinput 
YL1 = YL1input 
YQ1 = YQ1input 
YL2 = YL2input 
YQ2 = YQ2input 
M23 = M23input 
mu32 = mu32input 
MU22 = MU22input 
MU12 = MU12input 
vd = vdinput 
vu = vuinput 
vR = vRinput 
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,ALP3,ALP2,LAM4,           & 
& LAM2,LAM3,YDR,YL1,YQ1,YL2,YQ2,M23,mu32,MU22,MU12,vd,vu,vR,(/ ZeroC, ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MdeltaRpp,MdeltaRpp2,MFc,MFc2,MFcp,MFcp2,MFcpp,              & 
& MFcpp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MVWLm,MVWLm2,           & 
& MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,phaT,PhiW,UV,TW,UC,ZDR,ZER,UP,ZUR,ZDL,ZEL,            & 
& ZUL,ZH,ZW,ZZ,vd,vu,vR,gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,ALP3,ALP2,LAM4,LAM2,            & 
& LAM3,YDR,YL1,YQ1,YL2,YQ2,M23,mu32,MU22,MU12,.True.,kont)

ZH = ZHinput 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UV = UVinput 
UC = UCinput 
UP = UPinput 
ZH = ZHinput 
ZW = ZWinput 
ZZ = ZZinput 
cplAhhhVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingAhhhVZRT(gt1,gt2,gBL,g2,gR,ZZ,ZH,UP,cplAhhhVZR(gt1,gt2))

 End Do 
End Do 


cpldeltaRppcdeltaRppVZR = 0._dp 
Call CouplingdeltaRppcdeltaRppVZRT(gBL,gR,ZZ,cpldeltaRppcdeltaRppVZR)



cplHpmcHpmVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingHpmcHpmVZRT(gt1,gt2,gBL,g2,gR,ZZ,UC,cplHpmcHpmVZR(gt1,gt2))

 End Do 
End Do 


cplhhVZVZR = 0._dp 
Do gt1 = 1, 3
Call CouplinghhVZVZRT(gt1,gBL,g2,gR,vd,vu,vR,ZZ,ZH,cplhhVZVZR(gt1))

End Do 


cplhhVZRVZR = 0._dp 
Do gt1 = 1, 3
Call CouplinghhVZRVZRT(gt1,gBL,g2,gR,vd,vu,vR,ZZ,ZH,cplhhVZRVZR(gt1))

End Do 


cplHpmcVWLmVZR = 0._dp 
Do gt1 = 1, 3
Call CouplingHpmcVWLmVZRT(gt1,gBL,g2,gR,vd,vu,vR,ZZ,UC,PhiW,cplHpmcVWLmVZR(gt1))

End Do 


cplHpmcVWRmVZR = 0._dp 
Do gt1 = 1, 3
Call CouplingHpmcVWRmVZRT(gt1,gBL,g2,gR,vd,vu,vR,ZZ,UC,PhiW,cplHpmcVWRmVZR(gt1))

End Do 


cplcVWLmVWLmVZR = 0._dp 
Call CouplingcVWLmVWLmVZRT(g2,gR,ZZ,PhiW,cplcVWLmVWLmVZR)



cplcVWRmVWLmVZR = 0._dp 
Call CouplingcVWRmVWLmVZRT(g2,gR,ZZ,PhiW,cplcVWRmVWLmVZR)



cplcVWRmVWRmVZR = 0._dp 
Call CouplingcVWRmVWRmVZRT(g2,gR,ZZ,PhiW,cplcVWRmVWRmVZR)



cplcFcFcVZRL = 0._dp 
cplcFcFcVZRR = 0._dp 
Call CouplingcFcFcVZRT(gBL,gR,ZZ,cplcFcFcVZRL,cplcFcFcVZRR)



cplcFcpFcpVZRL = 0._dp 
cplcFcpFcpVZRR = 0._dp 
Call CouplingcFcpFcpVZRT(gBL,ZZ,cplcFcpFcpVZRL,cplcFcpFcpVZRR)



cplcFcppFcppVZRL = 0._dp 
cplcFcppFcppVZRR = 0._dp 
Call CouplingcFcppFcppVZRT(gBL,gR,ZZ,phaT,cplcFcppFcppVZRL,cplcFcppFcppVZRR)



cplcFdFdVZRL = 0._dp 
cplcFdFdVZRR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZRT(gt1,gt2,gBL,g2,gR,ZZ,cplcFdFdVZRL(gt1,gt2),cplcFdFdVZRR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZRL = 0._dp 
cplcFeFeVZRR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZRT(gt1,gt2,gBL,g2,gR,ZZ,cplcFeFeVZRL(gt1,gt2),cplcFeFeVZRR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZRL = 0._dp 
cplcFuFuVZRR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZRT(gt1,gt2,gBL,g2,gR,ZZ,cplcFuFuVZRL(gt1,gt2),cplcFuFuVZRR(gt1,gt2))

 End Do 
End Do 


cplFvFvVZRL = 0._dp 
cplFvFvVZRR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingFvFvVZRT(gt1,gt2,gBL,g2,gR,ZZ,UV,cplFvFvVZRL(gt1,gt2),cplFvFvVZRR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_VZR_decays_2B
 
Subroutine CouplingsFor_deltaRpp_decays_2B(m_in,i1,MAhinput,MAh2input,MdeltaRppinput, & 
& MdeltaRpp2input,MFcinput,MFc2input,MFcpinput,MFcp2input,MFcppinput,MFcpp2input,        & 
& MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,MFu2input,MFvinput,MFv2input,           & 
& Mhhinput,Mhh2input,MHpminput,MHpm2input,MVWLminput,MVWLm2input,MVWRminput,             & 
& MVWRm2input,MVZinput,MVZ2input,MVZRinput,MVZR2input,phaTinput,PhiWinput,               & 
& UVinput,TWinput,UCinput,ZDRinput,ZERinput,UPinput,ZURinput,ZDLinput,ZELinput,          & 
& ZULinput,ZHinput,ZWinput,ZZinput,gBLinput,g2input,gRinput,g3input,RHO2input,           & 
& RHO1input,ALP1input,LAM1input,ALP3input,ALP2input,LAM4input,LAM2input,LAM3input,       & 
& YDRinput,YL1input,YQ1input,YL2input,YQ2input,M23input,mu32input,MU22input,             & 
& MU12input,vdinput,vuinput,vRinput,cpldeltaRpphhcdeltaRpp,cpldeltaRppcdeltaRppVZ,       & 
& cpldeltaRppcdeltaRppVZR,cplFeFecdeltaRppL,cplFeFecdeltaRppR,cplcdeltaRppcHpmcHpm,      & 
& cplcdeltaRppcHpmcVWLm,cplcdeltaRppcHpmcVWRm,cplcdeltaRppcVWLmcVWLm,cplcdeltaRppcVWLmcVWRm,& 
& cplcdeltaRppcVWRmcVWRm,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: gBLinput,g2input,gRinput,g3input,RHO2input,RHO1input,ALP1input,LAM1input,             & 
& ALP3input,ALP2input,LAM4input,LAM2input,LAM3input,M23input,mu32input,MU22input,        & 
& MU12input,vdinput,vuinput,vRinput

Complex(dp),Intent(in) :: YDRinput(3,3),YL1input(3,3),YQ1input(3,3),YL2input(3,3),YQ2input(3,3)

Real(dp),Intent(in) :: MAhinput(3),MAh2input(3),MdeltaRppinput,MdeltaRpp2input,MFcinput,MFc2input,           & 
& MFcpinput,MFcp2input,MFcppinput,MFcpp2input,MFdinput(3),MFd2input(3),MFeinput(3),      & 
& MFe2input(3),MFuinput(3),MFu2input(3),MFvinput(6),MFv2input(6),Mhhinput(3),            & 
& Mhh2input(3),MHpminput(3),MHpm2input(3),MVWLminput,MVWLm2input,MVWRminput,             & 
& MVWRm2input,MVZinput,MVZ2input,MVZRinput,MVZR2input,PhiWinput,TWinput,UCinput(3,3),    & 
& UPinput(3,3),ZHinput(3,3)

Complex(dp),Intent(in) :: phaTinput,UVinput(6,6),ZDRinput(3,3),ZERinput(3,3),ZURinput(3,3),ZDLinput(3,3),       & 
& ZELinput(3,3),ZULinput(3,3),ZWinput(4,4),ZZinput(3,3)

Real(dp) :: gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,ALP3,ALP2,LAM4,LAM2,LAM3,M23,mu32,MU22,              & 
& MU12,vd,vu,vR

Complex(dp) :: YDR(3,3),YL1(3,3),YQ1(3,3),YL2(3,3),YQ2(3,3)

Complex(dp),Intent(out) :: cpldeltaRpphhcdeltaRpp(3),cpldeltaRppcdeltaRppVZ,cpldeltaRppcdeltaRppVZR,             & 
& cplFeFecdeltaRppL(3,3),cplFeFecdeltaRppR(3,3),cplcdeltaRppcHpmcHpm(3,3),               & 
& cplcdeltaRppcHpmcVWLm(3),cplcdeltaRppcHpmcVWRm(3),cplcdeltaRppcVWLmcVWLm,              & 
& cplcdeltaRppcVWLmcVWRm,cplcdeltaRppcVWRmcVWRm

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(3),MAh2(3),MdeltaRpp,MdeltaRpp2,MFc,MFc2,MFcp,MFcp2,MFcpp,MFcpp2,MFd(3),          & 
& MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),Mhh(3),Mhh2(3),MHpm(3),           & 
& MHpm2(3),MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,TW,UC(3,3),UP(3,3),ZH(3,3)

Complex(dp) :: phaT,UV(6,6),ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZW(4,4),ZZ(3,3)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_deltaRpp_2B'
 
sinW2=1._dp-mW2/mZ2 
gBL = gBLinput 
g2 = g2input 
gR = gRinput 
g3 = g3input 
RHO2 = RHO2input 
RHO1 = RHO1input 
ALP1 = ALP1input 
LAM1 = LAM1input 
ALP3 = ALP3input 
ALP2 = ALP2input 
LAM4 = LAM4input 
LAM2 = LAM2input 
LAM3 = LAM3input 
YDR = YDRinput 
YL1 = YL1input 
YQ1 = YQ1input 
YL2 = YL2input 
YQ2 = YQ2input 
M23 = M23input 
mu32 = mu32input 
MU22 = MU22input 
MU12 = MU12input 
vd = vdinput 
vu = vuinput 
vR = vRinput 
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,ALP3,ALP2,LAM4,           & 
& LAM2,LAM3,YDR,YL1,YQ1,YL2,YQ2,M23,mu32,MU22,MU12,vd,vu,vR,(/ ZeroC, ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MdeltaRpp,MdeltaRpp2,MFc,MFc2,MFcp,MFcp2,MFcpp,              & 
& MFcpp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MVWLm,MVWLm2,           & 
& MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,phaT,PhiW,UV,TW,UC,ZDR,ZER,UP,ZUR,ZDL,ZEL,            & 
& ZUL,ZH,ZW,ZZ,vd,vu,vR,gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,ALP3,ALP2,LAM4,LAM2,            & 
& LAM3,YDR,YL1,YQ1,YL2,YQ2,M23,mu32,MU22,MU12,.True.,kont)

ZH = ZHinput 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UV = UVinput 
UC = UCinput 
UP = UPinput 
ZH = ZHinput 
ZW = ZWinput 
ZZ = ZZinput 
cpldeltaRpphhcdeltaRpp = 0._dp 
Do gt2 = 1, 3
Call CouplingdeltaRpphhcdeltaRppT(gt2,RHO2,RHO1,ALP1,ALP3,ALP2,vd,vu,vR,              & 
& ZH,cpldeltaRpphhcdeltaRpp(gt2))

End Do 


cplcdeltaRppcHpmcHpm = 0._dp 
Do gt2 = 1, 3
 Do gt3 = 1, 3
Call CouplingcdeltaRppcHpmcHpmT(gt2,gt3,RHO2,ALP3,vd,vu,vR,UC,cplcdeltaRppcHpmcHpm(gt2,gt3))

 End Do 
End Do 


cpldeltaRppcdeltaRppVZ = 0._dp 
Call CouplingdeltaRppcdeltaRppVZT(gBL,gR,ZZ,cpldeltaRppcdeltaRppVZ)



cpldeltaRppcdeltaRppVZR = 0._dp 
Call CouplingdeltaRppcdeltaRppVZRT(gBL,gR,ZZ,cpldeltaRppcdeltaRppVZR)



cplcdeltaRppcHpmcVWLm = 0._dp 
Do gt2 = 1, 3
Call CouplingcdeltaRppcHpmcVWLmT(gt2,gR,UC,PhiW,cplcdeltaRppcHpmcVWLm(gt2))

End Do 


cplcdeltaRppcHpmcVWRm = 0._dp 
Do gt2 = 1, 3
Call CouplingcdeltaRppcHpmcVWRmT(gt2,gR,UC,PhiW,cplcdeltaRppcHpmcVWRm(gt2))

End Do 


cplcdeltaRppcVWLmcVWLm = 0._dp 
Call CouplingcdeltaRppcVWLmcVWLmT(gR,vR,PhiW,cplcdeltaRppcVWLmcVWLm)



cplcdeltaRppcVWLmcVWRm = 0._dp 
Call CouplingcdeltaRppcVWLmcVWRmT(gR,vR,PhiW,cplcdeltaRppcVWLmcVWRm)



cplcdeltaRppcVWRmcVWRm = 0._dp 
Call CouplingcdeltaRppcVWRmcVWRmT(gR,vR,PhiW,cplcdeltaRppcVWRmcVWRm)



cplFeFecdeltaRppL = 0._dp 
cplFeFecdeltaRppR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingFeFecdeltaRppT(gt1,gt2,YDR,ZER,cplFeFecdeltaRppL(gt1,gt2),               & 
& cplFeFecdeltaRppR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_deltaRpp_decays_2B
 
Subroutine CouplingsFor_Hpm_decays_2B(m_in,i1,MAhinput,MAh2input,MdeltaRppinput,      & 
& MdeltaRpp2input,MFcinput,MFc2input,MFcpinput,MFcp2input,MFcppinput,MFcpp2input,        & 
& MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,MFu2input,MFvinput,MFv2input,           & 
& Mhhinput,Mhh2input,MHpminput,MHpm2input,MVWLminput,MVWLm2input,MVWRminput,             & 
& MVWRm2input,MVZinput,MVZ2input,MVZRinput,MVZR2input,phaTinput,PhiWinput,               & 
& UVinput,TWinput,UCinput,ZDRinput,ZERinput,UPinput,ZURinput,ZDLinput,ZELinput,          & 
& ZULinput,ZHinput,ZWinput,ZZinput,gBLinput,g2input,gRinput,g3input,RHO2input,           & 
& RHO1input,ALP1input,LAM1input,ALP3input,ALP2input,LAM4input,LAM2input,LAM3input,       & 
& YDRinput,YL1input,YQ1input,YL2input,YQ2input,M23input,mu32input,MU22input,             & 
& MU12input,vdinput,vuinput,vRinput,cplAhHpmcHpm,cplAhcHpmVWLm,cplAhcHpmVWRm,            & 
& cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFeFvcHpmL,cplcFeFvcHpmR,cplhhHpmcHpm,cplhhcHpmVWLm,    & 
& cplhhcHpmVWRm,cplHpmcHpmVZ,cplHpmcHpmVZR,cplcHpmVWLmVZ,cplcHpmVWLmVZR,cplcHpmVWRmVZ,   & 
& cplcHpmVWRmVZR,cplcdeltaRppcHpmcHpm,cplcdeltaRppcHpmcVWLm,cplcdeltaRppcHpmcVWRm,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: gBLinput,g2input,gRinput,g3input,RHO2input,RHO1input,ALP1input,LAM1input,             & 
& ALP3input,ALP2input,LAM4input,LAM2input,LAM3input,M23input,mu32input,MU22input,        & 
& MU12input,vdinput,vuinput,vRinput

Complex(dp),Intent(in) :: YDRinput(3,3),YL1input(3,3),YQ1input(3,3),YL2input(3,3),YQ2input(3,3)

Real(dp),Intent(in) :: MAhinput(3),MAh2input(3),MdeltaRppinput,MdeltaRpp2input,MFcinput,MFc2input,           & 
& MFcpinput,MFcp2input,MFcppinput,MFcpp2input,MFdinput(3),MFd2input(3),MFeinput(3),      & 
& MFe2input(3),MFuinput(3),MFu2input(3),MFvinput(6),MFv2input(6),Mhhinput(3),            & 
& Mhh2input(3),MHpminput(3),MHpm2input(3),MVWLminput,MVWLm2input,MVWRminput,             & 
& MVWRm2input,MVZinput,MVZ2input,MVZRinput,MVZR2input,PhiWinput,TWinput,UCinput(3,3),    & 
& UPinput(3,3),ZHinput(3,3)

Complex(dp),Intent(in) :: phaTinput,UVinput(6,6),ZDRinput(3,3),ZERinput(3,3),ZURinput(3,3),ZDLinput(3,3),       & 
& ZELinput(3,3),ZULinput(3,3),ZWinput(4,4),ZZinput(3,3)

Real(dp) :: gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,ALP3,ALP2,LAM4,LAM2,LAM3,M23,mu32,MU22,              & 
& MU12,vd,vu,vR

Complex(dp) :: YDR(3,3),YL1(3,3),YQ1(3,3),YL2(3,3),YQ2(3,3)

Complex(dp),Intent(out) :: cplAhHpmcHpm(3,3,3),cplAhcHpmVWLm(3,3),cplAhcHpmVWRm(3,3),cplcFuFdcHpmL(3,3,3),       & 
& cplcFuFdcHpmR(3,3,3),cplcFeFvcHpmL(3,6,3),cplcFeFvcHpmR(3,6,3),cplhhHpmcHpm(3,3,3),    & 
& cplhhcHpmVWLm(3,3),cplhhcHpmVWRm(3,3),cplHpmcHpmVZ(3,3),cplHpmcHpmVZR(3,3),            & 
& cplcHpmVWLmVZ(3),cplcHpmVWLmVZR(3),cplcHpmVWRmVZ(3),cplcHpmVWRmVZR(3),cplcdeltaRppcHpmcHpm(3,3),& 
& cplcdeltaRppcHpmcVWLm(3),cplcdeltaRppcHpmcVWRm(3)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(3),MAh2(3),MdeltaRpp,MdeltaRpp2,MFc,MFc2,MFcp,MFcp2,MFcpp,MFcpp2,MFd(3),          & 
& MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),Mhh(3),Mhh2(3),MHpm(3),           & 
& MHpm2(3),MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,TW,UC(3,3),UP(3,3),ZH(3,3)

Complex(dp) :: phaT,UV(6,6),ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZW(4,4),ZZ(3,3)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Hpm_2B'
 
sinW2=1._dp-mW2/mZ2 
gBL = gBLinput 
g2 = g2input 
gR = gRinput 
g3 = g3input 
RHO2 = RHO2input 
RHO1 = RHO1input 
ALP1 = ALP1input 
LAM1 = LAM1input 
ALP3 = ALP3input 
ALP2 = ALP2input 
LAM4 = LAM4input 
LAM2 = LAM2input 
LAM3 = LAM3input 
YDR = YDRinput 
YL1 = YL1input 
YQ1 = YQ1input 
YL2 = YL2input 
YQ2 = YQ2input 
M23 = M23input 
mu32 = mu32input 
MU22 = MU22input 
MU12 = MU12input 
vd = vdinput 
vu = vuinput 
vR = vRinput 
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,ALP3,ALP2,LAM4,           & 
& LAM2,LAM3,YDR,YL1,YQ1,YL2,YQ2,M23,mu32,MU22,MU12,vd,vu,vR,(/ ZeroC, ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MdeltaRpp,MdeltaRpp2,MFc,MFc2,MFcp,MFcp2,MFcpp,              & 
& MFcpp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MVWLm,MVWLm2,           & 
& MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,phaT,PhiW,UV,TW,UC,ZDR,ZER,UP,ZUR,ZDL,ZEL,            & 
& ZUL,ZH,ZW,ZZ,vd,vu,vR,gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,ALP3,ALP2,LAM4,LAM2,            & 
& LAM3,YDR,YL1,YQ1,YL2,YQ2,M23,mu32,MU22,MU12,.True.,kont)

ZH = ZHinput 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UV = UVinput 
UC = UCinput 
UP = UPinput 
ZH = ZHinput 
ZW = ZWinput 
ZZ = ZZinput 
cplAhHpmcHpm = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingAhHpmcHpmT(gt1,gt2,gt3,ALP3,LAM2,LAM3,vd,vu,vR,UP,UC,cplAhHpmcHpm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhHpmcHpm = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplinghhHpmcHpmT(gt1,gt2,gt3,RHO1,ALP1,LAM1,ALP3,ALP2,LAM4,LAM2,               & 
& LAM3,vd,vu,vR,ZH,UC,cplhhHpmcHpm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcdeltaRppcHpmcHpm = 0._dp 
Do gt2 = 1, 3
 Do gt3 = 1, 3
Call CouplingcdeltaRppcHpmcHpmT(gt2,gt3,RHO2,ALP3,vd,vu,vR,UC,cplcdeltaRppcHpmcHpm(gt2,gt3))

 End Do 
End Do 


cplAhcHpmVWLm = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingAhcHpmVWLmT(gt1,gt2,g2,gR,UP,UC,PhiW,cplAhcHpmVWLm(gt1,gt2))

 End Do 
End Do 


cplAhcHpmVWRm = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingAhcHpmVWRmT(gt1,gt2,g2,gR,UP,UC,PhiW,cplAhcHpmVWRm(gt1,gt2))

 End Do 
End Do 


cplhhcHpmVWLm = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplinghhcHpmVWLmT(gt1,gt2,g2,gR,ZH,UC,PhiW,cplhhcHpmVWLm(gt1,gt2))

 End Do 
End Do 


cplhhcHpmVWRm = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplinghhcHpmVWRmT(gt1,gt2,g2,gR,ZH,UC,PhiW,cplhhcHpmVWRm(gt1,gt2))

 End Do 
End Do 


cplHpmcHpmVZ = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingHpmcHpmVZT(gt1,gt2,gBL,g2,gR,ZZ,UC,cplHpmcHpmVZ(gt1,gt2))

 End Do 
End Do 


cplHpmcHpmVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingHpmcHpmVZRT(gt1,gt2,gBL,g2,gR,ZZ,UC,cplHpmcHpmVZR(gt1,gt2))

 End Do 
End Do 


cplcdeltaRppcHpmcVWLm = 0._dp 
Do gt2 = 1, 3
Call CouplingcdeltaRppcHpmcVWLmT(gt2,gR,UC,PhiW,cplcdeltaRppcHpmcVWLm(gt2))

End Do 


cplcdeltaRppcHpmcVWRm = 0._dp 
Do gt2 = 1, 3
Call CouplingcdeltaRppcHpmcVWRmT(gt2,gR,UC,PhiW,cplcdeltaRppcHpmcVWRm(gt2))

End Do 


cplcHpmVWLmVZ = 0._dp 
Do gt1 = 1, 3
Call CouplingcHpmVWLmVZT(gt1,gBL,g2,gR,vd,vu,vR,ZZ,UC,PhiW,cplcHpmVWLmVZ(gt1))

End Do 


cplcHpmVWLmVZR = 0._dp 
Do gt1 = 1, 3
Call CouplingcHpmVWLmVZRT(gt1,gBL,g2,gR,vd,vu,vR,ZZ,UC,PhiW,cplcHpmVWLmVZR(gt1))

End Do 


cplcHpmVWRmVZ = 0._dp 
Do gt1 = 1, 3
Call CouplingcHpmVWRmVZT(gt1,gBL,g2,gR,vd,vu,vR,ZZ,UC,PhiW,cplcHpmVWRmVZ(gt1))

End Do 


cplcHpmVWRmVZR = 0._dp 
Do gt1 = 1, 3
Call CouplingcHpmVWRmVZRT(gt1,gBL,g2,gR,vd,vu,vR,ZZ,UC,PhiW,cplcHpmVWRmVZR(gt1))

End Do 


cplcFuFdcHpmL = 0._dp 
cplcFuFdcHpmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFuFdcHpmT(gt1,gt2,gt3,YQ1,YQ2,UC,ZDL,ZDR,ZUL,ZUR,cplcFuFdcHpmL(gt1,gt2,gt3)& 
& ,cplcFuFdcHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFvcHpmL = 0._dp 
cplcFeFvcHpmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
  Do gt3 = 1, 3
Call CouplingcFeFvcHpmT(gt1,gt2,gt3,YDR,YL1,YL2,UC,ZEL,ZER,UV,cplcFeFvcHpmL(gt1,gt2,gt3)& 
& ,cplcFeFvcHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Hpm_decays_2B
 
Subroutine CouplingsFor_Ah_decays_2B(m_in,i1,MAhinput,MAh2input,MdeltaRppinput,       & 
& MdeltaRpp2input,MFcinput,MFc2input,MFcpinput,MFcp2input,MFcppinput,MFcpp2input,        & 
& MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,MFu2input,MFvinput,MFv2input,           & 
& Mhhinput,Mhh2input,MHpminput,MHpm2input,MVWLminput,MVWLm2input,MVWRminput,             & 
& MVWRm2input,MVZinput,MVZ2input,MVZRinput,MVZR2input,phaTinput,PhiWinput,               & 
& UVinput,TWinput,UCinput,ZDRinput,ZERinput,UPinput,ZURinput,ZDLinput,ZELinput,          & 
& ZULinput,ZHinput,ZWinput,ZZinput,gBLinput,g2input,gRinput,g3input,RHO2input,           & 
& RHO1input,ALP1input,LAM1input,ALP3input,ALP2input,LAM4input,LAM2input,LAM3input,       & 
& YDRinput,YL1input,YQ1input,YL2input,YQ2input,M23input,mu32input,MU22input,             & 
& MU12input,vdinput,vuinput,vRinput,cplPseudoHiggsPP,cplPseudoHiggsGG,cplAhAhhh,         & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,               & 
& cplFvFvAhL,cplFvFvAhR,cplAhhhVZ,cplAhhhVZR,cplAhHpmcHpm,cplAhHpmcVWLm,cplAhHpmcVWRm,   & 
& cplAhcVWRmVWLm,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: gBLinput,g2input,gRinput,g3input,RHO2input,RHO1input,ALP1input,LAM1input,             & 
& ALP3input,ALP2input,LAM4input,LAM2input,LAM3input,M23input,mu32input,MU22input,        & 
& MU12input,vdinput,vuinput,vRinput

Complex(dp),Intent(in) :: YDRinput(3,3),YL1input(3,3),YQ1input(3,3),YL2input(3,3),YQ2input(3,3)

Real(dp),Intent(in) :: MAhinput(3),MAh2input(3),MdeltaRppinput,MdeltaRpp2input,MFcinput,MFc2input,           & 
& MFcpinput,MFcp2input,MFcppinput,MFcpp2input,MFdinput(3),MFd2input(3),MFeinput(3),      & 
& MFe2input(3),MFuinput(3),MFu2input(3),MFvinput(6),MFv2input(6),Mhhinput(3),            & 
& Mhh2input(3),MHpminput(3),MHpm2input(3),MVWLminput,MVWLm2input,MVWRminput,             & 
& MVWRm2input,MVZinput,MVZ2input,MVZRinput,MVZR2input,PhiWinput,TWinput,UCinput(3,3),    & 
& UPinput(3,3),ZHinput(3,3)

Complex(dp),Intent(in) :: phaTinput,UVinput(6,6),ZDRinput(3,3),ZERinput(3,3),ZURinput(3,3),ZDLinput(3,3),       & 
& ZELinput(3,3),ZULinput(3,3),ZWinput(4,4),ZZinput(3,3)

Real(dp) :: gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,ALP3,ALP2,LAM4,LAM2,LAM3,M23,mu32,MU22,              & 
& MU12,vd,vu,vR

Complex(dp) :: YDR(3,3),YL1(3,3),YQ1(3,3),YL2(3,3),YQ2(3,3)

Complex(dp),Intent(out) :: cplPseudoHiggsPP(3),cplPseudoHiggsGG(3),cplAhAhhh(3,3,3),cplcFdFdAhL(3,3,3),          & 
& cplcFdFdAhR(3,3,3),cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),cplcFuFuAhL(3,3,3),           & 
& cplcFuFuAhR(3,3,3),cplFvFvAhL(6,6,3),cplFvFvAhR(6,6,3),cplAhhhVZ(3,3),cplAhhhVZR(3,3), & 
& cplAhHpmcHpm(3,3,3),cplAhHpmcVWLm(3,3),cplAhHpmcVWRm(3,3),cplAhcVWRmVWLm(3)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(3),MAh2(3),MdeltaRpp,MdeltaRpp2,MFc,MFc2,MFcp,MFcp2,MFcpp,MFcpp2,MFd(3),          & 
& MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),Mhh(3),Mhh2(3),MHpm(3),           & 
& MHpm2(3),MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,TW,UC(3,3),UP(3,3),ZH(3,3)

Complex(dp) :: phaT,UV(6,6),ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZW(4,4),ZZ(3,3)

Complex(dp) :: ratdeltaRpp,ratFd(3),ratFe(3),ratFu(3),ratHpm(3),ratVWLm,ratVWRm

Complex(dp) :: ratPdeltaRpp,ratPFd(3),ratPFe(3),ratPFu(3),ratPHpm(3),ratPVWLm,ratPVWRm

Complex(dp) :: coup 
Real(dp) :: vev, gNLO, NLOqcd, NNLOqcd, NNNLOqcd, AlphaSQ, AlphaSQhlf 
Real(dp) :: g1SM,g2SM,g3SM,vSM
Complex(dp) ::YuSM(3,3),YdSM(3,3),YeSM(3,3)
Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Ah_2B'
 
sinW2=1._dp-mW2/mZ2 
gBL = gBLinput 
g2 = g2input 
gR = gRinput 
g3 = g3input 
RHO2 = RHO2input 
RHO1 = RHO1input 
ALP1 = ALP1input 
LAM1 = LAM1input 
ALP3 = ALP3input 
ALP2 = ALP2input 
LAM4 = LAM4input 
LAM2 = LAM2input 
LAM3 = LAM3input 
YDR = YDRinput 
YL1 = YL1input 
YQ1 = YQ1input 
YL2 = YL2input 
YQ2 = YQ2input 
M23 = M23input 
mu32 = mu32input 
MU22 = MU22input 
MU12 = MU12input 
vd = vdinput 
vu = vuinput 
vR = vRinput 
Qin=sqrt(getRenormalizationScale()) 
! Run always SM gauge couplings if present 
  Qin=sqrt(getRenormalizationScale()) 
  Call RunSMohdm(m_in,deltaM,g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,vSM) 
   ! SM pole masses needed for diphoton/digluon rate 
   ! But only top and W play a role. 
   vSM=1/Sqrt((G_F*Sqrt(2._dp))) ! On-Shell VEV needed for loop 
   YuSM(3,3)=sqrt(2._dp)*mf_u(3)/vSM  ! On-Shell top needed in loop 
   ! Other running values kept to get H->ff correct 
g3=g3SM
g2=g2SM
gBL=(g1SM*gR)/Sqrt(-g1SM**2 + gR**2)
vd=vSM/Sqrt(1 + TanBeta**2)
vu=(TanBeta*vSM)/Sqrt(1 + TanBeta**2)
YQ2=-((vd*vSM*Transpose(YdSM) - vu*vSM*Transpose(YuSM))/(-vd**2 + vu**2))
YQ1=(vu*vSM*Transpose(YdSM) - vd*vSM*Transpose(YuSM))/(-vd**2 + vu**2)
AlphaSQhlf=g3**2/(4._dp*Pi) 
AlphaSQ=g3**2/(4._dp*Pi) 
Call SolveTadpoleEquations(gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,ALP3,ALP2,LAM4,           & 
& LAM2,LAM3,YDR,YL1,YQ1,YL2,YQ2,M23,mu32,MU22,MU12,vd,vu,vR,(/ ZeroC, ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MdeltaRpp,MdeltaRpp2,MFc,MFc2,MFcp,MFcp2,MFcpp,              & 
& MFcpp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MVWLm,MVWLm2,           & 
& MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,phaT,PhiW,UV,TW,UC,ZDR,ZER,UP,ZUR,ZDL,ZEL,            & 
& ZUL,ZH,ZW,ZZ,vd,vu,vR,gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,ALP3,ALP2,LAM4,LAM2,            & 
& LAM3,YDR,YL1,YQ1,YL2,YQ2,M23,mu32,MU22,MU12,.True.,kont)

ZH = ZHinput 
cplAhAhhh = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingAhAhhhT(gt1,gt2,gt3,RHO1,ALP1,LAM1,ALP3,ALP2,LAM4,LAM2,LAM3,             & 
& vd,vu,vR,ZH,UP,cplAhAhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhHpmcHpm = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingAhHpmcHpmT(gt1,gt2,gt3,ALP3,LAM2,LAM3,vd,vu,vR,UP,UC,cplAhHpmcHpm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhhhVZ = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingAhhhVZT(gt1,gt2,gBL,g2,gR,ZZ,ZH,UP,cplAhhhVZ(gt1,gt2))

 End Do 
End Do 


cplAhhhVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingAhhhVZRT(gt1,gt2,gBL,g2,gR,ZZ,ZH,UP,cplAhhhVZR(gt1,gt2))

 End Do 
End Do 


cplAhHpmcVWLm = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingAhHpmcVWLmT(gt1,gt2,g2,gR,UP,UC,PhiW,cplAhHpmcVWLm(gt1,gt2))

 End Do 
End Do 


cplAhHpmcVWRm = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingAhHpmcVWRmT(gt1,gt2,g2,gR,UP,UC,PhiW,cplAhHpmcVWRm(gt1,gt2))

 End Do 
End Do 


cplAhcVWRmVWLm = 0._dp 
Do gt1 = 1, 3
Call CouplingAhcVWRmVWLmT(gt1,g2,gR,vd,vu,UP,cplAhcVWRmVWLm(gt1))

End Do 


cplcFdFdAhL = 0._dp 
cplcFdFdAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFdFdAhT(gt1,gt2,gt3,YQ1,YQ2,UP,ZDL,ZDR,cplcFdFdAhL(gt1,gt2,gt3)         & 
& ,cplcFdFdAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFeAhL = 0._dp 
cplcFeFeAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFeFeAhT(gt1,gt2,gt3,YL1,YL2,UP,ZEL,ZER,cplcFeFeAhL(gt1,gt2,gt3)         & 
& ,cplcFeFeAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuAhL = 0._dp 
cplcFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFuFuAhT(gt1,gt2,gt3,YQ1,YQ2,UP,ZUL,ZUR,cplcFuFuAhL(gt1,gt2,gt3)         & 
& ,cplcFuFuAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFvAhL = 0._dp 
cplFvFvAhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 3
Call CouplingFvFvAhT(gt1,gt2,gt3,YDR,YL1,YL2,UP,UV,cplFvFvAhL(gt1,gt2,gt3)            & 
& ,cplFvFvAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


vev=1/Sqrt((G_F*Sqrt(2._dp)))
!----------------------------------------------------
! Pseudo Scalar Higgs coupling ratios 
!----------------------------------------------------
 
ratPdeltaRpp = 0._dp 
Do i2=1, 3
ratPFd(i2) = cplcFdFdAhL(i2,i2,i1)*1._dp*vev/MFd(i2) 
End Do 
Do i2=1, 3
ratPFe(i2) = cplcFeFeAhL(i2,i2,i1)*1._dp*vev/MFe(i2) 
End Do 
Do i2=1, 3
ratPFu(i2) = cplcFuFuAhL(i2,i2,i1)*1._dp*vev/MFu(i2) 
End Do 
Do i2=1, 3
ratPHpm(i2) = 0.5_dp*cplAhHpmcHpm(i1,i2,i2)*vev/MHpm2(i2) 
End Do 
ratPVWLm = 0._dp 
ratPVWRm = 0._dp 
If (HigherOrderDiboson) Then 
  gNLO = g3 
Else  
  gNLO = -1._dp 
End if 
Call CoupPseudoHiggsToPhoton(m_in,i1,ratPdeltaRpp,ratPFd,ratPFe,ratPFu,               & 
& ratPHpm,ratPVWLm,ratPVWRm,MdeltaRpp,MFd,MFe,MFu,MHpm,MVWLm,MVWRm,gNLO,coup)

cplPseudoHiggsPP(i1) = 2._dp*coup*Alpha 
CoupAPP(i1) = 2._dp*coup 
Call CoupPseudoHiggsToPhotonSM(m_in,MdeltaRpp,MFd,MFe,MFu,MHpm,MVWLm,MVWRm,           & 
& gNLO,coup)

ratioPPP(i1) = Abs(cplPseudoHiggsPP(i1)/(2._dp*coup*oo4pi*(1._dp-mW2/mZ2)*g2**2))**2 
  gNLO = -1._dp 
Call CoupPseudoHiggsToGluon(Mhh(i1),i1,ratPFd,ratPFu,MFd,MFu,gNLO,coup)

If (HigherOrderDiboson) Then 
  NLOqcd = 12._dp*oo48pi2*(97._dp/4._dp - 7._dp/6._dp*NFlav(m_in))*g3**2 
  NNLOqcd = (171.544_dp +  5._dp*Log(m_in**2/mf_u(3)**2))*g3**4/(4._dp*Pi**2)**2 
  NNNLOqcd = 0._dp 
Else 
  NLOqcd = 0._dp 
  NNLOqcd = 0._dp 
  NNNLOqcd = 0._dp 
End if 
cplPseudoHiggsGG(i1) = 2._dp*coup*AlphaSQ*Sqrt(1._dp + NLOqcd+NNLOqcd+NNNLOqcd) 
CoupAGG(i1) = 2._dp*coup*AlphaSQ*Sqrt(1._dp + NLOqcd+NNLOqcd+NNNLOqcd) 
Call CoupPseudoHiggsToGluonSM(m_in,MFd,MFu,gNLO,coup)

coup = coup*Sqrt(1._dp + NLOqcd+NNLOqcd+NNNLOqcd) 
ratioPGG(i1) = Abs(cplPseudoHiggsGG(i1)/(2._dp*coup*AlphaSQ))**2 

!----------------------------------------------------
! Coupling ratios for HiggsBounds 
!----------------------------------------------------
 
Do i2=1, 3
rHB_P_S_Fe(i1,i2) = 1._dp*Abs((cplcFeFeAhL(i2,i2,i1)+cplcFeFeAhR(i2,i2,i1))*vev/(2._dp*MFe(i2)))**2 
rHB_P_P_Fe(i1,i2) = 1._dp*Abs((cplcFeFeAhL(i2,i2,i1)-cplcFeFeAhR(i2,i2,i1))*vev/(2._dp*MFe(i2)))**2 
End Do 
Do i2=1, 3
rHB_P_S_Fu(i1,i2) = 1._dp*Abs((cplcFuFuAhL(i2,i2,i1)+cplcFuFuAhR(i2,i2,i1))*vev/(2._dp*MFu(i2)))**2 
rHB_P_P_Fu(i1,i2) = 1._dp*Abs((cplcFuFuAhL(i2,i2,i1)-cplcFuFuAhR(i2,i2,i1))*vev/(2._dp*MFu(i2)))**2 
End Do 
Do i2=1, 3
rHB_P_S_Fd(i1,i2) = 1._dp*Abs((cplcFdFdAhL(i2,i2,i1)+cplcFdFdAhR(i2,i2,i1))*vev/(2._dp*MFd(i2)))**2 
rHB_P_P_Fd(i1,i2) = 1._dp*Abs((cplcFdFdAhL(i2,i2,i1)-cplcFdFdAhR(i2,i2,i1))*vev/(2._dp*MFd(i2)))**2 
End Do 
Do i2=1, 6
rHB_P_S_Fv(i1,i2) = 1._dp*Abs((cplFvFvAhL(i2,i2,i1)+cplFvFvAhR(i2,i2,i1))*vev/(2._dp*MFv(i2)))**2 
rHB_P_P_Fv(i1,i2) = 1._dp*Abs((cplFvFvAhL(i2,i2,i1)-cplFvFvAhR(i2,i2,i1))*vev/(2._dp*MFv(i2)))**2 
End Do 
If (i1.eq.3) Then 
CPL_A_A_Z = 0._dp 
End if 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UV = UVinput 
UC = UCinput 
UP = UPinput 
ZH = ZHinput 
ZW = ZWinput 
ZZ = ZZinput 
cplAhAhhh = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingAhAhhhT(gt1,gt2,gt3,RHO1,ALP1,LAM1,ALP3,ALP2,LAM4,LAM2,LAM3,             & 
& vd,vu,vR,ZH,UP,cplAhAhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhHpmcHpm = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingAhHpmcHpmT(gt1,gt2,gt3,ALP3,LAM2,LAM3,vd,vu,vR,UP,UC,cplAhHpmcHpm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhhhVZ = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingAhhhVZT(gt1,gt2,gBL,g2,gR,ZZ,ZH,UP,cplAhhhVZ(gt1,gt2))

 End Do 
End Do 


cplAhhhVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingAhhhVZRT(gt1,gt2,gBL,g2,gR,ZZ,ZH,UP,cplAhhhVZR(gt1,gt2))

 End Do 
End Do 


cplAhHpmcVWLm = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingAhHpmcVWLmT(gt1,gt2,g2,gR,UP,UC,PhiW,cplAhHpmcVWLm(gt1,gt2))

 End Do 
End Do 


cplAhHpmcVWRm = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingAhHpmcVWRmT(gt1,gt2,g2,gR,UP,UC,PhiW,cplAhHpmcVWRm(gt1,gt2))

 End Do 
End Do 


cplAhcVWRmVWLm = 0._dp 
Do gt1 = 1, 3
Call CouplingAhcVWRmVWLmT(gt1,g2,gR,vd,vu,UP,cplAhcVWRmVWLm(gt1))

End Do 


cplcFdFdAhL = 0._dp 
cplcFdFdAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFdFdAhT(gt1,gt2,gt3,YQ1,YQ2,UP,ZDL,ZDR,cplcFdFdAhL(gt1,gt2,gt3)         & 
& ,cplcFdFdAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFeAhL = 0._dp 
cplcFeFeAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFeFeAhT(gt1,gt2,gt3,YL1,YL2,UP,ZEL,ZER,cplcFeFeAhL(gt1,gt2,gt3)         & 
& ,cplcFeFeAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuAhL = 0._dp 
cplcFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFuFuAhT(gt1,gt2,gt3,YQ1,YQ2,UP,ZUL,ZUR,cplcFuFuAhL(gt1,gt2,gt3)         & 
& ,cplcFuFuAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFvAhL = 0._dp 
cplFvFvAhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 3
Call CouplingFvFvAhT(gt1,gt2,gt3,YDR,YL1,YL2,UP,UV,cplFvFvAhL(gt1,gt2,gt3)            & 
& ,cplFvFvAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Ah_decays_2B
 
Subroutine CouplingsFor_VWLm_decays_2B(m_in,i1,MAhinput,MAh2input,MdeltaRppinput,     & 
& MdeltaRpp2input,MFcinput,MFc2input,MFcpinput,MFcp2input,MFcppinput,MFcpp2input,        & 
& MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,MFu2input,MFvinput,MFv2input,           & 
& Mhhinput,Mhh2input,MHpminput,MHpm2input,MVWLminput,MVWLm2input,MVWRminput,             & 
& MVWRm2input,MVZinput,MVZ2input,MVZRinput,MVZR2input,phaTinput,PhiWinput,               & 
& UVinput,TWinput,UCinput,ZDRinput,ZERinput,UPinput,ZURinput,ZDLinput,ZELinput,          & 
& ZULinput,ZHinput,ZWinput,ZZinput,gBLinput,g2input,gRinput,g3input,RHO2input,           & 
& RHO1input,ALP1input,LAM1input,ALP3input,ALP2input,LAM4input,LAM2input,LAM3input,       & 
& YDRinput,YL1input,YQ1input,YL2input,YQ2input,M23input,mu32input,MU22input,             & 
& MU12input,vdinput,vuinput,vRinput,cplAhHpmcVWLm,cplAhcVWLmVWRm,cplcFcpFccVWLmL,        & 
& cplcFcpFccVWLmR,cplcFcppFcpcVWLmL,cplcFcppFcpcVWLmR,cplcFuFdcVWLmL,cplcFuFdcVWLmR,     & 
& cplcFeFvcVWLmL,cplcFeFvcVWLmR,cplhhHpmcVWLm,cplhhcVWLmVWLm,cplhhcVWLmVWRm,             & 
& cplHpmcVWLmVZ,cplHpmcVWLmVZR,cplcVWLmVWLmVZ,cplcVWLmVWLmVZR,cplcVWLmVWRmVZ,            & 
& cplcVWLmVWRmVZR,cplcdeltaRppcHpmcVWLm,cplcdeltaRppcVWLmcVWLm,cplcdeltaRppcVWLmcVWRm,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: gBLinput,g2input,gRinput,g3input,RHO2input,RHO1input,ALP1input,LAM1input,             & 
& ALP3input,ALP2input,LAM4input,LAM2input,LAM3input,M23input,mu32input,MU22input,        & 
& MU12input,vdinput,vuinput,vRinput

Complex(dp),Intent(in) :: YDRinput(3,3),YL1input(3,3),YQ1input(3,3),YL2input(3,3),YQ2input(3,3)

Real(dp),Intent(in) :: MAhinput(3),MAh2input(3),MdeltaRppinput,MdeltaRpp2input,MFcinput,MFc2input,           & 
& MFcpinput,MFcp2input,MFcppinput,MFcpp2input,MFdinput(3),MFd2input(3),MFeinput(3),      & 
& MFe2input(3),MFuinput(3),MFu2input(3),MFvinput(6),MFv2input(6),Mhhinput(3),            & 
& Mhh2input(3),MHpminput(3),MHpm2input(3),MVWLminput,MVWLm2input,MVWRminput,             & 
& MVWRm2input,MVZinput,MVZ2input,MVZRinput,MVZR2input,PhiWinput,TWinput,UCinput(3,3),    & 
& UPinput(3,3),ZHinput(3,3)

Complex(dp),Intent(in) :: phaTinput,UVinput(6,6),ZDRinput(3,3),ZERinput(3,3),ZURinput(3,3),ZDLinput(3,3),       & 
& ZELinput(3,3),ZULinput(3,3),ZWinput(4,4),ZZinput(3,3)

Real(dp) :: gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,ALP3,ALP2,LAM4,LAM2,LAM3,M23,mu32,MU22,              & 
& MU12,vd,vu,vR

Complex(dp) :: YDR(3,3),YL1(3,3),YQ1(3,3),YL2(3,3),YQ2(3,3)

Complex(dp),Intent(out) :: cplAhHpmcVWLm(3,3),cplAhcVWLmVWRm(3),cplcFcpFccVWLmL,cplcFcpFccVWLmR,cplcFcppFcpcVWLmL,& 
& cplcFcppFcpcVWLmR,cplcFuFdcVWLmL(3,3),cplcFuFdcVWLmR(3,3),cplcFeFvcVWLmL(3,6),         & 
& cplcFeFvcVWLmR(3,6),cplhhHpmcVWLm(3,3),cplhhcVWLmVWLm(3),cplhhcVWLmVWRm(3),            & 
& cplHpmcVWLmVZ(3),cplHpmcVWLmVZR(3),cplcVWLmVWLmVZ,cplcVWLmVWLmVZR,cplcVWLmVWRmVZ,      & 
& cplcVWLmVWRmVZR,cplcdeltaRppcHpmcVWLm(3),cplcdeltaRppcVWLmcVWLm,cplcdeltaRppcVWLmcVWRm

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(3),MAh2(3),MdeltaRpp,MdeltaRpp2,MFc,MFc2,MFcp,MFcp2,MFcpp,MFcpp2,MFd(3),          & 
& MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),Mhh(3),Mhh2(3),MHpm(3),           & 
& MHpm2(3),MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,TW,UC(3,3),UP(3,3),ZH(3,3)

Complex(dp) :: phaT,UV(6,6),ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZW(4,4),ZZ(3,3)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_VWLm_2B'
 
sinW2=1._dp-mW2/mZ2 
gBL = gBLinput 
g2 = g2input 
gR = gRinput 
g3 = g3input 
RHO2 = RHO2input 
RHO1 = RHO1input 
ALP1 = ALP1input 
LAM1 = LAM1input 
ALP3 = ALP3input 
ALP2 = ALP2input 
LAM4 = LAM4input 
LAM2 = LAM2input 
LAM3 = LAM3input 
YDR = YDRinput 
YL1 = YL1input 
YQ1 = YQ1input 
YL2 = YL2input 
YQ2 = YQ2input 
M23 = M23input 
mu32 = mu32input 
MU22 = MU22input 
MU12 = MU12input 
vd = vdinput 
vu = vuinput 
vR = vRinput 
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,ALP3,ALP2,LAM4,           & 
& LAM2,LAM3,YDR,YL1,YQ1,YL2,YQ2,M23,mu32,MU22,MU12,vd,vu,vR,(/ ZeroC, ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MdeltaRpp,MdeltaRpp2,MFc,MFc2,MFcp,MFcp2,MFcpp,              & 
& MFcpp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MVWLm,MVWLm2,           & 
& MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,phaT,PhiW,UV,TW,UC,ZDR,ZER,UP,ZUR,ZDL,ZEL,            & 
& ZUL,ZH,ZW,ZZ,vd,vu,vR,gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,ALP3,ALP2,LAM4,LAM2,            & 
& LAM3,YDR,YL1,YQ1,YL2,YQ2,M23,mu32,MU22,MU12,.True.,kont)

ZH = ZHinput 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UV = UVinput 
UC = UCinput 
UP = UPinput 
ZH = ZHinput 
ZW = ZWinput 
ZZ = ZZinput 
cplAhHpmcVWLm = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingAhHpmcVWLmT(gt1,gt2,g2,gR,UP,UC,PhiW,cplAhHpmcVWLm(gt1,gt2))

 End Do 
End Do 


cplhhHpmcVWLm = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplinghhHpmcVWLmT(gt1,gt2,g2,gR,ZH,UC,PhiW,cplhhHpmcVWLm(gt1,gt2))

 End Do 
End Do 


cplcdeltaRppcHpmcVWLm = 0._dp 
Do gt2 = 1, 3
Call CouplingcdeltaRppcHpmcVWLmT(gt2,gR,UC,PhiW,cplcdeltaRppcHpmcVWLm(gt2))

End Do 


cplAhcVWLmVWRm = 0._dp 
Do gt1 = 1, 3
Call CouplingAhcVWLmVWRmT(gt1,g2,gR,vd,vu,UP,cplAhcVWLmVWRm(gt1))

End Do 


cplhhcVWLmVWLm = 0._dp 
Do gt1 = 1, 3
Call CouplinghhcVWLmVWLmT(gt1,g2,gR,vd,vu,vR,ZH,PhiW,cplhhcVWLmVWLm(gt1))

End Do 


cplhhcVWLmVWRm = 0._dp 
Do gt1 = 1, 3
Call CouplinghhcVWLmVWRmT(gt1,g2,gR,vd,vu,vR,ZH,PhiW,cplhhcVWLmVWRm(gt1))

End Do 


cplHpmcVWLmVZ = 0._dp 
Do gt1 = 1, 3
Call CouplingHpmcVWLmVZT(gt1,gBL,g2,gR,vd,vu,vR,ZZ,UC,PhiW,cplHpmcVWLmVZ(gt1))

End Do 


cplHpmcVWLmVZR = 0._dp 
Do gt1 = 1, 3
Call CouplingHpmcVWLmVZRT(gt1,gBL,g2,gR,vd,vu,vR,ZZ,UC,PhiW,cplHpmcVWLmVZR(gt1))

End Do 


cplcdeltaRppcVWLmcVWLm = 0._dp 
Call CouplingcdeltaRppcVWLmcVWLmT(gR,vR,PhiW,cplcdeltaRppcVWLmcVWLm)



cplcdeltaRppcVWLmcVWRm = 0._dp 
Call CouplingcdeltaRppcVWLmcVWRmT(gR,vR,PhiW,cplcdeltaRppcVWLmcVWRm)



cplcVWLmVWLmVZ = 0._dp 
Call CouplingcVWLmVWLmVZT(g2,gR,ZZ,PhiW,cplcVWLmVWLmVZ)



cplcVWLmVWLmVZR = 0._dp 
Call CouplingcVWLmVWLmVZRT(g2,gR,ZZ,PhiW,cplcVWLmVWLmVZR)



cplcVWLmVWRmVZ = 0._dp 
Call CouplingcVWLmVWRmVZT(g2,gR,ZZ,PhiW,cplcVWLmVWRmVZ)



cplcVWLmVWRmVZR = 0._dp 
Call CouplingcVWLmVWRmVZRT(g2,gR,ZZ,PhiW,cplcVWLmVWRmVZR)



cplcFcpFccVWLmL = 0._dp 
cplcFcpFccVWLmR = 0._dp 
Call CouplingcFcpFccVWLmT(gR,PhiW,cplcFcpFccVWLmL,cplcFcpFccVWLmR)



cplcFcppFcpcVWLmL = 0._dp 
cplcFcppFcpcVWLmR = 0._dp 
Call CouplingcFcppFcpcVWLmT(gR,phaT,PhiW,cplcFcppFcpcVWLmL,cplcFcppFcpcVWLmR)



cplcFuFdcVWLmL = 0._dp 
cplcFuFdcVWLmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdcVWLmT(gt1,gt2,g2,gR,ZDL,ZDR,ZUL,ZUR,PhiW,cplcFuFdcVWLmL(gt1,gt2)   & 
& ,cplcFuFdcVWLmR(gt1,gt2))

 End Do 
End Do 


cplcFeFvcVWLmL = 0._dp 
cplcFeFvcVWLmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
Call CouplingcFeFvcVWLmT(gt1,gt2,g2,gR,ZEL,ZER,UV,PhiW,cplcFeFvcVWLmL(gt1,gt2)        & 
& ,cplcFeFvcVWLmR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_VWLm_decays_2B
 
Subroutine CouplingsFor_VWRm_decays_2B(m_in,i1,MAhinput,MAh2input,MdeltaRppinput,     & 
& MdeltaRpp2input,MFcinput,MFc2input,MFcpinput,MFcp2input,MFcppinput,MFcpp2input,        & 
& MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,MFu2input,MFvinput,MFv2input,           & 
& Mhhinput,Mhh2input,MHpminput,MHpm2input,MVWLminput,MVWLm2input,MVWRminput,             & 
& MVWRm2input,MVZinput,MVZ2input,MVZRinput,MVZR2input,phaTinput,PhiWinput,               & 
& UVinput,TWinput,UCinput,ZDRinput,ZERinput,UPinput,ZURinput,ZDLinput,ZELinput,          & 
& ZULinput,ZHinput,ZWinput,ZZinput,gBLinput,g2input,gRinput,g3input,RHO2input,           & 
& RHO1input,ALP1input,LAM1input,ALP3input,ALP2input,LAM4input,LAM2input,LAM3input,       & 
& YDRinput,YL1input,YQ1input,YL2input,YQ2input,M23input,mu32input,MU22input,             & 
& MU12input,vdinput,vuinput,vRinput,cplAhHpmcVWRm,cplAhcVWRmVWLm,cplcFcpFccVWRmL,        & 
& cplcFcpFccVWRmR,cplcFcppFcpcVWRmL,cplcFcppFcpcVWRmR,cplcFuFdcVWRmL,cplcFuFdcVWRmR,     & 
& cplcFeFvcVWRmL,cplcFeFvcVWRmR,cplhhHpmcVWRm,cplhhcVWRmVWLm,cplhhcVWRmVWRm,             & 
& cplHpmcVWRmVZ,cplHpmcVWRmVZR,cplcVWRmVWLmVZ,cplcVWRmVWLmVZR,cplcVWRmVWRmVZ,            & 
& cplcVWRmVWRmVZR,cplcdeltaRppcHpmcVWRm,cplcdeltaRppcVWLmcVWRm,cplcdeltaRppcVWRmcVWRm,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: gBLinput,g2input,gRinput,g3input,RHO2input,RHO1input,ALP1input,LAM1input,             & 
& ALP3input,ALP2input,LAM4input,LAM2input,LAM3input,M23input,mu32input,MU22input,        & 
& MU12input,vdinput,vuinput,vRinput

Complex(dp),Intent(in) :: YDRinput(3,3),YL1input(3,3),YQ1input(3,3),YL2input(3,3),YQ2input(3,3)

Real(dp),Intent(in) :: MAhinput(3),MAh2input(3),MdeltaRppinput,MdeltaRpp2input,MFcinput,MFc2input,           & 
& MFcpinput,MFcp2input,MFcppinput,MFcpp2input,MFdinput(3),MFd2input(3),MFeinput(3),      & 
& MFe2input(3),MFuinput(3),MFu2input(3),MFvinput(6),MFv2input(6),Mhhinput(3),            & 
& Mhh2input(3),MHpminput(3),MHpm2input(3),MVWLminput,MVWLm2input,MVWRminput,             & 
& MVWRm2input,MVZinput,MVZ2input,MVZRinput,MVZR2input,PhiWinput,TWinput,UCinput(3,3),    & 
& UPinput(3,3),ZHinput(3,3)

Complex(dp),Intent(in) :: phaTinput,UVinput(6,6),ZDRinput(3,3),ZERinput(3,3),ZURinput(3,3),ZDLinput(3,3),       & 
& ZELinput(3,3),ZULinput(3,3),ZWinput(4,4),ZZinput(3,3)

Real(dp) :: gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,ALP3,ALP2,LAM4,LAM2,LAM3,M23,mu32,MU22,              & 
& MU12,vd,vu,vR

Complex(dp) :: YDR(3,3),YL1(3,3),YQ1(3,3),YL2(3,3),YQ2(3,3)

Complex(dp),Intent(out) :: cplAhHpmcVWRm(3,3),cplAhcVWRmVWLm(3),cplcFcpFccVWRmL,cplcFcpFccVWRmR,cplcFcppFcpcVWRmL,& 
& cplcFcppFcpcVWRmR,cplcFuFdcVWRmL(3,3),cplcFuFdcVWRmR(3,3),cplcFeFvcVWRmL(3,6),         & 
& cplcFeFvcVWRmR(3,6),cplhhHpmcVWRm(3,3),cplhhcVWRmVWLm(3),cplhhcVWRmVWRm(3),            & 
& cplHpmcVWRmVZ(3),cplHpmcVWRmVZR(3),cplcVWRmVWLmVZ,cplcVWRmVWLmVZR,cplcVWRmVWRmVZ,      & 
& cplcVWRmVWRmVZR,cplcdeltaRppcHpmcVWRm(3),cplcdeltaRppcVWLmcVWRm,cplcdeltaRppcVWRmcVWRm

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(3),MAh2(3),MdeltaRpp,MdeltaRpp2,MFc,MFc2,MFcp,MFcp2,MFcpp,MFcpp2,MFd(3),          & 
& MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),Mhh(3),Mhh2(3),MHpm(3),           & 
& MHpm2(3),MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,TW,UC(3,3),UP(3,3),ZH(3,3)

Complex(dp) :: phaT,UV(6,6),ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZW(4,4),ZZ(3,3)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_VWRm_2B'
 
sinW2=1._dp-mW2/mZ2 
gBL = gBLinput 
g2 = g2input 
gR = gRinput 
g3 = g3input 
RHO2 = RHO2input 
RHO1 = RHO1input 
ALP1 = ALP1input 
LAM1 = LAM1input 
ALP3 = ALP3input 
ALP2 = ALP2input 
LAM4 = LAM4input 
LAM2 = LAM2input 
LAM3 = LAM3input 
YDR = YDRinput 
YL1 = YL1input 
YQ1 = YQ1input 
YL2 = YL2input 
YQ2 = YQ2input 
M23 = M23input 
mu32 = mu32input 
MU22 = MU22input 
MU12 = MU12input 
vd = vdinput 
vu = vuinput 
vR = vRinput 
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,ALP3,ALP2,LAM4,           & 
& LAM2,LAM3,YDR,YL1,YQ1,YL2,YQ2,M23,mu32,MU22,MU12,vd,vu,vR,(/ ZeroC, ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MdeltaRpp,MdeltaRpp2,MFc,MFc2,MFcp,MFcp2,MFcpp,              & 
& MFcpp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MVWLm,MVWLm2,           & 
& MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,phaT,PhiW,UV,TW,UC,ZDR,ZER,UP,ZUR,ZDL,ZEL,            & 
& ZUL,ZH,ZW,ZZ,vd,vu,vR,gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,ALP3,ALP2,LAM4,LAM2,            & 
& LAM3,YDR,YL1,YQ1,YL2,YQ2,M23,mu32,MU22,MU12,.True.,kont)

ZH = ZHinput 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UV = UVinput 
UC = UCinput 
UP = UPinput 
ZH = ZHinput 
ZW = ZWinput 
ZZ = ZZinput 
cplAhHpmcVWRm = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingAhHpmcVWRmT(gt1,gt2,g2,gR,UP,UC,PhiW,cplAhHpmcVWRm(gt1,gt2))

 End Do 
End Do 


cplhhHpmcVWRm = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplinghhHpmcVWRmT(gt1,gt2,g2,gR,ZH,UC,PhiW,cplhhHpmcVWRm(gt1,gt2))

 End Do 
End Do 


cplcdeltaRppcHpmcVWRm = 0._dp 
Do gt2 = 1, 3
Call CouplingcdeltaRppcHpmcVWRmT(gt2,gR,UC,PhiW,cplcdeltaRppcHpmcVWRm(gt2))

End Do 


cplAhcVWRmVWLm = 0._dp 
Do gt1 = 1, 3
Call CouplingAhcVWRmVWLmT(gt1,g2,gR,vd,vu,UP,cplAhcVWRmVWLm(gt1))

End Do 


cplhhcVWRmVWLm = 0._dp 
Do gt1 = 1, 3
Call CouplinghhcVWRmVWLmT(gt1,g2,gR,vd,vu,vR,ZH,PhiW,cplhhcVWRmVWLm(gt1))

End Do 


cplhhcVWRmVWRm = 0._dp 
Do gt1 = 1, 3
Call CouplinghhcVWRmVWRmT(gt1,g2,gR,vd,vu,vR,ZH,PhiW,cplhhcVWRmVWRm(gt1))

End Do 


cplHpmcVWRmVZ = 0._dp 
Do gt1 = 1, 3
Call CouplingHpmcVWRmVZT(gt1,gBL,g2,gR,vd,vu,vR,ZZ,UC,PhiW,cplHpmcVWRmVZ(gt1))

End Do 


cplHpmcVWRmVZR = 0._dp 
Do gt1 = 1, 3
Call CouplingHpmcVWRmVZRT(gt1,gBL,g2,gR,vd,vu,vR,ZZ,UC,PhiW,cplHpmcVWRmVZR(gt1))

End Do 


cplcdeltaRppcVWLmcVWRm = 0._dp 
Call CouplingcdeltaRppcVWLmcVWRmT(gR,vR,PhiW,cplcdeltaRppcVWLmcVWRm)



cplcdeltaRppcVWRmcVWRm = 0._dp 
Call CouplingcdeltaRppcVWRmcVWRmT(gR,vR,PhiW,cplcdeltaRppcVWRmcVWRm)



cplcVWRmVWLmVZ = 0._dp 
Call CouplingcVWRmVWLmVZT(g2,gR,ZZ,PhiW,cplcVWRmVWLmVZ)



cplcVWRmVWLmVZR = 0._dp 
Call CouplingcVWRmVWLmVZRT(g2,gR,ZZ,PhiW,cplcVWRmVWLmVZR)



cplcVWRmVWRmVZ = 0._dp 
Call CouplingcVWRmVWRmVZT(g2,gR,ZZ,PhiW,cplcVWRmVWRmVZ)



cplcVWRmVWRmVZR = 0._dp 
Call CouplingcVWRmVWRmVZRT(g2,gR,ZZ,PhiW,cplcVWRmVWRmVZR)



cplcFcpFccVWRmL = 0._dp 
cplcFcpFccVWRmR = 0._dp 
Call CouplingcFcpFccVWRmT(gR,PhiW,cplcFcpFccVWRmL,cplcFcpFccVWRmR)



cplcFcppFcpcVWRmL = 0._dp 
cplcFcppFcpcVWRmR = 0._dp 
Call CouplingcFcppFcpcVWRmT(gR,phaT,PhiW,cplcFcppFcpcVWRmL,cplcFcppFcpcVWRmR)



cplcFuFdcVWRmL = 0._dp 
cplcFuFdcVWRmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdcVWRmT(gt1,gt2,g2,gR,ZDL,ZDR,ZUL,ZUR,PhiW,cplcFuFdcVWRmL(gt1,gt2)   & 
& ,cplcFuFdcVWRmR(gt1,gt2))

 End Do 
End Do 


cplcFeFvcVWRmL = 0._dp 
cplcFeFvcVWRmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
Call CouplingcFeFvcVWRmT(gt1,gt2,g2,gR,ZEL,ZER,UV,PhiW,cplcFeFvcVWRmL(gt1,gt2)        & 
& ,cplcFeFvcVWRmR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_VWRm_decays_2B
 
Subroutine CouplingsFor_Fu_decays_3B(m_in,i1,MAhinput,MAh2input,MdeltaRppinput,       & 
& MdeltaRpp2input,MFcinput,MFc2input,MFcpinput,MFcp2input,MFcppinput,MFcpp2input,        & 
& MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,MFu2input,MFvinput,MFv2input,           & 
& Mhhinput,Mhh2input,MHpminput,MHpm2input,MVWLminput,MVWLm2input,MVWRminput,             & 
& MVWRm2input,MVZinput,MVZ2input,MVZRinput,MVZR2input,phaTinput,PhiWinput,               & 
& UVinput,TWinput,UCinput,ZDRinput,ZERinput,UPinput,ZURinput,ZDLinput,ZELinput,          & 
& ZULinput,ZHinput,ZWinput,ZZinput,gBLinput,g2input,gRinput,g3input,RHO2input,           & 
& RHO1input,ALP1input,LAM1input,ALP3input,ALP2input,LAM4input,LAM2input,LAM3input,       & 
& YDRinput,YL1input,YQ1input,YL2input,YQ2input,M23input,mu32input,MU22input,             & 
& MU12input,vdinput,vuinput,vRinput,cplcFcFcpVWLmL,cplcFcFcpVWLmR,cplcFcFcpVWRmL,        & 
& cplcFcFcpVWRmR,cplcFcFcVZL,cplcFcFcVZR,cplcFcFcVZRL,cplcFcFcVZRR,cplcFcpFcppVWLmL,     & 
& cplcFcpFcppVWLmR,cplcFcpFcppVWRmL,cplcFcpFcppVWRmR,cplcFcpFcpVZL,cplcFcpFcpVZR,        & 
& cplcFcpFcpVZRL,cplcFcpFcpVZRR,cplcFcppFcppVZL,cplcFcppFcppVZR,cplcFcppFcppVZRL,        & 
& cplcFcppFcppVZRR,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,          & 
& cplcFdFdVZR,cplcFdFdVZRL,cplcFdFdVZRR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFdFuVWLmL,         & 
& cplcFdFuVWLmR,cplcFdFuVWRmL,cplcFdFuVWRmR,cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,         & 
& cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZRL,cplcFeFeVZRR,cplcFuFdcHpmL,           & 
& cplcFuFdcHpmR,cplcFuFdcVWLmL,cplcFuFdcVWLmR,cplcFuFdcVWRmL,cplcFuFdcVWRmR,             & 
& cplcFuFuAhL,cplcFuFuAhR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcFuFuVZRL,cplcFuFuVZRR,cplFvFeHpmL,cplFvFeHpmR,cplFvFeVWLmL,cplFvFeVWLmR,           & 
& cplFvFeVWRmL,cplFvFeVWRmR,cplFvFvAhL,cplFvFvAhR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,      & 
& cplFvFvVZR,cplFvFvVZRL,cplFvFvVZRR,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: gBLinput,g2input,gRinput,g3input,RHO2input,RHO1input,ALP1input,LAM1input,             & 
& ALP3input,ALP2input,LAM4input,LAM2input,LAM3input,M23input,mu32input,MU22input,        & 
& MU12input,vdinput,vuinput,vRinput

Complex(dp),Intent(in) :: YDRinput(3,3),YL1input(3,3),YQ1input(3,3),YL2input(3,3),YQ2input(3,3)

Real(dp),Intent(in) :: MAhinput(3),MAh2input(3),MdeltaRppinput,MdeltaRpp2input,MFcinput,MFc2input,           & 
& MFcpinput,MFcp2input,MFcppinput,MFcpp2input,MFdinput(3),MFd2input(3),MFeinput(3),      & 
& MFe2input(3),MFuinput(3),MFu2input(3),MFvinput(6),MFv2input(6),Mhhinput(3),            & 
& Mhh2input(3),MHpminput(3),MHpm2input(3),MVWLminput,MVWLm2input,MVWRminput,             & 
& MVWRm2input,MVZinput,MVZ2input,MVZRinput,MVZR2input,PhiWinput,TWinput,UCinput(3,3),    & 
& UPinput(3,3),ZHinput(3,3)

Complex(dp),Intent(in) :: phaTinput,UVinput(6,6),ZDRinput(3,3),ZERinput(3,3),ZURinput(3,3),ZDLinput(3,3),       & 
& ZELinput(3,3),ZULinput(3,3),ZWinput(4,4),ZZinput(3,3)

Real(dp) :: gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,ALP3,ALP2,LAM4,LAM2,LAM3,M23,mu32,MU22,              & 
& MU12,vd,vu,vR

Complex(dp) :: YDR(3,3),YL1(3,3),YQ1(3,3),YL2(3,3),YQ2(3,3)

Complex(dp),Intent(out) :: cplcFcFcpVWLmL,cplcFcFcpVWLmR,cplcFcFcpVWRmL,cplcFcFcpVWRmR,cplcFcFcVZL,              & 
& cplcFcFcVZR,cplcFcFcVZRL,cplcFcFcVZRR,cplcFcpFcppVWLmL,cplcFcpFcppVWLmR,               & 
& cplcFcpFcppVWRmL,cplcFcpFcppVWRmR,cplcFcpFcpVZL,cplcFcpFcpVZR,cplcFcpFcpVZRL,          & 
& cplcFcpFcpVZRR,cplcFcppFcppVZL,cplcFcppFcppVZR,cplcFcppFcppVZRL,cplcFcppFcppVZRR,      & 
& cplcFdFdAhL(3,3,3),cplcFdFdAhR(3,3,3),cplcFdFdhhL(3,3,3),cplcFdFdhhR(3,3,3),           & 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFdFdVZRL(3,3),cplcFdFdVZRR(3,3),cplcFdFuHpmL(3,3,3),& 
& cplcFdFuHpmR(3,3,3),cplcFdFuVWLmL(3,3),cplcFdFuVWLmR(3,3),cplcFdFuVWRmL(3,3),          & 
& cplcFdFuVWRmR(3,3),cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),cplcFeFehhL(3,3,3),           & 
& cplcFeFehhR(3,3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFeVZRL(3,3),cplcFeFeVZRR(3,3),& 
& cplcFuFdcHpmL(3,3,3),cplcFuFdcHpmR(3,3,3),cplcFuFdcVWLmL(3,3),cplcFuFdcVWLmR(3,3),     & 
& cplcFuFdcVWRmL(3,3),cplcFuFdcVWRmR(3,3),cplcFuFuAhL(3,3,3),cplcFuFuAhR(3,3,3),         & 
& cplcFuFuhhL(3,3,3),cplcFuFuhhR(3,3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),               & 
& cplcFuFuVZRL(3,3),cplcFuFuVZRR(3,3),cplFvFeHpmL(6,3,3),cplFvFeHpmR(6,3,3),             & 
& cplFvFeVWLmL(6,3),cplFvFeVWLmR(6,3),cplFvFeVWRmL(6,3),cplFvFeVWRmR(6,3),               & 
& cplFvFvAhL(6,6,3),cplFvFvAhR(6,6,3),cplFvFvhhL(6,6,3),cplFvFvhhR(6,6,3),               & 
& cplFvFvVZL(6,6),cplFvFvVZR(6,6),cplFvFvVZRL(6,6),cplFvFvVZRR(6,6)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(3),MAh2(3),MdeltaRpp,MdeltaRpp2,MFc,MFc2,MFcp,MFcp2,MFcpp,MFcpp2,MFd(3),          & 
& MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),Mhh(3),Mhh2(3),MHpm(3),           & 
& MHpm2(3),MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,TW,UC(3,3),UP(3,3),ZH(3,3)

Complex(dp) :: phaT,UV(6,6),ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZW(4,4),ZZ(3,3)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Fu_3B'
 
sinW2=1._dp-mW2/mZ2 
gBL = gBLinput 
g2 = g2input 
gR = gRinput 
g3 = g3input 
RHO2 = RHO2input 
RHO1 = RHO1input 
ALP1 = ALP1input 
LAM1 = LAM1input 
ALP3 = ALP3input 
ALP2 = ALP2input 
LAM4 = LAM4input 
LAM2 = LAM2input 
LAM3 = LAM3input 
YDR = YDRinput 
YL1 = YL1input 
YQ1 = YQ1input 
YL2 = YL2input 
YQ2 = YQ2input 
M23 = M23input 
mu32 = mu32input 
MU22 = MU22input 
MU12 = MU12input 
vd = vdinput 
vu = vuinput 
vR = vRinput 
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,ALP3,ALP2,LAM4,           & 
& LAM2,LAM3,YDR,YL1,YQ1,YL2,YQ2,M23,mu32,MU22,MU12,vd,vu,vR,(/ ZeroC, ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MdeltaRpp,MdeltaRpp2,MFc,MFc2,MFcp,MFcp2,MFcpp,              & 
& MFcpp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MVWLm,MVWLm2,           & 
& MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,phaT,PhiW,UV,TW,UC,ZDR,ZER,UP,ZUR,ZDL,ZEL,            & 
& ZUL,ZH,ZW,ZZ,vd,vu,vR,gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,ALP3,ALP2,LAM4,LAM2,            & 
& LAM3,YDR,YL1,YQ1,YL2,YQ2,M23,mu32,MU22,MU12,.True.,kont)

ZH = ZHinput 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UV = UVinput 
UC = UCinput 
UP = UPinput 
ZH = ZHinput 
ZW = ZWinput 
ZZ = ZZinput 
cplcFdFdAhL = 0._dp 
cplcFdFdAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFdFdAhT(gt1,gt2,gt3,YQ1,YQ2,UP,ZDL,ZDR,cplcFdFdAhL(gt1,gt2,gt3)         & 
& ,cplcFdFdAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFeAhL = 0._dp 
cplcFeFeAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFeFeAhT(gt1,gt2,gt3,YL1,YL2,UP,ZEL,ZER,cplcFeFeAhL(gt1,gt2,gt3)         & 
& ,cplcFeFeAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuAhL = 0._dp 
cplcFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFuFuAhT(gt1,gt2,gt3,YQ1,YQ2,UP,ZUL,ZUR,cplcFuFuAhL(gt1,gt2,gt3)         & 
& ,cplcFuFuAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFvAhL = 0._dp 
cplFvFvAhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 3
Call CouplingFvFvAhT(gt1,gt2,gt3,YDR,YL1,YL2,UP,UV,cplFvFvAhL(gt1,gt2,gt3)            & 
& ,cplFvFvAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFdFdhhT(gt1,gt2,gt3,YQ1,YQ2,ZH,ZDL,ZDR,cplcFdFdhhL(gt1,gt2,gt3)         & 
& ,cplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFdcHpmL = 0._dp 
cplcFuFdcHpmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFuFdcHpmT(gt1,gt2,gt3,YQ1,YQ2,UC,ZDL,ZDR,ZUL,ZUR,cplcFuFdcHpmL(gt1,gt2,gt3)& 
& ,cplcFuFdcHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFeHpmL = 0._dp 
cplFvFeHpmR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingFvFeHpmT(gt1,gt2,gt3,YDR,YL1,YL2,UC,ZEL,ZER,UV,cplFvFeHpmL(gt1,gt2,gt3)  & 
& ,cplFvFeHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFeFehhT(gt1,gt2,gt3,YL1,YL2,ZH,ZEL,ZER,cplcFeFehhL(gt1,gt2,gt3)         & 
& ,cplcFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFuFuhhT(gt1,gt2,gt3,YQ1,YQ2,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)         & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFuHpmL = 0._dp 
cplcFdFuHpmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFdFuHpmT(gt1,gt2,gt3,YQ1,YQ2,UC,ZDL,ZDR,ZUL,ZUR,cplcFdFuHpmL(gt1,gt2,gt3)& 
& ,cplcFdFuHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFvhhL = 0._dp 
cplFvFvhhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 3
Call CouplingFvFvhhT(gt1,gt2,gt3,YDR,YL1,YL2,ZH,UV,cplFvFvhhL(gt1,gt2,gt3)            & 
& ,cplFvFvhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFcFcVZL = 0._dp 
cplcFcFcVZR = 0._dp 
Call CouplingcFcFcVZT(gBL,gR,ZZ,cplcFcFcVZL,cplcFcFcVZR)



cplcFcFcVZRL = 0._dp 
cplcFcFcVZRR = 0._dp 
Call CouplingcFcFcVZRT(gBL,gR,ZZ,cplcFcFcVZRL,cplcFcFcVZRR)



cplcFcFcpVWLmL = 0._dp 
cplcFcFcpVWLmR = 0._dp 
Call CouplingcFcFcpVWLmT(gR,PhiW,cplcFcFcpVWLmL,cplcFcFcpVWLmR)



cplcFcFcpVWRmL = 0._dp 
cplcFcFcpVWRmR = 0._dp 
Call CouplingcFcFcpVWRmT(gR,PhiW,cplcFcFcpVWRmL,cplcFcFcpVWRmR)



cplcFcpFcpVZL = 0._dp 
cplcFcpFcpVZR = 0._dp 
Call CouplingcFcpFcpVZT(gBL,ZZ,cplcFcpFcpVZL,cplcFcpFcpVZR)



cplcFcpFcpVZRL = 0._dp 
cplcFcpFcpVZRR = 0._dp 
Call CouplingcFcpFcpVZRT(gBL,ZZ,cplcFcpFcpVZRL,cplcFcpFcpVZRR)



cplcFcpFcppVWLmL = 0._dp 
cplcFcpFcppVWLmR = 0._dp 
Call CouplingcFcpFcppVWLmT(gR,phaT,PhiW,cplcFcpFcppVWLmL,cplcFcpFcppVWLmR)



cplcFcpFcppVWRmL = 0._dp 
cplcFcpFcppVWRmR = 0._dp 
Call CouplingcFcpFcppVWRmT(gR,phaT,PhiW,cplcFcpFcppVWRmL,cplcFcpFcppVWRmR)



cplcFcppFcppVZL = 0._dp 
cplcFcppFcppVZR = 0._dp 
Call CouplingcFcppFcppVZT(gBL,gR,ZZ,phaT,cplcFcppFcppVZL,cplcFcppFcppVZR)



cplcFcppFcppVZRL = 0._dp 
cplcFcppFcppVZRR = 0._dp 
Call CouplingcFcppFcppVZRT(gBL,gR,ZZ,phaT,cplcFcppFcppVZRL,cplcFcppFcppVZRR)



cplcFdFdVZL = 0._dp 
cplcFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZT(gt1,gt2,gBL,g2,gR,ZZ,cplcFdFdVZL(gt1,gt2),cplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVZRL = 0._dp 
cplcFdFdVZRR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZRT(gt1,gt2,gBL,g2,gR,ZZ,cplcFdFdVZRL(gt1,gt2),cplcFdFdVZRR(gt1,gt2))

 End Do 
End Do 


cplcFuFdcVWLmL = 0._dp 
cplcFuFdcVWLmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdcVWLmT(gt1,gt2,g2,gR,ZDL,ZDR,ZUL,ZUR,PhiW,cplcFuFdcVWLmL(gt1,gt2)   & 
& ,cplcFuFdcVWLmR(gt1,gt2))

 End Do 
End Do 


cplcFuFdcVWRmL = 0._dp 
cplcFuFdcVWRmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdcVWRmT(gt1,gt2,g2,gR,ZDL,ZDR,ZUL,ZUR,PhiW,cplcFuFdcVWRmL(gt1,gt2)   & 
& ,cplcFuFdcVWRmR(gt1,gt2))

 End Do 
End Do 


cplFvFeVWLmL = 0._dp 
cplFvFeVWLmR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 3
Call CouplingFvFeVWLmT(gt1,gt2,g2,gR,ZEL,ZER,UV,PhiW,cplFvFeVWLmL(gt1,gt2)            & 
& ,cplFvFeVWLmR(gt1,gt2))

 End Do 
End Do 


cplFvFeVWRmL = 0._dp 
cplFvFeVWRmR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 3
Call CouplingFvFeVWRmT(gt1,gt2,g2,gR,ZEL,ZER,UV,PhiW,cplFvFeVWRmL(gt1,gt2)            & 
& ,cplFvFeVWRmR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZL = 0._dp 
cplcFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZT(gt1,gt2,gBL,g2,gR,ZZ,cplcFeFeVZL(gt1,gt2),cplcFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZRL = 0._dp 
cplcFeFeVZRR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZRT(gt1,gt2,gBL,g2,gR,ZZ,cplcFeFeVZRL(gt1,gt2),cplcFeFeVZRR(gt1,gt2))

 End Do 
End Do 


cplcFdFuVWLmL = 0._dp 
cplcFdFuVWLmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFuVWLmT(gt1,gt2,g2,gR,ZDL,ZDR,ZUL,ZUR,PhiW,cplcFdFuVWLmL(gt1,gt2)     & 
& ,cplcFdFuVWLmR(gt1,gt2))

 End Do 
End Do 


cplcFdFuVWRmL = 0._dp 
cplcFdFuVWRmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFuVWRmT(gt1,gt2,g2,gR,ZDL,ZDR,ZUL,ZUR,PhiW,cplcFdFuVWRmL(gt1,gt2)     & 
& ,cplcFdFuVWRmR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZL = 0._dp 
cplcFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZT(gt1,gt2,gBL,g2,gR,ZZ,cplcFuFuVZL(gt1,gt2),cplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZRL = 0._dp 
cplcFuFuVZRR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZRT(gt1,gt2,gBL,g2,gR,ZZ,cplcFuFuVZRL(gt1,gt2),cplcFuFuVZRR(gt1,gt2))

 End Do 
End Do 


cplFvFvVZL = 0._dp 
cplFvFvVZR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingFvFvVZT(gt1,gt2,gBL,g2,gR,ZZ,UV,cplFvFvVZL(gt1,gt2),cplFvFvVZR(gt1,gt2))

 End Do 
End Do 


cplFvFvVZRL = 0._dp 
cplFvFvVZRR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingFvFvVZRT(gt1,gt2,gBL,g2,gR,ZZ,UV,cplFvFvVZRL(gt1,gt2),cplFvFvVZRR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Fu_decays_3B
 
Subroutine CouplingsFor_Fe_decays_3B(m_in,i1,MAhinput,MAh2input,MdeltaRppinput,       & 
& MdeltaRpp2input,MFcinput,MFc2input,MFcpinput,MFcp2input,MFcppinput,MFcpp2input,        & 
& MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,MFu2input,MFvinput,MFv2input,           & 
& Mhhinput,Mhh2input,MHpminput,MHpm2input,MVWLminput,MVWLm2input,MVWRminput,             & 
& MVWRm2input,MVZinput,MVZ2input,MVZRinput,MVZR2input,phaTinput,PhiWinput,               & 
& UVinput,TWinput,UCinput,ZDRinput,ZERinput,UPinput,ZURinput,ZDLinput,ZELinput,          & 
& ZULinput,ZHinput,ZWinput,ZZinput,gBLinput,g2input,gRinput,g3input,RHO2input,           & 
& RHO1input,ALP1input,LAM1input,ALP3input,ALP2input,LAM4input,LAM2input,LAM3input,       & 
& YDRinput,YL1input,YQ1input,YL2input,YQ2input,M23input,mu32input,MU22input,             & 
& MU12input,vdinput,vuinput,vRinput,cplcFcFcpVWLmL,cplcFcFcpVWLmR,cplcFcFcpVWRmL,        & 
& cplcFcFcpVWRmR,cplcFcFcVZL,cplcFcFcVZR,cplcFcFcVZRL,cplcFcFcVZRR,cplcFcpFcppVWLmL,     & 
& cplcFcpFcppVWLmR,cplcFcpFcppVWRmL,cplcFcpFcppVWRmR,cplcFcpFcpVZL,cplcFcpFcpVZR,        & 
& cplcFcpFcpVZRL,cplcFcpFcpVZRR,cplcFcppFcppVZL,cplcFcppFcppVZR,cplcFcppFcppVZRL,        & 
& cplcFcppFcppVZRR,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,          & 
& cplcFdFdVZR,cplcFdFdVZRL,cplcFdFdVZRR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFdFuVWLmL,         & 
& cplcFdFuVWLmR,cplcFdFuVWRmL,cplcFdFuVWRmR,cplcFecFedeltaRppL,cplcFecFedeltaRppR,       & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcFeFeVZRL,cplcFeFeVZRR,cplcFeFvcHpmL,cplcFeFvcHpmR,cplcFeFvcVWLmL,cplcFeFvcVWLmR,   & 
& cplcFeFvcVWRmL,cplcFeFvcVWRmR,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuhhL,cplcFuFuhhR,         & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZRL,cplcFuFuVZRR,cplFeFecdeltaRppL,cplFeFecdeltaRppR, & 
& cplFvFeHpmL,cplFvFeHpmR,cplFvFeVWLmL,cplFvFeVWLmR,cplFvFeVWRmL,cplFvFeVWRmR,           & 
& cplFvFvAhL,cplFvFvAhR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZRL,         & 
& cplFvFvVZRR,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: gBLinput,g2input,gRinput,g3input,RHO2input,RHO1input,ALP1input,LAM1input,             & 
& ALP3input,ALP2input,LAM4input,LAM2input,LAM3input,M23input,mu32input,MU22input,        & 
& MU12input,vdinput,vuinput,vRinput

Complex(dp),Intent(in) :: YDRinput(3,3),YL1input(3,3),YQ1input(3,3),YL2input(3,3),YQ2input(3,3)

Real(dp),Intent(in) :: MAhinput(3),MAh2input(3),MdeltaRppinput,MdeltaRpp2input,MFcinput,MFc2input,           & 
& MFcpinput,MFcp2input,MFcppinput,MFcpp2input,MFdinput(3),MFd2input(3),MFeinput(3),      & 
& MFe2input(3),MFuinput(3),MFu2input(3),MFvinput(6),MFv2input(6),Mhhinput(3),            & 
& Mhh2input(3),MHpminput(3),MHpm2input(3),MVWLminput,MVWLm2input,MVWRminput,             & 
& MVWRm2input,MVZinput,MVZ2input,MVZRinput,MVZR2input,PhiWinput,TWinput,UCinput(3,3),    & 
& UPinput(3,3),ZHinput(3,3)

Complex(dp),Intent(in) :: phaTinput,UVinput(6,6),ZDRinput(3,3),ZERinput(3,3),ZURinput(3,3),ZDLinput(3,3),       & 
& ZELinput(3,3),ZULinput(3,3),ZWinput(4,4),ZZinput(3,3)

Real(dp) :: gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,ALP3,ALP2,LAM4,LAM2,LAM3,M23,mu32,MU22,              & 
& MU12,vd,vu,vR

Complex(dp) :: YDR(3,3),YL1(3,3),YQ1(3,3),YL2(3,3),YQ2(3,3)

Complex(dp),Intent(out) :: cplcFcFcpVWLmL,cplcFcFcpVWLmR,cplcFcFcpVWRmL,cplcFcFcpVWRmR,cplcFcFcVZL,              & 
& cplcFcFcVZR,cplcFcFcVZRL,cplcFcFcVZRR,cplcFcpFcppVWLmL,cplcFcpFcppVWLmR,               & 
& cplcFcpFcppVWRmL,cplcFcpFcppVWRmR,cplcFcpFcpVZL,cplcFcpFcpVZR,cplcFcpFcpVZRL,          & 
& cplcFcpFcpVZRR,cplcFcppFcppVZL,cplcFcppFcppVZR,cplcFcppFcppVZRL,cplcFcppFcppVZRR,      & 
& cplcFdFdAhL(3,3,3),cplcFdFdAhR(3,3,3),cplcFdFdhhL(3,3,3),cplcFdFdhhR(3,3,3),           & 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFdFdVZRL(3,3),cplcFdFdVZRR(3,3),cplcFdFuHpmL(3,3,3),& 
& cplcFdFuHpmR(3,3,3),cplcFdFuVWLmL(3,3),cplcFdFuVWLmR(3,3),cplcFdFuVWRmL(3,3),          & 
& cplcFdFuVWRmR(3,3),cplcFecFedeltaRppL(3,3),cplcFecFedeltaRppR(3,3),cplcFeFeAhL(3,3,3), & 
& cplcFeFeAhR(3,3,3),cplcFeFehhL(3,3,3),cplcFeFehhR(3,3,3),cplcFeFeVZL(3,3),             & 
& cplcFeFeVZR(3,3),cplcFeFeVZRL(3,3),cplcFeFeVZRR(3,3),cplcFeFvcHpmL(3,6,3),             & 
& cplcFeFvcHpmR(3,6,3),cplcFeFvcVWLmL(3,6),cplcFeFvcVWLmR(3,6),cplcFeFvcVWRmL(3,6),      & 
& cplcFeFvcVWRmR(3,6),cplcFuFuAhL(3,3,3),cplcFuFuAhR(3,3,3),cplcFuFuhhL(3,3,3),          & 
& cplcFuFuhhR(3,3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcFuFuVZRL(3,3),cplcFuFuVZRR(3,3),& 
& cplFeFecdeltaRppL(3,3),cplFeFecdeltaRppR(3,3),cplFvFeHpmL(6,3,3),cplFvFeHpmR(6,3,3),   & 
& cplFvFeVWLmL(6,3),cplFvFeVWLmR(6,3),cplFvFeVWRmL(6,3),cplFvFeVWRmR(6,3),               & 
& cplFvFvAhL(6,6,3),cplFvFvAhR(6,6,3),cplFvFvhhL(6,6,3),cplFvFvhhR(6,6,3),               & 
& cplFvFvVZL(6,6),cplFvFvVZR(6,6),cplFvFvVZRL(6,6),cplFvFvVZRR(6,6)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(3),MAh2(3),MdeltaRpp,MdeltaRpp2,MFc,MFc2,MFcp,MFcp2,MFcpp,MFcpp2,MFd(3),          & 
& MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),Mhh(3),Mhh2(3),MHpm(3),           & 
& MHpm2(3),MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,TW,UC(3,3),UP(3,3),ZH(3,3)

Complex(dp) :: phaT,UV(6,6),ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZW(4,4),ZZ(3,3)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Fe_3B'
 
sinW2=1._dp-mW2/mZ2 
gBL = gBLinput 
g2 = g2input 
gR = gRinput 
g3 = g3input 
RHO2 = RHO2input 
RHO1 = RHO1input 
ALP1 = ALP1input 
LAM1 = LAM1input 
ALP3 = ALP3input 
ALP2 = ALP2input 
LAM4 = LAM4input 
LAM2 = LAM2input 
LAM3 = LAM3input 
YDR = YDRinput 
YL1 = YL1input 
YQ1 = YQ1input 
YL2 = YL2input 
YQ2 = YQ2input 
M23 = M23input 
mu32 = mu32input 
MU22 = MU22input 
MU12 = MU12input 
vd = vdinput 
vu = vuinput 
vR = vRinput 
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,ALP3,ALP2,LAM4,           & 
& LAM2,LAM3,YDR,YL1,YQ1,YL2,YQ2,M23,mu32,MU22,MU12,vd,vu,vR,(/ ZeroC, ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MdeltaRpp,MdeltaRpp2,MFc,MFc2,MFcp,MFcp2,MFcpp,              & 
& MFcpp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MVWLm,MVWLm2,           & 
& MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,phaT,PhiW,UV,TW,UC,ZDR,ZER,UP,ZUR,ZDL,ZEL,            & 
& ZUL,ZH,ZW,ZZ,vd,vu,vR,gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,ALP3,ALP2,LAM4,LAM2,            & 
& LAM3,YDR,YL1,YQ1,YL2,YQ2,M23,mu32,MU22,MU12,.True.,kont)

ZH = ZHinput 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UV = UVinput 
UC = UCinput 
UP = UPinput 
ZH = ZHinput 
ZW = ZWinput 
ZZ = ZZinput 
cplcFdFdAhL = 0._dp 
cplcFdFdAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFdFdAhT(gt1,gt2,gt3,YQ1,YQ2,UP,ZDL,ZDR,cplcFdFdAhL(gt1,gt2,gt3)         & 
& ,cplcFdFdAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFeAhL = 0._dp 
cplcFeFeAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFeFeAhT(gt1,gt2,gt3,YL1,YL2,UP,ZEL,ZER,cplcFeFeAhL(gt1,gt2,gt3)         & 
& ,cplcFeFeAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuAhL = 0._dp 
cplcFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFuFuAhT(gt1,gt2,gt3,YQ1,YQ2,UP,ZUL,ZUR,cplcFuFuAhL(gt1,gt2,gt3)         & 
& ,cplcFuFuAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFvAhL = 0._dp 
cplFvFvAhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 3
Call CouplingFvFvAhT(gt1,gt2,gt3,YDR,YL1,YL2,UP,UV,cplFvFvAhL(gt1,gt2,gt3)            & 
& ,cplFvFvAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFecFedeltaRppL = 0._dp 
cplcFecFedeltaRppR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFecFedeltaRppT(gt1,gt2,YDR,ZER,cplcFecFedeltaRppL(gt1,gt2)              & 
& ,cplcFecFedeltaRppR(gt1,gt2))

 End Do 
End Do 


cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFdFdhhT(gt1,gt2,gt3,YQ1,YQ2,ZH,ZDL,ZDR,cplcFdFdhhL(gt1,gt2,gt3)         & 
& ,cplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFeFecdeltaRppL = 0._dp 
cplFeFecdeltaRppR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingFeFecdeltaRppT(gt1,gt2,YDR,ZER,cplFeFecdeltaRppL(gt1,gt2),               & 
& cplFeFecdeltaRppR(gt1,gt2))

 End Do 
End Do 


cplFvFeHpmL = 0._dp 
cplFvFeHpmR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingFvFeHpmT(gt1,gt2,gt3,YDR,YL1,YL2,UC,ZEL,ZER,UV,cplFvFeHpmL(gt1,gt2,gt3)  & 
& ,cplFvFeHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFeFehhT(gt1,gt2,gt3,YL1,YL2,ZH,ZEL,ZER,cplcFeFehhL(gt1,gt2,gt3)         & 
& ,cplcFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFuFuhhT(gt1,gt2,gt3,YQ1,YQ2,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)         & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFuHpmL = 0._dp 
cplcFdFuHpmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFdFuHpmT(gt1,gt2,gt3,YQ1,YQ2,UC,ZDL,ZDR,ZUL,ZUR,cplcFdFuHpmL(gt1,gt2,gt3)& 
& ,cplcFdFuHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFvhhL = 0._dp 
cplFvFvhhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 3
Call CouplingFvFvhhT(gt1,gt2,gt3,YDR,YL1,YL2,ZH,UV,cplFvFvhhL(gt1,gt2,gt3)            & 
& ,cplFvFvhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFvcHpmL = 0._dp 
cplcFeFvcHpmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
  Do gt3 = 1, 3
Call CouplingcFeFvcHpmT(gt1,gt2,gt3,YDR,YL1,YL2,UC,ZEL,ZER,UV,cplcFeFvcHpmL(gt1,gt2,gt3)& 
& ,cplcFeFvcHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFcFcVZL = 0._dp 
cplcFcFcVZR = 0._dp 
Call CouplingcFcFcVZT(gBL,gR,ZZ,cplcFcFcVZL,cplcFcFcVZR)



cplcFcFcVZRL = 0._dp 
cplcFcFcVZRR = 0._dp 
Call CouplingcFcFcVZRT(gBL,gR,ZZ,cplcFcFcVZRL,cplcFcFcVZRR)



cplcFcFcpVWLmL = 0._dp 
cplcFcFcpVWLmR = 0._dp 
Call CouplingcFcFcpVWLmT(gR,PhiW,cplcFcFcpVWLmL,cplcFcFcpVWLmR)



cplcFcFcpVWRmL = 0._dp 
cplcFcFcpVWRmR = 0._dp 
Call CouplingcFcFcpVWRmT(gR,PhiW,cplcFcFcpVWRmL,cplcFcFcpVWRmR)



cplcFcpFcpVZL = 0._dp 
cplcFcpFcpVZR = 0._dp 
Call CouplingcFcpFcpVZT(gBL,ZZ,cplcFcpFcpVZL,cplcFcpFcpVZR)



cplcFcpFcpVZRL = 0._dp 
cplcFcpFcpVZRR = 0._dp 
Call CouplingcFcpFcpVZRT(gBL,ZZ,cplcFcpFcpVZRL,cplcFcpFcpVZRR)



cplcFcpFcppVWLmL = 0._dp 
cplcFcpFcppVWLmR = 0._dp 
Call CouplingcFcpFcppVWLmT(gR,phaT,PhiW,cplcFcpFcppVWLmL,cplcFcpFcppVWLmR)



cplcFcpFcppVWRmL = 0._dp 
cplcFcpFcppVWRmR = 0._dp 
Call CouplingcFcpFcppVWRmT(gR,phaT,PhiW,cplcFcpFcppVWRmL,cplcFcpFcppVWRmR)



cplcFcppFcppVZL = 0._dp 
cplcFcppFcppVZR = 0._dp 
Call CouplingcFcppFcppVZT(gBL,gR,ZZ,phaT,cplcFcppFcppVZL,cplcFcppFcppVZR)



cplcFcppFcppVZRL = 0._dp 
cplcFcppFcppVZRR = 0._dp 
Call CouplingcFcppFcppVZRT(gBL,gR,ZZ,phaT,cplcFcppFcppVZRL,cplcFcppFcppVZRR)



cplcFdFdVZL = 0._dp 
cplcFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZT(gt1,gt2,gBL,g2,gR,ZZ,cplcFdFdVZL(gt1,gt2),cplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVZRL = 0._dp 
cplcFdFdVZRR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZRT(gt1,gt2,gBL,g2,gR,ZZ,cplcFdFdVZRL(gt1,gt2),cplcFdFdVZRR(gt1,gt2))

 End Do 
End Do 


cplFvFeVWLmL = 0._dp 
cplFvFeVWLmR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 3
Call CouplingFvFeVWLmT(gt1,gt2,g2,gR,ZEL,ZER,UV,PhiW,cplFvFeVWLmL(gt1,gt2)            & 
& ,cplFvFeVWLmR(gt1,gt2))

 End Do 
End Do 


cplFvFeVWRmL = 0._dp 
cplFvFeVWRmR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 3
Call CouplingFvFeVWRmT(gt1,gt2,g2,gR,ZEL,ZER,UV,PhiW,cplFvFeVWRmL(gt1,gt2)            & 
& ,cplFvFeVWRmR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZL = 0._dp 
cplcFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZT(gt1,gt2,gBL,g2,gR,ZZ,cplcFeFeVZL(gt1,gt2),cplcFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZRL = 0._dp 
cplcFeFeVZRR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZRT(gt1,gt2,gBL,g2,gR,ZZ,cplcFeFeVZRL(gt1,gt2),cplcFeFeVZRR(gt1,gt2))

 End Do 
End Do 


cplcFdFuVWLmL = 0._dp 
cplcFdFuVWLmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFuVWLmT(gt1,gt2,g2,gR,ZDL,ZDR,ZUL,ZUR,PhiW,cplcFdFuVWLmL(gt1,gt2)     & 
& ,cplcFdFuVWLmR(gt1,gt2))

 End Do 
End Do 


cplcFdFuVWRmL = 0._dp 
cplcFdFuVWRmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFuVWRmT(gt1,gt2,g2,gR,ZDL,ZDR,ZUL,ZUR,PhiW,cplcFdFuVWRmL(gt1,gt2)     & 
& ,cplcFdFuVWRmR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZL = 0._dp 
cplcFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZT(gt1,gt2,gBL,g2,gR,ZZ,cplcFuFuVZL(gt1,gt2),cplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZRL = 0._dp 
cplcFuFuVZRR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZRT(gt1,gt2,gBL,g2,gR,ZZ,cplcFuFuVZRL(gt1,gt2),cplcFuFuVZRR(gt1,gt2))

 End Do 
End Do 


cplFvFvVZL = 0._dp 
cplFvFvVZR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingFvFvVZT(gt1,gt2,gBL,g2,gR,ZZ,UV,cplFvFvVZL(gt1,gt2),cplFvFvVZR(gt1,gt2))

 End Do 
End Do 


cplFvFvVZRL = 0._dp 
cplFvFvVZRR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingFvFvVZRT(gt1,gt2,gBL,g2,gR,ZZ,UV,cplFvFvVZRL(gt1,gt2),cplFvFvVZRR(gt1,gt2))

 End Do 
End Do 


cplcFeFvcVWLmL = 0._dp 
cplcFeFvcVWLmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
Call CouplingcFeFvcVWLmT(gt1,gt2,g2,gR,ZEL,ZER,UV,PhiW,cplcFeFvcVWLmL(gt1,gt2)        & 
& ,cplcFeFvcVWLmR(gt1,gt2))

 End Do 
End Do 


cplcFeFvcVWRmL = 0._dp 
cplcFeFvcVWRmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
Call CouplingcFeFvcVWRmT(gt1,gt2,g2,gR,ZEL,ZER,UV,PhiW,cplcFeFvcVWRmL(gt1,gt2)        & 
& ,cplcFeFvcVWRmR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Fe_decays_3B
 
Subroutine CouplingsFor_Fd_decays_3B(m_in,i1,MAhinput,MAh2input,MdeltaRppinput,       & 
& MdeltaRpp2input,MFcinput,MFc2input,MFcpinput,MFcp2input,MFcppinput,MFcpp2input,        & 
& MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,MFu2input,MFvinput,MFv2input,           & 
& Mhhinput,Mhh2input,MHpminput,MHpm2input,MVWLminput,MVWLm2input,MVWRminput,             & 
& MVWRm2input,MVZinput,MVZ2input,MVZRinput,MVZR2input,phaTinput,PhiWinput,               & 
& UVinput,TWinput,UCinput,ZDRinput,ZERinput,UPinput,ZURinput,ZDLinput,ZELinput,          & 
& ZULinput,ZHinput,ZWinput,ZZinput,gBLinput,g2input,gRinput,g3input,RHO2input,           & 
& RHO1input,ALP1input,LAM1input,ALP3input,ALP2input,LAM4input,LAM2input,LAM3input,       & 
& YDRinput,YL1input,YQ1input,YL2input,YQ2input,M23input,mu32input,MU22input,             & 
& MU12input,vdinput,vuinput,vRinput,cplcFcFcVZL,cplcFcFcVZR,cplcFcFcVZRL,cplcFcFcVZRR,   & 
& cplcFcpFccVWLmL,cplcFcpFccVWLmR,cplcFcpFccVWRmL,cplcFcpFccVWRmR,cplcFcpFcpVZL,         & 
& cplcFcpFcpVZR,cplcFcpFcpVZRL,cplcFcpFcpVZRR,cplcFcppFcpcVWLmL,cplcFcppFcpcVWLmR,       & 
& cplcFcppFcpcVWRmL,cplcFcppFcpcVWRmR,cplcFcppFcppVZL,cplcFcppFcppVZR,cplcFcppFcppVZRL,  & 
& cplcFcppFcppVZRR,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,          & 
& cplcFdFdVZR,cplcFdFdVZRL,cplcFdFdVZRR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFdFuVWLmL,         & 
& cplcFdFuVWLmR,cplcFdFuVWRmL,cplcFdFuVWRmR,cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,         & 
& cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZRL,cplcFeFeVZRR,cplcFeFvcHpmL,           & 
& cplcFeFvcHpmR,cplcFeFvcVWLmL,cplcFeFvcVWLmR,cplcFeFvcVWRmL,cplcFeFvcVWRmR,             & 
& cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWLmL,cplcFuFdcVWLmR,cplcFuFdcVWRmL,              & 
& cplcFuFdcVWRmR,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,            & 
& cplcFuFuVZR,cplcFuFuVZRL,cplcFuFuVZRR,cplFvFvAhL,cplFvFvAhR,cplFvFvhhL,cplFvFvhhR,     & 
& cplFvFvVZL,cplFvFvVZR,cplFvFvVZRL,cplFvFvVZRR,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: gBLinput,g2input,gRinput,g3input,RHO2input,RHO1input,ALP1input,LAM1input,             & 
& ALP3input,ALP2input,LAM4input,LAM2input,LAM3input,M23input,mu32input,MU22input,        & 
& MU12input,vdinput,vuinput,vRinput

Complex(dp),Intent(in) :: YDRinput(3,3),YL1input(3,3),YQ1input(3,3),YL2input(3,3),YQ2input(3,3)

Real(dp),Intent(in) :: MAhinput(3),MAh2input(3),MdeltaRppinput,MdeltaRpp2input,MFcinput,MFc2input,           & 
& MFcpinput,MFcp2input,MFcppinput,MFcpp2input,MFdinput(3),MFd2input(3),MFeinput(3),      & 
& MFe2input(3),MFuinput(3),MFu2input(3),MFvinput(6),MFv2input(6),Mhhinput(3),            & 
& Mhh2input(3),MHpminput(3),MHpm2input(3),MVWLminput,MVWLm2input,MVWRminput,             & 
& MVWRm2input,MVZinput,MVZ2input,MVZRinput,MVZR2input,PhiWinput,TWinput,UCinput(3,3),    & 
& UPinput(3,3),ZHinput(3,3)

Complex(dp),Intent(in) :: phaTinput,UVinput(6,6),ZDRinput(3,3),ZERinput(3,3),ZURinput(3,3),ZDLinput(3,3),       & 
& ZELinput(3,3),ZULinput(3,3),ZWinput(4,4),ZZinput(3,3)

Real(dp) :: gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,ALP3,ALP2,LAM4,LAM2,LAM3,M23,mu32,MU22,              & 
& MU12,vd,vu,vR

Complex(dp) :: YDR(3,3),YL1(3,3),YQ1(3,3),YL2(3,3),YQ2(3,3)

Complex(dp),Intent(out) :: cplcFcFcVZL,cplcFcFcVZR,cplcFcFcVZRL,cplcFcFcVZRR,cplcFcpFccVWLmL,cplcFcpFccVWLmR,    & 
& cplcFcpFccVWRmL,cplcFcpFccVWRmR,cplcFcpFcpVZL,cplcFcpFcpVZR,cplcFcpFcpVZRL,            & 
& cplcFcpFcpVZRR,cplcFcppFcpcVWLmL,cplcFcppFcpcVWLmR,cplcFcppFcpcVWRmL,cplcFcppFcpcVWRmR,& 
& cplcFcppFcppVZL,cplcFcppFcppVZR,cplcFcppFcppVZRL,cplcFcppFcppVZRR,cplcFdFdAhL(3,3,3),  & 
& cplcFdFdAhR(3,3,3),cplcFdFdhhL(3,3,3),cplcFdFdhhR(3,3,3),cplcFdFdVZL(3,3),             & 
& cplcFdFdVZR(3,3),cplcFdFdVZRL(3,3),cplcFdFdVZRR(3,3),cplcFdFuHpmL(3,3,3),              & 
& cplcFdFuHpmR(3,3,3),cplcFdFuVWLmL(3,3),cplcFdFuVWLmR(3,3),cplcFdFuVWRmL(3,3),          & 
& cplcFdFuVWRmR(3,3),cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),cplcFeFehhL(3,3,3),           & 
& cplcFeFehhR(3,3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFeVZRL(3,3),cplcFeFeVZRR(3,3),& 
& cplcFeFvcHpmL(3,6,3),cplcFeFvcHpmR(3,6,3),cplcFeFvcVWLmL(3,6),cplcFeFvcVWLmR(3,6),     & 
& cplcFeFvcVWRmL(3,6),cplcFeFvcVWRmR(3,6),cplcFuFdcHpmL(3,3,3),cplcFuFdcHpmR(3,3,3),     & 
& cplcFuFdcVWLmL(3,3),cplcFuFdcVWLmR(3,3),cplcFuFdcVWRmL(3,3),cplcFuFdcVWRmR(3,3),       & 
& cplcFuFuAhL(3,3,3),cplcFuFuAhR(3,3,3),cplcFuFuhhL(3,3,3),cplcFuFuhhR(3,3,3),           & 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcFuFuVZRL(3,3),cplcFuFuVZRR(3,3),cplFvFvAhL(6,6,3),& 
& cplFvFvAhR(6,6,3),cplFvFvhhL(6,6,3),cplFvFvhhR(6,6,3),cplFvFvVZL(6,6),cplFvFvVZR(6,6), & 
& cplFvFvVZRL(6,6),cplFvFvVZRR(6,6)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(3),MAh2(3),MdeltaRpp,MdeltaRpp2,MFc,MFc2,MFcp,MFcp2,MFcpp,MFcpp2,MFd(3),          & 
& MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),Mhh(3),Mhh2(3),MHpm(3),           & 
& MHpm2(3),MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,TW,UC(3,3),UP(3,3),ZH(3,3)

Complex(dp) :: phaT,UV(6,6),ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZW(4,4),ZZ(3,3)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Fd_3B'
 
sinW2=1._dp-mW2/mZ2 
gBL = gBLinput 
g2 = g2input 
gR = gRinput 
g3 = g3input 
RHO2 = RHO2input 
RHO1 = RHO1input 
ALP1 = ALP1input 
LAM1 = LAM1input 
ALP3 = ALP3input 
ALP2 = ALP2input 
LAM4 = LAM4input 
LAM2 = LAM2input 
LAM3 = LAM3input 
YDR = YDRinput 
YL1 = YL1input 
YQ1 = YQ1input 
YL2 = YL2input 
YQ2 = YQ2input 
M23 = M23input 
mu32 = mu32input 
MU22 = MU22input 
MU12 = MU12input 
vd = vdinput 
vu = vuinput 
vR = vRinput 
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,ALP3,ALP2,LAM4,           & 
& LAM2,LAM3,YDR,YL1,YQ1,YL2,YQ2,M23,mu32,MU22,MU12,vd,vu,vR,(/ ZeroC, ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MdeltaRpp,MdeltaRpp2,MFc,MFc2,MFcp,MFcp2,MFcpp,              & 
& MFcpp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MVWLm,MVWLm2,           & 
& MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,phaT,PhiW,UV,TW,UC,ZDR,ZER,UP,ZUR,ZDL,ZEL,            & 
& ZUL,ZH,ZW,ZZ,vd,vu,vR,gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,ALP3,ALP2,LAM4,LAM2,            & 
& LAM3,YDR,YL1,YQ1,YL2,YQ2,M23,mu32,MU22,MU12,.True.,kont)

ZH = ZHinput 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UV = UVinput 
UC = UCinput 
UP = UPinput 
ZH = ZHinput 
ZW = ZWinput 
ZZ = ZZinput 
cplcFdFdAhL = 0._dp 
cplcFdFdAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFdFdAhT(gt1,gt2,gt3,YQ1,YQ2,UP,ZDL,ZDR,cplcFdFdAhL(gt1,gt2,gt3)         & 
& ,cplcFdFdAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFeAhL = 0._dp 
cplcFeFeAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFeFeAhT(gt1,gt2,gt3,YL1,YL2,UP,ZEL,ZER,cplcFeFeAhL(gt1,gt2,gt3)         & 
& ,cplcFeFeAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuAhL = 0._dp 
cplcFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFuFuAhT(gt1,gt2,gt3,YQ1,YQ2,UP,ZUL,ZUR,cplcFuFuAhL(gt1,gt2,gt3)         & 
& ,cplcFuFuAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFvAhL = 0._dp 
cplFvFvAhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 3
Call CouplingFvFvAhT(gt1,gt2,gt3,YDR,YL1,YL2,UP,UV,cplFvFvAhL(gt1,gt2,gt3)            & 
& ,cplFvFvAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFdFdhhT(gt1,gt2,gt3,YQ1,YQ2,ZH,ZDL,ZDR,cplcFdFdhhL(gt1,gt2,gt3)         & 
& ,cplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFdcHpmL = 0._dp 
cplcFuFdcHpmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFuFdcHpmT(gt1,gt2,gt3,YQ1,YQ2,UC,ZDL,ZDR,ZUL,ZUR,cplcFuFdcHpmL(gt1,gt2,gt3)& 
& ,cplcFuFdcHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFeFehhT(gt1,gt2,gt3,YL1,YL2,ZH,ZEL,ZER,cplcFeFehhL(gt1,gt2,gt3)         & 
& ,cplcFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFuFuhhT(gt1,gt2,gt3,YQ1,YQ2,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)         & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFuHpmL = 0._dp 
cplcFdFuHpmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFdFuHpmT(gt1,gt2,gt3,YQ1,YQ2,UC,ZDL,ZDR,ZUL,ZUR,cplcFdFuHpmL(gt1,gt2,gt3)& 
& ,cplcFdFuHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFvhhL = 0._dp 
cplFvFvhhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 3
Call CouplingFvFvhhT(gt1,gt2,gt3,YDR,YL1,YL2,ZH,UV,cplFvFvhhL(gt1,gt2,gt3)            & 
& ,cplFvFvhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFvcHpmL = 0._dp 
cplcFeFvcHpmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
  Do gt3 = 1, 3
Call CouplingcFeFvcHpmT(gt1,gt2,gt3,YDR,YL1,YL2,UC,ZEL,ZER,UV,cplcFeFvcHpmL(gt1,gt2,gt3)& 
& ,cplcFeFvcHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFcFcVZL = 0._dp 
cplcFcFcVZR = 0._dp 
Call CouplingcFcFcVZT(gBL,gR,ZZ,cplcFcFcVZL,cplcFcFcVZR)



cplcFcFcVZRL = 0._dp 
cplcFcFcVZRR = 0._dp 
Call CouplingcFcFcVZRT(gBL,gR,ZZ,cplcFcFcVZRL,cplcFcFcVZRR)



cplcFcpFccVWLmL = 0._dp 
cplcFcpFccVWLmR = 0._dp 
Call CouplingcFcpFccVWLmT(gR,PhiW,cplcFcpFccVWLmL,cplcFcpFccVWLmR)



cplcFcpFccVWRmL = 0._dp 
cplcFcpFccVWRmR = 0._dp 
Call CouplingcFcpFccVWRmT(gR,PhiW,cplcFcpFccVWRmL,cplcFcpFccVWRmR)



cplcFcpFcpVZL = 0._dp 
cplcFcpFcpVZR = 0._dp 
Call CouplingcFcpFcpVZT(gBL,ZZ,cplcFcpFcpVZL,cplcFcpFcpVZR)



cplcFcpFcpVZRL = 0._dp 
cplcFcpFcpVZRR = 0._dp 
Call CouplingcFcpFcpVZRT(gBL,ZZ,cplcFcpFcpVZRL,cplcFcpFcpVZRR)



cplcFcppFcpcVWLmL = 0._dp 
cplcFcppFcpcVWLmR = 0._dp 
Call CouplingcFcppFcpcVWLmT(gR,phaT,PhiW,cplcFcppFcpcVWLmL,cplcFcppFcpcVWLmR)



cplcFcppFcpcVWRmL = 0._dp 
cplcFcppFcpcVWRmR = 0._dp 
Call CouplingcFcppFcpcVWRmT(gR,phaT,PhiW,cplcFcppFcpcVWRmL,cplcFcppFcpcVWRmR)



cplcFcppFcppVZL = 0._dp 
cplcFcppFcppVZR = 0._dp 
Call CouplingcFcppFcppVZT(gBL,gR,ZZ,phaT,cplcFcppFcppVZL,cplcFcppFcppVZR)



cplcFcppFcppVZRL = 0._dp 
cplcFcppFcppVZRR = 0._dp 
Call CouplingcFcppFcppVZRT(gBL,gR,ZZ,phaT,cplcFcppFcppVZRL,cplcFcppFcppVZRR)



cplcFdFdVZL = 0._dp 
cplcFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZT(gt1,gt2,gBL,g2,gR,ZZ,cplcFdFdVZL(gt1,gt2),cplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVZRL = 0._dp 
cplcFdFdVZRR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZRT(gt1,gt2,gBL,g2,gR,ZZ,cplcFdFdVZRL(gt1,gt2),cplcFdFdVZRR(gt1,gt2))

 End Do 
End Do 


cplcFuFdcVWLmL = 0._dp 
cplcFuFdcVWLmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdcVWLmT(gt1,gt2,g2,gR,ZDL,ZDR,ZUL,ZUR,PhiW,cplcFuFdcVWLmL(gt1,gt2)   & 
& ,cplcFuFdcVWLmR(gt1,gt2))

 End Do 
End Do 


cplcFuFdcVWRmL = 0._dp 
cplcFuFdcVWRmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdcVWRmT(gt1,gt2,g2,gR,ZDL,ZDR,ZUL,ZUR,PhiW,cplcFuFdcVWRmL(gt1,gt2)   & 
& ,cplcFuFdcVWRmR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZL = 0._dp 
cplcFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZT(gt1,gt2,gBL,g2,gR,ZZ,cplcFeFeVZL(gt1,gt2),cplcFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZRL = 0._dp 
cplcFeFeVZRR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZRT(gt1,gt2,gBL,g2,gR,ZZ,cplcFeFeVZRL(gt1,gt2),cplcFeFeVZRR(gt1,gt2))

 End Do 
End Do 


cplcFdFuVWLmL = 0._dp 
cplcFdFuVWLmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFuVWLmT(gt1,gt2,g2,gR,ZDL,ZDR,ZUL,ZUR,PhiW,cplcFdFuVWLmL(gt1,gt2)     & 
& ,cplcFdFuVWLmR(gt1,gt2))

 End Do 
End Do 


cplcFdFuVWRmL = 0._dp 
cplcFdFuVWRmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFuVWRmT(gt1,gt2,g2,gR,ZDL,ZDR,ZUL,ZUR,PhiW,cplcFdFuVWRmL(gt1,gt2)     & 
& ,cplcFdFuVWRmR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZL = 0._dp 
cplcFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZT(gt1,gt2,gBL,g2,gR,ZZ,cplcFuFuVZL(gt1,gt2),cplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZRL = 0._dp 
cplcFuFuVZRR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZRT(gt1,gt2,gBL,g2,gR,ZZ,cplcFuFuVZRL(gt1,gt2),cplcFuFuVZRR(gt1,gt2))

 End Do 
End Do 


cplFvFvVZL = 0._dp 
cplFvFvVZR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingFvFvVZT(gt1,gt2,gBL,g2,gR,ZZ,UV,cplFvFvVZL(gt1,gt2),cplFvFvVZR(gt1,gt2))

 End Do 
End Do 


cplFvFvVZRL = 0._dp 
cplFvFvVZRR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingFvFvVZRT(gt1,gt2,gBL,g2,gR,ZZ,UV,cplFvFvVZRL(gt1,gt2),cplFvFvVZRR(gt1,gt2))

 End Do 
End Do 


cplcFeFvcVWLmL = 0._dp 
cplcFeFvcVWLmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
Call CouplingcFeFvcVWLmT(gt1,gt2,g2,gR,ZEL,ZER,UV,PhiW,cplcFeFvcVWLmL(gt1,gt2)        & 
& ,cplcFeFvcVWLmR(gt1,gt2))

 End Do 
End Do 


cplcFeFvcVWRmL = 0._dp 
cplcFeFvcVWRmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
Call CouplingcFeFvcVWRmT(gt1,gt2,g2,gR,ZEL,ZER,UV,PhiW,cplcFeFvcVWRmL(gt1,gt2)        & 
& ,cplcFeFvcVWRmR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Fd_decays_3B
 
Subroutine CouplingsFor_Fv_decays_3B(m_in,i1,MAhinput,MAh2input,MdeltaRppinput,       & 
& MdeltaRpp2input,MFcinput,MFc2input,MFcpinput,MFcp2input,MFcppinput,MFcpp2input,        & 
& MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,MFu2input,MFvinput,MFv2input,           & 
& Mhhinput,Mhh2input,MHpminput,MHpm2input,MVWLminput,MVWLm2input,MVWRminput,             & 
& MVWRm2input,MVZinput,MVZ2input,MVZRinput,MVZR2input,phaTinput,PhiWinput,               & 
& UVinput,TWinput,UCinput,ZDRinput,ZERinput,UPinput,ZURinput,ZDLinput,ZELinput,          & 
& ZULinput,ZHinput,ZWinput,ZZinput,gBLinput,g2input,gRinput,g3input,RHO2input,           & 
& RHO1input,ALP1input,LAM1input,ALP3input,ALP2input,LAM4input,LAM2input,LAM3input,       & 
& YDRinput,YL1input,YQ1input,YL2input,YQ2input,M23input,mu32input,MU22input,             & 
& MU12input,vdinput,vuinput,vRinput,cplcFcFcVZL,cplcFcFcVZR,cplcFcFcVZRL,cplcFcFcVZRR,   & 
& cplcFcpFccVWLmL,cplcFcpFccVWLmR,cplcFcpFccVWRmL,cplcFcpFccVWRmR,cplcFcpFcpVZL,         & 
& cplcFcpFcpVZR,cplcFcpFcpVZRL,cplcFcpFcpVZRR,cplcFcppFcpcVWLmL,cplcFcppFcpcVWLmR,       & 
& cplcFcppFcpcVWRmL,cplcFcppFcpcVWRmR,cplcFcppFcppVZL,cplcFcppFcppVZR,cplcFcppFcppVZRL,  & 
& cplcFcppFcppVZRR,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,          & 
& cplcFdFdVZR,cplcFdFdVZRL,cplcFdFdVZRR,cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,             & 
& cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZRL,cplcFeFeVZRR,cplcFeFvcHpmL,           & 
& cplcFeFvcHpmR,cplcFeFvcVWLmL,cplcFeFvcVWLmR,cplcFeFvcVWRmL,cplcFeFvcVWRmR,             & 
& cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWLmL,cplcFuFdcVWLmR,cplcFuFdcVWRmL,              & 
& cplcFuFdcVWRmR,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,            & 
& cplcFuFuVZR,cplcFuFuVZRL,cplcFuFuVZRR,cplFvFeHpmL,cplFvFeHpmR,cplFvFeVWLmL,            & 
& cplFvFeVWLmR,cplFvFeVWRmL,cplFvFeVWRmR,cplFvFvAhL,cplFvFvAhR,cplFvFvhhL,               & 
& cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZRL,cplFvFvVZRR,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: gBLinput,g2input,gRinput,g3input,RHO2input,RHO1input,ALP1input,LAM1input,             & 
& ALP3input,ALP2input,LAM4input,LAM2input,LAM3input,M23input,mu32input,MU22input,        & 
& MU12input,vdinput,vuinput,vRinput

Complex(dp),Intent(in) :: YDRinput(3,3),YL1input(3,3),YQ1input(3,3),YL2input(3,3),YQ2input(3,3)

Real(dp),Intent(in) :: MAhinput(3),MAh2input(3),MdeltaRppinput,MdeltaRpp2input,MFcinput,MFc2input,           & 
& MFcpinput,MFcp2input,MFcppinput,MFcpp2input,MFdinput(3),MFd2input(3),MFeinput(3),      & 
& MFe2input(3),MFuinput(3),MFu2input(3),MFvinput(6),MFv2input(6),Mhhinput(3),            & 
& Mhh2input(3),MHpminput(3),MHpm2input(3),MVWLminput,MVWLm2input,MVWRminput,             & 
& MVWRm2input,MVZinput,MVZ2input,MVZRinput,MVZR2input,PhiWinput,TWinput,UCinput(3,3),    & 
& UPinput(3,3),ZHinput(3,3)

Complex(dp),Intent(in) :: phaTinput,UVinput(6,6),ZDRinput(3,3),ZERinput(3,3),ZURinput(3,3),ZDLinput(3,3),       & 
& ZELinput(3,3),ZULinput(3,3),ZWinput(4,4),ZZinput(3,3)

Real(dp) :: gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,ALP3,ALP2,LAM4,LAM2,LAM3,M23,mu32,MU22,              & 
& MU12,vd,vu,vR

Complex(dp) :: YDR(3,3),YL1(3,3),YQ1(3,3),YL2(3,3),YQ2(3,3)

Complex(dp),Intent(out) :: cplcFcFcVZL,cplcFcFcVZR,cplcFcFcVZRL,cplcFcFcVZRR,cplcFcpFccVWLmL,cplcFcpFccVWLmR,    & 
& cplcFcpFccVWRmL,cplcFcpFccVWRmR,cplcFcpFcpVZL,cplcFcpFcpVZR,cplcFcpFcpVZRL,            & 
& cplcFcpFcpVZRR,cplcFcppFcpcVWLmL,cplcFcppFcpcVWLmR,cplcFcppFcpcVWRmL,cplcFcppFcpcVWRmR,& 
& cplcFcppFcppVZL,cplcFcppFcppVZR,cplcFcppFcppVZRL,cplcFcppFcppVZRR,cplcFdFdAhL(3,3,3),  & 
& cplcFdFdAhR(3,3,3),cplcFdFdhhL(3,3,3),cplcFdFdhhR(3,3,3),cplcFdFdVZL(3,3),             & 
& cplcFdFdVZR(3,3),cplcFdFdVZRL(3,3),cplcFdFdVZRR(3,3),cplcFeFeAhL(3,3,3),               & 
& cplcFeFeAhR(3,3,3),cplcFeFehhL(3,3,3),cplcFeFehhR(3,3,3),cplcFeFeVZL(3,3),             & 
& cplcFeFeVZR(3,3),cplcFeFeVZRL(3,3),cplcFeFeVZRR(3,3),cplcFeFvcHpmL(3,6,3),             & 
& cplcFeFvcHpmR(3,6,3),cplcFeFvcVWLmL(3,6),cplcFeFvcVWLmR(3,6),cplcFeFvcVWRmL(3,6),      & 
& cplcFeFvcVWRmR(3,6),cplcFuFdcHpmL(3,3,3),cplcFuFdcHpmR(3,3,3),cplcFuFdcVWLmL(3,3),     & 
& cplcFuFdcVWLmR(3,3),cplcFuFdcVWRmL(3,3),cplcFuFdcVWRmR(3,3),cplcFuFuAhL(3,3,3),        & 
& cplcFuFuAhR(3,3,3),cplcFuFuhhL(3,3,3),cplcFuFuhhR(3,3,3),cplcFuFuVZL(3,3),             & 
& cplcFuFuVZR(3,3),cplcFuFuVZRL(3,3),cplcFuFuVZRR(3,3),cplFvFeHpmL(6,3,3),               & 
& cplFvFeHpmR(6,3,3),cplFvFeVWLmL(6,3),cplFvFeVWLmR(6,3),cplFvFeVWRmL(6,3),              & 
& cplFvFeVWRmR(6,3),cplFvFvAhL(6,6,3),cplFvFvAhR(6,6,3),cplFvFvhhL(6,6,3),               & 
& cplFvFvhhR(6,6,3),cplFvFvVZL(6,6),cplFvFvVZR(6,6),cplFvFvVZRL(6,6),cplFvFvVZRR(6,6)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(3),MAh2(3),MdeltaRpp,MdeltaRpp2,MFc,MFc2,MFcp,MFcp2,MFcpp,MFcpp2,MFd(3),          & 
& MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),Mhh(3),Mhh2(3),MHpm(3),           & 
& MHpm2(3),MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,TW,UC(3,3),UP(3,3),ZH(3,3)

Complex(dp) :: phaT,UV(6,6),ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZW(4,4),ZZ(3,3)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Fv_3B'
 
sinW2=1._dp-mW2/mZ2 
gBL = gBLinput 
g2 = g2input 
gR = gRinput 
g3 = g3input 
RHO2 = RHO2input 
RHO1 = RHO1input 
ALP1 = ALP1input 
LAM1 = LAM1input 
ALP3 = ALP3input 
ALP2 = ALP2input 
LAM4 = LAM4input 
LAM2 = LAM2input 
LAM3 = LAM3input 
YDR = YDRinput 
YL1 = YL1input 
YQ1 = YQ1input 
YL2 = YL2input 
YQ2 = YQ2input 
M23 = M23input 
mu32 = mu32input 
MU22 = MU22input 
MU12 = MU12input 
vd = vdinput 
vu = vuinput 
vR = vRinput 
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,ALP3,ALP2,LAM4,           & 
& LAM2,LAM3,YDR,YL1,YQ1,YL2,YQ2,M23,mu32,MU22,MU12,vd,vu,vR,(/ ZeroC, ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MdeltaRpp,MdeltaRpp2,MFc,MFc2,MFcp,MFcp2,MFcpp,              & 
& MFcpp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MVWLm,MVWLm2,           & 
& MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,phaT,PhiW,UV,TW,UC,ZDR,ZER,UP,ZUR,ZDL,ZEL,            & 
& ZUL,ZH,ZW,ZZ,vd,vu,vR,gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,ALP3,ALP2,LAM4,LAM2,            & 
& LAM3,YDR,YL1,YQ1,YL2,YQ2,M23,mu32,MU22,MU12,.True.,kont)

ZH = ZHinput 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UV = UVinput 
UC = UCinput 
UP = UPinput 
ZH = ZHinput 
ZW = ZWinput 
ZZ = ZZinput 
cplcFdFdAhL = 0._dp 
cplcFdFdAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFdFdAhT(gt1,gt2,gt3,YQ1,YQ2,UP,ZDL,ZDR,cplcFdFdAhL(gt1,gt2,gt3)         & 
& ,cplcFdFdAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFeAhL = 0._dp 
cplcFeFeAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFeFeAhT(gt1,gt2,gt3,YL1,YL2,UP,ZEL,ZER,cplcFeFeAhL(gt1,gt2,gt3)         & 
& ,cplcFeFeAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuAhL = 0._dp 
cplcFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFuFuAhT(gt1,gt2,gt3,YQ1,YQ2,UP,ZUL,ZUR,cplcFuFuAhL(gt1,gt2,gt3)         & 
& ,cplcFuFuAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFvAhL = 0._dp 
cplFvFvAhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 3
Call CouplingFvFvAhT(gt1,gt2,gt3,YDR,YL1,YL2,UP,UV,cplFvFvAhL(gt1,gt2,gt3)            & 
& ,cplFvFvAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFdFdhhT(gt1,gt2,gt3,YQ1,YQ2,ZH,ZDL,ZDR,cplcFdFdhhL(gt1,gt2,gt3)         & 
& ,cplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFdcHpmL = 0._dp 
cplcFuFdcHpmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFuFdcHpmT(gt1,gt2,gt3,YQ1,YQ2,UC,ZDL,ZDR,ZUL,ZUR,cplcFuFdcHpmL(gt1,gt2,gt3)& 
& ,cplcFuFdcHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFeHpmL = 0._dp 
cplFvFeHpmR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingFvFeHpmT(gt1,gt2,gt3,YDR,YL1,YL2,UC,ZEL,ZER,UV,cplFvFeHpmL(gt1,gt2,gt3)  & 
& ,cplFvFeHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFeFehhT(gt1,gt2,gt3,YL1,YL2,ZH,ZEL,ZER,cplcFeFehhL(gt1,gt2,gt3)         & 
& ,cplcFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFuFuhhT(gt1,gt2,gt3,YQ1,YQ2,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)         & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFvhhL = 0._dp 
cplFvFvhhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 3
Call CouplingFvFvhhT(gt1,gt2,gt3,YDR,YL1,YL2,ZH,UV,cplFvFvhhL(gt1,gt2,gt3)            & 
& ,cplFvFvhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFvcHpmL = 0._dp 
cplcFeFvcHpmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
  Do gt3 = 1, 3
Call CouplingcFeFvcHpmT(gt1,gt2,gt3,YDR,YL1,YL2,UC,ZEL,ZER,UV,cplcFeFvcHpmL(gt1,gt2,gt3)& 
& ,cplcFeFvcHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFcFcVZL = 0._dp 
cplcFcFcVZR = 0._dp 
Call CouplingcFcFcVZT(gBL,gR,ZZ,cplcFcFcVZL,cplcFcFcVZR)



cplcFcFcVZRL = 0._dp 
cplcFcFcVZRR = 0._dp 
Call CouplingcFcFcVZRT(gBL,gR,ZZ,cplcFcFcVZRL,cplcFcFcVZRR)



cplcFcpFccVWLmL = 0._dp 
cplcFcpFccVWLmR = 0._dp 
Call CouplingcFcpFccVWLmT(gR,PhiW,cplcFcpFccVWLmL,cplcFcpFccVWLmR)



cplcFcpFccVWRmL = 0._dp 
cplcFcpFccVWRmR = 0._dp 
Call CouplingcFcpFccVWRmT(gR,PhiW,cplcFcpFccVWRmL,cplcFcpFccVWRmR)



cplcFcpFcpVZL = 0._dp 
cplcFcpFcpVZR = 0._dp 
Call CouplingcFcpFcpVZT(gBL,ZZ,cplcFcpFcpVZL,cplcFcpFcpVZR)



cplcFcpFcpVZRL = 0._dp 
cplcFcpFcpVZRR = 0._dp 
Call CouplingcFcpFcpVZRT(gBL,ZZ,cplcFcpFcpVZRL,cplcFcpFcpVZRR)



cplcFcppFcpcVWLmL = 0._dp 
cplcFcppFcpcVWLmR = 0._dp 
Call CouplingcFcppFcpcVWLmT(gR,phaT,PhiW,cplcFcppFcpcVWLmL,cplcFcppFcpcVWLmR)



cplcFcppFcpcVWRmL = 0._dp 
cplcFcppFcpcVWRmR = 0._dp 
Call CouplingcFcppFcpcVWRmT(gR,phaT,PhiW,cplcFcppFcpcVWRmL,cplcFcppFcpcVWRmR)



cplcFcppFcppVZL = 0._dp 
cplcFcppFcppVZR = 0._dp 
Call CouplingcFcppFcppVZT(gBL,gR,ZZ,phaT,cplcFcppFcppVZL,cplcFcppFcppVZR)



cplcFcppFcppVZRL = 0._dp 
cplcFcppFcppVZRR = 0._dp 
Call CouplingcFcppFcppVZRT(gBL,gR,ZZ,phaT,cplcFcppFcppVZRL,cplcFcppFcppVZRR)



cplcFdFdVZL = 0._dp 
cplcFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZT(gt1,gt2,gBL,g2,gR,ZZ,cplcFdFdVZL(gt1,gt2),cplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVZRL = 0._dp 
cplcFdFdVZRR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZRT(gt1,gt2,gBL,g2,gR,ZZ,cplcFdFdVZRL(gt1,gt2),cplcFdFdVZRR(gt1,gt2))

 End Do 
End Do 


cplcFuFdcVWLmL = 0._dp 
cplcFuFdcVWLmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdcVWLmT(gt1,gt2,g2,gR,ZDL,ZDR,ZUL,ZUR,PhiW,cplcFuFdcVWLmL(gt1,gt2)   & 
& ,cplcFuFdcVWLmR(gt1,gt2))

 End Do 
End Do 


cplcFuFdcVWRmL = 0._dp 
cplcFuFdcVWRmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdcVWRmT(gt1,gt2,g2,gR,ZDL,ZDR,ZUL,ZUR,PhiW,cplcFuFdcVWRmL(gt1,gt2)   & 
& ,cplcFuFdcVWRmR(gt1,gt2))

 End Do 
End Do 


cplFvFeVWLmL = 0._dp 
cplFvFeVWLmR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 3
Call CouplingFvFeVWLmT(gt1,gt2,g2,gR,ZEL,ZER,UV,PhiW,cplFvFeVWLmL(gt1,gt2)            & 
& ,cplFvFeVWLmR(gt1,gt2))

 End Do 
End Do 


cplFvFeVWRmL = 0._dp 
cplFvFeVWRmR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 3
Call CouplingFvFeVWRmT(gt1,gt2,g2,gR,ZEL,ZER,UV,PhiW,cplFvFeVWRmL(gt1,gt2)            & 
& ,cplFvFeVWRmR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZL = 0._dp 
cplcFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZT(gt1,gt2,gBL,g2,gR,ZZ,cplcFeFeVZL(gt1,gt2),cplcFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZRL = 0._dp 
cplcFeFeVZRR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZRT(gt1,gt2,gBL,g2,gR,ZZ,cplcFeFeVZRL(gt1,gt2),cplcFeFeVZRR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZL = 0._dp 
cplcFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZT(gt1,gt2,gBL,g2,gR,ZZ,cplcFuFuVZL(gt1,gt2),cplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZRL = 0._dp 
cplcFuFuVZRR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZRT(gt1,gt2,gBL,g2,gR,ZZ,cplcFuFuVZRL(gt1,gt2),cplcFuFuVZRR(gt1,gt2))

 End Do 
End Do 


cplFvFvVZL = 0._dp 
cplFvFvVZR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingFvFvVZT(gt1,gt2,gBL,g2,gR,ZZ,UV,cplFvFvVZL(gt1,gt2),cplFvFvVZR(gt1,gt2))

 End Do 
End Do 


cplFvFvVZRL = 0._dp 
cplFvFvVZRR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingFvFvVZRT(gt1,gt2,gBL,g2,gR,ZZ,UV,cplFvFvVZRL(gt1,gt2),cplFvFvVZRR(gt1,gt2))

 End Do 
End Do 


cplcFeFvcVWLmL = 0._dp 
cplcFeFvcVWLmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
Call CouplingcFeFvcVWLmT(gt1,gt2,g2,gR,ZEL,ZER,UV,PhiW,cplcFeFvcVWLmL(gt1,gt2)        & 
& ,cplcFeFvcVWLmR(gt1,gt2))

 End Do 
End Do 


cplcFeFvcVWRmL = 0._dp 
cplcFeFvcVWRmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
Call CouplingcFeFvcVWRmT(gt1,gt2,g2,gR,ZEL,ZER,UV,PhiW,cplcFeFvcVWRmL(gt1,gt2)        & 
& ,cplcFeFvcVWRmR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Fv_decays_3B
 
Function NFlav(m_in) 
Implicit None 
Real(dp), Intent(in) :: m_in 
Real(dp) :: NFlav 
If (m_in.lt.mf_d(3)) Then 
  NFlav = 4._dp 
Else If (m_in.lt.mf_u(3)) Then 
  NFlav = 5._dp 
Else 
  NFlav = 6._dp 
End if 
End Function

Subroutine RunSM(scale_out,deltaM,tb,g1,g2,g3,Yu, Yd, Ye, vd, vu) 
Implicit None
Real(dp), Intent(in) :: scale_out,deltaM, tb
Real(dp), Intent(out) :: g1, g2, g3, vd, vu
Complex(dp), Intent(out) :: Yu(3,3), Yd(3,3), Ye(3,3)
Real(dp) :: dt, gSM(14), gSM2(2), gSM3(3), mtopMS,  sinw2, vev, tz, alphaStop 
Integer :: kont

RunningTopMZ = .false.

Yd = 0._dp
Ye = 0._dp
Yu = 0._dp

If (.not.RunningTopMZ) Then

! Calculating alpha_S(m_top)
gSM2(1)=sqrt(Alpha_mZ*4*Pi) 
gSM2(2)=sqrt(AlphaS_mZ*4*Pi) 


tz=Log(sqrt(mz2)/mf_u(3)) 
dt=tz/50._dp 
Call odeint(gSM2,2,tz,0._dp,deltaM,dt,0._dp,RGEAlphaS,kont)



alphaStop = gSM2(2)**2/4._dp/Pi



! m_top^pole to m_top^MS(m_top) 

mtopMS = mf_u(3)*(1._dp - 4._dp/3._dp*alphaStop/Pi)


! Running m_top^MS(m_top) to M_Z 

gSM3(1)=gSM2(1) 
gSM3(2)=gSM2(2)
gSM3(3)=mtopMS

tz=Log(sqrt(mz2)/mf_u(3)) 
dt=tz/50._dp 
Call odeint(gSM3,3,0._dp,tz,deltaM,dt,0._dp,RGEtop,kont)


mf_u_mz_running = gSM3(3)


RunningTopMZ = .True.

End if

! Starting values at MZ

gSM(1)=sqrt(Alpha_mZ*4*Pi) 
gSM(2)=sqrt(AlphaS_mZ*4*Pi) 
gSM(3)= 0.486E-03_dp ! mf_l_mz(1) 
gSM(4)= 0.10272 !mf_l_mz(2) 
gSM(5)= 1.74624 !mf_l_mz(3) 
gSM(6)= 1.27E-03_dp ! mf_u_mz(1) 
gSM(7)= 0.619  ! mf_u_mz(2) 
gSM(8)= mf_u_mz_running ! m_top 
gSM(9)= 2.9E-03_dp !mf_d_mz(1) 
gSM(10)= 0.055 !mf_d_mz(2) 
gSM(11)= 2.85 ! mf_d_mz(3) 
 

! To get the running sin(w2) 
SinW2 = 0.22290_dp
gSM(12) = 5._dp/3._dp*Alpha_MZ/(1-sinW2)
gSM(13) = Alpha_MZ/Sinw2
gSM(14) = AlphaS_mZ

  nUp =2._dp 
  nDown =3._dp 
  nLep =3._dp 
 

If (scale_out.gt.sqrt(mz2)) Then

 ! From M_Z to Min(M_top,scale_out) 
 If (scale_out.gt.mf_u(3)) Then 
  tz=Log(sqrt(mz2)/mf_u(3)) 
  dt=tz/50._dp 
 Else 
  tz=Log(sqrt(mz2)/scale_out) 
  dt=tz/50._dp 
 End if 

  Call odeint(gSM,14,tz,0._dp,deltaM,dt,0._dp,rge11,kont)


 ! From M_top to M_SUSY if M_top < M_SUSY 
 If (scale_out.gt.mf_u(3)) Then 
  tz=Log(mf_u(3)/scale_out) 
  dt=tz/50._dp 
  nUp =3._dp 
  Call odeint(gSM,14,tz,0._dp,deltaM,dt,0._dp,rge11,kont)
 End if 
Else

 ! From M_Z down to scale_out
  tz=Log(scale_out/sqrt(mz2)) 
  dt=tz/50._dp 
  Call odeint(gSM,14,0._dp,tz,deltaM,dt,0._dp,rge11_SMa,kont)

End if

! Calculating Couplings 

 sinW2=1._dp-mW2/mZ2 
 vev=Sqrt(mZ2*(1._dp-sinW2)*SinW2/(gSM(1)**2/4._dp))
 vd=vev/Sqrt(1._dp+tb**2)
 vu=tb*vd
 
Yd(1,1) =gSM(9)*sqrt(2._dp)/vd 
Yd(2,2) =gSM(10)*sqrt(2._dp)/vd 
Yd(3,3) =gSM(11)*sqrt(2._dp)/vd 
Ye(1,1) =gSM(3)*sqrt(2._dp)/vd 
Ye(2,2)=gSM(4)*sqrt(2._dp)/vd 
Ye(3,3)=gSM(5)*sqrt(2._dp)/vd 
Yu(1,1)=gSM(6)*sqrt(2._dp)/vu 
Yu(2,2)=gSM(7)*sqrt(2._dp)/vu 
Yu(3,3)=gSM(8)*sqrt(2._dp)/vu 


g3 =gSM(2) 
g3running=gSM(2) 

g1 = sqrt(gSM(12)*4._dp*Pi*3._dp/5._dp)
g2 = sqrt(gSM(13)*4._dp*Pi)
! g3 = sqrt(gSM(3)*4._dp*Pi)

sinw2 = g1**2/(g1**2 + g2**2)

!g2=gSM(1)/sqrt(sinW2) 
!g1 = g2*Sqrt(sinW2/(1._dp-sinW2)) 

If (GenerationMixing) Then 
If (TransposedYukawa) Then ! check, if superpotential is Yu Hu u q  or Yu Hu q u
 Yu= Matmul(Transpose(CKM),Transpose(Yu))
Else 
 Yu=Transpose(Matmul(Transpose(CKM),Transpose(Yu)))
End if 
End If


End Subroutine RunSM


Subroutine RunSMohdm(scale_out,deltaM,g1,g2,g3,Yu, Yd, Ye, v) 
Implicit None
Real(dp), Intent(in) :: scale_out,deltaM
Real(dp), Intent(out) :: g1, g2, g3, v
Complex(dp), Intent(out) :: Yu(3,3), Yd(3,3), Ye(3,3)
Real(dp) :: dt, gSM(14), gSM2(2), gSM3(3), mtopMS,  sinw2, vev, tz, alphaStop 
Integer :: kont

Yd = 0._dp
Ye = 0._dp
Yu = 0._dp

If (.not.RunningTopMZ) Then

! Calculating alpha_S(m_top)
gSM2(1)=sqrt(Alpha_mZ*4*Pi) 
gSM2(2)=sqrt(AlphaS_mZ*4*Pi) 


tz=Log(sqrt(mz2)/mf_u(3)) 
dt=tz/50._dp 
Call odeint(gSM2,2,tz,0._dp,deltaM,dt,0._dp,RGEAlphaS,kont)



alphaStop = gSM2(2)**2/4._dp/Pi



! m_top^pole to m_top^MS(m_top) 

mtopMS = mf_u(3)*(1._dp - 4._dp/3._dp*alphaStop/Pi)


! Running m_top^MS(m_top) to M_Z 

gSM3(1)=gSM2(1) 
gSM3(2)=gSM2(2)
gSM3(3)=mtopMS

tz=Log(sqrt(mz2)/mf_u(3)) 
dt=tz/50._dp 
Call odeint(gSM3,3,0._dp,tz,deltaM,dt,0._dp,RGEtop,kont)


mf_u_mz_running = gSM3(3)


RunningTopMZ = .True.

End if

! Starting values at MZ

gSM(1)=sqrt(Alpha_mZ*4*Pi) 
gSM(2)=sqrt(AlphaS_mZ*4*Pi) 
gSM(3)= 0.486E-03_dp ! mf_l_mz(1) 
gSM(4)= 0.10272 !mf_l_mz(2) 
gSM(5)= 1.74624 !mf_l_mz(3) 
gSM(6)= 1.27E-03_dp ! mf_u_mz(1) 
gSM(7)= 0.619  ! mf_u_mz(2) 
gSM(8)= mf_u_mz_running ! m_top 
gSM(9)= 2.9E-03_dp !mf_d_mz(1) 
gSM(10)= 0.055 !mf_d_mz(2) 
gSM(11)= 2.85 ! mf_d_mz(3) 
 

! To get the running sin(w2) 
SinW2 = 0.22290_dp
gSM(12) = 5._dp/3._dp*Alpha_MZ/(1-sinW2)
gSM(13) = Alpha_MZ/Sinw2
gSM(14) = AlphaS_mZ

  nUp =2._dp 
  nDown =3._dp 
  nLep =3._dp 
 

If (scale_out.gt.sqrt(mz2)) Then

 ! From M_Z to Min(M_top,scale_out) 
 If (scale_out.gt.mf_u(3)) Then 
  tz=Log(sqrt(mz2)/mf_u(3)) 
  dt=tz/50._dp 
 Else 
  tz=Log(sqrt(mz2)/scale_out) 
  dt=tz/50._dp 
 End if 

  Call odeint(gSM,14,tz,0._dp,deltaM,dt,0._dp,rge11,kont)


 ! From M_top to M_SUSY if M_top < M_SUSY 
 If (scale_out.gt.mf_u(3)) Then 
  tz=Log(mf_u(3)/scale_out) 
  dt=tz/50._dp 
  nUp =3._dp 
  Call odeint(gSM,14,tz,0._dp,deltaM,dt,0._dp,rge11,kont)
 End if 
Else

 ! From M_Z down to scale_out
  If (abs(scale_out - sqrt(mz2)).gt.1.0E-3_dp) Then 
   tz=Log(scale_out/sqrt(mz2)) 
   dt=tz/50._dp 
   Call odeint(gSM,14,0._dp,tz,deltaM,dt,0._dp,rge11_SMa,kont)
  End if
End if

! Calculating Couplings 

 sinW2=1._dp-mW2/mZ2 
 vev=Sqrt(mZ2*(1._dp-sinW2)*SinW2/(gSM(1)**2/4._dp))
 v = vev
 
Yd(1,1) =gSM(9)*sqrt(2._dp)/v 
Yd(2,2) =gSM(10)*sqrt(2._dp)/v 
Yd(3,3) =gSM(11)*sqrt(2._dp)/v 
Ye(1,1) =gSM(3)*sqrt(2._dp)/v 
Ye(2,2)=gSM(4)*sqrt(2._dp)/v 
Ye(3,3)=gSM(5)*sqrt(2._dp)/v 
Yu(1,1)=gSM(6)*sqrt(2._dp)/v 
Yu(2,2)=gSM(7)*sqrt(2._dp)/v 
Yu(3,3)=gSM(8)*sqrt(2._dp)/v 


g3 =gSM(2) 
g3running=gSM(2) 

g1 = sqrt(gSM(12)*4._dp*Pi*3._dp/5._dp)
g2 = sqrt(gSM(13)*4._dp*Pi)
! g3 = sqrt(gSM(3)*4._dp*Pi)

sinw2 = g1**2/(g1**2 + g2**2)

g2=gSM(1)/sqrt(sinW2) 
g1 = g2*Sqrt(sinW2/(1._dp-sinW2)) 

If (GenerationMixing) Then 
If (TransposedYukawa) Then ! check, if superpotential is Yu Hu u q  or Yu Hu q u
 Yu= Matmul(Transpose(CKM),Transpose(Yu))
Else 
 Yu=Transpose(Matmul(Transpose(CKM),Transpose(Yu)))
End if 
End If


End Subroutine RunSMohdm

Subroutine RunSMgauge(scale_out,deltaM,g1,g2,g3) 
Implicit None
Real(dp), Intent(in) :: scale_out,deltaM
Real(dp), Intent(out) :: g1, g2, g3
Complex(dp) :: Yu(3,3), Yd(3,3), Ye(3,3)
Real(dp) :: v, dt, gSM(14), gSM2(2), gSM3(3), mtopMS,  sinw2, vev, tz, alphaStop 
Integer :: kont

Yd = 0._dp
Ye = 0._dp
Yu = 0._dp

RunningTopMZ = .false.

If (.not.RunningTopMZ) Then

! Calculating alpha_S(m_top)
gSM2(1)=sqrt(Alpha_mZ*4*Pi) 
gSM2(2)=sqrt(AlphaS_mZ*4*Pi) 


tz=Log(sqrt(mz2)/mf_u(3)) 
dt=tz/50._dp 
Call odeint(gSM2,2,tz,0._dp,deltaM,dt,0._dp,RGEAlphaS,kont)



alphaStop = gSM2(2)**2/4._dp/Pi



! m_top^pole to m_top^MS(m_top) 

mtopMS = mf_u(3)*(1._dp - 4._dp/3._dp*alphaStop/Pi)


! Running m_top^MS(m_top) to M_Z 

gSM3(1)=gSM2(1) 
gSM3(2)=gSM2(2)
gSM3(3)=mtopMS

tz=Log(sqrt(mz2)/mf_u(3)) 
dt=tz/50._dp 
Call odeint(gSM3,3,0._dp,tz,deltaM,dt,0._dp,RGEtop,kont)


mf_u_mz_running = gSM3(3)


RunningTopMZ = .True.

End if

! Starting values at MZ

gSM(1)=sqrt(Alpha_mZ*4*Pi) 
gSM(2)=sqrt(AlphaS_mZ*4*Pi) 
gSM(3)= 0.486E-03_dp ! mf_l_mz(1) 
gSM(4)= 0.10272 !mf_l_mz(2) 
gSM(5)= 1.74624 !mf_l_mz(3) 
gSM(6)= 1.27E-03_dp ! mf_u_mz(1) 
gSM(7)= 0.619  ! mf_u_mz(2) 
gSM(8)= mf_u_mz_running ! m_top 
gSM(9)= 2.9E-03_dp !mf_d_mz(1) 
gSM(10)= 0.055 !mf_d_mz(2) 
gSM(11)= 2.85 ! mf_d_mz(3) 
 

! To get the running sin(w2) 
SinW2 = 0.22290_dp
gSM(12) = 5._dp/3._dp*Alpha_MZ/(1-sinW2)
gSM(13) = Alpha_MZ/Sinw2
gSM(14) = AlphaS_mZ

  nUp =2._dp 
  nDown =3._dp 
  nLep =3._dp 
 

If (scale_out.gt.sqrt(mz2)) Then

 ! From M_Z to Min(M_top,scale_out) 
 If (scale_out.gt.mf_u(3)) Then 
  tz=Log(sqrt(mz2)/mf_u(3)) 
  dt=tz/50._dp 
 Else 
  tz=Log(sqrt(mz2)/scale_out) 
  dt=tz/50._dp 
 End if 

  Call odeint(gSM,14,tz,0._dp,deltaM,dt,0._dp,rge11,kont)


 ! From M_top to M_SUSY if M_top < M_SUSY 
 If (scale_out.gt.mf_u(3)) Then 
  tz=Log(mf_u(3)/scale_out) 
  dt=tz/50._dp 
  nUp =3._dp 
  Call odeint(gSM,14,tz,0._dp,deltaM,dt,0._dp,rge11,kont)
 End if 
Else

 ! From M_Z down to scale_out
  tz=Log(scale_out/sqrt(mz2)) 
  dt=tz/50._dp 
  Call odeint(gSM,14,0._dp,tz,deltaM,dt,0._dp,rge11_SMa,kont)

End if

! Calculating Couplings 

 sinW2=1._dp-mW2/mZ2 
 vev=Sqrt(mZ2*(1._dp-sinW2)*SinW2/(gSM(1)**2/4._dp))
 v = vev
 
Yd(1,1) =gSM(9)*sqrt(2._dp)/v 
Yd(2,2) =gSM(10)*sqrt(2._dp)/v 
Yd(3,3) =gSM(11)*sqrt(2._dp)/v 
Ye(1,1) =gSM(3)*sqrt(2._dp)/v 
Ye(2,2)=gSM(4)*sqrt(2._dp)/v 
Ye(3,3)=gSM(5)*sqrt(2._dp)/v 
Yu(1,1)=gSM(6)*sqrt(2._dp)/v 
Yu(2,2)=gSM(7)*sqrt(2._dp)/v 
Yu(3,3)=gSM(8)*sqrt(2._dp)/v 


g3 =gSM(2) 
g3running=gSM(2) 

g1 = sqrt(gSM(12)*4._dp*Pi*3._dp/5._dp)
g2 = sqrt(gSM(13)*4._dp*Pi)
! g3 = sqrt(gSM(3)*4._dp*Pi)

sinw2 = g1**2/(g1**2 + g2**2)

g2=gSM(1)/sqrt(sinW2) 
g1 = g2*Sqrt(sinW2/(1._dp-sinW2)) 

If (GenerationMixing) Then 
If (TransposedYukawa) Then ! check, if superpotential is Yu Hu u q  or Yu Hu q u
 Yu= Matmul(Transpose(CKM),Transpose(Yu))
Else 
 Yu=Transpose(Matmul(Transpose(CKM),Transpose(Yu)))
End if 
End If


End Subroutine RunSMgauge
End Module CouplingsForDecays_DMLR

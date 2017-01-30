! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.9.1 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 16:55 on 30.1.2017   
! ----------------------------------------------------------------------  
 
 
Module CouplingsForDecays_SimplifiedDMSSSFDM
 
Use Control 
Use Model_Data_SimplifiedDMSSSFDM 
Use Couplings_SimplifiedDMSSSFDM 
Use LoopCouplings_SimplifiedDMSSSFDM 
Use Tadpoles_SimplifiedDMSSSFDM 
 Use TreeLevelMasses_SimplifiedDMSSSFDM 
Use Mathematics, Only: CompareMatrices, Adjungate 
 
Use StandardModel 
Contains 
 
 
 
Subroutine CouplingsFor_Fu_decays_2B(m_in,i1,MAhinput,MAh2input,MFdinput,             & 
& MFd2input,MFeinput,MFe2input,MFreinput,MFre2input,MFuinput,MFu2input,MFvinput,         & 
& MFv2input,Mhhinput,Mhh2input,MHpinput,MHp2input,Mssinput,Mss2input,MVWpinput,          & 
& MVWp2input,MVZinput,MVZ2input,TWinput,ZDRinput,ZERinput,ZURinput,ZDLinput,             & 
& ZELinput,ZULinput,UVinput,ZWinput,ZZinput,g1input,g2input,g3input,LSinput,             & 
& LSHinput,Laminput,Yuinput,Ysinput,Ydinput,Yeinput,MFSinput,MS2input,Muinput,           & 
& vinput,cplcFuFdVWpL,cplcFuFdVWpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,Ysinput(3),MS2input,vinput

Complex(dp),Intent(in) :: LSinput,LSHinput,Laminput,Yuinput(3,3),Ydinput(3,3),Yeinput(3,3),MFSinput,Muinput

Real(dp),Intent(in) :: MAhinput,MAh2input,MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),MFreinput,       & 
& MFre2input,MFuinput(3),MFu2input(3),MFvinput(3),MFv2input(3),Mhhinput,Mhh2input,       & 
& MHpinput,MHp2input,Mssinput,Mss2input,MVWpinput,MVWp2input,MVZinput,MVZ2input,         & 
& TWinput,ZZinput(2,2)

Complex(dp),Intent(in) :: ZDRinput(3,3),ZERinput(3,3),ZURinput(3,3),ZDLinput(3,3),ZELinput(3,3),ZULinput(3,3),  & 
& UVinput(3,3),ZWinput(2,2)

Real(dp) :: g1,g2,g3,Ys(3),MS2,v

Complex(dp) :: LS,LSH,Lam,Yu(3,3),Yd(3,3),Ye(3,3),MFS,Mu

Complex(dp),Intent(out) :: cplcFuFdVWpL(3,3),cplcFuFdVWpR(3,3),cplcFuFuhhL(3,3),cplcFuFuhhR(3,3),cplcFuFuVZL(3,3),& 
& cplcFuFuVZR(3,3)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh,MAh2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFre,MFre2,MFu(3),MFu2(3),MFv(3),              & 
& MFv2(3),Mhh,Mhh2,MHp,MHp2,Mss,Mss2,MVWp,MVWp2,MVZ,MVZ2,TW,ZZ(2,2)

Complex(dp) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),UV(3,3),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Fu_2B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
LS = LSinput 
LSH = LSHinput 
Lam = Laminput 
Yu = Yuinput 
Ys = Ysinput 
Yd = Ydinput 
Ye = Yeinput 
MFS = MFSinput 
MS2 = MS2input 
Mu = Muinput 
v = vinput 
Qin=sqrt(getRenormalizationScale()) 
If (m_in.le.Qin) Then 
  If (m_in.le.mz) Then 
Call RunSMohdm(mz,deltaM, g1,g2,g3,Yu,Yd,Ye,v) 
  Else 
Call RunSMohdm(m_in,deltaM, g1,g2,g3,Yu,Yd,Ye,v) 
  End if 
End if 
Call SolveTadpoleEquations(g1,g2,g3,LS,LSH,Lam,Yu,Ys,Yd,Ye,MFS,MS2,Mu,v,              & 
& (/ ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,MFu,MFu2,MFv,MFv2,              & 
& Mhh,Mhh2,MHp,MHp2,Mss,Mss2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,             & 
& UV,ZW,ZZ,v,g1,g2,g3,LS,LSH,Lam,Yu,Ys,Yd,Ye,MFS,MS2,Mu,.True.,kont)

! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UV = UVinput 
ZW = ZWinput 
ZZ = ZZinput 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFre = MFreinput 
MFre2 = MFre2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHp = MHpinput 
MHp2 = MHp2input 
Mss = Mssinput 
Mss2 = Mss2input 
MVWp = MVWpinput 
MVWp2 = MVWp2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
End if 
cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuhhT(gt1,gt2,Yu,ZUL,ZUR,cplcFuFuhhL(gt1,gt2),cplcFuFuhhR(gt1,gt2))

 End Do 
End Do 


cplcFuFdVWpL = 0._dp 
cplcFuFdVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdVWpT(gt1,gt2,g2,ZDL,ZUL,cplcFuFdVWpL(gt1,gt2),cplcFuFdVWpR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZL = 0._dp 
cplcFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZT(gt1,gt2,g1,g2,TW,cplcFuFuVZL(gt1,gt2),cplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Fu_decays_2B
 
Subroutine CouplingsFor_Fe_decays_2B(m_in,i1,MAhinput,MAh2input,MFdinput,             & 
& MFd2input,MFeinput,MFe2input,MFreinput,MFre2input,MFuinput,MFu2input,MFvinput,         & 
& MFv2input,Mhhinput,Mhh2input,MHpinput,MHp2input,Mssinput,Mss2input,MVWpinput,          & 
& MVWp2input,MVZinput,MVZ2input,TWinput,ZDRinput,ZERinput,ZURinput,ZDLinput,             & 
& ZELinput,ZULinput,UVinput,ZWinput,ZZinput,g1input,g2input,g3input,LSinput,             & 
& LSHinput,Laminput,Yuinput,Ysinput,Ydinput,Yeinput,MFSinput,MS2input,Muinput,           & 
& vinput,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFressL,cplcFeFressR,      & 
& cplcFeFvcVWpL,cplcFeFvcVWpR,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,Ysinput(3),MS2input,vinput

Complex(dp),Intent(in) :: LSinput,LSHinput,Laminput,Yuinput(3,3),Ydinput(3,3),Yeinput(3,3),MFSinput,Muinput

Real(dp),Intent(in) :: MAhinput,MAh2input,MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),MFreinput,       & 
& MFre2input,MFuinput(3),MFu2input(3),MFvinput(3),MFv2input(3),Mhhinput,Mhh2input,       & 
& MHpinput,MHp2input,Mssinput,Mss2input,MVWpinput,MVWp2input,MVZinput,MVZ2input,         & 
& TWinput,ZZinput(2,2)

Complex(dp),Intent(in) :: ZDRinput(3,3),ZERinput(3,3),ZURinput(3,3),ZDLinput(3,3),ZELinput(3,3),ZULinput(3,3),  & 
& UVinput(3,3),ZWinput(2,2)

Real(dp) :: g1,g2,g3,Ys(3),MS2,v

Complex(dp) :: LS,LSH,Lam,Yu(3,3),Yd(3,3),Ye(3,3),MFS,Mu

Complex(dp),Intent(out) :: cplcFeFehhL(3,3),cplcFeFehhR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFressL(3),  & 
& cplcFeFressR(3),cplcFeFvcVWpL(3,3),cplcFeFvcVWpR(3,3)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh,MAh2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFre,MFre2,MFu(3),MFu2(3),MFv(3),              & 
& MFv2(3),Mhh,Mhh2,MHp,MHp2,Mss,Mss2,MVWp,MVWp2,MVZ,MVZ2,TW,ZZ(2,2)

Complex(dp) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),UV(3,3),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Fe_2B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
LS = LSinput 
LSH = LSHinput 
Lam = Laminput 
Yu = Yuinput 
Ys = Ysinput 
Yd = Ydinput 
Ye = Yeinput 
MFS = MFSinput 
MS2 = MS2input 
Mu = Muinput 
v = vinput 
Qin=sqrt(getRenormalizationScale()) 
If (m_in.le.Qin) Then 
  If (m_in.le.mz) Then 
Call RunSMohdm(mz,deltaM, g1,g2,g3,Yu,Yd,Ye,v) 
  Else 
Call RunSMohdm(m_in,deltaM, g1,g2,g3,Yu,Yd,Ye,v) 
  End if 
End if 
Call SolveTadpoleEquations(g1,g2,g3,LS,LSH,Lam,Yu,Ys,Yd,Ye,MFS,MS2,Mu,v,              & 
& (/ ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,MFu,MFu2,MFv,MFv2,              & 
& Mhh,Mhh2,MHp,MHp2,Mss,Mss2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,             & 
& UV,ZW,ZZ,v,g1,g2,g3,LS,LSH,Lam,Yu,Ys,Yd,Ye,MFS,MS2,Mu,.True.,kont)

! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UV = UVinput 
ZW = ZWinput 
ZZ = ZZinput 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFre = MFreinput 
MFre2 = MFre2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHp = MHpinput 
MHp2 = MHp2input 
Mss = Mssinput 
Mss2 = Mss2input 
MVWp = MVWpinput 
MVWp2 = MVWp2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
End if 
cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFehhT(gt1,gt2,Ye,ZEL,ZER,cplcFeFehhL(gt1,gt2),cplcFeFehhR(gt1,gt2))

 End Do 
End Do 


cplcFeFressL = 0._dp 
cplcFeFressR = 0._dp 
Do gt1 = 1, 3
Call CouplingcFeFressT(gt1,Ys,ZER,cplcFeFressL(gt1),cplcFeFressR(gt1))

End Do 


cplcFeFeVZL = 0._dp 
cplcFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZT(gt1,gt2,g1,g2,TW,cplcFeFeVZL(gt1,gt2),cplcFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcFeFvcVWpL = 0._dp 
cplcFeFvcVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFvcVWpT(gt1,gt2,g2,UV,ZEL,cplcFeFvcVWpL(gt1,gt2),cplcFeFvcVWpR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Fe_decays_2B
 
Subroutine CouplingsFor_Fd_decays_2B(m_in,i1,MAhinput,MAh2input,MFdinput,             & 
& MFd2input,MFeinput,MFe2input,MFreinput,MFre2input,MFuinput,MFu2input,MFvinput,         & 
& MFv2input,Mhhinput,Mhh2input,MHpinput,MHp2input,Mssinput,Mss2input,MVWpinput,          & 
& MVWp2input,MVZinput,MVZ2input,TWinput,ZDRinput,ZERinput,ZURinput,ZDLinput,             & 
& ZELinput,ZULinput,UVinput,ZWinput,ZZinput,g1input,g2input,g3input,LSinput,             & 
& LSHinput,Laminput,Yuinput,Ysinput,Ydinput,Yeinput,MFSinput,MS2input,Muinput,           & 
& vinput,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFucVWpL,cplcFdFucVWpR,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,Ysinput(3),MS2input,vinput

Complex(dp),Intent(in) :: LSinput,LSHinput,Laminput,Yuinput(3,3),Ydinput(3,3),Yeinput(3,3),MFSinput,Muinput

Real(dp),Intent(in) :: MAhinput,MAh2input,MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),MFreinput,       & 
& MFre2input,MFuinput(3),MFu2input(3),MFvinput(3),MFv2input(3),Mhhinput,Mhh2input,       & 
& MHpinput,MHp2input,Mssinput,Mss2input,MVWpinput,MVWp2input,MVZinput,MVZ2input,         & 
& TWinput,ZZinput(2,2)

Complex(dp),Intent(in) :: ZDRinput(3,3),ZERinput(3,3),ZURinput(3,3),ZDLinput(3,3),ZELinput(3,3),ZULinput(3,3),  & 
& UVinput(3,3),ZWinput(2,2)

Real(dp) :: g1,g2,g3,Ys(3),MS2,v

Complex(dp) :: LS,LSH,Lam,Yu(3,3),Yd(3,3),Ye(3,3),MFS,Mu

Complex(dp),Intent(out) :: cplcFdFdhhL(3,3),cplcFdFdhhR(3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFdFucVWpL(3,3),& 
& cplcFdFucVWpR(3,3)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh,MAh2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFre,MFre2,MFu(3),MFu2(3),MFv(3),              & 
& MFv2(3),Mhh,Mhh2,MHp,MHp2,Mss,Mss2,MVWp,MVWp2,MVZ,MVZ2,TW,ZZ(2,2)

Complex(dp) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),UV(3,3),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Fd_2B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
LS = LSinput 
LSH = LSHinput 
Lam = Laminput 
Yu = Yuinput 
Ys = Ysinput 
Yd = Ydinput 
Ye = Yeinput 
MFS = MFSinput 
MS2 = MS2input 
Mu = Muinput 
v = vinput 
Qin=sqrt(getRenormalizationScale()) 
If (m_in.le.Qin) Then 
  If (m_in.le.mz) Then 
Call RunSMohdm(mz,deltaM, g1,g2,g3,Yu,Yd,Ye,v) 
  Else 
Call RunSMohdm(m_in,deltaM, g1,g2,g3,Yu,Yd,Ye,v) 
  End if 
End if 
Call SolveTadpoleEquations(g1,g2,g3,LS,LSH,Lam,Yu,Ys,Yd,Ye,MFS,MS2,Mu,v,              & 
& (/ ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,MFu,MFu2,MFv,MFv2,              & 
& Mhh,Mhh2,MHp,MHp2,Mss,Mss2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,             & 
& UV,ZW,ZZ,v,g1,g2,g3,LS,LSH,Lam,Yu,Ys,Yd,Ye,MFS,MS2,Mu,.True.,kont)

! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UV = UVinput 
ZW = ZWinput 
ZZ = ZZinput 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFre = MFreinput 
MFre2 = MFre2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHp = MHpinput 
MHp2 = MHp2input 
Mss = Mssinput 
Mss2 = Mss2input 
MVWp = MVWpinput 
MVWp2 = MVWp2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
End if 
cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdhhT(gt1,gt2,Yd,ZDL,ZDR,cplcFdFdhhL(gt1,gt2),cplcFdFdhhR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVZL = 0._dp 
cplcFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZT(gt1,gt2,g1,g2,TW,cplcFdFdVZL(gt1,gt2),cplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcFdFucVWpL = 0._dp 
cplcFdFucVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFucVWpT(gt1,gt2,g2,ZDL,ZUL,cplcFdFucVWpL(gt1,gt2),cplcFdFucVWpR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Fd_decays_2B
 
Subroutine CouplingsFor_hh_decays_2B(m_in,i1,MAhinput,MAh2input,MFdinput,             & 
& MFd2input,MFeinput,MFe2input,MFreinput,MFre2input,MFuinput,MFu2input,MFvinput,         & 
& MFv2input,Mhhinput,Mhh2input,MHpinput,MHp2input,Mssinput,Mss2input,MVWpinput,          & 
& MVWp2input,MVZinput,MVZ2input,TWinput,ZDRinput,ZERinput,ZURinput,ZDLinput,             & 
& ZELinput,ZULinput,UVinput,ZWinput,ZZinput,g1input,g2input,g3input,LSinput,             & 
& LSHinput,Laminput,Yuinput,Ysinput,Ydinput,Yeinput,MFSinput,MS2input,Muinput,           & 
& vinput,cplHiggsPP,cplHiggsGG,cplHiggsZZvirt,cplHiggsWWvirt,cplcFdFdhhL,cplcFdFdhhR,    & 
& cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplhhhhhh,cplhhssss,cplhhcVWpVWp,      & 
& cplhhVZVZ,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,Ysinput(3),MS2input,vinput

Complex(dp),Intent(in) :: LSinput,LSHinput,Laminput,Yuinput(3,3),Ydinput(3,3),Yeinput(3,3),MFSinput,Muinput

Real(dp),Intent(in) :: MAhinput,MAh2input,MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),MFreinput,       & 
& MFre2input,MFuinput(3),MFu2input(3),MFvinput(3),MFv2input(3),Mhhinput,Mhh2input,       & 
& MHpinput,MHp2input,Mssinput,Mss2input,MVWpinput,MVWp2input,MVZinput,MVZ2input,         & 
& TWinput,ZZinput(2,2)

Complex(dp),Intent(in) :: ZDRinput(3,3),ZERinput(3,3),ZURinput(3,3),ZDLinput(3,3),ZELinput(3,3),ZULinput(3,3),  & 
& UVinput(3,3),ZWinput(2,2)

Real(dp) :: g1,g2,g3,Ys(3),MS2,v

Complex(dp) :: LS,LSH,Lam,Yu(3,3),Yd(3,3),Ye(3,3),MFS,Mu

Complex(dp),Intent(out) :: cplHiggsPP,cplHiggsGG,cplHiggsZZvirt,cplHiggsWWvirt,cplcFdFdhhL(3,3),cplcFdFdhhR(3,3),& 
& cplcFeFehhL(3,3),cplcFeFehhR(3,3),cplcFuFuhhL(3,3),cplcFuFuhhR(3,3),cplhhhhhh,         & 
& cplhhssss,cplhhcVWpVWp,cplhhVZVZ

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh,MAh2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFre,MFre2,MFu(3),MFu2(3),MFv(3),              & 
& MFv2(3),Mhh,Mhh2,MHp,MHp2,Mss,Mss2,MVWp,MVWp2,MVZ,MVZ2,TW,ZZ(2,2)

Complex(dp) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),UV(3,3),ZW(2,2)

Complex(dp) :: ratFd(3),ratFe(3),ratFu(3),ratHp,ratVWp

Complex(dp) :: ratPFd(3),ratPFe(3),ratPFu(3),ratPHp,ratPVWp

Complex(dp) :: coup 
Real(dp) :: vev, gNLO, NLOqcd, NNLOqcd, NNNLOqcd, AlphaSQ, AlphaSQhlf 
Real(dp) :: g1SM,g2SM,g3SM,vSM
Complex(dp) ::YuSM(3,3),YdSM(3,3),YeSM(3,3)
Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_hh_2B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
LS = LSinput 
LSH = LSHinput 
Lam = Laminput 
Yu = Yuinput 
Ys = Ysinput 
Yd = Ydinput 
Ye = Yeinput 
MFS = MFSinput 
MS2 = MS2input 
Mu = Muinput 
v = vinput 
Qin=sqrt(getRenormalizationScale()) 
If (m_in.le.Qin) Then 
  If (m_in.le.mz) Then 
Call RunSMohdm(mz,deltaM, g1,g2,g3,Yu,Yd,Ye,v) 
  Else 
Call RunSMohdm(m_in,deltaM, g1,g2,g3,Yu,Yd,Ye,v) 
  End if 
End if 
! Run always SM gauge couplings if present 
  Qin=sqrt(getRenormalizationScale()) 
  Call RunSMohdm(m_in,deltaM,g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,vSM) 
   ! SM pole masses needed for diphoton/digluon rate 
   ! But only top and W play a role. 
   vSM=1/Sqrt((G_F*Sqrt(2._dp))) ! On-Shell VEV needed for loop 
   YuSM(3,3)=sqrt(2._dp)*mf_u(3)/vSM  ! On-Shell top needed in loop 
   ! Other running values kept to get H->ff correct 
v=vSM
Ye=YeSM
Yd=YdSM
Yu=YuSM
g1=g1SM
g2=g2SM
g3=g3SM
! Run always SM gauge couplings if present 
! alphaS(mH/2) for NLO corrections to diphoton rate 
Call RunSMgauge(m_in/2._dp,deltaM, g1,g2,g3) 
AlphaSQhlf=g3**2/(4._dp*Pi) 
! alphaS(mH) for digluon rate 
Call RunSMgauge(m_in,deltaM, g1,g2,g3) 
AlphaSQ=g3**2/(4._dp*Pi) 
Call SolveTadpoleEquations(g1,g2,g3,LS,LSH,Lam,Yu,Ys,Yd,Ye,MFS,MS2,Mu,v,              & 
& (/ ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,MFu,MFu2,MFv,MFv2,              & 
& Mhh,Mhh2,MHp,MHp2,Mss,Mss2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,             & 
& UV,ZW,ZZ,v,g1,g2,g3,LS,LSH,Lam,Yu,Ys,Yd,Ye,MFS,MS2,Mu,.True.,kont)

! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UV = UVinput 
ZW = ZWinput 
ZZ = ZZinput 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFre = MFreinput 
MFre2 = MFre2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHp = MHpinput 
MHp2 = MHp2input 
Mss = Mssinput 
Mss2 = Mss2input 
MVWp = MVWpinput 
MVWp2 = MVWp2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
End if 
cplhhhhhh = 0._dp 
Call CouplinghhhhhhT(Lam,v,cplhhhhhh)



cplhhssss = 0._dp 
Call CouplinghhssssT(LSH,v,cplhhssss)



cplhhcVWpVWp = 0._dp 
Call CouplinghhcVWpVWpT(g2,v,cplhhcVWpVWp)



cplhhVZVZ = 0._dp 
Call CouplinghhVZVZT(g1,g2,v,TW,cplhhVZVZ)



cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdhhT(gt1,gt2,Yd,ZDL,ZDR,cplcFdFdhhL(gt1,gt2),cplcFdFdhhR(gt1,gt2))

 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFehhT(gt1,gt2,Ye,ZEL,ZER,cplcFeFehhL(gt1,gt2),cplcFeFehhR(gt1,gt2))

 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuhhT(gt1,gt2,Yu,ZUL,ZUR,cplcFuFuhhL(gt1,gt2),cplcFuFuhhR(gt1,gt2))

 End Do 
End Do 


vev=1/Sqrt((G_F*Sqrt(2._dp)))
cplHiggsWWvirt = cplhhcVWpVWp/vev 
cplHiggsZZvirt = cplhhVZVZ*Sqrt(7._dp/12._dp-10._dp/9._dp*Sin(TW)**2+40._dp/27._dp*Sin(TW)**4)/vev 
 

!----------------------------------------------------
! Scalar Higgs coupling ratios 
!----------------------------------------------------
 
Do i2=1, 3
ratFd(i2) = cplcFdFdhhL(i2,i2)*1._dp*vev/MFd(i2) 
End Do 
Do i2=1, 3
ratFe(i2) = cplcFeFehhL(i2,i2)*1._dp*vev/MFe(i2) 
End Do 
Do i2=1, 3
ratFu(i2) = cplcFuFuhhL(i2,i2)*1._dp*vev/MFu(i2) 
End Do 
ratHp = 0._dp 
ratVWp = -0.5_dp*cplhhcVWpVWp*vev/MVWp2 
If (HigherOrderDiboson) Then 
  gNLO = Sqrt(AlphaSQhlf*4._dp*Pi) 
Else  
  gNLO = -1._dp 
End if 
Call CoupHiggsToPhoton(m_in,i1,ratFd,ratFe,ratFu,ratHp,ratVWp,MFd,MFe,MFu,            & 
& MHp,MVWp,gNLO,coup)

cplHiggsPP = coup*Alpha 
CoupHPP = coup 
Call CoupHiggsToPhotonSM(m_in,MFd,MFe,MFu,MHp,MVWp,gNLO,coup)

ratioPP = Abs(cplHiggsPP/(coup*Alpha))**2 
  gNLO = -1._dp 
Call CoupHiggsToGluon(m_in,i1,ratFd,ratFu,MFd,MFu,gNLO,coup)

cplHiggsGG = coup*AlphaSQ 
CoupHGG = coup 
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
cplHiggsGG = cplHiggsGG*Sqrt(1._dp + NLOqcd+NNLOqcd+NNNLOqcd) 
CoupHGG=cplHiggsGG 
ratioGG = Abs(cplHiggsGG/(coup*AlphaSQ))**2 
!----------------------------------------------------
! Coupling ratios for HiggsBounds 
!----------------------------------------------------
 
Do i2=1, 3
rHB_S_S_Fe(i1,i2) = Abs((cplcFeFehhL(i2,i2)+cplcFeFehhR(i2,i2))*vev/(2._dp*MFe(i2)))**2 
rHB_S_P_Fe(i1,i2) = Abs((cplcFeFehhL(i2,i2)-cplcFeFehhR(i2,i2))*vev/(2._dp*MFe(i2)))**2 
End Do 
Do i2=1, 3
rHB_S_S_Fu(i1,i2) = Abs((cplcFuFuhhL(i2,i2)+cplcFuFuhhR(i2,i2))*vev/(2._dp*MFu(i2)))**2 
rHB_S_P_Fu(i1,i2) = Abs((cplcFuFuhhL(i2,i2)-cplcFuFuhhR(i2,i2))*vev/(2._dp*MFu(i2)))**2 
End Do 
Do i2=1, 3
rHB_S_S_Fd(i1,i2) = Abs((cplcFdFdhhL(i2,i2)+cplcFdFdhhR(i2,i2))*vev/(2._dp*MFd(i2)))**2 
rHB_S_P_Fd(i1,i2) = Abs((cplcFdFdhhL(i2,i2)-cplcFdFdhhR(i2,i2))*vev/(2._dp*MFd(i2)))**2 
End Do 
rHB_S_VZ(i1) = Abs(-0.5_dp*cplhhVZVZ*vev/MVZ2)**2 
rHB_S_VWp(i1) = Abs(-0.5_dp*cplhhcVWpVWp*vev/MVWp2)**2 
If (i1.eq.1) Then 
CPL_A_H_Z = 0 
CPL_H_H_Z = 0._dp 
End if 
cplhhhhhh = 0._dp 
Call CouplinghhhhhhT(Lam,v,cplhhhhhh)



cplhhssss = 0._dp 
Call CouplinghhssssT(LSH,v,cplhhssss)



cplhhcVWpVWp = 0._dp 
Call CouplinghhcVWpVWpT(g2,v,cplhhcVWpVWp)



cplhhVZVZ = 0._dp 
Call CouplinghhVZVZT(g1,g2,v,TW,cplhhVZVZ)



cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdhhT(gt1,gt2,Yd,ZDL,ZDR,cplcFdFdhhL(gt1,gt2),cplcFdFdhhR(gt1,gt2))

 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFehhT(gt1,gt2,Ye,ZEL,ZER,cplcFeFehhL(gt1,gt2),cplcFeFehhR(gt1,gt2))

 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuhhT(gt1,gt2,Yu,ZUL,ZUR,cplcFuFuhhL(gt1,gt2),cplcFuFuhhR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_hh_decays_2B
 
Subroutine CouplingsFor_Fre_decays_2B(m_in,i1,MAhinput,MAh2input,MFdinput,            & 
& MFd2input,MFeinput,MFe2input,MFreinput,MFre2input,MFuinput,MFu2input,MFvinput,         & 
& MFv2input,Mhhinput,Mhh2input,MHpinput,MHp2input,Mssinput,Mss2input,MVWpinput,          & 
& MVWp2input,MVZinput,MVZ2input,TWinput,ZDRinput,ZERinput,ZURinput,ZDLinput,             & 
& ZELinput,ZULinput,UVinput,ZWinput,ZZinput,g1input,g2input,g3input,LSinput,             & 
& LSHinput,Laminput,Yuinput,Ysinput,Ydinput,Yeinput,MFSinput,MS2input,Muinput,           & 
& vinput,cplcFreFessL,cplcFreFessR,cplcFreFreVZL,cplcFreFreVZR,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,Ysinput(3),MS2input,vinput

Complex(dp),Intent(in) :: LSinput,LSHinput,Laminput,Yuinput(3,3),Ydinput(3,3),Yeinput(3,3),MFSinput,Muinput

Real(dp),Intent(in) :: MAhinput,MAh2input,MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),MFreinput,       & 
& MFre2input,MFuinput(3),MFu2input(3),MFvinput(3),MFv2input(3),Mhhinput,Mhh2input,       & 
& MHpinput,MHp2input,Mssinput,Mss2input,MVWpinput,MVWp2input,MVZinput,MVZ2input,         & 
& TWinput,ZZinput(2,2)

Complex(dp),Intent(in) :: ZDRinput(3,3),ZERinput(3,3),ZURinput(3,3),ZDLinput(3,3),ZELinput(3,3),ZULinput(3,3),  & 
& UVinput(3,3),ZWinput(2,2)

Real(dp) :: g1,g2,g3,Ys(3),MS2,v

Complex(dp) :: LS,LSH,Lam,Yu(3,3),Yd(3,3),Ye(3,3),MFS,Mu

Complex(dp),Intent(out) :: cplcFreFessL(3),cplcFreFessR(3),cplcFreFreVZL,cplcFreFreVZR

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh,MAh2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFre,MFre2,MFu(3),MFu2(3),MFv(3),              & 
& MFv2(3),Mhh,Mhh2,MHp,MHp2,Mss,Mss2,MVWp,MVWp2,MVZ,MVZ2,TW,ZZ(2,2)

Complex(dp) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),UV(3,3),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Fre_2B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
LS = LSinput 
LSH = LSHinput 
Lam = Laminput 
Yu = Yuinput 
Ys = Ysinput 
Yd = Ydinput 
Ye = Yeinput 
MFS = MFSinput 
MS2 = MS2input 
Mu = Muinput 
v = vinput 
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(g1,g2,g3,LS,LSH,Lam,Yu,Ys,Yd,Ye,MFS,MS2,Mu,v,              & 
& (/ ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,MFu,MFu2,MFv,MFv2,              & 
& Mhh,Mhh2,MHp,MHp2,Mss,Mss2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,             & 
& UV,ZW,ZZ,v,g1,g2,g3,LS,LSH,Lam,Yu,Ys,Yd,Ye,MFS,MS2,Mu,.True.,kont)

! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UV = UVinput 
ZW = ZWinput 
ZZ = ZZinput 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFre = MFreinput 
MFre2 = MFre2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHp = MHpinput 
MHp2 = MHp2input 
Mss = Mssinput 
Mss2 = Mss2input 
MVWp = MVWpinput 
MVWp2 = MVWp2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
End if 
cplcFreFessL = 0._dp 
cplcFreFessR = 0._dp 
Do gt2 = 1, 3
Call CouplingcFreFessT(gt2,Ys,ZER,cplcFreFessL(gt2),cplcFreFessR(gt2))

End Do 


cplcFreFreVZL = 0._dp 
cplcFreFreVZR = 0._dp 
Call CouplingcFreFreVZT(g1,TW,cplcFreFreVZL,cplcFreFreVZR)



Iname = Iname - 1 
 
End subroutine CouplingsFor_Fre_decays_2B
 
Subroutine CouplingsFor_ss_decays_2B(m_in,i1,MAhinput,MAh2input,MFdinput,             & 
& MFd2input,MFeinput,MFe2input,MFreinput,MFre2input,MFuinput,MFu2input,MFvinput,         & 
& MFv2input,Mhhinput,Mhh2input,MHpinput,MHp2input,Mssinput,Mss2input,MVWpinput,          & 
& MVWp2input,MVZinput,MVZ2input,TWinput,ZDRinput,ZERinput,ZURinput,ZDLinput,             & 
& ZELinput,ZULinput,UVinput,ZWinput,ZZinput,g1input,g2input,g3input,LSinput,             & 
& LSHinput,Laminput,Yuinput,Ysinput,Ydinput,Yeinput,MFSinput,MS2input,Muinput,           & 
& vinput,cplcFreFessL,cplcFreFessR,cplhhssss,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,Ysinput(3),MS2input,vinput

Complex(dp),Intent(in) :: LSinput,LSHinput,Laminput,Yuinput(3,3),Ydinput(3,3),Yeinput(3,3),MFSinput,Muinput

Real(dp),Intent(in) :: MAhinput,MAh2input,MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),MFreinput,       & 
& MFre2input,MFuinput(3),MFu2input(3),MFvinput(3),MFv2input(3),Mhhinput,Mhh2input,       & 
& MHpinput,MHp2input,Mssinput,Mss2input,MVWpinput,MVWp2input,MVZinput,MVZ2input,         & 
& TWinput,ZZinput(2,2)

Complex(dp),Intent(in) :: ZDRinput(3,3),ZERinput(3,3),ZURinput(3,3),ZDLinput(3,3),ZELinput(3,3),ZULinput(3,3),  & 
& UVinput(3,3),ZWinput(2,2)

Real(dp) :: g1,g2,g3,Ys(3),MS2,v

Complex(dp) :: LS,LSH,Lam,Yu(3,3),Yd(3,3),Ye(3,3),MFS,Mu

Complex(dp),Intent(out) :: cplcFreFessL(3),cplcFreFessR(3),cplhhssss

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh,MAh2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFre,MFre2,MFu(3),MFu2(3),MFv(3),              & 
& MFv2(3),Mhh,Mhh2,MHp,MHp2,Mss,Mss2,MVWp,MVWp2,MVZ,MVZ2,TW,ZZ(2,2)

Complex(dp) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),UV(3,3),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_ss_2B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
LS = LSinput 
LSH = LSHinput 
Lam = Laminput 
Yu = Yuinput 
Ys = Ysinput 
Yd = Ydinput 
Ye = Yeinput 
MFS = MFSinput 
MS2 = MS2input 
Mu = Muinput 
v = vinput 
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(g1,g2,g3,LS,LSH,Lam,Yu,Ys,Yd,Ye,MFS,MS2,Mu,v,              & 
& (/ ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,MFu,MFu2,MFv,MFv2,              & 
& Mhh,Mhh2,MHp,MHp2,Mss,Mss2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,             & 
& UV,ZW,ZZ,v,g1,g2,g3,LS,LSH,Lam,Yu,Ys,Yd,Ye,MFS,MS2,Mu,.True.,kont)

! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UV = UVinput 
ZW = ZWinput 
ZZ = ZZinput 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFre = MFreinput 
MFre2 = MFre2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHp = MHpinput 
MHp2 = MHp2input 
Mss = Mssinput 
Mss2 = Mss2input 
MVWp = MVWpinput 
MVWp2 = MVWp2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
End if 
cplhhssss = 0._dp 
Call CouplinghhssssT(LSH,v,cplhhssss)



cplcFreFessL = 0._dp 
cplcFreFessR = 0._dp 
Do gt2 = 1, 3
Call CouplingcFreFessT(gt2,Ys,ZER,cplcFreFessL(gt2),cplcFreFessR(gt2))

End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_ss_decays_2B
 
Subroutine CouplingsFor_Fu_decays_3B(m_in,i1,MAhinput,MAh2input,MFdinput,             & 
& MFd2input,MFeinput,MFe2input,MFreinput,MFre2input,MFuinput,MFu2input,MFvinput,         & 
& MFv2input,Mhhinput,Mhh2input,MHpinput,MHp2input,Mssinput,Mss2input,MVWpinput,          & 
& MVWp2input,MVZinput,MVZ2input,TWinput,ZDRinput,ZERinput,ZURinput,ZDLinput,             & 
& ZELinput,ZULinput,UVinput,ZWinput,ZZinput,g1input,g2input,g3input,LSinput,             & 
& LSHinput,Laminput,Yuinput,Ysinput,Ydinput,Yeinput,MFSinput,MS2input,Muinput,           & 
& vinput,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFucVWpL,cplcFdFucVWpR,    & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFvcVWpL,cplcFeFvcVWpR,           & 
& cplcFreFreVZL,cplcFreFreVZR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFuFuhhL,cplcFuFuhhR,         & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFvFvVZL,cplcFvFvVZR,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,Ysinput(3),MS2input,vinput

Complex(dp),Intent(in) :: LSinput,LSHinput,Laminput,Yuinput(3,3),Ydinput(3,3),Yeinput(3,3),MFSinput,Muinput

Real(dp),Intent(in) :: MAhinput,MAh2input,MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),MFreinput,       & 
& MFre2input,MFuinput(3),MFu2input(3),MFvinput(3),MFv2input(3),Mhhinput,Mhh2input,       & 
& MHpinput,MHp2input,Mssinput,Mss2input,MVWpinput,MVWp2input,MVZinput,MVZ2input,         & 
& TWinput,ZZinput(2,2)

Complex(dp),Intent(in) :: ZDRinput(3,3),ZERinput(3,3),ZURinput(3,3),ZDLinput(3,3),ZELinput(3,3),ZULinput(3,3),  & 
& UVinput(3,3),ZWinput(2,2)

Real(dp) :: g1,g2,g3,Ys(3),MS2,v

Complex(dp) :: LS,LSH,Lam,Yu(3,3),Yd(3,3),Ye(3,3),MFS,Mu

Complex(dp),Intent(out) :: cplcFdFdhhL(3,3),cplcFdFdhhR(3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFdFucVWpL(3,3),& 
& cplcFdFucVWpR(3,3),cplcFeFehhL(3,3),cplcFeFehhR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),& 
& cplcFeFvcVWpL(3,3),cplcFeFvcVWpR(3,3),cplcFreFreVZL,cplcFreFreVZR,cplcFuFdVWpL(3,3),   & 
& cplcFuFdVWpR(3,3),cplcFuFuhhL(3,3),cplcFuFuhhR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3), & 
& cplcFvFvVZL(3,3),cplcFvFvVZR(3,3)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh,MAh2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFre,MFre2,MFu(3),MFu2(3),MFv(3),              & 
& MFv2(3),Mhh,Mhh2,MHp,MHp2,Mss,Mss2,MVWp,MVWp2,MVZ,MVZ2,TW,ZZ(2,2)

Complex(dp) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),UV(3,3),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Fu_3B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
LS = LSinput 
LSH = LSHinput 
Lam = Laminput 
Yu = Yuinput 
Ys = Ysinput 
Yd = Ydinput 
Ye = Yeinput 
MFS = MFSinput 
MS2 = MS2input 
Mu = Muinput 
v = vinput 
Qin=sqrt(getRenormalizationScale()) 
If (m_in.le.Qin) Then 
  If (m_in.le.mz) Then 
Call RunSMohdm(mz,deltaM, g1,g2,g3,Yu,Yd,Ye,v) 
  Else 
Call RunSMohdm(m_in,deltaM, g1,g2,g3,Yu,Yd,Ye,v) 
  End if 
End if 
Call SolveTadpoleEquations(g1,g2,g3,LS,LSH,Lam,Yu,Ys,Yd,Ye,MFS,MS2,Mu,v,              & 
& (/ ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,MFu,MFu2,MFv,MFv2,              & 
& Mhh,Mhh2,MHp,MHp2,Mss,Mss2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,             & 
& UV,ZW,ZZ,v,g1,g2,g3,LS,LSH,Lam,Yu,Ys,Yd,Ye,MFS,MS2,Mu,.True.,kont)

! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UV = UVinput 
ZW = ZWinput 
ZZ = ZZinput 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFre = MFreinput 
MFre2 = MFre2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHp = MHpinput 
MHp2 = MHp2input 
Mss = Mssinput 
Mss2 = Mss2input 
MVWp = MVWpinput 
MVWp2 = MVWp2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
End if 
cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdhhT(gt1,gt2,Yd,ZDL,ZDR,cplcFdFdhhL(gt1,gt2),cplcFdFdhhR(gt1,gt2))

 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFehhT(gt1,gt2,Ye,ZEL,ZER,cplcFeFehhL(gt1,gt2),cplcFeFehhR(gt1,gt2))

 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuhhT(gt1,gt2,Yu,ZUL,ZUR,cplcFuFuhhL(gt1,gt2),cplcFuFuhhR(gt1,gt2))

 End Do 
End Do 


cplcFuFdVWpL = 0._dp 
cplcFuFdVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdVWpT(gt1,gt2,g2,ZDL,ZUL,cplcFuFdVWpL(gt1,gt2),cplcFuFdVWpR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVZL = 0._dp 
cplcFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZT(gt1,gt2,g1,g2,TW,cplcFdFdVZL(gt1,gt2),cplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZL = 0._dp 
cplcFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZT(gt1,gt2,g1,g2,TW,cplcFeFeVZL(gt1,gt2),cplcFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcFreFreVZL = 0._dp 
cplcFreFreVZR = 0._dp 
Call CouplingcFreFreVZT(g1,TW,cplcFreFreVZL,cplcFreFreVZR)



cplcFuFuVZL = 0._dp 
cplcFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZT(gt1,gt2,g1,g2,TW,cplcFuFuVZL(gt1,gt2),cplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplcFdFucVWpL = 0._dp 
cplcFdFucVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFucVWpT(gt1,gt2,g2,ZDL,ZUL,cplcFdFucVWpL(gt1,gt2),cplcFdFucVWpR(gt1,gt2))

 End Do 
End Do 


cplcFvFvVZL = 0._dp 
cplcFvFvVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFvFvVZT(gt1,gt2,g1,g2,TW,cplcFvFvVZL(gt1,gt2),cplcFvFvVZR(gt1,gt2))

 End Do 
End Do 


cplcFeFvcVWpL = 0._dp 
cplcFeFvcVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFvcVWpT(gt1,gt2,g2,UV,ZEL,cplcFeFvcVWpL(gt1,gt2),cplcFeFvcVWpR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Fu_decays_3B
 
Subroutine CouplingsFor_Fe_decays_3B(m_in,i1,MAhinput,MAh2input,MFdinput,             & 
& MFd2input,MFeinput,MFe2input,MFreinput,MFre2input,MFuinput,MFu2input,MFvinput,         & 
& MFv2input,Mhhinput,Mhh2input,MHpinput,MHp2input,Mssinput,Mss2input,MVWpinput,          & 
& MVWp2input,MVZinput,MVZ2input,TWinput,ZDRinput,ZERinput,ZURinput,ZDLinput,             & 
& ZELinput,ZULinput,UVinput,ZWinput,ZZinput,g1input,g2input,g3input,LSinput,             & 
& LSHinput,Laminput,Yuinput,Ysinput,Ydinput,Yeinput,MFSinput,MS2input,Muinput,           & 
& vinput,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,        & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFeFressL,cplcFeFressR,cplcFeFvcVWpL,cplcFeFvcVWpR,         & 
& cplcFreFessL,cplcFreFessR,cplcFreFreVZL,cplcFreFreVZR,cplcFuFdVWpL,cplcFuFdVWpR,       & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplcFvFeVWpL,cplcFvFeVWpR,             & 
& cplcFvFvVZL,cplcFvFvVZR,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,Ysinput(3),MS2input,vinput

Complex(dp),Intent(in) :: LSinput,LSHinput,Laminput,Yuinput(3,3),Ydinput(3,3),Yeinput(3,3),MFSinput,Muinput

Real(dp),Intent(in) :: MAhinput,MAh2input,MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),MFreinput,       & 
& MFre2input,MFuinput(3),MFu2input(3),MFvinput(3),MFv2input(3),Mhhinput,Mhh2input,       & 
& MHpinput,MHp2input,Mssinput,Mss2input,MVWpinput,MVWp2input,MVZinput,MVZ2input,         & 
& TWinput,ZZinput(2,2)

Complex(dp),Intent(in) :: ZDRinput(3,3),ZERinput(3,3),ZURinput(3,3),ZDLinput(3,3),ZELinput(3,3),ZULinput(3,3),  & 
& UVinput(3,3),ZWinput(2,2)

Real(dp) :: g1,g2,g3,Ys(3),MS2,v

Complex(dp) :: LS,LSH,Lam,Yu(3,3),Yd(3,3),Ye(3,3),MFS,Mu

Complex(dp),Intent(out) :: cplcFdFdhhL(3,3),cplcFdFdhhR(3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFehhL(3,3), & 
& cplcFeFehhR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFressL(3),cplcFeFressR(3),    & 
& cplcFeFvcVWpL(3,3),cplcFeFvcVWpR(3,3),cplcFreFessL(3),cplcFreFessR(3),cplcFreFreVZL,   & 
& cplcFreFreVZR,cplcFuFdVWpL(3,3),cplcFuFdVWpR(3,3),cplcFuFuhhL(3,3),cplcFuFuhhR(3,3),   & 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcFvFeVWpL(3,3),cplcFvFeVWpR(3,3),cplcFvFvVZL(3,3),& 
& cplcFvFvVZR(3,3)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh,MAh2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFre,MFre2,MFu(3),MFu2(3),MFv(3),              & 
& MFv2(3),Mhh,Mhh2,MHp,MHp2,Mss,Mss2,MVWp,MVWp2,MVZ,MVZ2,TW,ZZ(2,2)

Complex(dp) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),UV(3,3),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Fe_3B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
LS = LSinput 
LSH = LSHinput 
Lam = Laminput 
Yu = Yuinput 
Ys = Ysinput 
Yd = Ydinput 
Ye = Yeinput 
MFS = MFSinput 
MS2 = MS2input 
Mu = Muinput 
v = vinput 
Qin=sqrt(getRenormalizationScale()) 
If (m_in.le.Qin) Then 
  If (m_in.le.mz) Then 
Call RunSMohdm(mz,deltaM, g1,g2,g3,Yu,Yd,Ye,v) 
  Else 
Call RunSMohdm(m_in,deltaM, g1,g2,g3,Yu,Yd,Ye,v) 
  End if 
End if 
Call SolveTadpoleEquations(g1,g2,g3,LS,LSH,Lam,Yu,Ys,Yd,Ye,MFS,MS2,Mu,v,              & 
& (/ ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,MFu,MFu2,MFv,MFv2,              & 
& Mhh,Mhh2,MHp,MHp2,Mss,Mss2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,             & 
& UV,ZW,ZZ,v,g1,g2,g3,LS,LSH,Lam,Yu,Ys,Yd,Ye,MFS,MS2,Mu,.True.,kont)

! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UV = UVinput 
ZW = ZWinput 
ZZ = ZZinput 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFre = MFreinput 
MFre2 = MFre2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHp = MHpinput 
MHp2 = MHp2input 
Mss = Mssinput 
Mss2 = Mss2input 
MVWp = MVWpinput 
MVWp2 = MVWp2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
End if 
cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdhhT(gt1,gt2,Yd,ZDL,ZDR,cplcFdFdhhL(gt1,gt2),cplcFdFdhhR(gt1,gt2))

 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFehhT(gt1,gt2,Ye,ZEL,ZER,cplcFeFehhL(gt1,gt2),cplcFeFehhR(gt1,gt2))

 End Do 
End Do 


cplcFreFessL = 0._dp 
cplcFreFessR = 0._dp 
Do gt2 = 1, 3
Call CouplingcFreFessT(gt2,Ys,ZER,cplcFreFessL(gt2),cplcFreFessR(gt2))

End Do 


cplcFeFressL = 0._dp 
cplcFeFressR = 0._dp 
Do gt1 = 1, 3
Call CouplingcFeFressT(gt1,Ys,ZER,cplcFeFressL(gt1),cplcFeFressR(gt1))

End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuhhT(gt1,gt2,Yu,ZUL,ZUR,cplcFuFuhhL(gt1,gt2),cplcFuFuhhR(gt1,gt2))

 End Do 
End Do 


cplcFuFdVWpL = 0._dp 
cplcFuFdVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdVWpT(gt1,gt2,g2,ZDL,ZUL,cplcFuFdVWpL(gt1,gt2),cplcFuFdVWpR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVZL = 0._dp 
cplcFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZT(gt1,gt2,g1,g2,TW,cplcFdFdVZL(gt1,gt2),cplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcFvFeVWpL = 0._dp 
cplcFvFeVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFvFeVWpT(gt1,gt2,g2,UV,ZEL,cplcFvFeVWpL(gt1,gt2),cplcFvFeVWpR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZL = 0._dp 
cplcFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZT(gt1,gt2,g1,g2,TW,cplcFeFeVZL(gt1,gt2),cplcFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcFreFreVZL = 0._dp 
cplcFreFreVZR = 0._dp 
Call CouplingcFreFreVZT(g1,TW,cplcFreFreVZL,cplcFreFreVZR)



cplcFuFuVZL = 0._dp 
cplcFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZT(gt1,gt2,g1,g2,TW,cplcFuFuVZL(gt1,gt2),cplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplcFvFvVZL = 0._dp 
cplcFvFvVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFvFvVZT(gt1,gt2,g1,g2,TW,cplcFvFvVZL(gt1,gt2),cplcFvFvVZR(gt1,gt2))

 End Do 
End Do 


cplcFeFvcVWpL = 0._dp 
cplcFeFvcVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFvcVWpT(gt1,gt2,g2,UV,ZEL,cplcFeFvcVWpL(gt1,gt2),cplcFeFvcVWpR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Fe_decays_3B
 
Subroutine CouplingsFor_Fd_decays_3B(m_in,i1,MAhinput,MAh2input,MFdinput,             & 
& MFd2input,MFeinput,MFe2input,MFreinput,MFre2input,MFuinput,MFu2input,MFvinput,         & 
& MFv2input,Mhhinput,Mhh2input,MHpinput,MHp2input,Mssinput,Mss2input,MVWpinput,          & 
& MVWp2input,MVZinput,MVZ2input,TWinput,ZDRinput,ZERinput,ZURinput,ZDLinput,             & 
& ZELinput,ZULinput,UVinput,ZWinput,ZZinput,g1input,g2input,g3input,LSinput,             & 
& LSHinput,Laminput,Yuinput,Ysinput,Ydinput,Yeinput,MFSinput,MS2input,Muinput,           & 
& vinput,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFucVWpL,cplcFdFucVWpR,    & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFreFreVZL,cplcFreFreVZR,           & 
& cplcFuFdVWpL,cplcFuFdVWpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,             & 
& cplcFvFeVWpL,cplcFvFeVWpR,cplcFvFvVZL,cplcFvFvVZR,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,Ysinput(3),MS2input,vinput

Complex(dp),Intent(in) :: LSinput,LSHinput,Laminput,Yuinput(3,3),Ydinput(3,3),Yeinput(3,3),MFSinput,Muinput

Real(dp),Intent(in) :: MAhinput,MAh2input,MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),MFreinput,       & 
& MFre2input,MFuinput(3),MFu2input(3),MFvinput(3),MFv2input(3),Mhhinput,Mhh2input,       & 
& MHpinput,MHp2input,Mssinput,Mss2input,MVWpinput,MVWp2input,MVZinput,MVZ2input,         & 
& TWinput,ZZinput(2,2)

Complex(dp),Intent(in) :: ZDRinput(3,3),ZERinput(3,3),ZURinput(3,3),ZDLinput(3,3),ZELinput(3,3),ZULinput(3,3),  & 
& UVinput(3,3),ZWinput(2,2)

Real(dp) :: g1,g2,g3,Ys(3),MS2,v

Complex(dp) :: LS,LSH,Lam,Yu(3,3),Yd(3,3),Ye(3,3),MFS,Mu

Complex(dp),Intent(out) :: cplcFdFdhhL(3,3),cplcFdFdhhR(3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFdFucVWpL(3,3),& 
& cplcFdFucVWpR(3,3),cplcFeFehhL(3,3),cplcFeFehhR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),& 
& cplcFreFreVZL,cplcFreFreVZR,cplcFuFdVWpL(3,3),cplcFuFdVWpR(3,3),cplcFuFuhhL(3,3),      & 
& cplcFuFuhhR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcFvFeVWpL(3,3),cplcFvFeVWpR(3,3),& 
& cplcFvFvVZL(3,3),cplcFvFvVZR(3,3)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh,MAh2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFre,MFre2,MFu(3),MFu2(3),MFv(3),              & 
& MFv2(3),Mhh,Mhh2,MHp,MHp2,Mss,Mss2,MVWp,MVWp2,MVZ,MVZ2,TW,ZZ(2,2)

Complex(dp) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),UV(3,3),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Fd_3B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
LS = LSinput 
LSH = LSHinput 
Lam = Laminput 
Yu = Yuinput 
Ys = Ysinput 
Yd = Ydinput 
Ye = Yeinput 
MFS = MFSinput 
MS2 = MS2input 
Mu = Muinput 
v = vinput 
Qin=sqrt(getRenormalizationScale()) 
If (m_in.le.Qin) Then 
  If (m_in.le.mz) Then 
Call RunSMohdm(mz,deltaM, g1,g2,g3,Yu,Yd,Ye,v) 
  Else 
Call RunSMohdm(m_in,deltaM, g1,g2,g3,Yu,Yd,Ye,v) 
  End if 
End if 
Call SolveTadpoleEquations(g1,g2,g3,LS,LSH,Lam,Yu,Ys,Yd,Ye,MFS,MS2,Mu,v,              & 
& (/ ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,MFu,MFu2,MFv,MFv2,              & 
& Mhh,Mhh2,MHp,MHp2,Mss,Mss2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,             & 
& UV,ZW,ZZ,v,g1,g2,g3,LS,LSH,Lam,Yu,Ys,Yd,Ye,MFS,MS2,Mu,.True.,kont)

! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UV = UVinput 
ZW = ZWinput 
ZZ = ZZinput 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFre = MFreinput 
MFre2 = MFre2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHp = MHpinput 
MHp2 = MHp2input 
Mss = Mssinput 
Mss2 = Mss2input 
MVWp = MVWpinput 
MVWp2 = MVWp2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
End if 
cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdhhT(gt1,gt2,Yd,ZDL,ZDR,cplcFdFdhhL(gt1,gt2),cplcFdFdhhR(gt1,gt2))

 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFehhT(gt1,gt2,Ye,ZEL,ZER,cplcFeFehhL(gt1,gt2),cplcFeFehhR(gt1,gt2))

 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuhhT(gt1,gt2,Yu,ZUL,ZUR,cplcFuFuhhL(gt1,gt2),cplcFuFuhhR(gt1,gt2))

 End Do 
End Do 


cplcFuFdVWpL = 0._dp 
cplcFuFdVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdVWpT(gt1,gt2,g2,ZDL,ZUL,cplcFuFdVWpL(gt1,gt2),cplcFuFdVWpR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVZL = 0._dp 
cplcFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZT(gt1,gt2,g1,g2,TW,cplcFdFdVZL(gt1,gt2),cplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcFvFeVWpL = 0._dp 
cplcFvFeVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFvFeVWpT(gt1,gt2,g2,UV,ZEL,cplcFvFeVWpL(gt1,gt2),cplcFvFeVWpR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZL = 0._dp 
cplcFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZT(gt1,gt2,g1,g2,TW,cplcFeFeVZL(gt1,gt2),cplcFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcFreFreVZL = 0._dp 
cplcFreFreVZR = 0._dp 
Call CouplingcFreFreVZT(g1,TW,cplcFreFreVZL,cplcFreFreVZR)



cplcFuFuVZL = 0._dp 
cplcFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZT(gt1,gt2,g1,g2,TW,cplcFuFuVZL(gt1,gt2),cplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplcFdFucVWpL = 0._dp 
cplcFdFucVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFucVWpT(gt1,gt2,g2,ZDL,ZUL,cplcFdFucVWpL(gt1,gt2),cplcFdFucVWpR(gt1,gt2))

 End Do 
End Do 


cplcFvFvVZL = 0._dp 
cplcFvFvVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFvFvVZT(gt1,gt2,g1,g2,TW,cplcFvFvVZL(gt1,gt2),cplcFvFvVZR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Fd_decays_3B
 
Subroutine CouplingsFor_Fre_decays_3B(m_in,i1,MAhinput,MAh2input,MFdinput,            & 
& MFd2input,MFeinput,MFe2input,MFreinput,MFre2input,MFuinput,MFu2input,MFvinput,         & 
& MFv2input,Mhhinput,Mhh2input,MHpinput,MHp2input,Mssinput,Mss2input,MVWpinput,          & 
& MVWp2input,MVZinput,MVZ2input,TWinput,ZDRinput,ZERinput,ZURinput,ZDLinput,             & 
& ZELinput,ZULinput,UVinput,ZWinput,ZZinput,g1input,g2input,g3input,LSinput,             & 
& LSHinput,Laminput,Yuinput,Ysinput,Ydinput,Yeinput,MFSinput,MS2input,Muinput,           & 
& vinput,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,Ysinput(3),MS2input,vinput

Complex(dp),Intent(in) :: LSinput,LSHinput,Laminput,Yuinput(3,3),Ydinput(3,3),Yeinput(3,3),MFSinput,Muinput

Real(dp),Intent(in) :: MAhinput,MAh2input,MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),MFreinput,       & 
& MFre2input,MFuinput(3),MFu2input(3),MFvinput(3),MFv2input(3),Mhhinput,Mhh2input,       & 
& MHpinput,MHp2input,Mssinput,Mss2input,MVWpinput,MVWp2input,MVZinput,MVZ2input,         & 
& TWinput,ZZinput(2,2)

Complex(dp),Intent(in) :: ZDRinput(3,3),ZERinput(3,3),ZURinput(3,3),ZDLinput(3,3),ZELinput(3,3),ZULinput(3,3),  & 
& UVinput(3,3),ZWinput(2,2)

Real(dp) :: g1,g2,g3,Ys(3),MS2,v

Complex(dp) :: LS,LSH,Lam,Yu(3,3),Yd(3,3),Ye(3,3),MFS,Mu

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh,MAh2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFre,MFre2,MFu(3),MFu2(3),MFv(3),              & 
& MFv2(3),Mhh,Mhh2,MHp,MHp2,Mss,Mss2,MVWp,MVWp2,MVZ,MVZ2,TW,ZZ(2,2)

Complex(dp) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),UV(3,3),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Fre_3B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
LS = LSinput 
LSH = LSHinput 
Lam = Laminput 
Yu = Yuinput 
Ys = Ysinput 
Yd = Ydinput 
Ye = Yeinput 
MFS = MFSinput 
MS2 = MS2input 
Mu = Muinput 
v = vinput 
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(g1,g2,g3,LS,LSH,Lam,Yu,Ys,Yd,Ye,MFS,MS2,Mu,v,              & 
& (/ ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,MFu,MFu2,MFv,MFv2,              & 
& Mhh,Mhh2,MHp,MHp2,Mss,Mss2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,             & 
& UV,ZW,ZZ,v,g1,g2,g3,LS,LSH,Lam,Yu,Ys,Yd,Ye,MFS,MS2,Mu,.True.,kont)

! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UV = UVinput 
ZW = ZWinput 
ZZ = ZZinput 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFre = MFreinput 
MFre2 = MFre2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHp = MHpinput 
MHp2 = MHp2input 
Mss = Mssinput 
Mss2 = Mss2input 
MVWp = MVWpinput 
MVWp2 = MVWp2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
End if 
Iname = Iname - 1 
 
End subroutine CouplingsFor_Fre_decays_3B
 
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

If (YukawaScheme.Eq.1) Then ! CKM into Yu
 If (TransposedYukawa) Then ! check, if superpotential is Yu Hu u q  or Yu Hu q u
   Yu= Matmul(Transpose(CKM),Transpose(Yu))
 Else 
   Yu=Transpose(Matmul(Transpose(CKM),Transpose(Yu)))
 End if 

Else ! CKM into Yd 
 
 If (TransposedYukawa) Then ! 
  Yd= Matmul(Conjg(CKM),Transpose(Yd))
 Else 
  Yd=Transpose(Matmul(Conjg(CKM),Transpose(Yd)))
 End if 

End if ! Yukawa scheme
End If ! Generatoin mixing


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

If (YukawaScheme.Eq.1) Then ! CKM into Yu
 If (TransposedYukawa) Then ! check, if superpotential is Yu Hu u q  or Yu Hu q u
   Yu= Matmul(Transpose(CKM),Transpose(Yu))
 Else 
   Yu=Transpose(Matmul(Transpose(CKM),Transpose(Yu)))
 End if 

Else ! CKM into Yd 
 
 If (TransposedYukawa) Then ! 
  Yd= Matmul(Conjg(CKM),Transpose(Yd))
 Else 
  Yd=Transpose(Matmul(Conjg(CKM),Transpose(Yd)))
 End if 

End if ! Yukawa scheme
End If ! Generation mixing



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
End Module CouplingsForDecays_SimplifiedDMSSSFDM

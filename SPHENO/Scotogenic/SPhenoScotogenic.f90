! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.5.8 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 11:44 on 28.11.2015   
! ----------------------------------------------------------------------  
 
 
Program SPhenoScotogenic 
 
Use Control
Use InputOutput_Scotogenic
Use LoopFunctions
Use RunSM_Scotogenic
Use LowEnergy_Scotogenic
Use FlavorKit_LFV_Scotogenic
Use FlavorKit_QFV_Scotogenic
Use FlavorKit_Observables_Scotogenic
Use Mathematics
Use Model_Data_Scotogenic
Use Tadpoles_Scotogenic 
 Use HiggsCS_Scotogenic
Use LoopMasses_Scotogenic
 
Use BranchingRatios_Scotogenic
 
Implicit None
 
Real(dp) :: epsI=0.00001_dp, deltaM = 0.000001_dp 
Real(dp) :: mGut = -1._dp, ratioWoM = 0._dp
Integer :: kont 
 
Integer,Parameter :: p_max=100
Real(dp) :: Ecms(p_max),Pm(p_max),Pp(p_max), dt, tz, Qin, gSM(11) 
Real(dp) :: vev, sinw2, f_GMSB
Complex(dp) :: YdSM(3,3), YuSM(3,3), YeSM(3,3)
Real(dp) :: vSM, g1SM, g2SM, g3SM
Logical :: ISR(p_max)=.False.
Logical :: CalcTBD
Real(dp) :: ae,amu,atau,EDMe,EDMmu,EDMtau,dRho,BrBsGamma,ratioBsGamma,BrDmunu,ratioDmunu,         & 
& BrDsmunu,ratioDsmunu,BrDstaunu,ratioDstaunu,BrBmunu,ratioBmunu,BrBtaunu,               & 
& ratioBtaunu,BrKmunu,ratioKmunu,RK,RKSM,muEgamma,tauEgamma,tauMuGamma,CRmuEAl,          & 
& CRmuETi,CRmuESr,CRmuESb,CRmuEAu,CRmuEPb,BRmuTo3e,BRtauTo3e,BRtauTo3mu,BRtauToemumu,    & 
& BRtauTomuee,BRtauToemumu2,BRtauTomuee2,BrZtoMuE,BrZtoTauE,BrZtoTauMu,BrhtoMuE,         & 
& BrhtoTauE,BrhtoTauMu,DeltaMBs,ratioDeltaMBs,DeltaMBq,ratioDeltaMBq,BrTautoEPi,         & 
& BrTautoEEta,BrTautoEEtap,BrTautoMuPi,BrTautoMuEta,BrTautoMuEtap,BrB0dEE,               & 
& ratioB0dEE,BrB0sEE,ratioB0sEE,BrB0dMuMu,ratioB0dMuMu,BrB0sMuMu,ratioB0sMuMu,           & 
& BrB0dTauTau,ratioB0dTauTau,BrB0sTauTau,ratioB0sTauTau,BrBtoSEE,ratioBtoSEE,            & 
& BrBtoSMuMu,ratioBtoSMuMu,BrBtoKmumu,ratioBtoKmumu,BrBtoSnunu,ratioBtoSnunu,            & 
& BrBtoDnunu,ratioBtoDnunu,BrKptoPipnunu,ratioKptoPipnunu,BrKltoPinunu,ratioKltoPinunu,  & 
& DelMK,ratioDelMK,epsK,ratioepsK

ae = 0._dp 
amu = 0._dp 
atau = 0._dp 
EDMe = 0._dp 
EDMmu = 0._dp 
EDMtau = 0._dp 
dRho = 0._dp 
BrBsGamma = 0._dp 
ratioBsGamma = 0._dp 
BrDmunu = 0._dp 
ratioDmunu = 0._dp 
BrDsmunu = 0._dp 
ratioDsmunu = 0._dp 
BrDstaunu = 0._dp 
ratioDstaunu = 0._dp 
BrBmunu = 0._dp 
ratioBmunu = 0._dp 
BrBtaunu = 0._dp 
ratioBtaunu = 0._dp 
BrKmunu = 0._dp 
ratioKmunu = 0._dp 
RK = 0._dp 
RKSM = 0._dp 
muEgamma = 0._dp 
tauEgamma = 0._dp 
tauMuGamma = 0._dp 
CRmuEAl = 0._dp 
CRmuETi = 0._dp 
CRmuESr = 0._dp 
CRmuESb = 0._dp 
CRmuEAu = 0._dp 
CRmuEPb = 0._dp 
BRmuTo3e = 0._dp 
BRtauTo3e = 0._dp 
BRtauTo3mu = 0._dp 
BRtauToemumu = 0._dp 
BRtauTomuee = 0._dp 
BRtauToemumu2 = 0._dp 
BRtauTomuee2 = 0._dp 
BrZtoMuE = 0._dp 
BrZtoTauE = 0._dp 
BrZtoTauMu = 0._dp 
BrhtoMuE = 0._dp 
BrhtoTauE = 0._dp 
BrhtoTauMu = 0._dp 
DeltaMBs = 0._dp 
ratioDeltaMBs = 0._dp 
DeltaMBq = 0._dp 
ratioDeltaMBq = 0._dp 
BrTautoEPi = 0._dp 
BrTautoEEta = 0._dp 
BrTautoEEtap = 0._dp 
BrTautoMuPi = 0._dp 
BrTautoMuEta = 0._dp 
BrTautoMuEtap = 0._dp 
BrB0dEE = 0._dp 
ratioB0dEE = 0._dp 
BrB0sEE = 0._dp 
ratioB0sEE = 0._dp 
BrB0dMuMu = 0._dp 
ratioB0dMuMu = 0._dp 
BrB0sMuMu = 0._dp 
ratioB0sMuMu = 0._dp 
BrB0dTauTau = 0._dp 
ratioB0dTauTau = 0._dp 
BrB0sTauTau = 0._dp 
ratioB0sTauTau = 0._dp 
BrBtoSEE = 0._dp 
ratioBtoSEE = 0._dp 
BrBtoSMuMu = 0._dp 
ratioBtoSMuMu = 0._dp 
BrBtoKmumu = 0._dp 
ratioBtoKmumu = 0._dp 
BrBtoSnunu = 0._dp 
ratioBtoSnunu = 0._dp 
BrBtoDnunu = 0._dp 
ratioBtoDnunu = 0._dp 
BrKptoPipnunu = 0._dp 
ratioKptoPipnunu = 0._dp 
BrKltoPinunu = 0._dp 
ratioKltoPinunu = 0._dp 
DelMK = 0._dp 
ratioDelMK = 0._dp 
epsK = 0._dp 
ratioepsK = 0._dp 
Call get_command_argument(1,inputFileName)
If (len_trim(inputFileName)==0) Then
  inputFileName="LesHouches.in.Scotogenic"
Else
  inputFileName=trim(inputFileName)
End if
Call get_command_argument(2,outputFileName)
If (len_trim(outputFileName)==0) Then
  outputFileName="SPheno.spc.Scotogenic"
Else
  outputFileName=trim(outputFileName)
End if 
g1SM = 0._dp 
g2SM = 0._dp 
g3SM = 0._dp 
YdSM = 0._dp 
YeSM = 0._dp 
YuSM = 0._dp 
vSM = 0._dp 
Call Set_All_Parameters_0() 
 
kont = 0 
delta_Mass = 0.0001_dp 
CalcTBD = .false. 
Call ReadingData(kont) 
 
! Setting values 
 v = vIN 
 g1 = g1IN 
 g2 = g2IN 
 g3 = g3IN 
 lam1 = lam1IN 
 lam2 = lam2IN 
 lam4 = lam4IN 
 lam3 = lam3IN 
 lam5 = lam5IN 
 Yn = YnIN 
 Yu = YuIN 
 Yd = YdIN 
 Ye = YeIN 
 Mn = MnIN 
 mH2 = mH2IN 
 mEt2 = mEt2IN 
 v = vSM
Ye = YeSM
Yd = YdSM
Yu = YuSM
g1 = g1SM
g2 = g2SM
g3 = g3SM
lam1 = lambda1Input
lam2 = lambda2Input
lam3 = lambda3Input
lam4 = lambda4Input
lam5 = lambda5Input
mEt2 = mEt2Input
Yn = YnIN
Mn = MnIN

 
 ! Setting VEVs used for low energy constraints 
 vMZ = v 
 Qin=sqrt(getRenormalizationScale()) 
Call RunSMohdm(Qin,deltaM,g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,vSM) 

 ! Setting Boundary conditions 
 v = vSM
Ye = YeSM
Yd = YdSM
Yu = YuSM
g1 = g1SM
g2 = g2SM
g3 = g3SM
lam1 = lambda1Input
lam2 = lambda2Input
lam3 = lambda3Input
lam4 = lambda4Input
lam5 = lambda5Input
mEt2 = mEt2Input
Yn = YnIN
Mn = MnIN
Call SolveTadpoleEquations(g1,g2,g3,lam1,lam2,lam4,lam3,lam5,Yn,Yu,Yd,Ye,             & 
& Mn,mH2,mEt2,v,(/ ZeroC, ZeroC /))

Call OneLoopMasses(MAh,MAh2,MChi,MChi2,MetI,MetI2,Metp,Metp2,MetR,MetR2,              & 
& MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,             & 
& TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZW,ZX,ZZ,v,g1,g2,g3,lam1,lam2,lam4,lam3,lam5,            & 
& Yn,Yu,Yd,Ye,Mn,mH2,mEt2,kont)


 If (SignOfMassChanged) Then  
 If (.Not.IgnoreNegativeMasses) Then 
  Write(*,*) " Stopping calculation because of negative mass squared." 
  Call TerminateProgram 
 Else 
  SignOfMassChanged= .False. 
  kont=0  
 End If 
End If 
If (SignOfMuChanged) Then 
 If (.Not.IgnoreMuSignFlip) Then 
  Write(*,*) " Stopping calculation because of negative mass squared in tadpoles." 
  Call TerminateProgram 
 Else 
  SignOfMuChanged= .False. 
  kont=0 
 End If 
End If 

! Save correct Higgs masses for calculation of L -> 3 L' 
MhhL = Mhh
Mhh2L = MhhL**2 
MAhL = MAh
MAh2L = MAhL**2 
 
TW = ACos(Abs(ZZ(1,1)))
If ((L_BR).And.(kont.Eq.0)) Then 
 Call CalculateBR(CalcTBD,ratioWoM,epsI,deltaM,kont,MAh,MAh2,MChi,MChi2,               & 
& MetI,MetI2,Metp,Metp2,MetR,MetR2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,              & 
& Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZW,ZX,ZZ,              & 
& v,g1,g2,g3,lam1,lam2,lam4,lam3,lam5,Yn,Yu,Yd,Ye,Mn,mH2,mEt2,gPFu,gTFu,BRFu,            & 
& gPFe,gTFe,BRFe,gPFd,gTFd,BRFd,gPFv,gTFv,BRFv,gPVZ,gTVZ,BRVZ,gPVWp,gTVWp,               & 
& BRVWp,gPhh,gThh,BRhh,gPetR,gTetR,BRetR,gPetI,gTetI,BRetI,gPetp,gTetp,BRetp,            & 
& gPChi,gTChi,BRChi)

End If 
 
 If (CalculateLowEnergy) then 
Call CalculateLowEnergyConstraints(g1,g2,g3,lam1,lam2,lam4,lam3,lam5,Yn,              & 
& Yu,Yd,Ye,Mn,mH2,mEt2,v,ae,amu,atau,EDMe,EDMmu,EDMtau,dRho,BrBsGamma,ratioBsGamma,      & 
& BrDmunu,ratioDmunu,BrDsmunu,ratioDsmunu,BrDstaunu,ratioDstaunu,BrBmunu,ratioBmunu,     & 
& BrBtaunu,ratioBtaunu,BrKmunu,ratioKmunu,RK,RKSM,muEgamma,tauEgamma,tauMuGamma,         & 
& CRmuEAl,CRmuETi,CRmuESr,CRmuESb,CRmuEAu,CRmuEPb,BRmuTo3e,BRtauTo3e,BRtauTo3mu,         & 
& BRtauToemumu,BRtauTomuee,BRtauToemumu2,BRtauTomuee2,BrZtoMuE,BrZtoTauE,BrZtoTauMu,     & 
& BrhtoMuE,BrhtoTauE,BrhtoTauMu,DeltaMBs,ratioDeltaMBs,DeltaMBq,ratioDeltaMBq,           & 
& BrTautoEPi,BrTautoEEta,BrTautoEEtap,BrTautoMuPi,BrTautoMuEta,BrTautoMuEtap,            & 
& BrB0dEE,ratioB0dEE,BrB0sEE,ratioB0sEE,BrB0dMuMu,ratioB0dMuMu,BrB0sMuMu,ratioB0sMuMu,   & 
& BrB0dTauTau,ratioB0dTauTau,BrB0sTauTau,ratioB0sTauTau,BrBtoSEE,ratioBtoSEE,            & 
& BrBtoSMuMu,ratioBtoSMuMu,BrBtoKmumu,ratioBtoKmumu,BrBtoSnunu,ratioBtoSnunu,            & 
& BrBtoDnunu,ratioBtoDnunu,BrKptoPipnunu,ratioKptoPipnunu,BrKltoPinunu,ratioKltoPinunu,  & 
& DelMK,ratioDelMK,epsK,ratioepsK)

MVZ = mz 
MVZ2 = mz2 
MVWp = mW 
MVWp2 = mW2 
If (WriteParametersAtQ) Then 
Call TreeMasses(MAh,MAh2,MChi,MChi2,MetI,MetI2,Metp,Metp2,MetR,MetR2,MFd,             & 
& MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,              & 
& ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZW,ZX,ZZ,v,g1,g2,g3,lam1,lam2,lam4,lam3,lam5,               & 
& Yn,Yu,Yd,Ye,Mn,mH2,mEt2,GenerationMixing,kont)

End If 
 
MFv = nuMasses  
UV = nuMixing  
End if 
 
If ((FoundIterativeSolution).or.(WriteOutputForNonConvergence)) Then 
Write(*,*) "Writing output files" 
Call LesHouches_Out(67,11,kont,MGUT,ae,amu,atau,EDMe,EDMmu,EDMtau,dRho,               & 
& BrBsGamma,ratioBsGamma,BrDmunu,ratioDmunu,BrDsmunu,ratioDsmunu,BrDstaunu,              & 
& ratioDstaunu,BrBmunu,ratioBmunu,BrBtaunu,ratioBtaunu,BrKmunu,ratioKmunu,               & 
& RK,RKSM,muEgamma,tauEgamma,tauMuGamma,CRmuEAl,CRmuETi,CRmuESr,CRmuESb,CRmuEAu,         & 
& CRmuEPb,BRmuTo3e,BRtauTo3e,BRtauTo3mu,BRtauToemumu,BRtauTomuee,BRtauToemumu2,          & 
& BRtauTomuee2,BrZtoMuE,BrZtoTauE,BrZtoTauMu,BrhtoMuE,BrhtoTauE,BrhtoTauMu,              & 
& DeltaMBs,ratioDeltaMBs,DeltaMBq,ratioDeltaMBq,BrTautoEPi,BrTautoEEta,BrTautoEEtap,     & 
& BrTautoMuPi,BrTautoMuEta,BrTautoMuEtap,BrB0dEE,ratioB0dEE,BrB0sEE,ratioB0sEE,          & 
& BrB0dMuMu,ratioB0dMuMu,BrB0sMuMu,ratioB0sMuMu,BrB0dTauTau,ratioB0dTauTau,              & 
& BrB0sTauTau,ratioB0sTauTau,BrBtoSEE,ratioBtoSEE,BrBtoSMuMu,ratioBtoSMuMu,              & 
& BrBtoKmumu,ratioBtoKmumu,BrBtoSnunu,ratioBtoSnunu,BrBtoDnunu,ratioBtoDnunu,            & 
& BrKptoPipnunu,ratioKptoPipnunu,BrKltoPinunu,ratioKltoPinunu,DelMK,ratioDelMK,          & 
& epsK,ratioepsK,GenerationMixing)

End if 
Write(*,*) "Finished!" 
Contains 
 
Subroutine ReadingData(kont)
Implicit None
Integer,Intent(out)::kont
Logical::file_exists
kont=-123456
Inquire(file=inputFileName,exist=file_exists)
If (file_exists) Then
kont=1
Call LesHouches_Input(kont,Ecms,Pm,Pp,ISR,F_GMSB)
LesHouches_Format= .True.
Else
Write(*,*)&
& "File ",inputFileName," does not exist"
Call TerminateProgram
End If
End Subroutine ReadingData

 
Subroutine CalculateLowEnergyConstraints(g1input,g2input,g3input,lam1input,           & 
& lam2input,lam4input,lam3input,lam5input,Yninput,Yuinput,Ydinput,Yeinput,               & 
& Mninput,mH2input,mEt2input,vinput,ae,amu,atau,EDMe,EDMmu,EDMtau,dRho,BrBsGamma,        & 
& ratioBsGamma,BrDmunu,ratioDmunu,BrDsmunu,ratioDsmunu,BrDstaunu,ratioDstaunu,           & 
& BrBmunu,ratioBmunu,BrBtaunu,ratioBtaunu,BrKmunu,ratioKmunu,RK,RKSM,muEgamma,           & 
& tauEgamma,tauMuGamma,CRmuEAl,CRmuETi,CRmuESr,CRmuESb,CRmuEAu,CRmuEPb,BRmuTo3e,         & 
& BRtauTo3e,BRtauTo3mu,BRtauToemumu,BRtauTomuee,BRtauToemumu2,BRtauTomuee2,              & 
& BrZtoMuE,BrZtoTauE,BrZtoTauMu,BrhtoMuE,BrhtoTauE,BrhtoTauMu,DeltaMBs,ratioDeltaMBs,    & 
& DeltaMBq,ratioDeltaMBq,BrTautoEPi,BrTautoEEta,BrTautoEEtap,BrTautoMuPi,BrTautoMuEta,   & 
& BrTautoMuEtap,BrB0dEE,ratioB0dEE,BrB0sEE,ratioB0sEE,BrB0dMuMu,ratioB0dMuMu,            & 
& BrB0sMuMu,ratioB0sMuMu,BrB0dTauTau,ratioB0dTauTau,BrB0sTauTau,ratioB0sTauTau,          & 
& BrBtoSEE,ratioBtoSEE,BrBtoSMuMu,ratioBtoSMuMu,BrBtoKmumu,ratioBtoKmumu,BrBtoSnunu,     & 
& ratioBtoSnunu,BrBtoDnunu,ratioBtoDnunu,BrKptoPipnunu,ratioKptoPipnunu,BrKltoPinunu,    & 
& ratioKltoPinunu,DelMK,ratioDelMK,epsK,ratioepsK)

Real(dp),Intent(inout) :: g1input,g2input,g3input,lam5input,vinput

Complex(dp),Intent(inout) :: lam1input,lam2input,lam4input,lam3input,Yninput(3,3),Yuinput(3,3),Ydinput(3,3),       & 
& Yeinput(3,3),Mninput(3,3),mH2input,mEt2input

Real(dp) :: MAh,MAh2,MChi(3),MChi2(3),MetI,MetI2,Metp,Metp2,MetR,MetR2,MFd(3),MFd2(3),            & 
& MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(3),MFv2(3),Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,             & 
& MVZ,MVZ2,TW,ZZ(2,2)

Complex(dp) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),UV(3,3),ZW(2,2),ZX(3,3)

Real(dp) :: g1,g2,g3,lam5,v

Complex(dp) :: lam1,lam2,lam4,lam3,Yn(3,3),Yu(3,3),Yd(3,3),Ye(3,3),Mn(3,3),mH2,mEt2

Complex(dp) :: cplAhAhcVWpVWp,cplAhAhhh,cplAhAhVZVZ,cplAhcHpVWp,cplAhetIetR,cplAhhhVZ,               & 
& cplAhHpcVWp,cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),cplcFdFdhhL(3,3),cplcFdFdhhR(3,3),       & 
& cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFdFdVZL(3,3),  & 
& cplcFdFdVZR(3,3),cplcFdFucHpL(3,3),cplcFdFucHpR(3,3),cplcFdFucVWpL(3,3),               & 
& cplcFdFucVWpR(3,3),cplcFeChicetpL(3,3),cplcFeChicetpR(3,3),cplcFeFeAhL(3,3),           & 
& cplcFeFeAhR(3,3),cplcFeFehhL(3,3),cplcFeFehhR(3,3),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),  & 
& cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFvcHpL(3,3),cplcFeFvcHpR(3,3),cplcFeFvcVWpL(3,3),& 
& cplcFeFvcVWpR(3,3),cplcFuFdHpL(3,3),cplcFuFdHpR(3,3),cplcFuFdVWpL(3,3),cplcFuFdVWpR(3,3),& 
& cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),cplcFuFuhhL(3,3),cplcFuFuhhR(3,3),cplcFuFuVGL(3,3),  & 
& cplcFuFuVGR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),  & 
& cplcgAgWpcVWp,cplcgWCgAcVWp,cplcgWCgWCVZ,cplcgWCgZcVWp,cplcgWpgWpVZ,cplcgZgWpcVWp,     & 
& cplChiFeetpL(3,3),cplChiFeetpR(3,3),cplChiFvetIL(3,3),cplChiFvetIR(3,3),               & 
& cplChiFvetRL(3,3),cplChiFvetRR(3,3),cplcHpVPVWp,cplcHpVWpVZ,cplcVWpcVWpVWpVWp1,        & 
& cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,cplcVWpVPVPVWp3, & 
& cplcVWpVPVWp,cplcVWpVWpVZ,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,             & 
& cpletIcetpVWp,cpletIetIcVWpVWp,cpletIetIhh,cpletIetIVZVZ,cpletIetpcHp,cpletIetpcVWp,   & 
& cpletIetRVZ,cpletIHpcetp,cpletpcetpcVWpVWp,cpletpcetpVP,cpletpcetpVZ,cpletpcetpVZVZ,   & 
& cpletpetRcHp,cpletpetRcVWp,cpletphhcetp,cpletRcetpVWp,cpletRetRcVWpVWp,cpletRetRhh,    & 
& cpletRetRVZVZ,cpletRHpcetp,cplFvFeHpL(3,3),cplFvFeHpR(3,3),cplFvFeVWpL(3,3),           & 
& cplFvFeVWpR(3,3),cplFvFvVZL(3,3),cplFvFvVZR(3,3),cplhhcHpVWp,cplhhcVWpVWp,             & 
& cplhhhhcVWpVWp,cplhhhhhh,cplhhhhVZVZ,cplhhHpcHp,cplhhHpcVWp,cplhhVZVZ,cplHpcHpcVWpVWp, & 
& cplHpcHpVP,cplHpcHpVZ,cplHpcHpVZVZ,cplHpcVWpVP,cplHpcVWpVZ,cplVGVGVG

Real(dp),Intent(out) :: ae,amu,atau,EDMe,EDMmu,EDMtau,dRho,BrBsGamma,ratioBsGamma,BrDmunu,ratioDmunu,         & 
& BrDsmunu,ratioDsmunu,BrDstaunu,ratioDstaunu,BrBmunu,ratioBmunu,BrBtaunu,               & 
& ratioBtaunu,BrKmunu,ratioKmunu,RK,RKSM,muEgamma,tauEgamma,tauMuGamma,CRmuEAl,          & 
& CRmuETi,CRmuESr,CRmuESb,CRmuEAu,CRmuEPb,BRmuTo3e,BRtauTo3e,BRtauTo3mu,BRtauToemumu,    & 
& BRtauTomuee,BRtauToemumu2,BRtauTomuee2,BrZtoMuE,BrZtoTauE,BrZtoTauMu,BrhtoMuE,         & 
& BrhtoTauE,BrhtoTauMu,DeltaMBs,ratioDeltaMBs,DeltaMBq,ratioDeltaMBq,BrTautoEPi,         & 
& BrTautoEEta,BrTautoEEtap,BrTautoMuPi,BrTautoMuEta,BrTautoMuEtap,BrB0dEE,               & 
& ratioB0dEE,BrB0sEE,ratioB0sEE,BrB0dMuMu,ratioB0dMuMu,BrB0sMuMu,ratioB0sMuMu,           & 
& BrB0dTauTau,ratioB0dTauTau,BrB0sTauTau,ratioB0sTauTau,BrBtoSEE,ratioBtoSEE,            & 
& BrBtoSMuMu,ratioBtoSMuMu,BrBtoKmumu,ratioBtoKmumu,BrBtoSnunu,ratioBtoSnunu,            & 
& BrBtoDnunu,ratioBtoDnunu,BrKptoPipnunu,ratioKptoPipnunu,BrKltoPinunu,ratioKltoPinunu,  & 
& DelMK,ratioDelMK,epsK,ratioepsK

Complex(dp) :: c7,c7p,c8,c8p 
Real(dp) :: ResultMuE(6), ResultTauMeson(3), ResultTemp(99) 
Complex(dp), Dimension(3,3) :: Yu_save, Yd_save, Ye_save, CKMsave 
Real(dp) ::Qin,vev2,sinw2, mzsave, scalein, scale_save, gSM(11)  
Integer :: i1, i2, i3, gt1, gt2, gt3, gt4 
Integer :: IndexArray4(99,4), IndexArray3(99,3), IndexArray2(99,2)   
Complex(dp) :: BOllddSLL(3,3,3,3),BOllddSRR(3,3,3,3),BOllddSRL(3,3,3,3),BOllddSLR(3,3,3,3),          & 
& BOllddVRR(3,3,3,3),BOllddVLL(3,3,3,3),BOllddVRL(3,3,3,3),BOllddVLR(3,3,3,3),           & 
& BOllddTLL(3,3,3,3),BOllddTLR(3,3,3,3),BOllddTRL(3,3,3,3),BOllddTRR(3,3,3,3),           & 
& PSOllddSLL(3,3,3,3),PSOllddSRR(3,3,3,3),PSOllddSRL(3,3,3,3),PSOllddSLR(3,3,3,3),       & 
& PSOllddVRR(3,3,3,3),PSOllddVLL(3,3,3,3),PSOllddVRL(3,3,3,3),PSOllddVLR(3,3,3,3),       & 
& PSOllddTLL(3,3,3,3),PSOllddTLR(3,3,3,3),PSOllddTRL(3,3,3,3),PSOllddTRR(3,3,3,3),       & 
& PVOllddSLL(3,3,3,3),PVOllddSRR(3,3,3,3),PVOllddSRL(3,3,3,3),PVOllddSLR(3,3,3,3),       & 
& PVOllddVRR(3,3,3,3),PVOllddVLL(3,3,3,3),PVOllddVRL(3,3,3,3),PVOllddVLR(3,3,3,3),       & 
& PVOllddTLL(3,3,3,3),PVOllddTLR(3,3,3,3),PVOllddTRL(3,3,3,3),PVOllddTRR(3,3,3,3),       & 
& TSOllddSLL(3,3,3,3),TSOllddSRR(3,3,3,3),TSOllddSRL(3,3,3,3),TSOllddSLR(3,3,3,3),       & 
& TSOllddVRR(3,3,3,3),TSOllddVLL(3,3,3,3),TSOllddVRL(3,3,3,3),TSOllddVLR(3,3,3,3),       & 
& TSOllddTLL(3,3,3,3),TSOllddTLR(3,3,3,3),TSOllddTRL(3,3,3,3),TSOllddTRR(3,3,3,3),       & 
& TVOllddSLL(3,3,3,3),TVOllddSRR(3,3,3,3),TVOllddSRL(3,3,3,3),TVOllddSLR(3,3,3,3),       & 
& TVOllddVRR(3,3,3,3),TVOllddVLL(3,3,3,3),TVOllddVRL(3,3,3,3),TVOllddVLR(3,3,3,3),       & 
& TVOllddTLL(3,3,3,3),TVOllddTLR(3,3,3,3),TVOllddTRL(3,3,3,3),TVOllddTRR(3,3,3,3),       & 
& BOlluuSLL(3,3,3,3),BOlluuSRR(3,3,3,3),BOlluuSRL(3,3,3,3),BOlluuSLR(3,3,3,3),           & 
& BOlluuVRR(3,3,3,3),BOlluuVLL(3,3,3,3),BOlluuVRL(3,3,3,3),BOlluuVLR(3,3,3,3),           & 
& BOlluuTLL(3,3,3,3),BOlluuTLR(3,3,3,3),BOlluuTRL(3,3,3,3),BOlluuTRR(3,3,3,3),           & 
& PSOlluuSLL(3,3,3,3),PSOlluuSRR(3,3,3,3),PSOlluuSRL(3,3,3,3),PSOlluuSLR(3,3,3,3),       & 
& PSOlluuVRR(3,3,3,3),PSOlluuVLL(3,3,3,3),PSOlluuVRL(3,3,3,3),PSOlluuVLR(3,3,3,3),       & 
& PSOlluuTLL(3,3,3,3),PSOlluuTLR(3,3,3,3),PSOlluuTRL(3,3,3,3),PSOlluuTRR(3,3,3,3),       & 
& PVOlluuSLL(3,3,3,3),PVOlluuSRR(3,3,3,3),PVOlluuSRL(3,3,3,3),PVOlluuSLR(3,3,3,3),       & 
& PVOlluuVRR(3,3,3,3),PVOlluuVLL(3,3,3,3),PVOlluuVRL(3,3,3,3),PVOlluuVLR(3,3,3,3),       & 
& PVOlluuTLL(3,3,3,3),PVOlluuTLR(3,3,3,3),PVOlluuTRL(3,3,3,3),PVOlluuTRR(3,3,3,3),       & 
& TSOlluuSLL(3,3,3,3),TSOlluuSRR(3,3,3,3),TSOlluuSRL(3,3,3,3),TSOlluuSLR(3,3,3,3),       & 
& TSOlluuVRR(3,3,3,3),TSOlluuVLL(3,3,3,3),TSOlluuVRL(3,3,3,3),TSOlluuVLR(3,3,3,3),       & 
& TSOlluuTLL(3,3,3,3),TSOlluuTLR(3,3,3,3),TSOlluuTRL(3,3,3,3),TSOlluuTRR(3,3,3,3),       & 
& TVOlluuSLL(3,3,3,3),TVOlluuSRR(3,3,3,3),TVOlluuSRL(3,3,3,3),TVOlluuSLR(3,3,3,3),       & 
& TVOlluuVRR(3,3,3,3),TVOlluuVLL(3,3,3,3),TVOlluuVRL(3,3,3,3),TVOlluuVLR(3,3,3,3),       & 
& TVOlluuTLL(3,3,3,3),TVOlluuTLR(3,3,3,3),TVOlluuTRL(3,3,3,3),TVOlluuTRR(3,3,3,3),       & 
& BO4lSLL(3,3,3,3),BO4lSRR(3,3,3,3),BO4lSRL(3,3,3,3),BO4lSLR(3,3,3,3),BO4lVRR(3,3,3,3),  & 
& BO4lVLL(3,3,3,3),BO4lVRL(3,3,3,3),BO4lVLR(3,3,3,3),BO4lTLL(3,3,3,3),BO4lTLR(3,3,3,3),  & 
& BO4lTRL(3,3,3,3),BO4lTRR(3,3,3,3),PSO4lSLL(3,3,3,3),PSO4lSRR(3,3,3,3),PSO4lSRL(3,3,3,3),& 
& PSO4lSLR(3,3,3,3),PSO4lVRR(3,3,3,3),PSO4lVLL(3,3,3,3),PSO4lVRL(3,3,3,3),               & 
& PSO4lVLR(3,3,3,3),PSO4lTLL(3,3,3,3),PSO4lTLR(3,3,3,3),PSO4lTRL(3,3,3,3),               & 
& PSO4lTRR(3,3,3,3),PVO4lSLL(3,3,3,3),PVO4lSRR(3,3,3,3),PVO4lSRL(3,3,3,3),               & 
& PVO4lSLR(3,3,3,3),PVO4lVRR(3,3,3,3),PVO4lVLL(3,3,3,3),PVO4lVRL(3,3,3,3)

Complex(dp) :: PVO4lVLR(3,3,3,3),PVO4lTLL(3,3,3,3),PVO4lTLR(3,3,3,3),PVO4lTRL(3,3,3,3),               & 
& PVO4lTRR(3,3,3,3),TSO4lSLL(3,3,3,3),TSO4lSRR(3,3,3,3),TSO4lSRL(3,3,3,3),               & 
& TSO4lSLR(3,3,3,3),TSO4lVRR(3,3,3,3),TSO4lVLL(3,3,3,3),TSO4lVRL(3,3,3,3),               & 
& TSO4lVLR(3,3,3,3),TSO4lTLL(3,3,3,3),TSO4lTLR(3,3,3,3),TSO4lTRL(3,3,3,3),               & 
& TSO4lTRR(3,3,3,3),TVO4lSLL(3,3,3,3),TVO4lSRR(3,3,3,3),TVO4lSRL(3,3,3,3),               & 
& TVO4lSLR(3,3,3,3),TVO4lVRR(3,3,3,3),TVO4lVLL(3,3,3,3),TVO4lVRL(3,3,3,3),               & 
& TVO4lVLR(3,3,3,3),TVO4lTLL(3,3,3,3),TVO4lTLR(3,3,3,3),TVO4lTRL(3,3,3,3),               & 
& TVO4lTRR(3,3,3,3),BO4lSLLcross(3,3,3,3),BO4lSRRcross(3,3,3,3),BO4lSRLcross(3,3,3,3),   & 
& BO4lSLRcross(3,3,3,3),BO4lVRRcross(3,3,3,3),BO4lVLLcross(3,3,3,3),BO4lVRLcross(3,3,3,3),& 
& BO4lVLRcross(3,3,3,3),BO4lTLLcross(3,3,3,3),BO4lTLRcross(3,3,3,3),BO4lTRLcross(3,3,3,3),& 
& BO4lTRRcross(3,3,3,3),PSO4lSLLcross(3,3,3,3),PSO4lSRRcross(3,3,3,3),PSO4lSRLcross(3,3,3,3),& 
& PSO4lSLRcross(3,3,3,3),PSO4lVRRcross(3,3,3,3),PSO4lVLLcross(3,3,3,3),PSO4lVRLcross(3,3,3,3),& 
& PSO4lVLRcross(3,3,3,3),PSO4lTLLcross(3,3,3,3),PSO4lTLRcross(3,3,3,3),PSO4lTRLcross(3,3,3,3),& 
& PSO4lTRRcross(3,3,3,3),PVO4lSLLcross(3,3,3,3),PVO4lSRRcross(3,3,3,3),PVO4lSRLcross(3,3,3,3),& 
& PVO4lSLRcross(3,3,3,3),PVO4lVRRcross(3,3,3,3),PVO4lVLLcross(3,3,3,3),PVO4lVRLcross(3,3,3,3),& 
& PVO4lVLRcross(3,3,3,3),PVO4lTLLcross(3,3,3,3),PVO4lTLRcross(3,3,3,3),PVO4lTRLcross(3,3,3,3),& 
& PVO4lTRRcross(3,3,3,3),TSO4lSLLcross(3,3,3,3),TSO4lSRRcross(3,3,3,3),TSO4lSRLcross(3,3,3,3),& 
& TSO4lSLRcross(3,3,3,3),TSO4lVRRcross(3,3,3,3),TSO4lVLLcross(3,3,3,3),TSO4lVRLcross(3,3,3,3),& 
& TSO4lVLRcross(3,3,3,3),TSO4lTLLcross(3,3,3,3),TSO4lTLRcross(3,3,3,3),TSO4lTRLcross(3,3,3,3),& 
& TSO4lTRRcross(3,3,3,3),TVO4lSLLcross(3,3,3,3),TVO4lSRRcross(3,3,3,3),TVO4lSRLcross(3,3,3,3),& 
& TVO4lSLRcross(3,3,3,3),TVO4lVRRcross(3,3,3,3),TVO4lVLLcross(3,3,3,3),TVO4lVRLcross(3,3,3,3),& 
& TVO4lVLRcross(3,3,3,3),TVO4lTLLcross(3,3,3,3),TVO4lTLRcross(3,3,3,3),TVO4lTRLcross(3,3,3,3),& 
& TVO4lTRRcross(3,3,3,3),OA2lSL(3,3),OA2lSR(3,3),OA1L(3,3),OA1R(3,3),OH2lSL(3,3,1),      & 
& OH2lSR(3,3,1),OZ2lSL(3,3),OZ2lSR(3,3),OZ2lVL(3,3),OZ2lVR(3,3)

Complex(dp) :: BOddllSLLSM(3,3,3,3),BOddllSRRSM(3,3,3,3),BOddllSRLSM(3,3,3,3),BOddllSLRSM(3,3,3,3),  & 
& BOddllVRRSM(3,3,3,3),BOddllVLLSM(3,3,3,3),BOddllVRLSM(3,3,3,3),BOddllVLRSM(3,3,3,3),   & 
& BOddllTLLSM(3,3,3,3),BOddllTLRSM(3,3,3,3),BOddllTRLSM(3,3,3,3),BOddllTRRSM(3,3,3,3),   & 
& PSOddllSLLSM(3,3,3,3),PSOddllSRRSM(3,3,3,3),PSOddllSRLSM(3,3,3,3),PSOddllSLRSM(3,3,3,3),& 
& PSOddllVRRSM(3,3,3,3),PSOddllVLLSM(3,3,3,3),PSOddllVRLSM(3,3,3,3),PSOddllVLRSM(3,3,3,3),& 
& PSOddllTLLSM(3,3,3,3),PSOddllTLRSM(3,3,3,3),PSOddllTRLSM(3,3,3,3),PSOddllTRRSM(3,3,3,3),& 
& PVOddllSLLSM(3,3,3,3),PVOddllSRRSM(3,3,3,3),PVOddllSRLSM(3,3,3,3),PVOddllSLRSM(3,3,3,3),& 
& PVOddllVRRSM(3,3,3,3),PVOddllVLLSM(3,3,3,3),PVOddllVRLSM(3,3,3,3),PVOddllVLRSM(3,3,3,3),& 
& PVOddllTLLSM(3,3,3,3),PVOddllTLRSM(3,3,3,3),PVOddllTRLSM(3,3,3,3),PVOddllTRRSM(3,3,3,3),& 
& TSOddllSLLSM(3,3,3,3),TSOddllSRRSM(3,3,3,3),TSOddllSRLSM(3,3,3,3),TSOddllSLRSM(3,3,3,3),& 
& TSOddllVRRSM(3,3,3,3),TSOddllVLLSM(3,3,3,3),TSOddllVRLSM(3,3,3,3),TSOddllVLRSM(3,3,3,3),& 
& TSOddllTLLSM(3,3,3,3),TSOddllTLRSM(3,3,3,3),TSOddllTRLSM(3,3,3,3),TSOddllTRRSM(3,3,3,3),& 
& TVOddllSLLSM(3,3,3,3),TVOddllSRRSM(3,3,3,3),TVOddllSRLSM(3,3,3,3),TVOddllSLRSM(3,3,3,3),& 
& TVOddllVRRSM(3,3,3,3),TVOddllVLLSM(3,3,3,3),TVOddllVRLSM(3,3,3,3),TVOddllVLRSM(3,3,3,3),& 
& TVOddllTLLSM(3,3,3,3),TVOddllTLRSM(3,3,3,3),TVOddllTRLSM(3,3,3,3),TVOddllTRRSM(3,3,3,3),& 
& BOddvvVRRSM(3,3,3,3),BOddvvVLLSM(3,3,3,3),BOddvvVRLSM(3,3,3,3),BOddvvVLRSM(3,3,3,3),   & 
& PSOddvvVRRSM(3,3,3,3),PSOddvvVLLSM(3,3,3,3),PSOddvvVRLSM(3,3,3,3),PSOddvvVLRSM(3,3,3,3),& 
& PVOddvvVRRSM(3,3,3,3),PVOddvvVLLSM(3,3,3,3),PVOddvvVRLSM(3,3,3,3),PVOddvvVLRSM(3,3,3,3),& 
& TSOddvvVRRSM(3,3,3,3),TSOddvvVLLSM(3,3,3,3),TSOddvvVRLSM(3,3,3,3),TSOddvvVLRSM(3,3,3,3),& 
& TVOddvvVRRSM(3,3,3,3),TVOddvvVLLSM(3,3,3,3),TVOddvvVRLSM(3,3,3,3),TVOddvvVLRSM(3,3,3,3),& 
& BO4dSLLSM(3,3,3,3),BO4dSRRSM(3,3,3,3),BO4dSRLSM(3,3,3,3),BO4dSLRSM(3,3,3,3),           & 
& BO4dVRRSM(3,3,3,3),BO4dVLLSM(3,3,3,3),BO4dVRLSM(3,3,3,3),BO4dVLRSM(3,3,3,3),           & 
& BO4dTLLSM(3,3,3,3),BO4dTLRSM(3,3,3,3),BO4dTRLSM(3,3,3,3),BO4dTRRSM(3,3,3,3),           & 
& TSO4dSLLSM(3,3,3,3),TSO4dSRRSM(3,3,3,3),TSO4dSRLSM(3,3,3,3),TSO4dSLRSM(3,3,3,3),       & 
& TSO4dVRRSM(3,3,3,3),TSO4dVLLSM(3,3,3,3),TSO4dVRLSM(3,3,3,3),TSO4dVLRSM(3,3,3,3),       & 
& TSO4dTLLSM(3,3,3,3),TSO4dTLRSM(3,3,3,3),TSO4dTRLSM(3,3,3,3),TSO4dTRRSM(3,3,3,3),       & 
& TVO4dSLLSM(3,3,3,3),TVO4dSRRSM(3,3,3,3),TVO4dSRLSM(3,3,3,3),TVO4dSLRSM(3,3,3,3),       & 
& TVO4dVRRSM(3,3,3,3),TVO4dVLLSM(3,3,3,3),TVO4dVRLSM(3,3,3,3),TVO4dVLRSM(3,3,3,3),       & 
& TVO4dTLLSM(3,3,3,3),TVO4dTLRSM(3,3,3,3),TVO4dTRLSM(3,3,3,3),TVO4dTRRSM(3,3,3,3),       & 
& OAh2qSLSM(3,3,1),OAh2qSRSM(3,3,1),TSOdulvSLLSM(3,3,3,3),TSOdulvSRRSM(3,3,3,3),         & 
& TSOdulvSRLSM(3,3,3,3),TSOdulvSLRSM(3,3,3,3),TSOdulvVRRSM(3,3,3,3),TSOdulvVLLSM(3,3,3,3),& 
& TSOdulvVRLSM(3,3,3,3),TSOdulvVLRSM(3,3,3,3),TVOdulvSLLSM(3,3,3,3),TVOdulvSRRSM(3,3,3,3),& 
& TVOdulvSRLSM(3,3,3,3),TVOdulvSLRSM(3,3,3,3),TVOdulvVRRSM(3,3,3,3),TVOdulvVLLSM(3,3,3,3),& 
& TVOdulvVRLSM(3,3,3,3),TVOdulvVLRSM(3,3,3,3),OA2qSLSM(3,3),OA2qSRSM(3,3),               & 
& OA2qVLSM(3,3),OA2qVRSM(3,3),OG2qSLSM(3,3),OG2qSRSM(3,3),OH2qSLSM(3,3,1),               & 
& OH2qSRSM(3,3,1)

Complex(dp) :: BOddllSLL(3,3,3,3),BOddllSRR(3,3,3,3),BOddllSRL(3,3,3,3),BOddllSLR(3,3,3,3),          & 
& BOddllVRR(3,3,3,3),BOddllVLL(3,3,3,3),BOddllVRL(3,3,3,3),BOddllVLR(3,3,3,3),           & 
& BOddllTLL(3,3,3,3),BOddllTLR(3,3,3,3),BOddllTRL(3,3,3,3),BOddllTRR(3,3,3,3),           & 
& PSOddllSLL(3,3,3,3),PSOddllSRR(3,3,3,3),PSOddllSRL(3,3,3,3),PSOddllSLR(3,3,3,3),       & 
& PSOddllVRR(3,3,3,3),PSOddllVLL(3,3,3,3),PSOddllVRL(3,3,3,3),PSOddllVLR(3,3,3,3),       & 
& PSOddllTLL(3,3,3,3),PSOddllTLR(3,3,3,3),PSOddllTRL(3,3,3,3),PSOddllTRR(3,3,3,3),       & 
& PVOddllSLL(3,3,3,3),PVOddllSRR(3,3,3,3),PVOddllSRL(3,3,3,3),PVOddllSLR(3,3,3,3),       & 
& PVOddllVRR(3,3,3,3),PVOddllVLL(3,3,3,3),PVOddllVRL(3,3,3,3),PVOddllVLR(3,3,3,3),       & 
& PVOddllTLL(3,3,3,3),PVOddllTLR(3,3,3,3),PVOddllTRL(3,3,3,3),PVOddllTRR(3,3,3,3),       & 
& TSOddllSLL(3,3,3,3),TSOddllSRR(3,3,3,3),TSOddllSRL(3,3,3,3),TSOddllSLR(3,3,3,3),       & 
& TSOddllVRR(3,3,3,3),TSOddllVLL(3,3,3,3),TSOddllVRL(3,3,3,3),TSOddllVLR(3,3,3,3),       & 
& TSOddllTLL(3,3,3,3),TSOddllTLR(3,3,3,3),TSOddllTRL(3,3,3,3),TSOddllTRR(3,3,3,3),       & 
& TVOddllSLL(3,3,3,3),TVOddllSRR(3,3,3,3),TVOddllSRL(3,3,3,3),TVOddllSLR(3,3,3,3),       & 
& TVOddllVRR(3,3,3,3),TVOddllVLL(3,3,3,3),TVOddllVRL(3,3,3,3),TVOddllVLR(3,3,3,3),       & 
& TVOddllTLL(3,3,3,3),TVOddllTLR(3,3,3,3),TVOddllTRL(3,3,3,3),TVOddllTRR(3,3,3,3),       & 
& BOddvvVRR(3,3,3,3),BOddvvVLL(3,3,3,3),BOddvvVRL(3,3,3,3),BOddvvVLR(3,3,3,3),           & 
& PSOddvvVRR(3,3,3,3),PSOddvvVLL(3,3,3,3),PSOddvvVRL(3,3,3,3),PSOddvvVLR(3,3,3,3),       & 
& PVOddvvVRR(3,3,3,3),PVOddvvVLL(3,3,3,3),PVOddvvVRL(3,3,3,3),PVOddvvVLR(3,3,3,3),       & 
& TSOddvvVRR(3,3,3,3),TSOddvvVLL(3,3,3,3),TSOddvvVRL(3,3,3,3),TSOddvvVLR(3,3,3,3),       & 
& TVOddvvVRR(3,3,3,3),TVOddvvVLL(3,3,3,3),TVOddvvVRL(3,3,3,3),TVOddvvVLR(3,3,3,3),       & 
& BO4dSLL(3,3,3,3),BO4dSRR(3,3,3,3),BO4dSRL(3,3,3,3),BO4dSLR(3,3,3,3),BO4dVRR(3,3,3,3),  & 
& BO4dVLL(3,3,3,3),BO4dVRL(3,3,3,3),BO4dVLR(3,3,3,3),BO4dTLL(3,3,3,3),BO4dTLR(3,3,3,3),  & 
& BO4dTRL(3,3,3,3),BO4dTRR(3,3,3,3),TSO4dSLL(3,3,3,3),TSO4dSRR(3,3,3,3),TSO4dSRL(3,3,3,3),& 
& TSO4dSLR(3,3,3,3),TSO4dVRR(3,3,3,3),TSO4dVLL(3,3,3,3),TSO4dVRL(3,3,3,3),               & 
& TSO4dVLR(3,3,3,3),TSO4dTLL(3,3,3,3),TSO4dTLR(3,3,3,3),TSO4dTRL(3,3,3,3),               & 
& TSO4dTRR(3,3,3,3),TVO4dSLL(3,3,3,3),TVO4dSRR(3,3,3,3),TVO4dSRL(3,3,3,3),               & 
& TVO4dSLR(3,3,3,3),TVO4dVRR(3,3,3,3),TVO4dVLL(3,3,3,3),TVO4dVRL(3,3,3,3),               & 
& TVO4dVLR(3,3,3,3),TVO4dTLL(3,3,3,3),TVO4dTLR(3,3,3,3),TVO4dTRL(3,3,3,3),               & 
& TVO4dTRR(3,3,3,3),OAh2qSL(3,3,1),OAh2qSR(3,3,1),TSOdulvSLL(3,3,3,3),TSOdulvSRR(3,3,3,3),& 
& TSOdulvSRL(3,3,3,3),TSOdulvSLR(3,3,3,3),TSOdulvVRR(3,3,3,3),TSOdulvVLL(3,3,3,3),       & 
& TSOdulvVRL(3,3,3,3),TSOdulvVLR(3,3,3,3),TVOdulvSLL(3,3,3,3),TVOdulvSRR(3,3,3,3),       & 
& TVOdulvSRL(3,3,3,3),TVOdulvSLR(3,3,3,3),TVOdulvVRR(3,3,3,3),TVOdulvVLL(3,3,3,3),       & 
& TVOdulvVRL(3,3,3,3),TVOdulvVLR(3,3,3,3),OA2qSL(3,3),OA2qSR(3,3),OA2qVL(3,3),           & 
& OA2qVR(3,3),OG2qSL(3,3),OG2qSR(3,3),OH2qSL(3,3,1),OH2qSR(3,3,1)

Complex(dp) :: OllddSLL(3,3,3,3),OllddSRR(3,3,3,3),OllddSRL(3,3,3,3),OllddSLR(3,3,3,3),              & 
& OllddVRR(3,3,3,3),OllddVLL(3,3,3,3),OllddVRL(3,3,3,3),OllddVLR(3,3,3,3),               & 
& OllddTLL(3,3,3,3),OllddTLR(3,3,3,3),OllddTRL(3,3,3,3),OllddTRR(3,3,3,3),               & 
& OlluuSLL(3,3,3,3),OlluuSRR(3,3,3,3),OlluuSRL(3,3,3,3),OlluuSLR(3,3,3,3),               & 
& OlluuVRR(3,3,3,3),OlluuVLL(3,3,3,3),OlluuVRL(3,3,3,3),OlluuVLR(3,3,3,3),               & 
& OlluuTLL(3,3,3,3),OlluuTLR(3,3,3,3),OlluuTRL(3,3,3,3),OlluuTRR(3,3,3,3),               & 
& O4lSLL(3,3,3,3),O4lSRR(3,3,3,3),O4lSRL(3,3,3,3),O4lSLR(3,3,3,3),O4lVRR(3,3,3,3),       & 
& O4lVLL(3,3,3,3),O4lVRL(3,3,3,3),O4lVLR(3,3,3,3),O4lTLL(3,3,3,3),O4lTLR(3,3,3,3),       & 
& O4lTRL(3,3,3,3),O4lTRR(3,3,3,3),O4lSLLcross(3,3,3,3),O4lSRRcross(3,3,3,3),             & 
& O4lSRLcross(3,3,3,3),O4lSLRcross(3,3,3,3),O4lVRRcross(3,3,3,3),O4lVLLcross(3,3,3,3),   & 
& O4lVRLcross(3,3,3,3),O4lVLRcross(3,3,3,3),O4lTLLcross(3,3,3,3),O4lTLRcross(3,3,3,3),   & 
& O4lTRLcross(3,3,3,3),O4lTRRcross(3,3,3,3),K1L(3,3),K1R(3,3),K2L(3,3),K2R(3,3)

Complex(dp) :: OddllSLLSM(3,3,3,3),OddllSRRSM(3,3,3,3),OddllSRLSM(3,3,3,3),OddllSLRSM(3,3,3,3),      & 
& OddllVRRSM(3,3,3,3),OddllVLLSM(3,3,3,3),OddllVRLSM(3,3,3,3),OddllVLRSM(3,3,3,3),       & 
& OddllTLLSM(3,3,3,3),OddllTLRSM(3,3,3,3),OddllTRLSM(3,3,3,3),OddllTRRSM(3,3,3,3),       & 
& OddvvVRRSM(3,3,3,3),OddvvVLLSM(3,3,3,3),OddvvVRLSM(3,3,3,3),OddvvVLRSM(3,3,3,3),       & 
& O4dSLLSM(3,3,3,3),O4dSRRSM(3,3,3,3),O4dSRLSM(3,3,3,3),O4dSLRSM(3,3,3,3),               & 
& O4dVRRSM(3,3,3,3),O4dVLLSM(3,3,3,3),O4dVRLSM(3,3,3,3),O4dVLRSM(3,3,3,3),               & 
& O4dTLLSM(3,3,3,3),O4dTLRSM(3,3,3,3),O4dTRLSM(3,3,3,3),O4dTRRSM(3,3,3,3),               & 
& OdulvSLLSM(3,3,3,3),OdulvSRRSM(3,3,3,3),OdulvSRLSM(3,3,3,3),OdulvSLRSM(3,3,3,3),       & 
& OdulvVRRSM(3,3,3,3),OdulvVLLSM(3,3,3,3),OdulvVRLSM(3,3,3,3),OdulvVLRSM(3,3,3,3),       & 
& CC8SM(3,3),CC8pSM(3,3),CC7SM(3,3),CC7pSM(3,3)

Complex(dp) :: OddllSLL(3,3,3,3),OddllSRR(3,3,3,3),OddllSRL(3,3,3,3),OddllSLR(3,3,3,3),              & 
& OddllVRR(3,3,3,3),OddllVLL(3,3,3,3),OddllVRL(3,3,3,3),OddllVLR(3,3,3,3),               & 
& OddllTLL(3,3,3,3),OddllTLR(3,3,3,3),OddllTRL(3,3,3,3),OddllTRR(3,3,3,3),               & 
& OddvvVRR(3,3,3,3),OddvvVLL(3,3,3,3),OddvvVRL(3,3,3,3),OddvvVLR(3,3,3,3),               & 
& O4dSLL(3,3,3,3),O4dSRR(3,3,3,3),O4dSRL(3,3,3,3),O4dSLR(3,3,3,3),O4dVRR(3,3,3,3),       & 
& O4dVLL(3,3,3,3),O4dVRL(3,3,3,3),O4dVLR(3,3,3,3),O4dTLL(3,3,3,3),O4dTLR(3,3,3,3),       & 
& O4dTRL(3,3,3,3),O4dTRR(3,3,3,3),OdulvSLL(3,3,3,3),OdulvSRR(3,3,3,3),OdulvSRL(3,3,3,3), & 
& OdulvSLR(3,3,3,3),OdulvVRR(3,3,3,3),OdulvVLL(3,3,3,3),OdulvVRL(3,3,3,3),               & 
& OdulvVLR(3,3,3,3),CC8(3,3),CC8p(3,3),CC7(3,3),CC7p(3,3)

Write(*,*) "Calculating low energy constraints" 


!-------------------------------------
! running to 160 GeV for b -> so gamma
!-------------------------------------

Qin=sqrt(getRenormalizationScale()) 
scale_save = Qin 
Call RunSM_and_SUSY_RGEs(160._dp,g1input,g2input,g3input,lam1input,lam2input,         & 
& lam4input,lam3input,lam5input,Yninput,Yuinput,Ydinput,Yeinput,Mninput,mH2input,        & 
& mEt2input,vinput,g1,g2,g3,lam1,lam2,lam4,lam3,lam5,Yn,Yu,Yd,Ye,Mn,mH2,mEt2,            & 
& v,CKM_160,sinW2_160,Alpha_160,AlphaS_160)

Call SolveTadpoleEquations(g1,g2,g3,lam1,lam2,lam4,lam3,lam5,Yn,Yu,Yd,Ye,             & 
& Mn,mH2,mEt2,v,(/ ZeroC, ZeroC /))

Call TreeMasses(MAh,MAh2,MChi,MChi2,MetI,MetI2,Metp,Metp2,MetR,MetR2,MFd,             & 
& MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,              & 
& ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZW,ZX,ZZ,v,g1,g2,g3,lam1,lam2,lam4,lam3,lam5,               & 
& Yn,Yu,Yd,Ye,Mn,mH2,mEt2,GenerationMixing,kont)

 mf_d_160 = MFd(1:3) 
 mf_d2_160 = MFd(1:3)**2 
 mf_u_160 = MFu(1:3) 
 mf_u2_160 = MFu(1:3)**2 
 mf_l_160 = MFe(1:3) 
 mf_l2_160 = MFe(1:3)**2 
If (WriteParametersAtQ) Then 
! Write running parameters at Q=160 GeV in output file 
g1input = g1
g2input = g2
g3input = g3
lam1input = lam1
lam2input = lam2
lam4input = lam4
lam3input = lam3
lam5input = lam5
Yninput = Yn
Yuinput = Yu
Ydinput = Yd
Yeinput = Ye
Mninput = Mn
mH2input = mH2
mEt2input = mEt2
vinput = v
End If 
 
Mhh= MhhL 
Mhh2 = Mhh2L 
MAh= MAhL 
MAh2 = MAh2L 
MAh=MVZ
MAh2=MVZ2
MHp=MVWp
MHp2=MVWp2
Call AllCouplings(lam1,v,lam5,lam4,lam3,g1,g2,TW,g3,Yd,ZDL,ZDR,Ye,ZEL,ZER,            & 
& Yu,ZUL,ZUR,Yn,ZX,UV,cplAhAhhh,cplAhetIetR,cpletIetIhh,cpletIetpcHp,cpletIHpcetp,       & 
& cpletpetRcHp,cpletphhcetp,cpletRetRhh,cpletRHpcetp,cplhhhhhh,cplhhHpcHp,               & 
& cplAhhhVZ,cplAhHpcVWp,cplAhcHpVWp,cpletIetpcVWp,cpletIetRVZ,cpletIcetpVWp,             & 
& cpletpetRcVWp,cpletpcetpVP,cpletpcetpVZ,cpletRcetpVWp,cplhhHpcVWp,cplhhcHpVWp,         & 
& cplHpcHpVP,cplHpcHpVZ,cplhhcVWpVWp,cplhhVZVZ,cplHpcVWpVP,cplHpcVWpVZ,cplcHpVPVWp,      & 
& cplcHpVWpVZ,cplVGVGVG,cplcVWpVPVWp,cplcVWpVWpVZ,cplcFdFdAhL,cplcFdFdAhR,               & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplChiFvetIL,cplChiFvetIR,             & 
& cplChiFeetpL,cplChiFeetpR,cplChiFvetRL,cplChiFvetRR,cplcFeChicetpL,cplcFeChicetpR,     & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHpL,cplcFuFdHpR,cplFvFeHpL,cplFvFeHpR,cplcFeFehhL,     & 
& cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFucHpL,cplcFdFucHpR,cplcFeFvcHpL,            & 
& cplcFeFvcHpR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFuFdVWpL,             & 
& cplcFuFdVWpR,cplcFdFdVZL,cplcFdFdVZR,cplFvFeVWpL,cplFvFeVWpR,cplcFeFeVPL,              & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,               & 
& cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcFdFucVWpL,cplcFdFucVWpR,cplFvFvVZL,            & 
& cplFvFvVZR,cplcFeFvcVWpL,cplcFeFvcVWpR)


 ! **** Box2d2L **** 
 
IndexArray4(1,:) = (/3,1,1,1/) 
IndexArray4(2,:) = (/3,1,2,2/) 
IndexArray4(3,:) = (/3,1,3,3/) 
IndexArray4(4,:) = (/3,2,1,1/) 
IndexArray4(5,:) = (/3,2,2,2/) 
IndexArray4(6,:) = (/3,2,3,3/) 
Do i1=1,6 
gt1 = IndexArray4(i1,1) 
gt2 = IndexArray4(i1,2) 
gt3 = IndexArray4(i1,3) 
gt4 = IndexArray4(i1,4) 
Call CalculateBox2d2L(gt1,gt2,gt3,gt4,.False.,MAh,MAh2,MChi,MChi2,Metp,               & 
& Metp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,            & 
& MVZ2,cplAhAhhh,cplAhcHpVWp,cplAhhhVZ,cplAhHpcVWp,cplcFdFdAhL,cplcFdFdAhR,              & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplcFeChicetpL,cplcFeChicetpR,   & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,               & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,         & 
& cplcFuFdHpL,cplcFuFdHpR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFuFuAhL,cplcFuFuAhR,             & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplChiFeetpL,cplChiFeetpR,cplcHpVPVWp,cplcHpVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,           & 
& cpletpcetpVP,cpletpcetpVZ,cpletphhcetp,cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,              & 
& cplFvFeVWpR,cplFvFvVZL,cplFvFvVZR,cplhhcHpVWp,cplhhcVWpVWp,cplhhhhhh,cplhhHpcHp,       & 
& cplhhHpcVWp,cplhhVZVZ,cplHpcHpVP,cplHpcHpVZ,cplHpcVWpVP,cplHpcVWpVZ,BOddllSLL(gt1,gt2,gt3,gt4)& 
& ,BOddllSRR(gt1,gt2,gt3,gt4),BOddllSRL(gt1,gt2,gt3,gt4),BOddllSLR(gt1,gt2,gt3,gt4)      & 
& ,BOddllVRR(gt1,gt2,gt3,gt4),BOddllVLL(gt1,gt2,gt3,gt4),BOddllVRL(gt1,gt2,gt3,gt4)      & 
& ,BOddllVLR(gt1,gt2,gt3,gt4),BOddllTLL(gt1,gt2,gt3,gt4),BOddllTLR(gt1,gt2,gt3,gt4)      & 
& ,BOddllTRL(gt1,gt2,gt3,gt4),BOddllTRR(gt1,gt2,gt3,gt4))

Call CalculateBox2d2L(gt1,gt2,gt3,gt4,.true.,MAh,MAh2,MChi,MChi2,Metp,Metp2,          & 
& MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,             & 
& cplAhAhhh,cplAhcHpVWp,cplAhhhVZ,cplAhHpcVWp,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,       & 
& cplcFdFdhhR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFucHpL,              & 
& cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplcFeChicetpL,cplcFeChicetpR,cplcFeFeAhL,    & 
& cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplcFuFdHpL,         & 
& cplcFuFdHpR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuhhL,             & 
& cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplChiFeetpL,              & 
& cplChiFeetpR,cplcHpVPVWp,cplcHpVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,cpletpcetpVP,           & 
& cpletpcetpVZ,cpletphhcetp,cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,cplFvFeVWpR,               & 
& cplFvFvVZL,cplFvFvVZR,cplhhcHpVWp,cplhhcVWpVWp,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,       & 
& cplhhVZVZ,cplHpcHpVP,cplHpcHpVZ,cplHpcVWpVP,cplHpcVWpVZ,BOddllSLLSM(gt1,gt2,gt3,gt4)   & 
& ,BOddllSRRSM(gt1,gt2,gt3,gt4),BOddllSRLSM(gt1,gt2,gt3,gt4),BOddllSLRSM(gt1,gt2,gt3,gt4)& 
& ,BOddllVRRSM(gt1,gt2,gt3,gt4),BOddllVLLSM(gt1,gt2,gt3,gt4),BOddllVRLSM(gt1,gt2,gt3,gt4)& 
& ,BOddllVLRSM(gt1,gt2,gt3,gt4),BOddllTLLSM(gt1,gt2,gt3,gt4),BOddllTLRSM(gt1,gt2,gt3,gt4)& 
& ,BOddllTRLSM(gt1,gt2,gt3,gt4),BOddllTRRSM(gt1,gt2,gt3,gt4))

End do 



 ! **** PengS2d2L **** 
 
IndexArray4(1,:) = (/3,1,1,1/) 
IndexArray4(2,:) = (/3,1,2,2/) 
IndexArray4(3,:) = (/3,1,3,3/) 
IndexArray4(4,:) = (/3,2,1,1/) 
IndexArray4(5,:) = (/3,2,2,2/) 
IndexArray4(6,:) = (/3,2,3,3/) 
Do i1=1,6 
gt1 = IndexArray4(i1,1) 
gt2 = IndexArray4(i1,2) 
gt3 = IndexArray4(i1,3) 
gt4 = IndexArray4(i1,4) 
Call CalculatePengS2d2L(gt1,gt2,gt3,gt4,.False.,MAh,MAh2,MChi,MChi2,Metp,             & 
& Metp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,            & 
& MVZ2,cplAhAhhh,cplAhcHpVWp,cplAhhhVZ,cplAhHpcVWp,cplcFdFdAhL,cplcFdFdAhR,              & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplcFeChicetpL,cplcFeChicetpR,   & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,               & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,         & 
& cplcFuFdHpL,cplcFuFdHpR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFuFuAhL,cplcFuFuAhR,             & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplChiFeetpL,cplChiFeetpR,cplcHpVPVWp,cplcHpVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,           & 
& cpletpcetpVP,cpletpcetpVZ,cpletphhcetp,cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,              & 
& cplFvFeVWpR,cplFvFvVZL,cplFvFvVZR,cplhhcHpVWp,cplhhcVWpVWp,cplhhhhhh,cplhhHpcHp,       & 
& cplhhHpcVWp,cplhhVZVZ,cplHpcHpVP,cplHpcHpVZ,cplHpcVWpVP,cplHpcVWpVZ,PSOddllSLL(gt1,gt2,gt3,gt4)& 
& ,PSOddllSRR(gt1,gt2,gt3,gt4),PSOddllSRL(gt1,gt2,gt3,gt4),PSOddllSLR(gt1,gt2,gt3,gt4)   & 
& ,PSOddllVRR(gt1,gt2,gt3,gt4),PSOddllVLL(gt1,gt2,gt3,gt4),PSOddllVRL(gt1,gt2,gt3,gt4)   & 
& ,PSOddllVLR(gt1,gt2,gt3,gt4),PSOddllTLL(gt1,gt2,gt3,gt4),PSOddllTLR(gt1,gt2,gt3,gt4)   & 
& ,PSOddllTRL(gt1,gt2,gt3,gt4),PSOddllTRR(gt1,gt2,gt3,gt4))

Call CalculatePengS2d2L(gt1,gt2,gt3,gt4,.true.,MAh,MAh2,MChi,MChi2,Metp,              & 
& Metp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,            & 
& MVZ2,cplAhAhhh,cplAhcHpVWp,cplAhhhVZ,cplAhHpcVWp,cplcFdFdAhL,cplcFdFdAhR,              & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplcFeChicetpL,cplcFeChicetpR,   & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,               & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,         & 
& cplcFuFdHpL,cplcFuFdHpR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFuFuAhL,cplcFuFuAhR,             & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplChiFeetpL,cplChiFeetpR,cplcHpVPVWp,cplcHpVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,           & 
& cpletpcetpVP,cpletpcetpVZ,cpletphhcetp,cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,              & 
& cplFvFeVWpR,cplFvFvVZL,cplFvFvVZR,cplhhcHpVWp,cplhhcVWpVWp,cplhhhhhh,cplhhHpcHp,       & 
& cplhhHpcVWp,cplhhVZVZ,cplHpcHpVP,cplHpcHpVZ,cplHpcVWpVP,cplHpcVWpVZ,PSOddllSLLSM(gt1,gt2,gt3,gt4)& 
& ,PSOddllSRRSM(gt1,gt2,gt3,gt4),PSOddllSRLSM(gt1,gt2,gt3,gt4),PSOddllSLRSM(gt1,gt2,gt3,gt4)& 
& ,PSOddllVRRSM(gt1,gt2,gt3,gt4),PSOddllVLLSM(gt1,gt2,gt3,gt4),PSOddllVRLSM(gt1,gt2,gt3,gt4)& 
& ,PSOddllVLRSM(gt1,gt2,gt3,gt4),PSOddllTLLSM(gt1,gt2,gt3,gt4),PSOddllTLRSM(gt1,gt2,gt3,gt4)& 
& ,PSOddllTRLSM(gt1,gt2,gt3,gt4),PSOddllTRRSM(gt1,gt2,gt3,gt4))

End do 



 ! **** PengV2d2L **** 
 
IndexArray4(1,:) = (/3,1,1,1/) 
IndexArray4(2,:) = (/3,1,2,2/) 
IndexArray4(3,:) = (/3,1,3,3/) 
IndexArray4(4,:) = (/3,2,1,1/) 
IndexArray4(5,:) = (/3,2,2,2/) 
IndexArray4(6,:) = (/3,2,3,3/) 
Do i1=1,6 
gt1 = IndexArray4(i1,1) 
gt2 = IndexArray4(i1,2) 
gt3 = IndexArray4(i1,3) 
gt4 = IndexArray4(i1,4) 
Call CalculatePengV2d2L(gt1,gt2,gt3,gt4,.False.,MAh,MAh2,MChi,MChi2,Metp,             & 
& Metp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,            & 
& MVZ2,cplAhAhhh,cplAhcHpVWp,cplAhhhVZ,cplAhHpcVWp,cplcFdFdAhL,cplcFdFdAhR,              & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplcFeChicetpL,cplcFeChicetpR,   & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,               & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,         & 
& cplcFuFdHpL,cplcFuFdHpR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFuFuAhL,cplcFuFuAhR,             & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplChiFeetpL,cplChiFeetpR,cplcHpVPVWp,cplcHpVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,           & 
& cpletpcetpVP,cpletpcetpVZ,cpletphhcetp,cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,              & 
& cplFvFeVWpR,cplFvFvVZL,cplFvFvVZR,cplhhcHpVWp,cplhhcVWpVWp,cplhhhhhh,cplhhHpcHp,       & 
& cplhhHpcVWp,cplhhVZVZ,cplHpcHpVP,cplHpcHpVZ,cplHpcVWpVP,cplHpcVWpVZ,PVOddllSLL(gt1,gt2,gt3,gt4)& 
& ,PVOddllSRR(gt1,gt2,gt3,gt4),PVOddllSRL(gt1,gt2,gt3,gt4),PVOddllSLR(gt1,gt2,gt3,gt4)   & 
& ,PVOddllVRR(gt1,gt2,gt3,gt4),PVOddllVLL(gt1,gt2,gt3,gt4),PVOddllVRL(gt1,gt2,gt3,gt4)   & 
& ,PVOddllVLR(gt1,gt2,gt3,gt4),PVOddllTLL(gt1,gt2,gt3,gt4),PVOddllTLR(gt1,gt2,gt3,gt4)   & 
& ,PVOddllTRL(gt1,gt2,gt3,gt4),PVOddllTRR(gt1,gt2,gt3,gt4))

Call CalculatePengV2d2L(gt1,gt2,gt3,gt4,.true.,MAh,MAh2,MChi,MChi2,Metp,              & 
& Metp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,            & 
& MVZ2,cplAhAhhh,cplAhcHpVWp,cplAhhhVZ,cplAhHpcVWp,cplcFdFdAhL,cplcFdFdAhR,              & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplcFeChicetpL,cplcFeChicetpR,   & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,               & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,         & 
& cplcFuFdHpL,cplcFuFdHpR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFuFuAhL,cplcFuFuAhR,             & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplChiFeetpL,cplChiFeetpR,cplcHpVPVWp,cplcHpVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,           & 
& cpletpcetpVP,cpletpcetpVZ,cpletphhcetp,cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,              & 
& cplFvFeVWpR,cplFvFvVZL,cplFvFvVZR,cplhhcHpVWp,cplhhcVWpVWp,cplhhhhhh,cplhhHpcHp,       & 
& cplhhHpcVWp,cplhhVZVZ,cplHpcHpVP,cplHpcHpVZ,cplHpcVWpVP,cplHpcVWpVZ,PVOddllSLLSM(gt1,gt2,gt3,gt4)& 
& ,PVOddllSRRSM(gt1,gt2,gt3,gt4),PVOddllSRLSM(gt1,gt2,gt3,gt4),PVOddllSLRSM(gt1,gt2,gt3,gt4)& 
& ,PVOddllVRRSM(gt1,gt2,gt3,gt4),PVOddllVLLSM(gt1,gt2,gt3,gt4),PVOddllVRLSM(gt1,gt2,gt3,gt4)& 
& ,PVOddllVLRSM(gt1,gt2,gt3,gt4),PVOddllTLLSM(gt1,gt2,gt3,gt4),PVOddllTLRSM(gt1,gt2,gt3,gt4)& 
& ,PVOddllTRLSM(gt1,gt2,gt3,gt4),PVOddllTRRSM(gt1,gt2,gt3,gt4))

End do 



 ! **** TreeS2d2L **** 
 
IndexArray4(1,:) = (/3,1,1,1/) 
IndexArray4(2,:) = (/3,1,2,2/) 
IndexArray4(3,:) = (/3,1,3,3/) 
IndexArray4(4,:) = (/3,2,1,1/) 
IndexArray4(5,:) = (/3,2,2,2/) 
IndexArray4(6,:) = (/3,2,3,3/) 
Do i1=1,6 
gt1 = IndexArray4(i1,1) 
gt2 = IndexArray4(i1,2) 
gt3 = IndexArray4(i1,3) 
gt4 = IndexArray4(i1,4) 
Call CalculateTreeS2d2L(gt1,gt2,gt3,gt4,.False.,MAh,MAh2,MChi,MChi2,Metp,             & 
& Metp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,            & 
& MVZ2,cplAhAhhh,cplAhcHpVWp,cplAhhhVZ,cplAhHpcVWp,cplcFdFdAhL,cplcFdFdAhR,              & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplcFeChicetpL,cplcFeChicetpR,   & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,               & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,         & 
& cplcFuFdHpL,cplcFuFdHpR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFuFuAhL,cplcFuFuAhR,             & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplChiFeetpL,cplChiFeetpR,cplcHpVPVWp,cplcHpVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,           & 
& cpletpcetpVP,cpletpcetpVZ,cpletphhcetp,cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,              & 
& cplFvFeVWpR,cplFvFvVZL,cplFvFvVZR,cplhhcHpVWp,cplhhcVWpVWp,cplhhhhhh,cplhhHpcHp,       & 
& cplhhHpcVWp,cplhhVZVZ,cplHpcHpVP,cplHpcHpVZ,cplHpcVWpVP,cplHpcVWpVZ,TSOddllSLL(gt1,gt2,gt3,gt4)& 
& ,TSOddllSRR(gt1,gt2,gt3,gt4),TSOddllSRL(gt1,gt2,gt3,gt4),TSOddllSLR(gt1,gt2,gt3,gt4)   & 
& ,TSOddllVRR(gt1,gt2,gt3,gt4),TSOddllVLL(gt1,gt2,gt3,gt4),TSOddllVRL(gt1,gt2,gt3,gt4)   & 
& ,TSOddllVLR(gt1,gt2,gt3,gt4),TSOddllTLL(gt1,gt2,gt3,gt4),TSOddllTLR(gt1,gt2,gt3,gt4)   & 
& ,TSOddllTRL(gt1,gt2,gt3,gt4),TSOddllTRR(gt1,gt2,gt3,gt4))

Call CalculateTreeS2d2L(gt1,gt2,gt3,gt4,.true.,MAh,MAh2,MChi,MChi2,Metp,              & 
& Metp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,            & 
& MVZ2,cplAhAhhh,cplAhcHpVWp,cplAhhhVZ,cplAhHpcVWp,cplcFdFdAhL,cplcFdFdAhR,              & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplcFeChicetpL,cplcFeChicetpR,   & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,               & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,         & 
& cplcFuFdHpL,cplcFuFdHpR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFuFuAhL,cplcFuFuAhR,             & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplChiFeetpL,cplChiFeetpR,cplcHpVPVWp,cplcHpVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,           & 
& cpletpcetpVP,cpletpcetpVZ,cpletphhcetp,cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,              & 
& cplFvFeVWpR,cplFvFvVZL,cplFvFvVZR,cplhhcHpVWp,cplhhcVWpVWp,cplhhhhhh,cplhhHpcHp,       & 
& cplhhHpcVWp,cplhhVZVZ,cplHpcHpVP,cplHpcHpVZ,cplHpcVWpVP,cplHpcVWpVZ,TSOddllSLLSM(gt1,gt2,gt3,gt4)& 
& ,TSOddllSRRSM(gt1,gt2,gt3,gt4),TSOddllSRLSM(gt1,gt2,gt3,gt4),TSOddllSLRSM(gt1,gt2,gt3,gt4)& 
& ,TSOddllVRRSM(gt1,gt2,gt3,gt4),TSOddllVLLSM(gt1,gt2,gt3,gt4),TSOddllVRLSM(gt1,gt2,gt3,gt4)& 
& ,TSOddllVLRSM(gt1,gt2,gt3,gt4),TSOddllTLLSM(gt1,gt2,gt3,gt4),TSOddllTLRSM(gt1,gt2,gt3,gt4)& 
& ,TSOddllTRLSM(gt1,gt2,gt3,gt4),TSOddllTRRSM(gt1,gt2,gt3,gt4))

End do 



 ! **** TreeV2d2L **** 
 
IndexArray4(1,:) = (/3,1,1,1/) 
IndexArray4(2,:) = (/3,1,2,2/) 
IndexArray4(3,:) = (/3,1,3,3/) 
IndexArray4(4,:) = (/3,2,1,1/) 
IndexArray4(5,:) = (/3,2,2,2/) 
IndexArray4(6,:) = (/3,2,3,3/) 
Do i1=1,6 
gt1 = IndexArray4(i1,1) 
gt2 = IndexArray4(i1,2) 
gt3 = IndexArray4(i1,3) 
gt4 = IndexArray4(i1,4) 
Call CalculateTreeV2d2L(gt1,gt2,gt3,gt4,.False.,MAh,MAh2,MChi,MChi2,Metp,             & 
& Metp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,            & 
& MVZ2,cplAhAhhh,cplAhcHpVWp,cplAhhhVZ,cplAhHpcVWp,cplcFdFdAhL,cplcFdFdAhR,              & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplcFeChicetpL,cplcFeChicetpR,   & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,               & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,         & 
& cplcFuFdHpL,cplcFuFdHpR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFuFuAhL,cplcFuFuAhR,             & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplChiFeetpL,cplChiFeetpR,cplcHpVPVWp,cplcHpVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,           & 
& cpletpcetpVP,cpletpcetpVZ,cpletphhcetp,cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,              & 
& cplFvFeVWpR,cplFvFvVZL,cplFvFvVZR,cplhhcHpVWp,cplhhcVWpVWp,cplhhhhhh,cplhhHpcHp,       & 
& cplhhHpcVWp,cplhhVZVZ,cplHpcHpVP,cplHpcHpVZ,cplHpcVWpVP,cplHpcVWpVZ,TVOddllSLL(gt1,gt2,gt3,gt4)& 
& ,TVOddllSRR(gt1,gt2,gt3,gt4),TVOddllSRL(gt1,gt2,gt3,gt4),TVOddllSLR(gt1,gt2,gt3,gt4)   & 
& ,TVOddllVRR(gt1,gt2,gt3,gt4),TVOddllVLL(gt1,gt2,gt3,gt4),TVOddllVRL(gt1,gt2,gt3,gt4)   & 
& ,TVOddllVLR(gt1,gt2,gt3,gt4),TVOddllTLL(gt1,gt2,gt3,gt4),TVOddllTLR(gt1,gt2,gt3,gt4)   & 
& ,TVOddllTRL(gt1,gt2,gt3,gt4),TVOddllTRR(gt1,gt2,gt3,gt4))

Call CalculateTreeV2d2L(gt1,gt2,gt3,gt4,.true.,MAh,MAh2,MChi,MChi2,Metp,              & 
& Metp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,            & 
& MVZ2,cplAhAhhh,cplAhcHpVWp,cplAhhhVZ,cplAhHpcVWp,cplcFdFdAhL,cplcFdFdAhR,              & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplcFeChicetpL,cplcFeChicetpR,   & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,               & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,         & 
& cplcFuFdHpL,cplcFuFdHpR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFuFuAhL,cplcFuFuAhR,             & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplChiFeetpL,cplChiFeetpR,cplcHpVPVWp,cplcHpVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,           & 
& cpletpcetpVP,cpletpcetpVZ,cpletphhcetp,cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,              & 
& cplFvFeVWpR,cplFvFvVZL,cplFvFvVZR,cplhhcHpVWp,cplhhcVWpVWp,cplhhhhhh,cplhhHpcHp,       & 
& cplhhHpcVWp,cplhhVZVZ,cplHpcHpVP,cplHpcHpVZ,cplHpcVWpVP,cplHpcVWpVZ,TVOddllSLLSM(gt1,gt2,gt3,gt4)& 
& ,TVOddllSRRSM(gt1,gt2,gt3,gt4),TVOddllSRLSM(gt1,gt2,gt3,gt4),TVOddllSLRSM(gt1,gt2,gt3,gt4)& 
& ,TVOddllVRRSM(gt1,gt2,gt3,gt4),TVOddllVLLSM(gt1,gt2,gt3,gt4),TVOddllVRLSM(gt1,gt2,gt3,gt4)& 
& ,TVOddllVLRSM(gt1,gt2,gt3,gt4),TVOddllTLLSM(gt1,gt2,gt3,gt4),TVOddllTLRSM(gt1,gt2,gt3,gt4)& 
& ,TVOddllTRLSM(gt1,gt2,gt3,gt4),TVOddllTRRSM(gt1,gt2,gt3,gt4))

End do 



 ! **** Box2d2nu **** 
 
IndexArray4(1,:) = (/2,1,1,1/) 
IndexArray4(2,:) = (/3,1,1,1/) 
IndexArray4(3,:) = (/3,2,1,1/) 
IndexArray4(4,:) = (/2,1,1,2/) 
IndexArray4(5,:) = (/3,1,1,2/) 
IndexArray4(6,:) = (/3,2,1,2/) 
IndexArray4(7,:) = (/2,1,1,3/) 
IndexArray4(8,:) = (/3,1,1,3/) 
IndexArray4(9,:) = (/3,2,1,3/) 
IndexArray4(10,:) = (/2,1,2,1/) 
IndexArray4(11,:) = (/3,1,2,1/) 
IndexArray4(12,:) = (/3,2,2,1/) 
IndexArray4(13,:) = (/2,1,2,2/) 
IndexArray4(14,:) = (/3,1,2,2/) 
IndexArray4(15,:) = (/3,2,2,2/) 
IndexArray4(16,:) = (/2,1,2,3/) 
IndexArray4(17,:) = (/3,1,2,3/) 
IndexArray4(18,:) = (/3,2,2,3/) 
IndexArray4(19,:) = (/2,1,3,1/) 
IndexArray4(20,:) = (/3,1,3,1/) 
IndexArray4(21,:) = (/3,2,3,1/) 
IndexArray4(22,:) = (/2,1,3,2/) 
IndexArray4(23,:) = (/3,1,3,2/) 
IndexArray4(24,:) = (/3,2,3,2/) 
IndexArray4(25,:) = (/2,1,3,3/) 
IndexArray4(26,:) = (/3,1,3,3/) 
IndexArray4(27,:) = (/3,2,3,3/) 
Do i1=1,27 
gt1 = IndexArray4(i1,1) 
gt2 = IndexArray4(i1,2) 
gt3 = IndexArray4(i1,3) 
gt4 = IndexArray4(i1,4) 
Call CalculateBox2d2nu(gt1,gt2,gt3,gt4,.False.,MAh,MAh2,MChi,MChi2,MetI,              & 
& MetI2,MetR,MetR2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,           & 
& MVWp2,MVZ,MVZ2,cplAhhhVZ,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,              & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,         & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,         & 
& cplcFuFdHpL,cplcFuFdHpR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFuFuVZL,cplcFuFuVZR,             & 
& cplChiFvetIL,cplChiFvetIR,cplChiFvetRL,cplChiFvetRR,cplcHpVWpVZ,cplcVWpVWpVZ,          & 
& cpletIetRVZ,cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,cplFvFeVWpR,cplFvFvVZL,cplFvFvVZR,       & 
& cplhhVZVZ,cplHpcHpVZ,cplHpcVWpVZ,BOddvvVRR(gt1,gt2,gt3,gt4),BOddvvVLL(gt1,gt2,gt3,gt4) & 
& ,BOddvvVRL(gt1,gt2,gt3,gt4),BOddvvVLR(gt1,gt2,gt3,gt4))

Call CalculateBox2d2nu(gt1,gt2,gt3,gt4,.true.,MAh,MAh2,MChi,MChi2,MetI,               & 
& MetI2,MetR,MetR2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,           & 
& MVWp2,MVZ,MVZ2,cplAhhhVZ,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,              & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,         & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,         & 
& cplcFuFdHpL,cplcFuFdHpR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFuFuVZL,cplcFuFuVZR,             & 
& cplChiFvetIL,cplChiFvetIR,cplChiFvetRL,cplChiFvetRR,cplcHpVWpVZ,cplcVWpVWpVZ,          & 
& cpletIetRVZ,cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,cplFvFeVWpR,cplFvFvVZL,cplFvFvVZR,       & 
& cplhhVZVZ,cplHpcHpVZ,cplHpcVWpVZ,BOddvvVRRSM(gt1,gt2,gt3,gt4),BOddvvVLLSM(gt1,gt2,gt3,gt4)& 
& ,BOddvvVRLSM(gt1,gt2,gt3,gt4),BOddvvVLRSM(gt1,gt2,gt3,gt4))

End do 



 ! **** PengS2d2nu **** 
 
IndexArray4(1,:) = (/2,1,1,1/) 
IndexArray4(2,:) = (/3,1,1,1/) 
IndexArray4(3,:) = (/3,2,1,1/) 
IndexArray4(4,:) = (/2,1,1,2/) 
IndexArray4(5,:) = (/3,1,1,2/) 
IndexArray4(6,:) = (/3,2,1,2/) 
IndexArray4(7,:) = (/2,1,1,3/) 
IndexArray4(8,:) = (/3,1,1,3/) 
IndexArray4(9,:) = (/3,2,1,3/) 
IndexArray4(10,:) = (/2,1,2,1/) 
IndexArray4(11,:) = (/3,1,2,1/) 
IndexArray4(12,:) = (/3,2,2,1/) 
IndexArray4(13,:) = (/2,1,2,2/) 
IndexArray4(14,:) = (/3,1,2,2/) 
IndexArray4(15,:) = (/3,2,2,2/) 
IndexArray4(16,:) = (/2,1,2,3/) 
IndexArray4(17,:) = (/3,1,2,3/) 
IndexArray4(18,:) = (/3,2,2,3/) 
IndexArray4(19,:) = (/2,1,3,1/) 
IndexArray4(20,:) = (/3,1,3,1/) 
IndexArray4(21,:) = (/3,2,3,1/) 
IndexArray4(22,:) = (/2,1,3,2/) 
IndexArray4(23,:) = (/3,1,3,2/) 
IndexArray4(24,:) = (/3,2,3,2/) 
IndexArray4(25,:) = (/2,1,3,3/) 
IndexArray4(26,:) = (/3,1,3,3/) 
IndexArray4(27,:) = (/3,2,3,3/) 
Do i1=1,27 
gt1 = IndexArray4(i1,1) 
gt2 = IndexArray4(i1,2) 
gt3 = IndexArray4(i1,3) 
gt4 = IndexArray4(i1,4) 
Call CalculatePengS2d2nu(gt1,gt2,gt3,gt4,.False.,MAh,MAh2,MChi,MChi2,MetI,            & 
& MetI2,MetR,MetR2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,           & 
& MVWp2,MVZ,MVZ2,cplAhhhVZ,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,              & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,         & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,         & 
& cplcFuFdHpL,cplcFuFdHpR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFuFuVZL,cplcFuFuVZR,             & 
& cplChiFvetIL,cplChiFvetIR,cplChiFvetRL,cplChiFvetRR,cplcHpVWpVZ,cplcVWpVWpVZ,          & 
& cpletIetRVZ,cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,cplFvFeVWpR,cplFvFvVZL,cplFvFvVZR,       & 
& cplhhVZVZ,cplHpcHpVZ,cplHpcVWpVZ,PSOddvvVRR(gt1,gt2,gt3,gt4),PSOddvvVLL(gt1,gt2,gt3,gt4)& 
& ,PSOddvvVRL(gt1,gt2,gt3,gt4),PSOddvvVLR(gt1,gt2,gt3,gt4))

Call CalculatePengS2d2nu(gt1,gt2,gt3,gt4,.true.,MAh,MAh2,MChi,MChi2,MetI,             & 
& MetI2,MetR,MetR2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,           & 
& MVWp2,MVZ,MVZ2,cplAhhhVZ,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,              & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,         & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,         & 
& cplcFuFdHpL,cplcFuFdHpR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFuFuVZL,cplcFuFuVZR,             & 
& cplChiFvetIL,cplChiFvetIR,cplChiFvetRL,cplChiFvetRR,cplcHpVWpVZ,cplcVWpVWpVZ,          & 
& cpletIetRVZ,cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,cplFvFeVWpR,cplFvFvVZL,cplFvFvVZR,       & 
& cplhhVZVZ,cplHpcHpVZ,cplHpcVWpVZ,PSOddvvVRRSM(gt1,gt2,gt3,gt4),PSOddvvVLLSM(gt1,gt2,gt3,gt4)& 
& ,PSOddvvVRLSM(gt1,gt2,gt3,gt4),PSOddvvVLRSM(gt1,gt2,gt3,gt4))

End do 



 ! **** PengV2d2nu **** 
 
IndexArray4(1,:) = (/2,1,1,1/) 
IndexArray4(2,:) = (/3,1,1,1/) 
IndexArray4(3,:) = (/3,2,1,1/) 
IndexArray4(4,:) = (/2,1,1,2/) 
IndexArray4(5,:) = (/3,1,1,2/) 
IndexArray4(6,:) = (/3,2,1,2/) 
IndexArray4(7,:) = (/2,1,1,3/) 
IndexArray4(8,:) = (/3,1,1,3/) 
IndexArray4(9,:) = (/3,2,1,3/) 
IndexArray4(10,:) = (/2,1,2,1/) 
IndexArray4(11,:) = (/3,1,2,1/) 
IndexArray4(12,:) = (/3,2,2,1/) 
IndexArray4(13,:) = (/2,1,2,2/) 
IndexArray4(14,:) = (/3,1,2,2/) 
IndexArray4(15,:) = (/3,2,2,2/) 
IndexArray4(16,:) = (/2,1,2,3/) 
IndexArray4(17,:) = (/3,1,2,3/) 
IndexArray4(18,:) = (/3,2,2,3/) 
IndexArray4(19,:) = (/2,1,3,1/) 
IndexArray4(20,:) = (/3,1,3,1/) 
IndexArray4(21,:) = (/3,2,3,1/) 
IndexArray4(22,:) = (/2,1,3,2/) 
IndexArray4(23,:) = (/3,1,3,2/) 
IndexArray4(24,:) = (/3,2,3,2/) 
IndexArray4(25,:) = (/2,1,3,3/) 
IndexArray4(26,:) = (/3,1,3,3/) 
IndexArray4(27,:) = (/3,2,3,3/) 
Do i1=1,27 
gt1 = IndexArray4(i1,1) 
gt2 = IndexArray4(i1,2) 
gt3 = IndexArray4(i1,3) 
gt4 = IndexArray4(i1,4) 
Call CalculatePengV2d2nu(gt1,gt2,gt3,gt4,.False.,MAh,MAh2,MChi,MChi2,MetI,            & 
& MetI2,MetR,MetR2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,           & 
& MVWp2,MVZ,MVZ2,cplAhhhVZ,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,              & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,         & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,         & 
& cplcFuFdHpL,cplcFuFdHpR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFuFuVZL,cplcFuFuVZR,             & 
& cplChiFvetIL,cplChiFvetIR,cplChiFvetRL,cplChiFvetRR,cplcHpVWpVZ,cplcVWpVWpVZ,          & 
& cpletIetRVZ,cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,cplFvFeVWpR,cplFvFvVZL,cplFvFvVZR,       & 
& cplhhVZVZ,cplHpcHpVZ,cplHpcVWpVZ,PVOddvvVRR(gt1,gt2,gt3,gt4),PVOddvvVLL(gt1,gt2,gt3,gt4)& 
& ,PVOddvvVRL(gt1,gt2,gt3,gt4),PVOddvvVLR(gt1,gt2,gt3,gt4))

Call CalculatePengV2d2nu(gt1,gt2,gt3,gt4,.true.,MAh,MAh2,MChi,MChi2,MetI,             & 
& MetI2,MetR,MetR2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,           & 
& MVWp2,MVZ,MVZ2,cplAhhhVZ,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,              & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,         & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,         & 
& cplcFuFdHpL,cplcFuFdHpR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFuFuVZL,cplcFuFuVZR,             & 
& cplChiFvetIL,cplChiFvetIR,cplChiFvetRL,cplChiFvetRR,cplcHpVWpVZ,cplcVWpVWpVZ,          & 
& cpletIetRVZ,cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,cplFvFeVWpR,cplFvFvVZL,cplFvFvVZR,       & 
& cplhhVZVZ,cplHpcHpVZ,cplHpcVWpVZ,PVOddvvVRRSM(gt1,gt2,gt3,gt4),PVOddvvVLLSM(gt1,gt2,gt3,gt4)& 
& ,PVOddvvVRLSM(gt1,gt2,gt3,gt4),PVOddvvVLRSM(gt1,gt2,gt3,gt4))

End do 



 ! **** TreeS2d2nu **** 
 
IndexArray4(1,:) = (/2,1,1,1/) 
IndexArray4(2,:) = (/3,1,1,1/) 
IndexArray4(3,:) = (/3,2,1,1/) 
IndexArray4(4,:) = (/2,1,1,2/) 
IndexArray4(5,:) = (/3,1,1,2/) 
IndexArray4(6,:) = (/3,2,1,2/) 
IndexArray4(7,:) = (/2,1,1,3/) 
IndexArray4(8,:) = (/3,1,1,3/) 
IndexArray4(9,:) = (/3,2,1,3/) 
IndexArray4(10,:) = (/2,1,2,1/) 
IndexArray4(11,:) = (/3,1,2,1/) 
IndexArray4(12,:) = (/3,2,2,1/) 
IndexArray4(13,:) = (/2,1,2,2/) 
IndexArray4(14,:) = (/3,1,2,2/) 
IndexArray4(15,:) = (/3,2,2,2/) 
IndexArray4(16,:) = (/2,1,2,3/) 
IndexArray4(17,:) = (/3,1,2,3/) 
IndexArray4(18,:) = (/3,2,2,3/) 
IndexArray4(19,:) = (/2,1,3,1/) 
IndexArray4(20,:) = (/3,1,3,1/) 
IndexArray4(21,:) = (/3,2,3,1/) 
IndexArray4(22,:) = (/2,1,3,2/) 
IndexArray4(23,:) = (/3,1,3,2/) 
IndexArray4(24,:) = (/3,2,3,2/) 
IndexArray4(25,:) = (/2,1,3,3/) 
IndexArray4(26,:) = (/3,1,3,3/) 
IndexArray4(27,:) = (/3,2,3,3/) 
Do i1=1,27 
gt1 = IndexArray4(i1,1) 
gt2 = IndexArray4(i1,2) 
gt3 = IndexArray4(i1,3) 
gt4 = IndexArray4(i1,4) 
Call CalculateTreeS2d2nu(gt1,gt2,gt3,gt4,.False.,MAh,MAh2,MChi,MChi2,MetI,            & 
& MetI2,MetR,MetR2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,           & 
& MVWp2,MVZ,MVZ2,cplAhhhVZ,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,              & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,         & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,         & 
& cplcFuFdHpL,cplcFuFdHpR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFuFuVZL,cplcFuFuVZR,             & 
& cplChiFvetIL,cplChiFvetIR,cplChiFvetRL,cplChiFvetRR,cplcHpVWpVZ,cplcVWpVWpVZ,          & 
& cpletIetRVZ,cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,cplFvFeVWpR,cplFvFvVZL,cplFvFvVZR,       & 
& cplhhVZVZ,cplHpcHpVZ,cplHpcVWpVZ,TSOddvvVRR(gt1,gt2,gt3,gt4),TSOddvvVLL(gt1,gt2,gt3,gt4)& 
& ,TSOddvvVRL(gt1,gt2,gt3,gt4),TSOddvvVLR(gt1,gt2,gt3,gt4))

Call CalculateTreeS2d2nu(gt1,gt2,gt3,gt4,.true.,MAh,MAh2,MChi,MChi2,MetI,             & 
& MetI2,MetR,MetR2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,           & 
& MVWp2,MVZ,MVZ2,cplAhhhVZ,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,              & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,         & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,         & 
& cplcFuFdHpL,cplcFuFdHpR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFuFuVZL,cplcFuFuVZR,             & 
& cplChiFvetIL,cplChiFvetIR,cplChiFvetRL,cplChiFvetRR,cplcHpVWpVZ,cplcVWpVWpVZ,          & 
& cpletIetRVZ,cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,cplFvFeVWpR,cplFvFvVZL,cplFvFvVZR,       & 
& cplhhVZVZ,cplHpcHpVZ,cplHpcVWpVZ,TSOddvvVRRSM(gt1,gt2,gt3,gt4),TSOddvvVLLSM(gt1,gt2,gt3,gt4)& 
& ,TSOddvvVRLSM(gt1,gt2,gt3,gt4),TSOddvvVLRSM(gt1,gt2,gt3,gt4))

End do 



 ! **** TreeV2d2nu **** 
 
IndexArray4(1,:) = (/2,1,1,1/) 
IndexArray4(2,:) = (/3,1,1,1/) 
IndexArray4(3,:) = (/3,2,1,1/) 
IndexArray4(4,:) = (/2,1,1,2/) 
IndexArray4(5,:) = (/3,1,1,2/) 
IndexArray4(6,:) = (/3,2,1,2/) 
IndexArray4(7,:) = (/2,1,1,3/) 
IndexArray4(8,:) = (/3,1,1,3/) 
IndexArray4(9,:) = (/3,2,1,3/) 
IndexArray4(10,:) = (/2,1,2,1/) 
IndexArray4(11,:) = (/3,1,2,1/) 
IndexArray4(12,:) = (/3,2,2,1/) 
IndexArray4(13,:) = (/2,1,2,2/) 
IndexArray4(14,:) = (/3,1,2,2/) 
IndexArray4(15,:) = (/3,2,2,2/) 
IndexArray4(16,:) = (/2,1,2,3/) 
IndexArray4(17,:) = (/3,1,2,3/) 
IndexArray4(18,:) = (/3,2,2,3/) 
IndexArray4(19,:) = (/2,1,3,1/) 
IndexArray4(20,:) = (/3,1,3,1/) 
IndexArray4(21,:) = (/3,2,3,1/) 
IndexArray4(22,:) = (/2,1,3,2/) 
IndexArray4(23,:) = (/3,1,3,2/) 
IndexArray4(24,:) = (/3,2,3,2/) 
IndexArray4(25,:) = (/2,1,3,3/) 
IndexArray4(26,:) = (/3,1,3,3/) 
IndexArray4(27,:) = (/3,2,3,3/) 
Do i1=1,27 
gt1 = IndexArray4(i1,1) 
gt2 = IndexArray4(i1,2) 
gt3 = IndexArray4(i1,3) 
gt4 = IndexArray4(i1,4) 
Call CalculateTreeV2d2nu(gt1,gt2,gt3,gt4,.False.,MAh,MAh2,MChi,MChi2,MetI,            & 
& MetI2,MetR,MetR2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,           & 
& MVWp2,MVZ,MVZ2,cplAhhhVZ,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,              & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,         & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,         & 
& cplcFuFdHpL,cplcFuFdHpR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFuFuVZL,cplcFuFuVZR,             & 
& cplChiFvetIL,cplChiFvetIR,cplChiFvetRL,cplChiFvetRR,cplcHpVWpVZ,cplcVWpVWpVZ,          & 
& cpletIetRVZ,cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,cplFvFeVWpR,cplFvFvVZL,cplFvFvVZR,       & 
& cplhhVZVZ,cplHpcHpVZ,cplHpcVWpVZ,TVOddvvVRR(gt1,gt2,gt3,gt4),TVOddvvVLL(gt1,gt2,gt3,gt4)& 
& ,TVOddvvVRL(gt1,gt2,gt3,gt4),TVOddvvVLR(gt1,gt2,gt3,gt4))

Call CalculateTreeV2d2nu(gt1,gt2,gt3,gt4,.true.,MAh,MAh2,MChi,MChi2,MetI,             & 
& MetI2,MetR,MetR2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,           & 
& MVWp2,MVZ,MVZ2,cplAhhhVZ,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,              & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,         & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,         & 
& cplcFuFdHpL,cplcFuFdHpR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFuFuVZL,cplcFuFuVZR,             & 
& cplChiFvetIL,cplChiFvetIR,cplChiFvetRL,cplChiFvetRR,cplcHpVWpVZ,cplcVWpVWpVZ,          & 
& cpletIetRVZ,cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,cplFvFeVWpR,cplFvFvVZL,cplFvFvVZR,       & 
& cplhhVZVZ,cplHpcHpVZ,cplHpcVWpVZ,TVOddvvVRRSM(gt1,gt2,gt3,gt4),TVOddvvVLLSM(gt1,gt2,gt3,gt4)& 
& ,TVOddvvVRLSM(gt1,gt2,gt3,gt4),TVOddvvVLRSM(gt1,gt2,gt3,gt4))

End do 



 ! **** Box4d **** 
 
IndexArray4(1,:) = (/3,1,3,1/) 
IndexArray4(2,:) = (/3,2,3,2/) 
IndexArray4(3,:) = (/2,1,2,1/) 
Do i1=1,3 
gt1 = IndexArray4(i1,1) 
gt2 = IndexArray4(i1,2) 
gt3 = IndexArray4(i1,3) 
gt4 = IndexArray4(i1,4) 
Call CalculateBox4d(gt1,gt2,gt3,gt4,.False.,MAh,MAh2,MFd,MFd2,MFu,MFu2,               & 
& Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,cplAhAhhh,cplAhcHpVWp,cplAhhhVZ,cplAhHpcVWp,     & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,               & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFucHpL,cplcFdFucHpR,             & 
& cplcFdFucVWpL,cplcFdFucVWpR,cplcFuFdHpL,cplcFuFdHpR,cplcFuFdVWpL,cplcFuFdVWpR,         & 
& cplcFuFuAhL,cplcFuFuAhR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,               & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcHpVPVWp,cplcHpVWpVZ,               & 
& cplcVWpVPVWp,cplcVWpVWpVZ,cplhhcHpVWp,cplhhcVWpVWp,cplhhhhhh,cplhhHpcHp,               & 
& cplhhHpcVWp,cplhhVZVZ,cplHpcHpVP,cplHpcHpVZ,cplHpcVWpVP,cplHpcVWpVZ,BO4dSLL(gt1,gt2,gt3,gt4)& 
& ,BO4dSRR(gt1,gt2,gt3,gt4),BO4dSRL(gt1,gt2,gt3,gt4),BO4dSLR(gt1,gt2,gt3,gt4)            & 
& ,BO4dVRR(gt1,gt2,gt3,gt4),BO4dVLL(gt1,gt2,gt3,gt4),BO4dVRL(gt1,gt2,gt3,gt4)            & 
& ,BO4dVLR(gt1,gt2,gt3,gt4),BO4dTLL(gt1,gt2,gt3,gt4),BO4dTLR(gt1,gt2,gt3,gt4)            & 
& ,BO4dTRL(gt1,gt2,gt3,gt4),BO4dTRR(gt1,gt2,gt3,gt4))

Call CalculateBox4d(gt1,gt2,gt3,gt4,.true.,MAh,MAh2,MFd,MFd2,MFu,MFu2,Mhh,            & 
& Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,cplAhAhhh,cplAhcHpVWp,cplAhhhVZ,cplAhHpcVWp,         & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,               & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFucHpL,cplcFdFucHpR,             & 
& cplcFdFucVWpL,cplcFdFucVWpR,cplcFuFdHpL,cplcFuFdHpR,cplcFuFdVWpL,cplcFuFdVWpR,         & 
& cplcFuFuAhL,cplcFuFuAhR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,               & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcHpVPVWp,cplcHpVWpVZ,               & 
& cplcVWpVPVWp,cplcVWpVWpVZ,cplhhcHpVWp,cplhhcVWpVWp,cplhhhhhh,cplhhHpcHp,               & 
& cplhhHpcVWp,cplhhVZVZ,cplHpcHpVP,cplHpcHpVZ,cplHpcVWpVP,cplHpcVWpVZ,BO4dSLLSM(gt1,gt2,gt3,gt4)& 
& ,BO4dSRRSM(gt1,gt2,gt3,gt4),BO4dSRLSM(gt1,gt2,gt3,gt4),BO4dSLRSM(gt1,gt2,gt3,gt4)      & 
& ,BO4dVRRSM(gt1,gt2,gt3,gt4),BO4dVLLSM(gt1,gt2,gt3,gt4),BO4dVRLSM(gt1,gt2,gt3,gt4)      & 
& ,BO4dVLRSM(gt1,gt2,gt3,gt4),BO4dTLLSM(gt1,gt2,gt3,gt4),BO4dTLRSM(gt1,gt2,gt3,gt4)      & 
& ,BO4dTRLSM(gt1,gt2,gt3,gt4),BO4dTRRSM(gt1,gt2,gt3,gt4))

End do 



 ! **** TreeS4d **** 
 
IndexArray4(1,:) = (/3,1,3,1/) 
IndexArray4(2,:) = (/3,2,3,2/) 
IndexArray4(3,:) = (/2,1,2,1/) 
Do i1=1,3 
gt1 = IndexArray4(i1,1) 
gt2 = IndexArray4(i1,2) 
gt3 = IndexArray4(i1,3) 
gt4 = IndexArray4(i1,4) 
Call CalculateTreeS4d(gt1,gt2,gt3,gt4,.False.,MAh,MAh2,MFd,MFd2,MFu,MFu2,             & 
& Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,cplAhAhhh,cplAhcHpVWp,cplAhhhVZ,cplAhHpcVWp,     & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,               & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFucHpL,cplcFdFucHpR,             & 
& cplcFdFucVWpL,cplcFdFucVWpR,cplcFuFdHpL,cplcFuFdHpR,cplcFuFdVWpL,cplcFuFdVWpR,         & 
& cplcFuFuAhL,cplcFuFuAhR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,               & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcHpVPVWp,cplcHpVWpVZ,               & 
& cplcVWpVPVWp,cplcVWpVWpVZ,cplhhcHpVWp,cplhhcVWpVWp,cplhhhhhh,cplhhHpcHp,               & 
& cplhhHpcVWp,cplhhVZVZ,cplHpcHpVP,cplHpcHpVZ,cplHpcVWpVP,cplHpcVWpVZ,TSO4dSLL(gt1,gt2,gt3,gt4)& 
& ,TSO4dSRR(gt1,gt2,gt3,gt4),TSO4dSRL(gt1,gt2,gt3,gt4),TSO4dSLR(gt1,gt2,gt3,gt4)         & 
& ,TSO4dVRR(gt1,gt2,gt3,gt4),TSO4dVLL(gt1,gt2,gt3,gt4),TSO4dVRL(gt1,gt2,gt3,gt4)         & 
& ,TSO4dVLR(gt1,gt2,gt3,gt4),TSO4dTLL(gt1,gt2,gt3,gt4),TSO4dTLR(gt1,gt2,gt3,gt4)         & 
& ,TSO4dTRL(gt1,gt2,gt3,gt4),TSO4dTRR(gt1,gt2,gt3,gt4))

Call CalculateTreeS4d(gt1,gt2,gt3,gt4,.true.,MAh,MAh2,MFd,MFd2,MFu,MFu2,              & 
& Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,cplAhAhhh,cplAhcHpVWp,cplAhhhVZ,cplAhHpcVWp,     & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,               & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFucHpL,cplcFdFucHpR,             & 
& cplcFdFucVWpL,cplcFdFucVWpR,cplcFuFdHpL,cplcFuFdHpR,cplcFuFdVWpL,cplcFuFdVWpR,         & 
& cplcFuFuAhL,cplcFuFuAhR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,               & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcHpVPVWp,cplcHpVWpVZ,               & 
& cplcVWpVPVWp,cplcVWpVWpVZ,cplhhcHpVWp,cplhhcVWpVWp,cplhhhhhh,cplhhHpcHp,               & 
& cplhhHpcVWp,cplhhVZVZ,cplHpcHpVP,cplHpcHpVZ,cplHpcVWpVP,cplHpcVWpVZ,TSO4dSLLSM(gt1,gt2,gt3,gt4)& 
& ,TSO4dSRRSM(gt1,gt2,gt3,gt4),TSO4dSRLSM(gt1,gt2,gt3,gt4),TSO4dSLRSM(gt1,gt2,gt3,gt4)   & 
& ,TSO4dVRRSM(gt1,gt2,gt3,gt4),TSO4dVLLSM(gt1,gt2,gt3,gt4),TSO4dVRLSM(gt1,gt2,gt3,gt4)   & 
& ,TSO4dVLRSM(gt1,gt2,gt3,gt4),TSO4dTLLSM(gt1,gt2,gt3,gt4),TSO4dTLRSM(gt1,gt2,gt3,gt4)   & 
& ,TSO4dTRLSM(gt1,gt2,gt3,gt4),TSO4dTRRSM(gt1,gt2,gt3,gt4))

End do 



 ! **** TreeV4d **** 
 
IndexArray4(1,:) = (/3,1,3,1/) 
IndexArray4(2,:) = (/3,2,3,2/) 
IndexArray4(3,:) = (/2,1,2,1/) 
Do i1=1,3 
gt1 = IndexArray4(i1,1) 
gt2 = IndexArray4(i1,2) 
gt3 = IndexArray4(i1,3) 
gt4 = IndexArray4(i1,4) 
Call CalculateTreeV4d(gt1,gt2,gt3,gt4,.False.,MAh,MAh2,MFd,MFd2,MFu,MFu2,             & 
& Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,cplAhAhhh,cplAhcHpVWp,cplAhhhVZ,cplAhHpcVWp,     & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,               & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFucHpL,cplcFdFucHpR,             & 
& cplcFdFucVWpL,cplcFdFucVWpR,cplcFuFdHpL,cplcFuFdHpR,cplcFuFdVWpL,cplcFuFdVWpR,         & 
& cplcFuFuAhL,cplcFuFuAhR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,               & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcHpVPVWp,cplcHpVWpVZ,               & 
& cplcVWpVPVWp,cplcVWpVWpVZ,cplhhcHpVWp,cplhhcVWpVWp,cplhhhhhh,cplhhHpcHp,               & 
& cplhhHpcVWp,cplhhVZVZ,cplHpcHpVP,cplHpcHpVZ,cplHpcVWpVP,cplHpcVWpVZ,TVO4dSLL(gt1,gt2,gt3,gt4)& 
& ,TVO4dSRR(gt1,gt2,gt3,gt4),TVO4dSRL(gt1,gt2,gt3,gt4),TVO4dSLR(gt1,gt2,gt3,gt4)         & 
& ,TVO4dVRR(gt1,gt2,gt3,gt4),TVO4dVLL(gt1,gt2,gt3,gt4),TVO4dVRL(gt1,gt2,gt3,gt4)         & 
& ,TVO4dVLR(gt1,gt2,gt3,gt4),TVO4dTLL(gt1,gt2,gt3,gt4),TVO4dTLR(gt1,gt2,gt3,gt4)         & 
& ,TVO4dTRL(gt1,gt2,gt3,gt4),TVO4dTRR(gt1,gt2,gt3,gt4))

Call CalculateTreeV4d(gt1,gt2,gt3,gt4,.true.,MAh,MAh2,MFd,MFd2,MFu,MFu2,              & 
& Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,cplAhAhhh,cplAhcHpVWp,cplAhhhVZ,cplAhHpcVWp,     & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,               & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFucHpL,cplcFdFucHpR,             & 
& cplcFdFucVWpL,cplcFdFucVWpR,cplcFuFdHpL,cplcFuFdHpR,cplcFuFdVWpL,cplcFuFdVWpR,         & 
& cplcFuFuAhL,cplcFuFuAhR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,               & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcHpVPVWp,cplcHpVWpVZ,               & 
& cplcVWpVPVWp,cplcVWpVWpVZ,cplhhcHpVWp,cplhhcVWpVWp,cplhhhhhh,cplhhHpcHp,               & 
& cplhhHpcVWp,cplhhVZVZ,cplHpcHpVP,cplHpcHpVZ,cplHpcVWpVP,cplHpcVWpVZ,TVO4dSLLSM(gt1,gt2,gt3,gt4)& 
& ,TVO4dSRRSM(gt1,gt2,gt3,gt4),TVO4dSRLSM(gt1,gt2,gt3,gt4),TVO4dSLRSM(gt1,gt2,gt3,gt4)   & 
& ,TVO4dVRRSM(gt1,gt2,gt3,gt4),TVO4dVLLSM(gt1,gt2,gt3,gt4),TVO4dVRLSM(gt1,gt2,gt3,gt4)   & 
& ,TVO4dVLRSM(gt1,gt2,gt3,gt4),TVO4dTLLSM(gt1,gt2,gt3,gt4),TVO4dTLRSM(gt1,gt2,gt3,gt4)   & 
& ,TVO4dTRLSM(gt1,gt2,gt3,gt4),TVO4dTRRSM(gt1,gt2,gt3,gt4))

End do 



 ! **** A2q **** 
 
IndexArray3(1,:) = (/2,1,1/) 
IndexArray3(2,:) = (/3,1,1/) 
IndexArray3(3,:) = (/3,2,1/) 
Do i1=1,3 
gt1 = IndexArray3(i1,1) 
gt2 = IndexArray3(i1,2) 
 Do i2=1,1 
  gt3=i2 
Call CalculateA2q(gt1,gt2,gt3,.False.,MAh,MAh2,MFd,MFd2,MFu,MFu2,Mhh,Mhh2,            & 
& MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,cplAhAhhh,cplAhcHpVWp,cplAhhhVZ,cplAhHpcVWp,              & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,               & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFucHpL,cplcFdFucHpR,             & 
& cplcFdFucVWpL,cplcFdFucVWpR,cplcFuFdHpL,cplcFuFdHpR,cplcFuFdVWpL,cplcFuFdVWpR,         & 
& cplcFuFuAhL,cplcFuFuAhR,OAh2qSL(gt1,gt2,gt3),OAh2qSR(gt1,gt2,gt3))

Call CalculateA2q(gt1,gt2,gt3,.true.,MAh,MAh2,MFd,MFd2,MFu,MFu2,Mhh,Mhh2,             & 
& MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,cplAhAhhh,cplAhcHpVWp,cplAhhhVZ,cplAhHpcVWp,              & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,               & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFucHpL,cplcFdFucHpR,             & 
& cplcFdFucVWpL,cplcFdFucVWpR,cplcFuFdHpL,cplcFuFdHpR,cplcFuFdVWpL,cplcFuFdVWpR,         & 
& cplcFuFuAhL,cplcFuFuAhR,OAh2qSLSM(gt1,gt2,gt3),OAh2qSRSM(gt1,gt2,gt3))

 End Do  
End do 



 ! **** TreeSdulv **** 
 
IndexArray4(1,:) = (/3,1,1,1/) 
IndexArray4(2,:) = (/3,2,1,1/) 
IndexArray4(3,:) = (/2,2,1,1/) 
IndexArray4(4,:) = (/2,1,1,1/) 
IndexArray4(5,:) = (/1,2,1,1/) 
IndexArray4(6,:) = (/3,1,1,2/) 
IndexArray4(7,:) = (/3,2,1,2/) 
IndexArray4(8,:) = (/2,2,1,2/) 
IndexArray4(9,:) = (/2,1,1,2/) 
IndexArray4(10,:) = (/1,2,1,2/) 
IndexArray4(11,:) = (/3,1,1,3/) 
IndexArray4(12,:) = (/3,2,1,3/) 
IndexArray4(13,:) = (/2,2,1,3/) 
IndexArray4(14,:) = (/2,1,1,3/) 
IndexArray4(15,:) = (/1,2,1,3/) 
IndexArray4(16,:) = (/3,1,2,1/) 
IndexArray4(17,:) = (/3,2,2,1/) 
IndexArray4(18,:) = (/2,2,2,1/) 
IndexArray4(19,:) = (/2,1,2,1/) 
IndexArray4(20,:) = (/1,2,2,1/) 
IndexArray4(21,:) = (/3,1,2,2/) 
IndexArray4(22,:) = (/3,2,2,2/) 
IndexArray4(23,:) = (/2,2,2,2/) 
IndexArray4(24,:) = (/2,1,2,2/) 
IndexArray4(25,:) = (/1,2,2,2/) 
IndexArray4(26,:) = (/3,1,2,3/) 
IndexArray4(27,:) = (/3,2,2,3/) 
IndexArray4(28,:) = (/2,2,2,3/) 
IndexArray4(29,:) = (/2,1,2,3/) 
IndexArray4(30,:) = (/1,2,2,3/) 
IndexArray4(31,:) = (/3,1,3,1/) 
IndexArray4(32,:) = (/3,2,3,1/) 
IndexArray4(33,:) = (/2,2,3,1/) 
IndexArray4(34,:) = (/2,1,3,1/) 
IndexArray4(35,:) = (/1,2,3,1/) 
IndexArray4(36,:) = (/3,1,3,2/) 
IndexArray4(37,:) = (/3,2,3,2/) 
IndexArray4(38,:) = (/2,2,3,2/) 
IndexArray4(39,:) = (/2,1,3,2/) 
IndexArray4(40,:) = (/1,2,3,2/) 
IndexArray4(41,:) = (/3,1,3,3/) 
IndexArray4(42,:) = (/3,2,3,3/) 
IndexArray4(43,:) = (/2,2,3,3/) 
IndexArray4(44,:) = (/2,1,3,3/) 
IndexArray4(45,:) = (/1,2,3,3/) 
Do i1=1,45 
gt1 = IndexArray4(i1,1) 
gt2 = IndexArray4(i1,2) 
gt3 = IndexArray4(i1,3) 
gt4 = IndexArray4(i1,4) 
Call CalculateTreeSdulv(gt1,gt2,gt3,gt4,.False.,MAh,MAh2,MFd,MFd2,MFe,MFe2,           & 
& MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,cplAhcHpVWp,cplAhHpcVWp,       & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,cplcFdFdVPR,               & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,         & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,               & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,         & 
& cplcFuFdHpL,cplcFuFdHpR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFuFuAhL,cplcFuFuAhR,             & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcHpVWpVZ,cplcVWpVWpVZ,cplFvFvVZL,cplFvFvVZR,cplhhcHpVWp,cplhhcVWpVWp,               & 
& cplhhHpcHp,cplhhHpcVWp,cplHpcHpVP,cplHpcHpVZ,cplHpcVWpVP,cplHpcVWpVZ,TSOdulvSLL(gt1,gt2,gt3,gt4)& 
& ,TSOdulvSRR(gt1,gt2,gt3,gt4),TSOdulvSRL(gt1,gt2,gt3,gt4),TSOdulvSLR(gt1,gt2,gt3,gt4)   & 
& ,TSOdulvVRR(gt1,gt2,gt3,gt4),TSOdulvVLL(gt1,gt2,gt3,gt4),TSOdulvVRL(gt1,gt2,gt3,gt4)   & 
& ,TSOdulvVLR(gt1,gt2,gt3,gt4))

Call CalculateTreeSdulv(gt1,gt2,gt3,gt4,.true.,MAh,MAh2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,cplAhcHpVWp,cplAhHpcVWp,       & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,cplcFdFdVPR,               & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,         & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,               & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,         & 
& cplcFuFdHpL,cplcFuFdHpR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFuFuAhL,cplcFuFuAhR,             & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcHpVWpVZ,cplcVWpVWpVZ,cplFvFvVZL,cplFvFvVZR,cplhhcHpVWp,cplhhcVWpVWp,               & 
& cplhhHpcHp,cplhhHpcVWp,cplHpcHpVP,cplHpcHpVZ,cplHpcVWpVP,cplHpcVWpVZ,TSOdulvSLLSM(gt1,gt2,gt3,gt4)& 
& ,TSOdulvSRRSM(gt1,gt2,gt3,gt4),TSOdulvSRLSM(gt1,gt2,gt3,gt4),TSOdulvSLRSM(gt1,gt2,gt3,gt4)& 
& ,TSOdulvVRRSM(gt1,gt2,gt3,gt4),TSOdulvVLLSM(gt1,gt2,gt3,gt4),TSOdulvVRLSM(gt1,gt2,gt3,gt4)& 
& ,TSOdulvVLRSM(gt1,gt2,gt3,gt4))

End do 



 ! **** TreeVdulv **** 
 
IndexArray4(1,:) = (/3,1,1,1/) 
IndexArray4(2,:) = (/3,2,1,1/) 
IndexArray4(3,:) = (/2,2,1,1/) 
IndexArray4(4,:) = (/2,1,1,1/) 
IndexArray4(5,:) = (/1,2,1,1/) 
IndexArray4(6,:) = (/3,1,1,2/) 
IndexArray4(7,:) = (/3,2,1,2/) 
IndexArray4(8,:) = (/2,2,1,2/) 
IndexArray4(9,:) = (/2,1,1,2/) 
IndexArray4(10,:) = (/1,2,1,2/) 
IndexArray4(11,:) = (/3,1,1,3/) 
IndexArray4(12,:) = (/3,2,1,3/) 
IndexArray4(13,:) = (/2,2,1,3/) 
IndexArray4(14,:) = (/2,1,1,3/) 
IndexArray4(15,:) = (/1,2,1,3/) 
IndexArray4(16,:) = (/3,1,2,1/) 
IndexArray4(17,:) = (/3,2,2,1/) 
IndexArray4(18,:) = (/2,2,2,1/) 
IndexArray4(19,:) = (/2,1,2,1/) 
IndexArray4(20,:) = (/1,2,2,1/) 
IndexArray4(21,:) = (/3,1,2,2/) 
IndexArray4(22,:) = (/3,2,2,2/) 
IndexArray4(23,:) = (/2,2,2,2/) 
IndexArray4(24,:) = (/2,1,2,2/) 
IndexArray4(25,:) = (/1,2,2,2/) 
IndexArray4(26,:) = (/3,1,2,3/) 
IndexArray4(27,:) = (/3,2,2,3/) 
IndexArray4(28,:) = (/2,2,2,3/) 
IndexArray4(29,:) = (/2,1,2,3/) 
IndexArray4(30,:) = (/1,2,2,3/) 
IndexArray4(31,:) = (/3,1,3,1/) 
IndexArray4(32,:) = (/3,2,3,1/) 
IndexArray4(33,:) = (/2,2,3,1/) 
IndexArray4(34,:) = (/2,1,3,1/) 
IndexArray4(35,:) = (/1,2,3,1/) 
IndexArray4(36,:) = (/3,1,3,2/) 
IndexArray4(37,:) = (/3,2,3,2/) 
IndexArray4(38,:) = (/2,2,3,2/) 
IndexArray4(39,:) = (/2,1,3,2/) 
IndexArray4(40,:) = (/1,2,3,2/) 
IndexArray4(41,:) = (/3,1,3,3/) 
IndexArray4(42,:) = (/3,2,3,3/) 
IndexArray4(43,:) = (/2,2,3,3/) 
IndexArray4(44,:) = (/2,1,3,3/) 
IndexArray4(45,:) = (/1,2,3,3/) 
Do i1=1,45 
gt1 = IndexArray4(i1,1) 
gt2 = IndexArray4(i1,2) 
gt3 = IndexArray4(i1,3) 
gt4 = IndexArray4(i1,4) 
Call CalculateTreeVdulv(gt1,gt2,gt3,gt4,.False.,MAh,MAh2,MFd,MFd2,MFe,MFe2,           & 
& MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,cplAhcHpVWp,cplAhHpcVWp,       & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,cplcFdFdVPR,               & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,         & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,               & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,         & 
& cplcFuFdHpL,cplcFuFdHpR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFuFuAhL,cplcFuFuAhR,             & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcHpVWpVZ,cplcVWpVWpVZ,cplFvFvVZL,cplFvFvVZR,cplhhcHpVWp,cplhhcVWpVWp,               & 
& cplhhHpcHp,cplhhHpcVWp,cplHpcHpVP,cplHpcHpVZ,cplHpcVWpVP,cplHpcVWpVZ,TVOdulvSLL(gt1,gt2,gt3,gt4)& 
& ,TVOdulvSRR(gt1,gt2,gt3,gt4),TVOdulvSRL(gt1,gt2,gt3,gt4),TVOdulvSLR(gt1,gt2,gt3,gt4)   & 
& ,TVOdulvVRR(gt1,gt2,gt3,gt4),TVOdulvVLL(gt1,gt2,gt3,gt4),TVOdulvVRL(gt1,gt2,gt3,gt4)   & 
& ,TVOdulvVLR(gt1,gt2,gt3,gt4))

Call CalculateTreeVdulv(gt1,gt2,gt3,gt4,.true.,MAh,MAh2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,cplAhcHpVWp,cplAhHpcVWp,       & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,cplcFdFdVPR,               & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,         & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,               & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,         & 
& cplcFuFdHpL,cplcFuFdHpR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFuFuAhL,cplcFuFuAhR,             & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcHpVWpVZ,cplcVWpVWpVZ,cplFvFvVZL,cplFvFvVZR,cplhhcHpVWp,cplhhcVWpVWp,               & 
& cplhhHpcHp,cplhhHpcVWp,cplHpcHpVP,cplHpcHpVZ,cplHpcVWpVP,cplHpcVWpVZ,TVOdulvSLLSM(gt1,gt2,gt3,gt4)& 
& ,TVOdulvSRRSM(gt1,gt2,gt3,gt4),TVOdulvSRLSM(gt1,gt2,gt3,gt4),TVOdulvSLRSM(gt1,gt2,gt3,gt4)& 
& ,TVOdulvVRRSM(gt1,gt2,gt3,gt4),TVOdulvVLLSM(gt1,gt2,gt3,gt4),TVOdulvVRLSM(gt1,gt2,gt3,gt4)& 
& ,TVOdulvVLRSM(gt1,gt2,gt3,gt4))

End do 



 ! **** Gamma2Q **** 
 
IndexArray2(1,:) = (/3,2/) 
Do i1=1,1 
gt1 = IndexArray2(i1,1) 
gt2 = IndexArray2(i1,2) 
  gt3= 1 
Call CalculateGamma2Q(gt1,gt2,gt3,.False.,MAh,MAh2,MFd,MFd2,MFu,MFu2,Mhh,             & 
& Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,     & 
& cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplcFuFdHpL,cplcFuFdHpR,         & 
& cplcFuFdVWpL,cplcFuFdVWpR,cplcFuFuVPL,cplcFuFuVPR,cplcHpVPVWp,cplcVWpVPVWp,            & 
& cplHpcHpVP,cplHpcVWpVP,OA2qSL(gt1,gt2),OA2qSR(gt1,gt2),OA2qVL(gt1,gt2),OA2qVR(gt1,gt2))

Call CalculateGamma2Q(gt1,gt2,gt3,.true.,MAh,MAh2,MFd,MFd2,MFu,MFu2,Mhh,              & 
& Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,     & 
& cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplcFuFdHpL,cplcFuFdHpR,         & 
& cplcFuFdVWpL,cplcFuFdVWpR,cplcFuFuVPL,cplcFuFuVPR,cplcHpVPVWp,cplcVWpVPVWp,            & 
& cplHpcHpVP,cplHpcVWpVP,OA2qSLSM(gt1,gt2),OA2qSRSM(gt1,gt2),OA2qVLSM(gt1,gt2)           & 
& ,OA2qVRSM(gt1,gt2))

End do 



 ! **** Gluon2Q **** 
 
IndexArray2(1,:) = (/3,2/) 
Do i1=1,1 
gt1 = IndexArray2(i1,1) 
gt2 = IndexArray2(i1,2) 
  gt3= 1 
Call CalculateGluon2Q(gt1,gt2,gt3,.False.,MAh,MAh2,MFd,MFd2,MFu,MFu2,Mhh,             & 
& Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,     & 
& cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplcFuFdHpL,cplcFuFdHpR,         & 
& cplcFuFdVWpL,cplcFuFdVWpR,cplcFuFuVGL,cplcFuFuVGR,OG2qSL(gt1,gt2),OG2qSR(gt1,gt2))

Call CalculateGluon2Q(gt1,gt2,gt3,.true.,MAh,MAh2,MFd,MFd2,MFu,MFu2,Mhh,              & 
& Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,     & 
& cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplcFuFdHpL,cplcFuFdHpR,         & 
& cplcFuFdVWpL,cplcFuFdVWpR,cplcFuFuVGL,cplcFuFuVGR,OG2qSLSM(gt1,gt2),OG2qSRSM(gt1,gt2))

End do 



 ! **** H2q **** 
 
IndexArray3(1,:) = (/2,1,1/) 
IndexArray3(2,:) = (/3,1,1/) 
IndexArray3(3,:) = (/3,2,1/) 
Do i1=1,3 
gt1 = IndexArray3(i1,1) 
gt2 = IndexArray3(i1,2) 
 Do i2=1,1 
  gt3=i2 
Call CalculateH2q(gt1,gt2,gt3,.False.,MAh,MAh2,MFd,MFd2,MFu,MFu2,Mhh,Mhh2,            & 
& MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,cplAhAhhh,cplAhhhVZ,cplcFdFdAhL,cplcFdFdAhR,              & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,               & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,         & 
& cplcFuFdHpL,cplcFuFdHpR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFuFuhhL,cplcFuFuhhR,             & 
& cplhhcHpVWp,cplhhcVWpVWp,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhVZVZ,OH2qSL(gt1,gt2,gt3)& 
& ,OH2qSR(gt1,gt2,gt3))

Call CalculateH2q(gt1,gt2,gt3,.true.,MAh,MAh2,MFd,MFd2,MFu,MFu2,Mhh,Mhh2,             & 
& MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,cplAhAhhh,cplAhhhVZ,cplcFdFdAhL,cplcFdFdAhR,              & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,               & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,         & 
& cplcFuFdHpL,cplcFuFdHpR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFuFuhhL,cplcFuFuhhR,             & 
& cplhhcHpVWp,cplhhcVWpVWp,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhVZVZ,OH2qSLSM(gt1,gt2,gt3)& 
& ,OH2qSRSM(gt1,gt2,gt3))

 End Do  
End do 



 ! ***** Combine operators for 2d2L
OddllSLL = BOddllSLL + PSOddllSLL + PVOddllSLL + TSOddllSLL + TVOddllSLL
OddllSLLSM = BOddllSLLSM + PSOddllSLLSM + PVOddllSLLSM + TSOddllSLLSM + TVOddllSLLSM
OddllSRR = BOddllSRR + PSOddllSRR + PVOddllSRR + TSOddllSRR + TVOddllSRR
OddllSRRSM = BOddllSRRSM + PSOddllSRRSM + PVOddllSRRSM + TSOddllSRRSM + TVOddllSRRSM
OddllSRL = BOddllSRL + PSOddllSRL + PVOddllSRL + TSOddllSRL + TVOddllSRL
OddllSRLSM = BOddllSRLSM + PSOddllSRLSM + PVOddllSRLSM + TSOddllSRLSM + TVOddllSRLSM
OddllSLR = BOddllSLR + PSOddllSLR + PVOddllSLR + TSOddllSLR + TVOddllSLR
OddllSLRSM = BOddllSLRSM + PSOddllSLRSM + PVOddllSLRSM + TSOddllSLRSM + TVOddllSLRSM
OddllVRR = BOddllVRR + PSOddllVRR + PVOddllVRR + TSOddllVRR + TVOddllVRR
OddllVRRSM = BOddllVRRSM + PSOddllVRRSM + PVOddllVRRSM + TSOddllVRRSM + TVOddllVRRSM
OddllVLL = BOddllVLL + PSOddllVLL + PVOddllVLL + TSOddllVLL + TVOddllVLL
OddllVLLSM = BOddllVLLSM + PSOddllVLLSM + PVOddllVLLSM + TSOddllVLLSM + TVOddllVLLSM
OddllVRL = BOddllVRL + PSOddllVRL + PVOddllVRL + TSOddllVRL + TVOddllVRL
OddllVRLSM = BOddllVRLSM + PSOddllVRLSM + PVOddllVRLSM + TSOddllVRLSM + TVOddllVRLSM
OddllVLR = BOddllVLR + PSOddllVLR + PVOddllVLR + TSOddllVLR + TVOddllVLR
OddllVLRSM = BOddllVLRSM + PSOddllVLRSM + PVOddllVLRSM + TSOddllVLRSM + TVOddllVLRSM
OddllTLL = BOddllTLL + PSOddllTLL + PVOddllTLL + TSOddllTLL + TVOddllTLL
OddllTLLSM = BOddllTLLSM + PSOddllTLLSM + PVOddllTLLSM + TSOddllTLLSM + TVOddllTLLSM
OddllTLR = BOddllTLR + PSOddllTLR + PVOddllTLR + TSOddllTLR + TVOddllTLR
OddllTLRSM = BOddllTLRSM + PSOddllTLRSM + PVOddllTLRSM + TSOddllTLRSM + TVOddllTLRSM
OddllTRL = BOddllTRL + PSOddllTRL + PVOddllTRL + TSOddllTRL + TVOddllTRL
OddllTRLSM = BOddllTRLSM + PSOddllTRLSM + PVOddllTRLSM + TSOddllTRLSM + TVOddllTRLSM
OddllTRR = BOddllTRR + PSOddllTRR + PVOddllTRR + TSOddllTRR + TVOddllTRR
OddllTRRSM = BOddllTRRSM + PSOddllTRRSM + PVOddllTRRSM + TSOddllTRRSM + TVOddllTRRSM

 ! ***** Combine operators for 2d2nu
OddvvVRR = BOddvvVRR + PSOddvvVRR + PVOddvvVRR + TSOddvvVRR + TVOddvvVRR
OddvvVRRSM = BOddvvVRRSM + PSOddvvVRRSM + PVOddvvVRRSM + TSOddvvVRRSM + TVOddvvVRRSM
OddvvVLL = BOddvvVLL + PSOddvvVLL + PVOddvvVLL + TSOddvvVLL + TVOddvvVLL
OddvvVLLSM = BOddvvVLLSM + PSOddvvVLLSM + PVOddvvVLLSM + TSOddvvVLLSM + TVOddvvVLLSM
OddvvVRL = BOddvvVRL + PSOddvvVRL + PVOddvvVRL + TSOddvvVRL + TVOddvvVRL
OddvvVRLSM = BOddvvVRLSM + PSOddvvVRLSM + PVOddvvVRLSM + TSOddvvVRLSM + TVOddvvVRLSM
OddvvVLR = BOddvvVLR + PSOddvvVLR + PVOddvvVLR + TSOddvvVLR + TVOddvvVLR
OddvvVLRSM = BOddvvVLRSM + PSOddvvVLRSM + PVOddvvVLRSM + TSOddvvVLRSM + TVOddvvVLRSM

 ! ***** Combine operators for 4d
O4dSLL = BO4dSLL + TSO4dSLL + TVO4dSLL
O4dSLLSM = BO4dSLLSM + TSO4dSLLSM + TVO4dSLLSM
O4dSRR = BO4dSRR + TSO4dSRR + TVO4dSRR
O4dSRRSM = BO4dSRRSM + TSO4dSRRSM + TVO4dSRRSM
O4dSRL = BO4dSRL + TSO4dSRL + TVO4dSRL
O4dSRLSM = BO4dSRLSM + TSO4dSRLSM + TVO4dSRLSM
O4dSLR = BO4dSLR + TSO4dSLR + TVO4dSLR
O4dSLRSM = BO4dSLRSM + TSO4dSLRSM + TVO4dSLRSM
O4dVRR = BO4dVRR + TSO4dVRR + TVO4dVRR
O4dVRRSM = BO4dVRRSM + TSO4dVRRSM + TVO4dVRRSM
O4dVLL = BO4dVLL + TSO4dVLL + TVO4dVLL
O4dVLLSM = BO4dVLLSM + TSO4dVLLSM + TVO4dVLLSM
O4dVRL = BO4dVRL + TSO4dVRL + TVO4dVRL
O4dVRLSM = BO4dVRLSM + TSO4dVRLSM + TVO4dVRLSM
O4dVLR = BO4dVLR + TSO4dVLR + TVO4dVLR
O4dVLRSM = BO4dVLRSM + TSO4dVLRSM + TVO4dVLRSM
O4dTLL = BO4dTLL + TSO4dTLL + TVO4dTLL
O4dTLLSM = BO4dTLLSM + TSO4dTLLSM + TVO4dTLLSM
O4dTLR = BO4dTLR + TSO4dTLR + TVO4dTLR
O4dTLRSM = BO4dTLRSM + TSO4dTLRSM + TVO4dTLRSM
O4dTRL = BO4dTRL + TSO4dTRL + TVO4dTRL
O4dTRLSM = BO4dTRLSM + TSO4dTRLSM + TVO4dTRLSM
O4dTRR = BO4dTRR + TSO4dTRR + TVO4dTRR
O4dTRRSM = BO4dTRRSM + TSO4dTRRSM + TVO4dTRRSM

 ! ***** Combine operators for dulv
OdulvSLL = TSOdulvSLL + TVOdulvSLL
OdulvSLLSM = TSOdulvSLLSM + TVOdulvSLLSM
OdulvSRR = TSOdulvSRR + TVOdulvSRR
OdulvSRRSM = TSOdulvSRRSM + TVOdulvSRRSM
OdulvSRL = TSOdulvSRL + TVOdulvSRL
OdulvSRLSM = TSOdulvSRLSM + TVOdulvSRLSM
OdulvSLR = TSOdulvSLR + TVOdulvSLR
OdulvSLRSM = TSOdulvSLRSM + TVOdulvSLRSM
OdulvVRR = TSOdulvVRR + TVOdulvVRR
OdulvVRRSM = TSOdulvVRRSM + TVOdulvVRRSM
OdulvVLL = TSOdulvVLL + TVOdulvVLL
OdulvVLLSM = TSOdulvVLLSM + TVOdulvVLLSM
OdulvVRL = TSOdulvVRL + TVOdulvVRL
OdulvVRLSM = TSOdulvVRLSM + TVOdulvVRLSM
OdulvVLR = TSOdulvVLR + TVOdulvVLR
OdulvVLRSM = TSOdulvVLRSM + TVOdulvVLRSM

 ! ***** Combine operators for Gluon2Q
CC8 = OG2qSL
CC8SM = OG2qSLSM 
CC8p = OG2qSR
CC8pSM = OG2qSRSM 
CC8(2,:) = -0.25_dp*CC8(2,:)/sqrt(AlphaS_160*4*Pi)/mf_d_160(2)
CC8(3,:) = -0.25_dp*CC8(3,:)/sqrt(AlphaS_160*4*Pi)/mf_d_160(3)
CC8p(2,:) = -0.25_dp*CC8p(2,:)/sqrt(AlphaS_160*4*Pi)/mf_d_160(2)
CC8p(3,:) = -0.25_dp*CC8p(3,:)/sqrt(AlphaS_160*4*Pi)/mf_d_160(3)
CC8SM(2,:) = -0.25_dp*CC8SM(2,:)/sqrt(AlphaS_160*4*Pi)/mf_d_160(2)
CC8SM(3,:) = -0.25_dp*CC8SM(3,:)/sqrt(AlphaS_160*4*Pi)/mf_d_160(3)
CC8pSM(2,:) = -0.25_dp*CC8pSM(2,:)/sqrt(AlphaS_160*4*Pi)/mf_d_160(2)
CC8pSM(3,:) = -0.25_dp*CC8pSM(3,:)/sqrt(AlphaS_160*4*Pi)/mf_d_160(3)

 ! ***** Combine operators for Gamma2Q
CC7 = OA2qSL
CC7SM = OA2qSLSM 
CC7p = OA2qSR
CC7pSM = OA2qSRSM 
CC7(2,:) = -0.25_dp*CC7(2,:)/sqrt(Alpha_160*4*Pi)/mf_d_160(2)
CC7(3,:) = -0.25_dp*CC7(3,:)/sqrt(Alpha_160*4*Pi)/mf_d_160(3)
CC7p(2,:) = -0.25_dp*CC7p(2,:)/sqrt(Alpha_160*4*Pi)/mf_d_160(2)
CC7p(3,:) = -0.25_dp*CC7p(3,:)/sqrt(Alpha_160*4*Pi)/mf_d_160(3)
CC7SM(2,:) = -0.25_dp*CC7SM(2,:)/sqrt(Alpha_160*4*Pi)/mf_d_160(2)
CC7SM(3,:) = -0.25_dp*CC7SM(3,:)/sqrt(Alpha_160*4*Pi)/mf_d_160(3)
CC7pSM(2,:) = -0.25_dp*CC7pSM(2,:)/sqrt(Alpha_160*4*Pi)/mf_d_160(2)
CC7pSM(3,:) = -0.25_dp*CC7pSM(3,:)/sqrt(Alpha_160*4*Pi)/mf_d_160(3)

 ! **** B0toLL **** 
 
Call Calculate_B0toLL(OddllSLL,OddllSRR,OddllSRL,OddllSLR,OddllVRR,OddllVLL,          & 
& OddllVRL,OddllVLR,OddllSLLSM,OddllSRRSM,OddllSRLSM,OddllSLRSM,OddllVRRSM,              & 
& OddllVLLSM,OddllVRLSM,OddllVLRSM,BrB0dEE,ratioB0dEE,BrB0sEE,ratioB0sEE,BrB0dMuMu,      & 
& ratioB0dMuMu,BrB0sMuMu,ratioB0sMuMu,BrB0dTauTau,ratioB0dTauTau,BrB0sTauTau,            & 
& ratioB0sTauTau)


 ! **** bsGamma **** 
 
Call Calculate_bsGamma(CC7,CC7p,CC8,CC8p,CC7SM,CC7pSM,CC8SM,CC8pSM,BrBsGamma,         & 
& ratioBsGamma)


 ! **** BtoKLL **** 
 
Call Calculate_BtoKLL(OddllVRR,OddllVLL,OddllVRL,OddllVLR,CC7,CC7p,OddllVRRSM,        & 
& OddllVLLSM,OddllVRLSM,OddllVLRSM,CC7SM,CC7pSM,BrBtoKmumu,ratioBtoKmumu)


 ! **** BtoQnunu **** 
 
Call Calculate_BtoQnunu(OddvvVRR,OddvvVLL,OddvvVRL,OddvvVLR,OddvvVRRSM,               & 
& OddvvVLLSM,OddvvVRLSM,OddvvVLRSM,BrBtoSnunu,ratioBtoSnunu,BrBtoDnunu,ratioBtoDnunu)


 ! **** BtoSLL **** 
 
Call Calculate_BtoSLL(OddllVRR,OddllVLL,OddllVRL,OddllVLR,CC7,CC7p,CC8,               & 
& CC8p,OddllVRRSM,OddllVLLSM,OddllVRLSM,OddllVLRSM,CC7SM,CC7pSM,CC8SM,CC8pSM,            & 
& BrBtoSEE,ratioBtoSEE,BrBtoSMuMu,ratioBtoSMuMu)


 ! **** DeltaMBq **** 
 
Call Calculate_DeltaMBq(O4dSLL,O4dSRR,O4dSRL,O4dSLR,O4dVRR,O4dVLL,O4dVLLSM,           & 
& O4dVRL,O4dVLR,O4dTLL,O4dTLR,O4dTRL,O4dTRR,OH2qSL,OH2qSR,OAh2qSL,OAh2qSR,               & 
& DeltaMBs,ratioDeltaMBs,DeltaMBq,ratioDeltaMBq)


 ! **** KKmix **** 
 
Call Calculate_KKmix(O4dSLL,O4dSRR,O4dSRL,O4dSLR,O4dVRR,O4dVLL,O4dVRL,O4dVLR,         & 
& O4dTLL,O4dTLR,O4dTRL,O4dTRR,O4dSLLSM,O4dSRRSM,O4dSRLSM,O4dSLRSM,O4dVRRSM,              & 
& O4dVLLSM,O4dVRLSM,O4dVLRSM,O4dTLLSM,O4dTLRSM,O4dTRLSM,O4dTRRSM,DelMK,ratioDelMK,       & 
& epsK,ratioepsK)


 ! **** KtoPInunu **** 
 
Call Calculate_KtoPInunu(OddvvVRR,OddvvVLL,OddvvVRL,OddvvVLR,OddvvVRRSM,              & 
& OddvvVLLSM,OddvvVRLSM,OddvvVLRSM,BrKptoPipnunu,ratioKptoPipnunu,BrKltoPinunu,          & 
& ratioKltoPinunu)


 ! **** Plnu **** 
 
Call Calculate_Plnu(OdulvSLL,OdulvSRR,OdulvSRL,OdulvSLR,OdulvVRR,OdulvVLL,            & 
& OdulvVRL,OdulvVLR,OdulvSLLSM,OdulvSRRSM,OdulvSRLSM,OdulvSLRSM,OdulvVRRSM,              & 
& OdulvVLLSM,OdulvVRLSM,OdulvVLRSM,BrDmunu,ratioDmunu,BrDsmunu,ratioDsmunu,              & 
& BrDstaunu,ratioDstaunu,BrBmunu,ratioBmunu,BrBtaunu,ratioBtaunu,BrKmunu,ratioKmunu,RK,RKSM)

coeffC7sm = CC7SM(3,2)
coeffC7 = CC7(3,2)
coeffC7p = CC7p(3,2)
coeffC8sm = CC8SM(3,2)
coeffC8 = CC8(3,2)
coeffC8p = CC8p(3,2)
coeffC9eeSM = OddllVLLSM(3,2,1,1) + OddllVLRSM(3,2,1,1)
coeffC9ee = OddllVLL(3,2,1,1) + OddllVLR(3,2,1,1)
coeffC9Pee = OddllVRL(3,2,1,1) + OddllVRR(3,2,1,1)
coeffC10eeSM = -OddllVLLSM(3,2,1,1) + OddllVLRSM(3,2,1,1)
coeffC10ee = -OddllVLL(3,2,1,1) + OddllVLR(3,2,1,1)
coeffC10Pee = OddllVRL(3,2,1,1) - OddllVRR(3,2,1,1)
coeffC9mumuSM = OddllVLLSM(3,2,2,2) + OddllVLRSM(3,2,2,2)
coeffC9mumu = OddllVLL(3,2,2,2) + OddllVLR(3,2,2,2)
coeffC9Pmumu = OddllVRL(3,2,2,2) + OddllVRR(3,2,2,2)
coeffC10mumuSM = -OddllVLLSM(3,2,2,2) + OddllVLRSM(3,2,2,2)
coeffC10mumu = -OddllVLL(3,2,2,2) + OddllVLR(3,2,2,2)
coeffC10Pmumu = OddllVRL(3,2,2,2) - OddllVRR(3,2,2,2)
coeffC11nu1nu1SM = OddvvVLLSM(3,2,1,1) + OddvvVLRSM(3,2,1,1)
coeffC11nu1nu1 = OddvvVLL(3,2,1,1) + OddvvVLR(3,2,1,1)
coeffC11Pnu1nu1 = OddvvVRL(3,2,1,1) + OddvvVRR(3,2,1,1)
coeffC11nu2nu2SM = OddvvVLLSM(3,2,2,2) + OddvvVLRSM(3,2,2,2)
coeffC11nu2nu2 = OddvvVLL(3,2,2,2) + OddvvVLR(3,2,2,2)
coeffC11Pnu2nu2 = OddvvVRL(3,2,2,2) + OddvvVRR(3,2,2,2)
coeffC11nu3nu3SM = OddvvVLLSM(3,2,3,3) + OddvvVLRSM(3,2,3,3)
coeffC11nu3nu3 = OddvvVLL(3,2,3,3) + OddvvVLR(3,2,3,3)
coeffC11Pnu3nu3 = OddvvVRL(3,2,3,3) + OddvvVRR(3,2,3,3)
CKM = CKMsave 
!-------------------------------------
! running to M_Z 
!-------------------------------------

Call RunSM_and_SUSY_RGEs(mz,g1input,g2input,g3input,lam1input,lam2input,              & 
& lam4input,lam3input,lam5input,Yninput,Yuinput,Ydinput,Yeinput,Mninput,mH2input,        & 
& mEt2input,vinput,g1,g2,g3,lam1,lam2,lam4,lam3,lam5,Yn,Yu,Yd,Ye,Mn,mH2,mEt2,            & 
& v,CKM_MZ,sinW2_MZ,Alpha_MZ,AlphaS_MZ)

Call SolveTadpoleEquations(g1,g2,g3,lam1,lam2,lam4,lam3,lam5,Yn,Yu,Yd,Ye,             & 
& Mn,mH2,mEt2,v,(/ ZeroC, ZeroC /))

Call TreeMasses(MAh,MAh2,MChi,MChi2,MetI,MetI2,Metp,Metp2,MetR,MetR2,MFd,             & 
& MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,              & 
& ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZW,ZX,ZZ,v,g1,g2,g3,lam1,lam2,lam4,lam3,lam5,               & 
& Yn,Yu,Yd,Ye,Mn,mH2,mEt2,GenerationMixing,kont)

mzsave  = sqrt(mz2) 
 mf_d_mz = MFd(1:3) 
 mf_d2_mz = MFd(1:3)**2 
 mf_u_mz = MFu(1:3) 
 mf_u2_mz = MFu(1:3)**2 
 mf_l_MZ = MFe(1:3) 
 mf_l2_MZ = MFe(1:3)**2 
Call AllCouplings(lam1,v,lam5,lam4,lam3,g1,g2,TW,g3,Yd,ZDL,ZDR,Ye,ZEL,ZER,            & 
& Yu,ZUL,ZUR,Yn,ZX,UV,cplAhAhhh,cplAhetIetR,cpletIetIhh,cpletIetpcHp,cpletIHpcetp,       & 
& cpletpetRcHp,cpletphhcetp,cpletRetRhh,cpletRHpcetp,cplhhhhhh,cplhhHpcHp,               & 
& cplAhhhVZ,cplAhHpcVWp,cplAhcHpVWp,cpletIetpcVWp,cpletIetRVZ,cpletIcetpVWp,             & 
& cpletpetRcVWp,cpletpcetpVP,cpletpcetpVZ,cpletRcetpVWp,cplhhHpcVWp,cplhhcHpVWp,         & 
& cplHpcHpVP,cplHpcHpVZ,cplhhcVWpVWp,cplhhVZVZ,cplHpcVWpVP,cplHpcVWpVZ,cplcHpVPVWp,      & 
& cplcHpVWpVZ,cplVGVGVG,cplcVWpVPVWp,cplcVWpVWpVZ,cplcFdFdAhL,cplcFdFdAhR,               & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplChiFvetIL,cplChiFvetIR,             & 
& cplChiFeetpL,cplChiFeetpR,cplChiFvetRL,cplChiFvetRR,cplcFeChicetpL,cplcFeChicetpR,     & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHpL,cplcFuFdHpR,cplFvFeHpL,cplFvFeHpR,cplcFeFehhL,     & 
& cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFucHpL,cplcFdFucHpR,cplcFeFvcHpL,            & 
& cplcFeFvcHpR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFuFdVWpL,             & 
& cplcFuFdVWpR,cplcFdFdVZL,cplcFdFdVZR,cplFvFeVWpL,cplFvFeVWpR,cplcFeFeVPL,              & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,               & 
& cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcFdFucVWpL,cplcFdFucVWpR,cplFvFvVZL,            & 
& cplFvFvVZR,cplcFeFvcVWpL,cplcFeFvcVWpR)

Mhh= MhhL 
Mhh2 = Mhh2L 
MAh= MAhL 
MAh2 = MAh2L 

 ! **** Box2L2d **** 
 
IndexArray4(1,:) = (/2,1,1,1/) 
IndexArray4(2,:) = (/3,1,1,1/) 
IndexArray4(3,:) = (/3,2,1,1/) 
IndexArray4(4,:) = (/2,1,2,2/) 
IndexArray4(5,:) = (/3,1,2,2/) 
IndexArray4(6,:) = (/3,2,2,2/) 
Do i1=1,6 
gt1 = IndexArray4(i1,1) 
gt2 = IndexArray4(i1,2) 
gt3 = IndexArray4(i1,3) 
gt4 = IndexArray4(i1,4) 
Call CalculateBox2L2d(gt1,gt2,gt3,gt4,.False.,MAh,MAh2,MChi,MChi2,Metp,               & 
& Metp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,            & 
& MVZ2,cplAhAhhh,cplAhcHpVWp,cplAhhhVZ,cplAhHpcVWp,cplcFdFdAhL,cplcFdFdAhR,              & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplcFeChicetpL,cplcFeChicetpR,   & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,               & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,         & 
& cplcFuFdHpL,cplcFuFdHpR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFuFuAhL,cplcFuFuAhR,             & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplChiFeetpL,cplChiFeetpR,cplcHpVPVWp,cplcHpVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,           & 
& cpletpcetpVP,cpletpcetpVZ,cpletphhcetp,cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,              & 
& cplFvFeVWpR,cplFvFvVZL,cplFvFvVZR,cplhhcHpVWp,cplhhcVWpVWp,cplhhhhhh,cplhhHpcHp,       & 
& cplhhHpcVWp,cplhhVZVZ,cplHpcHpVP,cplHpcHpVZ,cplHpcVWpVP,cplHpcVWpVZ,BOllddSLL(gt1,gt2,gt3,gt4)& 
& ,BOllddSRR(gt1,gt2,gt3,gt4),BOllddSRL(gt1,gt2,gt3,gt4),BOllddSLR(gt1,gt2,gt3,gt4)      & 
& ,BOllddVRR(gt1,gt2,gt3,gt4),BOllddVLL(gt1,gt2,gt3,gt4),BOllddVRL(gt1,gt2,gt3,gt4)      & 
& ,BOllddVLR(gt1,gt2,gt3,gt4),BOllddTLL(gt1,gt2,gt3,gt4),BOllddTLR(gt1,gt2,gt3,gt4)      & 
& ,BOllddTRL(gt1,gt2,gt3,gt4),BOllddTRR(gt1,gt2,gt3,gt4))

End Do 


 ! **** PengS2L2d **** 
 
IndexArray4(1,:) = (/2,1,1,1/) 
IndexArray4(2,:) = (/3,1,1,1/) 
IndexArray4(3,:) = (/3,2,1,1/) 
IndexArray4(4,:) = (/2,1,2,2/) 
IndexArray4(5,:) = (/3,1,2,2/) 
IndexArray4(6,:) = (/3,2,2,2/) 
Do i1=1,6 
gt1 = IndexArray4(i1,1) 
gt2 = IndexArray4(i1,2) 
gt3 = IndexArray4(i1,3) 
gt4 = IndexArray4(i1,4) 
Call CalculatePengS2L2d(gt1,gt2,gt3,gt4,.False.,MAh,MAh2,MChi,MChi2,Metp,             & 
& Metp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,            & 
& MVZ2,cplAhAhhh,cplAhcHpVWp,cplAhhhVZ,cplAhHpcVWp,cplcFdFdAhL,cplcFdFdAhR,              & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplcFeChicetpL,cplcFeChicetpR,   & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,               & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,         & 
& cplcFuFdHpL,cplcFuFdHpR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFuFuAhL,cplcFuFuAhR,             & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplChiFeetpL,cplChiFeetpR,cplcHpVPVWp,cplcHpVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,           & 
& cpletpcetpVP,cpletpcetpVZ,cpletphhcetp,cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,              & 
& cplFvFeVWpR,cplFvFvVZL,cplFvFvVZR,cplhhcHpVWp,cplhhcVWpVWp,cplhhhhhh,cplhhHpcHp,       & 
& cplhhHpcVWp,cplhhVZVZ,cplHpcHpVP,cplHpcHpVZ,cplHpcVWpVP,cplHpcVWpVZ,PSOllddSLL(gt1,gt2,gt3,gt4)& 
& ,PSOllddSRR(gt1,gt2,gt3,gt4),PSOllddSRL(gt1,gt2,gt3,gt4),PSOllddSLR(gt1,gt2,gt3,gt4)   & 
& ,PSOllddVRR(gt1,gt2,gt3,gt4),PSOllddVLL(gt1,gt2,gt3,gt4),PSOllddVRL(gt1,gt2,gt3,gt4)   & 
& ,PSOllddVLR(gt1,gt2,gt3,gt4),PSOllddTLL(gt1,gt2,gt3,gt4),PSOllddTLR(gt1,gt2,gt3,gt4)   & 
& ,PSOllddTRL(gt1,gt2,gt3,gt4),PSOllddTRR(gt1,gt2,gt3,gt4))

End Do 


 ! **** PengV2L2d **** 
 
IndexArray4(1,:) = (/2,1,1,1/) 
IndexArray4(2,:) = (/3,1,1,1/) 
IndexArray4(3,:) = (/3,2,1,1/) 
IndexArray4(4,:) = (/2,1,2,2/) 
IndexArray4(5,:) = (/3,1,2,2/) 
IndexArray4(6,:) = (/3,2,2,2/) 
Do i1=1,6 
gt1 = IndexArray4(i1,1) 
gt2 = IndexArray4(i1,2) 
gt3 = IndexArray4(i1,3) 
gt4 = IndexArray4(i1,4) 
Call CalculatePengV2L2d(gt1,gt2,gt3,gt4,.False.,MAh,MAh2,MChi,MChi2,Metp,             & 
& Metp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,            & 
& MVZ2,cplAhAhhh,cplAhcHpVWp,cplAhhhVZ,cplAhHpcVWp,cplcFdFdAhL,cplcFdFdAhR,              & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplcFeChicetpL,cplcFeChicetpR,   & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,               & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,         & 
& cplcFuFdHpL,cplcFuFdHpR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFuFuAhL,cplcFuFuAhR,             & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplChiFeetpL,cplChiFeetpR,cplcHpVPVWp,cplcHpVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,           & 
& cpletpcetpVP,cpletpcetpVZ,cpletphhcetp,cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,              & 
& cplFvFeVWpR,cplFvFvVZL,cplFvFvVZR,cplhhcHpVWp,cplhhcVWpVWp,cplhhhhhh,cplhhHpcHp,       & 
& cplhhHpcVWp,cplhhVZVZ,cplHpcHpVP,cplHpcHpVZ,cplHpcVWpVP,cplHpcVWpVZ,PVOllddSLL(gt1,gt2,gt3,gt4)& 
& ,PVOllddSRR(gt1,gt2,gt3,gt4),PVOllddSRL(gt1,gt2,gt3,gt4),PVOllddSLR(gt1,gt2,gt3,gt4)   & 
& ,PVOllddVRR(gt1,gt2,gt3,gt4),PVOllddVLL(gt1,gt2,gt3,gt4),PVOllddVRL(gt1,gt2,gt3,gt4)   & 
& ,PVOllddVLR(gt1,gt2,gt3,gt4),PVOllddTLL(gt1,gt2,gt3,gt4),PVOllddTLR(gt1,gt2,gt3,gt4)   & 
& ,PVOllddTRL(gt1,gt2,gt3,gt4),PVOllddTRR(gt1,gt2,gt3,gt4))

End Do 


 ! **** TreeS2L2d **** 
 
IndexArray4(1,:) = (/2,1,1,1/) 
IndexArray4(2,:) = (/3,1,1,1/) 
IndexArray4(3,:) = (/3,2,1,1/) 
IndexArray4(4,:) = (/2,1,2,2/) 
IndexArray4(5,:) = (/3,1,2,2/) 
IndexArray4(6,:) = (/3,2,2,2/) 
Do i1=1,6 
gt1 = IndexArray4(i1,1) 
gt2 = IndexArray4(i1,2) 
gt3 = IndexArray4(i1,3) 
gt4 = IndexArray4(i1,4) 
Call CalculateTreeS2L2d(gt1,gt2,gt3,gt4,.False.,MAh,MAh2,MChi,MChi2,Metp,             & 
& Metp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,            & 
& MVZ2,cplAhAhhh,cplAhcHpVWp,cplAhhhVZ,cplAhHpcVWp,cplcFdFdAhL,cplcFdFdAhR,              & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplcFeChicetpL,cplcFeChicetpR,   & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,               & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,         & 
& cplcFuFdHpL,cplcFuFdHpR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFuFuAhL,cplcFuFuAhR,             & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplChiFeetpL,cplChiFeetpR,cplcHpVPVWp,cplcHpVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,           & 
& cpletpcetpVP,cpletpcetpVZ,cpletphhcetp,cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,              & 
& cplFvFeVWpR,cplFvFvVZL,cplFvFvVZR,cplhhcHpVWp,cplhhcVWpVWp,cplhhhhhh,cplhhHpcHp,       & 
& cplhhHpcVWp,cplhhVZVZ,cplHpcHpVP,cplHpcHpVZ,cplHpcVWpVP,cplHpcVWpVZ,TSOllddSLL(gt1,gt2,gt3,gt4)& 
& ,TSOllddSRR(gt1,gt2,gt3,gt4),TSOllddSRL(gt1,gt2,gt3,gt4),TSOllddSLR(gt1,gt2,gt3,gt4)   & 
& ,TSOllddVRR(gt1,gt2,gt3,gt4),TSOllddVLL(gt1,gt2,gt3,gt4),TSOllddVRL(gt1,gt2,gt3,gt4)   & 
& ,TSOllddVLR(gt1,gt2,gt3,gt4),TSOllddTLL(gt1,gt2,gt3,gt4),TSOllddTLR(gt1,gt2,gt3,gt4)   & 
& ,TSOllddTRL(gt1,gt2,gt3,gt4),TSOllddTRR(gt1,gt2,gt3,gt4))

End Do 


 ! **** TreeV2L2d **** 
 
IndexArray4(1,:) = (/2,1,1,1/) 
IndexArray4(2,:) = (/3,1,1,1/) 
IndexArray4(3,:) = (/3,2,1,1/) 
IndexArray4(4,:) = (/2,1,2,2/) 
IndexArray4(5,:) = (/3,1,2,2/) 
IndexArray4(6,:) = (/3,2,2,2/) 
Do i1=1,6 
gt1 = IndexArray4(i1,1) 
gt2 = IndexArray4(i1,2) 
gt3 = IndexArray4(i1,3) 
gt4 = IndexArray4(i1,4) 
Call CalculateTreeV2L2d(gt1,gt2,gt3,gt4,.False.,MAh,MAh2,MChi,MChi2,Metp,             & 
& Metp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,            & 
& MVZ2,cplAhAhhh,cplAhcHpVWp,cplAhhhVZ,cplAhHpcVWp,cplcFdFdAhL,cplcFdFdAhR,              & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplcFeChicetpL,cplcFeChicetpR,   & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,               & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,         & 
& cplcFuFdHpL,cplcFuFdHpR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFuFuAhL,cplcFuFuAhR,             & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplChiFeetpL,cplChiFeetpR,cplcHpVPVWp,cplcHpVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,           & 
& cpletpcetpVP,cpletpcetpVZ,cpletphhcetp,cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,              & 
& cplFvFeVWpR,cplFvFvVZL,cplFvFvVZR,cplhhcHpVWp,cplhhcVWpVWp,cplhhhhhh,cplhhHpcHp,       & 
& cplhhHpcVWp,cplhhVZVZ,cplHpcHpVP,cplHpcHpVZ,cplHpcVWpVP,cplHpcVWpVZ,TVOllddSLL(gt1,gt2,gt3,gt4)& 
& ,TVOllddSRR(gt1,gt2,gt3,gt4),TVOllddSRL(gt1,gt2,gt3,gt4),TVOllddSLR(gt1,gt2,gt3,gt4)   & 
& ,TVOllddVRR(gt1,gt2,gt3,gt4),TVOllddVLL(gt1,gt2,gt3,gt4),TVOllddVRL(gt1,gt2,gt3,gt4)   & 
& ,TVOllddVLR(gt1,gt2,gt3,gt4),TVOllddTLL(gt1,gt2,gt3,gt4),TVOllddTLR(gt1,gt2,gt3,gt4)   & 
& ,TVOllddTRL(gt1,gt2,gt3,gt4),TVOllddTRR(gt1,gt2,gt3,gt4))

End Do 


 ! **** Box2L2u **** 
 
IndexArray4(1,:) = (/2,1,1,1/) 
IndexArray4(2,:) = (/3,1,1,1/) 
IndexArray4(3,:) = (/3,2,1,1/) 
Do i1=1,3 
gt1 = IndexArray4(i1,1) 
gt2 = IndexArray4(i1,2) 
gt3 = IndexArray4(i1,3) 
gt4 = IndexArray4(i1,4) 
Call CalculateBox2L2u(gt1,gt2,gt3,gt4,.False.,MAh,MAh2,MChi,MChi2,Metp,               & 
& Metp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,            & 
& MVZ2,cplAhAhhh,cplAhcHpVWp,cplAhhhVZ,cplAhHpcVWp,cplcFdFdAhL,cplcFdFdAhR,              & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplcFeChicetpL,cplcFeChicetpR,   & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,               & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,         & 
& cplcFuFdHpL,cplcFuFdHpR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFuFuAhL,cplcFuFuAhR,             & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplChiFeetpL,cplChiFeetpR,cplcHpVPVWp,cplcHpVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,           & 
& cpletpcetpVP,cpletpcetpVZ,cpletphhcetp,cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,              & 
& cplFvFeVWpR,cplFvFvVZL,cplFvFvVZR,cplhhcHpVWp,cplhhcVWpVWp,cplhhhhhh,cplhhHpcHp,       & 
& cplhhHpcVWp,cplhhVZVZ,cplHpcHpVP,cplHpcHpVZ,cplHpcVWpVP,cplHpcVWpVZ,BOlluuSLL(gt1,gt2,gt3,gt4)& 
& ,BOlluuSRR(gt1,gt2,gt3,gt4),BOlluuSRL(gt1,gt2,gt3,gt4),BOlluuSLR(gt1,gt2,gt3,gt4)      & 
& ,BOlluuVRR(gt1,gt2,gt3,gt4),BOlluuVLL(gt1,gt2,gt3,gt4),BOlluuVRL(gt1,gt2,gt3,gt4)      & 
& ,BOlluuVLR(gt1,gt2,gt3,gt4),BOlluuTLL(gt1,gt2,gt3,gt4),BOlluuTLR(gt1,gt2,gt3,gt4)      & 
& ,BOlluuTRL(gt1,gt2,gt3,gt4),BOlluuTRR(gt1,gt2,gt3,gt4))

End Do 


 ! **** PengS2L2u **** 
 
IndexArray4(1,:) = (/2,1,1,1/) 
IndexArray4(2,:) = (/3,1,1,1/) 
IndexArray4(3,:) = (/3,2,1,1/) 
Do i1=1,3 
gt1 = IndexArray4(i1,1) 
gt2 = IndexArray4(i1,2) 
gt3 = IndexArray4(i1,3) 
gt4 = IndexArray4(i1,4) 
Call CalculatePengS2L2u(gt1,gt2,gt3,gt4,.False.,MAh,MAh2,MChi,MChi2,Metp,             & 
& Metp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,            & 
& MVZ2,cplAhAhhh,cplAhcHpVWp,cplAhhhVZ,cplAhHpcVWp,cplcFdFdAhL,cplcFdFdAhR,              & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplcFeChicetpL,cplcFeChicetpR,   & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,               & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,         & 
& cplcFuFdHpL,cplcFuFdHpR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFuFuAhL,cplcFuFuAhR,             & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplChiFeetpL,cplChiFeetpR,cplcHpVPVWp,cplcHpVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,           & 
& cpletpcetpVP,cpletpcetpVZ,cpletphhcetp,cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,              & 
& cplFvFeVWpR,cplFvFvVZL,cplFvFvVZR,cplhhcHpVWp,cplhhcVWpVWp,cplhhhhhh,cplhhHpcHp,       & 
& cplhhHpcVWp,cplhhVZVZ,cplHpcHpVP,cplHpcHpVZ,cplHpcVWpVP,cplHpcVWpVZ,PSOlluuSLL(gt1,gt2,gt3,gt4)& 
& ,PSOlluuSRR(gt1,gt2,gt3,gt4),PSOlluuSRL(gt1,gt2,gt3,gt4),PSOlluuSLR(gt1,gt2,gt3,gt4)   & 
& ,PSOlluuVRR(gt1,gt2,gt3,gt4),PSOlluuVLL(gt1,gt2,gt3,gt4),PSOlluuVRL(gt1,gt2,gt3,gt4)   & 
& ,PSOlluuVLR(gt1,gt2,gt3,gt4),PSOlluuTLL(gt1,gt2,gt3,gt4),PSOlluuTLR(gt1,gt2,gt3,gt4)   & 
& ,PSOlluuTRL(gt1,gt2,gt3,gt4),PSOlluuTRR(gt1,gt2,gt3,gt4))

End Do 


 ! **** PengV2L2u **** 
 
IndexArray4(1,:) = (/2,1,1,1/) 
IndexArray4(2,:) = (/3,1,1,1/) 
IndexArray4(3,:) = (/3,2,1,1/) 
Do i1=1,3 
gt1 = IndexArray4(i1,1) 
gt2 = IndexArray4(i1,2) 
gt3 = IndexArray4(i1,3) 
gt4 = IndexArray4(i1,4) 
Call CalculatePengV2L2u(gt1,gt2,gt3,gt4,.False.,MAh,MAh2,MChi,MChi2,Metp,             & 
& Metp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,            & 
& MVZ2,cplAhAhhh,cplAhcHpVWp,cplAhhhVZ,cplAhHpcVWp,cplcFdFdAhL,cplcFdFdAhR,              & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplcFeChicetpL,cplcFeChicetpR,   & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,               & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,         & 
& cplcFuFdHpL,cplcFuFdHpR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFuFuAhL,cplcFuFuAhR,             & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplChiFeetpL,cplChiFeetpR,cplcHpVPVWp,cplcHpVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,           & 
& cpletpcetpVP,cpletpcetpVZ,cpletphhcetp,cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,              & 
& cplFvFeVWpR,cplFvFvVZL,cplFvFvVZR,cplhhcHpVWp,cplhhcVWpVWp,cplhhhhhh,cplhhHpcHp,       & 
& cplhhHpcVWp,cplhhVZVZ,cplHpcHpVP,cplHpcHpVZ,cplHpcVWpVP,cplHpcVWpVZ,PVOlluuSLL(gt1,gt2,gt3,gt4)& 
& ,PVOlluuSRR(gt1,gt2,gt3,gt4),PVOlluuSRL(gt1,gt2,gt3,gt4),PVOlluuSLR(gt1,gt2,gt3,gt4)   & 
& ,PVOlluuVRR(gt1,gt2,gt3,gt4),PVOlluuVLL(gt1,gt2,gt3,gt4),PVOlluuVRL(gt1,gt2,gt3,gt4)   & 
& ,PVOlluuVLR(gt1,gt2,gt3,gt4),PVOlluuTLL(gt1,gt2,gt3,gt4),PVOlluuTLR(gt1,gt2,gt3,gt4)   & 
& ,PVOlluuTRL(gt1,gt2,gt3,gt4),PVOlluuTRR(gt1,gt2,gt3,gt4))

End Do 


 ! **** TreeS2L2u **** 
 
IndexArray4(1,:) = (/2,1,1,1/) 
IndexArray4(2,:) = (/3,1,1,1/) 
IndexArray4(3,:) = (/3,2,1,1/) 
Do i1=1,3 
gt1 = IndexArray4(i1,1) 
gt2 = IndexArray4(i1,2) 
gt3 = IndexArray4(i1,3) 
gt4 = IndexArray4(i1,4) 
Call CalculateTreeS2L2u(gt1,gt2,gt3,gt4,.False.,MAh,MAh2,MChi,MChi2,Metp,             & 
& Metp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,            & 
& MVZ2,cplAhAhhh,cplAhcHpVWp,cplAhhhVZ,cplAhHpcVWp,cplcFdFdAhL,cplcFdFdAhR,              & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplcFeChicetpL,cplcFeChicetpR,   & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,               & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,         & 
& cplcFuFdHpL,cplcFuFdHpR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFuFuAhL,cplcFuFuAhR,             & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplChiFeetpL,cplChiFeetpR,cplcHpVPVWp,cplcHpVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,           & 
& cpletpcetpVP,cpletpcetpVZ,cpletphhcetp,cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,              & 
& cplFvFeVWpR,cplFvFvVZL,cplFvFvVZR,cplhhcHpVWp,cplhhcVWpVWp,cplhhhhhh,cplhhHpcHp,       & 
& cplhhHpcVWp,cplhhVZVZ,cplHpcHpVP,cplHpcHpVZ,cplHpcVWpVP,cplHpcVWpVZ,TSOlluuSLL(gt1,gt2,gt3,gt4)& 
& ,TSOlluuSRR(gt1,gt2,gt3,gt4),TSOlluuSRL(gt1,gt2,gt3,gt4),TSOlluuSLR(gt1,gt2,gt3,gt4)   & 
& ,TSOlluuVRR(gt1,gt2,gt3,gt4),TSOlluuVLL(gt1,gt2,gt3,gt4),TSOlluuVRL(gt1,gt2,gt3,gt4)   & 
& ,TSOlluuVLR(gt1,gt2,gt3,gt4),TSOlluuTLL(gt1,gt2,gt3,gt4),TSOlluuTLR(gt1,gt2,gt3,gt4)   & 
& ,TSOlluuTRL(gt1,gt2,gt3,gt4),TSOlluuTRR(gt1,gt2,gt3,gt4))

End Do 


 ! **** TreeV2L2u **** 
 
IndexArray4(1,:) = (/2,1,1,1/) 
IndexArray4(2,:) = (/3,1,1,1/) 
IndexArray4(3,:) = (/3,2,1,1/) 
Do i1=1,3 
gt1 = IndexArray4(i1,1) 
gt2 = IndexArray4(i1,2) 
gt3 = IndexArray4(i1,3) 
gt4 = IndexArray4(i1,4) 
Call CalculateTreeV2L2u(gt1,gt2,gt3,gt4,.False.,MAh,MAh2,MChi,MChi2,Metp,             & 
& Metp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,            & 
& MVZ2,cplAhAhhh,cplAhcHpVWp,cplAhhhVZ,cplAhHpcVWp,cplcFdFdAhL,cplcFdFdAhR,              & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplcFeChicetpL,cplcFeChicetpR,   & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,               & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,         & 
& cplcFuFdHpL,cplcFuFdHpR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFuFuAhL,cplcFuFuAhR,             & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplChiFeetpL,cplChiFeetpR,cplcHpVPVWp,cplcHpVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,           & 
& cpletpcetpVP,cpletpcetpVZ,cpletphhcetp,cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,              & 
& cplFvFeVWpR,cplFvFvVZL,cplFvFvVZR,cplhhcHpVWp,cplhhcVWpVWp,cplhhhhhh,cplhhHpcHp,       & 
& cplhhHpcVWp,cplhhVZVZ,cplHpcHpVP,cplHpcHpVZ,cplHpcVWpVP,cplHpcVWpVZ,TVOlluuSLL(gt1,gt2,gt3,gt4)& 
& ,TVOlluuSRR(gt1,gt2,gt3,gt4),TVOlluuSRL(gt1,gt2,gt3,gt4),TVOlluuSLR(gt1,gt2,gt3,gt4)   & 
& ,TVOlluuVRR(gt1,gt2,gt3,gt4),TVOlluuVLL(gt1,gt2,gt3,gt4),TVOlluuVRL(gt1,gt2,gt3,gt4)   & 
& ,TVOlluuVLR(gt1,gt2,gt3,gt4),TVOlluuTLL(gt1,gt2,gt3,gt4),TVOlluuTLR(gt1,gt2,gt3,gt4)   & 
& ,TVOlluuTRL(gt1,gt2,gt3,gt4),TVOlluuTRR(gt1,gt2,gt3,gt4))

End Do 


 ! **** Box4L **** 
 
IndexArray4(1,:) = (/2,1,1,1/) 
IndexArray4(2,:) = (/3,1,1,1/) 
IndexArray4(3,:) = (/3,2,2,2/) 
IndexArray4(4,:) = (/3,2,1,2/) 
IndexArray4(5,:) = (/3,1,2,1/) 
Do i1=1,5 
gt1 = IndexArray4(i1,1) 
gt2 = IndexArray4(i1,2) 
gt3 = IndexArray4(i1,3) 
gt4 = IndexArray4(i1,4) 
Call CalculateBox4L(gt1,gt2,gt3,gt4,.False.,MAh,MAh2,MChi,MChi2,Metp,Metp2,           & 
& MFe,MFe2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,cplAhAhhh,cplAhcHpVWp,         & 
& cplAhhhVZ,cplAhHpcVWp,cplcFeChicetpL,cplcFeChicetpR,cplcFeFeAhL,cplcFeFeAhR,           & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplChiFeetpL,cplChiFeetpR,       & 
& cplcHpVPVWp,cplcHpVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,cpletpcetpVP,cpletpcetpVZ,           & 
& cpletphhcetp,cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,cplFvFeVWpR,cplFvFvVZL,cplFvFvVZR,      & 
& cplhhcHpVWp,cplhhcVWpVWp,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhVZVZ,cplHpcHpVP,        & 
& cplHpcHpVZ,cplHpcVWpVP,cplHpcVWpVZ,BO4lSLL(gt1,gt2,gt3,gt4),BO4lSRR(gt1,gt2,gt3,gt4)   & 
& ,BO4lSRL(gt1,gt2,gt3,gt4),BO4lSLR(gt1,gt2,gt3,gt4),BO4lVRR(gt1,gt2,gt3,gt4)            & 
& ,BO4lVLL(gt1,gt2,gt3,gt4),BO4lVRL(gt1,gt2,gt3,gt4),BO4lVLR(gt1,gt2,gt3,gt4)            & 
& ,BO4lTLL(gt1,gt2,gt3,gt4),BO4lTLR(gt1,gt2,gt3,gt4),BO4lTRL(gt1,gt2,gt3,gt4)            & 
& ,BO4lTRR(gt1,gt2,gt3,gt4))

End Do 


 ! **** PengS4L **** 
 
IndexArray4(1,:) = (/2,1,1,1/) 
IndexArray4(2,:) = (/3,1,1,1/) 
IndexArray4(3,:) = (/3,2,2,2/) 
IndexArray4(4,:) = (/3,2,1,2/) 
IndexArray4(5,:) = (/3,1,2,1/) 
Do i1=1,5 
gt1 = IndexArray4(i1,1) 
gt2 = IndexArray4(i1,2) 
gt3 = IndexArray4(i1,3) 
gt4 = IndexArray4(i1,4) 
Call CalculatePengS4L(gt1,gt2,gt3,gt4,.False.,MAh,MAh2,MChi,MChi2,Metp,               & 
& Metp2,MFe,MFe2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,cplAhAhhh,               & 
& cplAhcHpVWp,cplAhhhVZ,cplAhHpcVWp,cplcFeChicetpL,cplcFeChicetpR,cplcFeFeAhL,           & 
& cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplChiFeetpL,        & 
& cplChiFeetpR,cplcHpVPVWp,cplcHpVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,cpletpcetpVP,           & 
& cpletpcetpVZ,cpletphhcetp,cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,cplFvFeVWpR,               & 
& cplFvFvVZL,cplFvFvVZR,cplhhcHpVWp,cplhhcVWpVWp,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,       & 
& cplhhVZVZ,cplHpcHpVP,cplHpcHpVZ,cplHpcVWpVP,cplHpcVWpVZ,PSO4lSLL(gt1,gt2,gt3,gt4)      & 
& ,PSO4lSRR(gt1,gt2,gt3,gt4),PSO4lSRL(gt1,gt2,gt3,gt4),PSO4lSLR(gt1,gt2,gt3,gt4)         & 
& ,PSO4lVRR(gt1,gt2,gt3,gt4),PSO4lVLL(gt1,gt2,gt3,gt4),PSO4lVRL(gt1,gt2,gt3,gt4)         & 
& ,PSO4lVLR(gt1,gt2,gt3,gt4),PSO4lTLL(gt1,gt2,gt3,gt4),PSO4lTLR(gt1,gt2,gt3,gt4)         & 
& ,PSO4lTRL(gt1,gt2,gt3,gt4),PSO4lTRR(gt1,gt2,gt3,gt4))

End Do 


 ! **** PengV4L **** 
 
IndexArray4(1,:) = (/2,1,1,1/) 
IndexArray4(2,:) = (/3,1,1,1/) 
IndexArray4(3,:) = (/3,2,2,2/) 
IndexArray4(4,:) = (/3,2,1,2/) 
IndexArray4(5,:) = (/3,1,2,1/) 
Do i1=1,5 
gt1 = IndexArray4(i1,1) 
gt2 = IndexArray4(i1,2) 
gt3 = IndexArray4(i1,3) 
gt4 = IndexArray4(i1,4) 
Call CalculatePengV4L(gt1,gt2,gt3,gt4,.False.,MAh,MAh2,MChi,MChi2,Metp,               & 
& Metp2,MFe,MFe2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,cplAhAhhh,               & 
& cplAhcHpVWp,cplAhhhVZ,cplAhHpcVWp,cplcFeChicetpL,cplcFeChicetpR,cplcFeFeAhL,           & 
& cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplChiFeetpL,        & 
& cplChiFeetpR,cplcHpVPVWp,cplcHpVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,cpletpcetpVP,           & 
& cpletpcetpVZ,cpletphhcetp,cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,cplFvFeVWpR,               & 
& cplFvFvVZL,cplFvFvVZR,cplhhcHpVWp,cplhhcVWpVWp,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,       & 
& cplhhVZVZ,cplHpcHpVP,cplHpcHpVZ,cplHpcVWpVP,cplHpcVWpVZ,PVO4lSLL(gt1,gt2,gt3,gt4)      & 
& ,PVO4lSRR(gt1,gt2,gt3,gt4),PVO4lSRL(gt1,gt2,gt3,gt4),PVO4lSLR(gt1,gt2,gt3,gt4)         & 
& ,PVO4lVRR(gt1,gt2,gt3,gt4),PVO4lVLL(gt1,gt2,gt3,gt4),PVO4lVRL(gt1,gt2,gt3,gt4)         & 
& ,PVO4lVLR(gt1,gt2,gt3,gt4),PVO4lTLL(gt1,gt2,gt3,gt4),PVO4lTLR(gt1,gt2,gt3,gt4)         & 
& ,PVO4lTRL(gt1,gt2,gt3,gt4),PVO4lTRR(gt1,gt2,gt3,gt4))

End Do 


 ! **** TreeS4L **** 
 
IndexArray4(1,:) = (/2,1,1,1/) 
IndexArray4(2,:) = (/3,1,1,1/) 
IndexArray4(3,:) = (/3,2,2,2/) 
IndexArray4(4,:) = (/3,2,1,2/) 
IndexArray4(5,:) = (/3,1,2,1/) 
Do i1=1,5 
gt1 = IndexArray4(i1,1) 
gt2 = IndexArray4(i1,2) 
gt3 = IndexArray4(i1,3) 
gt4 = IndexArray4(i1,4) 
Call CalculateTreeS4L(gt1,gt2,gt3,gt4,.False.,MAh,MAh2,MChi,MChi2,Metp,               & 
& Metp2,MFe,MFe2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,cplAhAhhh,               & 
& cplAhcHpVWp,cplAhhhVZ,cplAhHpcVWp,cplcFeChicetpL,cplcFeChicetpR,cplcFeFeAhL,           & 
& cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplChiFeetpL,        & 
& cplChiFeetpR,cplcHpVPVWp,cplcHpVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,cpletpcetpVP,           & 
& cpletpcetpVZ,cpletphhcetp,cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,cplFvFeVWpR,               & 
& cplFvFvVZL,cplFvFvVZR,cplhhcHpVWp,cplhhcVWpVWp,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,       & 
& cplhhVZVZ,cplHpcHpVP,cplHpcHpVZ,cplHpcVWpVP,cplHpcVWpVZ,TSO4lSLL(gt1,gt2,gt3,gt4)      & 
& ,TSO4lSRR(gt1,gt2,gt3,gt4),TSO4lSRL(gt1,gt2,gt3,gt4),TSO4lSLR(gt1,gt2,gt3,gt4)         & 
& ,TSO4lVRR(gt1,gt2,gt3,gt4),TSO4lVLL(gt1,gt2,gt3,gt4),TSO4lVRL(gt1,gt2,gt3,gt4)         & 
& ,TSO4lVLR(gt1,gt2,gt3,gt4),TSO4lTLL(gt1,gt2,gt3,gt4),TSO4lTLR(gt1,gt2,gt3,gt4)         & 
& ,TSO4lTRL(gt1,gt2,gt3,gt4),TSO4lTRR(gt1,gt2,gt3,gt4))

End Do 


 ! **** TreeV4L **** 
 
IndexArray4(1,:) = (/2,1,1,1/) 
IndexArray4(2,:) = (/3,1,1,1/) 
IndexArray4(3,:) = (/3,2,2,2/) 
IndexArray4(4,:) = (/3,2,1,2/) 
IndexArray4(5,:) = (/3,1,2,1/) 
Do i1=1,5 
gt1 = IndexArray4(i1,1) 
gt2 = IndexArray4(i1,2) 
gt3 = IndexArray4(i1,3) 
gt4 = IndexArray4(i1,4) 
Call CalculateTreeV4L(gt1,gt2,gt3,gt4,.False.,MAh,MAh2,MChi,MChi2,Metp,               & 
& Metp2,MFe,MFe2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,cplAhAhhh,               & 
& cplAhcHpVWp,cplAhhhVZ,cplAhHpcVWp,cplcFeChicetpL,cplcFeChicetpR,cplcFeFeAhL,           & 
& cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplChiFeetpL,        & 
& cplChiFeetpR,cplcHpVPVWp,cplcHpVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,cpletpcetpVP,           & 
& cpletpcetpVZ,cpletphhcetp,cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,cplFvFeVWpR,               & 
& cplFvFvVZL,cplFvFvVZR,cplhhcHpVWp,cplhhcVWpVWp,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,       & 
& cplhhVZVZ,cplHpcHpVP,cplHpcHpVZ,cplHpcVWpVP,cplHpcVWpVZ,TVO4lSLL(gt1,gt2,gt3,gt4)      & 
& ,TVO4lSRR(gt1,gt2,gt3,gt4),TVO4lSRL(gt1,gt2,gt3,gt4),TVO4lSLR(gt1,gt2,gt3,gt4)         & 
& ,TVO4lVRR(gt1,gt2,gt3,gt4),TVO4lVLL(gt1,gt2,gt3,gt4),TVO4lVRL(gt1,gt2,gt3,gt4)         & 
& ,TVO4lVLR(gt1,gt2,gt3,gt4),TVO4lTLL(gt1,gt2,gt3,gt4),TVO4lTLR(gt1,gt2,gt3,gt4)         & 
& ,TVO4lTRL(gt1,gt2,gt3,gt4),TVO4lTRR(gt1,gt2,gt3,gt4))

End Do 


 ! **** Box4Lcross **** 
 
IndexArray4(1,:) = (/3,1,2,2/) 
IndexArray4(2,:) = (/3,2,1,1/) 
IndexArray4(3,:) = (/3,2,1,2/) 
IndexArray4(4,:) = (/3,1,2,1/) 
Do i1=1,4 
gt1 = IndexArray4(i1,1) 
gt2 = IndexArray4(i1,2) 
gt3 = IndexArray4(i1,3) 
gt4 = IndexArray4(i1,4) 
Call CalculateBox4Lcross(gt1,gt2,gt3,gt4,.False.,MAh,MAh2,MChi,MChi2,Metp,            & 
& Metp2,MFe,MFe2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,cplAhAhhh,               & 
& cplAhcHpVWp,cplAhhhVZ,cplAhHpcVWp,cplcFeChicetpL,cplcFeChicetpR,cplcFeFeAhL,           & 
& cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplChiFeetpL,        & 
& cplChiFeetpR,cplcHpVPVWp,cplcHpVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,cpletpcetpVP,           & 
& cpletpcetpVZ,cpletphhcetp,cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,cplFvFeVWpR,               & 
& cplFvFvVZL,cplFvFvVZR,cplhhcHpVWp,cplhhcVWpVWp,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,       & 
& cplhhVZVZ,cplHpcHpVP,cplHpcHpVZ,cplHpcVWpVP,cplHpcVWpVZ,BO4lSLLcross(gt1,gt2,gt3,gt4)  & 
& ,BO4lSRRcross(gt1,gt2,gt3,gt4),BO4lSRLcross(gt1,gt2,gt3,gt4),BO4lSLRcross(gt1,gt2,gt3,gt4)& 
& ,BO4lVRRcross(gt1,gt2,gt3,gt4),BO4lVLLcross(gt1,gt2,gt3,gt4),BO4lVRLcross(gt1,gt2,gt3,gt4)& 
& ,BO4lVLRcross(gt1,gt2,gt3,gt4),BO4lTLLcross(gt1,gt2,gt3,gt4),BO4lTLRcross(gt1,gt2,gt3,gt4)& 
& ,BO4lTRLcross(gt1,gt2,gt3,gt4),BO4lTRRcross(gt1,gt2,gt3,gt4))

End Do 


 ! **** PengS4Lcross **** 
 
IndexArray4(1,:) = (/3,1,2,2/) 
IndexArray4(2,:) = (/3,2,1,1/) 
IndexArray4(3,:) = (/3,2,1,2/) 
IndexArray4(4,:) = (/3,1,2,1/) 
Do i1=1,4 
gt1 = IndexArray4(i1,1) 
gt2 = IndexArray4(i1,2) 
gt3 = IndexArray4(i1,3) 
gt4 = IndexArray4(i1,4) 
Call CalculatePengS4Lcross(gt1,gt2,gt3,gt4,.False.,MAh,MAh2,MChi,MChi2,               & 
& Metp,Metp2,MFe,MFe2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,cplAhAhhh,          & 
& cplAhcHpVWp,cplAhhhVZ,cplAhHpcVWp,cplcFeChicetpL,cplcFeChicetpR,cplcFeFeAhL,           & 
& cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplChiFeetpL,        & 
& cplChiFeetpR,cplcHpVPVWp,cplcHpVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,cpletpcetpVP,           & 
& cpletpcetpVZ,cpletphhcetp,cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,cplFvFeVWpR,               & 
& cplFvFvVZL,cplFvFvVZR,cplhhcHpVWp,cplhhcVWpVWp,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,       & 
& cplhhVZVZ,cplHpcHpVP,cplHpcHpVZ,cplHpcVWpVP,cplHpcVWpVZ,PSO4lSLLcross(gt1,gt2,gt3,gt4) & 
& ,PSO4lSRRcross(gt1,gt2,gt3,gt4),PSO4lSRLcross(gt1,gt2,gt3,gt4),PSO4lSLRcross(gt1,gt2,gt3,gt4)& 
& ,PSO4lVRRcross(gt1,gt2,gt3,gt4),PSO4lVLLcross(gt1,gt2,gt3,gt4),PSO4lVRLcross(gt1,gt2,gt3,gt4)& 
& ,PSO4lVLRcross(gt1,gt2,gt3,gt4),PSO4lTLLcross(gt1,gt2,gt3,gt4),PSO4lTLRcross(gt1,gt2,gt3,gt4)& 
& ,PSO4lTRLcross(gt1,gt2,gt3,gt4),PSO4lTRRcross(gt1,gt2,gt3,gt4))

End Do 


 ! **** PengV4Lcross **** 
 
IndexArray4(1,:) = (/3,1,2,2/) 
IndexArray4(2,:) = (/3,2,1,1/) 
IndexArray4(3,:) = (/3,2,1,2/) 
IndexArray4(4,:) = (/3,1,2,1/) 
Do i1=1,4 
gt1 = IndexArray4(i1,1) 
gt2 = IndexArray4(i1,2) 
gt3 = IndexArray4(i1,3) 
gt4 = IndexArray4(i1,4) 
Call CalculatePengV4Lcross(gt1,gt2,gt3,gt4,.False.,MAh,MAh2,MChi,MChi2,               & 
& Metp,Metp2,MFe,MFe2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,cplAhAhhh,          & 
& cplAhcHpVWp,cplAhhhVZ,cplAhHpcVWp,cplcFeChicetpL,cplcFeChicetpR,cplcFeFeAhL,           & 
& cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplChiFeetpL,        & 
& cplChiFeetpR,cplcHpVPVWp,cplcHpVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,cpletpcetpVP,           & 
& cpletpcetpVZ,cpletphhcetp,cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,cplFvFeVWpR,               & 
& cplFvFvVZL,cplFvFvVZR,cplhhcHpVWp,cplhhcVWpVWp,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,       & 
& cplhhVZVZ,cplHpcHpVP,cplHpcHpVZ,cplHpcVWpVP,cplHpcVWpVZ,PVO4lSLLcross(gt1,gt2,gt3,gt4) & 
& ,PVO4lSRRcross(gt1,gt2,gt3,gt4),PVO4lSRLcross(gt1,gt2,gt3,gt4),PVO4lSLRcross(gt1,gt2,gt3,gt4)& 
& ,PVO4lVRRcross(gt1,gt2,gt3,gt4),PVO4lVLLcross(gt1,gt2,gt3,gt4),PVO4lVRLcross(gt1,gt2,gt3,gt4)& 
& ,PVO4lVLRcross(gt1,gt2,gt3,gt4),PVO4lTLLcross(gt1,gt2,gt3,gt4),PVO4lTLRcross(gt1,gt2,gt3,gt4)& 
& ,PVO4lTRLcross(gt1,gt2,gt3,gt4),PVO4lTRRcross(gt1,gt2,gt3,gt4))

End Do 


 ! **** TreeS4Lcross **** 
 
IndexArray4(1,:) = (/3,1,2,2/) 
IndexArray4(2,:) = (/3,2,1,1/) 
IndexArray4(3,:) = (/3,2,1,2/) 
IndexArray4(4,:) = (/3,1,2,1/) 
Do i1=1,4 
gt1 = IndexArray4(i1,1) 
gt2 = IndexArray4(i1,2) 
gt3 = IndexArray4(i1,3) 
gt4 = IndexArray4(i1,4) 
Call CalculateTreeS4Lcross(gt1,gt2,gt3,gt4,.False.,MAh,MAh2,MChi,MChi2,               & 
& Metp,Metp2,MFe,MFe2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,cplAhAhhh,          & 
& cplAhcHpVWp,cplAhhhVZ,cplAhHpcVWp,cplcFeChicetpL,cplcFeChicetpR,cplcFeFeAhL,           & 
& cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplChiFeetpL,        & 
& cplChiFeetpR,cplcHpVPVWp,cplcHpVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,cpletpcetpVP,           & 
& cpletpcetpVZ,cpletphhcetp,cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,cplFvFeVWpR,               & 
& cplFvFvVZL,cplFvFvVZR,cplhhcHpVWp,cplhhcVWpVWp,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,       & 
& cplhhVZVZ,cplHpcHpVP,cplHpcHpVZ,cplHpcVWpVP,cplHpcVWpVZ,TSO4lSLLcross(gt1,gt2,gt3,gt4) & 
& ,TSO4lSRRcross(gt1,gt2,gt3,gt4),TSO4lSRLcross(gt1,gt2,gt3,gt4),TSO4lSLRcross(gt1,gt2,gt3,gt4)& 
& ,TSO4lVRRcross(gt1,gt2,gt3,gt4),TSO4lVLLcross(gt1,gt2,gt3,gt4),TSO4lVRLcross(gt1,gt2,gt3,gt4)& 
& ,TSO4lVLRcross(gt1,gt2,gt3,gt4),TSO4lTLLcross(gt1,gt2,gt3,gt4),TSO4lTLRcross(gt1,gt2,gt3,gt4)& 
& ,TSO4lTRLcross(gt1,gt2,gt3,gt4),TSO4lTRRcross(gt1,gt2,gt3,gt4))

End Do 


 ! **** TreeV4Lcross **** 
 
IndexArray4(1,:) = (/3,1,2,2/) 
IndexArray4(2,:) = (/3,2,1,1/) 
IndexArray4(3,:) = (/3,2,1,2/) 
IndexArray4(4,:) = (/3,1,2,1/) 
Do i1=1,4 
gt1 = IndexArray4(i1,1) 
gt2 = IndexArray4(i1,2) 
gt3 = IndexArray4(i1,3) 
gt4 = IndexArray4(i1,4) 
Call CalculateTreeV4Lcross(gt1,gt2,gt3,gt4,.False.,MAh,MAh2,MChi,MChi2,               & 
& Metp,Metp2,MFe,MFe2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,cplAhAhhh,          & 
& cplAhcHpVWp,cplAhhhVZ,cplAhHpcVWp,cplcFeChicetpL,cplcFeChicetpR,cplcFeFeAhL,           & 
& cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplChiFeetpL,        & 
& cplChiFeetpR,cplcHpVPVWp,cplcHpVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,cpletpcetpVP,           & 
& cpletpcetpVZ,cpletphhcetp,cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,cplFvFeVWpR,               & 
& cplFvFvVZL,cplFvFvVZR,cplhhcHpVWp,cplhhcVWpVWp,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,       & 
& cplhhVZVZ,cplHpcHpVP,cplHpcHpVZ,cplHpcVWpVP,cplHpcVWpVZ,TVO4lSLLcross(gt1,gt2,gt3,gt4) & 
& ,TVO4lSRRcross(gt1,gt2,gt3,gt4),TVO4lSRLcross(gt1,gt2,gt3,gt4),TVO4lSLRcross(gt1,gt2,gt3,gt4)& 
& ,TVO4lVRRcross(gt1,gt2,gt3,gt4),TVO4lVLLcross(gt1,gt2,gt3,gt4),TVO4lVRLcross(gt1,gt2,gt3,gt4)& 
& ,TVO4lVLRcross(gt1,gt2,gt3,gt4),TVO4lTLLcross(gt1,gt2,gt3,gt4),TVO4lTLRcross(gt1,gt2,gt3,gt4)& 
& ,TVO4lTRLcross(gt1,gt2,gt3,gt4),TVO4lTRRcross(gt1,gt2,gt3,gt4))

End Do 


 ! **** Gamma2l **** 
 
IndexArray2(1,:) = (/2,1/) 
IndexArray2(2,:) = (/3,1/) 
IndexArray2(3,:) = (/3,2/) 
Do i1=1,3 
gt1 = IndexArray2(i1,1) 
gt2 = IndexArray2(i1,2) 
  gt3= 1 
Call CalculateGamma2l(gt1,gt2,gt3,.False.,MAh,MAh2,MChi,MChi2,Metp,Metp2,             & 
& MFe,MFe2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,cplcFeChicetpL,cplcFeChicetpR, & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,               & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,         & 
& cplChiFeetpL,cplChiFeetpR,cplcHpVPVWp,cplcVWpVPVWp,cpletpcetpVP,cplFvFeHpL,            & 
& cplFvFeHpR,cplFvFeVWpL,cplFvFeVWpR,cplHpcHpVP,cplHpcVWpVP,OA2lSL(gt1,gt2)              & 
& ,OA2lSR(gt1,gt2),OA1L(gt1,gt2),OA1R(gt1,gt2))

End Do 


 ! **** H2l **** 
 
IndexArray3(1,:) = (/1,2,1/) 
IndexArray3(2,:) = (/1,3,1/) 
IndexArray3(3,:) = (/2,3,1/) 
IndexArray3(4,:) = (/2,1,1/) 
IndexArray3(5,:) = (/3,1,1/) 
IndexArray3(6,:) = (/3,2,1/) 
Do i1=1,6 
gt1 = IndexArray3(i1,1) 
gt2 = IndexArray3(i1,2) 
 Do i2=1,1 
  gt3=i2 
Call CalculateH2l(gt1,gt2,gt3,.False.,MAh,MAh2,MChi,MChi2,Metp,Metp2,MFe,             & 
& MFe2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,cplAhAhhh,cplAhhhVZ,               & 
& cplcFeChicetpL,cplcFeChicetpR,cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,         & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFvcHpL,cplcFeFvcHpR,             & 
& cplcFeFvcVWpL,cplcFeFvcVWpR,cplChiFeetpL,cplChiFeetpR,cpletphhcetp,cplFvFeHpL,         & 
& cplFvFeHpR,cplFvFeVWpL,cplFvFeVWpR,cplhhcHpVWp,cplhhcVWpVWp,cplhhhhhh,cplhhHpcHp,      & 
& cplhhHpcVWp,cplhhVZVZ,OH2lSL(gt1,gt2,gt3),OH2lSR(gt1,gt2,gt3))

End Do 
 End Do 


 ! **** Z2l **** 
 
IndexArray2(1,:) = (/1,2/) 
IndexArray2(2,:) = (/1,3/) 
IndexArray2(3,:) = (/2,3/) 
Do i1=1,3 
gt1 = IndexArray2(i1,1) 
gt2 = IndexArray2(i1,2) 
  gt3= 1 
Call CalculateZ2l(gt1,gt2,gt3,.False.,MAh,MAh2,MChi,MChi2,Metp,Metp2,MFe,             & 
& MFe2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,cplAhhhVZ,cplcFeChicetpL,          & 
& cplcFeChicetpR,cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,            & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,           & 
& cplcFeFvcVWpR,cplChiFeetpL,cplChiFeetpR,cplcHpVWpVZ,cplcVWpVWpVZ,cpletpcetpVZ,         & 
& cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,cplFvFeVWpR,cplFvFvVZL,cplFvFvVZR,cplhhVZVZ,         & 
& cplHpcHpVZ,cplHpcVWpVZ,OZ2lSL(gt1,gt2),OZ2lSR(gt1,gt2),OZ2lVL(gt1,gt2),OZ2lVR(gt1,gt2))

End Do 


 ! ***** Combine operators for 2L2d
OllddSLL = BOllddSLL + PSOllddSLL + PVOllddSLL + TSOllddSLL + TVOllddSLL
OllddSRR = BOllddSRR + PSOllddSRR + PVOllddSRR + TSOllddSRR + TVOllddSRR
OllddSRL = BOllddSRL + PSOllddSRL + PVOllddSRL + TSOllddSRL + TVOllddSRL
OllddSLR = BOllddSLR + PSOllddSLR + PVOllddSLR + TSOllddSLR + TVOllddSLR
OllddVRR = BOllddVRR + PSOllddVRR + PVOllddVRR + TSOllddVRR + TVOllddVRR
OllddVLL = BOllddVLL + PSOllddVLL + PVOllddVLL + TSOllddVLL + TVOllddVLL
OllddVRL = BOllddVRL + PSOllddVRL + PVOllddVRL + TSOllddVRL + TVOllddVRL
OllddVLR = BOllddVLR + PSOllddVLR + PVOllddVLR + TSOllddVLR + TVOllddVLR
OllddTLL = BOllddTLL + PSOllddTLL + PVOllddTLL + TSOllddTLL + TVOllddTLL
OllddTLR = BOllddTLR + PSOllddTLR + PVOllddTLR + TSOllddTLR + TVOllddTLR
OllddTRL = BOllddTRL + PSOllddTRL + PVOllddTRL + TSOllddTRL + TVOllddTRL
OllddTRR = BOllddTRR + PSOllddTRR + PVOllddTRR + TSOllddTRR + TVOllddTRR

 ! ***** Combine operators for 2L2u
OlluuSLL = BOlluuSLL + PSOlluuSLL + PVOlluuSLL + TSOlluuSLL + TVOlluuSLL
OlluuSRR = BOlluuSRR + PSOlluuSRR + PVOlluuSRR + TSOlluuSRR + TVOlluuSRR
OlluuSRL = BOlluuSRL + PSOlluuSRL + PVOlluuSRL + TSOlluuSRL + TVOlluuSRL
OlluuSLR = BOlluuSLR + PSOlluuSLR + PVOlluuSLR + TSOlluuSLR + TVOlluuSLR
OlluuVRR = BOlluuVRR + PSOlluuVRR + PVOlluuVRR + TSOlluuVRR + TVOlluuVRR
OlluuVLL = BOlluuVLL + PSOlluuVLL + PVOlluuVLL + TSOlluuVLL + TVOlluuVLL
OlluuVRL = BOlluuVRL + PSOlluuVRL + PVOlluuVRL + TSOlluuVRL + TVOlluuVRL
OlluuVLR = BOlluuVLR + PSOlluuVLR + PVOlluuVLR + TSOlluuVLR + TVOlluuVLR
OlluuTLL = BOlluuTLL + PSOlluuTLL + PVOlluuTLL + TSOlluuTLL + TVOlluuTLL
OlluuTLR = BOlluuTLR + PSOlluuTLR + PVOlluuTLR + TSOlluuTLR + TVOlluuTLR
OlluuTRL = BOlluuTRL + PSOlluuTRL + PVOlluuTRL + TSOlluuTRL + TVOlluuTRL
OlluuTRR = BOlluuTRR + PSOlluuTRR + PVOlluuTRR + TSOlluuTRR + TVOlluuTRR

 ! ***** Combine operators for 4L
O4lSLL = BO4lSLL + PSO4lSLL + PVO4lSLL + TSO4lSLL + TVO4lSLL
O4lSRR = BO4lSRR + PSO4lSRR + PVO4lSRR + TSO4lSRR + TVO4lSRR
O4lSRL = BO4lSRL + PSO4lSRL + PVO4lSRL + TSO4lSRL + TVO4lSRL
O4lSLR = BO4lSLR + PSO4lSLR + PVO4lSLR + TSO4lSLR + TVO4lSLR
O4lVRR = BO4lVRR + PSO4lVRR + PVO4lVRR + TSO4lVRR + TVO4lVRR
O4lVLL = BO4lVLL + PSO4lVLL + PVO4lVLL + TSO4lVLL + TVO4lVLL
O4lVRL = BO4lVRL + PSO4lVRL + PVO4lVRL + TSO4lVRL + TVO4lVRL
O4lVLR = BO4lVLR + PSO4lVLR + PVO4lVLR + TSO4lVLR + TVO4lVLR
O4lTLL = BO4lTLL + PSO4lTLL + PVO4lTLL + TSO4lTLL + TVO4lTLL
O4lTLR = BO4lTLR + PSO4lTLR + PVO4lTLR + TSO4lTLR + TVO4lTLR
O4lTRL = BO4lTRL + PSO4lTRL + PVO4lTRL + TSO4lTRL + TVO4lTRL
O4lTRR = BO4lTRR + PSO4lTRR + PVO4lTRR + TSO4lTRR + TVO4lTRR

 ! ***** Combine operators for 4Lcross
O4lSLLcross = BO4lSLLcross + PSO4lSLLcross + PVO4lSLLcross + TSO4lSLLcross + TVO4lSLLcross
O4lSRRcross = BO4lSRRcross + PSO4lSRRcross + PVO4lSRRcross + TSO4lSRRcross + TVO4lSRRcross
O4lSRLcross = BO4lSRLcross + PSO4lSRLcross + PVO4lSRLcross + TSO4lSRLcross + TVO4lSRLcross
O4lSLRcross = BO4lSLRcross + PSO4lSLRcross + PVO4lSLRcross + TSO4lSLRcross + TVO4lSLRcross
O4lVRRcross = BO4lVRRcross + PSO4lVRRcross + PVO4lVRRcross + TSO4lVRRcross + TVO4lVRRcross
O4lVLLcross = BO4lVLLcross + PSO4lVLLcross + PVO4lVLLcross + TSO4lVLLcross + TVO4lVLLcross
O4lVRLcross = BO4lVRLcross + PSO4lVRLcross + PVO4lVRLcross + TSO4lVRLcross + TVO4lVRLcross
O4lVLRcross = BO4lVLRcross + PSO4lVLRcross + PVO4lVLRcross + TSO4lVLRcross + TVO4lVLRcross
O4lTLLcross = BO4lTLLcross + PSO4lTLLcross + PVO4lTLLcross + TSO4lTLLcross + TVO4lTLLcross
O4lTLRcross = BO4lTLRcross + PSO4lTLRcross + PVO4lTLRcross + TSO4lTLRcross + TVO4lTLRcross
O4lTRLcross = BO4lTRLcross + PSO4lTRLcross + PVO4lTRLcross + TSO4lTRLcross + TVO4lTRLcross
O4lTRRcross = BO4lTRRcross + PSO4lTRRcross + PVO4lTRRcross + TSO4lTRRcross + TVO4lTRRcross

 ! ***** Combine operators for Gamma2l
K1L = OA1L
K1R = OA1R
K2L = OA2lSL
K2R = OA2lSR
K1L = K1L/sqrt(Alpha_MZ*4*Pi)
K1R = K1R/sqrt(Alpha_MZ*4*Pi)
K2L(2,:) = -0.5_dp*K2L(2,:)/sqrt(Alpha_MZ*4*Pi)/mf_l_mz(2)
K2L(3,:) = -0.5_dp*K2L(3,:)/sqrt(Alpha_MZ*4*Pi)/mf_l_mz(3)
K2R(2,:) = -0.5_dp*K2R(2,:)/sqrt(Alpha_MZ*4*Pi)/mf_l_mz(2)
K2R(3,:) = -0.5_dp*K2R(3,:)/sqrt(Alpha_MZ*4*Pi)/mf_l_mz(3)

 ! **** hLLp **** 
 
Call Calculate_hLLp(OH2lSL,OH2lSR,BrhtoMuE,BrhtoTauE,BrhtoTauMu)


 ! **** LLpGamma **** 
 
Call Calculate_LLpGamma(K2L,K2R,muEgamma,tauEgamma,tauMuGamma)


 ! **** Lto3Lp **** 
 
Call Calculate_Lto3Lp(K1L,K1R,K2L,K2R,O4lSLL,O4lSRR,O4lSRL,O4lSLR,O4lVRR,             & 
& O4lVLL,O4lVRL,O4lVLR,O4lTLL,O4lTRR,BRmuTo3e,BRtauTo3e,BRtauTo3mu)


 ! **** LtoL1L2L2 **** 
 
Call Calculate_LtoL1L2L2(K1L,K1R,K2L,K2R,O4lSLL,O4lSRR,O4lSRL,O4lSLR,O4lVRR,          & 
& O4lVLL,O4lVRL,O4lVLR,O4lTLL,O4lTRR,O4lSLLcross,O4lSRRcross,O4lSRLcross,O4lSLRcross,    & 
& O4lVRRcross,O4lVLLcross,O4lVRLcross,O4lVLRcross,O4lTLLcross,O4lTRRcross,               & 
& BRtauToemumu,BRtauTomuee,BRtauToemumu2,BRtauTomuee2)


 ! **** MuEconversion **** 
 
Call Calculate_MuEconversion(K1L,K1R,K2L,K2R,OllddSLL,OllddSRR,OllddSRL,              & 
& OllddSLR,OllddVRR,OllddVLL,OllddVRL,OllddVLR,OllddTLL,OllddTLR,OllddTRL,               & 
& OllddTRR,OlluuSLL,OlluuSRR,OlluuSRL,OlluuSLR,OlluuVRR,OlluuVLL,OlluuVRL,               & 
& OlluuVLR,OlluuTLL,OlluuTLR,OlluuTRL,OlluuTRR,CRmuEAl,CRmuETi,CRmuESr,CRmuESb,          & 
& CRmuEAu,CRmuEPb)


 ! **** TauLMeson **** 
 
Call Calculate_TauLMeson(OllddSLL,OllddSRR,OllddSRL,OllddSLR,OllddVRR,OllddVLL,       & 
& OllddVRL,OllddVLR,OlluuSLL,OlluuSRR,OlluuSRL,OlluuSLR,OlluuVRR,OlluuVLL,               & 
& OlluuVRL,OlluuVLR,BrTautoEPi,BrTautoEEta,BrTautoEEtap,BrTautoMuPi,BrTautoMuEta,        & 
& BrTautoMuEtap)


 ! **** ZLLp **** 
 
Call Calculate_ZLLp(OZ2lSL,OZ2lSR,OZ2lVL,OZ2lVR,BrZtoMuE,BrZtoTauE,BrZtoTauMu)

Mhh= Mhh_s 
Mhh2 = Mhh2_s 
MAh= MAh_s 
MAh2 = MAh2_s 

! *****  G minus 2 ***** 

Call Gminus2(1,MAh,MAh2,MChi,MChi2,Metp,Metp2,MFe,MFe2,MFv,MFv2,Mhh,Mhh2,             & 
& MHp,MHp2,cplcFeFeAhL,cplcFeFeAhR,cplChiFeetpL,cplChiFeetpR,cplcFeChicetpL,             & 
& cplcFeChicetpR,cpletpcetpVP,cplFvFeHpL,cplFvFeHpR,cplcFeFehhL,cplcFeFehhR,             & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFvcHpL,cplcFeFvcHpR,cplHpcHpVP,ae)

Call Gminus2(2,MAh,MAh2,MChi,MChi2,Metp,Metp2,MFe,MFe2,MFv,MFv2,Mhh,Mhh2,             & 
& MHp,MHp2,cplcFeFeAhL,cplcFeFeAhR,cplChiFeetpL,cplChiFeetpR,cplcFeChicetpL,             & 
& cplcFeChicetpR,cpletpcetpVP,cplFvFeHpL,cplFvFeHpR,cplcFeFehhL,cplcFeFehhR,             & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFvcHpL,cplcFeFvcHpR,cplHpcHpVP,amu)

Call Gminus2(3,MAh,MAh2,MChi,MChi2,Metp,Metp2,MFe,MFe2,MFv,MFv2,Mhh,Mhh2,             & 
& MHp,MHp2,cplcFeFeAhL,cplcFeFeAhR,cplChiFeetpL,cplChiFeetpR,cplcFeChicetpL,             & 
& cplcFeChicetpR,cpletpcetpVP,cplFvFeHpL,cplFvFeHpR,cplcFeFehhL,cplcFeFehhR,             & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFvcHpL,cplcFeFvcHpR,cplHpcHpVP,atau)


! *****  Lepton EDM ***** 

Call LeptonEDM(1,MAh,MAh2,MChi,MChi2,Metp,Metp2,MFe,MFe2,MFv,MFv2,Mhh,Mhh2,           & 
& MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,cplcFeFeAhL,cplcFeFeAhR,cplChiFeetpL,cplChiFeetpR,        & 
& cplcFeChicetpL,cplcFeChicetpR,cpletpcetpVP,cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,          & 
& cplFvFeVWpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplHpcHpVP,          & 
& cplcVWpVPVWp,EDMe)

Call LeptonEDM(2,MAh,MAh2,MChi,MChi2,Metp,Metp2,MFe,MFe2,MFv,MFv2,Mhh,Mhh2,           & 
& MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,cplcFeFeAhL,cplcFeFeAhR,cplChiFeetpL,cplChiFeetpR,        & 
& cplcFeChicetpL,cplcFeChicetpR,cpletpcetpVP,cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,          & 
& cplFvFeVWpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplHpcHpVP,          & 
& cplcVWpVPVWp,EDMmu)

Call LeptonEDM(3,MAh,MAh2,MChi,MChi2,Metp,Metp2,MFe,MFe2,MFv,MFv2,Mhh,Mhh2,           & 
& MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,cplcFeFeAhL,cplcFeFeAhR,cplChiFeetpL,cplChiFeetpR,        & 
& cplcFeChicetpL,cplcFeChicetpR,cpletpcetpVP,cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,          & 
& cplFvFeVWpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplHpcHpVP,          & 
& cplcVWpVPVWp,EDMtau)


! *****  delta Rho ***** 

sinW2=0.22290_dp 
TW = asin(sqrt(sinW2)) 
g2=Sqrt(4._dp*Sqrt2*G_F*mW2) 
g1=g2*Sqrt(sinW2/(1._dp-sinW2)) 
mW2=(1._dp-sinW2)*mz2 + 0
vev2=Sqrt(mZ2*(1._dp-sinW2)*SinW2/(pi*alpha)) +0 
v=vev2 
Call SolveTadpoleEquations(g1,g2,g3,lam1,lam2,lam4,lam3,lam5,Yn,Yu,Yd,Ye,             & 
& Mn,mH2,mEt2,v,(/ ZeroC, ZeroC /))

Call TreeMasses(MAh,MAh2,MChi,MChi2,MetI,MetI2,Metp,Metp2,MetR,MetR2,MFd,             & 
& MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,              & 
& ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZW,ZX,ZZ,v,g1,g2,g3,lam1,lam2,lam4,lam3,lam5,               & 
& Yn,Yu,Yd,Ye,Mn,mH2,mEt2,GenerationMixing,kont)

MVWp = mW 
MVWp2 = mW2 
MVZ = mZ 
MVZ2 = mZ2 
MFe(1:3) = mf_l 
MFe2(1:3) = mf_l**2 
MFu(1:3) = mf_u 
MFu2(1:3) = mf_u**2 
MFd(1:3) = mf_d 
MFd2(1:3) = mf_d**2 
Call CouplingsForVectorBosons(g2,g1,TW,v,ZDL,ZUL,UV,ZEL,cplAhcHpVWp,cplhhcHpVWp,      & 
& cplHpcHpVZ,cplcHpVPVWp,cplcHpVWpVZ,cplHpcHpcVWpVWp,cplHpcHpVZVZ,cpletIcetpVWp,         & 
& cpletpcetpVZ,cpletRcetpVWp,cpletpcetpcVWpVWp,cpletpcetpVZVZ,cplAhhhVZ,cplAhHpcVWp,     & 
& cplAhAhcVWpVWp,cplAhAhVZVZ,cplhhHpcVWp,cplhhcVWpVWp,cplhhVZVZ,cplhhhhcVWpVWp,          & 
& cplhhhhVZVZ,cpletIetpcVWp,cpletIetRVZ,cpletIetIcVWpVWp,cpletIetIVZVZ,cpletpetRcVWp,    & 
& cpletRetRcVWpVWp,cpletRetRVZVZ,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,        & 
& cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcgWpgWpVZ,cplcgWCgWCVZ,               & 
& cplHpcVWpVZ,cplcVWpVWpVZ,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,              & 
& cplcFdFucVWpL,cplcFdFucVWpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplcgWCgAcVWp,cplcgAgWpcVWp,   & 
& cplcgZgWpcVWp,cplcgWCgZcVWp,cplHpcVWpVP,cplcVWpVPVWp,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,  & 
& cplcVWpVPVPVWp3,cplcVWpcVWpVWpVWp1,cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3)

Call DeltaRho(MAh,MAh2,MetI,MetI2,Metp,Metp2,MetR,MetR2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,cplAhAhcVWpVWp,cplAhAhVZVZ,    & 
& cplAhhhVZ,cplAhHpcVWp,cplcFdFdVZL,cplcFdFdVZR,cplcFdFucVWpL,cplcFdFucVWpR,             & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplcFuFuVZL,cplcFuFuVZR,           & 
& cplcgAgWpcVWp,cplcgWCgAcVWp,cplcgWCgWCVZ,cplcgWCgZcVWp,cplcgWpgWpVZ,cplcgZgWpcVWp,     & 
& cplcVWpcVWpVWpVWp1,cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3,cplcVWpVPVPVWp1,              & 
& cplcVWpVPVPVWp2,cplcVWpVPVPVWp3,cplcVWpVPVWp,cplcVWpVWpVZ,cplcVWpVWpVZVZ1,             & 
& cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,cpletIetIcVWpVWp,cpletIetIVZVZ,cpletIetpcVWp,          & 
& cpletIetRVZ,cpletpcetpcVWpVWp,cpletpcetpVZ,cpletpcetpVZVZ,cpletpetRcVWp,               & 
& cpletRetRcVWpVWp,cpletRetRVZVZ,cplFvFvVZL,cplFvFvVZR,cplhhcVWpVWp,cplhhhhcVWpVWp,      & 
& cplhhhhVZVZ,cplhhHpcVWp,cplhhVZVZ,cplHpcHpcVWpVWp,cplHpcHpVZ,cplHpcHpVZVZ,             & 
& cplHpcVWpVP,cplHpcVWpVZ,dRho)

Call SolveTadpoleEquations(g1,g2,g3,lam1,lam2,lam4,lam3,lam5,Yn,Yu,Yd,Ye,             & 
& Mn,mH2,mEt2,v,(/ ZeroC, ZeroC /))

CalculateOneLoopMassesSave = CalculateOneLoopMasses 
CalculateOneLoopMasses = .true. 
Call OneLoopMasses(MAh,MAh2,MChi,MChi2,MetI,MetI2,Metp,Metp2,MetR,MetR2,              & 
& MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,             & 
& TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZW,ZX,ZZ,v,g1,g2,g3,lam1,lam2,lam4,lam3,lam5,            & 
& Yn,Yu,Yd,Ye,Mn,mH2,mEt2,kont)

CalculateOneLoopMasses = CalculateOneLoopMassesSave 
nuMasses = MFv 
nuMixing = UV 
MVWp = mW 
MVWp2 = mW2 
MVZ = mZ 
MVZ2 = mZ2 
MFe(1:3) = mf_l 
MFe2(1:3) = mf_l**2 
MFu(1:3) = mf_u 
MFu2(1:3) = mf_u**2 
MFd(1:3) = mf_d 
MFd2(1:3) = mf_d**2 
If (WriteParametersAtQ) Then 
scalein = SetRenormalizationScale(160._dp**2) 
Else 
scalein = SetRenormalizationScale(scale_save**2) 
End if 
mz2 = mzsave**2 
mz = mzsave 
End subroutine CalculateLowEnergyConstraints 
 
 
End Program SPhenoScotogenic 

! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.8.5 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 23:13 on 24.5.2016   
! ----------------------------------------------------------------------  
 
 
Module Model_Data_Zee 
 
Use Control 
Use LoopFunctions 
Logical, Save :: PrintPartialContributions = .False. 
Logical, Save :: Enable3BDecays = .True. 
Logical, Save :: Enable3BDecaysS = .True. 
Logical, Save :: Enable3BDecaysF = .True. 
Logical, Save :: FirstRun = .True. 
Logical, Save :: RunningCouplingsDecays = .True. 
Logical, Save :: WriteSLHA1 = .False. 
Logical, Save :: MakeQTEST = .False. 
Logical, Save :: CalculateOneLoopMasses = .True. 
Logical, Save :: CalculateOneLoopMassesSave = .True. 
Logical, Save :: CalculateTwoLoopHiggsMasses = .True. 
Logical, Save :: SUSYrunningFromMZ = .True. 
Logical :: CalculateTwoLoopHiggsMassesSave = .True. 
Logical, Save :: CalculateLowEnergy = .True. 
Logical, Save :: WriteParametersAtQ = .False. 
Logical, Save :: TwoLoopRGE=.True.
Logical, Save :: SMrunningLowScaleInput=.False.
Logical, Save :: RunningSUSYparametersLowEnergy=.True.
Logical, Save :: RunningSMparametersLowEnergy=.True.
Integer, Save :: MinimalNumberIterations = 5
Logical :: NonSUSYrunningLowScale = .false.
Logical :: SwitchToSCKM= .False. 
Logical :: CalculateMSSM2Loop= .False. 
Logical :: GaugelessLimit= .True. 
Logical :: FoundIterativeSolution = .True.
Logical :: WriteOutputForNonConvergence=.True.
Logical :: SPA_Convention 
Logical :: ForceRealMatrices = .False. 
Logical :: WriteGUTvalues 
Logical :: TwoLoopSafeMode 
Integer :: TwoLoopMethod = 3 
Logical :: WriteTreeLevelTadpoleParameters = .false. 
Logical :: IncludeDeltaVB = .True. 
Logical :: IncludeBSMdeltaVB = .True. 
Real(dp) :: WidthToBeInvisible = 0._dp 
Logical :: HigherOrderDiboson = .True. 
Real(dp) :: nLep = 3._dp, mf_u_mz_running 
Real(dp) :: nUp = 2._dp 
Real(dp) :: err2L = 0._dp 
Real(dp) :: nDown = 3._dp 
Real(dp) :: MaxMassLoop = 1.0E16_dp 
Real(dp) :: MinWidth = 1.0E-30_dp 
Real(dp) :: MaxMassNumericalZero = 1.0E-8_dp 
Logical :: runningTopMZ= .False. 
Logical :: PrintDebugInformation = .False. 
Logical ::IncludeThresholdsAtScale 
Logical :: PurelyNumericalEffPot 
Real(dp) :: hstep_pn, hstep_sa 
Real(dp) :: tau_pi0=0.0000000000000000852_dp, mass_pi0=0.13498_dp
Real(dp) :: tau_pip=0.000000026_dp, mass_pip=0.13957_dp
Real(dp) :: tau_rho0=0.00000000000000000000000441_dp, mass_rho0=0.77549_dp
Real(dp) :: tau_D0=0.00000000000041_dp, mass_D0=1.86486_dp
Real(dp) :: tau_Dp=0.00000000000104_dp, mass_Dp=1.86926_dp
Real(dp) :: tau_DSp=0.0000000000005_dp, mass_DSp=1.96849_dp
Real(dp) :: tau_DSsp=0, mass_DSsp=2.1123_dp
Real(dp) :: tau_eta=0.000000000000000000506_dp, mass_eta=0.54785_dp
Real(dp) :: tau_etap=0.00000000000000000000331_dp, mass_etap=0.95778_dp
Real(dp) :: tau_omega=0.0000000000000000000000775_dp, mass_omega=0.78265_dp
Real(dp) :: tau_phi=0.000000000000000000000154_dp, mass_phi=1.01946_dp
Real(dp) :: tau_KL0=0.0000000512_dp, mass_KL0=0
Real(dp) :: tau_KS0=0.00000000009_dp, mass_KS0=0
Real(dp) :: tau_K0=0, mass_K0=0.49761_dp
Real(dp) :: tau_Kp=0.0000000124_dp, mass_Kp=0.49368_dp
Real(dp) :: tau_B0d=0.00000000000152_dp, mass_B0d=5.27958_dp
Real(dp) :: tau_B0s=0.0000000000015_dp, mass_B0s=5.36677_dp
Real(dp) :: tau_Bp=0.00000000000164_dp, mass_Bp=5.27925_dp
Real(dp) :: tau_B0c=0.0000000000000000000000143_dp, mass_B0c=5.3252_dp
Real(dp) :: tau_Bpc=0.0000000000000000000000143_dp, mass_Bpc=5.3252_dp
Real(dp) :: tau_Bcp=0.000000000000454_dp, mass_Bcp=6.277_dp
Real(dp) :: tau_K0c=0.0000000000000000000000142_dp, mass_K0c=0.8959_dp
Real(dp) :: tau_Kpc=0.000000000000000000000013_dp, mass_Kpc=0.8917_dp
Real(dp) :: tau_etac=0.0000000000000000000000222_dp, mass_etac=2.981_dp
Real(dp) :: tau_JPsi=0.00000000000000000000000708_dp, mass_JPSi=3096.92_dp
Real(dp) :: tau_Ups=0.0000000000000000000000121_dp, mass_Ups=9.4603_dp
Real(dp) :: f_k_CONST=0.1598_dp
Real(dp) :: f_Kp_CONST=0.156_dp
Real(dp) :: h_k_CONST=0
Real(dp) :: f_pi_CONST=0.118_dp
Real(dp) :: f_B0d_CONST=0.19_dp
Real(dp) :: f_B0s_CONST=0.227_dp
Real(dp) :: f_Bp_CONST=0.234_dp
Real(dp) :: f_eta_q_CONST=0.13_dp
Real(dp) :: f_eta_s_CONST=0
Real(dp) :: h_eta_q_CONST=0
Real(dp) :: h_eta_s_CONST=0
Real(dp) :: f_etap_CONST=0.172_dp
Real(dp) :: f_rho_CONST=0.22_dp
Real(dp) :: h_rho_CONST=0
Real(dp) :: f_omega_q_CONST=0
Real(dp) :: f_omega_s_CONST=0
Real(dp) :: h_omega_q_CONST=0
Real(dp) :: h_omega_s_CONST=0
Real(dp) :: f_Dp_CONST=0.256_dp
Real(dp) :: f_D_CONST=0.248_dp
Real(dp) :: f_Dsp_CONST=0.256_dp
Complex(dp) :: coeffC7sm = 0._dp
Complex(dp) :: coeffC7 = 0._dp
Complex(dp) :: coeffC7p = 0._dp
Complex(dp) :: coeffC7NP = 0._dp
Complex(dp) :: coeffC7pNP = 0._dp
Complex(dp) :: coeffC8sm = 0._dp
Complex(dp) :: coeffC8 = 0._dp
Complex(dp) :: coeffC8p = 0._dp
Complex(dp) :: coeffC8NP = 0._dp
Complex(dp) :: coeffC8pNP = 0._dp
Complex(dp) :: coeffC9eeSM = 0._dp
Complex(dp) :: coeffC9ee = 0._dp
Complex(dp) :: coeffC9Pee = 0._dp
Complex(dp) :: coeffC9eeNP = 0._dp
Complex(dp) :: coeffC9PeeNP = 0._dp
Complex(dp) :: coeffC10eeSM = 0._dp
Complex(dp) :: coeffC10ee = 0._dp
Complex(dp) :: coeffC10Pee = 0._dp
Complex(dp) :: coeffC10eeNP = 0._dp
Complex(dp) :: coeffC10PeeNP = 0._dp
Complex(dp) :: coeffC9mumuSM = 0._dp
Complex(dp) :: coeffC9mumu = 0._dp
Complex(dp) :: coeffC9Pmumu = 0._dp
Complex(dp) :: coeffC9mumuNP = 0._dp
Complex(dp) :: coeffC9PmumuNP = 0._dp
Complex(dp) :: coeffC10mumuSM = 0._dp
Complex(dp) :: coeffC10mumu = 0._dp
Complex(dp) :: coeffC10Pmumu = 0._dp
Complex(dp) :: coeffC10mumuNP = 0._dp
Complex(dp) :: coeffC10PmumuNP = 0._dp
Complex(dp) :: coeffCLnu1nu1SM = 0._dp
Complex(dp) :: coeffCLnu1nu1 = 0._dp
Complex(dp) :: coeffCLPnu1nu1 = 0._dp
Complex(dp) :: coeffCLnu1nu1NP = 0._dp
Complex(dp) :: coeffCLPnu1nu1NP = 0._dp
Complex(dp) :: coeffCLnu2nu2SM = 0._dp
Complex(dp) :: coeffCLnu2nu2 = 0._dp
Complex(dp) :: coeffCLPnu2nu2 = 0._dp
Complex(dp) :: coeffCLnu2nu2NP = 0._dp
Complex(dp) :: coeffCLPnu2nu2NP = 0._dp
Complex(dp) :: coeffCLnu3nu3SM = 0._dp
Complex(dp) :: coeffCLnu3nu3 = 0._dp
Complex(dp) :: coeffCLPnu3nu3 = 0._dp
Complex(dp) :: coeffCLnu3nu3NP = 0._dp
Complex(dp) :: coeffCLPnu3nu3NP = 0._dp
Complex(dp) :: coeffCRnu1nu1SM = 0._dp
Complex(dp) :: coeffCRnu1nu1 = 0._dp
Complex(dp) :: coeffCRPnu1nu1 = 0._dp
Complex(dp) :: coeffCRnu1nu1NP = 0._dp
Complex(dp) :: coeffCRPnu1nu1NP = 0._dp
Complex(dp) :: coeffCRnu2nu2SM = 0._dp
Complex(dp) :: coeffCRnu2nu2 = 0._dp
Complex(dp) :: coeffCRPnu2nu2 = 0._dp
Complex(dp) :: coeffCRnu2nu2NP = 0._dp
Complex(dp) :: coeffCRPnu2nu2NP = 0._dp
Complex(dp) :: coeffCRnu3nu3SM = 0._dp
Complex(dp) :: coeffCRnu3nu3 = 0._dp
Complex(dp) :: coeffCRPnu3nu3 = 0._dp
Complex(dp) :: coeffCRnu3nu3NP = 0._dp
Complex(dp) :: coeffCRPnu3nu3NP = 0._dp
Real(dp) :: MW_SM 
Real(dp) :: Alpha_160, AlphaS_160, SinW2_160, sinW2_MZ 
Real(dp) :: mf_d_160(3), mf_u_160(3), mf_l_160(3), mf_d2_160(3), mf_u2_160(3), mf_l2_160(3) 
Real(dp) :: mf_d2_MZ(3), mf_u2_MZ(3), mf_l2_MZ(3) 
Complex(dp) :: CKM_160(3,3), CKM_MZ(3,3) 
Logical :: TransposedYukawa= .False. 
Logical :: KineticMixing = .True. 
Logical :: KineticMixingSave = .True. 
Logical :: WriteTreeLevelTadpoleSolutions = .False. 
Logical :: WriteHiggsDiphotonLoopContributions = .False. 
Logical :: WriteEffHiggsCouplingRatios = .True. 
Complex(dp) :: M112Tree 
Complex(dp) :: M1121L 
Complex(dp) :: M1122L 
Complex(dp) :: M222Tree 
Complex(dp) :: M2221L 
Complex(dp) :: M2222L 
Integer :: SolutionTadpoleNr = 1 
Character(len=15)::HighScaleModel
Real(dp) :: g1,g2,g3,Lam6,Lam5,Lam7,Lam10,Mu,M12

Complex(dp) :: Lam1,Lam4,Lam3,Lam2,Lam8,Lam9,Lamh,epsU(3,3),Yu(3,3),Yd(3,3),Ye(3,3),epsD(3,3),       & 
& epsE(3,3),Yh(3,3),M112,M222,Mh

Real(dp) :: g1IN,g2IN,g3IN,Lam6IN,Lam5IN,Lam7IN,Lam10IN,MuIN,M12IN

Complex(dp) :: Lam1IN,Lam4IN,Lam3IN,Lam2IN,Lam8IN,Lam9IN,LamhIN,epsUIN(3,3),YuIN(3,3),               & 
& YdIN(3,3),YeIN(3,3),epsDIN(3,3),epsEIN(3,3),YhIN(3,3),M112IN,M222IN,MhIN

Real(dp) :: g1MZ,g2MZ,g3MZ,Lam6MZ,Lam5MZ,Lam7MZ,Lam10MZ,MuMZ,M12MZ

Complex(dp) :: Lam1MZ,Lam4MZ,Lam3MZ,Lam2MZ,Lam8MZ,Lam9MZ,LamhMZ,epsUMZ(3,3),YuMZ(3,3),               & 
& YdMZ(3,3),YeMZ(3,3),epsDMZ(3,3),epsEMZ(3,3),YhMZ(3,3),M112MZ,M222MZ,MhMZ

Real(dp) :: g1GUT,g2GUT,g3GUT,Lam6GUT,Lam5GUT,Lam7GUT,Lam10GUT,MuGUT,M12GUT

Complex(dp) :: Lam1GUT,Lam4GUT,Lam3GUT,Lam2GUT,Lam8GUT,Lam9GUT,LamhGUT,epsUGUT(3,3),YuGUT(3,3),      & 
& YdGUT(3,3),YeGUT(3,3),epsDGUT(3,3),epsEGUT(3,3),YhGUT(3,3),M112GUT,M222GUT,MhGUT

Real(dp) :: MAh(2),MAh2(2),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(3),MFv2(3),           & 
& Mhh(2),Mhh2(2),MHm(3),MHm2(3),MVWm,MVWm2,MVZ,MVZ2,TW,v,ZA(2,2),ZH(2,2),ZZ(2,2),        & 
& alphaH,betaH

Complex(dp) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),UV(3,3),ZP(3,3),ZW(2,2)

Real(dp) :: vd,vu

Real(dp) :: vdIN,vuIN

Real(dp) :: vdFix,vuFix

Real(dp) :: gPFu(3,156),gTFu(3),BRFu(3,156),gPFe(3,156),gTFe(3),BRFe(3,156),gPFd(3,156),          & 
& gTFd(3),BRFd(3,156),gPFv(3,12),gTFv(3),BRFv(3,12),gPhh(2,44),gThh(2),BRhh(2,44),       & 
& gPAh(2,39),gTAh(2),BRAh(2,39),gPHm(3,30),gTHm(3),BRHm(3,30)

Real(dp) :: ratioFd(2,3),ratioFe(2,3),ratioFu(2,3),ratioHm(2,3),ratioVWm(2)

Complex(dp) :: ratioGG(2),ratioPP(2)

Real(dp) :: ratioPFd(2,3),ratioPFe(2,3),ratioPFu(2,3),ratioPHm(2,3),ratioPVWm(2)

Complex(dp) :: ratioPGG(2),ratioPPP(2)

Real(dp) :: gForTadpoles(157)
Complex(dp) :: tForTadpoles(2)
Real(dp) :: g1_saveEP 
Real(dp) :: g2_saveEP 
Logical :: RotateNegativeFermionMasses=.True. 
Logical,save::IgnoreNegativeMasses= .False.
Logical,save::IgnoreMuSignFlip= .False.
Logical,save::IgnoreNegativeMassesMZ= .False.
Logical,save::Write_WHIZARD= .False.
Integer,save::BoundaryCondition=1 
Logical,Save::MZ_input= .False. 
 
Real(dp) :: CS_Higgs_LHC(5,2,5) 
 
Real(dp) :: CS_PHiggs_LHC(5,2,5) 
 
Real (dp) :: MhhL(2), Mhh2L(2) 
Real (dp) :: Mhh_s(2), Mhh2_s(2) 
Real (dp) :: MAhL(2), MAh2L(2) 
Real (dp) :: MAh_s(2), MAh2_s(2) 
Real (dp) :: FineTuningResults(0) 
Real (dp) :: FineTuningResultsAllVEVs(0) 
Logical, Save :: OneLoopFT = .False. 
Logical, Save :: CalcFT = .True. 
Integer,save::YukawaScheme=1
Logical, save :: CheckSugraDetails(10) =.False. & 
                        &, SugraErrors(10) =.False. &
                        &, StrictUnification =.False. &
                        &, UseFixedScale =.False. &
                        &, UseFixedGUTScale =.False. 
Real(dp), save :: GUT_scale 
Real(dp) :: g3running 
Logical, save :: InputValueforg1 =.False. 
Logical, save :: InputValueforg2 =.False. 
Logical, save :: InputValueforg3 =.False. 
Logical, save :: InputValueforLam6 =.False. 
Logical, save :: InputValueforLam5 =.False. 
Logical, save :: InputValueforLam7 =.False. 
Logical, save :: InputValueforLam10 =.False. 
Logical, save :: InputValueforLam1 =.False. 
Logical, save :: InputValueforLam4 =.False. 
Logical, save :: InputValueforLam3 =.False. 
Logical, save :: InputValueforLam2 =.False. 
Logical, save :: InputValueforLam8 =.False. 
Logical, save :: InputValueforLam9 =.False. 
Logical, save :: InputValueforLamh =.False. 
Logical, save :: InputValueforepsU =.False. 
Logical, save :: InputValueforYu =.False. 
Logical, save :: InputValueforYd =.False. 
Logical, save :: InputValueforYe =.False. 
Logical, save :: InputValueforepsD =.False. 
Logical, save :: InputValueforepsE =.False. 
Logical, save :: InputValueforYh =.False. 
Logical, save :: InputValueforMu =.False. 
Logical, save :: InputValueforM12 =.False. 
Logical, save :: InputValueforM112 =.False. 
Logical, save :: InputValueforM222 =.False. 
Logical, save :: InputValueforMh =.False. 
Complex(dp) :: CKMcomplex(3,3) 
Real(dp) :: Xi = 1._dp 
Real(dp) :: RXi = 1._dp 
Real(dp) :: RXiNew = 1._dp 
Real(dp), save :: RXiG = 1._dp 
Real(dp), save :: RXiP = 1._dp 
Real(dp), save :: RXiWm = 1._dp 
Real(dp), save :: RXiZ = 1._dp 
Real(dp) :: nuMasses(3) 
Complex(dp) :: nuMixing(3,3) 
Complex(dp) :: temporaryValue 
Complex(dp) :: Lambda1Input
Complex(dp) :: Lambda2Input
Complex(dp) :: Lambda3Input
Complex(dp) :: Lambda4Input
Complex(dp) :: Lambda5Input
Complex(dp) :: Lambda6Input
Complex(dp) :: Lambda7Input
Complex(dp) :: Lambda8Input
Complex(dp) :: Lambda9Input
Complex(dp) :: Lambda10Input
Complex(dp) :: LambdahInput
Complex(dp) :: M12input
Complex(dp) :: Mhinput
Complex(dp) :: Muinput
Real(dp) :: TanBeta
Real(dp) :: vdMZ 
Real(dp) :: vdSUSY 
Real(dp) :: vuMZ 
Real(dp) :: vuSUSY 
! For HiggsBounds 
Real(dp) :: BR_tHb(3)
Real(dp) :: BR_Hcs(3), BR_Hcb(3), BR_Htaunu(3), BR_tWb
Real(dp) :: BRHHH(2,2), BRHAA(2,2) 
 Real(dp) :: BRAHH(2,2), BRAAA(2,2) 
 Real(dp) :: BRinvH(2), BRinvA(2) 
Real(dp) :: rHB_P_P_Fe(2,3),rHB_P_S_Fe(2,3),rHB_S_S_Fe(2,3),rHB_S_P_Fe(2,3)
Real(dp) :: rHB_P_P_Fu(2,3),rHB_P_S_Fu(2,3),rHB_S_S_Fu(2,3),rHB_S_P_Fu(2,3)
Real(dp) :: rHB_P_P_Fd(2,3),rHB_P_S_Fd(2,3),rHB_S_S_Fd(2,3),rHB_S_P_Fd(2,3)
Real(dp) :: rHB_P_VP(2),rHB_S_VP(2)
Real(dp) :: rHB_P_VZ(2),rHB_S_VZ(2)
Real(dp) :: rHB_P_VG(2),rHB_S_VG(2)
Real(dp) :: rHB_P_VWm(2),rHB_S_VWm(2)
Real(dp) :: rHB_P_P_Fv(2,3),rHB_P_S_Fv(2,3),rHB_S_S_Fv(2,3),rHB_S_P_Fv(2,3)
Complex(dp) :: CPL_A_H_Z(2,2) 
 Complex(dp) :: CPL_H_H_Z(2,2) 
 Complex(dp) :: CoupHPP(2), CoupHGG(2) 
Complex(dp) :: CPL_A_A_Z(2,2) 
 Complex(dp) :: CoupAPP(2), CoupAGG(2) 
Real(dp) :: HPPloopVWm(2)
Real(dp) :: HPPloopHm(3,2)
Real(dp) :: HPPloopFd(3,2)
Real(dp) :: HPPloopFu(3,2)
Real(dp) :: HPPloopFe(3,2)

 Real(dp) :: m32, tanbetaMZ 
Complex(dp),Dimension(3,3)::Y_l,Y_d,Y_u,Y_l_mZ,Y_d_mZ,Y_u_mZ&
&,Y_l_0,Y_d_0,Y_u_0
Real(dp),Dimension(3)::gauge,gauge_mZ,gauge_0 
Real(dp)::tanb,vevSM(2),tanb_mZ 
Contains 
 
Real(dp) Function Kronecker(t1,t2) Result(d) 
Implicit None 
Integer,Intent(in)::t1,t2 
If(t1.eq.t2) Then 
d=1. 
Else 
d=0. 
End If 
End Function Kronecker 

Real(dp) Function ThetaStep(t1,t2) Result(d) 
Implicit None 
Integer,Intent(in)::t1,t2 
If(t1.le.t2) Then 
d=1. 
Else 
d=0. 
End If 
End Function ThetaStep 

Real(dp) Function epsTensor(t1,t2,t3) Result(e)
Implicit None
Integer,Intent(in)::t1,t2,t3
If ((t1.eq.1).and.(t2.eq.2).and.(t3.eq.3)) Then
  e=1.
Else If ((t1.eq.2).and.(t2.eq.3).and.(t3.eq.1)) Then
  e=1.
Else If ((t1.eq.3).and.(t2.eq.1).and.(t3.eq.2)) Then
  e=1.
Else If ((t1.eq.3).and.(t2.eq.2).and.(t3.eq.1)) Then
  e=-1.
Else If ((t1.eq.2).and.(t2.eq.1).and.(t3.eq.3)) Then
  e=-1.
Else If ((t1.eq.1).and.(t2.eq.3).and.(t3.eq.2)) Then
  e=-1.
Else
  e=0.
End If
End Function epsTensor
Real(dp) Function gGMSB(ratio) 
Implicit None 
 Real(dp),Intent(in)::ratio 
 gGMSB=(1._dp+ratio)/ratio**2*Log(1._dp+ratio)& 
   &+(1._dp-ratio)/ratio**2*Log(1._dp-ratio) 
End Function gGMSB 
 
Real(dp) Function fGMSB(ratio) 
Implicit None 
Real(dp),Intent(in)::ratio 
If (ratio.lt.0.0001) Then 
 fGMSB = 1._dp 
Else 
 fGMSB=(1._dp+ratio)/ratio**2*(Log(1._dp+ratio)&
  & -2._dp*Li2(ratio/(1._dp+ratio))&
  & +0.5_dp*Li2(2._dp*ratio/(1._dp+ratio)))&
  & +(1._dp-ratio)/ratio**2*(Log(1._dp-ratio)&
  & -2._dp*Li2(ratio/(ratio-1._dp))&
  & +0.5_dp*Li2(2._dp*ratio/(ratio-1._dp)))
End If 
End Function fGMSB 
 
Complex(dp) Recursive Function h(a,b) 
Implicit None 
Real(dp),Intent(in)::a,b 
h=1._dp-(Log(a)*Log(b))/2._dp-&
& ((-(1._dp,-10D-12)+a+b)*(Pi2o6&
& +CLi2(-(((1._dp,-10D-12)-a+b-Sqrt((1._dp,-10.D-12)+(a-b)**2-&
& 2._dp*(a+b)))/&
& ((1._dp,-10D-12)+a-b+Sqrt((1._dp,-10D-12)+&
& (a-b)**2-2._dp*(a+b)))))&
& +CLi2(-((1._dp+a-b-Sqrt((1._dp,-10D-12)+&
& (a-b)**2-2._dp*(a+b)))/&
& ((1._dp,-10D-12)-a+b+Sqrt((1._dp,-10D-12)+&
& (a-b)**2-2._dp*(a+b)))))&
& -Log(((1._dp,-10D-12)-a+b-&
& Sqrt((1._dp,-10D-12)+(a-b)**2-2._dp*(a+b)))/&
& ((1._dp,-10D-12)+a-b-Sqrt((1._dp,-10D-12)+&
& (a-b)**2-2._dp*(a+b))))**2/4._dp&
& +Log(((1._dp,-10D-12)-a+b-&
& Sqrt((1._dp,-10D-12)+(a-b)**2-2._dp*(a+b)))/&
& ((1._dp,-10D-12)+a-b+Sqrt((1._dp,-10D-12)+&
& (a-b)**2-2._dp*(a+b))))**2/4._dp&
& +Log(((1._dp,10D-12)+a-b-&
& Sqrt((1._dp,10D-12)+(a-b)**2-2._dp*(a+b)))/&
& ((1._dp,10D-12)-a+b+Sqrt((1._dp,10D-12)+&
& (a-b)**2-2._dp*(a+b))))**2/4._dp&
& +Log(((1._dp,10D-12)-a+b+&
& Sqrt((1._dp,-10.D-12)+(a-b)**2-&
& (2._dp,10.D-12)*(a+b)))/((1._dp,-10D-12)+a-b+&
& Sqrt((1._dp,-10.D-12)+(a-b)**2-2._dp*(a+b))))**2/4._dp))/&
& Sqrt((1._dp,-10.D-12)+(a-b)**2-2._dp*(a+b))
End Function h 
 
Complex(dp) Function SQuiver(xQ,yQ) 
Implicit None 
Real(dp),Intent(in)::xQ,yQ 
SQuiver=(-8._dp*xQ**2+4._dp*xQ*yQ**2*atanh(xQ)&
 & -4._dp*(4._dp+yQ**2)*h(1._dp,yQ**2)+(-1._dp+xQ)*(-8._dp+8._dp*xQ+&
 & yQ**2)*h(1._dp,yQ**2/(1._dp-xQ))+8._dp*h(1._dp,yQ**2/(1._dp+xQ))+&
 & 16._dp*xQ*h(1._dp,yQ**2/(1._dp+xQ))+&
 & 8._dp*xQ**2*h(1._dp,yQ**2/(1._dp+xQ))-&
 & yQ**2*h(1._dp,yQ**2/(1._dp+xQ))-&
 & xQ*yQ**2*h(1._dp,yQ**2/(1._dp+xQ))&
 & +4._dp*xQ*h(1._dp/(1._dp-xQ),yQ**2/(1._dp-xQ))-&
 & 4._dp*xQ**2*h(1._dp/(1._dp-xQ),yQ**2/(1._dp-xQ))+&
 & 2._dp*yQ**2*h(1._dp/(1._dp-xQ),yQ**2/(1._dp-xQ))-&
 & 2._dp*xQ*yQ**2*h(1._dp/(1._dp-xQ),yQ**2/(1._dp-xQ))+&
 & 4._dp*xQ*h(1._dp-xQ,yQ**2)+2._dp*yQ**2*h(1._dp-xQ,yQ**2)-&
 & 4._dp*xQ*h(1._dp/(1._dp+xQ),yQ**2/(1._dp+xQ))-&
 & 4._dp*xQ**2*h(1._dp/(1._dp+xQ),yQ**2/(1._dp+xQ))+&
 & 2._dp*yQ**2*h(1._dp/(1._dp+xQ),yQ**2/(1._dp+xQ))+&
 & 2._dp*xQ*yQ**2*h(1._dp/(1._dp+xQ),yQ**2/(1._dp+xQ))-&
 & 4._dp*xQ*h(1._dp+xQ,yQ**2)+2._dp*yQ**2*h(1._dp+xQ,yQ**2)-&
 & yQ**2*h((1._dp+xQ)/(1._dp-xQ),yQ**2/(1._dp-xQ))+&
 & xQ*yQ**2*h((1._dp+xQ)/(1._dp-xQ),yQ**2/(1._dp-xQ))-&
 & yQ**2*h(-1._dp+2._dp/(1._dp+xQ),yQ**2/(1._dp+xQ))-&
 & xQ*yQ**2*h(-1._dp+2._dp/(1._dp+xQ),yQ**2/(1._dp+xQ))-&
 & 4._dp*yQ**2*h(yQ**(-2),yQ**(-2))+&
 & 2._dp*xQ*yQ**2*h((1._dp-xQ)/yQ**2,yQ**(-2))+&
 & 2._dp*yQ**2*h((1._dp-xQ)/yQ**2,(1._dp-xQ)/yQ**2)-&
 & 2._dp*xQ*yQ**2*h((1._dp-xQ)/yQ**2,(1._dp-xQ)/yQ**2)-&
 & 2._dp*xQ*yQ**2*h((1._dp+xQ)/yQ**2,yQ**(-2))+&
 & 2._dp*yQ**2*h((1._dp+xQ)/yQ**2,(1._dp+xQ)/yQ**2)+&
 & 2._dp*xQ*yQ**2*h((1._dp+xQ)/yQ**2,(1._dp+xQ)/yQ**2)-&
 & 8._dp*xQ*CLi2((1._dp,10D-12)*xQ)+&
 & 4._dp*(-1._dp+xQ)*(xQ+yQ**2)*CLi2(xQ/(-(1._dp,10D-12)+xQ))-&
 & (-1._dp+xQ)*yQ**2*CLi2((2._dp*xQ)/(-(1._dp,10D-12)+xQ))+&
 & 2._dp*xQ*CLi2((1._dp,10D-12)*xQ**2)+&
 & 4._dp*(1._dp+xQ)*(xQ-yQ**2)*CLi2(xQ/((1._dp,10D-12)+xQ))+&
 & (1._dp+xQ)*yQ**2*CLi2(((2._dp,10D-12)*xQ)/(1._dp+xQ))+&
 & 2._dp*yQ**2*Log(1._dp-xQ)+&
 & 2._dp*yQ**2*Log(1._dp+xQ))/(2._dp*xQ**2*yQ**2)
End Function SQuiver 
 
Subroutine RGE10_SMa(len,t,gy,f)
 !--------------------------------------------------------
 ! RGEs within the SM assuming the MSbar scheme
 ! 2-loop RGEs for e
 ! 4-loop RGEs for g_3
 ! 2-loop RGEs for lepton masses
 ! 4-loop QCD and 2-loop QED RGES for quark masses
 ! Assumption: the only threhold to be checked is m_b
 ! input: t = Log(Q^2)
 !        gy(i) ... i=1  -> e(Q)
 !                  i=2  -> g_3
 !                  i=3  -> m_e
 !                  i=4  -> m_mu
 !                  i=5  -> m_tau
 !                  i=6  -> m_u
 !                  i=7  -> m_c
 !                  i=8  -> m_d
 !                  i=9  -> m_s
 !                  i=10 -> m_b, is optional
 ! output:
 !   f = d(gy)/d(t)
 ! written by Werner Porod, 03.12.03
 !--------------------------------------------------------
 Implicit None

  Integer, Intent(in) :: len
  Real(dp), Intent(in) :: t, gy(len)
  Real(dp), Intent(out) :: f(len)

  Integer :: i1
  Real(dp) :: g32, g34, g36, g38, e2, e4, g32e2, q
  Real(dp), Parameter :: b_e1(2) = (/ 76._dp / 9._dp , 80._dp / 9._dp /)    &
       & , b_e2(2) = (/ 460._dp / 27._dp , 464._dp / 27._dp /)              & 
       & , b_e3(2) = (/ 160._dp / 9._dp , 176._dp / 9._dp  /)               & 
       & , b_g1(2) = (/ -25._dp / 3._dp, -23._dp/3._dp /)                   &
       & , b_g2(2) = (/ -154._dp / 3._dp, -116._dp/3._dp /)                 &
       & , b_g3(2) = (/ 20._dp / 3._dp, 22._dp/3._dp /)                     &
       & , b_g4(2) = (/ -21943._dp/54._dp, 9769._dp/54._dp /)               &
       & , b_g5(2) = (/ -4918247._dp/1458._dp-414140._dp*zeta3/81._dp       &
       &             , 598391._dp/1458._dp - 352864._dp*zeta3/81._dp /)     &
       & , g_el1(2) = (/ -6._dp, -6._dp /)                                  &
       & , g_el2(2) = (/ 353._dp / 9._dp,  373._dp / 9._dp /)               & 
       & , g_eu1(2) = (/ -8._dp/3._dp, -8._dp/3._dp /)                      &
       & , g_eu2(2) = (/ 1472._dp / 81._dp, 1552._dp / 81._dp/)             & 
       & , g_eu3(2) = (/ -32._dp / 9._dp,  -32._dp / 9._dp/)                & 
       & , g_ed1(2) = (/ -2._dp/3._dp, -2._dp/3._dp /)                      &
       & , g_ed2(2) = (/ 377._dp / 81._dp,  397._dp / 81._dp /)             & 
       & , g_ed3(2) = (/ -8._dp / 9._dp,  -8._dp / 9._dp /)                 & 
       & , g_q1(2) = (/ - 8._dp , -8._dp /)                                 &
       & , g_q2(2) = (/ -1052._dp / 9._dp ,  -1012._dp / 9._dp /)           &
       & , g_q3(2) = (/ -144674._dp/81._dp + 1280._dp * zeta3 / 3._dp       &
       &              , -128858._dp/81._dp + 1600._dp * zeta3 / 3._dp /)    &
       & , g_q4(2) = (/ -7330357._dp/243._dp + 51584._dp* zeta3/3._dp       &
       &                - 16000._dp*zeta4 / 3._dp + 11200._dp* zeta5 /9._dp &
       &             , -1911065._dp/81._dp + 618400._dp* zeta3/27._dp       &
       &                - 18400._dp*zeta4 / 3._dp - 25600._dp* zeta5 /9._dp  /)

       
  Iname = Iname + 1
  NameOfUnit(Iname) = 'RGE10_SMa'

  q = t

  If (len.Eq.9) Then ! check which beta function (anomalous dimension) to use
   i1 = 1
  Else If (len.Eq.10) Then
   i1 = 2
  Else
   Write(ErrCan,*) "Error in routine "//Trim(NameOfUnit(Iname))
   Write(ErrCan,*) "Length of the vector gy = ",len
   Call TerminateProgram
  End If

  g32 = gy(1)**2
  g34 = gy(1)**4
  g36 = gy(1)**6
  g38 = gy(1)**8
  e2 = gy(2)**2
  e4 = gy(2)**4
  g32e2 = g32 * e2 
 !--------
 ! g_3
 !--------
  f(1) = oo16pi2 * gy(1) * ( b_g1(i1)*g32                                     &
       &                   + oo16pi2 * ( b_g2(i1)*g34 + b_g3(i1)*g32e2        &
       &                               + oo16pi2 * ( b_g4(i1)*g36             &
       &                                           + oo16pi2 * b_g5(i1)*g38 )))
 !--------
 ! e
 !--------
  f(2) = oo16pi2 * gy(2) * ( b_e1(i1) * e2                                &
       &                   + oo16pi2 * (b_e2(i1) * e4 + b_e3(i1) * g32e2 ))
 !-----------------
 ! m_l, l=e,mu,tau
 !-----------------
  f(3:5) =  oo16pi2 * gy(3:5) * (g_el1(i1) * e2 + oo16pi2 *g_el2(i1) * e4)
 !---------
 ! m_u, m_c
 !---------
  f(6:7) = oo16pi2 * gy(6:7) * (g_eu1(i1) * e2 + g_q1(i1) * g32              &
         &                     + oo16pi2 * (g_eu2(i1)*e4 + g_eu3(i1) * g32e2 &
         &                                 + g_q2(i1) * g34                  &
         &                                 + oo16pi2 * (g_q3(i1) * g36       &
         &                                       + oo16pi2 * g_q4(i1) * g38 )))
 !---------------
 ! m_d, m_s, m_b
 !---------------
  f(8:len) = oo16pi2 * gy(8:len) * (g_ed1(i1) * e2 + g_q1(i1) * g32          &
         &                     + oo16pi2 * (g_ed2(i1)*e4 + g_ed3(i1) * g32e2 &
         &                                 + g_q2(i1) * g34                  &
         &                                 + oo16pi2 * (g_q3(i1) * g36       &
         &                                       + oo16pi2 * g_q4(i1) * g38 )))

  Iname = Iname - 1

 End Subroutine RGE10_SMa

Subroutine RGE11_SMa(len,t,gy,f)
  Implicit None
  Integer, Intent(in) :: len
  Real(dp), Intent(in) :: t, gy(len)
  Real(dp), Intent(out) :: f(len)

  Real(dp) :: g3, e, md, mu, ms, mc, mt, mb, ml, mmu, mtau
  Real(dp) :: g32, g34, g36, g38, e2, e4, g32e2
  Real(dp) :: nQuark
  Real(dp) :: gamma1, gamma3, gamma13, gamma11,  gamma33, gamma333

  nQuark = nUp + nDown

  g3  = gy(2)
  g32 = gy(2)**2
  g34 = gy(2)**4
  g36 = gy(2)**6
  g38 = gy(2)**8
  e  = gy(1)
  e2 = gy(1)**2
  e4 = gy(1)**4
  g32e2 = g32 * e2 


  ! g3
  f(2) = g3*((2._dp/3._dp*nQuark - 11._dp)*g32 + (38._dp/3._dp*nQuark - 102)*g34*oo16pi2 + &
         & (8._dp/9._dp*nUp + 2._dp/9._dp*nDown)*oo16pi2*g32e2 + &
         & (5033._dp/18._dp*nQuark - 325._dp/54._dp*nQuark**2 - 2857._dp/2._dp)*g36*oo16pi2*oo16pi2)

  ! e
  f(1) = e*((16._dp/9._dp*nUp+4._dp/9._dp*nDown+4._dp/3._dp*nLep)*e2 + &
          & (64._dp/27._dp*nUp + 4._dp/27._dp*nDown + 4._dp*nLep)*e4*oo16pi2 + &
          & (64._dp/9._dp*nUp + 16._dp/9._dp*nDown)*g32e2*oo16pi2*oo16pi2)

  gamma1 = -6._dp
  gamma11 = -3._dp + (80._dp/9._dp*nUp + 20._dp/9._dp*nDown + 20._dp/3._dp*nLep)

  ! m_e, m_mu, m_tau
  f(3:5) = gy(3:5)*(gamma1*e2 + oo16pi2*gamma11*e4)

  gamma1 = -6._dp*(2._dp/3._dp)
  gamma3 = -8._dp
  gamma11 = -3._dp*(2._dp/3._dp)**4 + (80._dp/9._dp*nUp + 20._dp/9._dp*nDown + 20._dp/3._dp*nLep)*(2._dp/3._dp)**2
  gamma13 = -4._dp*(2._dp/3._dp)**2
  gamma33 = -404._dp/3._dp + 40._dp/9._dp*nQuark
  gamma333 = 2._dp/3._dp*(140._dp/27._dp*nQuark**2 + (160._dp*Zeta3 + 2216._dp/9._dp)*nQuark - 3747._dp)  

  ! m_u, m_c, m_t
  f(6:8) = gy(6:8)*(gamma1*e2 +  gamma3*g32 +  &
           & oo16pi2*(gamma11*e4 + gamma33*g34 + 2._dp*gamma13*g32e2) + &
           & gamma333*g36*oo16pi2*oo16pi2)


  ! m_d, m_s, m_b
  gamma1 = -6._dp*(-1._dp/3._dp)
  gamma3 = -8._dp
  gamma11 = -3._dp*(1._dp/3._dp)**4 + (80._dp/9._dp*nUp + 20._dp/9._dp*nDown + 20._dp/3._dp*nLep)*(1._dp/3._dp)**2
  gamma13 = -4._dp*(1._dp/3._dp)**2
  gamma33 = -404._dp/3._dp + 40._dp/9._dp*nQuark
  gamma333 = 2._dp/3._dp*(140._dp/27._dp*nQuark**2 + (160._dp*Zeta3 + 2216._dp/9._dp)*nQuark - 3747._dp)  

  f(9:11) = gy(9:11)*(gamma1*e2 +  gamma3*g32 +  &
           & oo16pi2*(gamma11*e4 + gamma33*g34 + 2._dp*gamma13*g32e2) + &
           & gamma333*g36*oo16pi2*oo16pi2)

  If (nUp.lt.2.9_dp)  f(8) = 0._dp
  If (nDown.lt.2.9_dp)  f(12) = 0._dp

  f = oo16pi2*f


End Subroutine RGE11_SMa

Subroutine RGE11(len,t,gy,f)
  Implicit None
  Integer, Intent(in) :: len
  Real(dp), Intent(in) :: t, gy(len)
  Real(dp), Intent(out) :: f(len)

  Real(dp) :: g3, e, md, mu, ms, mc, mt, mb, ml, mmu, mtau
  Real(dp) :: g32, g34, g36, g38, e2, e4, g32e2
  Real(dp) :: nQuark, a1, a2, a3, nG
  Real(dp) :: gamma1, gamma3, gamma13, gamma11,  gamma33, gamma333

  nQuark = nUp + nDown

  g3  = gy(2)
  g32 = gy(2)**2
  g34 = gy(2)**4
  g36 = gy(2)**6
  g38 = gy(2)**8
  e  = gy(1)
  e2 = gy(1)**2
  e4 = gy(1)**4
  g32e2 = g32 * e2 

  nG = 3._dp
  a1 = gy(12)
  a2 = gy(13)
  a3 = gy(14)


  ! g3
  f(2) = g3*((2._dp/3._dp*nQuark - 11._dp)*g32 + (38._dp/3._dp*nQuark - 102)*g34*oo16pi2 + &
         & (8._dp/9._dp*nUp + 2._dp/9._dp*nDown)*oo16pi2*g32e2 + &
         & (5033._dp/18._dp*nQuark - 325._dp/54._dp*nQuark**2 - 2857._dp/2._dp)*g36*oo16pi2*oo16pi2)

  ! e
  f(1) = e*((16._dp/9._dp*nUp+4._dp/9._dp*nDown+4._dp/3._dp*nLep)*e2 + &
          & (64._dp/27._dp*nUp + 4._dp/27._dp*nDown + 4._dp*nLep)*e4*oo16pi2 + &
          & (64._dp/9._dp*nUp + 16._dp/9._dp*nDown)*g32e2*oo16pi2*oo16pi2)

  gamma1 = -6._dp
  gamma11 = -3._dp + (80._dp/9._dp*nUp + 20._dp/9._dp*nDown + 20._dp/3._dp*nLep)

  ! m_e, m_mu, m_tau
  f(3:5) = gy(3:5)*(gamma1*e2 + oo16pi2*gamma11*e4)

  gamma1 = -6._dp*(2._dp/3._dp)
  gamma3 = -8._dp
  gamma11 = -3._dp*(2._dp/3._dp)**4 + (80._dp/9._dp*nUp + 20._dp/9._dp*nDown + 20._dp/3._dp*nLep)*(2._dp/3._dp)**2
  gamma13 = -4._dp*(2._dp/3._dp)**2
  gamma33 = -404._dp/3._dp + 40._dp/9._dp*nQuark
  gamma333 = 2._dp/3._dp*(140._dp/27._dp*nQuark**2 + (160._dp*Zeta3 + 2216._dp/9._dp)*nQuark - 3747._dp)  

  ! m_u, m_c, m_t
  f(6:8) = gy(6:8)*(gamma1*e2 +  gamma3*g32 +  &
           & oo16pi2*(gamma11*e4 + gamma33*g34 + 2._dp*gamma13*g32e2) + &
           & gamma333*g36*oo16pi2*oo16pi2)


  ! m_d, m_s, m_b
  gamma1 = -6._dp*(-1._dp/3._dp)
  gamma3 = -8._dp
  gamma11 = -3._dp*(1._dp/3._dp)**4 + (80._dp/9._dp*nUp + 20._dp/9._dp*nDown + 20._dp/3._dp*nLep)*(1._dp/3._dp)**2
  gamma13 = -4._dp*(1._dp/3._dp)**2
  gamma33 = -404._dp/3._dp + 40._dp/9._dp*nQuark
  gamma333 = 2._dp/3._dp*(140._dp/27._dp*nQuark**2 + (160._dp*Zeta3 + 2216._dp/9._dp)*nQuark - 3747._dp)  

  f(9:11) = gy(9:11)*(gamma1*e2 +  gamma3*g32 +  &
           & oo16pi2*(gamma11*e4 + gamma33*g34 + 2._dp*gamma13*g32e2) + &
           & gamma333*g36*oo16pi2*oo16pi2)



!! running of alpha_i to calculate running sin(w2); equations by Steinhauser
  ! alpha_1
  f(12) = a1**2*(2._dp/5._dp + nG*16._dp/3._dp) + &
    & a1**2*oo4pi2*(18._dp/25._dp*a1 + 18._dp/5._dp*a2 + nG*(76._dp/15._dp*a1 + 12._dp/5._dp*a2 + 176._dp/15._dp*a3))

  ! alpha_2
  f(13) = a2**2*(-86._dp/3._dp + nG*16._dp/3._dp) + &
   & a2**2*oo4pi2*(6._dp/5._dp*a1 - 518._dp/3._dp*a2 + nG*(4._dp/3._dp + 196._dp/3._dp*a2 + 16._dp*a3))

  ! alpha_3
  f(14) = a3**2*(-44._dp + nG*16._dp/3._dp) + &
    & a3**2*oo4pi2*(-408._dp*a3 + nG*(22._dp/15._dp*a1 + 6._dp*a2 + 304._dp/3._dp*a3))

  f = oo16pi2*f


End Subroutine RGE11


Subroutine RGEAlphaS(len,t,gy,f)
  Implicit None
  Integer, Intent(in) :: len
  Real(dp), Intent(in) :: t, gy(len)
  Real(dp), Intent(out) :: f(len)

  Real(dp) :: g3, e, md, mu, ms, mc, mt, mb, ml, mmu, mtau
  Real(dp) :: g32, g34, g36, g38, e2, e4, g32e2
  Real(dp) :: nQuark
  Real(dp) :: gamma1, gamma3, gamma13, gamma11,  gamma33, gamma333

  nQuark = nUp + nDown

  g3  = gy(2)
  g32 = gy(2)**2
  g34 = gy(2)**4
  g36 = gy(2)**6
  g38 = gy(2)**8
  e  = gy(1)
  e2 = gy(1)**2
  e4 = gy(1)**4
  g32e2 = g32 * e2 


  ! g3
  f(2) = g3*((2._dp/3._dp*nQuark - 11._dp)*g32 + (38._dp/3._dp*nQuark - 102)*g34*oo16pi2 + &
         & (8._dp/9._dp*nUp + 2._dp/9._dp*nDown)*oo16pi2*g32e2 + &
         & (5033._dp/18._dp*nQuark - 325._dp/54._dp*nQuark**2 - 2857._dp/2._dp)*g36*oo16pi2*oo16pi2)

  ! e
  f(1) = e*((16._dp/9._dp*nUp+4._dp/9._dp*nDown+4._dp/3._dp*nLep)*e2 + &
          & (64._dp/27._dp*nUp + 4._dp/27._dp*nDown + 4._dp*nLep)*e4*oo16pi2 + &
          & (64._dp/9._dp*nUp + 16._dp/9._dp*nDown)*g32e2*oo16pi2*oo16pi2)


  f = oo16pi2*f


End Subroutine RGEAlphaS

Subroutine RGETop(len,t,gy,f)
  Implicit None
  Integer, Intent(in) :: len
  Real(dp), Intent(in) :: t, gy(len)
  Real(dp), Intent(out) :: f(len)

  Real(dp) :: g3, e, md, mu, ms, mc, mt, mb, ml, mmu, mtau
  Real(dp) :: g32, g34, g36, g38, e2, e4, g32e2
  Real(dp) :: nQuark
  Real(dp) :: gamma1, gamma3, gamma13, gamma11,  gamma33, gamma333

  nQuark = nUp + nDown

  g3  = gy(2)
  g32 = gy(2)**2
  g34 = gy(2)**4
  g36 = gy(2)**6
  g38 = gy(2)**8
  e  = gy(1)
  e2 = gy(1)**2
  e4 = gy(1)**4
  g32e2 = g32 * e2 


  ! g3
  f(2) = g3*((2._dp/3._dp*nQuark - 11._dp)*g32 + (38._dp/3._dp*nQuark - 102)*g34*oo16pi2 + &
         & (8._dp/9._dp*nUp + 2._dp/9._dp*nDown)*oo16pi2*g32e2 + &
         & (5033._dp/18._dp*nQuark - 325._dp/54._dp*nQuark**2 - 2857._dp/2._dp)*g36*oo16pi2*oo16pi2)

  ! e
  f(1) = e*((16._dp/9._dp*nUp+4._dp/9._dp*nDown+4._dp/3._dp*nLep)*e2 + &
          & (64._dp/27._dp*nUp + 4._dp/27._dp*nDown + 4._dp*nLep)*e4*oo16pi2 + &
          & (64._dp/9._dp*nUp + 16._dp/9._dp*nDown)*g32e2*oo16pi2*oo16pi2)


  gamma1 = -6._dp*(2._dp/3._dp)
  gamma3 = -8._dp
  gamma11 = -3._dp*(2._dp/3._dp)**4 + (80._dp/9._dp*nUp + 20._dp/9._dp*nDown + 20._dp/3._dp*nLep)*(2._dp/3._dp)**2
  gamma13 = -4._dp*(2._dp/3._dp)**2
  gamma33 = -404._dp/3._dp + 40._dp/9._dp*nQuark
  gamma333 = 2._dp/3._dp*(140._dp/27._dp*nQuark**2 + (160._dp*Zeta3 + 2216._dp/9._dp)*nQuark - 3747._dp)  

  ! m_u, m_c, m_t
  f(3) = gy(3)*(gamma1*e2 +  gamma3*g32 +  &
           & oo16pi2*(gamma11*e4 + gamma33*g34 + 2._dp*gamma13*g32e2) + &
           & gamma333*g36*oo16pi2*oo16pi2)


  f = oo16pi2*f


End Subroutine RGETop
Subroutine SetGUTScale(scale)
Implicit None
Real(dp),Intent(in)::scale
If (scale.Lt.0._dp) Then
UseFixedGUTScale= .False.
Else
UseFixedGUTScale= .True.
GUT_scale=scale
End If
End Subroutine SetGUTScale
 

Subroutine SetRGEScale(scale)
Implicit None
Real(dp),Intent(in)::scale
Real(dp)::old_scale
If (scale.Lt.0._dp) Then
UseFixedScale= .False.
Else
UseFixedScale= .True.
old_scale=SetRenormalizationScale(scale)
End If
End Subroutine SetRGEScale


Logical Function SetStrictUnification(V1)
Implicit None
Logical,Intent(in)::V1
SetStrictUnification= .False.
StrictUnification=V1
SetStrictUnification= .True.
End Function SetStrictUnification


Integer Function SetYukawaScheme(V1)
Implicit None
Integer,Intent(in)::V1
SetYukawaScheme=YukawaScheme
YukawaScheme=V1
End Function SetYukawaScheme


Subroutine Set_All_Parameters_0() 
Implicit None 
Y_l= 0._dp 
Y_d= 0._dp 
Y_u= 0._dp 
Y_l_mZ= 0._dp 
Y_d_mZ= 0._dp 
Y_u_mZ= 0._dp 
Y_l_0= 0._dp 
Y_d_0= 0._dp 
Y_u_0= 0._dp 
gauge= 0._dp 
gauge_mZ= 0._dp 
gauge_0 = 0._dp 
tanb= 0._dp 
vevSM= 0._dp 
tanb_mZ = 0._dp 
GUT_scale = 0._dp 
HPPloopVWm = 0._dp 
HPPloopHm = 0._dp 
HPPloopFd = 0._dp 
HPPloopFu = 0._dp 
HPPloopFe = 0._dp 
g1IN = 0._dp 
g2IN = 0._dp 
g3IN = 0._dp 
Lam6IN = 0._dp 
Lam5IN = 0._dp 
Lam7IN = 0._dp 
Lam10IN = 0._dp 
Lam1IN = 0._dp 
Lam4IN = 0._dp 
Lam3IN = 0._dp 
Lam2IN = 0._dp 
Lam8IN = 0._dp 
Lam9IN = 0._dp 
LamhIN = 0._dp 
epsUIN = 0._dp 
YuIN = 0._dp 
YdIN = 0._dp 
YeIN = 0._dp 
epsDIN = 0._dp 
epsEIN = 0._dp 
YhIN = 0._dp 
MuIN = 0._dp 
M12IN = 0._dp 
M112IN = 0._dp 
M222IN = 0._dp 
MhIN = 0._dp 
g1 = 0._dp 
g1MZ = 0._dp 
g2 = 0._dp 
g2MZ = 0._dp 
g3 = 0._dp 
g3MZ = 0._dp 
Lam6 = 0._dp 
Lam6MZ = 0._dp 
Lam5 = 0._dp 
Lam5MZ = 0._dp 
Lam7 = 0._dp 
Lam7MZ = 0._dp 
Lam10 = 0._dp 
Lam10MZ = 0._dp 
Lam1 = 0._dp 
Lam1MZ = 0._dp 
Lam4 = 0._dp 
Lam4MZ = 0._dp 
Lam3 = 0._dp 
Lam3MZ = 0._dp 
Lam2 = 0._dp 
Lam2MZ = 0._dp 
Lam8 = 0._dp 
Lam8MZ = 0._dp 
Lam9 = 0._dp 
Lam9MZ = 0._dp 
Lamh = 0._dp 
LamhMZ = 0._dp 
epsU = 0._dp 
epsUMZ = 0._dp 
Yu = 0._dp 
YuMZ = 0._dp 
Yd = 0._dp 
YdMZ = 0._dp 
Ye = 0._dp 
YeMZ = 0._dp 
epsD = 0._dp 
epsDMZ = 0._dp 
epsE = 0._dp 
epsEMZ = 0._dp 
Yh = 0._dp 
YhMZ = 0._dp 
Mu = 0._dp 
MuMZ = 0._dp 
M12 = 0._dp 
M12MZ = 0._dp 
M112 = 0._dp 
M112MZ = 0._dp 
M222 = 0._dp 
M222MZ = 0._dp 
Mh = 0._dp 
MhMZ = 0._dp 
vdIN = 0._dp 
vuIN = 0._dp 
MAh = 0._dp 
MAh2 = 0._dp 
MFd = 0._dp 
MFd2 = 0._dp 
MFe = 0._dp 
MFe2 = 0._dp 
MFu = 0._dp 
MFu2 = 0._dp 
MFv = 0._dp 
MFv2 = 0._dp 
Mhh = 0._dp 
Mhh2 = 0._dp 
MHm = 0._dp 
MHm2 = 0._dp 
MVWm = 0._dp 
MVWm2 = 0._dp 
MVZ = 0._dp 
MVZ2 = 0._dp 
TW = 0._dp 
ZDR = 0._dp 
ZER = 0._dp 
ZUR = 0._dp 
v = 0._dp 
ZDL = 0._dp 
ZEL = 0._dp 
ZUL = 0._dp 
UV = 0._dp 
ZA = 0._dp 
ZH = 0._dp 
ZP = 0._dp 
ZW = 0._dp 
ZZ = 0._dp 
alphaH = 0._dp 
betaH = 0._dp 
vd = 0._dp 
vu = 0._dp 
gPFu = 0._dp 
gTFu = 0._dp 
BRFu = 0._dp 
gPFe = 0._dp 
gTFe = 0._dp 
BRFe = 0._dp 
gPFd = 0._dp 
gTFd = 0._dp 
BRFd = 0._dp 
gPFv = 0._dp 
gTFv = 0._dp 
BRFv = 0._dp 
gPhh = 0._dp 
gThh = 0._dp 
BRhh = 0._dp 
gPAh = 0._dp 
gTAh = 0._dp 
BRAh = 0._dp 
gPHm = 0._dp 
gTHm = 0._dp 
BRHm = 0._dp 
ratioFd =  0._dp  
ratioFe =  0._dp  
ratioFu =  0._dp  
ratioHm =  0._dp  
ratioVWm =  0._dp  
ratioGG =  0._dp  
ratioPP =  0._dp  
ratioPFd =  0._dp  
ratioPFe =  0._dp  
ratioPFu =  0._dp  
ratioPHm =  0._dp  
ratioPVWm =  0._dp  
ratioPGG =  0._dp  
ratioPPP =  0._dp  
Lambda1Input=(0._dp,0._dp) 
Lambda2Input=(0._dp,0._dp) 
Lambda3Input=(0._dp,0._dp) 
Lambda4Input=(0._dp,0._dp) 
Lambda5Input=(0._dp,0._dp) 
Lambda6Input=(0._dp,0._dp) 
Lambda7Input=(0._dp,0._dp) 
Lambda8Input=(0._dp,0._dp) 
Lambda9Input=(0._dp,0._dp) 
Lambda10Input=(0._dp,0._dp) 
LambdahInput=(0._dp,0._dp) 
M12input=(0._dp,0._dp) 
Mhinput=(0._dp,0._dp) 
Muinput=(0._dp,0._dp) 
TanBeta= 0._dp 
End Subroutine Set_All_Parameters_0 
 
End Module Model_Data_Zee
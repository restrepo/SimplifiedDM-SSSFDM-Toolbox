! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.8.5 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 13:34 on 20.5.2016   
! ----------------------------------------------------------------------  
 
 
Module Fe3Decays_LRDM 
 
Use Control 
Use CouplingsForDecays_LRDM 
Use ThreeBodyPhaseSpace 
 
Contains 
 
Subroutine FeThreeBodyDecay(n_in,MAh,MAh2,MdeltaRpp,MdeltaRpp2,MFc,MFc2,              & 
& MFcp,MFcp2,MFcpp,MFcpp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,             & 
& MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,phaT,PhiW,UV,TW,UC,ZDR,            & 
& ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,ALP3,ALP2,            & 
& LAM4,LAM2,LAM3,YDR,YL1,YQ1,YL2,YQ2,M23,mu32,MU22,MU12,vd,vu,vR,gTAh,gTdeltaRpp,        & 
& gThh,gTHpm,gTVWLm,gTVWRm,gTVZ,gTVZR,gFeFecFdFd,gFeFecFeFe,gFeFecFuFu,gFeFeFvFv,        & 
& gFeFecFcFc,gFeFecFcpFcp,gFeFecFcppFcpp,gFeFvcFdFu,gFeFvcFcFcp,gFeFvcFcpFcpp,           & 
& epsI,deltaM,CheckRealStates,gT,gPartial,BR)

Implicit None 
 
Real(dp),Intent(in) :: MAh(3),MAh2(3),MdeltaRpp,MdeltaRpp2,MFc,MFc2,MFcp,MFcp2,MFcpp,MFcpp2,MFd(3),          & 
& MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),Mhh(3),Mhh2(3),MHpm(3),           & 
& MHpm2(3),MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,TW,UC(3,3),UP(3,3),ZH(3,3)

Complex(dp),Intent(in) :: phaT,UV(6,6),ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZW(4,4),ZZ(3,3)

Complex(dp) :: cplcFcFcpVWLmL,cplcFcFcpVWLmR,cplcFcFcpVWRmL,cplcFcFcpVWRmR,cplcFcFcVZL,              & 
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

Real(dp),Intent(in) :: gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,ALP3,ALP2,LAM4,LAM2,LAM3,M23,mu32,MU22,              & 
& MU12,vd,vu,vR

Complex(dp),Intent(in) :: YDR(3,3),YL1(3,3),YQ1(3,3),YL2(3,3),YQ2(3,3)

Real(dp),Intent(inout) :: gFeFecFdFd(3,3,3,3),gFeFecFeFe(3,3,3,3),gFeFecFuFu(3,3,3,3),gFeFeFvFv(3,3,6,6),       & 
& gFeFecFcFc(3,3,1,1),gFeFecFcpFcp(3,3,1,1),gFeFecFcppFcpp(3,3,1,1),gFeFvcFdFu(3,6,3,3), & 
& gFeFvcFcFcp(3,6,1,1),gFeFvcFcpFcpp(3,6,1,1)

Real(dp),Intent(in) :: gTAh(3),gTdeltaRpp,gThh(3),gTHpm(3),gTVWLm,gTVWRm,gTVZ,gTVZR

Real(dp) :: gFeFecFdFdi(3,3,3),gFeFecFeFei(3,3,3),gFeFecFuFui(3,3,3),gFeFeFvFvi(3,6,6),           & 
& gFeFecFcFci(3,1,1),gFeFecFcpFcpi(3,1,1),gFeFecFcppFcppi(3,1,1),gFeFvcFdFui(6,3,3),     & 
& gFeFvcFcFcpi(6,1,1),gFeFvcFcpFcppi(6,1,1)

Real(dp) :: gTAhtemp(3),gTdeltaRpptemp,gThhtemp(3),gTHpmtemp(3),gTVWLmtemp,gTVWRmtemp,            & 
& gTVZtemp,gTVZRtemp
Integer :: NVs,NVst,NSs,NVVst,NVVss,NVSss,NVSst,NSSss,NSSst
Complex(dp), Allocatable :: IntegralVVst(:,:),IntegralVSss(:,:),IntegralVSst(:,:),IntegralSSss(:,:)               & 
& ,IntegralSSst(:,:)
Real(dp), Allocatable :: IntegralVs(:,:),IntegralVst(:,:),IntegralSs(:,:),IntegralVVss(:,:)
Real(dp), Intent(inout), Optional :: BR(:,:), gPartial(:,:) 
Real(dp), Intent(inout) :: gT(:) 
Integer, Intent(in) :: n_in 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Intent(in) ::  CheckRealStates 
Integer :: i_start, i_end, i_run, n_out, n_length, gt1, gt2, gt3, i1 
Logical :: check 
Iname = Iname +1 
NameOfUnit(Iname) = 'FeThreeBodyDecay' 
 
Allocate( IntegralVs(25000,9) ) 
Allocate( IntegralVst(25000,12) ) 
Allocate( IntegralSs(500000,10) ) 
Allocate( IntegralVVst(25000,12) ) 
Allocate( IntegralVVss(500000,12) ) 
Allocate( IntegralVSss(500000,12) ) 
Allocate( IntegralVSst(500000,16) ) 
Allocate( IntegralSSss(500000,12) ) 
Allocate( IntegralSSst(500000,16) ) 

 
If (CheckRealStates) Then 
gTAhtemp = 0._dp 
gTdeltaRpptemp = 0._dp 
gThhtemp = 0._dp 
gTHpmtemp = 0._dp 
gTVWLmtemp = 0._dp 
gTVWRmtemp = 0._dp 
gTVZtemp = 0._dp 
gTVZRtemp = 0._dp 
Else 
gTAhtemp = gTAh 
gTdeltaRpptemp = gTdeltaRpp 
gThhtemp = gThh 
gTHpmtemp = gTHpm 
gTVWLmtemp = gTVWLm 
gTVWRmtemp = gTVWRm 
gTVZtemp = gTVZ 
gTVZRtemp = gTVZR 
End If 
 
check=CheckRealStates 

 
If (n_in.Lt.0) Then 
 i_start = 1 
 i_end = 3 
 Else If ( (n_in.Ge.1).And.(n_in.Le. 3) ) Then 
 i_start = n_in 
 i_end = n_in 
Else 
 If (ErrorLevel.Ge.-1) Then 
   Write (ErrCan, *) 'Problem in subroutine'//NameOfUnit(Iname) 
   Write (ErrCan, *) 'Value of n_in out of range, (n_in,3) = ',n_in,3 
 End If 
 
 If (ErrorLevel.Gt.0) Call TerminateProgram 
 
 If (Present(BR)) BR = 0._dp 
 Iname = Iname - 1 
 Return 
End If 
 
Do i_run = i_start, i_end 
 
Call CouplingsFor_Fe_decays_3B(MFe(i_run),i_run,MAh,MAh2,MdeltaRpp,MdeltaRpp2,        & 
& MFc,MFc2,MFcp,MFcp2,MFcpp,MFcpp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,              & 
& Mhh2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,phaT,PhiW,               & 
& UV,TW,UC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,RHO2,RHO1,ALP1,              & 
& LAM1,ALP3,ALP2,LAM4,LAM2,LAM3,YDR,YL1,YQ1,YL2,YQ2,M23,mu32,MU22,MU12,vd,               & 
& vu,vR,cplcFcFcpVWLmL,cplcFcFcpVWLmR,cplcFcFcpVWRmL,cplcFcFcpVWRmR,cplcFcFcVZL,         & 
& cplcFcFcVZR,cplcFcFcVZRL,cplcFcFcVZRR,cplcFcpFcppVWLmL,cplcFcpFcppVWLmR,               & 
& cplcFcpFcppVWRmL,cplcFcpFcppVWRmR,cplcFcpFcpVZL,cplcFcpFcpVZR,cplcFcpFcpVZRL,          & 
& cplcFcpFcpVZRR,cplcFcppFcppVZL,cplcFcppFcppVZR,cplcFcppFcppVZRL,cplcFcppFcppVZRR,      & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFdFdVZRL,cplcFdFdVZRR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFdFuVWLmL,cplcFdFuVWLmR,       & 
& cplcFdFuVWRmL,cplcFdFuVWRmR,cplcFecFedeltaRppL,cplcFecFedeltaRppR,cplcFeFeAhL,         & 
& cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZRL,              & 
& cplcFeFeVZRR,cplcFeFvcHpmL,cplcFeFvcHpmR,cplcFeFvcVWLmL,cplcFeFvcVWLmR,cplcFeFvcVWRmL, & 
& cplcFeFvcVWRmR,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,            & 
& cplcFuFuVZR,cplcFuFuVZRL,cplcFuFuVZRR,cplFeFecdeltaRppL,cplFeFecdeltaRppR,             & 
& cplFvFeHpmL,cplFvFeHpmR,cplFvFeVWLmL,cplFvFeVWLmR,cplFvFeVWRmL,cplFvFeVWRmR,           & 
& cplFvFvAhL,cplFvFvAhR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZRL,         & 
& cplFvFvVZRR,deltaM)

IntegralVs = 0._dp 
NVs = 0  
IntegralVst = 0._dp 
NVst = 0  
IntegralSs = 0._dp 
NSs = 0  
IntegralVVst = 0._dp 
NVVst = 0  
IntegralVVss = 0._dp 
NVVss = 0  
IntegralVSss = 0._dp 
NVSss = 0  
IntegralVSst = 0._dp 
NVSst = 0  
IntegralSSss = 0._dp 
NSSss = 0  
IntegralSSst = 0._dp 
NSSst = 0  

 
gFeFecFdFdi = 0._dp 
Call FeToFecFdFd(i_run,MFe,MFd,MVZ,MVZR,MAh,Mhh,cplcFdFdAhL,cplcFdFdAhR,              & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZRL,cplcFdFdVZRR,             & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcFeFeVZRL,cplcFeFeVZRR,IntegralSs,IntegralSSss,IntegralVs,IntegralVSss,             & 
& IntegralVVss,NSs,NSSss,NVs,NVSss,NVVss,gTVZtemp,gTVZRtemp,gTAhtemp,gThhtemp,           & 
& deltaM,epsI,check,gFeFecFdFdi)

gFeFecFdFd(i_run,:,:,:) = gFeFecFdFdi 
gT(i_run) = gT(i_run) + Sum(gFeFecFdFdi) 
 
gFeFecFeFei = 0._dp 
Call FeToFecFeFe(i_run,MFe,MVZ,MVZR,MdeltaRpp,MAh,Mhh,cplcFecFedeltaRppL,             & 
& cplcFecFedeltaRppR,cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,        & 
& cplcFeFeVZR,cplcFeFeVZRL,cplcFeFeVZRR,cplFeFecdeltaRppL,cplFeFecdeltaRppR,             & 
& IntegralSs,IntegralSSss,IntegralSSst,IntegralVs,IntegralVSss,IntegralVSst,             & 
& IntegralVVss,IntegralVVst,NSs,NSSss,NSSst,NVs,NVSss,NVSst,NVVss,NVVst,gTVZtemp,        & 
& gTVZRtemp,gTdeltaRpptemp,gTAhtemp,gThhtemp,deltaM,epsI,check,gFeFecFeFei)

gFeFecFeFe(i_run,:,:,:) = gFeFecFeFei 
gT(i_run) = gT(i_run) + Sum(gFeFecFeFei) 
 
gFeFecFuFui = 0._dp 
Call FeToFecFuFu(i_run,MFe,MFu,MVZ,MVZR,MAh,Mhh,cplcFeFeAhL,cplcFeFeAhR,              & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZRL,cplcFeFeVZRR,             & 
& cplcFuFuAhL,cplcFuFuAhR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcFuFuVZRL,cplcFuFuVZRR,IntegralSs,IntegralSSss,IntegralVs,IntegralVSss,             & 
& IntegralVVss,NSs,NSSss,NVs,NVSss,NVVss,gTVZtemp,gTVZRtemp,gTAhtemp,gThhtemp,           & 
& deltaM,epsI,check,gFeFecFuFui)

gFeFecFuFu(i_run,:,:,:) = gFeFecFuFui 
gT(i_run) = gT(i_run) + Sum(gFeFecFuFui) 
 
gFeFeFvFvi = 0._dp 
Call FeToFeFvFv(i_run,MFe,MFv,MVZ,MVZR,MVWLm,MVWRm,MHpm,MAh,Mhh,cplcFeFeAhL,          & 
& cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZRL,              & 
& cplcFeFeVZRR,cplcFeFvcHpmL,cplcFeFvcHpmR,cplcFeFvcVWLmL,cplcFeFvcVWLmR,cplcFeFvcVWRmL, & 
& cplcFeFvcVWRmR,cplFvFeHpmL,cplFvFeHpmR,cplFvFeVWLmL,cplFvFeVWLmR,cplFvFeVWRmL,         & 
& cplFvFeVWRmR,cplFvFvAhL,cplFvFvAhR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,        & 
& cplFvFvVZRL,cplFvFvVZRR,IntegralSs,IntegralSSss,IntegralSSst,IntegralVs,               & 
& IntegralVSss,IntegralVSst,IntegralVVss,IntegralVVst,NSs,NSSss,NSSst,NVs,               & 
& NVSss,NVSst,NVVss,NVVst,gTVZtemp,gTVZRtemp,gTVWLmtemp,gTVWRmtemp,gTHpmtemp,            & 
& gTAhtemp,gThhtemp,deltaM,epsI,check,gFeFeFvFvi)

gFeFeFvFv(i_run,:,:,:) = gFeFeFvFvi 
gT(i_run) = gT(i_run) + Sum(gFeFeFvFvi) 
 
gFeFecFcFci = 0._dp 
Call FeToFecFcFc(i_run,MFe,MFc,MVZ,MVZR,cplcFcFcVZL,cplcFcFcVZR,cplcFcFcVZRL,         & 
& cplcFcFcVZRR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZRL,cplcFeFeVZRR,IntegralVs,             & 
& IntegralVVss,NVs,NVVss,gTVZtemp,gTVZRtemp,deltaM,epsI,check,gFeFecFcFci)

gFeFecFcFc(i_run,:,:,:) = gFeFecFcFci 
gT(i_run) = gT(i_run) + Sum(gFeFecFcFci) 
 
gFeFecFcpFcpi = 0._dp 
Call FeToFecFcpFcp(i_run,MFe,MFcp,MVZ,MVZR,cplcFcpFcpVZL,cplcFcpFcpVZR,               & 
& cplcFcpFcpVZRL,cplcFcpFcpVZRR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZRL,cplcFeFeVZRR,       & 
& IntegralVs,IntegralVVss,NVs,NVVss,gTVZtemp,gTVZRtemp,deltaM,epsI,check,gFeFecFcpFcpi)

gFeFecFcpFcp(i_run,:,:,:) = gFeFecFcpFcpi 
gT(i_run) = gT(i_run) + Sum(gFeFecFcpFcpi) 
 
gFeFecFcppFcppi = 0._dp 
Call FeToFecFcppFcpp(i_run,MFe,MFcpp,MVZ,MVZR,cplcFcppFcppVZL,cplcFcppFcppVZR,        & 
& cplcFcppFcppVZRL,cplcFcppFcppVZRR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZRL,cplcFeFeVZRR,   & 
& IntegralVs,IntegralVVss,NVs,NVVss,gTVZtemp,gTVZRtemp,deltaM,epsI,check,gFeFecFcppFcppi)

gFeFecFcppFcpp(i_run,:,:,:) = gFeFecFcppFcppi 
gT(i_run) = gT(i_run) + Sum(gFeFecFcppFcppi) 
 
gFeFvcFdFui = 0._dp 
Call FeToFvcFdFu(i_run,MFv,MFd,MFu,MVWLm,MVWRm,MHpm,MFe,cplcFdFuHpmL,cplcFdFuHpmR,    & 
& cplcFdFuVWLmL,cplcFdFuVWLmR,cplcFdFuVWRmL,cplcFdFuVWRmR,cplcFeFvcHpmL,cplcFeFvcHpmR,   & 
& cplcFeFvcVWLmL,cplcFeFvcVWLmR,cplcFeFvcVWRmL,cplcFeFvcVWRmR,IntegralSs,IntegralSSss,   & 
& IntegralVs,IntegralVSss,IntegralVVss,NSs,NSSss,NVs,NVSss,NVVss,gTVWLmtemp,             & 
& gTVWRmtemp,gTHpmtemp,deltaM,epsI,check,gFeFvcFdFui)

gFeFvcFdFu(i_run,:,:,:) = gFeFvcFdFui 
gT(i_run) = gT(i_run) + Sum(gFeFvcFdFui) 
 
gFeFvcFcFcpi = 0._dp 
Call FeToFvcFcFcp(i_run,MFv,MFc,MFcp,MVWLm,MVWRm,MFe,cplcFcFcpVWLmL,cplcFcFcpVWLmR,   & 
& cplcFcFcpVWRmL,cplcFcFcpVWRmR,cplcFeFvcVWLmL,cplcFeFvcVWLmR,cplcFeFvcVWRmL,            & 
& cplcFeFvcVWRmR,IntegralVs,IntegralVVss,NVs,NVVss,gTVWLmtemp,gTVWRmtemp,deltaM,         & 
& epsI,check,gFeFvcFcFcpi)

gFeFvcFcFcp(i_run,:,:,:) = gFeFvcFcFcpi 
gT(i_run) = gT(i_run) + Sum(gFeFvcFcFcpi) 
 
gFeFvcFcpFcppi = 0._dp 
Call FeToFvcFcpFcpp(i_run,MFv,MFcp,MFcpp,MVWLm,MVWRm,MFe,cplcFcpFcppVWLmL,            & 
& cplcFcpFcppVWLmR,cplcFcpFcppVWRmL,cplcFcpFcppVWRmR,cplcFeFvcVWLmL,cplcFeFvcVWLmR,      & 
& cplcFeFvcVWRmL,cplcFeFvcVWRmR,IntegralVs,IntegralVVss,NVs,NVVss,gTVWLmtemp,            & 
& gTVWRmtemp,deltaM,epsI,check,gFeFvcFcpFcppi)

gFeFvcFcpFcpp(i_run,:,:,:) = gFeFvcFcpFcppi 
gT(i_run) = gT(i_run) + Sum(gFeFvcFcpFcppi) 
 
End Do 
 

If (Present(gPartial)) Then
Do i1 = i_start, i_end 
 
n_length=1
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
gPartial(i1,n_length)= gFeFecFdFd(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=gt1,3
gPartial(i1,n_length)= gFeFecFeFe(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
gPartial(i1,n_length)= gFeFecFuFu(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,6
    Do gt3=gt2,6
gPartial(i1,n_length)= gFeFeFvFv(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,1
    Do gt3=1,1
gPartial(i1,n_length)= gFeFecFcFc(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,1
    Do gt3=1,1
gPartial(i1,n_length)= gFeFecFcpFcp(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,1
    Do gt3=1,1
gPartial(i1,n_length)= gFeFecFcppFcpp(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,6
  Do gt2=1,3
    Do gt3=1,3
gPartial(i1,n_length)= gFeFvcFdFu(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,6
  Do gt2=1,1
    Do gt3=1,1
gPartial(i1,n_length)= gFeFvcFcFcp(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,6
  Do gt2=1,1
    Do gt3=1,1
gPartial(i1,n_length)= gFeFvcFcpFcpp(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
If (Present(BR).And.(gT(i1).Gt.0._dp)) Then 
BR(i1,:)=gPartial(i1,:)/gT(i1)
Else If (Present(BR)) Then
BR(i1,:)=0._dp
End If
 
End Do 
End if 
Deallocate( IntegralVs ) 
Deallocate( IntegralVst ) 
Deallocate( IntegralSs ) 
Deallocate( IntegralVVst ) 
Deallocate( IntegralVVss ) 
Deallocate( IntegralVSss ) 
Deallocate( IntegralVSst ) 
Deallocate( IntegralSSss ) 
Deallocate( IntegralSSst ) 
Iname = Iname - 1 
 
End Subroutine FeThreeBodyDecay
 
 
Subroutine FeToFecFdFd(iIN,MFe,MFd,MVZ,MVZR,MAh,Mhh,cplcFdFdAhL,cplcFdFdAhR,          & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZRL,cplcFdFdVZRR,             & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcFeFeVZRL,cplcFeFeVZRR,IntegralSs,IntegralSSss,IntegralVs,IntegralVSss,             & 
& IntegralVVss,NSs,NSSss,NVs,NVSss,NVVss,gTVZ,gTVZR,gTAh,gThh,deltaM,epsI,               & 
& check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFe(3),MFd(3),MVZ,MVZR,MAh(3),Mhh(3)

Complex(dp),Intent(in) :: cplcFdFdAhL(3,3,3),cplcFdFdAhR(3,3,3),cplcFdFdhhL(3,3,3),cplcFdFdhhR(3,3,3),          & 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFdFdVZRL(3,3),cplcFdFdVZRR(3,3),cplcFeFeAhL(3,3,3),& 
& cplcFeFeAhR(3,3,3),cplcFeFehhL(3,3,3),cplcFeFehhR(3,3,3),cplcFeFeVZL(3,3),             & 
& cplcFeFeVZR(3,3),cplcFeFeVZRL(3,3),cplcFeFeVZRR(3,3)

Real(dp),Intent(inout) :: IntegralSs(500000,10),IntegralVs(25000,9),IntegralVVss(500000,12)

Complex(dp),Intent(inout) :: IntegralSSss(500000,12),IntegralVSss(500000,12)

Real(dp),Intent(inout) :: gTVZ,gTVZR,gTAh(3),gThh(3)

Integer, Intent(inout) :: NSs,NSSss,NVs,NVSss,NVVss
Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp) :: Boson2(2), mass(4),  Boson4(4) 
Complex(dp) :: coup(4), coup2(8),coupT 
mass(1) = MFe(iIN) 
 
Isum = 64 
Allocate( gSum(3,3,3, Isum) ) 
Allocate( Contribution(3,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1, iIN-1
      Do gt2=1,3
        Do gt3=1,3
Isum = 0 
 
If(Abs(MFe(iIN)).gt.(Abs(MFd(gt3))+Abs(MFd(gt2))+Abs(MFe(gt1)))) Then 
!-------------- 
!  VZ 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVZ 
Boson2(2) =gTVZ 
 
Boson4(1) = MVZ 
Boson4(2) =gTVZ 
Boson4(3) = MVZ 
Boson4(4) =gTVZ 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFe(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup(2) = Conjg(cplcFeFeVZL(iIN,gt1)) 
coup(1) = Conjg(cplcFeFeVZR(iIN,gt1)) 
coup(4) = Conjg(cplcFdFdVZL(gt2,gt3)) 
coup(3) = Conjg(cplcFdFdVZR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFd Fd Propagator: VZ" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ'



!-------------- 
!  VZR 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVZR 
Boson2(2) =gTVZR 
 
Boson4(1) = MVZR 
Boson4(2) =gTVZR 
Boson4(3) = MVZR 
Boson4(4) =gTVZR 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFe(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup(2) = Conjg(cplcFeFeVZRL(iIN,gt1)) 
coup(1) = Conjg(cplcFeFeVZRR(iIN,gt1)) 
coup(4) = Conjg(cplcFdFdVZRL(gt2,gt3)) 
coup(3) = Conjg(cplcFdFdVZRR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFd Fd Propagator: VZR" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZR'



!-------------- 
!  Ah 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
Boson2(1) = MAh(i1) 
Boson2(2) =gTAh(i1) 
 
Boson4(1) = MAh(i1) 
Boson4(2) =gTAh(i1) 
Boson4(3) = MAh(i1) 
Boson4(4) =gTAh(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFe(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup(2) = Conjg(cplcFeFeAhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcFeFeAhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplcFdFdAhL(gt2,gt3,i1)) 
coup(3) = Conjg(cplcFdFdAhR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFd Fd Propagator: Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah'
      End Do 



!-------------- 
!  hh 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
Boson2(1) = Mhh(i1) 
Boson2(2) =gThh(i1) 
 
Boson4(1) = Mhh(i1) 
Boson4(2) =gThh(i1) 
Boson4(3) = Mhh(i1) 
Boson4(4) =gThh(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFe(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup(2) = Conjg(cplcFeFehhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcFeFehhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplcFdFdhhL(gt2,gt3,i1)) 
coup(3) = Conjg(cplcFdFdhhR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFd Fd Propagator: hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='hh'
      End Do 



!-------------- 
!  VZ, VZR 
!-------------- 
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MVZR 
Boson4(4) = gTVZR 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup2(1) = cplcFeFeVZL(iIN,gt1) 
coup2(2) = cplcFeFeVZR(iIN,gt1) 
coup2(4) = Conjg(cplcFeFeVZRL(iIN,gt1)) 
coup2(3) = Conjg(cplcFeFeVZRR(iIN,gt1))  
coup2(5) = cplcFdFdVZL(gt2,gt3) 
coup2(6) = cplcFdFdVZR(gt2,gt3) 
coup2(8) = Conjg(cplcFdFdVZRL(gt2,gt3)) 
coup2(7) = Conjg(cplcFdFdVZRR(gt2,gt3)) 
Call IntegrateGaugeSS(Boson4, mass, coup2, deltaM, epsI,IntegralVVss,NVVss, resR, check) 
If (resR.ne.resR) resR = 0._dp
resC = 2._dp*resR 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFd Fd Propagator: VZ,VZR" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,VZR'



!-------------- 
!  VZ, Ah 
!-------------- 
  Do i2=1,3
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MAh(i2) 
Boson4(4) = gTAh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup2(1) = cplcFeFeVZL(iIN,gt1) 
coup2(2) = cplcFeFeVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFeFeAhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFeFeAhR(iIN,gt1,i2))  
coup2(5) = cplcFdFdVZL(gt2,gt3) 
coup2(6) = cplcFdFdVZR(gt2,gt3) 
coup2(7) = Conjg(cplcFdFdAhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFdFdAhR(gt2,gt3,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFd Fd Propagator: VZ,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,Ah'
      End Do 



!-------------- 
!  VZ, hh 
!-------------- 
  Do i2=1,3
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup2(1) = cplcFeFeVZL(iIN,gt1) 
coup2(2) = cplcFeFeVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFeFehhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFeFehhR(iIN,gt1,i2))  
coup2(5) = cplcFdFdVZL(gt2,gt3) 
coup2(6) = cplcFdFdVZR(gt2,gt3) 
coup2(7) = Conjg(cplcFdFdhhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFdFdhhR(gt2,gt3,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFd Fd Propagator: VZ,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,hh'
      End Do 



!-------------- 
!  VZR, Ah 
!-------------- 
  Do i2=1,3
Boson4(1) = MVZR 
Boson4(2) = gTVZR 
Boson4(3) = MAh(i2) 
Boson4(4) = gTAh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup2(1) = cplcFeFeVZRL(iIN,gt1) 
coup2(2) = cplcFeFeVZRR(iIN,gt1) 
coup2(3) = Conjg(cplcFeFeAhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFeFeAhR(iIN,gt1,i2))  
coup2(5) = cplcFdFdVZRL(gt2,gt3) 
coup2(6) = cplcFdFdVZRR(gt2,gt3) 
coup2(7) = Conjg(cplcFdFdAhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFdFdAhR(gt2,gt3,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFd Fd Propagator: VZR,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZR,Ah'
      End Do 



!-------------- 
!  VZR, hh 
!-------------- 
  Do i2=1,3
Boson4(1) = MVZR 
Boson4(2) = gTVZR 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup2(1) = cplcFeFeVZRL(iIN,gt1) 
coup2(2) = cplcFeFeVZRR(iIN,gt1) 
coup2(3) = Conjg(cplcFeFehhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFeFehhR(iIN,gt1,i2))  
coup2(5) = cplcFdFdVZRL(gt2,gt3) 
coup2(6) = cplcFdFdVZRR(gt2,gt3) 
coup2(7) = Conjg(cplcFdFdhhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFdFdhhR(gt2,gt3,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFd Fd Propagator: VZR,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZR,hh'
      End Do 



!-------------- 
!  Ah, Ah 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Boson4(1) = MAh(i1) 
Boson4(2) = gTAh(i1) 
Boson4(3) = MAh(i2) 
Boson4(4) = gTAh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup2(1) = cplcFeFeAhL(iIN,gt1,i1) 
coup2(2) = cplcFeFeAhR(iIN,gt1,i1) 
coup2(3) = Conjg(cplcFeFeAhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFeFeAhR(iIN,gt1,i2))  
coup2(5) = cplcFdFdAhL(gt2,gt3,i1) 
coup2(6) = cplcFdFdAhR(gt2,gt3,i1) 
coup2(7) = Conjg(cplcFdFdAhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFdFdAhR(gt2,gt3,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFd Fd Propagator: Ah,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah,Ah'
        End Do 
      End Do 



!-------------- 
!  Ah, hh 
!-------------- 
Do i1=1,3
  Do i2=1,3
Boson4(1) = MAh(i1) 
Boson4(2) = gTAh(i1) 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup2(1) = cplcFeFeAhL(iIN,gt1,i1) 
coup2(2) = cplcFeFeAhR(iIN,gt1,i1) 
coup2(3) = Conjg(cplcFeFehhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFeFehhR(iIN,gt1,i2))  
coup2(5) = cplcFdFdAhL(gt2,gt3,i1) 
coup2(6) = cplcFdFdAhR(gt2,gt3,i1) 
coup2(7) = Conjg(cplcFdFdhhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFdFdhhR(gt2,gt3,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFd Fd Propagator: Ah,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah,hh'
        End Do 
      End Do 



!-------------- 
!  hh, hh 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Boson4(1) = Mhh(i1) 
Boson4(2) = gThh(i1) 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup2(1) = cplcFeFehhL(iIN,gt1,i1) 
coup2(2) = cplcFeFehhR(iIN,gt1,i1) 
coup2(3) = Conjg(cplcFeFehhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFeFehhR(iIN,gt1,i2))  
coup2(5) = cplcFdFdhhL(gt2,gt3,i1) 
coup2(6) = cplcFdFdhhR(gt2,gt3,i1) 
coup2(7) = Conjg(cplcFdFdhhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFdFdhhR(gt2,gt3,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFd Fd Propagator: hh,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='hh,hh'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1, iIN-1
      Do gt2=1,3
        Do gt3=1,3
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:64))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
  g = oo512pi3 / Abs(MFe(iIN))**3*g
End Subroutine FeToFecFdFd 
 
 
Subroutine FeToFecFeFe(iIN,MFe,MVZ,MVZR,MdeltaRpp,MAh,Mhh,cplcFecFedeltaRppL,         & 
& cplcFecFedeltaRppR,cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,        & 
& cplcFeFeVZR,cplcFeFeVZRL,cplcFeFeVZRR,cplFeFecdeltaRppL,cplFeFecdeltaRppR,             & 
& IntegralSs,IntegralSSss,IntegralSSst,IntegralVs,IntegralVSss,IntegralVSst,             & 
& IntegralVVss,IntegralVVst,NSs,NSSss,NSSst,NVs,NVSss,NVSst,NVVss,NVVst,gTVZ,            & 
& gTVZR,gTdeltaRpp,gTAh,gThh,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFe(3),MVZ,MVZR,MdeltaRpp,MAh(3),Mhh(3)

Complex(dp),Intent(in) :: cplcFecFedeltaRppL(3,3),cplcFecFedeltaRppR(3,3),cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),& 
& cplcFeFehhL(3,3,3),cplcFeFehhR(3,3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),               & 
& cplcFeFeVZRL(3,3),cplcFeFeVZRR(3,3),cplFeFecdeltaRppL(3,3),cplFeFecdeltaRppR(3,3)

Real(dp),Intent(inout) :: IntegralSs(500000,10),IntegralVs(25000,9),IntegralVVss(500000,12)

Complex(dp),Intent(inout) :: IntegralSSss(500000,12),IntegralSSst(500000,16),IntegralVSss(500000,12),              & 
& IntegralVSst(500000,16),IntegralVVst(25000,12)

Real(dp),Intent(inout) :: gTVZ,gTVZR,gTdeltaRpp,gTAh(3),gThh(3)

Integer, Intent(inout) :: NSs,NSSss,NSSst,NVs,NVSss,NVSst,NVVss,NVVst
Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp) :: Boson2(2), mass(4),  Boson4(4) 
Complex(dp) :: coup(4), coup2(8),coupT 
mass(1) = MFe(iIN) 
 
Isum = 81 
Allocate( gSum(3,3,3, Isum) ) 
Allocate( Contribution(3,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1, iIN-1
      Do gt2=1,3
        Do gt3=gt1, iIN-1
Isum = 0 
 
If(Abs(MFe(iIN)).gt.(Abs(MFe(gt3))+Abs(MFe(gt2))+Abs(MFe(gt1)))) Then 
!-------------- 
!  VZ 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVZ 
Boson2(2) =gTVZ 
 
Boson4(1) = MVZ 
Boson4(2) =gTVZ 
Boson4(3) = MVZ 
Boson4(4) =gTVZ 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFe(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup(2) = Conjg(cplcFeFeVZL(iIN,gt1)) 
coup(1) = Conjg(cplcFeFeVZR(iIN,gt1)) 
coup(4) = Conjg(cplcFeFeVZL(gt2,gt3)) 
coup(3) = Conjg(cplcFeFeVZR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFe(gt3) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt1) 
 
coup(2) = Conjg(cplcFeFeVZL(iIN,gt3)) 
coup(1) = Conjg(cplcFeFeVZR(iIN,gt3)) 
coup(4) = Conjg(cplcFeFeVZL(gt2,gt1)) 
coup(3) = Conjg(cplcFeFeVZR(gt2,gt1))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFe(gt1) 
mass(4) = MFe(gt3) 
mass(3) = -MFe(gt2) 
 
coup2(1) = cplcFeFeVZL(iIN,gt3) 
coup2(2) = cplcFeFeVZR(iIN,gt3) 
coup2(4) = Conjg(cplcFeFeVZL(iIN,gt1)) 
coup2(3) = Conjg(cplcFeFeVZR(iIN,gt1))  
coup2(5) = cplcFeFeVZL(gt2,gt1) 
coup2(6) = cplcFeFeVZR(gt2,gt1) 
coup2(8) = Conjg(cplcFeFeVZL(gt2,gt3)) 
coup2(7) = Conjg(cplcFeFeVZR(gt2,gt3)) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFe Fe Propagator: VZ" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ'



!-------------- 
!  VZR 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVZR 
Boson2(2) =gTVZR 
 
Boson4(1) = MVZR 
Boson4(2) =gTVZR 
Boson4(3) = MVZR 
Boson4(4) =gTVZR 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFe(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup(2) = Conjg(cplcFeFeVZRL(iIN,gt1)) 
coup(1) = Conjg(cplcFeFeVZRR(iIN,gt1)) 
coup(4) = Conjg(cplcFeFeVZRL(gt2,gt3)) 
coup(3) = Conjg(cplcFeFeVZRR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFe(gt3) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt1) 
 
coup(2) = Conjg(cplcFeFeVZRL(iIN,gt3)) 
coup(1) = Conjg(cplcFeFeVZRR(iIN,gt3)) 
coup(4) = Conjg(cplcFeFeVZRL(gt2,gt1)) 
coup(3) = Conjg(cplcFeFeVZRR(gt2,gt1))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFe(gt1) 
mass(4) = MFe(gt3) 
mass(3) = -MFe(gt2) 
 
coup2(1) = cplcFeFeVZRL(iIN,gt3) 
coup2(2) = cplcFeFeVZRR(iIN,gt3) 
coup2(4) = Conjg(cplcFeFeVZRL(iIN,gt1)) 
coup2(3) = Conjg(cplcFeFeVZRR(iIN,gt1))  
coup2(5) = cplcFeFeVZRL(gt2,gt1) 
coup2(6) = cplcFeFeVZRR(gt2,gt1) 
coup2(8) = Conjg(cplcFeFeVZRL(gt2,gt3)) 
coup2(7) = Conjg(cplcFeFeVZRR(gt2,gt3)) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFe Fe Propagator: VZR" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZR'



!-------------- 
!  deltaRpp 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MdeltaRpp 
Boson2(2) =gTdeltaRpp 
 
Boson4(1) = MdeltaRpp 
Boson4(2) =gTdeltaRpp 
Boson4(3) = MdeltaRpp 
Boson4(4) =gTdeltaRpp 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFe(gt2) 
mass(3) = -MFe(gt1) 
mass(4) = MFe(gt3) 
 
coup(2) = Conjg(cplcFecFedeltaRppL(iIN,gt2)) 
coup(1) = Conjg(cplcFecFedeltaRppR(iIN,gt2)) 
coup(4) = Conjg(cplFeFecdeltaRppL(gt1,gt3)) 
coup(3) = Conjg(cplFeFecdeltaRppR(gt1,gt3))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFe(gt2) 
mass(3) = -MFe(gt3) 
mass(4) = MFe(gt1) 
 
coup2(1) = cplcFecFedeltaRppL(iIN,gt2) 
coup2(2) = cplcFecFedeltaRppR(iIN,gt2) 
coup2(3) = Conjg(cplcFecFedeltaRppL(iIN,gt2)) 
coup2(4) = Conjg(cplcFecFedeltaRppR(iIN,gt2))  
coup2(5) = cplFeFecdeltaRppL(gt3,gt1) 
coup2(6) = cplFeFecdeltaRppR(gt3,gt1) 
coup2(7) = Conjg(cplFeFecdeltaRppL(gt1,gt3)) 
coup2(8) = Conjg(cplFeFecdeltaRppR(gt1,gt3)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFe Fe Propagator: deltaRpp" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='deltaRpp'



!-------------- 
!  Ah 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
Boson2(1) = MAh(i1) 
Boson2(2) =gTAh(i1) 
 
Boson4(1) = MAh(i1) 
Boson4(2) =gTAh(i1) 
Boson4(3) = MAh(i1) 
Boson4(4) =gTAh(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFe(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup(2) = Conjg(cplcFeFeAhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcFeFeAhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplcFeFeAhL(gt2,gt3,i1)) 
coup(3) = Conjg(cplcFeFeAhR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFe(gt3) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt1) 
 
coup(2) = Conjg(cplcFeFeAhL(iIN,gt3,i1)) 
coup(1) = Conjg(cplcFeFeAhR(iIN,gt3,i1)) 
coup(4) = Conjg(cplcFeFeAhL(gt2,gt1,i1)) 
coup(3) = Conjg(cplcFeFeAhR(gt2,gt1,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFe(gt1) 
mass(4) = MFe(gt3) 
mass(3) = -MFe(gt2) 
 
coup2(1) = cplcFeFeAhL(iIN,gt3,i1) 
coup2(2) = cplcFeFeAhR(iIN,gt3,i1) 
coup2(3) = Conjg(cplcFeFeAhL(iIN,gt1,i1)) 
coup2(4) = Conjg(cplcFeFeAhR(iIN,gt1,i1))  
coup2(5) = cplcFeFeAhL(gt2,gt1,i1) 
coup2(6) = cplcFeFeAhR(gt2,gt1,i1) 
coup2(7) = Conjg(cplcFeFeAhL(gt2,gt3,i1)) 
coup2(8) = Conjg(cplcFeFeAhR(gt2,gt3,i1)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFe Fe Propagator: Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah'
      End Do 



!-------------- 
!  hh 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
Boson2(1) = Mhh(i1) 
Boson2(2) =gThh(i1) 
 
Boson4(1) = Mhh(i1) 
Boson4(2) =gThh(i1) 
Boson4(3) = Mhh(i1) 
Boson4(4) =gThh(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFe(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup(2) = Conjg(cplcFeFehhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcFeFehhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplcFeFehhL(gt2,gt3,i1)) 
coup(3) = Conjg(cplcFeFehhR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFe(gt3) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt1) 
 
coup(2) = Conjg(cplcFeFehhL(iIN,gt3,i1)) 
coup(1) = Conjg(cplcFeFehhR(iIN,gt3,i1)) 
coup(4) = Conjg(cplcFeFehhL(gt2,gt1,i1)) 
coup(3) = Conjg(cplcFeFehhR(gt2,gt1,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFe(gt1) 
mass(4) = MFe(gt3) 
mass(3) = -MFe(gt2) 
 
coup2(1) = cplcFeFehhL(iIN,gt3,i1) 
coup2(2) = cplcFeFehhR(iIN,gt3,i1) 
coup2(3) = Conjg(cplcFeFehhL(iIN,gt1,i1)) 
coup2(4) = Conjg(cplcFeFehhR(iIN,gt1,i1))  
coup2(5) = cplcFeFehhL(gt2,gt1,i1) 
coup2(6) = cplcFeFehhR(gt2,gt1,i1) 
coup2(7) = Conjg(cplcFeFehhL(gt2,gt3,i1)) 
coup2(8) = Conjg(cplcFeFehhR(gt2,gt3,i1)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFe Fe Propagator: hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='hh'
      End Do 



!-------------- 
!  VZ, VZR 
!-------------- 
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MVZR 
Boson4(4) = gTVZR 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplcFeFeVZL(iIN,gt1) 
coup2(2) = cplcFeFeVZR(iIN,gt1) 
coup2(4) = Conjg(cplcFeFeVZRL(iIN,gt1)) 
coup2(3) = Conjg(cplcFeFeVZRR(iIN,gt1))  
coup2(5) = cplcFeFeVZL(gt2,gt3) 
coup2(6) = cplcFeFeVZR(gt2,gt3) 
coup2(8) = Conjg(cplcFeFeVZRL(gt2,gt3)) 
coup2(7) = Conjg(cplcFeFeVZRR(gt2,gt3)) 
Call IntegrateGaugeSS(Boson4, mass, coup2, deltaM, epsI,IntegralVVss,NVVss, resR, check) 
If (resR.ne.resR) resR = 0._dp
resC = 2._dp*resR 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFe(gt1) 
mass(4) = MFe(gt3) 
mass(3) = -MFe(gt2) 
 
coup2(1) = cplcFeFeVZL(iIN,gt3) 
coup2(2) = cplcFeFeVZR(iIN,gt3) 
coup2(4) = Conjg(cplcFeFeVZRL(iIN,gt1)) 
coup2(3) = Conjg(cplcFeFeVZRR(iIN,gt1))  
coup2(5) = cplcFeFeVZL(gt2,gt1) 
coup2(6) = cplcFeFeVZR(gt2,gt1) 
coup2(8) = Conjg(cplcFeFeVZRL(gt2,gt3)) 
coup2(7) = Conjg(cplcFeFeVZRR(gt2,gt3)) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFe(gt3) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt1) 
 
coup2(1) = cplcFeFeVZL(iIN,gt3) 
coup2(2) = cplcFeFeVZR(iIN,gt3) 
coup2(4) = Conjg(cplcFeFeVZRL(iIN,gt3)) 
coup2(3) = Conjg(cplcFeFeVZRR(iIN,gt3))  
coup2(5) = cplcFeFeVZL(gt2,gt1) 
coup2(6) = cplcFeFeVZR(gt2,gt1) 
coup2(8) = Conjg(cplcFeFeVZRL(gt2,gt1)) 
coup2(7) = Conjg(cplcFeFeVZRR(gt2,gt1)) 
Call IntegrateGaugeSS(Boson4, mass, coup2, deltaM, epsI,IntegralVVss,NVVss, resR, check) 
If (resR.ne.resR) resR = 0._dp
resC = 2._dp*resR 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFe(gt3) 
mass(4) = MFe(gt1) 
mass(3) = -MFe(gt2) 
 
coup2(1) = cplcFeFeVZL(iIN,gt1) 
coup2(2) = cplcFeFeVZR(iIN,gt1) 
coup2(4) = Conjg(cplcFeFeVZRL(iIN,gt3)) 
coup2(3) = Conjg(cplcFeFeVZRR(iIN,gt3))  
coup2(5) = cplcFeFeVZL(gt2,gt3) 
coup2(6) = cplcFeFeVZR(gt2,gt3) 
coup2(8) = Conjg(cplcFeFeVZRL(gt2,gt1)) 
coup2(7) = Conjg(cplcFeFeVZRR(gt2,gt1)) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFe Fe Propagator: VZ,VZR" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,VZR'



!-------------- 
!  VZ, deltaRpp 
!-------------- 
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MdeltaRpp 
Boson4(4) = gTdeltaRpp 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt2) 
mass(4) = MFe(gt1) 
mass(3) = -MFe(gt3) 
 
coup2(1) = cplcFeFeVZL(iIN,gt1) 
coup2(2) = cplcFeFeVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFecFedeltaRppL(iIN,gt2)) 
coup2(4) = Conjg(cplcFecFedeltaRppR(iIN,gt2))  
coup2(5) = cplcFeFeVZL(gt2,gt3) 
coup2(6) = cplcFeFeVZR(gt2,gt3) 
coup2(7) = Conjg(cplFeFecdeltaRppL(gt1,gt3)) 
coup2(8) = Conjg(cplFeFecdeltaRppR(gt1,gt3)) 
coupT = coup2(2) 
coup2(2) = coup2(1) 
coup2(1) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFe(gt2) 
mass(4) = MFe(gt3) 
mass(3) = -MFe(gt1) 
 
coup2(1) = cplcFeFeVZL(iIN,gt3) 
coup2(2) = cplcFeFeVZR(iIN,gt3) 
coup2(3) = Conjg(cplcFecFedeltaRppL(iIN,gt2)) 
coup2(4) = Conjg(cplcFecFedeltaRppR(iIN,gt2))  
coup2(5) = cplcFeFeVZL(gt2,gt1) 
coup2(6) = cplcFeFeVZR(gt2,gt1) 
coup2(7) = Conjg(cplFeFecdeltaRppL(gt1,gt3)) 
coup2(8) = Conjg(cplFeFecdeltaRppR(gt1,gt3)) 
coupT = coup2(2) 
coup2(2) = coup2(1) 
coup2(1) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFe Fe Propagator: VZ,deltaRpp" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,deltaRpp'



!-------------- 
!  VZ, Ah 
!-------------- 
  Do i2=1,3
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MAh(i2) 
Boson4(4) = gTAh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplcFeFeVZL(iIN,gt1) 
coup2(2) = cplcFeFeVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFeFeAhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFeFeAhR(iIN,gt1,i2))  
coup2(5) = cplcFeFeVZL(gt2,gt3) 
coup2(6) = cplcFeFeVZR(gt2,gt3) 
coup2(7) = Conjg(cplcFeFeAhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFeFeAhR(gt2,gt3,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFe(gt1) 
mass(4) = MFe(gt3) 
mass(3) = -MFe(gt2) 
 
coup2(1) = cplcFeFeVZL(iIN,gt3) 
coup2(2) = cplcFeFeVZR(iIN,gt3) 
coup2(3) = Conjg(cplcFeFeAhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFeFeAhR(iIN,gt1,i2))  
coup2(5) = cplcFeFeVZL(gt2,gt1) 
coup2(6) = cplcFeFeVZR(gt2,gt1) 
coup2(7) = Conjg(cplcFeFeAhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFeFeAhR(gt2,gt3,i2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFe(gt3) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt1) 
 
coup2(1) = cplcFeFeVZL(iIN,gt3) 
coup2(2) = cplcFeFeVZR(iIN,gt3) 
coup2(3) = Conjg(cplcFeFeAhL(iIN,gt3,i2)) 
coup2(4) = Conjg(cplcFeFeAhR(iIN,gt3,i2))  
coup2(5) = cplcFeFeVZL(gt2,gt1) 
coup2(6) = cplcFeFeVZR(gt2,gt1) 
coup2(7) = Conjg(cplcFeFeAhL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplcFeFeAhR(gt2,gt1,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFe(gt3) 
mass(4) = MFe(gt1) 
mass(3) = -MFe(gt2) 
 
coup2(1) = cplcFeFeVZL(iIN,gt1) 
coup2(2) = cplcFeFeVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFeFeAhL(iIN,gt3,i2)) 
coup2(4) = Conjg(cplcFeFeAhR(iIN,gt3,i2))  
coup2(5) = cplcFeFeVZL(gt2,gt3) 
coup2(6) = cplcFeFeVZR(gt2,gt3) 
coup2(7) = Conjg(cplcFeFeAhL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplcFeFeAhR(gt2,gt1,i2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFe Fe Propagator: VZ,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,Ah'
      End Do 



!-------------- 
!  VZ, hh 
!-------------- 
  Do i2=1,3
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplcFeFeVZL(iIN,gt1) 
coup2(2) = cplcFeFeVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFeFehhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFeFehhR(iIN,gt1,i2))  
coup2(5) = cplcFeFeVZL(gt2,gt3) 
coup2(6) = cplcFeFeVZR(gt2,gt3) 
coup2(7) = Conjg(cplcFeFehhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFeFehhR(gt2,gt3,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFe(gt1) 
mass(4) = MFe(gt3) 
mass(3) = -MFe(gt2) 
 
coup2(1) = cplcFeFeVZL(iIN,gt3) 
coup2(2) = cplcFeFeVZR(iIN,gt3) 
coup2(3) = Conjg(cplcFeFehhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFeFehhR(iIN,gt1,i2))  
coup2(5) = cplcFeFeVZL(gt2,gt1) 
coup2(6) = cplcFeFeVZR(gt2,gt1) 
coup2(7) = Conjg(cplcFeFehhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFeFehhR(gt2,gt3,i2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFe(gt3) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt1) 
 
coup2(1) = cplcFeFeVZL(iIN,gt3) 
coup2(2) = cplcFeFeVZR(iIN,gt3) 
coup2(3) = Conjg(cplcFeFehhL(iIN,gt3,i2)) 
coup2(4) = Conjg(cplcFeFehhR(iIN,gt3,i2))  
coup2(5) = cplcFeFeVZL(gt2,gt1) 
coup2(6) = cplcFeFeVZR(gt2,gt1) 
coup2(7) = Conjg(cplcFeFehhL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplcFeFehhR(gt2,gt1,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFe(gt3) 
mass(4) = MFe(gt1) 
mass(3) = -MFe(gt2) 
 
coup2(1) = cplcFeFeVZL(iIN,gt1) 
coup2(2) = cplcFeFeVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFeFehhL(iIN,gt3,i2)) 
coup2(4) = Conjg(cplcFeFehhR(iIN,gt3,i2))  
coup2(5) = cplcFeFeVZL(gt2,gt3) 
coup2(6) = cplcFeFeVZR(gt2,gt3) 
coup2(7) = Conjg(cplcFeFehhL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplcFeFehhR(gt2,gt1,i2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFe Fe Propagator: VZ,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,hh'
      End Do 



!-------------- 
!  VZR, deltaRpp 
!-------------- 
Boson4(1) = MVZR 
Boson4(2) = gTVZR 
Boson4(3) = MdeltaRpp 
Boson4(4) = gTdeltaRpp 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt2) 
mass(4) = MFe(gt1) 
mass(3) = -MFe(gt3) 
 
coup2(1) = cplcFeFeVZRL(iIN,gt1) 
coup2(2) = cplcFeFeVZRR(iIN,gt1) 
coup2(3) = Conjg(cplcFecFedeltaRppL(iIN,gt2)) 
coup2(4) = Conjg(cplcFecFedeltaRppR(iIN,gt2))  
coup2(5) = cplcFeFeVZRL(gt2,gt3) 
coup2(6) = cplcFeFeVZRR(gt2,gt3) 
coup2(7) = Conjg(cplFeFecdeltaRppL(gt1,gt3)) 
coup2(8) = Conjg(cplFeFecdeltaRppR(gt1,gt3)) 
coupT = coup2(2) 
coup2(2) = coup2(1) 
coup2(1) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFe(gt2) 
mass(4) = MFe(gt3) 
mass(3) = -MFe(gt1) 
 
coup2(1) = cplcFeFeVZRL(iIN,gt3) 
coup2(2) = cplcFeFeVZRR(iIN,gt3) 
coup2(3) = Conjg(cplcFecFedeltaRppL(iIN,gt2)) 
coup2(4) = Conjg(cplcFecFedeltaRppR(iIN,gt2))  
coup2(5) = cplcFeFeVZRL(gt2,gt1) 
coup2(6) = cplcFeFeVZRR(gt2,gt1) 
coup2(7) = Conjg(cplFeFecdeltaRppL(gt1,gt3)) 
coup2(8) = Conjg(cplFeFecdeltaRppR(gt1,gt3)) 
coupT = coup2(2) 
coup2(2) = coup2(1) 
coup2(1) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFe Fe Propagator: VZR,deltaRpp" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZR,deltaRpp'



!-------------- 
!  VZR, Ah 
!-------------- 
  Do i2=1,3
Boson4(1) = MVZR 
Boson4(2) = gTVZR 
Boson4(3) = MAh(i2) 
Boson4(4) = gTAh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplcFeFeVZRL(iIN,gt1) 
coup2(2) = cplcFeFeVZRR(iIN,gt1) 
coup2(3) = Conjg(cplcFeFeAhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFeFeAhR(iIN,gt1,i2))  
coup2(5) = cplcFeFeVZRL(gt2,gt3) 
coup2(6) = cplcFeFeVZRR(gt2,gt3) 
coup2(7) = Conjg(cplcFeFeAhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFeFeAhR(gt2,gt3,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFe(gt1) 
mass(4) = MFe(gt3) 
mass(3) = -MFe(gt2) 
 
coup2(1) = cplcFeFeVZRL(iIN,gt3) 
coup2(2) = cplcFeFeVZRR(iIN,gt3) 
coup2(3) = Conjg(cplcFeFeAhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFeFeAhR(iIN,gt1,i2))  
coup2(5) = cplcFeFeVZRL(gt2,gt1) 
coup2(6) = cplcFeFeVZRR(gt2,gt1) 
coup2(7) = Conjg(cplcFeFeAhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFeFeAhR(gt2,gt3,i2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFe(gt3) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt1) 
 
coup2(1) = cplcFeFeVZRL(iIN,gt3) 
coup2(2) = cplcFeFeVZRR(iIN,gt3) 
coup2(3) = Conjg(cplcFeFeAhL(iIN,gt3,i2)) 
coup2(4) = Conjg(cplcFeFeAhR(iIN,gt3,i2))  
coup2(5) = cplcFeFeVZRL(gt2,gt1) 
coup2(6) = cplcFeFeVZRR(gt2,gt1) 
coup2(7) = Conjg(cplcFeFeAhL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplcFeFeAhR(gt2,gt1,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFe(gt3) 
mass(4) = MFe(gt1) 
mass(3) = -MFe(gt2) 
 
coup2(1) = cplcFeFeVZRL(iIN,gt1) 
coup2(2) = cplcFeFeVZRR(iIN,gt1) 
coup2(3) = Conjg(cplcFeFeAhL(iIN,gt3,i2)) 
coup2(4) = Conjg(cplcFeFeAhR(iIN,gt3,i2))  
coup2(5) = cplcFeFeVZRL(gt2,gt3) 
coup2(6) = cplcFeFeVZRR(gt2,gt3) 
coup2(7) = Conjg(cplcFeFeAhL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplcFeFeAhR(gt2,gt1,i2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFe Fe Propagator: VZR,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZR,Ah'
      End Do 



!-------------- 
!  VZR, hh 
!-------------- 
  Do i2=1,3
Boson4(1) = MVZR 
Boson4(2) = gTVZR 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplcFeFeVZRL(iIN,gt1) 
coup2(2) = cplcFeFeVZRR(iIN,gt1) 
coup2(3) = Conjg(cplcFeFehhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFeFehhR(iIN,gt1,i2))  
coup2(5) = cplcFeFeVZRL(gt2,gt3) 
coup2(6) = cplcFeFeVZRR(gt2,gt3) 
coup2(7) = Conjg(cplcFeFehhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFeFehhR(gt2,gt3,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFe(gt1) 
mass(4) = MFe(gt3) 
mass(3) = -MFe(gt2) 
 
coup2(1) = cplcFeFeVZRL(iIN,gt3) 
coup2(2) = cplcFeFeVZRR(iIN,gt3) 
coup2(3) = Conjg(cplcFeFehhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFeFehhR(iIN,gt1,i2))  
coup2(5) = cplcFeFeVZRL(gt2,gt1) 
coup2(6) = cplcFeFeVZRR(gt2,gt1) 
coup2(7) = Conjg(cplcFeFehhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFeFehhR(gt2,gt3,i2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFe(gt3) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt1) 
 
coup2(1) = cplcFeFeVZRL(iIN,gt3) 
coup2(2) = cplcFeFeVZRR(iIN,gt3) 
coup2(3) = Conjg(cplcFeFehhL(iIN,gt3,i2)) 
coup2(4) = Conjg(cplcFeFehhR(iIN,gt3,i2))  
coup2(5) = cplcFeFeVZRL(gt2,gt1) 
coup2(6) = cplcFeFeVZRR(gt2,gt1) 
coup2(7) = Conjg(cplcFeFehhL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplcFeFehhR(gt2,gt1,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFe(gt3) 
mass(4) = MFe(gt1) 
mass(3) = -MFe(gt2) 
 
coup2(1) = cplcFeFeVZRL(iIN,gt1) 
coup2(2) = cplcFeFeVZRR(iIN,gt1) 
coup2(3) = Conjg(cplcFeFehhL(iIN,gt3,i2)) 
coup2(4) = Conjg(cplcFeFehhR(iIN,gt3,i2))  
coup2(5) = cplcFeFeVZRL(gt2,gt3) 
coup2(6) = cplcFeFeVZRR(gt2,gt3) 
coup2(7) = Conjg(cplcFeFehhL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplcFeFehhR(gt2,gt1,i2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFe Fe Propagator: VZR,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZR,hh'
      End Do 



!-------------- 
!  deltaRpp, Ah 
!-------------- 
  Do i2=1,3
Boson4(1) = MdeltaRpp 
Boson4(2) = gTdeltaRpp 
Boson4(3) = MAh(i2) 
Boson4(4) = gTAh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt1) 
mass(4) = MFe(gt2) 
mass(3) = -MFe(gt3) 
 
coup2(1) = cplcFecFedeltaRppL(iIN,gt2) 
coup2(2) = cplcFecFedeltaRppR(iIN,gt2) 
coup2(3) = Conjg(cplcFeFeAhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFeFeAhR(iIN,gt1,i2))  
coup2(5) = cplFeFecdeltaRppL(gt1,gt3) 
coup2(6) = cplFeFecdeltaRppR(gt1,gt3) 
coup2(7) = Conjg(cplcFeFeAhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFeFeAhR(gt2,gt3,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFe(gt3) 
mass(4) = MFe(gt2) 
mass(3) = -MFe(gt1) 
 
coup2(1) = cplcFecFedeltaRppL(iIN,gt2) 
coup2(2) = cplcFecFedeltaRppR(iIN,gt2) 
coup2(3) = Conjg(cplcFeFeAhL(iIN,gt3,i2)) 
coup2(4) = Conjg(cplcFeFeAhR(iIN,gt3,i2))  
coup2(5) = cplFeFecdeltaRppL(gt1,gt3) 
coup2(6) = cplFeFecdeltaRppR(gt1,gt3) 
coup2(7) = Conjg(cplcFeFeAhL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplcFeFeAhR(gt2,gt1,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFe Fe Propagator: deltaRpp,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='deltaRpp,Ah'
      End Do 



!-------------- 
!  deltaRpp, hh 
!-------------- 
  Do i2=1,3
Boson4(1) = MdeltaRpp 
Boson4(2) = gTdeltaRpp 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt1) 
mass(4) = MFe(gt2) 
mass(3) = -MFe(gt3) 
 
coup2(1) = cplcFecFedeltaRppL(iIN,gt2) 
coup2(2) = cplcFecFedeltaRppR(iIN,gt2) 
coup2(3) = Conjg(cplcFeFehhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFeFehhR(iIN,gt1,i2))  
coup2(5) = cplFeFecdeltaRppL(gt1,gt3) 
coup2(6) = cplFeFecdeltaRppR(gt1,gt3) 
coup2(7) = Conjg(cplcFeFehhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFeFehhR(gt2,gt3,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFe(gt3) 
mass(4) = MFe(gt2) 
mass(3) = -MFe(gt1) 
 
coup2(1) = cplcFecFedeltaRppL(iIN,gt2) 
coup2(2) = cplcFecFedeltaRppR(iIN,gt2) 
coup2(3) = Conjg(cplcFeFehhL(iIN,gt3,i2)) 
coup2(4) = Conjg(cplcFeFehhR(iIN,gt3,i2))  
coup2(5) = cplFeFecdeltaRppL(gt1,gt3) 
coup2(6) = cplFeFecdeltaRppR(gt1,gt3) 
coup2(7) = Conjg(cplcFeFehhL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplcFeFehhR(gt2,gt1,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFe Fe Propagator: deltaRpp,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='deltaRpp,hh'
      End Do 



!-------------- 
!  Ah, Ah 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Boson4(1) = MAh(i1) 
Boson4(2) = gTAh(i1) 
Boson4(3) = MAh(i2) 
Boson4(4) = gTAh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplcFeFeAhL(iIN,gt1,i1) 
coup2(2) = cplcFeFeAhR(iIN,gt1,i1) 
coup2(3) = Conjg(cplcFeFeAhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFeFeAhR(iIN,gt1,i2))  
coup2(5) = cplcFeFeAhL(gt2,gt3,i1) 
coup2(6) = cplcFeFeAhR(gt2,gt3,i1) 
coup2(7) = Conjg(cplcFeFeAhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFeFeAhR(gt2,gt3,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFe(gt1) 
mass(4) = MFe(gt3) 
mass(3) = -MFe(gt2) 
 
coup2(1) = cplcFeFeAhL(iIN,gt3,i1) 
coup2(2) = cplcFeFeAhR(iIN,gt3,i1) 
coup2(3) = Conjg(cplcFeFeAhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFeFeAhR(iIN,gt1,i2))  
coup2(5) = cplcFeFeAhL(gt2,gt1,i1) 
coup2(6) = cplcFeFeAhR(gt2,gt1,i1) 
coup2(7) = Conjg(cplcFeFeAhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFeFeAhR(gt2,gt3,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFe(gt3) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt1) 
 
coup2(1) = cplcFeFeAhL(iIN,gt3,i1) 
coup2(2) = cplcFeFeAhR(iIN,gt3,i1) 
coup2(3) = Conjg(cplcFeFeAhL(iIN,gt3,i2)) 
coup2(4) = Conjg(cplcFeFeAhR(iIN,gt3,i2))  
coup2(5) = cplcFeFeAhL(gt2,gt1,i1) 
coup2(6) = cplcFeFeAhR(gt2,gt1,i1) 
coup2(7) = Conjg(cplcFeFeAhL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplcFeFeAhR(gt2,gt1,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFe(gt3) 
mass(4) = MFe(gt1) 
mass(3) = -MFe(gt2) 
 
coup2(1) = cplcFeFeAhL(iIN,gt1,i1) 
coup2(2) = cplcFeFeAhR(iIN,gt1,i1) 
coup2(3) = Conjg(cplcFeFeAhL(iIN,gt3,i2)) 
coup2(4) = Conjg(cplcFeFeAhR(iIN,gt3,i2))  
coup2(5) = cplcFeFeAhL(gt2,gt3,i1) 
coup2(6) = cplcFeFeAhR(gt2,gt3,i1) 
coup2(7) = Conjg(cplcFeFeAhL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplcFeFeAhR(gt2,gt1,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFe Fe Propagator: Ah,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah,Ah'
        End Do 
      End Do 



!-------------- 
!  Ah, hh 
!-------------- 
Do i1=1,3
  Do i2=1,3
Boson4(1) = MAh(i1) 
Boson4(2) = gTAh(i1) 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplcFeFeAhL(iIN,gt1,i1) 
coup2(2) = cplcFeFeAhR(iIN,gt1,i1) 
coup2(3) = Conjg(cplcFeFehhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFeFehhR(iIN,gt1,i2))  
coup2(5) = cplcFeFeAhL(gt2,gt3,i1) 
coup2(6) = cplcFeFeAhR(gt2,gt3,i1) 
coup2(7) = Conjg(cplcFeFehhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFeFehhR(gt2,gt3,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFe(gt1) 
mass(4) = MFe(gt3) 
mass(3) = -MFe(gt2) 
 
coup2(1) = cplcFeFeAhL(iIN,gt3,i1) 
coup2(2) = cplcFeFeAhR(iIN,gt3,i1) 
coup2(3) = Conjg(cplcFeFehhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFeFehhR(iIN,gt1,i2))  
coup2(5) = cplcFeFeAhL(gt2,gt1,i1) 
coup2(6) = cplcFeFeAhR(gt2,gt1,i1) 
coup2(7) = Conjg(cplcFeFehhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFeFehhR(gt2,gt3,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFe(gt3) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt1) 
 
coup2(1) = cplcFeFeAhL(iIN,gt3,i1) 
coup2(2) = cplcFeFeAhR(iIN,gt3,i1) 
coup2(3) = Conjg(cplcFeFehhL(iIN,gt3,i2)) 
coup2(4) = Conjg(cplcFeFehhR(iIN,gt3,i2))  
coup2(5) = cplcFeFeAhL(gt2,gt1,i1) 
coup2(6) = cplcFeFeAhR(gt2,gt1,i1) 
coup2(7) = Conjg(cplcFeFehhL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplcFeFehhR(gt2,gt1,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFe(gt3) 
mass(4) = MFe(gt1) 
mass(3) = -MFe(gt2) 
 
coup2(1) = cplcFeFeAhL(iIN,gt1,i1) 
coup2(2) = cplcFeFeAhR(iIN,gt1,i1) 
coup2(3) = Conjg(cplcFeFehhL(iIN,gt3,i2)) 
coup2(4) = Conjg(cplcFeFehhR(iIN,gt3,i2))  
coup2(5) = cplcFeFeAhL(gt2,gt3,i1) 
coup2(6) = cplcFeFeAhR(gt2,gt3,i1) 
coup2(7) = Conjg(cplcFeFehhL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplcFeFehhR(gt2,gt1,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFe Fe Propagator: Ah,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah,hh'
        End Do 
      End Do 



!-------------- 
!  hh, hh 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Boson4(1) = Mhh(i1) 
Boson4(2) = gThh(i1) 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplcFeFehhL(iIN,gt1,i1) 
coup2(2) = cplcFeFehhR(iIN,gt1,i1) 
coup2(3) = Conjg(cplcFeFehhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFeFehhR(iIN,gt1,i2))  
coup2(5) = cplcFeFehhL(gt2,gt3,i1) 
coup2(6) = cplcFeFehhR(gt2,gt3,i1) 
coup2(7) = Conjg(cplcFeFehhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFeFehhR(gt2,gt3,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFe(gt1) 
mass(4) = MFe(gt3) 
mass(3) = -MFe(gt2) 
 
coup2(1) = cplcFeFehhL(iIN,gt3,i1) 
coup2(2) = cplcFeFehhR(iIN,gt3,i1) 
coup2(3) = Conjg(cplcFeFehhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFeFehhR(iIN,gt1,i2))  
coup2(5) = cplcFeFehhL(gt2,gt1,i1) 
coup2(6) = cplcFeFehhR(gt2,gt1,i1) 
coup2(7) = Conjg(cplcFeFehhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFeFehhR(gt2,gt3,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFe(gt3) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt1) 
 
coup2(1) = cplcFeFehhL(iIN,gt3,i1) 
coup2(2) = cplcFeFehhR(iIN,gt3,i1) 
coup2(3) = Conjg(cplcFeFehhL(iIN,gt3,i2)) 
coup2(4) = Conjg(cplcFeFehhR(iIN,gt3,i2))  
coup2(5) = cplcFeFehhL(gt2,gt1,i1) 
coup2(6) = cplcFeFehhR(gt2,gt1,i1) 
coup2(7) = Conjg(cplcFeFehhL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplcFeFehhR(gt2,gt1,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFe(gt3) 
mass(4) = MFe(gt1) 
mass(3) = -MFe(gt2) 
 
coup2(1) = cplcFeFehhL(iIN,gt1,i1) 
coup2(2) = cplcFeFehhR(iIN,gt1,i1) 
coup2(3) = Conjg(cplcFeFehhL(iIN,gt3,i2)) 
coup2(4) = Conjg(cplcFeFehhR(iIN,gt3,i2))  
coup2(5) = cplcFeFehhL(gt2,gt3,i1) 
coup2(6) = cplcFeFehhR(gt2,gt3,i1) 
coup2(7) = Conjg(cplcFeFehhL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplcFeFehhR(gt2,gt1,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFe Fe Propagator: hh,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='hh,hh'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1, iIN-1
      Do gt2=1,3
        Do gt3=gt1, iIN-1
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:81))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
  g = oo512pi3 / Abs(MFe(iIN))**3*g
End Subroutine FeToFecFeFe 
 
 
Subroutine FeToFecFuFu(iIN,MFe,MFu,MVZ,MVZR,MAh,Mhh,cplcFeFeAhL,cplcFeFeAhR,          & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZRL,cplcFeFeVZRR,             & 
& cplcFuFuAhL,cplcFuFuAhR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcFuFuVZRL,cplcFuFuVZRR,IntegralSs,IntegralSSss,IntegralVs,IntegralVSss,             & 
& IntegralVVss,NSs,NSSss,NVs,NVSss,NVVss,gTVZ,gTVZR,gTAh,gThh,deltaM,epsI,               & 
& check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFe(3),MFu(3),MVZ,MVZR,MAh(3),Mhh(3)

Complex(dp),Intent(in) :: cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),cplcFeFehhL(3,3,3),cplcFeFehhR(3,3,3),          & 
& cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFeVZRL(3,3),cplcFeFeVZRR(3,3),cplcFuFuAhL(3,3,3),& 
& cplcFuFuAhR(3,3,3),cplcFuFuhhL(3,3,3),cplcFuFuhhR(3,3,3),cplcFuFuVZL(3,3),             & 
& cplcFuFuVZR(3,3),cplcFuFuVZRL(3,3),cplcFuFuVZRR(3,3)

Real(dp),Intent(inout) :: IntegralSs(500000,10),IntegralVs(25000,9),IntegralVVss(500000,12)

Complex(dp),Intent(inout) :: IntegralSSss(500000,12),IntegralVSss(500000,12)

Real(dp),Intent(inout) :: gTVZ,gTVZR,gTAh(3),gThh(3)

Integer, Intent(inout) :: NSs,NSSss,NVs,NVSss,NVVss
Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp) :: Boson2(2), mass(4),  Boson4(4) 
Complex(dp) :: coup(4), coup2(8),coupT 
mass(1) = MFe(iIN) 
 
Isum = 64 
Allocate( gSum(3,3,3, Isum) ) 
Allocate( Contribution(3,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1, iIN-1
      Do gt2=1,3
        Do gt3=1,3
Isum = 0 
 
If(Abs(MFe(iIN)).gt.(Abs(MFu(gt3))+Abs(MFu(gt2))+Abs(MFe(gt1)))) Then 
!-------------- 
!  VZ 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVZ 
Boson2(2) =gTVZ 
 
Boson4(1) = MVZ 
Boson4(2) =gTVZ 
Boson4(3) = MVZ 
Boson4(4) =gTVZ 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFe(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup(2) = Conjg(cplcFeFeVZL(iIN,gt1)) 
coup(1) = Conjg(cplcFeFeVZR(iIN,gt1)) 
coup(4) = Conjg(cplcFuFuVZL(gt2,gt3)) 
coup(3) = Conjg(cplcFuFuVZR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFu Fu Propagator: VZ" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ'



!-------------- 
!  VZR 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVZR 
Boson2(2) =gTVZR 
 
Boson4(1) = MVZR 
Boson4(2) =gTVZR 
Boson4(3) = MVZR 
Boson4(4) =gTVZR 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFe(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup(2) = Conjg(cplcFeFeVZRL(iIN,gt1)) 
coup(1) = Conjg(cplcFeFeVZRR(iIN,gt1)) 
coup(4) = Conjg(cplcFuFuVZRL(gt2,gt3)) 
coup(3) = Conjg(cplcFuFuVZRR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFu Fu Propagator: VZR" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZR'



!-------------- 
!  Ah 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
Boson2(1) = MAh(i1) 
Boson2(2) =gTAh(i1) 
 
Boson4(1) = MAh(i1) 
Boson4(2) =gTAh(i1) 
Boson4(3) = MAh(i1) 
Boson4(4) =gTAh(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFe(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup(2) = Conjg(cplcFeFeAhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcFeFeAhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplcFuFuAhL(gt2,gt3,i1)) 
coup(3) = Conjg(cplcFuFuAhR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFu Fu Propagator: Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah'
      End Do 



!-------------- 
!  hh 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
Boson2(1) = Mhh(i1) 
Boson2(2) =gThh(i1) 
 
Boson4(1) = Mhh(i1) 
Boson4(2) =gThh(i1) 
Boson4(3) = Mhh(i1) 
Boson4(4) =gThh(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFe(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup(2) = Conjg(cplcFeFehhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcFeFehhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplcFuFuhhL(gt2,gt3,i1)) 
coup(3) = Conjg(cplcFuFuhhR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFu Fu Propagator: hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='hh'
      End Do 



!-------------- 
!  VZ, VZR 
!-------------- 
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MVZR 
Boson4(4) = gTVZR 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup2(1) = cplcFeFeVZL(iIN,gt1) 
coup2(2) = cplcFeFeVZR(iIN,gt1) 
coup2(4) = Conjg(cplcFeFeVZRL(iIN,gt1)) 
coup2(3) = Conjg(cplcFeFeVZRR(iIN,gt1))  
coup2(5) = cplcFuFuVZL(gt2,gt3) 
coup2(6) = cplcFuFuVZR(gt2,gt3) 
coup2(8) = Conjg(cplcFuFuVZRL(gt2,gt3)) 
coup2(7) = Conjg(cplcFuFuVZRR(gt2,gt3)) 
Call IntegrateGaugeSS(Boson4, mass, coup2, deltaM, epsI,IntegralVVss,NVVss, resR, check) 
If (resR.ne.resR) resR = 0._dp
resC = 2._dp*resR 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFu Fu Propagator: VZ,VZR" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,VZR'



!-------------- 
!  VZ, Ah 
!-------------- 
  Do i2=1,3
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MAh(i2) 
Boson4(4) = gTAh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup2(1) = cplcFeFeVZL(iIN,gt1) 
coup2(2) = cplcFeFeVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFeFeAhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFeFeAhR(iIN,gt1,i2))  
coup2(5) = cplcFuFuVZL(gt2,gt3) 
coup2(6) = cplcFuFuVZR(gt2,gt3) 
coup2(7) = Conjg(cplcFuFuAhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFuFuAhR(gt2,gt3,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFu Fu Propagator: VZ,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,Ah'
      End Do 



!-------------- 
!  VZ, hh 
!-------------- 
  Do i2=1,3
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup2(1) = cplcFeFeVZL(iIN,gt1) 
coup2(2) = cplcFeFeVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFeFehhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFeFehhR(iIN,gt1,i2))  
coup2(5) = cplcFuFuVZL(gt2,gt3) 
coup2(6) = cplcFuFuVZR(gt2,gt3) 
coup2(7) = Conjg(cplcFuFuhhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFuFuhhR(gt2,gt3,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFu Fu Propagator: VZ,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,hh'
      End Do 



!-------------- 
!  VZR, Ah 
!-------------- 
  Do i2=1,3
Boson4(1) = MVZR 
Boson4(2) = gTVZR 
Boson4(3) = MAh(i2) 
Boson4(4) = gTAh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup2(1) = cplcFeFeVZRL(iIN,gt1) 
coup2(2) = cplcFeFeVZRR(iIN,gt1) 
coup2(3) = Conjg(cplcFeFeAhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFeFeAhR(iIN,gt1,i2))  
coup2(5) = cplcFuFuVZRL(gt2,gt3) 
coup2(6) = cplcFuFuVZRR(gt2,gt3) 
coup2(7) = Conjg(cplcFuFuAhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFuFuAhR(gt2,gt3,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFu Fu Propagator: VZR,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZR,Ah'
      End Do 



!-------------- 
!  VZR, hh 
!-------------- 
  Do i2=1,3
Boson4(1) = MVZR 
Boson4(2) = gTVZR 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup2(1) = cplcFeFeVZRL(iIN,gt1) 
coup2(2) = cplcFeFeVZRR(iIN,gt1) 
coup2(3) = Conjg(cplcFeFehhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFeFehhR(iIN,gt1,i2))  
coup2(5) = cplcFuFuVZRL(gt2,gt3) 
coup2(6) = cplcFuFuVZRR(gt2,gt3) 
coup2(7) = Conjg(cplcFuFuhhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFuFuhhR(gt2,gt3,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFu Fu Propagator: VZR,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZR,hh'
      End Do 



!-------------- 
!  Ah, Ah 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Boson4(1) = MAh(i1) 
Boson4(2) = gTAh(i1) 
Boson4(3) = MAh(i2) 
Boson4(4) = gTAh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup2(1) = cplcFeFeAhL(iIN,gt1,i1) 
coup2(2) = cplcFeFeAhR(iIN,gt1,i1) 
coup2(3) = Conjg(cplcFeFeAhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFeFeAhR(iIN,gt1,i2))  
coup2(5) = cplcFuFuAhL(gt2,gt3,i1) 
coup2(6) = cplcFuFuAhR(gt2,gt3,i1) 
coup2(7) = Conjg(cplcFuFuAhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFuFuAhR(gt2,gt3,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFu Fu Propagator: Ah,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah,Ah'
        End Do 
      End Do 



!-------------- 
!  Ah, hh 
!-------------- 
Do i1=1,3
  Do i2=1,3
Boson4(1) = MAh(i1) 
Boson4(2) = gTAh(i1) 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup2(1) = cplcFeFeAhL(iIN,gt1,i1) 
coup2(2) = cplcFeFeAhR(iIN,gt1,i1) 
coup2(3) = Conjg(cplcFeFehhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFeFehhR(iIN,gt1,i2))  
coup2(5) = cplcFuFuAhL(gt2,gt3,i1) 
coup2(6) = cplcFuFuAhR(gt2,gt3,i1) 
coup2(7) = Conjg(cplcFuFuhhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFuFuhhR(gt2,gt3,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFu Fu Propagator: Ah,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah,hh'
        End Do 
      End Do 



!-------------- 
!  hh, hh 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Boson4(1) = Mhh(i1) 
Boson4(2) = gThh(i1) 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup2(1) = cplcFeFehhL(iIN,gt1,i1) 
coup2(2) = cplcFeFehhR(iIN,gt1,i1) 
coup2(3) = Conjg(cplcFeFehhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFeFehhR(iIN,gt1,i2))  
coup2(5) = cplcFuFuhhL(gt2,gt3,i1) 
coup2(6) = cplcFuFuhhR(gt2,gt3,i1) 
coup2(7) = Conjg(cplcFuFuhhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFuFuhhR(gt2,gt3,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFu Fu Propagator: hh,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='hh,hh'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1, iIN-1
      Do gt2=1,3
        Do gt3=1,3
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:64))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
  g = oo512pi3 / Abs(MFe(iIN))**3*g
End Subroutine FeToFecFuFu 
 
 
Subroutine FeToFeFvFv(iIN,MFe,MFv,MVZ,MVZR,MVWLm,MVWRm,MHpm,MAh,Mhh,cplcFeFeAhL,      & 
& cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZRL,              & 
& cplcFeFeVZRR,cplcFeFvcHpmL,cplcFeFvcHpmR,cplcFeFvcVWLmL,cplcFeFvcVWLmR,cplcFeFvcVWRmL, & 
& cplcFeFvcVWRmR,cplFvFeHpmL,cplFvFeHpmR,cplFvFeVWLmL,cplFvFeVWLmR,cplFvFeVWRmL,         & 
& cplFvFeVWRmR,cplFvFvAhL,cplFvFvAhR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,        & 
& cplFvFvVZRL,cplFvFvVZRR,IntegralSs,IntegralSSss,IntegralSSst,IntegralVs,               & 
& IntegralVSss,IntegralVSst,IntegralVVss,IntegralVVst,NSs,NSSss,NSSst,NVs,               & 
& NVSss,NVSst,NVVss,NVVst,gTVZ,gTVZR,gTVWLm,gTVWRm,gTHpm,gTAh,gThh,deltaM,               & 
& epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFe(3),MFv(6),MVZ,MVZR,MVWLm,MVWRm,MHpm(3),MAh(3),Mhh(3)

Complex(dp),Intent(in) :: cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),cplcFeFehhL(3,3,3),cplcFeFehhR(3,3,3),          & 
& cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFeVZRL(3,3),cplcFeFeVZRR(3,3),cplcFeFvcHpmL(3,6,3),& 
& cplcFeFvcHpmR(3,6,3),cplcFeFvcVWLmL(3,6),cplcFeFvcVWLmR(3,6),cplcFeFvcVWRmL(3,6),      & 
& cplcFeFvcVWRmR(3,6),cplFvFeHpmL(6,3,3),cplFvFeHpmR(6,3,3),cplFvFeVWLmL(6,3),           & 
& cplFvFeVWLmR(6,3),cplFvFeVWRmL(6,3),cplFvFeVWRmR(6,3),cplFvFvAhL(6,6,3),               & 
& cplFvFvAhR(6,6,3),cplFvFvhhL(6,6,3),cplFvFvhhR(6,6,3),cplFvFvVZL(6,6),cplFvFvVZR(6,6), & 
& cplFvFvVZRL(6,6),cplFvFvVZRR(6,6)

Real(dp),Intent(inout) :: IntegralSs(500000,10),IntegralVs(25000,9),IntegralVVss(500000,12)

Complex(dp),Intent(inout) :: IntegralSSss(500000,12),IntegralSSst(500000,16),IntegralVSss(500000,12),              & 
& IntegralVSst(500000,16),IntegralVVst(25000,12)

Real(dp),Intent(inout) :: gTVZ,gTVZR,gTVWLm,gTVWRm,gTHpm(3),gTAh(3),gThh(3)

Integer, Intent(inout) :: NSs,NSSss,NSSst,NVs,NVSss,NVSst,NVVss,NVVst
Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp) :: Boson2(2), mass(4),  Boson4(4) 
Complex(dp) :: coup(4), coup2(8),coupT 
mass(1) = MFe(iIN) 
 
Isum = 169 
Allocate( gSum(3,6,6, Isum) ) 
Allocate( Contribution(3,6,6, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1, iIN-1
      Do gt2=1,6
        Do gt3=gt2,6
Isum = 0 
 
If(Abs(MFe(iIN)).gt.(Abs(MFv(gt3))+Abs(MFv(gt2))+Abs(MFe(gt1)))) Then 
!-------------- 
!  VZ 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVZ 
Boson2(2) =gTVZ 
 
Boson4(1) = MVZ 
Boson4(2) =gTVZ 
Boson4(3) = MVZ 
Boson4(4) =gTVZ 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFe(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup(2) = Conjg(cplcFeFeVZL(iIN,gt1)) 
coup(1) = Conjg(cplcFeFeVZR(iIN,gt1)) 
coup(4) = Conjg(cplFvFvVZL(gt2,gt3)) 
coup(3) = Conjg(cplFvFvVZR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFe(gt1) 
mass(3) = -MFv(gt3) 
mass(4) = MFv(gt2) 
 
coup2(1) = cplcFeFeVZL(iIN,gt1) 
coup2(2) = cplcFeFeVZR(iIN,gt1) 
coup2(4) = Conjg(cplcFeFeVZL(iIN,gt1)) 
coup2(3) = Conjg(cplcFeFeVZR(iIN,gt1))  
coup2(5) = cplFvFvVZL(gt3,gt2) 
coup2(6) = cplFvFvVZR(gt3,gt2) 
coup2(8) = Conjg(cplFvFvVZL(gt2,gt3)) 
coup2(7) = Conjg(cplFvFvVZR(gt2,gt3)) 
Call IntegrateGaugeSS(Boson4, mass, coup2, deltaM, epsI,IntegralVVss,NVVss, resR, check) 
If (resR.ne.resR) resR = 0._dp
resC = -2._dp*resR 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe Fv Fv Propagator: VZ" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ'



!-------------- 
!  VZR 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVZR 
Boson2(2) =gTVZR 
 
Boson4(1) = MVZR 
Boson4(2) =gTVZR 
Boson4(3) = MVZR 
Boson4(4) =gTVZR 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFe(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup(2) = Conjg(cplcFeFeVZRL(iIN,gt1)) 
coup(1) = Conjg(cplcFeFeVZRR(iIN,gt1)) 
coup(4) = Conjg(cplFvFvVZRL(gt2,gt3)) 
coup(3) = Conjg(cplFvFvVZRR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFe(gt1) 
mass(3) = -MFv(gt3) 
mass(4) = MFv(gt2) 
 
coup2(1) = cplcFeFeVZRL(iIN,gt1) 
coup2(2) = cplcFeFeVZRR(iIN,gt1) 
coup2(4) = Conjg(cplcFeFeVZRL(iIN,gt1)) 
coup2(3) = Conjg(cplcFeFeVZRR(iIN,gt1))  
coup2(5) = cplFvFvVZRL(gt3,gt2) 
coup2(6) = cplFvFvVZRR(gt3,gt2) 
coup2(8) = Conjg(cplFvFvVZRL(gt2,gt3)) 
coup2(7) = Conjg(cplFvFvVZRR(gt2,gt3)) 
Call IntegrateGaugeSS(Boson4, mass, coup2, deltaM, epsI,IntegralVVss,NVVss, resR, check) 
If (resR.ne.resR) resR = 0._dp
resC = -2._dp*resR 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe Fv Fv Propagator: VZR" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZR'



!-------------- 
!  conj[VWLm] 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVWLm 
Boson2(2) =gTVWLm 
 
Boson4(1) = MVWLm 
Boson4(2) =gTVWLm 
Boson4(3) = MVWLm 
Boson4(4) =gTVWLm 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFv(gt2) 
mass(3) = -MFv(gt3) 
mass(4) = MFe(gt1) 
 
coup(2) = Conjg(cplcFeFvcVWLmL(iIN,gt2)) 
coup(1) = Conjg(cplcFeFvcVWLmR(iIN,gt2)) 
coup(4) = Conjg(cplFvFeVWLmL(gt3,gt1)) 
coup(3) = Conjg(cplFvFeVWLmR(gt3,gt1))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFv(gt3) 
mass(3) = -MFv(gt2) 
mass(4) = MFe(gt1) 
 
coup(2) = Conjg(cplcFeFvcVWLmL(iIN,gt3)) 
coup(1) = Conjg(cplcFeFvcVWLmR(iIN,gt3)) 
coup(4) = Conjg(cplFvFeVWLmL(gt2,gt1)) 
coup(3) = Conjg(cplFvFeVWLmR(gt2,gt1))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFv(gt2) 
mass(4) = MFv(gt3) 
mass(3) = -MFe(gt1) 
 
coup2(1) = cplcFeFvcVWLmL(iIN,gt3) 
coup2(2) = cplcFeFvcVWLmR(iIN,gt3) 
coup2(4) = Conjg(cplcFeFvcVWLmL(iIN,gt2)) 
coup2(3) = Conjg(cplcFeFvcVWLmR(iIN,gt2))  
coup2(5) = cplFvFeVWLmL(gt2,gt1) 
coup2(6) = cplFvFeVWLmR(gt2,gt1) 
coup2(8) = Conjg(cplFvFeVWLmL(gt3,gt1)) 
coup2(7) = Conjg(cplFvFeVWLmR(gt3,gt1)) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe Fv Fv Propagator: conj[VWLm]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[VWLm]'



!-------------- 
!  conj[VWRm] 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVWRm 
Boson2(2) =gTVWRm 
 
Boson4(1) = MVWRm 
Boson4(2) =gTVWRm 
Boson4(3) = MVWRm 
Boson4(4) =gTVWRm 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFv(gt2) 
mass(3) = -MFv(gt3) 
mass(4) = MFe(gt1) 
 
coup(2) = Conjg(cplcFeFvcVWRmL(iIN,gt2)) 
coup(1) = Conjg(cplcFeFvcVWRmR(iIN,gt2)) 
coup(4) = Conjg(cplFvFeVWRmL(gt3,gt1)) 
coup(3) = Conjg(cplFvFeVWRmR(gt3,gt1))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFv(gt3) 
mass(3) = -MFv(gt2) 
mass(4) = MFe(gt1) 
 
coup(2) = Conjg(cplcFeFvcVWRmL(iIN,gt3)) 
coup(1) = Conjg(cplcFeFvcVWRmR(iIN,gt3)) 
coup(4) = Conjg(cplFvFeVWRmL(gt2,gt1)) 
coup(3) = Conjg(cplFvFeVWRmR(gt2,gt1))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFv(gt2) 
mass(4) = MFv(gt3) 
mass(3) = -MFe(gt1) 
 
coup2(1) = cplcFeFvcVWRmL(iIN,gt3) 
coup2(2) = cplcFeFvcVWRmR(iIN,gt3) 
coup2(4) = Conjg(cplcFeFvcVWRmL(iIN,gt2)) 
coup2(3) = Conjg(cplcFeFvcVWRmR(iIN,gt2))  
coup2(5) = cplFvFeVWRmL(gt2,gt1) 
coup2(6) = cplFvFeVWRmR(gt2,gt1) 
coup2(8) = Conjg(cplFvFeVWRmL(gt3,gt1)) 
coup2(7) = Conjg(cplFvFeVWRmR(gt3,gt1)) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe Fv Fv Propagator: conj[VWRm]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[VWRm]'



!-------------- 
!  conj[Hpm] 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
Boson2(1) = MHpm(i1) 
Boson2(2) =gTHpm(i1) 
 
Boson4(1) = MHpm(i1) 
Boson4(2) =gTHpm(i1) 
Boson4(3) = MHpm(i1) 
Boson4(4) =gTHpm(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFv(gt2) 
mass(3) = -MFv(gt3) 
mass(4) = MFe(gt1) 
 
coup(2) = Conjg(cplcFeFvcHpmL(iIN,gt2,i1)) 
coup(1) = Conjg(cplcFeFvcHpmR(iIN,gt2,i1)) 
coup(4) = Conjg(cplFvFeHpmL(gt3,gt1,i1)) 
coup(3) = Conjg(cplFvFeHpmR(gt3,gt1,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFv(gt3) 
mass(3) = -MFv(gt2) 
mass(4) = MFe(gt1) 
 
coup(2) = Conjg(cplcFeFvcHpmL(iIN,gt3,i1)) 
coup(1) = Conjg(cplcFeFvcHpmR(iIN,gt3,i1)) 
coup(4) = Conjg(cplFvFeHpmL(gt2,gt1,i1)) 
coup(3) = Conjg(cplFvFeHpmR(gt2,gt1,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFv(gt2) 
mass(4) = MFv(gt3) 
mass(3) = -MFe(gt1) 
 
coup2(1) = cplcFeFvcHpmL(iIN,gt3,i1) 
coup2(2) = cplcFeFvcHpmR(iIN,gt3,i1) 
coup2(3) = Conjg(cplcFeFvcHpmL(iIN,gt2,i1)) 
coup2(4) = Conjg(cplcFeFvcHpmR(iIN,gt2,i1))  
coup2(5) = cplFvFeHpmL(gt2,gt1,i1) 
coup2(6) = cplFvFeHpmR(gt2,gt1,i1) 
coup2(7) = Conjg(cplFvFeHpmL(gt3,gt1,i1)) 
coup2(8) = Conjg(cplFvFeHpmR(gt3,gt1,i1)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe Fv Fv Propagator: conj[Hpm]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[Hpm]'
      End Do 



!-------------- 
!  Ah 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
Boson2(1) = MAh(i1) 
Boson2(2) =gTAh(i1) 
 
Boson4(1) = MAh(i1) 
Boson4(2) =gTAh(i1) 
Boson4(3) = MAh(i1) 
Boson4(4) =gTAh(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFe(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup(2) = Conjg(cplcFeFeAhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcFeFeAhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplFvFvAhL(gt2,gt3,i1)) 
coup(3) = Conjg(cplFvFvAhR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFe(gt1) 
mass(3) = -MFv(gt3) 
mass(4) = MFv(gt2) 
 
coup2(1) = cplcFeFeAhL(iIN,gt1,i1) 
coup2(2) = cplcFeFeAhR(iIN,gt1,i1) 
coup2(3) = Conjg(cplcFeFeAhL(iIN,gt1,i1)) 
coup2(4) = Conjg(cplcFeFeAhR(iIN,gt1,i1))  
coup2(5) = cplFvFvAhL(gt3,gt2,i1) 
coup2(6) = cplFvFvAhR(gt3,gt2,i1) 
coup2(7) = Conjg(cplFvFvAhL(gt2,gt3,i1)) 
coup2(8) = Conjg(cplFvFvAhR(gt2,gt3,i1)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe Fv Fv Propagator: Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah'
      End Do 



!-------------- 
!  hh 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
Boson2(1) = Mhh(i1) 
Boson2(2) =gThh(i1) 
 
Boson4(1) = Mhh(i1) 
Boson4(2) =gThh(i1) 
Boson4(3) = Mhh(i1) 
Boson4(4) =gThh(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFe(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup(2) = Conjg(cplcFeFehhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcFeFehhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplFvFvhhL(gt2,gt3,i1)) 
coup(3) = Conjg(cplFvFvhhR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFe(gt1) 
mass(3) = -MFv(gt3) 
mass(4) = MFv(gt2) 
 
coup2(1) = cplcFeFehhL(iIN,gt1,i1) 
coup2(2) = cplcFeFehhR(iIN,gt1,i1) 
coup2(3) = Conjg(cplcFeFehhL(iIN,gt1,i1)) 
coup2(4) = Conjg(cplcFeFehhR(iIN,gt1,i1))  
coup2(5) = cplFvFvhhL(gt3,gt2,i1) 
coup2(6) = cplFvFvhhR(gt3,gt2,i1) 
coup2(7) = Conjg(cplFvFvhhL(gt2,gt3,i1)) 
coup2(8) = Conjg(cplFvFvhhR(gt2,gt3,i1)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe Fv Fv Propagator: hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='hh'
      End Do 



!-------------- 
!  VZ, VZR 
!-------------- 
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MVZR 
Boson4(4) = gTVZR 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup2(1) = cplcFeFeVZL(iIN,gt1) 
coup2(2) = cplcFeFeVZR(iIN,gt1) 
coup2(4) = Conjg(cplcFeFeVZRL(iIN,gt1)) 
coup2(3) = Conjg(cplcFeFeVZRR(iIN,gt1))  
coup2(5) = cplFvFvVZL(gt2,gt3) 
coup2(6) = cplFvFvVZR(gt2,gt3) 
coup2(8) = Conjg(cplFvFvVZRL(gt2,gt3)) 
coup2(7) = Conjg(cplFvFvVZRR(gt2,gt3)) 
Call IntegrateGaugeSS(Boson4, mass, coup2, deltaM, epsI,IntegralVVss,NVVss, resR, check) 
If (resR.ne.resR) resR = 0._dp
resC = 2._dp*resR 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe Fv Fv Propagator: VZ,VZR" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,VZR'



!-------------- 
!  VZ, conj[VWLm] 
!-------------- 
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MVWLm 
Boson4(4) = gTVWLm 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFv(gt2) 
mass(4) = MFe(gt1) 
mass(3) = -MFv(gt3) 
 
coup2(1) = cplcFeFeVZL(iIN,gt1) 
coup2(2) = cplcFeFeVZR(iIN,gt1) 
coup2(4) = Conjg(cplcFeFvcVWLmL(iIN,gt2)) 
coup2(3) = Conjg(cplcFeFvcVWLmR(iIN,gt2))  
coup2(5) = cplFvFvVZL(gt2,gt3) 
coup2(6) = cplFvFvVZR(gt2,gt3) 
coup2(8) = Conjg(cplFvFeVWLmL(gt3,gt1)) 
coup2(7) = Conjg(cplFvFeVWLmR(gt3,gt1)) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt3) 
mass(4) = MFe(gt1) 
mass(3) = -MFv(gt2) 
 
coup2(1) = cplcFeFeVZL(iIN,gt1) 
coup2(2) = cplcFeFeVZR(iIN,gt1) 
coup2(4) = Conjg(cplcFeFvcVWLmL(iIN,gt3)) 
coup2(3) = Conjg(cplcFeFvcVWLmR(iIN,gt3))  
coup2(5) = cplFvFvVZL(gt2,gt3) 
coup2(6) = cplFvFvVZR(gt2,gt3) 
coup2(8) = Conjg(cplFvFeVWLmL(gt2,gt1)) 
coup2(7) = Conjg(cplFvFeVWLmR(gt2,gt1)) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe Fv Fv Propagator: VZ,conj[VWLm]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,conj[VWLm]'



!-------------- 
!  VZ, conj[VWRm] 
!-------------- 
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MVWRm 
Boson4(4) = gTVWRm 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFv(gt2) 
mass(4) = MFe(gt1) 
mass(3) = -MFv(gt3) 
 
coup2(1) = cplcFeFeVZL(iIN,gt1) 
coup2(2) = cplcFeFeVZR(iIN,gt1) 
coup2(4) = Conjg(cplcFeFvcVWRmL(iIN,gt2)) 
coup2(3) = Conjg(cplcFeFvcVWRmR(iIN,gt2))  
coup2(5) = cplFvFvVZL(gt2,gt3) 
coup2(6) = cplFvFvVZR(gt2,gt3) 
coup2(8) = Conjg(cplFvFeVWRmL(gt3,gt1)) 
coup2(7) = Conjg(cplFvFeVWRmR(gt3,gt1)) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt3) 
mass(4) = MFe(gt1) 
mass(3) = -MFv(gt2) 
 
coup2(1) = cplcFeFeVZL(iIN,gt1) 
coup2(2) = cplcFeFeVZR(iIN,gt1) 
coup2(4) = Conjg(cplcFeFvcVWRmL(iIN,gt3)) 
coup2(3) = Conjg(cplcFeFvcVWRmR(iIN,gt3))  
coup2(5) = cplFvFvVZL(gt2,gt3) 
coup2(6) = cplFvFvVZR(gt2,gt3) 
coup2(8) = Conjg(cplFvFeVWRmL(gt2,gt1)) 
coup2(7) = Conjg(cplFvFeVWRmR(gt2,gt1)) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe Fv Fv Propagator: VZ,conj[VWRm]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,conj[VWRm]'



!-------------- 
!  VZ, conj[Hpm] 
!-------------- 
  Do i2=1,3
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MHpm(i2) 
Boson4(4) = gTHpm(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFv(gt2) 
mass(4) = MFe(gt1) 
mass(3) = -MFv(gt3) 
 
coup2(1) = cplcFeFeVZL(iIN,gt1) 
coup2(2) = cplcFeFeVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFeFvcHpmL(iIN,gt2,i2)) 
coup2(4) = Conjg(cplcFeFvcHpmR(iIN,gt2,i2))  
coup2(5) = cplFvFvVZL(gt2,gt3) 
coup2(6) = cplFvFvVZR(gt2,gt3) 
coup2(7) = Conjg(cplFvFeHpmL(gt3,gt1,i2)) 
coup2(8) = Conjg(cplFvFeHpmR(gt3,gt1,i2)) 
coupT = coup2(2) 
coup2(2) = coup2(1) 
coup2(1) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt3) 
mass(4) = MFe(gt1) 
mass(3) = -MFv(gt2) 
 
coup2(1) = cplcFeFeVZL(iIN,gt1) 
coup2(2) = cplcFeFeVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFeFvcHpmL(iIN,gt3,i2)) 
coup2(4) = Conjg(cplcFeFvcHpmR(iIN,gt3,i2))  
coup2(5) = cplFvFvVZL(gt2,gt3) 
coup2(6) = cplFvFvVZR(gt2,gt3) 
coup2(7) = Conjg(cplFvFeHpmL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplFvFeHpmR(gt2,gt1,i2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe Fv Fv Propagator: VZ,conj[Hpm]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,conj[Hpm]'
      End Do 



!-------------- 
!  VZ, Ah 
!-------------- 
  Do i2=1,3
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MAh(i2) 
Boson4(4) = gTAh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup2(1) = cplcFeFeVZL(iIN,gt1) 
coup2(2) = cplcFeFeVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFeFeAhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFeFeAhR(iIN,gt1,i2))  
coup2(5) = cplFvFvVZL(gt2,gt3) 
coup2(6) = cplFvFvVZR(gt2,gt3) 
coup2(7) = Conjg(cplFvFvAhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplFvFvAhR(gt2,gt3,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe Fv Fv Propagator: VZ,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,Ah'
      End Do 



!-------------- 
!  VZ, hh 
!-------------- 
  Do i2=1,3
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup2(1) = cplcFeFeVZL(iIN,gt1) 
coup2(2) = cplcFeFeVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFeFehhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFeFehhR(iIN,gt1,i2))  
coup2(5) = cplFvFvVZL(gt2,gt3) 
coup2(6) = cplFvFvVZR(gt2,gt3) 
coup2(7) = Conjg(cplFvFvhhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplFvFvhhR(gt2,gt3,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe Fv Fv Propagator: VZ,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,hh'
      End Do 



!-------------- 
!  VZR, conj[VWLm] 
!-------------- 
Boson4(1) = MVZR 
Boson4(2) = gTVZR 
Boson4(3) = MVWLm 
Boson4(4) = gTVWLm 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFv(gt2) 
mass(4) = MFe(gt1) 
mass(3) = -MFv(gt3) 
 
coup2(1) = cplcFeFeVZRL(iIN,gt1) 
coup2(2) = cplcFeFeVZRR(iIN,gt1) 
coup2(4) = Conjg(cplcFeFvcVWLmL(iIN,gt2)) 
coup2(3) = Conjg(cplcFeFvcVWLmR(iIN,gt2))  
coup2(5) = cplFvFvVZRL(gt2,gt3) 
coup2(6) = cplFvFvVZRR(gt2,gt3) 
coup2(8) = Conjg(cplFvFeVWLmL(gt3,gt1)) 
coup2(7) = Conjg(cplFvFeVWLmR(gt3,gt1)) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt3) 
mass(4) = MFe(gt1) 
mass(3) = -MFv(gt2) 
 
coup2(1) = cplcFeFeVZRL(iIN,gt1) 
coup2(2) = cplcFeFeVZRR(iIN,gt1) 
coup2(4) = Conjg(cplcFeFvcVWLmL(iIN,gt3)) 
coup2(3) = Conjg(cplcFeFvcVWLmR(iIN,gt3))  
coup2(5) = cplFvFvVZRL(gt2,gt3) 
coup2(6) = cplFvFvVZRR(gt2,gt3) 
coup2(8) = Conjg(cplFvFeVWLmL(gt2,gt1)) 
coup2(7) = Conjg(cplFvFeVWLmR(gt2,gt1)) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe Fv Fv Propagator: VZR,conj[VWLm]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZR,conj[VWLm]'



!-------------- 
!  VZR, conj[VWRm] 
!-------------- 
Boson4(1) = MVZR 
Boson4(2) = gTVZR 
Boson4(3) = MVWRm 
Boson4(4) = gTVWRm 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFv(gt2) 
mass(4) = MFe(gt1) 
mass(3) = -MFv(gt3) 
 
coup2(1) = cplcFeFeVZRL(iIN,gt1) 
coup2(2) = cplcFeFeVZRR(iIN,gt1) 
coup2(4) = Conjg(cplcFeFvcVWRmL(iIN,gt2)) 
coup2(3) = Conjg(cplcFeFvcVWRmR(iIN,gt2))  
coup2(5) = cplFvFvVZRL(gt2,gt3) 
coup2(6) = cplFvFvVZRR(gt2,gt3) 
coup2(8) = Conjg(cplFvFeVWRmL(gt3,gt1)) 
coup2(7) = Conjg(cplFvFeVWRmR(gt3,gt1)) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt3) 
mass(4) = MFe(gt1) 
mass(3) = -MFv(gt2) 
 
coup2(1) = cplcFeFeVZRL(iIN,gt1) 
coup2(2) = cplcFeFeVZRR(iIN,gt1) 
coup2(4) = Conjg(cplcFeFvcVWRmL(iIN,gt3)) 
coup2(3) = Conjg(cplcFeFvcVWRmR(iIN,gt3))  
coup2(5) = cplFvFvVZRL(gt2,gt3) 
coup2(6) = cplFvFvVZRR(gt2,gt3) 
coup2(8) = Conjg(cplFvFeVWRmL(gt2,gt1)) 
coup2(7) = Conjg(cplFvFeVWRmR(gt2,gt1)) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe Fv Fv Propagator: VZR,conj[VWRm]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZR,conj[VWRm]'



!-------------- 
!  VZR, conj[Hpm] 
!-------------- 
  Do i2=1,3
Boson4(1) = MVZR 
Boson4(2) = gTVZR 
Boson4(3) = MHpm(i2) 
Boson4(4) = gTHpm(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFv(gt2) 
mass(4) = MFe(gt1) 
mass(3) = -MFv(gt3) 
 
coup2(1) = cplcFeFeVZRL(iIN,gt1) 
coup2(2) = cplcFeFeVZRR(iIN,gt1) 
coup2(3) = Conjg(cplcFeFvcHpmL(iIN,gt2,i2)) 
coup2(4) = Conjg(cplcFeFvcHpmR(iIN,gt2,i2))  
coup2(5) = cplFvFvVZRL(gt2,gt3) 
coup2(6) = cplFvFvVZRR(gt2,gt3) 
coup2(7) = Conjg(cplFvFeHpmL(gt3,gt1,i2)) 
coup2(8) = Conjg(cplFvFeHpmR(gt3,gt1,i2)) 
coupT = coup2(2) 
coup2(2) = coup2(1) 
coup2(1) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt3) 
mass(4) = MFe(gt1) 
mass(3) = -MFv(gt2) 
 
coup2(1) = cplcFeFeVZRL(iIN,gt1) 
coup2(2) = cplcFeFeVZRR(iIN,gt1) 
coup2(3) = Conjg(cplcFeFvcHpmL(iIN,gt3,i2)) 
coup2(4) = Conjg(cplcFeFvcHpmR(iIN,gt3,i2))  
coup2(5) = cplFvFvVZRL(gt2,gt3) 
coup2(6) = cplFvFvVZRR(gt2,gt3) 
coup2(7) = Conjg(cplFvFeHpmL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplFvFeHpmR(gt2,gt1,i2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe Fv Fv Propagator: VZR,conj[Hpm]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZR,conj[Hpm]'
      End Do 



!-------------- 
!  VZR, Ah 
!-------------- 
  Do i2=1,3
Boson4(1) = MVZR 
Boson4(2) = gTVZR 
Boson4(3) = MAh(i2) 
Boson4(4) = gTAh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup2(1) = cplcFeFeVZRL(iIN,gt1) 
coup2(2) = cplcFeFeVZRR(iIN,gt1) 
coup2(3) = Conjg(cplcFeFeAhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFeFeAhR(iIN,gt1,i2))  
coup2(5) = cplFvFvVZRL(gt2,gt3) 
coup2(6) = cplFvFvVZRR(gt2,gt3) 
coup2(7) = Conjg(cplFvFvAhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplFvFvAhR(gt2,gt3,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe Fv Fv Propagator: VZR,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZR,Ah'
      End Do 



!-------------- 
!  VZR, hh 
!-------------- 
  Do i2=1,3
Boson4(1) = MVZR 
Boson4(2) = gTVZR 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup2(1) = cplcFeFeVZRL(iIN,gt1) 
coup2(2) = cplcFeFeVZRR(iIN,gt1) 
coup2(3) = Conjg(cplcFeFehhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFeFehhR(iIN,gt1,i2))  
coup2(5) = cplFvFvVZRL(gt2,gt3) 
coup2(6) = cplFvFvVZRR(gt2,gt3) 
coup2(7) = Conjg(cplFvFvhhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplFvFvhhR(gt2,gt3,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe Fv Fv Propagator: VZR,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZR,hh'
      End Do 



!-------------- 
!  conj[VWLm], conj[VWRm] 
!-------------- 
Boson4(1) = MVWLm 
Boson4(2) = gTVWLm 
Boson4(3) = MVWRm 
Boson4(4) = gTVWRm 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFv(gt2) 
mass(3) = -MFv(gt3) 
mass(4) = MFe(gt1) 
 
coup2(1) = cplcFeFvcVWLmL(iIN,gt2) 
coup2(2) = cplcFeFvcVWLmR(iIN,gt2) 
coup2(4) = Conjg(cplcFeFvcVWRmL(iIN,gt2)) 
coup2(3) = Conjg(cplcFeFvcVWRmR(iIN,gt2))  
coup2(5) = cplFvFeVWLmL(gt3,gt1) 
coup2(6) = cplFvFeVWLmR(gt3,gt1) 
coup2(8) = Conjg(cplFvFeVWRmL(gt3,gt1)) 
coup2(7) = Conjg(cplFvFeVWRmR(gt3,gt1)) 
Call IntegrateGaugeSS(Boson4, mass, coup2, deltaM, epsI,IntegralVVss,NVVss, resR, check) 
If (resR.ne.resR) resR = 0._dp
resC = 2._dp*resR 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt2) 
mass(4) = MFv(gt3) 
mass(3) = -MFe(gt1) 
 
coup2(1) = cplcFeFvcVWLmL(iIN,gt3) 
coup2(2) = cplcFeFvcVWLmR(iIN,gt3) 
coup2(4) = Conjg(cplcFeFvcVWRmL(iIN,gt2)) 
coup2(3) = Conjg(cplcFeFvcVWRmR(iIN,gt2))  
coup2(5) = cplFvFeVWLmL(gt2,gt1) 
coup2(6) = cplFvFeVWLmR(gt2,gt1) 
coup2(8) = Conjg(cplFvFeVWRmL(gt3,gt1)) 
coup2(7) = Conjg(cplFvFeVWRmR(gt3,gt1)) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt3) 
mass(3) = -MFv(gt2) 
mass(4) = MFe(gt1) 
 
coup2(1) = cplcFeFvcVWLmL(iIN,gt3) 
coup2(2) = cplcFeFvcVWLmR(iIN,gt3) 
coup2(4) = Conjg(cplcFeFvcVWRmL(iIN,gt3)) 
coup2(3) = Conjg(cplcFeFvcVWRmR(iIN,gt3))  
coup2(5) = cplFvFeVWLmL(gt2,gt1) 
coup2(6) = cplFvFeVWLmR(gt2,gt1) 
coup2(8) = Conjg(cplFvFeVWRmL(gt2,gt1)) 
coup2(7) = Conjg(cplFvFeVWRmR(gt2,gt1)) 
Call IntegrateGaugeSS(Boson4, mass, coup2, deltaM, epsI,IntegralVVss,NVVss, resR, check) 
If (resR.ne.resR) resR = 0._dp
resC = 2._dp*resR 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt3) 
mass(4) = MFv(gt2) 
mass(3) = -MFe(gt1) 
 
coup2(1) = cplcFeFvcVWLmL(iIN,gt2) 
coup2(2) = cplcFeFvcVWLmR(iIN,gt2) 
coup2(4) = Conjg(cplcFeFvcVWRmL(iIN,gt3)) 
coup2(3) = Conjg(cplcFeFvcVWRmR(iIN,gt3))  
coup2(5) = cplFvFeVWLmL(gt3,gt1) 
coup2(6) = cplFvFeVWLmR(gt3,gt1) 
coup2(8) = Conjg(cplFvFeVWRmL(gt2,gt1)) 
coup2(7) = Conjg(cplFvFeVWRmR(gt2,gt1)) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe Fv Fv Propagator: conj[VWLm],conj[VWRm]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[VWLm],conj[VWRm]'



!-------------- 
!  conj[VWLm], conj[Hpm] 
!-------------- 
  Do i2=1,3
Boson4(1) = MVWLm 
Boson4(2) = gTVWLm 
Boson4(3) = MHpm(i2) 
Boson4(4) = gTHpm(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFv(gt2) 
mass(3) = -MFv(gt3) 
mass(4) = MFe(gt1) 
 
coup2(1) = cplcFeFvcVWLmL(iIN,gt2) 
coup2(2) = cplcFeFvcVWLmR(iIN,gt2) 
coup2(3) = Conjg(cplcFeFvcHpmL(iIN,gt2,i2)) 
coup2(4) = Conjg(cplcFeFvcHpmR(iIN,gt2,i2))  
coup2(5) = cplFvFeVWLmL(gt3,gt1) 
coup2(6) = cplFvFeVWLmR(gt3,gt1) 
coup2(7) = Conjg(cplFvFeHpmL(gt3,gt1,i2)) 
coup2(8) = Conjg(cplFvFeHpmR(gt3,gt1,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt2) 
mass(4) = MFv(gt3) 
mass(3) = -MFe(gt1) 
 
coup2(1) = cplcFeFvcVWLmL(iIN,gt3) 
coup2(2) = cplcFeFvcVWLmR(iIN,gt3) 
coup2(3) = Conjg(cplcFeFvcHpmL(iIN,gt2,i2)) 
coup2(4) = Conjg(cplcFeFvcHpmR(iIN,gt2,i2))  
coup2(5) = cplFvFeVWLmL(gt2,gt1) 
coup2(6) = cplFvFeVWLmR(gt2,gt1) 
coup2(7) = Conjg(cplFvFeHpmL(gt3,gt1,i2)) 
coup2(8) = Conjg(cplFvFeHpmR(gt3,gt1,i2)) 
coupT = coup2(2) 
coup2(2) = coup2(1) 
coup2(1) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt3) 
mass(3) = -MFv(gt2) 
mass(4) = MFe(gt1) 
 
coup2(1) = cplcFeFvcVWLmL(iIN,gt3) 
coup2(2) = cplcFeFvcVWLmR(iIN,gt3) 
coup2(3) = Conjg(cplcFeFvcHpmL(iIN,gt3,i2)) 
coup2(4) = Conjg(cplcFeFvcHpmR(iIN,gt3,i2))  
coup2(5) = cplFvFeVWLmL(gt2,gt1) 
coup2(6) = cplFvFeVWLmR(gt2,gt1) 
coup2(7) = Conjg(cplFvFeHpmL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplFvFeHpmR(gt2,gt1,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt3) 
mass(4) = MFv(gt2) 
mass(3) = -MFe(gt1) 
 
coup2(1) = cplcFeFvcVWLmL(iIN,gt2) 
coup2(2) = cplcFeFvcVWLmR(iIN,gt2) 
coup2(3) = Conjg(cplcFeFvcHpmL(iIN,gt3,i2)) 
coup2(4) = Conjg(cplcFeFvcHpmR(iIN,gt3,i2))  
coup2(5) = cplFvFeVWLmL(gt3,gt1) 
coup2(6) = cplFvFeVWLmR(gt3,gt1) 
coup2(7) = Conjg(cplFvFeHpmL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplFvFeHpmR(gt2,gt1,i2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe Fv Fv Propagator: conj[VWLm],conj[Hpm]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[VWLm],conj[Hpm]'
      End Do 



!-------------- 
!  conj[VWLm], Ah 
!-------------- 
  Do i2=1,3
Boson4(1) = MVWLm 
Boson4(2) = gTVWLm 
Boson4(3) = MAh(i2) 
Boson4(4) = gTAh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt1) 
mass(4) = MFv(gt2) 
mass(3) = -MFv(gt3) 
 
coup2(1) = cplcFeFvcVWLmL(iIN,gt2) 
coup2(2) = cplcFeFvcVWLmR(iIN,gt2) 
coup2(3) = Conjg(cplcFeFeAhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFeFeAhR(iIN,gt1,i2))  
coup2(5) = cplFvFeVWLmL(gt3,gt1) 
coup2(6) = cplFvFeVWLmR(gt3,gt1) 
coup2(7) = Conjg(cplFvFvAhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplFvFvAhR(gt2,gt3,i2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFe(gt1) 
mass(4) = MFv(gt3) 
mass(3) = -MFv(gt2) 
 
coup2(1) = cplcFeFvcVWLmL(iIN,gt3) 
coup2(2) = cplcFeFvcVWLmR(iIN,gt3) 
coup2(3) = Conjg(cplcFeFeAhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFeFeAhR(iIN,gt1,i2))  
coup2(5) = cplFvFeVWLmL(gt2,gt1) 
coup2(6) = cplFvFeVWLmR(gt2,gt1) 
coup2(7) = Conjg(cplFvFvAhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplFvFvAhR(gt2,gt3,i2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe Fv Fv Propagator: conj[VWLm],Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[VWLm],Ah'
      End Do 



!-------------- 
!  conj[VWLm], hh 
!-------------- 
  Do i2=1,3
Boson4(1) = MVWLm 
Boson4(2) = gTVWLm 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt1) 
mass(4) = MFv(gt2) 
mass(3) = -MFv(gt3) 
 
coup2(1) = cplcFeFvcVWLmL(iIN,gt2) 
coup2(2) = cplcFeFvcVWLmR(iIN,gt2) 
coup2(3) = Conjg(cplcFeFehhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFeFehhR(iIN,gt1,i2))  
coup2(5) = cplFvFeVWLmL(gt3,gt1) 
coup2(6) = cplFvFeVWLmR(gt3,gt1) 
coup2(7) = Conjg(cplFvFvhhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplFvFvhhR(gt2,gt3,i2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFe(gt1) 
mass(4) = MFv(gt3) 
mass(3) = -MFv(gt2) 
 
coup2(1) = cplcFeFvcVWLmL(iIN,gt3) 
coup2(2) = cplcFeFvcVWLmR(iIN,gt3) 
coup2(3) = Conjg(cplcFeFehhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFeFehhR(iIN,gt1,i2))  
coup2(5) = cplFvFeVWLmL(gt2,gt1) 
coup2(6) = cplFvFeVWLmR(gt2,gt1) 
coup2(7) = Conjg(cplFvFvhhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplFvFvhhR(gt2,gt3,i2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe Fv Fv Propagator: conj[VWLm],hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[VWLm],hh'
      End Do 



!-------------- 
!  conj[VWRm], conj[Hpm] 
!-------------- 
  Do i2=1,3
Boson4(1) = MVWRm 
Boson4(2) = gTVWRm 
Boson4(3) = MHpm(i2) 
Boson4(4) = gTHpm(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFv(gt2) 
mass(3) = -MFv(gt3) 
mass(4) = MFe(gt1) 
 
coup2(1) = cplcFeFvcVWRmL(iIN,gt2) 
coup2(2) = cplcFeFvcVWRmR(iIN,gt2) 
coup2(3) = Conjg(cplcFeFvcHpmL(iIN,gt2,i2)) 
coup2(4) = Conjg(cplcFeFvcHpmR(iIN,gt2,i2))  
coup2(5) = cplFvFeVWRmL(gt3,gt1) 
coup2(6) = cplFvFeVWRmR(gt3,gt1) 
coup2(7) = Conjg(cplFvFeHpmL(gt3,gt1,i2)) 
coup2(8) = Conjg(cplFvFeHpmR(gt3,gt1,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt2) 
mass(4) = MFv(gt3) 
mass(3) = -MFe(gt1) 
 
coup2(1) = cplcFeFvcVWRmL(iIN,gt3) 
coup2(2) = cplcFeFvcVWRmR(iIN,gt3) 
coup2(3) = Conjg(cplcFeFvcHpmL(iIN,gt2,i2)) 
coup2(4) = Conjg(cplcFeFvcHpmR(iIN,gt2,i2))  
coup2(5) = cplFvFeVWRmL(gt2,gt1) 
coup2(6) = cplFvFeVWRmR(gt2,gt1) 
coup2(7) = Conjg(cplFvFeHpmL(gt3,gt1,i2)) 
coup2(8) = Conjg(cplFvFeHpmR(gt3,gt1,i2)) 
coupT = coup2(2) 
coup2(2) = coup2(1) 
coup2(1) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt3) 
mass(3) = -MFv(gt2) 
mass(4) = MFe(gt1) 
 
coup2(1) = cplcFeFvcVWRmL(iIN,gt3) 
coup2(2) = cplcFeFvcVWRmR(iIN,gt3) 
coup2(3) = Conjg(cplcFeFvcHpmL(iIN,gt3,i2)) 
coup2(4) = Conjg(cplcFeFvcHpmR(iIN,gt3,i2))  
coup2(5) = cplFvFeVWRmL(gt2,gt1) 
coup2(6) = cplFvFeVWRmR(gt2,gt1) 
coup2(7) = Conjg(cplFvFeHpmL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplFvFeHpmR(gt2,gt1,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt3) 
mass(4) = MFv(gt2) 
mass(3) = -MFe(gt1) 
 
coup2(1) = cplcFeFvcVWRmL(iIN,gt2) 
coup2(2) = cplcFeFvcVWRmR(iIN,gt2) 
coup2(3) = Conjg(cplcFeFvcHpmL(iIN,gt3,i2)) 
coup2(4) = Conjg(cplcFeFvcHpmR(iIN,gt3,i2))  
coup2(5) = cplFvFeVWRmL(gt3,gt1) 
coup2(6) = cplFvFeVWRmR(gt3,gt1) 
coup2(7) = Conjg(cplFvFeHpmL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplFvFeHpmR(gt2,gt1,i2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe Fv Fv Propagator: conj[VWRm],conj[Hpm]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[VWRm],conj[Hpm]'
      End Do 



!-------------- 
!  conj[VWRm], Ah 
!-------------- 
  Do i2=1,3
Boson4(1) = MVWRm 
Boson4(2) = gTVWRm 
Boson4(3) = MAh(i2) 
Boson4(4) = gTAh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt1) 
mass(4) = MFv(gt2) 
mass(3) = -MFv(gt3) 
 
coup2(1) = cplcFeFvcVWRmL(iIN,gt2) 
coup2(2) = cplcFeFvcVWRmR(iIN,gt2) 
coup2(3) = Conjg(cplcFeFeAhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFeFeAhR(iIN,gt1,i2))  
coup2(5) = cplFvFeVWRmL(gt3,gt1) 
coup2(6) = cplFvFeVWRmR(gt3,gt1) 
coup2(7) = Conjg(cplFvFvAhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplFvFvAhR(gt2,gt3,i2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFe(gt1) 
mass(4) = MFv(gt3) 
mass(3) = -MFv(gt2) 
 
coup2(1) = cplcFeFvcVWRmL(iIN,gt3) 
coup2(2) = cplcFeFvcVWRmR(iIN,gt3) 
coup2(3) = Conjg(cplcFeFeAhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFeFeAhR(iIN,gt1,i2))  
coup2(5) = cplFvFeVWRmL(gt2,gt1) 
coup2(6) = cplFvFeVWRmR(gt2,gt1) 
coup2(7) = Conjg(cplFvFvAhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplFvFvAhR(gt2,gt3,i2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe Fv Fv Propagator: conj[VWRm],Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[VWRm],Ah'
      End Do 



!-------------- 
!  conj[VWRm], hh 
!-------------- 
  Do i2=1,3
Boson4(1) = MVWRm 
Boson4(2) = gTVWRm 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt1) 
mass(4) = MFv(gt2) 
mass(3) = -MFv(gt3) 
 
coup2(1) = cplcFeFvcVWRmL(iIN,gt2) 
coup2(2) = cplcFeFvcVWRmR(iIN,gt2) 
coup2(3) = Conjg(cplcFeFehhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFeFehhR(iIN,gt1,i2))  
coup2(5) = cplFvFeVWRmL(gt3,gt1) 
coup2(6) = cplFvFeVWRmR(gt3,gt1) 
coup2(7) = Conjg(cplFvFvhhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplFvFvhhR(gt2,gt3,i2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFe(gt1) 
mass(4) = MFv(gt3) 
mass(3) = -MFv(gt2) 
 
coup2(1) = cplcFeFvcVWRmL(iIN,gt3) 
coup2(2) = cplcFeFvcVWRmR(iIN,gt3) 
coup2(3) = Conjg(cplcFeFehhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFeFehhR(iIN,gt1,i2))  
coup2(5) = cplFvFeVWRmL(gt2,gt1) 
coup2(6) = cplFvFeVWRmR(gt2,gt1) 
coup2(7) = Conjg(cplFvFvhhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplFvFvhhR(gt2,gt3,i2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe Fv Fv Propagator: conj[VWRm],hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[VWRm],hh'
      End Do 



!-------------- 
!  conj[Hpm], conj[Hpm] 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Boson4(1) = MHpm(i1) 
Boson4(2) = gTHpm(i1) 
Boson4(3) = MHpm(i2) 
Boson4(4) = gTHpm(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFv(gt2) 
mass(3) = -MFv(gt3) 
mass(4) = MFe(gt1) 
 
coup2(1) = cplcFeFvcHpmL(iIN,gt2,i1) 
coup2(2) = cplcFeFvcHpmR(iIN,gt2,i1) 
coup2(3) = Conjg(cplcFeFvcHpmL(iIN,gt2,i2)) 
coup2(4) = Conjg(cplcFeFvcHpmR(iIN,gt2,i2))  
coup2(5) = cplFvFeHpmL(gt3,gt1,i1) 
coup2(6) = cplFvFeHpmR(gt3,gt1,i1) 
coup2(7) = Conjg(cplFvFeHpmL(gt3,gt1,i2)) 
coup2(8) = Conjg(cplFvFeHpmR(gt3,gt1,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt2) 
mass(4) = MFv(gt3) 
mass(3) = -MFe(gt1) 
 
coup2(1) = cplcFeFvcHpmL(iIN,gt3,i1) 
coup2(2) = cplcFeFvcHpmR(iIN,gt3,i1) 
coup2(3) = Conjg(cplcFeFvcHpmL(iIN,gt2,i2)) 
coup2(4) = Conjg(cplcFeFvcHpmR(iIN,gt2,i2))  
coup2(5) = cplFvFeHpmL(gt2,gt1,i1) 
coup2(6) = cplFvFeHpmR(gt2,gt1,i1) 
coup2(7) = Conjg(cplFvFeHpmL(gt3,gt1,i2)) 
coup2(8) = Conjg(cplFvFeHpmR(gt3,gt1,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt3) 
mass(3) = -MFv(gt2) 
mass(4) = MFe(gt1) 
 
coup2(1) = cplcFeFvcHpmL(iIN,gt3,i1) 
coup2(2) = cplcFeFvcHpmR(iIN,gt3,i1) 
coup2(3) = Conjg(cplcFeFvcHpmL(iIN,gt3,i2)) 
coup2(4) = Conjg(cplcFeFvcHpmR(iIN,gt3,i2))  
coup2(5) = cplFvFeHpmL(gt2,gt1,i1) 
coup2(6) = cplFvFeHpmR(gt2,gt1,i1) 
coup2(7) = Conjg(cplFvFeHpmL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplFvFeHpmR(gt2,gt1,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt3) 
mass(4) = MFv(gt2) 
mass(3) = -MFe(gt1) 
 
coup2(1) = cplcFeFvcHpmL(iIN,gt2,i1) 
coup2(2) = cplcFeFvcHpmR(iIN,gt2,i1) 
coup2(3) = Conjg(cplcFeFvcHpmL(iIN,gt3,i2)) 
coup2(4) = Conjg(cplcFeFvcHpmR(iIN,gt3,i2))  
coup2(5) = cplFvFeHpmL(gt3,gt1,i1) 
coup2(6) = cplFvFeHpmR(gt3,gt1,i1) 
coup2(7) = Conjg(cplFvFeHpmL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplFvFeHpmR(gt2,gt1,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe Fv Fv Propagator: conj[Hpm],conj[Hpm]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[Hpm],conj[Hpm]'
        End Do 
      End Do 



!-------------- 
!  conj[Hpm], Ah 
!-------------- 
Do i1=1,3
  Do i2=1,3
Boson4(1) = MHpm(i1) 
Boson4(2) = gTHpm(i1) 
Boson4(3) = MAh(i2) 
Boson4(4) = gTAh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt1) 
mass(4) = MFv(gt2) 
mass(3) = -MFv(gt3) 
 
coup2(1) = cplcFeFvcHpmL(iIN,gt2,i1) 
coup2(2) = cplcFeFvcHpmR(iIN,gt2,i1) 
coup2(3) = Conjg(cplcFeFeAhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFeFeAhR(iIN,gt1,i2))  
coup2(5) = cplFvFeHpmL(gt3,gt1,i1) 
coup2(6) = cplFvFeHpmR(gt3,gt1,i1) 
coup2(7) = Conjg(cplFvFvAhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplFvFvAhR(gt2,gt3,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFe(gt1) 
mass(4) = MFv(gt3) 
mass(3) = -MFv(gt2) 
 
coup2(1) = cplcFeFvcHpmL(iIN,gt3,i1) 
coup2(2) = cplcFeFvcHpmR(iIN,gt3,i1) 
coup2(3) = Conjg(cplcFeFeAhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFeFeAhR(iIN,gt1,i2))  
coup2(5) = cplFvFeHpmL(gt2,gt1,i1) 
coup2(6) = cplFvFeHpmR(gt2,gt1,i1) 
coup2(7) = Conjg(cplFvFvAhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplFvFvAhR(gt2,gt3,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe Fv Fv Propagator: conj[Hpm],Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[Hpm],Ah'
        End Do 
      End Do 



!-------------- 
!  conj[Hpm], hh 
!-------------- 
Do i1=1,3
  Do i2=1,3
Boson4(1) = MHpm(i1) 
Boson4(2) = gTHpm(i1) 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt1) 
mass(4) = MFv(gt2) 
mass(3) = -MFv(gt3) 
 
coup2(1) = cplcFeFvcHpmL(iIN,gt2,i1) 
coup2(2) = cplcFeFvcHpmR(iIN,gt2,i1) 
coup2(3) = Conjg(cplcFeFehhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFeFehhR(iIN,gt1,i2))  
coup2(5) = cplFvFeHpmL(gt3,gt1,i1) 
coup2(6) = cplFvFeHpmR(gt3,gt1,i1) 
coup2(7) = Conjg(cplFvFvhhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplFvFvhhR(gt2,gt3,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFe(gt1) 
mass(4) = MFv(gt3) 
mass(3) = -MFv(gt2) 
 
coup2(1) = cplcFeFvcHpmL(iIN,gt3,i1) 
coup2(2) = cplcFeFvcHpmR(iIN,gt3,i1) 
coup2(3) = Conjg(cplcFeFehhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFeFehhR(iIN,gt1,i2))  
coup2(5) = cplFvFeHpmL(gt2,gt1,i1) 
coup2(6) = cplFvFeHpmR(gt2,gt1,i1) 
coup2(7) = Conjg(cplFvFvhhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplFvFvhhR(gt2,gt3,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe Fv Fv Propagator: conj[Hpm],hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[Hpm],hh'
        End Do 
      End Do 



!-------------- 
!  Ah, Ah 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Boson4(1) = MAh(i1) 
Boson4(2) = gTAh(i1) 
Boson4(3) = MAh(i2) 
Boson4(4) = gTAh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup2(1) = cplcFeFeAhL(iIN,gt1,i1) 
coup2(2) = cplcFeFeAhR(iIN,gt1,i1) 
coup2(3) = Conjg(cplcFeFeAhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFeFeAhR(iIN,gt1,i2))  
coup2(5) = cplFvFvAhL(gt2,gt3,i1) 
coup2(6) = cplFvFvAhR(gt2,gt3,i1) 
coup2(7) = Conjg(cplFvFvAhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplFvFvAhR(gt2,gt3,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe Fv Fv Propagator: Ah,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah,Ah'
        End Do 
      End Do 



!-------------- 
!  Ah, hh 
!-------------- 
Do i1=1,3
  Do i2=1,3
Boson4(1) = MAh(i1) 
Boson4(2) = gTAh(i1) 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup2(1) = cplcFeFeAhL(iIN,gt1,i1) 
coup2(2) = cplcFeFeAhR(iIN,gt1,i1) 
coup2(3) = Conjg(cplcFeFehhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFeFehhR(iIN,gt1,i2))  
coup2(5) = cplFvFvAhL(gt2,gt3,i1) 
coup2(6) = cplFvFvAhR(gt2,gt3,i1) 
coup2(7) = Conjg(cplFvFvhhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplFvFvhhR(gt2,gt3,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe Fv Fv Propagator: Ah,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah,hh'
        End Do 
      End Do 



!-------------- 
!  hh, hh 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Boson4(1) = Mhh(i1) 
Boson4(2) = gThh(i1) 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup2(1) = cplcFeFehhL(iIN,gt1,i1) 
coup2(2) = cplcFeFehhR(iIN,gt1,i1) 
coup2(3) = Conjg(cplcFeFehhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFeFehhR(iIN,gt1,i2))  
coup2(5) = cplFvFvhhL(gt2,gt3,i1) 
coup2(6) = cplFvFvhhR(gt2,gt3,i1) 
coup2(7) = Conjg(cplFvFvhhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplFvFvhhR(gt2,gt3,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe Fv Fv Propagator: hh,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='hh,hh'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1, iIN-1
      Do gt2=1,6
        Do gt3=gt2,6
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:169))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
  g = oo512pi3 / Abs(MFe(iIN))**3*g
End Subroutine FeToFeFvFv 
 
 
Subroutine FeToFecFcFc(iIN,MFe,MFc,MVZ,MVZR,cplcFcFcVZL,cplcFcFcVZR,cplcFcFcVZRL,     & 
& cplcFcFcVZRR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZRL,cplcFeFeVZRR,IntegralVs,             & 
& IntegralVVss,NVs,NVVss,gTVZ,gTVZR,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFe(3),MFc,MVZ,MVZR

Complex(dp),Intent(in) :: cplcFcFcVZL,cplcFcFcVZR,cplcFcFcVZRL,cplcFcFcVZRR,cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),  & 
& cplcFeFeVZRL(3,3),cplcFeFeVZRR(3,3)

Real(dp),Intent(inout) :: IntegralVs(25000,9),IntegralVVss(500000,12)

Real(dp),Intent(inout) :: gTVZ,gTVZR

Integer, Intent(inout) :: NVs,NVVss
Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp) :: Boson2(2), mass(4),  Boson4(4) 
Complex(dp) :: coup(4), coup2(8),coupT 
mass(1) = MFe(iIN) 
 
Isum = 4 
Allocate( gSum(3,1,1, Isum) ) 
Allocate( Contribution(3,1,1, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1, iIN-1
Isum = 0 
 
If(Abs(MFe(iIN)).gt.(Abs(MFc)+Abs(MFc)+Abs(MFe(gt1)))) Then 
!-------------- 
!  VZ 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVZ 
Boson2(2) =gTVZ 
 
Boson4(1) = MVZ 
Boson4(2) =gTVZ 
Boson4(3) = MVZ 
Boson4(4) =gTVZ 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFe(gt1) 
mass(3) = -MFc 
mass(4) = MFc 
 
coup(2) = Conjg(cplcFeFeVZL(iIN,gt1)) 
coup(1) = Conjg(cplcFeFeVZR(iIN,gt1)) 
coup(4) = Conjg(cplcFcFcVZL) 
coup(3) = Conjg(cplcFcFcVZR)
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFc Fc Propagator: VZ" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,1,1,Isum)= 0._dp
Else 
gSum(gt1,1,1,Isum)=resD
End If 
Contribution(gt1,1,1,Isum)='VZ'



!-------------- 
!  VZR 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVZR 
Boson2(2) =gTVZR 
 
Boson4(1) = MVZR 
Boson4(2) =gTVZR 
Boson4(3) = MVZR 
Boson4(4) =gTVZR 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFe(gt1) 
mass(3) = -MFc 
mass(4) = MFc 
 
coup(2) = Conjg(cplcFeFeVZRL(iIN,gt1)) 
coup(1) = Conjg(cplcFeFeVZRR(iIN,gt1)) 
coup(4) = Conjg(cplcFcFcVZRL) 
coup(3) = Conjg(cplcFcFcVZRR)
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFc Fc Propagator: VZR" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,1,1,Isum)= 0._dp
Else 
gSum(gt1,1,1,Isum)=resD
End If 
Contribution(gt1,1,1,Isum)='VZR'



!-------------- 
!  VZ, VZR 
!-------------- 
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MVZR 
Boson4(4) = gTVZR 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt1) 
mass(3) = -MFc 
mass(4) = MFc 
 
coup2(1) = cplcFeFeVZL(iIN,gt1) 
coup2(2) = cplcFeFeVZR(iIN,gt1) 
coup2(4) = Conjg(cplcFeFeVZRL(iIN,gt1)) 
coup2(3) = Conjg(cplcFeFeVZRR(iIN,gt1))  
coup2(5) = cplcFcFcVZL 
coup2(6) = cplcFcFcVZR 
coup2(8) = Conjg(cplcFcFcVZRL) 
coup2(7) = Conjg(cplcFcFcVZRR) 
Call IntegrateGaugeSS(Boson4, mass, coup2, deltaM, epsI,IntegralVVss,NVVss, resR, check) 
If (resR.ne.resR) resR = 0._dp
resC = 2._dp*resR 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFc Fc Propagator: VZ,VZR" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,1,1,Isum)= 0._dp  
Else 
gSum(gt1,1,1,Isum)= resS  
End If 
Contribution(gt1,1,1,Isum)='VZ,VZR'



Else 
gSum(gt1,1,1,:)= 0._dp  
End If 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1, iIN-1
g(gt1,1,1)=Sum(gSum(gt1,1,1,1:4))
If (g(gt1,1,1).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,1,1)=0._dp
End If
   End Do 
  g = oo512pi3 / Abs(MFe(iIN))**3*g
End Subroutine FeToFecFcFc 
 
 
Subroutine FeToFecFcpFcp(iIN,MFe,MFcp,MVZ,MVZR,cplcFcpFcpVZL,cplcFcpFcpVZR,           & 
& cplcFcpFcpVZRL,cplcFcpFcpVZRR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZRL,cplcFeFeVZRR,       & 
& IntegralVs,IntegralVVss,NVs,NVVss,gTVZ,gTVZR,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFe(3),MFcp,MVZ,MVZR

Complex(dp),Intent(in) :: cplcFcpFcpVZL,cplcFcpFcpVZR,cplcFcpFcpVZRL,cplcFcpFcpVZRR,cplcFeFeVZL(3,3),           & 
& cplcFeFeVZR(3,3),cplcFeFeVZRL(3,3),cplcFeFeVZRR(3,3)

Real(dp),Intent(inout) :: IntegralVs(25000,9),IntegralVVss(500000,12)

Real(dp),Intent(inout) :: gTVZ,gTVZR

Integer, Intent(inout) :: NVs,NVVss
Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp) :: Boson2(2), mass(4),  Boson4(4) 
Complex(dp) :: coup(4), coup2(8),coupT 
mass(1) = MFe(iIN) 
 
Isum = 4 
Allocate( gSum(3,1,1, Isum) ) 
Allocate( Contribution(3,1,1, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1, iIN-1
Isum = 0 
 
If(Abs(MFe(iIN)).gt.(Abs(MFcp)+Abs(MFcp)+Abs(MFe(gt1)))) Then 
!-------------- 
!  VZ 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVZ 
Boson2(2) =gTVZ 
 
Boson4(1) = MVZ 
Boson4(2) =gTVZ 
Boson4(3) = MVZ 
Boson4(4) =gTVZ 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFe(gt1) 
mass(3) = -MFcp 
mass(4) = MFcp 
 
coup(2) = Conjg(cplcFeFeVZL(iIN,gt1)) 
coup(1) = Conjg(cplcFeFeVZR(iIN,gt1)) 
coup(4) = Conjg(cplcFcpFcpVZL) 
coup(3) = Conjg(cplcFcpFcpVZR)
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFcp Fcp Propagator: VZ" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,1,1,Isum)= 0._dp
Else 
gSum(gt1,1,1,Isum)=resD
End If 
Contribution(gt1,1,1,Isum)='VZ'



!-------------- 
!  VZR 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVZR 
Boson2(2) =gTVZR 
 
Boson4(1) = MVZR 
Boson4(2) =gTVZR 
Boson4(3) = MVZR 
Boson4(4) =gTVZR 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFe(gt1) 
mass(3) = -MFcp 
mass(4) = MFcp 
 
coup(2) = Conjg(cplcFeFeVZRL(iIN,gt1)) 
coup(1) = Conjg(cplcFeFeVZRR(iIN,gt1)) 
coup(4) = Conjg(cplcFcpFcpVZRL) 
coup(3) = Conjg(cplcFcpFcpVZRR)
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFcp Fcp Propagator: VZR" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,1,1,Isum)= 0._dp
Else 
gSum(gt1,1,1,Isum)=resD
End If 
Contribution(gt1,1,1,Isum)='VZR'



!-------------- 
!  VZ, VZR 
!-------------- 
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MVZR 
Boson4(4) = gTVZR 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt1) 
mass(3) = -MFcp 
mass(4) = MFcp 
 
coup2(1) = cplcFeFeVZL(iIN,gt1) 
coup2(2) = cplcFeFeVZR(iIN,gt1) 
coup2(4) = Conjg(cplcFeFeVZRL(iIN,gt1)) 
coup2(3) = Conjg(cplcFeFeVZRR(iIN,gt1))  
coup2(5) = cplcFcpFcpVZL 
coup2(6) = cplcFcpFcpVZR 
coup2(8) = Conjg(cplcFcpFcpVZRL) 
coup2(7) = Conjg(cplcFcpFcpVZRR) 
Call IntegrateGaugeSS(Boson4, mass, coup2, deltaM, epsI,IntegralVVss,NVVss, resR, check) 
If (resR.ne.resR) resR = 0._dp
resC = 2._dp*resR 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFcp Fcp Propagator: VZ,VZR" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,1,1,Isum)= 0._dp  
Else 
gSum(gt1,1,1,Isum)= resS  
End If 
Contribution(gt1,1,1,Isum)='VZ,VZR'



Else 
gSum(gt1,1,1,:)= 0._dp  
End If 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1, iIN-1
g(gt1,1,1)=Sum(gSum(gt1,1,1,1:4))
If (g(gt1,1,1).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,1,1)=0._dp
End If
   End Do 
  g = oo512pi3 / Abs(MFe(iIN))**3*g
End Subroutine FeToFecFcpFcp 
 
 
Subroutine FeToFecFcppFcpp(iIN,MFe,MFcpp,MVZ,MVZR,cplcFcppFcppVZL,cplcFcppFcppVZR,    & 
& cplcFcppFcppVZRL,cplcFcppFcppVZRR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZRL,cplcFeFeVZRR,   & 
& IntegralVs,IntegralVVss,NVs,NVVss,gTVZ,gTVZR,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFe(3),MFcpp,MVZ,MVZR

Complex(dp),Intent(in) :: cplcFcppFcppVZL,cplcFcppFcppVZR,cplcFcppFcppVZRL,cplcFcppFcppVZRR,cplcFeFeVZL(3,3),   & 
& cplcFeFeVZR(3,3),cplcFeFeVZRL(3,3),cplcFeFeVZRR(3,3)

Real(dp),Intent(inout) :: IntegralVs(25000,9),IntegralVVss(500000,12)

Real(dp),Intent(inout) :: gTVZ,gTVZR

Integer, Intent(inout) :: NVs,NVVss
Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp) :: Boson2(2), mass(4),  Boson4(4) 
Complex(dp) :: coup(4), coup2(8),coupT 
mass(1) = MFe(iIN) 
 
Isum = 4 
Allocate( gSum(3,1,1, Isum) ) 
Allocate( Contribution(3,1,1, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1, iIN-1
Isum = 0 
 
If(Abs(MFe(iIN)).gt.(Abs(MFcpp)+Abs(MFcpp)+Abs(MFe(gt1)))) Then 
!-------------- 
!  VZ 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVZ 
Boson2(2) =gTVZ 
 
Boson4(1) = MVZ 
Boson4(2) =gTVZ 
Boson4(3) = MVZ 
Boson4(4) =gTVZ 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFe(gt1) 
mass(3) = -MFcpp 
mass(4) = MFcpp 
 
coup(2) = Conjg(cplcFeFeVZL(iIN,gt1)) 
coup(1) = Conjg(cplcFeFeVZR(iIN,gt1)) 
coup(4) = Conjg(cplcFcppFcppVZL) 
coup(3) = Conjg(cplcFcppFcppVZR)
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFcpp Fcpp Propagator: VZ" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,1,1,Isum)= 0._dp
Else 
gSum(gt1,1,1,Isum)=resD
End If 
Contribution(gt1,1,1,Isum)='VZ'



!-------------- 
!  VZR 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVZR 
Boson2(2) =gTVZR 
 
Boson4(1) = MVZR 
Boson4(2) =gTVZR 
Boson4(3) = MVZR 
Boson4(4) =gTVZR 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFe(gt1) 
mass(3) = -MFcpp 
mass(4) = MFcpp 
 
coup(2) = Conjg(cplcFeFeVZRL(iIN,gt1)) 
coup(1) = Conjg(cplcFeFeVZRR(iIN,gt1)) 
coup(4) = Conjg(cplcFcppFcppVZRL) 
coup(3) = Conjg(cplcFcppFcppVZRR)
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFcpp Fcpp Propagator: VZR" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,1,1,Isum)= 0._dp
Else 
gSum(gt1,1,1,Isum)=resD
End If 
Contribution(gt1,1,1,Isum)='VZR'



!-------------- 
!  VZ, VZR 
!-------------- 
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MVZR 
Boson4(4) = gTVZR 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt1) 
mass(3) = -MFcpp 
mass(4) = MFcpp 
 
coup2(1) = cplcFeFeVZL(iIN,gt1) 
coup2(2) = cplcFeFeVZR(iIN,gt1) 
coup2(4) = Conjg(cplcFeFeVZRL(iIN,gt1)) 
coup2(3) = Conjg(cplcFeFeVZRR(iIN,gt1))  
coup2(5) = cplcFcppFcppVZL 
coup2(6) = cplcFcppFcppVZR 
coup2(8) = Conjg(cplcFcppFcppVZRL) 
coup2(7) = Conjg(cplcFcppFcppVZRR) 
Call IntegrateGaugeSS(Boson4, mass, coup2, deltaM, epsI,IntegralVVss,NVVss, resR, check) 
If (resR.ne.resR) resR = 0._dp
resC = 2._dp*resR 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFcpp Fcpp Propagator: VZ,VZR" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,1,1,Isum)= 0._dp  
Else 
gSum(gt1,1,1,Isum)= resS  
End If 
Contribution(gt1,1,1,Isum)='VZ,VZR'



Else 
gSum(gt1,1,1,:)= 0._dp  
End If 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1, iIN-1
g(gt1,1,1)=Sum(gSum(gt1,1,1,1:4))
If (g(gt1,1,1).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,1,1)=0._dp
End If
   End Do 
  g = oo512pi3 / Abs(MFe(iIN))**3*g
End Subroutine FeToFecFcppFcpp 
 
 
Subroutine FeToFvcFdFu(iIN,MFv,MFd,MFu,MVWLm,MVWRm,MHpm,MFe,cplcFdFuHpmL,             & 
& cplcFdFuHpmR,cplcFdFuVWLmL,cplcFdFuVWLmR,cplcFdFuVWRmL,cplcFdFuVWRmR,cplcFeFvcHpmL,    & 
& cplcFeFvcHpmR,cplcFeFvcVWLmL,cplcFeFvcVWLmR,cplcFeFvcVWRmL,cplcFeFvcVWRmR,             & 
& IntegralSs,IntegralSSss,IntegralVs,IntegralVSss,IntegralVVss,NSs,NSSss,NVs,            & 
& NVSss,NVVss,gTVWLm,gTVWRm,gTHpm,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFv(6),MFd(3),MFu(3),MVWLm,MVWRm,MHpm(3),MFe(3)

Complex(dp),Intent(in) :: cplcFdFuHpmL(3,3,3),cplcFdFuHpmR(3,3,3),cplcFdFuVWLmL(3,3),cplcFdFuVWLmR(3,3),        & 
& cplcFdFuVWRmL(3,3),cplcFdFuVWRmR(3,3),cplcFeFvcHpmL(3,6,3),cplcFeFvcHpmR(3,6,3),       & 
& cplcFeFvcVWLmL(3,6),cplcFeFvcVWLmR(3,6),cplcFeFvcVWRmL(3,6),cplcFeFvcVWRmR(3,6)

Real(dp),Intent(inout) :: IntegralSs(500000,10),IntegralVs(25000,9),IntegralVVss(500000,12)

Complex(dp),Intent(inout) :: IntegralSSss(500000,12),IntegralVSss(500000,12)

Real(dp),Intent(inout) :: gTVWLm,gTVWRm,gTHpm(3)

Integer, Intent(inout) :: NSs,NSSss,NVs,NVSss,NVVss
Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp) :: Boson2(2), mass(4),  Boson4(4) 
Complex(dp) :: coup(4), coup2(8),coupT 
mass(1) = MFe(iIN) 
 
Isum = 25 
Allocate( gSum(6,3,3, Isum) ) 
Allocate( Contribution(6,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,6
      Do gt2=1,3
        Do gt3=1,3
Isum = 0 
 
If(Abs(MFe(iIN)).gt.(Abs(MFu(gt3))+Abs(MFd(gt2))+Abs(MFv(gt1)))) Then 
!-------------- 
!  conj[VWLm] 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVWLm 
Boson2(2) =gTVWLm 
 
Boson4(1) = MVWLm 
Boson4(2) =gTVWLm 
Boson4(3) = MVWLm 
Boson4(4) =gTVWLm 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFv(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFu(gt3) 
 
coup(2) = Conjg(cplcFeFvcVWLmL(iIN,gt1)) 
coup(1) = Conjg(cplcFeFvcVWLmR(iIN,gt1)) 
coup(4) = Conjg(cplcFdFuVWLmL(gt2,gt3)) 
coup(3) = Conjg(cplcFdFuVWLmR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fv cFd Fu Propagator: conj[VWLm]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[VWLm]'



!-------------- 
!  conj[VWRm] 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVWRm 
Boson2(2) =gTVWRm 
 
Boson4(1) = MVWRm 
Boson4(2) =gTVWRm 
Boson4(3) = MVWRm 
Boson4(4) =gTVWRm 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFv(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFu(gt3) 
 
coup(2) = Conjg(cplcFeFvcVWRmL(iIN,gt1)) 
coup(1) = Conjg(cplcFeFvcVWRmR(iIN,gt1)) 
coup(4) = Conjg(cplcFdFuVWRmL(gt2,gt3)) 
coup(3) = Conjg(cplcFdFuVWRmR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fv cFd Fu Propagator: conj[VWRm]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[VWRm]'



!-------------- 
!  conj[Hpm] 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
Boson2(1) = MHpm(i1) 
Boson2(2) =gTHpm(i1) 
 
Boson4(1) = MHpm(i1) 
Boson4(2) =gTHpm(i1) 
Boson4(3) = MHpm(i1) 
Boson4(4) =gTHpm(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFv(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFu(gt3) 
 
coup(2) = Conjg(cplcFeFvcHpmL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcFeFvcHpmR(iIN,gt1,i1)) 
coup(4) = Conjg(cplcFdFuHpmL(gt2,gt3,i1)) 
coup(3) = Conjg(cplcFdFuHpmR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fv cFd Fu Propagator: conj[Hpm]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[Hpm]'
      End Do 



!-------------- 
!  conj[VWLm], conj[VWRm] 
!-------------- 
Boson4(1) = MVWLm 
Boson4(2) = gTVWLm 
Boson4(3) = MVWRm 
Boson4(4) = gTVWRm 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFv(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFu(gt3) 
 
coup2(1) = cplcFeFvcVWLmL(iIN,gt1) 
coup2(2) = cplcFeFvcVWLmR(iIN,gt1) 
coup2(4) = Conjg(cplcFeFvcVWRmL(iIN,gt1)) 
coup2(3) = Conjg(cplcFeFvcVWRmR(iIN,gt1))  
coup2(5) = cplcFdFuVWLmL(gt2,gt3) 
coup2(6) = cplcFdFuVWLmR(gt2,gt3) 
coup2(8) = Conjg(cplcFdFuVWRmL(gt2,gt3)) 
coup2(7) = Conjg(cplcFdFuVWRmR(gt2,gt3)) 
Call IntegrateGaugeSS(Boson4, mass, coup2, deltaM, epsI,IntegralVVss,NVVss, resR, check) 
If (resR.ne.resR) resR = 0._dp
resC = 2._dp*resR 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fv cFd Fu Propagator: conj[VWLm],conj[VWRm]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[VWLm],conj[VWRm]'



!-------------- 
!  conj[VWLm], conj[Hpm] 
!-------------- 
  Do i2=1,3
Boson4(1) = MVWLm 
Boson4(2) = gTVWLm 
Boson4(3) = MHpm(i2) 
Boson4(4) = gTHpm(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFv(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFu(gt3) 
 
coup2(1) = cplcFeFvcVWLmL(iIN,gt1) 
coup2(2) = cplcFeFvcVWLmR(iIN,gt1) 
coup2(3) = Conjg(cplcFeFvcHpmL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFeFvcHpmR(iIN,gt1,i2))  
coup2(5) = cplcFdFuVWLmL(gt2,gt3) 
coup2(6) = cplcFdFuVWLmR(gt2,gt3) 
coup2(7) = Conjg(cplcFdFuHpmL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFdFuHpmR(gt2,gt3,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fv cFd Fu Propagator: conj[VWLm],conj[Hpm]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[VWLm],conj[Hpm]'
      End Do 



!-------------- 
!  conj[VWRm], conj[Hpm] 
!-------------- 
  Do i2=1,3
Boson4(1) = MVWRm 
Boson4(2) = gTVWRm 
Boson4(3) = MHpm(i2) 
Boson4(4) = gTHpm(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFv(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFu(gt3) 
 
coup2(1) = cplcFeFvcVWRmL(iIN,gt1) 
coup2(2) = cplcFeFvcVWRmR(iIN,gt1) 
coup2(3) = Conjg(cplcFeFvcHpmL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFeFvcHpmR(iIN,gt1,i2))  
coup2(5) = cplcFdFuVWRmL(gt2,gt3) 
coup2(6) = cplcFdFuVWRmR(gt2,gt3) 
coup2(7) = Conjg(cplcFdFuHpmL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFdFuHpmR(gt2,gt3,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fv cFd Fu Propagator: conj[VWRm],conj[Hpm]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[VWRm],conj[Hpm]'
      End Do 



!-------------- 
!  conj[Hpm], conj[Hpm] 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Boson4(1) = MHpm(i1) 
Boson4(2) = gTHpm(i1) 
Boson4(3) = MHpm(i2) 
Boson4(4) = gTHpm(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFv(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFu(gt3) 
 
coup2(1) = cplcFeFvcHpmL(iIN,gt1,i1) 
coup2(2) = cplcFeFvcHpmR(iIN,gt1,i1) 
coup2(3) = Conjg(cplcFeFvcHpmL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFeFvcHpmR(iIN,gt1,i2))  
coup2(5) = cplcFdFuHpmL(gt2,gt3,i1) 
coup2(6) = cplcFdFuHpmR(gt2,gt3,i1) 
coup2(7) = Conjg(cplcFdFuHpmL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFdFuHpmR(gt2,gt3,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fv cFd Fu Propagator: conj[Hpm],conj[Hpm]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[Hpm],conj[Hpm]'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1,6
      Do gt2=1,3
        Do gt3=1,3
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:25))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
  g = oo512pi3 / Abs(MFe(iIN))**3*g
End Subroutine FeToFvcFdFu 
 
 
Subroutine FeToFvcFcFcp(iIN,MFv,MFc,MFcp,MVWLm,MVWRm,MFe,cplcFcFcpVWLmL,              & 
& cplcFcFcpVWLmR,cplcFcFcpVWRmL,cplcFcFcpVWRmR,cplcFeFvcVWLmL,cplcFeFvcVWLmR,            & 
& cplcFeFvcVWRmL,cplcFeFvcVWRmR,IntegralVs,IntegralVVss,NVs,NVVss,gTVWLm,gTVWRm,         & 
& deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFv(6),MFc,MFcp,MVWLm,MVWRm,MFe(3)

Complex(dp),Intent(in) :: cplcFcFcpVWLmL,cplcFcFcpVWLmR,cplcFcFcpVWRmL,cplcFcFcpVWRmR,cplcFeFvcVWLmL(3,6),      & 
& cplcFeFvcVWLmR(3,6),cplcFeFvcVWRmL(3,6),cplcFeFvcVWRmR(3,6)

Real(dp),Intent(inout) :: IntegralVs(25000,9),IntegralVVss(500000,12)

Real(dp),Intent(inout) :: gTVWLm,gTVWRm

Integer, Intent(inout) :: NVs,NVVss
Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp) :: Boson2(2), mass(4),  Boson4(4) 
Complex(dp) :: coup(4), coup2(8),coupT 
mass(1) = MFe(iIN) 
 
Isum = 4 
Allocate( gSum(6,1,1, Isum) ) 
Allocate( Contribution(6,1,1, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,6
Isum = 0 
 
If(Abs(MFe(iIN)).gt.(Abs(MFcp)+Abs(MFc)+Abs(MFv(gt1)))) Then 
!-------------- 
!  conj[VWLm] 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVWLm 
Boson2(2) =gTVWLm 
 
Boson4(1) = MVWLm 
Boson4(2) =gTVWLm 
Boson4(3) = MVWLm 
Boson4(4) =gTVWLm 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFv(gt1) 
mass(3) = -MFc 
mass(4) = MFcp 
 
coup(2) = Conjg(cplcFeFvcVWLmL(iIN,gt1)) 
coup(1) = Conjg(cplcFeFvcVWLmR(iIN,gt1)) 
coup(4) = Conjg(cplcFcFcpVWLmL) 
coup(3) = Conjg(cplcFcFcpVWLmR)
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fv cFc Fcp Propagator: conj[VWLm]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,1,1,Isum)= 0._dp
Else 
gSum(gt1,1,1,Isum)=resD
End If 
Contribution(gt1,1,1,Isum)='conj[VWLm]'



!-------------- 
!  conj[VWRm] 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVWRm 
Boson2(2) =gTVWRm 
 
Boson4(1) = MVWRm 
Boson4(2) =gTVWRm 
Boson4(3) = MVWRm 
Boson4(4) =gTVWRm 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFv(gt1) 
mass(3) = -MFc 
mass(4) = MFcp 
 
coup(2) = Conjg(cplcFeFvcVWRmL(iIN,gt1)) 
coup(1) = Conjg(cplcFeFvcVWRmR(iIN,gt1)) 
coup(4) = Conjg(cplcFcFcpVWRmL) 
coup(3) = Conjg(cplcFcFcpVWRmR)
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fv cFc Fcp Propagator: conj[VWRm]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,1,1,Isum)= 0._dp
Else 
gSum(gt1,1,1,Isum)=resD
End If 
Contribution(gt1,1,1,Isum)='conj[VWRm]'



!-------------- 
!  conj[VWLm], conj[VWRm] 
!-------------- 
Boson4(1) = MVWLm 
Boson4(2) = gTVWLm 
Boson4(3) = MVWRm 
Boson4(4) = gTVWRm 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFv(gt1) 
mass(3) = -MFc 
mass(4) = MFcp 
 
coup2(1) = cplcFeFvcVWLmL(iIN,gt1) 
coup2(2) = cplcFeFvcVWLmR(iIN,gt1) 
coup2(4) = Conjg(cplcFeFvcVWRmL(iIN,gt1)) 
coup2(3) = Conjg(cplcFeFvcVWRmR(iIN,gt1))  
coup2(5) = cplcFcFcpVWLmL 
coup2(6) = cplcFcFcpVWLmR 
coup2(8) = Conjg(cplcFcFcpVWRmL) 
coup2(7) = Conjg(cplcFcFcpVWRmR) 
Call IntegrateGaugeSS(Boson4, mass, coup2, deltaM, epsI,IntegralVVss,NVVss, resR, check) 
If (resR.ne.resR) resR = 0._dp
resC = 2._dp*resR 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fv cFc Fcp Propagator: conj[VWLm],conj[VWRm]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,1,1,Isum)= 0._dp  
Else 
gSum(gt1,1,1,Isum)= resS  
End If 
Contribution(gt1,1,1,Isum)='conj[VWLm],conj[VWRm]'



Else 
gSum(gt1,1,1,:)= 0._dp  
End If 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1,6
g(gt1,1,1)=Sum(gSum(gt1,1,1,1:4))
If (g(gt1,1,1).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,1,1)=0._dp
End If
   End Do 
  g = oo512pi3 / Abs(MFe(iIN))**3*g
End Subroutine FeToFvcFcFcp 
 
 
Subroutine FeToFvcFcpFcpp(iIN,MFv,MFcp,MFcpp,MVWLm,MVWRm,MFe,cplcFcpFcppVWLmL,        & 
& cplcFcpFcppVWLmR,cplcFcpFcppVWRmL,cplcFcpFcppVWRmR,cplcFeFvcVWLmL,cplcFeFvcVWLmR,      & 
& cplcFeFvcVWRmL,cplcFeFvcVWRmR,IntegralVs,IntegralVVss,NVs,NVVss,gTVWLm,gTVWRm,         & 
& deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFv(6),MFcp,MFcpp,MVWLm,MVWRm,MFe(3)

Complex(dp),Intent(in) :: cplcFcpFcppVWLmL,cplcFcpFcppVWLmR,cplcFcpFcppVWRmL,cplcFcpFcppVWRmR,cplcFeFvcVWLmL(3,6),& 
& cplcFeFvcVWLmR(3,6),cplcFeFvcVWRmL(3,6),cplcFeFvcVWRmR(3,6)

Real(dp),Intent(inout) :: IntegralVs(25000,9),IntegralVVss(500000,12)

Real(dp),Intent(inout) :: gTVWLm,gTVWRm

Integer, Intent(inout) :: NVs,NVVss
Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp) :: Boson2(2), mass(4),  Boson4(4) 
Complex(dp) :: coup(4), coup2(8),coupT 
mass(1) = MFe(iIN) 
 
Isum = 4 
Allocate( gSum(6,1,1, Isum) ) 
Allocate( Contribution(6,1,1, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,6
Isum = 0 
 
If(Abs(MFe(iIN)).gt.(Abs(MFcpp)+Abs(MFcp)+Abs(MFv(gt1)))) Then 
!-------------- 
!  conj[VWLm] 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVWLm 
Boson2(2) =gTVWLm 
 
Boson4(1) = MVWLm 
Boson4(2) =gTVWLm 
Boson4(3) = MVWLm 
Boson4(4) =gTVWLm 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFv(gt1) 
mass(3) = -MFcp 
mass(4) = MFcpp 
 
coup(2) = Conjg(cplcFeFvcVWLmL(iIN,gt1)) 
coup(1) = Conjg(cplcFeFvcVWLmR(iIN,gt1)) 
coup(4) = Conjg(cplcFcpFcppVWLmL) 
coup(3) = Conjg(cplcFcpFcppVWLmR)
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fv cFcp Fcpp Propagator: conj[VWLm]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,1,1,Isum)= 0._dp
Else 
gSum(gt1,1,1,Isum)=resD
End If 
Contribution(gt1,1,1,Isum)='conj[VWLm]'



!-------------- 
!  conj[VWRm] 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVWRm 
Boson2(2) =gTVWRm 
 
Boson4(1) = MVWRm 
Boson4(2) =gTVWRm 
Boson4(3) = MVWRm 
Boson4(4) =gTVWRm 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFv(gt1) 
mass(3) = -MFcp 
mass(4) = MFcpp 
 
coup(2) = Conjg(cplcFeFvcVWRmL(iIN,gt1)) 
coup(1) = Conjg(cplcFeFvcVWRmR(iIN,gt1)) 
coup(4) = Conjg(cplcFcpFcppVWRmL) 
coup(3) = Conjg(cplcFcpFcppVWRmR)
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fv cFcp Fcpp Propagator: conj[VWRm]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,1,1,Isum)= 0._dp
Else 
gSum(gt1,1,1,Isum)=resD
End If 
Contribution(gt1,1,1,Isum)='conj[VWRm]'



!-------------- 
!  conj[VWLm], conj[VWRm] 
!-------------- 
Boson4(1) = MVWLm 
Boson4(2) = gTVWLm 
Boson4(3) = MVWRm 
Boson4(4) = gTVWRm 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFv(gt1) 
mass(3) = -MFcp 
mass(4) = MFcpp 
 
coup2(1) = cplcFeFvcVWLmL(iIN,gt1) 
coup2(2) = cplcFeFvcVWLmR(iIN,gt1) 
coup2(4) = Conjg(cplcFeFvcVWRmL(iIN,gt1)) 
coup2(3) = Conjg(cplcFeFvcVWRmR(iIN,gt1))  
coup2(5) = cplcFcpFcppVWLmL 
coup2(6) = cplcFcpFcppVWLmR 
coup2(8) = Conjg(cplcFcpFcppVWRmL) 
coup2(7) = Conjg(cplcFcpFcppVWRmR) 
Call IntegrateGaugeSS(Boson4, mass, coup2, deltaM, epsI,IntegralVVss,NVVss, resR, check) 
If (resR.ne.resR) resR = 0._dp
resC = 2._dp*resR 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fv cFcp Fcpp Propagator: conj[VWLm],conj[VWRm]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,1,1,Isum)= 0._dp  
Else 
gSum(gt1,1,1,Isum)= resS  
End If 
Contribution(gt1,1,1,Isum)='conj[VWLm],conj[VWRm]'



Else 
gSum(gt1,1,1,:)= 0._dp  
End If 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1,6
g(gt1,1,1)=Sum(gSum(gt1,1,1,1:4))
If (g(gt1,1,1).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,1,1)=0._dp
End If
   End Do 
  g = oo512pi3 / Abs(MFe(iIN))**3*g
End Subroutine FeToFvcFcpFcpp 
 
 
End Module Fe3Decays_LRDM 
 

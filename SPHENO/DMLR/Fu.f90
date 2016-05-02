! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.8.1 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 14:06 on 13.4.2016   
! ----------------------------------------------------------------------  
 
 
Module Fu3Decays_DMLR 
 
Use Control 
Use CouplingsForDecays_DMLR 
Use ThreeBodyPhaseSpace 
 
Contains 
 
Subroutine FuThreeBodyDecay(n_in,MAh,MAh2,MdeltaRpp,MdeltaRpp2,MFc,MFc2,              & 
& MFcp,MFcp2,MFcpp,MFcpp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,             & 
& MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,phaT,PhiW,UV,TW,UC,ZDR,            & 
& ZER,UP,UT,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,ALP3,              & 
& ALP2,LAM4,LAM2,LAM3,YDR,YL1,YQ1,YL2,YQ2,M23,mu32,MU22,MU12,vd,vu,vR,gTAh,              & 
& gThh,gTHpm,gTVWLm,gTVWRm,gTVZ,gTVZR,gFuFucFdFd,gFuFucFeFe,gFuFucFuFu,gFuFuFvFv,        & 
& gFuFdFvFe,gFuFdFcpFc,gFuFdcFcpFcpp,gFuFuFcFc,gFuFucFcpFcp,gFuFucFcppFcpp,              & 
& epsI,deltaM,CheckRealStates,gT,gPartial,BR)

Implicit None 
 
Real(dp),Intent(in) :: MAh(3),MAh2(3),MdeltaRpp,MdeltaRpp2,MFc(2),MFc2(2),MFcp,MFcp2,MFcpp,MFcpp2,           & 
& MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),Mhh(3),Mhh2(3),            & 
& MHpm(3),MHpm2(3),MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,TW,UC(3,3),        & 
& UP(3,3),ZH(3,3)

Complex(dp),Intent(in) :: phaT,UV(6,6),ZDR(3,3),ZER(3,3),UT(2,2),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),           & 
& ZW(4,4),ZZ(3,3)

Complex(dp) :: cplcFcpFcppVWLmL,cplcFcpFcppVWLmR,cplcFcpFcppVWRmL,cplcFcpFcppVWRmR,cplcFcpFcpVZL,    & 
& cplcFcpFcpVZR,cplcFcpFcpVZRL,cplcFcpFcpVZRR,cplcFcppFcppVZL,cplcFcppFcppVZR,           & 
& cplcFcppFcppVZRL,cplcFcppFcppVZRR,cplcFdFdAhL(3,3,3),cplcFdFdAhR(3,3,3),               & 
& cplcFdFdhhL(3,3,3),cplcFdFdhhR(3,3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),               & 
& cplcFdFdVZRL(3,3),cplcFdFdVZRR(3,3),cplcFdFuHpmL(3,3,3),cplcFdFuHpmR(3,3,3),           & 
& cplcFdFuVWLmL(3,3),cplcFdFuVWLmR(3,3),cplcFdFuVWRmL(3,3),cplcFdFuVWRmR(3,3),           & 
& cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),cplcFeFehhL(3,3,3),cplcFeFehhR(3,3,3),           & 
& cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFeVZRL(3,3),cplcFeFeVZRR(3,3),cplcFuFdcHpmL(3,3,3),& 
& cplcFuFdcHpmR(3,3,3),cplcFuFdcVWLmL(3,3),cplcFuFdcVWLmR(3,3),cplcFuFdcVWRmL(3,3),      & 
& cplcFuFdcVWRmR(3,3),cplcFuFuAhL(3,3,3),cplcFuFuAhR(3,3,3),cplcFuFuhhL(3,3,3),          & 
& cplcFuFuhhR(3,3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcFuFuVZRL(3,3),cplcFuFuVZRR(3,3),& 
& cplFcFcpVWLmL(2),cplFcFcpVWLmR(2),cplFcFcpVWRmL(2),cplFcFcpVWRmR(2),cplFcFcVZL(2,2),   & 
& cplFcFcVZR(2,2),cplFcFcVZRL(2,2),cplFcFcVZRR(2,2),cplFvFeHpmL(6,3,3),cplFvFeHpmR(6,3,3),& 
& cplFvFeVWLmL(6,3),cplFvFeVWLmR(6,3),cplFvFeVWRmL(6,3),cplFvFeVWRmR(6,3),               & 
& cplFvFvAhL(6,6,3),cplFvFvAhR(6,6,3),cplFvFvhhL(6,6,3),cplFvFvhhR(6,6,3),               & 
& cplFvFvVZL(6,6),cplFvFvVZR(6,6),cplFvFvVZRL(6,6),cplFvFvVZRR(6,6)

Real(dp),Intent(in) :: gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,ALP3,ALP2,LAM4,LAM2,LAM3,M23,mu32,MU22,              & 
& MU12,vd,vu,vR

Complex(dp),Intent(in) :: YDR(3,3),YL1(3,3),YQ1(3,3),YL2(3,3),YQ2(3,3)

Real(dp),Intent(inout) :: gFuFucFdFd(3,3,3,3),gFuFucFeFe(3,3,3,3),gFuFucFuFu(3,3,3,3),gFuFuFvFv(3,3,6,6),       & 
& gFuFdFvFe(3,3,6,3),gFuFdFcpFc(3,3,1,2),gFuFdcFcpFcpp(3,3,1,1),gFuFuFcFc(3,3,2,2),      & 
& gFuFucFcpFcp(3,3,1,1),gFuFucFcppFcpp(3,3,1,1)

Real(dp),Intent(in) :: gTAh(3),gThh(3),gTHpm(3),gTVWLm,gTVWRm,gTVZ,gTVZR

Real(dp) :: gFuFucFdFdi(3,3,3),gFuFucFeFei(3,3,3),gFuFucFuFui(3,3,3),gFuFuFvFvi(3,6,6),           & 
& gFuFdFvFei(3,6,3),gFuFdFcpFci(3,1,2),gFuFdcFcpFcppi(3,1,1),gFuFuFcFci(3,2,2),          & 
& gFuFucFcpFcpi(3,1,1),gFuFucFcppFcppi(3,1,1)

Real(dp) :: gTAhtemp(3),gThhtemp(3),gTHpmtemp(3),gTVWLmtemp,gTVWRmtemp,gTVZtemp,gTVZRtemp
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
NameOfUnit(Iname) = 'FuThreeBodyDecay' 
 
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
gThhtemp = 0._dp 
gTHpmtemp = 0._dp 
gTVWLmtemp = 0._dp 
gTVWRmtemp = 0._dp 
gTVZtemp = 0._dp 
gTVZRtemp = 0._dp 
Else 
gTAhtemp = gTAh 
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
 
Call CouplingsFor_Fu_decays_3B(MFu(i_run),i_run,MAh,MAh2,MdeltaRpp,MdeltaRpp2,        & 
& MFc,MFc2,MFcp,MFcp2,MFcpp,MFcpp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,              & 
& Mhh2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,phaT,PhiW,               & 
& UV,TW,UC,ZDR,ZER,UP,UT,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,RHO2,RHO1,ALP1,           & 
& LAM1,ALP3,ALP2,LAM4,LAM2,LAM3,YDR,YL1,YQ1,YL2,YQ2,M23,mu32,MU22,MU12,vd,               & 
& vu,vR,cplcFcpFcppVWLmL,cplcFcpFcppVWLmR,cplcFcpFcppVWRmL,cplcFcpFcppVWRmR,             & 
& cplcFcpFcpVZL,cplcFcpFcpVZR,cplcFcpFcpVZRL,cplcFcpFcpVZRR,cplcFcppFcppVZL,             & 
& cplcFcppFcppVZR,cplcFcppFcppVZRL,cplcFcppFcppVZRR,cplcFdFdAhL,cplcFdFdAhR,             & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZRL,cplcFdFdVZRR,             & 
& cplcFdFuHpmL,cplcFdFuHpmR,cplcFdFuVWLmL,cplcFdFuVWLmR,cplcFdFuVWRmL,cplcFdFuVWRmR,     & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcFeFeVZRL,cplcFeFeVZRR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWLmL,cplcFuFdcVWLmR,   & 
& cplcFuFdcVWRmL,cplcFuFdcVWRmR,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuhhL,cplcFuFuhhR,         & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZRL,cplcFuFuVZRR,cplFcFcpVWLmL,cplFcFcpVWLmR,         & 
& cplFcFcpVWRmL,cplFcFcpVWRmR,cplFcFcVZL,cplFcFcVZR,cplFcFcVZRL,cplFcFcVZRR,             & 
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

 
gFuFucFdFdi = 0._dp 
Call FuToFucFdFd(i_run,MFu,MFd,MVZ,MVZR,MVWLm,MVWRm,MHpm,MAh,Mhh,cplcFdFdAhL,         & 
& cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZRL,              & 
& cplcFdFdVZRR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFdFuVWLmL,cplcFdFuVWLmR,cplcFdFuVWRmL,      & 
& cplcFdFuVWRmR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWLmL,cplcFuFdcVWLmR,               & 
& cplcFuFdcVWRmL,cplcFuFdcVWRmR,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuhhL,cplcFuFuhhR,         & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZRL,cplcFuFuVZRR,IntegralSs,IntegralSSss,             & 
& IntegralSSst,IntegralVs,IntegralVSss,IntegralVSst,IntegralVVss,IntegralVVst,           & 
& NSs,NSSss,NSSst,NVs,NVSss,NVSst,NVVss,NVVst,gTVZtemp,gTVZRtemp,gTVWLmtemp,             & 
& gTVWRmtemp,gTHpmtemp,gTAhtemp,gThhtemp,deltaM,epsI,check,gFuFucFdFdi)

gFuFucFdFd(i_run,:,:,:) = gFuFucFdFdi 
gT(i_run) = gT(i_run) + Sum(gFuFucFdFdi) 
 
gFuFucFeFei = 0._dp 
Call FuToFucFeFe(i_run,MFu,MFe,MVZ,MVZR,MAh,Mhh,cplcFeFeAhL,cplcFeFeAhR,              & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZRL,cplcFeFeVZRR,             & 
& cplcFuFuAhL,cplcFuFuAhR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcFuFuVZRL,cplcFuFuVZRR,IntegralSs,IntegralSSss,IntegralVs,IntegralVSss,             & 
& IntegralVVss,NSs,NSSss,NVs,NVSss,NVVss,gTVZtemp,gTVZRtemp,gTAhtemp,gThhtemp,           & 
& deltaM,epsI,check,gFuFucFeFei)

gFuFucFeFe(i_run,:,:,:) = gFuFucFeFei 
gT(i_run) = gT(i_run) + Sum(gFuFucFeFei) 
 
gFuFucFuFui = 0._dp 
Call FuToFucFuFu(i_run,MFu,MVZ,MVZR,MAh,Mhh,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuhhL,      & 
& cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZRL,cplcFuFuVZRR,IntegralSs,              & 
& IntegralSSss,IntegralSSst,IntegralVs,IntegralVSss,IntegralVSst,IntegralVVss,           & 
& IntegralVVst,NSs,NSSss,NSSst,NVs,NVSss,NVSst,NVVss,NVVst,gTVZtemp,gTVZRtemp,           & 
& gTAhtemp,gThhtemp,deltaM,epsI,check,gFuFucFuFui)

gFuFucFuFu(i_run,:,:,:) = gFuFucFuFui 
gT(i_run) = gT(i_run) + Sum(gFuFucFuFui) 
 
gFuFuFvFvi = 0._dp 
Call FuToFuFvFv(i_run,MFu,MFv,MVZ,MVZR,MAh,Mhh,cplcFuFuAhL,cplcFuFuAhR,               & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZRL,cplcFuFuVZRR,             & 
& cplFvFvAhL,cplFvFvAhR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZRL,         & 
& cplFvFvVZRR,IntegralSs,IntegralSSss,IntegralVs,IntegralVSss,IntegralVVss,              & 
& NSs,NSSss,NVs,NVSss,NVVss,gTVZtemp,gTVZRtemp,gTAhtemp,gThhtemp,deltaM,epsI,            & 
& check,gFuFuFvFvi)

gFuFuFvFv(i_run,:,:,:) = gFuFuFvFvi 
gT(i_run) = gT(i_run) + Sum(gFuFuFvFvi) 
 
gFuFdFvFei = 0._dp 
Call FuToFdFvFe(i_run,MFd,MFv,MFe,MVWLm,MVWRm,MHpm,MFu,cplcFuFdcHpmL,cplcFuFdcHpmR,   & 
& cplcFuFdcVWLmL,cplcFuFdcVWLmR,cplcFuFdcVWRmL,cplcFuFdcVWRmR,cplFvFeHpmL,               & 
& cplFvFeHpmR,cplFvFeVWLmL,cplFvFeVWLmR,cplFvFeVWRmL,cplFvFeVWRmR,IntegralSs,            & 
& IntegralSSss,IntegralVs,IntegralVSss,IntegralVVss,NSs,NSSss,NVs,NVSss,NVVss,           & 
& gTVWLmtemp,gTVWRmtemp,gTHpmtemp,deltaM,epsI,check,gFuFdFvFei)

gFuFdFvFe(i_run,:,:,:) = gFuFdFvFei 
gT(i_run) = gT(i_run) + Sum(gFuFdFvFei) 
 
gFuFdFcpFci = 0._dp 
Call FuToFdFcpFc(i_run,MFd,MFcp,MFc,MVWLm,MVWRm,MFu,cplcFuFdcVWLmL,cplcFuFdcVWLmR,    & 
& cplcFuFdcVWRmL,cplcFuFdcVWRmR,cplFcFcpVWLmL,cplFcFcpVWLmR,cplFcFcpVWRmL,               & 
& cplFcFcpVWRmR,IntegralVs,IntegralVVss,NVs,NVVss,gTVWLmtemp,gTVWRmtemp,deltaM,          & 
& epsI,check,gFuFdFcpFci)

gFuFdFcpFc(i_run,:,:,:) = gFuFdFcpFci 
gT(i_run) = gT(i_run) + Sum(gFuFdFcpFci) 
 
gFuFdcFcpFcppi = 0._dp 
Call FuToFdcFcpFcpp(i_run,MFd,MFcp,MFcpp,MVWLm,MVWRm,MFu,cplcFcpFcppVWLmL,            & 
& cplcFcpFcppVWLmR,cplcFcpFcppVWRmL,cplcFcpFcppVWRmR,cplcFuFdcVWLmL,cplcFuFdcVWLmR,      & 
& cplcFuFdcVWRmL,cplcFuFdcVWRmR,IntegralVs,IntegralVVss,NVs,NVVss,gTVWLmtemp,            & 
& gTVWRmtemp,deltaM,epsI,check,gFuFdcFcpFcppi)

gFuFdcFcpFcpp(i_run,:,:,:) = gFuFdcFcpFcppi 
gT(i_run) = gT(i_run) + Sum(gFuFdcFcpFcppi) 
 
gFuFuFcFci = 0._dp 
Call FuToFuFcFc(i_run,MFu,MFc,MVZ,MVZR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZRL,          & 
& cplcFuFuVZRR,cplFcFcVZL,cplFcFcVZR,cplFcFcVZRL,cplFcFcVZRR,IntegralVs,IntegralVVss,    & 
& NVs,NVVss,gTVZtemp,gTVZRtemp,deltaM,epsI,check,gFuFuFcFci)

gFuFuFcFc(i_run,:,:,:) = gFuFuFcFci 
gT(i_run) = gT(i_run) + Sum(gFuFuFcFci) 
 
gFuFucFcpFcpi = 0._dp 
Call FuToFucFcpFcp(i_run,MFu,MFcp,MVZ,MVZR,cplcFcpFcpVZL,cplcFcpFcpVZR,               & 
& cplcFcpFcpVZRL,cplcFcpFcpVZRR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZRL,cplcFuFuVZRR,       & 
& IntegralVs,IntegralVVss,NVs,NVVss,gTVZtemp,gTVZRtemp,deltaM,epsI,check,gFuFucFcpFcpi)

gFuFucFcpFcp(i_run,:,:,:) = gFuFucFcpFcpi 
gT(i_run) = gT(i_run) + Sum(gFuFucFcpFcpi) 
 
gFuFucFcppFcppi = 0._dp 
Call FuToFucFcppFcpp(i_run,MFu,MFcpp,MVZ,MVZR,cplcFcppFcppVZL,cplcFcppFcppVZR,        & 
& cplcFcppFcppVZRL,cplcFcppFcppVZRR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZRL,cplcFuFuVZRR,   & 
& IntegralVs,IntegralVVss,NVs,NVVss,gTVZtemp,gTVZRtemp,deltaM,epsI,check,gFuFucFcppFcppi)

gFuFucFcppFcpp(i_run,:,:,:) = gFuFucFcppFcppi 
gT(i_run) = gT(i_run) + Sum(gFuFucFcppFcppi) 
 
End Do 
 

If (Present(gPartial)) Then
Do i1 = i_start, i_end 
 
n_length=1
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
gPartial(i1,n_length)= gFuFucFdFd(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
gPartial(i1,n_length)= gFuFucFeFe(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=gt1,3
gPartial(i1,n_length)= gFuFucFuFu(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,6
    Do gt3=gt2,6
gPartial(i1,n_length)= gFuFuFvFv(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,6
    Do gt3=1,3
gPartial(i1,n_length)= gFuFdFvFe(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,1
    Do gt3=1,2
gPartial(i1,n_length)= gFuFdFcpFc(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,1
    Do gt3=1,1
gPartial(i1,n_length)= gFuFdcFcpFcpp(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,2
    Do gt3=gt2,2
gPartial(i1,n_length)= gFuFuFcFc(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,1
    Do gt3=1,1
gPartial(i1,n_length)= gFuFucFcpFcp(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,1
    Do gt3=1,1
gPartial(i1,n_length)= gFuFucFcppFcpp(i1,gt1,gt2,gt3)
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
 
End Subroutine FuThreeBodyDecay
 
 
Subroutine FuToFucFdFd(iIN,MFu,MFd,MVZ,MVZR,MVWLm,MVWRm,MHpm,MAh,Mhh,cplcFdFdAhL,     & 
& cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZRL,              & 
& cplcFdFdVZRR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFdFuVWLmL,cplcFdFuVWLmR,cplcFdFuVWRmL,      & 
& cplcFdFuVWRmR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWLmL,cplcFuFdcVWLmR,               & 
& cplcFuFdcVWRmL,cplcFuFdcVWRmR,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuhhL,cplcFuFuhhR,         & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZRL,cplcFuFuVZRR,IntegralSs,IntegralSSss,             & 
& IntegralSSst,IntegralVs,IntegralVSss,IntegralVSst,IntegralVVss,IntegralVVst,           & 
& NSs,NSSss,NSSst,NVs,NVSss,NVSst,NVVss,NVVst,gTVZ,gTVZR,gTVWLm,gTVWRm,gTHpm,            & 
& gTAh,gThh,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFu(3),MFd(3),MVZ,MVZR,MVWLm,MVWRm,MHpm(3),MAh(3),Mhh(3)

Complex(dp),Intent(in) :: cplcFdFdAhL(3,3,3),cplcFdFdAhR(3,3,3),cplcFdFdhhL(3,3,3),cplcFdFdhhR(3,3,3),          & 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFdFdVZRL(3,3),cplcFdFdVZRR(3,3),cplcFdFuHpmL(3,3,3),& 
& cplcFdFuHpmR(3,3,3),cplcFdFuVWLmL(3,3),cplcFdFuVWLmR(3,3),cplcFdFuVWRmL(3,3),          & 
& cplcFdFuVWRmR(3,3),cplcFuFdcHpmL(3,3,3),cplcFuFdcHpmR(3,3,3),cplcFuFdcVWLmL(3,3),      & 
& cplcFuFdcVWLmR(3,3),cplcFuFdcVWRmL(3,3),cplcFuFdcVWRmR(3,3),cplcFuFuAhL(3,3,3),        & 
& cplcFuFuAhR(3,3,3),cplcFuFuhhL(3,3,3),cplcFuFuhhR(3,3,3),cplcFuFuVZL(3,3),             & 
& cplcFuFuVZR(3,3),cplcFuFuVZRL(3,3),cplcFuFuVZRR(3,3)

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
mass(1) = MFu(iIN) 
 
Isum = 169 
Allocate( gSum(3,3,3, Isum) ) 
Allocate( Contribution(3,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1, iIN-1
      Do gt2=1,3
        Do gt3=1,3
Isum = 0 
 
If(Abs(MFu(iIN)).gt.(Abs(MFd(gt3))+Abs(MFd(gt2))+Abs(MFu(gt1)))) Then 
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
 
mass(2) = MFu(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup(2) = Conjg(cplcFuFuVZL(iIN,gt1)) 
coup(1) = Conjg(cplcFuFuVZR(iIN,gt1)) 
coup(4) = Conjg(cplcFdFdVZL(gt2,gt3)) 
coup(3) = Conjg(cplcFdFdVZR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFd Fd Propagator: VZ" 
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
 
mass(2) = MFu(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup(2) = Conjg(cplcFuFuVZRL(iIN,gt1)) 
coup(1) = Conjg(cplcFuFuVZRR(iIN,gt1)) 
coup(4) = Conjg(cplcFdFdVZRL(gt2,gt3)) 
coup(3) = Conjg(cplcFdFdVZRR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFd Fd Propagator: VZR" 
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
 
mass(2) = MFd(gt3) 
mass(3) = -MFd(gt2) 
mass(4) = MFu(gt1) 
 
coup(2) = Conjg(cplcFuFdcVWLmL(iIN,gt3)) 
coup(1) = Conjg(cplcFuFdcVWLmR(iIN,gt3)) 
coup(4) = Conjg(cplcFdFuVWLmL(gt2,gt1)) 
coup(3) = Conjg(cplcFdFuVWLmR(gt2,gt1))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFd Fd Propagator: conj[VWLm]" 
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
 
mass(2) = MFd(gt3) 
mass(3) = -MFd(gt2) 
mass(4) = MFu(gt1) 
 
coup(2) = Conjg(cplcFuFdcVWRmL(iIN,gt3)) 
coup(1) = Conjg(cplcFuFdcVWRmR(iIN,gt3)) 
coup(4) = Conjg(cplcFdFuVWRmL(gt2,gt1)) 
coup(3) = Conjg(cplcFdFuVWRmR(gt2,gt1))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFd Fd Propagator: conj[VWRm]" 
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
 
mass(2) = MFd(gt3) 
mass(3) = -MFd(gt2) 
mass(4) = MFu(gt1) 
 
coup(2) = Conjg(cplcFuFdcHpmL(iIN,gt3,i1)) 
coup(1) = Conjg(cplcFuFdcHpmR(iIN,gt3,i1)) 
coup(4) = Conjg(cplcFdFuHpmL(gt2,gt1,i1)) 
coup(3) = Conjg(cplcFdFuHpmR(gt2,gt1,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFd Fd Propagator: conj[Hpm]" 
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
 
mass(2) = MFu(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup(2) = Conjg(cplcFuFuAhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcFuFuAhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplcFdFdAhL(gt2,gt3,i1)) 
coup(3) = Conjg(cplcFdFdAhR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFd Fd Propagator: Ah" 
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
 
mass(2) = MFu(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup(2) = Conjg(cplcFuFuhhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcFuFuhhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplcFdFdhhL(gt2,gt3,i1)) 
coup(3) = Conjg(cplcFdFdhhR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFd Fd Propagator: hh" 
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
mass(2) = MFu(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup2(1) = cplcFuFuVZL(iIN,gt1) 
coup2(2) = cplcFuFuVZR(iIN,gt1) 
coup2(4) = Conjg(cplcFuFuVZRL(iIN,gt1)) 
coup2(3) = Conjg(cplcFuFuVZRR(iIN,gt1))  
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
Write(*,*) "Fu->Fu cFd Fd Propagator: VZ,VZR" 
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
mass(2) = MFd(gt3) 
mass(4) = MFu(gt1) 
mass(3) = -MFd(gt2) 
 
coup2(1) = cplcFuFuVZL(iIN,gt1) 
coup2(2) = cplcFuFuVZR(iIN,gt1) 
coup2(4) = Conjg(cplcFuFdcVWLmL(iIN,gt3)) 
coup2(3) = Conjg(cplcFuFdcVWLmR(iIN,gt3))  
coup2(5) = cplcFdFdVZL(gt2,gt3) 
coup2(6) = cplcFdFdVZR(gt2,gt3) 
coup2(8) = Conjg(cplcFdFuVWLmL(gt2,gt1)) 
coup2(7) = Conjg(cplcFdFuVWLmR(gt2,gt1)) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFd Fd Propagator: VZ,conj[VWLm]" 
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
mass(2) = MFd(gt3) 
mass(4) = MFu(gt1) 
mass(3) = -MFd(gt2) 
 
coup2(1) = cplcFuFuVZL(iIN,gt1) 
coup2(2) = cplcFuFuVZR(iIN,gt1) 
coup2(4) = Conjg(cplcFuFdcVWRmL(iIN,gt3)) 
coup2(3) = Conjg(cplcFuFdcVWRmR(iIN,gt3))  
coup2(5) = cplcFdFdVZL(gt2,gt3) 
coup2(6) = cplcFdFdVZR(gt2,gt3) 
coup2(8) = Conjg(cplcFdFuVWRmL(gt2,gt1)) 
coup2(7) = Conjg(cplcFdFuVWRmR(gt2,gt1)) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFd Fd Propagator: VZ,conj[VWRm]" 
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
mass(2) = MFd(gt3) 
mass(4) = MFu(gt1) 
mass(3) = -MFd(gt2) 
 
coup2(1) = cplcFuFuVZL(iIN,gt1) 
coup2(2) = cplcFuFuVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFuFdcHpmL(iIN,gt3,i2)) 
coup2(4) = Conjg(cplcFuFdcHpmR(iIN,gt3,i2))  
coup2(5) = cplcFdFdVZL(gt2,gt3) 
coup2(6) = cplcFdFdVZR(gt2,gt3) 
coup2(7) = Conjg(cplcFdFuHpmL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplcFdFuHpmR(gt2,gt1,i2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFd Fd Propagator: VZ,conj[Hpm]" 
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
mass(2) = MFu(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup2(1) = cplcFuFuVZL(iIN,gt1) 
coup2(2) = cplcFuFuVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFuFuAhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFuFuAhR(iIN,gt1,i2))  
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
Write(*,*) "Fu->Fu cFd Fd Propagator: VZ,Ah" 
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
mass(2) = MFu(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup2(1) = cplcFuFuVZL(iIN,gt1) 
coup2(2) = cplcFuFuVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFuFuhhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFuFuhhR(iIN,gt1,i2))  
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
Write(*,*) "Fu->Fu cFd Fd Propagator: VZ,hh" 
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
mass(2) = MFd(gt3) 
mass(4) = MFu(gt1) 
mass(3) = -MFd(gt2) 
 
coup2(1) = cplcFuFuVZRL(iIN,gt1) 
coup2(2) = cplcFuFuVZRR(iIN,gt1) 
coup2(4) = Conjg(cplcFuFdcVWLmL(iIN,gt3)) 
coup2(3) = Conjg(cplcFuFdcVWLmR(iIN,gt3))  
coup2(5) = cplcFdFdVZRL(gt2,gt3) 
coup2(6) = cplcFdFdVZRR(gt2,gt3) 
coup2(8) = Conjg(cplcFdFuVWLmL(gt2,gt1)) 
coup2(7) = Conjg(cplcFdFuVWLmR(gt2,gt1)) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFd Fd Propagator: VZR,conj[VWLm]" 
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
mass(2) = MFd(gt3) 
mass(4) = MFu(gt1) 
mass(3) = -MFd(gt2) 
 
coup2(1) = cplcFuFuVZRL(iIN,gt1) 
coup2(2) = cplcFuFuVZRR(iIN,gt1) 
coup2(4) = Conjg(cplcFuFdcVWRmL(iIN,gt3)) 
coup2(3) = Conjg(cplcFuFdcVWRmR(iIN,gt3))  
coup2(5) = cplcFdFdVZRL(gt2,gt3) 
coup2(6) = cplcFdFdVZRR(gt2,gt3) 
coup2(8) = Conjg(cplcFdFuVWRmL(gt2,gt1)) 
coup2(7) = Conjg(cplcFdFuVWRmR(gt2,gt1)) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFd Fd Propagator: VZR,conj[VWRm]" 
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
mass(2) = MFd(gt3) 
mass(4) = MFu(gt1) 
mass(3) = -MFd(gt2) 
 
coup2(1) = cplcFuFuVZRL(iIN,gt1) 
coup2(2) = cplcFuFuVZRR(iIN,gt1) 
coup2(3) = Conjg(cplcFuFdcHpmL(iIN,gt3,i2)) 
coup2(4) = Conjg(cplcFuFdcHpmR(iIN,gt3,i2))  
coup2(5) = cplcFdFdVZRL(gt2,gt3) 
coup2(6) = cplcFdFdVZRR(gt2,gt3) 
coup2(7) = Conjg(cplcFdFuHpmL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplcFdFuHpmR(gt2,gt1,i2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFd Fd Propagator: VZR,conj[Hpm]" 
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
mass(2) = MFu(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup2(1) = cplcFuFuVZRL(iIN,gt1) 
coup2(2) = cplcFuFuVZRR(iIN,gt1) 
coup2(3) = Conjg(cplcFuFuAhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFuFuAhR(iIN,gt1,i2))  
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
Write(*,*) "Fu->Fu cFd Fd Propagator: VZR,Ah" 
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
mass(2) = MFu(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup2(1) = cplcFuFuVZRL(iIN,gt1) 
coup2(2) = cplcFuFuVZRR(iIN,gt1) 
coup2(3) = Conjg(cplcFuFuhhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFuFuhhR(iIN,gt1,i2))  
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
Write(*,*) "Fu->Fu cFd Fd Propagator: VZR,hh" 
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
mass(2) = MFd(gt3) 
mass(3) = -MFd(gt2) 
mass(4) = MFu(gt1) 
 
coup2(1) = cplcFuFdcVWLmL(iIN,gt3) 
coup2(2) = cplcFuFdcVWLmR(iIN,gt3) 
coup2(4) = Conjg(cplcFuFdcVWRmL(iIN,gt3)) 
coup2(3) = Conjg(cplcFuFdcVWRmR(iIN,gt3))  
coup2(5) = cplcFdFuVWLmL(gt2,gt1) 
coup2(6) = cplcFdFuVWLmR(gt2,gt1) 
coup2(8) = Conjg(cplcFdFuVWRmL(gt2,gt1)) 
coup2(7) = Conjg(cplcFdFuVWRmR(gt2,gt1)) 
Call IntegrateGaugeSS(Boson4, mass, coup2, deltaM, epsI,IntegralVVss,NVVss, resR, check) 
If (resR.ne.resR) resR = 0._dp
resC = 2._dp*resR 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFd Fd Propagator: conj[VWLm],conj[VWRm]" 
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
mass(2) = MFd(gt3) 
mass(3) = -MFd(gt2) 
mass(4) = MFu(gt1) 
 
coup2(1) = cplcFuFdcVWLmL(iIN,gt3) 
coup2(2) = cplcFuFdcVWLmR(iIN,gt3) 
coup2(3) = Conjg(cplcFuFdcHpmL(iIN,gt3,i2)) 
coup2(4) = Conjg(cplcFuFdcHpmR(iIN,gt3,i2))  
coup2(5) = cplcFdFuVWLmL(gt2,gt1) 
coup2(6) = cplcFdFuVWLmR(gt2,gt1) 
coup2(7) = Conjg(cplcFdFuHpmL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplcFdFuHpmR(gt2,gt1,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFd Fd Propagator: conj[VWLm],conj[Hpm]" 
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
mass(2) = MFu(gt1) 
mass(4) = MFd(gt3) 
mass(3) = -MFd(gt2) 
 
coup2(1) = cplcFuFdcVWLmL(iIN,gt3) 
coup2(2) = cplcFuFdcVWLmR(iIN,gt3) 
coup2(3) = Conjg(cplcFuFuAhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFuFuAhR(iIN,gt1,i2))  
coup2(5) = cplcFdFuVWLmL(gt2,gt1) 
coup2(6) = cplcFdFuVWLmR(gt2,gt1) 
coup2(7) = Conjg(cplcFdFdAhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFdFdAhR(gt2,gt3,i2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFd Fd Propagator: conj[VWLm],Ah" 
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
mass(2) = MFu(gt1) 
mass(4) = MFd(gt3) 
mass(3) = -MFd(gt2) 
 
coup2(1) = cplcFuFdcVWLmL(iIN,gt3) 
coup2(2) = cplcFuFdcVWLmR(iIN,gt3) 
coup2(3) = Conjg(cplcFuFuhhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFuFuhhR(iIN,gt1,i2))  
coup2(5) = cplcFdFuVWLmL(gt2,gt1) 
coup2(6) = cplcFdFuVWLmR(gt2,gt1) 
coup2(7) = Conjg(cplcFdFdhhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFdFdhhR(gt2,gt3,i2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFd Fd Propagator: conj[VWLm],hh" 
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
mass(2) = MFd(gt3) 
mass(3) = -MFd(gt2) 
mass(4) = MFu(gt1) 
 
coup2(1) = cplcFuFdcVWRmL(iIN,gt3) 
coup2(2) = cplcFuFdcVWRmR(iIN,gt3) 
coup2(3) = Conjg(cplcFuFdcHpmL(iIN,gt3,i2)) 
coup2(4) = Conjg(cplcFuFdcHpmR(iIN,gt3,i2))  
coup2(5) = cplcFdFuVWRmL(gt2,gt1) 
coup2(6) = cplcFdFuVWRmR(gt2,gt1) 
coup2(7) = Conjg(cplcFdFuHpmL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplcFdFuHpmR(gt2,gt1,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFd Fd Propagator: conj[VWRm],conj[Hpm]" 
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
mass(2) = MFu(gt1) 
mass(4) = MFd(gt3) 
mass(3) = -MFd(gt2) 
 
coup2(1) = cplcFuFdcVWRmL(iIN,gt3) 
coup2(2) = cplcFuFdcVWRmR(iIN,gt3) 
coup2(3) = Conjg(cplcFuFuAhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFuFuAhR(iIN,gt1,i2))  
coup2(5) = cplcFdFuVWRmL(gt2,gt1) 
coup2(6) = cplcFdFuVWRmR(gt2,gt1) 
coup2(7) = Conjg(cplcFdFdAhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFdFdAhR(gt2,gt3,i2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFd Fd Propagator: conj[VWRm],Ah" 
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
mass(2) = MFu(gt1) 
mass(4) = MFd(gt3) 
mass(3) = -MFd(gt2) 
 
coup2(1) = cplcFuFdcVWRmL(iIN,gt3) 
coup2(2) = cplcFuFdcVWRmR(iIN,gt3) 
coup2(3) = Conjg(cplcFuFuhhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFuFuhhR(iIN,gt1,i2))  
coup2(5) = cplcFdFuVWRmL(gt2,gt1) 
coup2(6) = cplcFdFuVWRmR(gt2,gt1) 
coup2(7) = Conjg(cplcFdFdhhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFdFdhhR(gt2,gt3,i2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFd Fd Propagator: conj[VWRm],hh" 
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
mass(2) = MFd(gt3) 
mass(3) = -MFd(gt2) 
mass(4) = MFu(gt1) 
 
coup2(1) = cplcFuFdcHpmL(iIN,gt3,i1) 
coup2(2) = cplcFuFdcHpmR(iIN,gt3,i1) 
coup2(3) = Conjg(cplcFuFdcHpmL(iIN,gt3,i2)) 
coup2(4) = Conjg(cplcFuFdcHpmR(iIN,gt3,i2))  
coup2(5) = cplcFdFuHpmL(gt2,gt1,i1) 
coup2(6) = cplcFdFuHpmR(gt2,gt1,i1) 
coup2(7) = Conjg(cplcFdFuHpmL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplcFdFuHpmR(gt2,gt1,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFd Fd Propagator: conj[Hpm],conj[Hpm]" 
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
mass(2) = MFu(gt1) 
mass(4) = MFd(gt3) 
mass(3) = -MFd(gt2) 
 
coup2(1) = cplcFuFdcHpmL(iIN,gt3,i1) 
coup2(2) = cplcFuFdcHpmR(iIN,gt3,i1) 
coup2(3) = Conjg(cplcFuFuAhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFuFuAhR(iIN,gt1,i2))  
coup2(5) = cplcFdFuHpmL(gt2,gt1,i1) 
coup2(6) = cplcFdFuHpmR(gt2,gt1,i1) 
coup2(7) = Conjg(cplcFdFdAhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFdFdAhR(gt2,gt3,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFd Fd Propagator: conj[Hpm],Ah" 
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
mass(2) = MFu(gt1) 
mass(4) = MFd(gt3) 
mass(3) = -MFd(gt2) 
 
coup2(1) = cplcFuFdcHpmL(iIN,gt3,i1) 
coup2(2) = cplcFuFdcHpmR(iIN,gt3,i1) 
coup2(3) = Conjg(cplcFuFuhhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFuFuhhR(iIN,gt1,i2))  
coup2(5) = cplcFdFuHpmL(gt2,gt1,i1) 
coup2(6) = cplcFdFuHpmR(gt2,gt1,i1) 
coup2(7) = Conjg(cplcFdFdhhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFdFdhhR(gt2,gt3,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFd Fd Propagator: conj[Hpm],hh" 
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
mass(2) = MFu(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup2(1) = cplcFuFuAhL(iIN,gt1,i1) 
coup2(2) = cplcFuFuAhR(iIN,gt1,i1) 
coup2(3) = Conjg(cplcFuFuAhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFuFuAhR(iIN,gt1,i2))  
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
Write(*,*) "Fu->Fu cFd Fd Propagator: Ah,Ah" 
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
mass(2) = MFu(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup2(1) = cplcFuFuAhL(iIN,gt1,i1) 
coup2(2) = cplcFuFuAhR(iIN,gt1,i1) 
coup2(3) = Conjg(cplcFuFuhhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFuFuhhR(iIN,gt1,i2))  
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
Write(*,*) "Fu->Fu cFd Fd Propagator: Ah,hh" 
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
mass(2) = MFu(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup2(1) = cplcFuFuhhL(iIN,gt1,i1) 
coup2(2) = cplcFuFuhhR(iIN,gt1,i1) 
coup2(3) = Conjg(cplcFuFuhhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFuFuhhR(iIN,gt1,i2))  
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
Write(*,*) "Fu->Fu cFd Fd Propagator: hh,hh" 
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
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:169))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
  g = oo512pi3 / Abs(MFu(iIN))**3*g
End Subroutine FuToFucFdFd 
 
 
Subroutine FuToFucFeFe(iIN,MFu,MFe,MVZ,MVZR,MAh,Mhh,cplcFeFeAhL,cplcFeFeAhR,          & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZRL,cplcFeFeVZRR,             & 
& cplcFuFuAhL,cplcFuFuAhR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcFuFuVZRL,cplcFuFuVZRR,IntegralSs,IntegralSSss,IntegralVs,IntegralVSss,             & 
& IntegralVVss,NSs,NSSss,NVs,NVSss,NVVss,gTVZ,gTVZR,gTAh,gThh,deltaM,epsI,               & 
& check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFu(3),MFe(3),MVZ,MVZR,MAh(3),Mhh(3)

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
mass(1) = MFu(iIN) 
 
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
 
If(Abs(MFu(iIN)).gt.(Abs(MFe(gt3))+Abs(MFe(gt2))+Abs(MFu(gt1)))) Then 
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
 
mass(2) = MFu(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup(2) = Conjg(cplcFuFuVZL(iIN,gt1)) 
coup(1) = Conjg(cplcFuFuVZR(iIN,gt1)) 
coup(4) = Conjg(cplcFeFeVZL(gt2,gt3)) 
coup(3) = Conjg(cplcFeFeVZR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFe Fe Propagator: VZ" 
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
 
mass(2) = MFu(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup(2) = Conjg(cplcFuFuVZRL(iIN,gt1)) 
coup(1) = Conjg(cplcFuFuVZRR(iIN,gt1)) 
coup(4) = Conjg(cplcFeFeVZRL(gt2,gt3)) 
coup(3) = Conjg(cplcFeFeVZRR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFe Fe Propagator: VZR" 
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
 
mass(2) = MFu(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup(2) = Conjg(cplcFuFuAhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcFuFuAhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplcFeFeAhL(gt2,gt3,i1)) 
coup(3) = Conjg(cplcFeFeAhR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFe Fe Propagator: Ah" 
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
 
mass(2) = MFu(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup(2) = Conjg(cplcFuFuhhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcFuFuhhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplcFeFehhL(gt2,gt3,i1)) 
coup(3) = Conjg(cplcFeFehhR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFe Fe Propagator: hh" 
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
mass(2) = MFu(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplcFuFuVZL(iIN,gt1) 
coup2(2) = cplcFuFuVZR(iIN,gt1) 
coup2(4) = Conjg(cplcFuFuVZRL(iIN,gt1)) 
coup2(3) = Conjg(cplcFuFuVZRR(iIN,gt1))  
coup2(5) = cplcFeFeVZL(gt2,gt3) 
coup2(6) = cplcFeFeVZR(gt2,gt3) 
coup2(8) = Conjg(cplcFeFeVZRL(gt2,gt3)) 
coup2(7) = Conjg(cplcFeFeVZRR(gt2,gt3)) 
Call IntegrateGaugeSS(Boson4, mass, coup2, deltaM, epsI,IntegralVVss,NVVss, resR, check) 
If (resR.ne.resR) resR = 0._dp
resC = 2._dp*resR 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFe Fe Propagator: VZ,VZR" 
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
mass(2) = MFu(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplcFuFuVZL(iIN,gt1) 
coup2(2) = cplcFuFuVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFuFuAhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFuFuAhR(iIN,gt1,i2))  
coup2(5) = cplcFeFeVZL(gt2,gt3) 
coup2(6) = cplcFeFeVZR(gt2,gt3) 
coup2(7) = Conjg(cplcFeFeAhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFeFeAhR(gt2,gt3,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFe Fe Propagator: VZ,Ah" 
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
mass(2) = MFu(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplcFuFuVZL(iIN,gt1) 
coup2(2) = cplcFuFuVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFuFuhhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFuFuhhR(iIN,gt1,i2))  
coup2(5) = cplcFeFeVZL(gt2,gt3) 
coup2(6) = cplcFeFeVZR(gt2,gt3) 
coup2(7) = Conjg(cplcFeFehhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFeFehhR(gt2,gt3,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFe Fe Propagator: VZ,hh" 
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
mass(2) = MFu(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplcFuFuVZRL(iIN,gt1) 
coup2(2) = cplcFuFuVZRR(iIN,gt1) 
coup2(3) = Conjg(cplcFuFuAhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFuFuAhR(iIN,gt1,i2))  
coup2(5) = cplcFeFeVZRL(gt2,gt3) 
coup2(6) = cplcFeFeVZRR(gt2,gt3) 
coup2(7) = Conjg(cplcFeFeAhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFeFeAhR(gt2,gt3,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFe Fe Propagator: VZR,Ah" 
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
mass(2) = MFu(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplcFuFuVZRL(iIN,gt1) 
coup2(2) = cplcFuFuVZRR(iIN,gt1) 
coup2(3) = Conjg(cplcFuFuhhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFuFuhhR(iIN,gt1,i2))  
coup2(5) = cplcFeFeVZRL(gt2,gt3) 
coup2(6) = cplcFeFeVZRR(gt2,gt3) 
coup2(7) = Conjg(cplcFeFehhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFeFehhR(gt2,gt3,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFe Fe Propagator: VZR,hh" 
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
mass(2) = MFu(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplcFuFuAhL(iIN,gt1,i1) 
coup2(2) = cplcFuFuAhR(iIN,gt1,i1) 
coup2(3) = Conjg(cplcFuFuAhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFuFuAhR(iIN,gt1,i2))  
coup2(5) = cplcFeFeAhL(gt2,gt3,i1) 
coup2(6) = cplcFeFeAhR(gt2,gt3,i1) 
coup2(7) = Conjg(cplcFeFeAhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFeFeAhR(gt2,gt3,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFe Fe Propagator: Ah,Ah" 
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
mass(2) = MFu(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplcFuFuAhL(iIN,gt1,i1) 
coup2(2) = cplcFuFuAhR(iIN,gt1,i1) 
coup2(3) = Conjg(cplcFuFuhhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFuFuhhR(iIN,gt1,i2))  
coup2(5) = cplcFeFeAhL(gt2,gt3,i1) 
coup2(6) = cplcFeFeAhR(gt2,gt3,i1) 
coup2(7) = Conjg(cplcFeFehhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFeFehhR(gt2,gt3,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFe Fe Propagator: Ah,hh" 
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
mass(2) = MFu(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplcFuFuhhL(iIN,gt1,i1) 
coup2(2) = cplcFuFuhhR(iIN,gt1,i1) 
coup2(3) = Conjg(cplcFuFuhhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFuFuhhR(iIN,gt1,i2))  
coup2(5) = cplcFeFehhL(gt2,gt3,i1) 
coup2(6) = cplcFeFehhR(gt2,gt3,i1) 
coup2(7) = Conjg(cplcFeFehhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFeFehhR(gt2,gt3,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFe Fe Propagator: hh,hh" 
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
  g = oo512pi3 / Abs(MFu(iIN))**3*g
End Subroutine FuToFucFeFe 
 
 
Subroutine FuToFucFuFu(iIN,MFu,MVZ,MVZR,MAh,Mhh,cplcFuFuAhL,cplcFuFuAhR,              & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZRL,cplcFuFuVZRR,             & 
& IntegralSs,IntegralSSss,IntegralSSst,IntegralVs,IntegralVSss,IntegralVSst,             & 
& IntegralVVss,IntegralVVst,NSs,NSSss,NSSst,NVs,NVSss,NVSst,NVVss,NVVst,gTVZ,            & 
& gTVZR,gTAh,gThh,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFu(3),MVZ,MVZR,MAh(3),Mhh(3)

Complex(dp),Intent(in) :: cplcFuFuAhL(3,3,3),cplcFuFuAhR(3,3,3),cplcFuFuhhL(3,3,3),cplcFuFuhhR(3,3,3),          & 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcFuFuVZRL(3,3),cplcFuFuVZRR(3,3)

Real(dp),Intent(inout) :: IntegralSs(500000,10),IntegralVs(25000,9),IntegralVVss(500000,12)

Complex(dp),Intent(inout) :: IntegralSSss(500000,12),IntegralSSst(500000,16),IntegralVSss(500000,12),              & 
& IntegralVSst(500000,16),IntegralVVst(25000,12)

Real(dp),Intent(inout) :: gTVZ,gTVZR,gTAh(3),gThh(3)

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
mass(1) = MFu(iIN) 
 
Isum = 64 
Allocate( gSum(3,3,3, Isum) ) 
Allocate( Contribution(3,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1, iIN-1
      Do gt2=1,3
        Do gt3=gt1, iIN-1
Isum = 0 
 
If(Abs(MFu(iIN)).gt.(Abs(MFu(gt3))+Abs(MFu(gt2))+Abs(MFu(gt1)))) Then 
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
 
mass(2) = MFu(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup(2) = Conjg(cplcFuFuVZL(iIN,gt1)) 
coup(1) = Conjg(cplcFuFuVZR(iIN,gt1)) 
coup(4) = Conjg(cplcFuFuVZL(gt2,gt3)) 
coup(3) = Conjg(cplcFuFuVZR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 3*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFu(gt3) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt1) 
 
coup(2) = Conjg(cplcFuFuVZL(iIN,gt3)) 
coup(1) = Conjg(cplcFuFuVZR(iIN,gt3)) 
coup(4) = Conjg(cplcFuFuVZL(gt2,gt1)) 
coup(3) = Conjg(cplcFuFuVZR(gt2,gt1))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 3*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFu(gt1) 
mass(4) = MFu(gt3) 
mass(3) = -MFu(gt2) 
 
coup2(1) = cplcFuFuVZL(iIN,gt3) 
coup2(2) = cplcFuFuVZR(iIN,gt3) 
coup2(4) = Conjg(cplcFuFuVZL(iIN,gt1)) 
coup2(3) = Conjg(cplcFuFuVZR(iIN,gt1))  
coup2(5) = cplcFuFuVZL(gt2,gt1) 
coup2(6) = cplcFuFuVZR(gt2,gt1) 
coup2(8) = Conjg(cplcFuFuVZL(gt2,gt3)) 
coup2(7) = Conjg(cplcFuFuVZR(gt2,gt3)) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFu Fu Propagator: VZ" 
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
 
mass(2) = MFu(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup(2) = Conjg(cplcFuFuVZRL(iIN,gt1)) 
coup(1) = Conjg(cplcFuFuVZRR(iIN,gt1)) 
coup(4) = Conjg(cplcFuFuVZRL(gt2,gt3)) 
coup(3) = Conjg(cplcFuFuVZRR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 3*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFu(gt3) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt1) 
 
coup(2) = Conjg(cplcFuFuVZRL(iIN,gt3)) 
coup(1) = Conjg(cplcFuFuVZRR(iIN,gt3)) 
coup(4) = Conjg(cplcFuFuVZRL(gt2,gt1)) 
coup(3) = Conjg(cplcFuFuVZRR(gt2,gt1))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 3*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFu(gt1) 
mass(4) = MFu(gt3) 
mass(3) = -MFu(gt2) 
 
coup2(1) = cplcFuFuVZRL(iIN,gt3) 
coup2(2) = cplcFuFuVZRR(iIN,gt3) 
coup2(4) = Conjg(cplcFuFuVZRL(iIN,gt1)) 
coup2(3) = Conjg(cplcFuFuVZRR(iIN,gt1))  
coup2(5) = cplcFuFuVZRL(gt2,gt1) 
coup2(6) = cplcFuFuVZRR(gt2,gt1) 
coup2(8) = Conjg(cplcFuFuVZRL(gt2,gt3)) 
coup2(7) = Conjg(cplcFuFuVZRR(gt2,gt3)) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFu Fu Propagator: VZR" 
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
 
mass(2) = MFu(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup(2) = Conjg(cplcFuFuAhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcFuFuAhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplcFuFuAhL(gt2,gt3,i1)) 
coup(3) = Conjg(cplcFuFuAhR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 3*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFu(gt3) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt1) 
 
coup(2) = Conjg(cplcFuFuAhL(iIN,gt3,i1)) 
coup(1) = Conjg(cplcFuFuAhR(iIN,gt3,i1)) 
coup(4) = Conjg(cplcFuFuAhL(gt2,gt1,i1)) 
coup(3) = Conjg(cplcFuFuAhR(gt2,gt1,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 3*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFu(gt1) 
mass(4) = MFu(gt3) 
mass(3) = -MFu(gt2) 
 
coup2(1) = cplcFuFuAhL(iIN,gt3,i1) 
coup2(2) = cplcFuFuAhR(iIN,gt3,i1) 
coup2(3) = Conjg(cplcFuFuAhL(iIN,gt1,i1)) 
coup2(4) = Conjg(cplcFuFuAhR(iIN,gt1,i1))  
coup2(5) = cplcFuFuAhL(gt2,gt1,i1) 
coup2(6) = cplcFuFuAhR(gt2,gt1,i1) 
coup2(7) = Conjg(cplcFuFuAhL(gt2,gt3,i1)) 
coup2(8) = Conjg(cplcFuFuAhR(gt2,gt3,i1)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFu Fu Propagator: Ah" 
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
 
mass(2) = MFu(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup(2) = Conjg(cplcFuFuhhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcFuFuhhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplcFuFuhhL(gt2,gt3,i1)) 
coup(3) = Conjg(cplcFuFuhhR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 3*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFu(gt3) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt1) 
 
coup(2) = Conjg(cplcFuFuhhL(iIN,gt3,i1)) 
coup(1) = Conjg(cplcFuFuhhR(iIN,gt3,i1)) 
coup(4) = Conjg(cplcFuFuhhL(gt2,gt1,i1)) 
coup(3) = Conjg(cplcFuFuhhR(gt2,gt1,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 3*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFu(gt1) 
mass(4) = MFu(gt3) 
mass(3) = -MFu(gt2) 
 
coup2(1) = cplcFuFuhhL(iIN,gt3,i1) 
coup2(2) = cplcFuFuhhR(iIN,gt3,i1) 
coup2(3) = Conjg(cplcFuFuhhL(iIN,gt1,i1)) 
coup2(4) = Conjg(cplcFuFuhhR(iIN,gt1,i1))  
coup2(5) = cplcFuFuhhL(gt2,gt1,i1) 
coup2(6) = cplcFuFuhhR(gt2,gt1,i1) 
coup2(7) = Conjg(cplcFuFuhhL(gt2,gt3,i1)) 
coup2(8) = Conjg(cplcFuFuhhR(gt2,gt3,i1)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFu Fu Propagator: hh" 
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
mass(2) = MFu(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup2(1) = cplcFuFuVZL(iIN,gt1) 
coup2(2) = cplcFuFuVZR(iIN,gt1) 
coup2(4) = Conjg(cplcFuFuVZRL(iIN,gt1)) 
coup2(3) = Conjg(cplcFuFuVZRR(iIN,gt1))  
coup2(5) = cplcFuFuVZL(gt2,gt3) 
coup2(6) = cplcFuFuVZR(gt2,gt3) 
coup2(8) = Conjg(cplcFuFuVZRL(gt2,gt3)) 
coup2(7) = Conjg(cplcFuFuVZRR(gt2,gt3)) 
Call IntegrateGaugeSS(Boson4, mass, coup2, deltaM, epsI,IntegralVVss,NVVss, resR, check) 
If (resR.ne.resR) resR = 0._dp
resC = 2._dp*resR 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFu(gt1) 
mass(4) = MFu(gt3) 
mass(3) = -MFu(gt2) 
 
coup2(1) = cplcFuFuVZL(iIN,gt3) 
coup2(2) = cplcFuFuVZR(iIN,gt3) 
coup2(4) = Conjg(cplcFuFuVZRL(iIN,gt1)) 
coup2(3) = Conjg(cplcFuFuVZRR(iIN,gt1))  
coup2(5) = cplcFuFuVZL(gt2,gt1) 
coup2(6) = cplcFuFuVZR(gt2,gt1) 
coup2(8) = Conjg(cplcFuFuVZRL(gt2,gt3)) 
coup2(7) = Conjg(cplcFuFuVZRR(gt2,gt3)) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFu(gt3) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt1) 
 
coup2(1) = cplcFuFuVZL(iIN,gt3) 
coup2(2) = cplcFuFuVZR(iIN,gt3) 
coup2(4) = Conjg(cplcFuFuVZRL(iIN,gt3)) 
coup2(3) = Conjg(cplcFuFuVZRR(iIN,gt3))  
coup2(5) = cplcFuFuVZL(gt2,gt1) 
coup2(6) = cplcFuFuVZR(gt2,gt1) 
coup2(8) = Conjg(cplcFuFuVZRL(gt2,gt1)) 
coup2(7) = Conjg(cplcFuFuVZRR(gt2,gt1)) 
Call IntegrateGaugeSS(Boson4, mass, coup2, deltaM, epsI,IntegralVVss,NVVss, resR, check) 
If (resR.ne.resR) resR = 0._dp
resC = 2._dp*resR 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFu(gt3) 
mass(4) = MFu(gt1) 
mass(3) = -MFu(gt2) 
 
coup2(1) = cplcFuFuVZL(iIN,gt1) 
coup2(2) = cplcFuFuVZR(iIN,gt1) 
coup2(4) = Conjg(cplcFuFuVZRL(iIN,gt3)) 
coup2(3) = Conjg(cplcFuFuVZRR(iIN,gt3))  
coup2(5) = cplcFuFuVZL(gt2,gt3) 
coup2(6) = cplcFuFuVZR(gt2,gt3) 
coup2(8) = Conjg(cplcFuFuVZRL(gt2,gt1)) 
coup2(7) = Conjg(cplcFuFuVZRR(gt2,gt1)) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFu Fu Propagator: VZ,VZR" 
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
mass(2) = MFu(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup2(1) = cplcFuFuVZL(iIN,gt1) 
coup2(2) = cplcFuFuVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFuFuAhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFuFuAhR(iIN,gt1,i2))  
coup2(5) = cplcFuFuVZL(gt2,gt3) 
coup2(6) = cplcFuFuVZR(gt2,gt3) 
coup2(7) = Conjg(cplcFuFuAhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFuFuAhR(gt2,gt3,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFu(gt1) 
mass(4) = MFu(gt3) 
mass(3) = -MFu(gt2) 
 
coup2(1) = cplcFuFuVZL(iIN,gt3) 
coup2(2) = cplcFuFuVZR(iIN,gt3) 
coup2(3) = Conjg(cplcFuFuAhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFuFuAhR(iIN,gt1,i2))  
coup2(5) = cplcFuFuVZL(gt2,gt1) 
coup2(6) = cplcFuFuVZR(gt2,gt1) 
coup2(7) = Conjg(cplcFuFuAhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFuFuAhR(gt2,gt3,i2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFu(gt3) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt1) 
 
coup2(1) = cplcFuFuVZL(iIN,gt3) 
coup2(2) = cplcFuFuVZR(iIN,gt3) 
coup2(3) = Conjg(cplcFuFuAhL(iIN,gt3,i2)) 
coup2(4) = Conjg(cplcFuFuAhR(iIN,gt3,i2))  
coup2(5) = cplcFuFuVZL(gt2,gt1) 
coup2(6) = cplcFuFuVZR(gt2,gt1) 
coup2(7) = Conjg(cplcFuFuAhL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplcFuFuAhR(gt2,gt1,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFu(gt3) 
mass(4) = MFu(gt1) 
mass(3) = -MFu(gt2) 
 
coup2(1) = cplcFuFuVZL(iIN,gt1) 
coup2(2) = cplcFuFuVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFuFuAhL(iIN,gt3,i2)) 
coup2(4) = Conjg(cplcFuFuAhR(iIN,gt3,i2))  
coup2(5) = cplcFuFuVZL(gt2,gt3) 
coup2(6) = cplcFuFuVZR(gt2,gt3) 
coup2(7) = Conjg(cplcFuFuAhL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplcFuFuAhR(gt2,gt1,i2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFu Fu Propagator: VZ,Ah" 
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
mass(2) = MFu(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup2(1) = cplcFuFuVZL(iIN,gt1) 
coup2(2) = cplcFuFuVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFuFuhhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFuFuhhR(iIN,gt1,i2))  
coup2(5) = cplcFuFuVZL(gt2,gt3) 
coup2(6) = cplcFuFuVZR(gt2,gt3) 
coup2(7) = Conjg(cplcFuFuhhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFuFuhhR(gt2,gt3,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFu(gt1) 
mass(4) = MFu(gt3) 
mass(3) = -MFu(gt2) 
 
coup2(1) = cplcFuFuVZL(iIN,gt3) 
coup2(2) = cplcFuFuVZR(iIN,gt3) 
coup2(3) = Conjg(cplcFuFuhhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFuFuhhR(iIN,gt1,i2))  
coup2(5) = cplcFuFuVZL(gt2,gt1) 
coup2(6) = cplcFuFuVZR(gt2,gt1) 
coup2(7) = Conjg(cplcFuFuhhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFuFuhhR(gt2,gt3,i2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFu(gt3) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt1) 
 
coup2(1) = cplcFuFuVZL(iIN,gt3) 
coup2(2) = cplcFuFuVZR(iIN,gt3) 
coup2(3) = Conjg(cplcFuFuhhL(iIN,gt3,i2)) 
coup2(4) = Conjg(cplcFuFuhhR(iIN,gt3,i2))  
coup2(5) = cplcFuFuVZL(gt2,gt1) 
coup2(6) = cplcFuFuVZR(gt2,gt1) 
coup2(7) = Conjg(cplcFuFuhhL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplcFuFuhhR(gt2,gt1,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFu(gt3) 
mass(4) = MFu(gt1) 
mass(3) = -MFu(gt2) 
 
coup2(1) = cplcFuFuVZL(iIN,gt1) 
coup2(2) = cplcFuFuVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFuFuhhL(iIN,gt3,i2)) 
coup2(4) = Conjg(cplcFuFuhhR(iIN,gt3,i2))  
coup2(5) = cplcFuFuVZL(gt2,gt3) 
coup2(6) = cplcFuFuVZR(gt2,gt3) 
coup2(7) = Conjg(cplcFuFuhhL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplcFuFuhhR(gt2,gt1,i2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFu Fu Propagator: VZ,hh" 
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
mass(2) = MFu(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup2(1) = cplcFuFuVZRL(iIN,gt1) 
coup2(2) = cplcFuFuVZRR(iIN,gt1) 
coup2(3) = Conjg(cplcFuFuAhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFuFuAhR(iIN,gt1,i2))  
coup2(5) = cplcFuFuVZRL(gt2,gt3) 
coup2(6) = cplcFuFuVZRR(gt2,gt3) 
coup2(7) = Conjg(cplcFuFuAhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFuFuAhR(gt2,gt3,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFu(gt1) 
mass(4) = MFu(gt3) 
mass(3) = -MFu(gt2) 
 
coup2(1) = cplcFuFuVZRL(iIN,gt3) 
coup2(2) = cplcFuFuVZRR(iIN,gt3) 
coup2(3) = Conjg(cplcFuFuAhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFuFuAhR(iIN,gt1,i2))  
coup2(5) = cplcFuFuVZRL(gt2,gt1) 
coup2(6) = cplcFuFuVZRR(gt2,gt1) 
coup2(7) = Conjg(cplcFuFuAhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFuFuAhR(gt2,gt3,i2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFu(gt3) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt1) 
 
coup2(1) = cplcFuFuVZRL(iIN,gt3) 
coup2(2) = cplcFuFuVZRR(iIN,gt3) 
coup2(3) = Conjg(cplcFuFuAhL(iIN,gt3,i2)) 
coup2(4) = Conjg(cplcFuFuAhR(iIN,gt3,i2))  
coup2(5) = cplcFuFuVZRL(gt2,gt1) 
coup2(6) = cplcFuFuVZRR(gt2,gt1) 
coup2(7) = Conjg(cplcFuFuAhL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplcFuFuAhR(gt2,gt1,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFu(gt3) 
mass(4) = MFu(gt1) 
mass(3) = -MFu(gt2) 
 
coup2(1) = cplcFuFuVZRL(iIN,gt1) 
coup2(2) = cplcFuFuVZRR(iIN,gt1) 
coup2(3) = Conjg(cplcFuFuAhL(iIN,gt3,i2)) 
coup2(4) = Conjg(cplcFuFuAhR(iIN,gt3,i2))  
coup2(5) = cplcFuFuVZRL(gt2,gt3) 
coup2(6) = cplcFuFuVZRR(gt2,gt3) 
coup2(7) = Conjg(cplcFuFuAhL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplcFuFuAhR(gt2,gt1,i2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFu Fu Propagator: VZR,Ah" 
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
mass(2) = MFu(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup2(1) = cplcFuFuVZRL(iIN,gt1) 
coup2(2) = cplcFuFuVZRR(iIN,gt1) 
coup2(3) = Conjg(cplcFuFuhhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFuFuhhR(iIN,gt1,i2))  
coup2(5) = cplcFuFuVZRL(gt2,gt3) 
coup2(6) = cplcFuFuVZRR(gt2,gt3) 
coup2(7) = Conjg(cplcFuFuhhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFuFuhhR(gt2,gt3,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFu(gt1) 
mass(4) = MFu(gt3) 
mass(3) = -MFu(gt2) 
 
coup2(1) = cplcFuFuVZRL(iIN,gt3) 
coup2(2) = cplcFuFuVZRR(iIN,gt3) 
coup2(3) = Conjg(cplcFuFuhhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFuFuhhR(iIN,gt1,i2))  
coup2(5) = cplcFuFuVZRL(gt2,gt1) 
coup2(6) = cplcFuFuVZRR(gt2,gt1) 
coup2(7) = Conjg(cplcFuFuhhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFuFuhhR(gt2,gt3,i2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFu(gt3) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt1) 
 
coup2(1) = cplcFuFuVZRL(iIN,gt3) 
coup2(2) = cplcFuFuVZRR(iIN,gt3) 
coup2(3) = Conjg(cplcFuFuhhL(iIN,gt3,i2)) 
coup2(4) = Conjg(cplcFuFuhhR(iIN,gt3,i2))  
coup2(5) = cplcFuFuVZRL(gt2,gt1) 
coup2(6) = cplcFuFuVZRR(gt2,gt1) 
coup2(7) = Conjg(cplcFuFuhhL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplcFuFuhhR(gt2,gt1,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFu(gt3) 
mass(4) = MFu(gt1) 
mass(3) = -MFu(gt2) 
 
coup2(1) = cplcFuFuVZRL(iIN,gt1) 
coup2(2) = cplcFuFuVZRR(iIN,gt1) 
coup2(3) = Conjg(cplcFuFuhhL(iIN,gt3,i2)) 
coup2(4) = Conjg(cplcFuFuhhR(iIN,gt3,i2))  
coup2(5) = cplcFuFuVZRL(gt2,gt3) 
coup2(6) = cplcFuFuVZRR(gt2,gt3) 
coup2(7) = Conjg(cplcFuFuhhL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplcFuFuhhR(gt2,gt1,i2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFu Fu Propagator: VZR,hh" 
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
mass(2) = MFu(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup2(1) = cplcFuFuAhL(iIN,gt1,i1) 
coup2(2) = cplcFuFuAhR(iIN,gt1,i1) 
coup2(3) = Conjg(cplcFuFuAhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFuFuAhR(iIN,gt1,i2))  
coup2(5) = cplcFuFuAhL(gt2,gt3,i1) 
coup2(6) = cplcFuFuAhR(gt2,gt3,i1) 
coup2(7) = Conjg(cplcFuFuAhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFuFuAhR(gt2,gt3,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFu(gt1) 
mass(4) = MFu(gt3) 
mass(3) = -MFu(gt2) 
 
coup2(1) = cplcFuFuAhL(iIN,gt3,i1) 
coup2(2) = cplcFuFuAhR(iIN,gt3,i1) 
coup2(3) = Conjg(cplcFuFuAhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFuFuAhR(iIN,gt1,i2))  
coup2(5) = cplcFuFuAhL(gt2,gt1,i1) 
coup2(6) = cplcFuFuAhR(gt2,gt1,i1) 
coup2(7) = Conjg(cplcFuFuAhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFuFuAhR(gt2,gt3,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFu(gt3) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt1) 
 
coup2(1) = cplcFuFuAhL(iIN,gt3,i1) 
coup2(2) = cplcFuFuAhR(iIN,gt3,i1) 
coup2(3) = Conjg(cplcFuFuAhL(iIN,gt3,i2)) 
coup2(4) = Conjg(cplcFuFuAhR(iIN,gt3,i2))  
coup2(5) = cplcFuFuAhL(gt2,gt1,i1) 
coup2(6) = cplcFuFuAhR(gt2,gt1,i1) 
coup2(7) = Conjg(cplcFuFuAhL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplcFuFuAhR(gt2,gt1,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFu(gt3) 
mass(4) = MFu(gt1) 
mass(3) = -MFu(gt2) 
 
coup2(1) = cplcFuFuAhL(iIN,gt1,i1) 
coup2(2) = cplcFuFuAhR(iIN,gt1,i1) 
coup2(3) = Conjg(cplcFuFuAhL(iIN,gt3,i2)) 
coup2(4) = Conjg(cplcFuFuAhR(iIN,gt3,i2))  
coup2(5) = cplcFuFuAhL(gt2,gt3,i1) 
coup2(6) = cplcFuFuAhR(gt2,gt3,i1) 
coup2(7) = Conjg(cplcFuFuAhL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplcFuFuAhR(gt2,gt1,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFu Fu Propagator: Ah,Ah" 
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
mass(2) = MFu(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup2(1) = cplcFuFuAhL(iIN,gt1,i1) 
coup2(2) = cplcFuFuAhR(iIN,gt1,i1) 
coup2(3) = Conjg(cplcFuFuhhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFuFuhhR(iIN,gt1,i2))  
coup2(5) = cplcFuFuAhL(gt2,gt3,i1) 
coup2(6) = cplcFuFuAhR(gt2,gt3,i1) 
coup2(7) = Conjg(cplcFuFuhhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFuFuhhR(gt2,gt3,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFu(gt1) 
mass(4) = MFu(gt3) 
mass(3) = -MFu(gt2) 
 
coup2(1) = cplcFuFuAhL(iIN,gt3,i1) 
coup2(2) = cplcFuFuAhR(iIN,gt3,i1) 
coup2(3) = Conjg(cplcFuFuhhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFuFuhhR(iIN,gt1,i2))  
coup2(5) = cplcFuFuAhL(gt2,gt1,i1) 
coup2(6) = cplcFuFuAhR(gt2,gt1,i1) 
coup2(7) = Conjg(cplcFuFuhhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFuFuhhR(gt2,gt3,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFu(gt3) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt1) 
 
coup2(1) = cplcFuFuAhL(iIN,gt3,i1) 
coup2(2) = cplcFuFuAhR(iIN,gt3,i1) 
coup2(3) = Conjg(cplcFuFuhhL(iIN,gt3,i2)) 
coup2(4) = Conjg(cplcFuFuhhR(iIN,gt3,i2))  
coup2(5) = cplcFuFuAhL(gt2,gt1,i1) 
coup2(6) = cplcFuFuAhR(gt2,gt1,i1) 
coup2(7) = Conjg(cplcFuFuhhL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplcFuFuhhR(gt2,gt1,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFu(gt3) 
mass(4) = MFu(gt1) 
mass(3) = -MFu(gt2) 
 
coup2(1) = cplcFuFuAhL(iIN,gt1,i1) 
coup2(2) = cplcFuFuAhR(iIN,gt1,i1) 
coup2(3) = Conjg(cplcFuFuhhL(iIN,gt3,i2)) 
coup2(4) = Conjg(cplcFuFuhhR(iIN,gt3,i2))  
coup2(5) = cplcFuFuAhL(gt2,gt3,i1) 
coup2(6) = cplcFuFuAhR(gt2,gt3,i1) 
coup2(7) = Conjg(cplcFuFuhhL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplcFuFuhhR(gt2,gt1,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFu Fu Propagator: Ah,hh" 
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
mass(2) = MFu(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup2(1) = cplcFuFuhhL(iIN,gt1,i1) 
coup2(2) = cplcFuFuhhR(iIN,gt1,i1) 
coup2(3) = Conjg(cplcFuFuhhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFuFuhhR(iIN,gt1,i2))  
coup2(5) = cplcFuFuhhL(gt2,gt3,i1) 
coup2(6) = cplcFuFuhhR(gt2,gt3,i1) 
coup2(7) = Conjg(cplcFuFuhhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFuFuhhR(gt2,gt3,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFu(gt1) 
mass(4) = MFu(gt3) 
mass(3) = -MFu(gt2) 
 
coup2(1) = cplcFuFuhhL(iIN,gt3,i1) 
coup2(2) = cplcFuFuhhR(iIN,gt3,i1) 
coup2(3) = Conjg(cplcFuFuhhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFuFuhhR(iIN,gt1,i2))  
coup2(5) = cplcFuFuhhL(gt2,gt1,i1) 
coup2(6) = cplcFuFuhhR(gt2,gt1,i1) 
coup2(7) = Conjg(cplcFuFuhhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFuFuhhR(gt2,gt3,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFu(gt3) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt1) 
 
coup2(1) = cplcFuFuhhL(iIN,gt3,i1) 
coup2(2) = cplcFuFuhhR(iIN,gt3,i1) 
coup2(3) = Conjg(cplcFuFuhhL(iIN,gt3,i2)) 
coup2(4) = Conjg(cplcFuFuhhR(iIN,gt3,i2))  
coup2(5) = cplcFuFuhhL(gt2,gt1,i1) 
coup2(6) = cplcFuFuhhR(gt2,gt1,i1) 
coup2(7) = Conjg(cplcFuFuhhL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplcFuFuhhR(gt2,gt1,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFu(gt3) 
mass(4) = MFu(gt1) 
mass(3) = -MFu(gt2) 
 
coup2(1) = cplcFuFuhhL(iIN,gt1,i1) 
coup2(2) = cplcFuFuhhR(iIN,gt1,i1) 
coup2(3) = Conjg(cplcFuFuhhL(iIN,gt3,i2)) 
coup2(4) = Conjg(cplcFuFuhhR(iIN,gt3,i2))  
coup2(5) = cplcFuFuhhL(gt2,gt3,i1) 
coup2(6) = cplcFuFuhhR(gt2,gt3,i1) 
coup2(7) = Conjg(cplcFuFuhhL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplcFuFuhhR(gt2,gt1,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFu Fu Propagator: hh,hh" 
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
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:64))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
  g = oo512pi3 / Abs(MFu(iIN))**3*g
End Subroutine FuToFucFuFu 
 
 
Subroutine FuToFuFvFv(iIN,MFu,MFv,MVZ,MVZR,MAh,Mhh,cplcFuFuAhL,cplcFuFuAhR,           & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZRL,cplcFuFuVZRR,             & 
& cplFvFvAhL,cplFvFvAhR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZRL,         & 
& cplFvFvVZRR,IntegralSs,IntegralSSss,IntegralVs,IntegralVSss,IntegralVVss,              & 
& NSs,NSSss,NVs,NVSss,NVVss,gTVZ,gTVZR,gTAh,gThh,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFu(3),MFv(6),MVZ,MVZR,MAh(3),Mhh(3)

Complex(dp),Intent(in) :: cplcFuFuAhL(3,3,3),cplcFuFuAhR(3,3,3),cplcFuFuhhL(3,3,3),cplcFuFuhhR(3,3,3),          & 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcFuFuVZRL(3,3),cplcFuFuVZRR(3,3),cplFvFvAhL(6,6,3),& 
& cplFvFvAhR(6,6,3),cplFvFvhhL(6,6,3),cplFvFvhhR(6,6,3),cplFvFvVZL(6,6),cplFvFvVZR(6,6), & 
& cplFvFvVZRL(6,6),cplFvFvVZRR(6,6)

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
mass(1) = MFu(iIN) 
 
Isum = 64 
Allocate( gSum(3,6,6, Isum) ) 
Allocate( Contribution(3,6,6, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1, iIN-1
      Do gt2=1,6
        Do gt3=gt2,6
Isum = 0 
 
If(Abs(MFu(iIN)).gt.(Abs(MFv(gt3))+Abs(MFv(gt2))+Abs(MFu(gt1)))) Then 
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
 
mass(2) = MFu(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup(2) = Conjg(cplcFuFuVZL(iIN,gt1)) 
coup(1) = Conjg(cplcFuFuVZR(iIN,gt1)) 
coup(4) = Conjg(cplFvFvVZL(gt2,gt3)) 
coup(3) = Conjg(cplFvFvVZR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFu(gt1) 
mass(3) = -MFv(gt3) 
mass(4) = MFv(gt2) 
 
coup2(1) = cplcFuFuVZL(iIN,gt1) 
coup2(2) = cplcFuFuVZR(iIN,gt1) 
coup2(4) = Conjg(cplcFuFuVZL(iIN,gt1)) 
coup2(3) = Conjg(cplcFuFuVZR(iIN,gt1))  
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
Write(*,*) "Fu->Fu Fv Fv Propagator: VZ" 
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
 
mass(2) = MFu(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup(2) = Conjg(cplcFuFuVZRL(iIN,gt1)) 
coup(1) = Conjg(cplcFuFuVZRR(iIN,gt1)) 
coup(4) = Conjg(cplFvFvVZRL(gt2,gt3)) 
coup(3) = Conjg(cplFvFvVZRR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFu(gt1) 
mass(3) = -MFv(gt3) 
mass(4) = MFv(gt2) 
 
coup2(1) = cplcFuFuVZRL(iIN,gt1) 
coup2(2) = cplcFuFuVZRR(iIN,gt1) 
coup2(4) = Conjg(cplcFuFuVZRL(iIN,gt1)) 
coup2(3) = Conjg(cplcFuFuVZRR(iIN,gt1))  
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
Write(*,*) "Fu->Fu Fv Fv Propagator: VZR" 
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
 
mass(2) = MFu(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup(2) = Conjg(cplcFuFuAhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcFuFuAhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplFvFvAhL(gt2,gt3,i1)) 
coup(3) = Conjg(cplFvFvAhR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFu(gt1) 
mass(3) = -MFv(gt3) 
mass(4) = MFv(gt2) 
 
coup2(1) = cplcFuFuAhL(iIN,gt1,i1) 
coup2(2) = cplcFuFuAhR(iIN,gt1,i1) 
coup2(3) = Conjg(cplcFuFuAhL(iIN,gt1,i1)) 
coup2(4) = Conjg(cplcFuFuAhR(iIN,gt1,i1))  
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
Write(*,*) "Fu->Fu Fv Fv Propagator: Ah" 
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
 
mass(2) = MFu(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup(2) = Conjg(cplcFuFuhhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcFuFuhhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplFvFvhhL(gt2,gt3,i1)) 
coup(3) = Conjg(cplFvFvhhR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFu(gt1) 
mass(3) = -MFv(gt3) 
mass(4) = MFv(gt2) 
 
coup2(1) = cplcFuFuhhL(iIN,gt1,i1) 
coup2(2) = cplcFuFuhhR(iIN,gt1,i1) 
coup2(3) = Conjg(cplcFuFuhhL(iIN,gt1,i1)) 
coup2(4) = Conjg(cplcFuFuhhR(iIN,gt1,i1))  
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
Write(*,*) "Fu->Fu Fv Fv Propagator: hh" 
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
mass(2) = MFu(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup2(1) = cplcFuFuVZL(iIN,gt1) 
coup2(2) = cplcFuFuVZR(iIN,gt1) 
coup2(4) = Conjg(cplcFuFuVZRL(iIN,gt1)) 
coup2(3) = Conjg(cplcFuFuVZRR(iIN,gt1))  
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
Write(*,*) "Fu->Fu Fv Fv Propagator: VZ,VZR" 
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
mass(2) = MFu(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup2(1) = cplcFuFuVZL(iIN,gt1) 
coup2(2) = cplcFuFuVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFuFuAhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFuFuAhR(iIN,gt1,i2))  
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
Write(*,*) "Fu->Fu Fv Fv Propagator: VZ,Ah" 
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
mass(2) = MFu(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup2(1) = cplcFuFuVZL(iIN,gt1) 
coup2(2) = cplcFuFuVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFuFuhhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFuFuhhR(iIN,gt1,i2))  
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
Write(*,*) "Fu->Fu Fv Fv Propagator: VZ,hh" 
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
mass(2) = MFu(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup2(1) = cplcFuFuVZRL(iIN,gt1) 
coup2(2) = cplcFuFuVZRR(iIN,gt1) 
coup2(3) = Conjg(cplcFuFuAhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFuFuAhR(iIN,gt1,i2))  
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
Write(*,*) "Fu->Fu Fv Fv Propagator: VZR,Ah" 
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
mass(2) = MFu(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup2(1) = cplcFuFuVZRL(iIN,gt1) 
coup2(2) = cplcFuFuVZRR(iIN,gt1) 
coup2(3) = Conjg(cplcFuFuhhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFuFuhhR(iIN,gt1,i2))  
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
Write(*,*) "Fu->Fu Fv Fv Propagator: VZR,hh" 
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
mass(2) = MFu(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup2(1) = cplcFuFuAhL(iIN,gt1,i1) 
coup2(2) = cplcFuFuAhR(iIN,gt1,i1) 
coup2(3) = Conjg(cplcFuFuAhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFuFuAhR(iIN,gt1,i2))  
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
Write(*,*) "Fu->Fu Fv Fv Propagator: Ah,Ah" 
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
mass(2) = MFu(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup2(1) = cplcFuFuAhL(iIN,gt1,i1) 
coup2(2) = cplcFuFuAhR(iIN,gt1,i1) 
coup2(3) = Conjg(cplcFuFuhhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFuFuhhR(iIN,gt1,i2))  
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
Write(*,*) "Fu->Fu Fv Fv Propagator: Ah,hh" 
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
mass(2) = MFu(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup2(1) = cplcFuFuhhL(iIN,gt1,i1) 
coup2(2) = cplcFuFuhhR(iIN,gt1,i1) 
coup2(3) = Conjg(cplcFuFuhhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFuFuhhR(iIN,gt1,i2))  
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
Write(*,*) "Fu->Fu Fv Fv Propagator: hh,hh" 
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
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:64))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
  g = oo512pi3 / Abs(MFu(iIN))**3*g
End Subroutine FuToFuFvFv 
 
 
Subroutine FuToFdFvFe(iIN,MFd,MFv,MFe,MVWLm,MVWRm,MHpm,MFu,cplcFuFdcHpmL,             & 
& cplcFuFdcHpmR,cplcFuFdcVWLmL,cplcFuFdcVWLmR,cplcFuFdcVWRmL,cplcFuFdcVWRmR,             & 
& cplFvFeHpmL,cplFvFeHpmR,cplFvFeVWLmL,cplFvFeVWLmR,cplFvFeVWRmL,cplFvFeVWRmR,           & 
& IntegralSs,IntegralSSss,IntegralVs,IntegralVSss,IntegralVVss,NSs,NSSss,NVs,            & 
& NVSss,NVVss,gTVWLm,gTVWRm,gTHpm,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFd(3),MFv(6),MFe(3),MVWLm,MVWRm,MHpm(3),MFu(3)

Complex(dp),Intent(in) :: cplcFuFdcHpmL(3,3,3),cplcFuFdcHpmR(3,3,3),cplcFuFdcVWLmL(3,3),cplcFuFdcVWLmR(3,3),    & 
& cplcFuFdcVWRmL(3,3),cplcFuFdcVWRmR(3,3),cplFvFeHpmL(6,3,3),cplFvFeHpmR(6,3,3),         & 
& cplFvFeVWLmL(6,3),cplFvFeVWLmR(6,3),cplFvFeVWRmL(6,3),cplFvFeVWRmR(6,3)

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
mass(1) = MFu(iIN) 
 
Isum = 25 
Allocate( gSum(3,6,3, Isum) ) 
Allocate( Contribution(3,6,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,3
      Do gt2=1,6
        Do gt3=1,3
Isum = 0 
 
If(Abs(MFu(iIN)).gt.(Abs(MFe(gt3))+Abs(MFv(gt2))+Abs(MFd(gt1)))) Then 
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
 
mass(2) = MFd(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFe(gt3) 
 
coup(2) = Conjg(cplcFuFdcVWLmL(iIN,gt1)) 
coup(1) = Conjg(cplcFuFdcVWLmR(iIN,gt1)) 
coup(4) = Conjg(cplFvFeVWLmL(gt2,gt3)) 
coup(3) = Conjg(cplFvFeVWLmR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fd Fv Fe Propagator: conj[VWLm]" 
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
 
mass(2) = MFd(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFe(gt3) 
 
coup(2) = Conjg(cplcFuFdcVWRmL(iIN,gt1)) 
coup(1) = Conjg(cplcFuFdcVWRmR(iIN,gt1)) 
coup(4) = Conjg(cplFvFeVWRmL(gt2,gt3)) 
coup(3) = Conjg(cplFvFeVWRmR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fd Fv Fe Propagator: conj[VWRm]" 
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
 
mass(2) = MFd(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFe(gt3) 
 
coup(2) = Conjg(cplcFuFdcHpmL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcFuFdcHpmR(iIN,gt1,i1)) 
coup(4) = Conjg(cplFvFeHpmL(gt2,gt3,i1)) 
coup(3) = Conjg(cplFvFeHpmR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fd Fv Fe Propagator: conj[Hpm]" 
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
mass(2) = MFd(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplcFuFdcVWLmL(iIN,gt1) 
coup2(2) = cplcFuFdcVWLmR(iIN,gt1) 
coup2(4) = Conjg(cplcFuFdcVWRmL(iIN,gt1)) 
coup2(3) = Conjg(cplcFuFdcVWRmR(iIN,gt1))  
coup2(5) = cplFvFeVWLmL(gt2,gt3) 
coup2(6) = cplFvFeVWLmR(gt2,gt3) 
coup2(8) = Conjg(cplFvFeVWRmL(gt2,gt3)) 
coup2(7) = Conjg(cplFvFeVWRmR(gt2,gt3)) 
Call IntegrateGaugeSS(Boson4, mass, coup2, deltaM, epsI,IntegralVVss,NVVss, resR, check) 
If (resR.ne.resR) resR = 0._dp
resC = 2._dp*resR 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fd Fv Fe Propagator: conj[VWLm],conj[VWRm]" 
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
mass(2) = MFd(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplcFuFdcVWLmL(iIN,gt1) 
coup2(2) = cplcFuFdcVWLmR(iIN,gt1) 
coup2(3) = Conjg(cplcFuFdcHpmL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFuFdcHpmR(iIN,gt1,i2))  
coup2(5) = cplFvFeVWLmL(gt2,gt3) 
coup2(6) = cplFvFeVWLmR(gt2,gt3) 
coup2(7) = Conjg(cplFvFeHpmL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplFvFeHpmR(gt2,gt3,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fd Fv Fe Propagator: conj[VWLm],conj[Hpm]" 
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
mass(2) = MFd(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplcFuFdcVWRmL(iIN,gt1) 
coup2(2) = cplcFuFdcVWRmR(iIN,gt1) 
coup2(3) = Conjg(cplcFuFdcHpmL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFuFdcHpmR(iIN,gt1,i2))  
coup2(5) = cplFvFeVWRmL(gt2,gt3) 
coup2(6) = cplFvFeVWRmR(gt2,gt3) 
coup2(7) = Conjg(cplFvFeHpmL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplFvFeHpmR(gt2,gt3,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fd Fv Fe Propagator: conj[VWRm],conj[Hpm]" 
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
mass(2) = MFd(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplcFuFdcHpmL(iIN,gt1,i1) 
coup2(2) = cplcFuFdcHpmR(iIN,gt1,i1) 
coup2(3) = Conjg(cplcFuFdcHpmL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFuFdcHpmR(iIN,gt1,i2))  
coup2(5) = cplFvFeHpmL(gt2,gt3,i1) 
coup2(6) = cplFvFeHpmR(gt2,gt3,i1) 
coup2(7) = Conjg(cplFvFeHpmL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplFvFeHpmR(gt2,gt3,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fd Fv Fe Propagator: conj[Hpm],conj[Hpm]" 
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
    Do gt1=1,3
      Do gt2=1,6
        Do gt3=1,3
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:25))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
  g = oo512pi3 / Abs(MFu(iIN))**3*g
End Subroutine FuToFdFvFe 
 
 
Subroutine FuToFdFcpFc(iIN,MFd,MFcp,MFc,MVWLm,MVWRm,MFu,cplcFuFdcVWLmL,               & 
& cplcFuFdcVWLmR,cplcFuFdcVWRmL,cplcFuFdcVWRmR,cplFcFcpVWLmL,cplFcFcpVWLmR,              & 
& cplFcFcpVWRmL,cplFcFcpVWRmR,IntegralVs,IntegralVVss,NVs,NVVss,gTVWLm,gTVWRm,           & 
& deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFd(3),MFcp,MFc(2),MVWLm,MVWRm,MFu(3)

Complex(dp),Intent(in) :: cplcFuFdcVWLmL(3,3),cplcFuFdcVWLmR(3,3),cplcFuFdcVWRmL(3,3),cplcFuFdcVWRmR(3,3),      & 
& cplFcFcpVWLmL(2),cplFcFcpVWLmR(2),cplFcFcpVWRmL(2),cplFcFcpVWRmR(2)

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
mass(1) = MFu(iIN) 
 
Isum = 4 
Allocate( gSum(3,1,2, Isum) ) 
Allocate( Contribution(3,1,2, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,3
        Do gt3=1,2
Isum = 0 
 
If(Abs(MFu(iIN)).gt.(Abs(MFc(gt3))+Abs(MFcp)+Abs(MFd(gt1)))) Then 
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
 
mass(2) = MFd(gt1) 
mass(3) = -MFcp 
mass(4) = MFc(gt3) 
 
coup(2) = Conjg(cplcFuFdcVWLmL(iIN,gt1)) 
coup(1) = Conjg(cplcFuFdcVWLmR(iIN,gt1)) 
coup(4) = Conjg(cplFcFcpVWLmL(gt3)) 
coup(3) = Conjg(cplFcFcpVWLmR(gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fd Fcp Fc Propagator: conj[VWLm]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,1,gt3,Isum)= 0._dp
Else 
gSum(gt1,1,gt3,Isum)=resD
End If 
Contribution(gt1,1,gt3,Isum)='conj[VWLm]'



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
 
mass(2) = MFd(gt1) 
mass(3) = -MFcp 
mass(4) = MFc(gt3) 
 
coup(2) = Conjg(cplcFuFdcVWRmL(iIN,gt1)) 
coup(1) = Conjg(cplcFuFdcVWRmR(iIN,gt1)) 
coup(4) = Conjg(cplFcFcpVWRmL(gt3)) 
coup(3) = Conjg(cplFcFcpVWRmR(gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fd Fcp Fc Propagator: conj[VWRm]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,1,gt3,Isum)= 0._dp
Else 
gSum(gt1,1,gt3,Isum)=resD
End If 
Contribution(gt1,1,gt3,Isum)='conj[VWRm]'



!-------------- 
!  conj[VWLm], conj[VWRm] 
!-------------- 
Boson4(1) = MVWLm 
Boson4(2) = gTVWLm 
Boson4(3) = MVWRm 
Boson4(4) = gTVWRm 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFd(gt1) 
mass(3) = -MFcp 
mass(4) = MFc(gt3) 
 
coup2(1) = cplcFuFdcVWLmL(iIN,gt1) 
coup2(2) = cplcFuFdcVWLmR(iIN,gt1) 
coup2(4) = Conjg(cplcFuFdcVWRmL(iIN,gt1)) 
coup2(3) = Conjg(cplcFuFdcVWRmR(iIN,gt1))  
coup2(5) = cplFcFcpVWLmL(gt3) 
coup2(6) = cplFcFcpVWLmR(gt3) 
coup2(8) = Conjg(cplFcFcpVWRmL(gt3)) 
coup2(7) = Conjg(cplFcFcpVWRmR(gt3)) 
Call IntegrateGaugeSS(Boson4, mass, coup2, deltaM, epsI,IntegralVVss,NVVss, resR, check) 
If (resR.ne.resR) resR = 0._dp
resC = 2._dp*resR 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fd Fcp Fc Propagator: conj[VWLm],conj[VWRm]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,1,gt3,Isum)= 0._dp  
Else 
gSum(gt1,1,gt3,Isum)= resS  
End If 
Contribution(gt1,1,gt3,Isum)='conj[VWLm],conj[VWRm]'



Else 
gSum(gt1,1,gt3,:)= 0._dp  
End If 
       End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1,3
        Do gt3=1,2
g(gt1,1,gt3)=Sum(gSum(gt1,1,gt3,1:4))
If (g(gt1,1,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,1,gt3)=0._dp
End If
       End Do 
   End Do 
  g = oo512pi3 / Abs(MFu(iIN))**3*g
End Subroutine FuToFdFcpFc 
 
 
Subroutine FuToFdcFcpFcpp(iIN,MFd,MFcp,MFcpp,MVWLm,MVWRm,MFu,cplcFcpFcppVWLmL,        & 
& cplcFcpFcppVWLmR,cplcFcpFcppVWRmL,cplcFcpFcppVWRmR,cplcFuFdcVWLmL,cplcFuFdcVWLmR,      & 
& cplcFuFdcVWRmL,cplcFuFdcVWRmR,IntegralVs,IntegralVVss,NVs,NVVss,gTVWLm,gTVWRm,         & 
& deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFd(3),MFcp,MFcpp,MVWLm,MVWRm,MFu(3)

Complex(dp),Intent(in) :: cplcFcpFcppVWLmL,cplcFcpFcppVWLmR,cplcFcpFcppVWRmL,cplcFcpFcppVWRmR,cplcFuFdcVWLmL(3,3),& 
& cplcFuFdcVWLmR(3,3),cplcFuFdcVWRmL(3,3),cplcFuFdcVWRmR(3,3)

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
mass(1) = MFu(iIN) 
 
Isum = 4 
Allocate( gSum(3,1,1, Isum) ) 
Allocate( Contribution(3,1,1, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,3
Isum = 0 
 
If(Abs(MFu(iIN)).gt.(Abs(MFcpp)+Abs(MFcp)+Abs(MFd(gt1)))) Then 
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
 
mass(2) = MFd(gt1) 
mass(3) = -MFcp 
mass(4) = MFcpp 
 
coup(2) = Conjg(cplcFuFdcVWLmL(iIN,gt1)) 
coup(1) = Conjg(cplcFuFdcVWLmR(iIN,gt1)) 
coup(4) = Conjg(cplcFcpFcppVWLmL) 
coup(3) = Conjg(cplcFcpFcppVWLmR)
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fd cFcp Fcpp Propagator: conj[VWLm]" 
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
 
mass(2) = MFd(gt1) 
mass(3) = -MFcp 
mass(4) = MFcpp 
 
coup(2) = Conjg(cplcFuFdcVWRmL(iIN,gt1)) 
coup(1) = Conjg(cplcFuFdcVWRmR(iIN,gt1)) 
coup(4) = Conjg(cplcFcpFcppVWRmL) 
coup(3) = Conjg(cplcFcpFcppVWRmR)
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fd cFcp Fcpp Propagator: conj[VWRm]" 
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
mass(2) = MFd(gt1) 
mass(3) = -MFcp 
mass(4) = MFcpp 
 
coup2(1) = cplcFuFdcVWLmL(iIN,gt1) 
coup2(2) = cplcFuFdcVWLmR(iIN,gt1) 
coup2(4) = Conjg(cplcFuFdcVWRmL(iIN,gt1)) 
coup2(3) = Conjg(cplcFuFdcVWRmR(iIN,gt1))  
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
Write(*,*) "Fu->Fd cFcp Fcpp Propagator: conj[VWLm],conj[VWRm]" 
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
    Do gt1=1,3
g(gt1,1,1)=Sum(gSum(gt1,1,1,1:4))
If (g(gt1,1,1).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,1,1)=0._dp
End If
   End Do 
  g = oo512pi3 / Abs(MFu(iIN))**3*g
End Subroutine FuToFdcFcpFcpp 
 
 
Subroutine FuToFuFcFc(iIN,MFu,MFc,MVZ,MVZR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZRL,      & 
& cplcFuFuVZRR,cplFcFcVZL,cplFcFcVZR,cplFcFcVZRL,cplFcFcVZRR,IntegralVs,IntegralVVss,    & 
& NVs,NVVss,gTVZ,gTVZR,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFu(3),MFc(2),MVZ,MVZR

Complex(dp),Intent(in) :: cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcFuFuVZRL(3,3),cplcFuFuVZRR(3,3),cplFcFcVZL(2,2),& 
& cplFcFcVZR(2,2),cplFcFcVZRL(2,2),cplFcFcVZRR(2,2)

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
mass(1) = MFu(iIN) 
 
Isum = 4 
Allocate( gSum(3,2,2, Isum) ) 
Allocate( Contribution(3,2,2, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1, iIN-1
      Do gt2=1,2
        Do gt3=gt2,2
Isum = 0 
 
If(Abs(MFu(iIN)).gt.(Abs(MFc(gt3))+Abs(MFc(gt2))+Abs(MFu(gt1)))) Then 
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
 
mass(2) = MFu(gt1) 
mass(3) = -MFc(gt2) 
mass(4) = MFc(gt3) 
 
coup(2) = Conjg(cplcFuFuVZL(iIN,gt1)) 
coup(1) = Conjg(cplcFuFuVZR(iIN,gt1)) 
coup(4) = Conjg(cplFcFcVZL(gt2,gt3)) 
coup(3) = Conjg(cplFcFcVZR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFu(gt1) 
mass(3) = -MFc(gt3) 
mass(4) = MFc(gt2) 
 
coup2(1) = cplcFuFuVZL(iIN,gt1) 
coup2(2) = cplcFuFuVZR(iIN,gt1) 
coup2(4) = Conjg(cplcFuFuVZL(iIN,gt1)) 
coup2(3) = Conjg(cplcFuFuVZR(iIN,gt1))  
coup2(5) = cplFcFcVZL(gt3,gt2) 
coup2(6) = cplFcFcVZR(gt3,gt2) 
coup2(8) = Conjg(cplFcFcVZL(gt2,gt3)) 
coup2(7) = Conjg(cplFcFcVZR(gt2,gt3)) 
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
Write(*,*) "Fu->Fu Fc Fc Propagator: VZ" 
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
 
mass(2) = MFu(gt1) 
mass(3) = -MFc(gt2) 
mass(4) = MFc(gt3) 
 
coup(2) = Conjg(cplcFuFuVZRL(iIN,gt1)) 
coup(1) = Conjg(cplcFuFuVZRR(iIN,gt1)) 
coup(4) = Conjg(cplFcFcVZRL(gt2,gt3)) 
coup(3) = Conjg(cplFcFcVZRR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFu(gt1) 
mass(3) = -MFc(gt3) 
mass(4) = MFc(gt2) 
 
coup2(1) = cplcFuFuVZRL(iIN,gt1) 
coup2(2) = cplcFuFuVZRR(iIN,gt1) 
coup2(4) = Conjg(cplcFuFuVZRL(iIN,gt1)) 
coup2(3) = Conjg(cplcFuFuVZRR(iIN,gt1))  
coup2(5) = cplFcFcVZRL(gt3,gt2) 
coup2(6) = cplFcFcVZRR(gt3,gt2) 
coup2(8) = Conjg(cplFcFcVZRL(gt2,gt3)) 
coup2(7) = Conjg(cplFcFcVZRR(gt2,gt3)) 
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
Write(*,*) "Fu->Fu Fc Fc Propagator: VZR" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZR'



!-------------- 
!  VZ, VZR 
!-------------- 
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MVZR 
Boson4(4) = gTVZR 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFu(gt1) 
mass(3) = -MFc(gt2) 
mass(4) = MFc(gt3) 
 
coup2(1) = cplcFuFuVZL(iIN,gt1) 
coup2(2) = cplcFuFuVZR(iIN,gt1) 
coup2(4) = Conjg(cplcFuFuVZRL(iIN,gt1)) 
coup2(3) = Conjg(cplcFuFuVZRR(iIN,gt1))  
coup2(5) = cplFcFcVZL(gt2,gt3) 
coup2(6) = cplFcFcVZR(gt2,gt3) 
coup2(8) = Conjg(cplFcFcVZRL(gt2,gt3)) 
coup2(7) = Conjg(cplFcFcVZRR(gt2,gt3)) 
Call IntegrateGaugeSS(Boson4, mass, coup2, deltaM, epsI,IntegralVVss,NVVss, resR, check) 
If (resR.ne.resR) resR = 0._dp
resC = 2._dp*resR 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu Fc Fc Propagator: VZ,VZR" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,VZR'



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
      Do gt2=1,2
        Do gt3=gt2,2
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:4))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
  g = oo512pi3 / Abs(MFu(iIN))**3*g
End Subroutine FuToFuFcFc 
 
 
Subroutine FuToFucFcpFcp(iIN,MFu,MFcp,MVZ,MVZR,cplcFcpFcpVZL,cplcFcpFcpVZR,           & 
& cplcFcpFcpVZRL,cplcFcpFcpVZRR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZRL,cplcFuFuVZRR,       & 
& IntegralVs,IntegralVVss,NVs,NVVss,gTVZ,gTVZR,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFu(3),MFcp,MVZ,MVZR

Complex(dp),Intent(in) :: cplcFcpFcpVZL,cplcFcpFcpVZR,cplcFcpFcpVZRL,cplcFcpFcpVZRR,cplcFuFuVZL(3,3),           & 
& cplcFuFuVZR(3,3),cplcFuFuVZRL(3,3),cplcFuFuVZRR(3,3)

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
mass(1) = MFu(iIN) 
 
Isum = 4 
Allocate( gSum(3,1,1, Isum) ) 
Allocate( Contribution(3,1,1, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1, iIN-1
Isum = 0 
 
If(Abs(MFu(iIN)).gt.(Abs(MFcp)+Abs(MFcp)+Abs(MFu(gt1)))) Then 
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
 
mass(2) = MFu(gt1) 
mass(3) = -MFcp 
mass(4) = MFcp 
 
coup(2) = Conjg(cplcFuFuVZL(iIN,gt1)) 
coup(1) = Conjg(cplcFuFuVZR(iIN,gt1)) 
coup(4) = Conjg(cplcFcpFcpVZL) 
coup(3) = Conjg(cplcFcpFcpVZR)
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFcp Fcp Propagator: VZ" 
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
 
mass(2) = MFu(gt1) 
mass(3) = -MFcp 
mass(4) = MFcp 
 
coup(2) = Conjg(cplcFuFuVZRL(iIN,gt1)) 
coup(1) = Conjg(cplcFuFuVZRR(iIN,gt1)) 
coup(4) = Conjg(cplcFcpFcpVZRL) 
coup(3) = Conjg(cplcFcpFcpVZRR)
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFcp Fcp Propagator: VZR" 
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
mass(2) = MFu(gt1) 
mass(3) = -MFcp 
mass(4) = MFcp 
 
coup2(1) = cplcFuFuVZL(iIN,gt1) 
coup2(2) = cplcFuFuVZR(iIN,gt1) 
coup2(4) = Conjg(cplcFuFuVZRL(iIN,gt1)) 
coup2(3) = Conjg(cplcFuFuVZRR(iIN,gt1))  
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
Write(*,*) "Fu->Fu cFcp Fcp Propagator: VZ,VZR" 
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
  g = oo512pi3 / Abs(MFu(iIN))**3*g
End Subroutine FuToFucFcpFcp 
 
 
Subroutine FuToFucFcppFcpp(iIN,MFu,MFcpp,MVZ,MVZR,cplcFcppFcppVZL,cplcFcppFcppVZR,    & 
& cplcFcppFcppVZRL,cplcFcppFcppVZRR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZRL,cplcFuFuVZRR,   & 
& IntegralVs,IntegralVVss,NVs,NVVss,gTVZ,gTVZR,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFu(3),MFcpp,MVZ,MVZR

Complex(dp),Intent(in) :: cplcFcppFcppVZL,cplcFcppFcppVZR,cplcFcppFcppVZRL,cplcFcppFcppVZRR,cplcFuFuVZL(3,3),   & 
& cplcFuFuVZR(3,3),cplcFuFuVZRL(3,3),cplcFuFuVZRR(3,3)

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
mass(1) = MFu(iIN) 
 
Isum = 4 
Allocate( gSum(3,1,1, Isum) ) 
Allocate( Contribution(3,1,1, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1, iIN-1
Isum = 0 
 
If(Abs(MFu(iIN)).gt.(Abs(MFcpp)+Abs(MFcpp)+Abs(MFu(gt1)))) Then 
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
 
mass(2) = MFu(gt1) 
mass(3) = -MFcpp 
mass(4) = MFcpp 
 
coup(2) = Conjg(cplcFuFuVZL(iIN,gt1)) 
coup(1) = Conjg(cplcFuFuVZR(iIN,gt1)) 
coup(4) = Conjg(cplcFcppFcppVZL) 
coup(3) = Conjg(cplcFcppFcppVZR)
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFcpp Fcpp Propagator: VZ" 
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
 
mass(2) = MFu(gt1) 
mass(3) = -MFcpp 
mass(4) = MFcpp 
 
coup(2) = Conjg(cplcFuFuVZRL(iIN,gt1)) 
coup(1) = Conjg(cplcFuFuVZRR(iIN,gt1)) 
coup(4) = Conjg(cplcFcppFcppVZRL) 
coup(3) = Conjg(cplcFcppFcppVZRR)
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFcpp Fcpp Propagator: VZR" 
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
mass(2) = MFu(gt1) 
mass(3) = -MFcpp 
mass(4) = MFcpp 
 
coup2(1) = cplcFuFuVZL(iIN,gt1) 
coup2(2) = cplcFuFuVZR(iIN,gt1) 
coup2(4) = Conjg(cplcFuFuVZRL(iIN,gt1)) 
coup2(3) = Conjg(cplcFuFuVZRR(iIN,gt1))  
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
Write(*,*) "Fu->Fu cFcpp Fcpp Propagator: VZ,VZR" 
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
  g = oo512pi3 / Abs(MFu(iIN))**3*g
End Subroutine FuToFucFcppFcpp 
 
 
End Module Fu3Decays_DMLR 
 

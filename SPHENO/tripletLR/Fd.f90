! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.8.1 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 13:05 on 11.3.2016   
! ----------------------------------------------------------------------  
 
 
Module Fd3Decays_tripletLR 
 
Use Control 
Use CouplingsForDecays_tripletLR 
Use ThreeBodyPhaseSpace 
 
Contains 
 
Subroutine FdThreeBodyDecay(n_in,MAh,MAh2,MdeltaRpp,MdeltaRpp2,MFc,MFc2,              & 
& MFcp,MFcp2,MFcpp,MFcpp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,             & 
& MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,phaT,PhiW,UV,TW,UC,ZDR,            & 
& ZER,UP,UT,UTE,ZUR,ZDL,ZEL,VTE,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,           & 
& ALP3,ALP2,LAM4,LAM2,LAM3,LAMT1,YDR,YL1,YQ1,LAMT2,YL2,YQ2,M1,M23,mu32,MU22,             & 
& MU12,vd,vu,vR,gTAh,gThh,gTHpm,gTVWLm,gTVWRm,gTVZ,gTVZR,gFdFdFcFc,gFdFdcFcpFcp,         & 
& gFdFdcFdFd,gFdFdcFeFe,gFdFdcFuFu,gFdFdFvFv,gFdFdcFcppFcpp,gFdFucFcpFc,gFdFucFcppFcp,   & 
& gFdFucFeFv,epsI,deltaM,CheckRealStates,gT,gPartial,BR)

Implicit None 
 
Real(dp),Intent(in) :: MAh(3),MAh2(3),MdeltaRpp,MdeltaRpp2,MFc(3),MFc2(3),MFcp(2),MFcp2(2),MFcpp,            & 
& MFcpp2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),Mhh(3),             & 
& Mhh2(3),MHpm(3),MHpm2(3),MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,           & 
& TW,UC(3,3),UP(3,3),ZH(3,3)

Complex(dp),Intent(in) :: phaT,UV(6,6),ZDR(3,3),ZER(3,3),UT(3,3),UTE(2,2),ZUR(3,3),ZDL(3,3),ZEL(3,3),           & 
& VTE(2,2),ZUL(3,3),ZW(4,4),ZZ(3,3)

Complex(dp) :: cplcFcpFccHpmL(2,3,3),cplcFcpFccHpmR(2,3,3),cplcFcpFccVWLmL(2,3),cplcFcpFccVWLmR(2,3),& 
& cplcFcpFccVWRmL(2,3),cplcFcpFccVWRmR(2,3),cplcFcpFcpAhL(2,2,3),cplcFcpFcpAhR(2,2,3),   & 
& cplcFcpFcphhL(2,2,3),cplcFcpFcphhR(2,2,3),cplcFcpFcpVZL(2,2),cplcFcpFcpVZR(2,2),       & 
& cplcFcpFcpVZRL(2,2),cplcFcpFcpVZRR(2,2),cplcFcppFcpcHpmL(2,3),cplcFcppFcpcHpmR(2,3),   & 
& cplcFcppFcpcVWLmL(2),cplcFcppFcpcVWLmR(2),cplcFcppFcpcVWRmL(2),cplcFcppFcpcVWRmR(2),   & 
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
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcFuFuVZRL(3,3),cplcFuFuVZRR(3,3),cplFcFcAhL(3,3,3),& 
& cplFcFcAhR(3,3,3),cplFcFchhL(3,3,3),cplFcFchhR(3,3,3),cplFcFcVZL(3,3),cplFcFcVZR(3,3), & 
& cplFcFcVZRL(3,3),cplFcFcVZRR(3,3),cplFvFvAhL(6,6,3),cplFvFvAhR(6,6,3),cplFvFvhhL(6,6,3),& 
& cplFvFvhhR(6,6,3),cplFvFvVZL(6,6),cplFvFvVZR(6,6),cplFvFvVZRL(6,6),cplFvFvVZRR(6,6)

Real(dp),Intent(in) :: gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,ALP3,ALP2,LAM4,LAM2,LAM3,LAMT1,LAMT2,M1,             & 
& M23,mu32,MU22,MU12,vd,vu,vR

Complex(dp),Intent(in) :: YDR(3,3),YL1(3,3),YQ1(3,3),YL2(3,3),YQ2(3,3)

Real(dp),Intent(inout) :: gFdFdFcFc(3,3,3,3),gFdFdcFcpFcp(3,3,2,2),gFdFdcFdFd(3,3,3,3),gFdFdcFeFe(3,3,3,3),     & 
& gFdFdcFuFu(3,3,3,3),gFdFdFvFv(3,3,6,6),gFdFdcFcppFcpp(3,3,1,1),gFdFucFcpFc(3,3,2,3),   & 
& gFdFucFcppFcp(3,3,1,2),gFdFucFeFv(3,3,3,6)

Real(dp),Intent(in) :: gTAh(3),gThh(3),gTHpm(3),gTVWLm,gTVWRm,gTVZ,gTVZR

Real(dp) :: gFdFdFcFci(3,3,3),gFdFdcFcpFcpi(3,2,2),gFdFdcFdFdi(3,3,3),gFdFdcFeFei(3,3,3),         & 
& gFdFdcFuFui(3,3,3),gFdFdFvFvi(3,6,6),gFdFdcFcppFcppi(3,1,1),gFdFucFcpFci(3,2,3),       & 
& gFdFucFcppFcpi(3,1,2),gFdFucFeFvi(3,3,6)

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
NameOfUnit(Iname) = 'FdThreeBodyDecay' 
 
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
 
Call CouplingsFor_Fd_decays_3B(MFd(i_run),i_run,MAh,MAh2,MdeltaRpp,MdeltaRpp2,        & 
& MFc,MFc2,MFcp,MFcp2,MFcpp,MFcpp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,              & 
& Mhh2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,phaT,PhiW,               & 
& UV,TW,UC,ZDR,ZER,UP,UT,UTE,ZUR,ZDL,ZEL,VTE,ZUL,ZH,ZW,ZZ,gBL,g2,gR,g3,RHO2,             & 
& RHO1,ALP1,LAM1,ALP3,ALP2,LAM4,LAM2,LAM3,LAMT1,YDR,YL1,YQ1,LAMT2,YL2,YQ2,               & 
& M1,M23,mu32,MU22,MU12,vd,vu,vR,cplcFcpFccHpmL,cplcFcpFccHpmR,cplcFcpFccVWLmL,          & 
& cplcFcpFccVWLmR,cplcFcpFccVWRmL,cplcFcpFccVWRmR,cplcFcpFcpAhL,cplcFcpFcpAhR,           & 
& cplcFcpFcphhL,cplcFcpFcphhR,cplcFcpFcpVZL,cplcFcpFcpVZR,cplcFcpFcpVZRL,cplcFcpFcpVZRR, & 
& cplcFcppFcpcHpmL,cplcFcppFcpcHpmR,cplcFcppFcpcVWLmL,cplcFcppFcpcVWLmR,cplcFcppFcpcVWRmL,& 
& cplcFcppFcpcVWRmR,cplcFcppFcppVZL,cplcFcppFcppVZR,cplcFcppFcppVZRL,cplcFcppFcppVZRR,   & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFdFdVZRL,cplcFdFdVZRR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFdFuVWLmL,cplcFdFuVWLmR,       & 
& cplcFdFuVWRmL,cplcFdFuVWRmR,cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,           & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZRL,cplcFeFeVZRR,cplcFeFvcHpmL,cplcFeFvcHpmR,         & 
& cplcFeFvcVWLmL,cplcFeFvcVWLmR,cplcFeFvcVWRmL,cplcFeFvcVWRmR,cplcFuFdcHpmL,             & 
& cplcFuFdcHpmR,cplcFuFdcVWLmL,cplcFuFdcVWLmR,cplcFuFdcVWRmL,cplcFuFdcVWRmR,             & 
& cplcFuFuAhL,cplcFuFuAhR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcFuFuVZRL,cplcFuFuVZRR,cplFcFcAhL,cplFcFcAhR,cplFcFchhL,cplFcFchhR,cplFcFcVZL,      & 
& cplFcFcVZR,cplFcFcVZRL,cplFcFcVZRR,cplFvFvAhL,cplFvFvAhR,cplFvFvhhL,cplFvFvhhR,        & 
& cplFvFvVZL,cplFvFvVZR,cplFvFvVZRL,cplFvFvVZRR,deltaM)

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

 
gFdFdFcFci = 0._dp 
Call FdToFdFcFc(i_run,MFd,MFc,MVZ,MVZR,MAh,Mhh,cplcFdFdAhL,cplcFdFdAhR,               & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZRL,cplcFdFdVZRR,             & 
& cplFcFcAhL,cplFcFcAhR,cplFcFchhL,cplFcFchhR,cplFcFcVZL,cplFcFcVZR,cplFcFcVZRL,         & 
& cplFcFcVZRR,IntegralSs,IntegralSSss,IntegralVs,IntegralVSss,IntegralVVss,              & 
& NSs,NSSss,NVs,NVSss,NVVss,gTVZtemp,gTVZRtemp,gTAhtemp,gThhtemp,deltaM,epsI,            & 
& check,gFdFdFcFci)

gFdFdFcFc(i_run,:,:,:) = gFdFdFcFci 
gT(i_run) = gT(i_run) + Sum(gFdFdFcFci) 
 
gFdFdcFcpFcpi = 0._dp 
Call FdToFdcFcpFcp(i_run,MFd,MFcp,MVZ,MVZR,MAh,Mhh,cplcFcpFcpAhL,cplcFcpFcpAhR,       & 
& cplcFcpFcphhL,cplcFcpFcphhR,cplcFcpFcpVZL,cplcFcpFcpVZR,cplcFcpFcpVZRL,cplcFcpFcpVZRR, & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFdFdVZRL,cplcFdFdVZRR,IntegralSs,IntegralSSss,IntegralVs,IntegralVSss,             & 
& IntegralVVss,NSs,NSSss,NVs,NVSss,NVVss,gTVZtemp,gTVZRtemp,gTAhtemp,gThhtemp,           & 
& deltaM,epsI,check,gFdFdcFcpFcpi)

gFdFdcFcpFcp(i_run,:,:,:) = gFdFdcFcpFcpi 
gT(i_run) = gT(i_run) + Sum(gFdFdcFcpFcpi) 
 
gFdFdcFdFdi = 0._dp 
Call FdToFdcFdFd(i_run,MFd,MVZ,MVZR,MAh,Mhh,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,      & 
& cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZRL,cplcFdFdVZRR,IntegralSs,              & 
& IntegralSSss,IntegralSSst,IntegralVs,IntegralVSss,IntegralVSst,IntegralVVss,           & 
& IntegralVVst,NSs,NSSss,NSSst,NVs,NVSss,NVSst,NVVss,NVVst,gTVZtemp,gTVZRtemp,           & 
& gTAhtemp,gThhtemp,deltaM,epsI,check,gFdFdcFdFdi)

gFdFdcFdFd(i_run,:,:,:) = gFdFdcFdFdi 
gT(i_run) = gT(i_run) + Sum(gFdFdcFdFdi) 
 
gFdFdcFeFei = 0._dp 
Call FdToFdcFeFe(i_run,MFd,MFe,MVZ,MVZR,MAh,Mhh,cplcFdFdAhL,cplcFdFdAhR,              & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZRL,cplcFdFdVZRR,             & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcFeFeVZRL,cplcFeFeVZRR,IntegralSs,IntegralSSss,IntegralVs,IntegralVSss,             & 
& IntegralVVss,NSs,NSSss,NVs,NVSss,NVVss,gTVZtemp,gTVZRtemp,gTAhtemp,gThhtemp,           & 
& deltaM,epsI,check,gFdFdcFeFei)

gFdFdcFeFe(i_run,:,:,:) = gFdFdcFeFei 
gT(i_run) = gT(i_run) + Sum(gFdFdcFeFei) 
 
gFdFdcFuFui = 0._dp 
Call FdToFdcFuFu(i_run,MFd,MFu,MVZ,MVZR,MVWLm,MVWRm,MHpm,MAh,Mhh,cplcFdFdAhL,         & 
& cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZRL,              & 
& cplcFdFdVZRR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFdFuVWLmL,cplcFdFuVWLmR,cplcFdFuVWRmL,      & 
& cplcFdFuVWRmR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWLmL,cplcFuFdcVWLmR,               & 
& cplcFuFdcVWRmL,cplcFuFdcVWRmR,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuhhL,cplcFuFuhhR,         & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZRL,cplcFuFuVZRR,IntegralSs,IntegralSSss,             & 
& IntegralSSst,IntegralVs,IntegralVSss,IntegralVSst,IntegralVVss,IntegralVVst,           & 
& NSs,NSSss,NSSst,NVs,NVSss,NVSst,NVVss,NVVst,gTVZtemp,gTVZRtemp,gTVWLmtemp,             & 
& gTVWRmtemp,gTHpmtemp,gTAhtemp,gThhtemp,deltaM,epsI,check,gFdFdcFuFui)

gFdFdcFuFu(i_run,:,:,:) = gFdFdcFuFui 
gT(i_run) = gT(i_run) + Sum(gFdFdcFuFui) 
 
gFdFdFvFvi = 0._dp 
Call FdToFdFvFv(i_run,MFd,MFv,MVZ,MVZR,MAh,Mhh,cplcFdFdAhL,cplcFdFdAhR,               & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZRL,cplcFdFdVZRR,             & 
& cplFvFvAhL,cplFvFvAhR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZRL,         & 
& cplFvFvVZRR,IntegralSs,IntegralSSss,IntegralVs,IntegralVSss,IntegralVVss,              & 
& NSs,NSSss,NVs,NVSss,NVVss,gTVZtemp,gTVZRtemp,gTAhtemp,gThhtemp,deltaM,epsI,            & 
& check,gFdFdFvFvi)

gFdFdFvFv(i_run,:,:,:) = gFdFdFvFvi 
gT(i_run) = gT(i_run) + Sum(gFdFdFvFvi) 
 
gFdFdcFcppFcppi = 0._dp 
Call FdToFdcFcppFcpp(i_run,MFd,MFcpp,MVZ,MVZR,cplcFcppFcppVZL,cplcFcppFcppVZR,        & 
& cplcFcppFcppVZRL,cplcFcppFcppVZRR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZRL,cplcFdFdVZRR,   & 
& IntegralVs,IntegralVVss,NVs,NVVss,gTVZtemp,gTVZRtemp,deltaM,epsI,check,gFdFdcFcppFcppi)

gFdFdcFcppFcpp(i_run,:,:,:) = gFdFdcFcppFcppi 
gT(i_run) = gT(i_run) + Sum(gFdFdcFcppFcppi) 
 
gFdFucFcpFci = 0._dp 
Call FdToFucFcpFc(i_run,MFu,MFcp,MFc,MVWLm,MVWRm,MHpm,MFd,cplcFcpFccHpmL,             & 
& cplcFcpFccHpmR,cplcFcpFccVWLmL,cplcFcpFccVWLmR,cplcFcpFccVWRmL,cplcFcpFccVWRmR,        & 
& cplcFdFuHpmL,cplcFdFuHpmR,cplcFdFuVWLmL,cplcFdFuVWLmR,cplcFdFuVWRmL,cplcFdFuVWRmR,     & 
& IntegralSs,IntegralSSss,IntegralVs,IntegralVSss,IntegralVVss,NSs,NSSss,NVs,            & 
& NVSss,NVVss,gTVWLmtemp,gTVWRmtemp,gTHpmtemp,deltaM,epsI,check,gFdFucFcpFci)

gFdFucFcpFc(i_run,:,:,:) = gFdFucFcpFci 
gT(i_run) = gT(i_run) + Sum(gFdFucFcpFci) 
 
gFdFucFcppFcpi = 0._dp 
Call FdToFucFcppFcp(i_run,MFu,MFcpp,MFcp,MVWLm,MVWRm,MHpm,MFd,cplcFcppFcpcHpmL,       & 
& cplcFcppFcpcHpmR,cplcFcppFcpcVWLmL,cplcFcppFcpcVWLmR,cplcFcppFcpcVWRmL,cplcFcppFcpcVWRmR,& 
& cplcFdFuHpmL,cplcFdFuHpmR,cplcFdFuVWLmL,cplcFdFuVWLmR,cplcFdFuVWRmL,cplcFdFuVWRmR,     & 
& IntegralSs,IntegralSSss,IntegralVs,IntegralVSss,IntegralVVss,NSs,NSSss,NVs,            & 
& NVSss,NVVss,gTVWLmtemp,gTVWRmtemp,gTHpmtemp,deltaM,epsI,check,gFdFucFcppFcpi)

gFdFucFcppFcp(i_run,:,:,:) = gFdFucFcppFcpi 
gT(i_run) = gT(i_run) + Sum(gFdFucFcppFcpi) 
 
gFdFucFeFvi = 0._dp 
Call FdToFucFeFv(i_run,MFu,MFe,MFv,MVWLm,MVWRm,MHpm,MFd,cplcFdFuHpmL,cplcFdFuHpmR,    & 
& cplcFdFuVWLmL,cplcFdFuVWLmR,cplcFdFuVWRmL,cplcFdFuVWRmR,cplcFeFvcHpmL,cplcFeFvcHpmR,   & 
& cplcFeFvcVWLmL,cplcFeFvcVWLmR,cplcFeFvcVWRmL,cplcFeFvcVWRmR,IntegralSs,IntegralSSss,   & 
& IntegralVs,IntegralVSss,IntegralVVss,NSs,NSSss,NVs,NVSss,NVVss,gTVWLmtemp,             & 
& gTVWRmtemp,gTHpmtemp,deltaM,epsI,check,gFdFucFeFvi)

gFdFucFeFv(i_run,:,:,:) = gFdFucFeFvi 
gT(i_run) = gT(i_run) + Sum(gFdFucFeFvi) 
 
End Do 
 

If (Present(gPartial)) Then
Do i1 = i_start, i_end 
 
n_length=1
Do gt1=1,3
  Do gt2=1,3
    Do gt3=gt2,3
gPartial(i1,n_length)= gFdFdFcFc(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,2
    Do gt3=1,2
gPartial(i1,n_length)= gFdFdcFcpFcp(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=gt1,3
gPartial(i1,n_length)= gFdFdcFdFd(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
gPartial(i1,n_length)= gFdFdcFeFe(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
gPartial(i1,n_length)= gFdFdcFuFu(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,6
    Do gt3=gt2,6
gPartial(i1,n_length)= gFdFdFvFv(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,1
    Do gt3=1,1
gPartial(i1,n_length)= gFdFdcFcppFcpp(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,2
    Do gt3=1,3
gPartial(i1,n_length)= gFdFucFcpFc(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,1
    Do gt3=1,2
gPartial(i1,n_length)= gFdFucFcppFcp(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,6
gPartial(i1,n_length)= gFdFucFeFv(i1,gt1,gt2,gt3)
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
 
End Subroutine FdThreeBodyDecay
 
 
Subroutine FdToFdFcFc(iIN,MFd,MFc,MVZ,MVZR,MAh,Mhh,cplcFdFdAhL,cplcFdFdAhR,           & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZRL,cplcFdFdVZRR,             & 
& cplFcFcAhL,cplFcFcAhR,cplFcFchhL,cplFcFchhR,cplFcFcVZL,cplFcFcVZR,cplFcFcVZRL,         & 
& cplFcFcVZRR,IntegralSs,IntegralSSss,IntegralVs,IntegralVSss,IntegralVVss,              & 
& NSs,NSSss,NVs,NVSss,NVVss,gTVZ,gTVZR,gTAh,gThh,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFd(3),MFc(3),MVZ,MVZR,MAh(3),Mhh(3)

Complex(dp),Intent(in) :: cplcFdFdAhL(3,3,3),cplcFdFdAhR(3,3,3),cplcFdFdhhL(3,3,3),cplcFdFdhhR(3,3,3),          & 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFdFdVZRL(3,3),cplcFdFdVZRR(3,3),cplFcFcAhL(3,3,3),& 
& cplFcFcAhR(3,3,3),cplFcFchhL(3,3,3),cplFcFchhR(3,3,3),cplFcFcVZL(3,3),cplFcFcVZR(3,3), & 
& cplFcFcVZRL(3,3),cplFcFcVZRR(3,3)

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
mass(1) = MFd(iIN) 
 
Isum = 64 
Allocate( gSum(3,3,3, Isum) ) 
Allocate( Contribution(3,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1, iIN-1
      Do gt2=1,3
        Do gt3=gt2,3
Isum = 0 
 
If(Abs(MFd(iIN)).gt.(Abs(MFc(gt3))+Abs(MFc(gt2))+Abs(MFd(gt1)))) Then 
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
 
mass(2) = MFd(gt1) 
mass(3) = -MFc(gt2) 
mass(4) = MFc(gt3) 
 
coup(2) = Conjg(cplcFdFdVZL(iIN,gt1)) 
coup(1) = Conjg(cplcFdFdVZR(iIN,gt1)) 
coup(4) = Conjg(cplFcFcVZL(gt2,gt3)) 
coup(3) = Conjg(cplFcFcVZR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFd(gt1) 
mass(3) = -MFc(gt3) 
mass(4) = MFc(gt2) 
 
coup2(1) = cplcFdFdVZL(iIN,gt1) 
coup2(2) = cplcFdFdVZR(iIN,gt1) 
coup2(4) = Conjg(cplcFdFdVZL(iIN,gt1)) 
coup2(3) = Conjg(cplcFdFdVZR(iIN,gt1))  
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
Write(*,*) "Fd->Fd Fc Fc Propagator: VZ" 
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
 
mass(2) = MFd(gt1) 
mass(3) = -MFc(gt2) 
mass(4) = MFc(gt3) 
 
coup(2) = Conjg(cplcFdFdVZRL(iIN,gt1)) 
coup(1) = Conjg(cplcFdFdVZRR(iIN,gt1)) 
coup(4) = Conjg(cplFcFcVZRL(gt2,gt3)) 
coup(3) = Conjg(cplFcFcVZRR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFd(gt1) 
mass(3) = -MFc(gt3) 
mass(4) = MFc(gt2) 
 
coup2(1) = cplcFdFdVZRL(iIN,gt1) 
coup2(2) = cplcFdFdVZRR(iIN,gt1) 
coup2(4) = Conjg(cplcFdFdVZRL(iIN,gt1)) 
coup2(3) = Conjg(cplcFdFdVZRR(iIN,gt1))  
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
Write(*,*) "Fd->Fd Fc Fc Propagator: VZR" 
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
 
mass(2) = MFd(gt1) 
mass(3) = -MFc(gt2) 
mass(4) = MFc(gt3) 
 
coup(2) = Conjg(cplcFdFdAhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcFdFdAhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplFcFcAhL(gt2,gt3,i1)) 
coup(3) = Conjg(cplFcFcAhR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFd(gt1) 
mass(3) = -MFc(gt3) 
mass(4) = MFc(gt2) 
 
coup2(1) = cplcFdFdAhL(iIN,gt1,i1) 
coup2(2) = cplcFdFdAhR(iIN,gt1,i1) 
coup2(3) = Conjg(cplcFdFdAhL(iIN,gt1,i1)) 
coup2(4) = Conjg(cplcFdFdAhR(iIN,gt1,i1))  
coup2(5) = cplFcFcAhL(gt3,gt2,i1) 
coup2(6) = cplFcFcAhR(gt3,gt2,i1) 
coup2(7) = Conjg(cplFcFcAhL(gt2,gt3,i1)) 
coup2(8) = Conjg(cplFcFcAhR(gt2,gt3,i1)) 
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
Write(*,*) "Fd->Fd Fc Fc Propagator: Ah" 
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
 
mass(2) = MFd(gt1) 
mass(3) = -MFc(gt2) 
mass(4) = MFc(gt3) 
 
coup(2) = Conjg(cplcFdFdhhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcFdFdhhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplFcFchhL(gt2,gt3,i1)) 
coup(3) = Conjg(cplFcFchhR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFd(gt1) 
mass(3) = -MFc(gt3) 
mass(4) = MFc(gt2) 
 
coup2(1) = cplcFdFdhhL(iIN,gt1,i1) 
coup2(2) = cplcFdFdhhR(iIN,gt1,i1) 
coup2(3) = Conjg(cplcFdFdhhL(iIN,gt1,i1)) 
coup2(4) = Conjg(cplcFdFdhhR(iIN,gt1,i1))  
coup2(5) = cplFcFchhL(gt3,gt2,i1) 
coup2(6) = cplFcFchhR(gt3,gt2,i1) 
coup2(7) = Conjg(cplFcFchhL(gt2,gt3,i1)) 
coup2(8) = Conjg(cplFcFchhR(gt2,gt3,i1)) 
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
Write(*,*) "Fd->Fd Fc Fc Propagator: hh" 
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
mass(2) = MFd(gt1) 
mass(3) = -MFc(gt2) 
mass(4) = MFc(gt3) 
 
coup2(1) = cplcFdFdVZL(iIN,gt1) 
coup2(2) = cplcFdFdVZR(iIN,gt1) 
coup2(4) = Conjg(cplcFdFdVZRL(iIN,gt1)) 
coup2(3) = Conjg(cplcFdFdVZRR(iIN,gt1))  
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
Write(*,*) "Fd->Fd Fc Fc Propagator: VZ,VZR" 
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
mass(2) = MFd(gt1) 
mass(3) = -MFc(gt2) 
mass(4) = MFc(gt3) 
 
coup2(1) = cplcFdFdVZL(iIN,gt1) 
coup2(2) = cplcFdFdVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFdFdAhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFdFdAhR(iIN,gt1,i2))  
coup2(5) = cplFcFcVZL(gt2,gt3) 
coup2(6) = cplFcFcVZR(gt2,gt3) 
coup2(7) = Conjg(cplFcFcAhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplFcFcAhR(gt2,gt3,i2)) 
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
Write(*,*) "Fd->Fd Fc Fc Propagator: VZ,Ah" 
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
mass(2) = MFd(gt1) 
mass(3) = -MFc(gt2) 
mass(4) = MFc(gt3) 
 
coup2(1) = cplcFdFdVZL(iIN,gt1) 
coup2(2) = cplcFdFdVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFdFdhhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFdFdhhR(iIN,gt1,i2))  
coup2(5) = cplFcFcVZL(gt2,gt3) 
coup2(6) = cplFcFcVZR(gt2,gt3) 
coup2(7) = Conjg(cplFcFchhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplFcFchhR(gt2,gt3,i2)) 
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
Write(*,*) "Fd->Fd Fc Fc Propagator: VZ,hh" 
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
mass(2) = MFd(gt1) 
mass(3) = -MFc(gt2) 
mass(4) = MFc(gt3) 
 
coup2(1) = cplcFdFdVZRL(iIN,gt1) 
coup2(2) = cplcFdFdVZRR(iIN,gt1) 
coup2(3) = Conjg(cplcFdFdAhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFdFdAhR(iIN,gt1,i2))  
coup2(5) = cplFcFcVZRL(gt2,gt3) 
coup2(6) = cplFcFcVZRR(gt2,gt3) 
coup2(7) = Conjg(cplFcFcAhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplFcFcAhR(gt2,gt3,i2)) 
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
Write(*,*) "Fd->Fd Fc Fc Propagator: VZR,Ah" 
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
mass(2) = MFd(gt1) 
mass(3) = -MFc(gt2) 
mass(4) = MFc(gt3) 
 
coup2(1) = cplcFdFdVZRL(iIN,gt1) 
coup2(2) = cplcFdFdVZRR(iIN,gt1) 
coup2(3) = Conjg(cplcFdFdhhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFdFdhhR(iIN,gt1,i2))  
coup2(5) = cplFcFcVZRL(gt2,gt3) 
coup2(6) = cplFcFcVZRR(gt2,gt3) 
coup2(7) = Conjg(cplFcFchhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplFcFchhR(gt2,gt3,i2)) 
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
Write(*,*) "Fd->Fd Fc Fc Propagator: VZR,hh" 
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
mass(2) = MFd(gt1) 
mass(3) = -MFc(gt2) 
mass(4) = MFc(gt3) 
 
coup2(1) = cplcFdFdAhL(iIN,gt1,i1) 
coup2(2) = cplcFdFdAhR(iIN,gt1,i1) 
coup2(3) = Conjg(cplcFdFdAhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFdFdAhR(iIN,gt1,i2))  
coup2(5) = cplFcFcAhL(gt2,gt3,i1) 
coup2(6) = cplFcFcAhR(gt2,gt3,i1) 
coup2(7) = Conjg(cplFcFcAhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplFcFcAhR(gt2,gt3,i2)) 
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
Write(*,*) "Fd->Fd Fc Fc Propagator: Ah,Ah" 
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
mass(2) = MFd(gt1) 
mass(3) = -MFc(gt2) 
mass(4) = MFc(gt3) 
 
coup2(1) = cplcFdFdAhL(iIN,gt1,i1) 
coup2(2) = cplcFdFdAhR(iIN,gt1,i1) 
coup2(3) = Conjg(cplcFdFdhhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFdFdhhR(iIN,gt1,i2))  
coup2(5) = cplFcFcAhL(gt2,gt3,i1) 
coup2(6) = cplFcFcAhR(gt2,gt3,i1) 
coup2(7) = Conjg(cplFcFchhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplFcFchhR(gt2,gt3,i2)) 
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
Write(*,*) "Fd->Fd Fc Fc Propagator: Ah,hh" 
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
mass(2) = MFd(gt1) 
mass(3) = -MFc(gt2) 
mass(4) = MFc(gt3) 
 
coup2(1) = cplcFdFdhhL(iIN,gt1,i1) 
coup2(2) = cplcFdFdhhR(iIN,gt1,i1) 
coup2(3) = Conjg(cplcFdFdhhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFdFdhhR(iIN,gt1,i2))  
coup2(5) = cplFcFchhL(gt2,gt3,i1) 
coup2(6) = cplFcFchhR(gt2,gt3,i1) 
coup2(7) = Conjg(cplFcFchhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplFcFchhR(gt2,gt3,i2)) 
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
Write(*,*) "Fd->Fd Fc Fc Propagator: hh,hh" 
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
        Do gt3=gt2,3
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:64))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
  g = oo512pi3 / Abs(MFd(iIN))**3*g
End Subroutine FdToFdFcFc 
 
 
Subroutine FdToFdcFcpFcp(iIN,MFd,MFcp,MVZ,MVZR,MAh,Mhh,cplcFcpFcpAhL,cplcFcpFcpAhR,   & 
& cplcFcpFcphhL,cplcFcpFcphhR,cplcFcpFcpVZL,cplcFcpFcpVZR,cplcFcpFcpVZRL,cplcFcpFcpVZRR, & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFdFdVZRL,cplcFdFdVZRR,IntegralSs,IntegralSSss,IntegralVs,IntegralVSss,             & 
& IntegralVVss,NSs,NSSss,NVs,NVSss,NVVss,gTVZ,gTVZR,gTAh,gThh,deltaM,epsI,               & 
& check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFd(3),MFcp(2),MVZ,MVZR,MAh(3),Mhh(3)

Complex(dp),Intent(in) :: cplcFcpFcpAhL(2,2,3),cplcFcpFcpAhR(2,2,3),cplcFcpFcphhL(2,2,3),cplcFcpFcphhR(2,2,3),  & 
& cplcFcpFcpVZL(2,2),cplcFcpFcpVZR(2,2),cplcFcpFcpVZRL(2,2),cplcFcpFcpVZRR(2,2),         & 
& cplcFdFdAhL(3,3,3),cplcFdFdAhR(3,3,3),cplcFdFdhhL(3,3,3),cplcFdFdhhR(3,3,3),           & 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFdFdVZRL(3,3),cplcFdFdVZRR(3,3)

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
mass(1) = MFd(iIN) 
 
Isum = 64 
Allocate( gSum(3,2,2, Isum) ) 
Allocate( Contribution(3,2,2, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1, iIN-1
      Do gt2=1,2
        Do gt3=1,2
Isum = 0 
 
If(Abs(MFd(iIN)).gt.(Abs(MFcp(gt3))+Abs(MFcp(gt2))+Abs(MFd(gt1)))) Then 
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
 
mass(2) = MFd(gt1) 
mass(3) = -MFcp(gt2) 
mass(4) = MFcp(gt3) 
 
coup(2) = Conjg(cplcFdFdVZL(iIN,gt1)) 
coup(1) = Conjg(cplcFdFdVZR(iIN,gt1)) 
coup(4) = Conjg(cplcFcpFcpVZL(gt2,gt3)) 
coup(3) = Conjg(cplcFcpFcpVZR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFcp Fcp Propagator: VZ" 
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
 
mass(2) = MFd(gt1) 
mass(3) = -MFcp(gt2) 
mass(4) = MFcp(gt3) 
 
coup(2) = Conjg(cplcFdFdVZRL(iIN,gt1)) 
coup(1) = Conjg(cplcFdFdVZRR(iIN,gt1)) 
coup(4) = Conjg(cplcFcpFcpVZRL(gt2,gt3)) 
coup(3) = Conjg(cplcFcpFcpVZRR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFcp Fcp Propagator: VZR" 
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
 
mass(2) = MFd(gt1) 
mass(3) = -MFcp(gt2) 
mass(4) = MFcp(gt3) 
 
coup(2) = Conjg(cplcFdFdAhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcFdFdAhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplcFcpFcpAhL(gt2,gt3,i1)) 
coup(3) = Conjg(cplcFcpFcpAhR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFcp Fcp Propagator: Ah" 
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
 
mass(2) = MFd(gt1) 
mass(3) = -MFcp(gt2) 
mass(4) = MFcp(gt3) 
 
coup(2) = Conjg(cplcFdFdhhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcFdFdhhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplcFcpFcphhL(gt2,gt3,i1)) 
coup(3) = Conjg(cplcFcpFcphhR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFcp Fcp Propagator: hh" 
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
mass(2) = MFd(gt1) 
mass(3) = -MFcp(gt2) 
mass(4) = MFcp(gt3) 
 
coup2(1) = cplcFdFdVZL(iIN,gt1) 
coup2(2) = cplcFdFdVZR(iIN,gt1) 
coup2(4) = Conjg(cplcFdFdVZRL(iIN,gt1)) 
coup2(3) = Conjg(cplcFdFdVZRR(iIN,gt1))  
coup2(5) = cplcFcpFcpVZL(gt2,gt3) 
coup2(6) = cplcFcpFcpVZR(gt2,gt3) 
coup2(8) = Conjg(cplcFcpFcpVZRL(gt2,gt3)) 
coup2(7) = Conjg(cplcFcpFcpVZRR(gt2,gt3)) 
Call IntegrateGaugeSS(Boson4, mass, coup2, deltaM, epsI,IntegralVVss,NVVss, resR, check) 
If (resR.ne.resR) resR = 0._dp
resC = 2._dp*resR 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFcp Fcp Propagator: VZ,VZR" 
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
mass(2) = MFd(gt1) 
mass(3) = -MFcp(gt2) 
mass(4) = MFcp(gt3) 
 
coup2(1) = cplcFdFdVZL(iIN,gt1) 
coup2(2) = cplcFdFdVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFdFdAhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFdFdAhR(iIN,gt1,i2))  
coup2(5) = cplcFcpFcpVZL(gt2,gt3) 
coup2(6) = cplcFcpFcpVZR(gt2,gt3) 
coup2(7) = Conjg(cplcFcpFcpAhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFcpFcpAhR(gt2,gt3,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFcp Fcp Propagator: VZ,Ah" 
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
mass(2) = MFd(gt1) 
mass(3) = -MFcp(gt2) 
mass(4) = MFcp(gt3) 
 
coup2(1) = cplcFdFdVZL(iIN,gt1) 
coup2(2) = cplcFdFdVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFdFdhhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFdFdhhR(iIN,gt1,i2))  
coup2(5) = cplcFcpFcpVZL(gt2,gt3) 
coup2(6) = cplcFcpFcpVZR(gt2,gt3) 
coup2(7) = Conjg(cplcFcpFcphhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFcpFcphhR(gt2,gt3,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFcp Fcp Propagator: VZ,hh" 
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
mass(2) = MFd(gt1) 
mass(3) = -MFcp(gt2) 
mass(4) = MFcp(gt3) 
 
coup2(1) = cplcFdFdVZRL(iIN,gt1) 
coup2(2) = cplcFdFdVZRR(iIN,gt1) 
coup2(3) = Conjg(cplcFdFdAhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFdFdAhR(iIN,gt1,i2))  
coup2(5) = cplcFcpFcpVZRL(gt2,gt3) 
coup2(6) = cplcFcpFcpVZRR(gt2,gt3) 
coup2(7) = Conjg(cplcFcpFcpAhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFcpFcpAhR(gt2,gt3,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFcp Fcp Propagator: VZR,Ah" 
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
mass(2) = MFd(gt1) 
mass(3) = -MFcp(gt2) 
mass(4) = MFcp(gt3) 
 
coup2(1) = cplcFdFdVZRL(iIN,gt1) 
coup2(2) = cplcFdFdVZRR(iIN,gt1) 
coup2(3) = Conjg(cplcFdFdhhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFdFdhhR(iIN,gt1,i2))  
coup2(5) = cplcFcpFcpVZRL(gt2,gt3) 
coup2(6) = cplcFcpFcpVZRR(gt2,gt3) 
coup2(7) = Conjg(cplcFcpFcphhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFcpFcphhR(gt2,gt3,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFcp Fcp Propagator: VZR,hh" 
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
mass(2) = MFd(gt1) 
mass(3) = -MFcp(gt2) 
mass(4) = MFcp(gt3) 
 
coup2(1) = cplcFdFdAhL(iIN,gt1,i1) 
coup2(2) = cplcFdFdAhR(iIN,gt1,i1) 
coup2(3) = Conjg(cplcFdFdAhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFdFdAhR(iIN,gt1,i2))  
coup2(5) = cplcFcpFcpAhL(gt2,gt3,i1) 
coup2(6) = cplcFcpFcpAhR(gt2,gt3,i1) 
coup2(7) = Conjg(cplcFcpFcpAhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFcpFcpAhR(gt2,gt3,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFcp Fcp Propagator: Ah,Ah" 
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
mass(2) = MFd(gt1) 
mass(3) = -MFcp(gt2) 
mass(4) = MFcp(gt3) 
 
coup2(1) = cplcFdFdAhL(iIN,gt1,i1) 
coup2(2) = cplcFdFdAhR(iIN,gt1,i1) 
coup2(3) = Conjg(cplcFdFdhhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFdFdhhR(iIN,gt1,i2))  
coup2(5) = cplcFcpFcpAhL(gt2,gt3,i1) 
coup2(6) = cplcFcpFcpAhR(gt2,gt3,i1) 
coup2(7) = Conjg(cplcFcpFcphhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFcpFcphhR(gt2,gt3,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFcp Fcp Propagator: Ah,hh" 
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
mass(2) = MFd(gt1) 
mass(3) = -MFcp(gt2) 
mass(4) = MFcp(gt3) 
 
coup2(1) = cplcFdFdhhL(iIN,gt1,i1) 
coup2(2) = cplcFdFdhhR(iIN,gt1,i1) 
coup2(3) = Conjg(cplcFdFdhhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFdFdhhR(iIN,gt1,i2))  
coup2(5) = cplcFcpFcphhL(gt2,gt3,i1) 
coup2(6) = cplcFcpFcphhR(gt2,gt3,i1) 
coup2(7) = Conjg(cplcFcpFcphhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFcpFcphhR(gt2,gt3,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFcp Fcp Propagator: hh,hh" 
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
      Do gt2=1,2
        Do gt3=1,2
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:64))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
  g = oo512pi3 / Abs(MFd(iIN))**3*g
End Subroutine FdToFdcFcpFcp 
 
 
Subroutine FdToFdcFdFd(iIN,MFd,MVZ,MVZR,MAh,Mhh,cplcFdFdAhL,cplcFdFdAhR,              & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZRL,cplcFdFdVZRR,             & 
& IntegralSs,IntegralSSss,IntegralSSst,IntegralVs,IntegralVSss,IntegralVSst,             & 
& IntegralVVss,IntegralVVst,NSs,NSSss,NSSst,NVs,NVSss,NVSst,NVVss,NVVst,gTVZ,            & 
& gTVZR,gTAh,gThh,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFd(3),MVZ,MVZR,MAh(3),Mhh(3)

Complex(dp),Intent(in) :: cplcFdFdAhL(3,3,3),cplcFdFdAhR(3,3,3),cplcFdFdhhL(3,3,3),cplcFdFdhhR(3,3,3),          & 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFdFdVZRL(3,3),cplcFdFdVZRR(3,3)

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
mass(1) = MFd(iIN) 
 
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
 
If(Abs(MFd(iIN)).gt.(Abs(MFd(gt3))+Abs(MFd(gt2))+Abs(MFd(gt1)))) Then 
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
 
mass(2) = MFd(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup(2) = Conjg(cplcFdFdVZL(iIN,gt1)) 
coup(1) = Conjg(cplcFdFdVZR(iIN,gt1)) 
coup(4) = Conjg(cplcFdFdVZL(gt2,gt3)) 
coup(3) = Conjg(cplcFdFdVZR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 3*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFd(gt3) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt1) 
 
coup(2) = Conjg(cplcFdFdVZL(iIN,gt3)) 
coup(1) = Conjg(cplcFdFdVZR(iIN,gt3)) 
coup(4) = Conjg(cplcFdFdVZL(gt2,gt1)) 
coup(3) = Conjg(cplcFdFdVZR(gt2,gt1))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 3*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFd(gt1) 
mass(4) = MFd(gt3) 
mass(3) = -MFd(gt2) 
 
coup2(1) = cplcFdFdVZL(iIN,gt3) 
coup2(2) = cplcFdFdVZR(iIN,gt3) 
coup2(4) = Conjg(cplcFdFdVZL(iIN,gt1)) 
coup2(3) = Conjg(cplcFdFdVZR(iIN,gt1))  
coup2(5) = cplcFdFdVZL(gt2,gt1) 
coup2(6) = cplcFdFdVZR(gt2,gt1) 
coup2(8) = Conjg(cplcFdFdVZL(gt2,gt3)) 
coup2(7) = Conjg(cplcFdFdVZR(gt2,gt3)) 
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
Write(*,*) "Fd->Fd cFd Fd Propagator: VZ" 
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
 
mass(2) = MFd(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup(2) = Conjg(cplcFdFdVZRL(iIN,gt1)) 
coup(1) = Conjg(cplcFdFdVZRR(iIN,gt1)) 
coup(4) = Conjg(cplcFdFdVZRL(gt2,gt3)) 
coup(3) = Conjg(cplcFdFdVZRR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 3*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFd(gt3) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt1) 
 
coup(2) = Conjg(cplcFdFdVZRL(iIN,gt3)) 
coup(1) = Conjg(cplcFdFdVZRR(iIN,gt3)) 
coup(4) = Conjg(cplcFdFdVZRL(gt2,gt1)) 
coup(3) = Conjg(cplcFdFdVZRR(gt2,gt1))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 3*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFd(gt1) 
mass(4) = MFd(gt3) 
mass(3) = -MFd(gt2) 
 
coup2(1) = cplcFdFdVZRL(iIN,gt3) 
coup2(2) = cplcFdFdVZRR(iIN,gt3) 
coup2(4) = Conjg(cplcFdFdVZRL(iIN,gt1)) 
coup2(3) = Conjg(cplcFdFdVZRR(iIN,gt1))  
coup2(5) = cplcFdFdVZRL(gt2,gt1) 
coup2(6) = cplcFdFdVZRR(gt2,gt1) 
coup2(8) = Conjg(cplcFdFdVZRL(gt2,gt3)) 
coup2(7) = Conjg(cplcFdFdVZRR(gt2,gt3)) 
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
Write(*,*) "Fd->Fd cFd Fd Propagator: VZR" 
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
 
mass(2) = MFd(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup(2) = Conjg(cplcFdFdAhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcFdFdAhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplcFdFdAhL(gt2,gt3,i1)) 
coup(3) = Conjg(cplcFdFdAhR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 3*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFd(gt3) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt1) 
 
coup(2) = Conjg(cplcFdFdAhL(iIN,gt3,i1)) 
coup(1) = Conjg(cplcFdFdAhR(iIN,gt3,i1)) 
coup(4) = Conjg(cplcFdFdAhL(gt2,gt1,i1)) 
coup(3) = Conjg(cplcFdFdAhR(gt2,gt1,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 3*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFd(gt1) 
mass(4) = MFd(gt3) 
mass(3) = -MFd(gt2) 
 
coup2(1) = cplcFdFdAhL(iIN,gt3,i1) 
coup2(2) = cplcFdFdAhR(iIN,gt3,i1) 
coup2(3) = Conjg(cplcFdFdAhL(iIN,gt1,i1)) 
coup2(4) = Conjg(cplcFdFdAhR(iIN,gt1,i1))  
coup2(5) = cplcFdFdAhL(gt2,gt1,i1) 
coup2(6) = cplcFdFdAhR(gt2,gt1,i1) 
coup2(7) = Conjg(cplcFdFdAhL(gt2,gt3,i1)) 
coup2(8) = Conjg(cplcFdFdAhR(gt2,gt3,i1)) 
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
Write(*,*) "Fd->Fd cFd Fd Propagator: Ah" 
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
 
mass(2) = MFd(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup(2) = Conjg(cplcFdFdhhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcFdFdhhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplcFdFdhhL(gt2,gt3,i1)) 
coup(3) = Conjg(cplcFdFdhhR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 3*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFd(gt3) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt1) 
 
coup(2) = Conjg(cplcFdFdhhL(iIN,gt3,i1)) 
coup(1) = Conjg(cplcFdFdhhR(iIN,gt3,i1)) 
coup(4) = Conjg(cplcFdFdhhL(gt2,gt1,i1)) 
coup(3) = Conjg(cplcFdFdhhR(gt2,gt1,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 3*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFd(gt1) 
mass(4) = MFd(gt3) 
mass(3) = -MFd(gt2) 
 
coup2(1) = cplcFdFdhhL(iIN,gt3,i1) 
coup2(2) = cplcFdFdhhR(iIN,gt3,i1) 
coup2(3) = Conjg(cplcFdFdhhL(iIN,gt1,i1)) 
coup2(4) = Conjg(cplcFdFdhhR(iIN,gt1,i1))  
coup2(5) = cplcFdFdhhL(gt2,gt1,i1) 
coup2(6) = cplcFdFdhhR(gt2,gt1,i1) 
coup2(7) = Conjg(cplcFdFdhhL(gt2,gt3,i1)) 
coup2(8) = Conjg(cplcFdFdhhR(gt2,gt3,i1)) 
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
Write(*,*) "Fd->Fd cFd Fd Propagator: hh" 
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
mass(2) = MFd(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup2(1) = cplcFdFdVZL(iIN,gt1) 
coup2(2) = cplcFdFdVZR(iIN,gt1) 
coup2(4) = Conjg(cplcFdFdVZRL(iIN,gt1)) 
coup2(3) = Conjg(cplcFdFdVZRR(iIN,gt1))  
coup2(5) = cplcFdFdVZL(gt2,gt3) 
coup2(6) = cplcFdFdVZR(gt2,gt3) 
coup2(8) = Conjg(cplcFdFdVZRL(gt2,gt3)) 
coup2(7) = Conjg(cplcFdFdVZRR(gt2,gt3)) 
Call IntegrateGaugeSS(Boson4, mass, coup2, deltaM, epsI,IntegralVVss,NVVss, resR, check) 
If (resR.ne.resR) resR = 0._dp
resC = 2._dp*resR 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFd(gt1) 
mass(4) = MFd(gt3) 
mass(3) = -MFd(gt2) 
 
coup2(1) = cplcFdFdVZL(iIN,gt3) 
coup2(2) = cplcFdFdVZR(iIN,gt3) 
coup2(4) = Conjg(cplcFdFdVZRL(iIN,gt1)) 
coup2(3) = Conjg(cplcFdFdVZRR(iIN,gt1))  
coup2(5) = cplcFdFdVZL(gt2,gt1) 
coup2(6) = cplcFdFdVZR(gt2,gt1) 
coup2(8) = Conjg(cplcFdFdVZRL(gt2,gt3)) 
coup2(7) = Conjg(cplcFdFdVZRR(gt2,gt3)) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFd(gt3) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt1) 
 
coup2(1) = cplcFdFdVZL(iIN,gt3) 
coup2(2) = cplcFdFdVZR(iIN,gt3) 
coup2(4) = Conjg(cplcFdFdVZRL(iIN,gt3)) 
coup2(3) = Conjg(cplcFdFdVZRR(iIN,gt3))  
coup2(5) = cplcFdFdVZL(gt2,gt1) 
coup2(6) = cplcFdFdVZR(gt2,gt1) 
coup2(8) = Conjg(cplcFdFdVZRL(gt2,gt1)) 
coup2(7) = Conjg(cplcFdFdVZRR(gt2,gt1)) 
Call IntegrateGaugeSS(Boson4, mass, coup2, deltaM, epsI,IntegralVVss,NVVss, resR, check) 
If (resR.ne.resR) resR = 0._dp
resC = 2._dp*resR 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFd(gt3) 
mass(4) = MFd(gt1) 
mass(3) = -MFd(gt2) 
 
coup2(1) = cplcFdFdVZL(iIN,gt1) 
coup2(2) = cplcFdFdVZR(iIN,gt1) 
coup2(4) = Conjg(cplcFdFdVZRL(iIN,gt3)) 
coup2(3) = Conjg(cplcFdFdVZRR(iIN,gt3))  
coup2(5) = cplcFdFdVZL(gt2,gt3) 
coup2(6) = cplcFdFdVZR(gt2,gt3) 
coup2(8) = Conjg(cplcFdFdVZRL(gt2,gt1)) 
coup2(7) = Conjg(cplcFdFdVZRR(gt2,gt1)) 
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
Write(*,*) "Fd->Fd cFd Fd Propagator: VZ,VZR" 
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
mass(2) = MFd(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup2(1) = cplcFdFdVZL(iIN,gt1) 
coup2(2) = cplcFdFdVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFdFdAhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFdFdAhR(iIN,gt1,i2))  
coup2(5) = cplcFdFdVZL(gt2,gt3) 
coup2(6) = cplcFdFdVZR(gt2,gt3) 
coup2(7) = Conjg(cplcFdFdAhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFdFdAhR(gt2,gt3,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFd(gt1) 
mass(4) = MFd(gt3) 
mass(3) = -MFd(gt2) 
 
coup2(1) = cplcFdFdVZL(iIN,gt3) 
coup2(2) = cplcFdFdVZR(iIN,gt3) 
coup2(3) = Conjg(cplcFdFdAhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFdFdAhR(iIN,gt1,i2))  
coup2(5) = cplcFdFdVZL(gt2,gt1) 
coup2(6) = cplcFdFdVZR(gt2,gt1) 
coup2(7) = Conjg(cplcFdFdAhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFdFdAhR(gt2,gt3,i2)) 
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
mass(2) = MFd(gt3) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt1) 
 
coup2(1) = cplcFdFdVZL(iIN,gt3) 
coup2(2) = cplcFdFdVZR(iIN,gt3) 
coup2(3) = Conjg(cplcFdFdAhL(iIN,gt3,i2)) 
coup2(4) = Conjg(cplcFdFdAhR(iIN,gt3,i2))  
coup2(5) = cplcFdFdVZL(gt2,gt1) 
coup2(6) = cplcFdFdVZR(gt2,gt1) 
coup2(7) = Conjg(cplcFdFdAhL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplcFdFdAhR(gt2,gt1,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFd(gt3) 
mass(4) = MFd(gt1) 
mass(3) = -MFd(gt2) 
 
coup2(1) = cplcFdFdVZL(iIN,gt1) 
coup2(2) = cplcFdFdVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFdFdAhL(iIN,gt3,i2)) 
coup2(4) = Conjg(cplcFdFdAhR(iIN,gt3,i2))  
coup2(5) = cplcFdFdVZL(gt2,gt3) 
coup2(6) = cplcFdFdVZR(gt2,gt3) 
coup2(7) = Conjg(cplcFdFdAhL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplcFdFdAhR(gt2,gt1,i2)) 
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
Write(*,*) "Fd->Fd cFd Fd Propagator: VZ,Ah" 
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
mass(2) = MFd(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup2(1) = cplcFdFdVZL(iIN,gt1) 
coup2(2) = cplcFdFdVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFdFdhhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFdFdhhR(iIN,gt1,i2))  
coup2(5) = cplcFdFdVZL(gt2,gt3) 
coup2(6) = cplcFdFdVZR(gt2,gt3) 
coup2(7) = Conjg(cplcFdFdhhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFdFdhhR(gt2,gt3,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFd(gt1) 
mass(4) = MFd(gt3) 
mass(3) = -MFd(gt2) 
 
coup2(1) = cplcFdFdVZL(iIN,gt3) 
coup2(2) = cplcFdFdVZR(iIN,gt3) 
coup2(3) = Conjg(cplcFdFdhhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFdFdhhR(iIN,gt1,i2))  
coup2(5) = cplcFdFdVZL(gt2,gt1) 
coup2(6) = cplcFdFdVZR(gt2,gt1) 
coup2(7) = Conjg(cplcFdFdhhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFdFdhhR(gt2,gt3,i2)) 
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
mass(2) = MFd(gt3) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt1) 
 
coup2(1) = cplcFdFdVZL(iIN,gt3) 
coup2(2) = cplcFdFdVZR(iIN,gt3) 
coup2(3) = Conjg(cplcFdFdhhL(iIN,gt3,i2)) 
coup2(4) = Conjg(cplcFdFdhhR(iIN,gt3,i2))  
coup2(5) = cplcFdFdVZL(gt2,gt1) 
coup2(6) = cplcFdFdVZR(gt2,gt1) 
coup2(7) = Conjg(cplcFdFdhhL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplcFdFdhhR(gt2,gt1,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFd(gt3) 
mass(4) = MFd(gt1) 
mass(3) = -MFd(gt2) 
 
coup2(1) = cplcFdFdVZL(iIN,gt1) 
coup2(2) = cplcFdFdVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFdFdhhL(iIN,gt3,i2)) 
coup2(4) = Conjg(cplcFdFdhhR(iIN,gt3,i2))  
coup2(5) = cplcFdFdVZL(gt2,gt3) 
coup2(6) = cplcFdFdVZR(gt2,gt3) 
coup2(7) = Conjg(cplcFdFdhhL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplcFdFdhhR(gt2,gt1,i2)) 
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
Write(*,*) "Fd->Fd cFd Fd Propagator: VZ,hh" 
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
mass(2) = MFd(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup2(1) = cplcFdFdVZRL(iIN,gt1) 
coup2(2) = cplcFdFdVZRR(iIN,gt1) 
coup2(3) = Conjg(cplcFdFdAhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFdFdAhR(iIN,gt1,i2))  
coup2(5) = cplcFdFdVZRL(gt2,gt3) 
coup2(6) = cplcFdFdVZRR(gt2,gt3) 
coup2(7) = Conjg(cplcFdFdAhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFdFdAhR(gt2,gt3,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFd(gt1) 
mass(4) = MFd(gt3) 
mass(3) = -MFd(gt2) 
 
coup2(1) = cplcFdFdVZRL(iIN,gt3) 
coup2(2) = cplcFdFdVZRR(iIN,gt3) 
coup2(3) = Conjg(cplcFdFdAhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFdFdAhR(iIN,gt1,i2))  
coup2(5) = cplcFdFdVZRL(gt2,gt1) 
coup2(6) = cplcFdFdVZRR(gt2,gt1) 
coup2(7) = Conjg(cplcFdFdAhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFdFdAhR(gt2,gt3,i2)) 
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
mass(2) = MFd(gt3) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt1) 
 
coup2(1) = cplcFdFdVZRL(iIN,gt3) 
coup2(2) = cplcFdFdVZRR(iIN,gt3) 
coup2(3) = Conjg(cplcFdFdAhL(iIN,gt3,i2)) 
coup2(4) = Conjg(cplcFdFdAhR(iIN,gt3,i2))  
coup2(5) = cplcFdFdVZRL(gt2,gt1) 
coup2(6) = cplcFdFdVZRR(gt2,gt1) 
coup2(7) = Conjg(cplcFdFdAhL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplcFdFdAhR(gt2,gt1,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFd(gt3) 
mass(4) = MFd(gt1) 
mass(3) = -MFd(gt2) 
 
coup2(1) = cplcFdFdVZRL(iIN,gt1) 
coup2(2) = cplcFdFdVZRR(iIN,gt1) 
coup2(3) = Conjg(cplcFdFdAhL(iIN,gt3,i2)) 
coup2(4) = Conjg(cplcFdFdAhR(iIN,gt3,i2))  
coup2(5) = cplcFdFdVZRL(gt2,gt3) 
coup2(6) = cplcFdFdVZRR(gt2,gt3) 
coup2(7) = Conjg(cplcFdFdAhL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplcFdFdAhR(gt2,gt1,i2)) 
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
Write(*,*) "Fd->Fd cFd Fd Propagator: VZR,Ah" 
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
mass(2) = MFd(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup2(1) = cplcFdFdVZRL(iIN,gt1) 
coup2(2) = cplcFdFdVZRR(iIN,gt1) 
coup2(3) = Conjg(cplcFdFdhhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFdFdhhR(iIN,gt1,i2))  
coup2(5) = cplcFdFdVZRL(gt2,gt3) 
coup2(6) = cplcFdFdVZRR(gt2,gt3) 
coup2(7) = Conjg(cplcFdFdhhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFdFdhhR(gt2,gt3,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFd(gt1) 
mass(4) = MFd(gt3) 
mass(3) = -MFd(gt2) 
 
coup2(1) = cplcFdFdVZRL(iIN,gt3) 
coup2(2) = cplcFdFdVZRR(iIN,gt3) 
coup2(3) = Conjg(cplcFdFdhhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFdFdhhR(iIN,gt1,i2))  
coup2(5) = cplcFdFdVZRL(gt2,gt1) 
coup2(6) = cplcFdFdVZRR(gt2,gt1) 
coup2(7) = Conjg(cplcFdFdhhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFdFdhhR(gt2,gt3,i2)) 
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
mass(2) = MFd(gt3) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt1) 
 
coup2(1) = cplcFdFdVZRL(iIN,gt3) 
coup2(2) = cplcFdFdVZRR(iIN,gt3) 
coup2(3) = Conjg(cplcFdFdhhL(iIN,gt3,i2)) 
coup2(4) = Conjg(cplcFdFdhhR(iIN,gt3,i2))  
coup2(5) = cplcFdFdVZRL(gt2,gt1) 
coup2(6) = cplcFdFdVZRR(gt2,gt1) 
coup2(7) = Conjg(cplcFdFdhhL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplcFdFdhhR(gt2,gt1,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFd(gt3) 
mass(4) = MFd(gt1) 
mass(3) = -MFd(gt2) 
 
coup2(1) = cplcFdFdVZRL(iIN,gt1) 
coup2(2) = cplcFdFdVZRR(iIN,gt1) 
coup2(3) = Conjg(cplcFdFdhhL(iIN,gt3,i2)) 
coup2(4) = Conjg(cplcFdFdhhR(iIN,gt3,i2))  
coup2(5) = cplcFdFdVZRL(gt2,gt3) 
coup2(6) = cplcFdFdVZRR(gt2,gt3) 
coup2(7) = Conjg(cplcFdFdhhL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplcFdFdhhR(gt2,gt1,i2)) 
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
Write(*,*) "Fd->Fd cFd Fd Propagator: VZR,hh" 
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
mass(2) = MFd(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup2(1) = cplcFdFdAhL(iIN,gt1,i1) 
coup2(2) = cplcFdFdAhR(iIN,gt1,i1) 
coup2(3) = Conjg(cplcFdFdAhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFdFdAhR(iIN,gt1,i2))  
coup2(5) = cplcFdFdAhL(gt2,gt3,i1) 
coup2(6) = cplcFdFdAhR(gt2,gt3,i1) 
coup2(7) = Conjg(cplcFdFdAhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFdFdAhR(gt2,gt3,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFd(gt1) 
mass(4) = MFd(gt3) 
mass(3) = -MFd(gt2) 
 
coup2(1) = cplcFdFdAhL(iIN,gt3,i1) 
coup2(2) = cplcFdFdAhR(iIN,gt3,i1) 
coup2(3) = Conjg(cplcFdFdAhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFdFdAhR(iIN,gt1,i2))  
coup2(5) = cplcFdFdAhL(gt2,gt1,i1) 
coup2(6) = cplcFdFdAhR(gt2,gt1,i1) 
coup2(7) = Conjg(cplcFdFdAhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFdFdAhR(gt2,gt3,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFd(gt3) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt1) 
 
coup2(1) = cplcFdFdAhL(iIN,gt3,i1) 
coup2(2) = cplcFdFdAhR(iIN,gt3,i1) 
coup2(3) = Conjg(cplcFdFdAhL(iIN,gt3,i2)) 
coup2(4) = Conjg(cplcFdFdAhR(iIN,gt3,i2))  
coup2(5) = cplcFdFdAhL(gt2,gt1,i1) 
coup2(6) = cplcFdFdAhR(gt2,gt1,i1) 
coup2(7) = Conjg(cplcFdFdAhL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplcFdFdAhR(gt2,gt1,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFd(gt3) 
mass(4) = MFd(gt1) 
mass(3) = -MFd(gt2) 
 
coup2(1) = cplcFdFdAhL(iIN,gt1,i1) 
coup2(2) = cplcFdFdAhR(iIN,gt1,i1) 
coup2(3) = Conjg(cplcFdFdAhL(iIN,gt3,i2)) 
coup2(4) = Conjg(cplcFdFdAhR(iIN,gt3,i2))  
coup2(5) = cplcFdFdAhL(gt2,gt3,i1) 
coup2(6) = cplcFdFdAhR(gt2,gt3,i1) 
coup2(7) = Conjg(cplcFdFdAhL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplcFdFdAhR(gt2,gt1,i2)) 
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
Write(*,*) "Fd->Fd cFd Fd Propagator: Ah,Ah" 
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
mass(2) = MFd(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup2(1) = cplcFdFdAhL(iIN,gt1,i1) 
coup2(2) = cplcFdFdAhR(iIN,gt1,i1) 
coup2(3) = Conjg(cplcFdFdhhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFdFdhhR(iIN,gt1,i2))  
coup2(5) = cplcFdFdAhL(gt2,gt3,i1) 
coup2(6) = cplcFdFdAhR(gt2,gt3,i1) 
coup2(7) = Conjg(cplcFdFdhhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFdFdhhR(gt2,gt3,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFd(gt1) 
mass(4) = MFd(gt3) 
mass(3) = -MFd(gt2) 
 
coup2(1) = cplcFdFdAhL(iIN,gt3,i1) 
coup2(2) = cplcFdFdAhR(iIN,gt3,i1) 
coup2(3) = Conjg(cplcFdFdhhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFdFdhhR(iIN,gt1,i2))  
coup2(5) = cplcFdFdAhL(gt2,gt1,i1) 
coup2(6) = cplcFdFdAhR(gt2,gt1,i1) 
coup2(7) = Conjg(cplcFdFdhhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFdFdhhR(gt2,gt3,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFd(gt3) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt1) 
 
coup2(1) = cplcFdFdAhL(iIN,gt3,i1) 
coup2(2) = cplcFdFdAhR(iIN,gt3,i1) 
coup2(3) = Conjg(cplcFdFdhhL(iIN,gt3,i2)) 
coup2(4) = Conjg(cplcFdFdhhR(iIN,gt3,i2))  
coup2(5) = cplcFdFdAhL(gt2,gt1,i1) 
coup2(6) = cplcFdFdAhR(gt2,gt1,i1) 
coup2(7) = Conjg(cplcFdFdhhL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplcFdFdhhR(gt2,gt1,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFd(gt3) 
mass(4) = MFd(gt1) 
mass(3) = -MFd(gt2) 
 
coup2(1) = cplcFdFdAhL(iIN,gt1,i1) 
coup2(2) = cplcFdFdAhR(iIN,gt1,i1) 
coup2(3) = Conjg(cplcFdFdhhL(iIN,gt3,i2)) 
coup2(4) = Conjg(cplcFdFdhhR(iIN,gt3,i2))  
coup2(5) = cplcFdFdAhL(gt2,gt3,i1) 
coup2(6) = cplcFdFdAhR(gt2,gt3,i1) 
coup2(7) = Conjg(cplcFdFdhhL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplcFdFdhhR(gt2,gt1,i2)) 
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
Write(*,*) "Fd->Fd cFd Fd Propagator: Ah,hh" 
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
mass(2) = MFd(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup2(1) = cplcFdFdhhL(iIN,gt1,i1) 
coup2(2) = cplcFdFdhhR(iIN,gt1,i1) 
coup2(3) = Conjg(cplcFdFdhhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFdFdhhR(iIN,gt1,i2))  
coup2(5) = cplcFdFdhhL(gt2,gt3,i1) 
coup2(6) = cplcFdFdhhR(gt2,gt3,i1) 
coup2(7) = Conjg(cplcFdFdhhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFdFdhhR(gt2,gt3,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFd(gt1) 
mass(4) = MFd(gt3) 
mass(3) = -MFd(gt2) 
 
coup2(1) = cplcFdFdhhL(iIN,gt3,i1) 
coup2(2) = cplcFdFdhhR(iIN,gt3,i1) 
coup2(3) = Conjg(cplcFdFdhhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFdFdhhR(iIN,gt1,i2))  
coup2(5) = cplcFdFdhhL(gt2,gt1,i1) 
coup2(6) = cplcFdFdhhR(gt2,gt1,i1) 
coup2(7) = Conjg(cplcFdFdhhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFdFdhhR(gt2,gt3,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFd(gt3) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt1) 
 
coup2(1) = cplcFdFdhhL(iIN,gt3,i1) 
coup2(2) = cplcFdFdhhR(iIN,gt3,i1) 
coup2(3) = Conjg(cplcFdFdhhL(iIN,gt3,i2)) 
coup2(4) = Conjg(cplcFdFdhhR(iIN,gt3,i2))  
coup2(5) = cplcFdFdhhL(gt2,gt1,i1) 
coup2(6) = cplcFdFdhhR(gt2,gt1,i1) 
coup2(7) = Conjg(cplcFdFdhhL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplcFdFdhhR(gt2,gt1,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFd(gt3) 
mass(4) = MFd(gt1) 
mass(3) = -MFd(gt2) 
 
coup2(1) = cplcFdFdhhL(iIN,gt1,i1) 
coup2(2) = cplcFdFdhhR(iIN,gt1,i1) 
coup2(3) = Conjg(cplcFdFdhhL(iIN,gt3,i2)) 
coup2(4) = Conjg(cplcFdFdhhR(iIN,gt3,i2))  
coup2(5) = cplcFdFdhhL(gt2,gt3,i1) 
coup2(6) = cplcFdFdhhR(gt2,gt3,i1) 
coup2(7) = Conjg(cplcFdFdhhL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplcFdFdhhR(gt2,gt1,i2)) 
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
Write(*,*) "Fd->Fd cFd Fd Propagator: hh,hh" 
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
  g = oo512pi3 / Abs(MFd(iIN))**3*g
End Subroutine FdToFdcFdFd 
 
 
Subroutine FdToFdcFeFe(iIN,MFd,MFe,MVZ,MVZR,MAh,Mhh,cplcFdFdAhL,cplcFdFdAhR,          & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZRL,cplcFdFdVZRR,             & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcFeFeVZRL,cplcFeFeVZRR,IntegralSs,IntegralSSss,IntegralVs,IntegralVSss,             & 
& IntegralVVss,NSs,NSSss,NVs,NVSss,NVVss,gTVZ,gTVZR,gTAh,gThh,deltaM,epsI,               & 
& check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFd(3),MFe(3),MVZ,MVZR,MAh(3),Mhh(3)

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
mass(1) = MFd(iIN) 
 
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
 
If(Abs(MFd(iIN)).gt.(Abs(MFe(gt3))+Abs(MFe(gt2))+Abs(MFd(gt1)))) Then 
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
 
mass(2) = MFd(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup(2) = Conjg(cplcFdFdVZL(iIN,gt1)) 
coup(1) = Conjg(cplcFdFdVZR(iIN,gt1)) 
coup(4) = Conjg(cplcFeFeVZL(gt2,gt3)) 
coup(3) = Conjg(cplcFeFeVZR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFe Fe Propagator: VZ" 
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
 
mass(2) = MFd(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup(2) = Conjg(cplcFdFdVZRL(iIN,gt1)) 
coup(1) = Conjg(cplcFdFdVZRR(iIN,gt1)) 
coup(4) = Conjg(cplcFeFeVZRL(gt2,gt3)) 
coup(3) = Conjg(cplcFeFeVZRR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFe Fe Propagator: VZR" 
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
 
mass(2) = MFd(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup(2) = Conjg(cplcFdFdAhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcFdFdAhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplcFeFeAhL(gt2,gt3,i1)) 
coup(3) = Conjg(cplcFeFeAhR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFe Fe Propagator: Ah" 
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
 
mass(2) = MFd(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup(2) = Conjg(cplcFdFdhhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcFdFdhhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplcFeFehhL(gt2,gt3,i1)) 
coup(3) = Conjg(cplcFeFehhR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFe Fe Propagator: hh" 
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
mass(2) = MFd(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplcFdFdVZL(iIN,gt1) 
coup2(2) = cplcFdFdVZR(iIN,gt1) 
coup2(4) = Conjg(cplcFdFdVZRL(iIN,gt1)) 
coup2(3) = Conjg(cplcFdFdVZRR(iIN,gt1))  
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
Write(*,*) "Fd->Fd cFe Fe Propagator: VZ,VZR" 
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
mass(2) = MFd(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplcFdFdVZL(iIN,gt1) 
coup2(2) = cplcFdFdVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFdFdAhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFdFdAhR(iIN,gt1,i2))  
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
Write(*,*) "Fd->Fd cFe Fe Propagator: VZ,Ah" 
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
mass(2) = MFd(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplcFdFdVZL(iIN,gt1) 
coup2(2) = cplcFdFdVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFdFdhhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFdFdhhR(iIN,gt1,i2))  
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
Write(*,*) "Fd->Fd cFe Fe Propagator: VZ,hh" 
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
mass(2) = MFd(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplcFdFdVZRL(iIN,gt1) 
coup2(2) = cplcFdFdVZRR(iIN,gt1) 
coup2(3) = Conjg(cplcFdFdAhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFdFdAhR(iIN,gt1,i2))  
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
Write(*,*) "Fd->Fd cFe Fe Propagator: VZR,Ah" 
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
mass(2) = MFd(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplcFdFdVZRL(iIN,gt1) 
coup2(2) = cplcFdFdVZRR(iIN,gt1) 
coup2(3) = Conjg(cplcFdFdhhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFdFdhhR(iIN,gt1,i2))  
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
Write(*,*) "Fd->Fd cFe Fe Propagator: VZR,hh" 
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
mass(2) = MFd(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplcFdFdAhL(iIN,gt1,i1) 
coup2(2) = cplcFdFdAhR(iIN,gt1,i1) 
coup2(3) = Conjg(cplcFdFdAhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFdFdAhR(iIN,gt1,i2))  
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
Write(*,*) "Fd->Fd cFe Fe Propagator: Ah,Ah" 
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
mass(2) = MFd(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplcFdFdAhL(iIN,gt1,i1) 
coup2(2) = cplcFdFdAhR(iIN,gt1,i1) 
coup2(3) = Conjg(cplcFdFdhhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFdFdhhR(iIN,gt1,i2))  
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
Write(*,*) "Fd->Fd cFe Fe Propagator: Ah,hh" 
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
mass(2) = MFd(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplcFdFdhhL(iIN,gt1,i1) 
coup2(2) = cplcFdFdhhR(iIN,gt1,i1) 
coup2(3) = Conjg(cplcFdFdhhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFdFdhhR(iIN,gt1,i2))  
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
Write(*,*) "Fd->Fd cFe Fe Propagator: hh,hh" 
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
  g = oo512pi3 / Abs(MFd(iIN))**3*g
End Subroutine FdToFdcFeFe 
 
 
Subroutine FdToFdcFuFu(iIN,MFd,MFu,MVZ,MVZR,MVWLm,MVWRm,MHpm,MAh,Mhh,cplcFdFdAhL,     & 
& cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZRL,              & 
& cplcFdFdVZRR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFdFuVWLmL,cplcFdFuVWLmR,cplcFdFuVWRmL,      & 
& cplcFdFuVWRmR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWLmL,cplcFuFdcVWLmR,               & 
& cplcFuFdcVWRmL,cplcFuFdcVWRmR,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuhhL,cplcFuFuhhR,         & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZRL,cplcFuFuVZRR,IntegralSs,IntegralSSss,             & 
& IntegralSSst,IntegralVs,IntegralVSss,IntegralVSst,IntegralVVss,IntegralVVst,           & 
& NSs,NSSss,NSSst,NVs,NVSss,NVSst,NVVss,NVVst,gTVZ,gTVZR,gTVWLm,gTVWRm,gTHpm,            & 
& gTAh,gThh,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFd(3),MFu(3),MVZ,MVZR,MVWLm,MVWRm,MHpm(3),MAh(3),Mhh(3)

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
mass(1) = MFd(iIN) 
 
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
 
If(Abs(MFd(iIN)).gt.(Abs(MFu(gt3))+Abs(MFu(gt2))+Abs(MFd(gt1)))) Then 
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
 
mass(2) = MFd(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup(2) = Conjg(cplcFdFdVZL(iIN,gt1)) 
coup(1) = Conjg(cplcFdFdVZR(iIN,gt1)) 
coup(4) = Conjg(cplcFuFuVZL(gt2,gt3)) 
coup(3) = Conjg(cplcFuFuVZR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFu Fu Propagator: VZ" 
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
 
mass(2) = MFd(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup(2) = Conjg(cplcFdFdVZRL(iIN,gt1)) 
coup(1) = Conjg(cplcFdFdVZRR(iIN,gt1)) 
coup(4) = Conjg(cplcFuFuVZRL(gt2,gt3)) 
coup(3) = Conjg(cplcFuFuVZRR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFu Fu Propagator: VZR" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZR'



!-------------- 
!  VWLm 
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
 
mass(2) = MFu(gt3) 
mass(3) = -MFu(gt2) 
mass(4) = MFd(gt1) 
 
coup(2) = Conjg(cplcFdFuVWLmL(iIN,gt3)) 
coup(1) = Conjg(cplcFdFuVWLmR(iIN,gt3)) 
coup(4) = Conjg(cplcFuFdcVWLmL(gt2,gt1)) 
coup(3) = Conjg(cplcFuFdcVWLmR(gt2,gt1))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFu Fu Propagator: VWLm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VWLm'



!-------------- 
!  VWRm 
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
 
mass(2) = MFu(gt3) 
mass(3) = -MFu(gt2) 
mass(4) = MFd(gt1) 
 
coup(2) = Conjg(cplcFdFuVWRmL(iIN,gt3)) 
coup(1) = Conjg(cplcFdFuVWRmR(iIN,gt3)) 
coup(4) = Conjg(cplcFuFdcVWRmL(gt2,gt1)) 
coup(3) = Conjg(cplcFuFdcVWRmR(gt2,gt1))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFu Fu Propagator: VWRm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VWRm'



!-------------- 
!  Hpm 
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
 
mass(2) = MFu(gt3) 
mass(3) = -MFu(gt2) 
mass(4) = MFd(gt1) 
 
coup(2) = Conjg(cplcFdFuHpmL(iIN,gt3,i1)) 
coup(1) = Conjg(cplcFdFuHpmR(iIN,gt3,i1)) 
coup(4) = Conjg(cplcFuFdcHpmL(gt2,gt1,i1)) 
coup(3) = Conjg(cplcFuFdcHpmR(gt2,gt1,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFu Fu Propagator: Hpm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Hpm'
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
 
mass(2) = MFd(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup(2) = Conjg(cplcFdFdAhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcFdFdAhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplcFuFuAhL(gt2,gt3,i1)) 
coup(3) = Conjg(cplcFuFuAhR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFu Fu Propagator: Ah" 
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
 
mass(2) = MFd(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup(2) = Conjg(cplcFdFdhhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcFdFdhhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplcFuFuhhL(gt2,gt3,i1)) 
coup(3) = Conjg(cplcFuFuhhR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFu Fu Propagator: hh" 
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
mass(2) = MFd(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup2(1) = cplcFdFdVZL(iIN,gt1) 
coup2(2) = cplcFdFdVZR(iIN,gt1) 
coup2(4) = Conjg(cplcFdFdVZRL(iIN,gt1)) 
coup2(3) = Conjg(cplcFdFdVZRR(iIN,gt1))  
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
Write(*,*) "Fd->Fd cFu Fu Propagator: VZ,VZR" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,VZR'



!-------------- 
!  VZ, VWLm 
!-------------- 
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MVWLm 
Boson4(4) = gTVWLm 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFu(gt3) 
mass(4) = MFd(gt1) 
mass(3) = -MFu(gt2) 
 
coup2(1) = cplcFdFdVZL(iIN,gt1) 
coup2(2) = cplcFdFdVZR(iIN,gt1) 
coup2(4) = Conjg(cplcFdFuVWLmL(iIN,gt3)) 
coup2(3) = Conjg(cplcFdFuVWLmR(iIN,gt3))  
coup2(5) = cplcFuFuVZL(gt2,gt3) 
coup2(6) = cplcFuFuVZR(gt2,gt3) 
coup2(8) = Conjg(cplcFuFdcVWLmL(gt2,gt1)) 
coup2(7) = Conjg(cplcFuFdcVWLmR(gt2,gt1)) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFu Fu Propagator: VZ,VWLm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,VWLm'



!-------------- 
!  VZ, VWRm 
!-------------- 
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MVWRm 
Boson4(4) = gTVWRm 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFu(gt3) 
mass(4) = MFd(gt1) 
mass(3) = -MFu(gt2) 
 
coup2(1) = cplcFdFdVZL(iIN,gt1) 
coup2(2) = cplcFdFdVZR(iIN,gt1) 
coup2(4) = Conjg(cplcFdFuVWRmL(iIN,gt3)) 
coup2(3) = Conjg(cplcFdFuVWRmR(iIN,gt3))  
coup2(5) = cplcFuFuVZL(gt2,gt3) 
coup2(6) = cplcFuFuVZR(gt2,gt3) 
coup2(8) = Conjg(cplcFuFdcVWRmL(gt2,gt1)) 
coup2(7) = Conjg(cplcFuFdcVWRmR(gt2,gt1)) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFu Fu Propagator: VZ,VWRm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,VWRm'



!-------------- 
!  VZ, Hpm 
!-------------- 
  Do i2=1,3
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MHpm(i2) 
Boson4(4) = gTHpm(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFu(gt3) 
mass(4) = MFd(gt1) 
mass(3) = -MFu(gt2) 
 
coup2(1) = cplcFdFdVZL(iIN,gt1) 
coup2(2) = cplcFdFdVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFdFuHpmL(iIN,gt3,i2)) 
coup2(4) = Conjg(cplcFdFuHpmR(iIN,gt3,i2))  
coup2(5) = cplcFuFuVZL(gt2,gt3) 
coup2(6) = cplcFuFuVZR(gt2,gt3) 
coup2(7) = Conjg(cplcFuFdcHpmL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplcFuFdcHpmR(gt2,gt1,i2)) 
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
Write(*,*) "Fd->Fd cFu Fu Propagator: VZ,Hpm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,Hpm'
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
mass(2) = MFd(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup2(1) = cplcFdFdVZL(iIN,gt1) 
coup2(2) = cplcFdFdVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFdFdAhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFdFdAhR(iIN,gt1,i2))  
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
Write(*,*) "Fd->Fd cFu Fu Propagator: VZ,Ah" 
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
mass(2) = MFd(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup2(1) = cplcFdFdVZL(iIN,gt1) 
coup2(2) = cplcFdFdVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFdFdhhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFdFdhhR(iIN,gt1,i2))  
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
Write(*,*) "Fd->Fd cFu Fu Propagator: VZ,hh" 
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
!  VZR, VWLm 
!-------------- 
Boson4(1) = MVZR 
Boson4(2) = gTVZR 
Boson4(3) = MVWLm 
Boson4(4) = gTVWLm 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFu(gt3) 
mass(4) = MFd(gt1) 
mass(3) = -MFu(gt2) 
 
coup2(1) = cplcFdFdVZRL(iIN,gt1) 
coup2(2) = cplcFdFdVZRR(iIN,gt1) 
coup2(4) = Conjg(cplcFdFuVWLmL(iIN,gt3)) 
coup2(3) = Conjg(cplcFdFuVWLmR(iIN,gt3))  
coup2(5) = cplcFuFuVZRL(gt2,gt3) 
coup2(6) = cplcFuFuVZRR(gt2,gt3) 
coup2(8) = Conjg(cplcFuFdcVWLmL(gt2,gt1)) 
coup2(7) = Conjg(cplcFuFdcVWLmR(gt2,gt1)) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFu Fu Propagator: VZR,VWLm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZR,VWLm'



!-------------- 
!  VZR, VWRm 
!-------------- 
Boson4(1) = MVZR 
Boson4(2) = gTVZR 
Boson4(3) = MVWRm 
Boson4(4) = gTVWRm 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFu(gt3) 
mass(4) = MFd(gt1) 
mass(3) = -MFu(gt2) 
 
coup2(1) = cplcFdFdVZRL(iIN,gt1) 
coup2(2) = cplcFdFdVZRR(iIN,gt1) 
coup2(4) = Conjg(cplcFdFuVWRmL(iIN,gt3)) 
coup2(3) = Conjg(cplcFdFuVWRmR(iIN,gt3))  
coup2(5) = cplcFuFuVZRL(gt2,gt3) 
coup2(6) = cplcFuFuVZRR(gt2,gt3) 
coup2(8) = Conjg(cplcFuFdcVWRmL(gt2,gt1)) 
coup2(7) = Conjg(cplcFuFdcVWRmR(gt2,gt1)) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFu Fu Propagator: VZR,VWRm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZR,VWRm'



!-------------- 
!  VZR, Hpm 
!-------------- 
  Do i2=1,3
Boson4(1) = MVZR 
Boson4(2) = gTVZR 
Boson4(3) = MHpm(i2) 
Boson4(4) = gTHpm(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFu(gt3) 
mass(4) = MFd(gt1) 
mass(3) = -MFu(gt2) 
 
coup2(1) = cplcFdFdVZRL(iIN,gt1) 
coup2(2) = cplcFdFdVZRR(iIN,gt1) 
coup2(3) = Conjg(cplcFdFuHpmL(iIN,gt3,i2)) 
coup2(4) = Conjg(cplcFdFuHpmR(iIN,gt3,i2))  
coup2(5) = cplcFuFuVZRL(gt2,gt3) 
coup2(6) = cplcFuFuVZRR(gt2,gt3) 
coup2(7) = Conjg(cplcFuFdcHpmL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplcFuFdcHpmR(gt2,gt1,i2)) 
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
Write(*,*) "Fd->Fd cFu Fu Propagator: VZR,Hpm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZR,Hpm'
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
mass(2) = MFd(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup2(1) = cplcFdFdVZRL(iIN,gt1) 
coup2(2) = cplcFdFdVZRR(iIN,gt1) 
coup2(3) = Conjg(cplcFdFdAhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFdFdAhR(iIN,gt1,i2))  
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
Write(*,*) "Fd->Fd cFu Fu Propagator: VZR,Ah" 
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
mass(2) = MFd(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup2(1) = cplcFdFdVZRL(iIN,gt1) 
coup2(2) = cplcFdFdVZRR(iIN,gt1) 
coup2(3) = Conjg(cplcFdFdhhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFdFdhhR(iIN,gt1,i2))  
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
Write(*,*) "Fd->Fd cFu Fu Propagator: VZR,hh" 
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
!  VWLm, VWRm 
!-------------- 
Boson4(1) = MVWLm 
Boson4(2) = gTVWLm 
Boson4(3) = MVWRm 
Boson4(4) = gTVWRm 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFu(gt3) 
mass(3) = -MFu(gt2) 
mass(4) = MFd(gt1) 
 
coup2(1) = cplcFdFuVWLmL(iIN,gt3) 
coup2(2) = cplcFdFuVWLmR(iIN,gt3) 
coup2(4) = Conjg(cplcFdFuVWRmL(iIN,gt3)) 
coup2(3) = Conjg(cplcFdFuVWRmR(iIN,gt3))  
coup2(5) = cplcFuFdcVWLmL(gt2,gt1) 
coup2(6) = cplcFuFdcVWLmR(gt2,gt1) 
coup2(8) = Conjg(cplcFuFdcVWRmL(gt2,gt1)) 
coup2(7) = Conjg(cplcFuFdcVWRmR(gt2,gt1)) 
Call IntegrateGaugeSS(Boson4, mass, coup2, deltaM, epsI,IntegralVVss,NVVss, resR, check) 
If (resR.ne.resR) resR = 0._dp
resC = 2._dp*resR 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFu Fu Propagator: VWLm,VWRm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VWLm,VWRm'



!-------------- 
!  VWLm, Hpm 
!-------------- 
  Do i2=1,3
Boson4(1) = MVWLm 
Boson4(2) = gTVWLm 
Boson4(3) = MHpm(i2) 
Boson4(4) = gTHpm(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFu(gt3) 
mass(3) = -MFu(gt2) 
mass(4) = MFd(gt1) 
 
coup2(1) = cplcFdFuVWLmL(iIN,gt3) 
coup2(2) = cplcFdFuVWLmR(iIN,gt3) 
coup2(3) = Conjg(cplcFdFuHpmL(iIN,gt3,i2)) 
coup2(4) = Conjg(cplcFdFuHpmR(iIN,gt3,i2))  
coup2(5) = cplcFuFdcVWLmL(gt2,gt1) 
coup2(6) = cplcFuFdcVWLmR(gt2,gt1) 
coup2(7) = Conjg(cplcFuFdcHpmL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplcFuFdcHpmR(gt2,gt1,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFu Fu Propagator: VWLm,Hpm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VWLm,Hpm'
      End Do 



!-------------- 
!  VWLm, Ah 
!-------------- 
  Do i2=1,3
Boson4(1) = MVWLm 
Boson4(2) = gTVWLm 
Boson4(3) = MAh(i2) 
Boson4(4) = gTAh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFd(gt1) 
mass(4) = MFu(gt3) 
mass(3) = -MFu(gt2) 
 
coup2(1) = cplcFdFuVWLmL(iIN,gt3) 
coup2(2) = cplcFdFuVWLmR(iIN,gt3) 
coup2(3) = Conjg(cplcFdFdAhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFdFdAhR(iIN,gt1,i2))  
coup2(5) = cplcFuFdcVWLmL(gt2,gt1) 
coup2(6) = cplcFuFdcVWLmR(gt2,gt1) 
coup2(7) = Conjg(cplcFuFuAhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFuFuAhR(gt2,gt3,i2)) 
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
Write(*,*) "Fd->Fd cFu Fu Propagator: VWLm,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VWLm,Ah'
      End Do 



!-------------- 
!  VWLm, hh 
!-------------- 
  Do i2=1,3
Boson4(1) = MVWLm 
Boson4(2) = gTVWLm 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFd(gt1) 
mass(4) = MFu(gt3) 
mass(3) = -MFu(gt2) 
 
coup2(1) = cplcFdFuVWLmL(iIN,gt3) 
coup2(2) = cplcFdFuVWLmR(iIN,gt3) 
coup2(3) = Conjg(cplcFdFdhhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFdFdhhR(iIN,gt1,i2))  
coup2(5) = cplcFuFdcVWLmL(gt2,gt1) 
coup2(6) = cplcFuFdcVWLmR(gt2,gt1) 
coup2(7) = Conjg(cplcFuFuhhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFuFuhhR(gt2,gt3,i2)) 
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
Write(*,*) "Fd->Fd cFu Fu Propagator: VWLm,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VWLm,hh'
      End Do 



!-------------- 
!  VWRm, Hpm 
!-------------- 
  Do i2=1,3
Boson4(1) = MVWRm 
Boson4(2) = gTVWRm 
Boson4(3) = MHpm(i2) 
Boson4(4) = gTHpm(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFu(gt3) 
mass(3) = -MFu(gt2) 
mass(4) = MFd(gt1) 
 
coup2(1) = cplcFdFuVWRmL(iIN,gt3) 
coup2(2) = cplcFdFuVWRmR(iIN,gt3) 
coup2(3) = Conjg(cplcFdFuHpmL(iIN,gt3,i2)) 
coup2(4) = Conjg(cplcFdFuHpmR(iIN,gt3,i2))  
coup2(5) = cplcFuFdcVWRmL(gt2,gt1) 
coup2(6) = cplcFuFdcVWRmR(gt2,gt1) 
coup2(7) = Conjg(cplcFuFdcHpmL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplcFuFdcHpmR(gt2,gt1,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFu Fu Propagator: VWRm,Hpm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VWRm,Hpm'
      End Do 



!-------------- 
!  VWRm, Ah 
!-------------- 
  Do i2=1,3
Boson4(1) = MVWRm 
Boson4(2) = gTVWRm 
Boson4(3) = MAh(i2) 
Boson4(4) = gTAh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFd(gt1) 
mass(4) = MFu(gt3) 
mass(3) = -MFu(gt2) 
 
coup2(1) = cplcFdFuVWRmL(iIN,gt3) 
coup2(2) = cplcFdFuVWRmR(iIN,gt3) 
coup2(3) = Conjg(cplcFdFdAhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFdFdAhR(iIN,gt1,i2))  
coup2(5) = cplcFuFdcVWRmL(gt2,gt1) 
coup2(6) = cplcFuFdcVWRmR(gt2,gt1) 
coup2(7) = Conjg(cplcFuFuAhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFuFuAhR(gt2,gt3,i2)) 
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
Write(*,*) "Fd->Fd cFu Fu Propagator: VWRm,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VWRm,Ah'
      End Do 



!-------------- 
!  VWRm, hh 
!-------------- 
  Do i2=1,3
Boson4(1) = MVWRm 
Boson4(2) = gTVWRm 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFd(gt1) 
mass(4) = MFu(gt3) 
mass(3) = -MFu(gt2) 
 
coup2(1) = cplcFdFuVWRmL(iIN,gt3) 
coup2(2) = cplcFdFuVWRmR(iIN,gt3) 
coup2(3) = Conjg(cplcFdFdhhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFdFdhhR(iIN,gt1,i2))  
coup2(5) = cplcFuFdcVWRmL(gt2,gt1) 
coup2(6) = cplcFuFdcVWRmR(gt2,gt1) 
coup2(7) = Conjg(cplcFuFuhhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFuFuhhR(gt2,gt3,i2)) 
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
Write(*,*) "Fd->Fd cFu Fu Propagator: VWRm,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VWRm,hh'
      End Do 



!-------------- 
!  Hpm, Hpm 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Boson4(1) = MHpm(i1) 
Boson4(2) = gTHpm(i1) 
Boson4(3) = MHpm(i2) 
Boson4(4) = gTHpm(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFu(gt3) 
mass(3) = -MFu(gt2) 
mass(4) = MFd(gt1) 
 
coup2(1) = cplcFdFuHpmL(iIN,gt3,i1) 
coup2(2) = cplcFdFuHpmR(iIN,gt3,i1) 
coup2(3) = Conjg(cplcFdFuHpmL(iIN,gt3,i2)) 
coup2(4) = Conjg(cplcFdFuHpmR(iIN,gt3,i2))  
coup2(5) = cplcFuFdcHpmL(gt2,gt1,i1) 
coup2(6) = cplcFuFdcHpmR(gt2,gt1,i1) 
coup2(7) = Conjg(cplcFuFdcHpmL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplcFuFdcHpmR(gt2,gt1,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFu Fu Propagator: Hpm,Hpm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Hpm,Hpm'
        End Do 
      End Do 



!-------------- 
!  Hpm, Ah 
!-------------- 
Do i1=1,3
  Do i2=1,3
Boson4(1) = MHpm(i1) 
Boson4(2) = gTHpm(i1) 
Boson4(3) = MAh(i2) 
Boson4(4) = gTAh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFd(gt1) 
mass(4) = MFu(gt3) 
mass(3) = -MFu(gt2) 
 
coup2(1) = cplcFdFuHpmL(iIN,gt3,i1) 
coup2(2) = cplcFdFuHpmR(iIN,gt3,i1) 
coup2(3) = Conjg(cplcFdFdAhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFdFdAhR(iIN,gt1,i2))  
coup2(5) = cplcFuFdcHpmL(gt2,gt1,i1) 
coup2(6) = cplcFuFdcHpmR(gt2,gt1,i1) 
coup2(7) = Conjg(cplcFuFuAhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFuFuAhR(gt2,gt3,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFu Fu Propagator: Hpm,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Hpm,Ah'
        End Do 
      End Do 



!-------------- 
!  Hpm, hh 
!-------------- 
Do i1=1,3
  Do i2=1,3
Boson4(1) = MHpm(i1) 
Boson4(2) = gTHpm(i1) 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFd(gt1) 
mass(4) = MFu(gt3) 
mass(3) = -MFu(gt2) 
 
coup2(1) = cplcFdFuHpmL(iIN,gt3,i1) 
coup2(2) = cplcFdFuHpmR(iIN,gt3,i1) 
coup2(3) = Conjg(cplcFdFdhhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFdFdhhR(iIN,gt1,i2))  
coup2(5) = cplcFuFdcHpmL(gt2,gt1,i1) 
coup2(6) = cplcFuFdcHpmR(gt2,gt1,i1) 
coup2(7) = Conjg(cplcFuFuhhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFuFuhhR(gt2,gt3,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFu Fu Propagator: Hpm,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Hpm,hh'
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
mass(2) = MFd(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup2(1) = cplcFdFdAhL(iIN,gt1,i1) 
coup2(2) = cplcFdFdAhR(iIN,gt1,i1) 
coup2(3) = Conjg(cplcFdFdAhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFdFdAhR(iIN,gt1,i2))  
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
Write(*,*) "Fd->Fd cFu Fu Propagator: Ah,Ah" 
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
mass(2) = MFd(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup2(1) = cplcFdFdAhL(iIN,gt1,i1) 
coup2(2) = cplcFdFdAhR(iIN,gt1,i1) 
coup2(3) = Conjg(cplcFdFdhhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFdFdhhR(iIN,gt1,i2))  
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
Write(*,*) "Fd->Fd cFu Fu Propagator: Ah,hh" 
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
mass(2) = MFd(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup2(1) = cplcFdFdhhL(iIN,gt1,i1) 
coup2(2) = cplcFdFdhhR(iIN,gt1,i1) 
coup2(3) = Conjg(cplcFdFdhhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFdFdhhR(iIN,gt1,i2))  
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
Write(*,*) "Fd->Fd cFu Fu Propagator: hh,hh" 
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
  g = oo512pi3 / Abs(MFd(iIN))**3*g
End Subroutine FdToFdcFuFu 
 
 
Subroutine FdToFdFvFv(iIN,MFd,MFv,MVZ,MVZR,MAh,Mhh,cplcFdFdAhL,cplcFdFdAhR,           & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZRL,cplcFdFdVZRR,             & 
& cplFvFvAhL,cplFvFvAhR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZRL,         & 
& cplFvFvVZRR,IntegralSs,IntegralSSss,IntegralVs,IntegralVSss,IntegralVVss,              & 
& NSs,NSSss,NVs,NVSss,NVVss,gTVZ,gTVZR,gTAh,gThh,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFd(3),MFv(6),MVZ,MVZR,MAh(3),Mhh(3)

Complex(dp),Intent(in) :: cplcFdFdAhL(3,3,3),cplcFdFdAhR(3,3,3),cplcFdFdhhL(3,3,3),cplcFdFdhhR(3,3,3),          & 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFdFdVZRL(3,3),cplcFdFdVZRR(3,3),cplFvFvAhL(6,6,3),& 
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
mass(1) = MFd(iIN) 
 
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
 
If(Abs(MFd(iIN)).gt.(Abs(MFv(gt3))+Abs(MFv(gt2))+Abs(MFd(gt1)))) Then 
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
 
mass(2) = MFd(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup(2) = Conjg(cplcFdFdVZL(iIN,gt1)) 
coup(1) = Conjg(cplcFdFdVZR(iIN,gt1)) 
coup(4) = Conjg(cplFvFvVZL(gt2,gt3)) 
coup(3) = Conjg(cplFvFvVZR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFd(gt1) 
mass(3) = -MFv(gt3) 
mass(4) = MFv(gt2) 
 
coup2(1) = cplcFdFdVZL(iIN,gt1) 
coup2(2) = cplcFdFdVZR(iIN,gt1) 
coup2(4) = Conjg(cplcFdFdVZL(iIN,gt1)) 
coup2(3) = Conjg(cplcFdFdVZR(iIN,gt1))  
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
Write(*,*) "Fd->Fd Fv Fv Propagator: VZ" 
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
 
mass(2) = MFd(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup(2) = Conjg(cplcFdFdVZRL(iIN,gt1)) 
coup(1) = Conjg(cplcFdFdVZRR(iIN,gt1)) 
coup(4) = Conjg(cplFvFvVZRL(gt2,gt3)) 
coup(3) = Conjg(cplFvFvVZRR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFd(gt1) 
mass(3) = -MFv(gt3) 
mass(4) = MFv(gt2) 
 
coup2(1) = cplcFdFdVZRL(iIN,gt1) 
coup2(2) = cplcFdFdVZRR(iIN,gt1) 
coup2(4) = Conjg(cplcFdFdVZRL(iIN,gt1)) 
coup2(3) = Conjg(cplcFdFdVZRR(iIN,gt1))  
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
Write(*,*) "Fd->Fd Fv Fv Propagator: VZR" 
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
 
mass(2) = MFd(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup(2) = Conjg(cplcFdFdAhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcFdFdAhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplFvFvAhL(gt2,gt3,i1)) 
coup(3) = Conjg(cplFvFvAhR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFd(gt1) 
mass(3) = -MFv(gt3) 
mass(4) = MFv(gt2) 
 
coup2(1) = cplcFdFdAhL(iIN,gt1,i1) 
coup2(2) = cplcFdFdAhR(iIN,gt1,i1) 
coup2(3) = Conjg(cplcFdFdAhL(iIN,gt1,i1)) 
coup2(4) = Conjg(cplcFdFdAhR(iIN,gt1,i1))  
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
Write(*,*) "Fd->Fd Fv Fv Propagator: Ah" 
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
 
mass(2) = MFd(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup(2) = Conjg(cplcFdFdhhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcFdFdhhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplFvFvhhL(gt2,gt3,i1)) 
coup(3) = Conjg(cplFvFvhhR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFd(gt1) 
mass(3) = -MFv(gt3) 
mass(4) = MFv(gt2) 
 
coup2(1) = cplcFdFdhhL(iIN,gt1,i1) 
coup2(2) = cplcFdFdhhR(iIN,gt1,i1) 
coup2(3) = Conjg(cplcFdFdhhL(iIN,gt1,i1)) 
coup2(4) = Conjg(cplcFdFdhhR(iIN,gt1,i1))  
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
Write(*,*) "Fd->Fd Fv Fv Propagator: hh" 
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
mass(2) = MFd(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup2(1) = cplcFdFdVZL(iIN,gt1) 
coup2(2) = cplcFdFdVZR(iIN,gt1) 
coup2(4) = Conjg(cplcFdFdVZRL(iIN,gt1)) 
coup2(3) = Conjg(cplcFdFdVZRR(iIN,gt1))  
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
Write(*,*) "Fd->Fd Fv Fv Propagator: VZ,VZR" 
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
mass(2) = MFd(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup2(1) = cplcFdFdVZL(iIN,gt1) 
coup2(2) = cplcFdFdVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFdFdAhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFdFdAhR(iIN,gt1,i2))  
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
Write(*,*) "Fd->Fd Fv Fv Propagator: VZ,Ah" 
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
mass(2) = MFd(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup2(1) = cplcFdFdVZL(iIN,gt1) 
coup2(2) = cplcFdFdVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFdFdhhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFdFdhhR(iIN,gt1,i2))  
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
Write(*,*) "Fd->Fd Fv Fv Propagator: VZ,hh" 
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
mass(2) = MFd(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup2(1) = cplcFdFdVZRL(iIN,gt1) 
coup2(2) = cplcFdFdVZRR(iIN,gt1) 
coup2(3) = Conjg(cplcFdFdAhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFdFdAhR(iIN,gt1,i2))  
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
Write(*,*) "Fd->Fd Fv Fv Propagator: VZR,Ah" 
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
mass(2) = MFd(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup2(1) = cplcFdFdVZRL(iIN,gt1) 
coup2(2) = cplcFdFdVZRR(iIN,gt1) 
coup2(3) = Conjg(cplcFdFdhhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFdFdhhR(iIN,gt1,i2))  
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
Write(*,*) "Fd->Fd Fv Fv Propagator: VZR,hh" 
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
mass(2) = MFd(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup2(1) = cplcFdFdAhL(iIN,gt1,i1) 
coup2(2) = cplcFdFdAhR(iIN,gt1,i1) 
coup2(3) = Conjg(cplcFdFdAhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFdFdAhR(iIN,gt1,i2))  
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
Write(*,*) "Fd->Fd Fv Fv Propagator: Ah,Ah" 
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
mass(2) = MFd(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup2(1) = cplcFdFdAhL(iIN,gt1,i1) 
coup2(2) = cplcFdFdAhR(iIN,gt1,i1) 
coup2(3) = Conjg(cplcFdFdhhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFdFdhhR(iIN,gt1,i2))  
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
Write(*,*) "Fd->Fd Fv Fv Propagator: Ah,hh" 
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
mass(2) = MFd(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup2(1) = cplcFdFdhhL(iIN,gt1,i1) 
coup2(2) = cplcFdFdhhR(iIN,gt1,i1) 
coup2(3) = Conjg(cplcFdFdhhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFdFdhhR(iIN,gt1,i2))  
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
Write(*,*) "Fd->Fd Fv Fv Propagator: hh,hh" 
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
  g = oo512pi3 / Abs(MFd(iIN))**3*g
End Subroutine FdToFdFvFv 
 
 
Subroutine FdToFdcFcppFcpp(iIN,MFd,MFcpp,MVZ,MVZR,cplcFcppFcppVZL,cplcFcppFcppVZR,    & 
& cplcFcppFcppVZRL,cplcFcppFcppVZRR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZRL,cplcFdFdVZRR,   & 
& IntegralVs,IntegralVVss,NVs,NVVss,gTVZ,gTVZR,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFd(3),MFcpp,MVZ,MVZR

Complex(dp),Intent(in) :: cplcFcppFcppVZL,cplcFcppFcppVZR,cplcFcppFcppVZRL,cplcFcppFcppVZRR,cplcFdFdVZL(3,3),   & 
& cplcFdFdVZR(3,3),cplcFdFdVZRL(3,3),cplcFdFdVZRR(3,3)

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
mass(1) = MFd(iIN) 
 
Isum = 4 
Allocate( gSum(3,1,1, Isum) ) 
Allocate( Contribution(3,1,1, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1, iIN-1
Isum = 0 
 
If(Abs(MFd(iIN)).gt.(Abs(MFcpp)+Abs(MFcpp)+Abs(MFd(gt1)))) Then 
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
 
mass(2) = MFd(gt1) 
mass(3) = -MFcpp 
mass(4) = MFcpp 
 
coup(2) = Conjg(cplcFdFdVZL(iIN,gt1)) 
coup(1) = Conjg(cplcFdFdVZR(iIN,gt1)) 
coup(4) = Conjg(cplcFcppFcppVZL) 
coup(3) = Conjg(cplcFcppFcppVZR)
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFcpp Fcpp Propagator: VZ" 
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
 
mass(2) = MFd(gt1) 
mass(3) = -MFcpp 
mass(4) = MFcpp 
 
coup(2) = Conjg(cplcFdFdVZRL(iIN,gt1)) 
coup(1) = Conjg(cplcFdFdVZRR(iIN,gt1)) 
coup(4) = Conjg(cplcFcppFcppVZRL) 
coup(3) = Conjg(cplcFcppFcppVZRR)
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFcpp Fcpp Propagator: VZR" 
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
mass(2) = MFd(gt1) 
mass(3) = -MFcpp 
mass(4) = MFcpp 
 
coup2(1) = cplcFdFdVZL(iIN,gt1) 
coup2(2) = cplcFdFdVZR(iIN,gt1) 
coup2(4) = Conjg(cplcFdFdVZRL(iIN,gt1)) 
coup2(3) = Conjg(cplcFdFdVZRR(iIN,gt1))  
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
Write(*,*) "Fd->Fd cFcpp Fcpp Propagator: VZ,VZR" 
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
  g = oo512pi3 / Abs(MFd(iIN))**3*g
End Subroutine FdToFdcFcppFcpp 
 
 
Subroutine FdToFucFcpFc(iIN,MFu,MFcp,MFc,MVWLm,MVWRm,MHpm,MFd,cplcFcpFccHpmL,         & 
& cplcFcpFccHpmR,cplcFcpFccVWLmL,cplcFcpFccVWLmR,cplcFcpFccVWRmL,cplcFcpFccVWRmR,        & 
& cplcFdFuHpmL,cplcFdFuHpmR,cplcFdFuVWLmL,cplcFdFuVWLmR,cplcFdFuVWRmL,cplcFdFuVWRmR,     & 
& IntegralSs,IntegralSSss,IntegralVs,IntegralVSss,IntegralVVss,NSs,NSSss,NVs,            & 
& NVSss,NVVss,gTVWLm,gTVWRm,gTHpm,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFu(3),MFcp(2),MFc(3),MVWLm,MVWRm,MHpm(3),MFd(3)

Complex(dp),Intent(in) :: cplcFcpFccHpmL(2,3,3),cplcFcpFccHpmR(2,3,3),cplcFcpFccVWLmL(2,3),cplcFcpFccVWLmR(2,3),& 
& cplcFcpFccVWRmL(2,3),cplcFcpFccVWRmR(2,3),cplcFdFuHpmL(3,3,3),cplcFdFuHpmR(3,3,3),     & 
& cplcFdFuVWLmL(3,3),cplcFdFuVWLmR(3,3),cplcFdFuVWRmL(3,3),cplcFdFuVWRmR(3,3)

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
mass(1) = MFd(iIN) 
 
Isum = 25 
Allocate( gSum(3,2,3, Isum) ) 
Allocate( Contribution(3,2,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,3
      Do gt2=1,2
        Do gt3=1,3
Isum = 0 
 
If(Abs(MFd(iIN)).gt.(Abs(MFc(gt3))+Abs(MFcp(gt2))+Abs(MFu(gt1)))) Then 
!-------------- 
!  VWLm 
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
 
mass(2) = MFu(gt1) 
mass(3) = -MFcp(gt2) 
mass(4) = MFc(gt3) 
 
coup(2) = Conjg(cplcFdFuVWLmL(iIN,gt1)) 
coup(1) = Conjg(cplcFdFuVWLmR(iIN,gt1)) 
coup(4) = Conjg(cplcFcpFccVWLmL(gt2,gt3)) 
coup(3) = Conjg(cplcFcpFccVWLmR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fu cFcp Fc Propagator: VWLm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VWLm'



!-------------- 
!  VWRm 
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
 
mass(2) = MFu(gt1) 
mass(3) = -MFcp(gt2) 
mass(4) = MFc(gt3) 
 
coup(2) = Conjg(cplcFdFuVWRmL(iIN,gt1)) 
coup(1) = Conjg(cplcFdFuVWRmR(iIN,gt1)) 
coup(4) = Conjg(cplcFcpFccVWRmL(gt2,gt3)) 
coup(3) = Conjg(cplcFcpFccVWRmR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fu cFcp Fc Propagator: VWRm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VWRm'



!-------------- 
!  Hpm 
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
 
mass(2) = MFu(gt1) 
mass(3) = -MFcp(gt2) 
mass(4) = MFc(gt3) 
 
coup(2) = Conjg(cplcFdFuHpmL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcFdFuHpmR(iIN,gt1,i1)) 
coup(4) = Conjg(cplcFcpFccHpmL(gt2,gt3,i1)) 
coup(3) = Conjg(cplcFcpFccHpmR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fu cFcp Fc Propagator: Hpm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Hpm'
      End Do 



!-------------- 
!  VWLm, VWRm 
!-------------- 
Boson4(1) = MVWLm 
Boson4(2) = gTVWLm 
Boson4(3) = MVWRm 
Boson4(4) = gTVWRm 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFu(gt1) 
mass(3) = -MFcp(gt2) 
mass(4) = MFc(gt3) 
 
coup2(1) = cplcFdFuVWLmL(iIN,gt1) 
coup2(2) = cplcFdFuVWLmR(iIN,gt1) 
coup2(4) = Conjg(cplcFdFuVWRmL(iIN,gt1)) 
coup2(3) = Conjg(cplcFdFuVWRmR(iIN,gt1))  
coup2(5) = cplcFcpFccVWLmL(gt2,gt3) 
coup2(6) = cplcFcpFccVWLmR(gt2,gt3) 
coup2(8) = Conjg(cplcFcpFccVWRmL(gt2,gt3)) 
coup2(7) = Conjg(cplcFcpFccVWRmR(gt2,gt3)) 
Call IntegrateGaugeSS(Boson4, mass, coup2, deltaM, epsI,IntegralVVss,NVVss, resR, check) 
If (resR.ne.resR) resR = 0._dp
resC = 2._dp*resR 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fu cFcp Fc Propagator: VWLm,VWRm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VWLm,VWRm'



!-------------- 
!  VWLm, Hpm 
!-------------- 
  Do i2=1,3
Boson4(1) = MVWLm 
Boson4(2) = gTVWLm 
Boson4(3) = MHpm(i2) 
Boson4(4) = gTHpm(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFu(gt1) 
mass(3) = -MFcp(gt2) 
mass(4) = MFc(gt3) 
 
coup2(1) = cplcFdFuVWLmL(iIN,gt1) 
coup2(2) = cplcFdFuVWLmR(iIN,gt1) 
coup2(3) = Conjg(cplcFdFuHpmL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFdFuHpmR(iIN,gt1,i2))  
coup2(5) = cplcFcpFccVWLmL(gt2,gt3) 
coup2(6) = cplcFcpFccVWLmR(gt2,gt3) 
coup2(7) = Conjg(cplcFcpFccHpmL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFcpFccHpmR(gt2,gt3,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fu cFcp Fc Propagator: VWLm,Hpm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VWLm,Hpm'
      End Do 



!-------------- 
!  VWRm, Hpm 
!-------------- 
  Do i2=1,3
Boson4(1) = MVWRm 
Boson4(2) = gTVWRm 
Boson4(3) = MHpm(i2) 
Boson4(4) = gTHpm(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFu(gt1) 
mass(3) = -MFcp(gt2) 
mass(4) = MFc(gt3) 
 
coup2(1) = cplcFdFuVWRmL(iIN,gt1) 
coup2(2) = cplcFdFuVWRmR(iIN,gt1) 
coup2(3) = Conjg(cplcFdFuHpmL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFdFuHpmR(iIN,gt1,i2))  
coup2(5) = cplcFcpFccVWRmL(gt2,gt3) 
coup2(6) = cplcFcpFccVWRmR(gt2,gt3) 
coup2(7) = Conjg(cplcFcpFccHpmL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFcpFccHpmR(gt2,gt3,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fu cFcp Fc Propagator: VWRm,Hpm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VWRm,Hpm'
      End Do 



!-------------- 
!  Hpm, Hpm 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Boson4(1) = MHpm(i1) 
Boson4(2) = gTHpm(i1) 
Boson4(3) = MHpm(i2) 
Boson4(4) = gTHpm(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFu(gt1) 
mass(3) = -MFcp(gt2) 
mass(4) = MFc(gt3) 
 
coup2(1) = cplcFdFuHpmL(iIN,gt1,i1) 
coup2(2) = cplcFdFuHpmR(iIN,gt1,i1) 
coup2(3) = Conjg(cplcFdFuHpmL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFdFuHpmR(iIN,gt1,i2))  
coup2(5) = cplcFcpFccHpmL(gt2,gt3,i1) 
coup2(6) = cplcFcpFccHpmR(gt2,gt3,i1) 
coup2(7) = Conjg(cplcFcpFccHpmL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFcpFccHpmR(gt2,gt3,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fu cFcp Fc Propagator: Hpm,Hpm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Hpm,Hpm'
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
      Do gt2=1,2
        Do gt3=1,3
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:25))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
  g = oo512pi3 / Abs(MFd(iIN))**3*g
End Subroutine FdToFucFcpFc 
 
 
Subroutine FdToFucFcppFcp(iIN,MFu,MFcpp,MFcp,MVWLm,MVWRm,MHpm,MFd,cplcFcppFcpcHpmL,   & 
& cplcFcppFcpcHpmR,cplcFcppFcpcVWLmL,cplcFcppFcpcVWLmR,cplcFcppFcpcVWRmL,cplcFcppFcpcVWRmR,& 
& cplcFdFuHpmL,cplcFdFuHpmR,cplcFdFuVWLmL,cplcFdFuVWLmR,cplcFdFuVWRmL,cplcFdFuVWRmR,     & 
& IntegralSs,IntegralSSss,IntegralVs,IntegralVSss,IntegralVVss,NSs,NSSss,NVs,            & 
& NVSss,NVVss,gTVWLm,gTVWRm,gTHpm,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFu(3),MFcpp,MFcp(2),MVWLm,MVWRm,MHpm(3),MFd(3)

Complex(dp),Intent(in) :: cplcFcppFcpcHpmL(2,3),cplcFcppFcpcHpmR(2,3),cplcFcppFcpcVWLmL(2),cplcFcppFcpcVWLmR(2),& 
& cplcFcppFcpcVWRmL(2),cplcFcppFcpcVWRmR(2),cplcFdFuHpmL(3,3,3),cplcFdFuHpmR(3,3,3),     & 
& cplcFdFuVWLmL(3,3),cplcFdFuVWLmR(3,3),cplcFdFuVWRmL(3,3),cplcFdFuVWRmR(3,3)

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
mass(1) = MFd(iIN) 
 
Isum = 25 
Allocate( gSum(3,1,2, Isum) ) 
Allocate( Contribution(3,1,2, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,3
        Do gt3=1,2
Isum = 0 
 
If(Abs(MFd(iIN)).gt.(Abs(MFcp(gt3))+Abs(MFcpp)+Abs(MFu(gt1)))) Then 
!-------------- 
!  VWLm 
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
 
mass(2) = MFu(gt1) 
mass(3) = -MFcpp 
mass(4) = MFcp(gt3) 
 
coup(2) = Conjg(cplcFdFuVWLmL(iIN,gt1)) 
coup(1) = Conjg(cplcFdFuVWLmR(iIN,gt1)) 
coup(4) = Conjg(cplcFcppFcpcVWLmL(gt3)) 
coup(3) = Conjg(cplcFcppFcpcVWLmR(gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fu cFcpp Fcp Propagator: VWLm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,1,gt3,Isum)= 0._dp
Else 
gSum(gt1,1,gt3,Isum)=resD
End If 
Contribution(gt1,1,gt3,Isum)='VWLm'



!-------------- 
!  VWRm 
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
 
mass(2) = MFu(gt1) 
mass(3) = -MFcpp 
mass(4) = MFcp(gt3) 
 
coup(2) = Conjg(cplcFdFuVWRmL(iIN,gt1)) 
coup(1) = Conjg(cplcFdFuVWRmR(iIN,gt1)) 
coup(4) = Conjg(cplcFcppFcpcVWRmL(gt3)) 
coup(3) = Conjg(cplcFcppFcpcVWRmR(gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fu cFcpp Fcp Propagator: VWRm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,1,gt3,Isum)= 0._dp
Else 
gSum(gt1,1,gt3,Isum)=resD
End If 
Contribution(gt1,1,gt3,Isum)='VWRm'



!-------------- 
!  Hpm 
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
 
mass(2) = MFu(gt1) 
mass(3) = -MFcpp 
mass(4) = MFcp(gt3) 
 
coup(2) = Conjg(cplcFdFuHpmL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcFdFuHpmR(iIN,gt1,i1)) 
coup(4) = Conjg(cplcFcppFcpcHpmL(gt3,i1)) 
coup(3) = Conjg(cplcFcppFcpcHpmR(gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fu cFcpp Fcp Propagator: Hpm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,1,gt3,Isum)= 0._dp
Else 
gSum(gt1,1,gt3,Isum)=resD
End If 
Contribution(gt1,1,gt3,Isum)='Hpm'
      End Do 



!-------------- 
!  VWLm, VWRm 
!-------------- 
Boson4(1) = MVWLm 
Boson4(2) = gTVWLm 
Boson4(3) = MVWRm 
Boson4(4) = gTVWRm 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFu(gt1) 
mass(3) = -MFcpp 
mass(4) = MFcp(gt3) 
 
coup2(1) = cplcFdFuVWLmL(iIN,gt1) 
coup2(2) = cplcFdFuVWLmR(iIN,gt1) 
coup2(4) = Conjg(cplcFdFuVWRmL(iIN,gt1)) 
coup2(3) = Conjg(cplcFdFuVWRmR(iIN,gt1))  
coup2(5) = cplcFcppFcpcVWLmL(gt3) 
coup2(6) = cplcFcppFcpcVWLmR(gt3) 
coup2(8) = Conjg(cplcFcppFcpcVWRmL(gt3)) 
coup2(7) = Conjg(cplcFcppFcpcVWRmR(gt3)) 
Call IntegrateGaugeSS(Boson4, mass, coup2, deltaM, epsI,IntegralVVss,NVVss, resR, check) 
If (resR.ne.resR) resR = 0._dp
resC = 2._dp*resR 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fu cFcpp Fcp Propagator: VWLm,VWRm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,1,gt3,Isum)= 0._dp  
Else 
gSum(gt1,1,gt3,Isum)= resS  
End If 
Contribution(gt1,1,gt3,Isum)='VWLm,VWRm'



!-------------- 
!  VWLm, Hpm 
!-------------- 
  Do i2=1,3
Boson4(1) = MVWLm 
Boson4(2) = gTVWLm 
Boson4(3) = MHpm(i2) 
Boson4(4) = gTHpm(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFu(gt1) 
mass(3) = -MFcpp 
mass(4) = MFcp(gt3) 
 
coup2(1) = cplcFdFuVWLmL(iIN,gt1) 
coup2(2) = cplcFdFuVWLmR(iIN,gt1) 
coup2(3) = Conjg(cplcFdFuHpmL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFdFuHpmR(iIN,gt1,i2))  
coup2(5) = cplcFcppFcpcVWLmL(gt3) 
coup2(6) = cplcFcppFcpcVWLmR(gt3) 
coup2(7) = Conjg(cplcFcppFcpcHpmL(gt3,i2)) 
coup2(8) = Conjg(cplcFcppFcpcHpmR(gt3,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fu cFcpp Fcp Propagator: VWLm,Hpm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,1,gt3,Isum)= 0._dp  
Else 
gSum(gt1,1,gt3,Isum)= resS  
End If 
Contribution(gt1,1,gt3,Isum)='VWLm,Hpm'
      End Do 



!-------------- 
!  VWRm, Hpm 
!-------------- 
  Do i2=1,3
Boson4(1) = MVWRm 
Boson4(2) = gTVWRm 
Boson4(3) = MHpm(i2) 
Boson4(4) = gTHpm(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFu(gt1) 
mass(3) = -MFcpp 
mass(4) = MFcp(gt3) 
 
coup2(1) = cplcFdFuVWRmL(iIN,gt1) 
coup2(2) = cplcFdFuVWRmR(iIN,gt1) 
coup2(3) = Conjg(cplcFdFuHpmL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFdFuHpmR(iIN,gt1,i2))  
coup2(5) = cplcFcppFcpcVWRmL(gt3) 
coup2(6) = cplcFcppFcpcVWRmR(gt3) 
coup2(7) = Conjg(cplcFcppFcpcHpmL(gt3,i2)) 
coup2(8) = Conjg(cplcFcppFcpcHpmR(gt3,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fu cFcpp Fcp Propagator: VWRm,Hpm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,1,gt3,Isum)= 0._dp  
Else 
gSum(gt1,1,gt3,Isum)= resS  
End If 
Contribution(gt1,1,gt3,Isum)='VWRm,Hpm'
      End Do 



!-------------- 
!  Hpm, Hpm 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Boson4(1) = MHpm(i1) 
Boson4(2) = gTHpm(i1) 
Boson4(3) = MHpm(i2) 
Boson4(4) = gTHpm(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFu(gt1) 
mass(3) = -MFcpp 
mass(4) = MFcp(gt3) 
 
coup2(1) = cplcFdFuHpmL(iIN,gt1,i1) 
coup2(2) = cplcFdFuHpmR(iIN,gt1,i1) 
coup2(3) = Conjg(cplcFdFuHpmL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFdFuHpmR(iIN,gt1,i2))  
coup2(5) = cplcFcppFcpcHpmL(gt3,i1) 
coup2(6) = cplcFcppFcpcHpmR(gt3,i1) 
coup2(7) = Conjg(cplcFcppFcpcHpmL(gt3,i2)) 
coup2(8) = Conjg(cplcFcppFcpcHpmR(gt3,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fu cFcpp Fcp Propagator: Hpm,Hpm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,1,gt3,Isum)= 0._dp  
Else 
gSum(gt1,1,gt3,Isum)= resS  
End If 
Contribution(gt1,1,gt3,Isum)='Hpm,Hpm'
        End Do 
      End Do 



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
g(gt1,1,gt3)=Sum(gSum(gt1,1,gt3,1:25))
If (g(gt1,1,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,1,gt3)=0._dp
End If
       End Do 
   End Do 
  g = oo512pi3 / Abs(MFd(iIN))**3*g
End Subroutine FdToFucFcppFcp 
 
 
Subroutine FdToFucFeFv(iIN,MFu,MFe,MFv,MVWLm,MVWRm,MHpm,MFd,cplcFdFuHpmL,             & 
& cplcFdFuHpmR,cplcFdFuVWLmL,cplcFdFuVWLmR,cplcFdFuVWRmL,cplcFdFuVWRmR,cplcFeFvcHpmL,    & 
& cplcFeFvcHpmR,cplcFeFvcVWLmL,cplcFeFvcVWLmR,cplcFeFvcVWRmL,cplcFeFvcVWRmR,             & 
& IntegralSs,IntegralSSss,IntegralVs,IntegralVSss,IntegralVVss,NSs,NSSss,NVs,            & 
& NVSss,NVVss,gTVWLm,gTVWRm,gTHpm,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFu(3),MFe(3),MFv(6),MVWLm,MVWRm,MHpm(3),MFd(3)

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
mass(1) = MFd(iIN) 
 
Isum = 25 
Allocate( gSum(3,3,6, Isum) ) 
Allocate( Contribution(3,3,6, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,3
      Do gt2=1,3
        Do gt3=1,6
Isum = 0 
 
If(Abs(MFd(iIN)).gt.(Abs(MFv(gt3))+Abs(MFe(gt2))+Abs(MFu(gt1)))) Then 
!-------------- 
!  VWLm 
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
 
mass(2) = MFu(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFv(gt3) 
 
coup(2) = Conjg(cplcFdFuVWLmL(iIN,gt1)) 
coup(1) = Conjg(cplcFdFuVWLmR(iIN,gt1)) 
coup(4) = Conjg(cplcFeFvcVWLmL(gt2,gt3)) 
coup(3) = Conjg(cplcFeFvcVWLmR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fu cFe Fv Propagator: VWLm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VWLm'



!-------------- 
!  VWRm 
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
 
mass(2) = MFu(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFv(gt3) 
 
coup(2) = Conjg(cplcFdFuVWRmL(iIN,gt1)) 
coup(1) = Conjg(cplcFdFuVWRmR(iIN,gt1)) 
coup(4) = Conjg(cplcFeFvcVWRmL(gt2,gt3)) 
coup(3) = Conjg(cplcFeFvcVWRmR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fu cFe Fv Propagator: VWRm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VWRm'



!-------------- 
!  Hpm 
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
 
mass(2) = MFu(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFv(gt3) 
 
coup(2) = Conjg(cplcFdFuHpmL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcFdFuHpmR(iIN,gt1,i1)) 
coup(4) = Conjg(cplcFeFvcHpmL(gt2,gt3,i1)) 
coup(3) = Conjg(cplcFeFvcHpmR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fu cFe Fv Propagator: Hpm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Hpm'
      End Do 



!-------------- 
!  VWLm, VWRm 
!-------------- 
Boson4(1) = MVWLm 
Boson4(2) = gTVWLm 
Boson4(3) = MVWRm 
Boson4(4) = gTVWRm 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFu(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFv(gt3) 
 
coup2(1) = cplcFdFuVWLmL(iIN,gt1) 
coup2(2) = cplcFdFuVWLmR(iIN,gt1) 
coup2(4) = Conjg(cplcFdFuVWRmL(iIN,gt1)) 
coup2(3) = Conjg(cplcFdFuVWRmR(iIN,gt1))  
coup2(5) = cplcFeFvcVWLmL(gt2,gt3) 
coup2(6) = cplcFeFvcVWLmR(gt2,gt3) 
coup2(8) = Conjg(cplcFeFvcVWRmL(gt2,gt3)) 
coup2(7) = Conjg(cplcFeFvcVWRmR(gt2,gt3)) 
Call IntegrateGaugeSS(Boson4, mass, coup2, deltaM, epsI,IntegralVVss,NVVss, resR, check) 
If (resR.ne.resR) resR = 0._dp
resC = 2._dp*resR 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fu cFe Fv Propagator: VWLm,VWRm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VWLm,VWRm'



!-------------- 
!  VWLm, Hpm 
!-------------- 
  Do i2=1,3
Boson4(1) = MVWLm 
Boson4(2) = gTVWLm 
Boson4(3) = MHpm(i2) 
Boson4(4) = gTHpm(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFu(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFv(gt3) 
 
coup2(1) = cplcFdFuVWLmL(iIN,gt1) 
coup2(2) = cplcFdFuVWLmR(iIN,gt1) 
coup2(3) = Conjg(cplcFdFuHpmL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFdFuHpmR(iIN,gt1,i2))  
coup2(5) = cplcFeFvcVWLmL(gt2,gt3) 
coup2(6) = cplcFeFvcVWLmR(gt2,gt3) 
coup2(7) = Conjg(cplcFeFvcHpmL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFeFvcHpmR(gt2,gt3,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fu cFe Fv Propagator: VWLm,Hpm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VWLm,Hpm'
      End Do 



!-------------- 
!  VWRm, Hpm 
!-------------- 
  Do i2=1,3
Boson4(1) = MVWRm 
Boson4(2) = gTVWRm 
Boson4(3) = MHpm(i2) 
Boson4(4) = gTHpm(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFu(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFv(gt3) 
 
coup2(1) = cplcFdFuVWRmL(iIN,gt1) 
coup2(2) = cplcFdFuVWRmR(iIN,gt1) 
coup2(3) = Conjg(cplcFdFuHpmL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFdFuHpmR(iIN,gt1,i2))  
coup2(5) = cplcFeFvcVWRmL(gt2,gt3) 
coup2(6) = cplcFeFvcVWRmR(gt2,gt3) 
coup2(7) = Conjg(cplcFeFvcHpmL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFeFvcHpmR(gt2,gt3,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fu cFe Fv Propagator: VWRm,Hpm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VWRm,Hpm'
      End Do 



!-------------- 
!  Hpm, Hpm 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Boson4(1) = MHpm(i1) 
Boson4(2) = gTHpm(i1) 
Boson4(3) = MHpm(i2) 
Boson4(4) = gTHpm(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFu(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFv(gt3) 
 
coup2(1) = cplcFdFuHpmL(iIN,gt1,i1) 
coup2(2) = cplcFdFuHpmR(iIN,gt1,i1) 
coup2(3) = Conjg(cplcFdFuHpmL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFdFuHpmR(iIN,gt1,i2))  
coup2(5) = cplcFeFvcHpmL(gt2,gt3,i1) 
coup2(6) = cplcFeFvcHpmR(gt2,gt3,i1) 
coup2(7) = Conjg(cplcFeFvcHpmL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFeFvcHpmR(gt2,gt3,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fu cFe Fv Propagator: Hpm,Hpm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Hpm,Hpm'
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
      Do gt2=1,3
        Do gt3=1,6
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:25))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
  g = oo512pi3 / Abs(MFd(iIN))**3*g
End Subroutine FdToFucFeFv 
 
 
End Module Fd3Decays_tripletLR 
 

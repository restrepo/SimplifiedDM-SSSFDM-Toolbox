! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.8.5 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 23:17 on 17.6.2016   
! ----------------------------------------------------------------------  
 
 
Module Nv03Decays_SimplifiedDMSDFDM 
 
Use Control 
Use CouplingsForDecays_SimplifiedDMSDFDM 
Use ThreeBodyPhaseSpace 
 
Contains 
 
Subroutine Nv0ThreeBodyDecay(n_in,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,              & 
& MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MNv0,MNv02,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,             & 
& ZER,ZUR,ZDL,ZEL,ZUL,Vv,ZvN,ZW,ZZ,g1,g2,g3,Lam,Yu,Yd,Ye,YR3,YR4,Mn,MDF,mu2,             & 
& v,gThh,gTVWp,gTVZ,gNv0FrecFdFu,gNv0FrecFeFv,gNv0Nv0cFreFre,gNv0Nv0cFdFd,               & 
& gNv0Nv0cFeFe,gNv0Nv0cFuFu,gNv0Nv0Nv0Nv0,gNv0Nv0FvFv,epsI,deltaM,CheckRealStates,       & 
& gT,gPartial,BR)

Implicit None 
 
Real(dp),Intent(in) :: MAh,MAh2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFre,MFre2,MFu(3),MFu2(3),MFv(3),              & 
& MFv2(3),Mhh,Mhh2,MHp,MHp2,MNv0(3),MNv02(3),MVWp,MVWp2,MVZ,MVZ2,TW,ZZ(2,2)

Complex(dp),Intent(in) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),Vv(3,3),ZvN(3,3),ZW(2,2)

Complex(dp) :: cplcFdFdhhL(3,3),cplcFdFdhhR(3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFdFucVWpL(3,3),& 
& cplcFdFucVWpR(3,3),cplcFeFehhL(3,3),cplcFeFehhR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),& 
& cplcFeFvcVWpL(3,3),cplcFeFvcVWpR(3,3),cplcFreFreVZL,cplcFreFreVZR,cplcFreNv0cVWpL(3),  & 
& cplcFreNv0cVWpR(3),cplcFuFuhhL(3,3),cplcFuFuhhR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),& 
& cplFvFvVZL(3,3),cplFvFvVZR(3,3),cplNv0FreVWpL(3),cplNv0FreVWpR(3),cplNv0Nv0hhL(3,3),   & 
& cplNv0Nv0hhR(3,3),cplNv0Nv0VZL(3,3),cplNv0Nv0VZR(3,3)

Real(dp),Intent(in) :: g1,g2,g3,YR3,YR4,v

Complex(dp),Intent(in) :: Lam,Yu(3,3),Yd(3,3),Ye(3,3),Mn,MDF,mu2

Real(dp),Intent(inout) :: gNv0FrecFdFu(3,1,3,3),gNv0FrecFeFv(3,1,3,3),gNv0Nv0cFreFre(3,3,1,1),gNv0Nv0cFdFd(3,3,3,3),& 
& gNv0Nv0cFeFe(3,3,3,3),gNv0Nv0cFuFu(3,3,3,3),gNv0Nv0Nv0Nv0(3,3,3,3),gNv0Nv0FvFv(3,3,3,3)

Real(dp),Intent(in) :: gThh,gTVWp,gTVZ

Real(dp) :: gNv0FrecFdFui(1,3,3),gNv0FrecFeFvi(1,3,3),gNv0Nv0cFreFrei(3,1,1),gNv0Nv0cFdFdi(3,3,3),& 
& gNv0Nv0cFeFei(3,3,3),gNv0Nv0cFuFui(3,3,3),gNv0Nv0Nv0Nv0i(3,3,3),gNv0Nv0FvFvi(3,3,3)

Real(dp) :: gThhtemp,gTVWptemp,gTVZtemp
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
NameOfUnit(Iname) = 'Nv0ThreeBodyDecay' 
 
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
gThhtemp = 0._dp 
gTVWptemp = 0._dp 
gTVZtemp = 0._dp 
Else 
gThhtemp = gThh 
gTVWptemp = gTVWp 
gTVZtemp = gTVZ 
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
 
Call CouplingsFor_Nv0_decays_3B(MNv0(i_run),i_run,MAh,MAh2,MFd,MFd2,MFe,              & 
& MFe2,MFre,MFre2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MNv0,MNv02,MVWp,MVWp2,             & 
& MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,Vv,ZvN,ZW,ZZ,g1,g2,g3,Lam,Yu,Yd,Ye,YR3,            & 
& YR4,Mn,MDF,mu2,v,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFucVWpL,        & 
& cplcFdFucVWpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFvcVWpL,           & 
& cplcFeFvcVWpR,cplcFreFreVZL,cplcFreFreVZR,cplcFreNv0cVWpL,cplcFreNv0cVWpR,             & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplNv0FreVWpL,   & 
& cplNv0FreVWpR,cplNv0Nv0hhL,cplNv0Nv0hhR,cplNv0Nv0VZL,cplNv0Nv0VZR,deltaM)

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

 
gNv0FrecFdFui = 0._dp 
Call Nv0ToFrecFdFu(i_run,MFre,MFd,MFu,MVWp,MNv0,cplcFdFucVWpL,cplcFdFucVWpR,          & 
& cplNv0FreVWpL,cplNv0FreVWpR,IntegralVs,IntegralVVss,NVs,NVVss,gTVWptemp,               & 
& deltaM,epsI,check,gNv0FrecFdFui)

gNv0FrecFdFu(i_run,:,:,:) = gNv0FrecFdFui 
gT(i_run) = gT(i_run) + 2._dp*Sum(gNv0FrecFdFui) 
 
gNv0FrecFeFvi = 0._dp 
Call Nv0ToFrecFeFv(i_run,MFre,MFe,MFv,MVWp,MNv0,cplcFeFvcVWpL,cplcFeFvcVWpR,          & 
& cplNv0FreVWpL,cplNv0FreVWpR,IntegralVs,IntegralVVss,NVs,NVVss,gTVWptemp,               & 
& deltaM,epsI,check,gNv0FrecFeFvi)

gNv0FrecFeFv(i_run,:,:,:) = gNv0FrecFeFvi 
gT(i_run) = gT(i_run) + 2._dp*Sum(gNv0FrecFeFvi) 
 
gNv0Nv0cFreFrei = 0._dp 
Call Nv0ToNv0cFreFre(i_run,MNv0,MFre,MVZ,MVWp,cplcFreFreVZL,cplcFreFreVZR,            & 
& cplcFreNv0cVWpL,cplcFreNv0cVWpR,cplNv0FreVWpL,cplNv0FreVWpR,cplNv0Nv0VZL,              & 
& cplNv0Nv0VZR,IntegralVs,IntegralVVss,IntegralVVst,NVs,NVVss,NVVst,gTVZtemp,            & 
& gTVWptemp,deltaM,epsI,check,gNv0Nv0cFreFrei)

gNv0Nv0cFreFre(i_run,:,:,:) = gNv0Nv0cFreFrei 
gT(i_run) = gT(i_run) + Sum(gNv0Nv0cFreFrei) 
 
gNv0Nv0cFdFdi = 0._dp 
Call Nv0ToNv0cFdFd(i_run,MNv0,MFd,MVZ,Mhh,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,        & 
& cplcFdFdVZR,cplNv0Nv0hhL,cplNv0Nv0hhR,cplNv0Nv0VZL,cplNv0Nv0VZR,IntegralSs,            & 
& IntegralSSss,IntegralVs,IntegralVSss,IntegralVVss,NSs,NSSss,NVs,NVSss,NVVss,           & 
& gTVZtemp,gThhtemp,deltaM,epsI,check,gNv0Nv0cFdFdi)

gNv0Nv0cFdFd(i_run,:,:,:) = gNv0Nv0cFdFdi 
gT(i_run) = gT(i_run) + Sum(gNv0Nv0cFdFdi) 
 
gNv0Nv0cFeFei = 0._dp 
Call Nv0ToNv0cFeFe(i_run,MNv0,MFe,MVZ,Mhh,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,        & 
& cplcFeFeVZR,cplNv0Nv0hhL,cplNv0Nv0hhR,cplNv0Nv0VZL,cplNv0Nv0VZR,IntegralSs,            & 
& IntegralSSss,IntegralVs,IntegralVSss,IntegralVVss,NSs,NSSss,NVs,NVSss,NVVss,           & 
& gTVZtemp,gThhtemp,deltaM,epsI,check,gNv0Nv0cFeFei)

gNv0Nv0cFeFe(i_run,:,:,:) = gNv0Nv0cFeFei 
gT(i_run) = gT(i_run) + Sum(gNv0Nv0cFeFei) 
 
gNv0Nv0cFuFui = 0._dp 
Call Nv0ToNv0cFuFu(i_run,MNv0,MFu,MVZ,Mhh,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,        & 
& cplcFuFuVZR,cplNv0Nv0hhL,cplNv0Nv0hhR,cplNv0Nv0VZL,cplNv0Nv0VZR,IntegralSs,            & 
& IntegralSSss,IntegralVs,IntegralVSss,IntegralVVss,NSs,NSSss,NVs,NVSss,NVVss,           & 
& gTVZtemp,gThhtemp,deltaM,epsI,check,gNv0Nv0cFuFui)

gNv0Nv0cFuFu(i_run,:,:,:) = gNv0Nv0cFuFui 
gT(i_run) = gT(i_run) + Sum(gNv0Nv0cFuFui) 
 
gNv0Nv0Nv0Nv0i = 0._dp 
Call Nv0ToNv0Nv0Nv0(i_run,MNv0,MVZ,Mhh,cplNv0Nv0hhL,cplNv0Nv0hhR,cplNv0Nv0VZL,        & 
& cplNv0Nv0VZR,IntegralSs,IntegralSSss,IntegralSSst,IntegralVs,IntegralVSss,             & 
& IntegralVSst,IntegralVVss,IntegralVVst,NSs,NSSss,NSSst,NVs,NVSss,NVSst,NVVss,          & 
& NVVst,gTVZtemp,gThhtemp,deltaM,epsI,check,gNv0Nv0Nv0Nv0i)

gNv0Nv0Nv0Nv0(i_run,:,:,:) = gNv0Nv0Nv0Nv0i 
gT(i_run) = gT(i_run) + Sum(gNv0Nv0Nv0Nv0i) 
 
gNv0Nv0FvFvi = 0._dp 
Call Nv0ToNv0FvFv(i_run,MNv0,MFv,MVZ,cplFvFvVZL,cplFvFvVZR,cplNv0Nv0VZL,              & 
& cplNv0Nv0VZR,IntegralVs,IntegralVVss,NVs,NVVss,gTVZtemp,deltaM,epsI,check,             & 
& gNv0Nv0FvFvi)

gNv0Nv0FvFv(i_run,:,:,:) = gNv0Nv0FvFvi 
gT(i_run) = gT(i_run) + Sum(gNv0Nv0FvFvi) 
 
End Do 
 

If (Present(gPartial)) Then
Do i1 = i_start, i_end 
 
n_length=1
Do gt1=1,1
  Do gt2=1,3
    Do gt3=1,3
gPartial(i1,n_length)= 2._dp*gNv0FrecFdFu(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,1
  Do gt2=1,3
    Do gt3=1,3
gPartial(i1,n_length)= 2._dp*gNv0FrecFeFv(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,1
    Do gt3=1,1
gPartial(i1,n_length)= gNv0Nv0cFreFre(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
gPartial(i1,n_length)= gNv0Nv0cFdFd(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
gPartial(i1,n_length)= gNv0Nv0cFeFe(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
gPartial(i1,n_length)= gNv0Nv0cFuFu(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=gt1,3
    Do gt3=gt2,3
gPartial(i1,n_length)= gNv0Nv0Nv0Nv0(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=gt2,3
gPartial(i1,n_length)= gNv0Nv0FvFv(i1,gt1,gt2,gt3)
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
 
End Subroutine Nv0ThreeBodyDecay
 
 
Subroutine Nv0ToFrecFdFu(iIN,MFre,MFd,MFu,MVWp,MNv0,cplcFdFucVWpL,cplcFdFucVWpR,      & 
& cplNv0FreVWpL,cplNv0FreVWpR,IntegralVs,IntegralVVss,NVs,NVVss,gTVWp,deltaM,            & 
& epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFre,MFd(3),MFu(3),MVWp,MNv0(3)

Complex(dp),Intent(in) :: cplcFdFucVWpL(3,3),cplcFdFucVWpR(3,3),cplNv0FreVWpL(3),cplNv0FreVWpR(3)

Real(dp),Intent(inout) :: IntegralVs(25000,9),IntegralVVss(500000,12)

Real(dp),Intent(inout) :: gTVWp

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
mass(1) = MNv0(iIN) 
 
Isum = 1 
Allocate( gSum(1,3,3, Isum) ) 
Allocate( Contribution(1,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
      Do gt2=1,3
        Do gt3=1,3
Isum = 0 
 
If(Abs(MNv0(iIN)).gt.(Abs(MFu(gt3))+Abs(MFd(gt2))+Abs(MFre))) Then 
!-------------- 
!  VWp 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVWp 
Boson2(2) =gTVWp 
 
Boson4(1) = MVWp 
Boson4(2) =gTVWp 
Boson4(3) = MVWp 
Boson4(4) =gTVWp 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFre 
mass(3) = -MFd(gt2) 
mass(4) = MFu(gt3) 
 
coup(2) = Conjg(cplNv0FreVWpL(iIN)) 
coup(1) = Conjg(cplNv0FreVWpR(iIN)) 
coup(4) = Conjg(cplcFdFucVWpL(gt2,gt3)) 
coup(3) = Conjg(cplcFdFucVWpR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Nv0->Fre cFd Fu Propagator: VWp" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(1,gt2,gt3,Isum)= 0._dp
Else 
gSum(1,gt2,gt3,Isum)=resD
End If 
Contribution(1,gt2,gt3,Isum)='VWp'



Else 
gSum(1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
      Do gt2=1,3
        Do gt3=1,3
g(1,gt2,gt3)=Sum(gSum(1,gt2,gt3,1:1))
If (g(1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
  g = oo512pi3 / Abs(MNv0(iIN))**3*g
End Subroutine Nv0ToFrecFdFu 
 
 
Subroutine Nv0ToFrecFeFv(iIN,MFre,MFe,MFv,MVWp,MNv0,cplcFeFvcVWpL,cplcFeFvcVWpR,      & 
& cplNv0FreVWpL,cplNv0FreVWpR,IntegralVs,IntegralVVss,NVs,NVVss,gTVWp,deltaM,            & 
& epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFre,MFe(3),MFv(3),MVWp,MNv0(3)

Complex(dp),Intent(in) :: cplcFeFvcVWpL(3,3),cplcFeFvcVWpR(3,3),cplNv0FreVWpL(3),cplNv0FreVWpR(3)

Real(dp),Intent(inout) :: IntegralVs(25000,9),IntegralVVss(500000,12)

Real(dp),Intent(inout) :: gTVWp

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
mass(1) = MNv0(iIN) 
 
Isum = 1 
Allocate( gSum(1,3,3, Isum) ) 
Allocate( Contribution(1,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
      Do gt2=1,3
        Do gt3=1,3
Isum = 0 
 
If(Abs(MNv0(iIN)).gt.(Abs(MFv(gt3))+Abs(MFe(gt2))+Abs(MFre))) Then 
!-------------- 
!  VWp 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVWp 
Boson2(2) =gTVWp 
 
Boson4(1) = MVWp 
Boson4(2) =gTVWp 
Boson4(3) = MVWp 
Boson4(4) =gTVWp 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFre 
mass(3) = -MFe(gt2) 
mass(4) = MFv(gt3) 
 
coup(2) = Conjg(cplNv0FreVWpL(iIN)) 
coup(1) = Conjg(cplNv0FreVWpR(iIN)) 
coup(4) = Conjg(cplcFeFvcVWpL(gt2,gt3)) 
coup(3) = Conjg(cplcFeFvcVWpR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Nv0->Fre cFe Fv Propagator: VWp" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(1,gt2,gt3,Isum)= 0._dp
Else 
gSum(1,gt2,gt3,Isum)=resD
End If 
Contribution(1,gt2,gt3,Isum)='VWp'



Else 
gSum(1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
      Do gt2=1,3
        Do gt3=1,3
g(1,gt2,gt3)=Sum(gSum(1,gt2,gt3,1:1))
If (g(1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
  g = oo512pi3 / Abs(MNv0(iIN))**3*g
End Subroutine Nv0ToFrecFeFv 
 
 
Subroutine Nv0ToNv0cFreFre(iIN,MNv0,MFre,MVZ,MVWp,cplcFreFreVZL,cplcFreFreVZR,        & 
& cplcFreNv0cVWpL,cplcFreNv0cVWpR,cplNv0FreVWpL,cplNv0FreVWpR,cplNv0Nv0VZL,              & 
& cplNv0Nv0VZR,IntegralVs,IntegralVVss,IntegralVVst,NVs,NVVss,NVVst,gTVZ,gTVWp,          & 
& deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MNv0(3),MFre,MVZ,MVWp

Complex(dp),Intent(in) :: cplcFreFreVZL,cplcFreFreVZR,cplcFreNv0cVWpL(3),cplcFreNv0cVWpR(3),cplNv0FreVWpL(3),   & 
& cplNv0FreVWpR(3),cplNv0Nv0VZL(3,3),cplNv0Nv0VZR(3,3)

Real(dp),Intent(inout) :: IntegralVs(25000,9),IntegralVVss(500000,12)

Complex(dp),Intent(inout) :: IntegralVVst(25000,12)

Real(dp),Intent(inout) :: gTVZ,gTVWp

Integer, Intent(inout) :: NVs,NVVss,NVVst
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
mass(1) = MNv0(iIN) 
 
Isum = 9 
Allocate( gSum(3,1,1, Isum) ) 
Allocate( Contribution(3,1,1, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1, iIN-1
Isum = 0 
 
If(Abs(MNv0(iIN)).gt.(Abs(MFre)+Abs(MFre)+Abs(MNv0(gt1)))) Then 
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
 
mass(2) = MNv0(gt1) 
mass(3) = -MFre 
mass(4) = MFre 
 
coup(2) = Conjg(cplNv0Nv0VZL(iIN,gt1)) 
coup(1) = Conjg(cplNv0Nv0VZR(iIN,gt1)) 
coup(4) = Conjg(cplcFreFreVZL) 
coup(3) = Conjg(cplcFreFreVZR)
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Nv0->Nv0 cFre Fre Propagator: VZ" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,1,1,Isum)= 0._dp
Else 
gSum(gt1,1,1,Isum)=resD
End If 
Contribution(gt1,1,1,Isum)='VZ'



!-------------- 
!  VWp 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVWp 
Boson2(2) =gTVWp 
 
Boson4(1) = MVWp 
Boson4(2) =gTVWp 
Boson4(3) = MVWp 
Boson4(4) =gTVWp 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFre 
mass(3) = -MFre 
mass(4) = MNv0(gt1) 
 
coup(2) = Conjg(cplNv0FreVWpL(iIN)) 
coup(1) = Conjg(cplNv0FreVWpR(iIN)) 
coup(4) = Conjg(cplcFreNv0cVWpL(gt1)) 
coup(3) = Conjg(cplcFreNv0cVWpR(gt1))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Nv0->Nv0 cFre Fre Propagator: VWp" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,1,1,Isum)= 0._dp
Else 
gSum(gt1,1,1,Isum)=resD
End If 
Contribution(gt1,1,1,Isum)='VWp'



!-------------- 
!  conj[VWp] 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVWp 
Boson2(2) =gTVWp 
 
Boson4(1) = MVWp 
Boson4(2) =gTVWp 
Boson4(3) = MVWp 
Boson4(4) =gTVWp 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFre 
mass(3) = -MNv0(gt1) 
mass(4) = MFre 
 
coup(2) = Conjg(cplcFreNv0cVWpL(iIN)) 
coup(1) = Conjg(cplcFreNv0cVWpR(iIN)) 
coup(4) = Conjg(cplNv0FreVWpL(gt1)) 
coup(3) = Conjg(cplNv0FreVWpR(gt1))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Nv0->Nv0 cFre Fre Propagator: conj[VWp]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,1,1,Isum)= 0._dp
Else 
gSum(gt1,1,1,Isum)=resD
End If 
Contribution(gt1,1,1,Isum)='conj[VWp]'



!-------------- 
!  VZ, VWp 
!-------------- 
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MVWp 
Boson4(4) = gTVWp 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFre 
mass(4) = MNv0(gt1) 
mass(3) = -MFre 
 
coup2(1) = cplNv0Nv0VZL(iIN,gt1) 
coup2(2) = cplNv0Nv0VZR(iIN,gt1) 
coup2(4) = Conjg(cplNv0FreVWpL(iIN)) 
coup2(3) = Conjg(cplNv0FreVWpR(iIN))  
coup2(5) = cplcFreFreVZL 
coup2(6) = cplcFreFreVZR 
coup2(8) = Conjg(cplcFreNv0cVWpL(gt1)) 
coup2(7) = Conjg(cplcFreNv0cVWpR(gt1)) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Nv0->Nv0 cFre Fre Propagator: VZ,VWp" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,1,1,Isum)= 0._dp  
Else 
gSum(gt1,1,1,Isum)= resS  
End If 
Contribution(gt1,1,1,Isum)='VZ,VWp'



!-------------- 
!  VZ, conj[VWp] 
!-------------- 
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MVWp 
Boson4(4) = gTVWp 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFre 
mass(4) = MNv0(gt1) 
mass(3) = -MFre 
 
coup2(1) = cplNv0Nv0VZL(iIN,gt1) 
coup2(2) = cplNv0Nv0VZR(iIN,gt1) 
coup2(4) = Conjg(cplcFreNv0cVWpL(iIN)) 
coup2(3) = Conjg(cplcFreNv0cVWpR(iIN))  
coup2(5) = cplcFreFreVZL 
coup2(6) = cplcFreFreVZR 
coup2(8) = Conjg(cplNv0FreVWpL(gt1)) 
coup2(7) = Conjg(cplNv0FreVWpR(gt1)) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Nv0->Nv0 cFre Fre Propagator: VZ,conj[VWp]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,1,1,Isum)= 0._dp  
Else 
gSum(gt1,1,1,Isum)= resS  
End If 
Contribution(gt1,1,1,Isum)='VZ,conj[VWp]'



!-------------- 
!  VWp, conj[VWp] 
!-------------- 
Boson4(1) = MVWp 
Boson4(2) = gTVWp 
Boson4(3) = MVWp 
Boson4(4) = gTVWp 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFre 
mass(4) = MFre 
mass(3) = -MNv0(gt1) 
 
coup2(1) = cplNv0FreVWpL(iIN) 
coup2(2) = cplNv0FreVWpR(iIN) 
coup2(4) = Conjg(cplcFreNv0cVWpL(iIN)) 
coup2(3) = Conjg(cplcFreNv0cVWpR(iIN))  
coup2(5) = cplcFreNv0cVWpL(gt1) 
coup2(6) = cplcFreNv0cVWpR(gt1) 
coup2(8) = Conjg(cplNv0FreVWpL(gt1)) 
coup2(7) = Conjg(cplNv0FreVWpR(gt1)) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Nv0->Nv0 cFre Fre Propagator: VWp,conj[VWp]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,1,1,Isum)= 0._dp  
Else 
gSum(gt1,1,1,Isum)= resS  
End If 
Contribution(gt1,1,1,Isum)='VWp,conj[VWp]'



Else 
gSum(gt1,1,1,:)= 0._dp  
End If 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1, iIN-1
g(gt1,1,1)=Sum(gSum(gt1,1,1,1:9))
If (g(gt1,1,1).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,1,1)=0._dp
End If
   End Do 
  g = oo512pi3 / Abs(MNv0(iIN))**3*g
End Subroutine Nv0ToNv0cFreFre 
 
 
Subroutine Nv0ToNv0cFdFd(iIN,MNv0,MFd,MVZ,Mhh,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,    & 
& cplcFdFdVZR,cplNv0Nv0hhL,cplNv0Nv0hhR,cplNv0Nv0VZL,cplNv0Nv0VZR,IntegralSs,            & 
& IntegralSSss,IntegralVs,IntegralVSss,IntegralVVss,NSs,NSSss,NVs,NVSss,NVVss,           & 
& gTVZ,gThh,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MNv0(3),MFd(3),MVZ,Mhh

Complex(dp),Intent(in) :: cplcFdFdhhL(3,3),cplcFdFdhhR(3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplNv0Nv0hhL(3,3),& 
& cplNv0Nv0hhR(3,3),cplNv0Nv0VZL(3,3),cplNv0Nv0VZR(3,3)

Real(dp),Intent(inout) :: IntegralSs(500000,10),IntegralVs(25000,9),IntegralVVss(500000,12)

Complex(dp),Intent(inout) :: IntegralSSss(500000,12),IntegralVSss(500000,12)

Real(dp),Intent(inout) :: gTVZ,gThh

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
mass(1) = MNv0(iIN) 
 
Isum = 4 
Allocate( gSum(3,3,3, Isum) ) 
Allocate( Contribution(3,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1, iIN-1
      Do gt2=1,3
        Do gt3=1,3
Isum = 0 
 
If(Abs(MNv0(iIN)).gt.(Abs(MFd(gt3))+Abs(MFd(gt2))+Abs(MNv0(gt1)))) Then 
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
 
mass(2) = MNv0(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup(2) = Conjg(cplNv0Nv0VZL(iIN,gt1)) 
coup(1) = Conjg(cplNv0Nv0VZR(iIN,gt1)) 
coup(4) = Conjg(cplcFdFdVZL(gt2,gt3)) 
coup(3) = Conjg(cplcFdFdVZR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Nv0->Nv0 cFd Fd Propagator: VZ" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ'



!-------------- 
!  hh 
!-------------- 
Isum = Isum + 1 
Boson2(1) = Mhh 
Boson2(2) =gThh 
 
Boson4(1) = Mhh 
Boson4(2) =gThh 
Boson4(3) = Mhh 
Boson4(4) =gThh 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MNv0(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup(2) = Conjg(cplNv0Nv0hhL(iIN,gt1)) 
coup(1) = Conjg(cplNv0Nv0hhR(iIN,gt1)) 
coup(4) = Conjg(cplcFdFdhhL(gt2,gt3)) 
coup(3) = Conjg(cplcFdFdhhR(gt2,gt3))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Nv0->Nv0 cFd Fd Propagator: hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='hh'



!-------------- 
!  VZ, hh 
!-------------- 
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = Mhh 
Boson4(4) = gThh 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MNv0(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup2(1) = cplNv0Nv0VZL(iIN,gt1) 
coup2(2) = cplNv0Nv0VZR(iIN,gt1) 
coup2(3) = Conjg(cplNv0Nv0hhL(iIN,gt1)) 
coup2(4) = Conjg(cplNv0Nv0hhR(iIN,gt1))  
coup2(5) = cplcFdFdVZL(gt2,gt3) 
coup2(6) = cplcFdFdVZR(gt2,gt3) 
coup2(7) = Conjg(cplcFdFdhhL(gt2,gt3)) 
coup2(8) = Conjg(cplcFdFdhhR(gt2,gt3)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Nv0->Nv0 cFd Fd Propagator: VZ,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,hh'



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
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:4))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
  g = oo512pi3 / Abs(MNv0(iIN))**3*g
End Subroutine Nv0ToNv0cFdFd 
 
 
Subroutine Nv0ToNv0cFeFe(iIN,MNv0,MFe,MVZ,Mhh,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,    & 
& cplcFeFeVZR,cplNv0Nv0hhL,cplNv0Nv0hhR,cplNv0Nv0VZL,cplNv0Nv0VZR,IntegralSs,            & 
& IntegralSSss,IntegralVs,IntegralVSss,IntegralVVss,NSs,NSSss,NVs,NVSss,NVVss,           & 
& gTVZ,gThh,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MNv0(3),MFe(3),MVZ,Mhh

Complex(dp),Intent(in) :: cplcFeFehhL(3,3),cplcFeFehhR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplNv0Nv0hhL(3,3),& 
& cplNv0Nv0hhR(3,3),cplNv0Nv0VZL(3,3),cplNv0Nv0VZR(3,3)

Real(dp),Intent(inout) :: IntegralSs(500000,10),IntegralVs(25000,9),IntegralVVss(500000,12)

Complex(dp),Intent(inout) :: IntegralSSss(500000,12),IntegralVSss(500000,12)

Real(dp),Intent(inout) :: gTVZ,gThh

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
mass(1) = MNv0(iIN) 
 
Isum = 4 
Allocate( gSum(3,3,3, Isum) ) 
Allocate( Contribution(3,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1, iIN-1
      Do gt2=1,3
        Do gt3=1,3
Isum = 0 
 
If(Abs(MNv0(iIN)).gt.(Abs(MFe(gt3))+Abs(MFe(gt2))+Abs(MNv0(gt1)))) Then 
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
 
mass(2) = MNv0(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup(2) = Conjg(cplNv0Nv0VZL(iIN,gt1)) 
coup(1) = Conjg(cplNv0Nv0VZR(iIN,gt1)) 
coup(4) = Conjg(cplcFeFeVZL(gt2,gt3)) 
coup(3) = Conjg(cplcFeFeVZR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Nv0->Nv0 cFe Fe Propagator: VZ" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ'



!-------------- 
!  hh 
!-------------- 
Isum = Isum + 1 
Boson2(1) = Mhh 
Boson2(2) =gThh 
 
Boson4(1) = Mhh 
Boson4(2) =gThh 
Boson4(3) = Mhh 
Boson4(4) =gThh 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MNv0(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup(2) = Conjg(cplNv0Nv0hhL(iIN,gt1)) 
coup(1) = Conjg(cplNv0Nv0hhR(iIN,gt1)) 
coup(4) = Conjg(cplcFeFehhL(gt2,gt3)) 
coup(3) = Conjg(cplcFeFehhR(gt2,gt3))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Nv0->Nv0 cFe Fe Propagator: hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='hh'



!-------------- 
!  VZ, hh 
!-------------- 
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = Mhh 
Boson4(4) = gThh 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MNv0(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplNv0Nv0VZL(iIN,gt1) 
coup2(2) = cplNv0Nv0VZR(iIN,gt1) 
coup2(3) = Conjg(cplNv0Nv0hhL(iIN,gt1)) 
coup2(4) = Conjg(cplNv0Nv0hhR(iIN,gt1))  
coup2(5) = cplcFeFeVZL(gt2,gt3) 
coup2(6) = cplcFeFeVZR(gt2,gt3) 
coup2(7) = Conjg(cplcFeFehhL(gt2,gt3)) 
coup2(8) = Conjg(cplcFeFehhR(gt2,gt3)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Nv0->Nv0 cFe Fe Propagator: VZ,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,hh'



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
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:4))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
  g = oo512pi3 / Abs(MNv0(iIN))**3*g
End Subroutine Nv0ToNv0cFeFe 
 
 
Subroutine Nv0ToNv0cFuFu(iIN,MNv0,MFu,MVZ,Mhh,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,    & 
& cplcFuFuVZR,cplNv0Nv0hhL,cplNv0Nv0hhR,cplNv0Nv0VZL,cplNv0Nv0VZR,IntegralSs,            & 
& IntegralSSss,IntegralVs,IntegralVSss,IntegralVVss,NSs,NSSss,NVs,NVSss,NVVss,           & 
& gTVZ,gThh,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MNv0(3),MFu(3),MVZ,Mhh

Complex(dp),Intent(in) :: cplcFuFuhhL(3,3),cplcFuFuhhR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplNv0Nv0hhL(3,3),& 
& cplNv0Nv0hhR(3,3),cplNv0Nv0VZL(3,3),cplNv0Nv0VZR(3,3)

Real(dp),Intent(inout) :: IntegralSs(500000,10),IntegralVs(25000,9),IntegralVVss(500000,12)

Complex(dp),Intent(inout) :: IntegralSSss(500000,12),IntegralVSss(500000,12)

Real(dp),Intent(inout) :: gTVZ,gThh

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
mass(1) = MNv0(iIN) 
 
Isum = 4 
Allocate( gSum(3,3,3, Isum) ) 
Allocate( Contribution(3,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1, iIN-1
      Do gt2=1,3
        Do gt3=1,3
Isum = 0 
 
If(Abs(MNv0(iIN)).gt.(Abs(MFu(gt3))+Abs(MFu(gt2))+Abs(MNv0(gt1)))) Then 
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
 
mass(2) = MNv0(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup(2) = Conjg(cplNv0Nv0VZL(iIN,gt1)) 
coup(1) = Conjg(cplNv0Nv0VZR(iIN,gt1)) 
coup(4) = Conjg(cplcFuFuVZL(gt2,gt3)) 
coup(3) = Conjg(cplcFuFuVZR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Nv0->Nv0 cFu Fu Propagator: VZ" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ'



!-------------- 
!  hh 
!-------------- 
Isum = Isum + 1 
Boson2(1) = Mhh 
Boson2(2) =gThh 
 
Boson4(1) = Mhh 
Boson4(2) =gThh 
Boson4(3) = Mhh 
Boson4(4) =gThh 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MNv0(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup(2) = Conjg(cplNv0Nv0hhL(iIN,gt1)) 
coup(1) = Conjg(cplNv0Nv0hhR(iIN,gt1)) 
coup(4) = Conjg(cplcFuFuhhL(gt2,gt3)) 
coup(3) = Conjg(cplcFuFuhhR(gt2,gt3))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Nv0->Nv0 cFu Fu Propagator: hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='hh'



!-------------- 
!  VZ, hh 
!-------------- 
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = Mhh 
Boson4(4) = gThh 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MNv0(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup2(1) = cplNv0Nv0VZL(iIN,gt1) 
coup2(2) = cplNv0Nv0VZR(iIN,gt1) 
coup2(3) = Conjg(cplNv0Nv0hhL(iIN,gt1)) 
coup2(4) = Conjg(cplNv0Nv0hhR(iIN,gt1))  
coup2(5) = cplcFuFuVZL(gt2,gt3) 
coup2(6) = cplcFuFuVZR(gt2,gt3) 
coup2(7) = Conjg(cplcFuFuhhL(gt2,gt3)) 
coup2(8) = Conjg(cplcFuFuhhR(gt2,gt3)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Nv0->Nv0 cFu Fu Propagator: VZ,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,hh'



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
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:4))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
  g = oo512pi3 / Abs(MNv0(iIN))**3*g
End Subroutine Nv0ToNv0cFuFu 
 
 
Subroutine Nv0ToNv0Nv0Nv0(iIN,MNv0,MVZ,Mhh,cplNv0Nv0hhL,cplNv0Nv0hhR,cplNv0Nv0VZL,    & 
& cplNv0Nv0VZR,IntegralSs,IntegralSSss,IntegralSSst,IntegralVs,IntegralVSss,             & 
& IntegralVSst,IntegralVVss,IntegralVVst,NSs,NSSss,NSSst,NVs,NVSss,NVSst,NVVss,          & 
& NVVst,gTVZ,gThh,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MNv0(3),MVZ,Mhh

Complex(dp),Intent(in) :: cplNv0Nv0hhL(3,3),cplNv0Nv0hhR(3,3),cplNv0Nv0VZL(3,3),cplNv0Nv0VZR(3,3)

Real(dp),Intent(inout) :: IntegralSs(500000,10),IntegralVs(25000,9),IntegralVVss(500000,12)

Complex(dp),Intent(inout) :: IntegralSSss(500000,12),IntegralSSst(500000,16),IntegralVSss(500000,12),              & 
& IntegralVSst(500000,16),IntegralVVst(25000,12)

Real(dp),Intent(inout) :: gTVZ,gThh

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
mass(1) = MNv0(iIN) 
 
Isum = 4 
Allocate( gSum(3,3,3, Isum) ) 
Allocate( Contribution(3,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1, iIN-1
      Do gt2=gt1, iIN-1
        Do gt3=gt2, iIN-1
Isum = 0 
 
If(Abs(MNv0(iIN)).gt.(Abs(MNv0(gt3))+Abs(MNv0(gt2))+Abs(MNv0(gt1)))) Then 
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
 
mass(2) = MNv0(gt1) 
mass(3) = -MNv0(gt2) 
mass(4) = MNv0(gt3) 
 
coup(2) = Conjg(cplNv0Nv0VZL(iIN,gt1)) 
coup(1) = Conjg(cplNv0Nv0VZR(iIN,gt1)) 
coup(4) = Conjg(cplNv0Nv0VZL(gt2,gt3)) 
coup(3) = Conjg(cplNv0Nv0VZR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt1.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MNv0(gt2) 
mass(3) = -MNv0(gt1) 
mass(4) = MNv0(gt3) 
 
coup(2) = Conjg(cplNv0Nv0VZL(iIN,gt2)) 
coup(1) = Conjg(cplNv0Nv0VZR(iIN,gt2)) 
coup(4) = Conjg(cplNv0Nv0VZL(gt1,gt3)) 
coup(3) = Conjg(cplNv0Nv0VZR(gt1,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt1.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MNv0(gt1) 
mass(3) = -MNv0(gt2) 
mass(4) = MNv0(gt3) 
 
coup2(1) = cplNv0Nv0VZL(iIN,gt1) 
coup2(2) = cplNv0Nv0VZR(iIN,gt1) 
coup2(4) = Conjg(cplNv0Nv0VZL(iIN,gt1)) 
coup2(3) = Conjg(cplNv0Nv0VZR(iIN,gt1))  
coup2(5) = cplNv0Nv0VZL(gt2,gt3) 
coup2(6) = cplNv0Nv0VZR(gt2,gt3) 
coup2(8) = Conjg(cplNv0Nv0VZL(gt2,gt3)) 
coup2(7) = Conjg(cplNv0Nv0VZR(gt2,gt3)) 
Call IntegrateGaugeSS(Boson4, mass, coup2, deltaM, epsI,IntegralVVss,NVVss, resR, check) 
If (resR.ne.resR) resR = 0._dp
resC = -2._dp*resR 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MNv0(gt1) 
mass(3) = -MNv0(gt2) 
mass(4) = MNv0(gt3) 
 
coup2(1) = cplNv0Nv0VZL(iIN,gt1) 
coup2(2) = cplNv0Nv0VZR(iIN,gt1) 
coup2(4) = Conjg(cplNv0Nv0VZL(iIN,gt1)) 
coup2(3) = Conjg(cplNv0Nv0VZR(iIN,gt1))  
coup2(5) = cplNv0Nv0VZL(gt2,gt3) 
coup2(6) = cplNv0Nv0VZR(gt2,gt3) 
coup2(8) = Conjg(cplNv0Nv0VZL(gt2,gt3)) 
coup2(7) = Conjg(cplNv0Nv0VZR(gt2,gt3)) 
Call IntegrateGaugeSS(Boson4, mass, coup2, deltaM, epsI,IntegralVVss,NVVss, resR, check) 
If (resR.ne.resR) resR = 0._dp
resC = -2._dp*resR 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MNv0(gt1) 
mass(4) = MNv0(gt3) 
mass(3) = -MNv0(gt2) 
 
coup2(1) = cplNv0Nv0VZL(iIN,gt3) 
coup2(2) = cplNv0Nv0VZR(iIN,gt3) 
coup2(4) = Conjg(cplNv0Nv0VZL(iIN,gt1)) 
coup2(3) = Conjg(cplNv0Nv0VZR(iIN,gt1))  
coup2(5) = cplNv0Nv0VZL(gt1,gt2) 
coup2(6) = cplNv0Nv0VZR(gt1,gt2) 
coup2(8) = Conjg(cplNv0Nv0VZL(gt2,gt3)) 
coup2(7) = Conjg(cplNv0Nv0VZR(gt2,gt3)) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MNv0(gt1) 
mass(4) = MNv0(gt3) 
mass(3) = -MNv0(gt2) 
 
coup2(1) = cplNv0Nv0VZL(iIN,gt3) 
coup2(2) = cplNv0Nv0VZR(iIN,gt3) 
coup2(4) = Conjg(cplNv0Nv0VZL(iIN,gt1)) 
coup2(3) = Conjg(cplNv0Nv0VZR(iIN,gt1))  
coup2(5) = cplNv0Nv0VZL(gt1,gt2) 
coup2(6) = cplNv0Nv0VZR(gt1,gt2) 
coup2(8) = Conjg(cplNv0Nv0VZL(gt2,gt3)) 
coup2(7) = Conjg(cplNv0Nv0VZR(gt2,gt3)) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MNv0(gt1) 
mass(4) = MNv0(gt2) 
mass(3) = -MNv0(gt3) 
 
coup2(1) = cplNv0Nv0VZL(iIN,gt2) 
coup2(2) = cplNv0Nv0VZR(iIN,gt2) 
coup2(4) = Conjg(cplNv0Nv0VZL(iIN,gt1)) 
coup2(3) = Conjg(cplNv0Nv0VZR(iIN,gt1))  
coup2(5) = cplNv0Nv0VZL(gt1,gt3) 
coup2(6) = cplNv0Nv0VZR(gt1,gt3) 
coup2(8) = Conjg(cplNv0Nv0VZL(gt2,gt3)) 
coup2(7) = Conjg(cplNv0Nv0VZR(gt2,gt3)) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MNv0(gt1) 
mass(4) = MNv0(gt2) 
mass(3) = -MNv0(gt3) 
 
coup2(1) = cplNv0Nv0VZL(iIN,gt2) 
coup2(2) = cplNv0Nv0VZR(iIN,gt2) 
coup2(4) = Conjg(cplNv0Nv0VZL(iIN,gt1)) 
coup2(3) = Conjg(cplNv0Nv0VZR(iIN,gt1))  
coup2(5) = cplNv0Nv0VZL(gt1,gt3) 
coup2(6) = cplNv0Nv0VZR(gt1,gt3) 
coup2(8) = Conjg(cplNv0Nv0VZL(gt2,gt3)) 
coup2(7) = Conjg(cplNv0Nv0VZR(gt2,gt3)) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Nv0->Nv0 Nv0 Nv0 Propagator: VZ" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ'



!-------------- 
!  hh 
!-------------- 
Isum = Isum + 1 
Boson2(1) = Mhh 
Boson2(2) =gThh 
 
Boson4(1) = Mhh 
Boson4(2) =gThh 
Boson4(3) = Mhh 
Boson4(4) =gThh 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MNv0(gt1) 
mass(3) = -MNv0(gt2) 
mass(4) = MNv0(gt3) 
 
coup(2) = Conjg(cplNv0Nv0hhL(iIN,gt1)) 
coup(1) = Conjg(cplNv0Nv0hhR(iIN,gt1)) 
coup(4) = Conjg(cplNv0Nv0hhL(gt2,gt3)) 
coup(3) = Conjg(cplNv0Nv0hhR(gt2,gt3))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt1.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MNv0(gt2) 
mass(3) = -MNv0(gt1) 
mass(4) = MNv0(gt3) 
 
coup(2) = Conjg(cplNv0Nv0hhL(iIN,gt2)) 
coup(1) = Conjg(cplNv0Nv0hhR(iIN,gt2)) 
coup(4) = Conjg(cplNv0Nv0hhL(gt1,gt3)) 
coup(3) = Conjg(cplNv0Nv0hhR(gt1,gt3))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt1.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MNv0(gt1) 
mass(3) = -MNv0(gt2) 
mass(4) = MNv0(gt3) 
 
coup2(1) = cplNv0Nv0hhL(iIN,gt1) 
coup2(2) = cplNv0Nv0hhR(iIN,gt1) 
coup2(3) = Conjg(cplNv0Nv0hhL(iIN,gt1)) 
coup2(4) = Conjg(cplNv0Nv0hhR(iIN,gt1))  
coup2(5) = cplNv0Nv0hhL(gt2,gt3) 
coup2(6) = cplNv0Nv0hhR(gt2,gt3) 
coup2(7) = Conjg(cplNv0Nv0hhL(gt2,gt3)) 
coup2(8) = Conjg(cplNv0Nv0hhR(gt2,gt3)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MNv0(gt1) 
mass(3) = -MNv0(gt2) 
mass(4) = MNv0(gt3) 
 
coup2(1) = cplNv0Nv0hhL(iIN,gt1) 
coup2(2) = cplNv0Nv0hhR(iIN,gt1) 
coup2(3) = Conjg(cplNv0Nv0hhL(iIN,gt1)) 
coup2(4) = Conjg(cplNv0Nv0hhR(iIN,gt1))  
coup2(5) = cplNv0Nv0hhL(gt2,gt3) 
coup2(6) = cplNv0Nv0hhR(gt2,gt3) 
coup2(7) = Conjg(cplNv0Nv0hhL(gt2,gt3)) 
coup2(8) = Conjg(cplNv0Nv0hhR(gt2,gt3)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MNv0(gt1) 
mass(4) = MNv0(gt3) 
mass(3) = -MNv0(gt2) 
 
coup2(1) = cplNv0Nv0hhL(iIN,gt3) 
coup2(2) = cplNv0Nv0hhR(iIN,gt3) 
coup2(3) = Conjg(cplNv0Nv0hhL(iIN,gt1)) 
coup2(4) = Conjg(cplNv0Nv0hhR(iIN,gt1))  
coup2(5) = cplNv0Nv0hhL(gt1,gt2) 
coup2(6) = cplNv0Nv0hhR(gt1,gt2) 
coup2(7) = Conjg(cplNv0Nv0hhL(gt2,gt3)) 
coup2(8) = Conjg(cplNv0Nv0hhR(gt2,gt3)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MNv0(gt1) 
mass(4) = MNv0(gt3) 
mass(3) = -MNv0(gt2) 
 
coup2(1) = cplNv0Nv0hhL(iIN,gt3) 
coup2(2) = cplNv0Nv0hhR(iIN,gt3) 
coup2(3) = Conjg(cplNv0Nv0hhL(iIN,gt1)) 
coup2(4) = Conjg(cplNv0Nv0hhR(iIN,gt1))  
coup2(5) = cplNv0Nv0hhL(gt1,gt2) 
coup2(6) = cplNv0Nv0hhR(gt1,gt2) 
coup2(7) = Conjg(cplNv0Nv0hhL(gt2,gt3)) 
coup2(8) = Conjg(cplNv0Nv0hhR(gt2,gt3)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MNv0(gt1) 
mass(4) = MNv0(gt2) 
mass(3) = -MNv0(gt3) 
 
coup2(1) = cplNv0Nv0hhL(iIN,gt2) 
coup2(2) = cplNv0Nv0hhR(iIN,gt2) 
coup2(3) = Conjg(cplNv0Nv0hhL(iIN,gt1)) 
coup2(4) = Conjg(cplNv0Nv0hhR(iIN,gt1))  
coup2(5) = cplNv0Nv0hhL(gt1,gt3) 
coup2(6) = cplNv0Nv0hhR(gt1,gt3) 
coup2(7) = Conjg(cplNv0Nv0hhL(gt2,gt3)) 
coup2(8) = Conjg(cplNv0Nv0hhR(gt2,gt3)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MNv0(gt1) 
mass(4) = MNv0(gt2) 
mass(3) = -MNv0(gt3) 
 
coup2(1) = cplNv0Nv0hhL(iIN,gt2) 
coup2(2) = cplNv0Nv0hhR(iIN,gt2) 
coup2(3) = Conjg(cplNv0Nv0hhL(iIN,gt1)) 
coup2(4) = Conjg(cplNv0Nv0hhR(iIN,gt1))  
coup2(5) = cplNv0Nv0hhL(gt1,gt3) 
coup2(6) = cplNv0Nv0hhR(gt1,gt3) 
coup2(7) = Conjg(cplNv0Nv0hhL(gt2,gt3)) 
coup2(8) = Conjg(cplNv0Nv0hhR(gt2,gt3)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Nv0->Nv0 Nv0 Nv0 Propagator: hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='hh'



!-------------- 
!  VZ, hh 
!-------------- 
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = Mhh 
Boson4(4) = gThh 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MNv0(gt1) 
mass(3) = -MNv0(gt2) 
mass(4) = MNv0(gt3) 
 
coup2(1) = cplNv0Nv0VZL(iIN,gt1) 
coup2(2) = cplNv0Nv0VZR(iIN,gt1) 
coup2(3) = Conjg(cplNv0Nv0hhL(iIN,gt1)) 
coup2(4) = Conjg(cplNv0Nv0hhR(iIN,gt1))  
coup2(5) = cplNv0Nv0VZL(gt2,gt3) 
coup2(6) = cplNv0Nv0VZR(gt2,gt3) 
coup2(7) = Conjg(cplNv0Nv0hhL(gt2,gt3)) 
coup2(8) = Conjg(cplNv0Nv0hhR(gt2,gt3)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MNv0(gt2) 
mass(4) = MNv0(gt1) 
mass(3) = -MNv0(gt3) 
 
coup2(1) = cplNv0Nv0VZL(iIN,gt1) 
coup2(2) = cplNv0Nv0VZR(iIN,gt1) 
coup2(3) = Conjg(cplNv0Nv0hhL(iIN,gt2)) 
coup2(4) = Conjg(cplNv0Nv0hhR(iIN,gt2))  
coup2(5) = cplNv0Nv0VZL(gt2,gt3) 
coup2(6) = cplNv0Nv0VZR(gt2,gt3) 
coup2(7) = Conjg(cplNv0Nv0hhL(gt1,gt3)) 
coup2(8) = Conjg(cplNv0Nv0hhR(gt1,gt3)) 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MNv0(gt3) 
mass(4) = MNv0(gt1) 
mass(3) = -MNv0(gt2) 
 
coup2(1) = cplNv0Nv0VZL(iIN,gt1) 
coup2(2) = cplNv0Nv0VZR(iIN,gt1) 
coup2(3) = Conjg(cplNv0Nv0hhL(iIN,gt3)) 
coup2(4) = Conjg(cplNv0Nv0hhR(iIN,gt3))  
coup2(5) = cplNv0Nv0VZL(gt2,gt3) 
coup2(6) = cplNv0Nv0VZR(gt2,gt3) 
coup2(7) = Conjg(cplNv0Nv0hhL(gt2,gt1)) 
coup2(8) = Conjg(cplNv0Nv0hhR(gt2,gt1)) 
coupT = coup2(5) 
coup2(5) = coup2(6) 
coup2(6) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MNv0(gt3) 
mass(4) = MNv0(gt1) 
mass(3) = -MNv0(gt2) 
 
coup2(1) = cplNv0Nv0VZL(iIN,gt1) 
coup2(2) = cplNv0Nv0VZR(iIN,gt1) 
coup2(3) = Conjg(cplNv0Nv0hhL(iIN,gt3)) 
coup2(4) = Conjg(cplNv0Nv0hhR(iIN,gt3))  
coup2(5) = cplNv0Nv0VZL(gt2,gt3) 
coup2(6) = cplNv0Nv0VZR(gt2,gt3) 
coup2(7) = Conjg(cplNv0Nv0hhL(gt1,gt2)) 
coup2(8) = Conjg(cplNv0Nv0hhR(gt1,gt2)) 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MNv0(gt2) 
mass(4) = MNv0(gt1) 
mass(3) = -MNv0(gt3) 
 
coup2(1) = cplNv0Nv0VZL(iIN,gt1) 
coup2(2) = cplNv0Nv0VZR(iIN,gt1) 
coup2(3) = Conjg(cplNv0Nv0hhL(iIN,gt2)) 
coup2(4) = Conjg(cplNv0Nv0hhR(iIN,gt2))  
coup2(5) = cplNv0Nv0VZL(gt2,gt3) 
coup2(6) = cplNv0Nv0VZR(gt2,gt3) 
coup2(7) = Conjg(cplNv0Nv0hhL(gt1,gt3)) 
coup2(8) = Conjg(cplNv0Nv0hhR(gt1,gt3)) 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MNv0(gt1) 
mass(4) = MNv0(gt3) 
mass(3) = -MNv0(gt2) 
 
coup2(1) = cplNv0Nv0VZL(iIN,gt3) 
coup2(2) = cplNv0Nv0VZR(iIN,gt3) 
coup2(3) = Conjg(cplNv0Nv0hhL(iIN,gt1)) 
coup2(4) = Conjg(cplNv0Nv0hhR(iIN,gt1))  
coup2(5) = cplNv0Nv0VZL(gt1,gt2) 
coup2(6) = cplNv0Nv0VZR(gt1,gt2) 
coup2(7) = Conjg(cplNv0Nv0hhL(gt2,gt3)) 
coup2(8) = Conjg(cplNv0Nv0hhR(gt2,gt3)) 
coupT = coup2(5) 
coup2(5) = coup2(6) 
coup2(6) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MNv0(gt2) 
mass(4) = MNv0(gt3) 
mass(3) = -MNv0(gt1) 
 
coup2(1) = cplNv0Nv0VZL(iIN,gt3) 
coup2(2) = cplNv0Nv0VZR(iIN,gt3) 
coup2(3) = Conjg(cplNv0Nv0hhL(iIN,gt2)) 
coup2(4) = Conjg(cplNv0Nv0hhR(iIN,gt2))  
coup2(5) = cplNv0Nv0VZL(gt1,gt2) 
coup2(6) = cplNv0Nv0VZR(gt1,gt2) 
coup2(7) = Conjg(cplNv0Nv0hhL(gt1,gt3)) 
coup2(8) = Conjg(cplNv0Nv0hhR(gt1,gt3)) 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MNv0(gt1) 
mass(4) = MNv0(gt2) 
mass(3) = -MNv0(gt3) 
 
coup2(1) = cplNv0Nv0VZL(iIN,gt2) 
coup2(2) = cplNv0Nv0VZR(iIN,gt2) 
coup2(3) = Conjg(cplNv0Nv0hhL(iIN,gt1)) 
coup2(4) = Conjg(cplNv0Nv0hhR(iIN,gt1))  
coup2(5) = cplNv0Nv0VZL(gt1,gt3) 
coup2(6) = cplNv0Nv0VZR(gt1,gt3) 
coup2(7) = Conjg(cplNv0Nv0hhL(gt2,gt3)) 
coup2(8) = Conjg(cplNv0Nv0hhR(gt2,gt3)) 
coupT = coup2(5) 
coup2(5) = coup2(6) 
coup2(6) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MNv0(gt3) 
mass(4) = MNv0(gt2) 
mass(3) = -MNv0(gt1) 
 
coup2(1) = cplNv0Nv0VZL(iIN,gt2) 
coup2(2) = cplNv0Nv0VZR(iIN,gt2) 
coup2(3) = Conjg(cplNv0Nv0hhL(iIN,gt3)) 
coup2(4) = Conjg(cplNv0Nv0hhR(iIN,gt3))  
coup2(5) = cplNv0Nv0VZL(gt1,gt3) 
coup2(6) = cplNv0Nv0VZR(gt1,gt3) 
coup2(7) = Conjg(cplNv0Nv0hhL(gt1,gt2)) 
coup2(8) = Conjg(cplNv0Nv0hhR(gt1,gt2)) 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Nv0->Nv0 Nv0 Nv0 Propagator: VZ,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,hh'



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
      Do gt2=gt1, iIN-1
        Do gt3=gt2, iIN-1
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:4))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
  g = oo512pi3 / Abs(MNv0(iIN))**3*g
End Subroutine Nv0ToNv0Nv0Nv0 
 
 
Subroutine Nv0ToNv0FvFv(iIN,MNv0,MFv,MVZ,cplFvFvVZL,cplFvFvVZR,cplNv0Nv0VZL,          & 
& cplNv0Nv0VZR,IntegralVs,IntegralVVss,NVs,NVVss,gTVZ,deltaM,epsI,check,g,               & 
& WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MNv0(3),MFv(3),MVZ

Complex(dp),Intent(in) :: cplFvFvVZL(3,3),cplFvFvVZR(3,3),cplNv0Nv0VZL(3,3),cplNv0Nv0VZR(3,3)

Real(dp),Intent(inout) :: IntegralVs(25000,9),IntegralVVss(500000,12)

Real(dp),Intent(inout) :: gTVZ

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
mass(1) = MNv0(iIN) 
 
Isum = 1 
Allocate( gSum(3,3,3, Isum) ) 
Allocate( Contribution(3,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1, iIN-1
      Do gt2=1,3
        Do gt3=gt2,3
Isum = 0 
 
If(Abs(MNv0(iIN)).gt.(Abs(MFv(gt3))+Abs(MFv(gt2))+Abs(MNv0(gt1)))) Then 
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
 
mass(2) = MNv0(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup(2) = Conjg(cplNv0Nv0VZL(iIN,gt1)) 
coup(1) = Conjg(cplNv0Nv0VZR(iIN,gt1)) 
coup(4) = Conjg(cplFvFvVZL(gt2,gt3)) 
coup(3) = Conjg(cplFvFvVZR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MNv0(gt1) 
mass(3) = -MFv(gt3) 
mass(4) = MFv(gt2) 
 
coup2(1) = cplNv0Nv0VZL(iIN,gt1) 
coup2(2) = cplNv0Nv0VZR(iIN,gt1) 
coup2(4) = Conjg(cplNv0Nv0VZL(iIN,gt1)) 
coup2(3) = Conjg(cplNv0Nv0VZR(iIN,gt1))  
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
Write(*,*) "Nv0->Nv0 Fv Fv Propagator: VZ" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ'



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
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:1))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
  g = oo512pi3 / Abs(MNv0(iIN))**3*g
End Subroutine Nv0ToNv0FvFv 
 
 
End Module Nv03Decays_SimplifiedDMSDFDM 
 

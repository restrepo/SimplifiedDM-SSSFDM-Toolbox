! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.8.1 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 17:57 on 4.3.2016   
! ----------------------------------------------------------------------  
 
 
Module LowEnergy_SSDM 
Use Control 
Use Couplings_SSDM 
Use LoopCouplings_SSDM 
Use LoopFunctions 
Use LoopMasses_SSDM 
Use StandardModel 
Private::F1,F2,F3,F4,F3Gamma
!private variables
 

Contains


Subroutine Gminus2(Ifermion,MAh,MAh2,MFe,MFe2,Mhh,Mhh2,MHp,MHp2,cplcFeFeAhL,          & 
& cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFvFeHpL,cplcFvFeHpR,cplcFeFeVPL,               & 
& cplcFeFeVPR,cplcFeFvcHpL,cplcFeFvcHpR,cplHpcHpVP,a_mu)

Real(dp),Intent(in)  :: MAh,MAh2,MFe(3),MFe2(3),Mhh,Mhh2,MHp,MHp2

Complex(dp),Intent(in)  :: cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFeFehhL(3,3),cplcFeFehhR(3,3),cplcFvFeHpL(3,3), & 
& cplcFvFeHpR(3,3),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFvcHpL(3,3),cplcFeFvcHpR(3,3),& 
& cplHpcHpVP

Real(dp), Intent(out) :: a_mu 
Integer, Intent(in) :: Ifermion 
Real(dp) :: ratio, chargefactor 
Integer :: i1, i2, i3, gt1, gt2 
Complex(dp) :: coup1L,coup1R,coup2L,coup2R 
 
Iname = Iname + 1 
NameOfUnit(Iname) = "Gminus2" 
 
 
a_mu = 0._dp 
gt1 = Ifermion 
gt2 = Ifermion 
 
chargefactor = 1 
If ((Include_in_loopAh).and.(Include_in_loopFe).and.(Include_in_loopFe).and.IncludePenguins) Then 
Do i1= 2,1
  Do i2= 1,3
   i3 = i2
  If ((MAh2.gt.mz2).Or.(MFe2(i2).gt.mz2).Or.(MFe2(i3).gt.mz2)) Then
coup1L = cplcFeFeAhL(gt1,i2)
coup1R = cplcFeFeAhR(gt1,i2)
coup2L = cplcFeFeAhL(i3,gt2)
coup2R = cplcFeFeAhR(i3,gt2)
ratio = MAh2/MFe2(i2)
 If ((ratio.eq.ratio).and.(ratio.lt.1.0E+30_dp).and.(ratio.gt.1.0E-30_dp)) Then 
a_mu = a_mu - Real(coup1L*Conjg(coup1R),dp)*F3gamma(ratio)/MFe(i2)& 
      & + 2._dp*MFe(Ifermion)*(Abs(coup1L)**2 + Abs(coup1R)**2)*F2(ratio)/MFe2(i2) 
End if 
 
End if 
   End Do
  End Do
End if 


chargefactor = 1 
If ((Include_in_loopFv).and.(Include_in_loopHp).and.(Include_in_loopHp).and.IncludePenguins) Then 
Do i1= 1,3
  Do i2= 2,1
   i3 = i2
  If ((0._dp.gt.mz2).Or.(MHp2.gt.mz2).Or.(MHp2.gt.mz2)) Then
coup1L = cplcFeFvcHpL(gt1,i1)
coup1R = cplcFeFvcHpR(gt1,i1)
coup2L = cplcFvFeHpL(i1,gt2)
coup2R = cplcFvFeHpR(i1,gt2)
ratio = MHp2/0._dp
 If ((ratio.eq.ratio).and.(ratio.lt.1.0E+30_dp).and.(ratio.gt.1.0E-30_dp)) Then 
a_mu = a_mu - 2._dp*Real(coup1L*Conjg(coup1R),dp)*F4(ratio)/0.& 
      & - 2._dp*MFe(Ifermion)*(Abs(coup1L)**2 + Abs(coup1R)**2)*F1(ratio)/0._dp 
End if 
 
End if 
   End Do
  End Do
End if 


chargefactor = 1 
If ((Include_in_loophh).and.(Include_in_loopFe).and.(Include_in_loopFe).and.IncludePenguins) Then 
  Do i2= 1,3
   i3 = i2
  If ((Mhh2.gt.mz2).Or.(MFe2(i2).gt.mz2).Or.(MFe2(i3).gt.mz2)) Then
coup1L = cplcFeFehhL(gt1,i2)
coup1R = cplcFeFehhR(gt1,i2)
coup2L = cplcFeFehhL(i3,gt2)
coup2R = cplcFeFehhR(i3,gt2)
ratio = Mhh2/MFe2(i2)
 If ((ratio.eq.ratio).and.(ratio.lt.1.0E+30_dp).and.(ratio.gt.1.0E-30_dp)) Then 
a_mu = a_mu - Real(coup1L*Conjg(coup1R),dp)*F3gamma(ratio)/MFe(i2)& 
      & + 2._dp*MFe(Ifermion)*(Abs(coup1L)**2 + Abs(coup1R)**2)*F2(ratio)/MFe2(i2) 
End if 
 
End if 
  End Do
End if 


a_mu = a_mu*MFe(Ifermion)*oo16pi2 
Iname = Iname -1 
 
End Subroutine Gminus2 
 
 
Subroutine LeptonEDM(Ifermion,MAh,MAh2,MFe,MFe2,Mhh,Mhh2,MHp,MHp2,MVWp,               & 
& MVWp2,MVZ,MVZ2,cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFvFeHpL,            & 
& cplcFvFeHpR,cplcFeFeVPL,cplcFeFeVPR,cplcFvFeVWpL,cplcFvFeVWpR,cplcFeFeVZL,             & 
& cplcFeFeVZR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplHpcHpVP,          & 
& cplcVWpVPVWp,EDM)

Implicit None
Real(dp),Intent(in)  :: MAh,MAh2,MFe(3),MFe2(3),Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2

Complex(dp),Intent(in)  :: cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFeFehhL(3,3),cplcFeFehhR(3,3),cplcFvFeHpL(3,3), & 
& cplcFvFeHpR(3,3),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFvFeVWpL(3,3),cplcFvFeVWpR(3,3),& 
& cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFvcHpL(3,3),cplcFeFvcHpR(3,3),cplcFeFvcVWpL(3,3),& 
& cplcFeFvcVWpR(3,3),cplHpcHpVP,cplcVWpVPVWp

Real(dp), Intent(out) :: EDM 
Real(dp) :: ratio, chargefactor 
Integer, Intent(in) :: Ifermion 
Integer :: i1, i2, i3, gt1, gt2 
Complex(dp) :: coup1L,coup1R,coup2L,coup2R 
 
Iname = Iname + 1 
NameOfUnit(Iname) = "Gminus2" 
 
 
EDM = 0._dp 
gt1 = Ifermion 
gt2 = Ifermion 
 
chargefactor = 1 
If ((Include_in_loopAh).and.(Include_in_loopFe).and.(Include_in_loopFe).and.IncludePenguins) Then 
Do i1= 2,1
  Do i2= 1,3
   i3 = i2
  If ((MAh2.gt.mz2).Or.(MFe2(i2).gt.mz2).Or.(MFe2(i3).gt.mz2)) Then
coup1L = cplcFeFeAhL(gt1,i2)
coup1R = cplcFeFeAhR(gt1,i2)
coup2L = cplcFeFeAhL(i3,gt2)
coup2R = cplcFeFeAhR(i3,gt2)
ratio = MFe2(i2)/MAh2
 If ((ratio.eq.ratio).and.(ratio.lt.1.0E+30_dp).and.(ratio.gt.1.0E-30_dp)) Then 
EDM = EDM -(-1)* Aimag(coup1R*Conjg(coup1L))*FeynFunctionA(ratio)*& 
    &MFe(i2)/MAh2 
End if 
 
End if 
   End Do
  End Do
End if 


chargefactor = 1 
If ((Include_in_loopFv).and.(Include_in_loopHp).and.(Include_in_loopHp).and.IncludePenguins) Then 
Do i1= 1,3
  Do i2= 2,1
   i3 = i2
  If ((0._dp.gt.mz2).Or.(MHp2.gt.mz2).Or.(MHp2.gt.mz2)) Then
coup1L = cplcFeFvcHpL(gt1,i1)
coup1R = cplcFeFvcHpR(gt1,i1)
coup2L = cplcFvFeHpL(i1,gt2)
coup2R = cplcFvFeHpR(i1,gt2)
ratio = 0._dp/MHp2
 If ((ratio.eq.ratio).and.(ratio.lt.1.0E+30_dp).and.(ratio.gt.1.0E-30_dp)) Then 
EDM = EDM +(-1)* Aimag(coup1L*Conjg(coup1R))*FeynFunctionB(ratio)*& 
    &0./MHp2 
End if 
 
End if 
   End Do
  End Do
End if 


chargefactor = 1 
If ((Include_in_loopFv).and.(Include_in_loopVWp).and.(Include_in_loopVWp).and.IncludePenguins) Then 
Do i1= 1,3
  If ((0._dp.gt.mz2).Or.(MVWp2.gt.mz2).Or.(MVWp2.gt.mz2)) Then
coup1L = cplcFeFvcVWpL(gt1,i1)
coup1R = cplcFeFvcVWpR(gt1,i1)
coup2L = cplcFvFeVWpL(i1,gt2)
coup2R = cplcFvFeVWpR(i1,gt2)
End if 
   End Do
End if 


chargefactor = 1 
If ((Include_in_loophh).and.(Include_in_loopFe).and.(Include_in_loopFe).and.IncludePenguins) Then 
  Do i2= 1,3
   i3 = i2
  If ((Mhh2.gt.mz2).Or.(MFe2(i2).gt.mz2).Or.(MFe2(i3).gt.mz2)) Then
coup1L = cplcFeFehhL(gt1,i2)
coup1R = cplcFeFehhR(gt1,i2)
coup2L = cplcFeFehhL(i3,gt2)
coup2R = cplcFeFehhR(i3,gt2)
ratio = MFe2(i2)/Mhh2
 If ((ratio.eq.ratio).and.(ratio.lt.1.0E+30_dp).and.(ratio.gt.1.0E-30_dp)) Then 
EDM = EDM -(-1)* Aimag(coup1R*Conjg(coup1L))*FeynFunctionA(ratio)*& 
    &MFe(i2)/Mhh2 
End if 
 
End if 
  End Do
End if 


chargefactor = 1 
If ((Include_in_loopVP).and.(Include_in_loopFe).and.(Include_in_loopFe).and.IncludePenguins) Then 
  Do i2= 1,3
   i3 = i2
  If ((0._dp.gt.mz2).Or.(MFe2(i2).gt.mz2).Or.(MFe2(i3).gt.mz2)) Then
coup1L = cplcFeFeVPL(gt1,i2)
coup1R = cplcFeFeVPR(gt1,i2)
coup2L = cplcFeFeVPL(i3,gt2)
coup2R = cplcFeFeVPR(i3,gt2)
End if 
  End Do
End if 


chargefactor = 1 
If ((Include_in_loopVZ).and.(Include_in_loopFe).and.(Include_in_loopFe).and.IncludePenguins) Then 
  Do i2= 1,3
   i3 = i2
  If ((MVZ2.gt.mz2).Or.(MFe2(i2).gt.mz2).Or.(MFe2(i3).gt.mz2)) Then
coup1L = cplcFeFeVZL(gt1,i2)
coup1R = cplcFeFeVZR(gt1,i2)
coup2L = cplcFeFeVZL(i3,gt2)
coup2R = cplcFeFeVZR(i3,gt2)
End if 
  End Do
End if 


EDM = ecmfactor*EDM*oo16pi2 
Iname = Iname -1 
 
End Subroutine LeptonEDM 
 
 
Subroutine DeltaRho(MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,            & 
& MVWp,MVWp2,MVZ,MVZ2,cplAhAhcVWpVWp,cplAhAhVZVZ,cplAhhhVZ,cplAhHpcVWp,cplcFdFdVZL,      & 
& cplcFdFdVZR,cplcFdFucVWpL,cplcFdFucVWpR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFvcVWpL,         & 
& cplcFeFvcVWpR,cplcFuFuVZL,cplcFuFuVZR,cplcFvFvVZL,cplcFvFvVZR,cplcgAgWpcVWp,           & 
& cplcgWCgAcVWp,cplcgWCgWCVZ,cplcgWCgZcVWp,cplcgWpgWpVZ,cplcgZgWpcVWp,cplcVWpcVWpVWpVWp1,& 
& cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,cplcVWpVPVPVWp3, & 
& cplcVWpVPVWp,cplcVWpVWpVZ,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,             & 
& cplhhcVWpVWp,cplhhhhcVWpVWp,cplhhhhVZVZ,cplhhHpcVWp,cplhhVZVZ,cplHpcHpcVWpVWp,         & 
& cplHpcHpVZ,cplHpcHpVZVZ,cplHpcVWpVP,cplHpcVWpVZ,rho)

Implicit None
Real(dp),Intent(in)  :: MAh,MAh2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),Mhh,Mhh2,MHp,MHp2,              & 
& MVWp,MVWp2,MVZ,MVZ2

Complex(dp),Intent(in)  :: cplAhAhcVWpVWp,cplAhAhVZVZ,cplAhhhVZ,cplAhHpcVWp,cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),   & 
& cplcFdFucVWpL(3,3),cplcFdFucVWpR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),               & 
& cplcFeFvcVWpL(3,3),cplcFeFvcVWpR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),               & 
& cplcFvFvVZL(3,3),cplcFvFvVZR(3,3),cplcgAgWpcVWp,cplcgWCgAcVWp,cplcgWCgWCVZ,            & 
& cplcgWCgZcVWp,cplcgWpgWpVZ,cplcgZgWpcVWp,cplcVWpcVWpVWpVWp1,cplcVWpcVWpVWpVWp2,        & 
& cplcVWpcVWpVWpVWp3,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,cplcVWpVPVPVWp3,cplcVWpVPVWp,       & 
& cplcVWpVWpVZ,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,cplhhcVWpVWp,             & 
& cplhhhhcVWpVWp,cplhhhhVZVZ,cplhhHpcVWp,cplhhVZVZ,cplHpcHpcVWpVWp,cplHpcHpVZ,           & 
& cplHpcHpVZVZ,cplHpcVWpVP,cplHpcVWpVZ

Real(dp), Intent(out) :: rho 
Integer :: i1, i2, i3, kont 
Real(dp) ::  delta_rho, delta_rho0, Drho_top, mu_old 
Complex(dp) ::  dmW2, dmz2 
mu_old = SetRenormalizationScale(mZ2) 
 
Call Pi1LoopVZ(0._dp,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MVZ,MVZ2,           & 
& MHp,MHp2,MVWp,MVWp2,cplAhhhVZ,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,         & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFvFvVZL,cplcFvFvVZR,cplcgWpgWpVZ,cplcgWCgWCVZ,             & 
& cplhhVZVZ,cplHpcHpVZ,cplHpcVWpVZ,cplcVWpVWpVZ,cplAhAhVZVZ,cplhhhhVZVZ,cplHpcHpVZVZ,    & 
& cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,kont,dmZ2)

Call Pi1LoopVWp(0._dp,MHp,MHp2,MAh,MAh2,MFd,MFd2,MFu,MFu2,MFe,MFe2,Mhh,               & 
& Mhh2,MVWp,MVWp2,MVZ,MVZ2,cplAhHpcVWp,cplcFdFucVWpL,cplcFdFucVWpR,cplcFeFvcVWpL,        & 
& cplcFeFvcVWpR,cplcgWCgAcVWp,cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgWCgZcVWp,cplhhHpcVWp,     & 
& cplhhcVWpVWp,cplHpcVWpVP,cplHpcVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,cplAhAhcVWpVWp,         & 
& cplhhhhcVWpVWp,cplHpcHpcVWpVWp,cplcVWpVPVPVWp3,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,        & 
& cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3,cplcVWpcVWpVWpVWp1,cplcVWpVWpVZVZ1,              & 
& cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,kont,dmW2)

Drho_top = 3*G_F*mf_u(3)**2*oosqrt2*oo8pi2 
 
mu_old = SetRenormalizationScale(mu_old) 
 
! Tree Level 
delta_rho0 =  0 
 
! 1-Loop Level 
delta_rho =  dmZ2/mz2 - dMW2/mW2 - drho_top 
 Rho= delta_rho + delta_rho0
End subroutine DeltaRho 
 
 
Real(dp) Function C00g(m1, m2, m3)
Implicit None
Real(dp), Intent(in) :: m1, m2, m3
Real(dp) :: eps=1E-10_dp, large = 1E+5_dp

C00g = C00_3m(m1,m2,m3)

End Function C00g

Real(dp) Function C0g(m1in,m2in,m3in) 
Real(dp),Intent(in)::m1in,m2in,m3in 
Real(dp)::eps=1E-10_dp,large=0._dp,epsR=1E-03_dp 
Real(dp)::m1,m2,r 

!  C0

If (Abs(m1in-m2in)/Abs(m1in+m2in).lt.eps) Then! m1==m2 
 m1=m1in
 m2=m3in
   If (m1.gt.m2) Then 
     r=m2/m1 
     If ((1._dp-r).lt.epsR) Then  ! Taylor
        C0g=-1/(2._dp*m1) + (-1 + r)/(6._dp*m1) - (-1 + r)**2/(12._dp*m1)
     Elseif (Abs(r).lt.eps) Then 
        C0g=-(1/m1)
     Else 
        C0g=(-1 + r - r*Log(r))/(m1*(-1 + r)**2)
     End if 
   Else 
     r=m1/m2 
     If ((1._dp-r).lt.epsR) Then 
        C0g=-1/(2._dp*m2) + (-1 + r)/(3._dp*m2) - (-1 + r)**2/(4._dp*m2)
     Elseif (Abs(r).lt.eps) Then 
        C0g=1._dp
     Else 
        C0g=(1 - r + Log(r))/(m2*(-1 + r)**2)
    End if 
   End if 

Else if (Abs(m2in-m3in)/Abs(m2in+m3in).lt.eps) Then! m2==m3 
 m1=m1in 
 m2=m3in 
   If (m1.gt.m2) Then 
     r=m2/m1 
     If ((1._dp-r).lt.epsR) Then 
        C0g=-1/(2._dp*m1) + (-1 + r)/(3._dp*m1) - (-1 + r)**2/(4._dp*m1)
     Elseif (Abs(r).lt.eps) Then 
        C0g=1._dp
     Else 
        C0g=(1 - r + Log(r))/(m1*(-1 + r)**2)
     End if 
   Else 
     r=m1/m2 
     If ((1._dp-r).lt.epsR) Then 
        C0g=-1/(2._dp*m2) + (-1 + r)/(6._dp*m2) - (-1 + r)**2/(12._dp*m2)
     Elseif (Abs(r).lt.eps) Then 
        C0g=-(1/m2)
     Else 
        C0g=(-1 + r - r*Log(r))/(m2*(-1 + r)**2)
     End if 
  End if 

Else!! Different masses are not possible! 
   C0g =0._dp 
End if 
 
End Function C0g 


Real(dp) Function C1g(m1in,m2in,m3in) 
Real(dp),Intent(in)::m1in,m2in,m3in 
Real(dp)::eps=1E-10_dp,large=0._dp,epsR=1E-03_dp 
Real(dp)::m1,m2,r 

!  C1

If (Abs(m1in-m2in)/Abs(m1in+m2in).lt.eps) Then! m1==m2 
 m1=m1in
 m2=m3in
   If (m1.gt.m2) Then 
     r=m2/m1 
     If ((1._dp-r).lt.epsR) Then  ! Taylor
        C1g=1/(6._dp*m1) - (-1 + r)/(24._dp*m1) + (-1 + r)**2/(60._dp*m1)
     Elseif (Abs(r).lt.eps) Then 
        C1g=1/(4._dp*m1)
     Else 
        C1g=(-1 + (4 - 3*r)*r + 2*r**2*Log(r))/(4._dp*m1*(-1 + r)**3)
     End if 
   Else 
     r=m1/m2 
     If ((1._dp-r).lt.epsR) Then 
        C1g=1/(6._dp*m2) - (-1 + r)/(8._dp*m2) + (-1 + r)**2/(10._dp*m2)
     Elseif (Abs(r).lt.eps) Then 
        C1g=large
     Else 
        C1g=(3 - 4*r + r**2 + 2*Log(r))/(4._dp*m2*(-1 + r)**3)
    End if 
   End if 

Else if (Abs(m2in-m3in)/Abs(m2in+m3in).lt.eps) Then! m2==m3 
 m1=m1in 
 m2=m3in 
   If (m1.gt.m2) Then 
     r=m2/m1 
     If ((1._dp-r).lt.epsR) Then 
        C1g=1/(6._dp*m1) - (-1 + r)/(8._dp*m1) + (-1 + r)**2/(10._dp*m1)
     Elseif (Abs(r).lt.eps) Then 
        C1g=large
     Else 
        C1g=(3 - 4*r + r**2 + 2*Log(r))/(4._dp*m1*(-1 + r)**3)
     End if 
   Else 
     r=m1/m2 
     If ((1._dp-r).lt.epsR) Then 
        C1g=1/(6._dp*m2) - (-1 + r)/(24._dp*m2) + (-1 + r)**2/(60._dp*m2)
     Elseif (Abs(r).lt.eps) Then 
        C1g=1/(4._dp*m2)
     Else 
        C1g=(-1 + (4 - 3*r)*r + 2*r**2*Log(r))/(4._dp*m2*(-1 + r)**3)
     End if 
  End if 

Else!! Different masses are not possible! 
   C1g =0._dp 
End if 
 
End Function C1g 


Real(dp) Function C2g(m1in,m2in,m3in) 
Real(dp),Intent(in)::m1in,m2in,m3in 
Real(dp)::eps=1E-10_dp,large=0._dp,epsR=1E-03_dp 
Real(dp)::m1,m2,r 

!  C2

If (Abs(m1in-m2in)/Abs(m1in+m2in).lt.eps) Then! m1==m2 
 m1=m1in
 m2=m3in
   If (m1.gt.m2) Then 
     r=m2/m1 
     If ((1._dp-r).lt.epsR) Then  ! Taylor
        C2g=1/(6._dp*m1) - (-1 + r)/(12._dp*m1) + (-1 + r)**2/(20._dp*m1)
     Elseif (Abs(r).lt.eps) Then 
        C2g=1/(2._dp*m1)
     Else 
        C2g=(-1 + r**2 - 2*r*Log(r))/(2._dp*m1*(-1 + r)**3)
     End if 
   Else 
     r=m1/m2 
     If ((1._dp-r).lt.epsR) Then 
        C2g=1/(6._dp*m2) - (-1 + r)/(12._dp*m2) + (-1 + r)**2/(20._dp*m2)
     Elseif (Abs(r).lt.eps) Then 
        C2g=1/(2._dp*m2)
     Else 
        C2g=(-1 + r**2 - 2*r*Log(r))/(2._dp*m2*(-1 + r)**3)
    End if 
   End if 

Else if (Abs(m2in-m3in)/Abs(m2in+m3in).lt.eps) Then! m2==m3 
 m1=m1in 
 m2=m3in 
   If (m1.gt.m2) Then 
     r=m2/m1 
     If ((1._dp-r).lt.epsR) Then 
        C2g=1/(6._dp*m1) - (-1 + r)/(8._dp*m1) + (-1 + r)**2/(10._dp*m1)
     Elseif (Abs(r).lt.eps) Then 
        C2g=large
     Else 
        C2g=(3 - 4*r + r**2 + 2*Log(r))/(4._dp*m1*(-1 + r)**3)
     End if 
   Else 
     r=m1/m2 
     If ((1._dp-r).lt.epsR) Then 
        C2g=1/(6._dp*m2) - (-1 + r)/(24._dp*m2) + (-1 + r)**2/(60._dp*m2)
     Elseif (Abs(r).lt.eps) Then 
        C2g=1/(4._dp*m2)
     Else 
        C2g=(-1 + (4 - 3*r)*r + 2*r**2*Log(r))/(4._dp*m2*(-1 + r)**3)
     End if 
  End if 

Else!! Different masses are not possible! 
   C2g =0._dp 
End if 
 
End Function C2g 


Real(dp) Function C11g(m1in,m2in,m3in) 
Real(dp),Intent(in)::m1in,m2in,m3in 
Real(dp)::eps=1E-10_dp,large=0._dp,epsR=1E-03_dp 
Real(dp)::m1,m2,r 

!  C11

If (Abs(m1in-m2in)/Abs(m1in+m2in).lt.eps) Then! m1==m2 
 m1=m1in
 m2=m3in
   If (m1.gt.m2) Then 
     r=m2/m1 
     If ((1._dp-r).lt.epsR) Then  ! Taylor
        C11g=-1/(12._dp*m1) + (-1 + r)/(60._dp*m1) - (-1 + r)**2/(180._dp*m1)
     Elseif (Abs(r).lt.eps) Then 
        C11g=-1/(9._dp*m1)
     Else 
        C11g=((-1 + r)*(2 + r*(-7 + 11*r)) - 6*r**3*Log(r))/(18._dp*m1*(-1 + r)**4)
     End if 
   Else 
     r=m1/m2 
     If ((1._dp-r).lt.epsR) Then 
        C11g=-1/(12._dp*m2) + (-1 + r)/(15._dp*m2) - (-1 + r)**2/(18._dp*m2)
     Elseif (Abs(r).lt.eps) Then 
        C11g=large
     Else 
        C11g=(-((-1 + r)*(11 + r*(-7 + 2*r))) + 6*Log(r))/(18._dp*m2*(-1 + r)**4)
    End if 
   End if 

Else if (Abs(m2in-m3in)/Abs(m2in+m3in).lt.eps) Then! m2==m3 
 m1=m1in 
 m2=m3in 
   If (m1.gt.m2) Then 
     r=m2/m1 
     If ((1._dp-r).lt.epsR) Then 
        C11g=-1/(12._dp*m1) + (-1 + r)/(15._dp*m1) - (-1 + r)**2/(18._dp*m1)
     Elseif (Abs(r).lt.eps) Then 
        C11g=large
     Else 
        C11g=(-((-1 + r)*(11 + r*(-7 + 2*r))) + 6*Log(r))/(18._dp*m1*(-1 + r)**4)
     End if 
   Else 
     r=m1/m2 
     If ((1._dp-r).lt.epsR) Then 
        C11g=-1/(12._dp*m2) + (-1 + r)/(60._dp*m2) - (-1 + r)**2/(180._dp*m2)
     Elseif (Abs(r).lt.eps) Then 
        C11g=-1/(9._dp*m2)
     Else 
        C11g=((-1 + r)*(2 + r*(-7 + 11*r)) - 6*r**3*Log(r))/(18._dp*m2*(-1 + r)**4)
     End if 
  End if 

Else!! Different masses are not possible! 
   C11g =0._dp 
End if 
 
End Function C11g 


Real(dp) Function C12g(m1in,m2in,m3in) 
Real(dp),Intent(in)::m1in,m2in,m3in 
Real(dp)::eps=1E-10_dp,large=0._dp,epsR=1E-03_dp 
Real(dp)::m1,m2,r 

!  C12

If (Abs(m1in-m2in)/Abs(m1in+m2in).lt.eps) Then! m1==m2 
 m1=m1in
 m2=m3in
   If (m1.gt.m2) Then 
     r=m2/m1 
     If ((1._dp-r).lt.epsR) Then  ! Taylor
        C12g=-1/(24._dp*m1) + (-1 + r)/(60._dp*m1) - (-1 + r)**2/(120._dp*m1)
     Elseif (Abs(r).lt.eps) Then 
        C12g=-1/(12._dp*m1)
     Else 
        C12g=(-((-1 + r)*(-1 + r*(5 + 2*r))) + 6*r**2*Log(r))/(12._dp*m1*(-1 + r)**4)
     End if 
   Else 
     r=m1/m2 
     If ((1._dp-r).lt.epsR) Then 
        C12g=-1/(24._dp*m2) + (-1 + r)/(40._dp*m2) - (-1 + r)**2/(60._dp*m2)
     Elseif (Abs(r).lt.eps) Then 
        C12g=-1/(6._dp*m2)
     Else 
        C12g=-(2 + r*(3 + (-6 + r)*r) + 6*r*Log(r))/(12._dp*m2*(-1 + r)**4)
    End if 
   End if 

Else if (Abs(m2in-m3in)/Abs(m2in+m3in).lt.eps) Then! m2==m3 
 m1=m1in 
 m2=m3in 
   If (m1.gt.m2) Then 
     r=m2/m1 
     If ((1._dp-r).lt.epsR) Then 
        C12g=-1/(24._dp*m1) + (-1 + r)/(30._dp*m1) - (-1 + r)**2/(36._dp*m1)
     Elseif (Abs(r).lt.eps) Then 
        C12g=large
     Else 
        C12g=(-((-1 + r)*(11 + r*(-7 + 2*r))) + 6*Log(r))/(36._dp*m1*(-1 + r)**4)
     End if 
   Else 
     r=m1/m2 
     If ((1._dp-r).lt.epsR) Then 
        C12g=-1/(24._dp*m2) + (-1 + r)/(120._dp*m2) - (-1 + r)**2/(360._dp*m2)
     Elseif (Abs(r).lt.eps) Then 
        C12g=-1/(18._dp*m2)
     Else 
        C12g=((-1 + r)*(2 + r*(-7 + 11*r)) - 6*r**3*Log(r))/(36._dp*m2*(-1 + r)**4)
     End if 
  End if 

Else!! Different masses are not possible! 
   C12g =0._dp 
End if 
 
End Function C12g 


Real(dp) Function C22g(m1in,m2in,m3in) 
Real(dp),Intent(in)::m1in,m2in,m3in 
Real(dp)::eps=1E-10_dp,large=0._dp,epsR=1E-03_dp 
Real(dp)::m1,m2,r 

!  C22

If (Abs(m1in-m2in)/Abs(m1in+m2in).lt.eps) Then! m1==m2 
 m1=m1in
 m2=m3in
   If (m1.gt.m2) Then 
     r=m2/m1 
     If ((1._dp-r).lt.epsR) Then  ! Taylor
        C22g=-1/(12._dp*m1) + (-1 + r)/(20._dp*m1) - (-1 + r)**2/(30._dp*m1)
     Elseif (Abs(r).lt.eps) Then 
        C22g=-1/(3._dp*m1)
     Else 
        C22g=-(2 + r*(3 + (-6 + r)*r) + 6*r*Log(r))/(6._dp*m1*(-1 + r)**4)
     End if 
   Else 
     r=m1/m2 
     If ((1._dp-r).lt.epsR) Then 
        C22g=-1/(12._dp*m2) + (-1 + r)/(30._dp*m2) - (-1 + r)**2/(60._dp*m2)
     Elseif (Abs(r).lt.eps) Then 
        C22g=-1/(6._dp*m2)
     Else 
        C22g=(-((-1 + r)*(-1 + r*(5 + 2*r))) + 6*r**2*Log(r))/(6._dp*m2*(-1 + r)**4)
    End if 
   End if 

Else if (Abs(m2in-m3in)/Abs(m2in+m3in).lt.eps) Then! m2==m3 
 m1=m1in 
 m2=m3in 
   If (m1.gt.m2) Then 
     r=m2/m1 
     If ((1._dp-r).lt.epsR) Then 
        C22g=-1/(12._dp*m1) + (-1 + r)/(15._dp*m1) - (-1 + r)**2/(18._dp*m1)
     Elseif (Abs(r).lt.eps) Then 
        C22g=large
     Else 
        C22g=(-((-1 + r)*(11 + r*(-7 + 2*r))) + 6*Log(r))/(18._dp*m1*(-1 + r)**4)
     End if 
   Else 
     r=m1/m2 
     If ((1._dp-r).lt.epsR) Then 
        C22g=-1/(12._dp*m2) + (-1 + r)/(60._dp*m2) - (-1 + r)**2/(180._dp*m2)
     Elseif (Abs(r).lt.eps) Then 
        C22g=-1/(9._dp*m2)
     Else 
        C22g=((-1 + r)*(2 + r*(-7 + 11*r)) - 6*r**3*Log(r))/(18._dp*m2*(-1 + r)**4)
     End if 
  End if 

Else!! Different masses are not possible! 
   C22g =0._dp 
End if 
 
End Function C22g 


Real(dp) Function C2C12C22(m1in,m2in,m3in) 
Real(dp),Intent(in)::m1in,m2in,m3in 
Real(dp)::eps=1E-10_dp,large=0._dp,epsR=1E-03_dp 
Real(dp)::m1,m2,r 

!  C12 + C2 + C22

If (Abs(m1in-m2in)/Abs(m1in+m2in).lt.eps) Then! m1==m2 
 m1=m1in
 m2=m3in
   If (m1.gt.m2) Then 
     r=m2/m1 
     If ((1._dp-r).lt.epsR) Then  ! Taylor
        C2C12C22=1/(24._dp*m1) - (-1 + r)/(60._dp*m1) + (-1 + r)**2/(120._dp*m1)
     Elseif (Abs(r).lt.eps) Then 
        C2C12C22=1/(12._dp*m1)
     Else 
        C2C12C22=((-1 + r)*(-1 + r*(5 + 2*r)) - 6*r**2*Log(r))/(12._dp*m1*(-1 + r)**4)
     End if 
   Else 
     r=m1/m2 
     If ((1._dp-r).lt.epsR) Then 
        C2C12C22=1/(24._dp*m2) - (-1 + r)/(40._dp*m2) + (-1 + r)**2/(60._dp*m2)
     Elseif (Abs(r).lt.eps) Then 
        C2C12C22=1/(6._dp*m2)
     Else 
        C2C12C22=(2 + r*(3 + (-6 + r)*r) + 6*r*Log(r))/(12._dp*m2*(-1 + r)**4)
    End if 
   End if 

Else if (Abs(m2in-m3in)/Abs(m2in+m3in).lt.eps) Then! m2==m3 
 m1=m1in 
 m2=m3in 
   If (m1.gt.m2) Then 
     r=m2/m1 
     If ((1._dp-r).lt.epsR) Then 
        C2C12C22=1/(24._dp*m1) - (-1 + r)/(40._dp*m1) + (-1 + r)**2/(60._dp*m1)
     Elseif (Abs(r).lt.eps) Then 
        C2C12C22=1/(6._dp*m1)
     Else 
        C2C12C22=(2 + r*(3 + (-6 + r)*r) + 6*r*Log(r))/(12._dp*m1*(-1 + r)**4)
     End if 
   Else 
     r=m1/m2 
     If ((1._dp-r).lt.epsR) Then 
        C2C12C22=1/(24._dp*m2) - (-1 + r)/(60._dp*m2) + (-1 + r)**2/(120._dp*m2)
     Elseif (Abs(r).lt.eps) Then 
        C2C12C22=1/(12._dp*m2)
     Else 
        C2C12C22=((-1 + r)*(-1 + r*(5 + 2*r)) - 6*r**2*Log(r))/(12._dp*m2*(-1 + r)**4)
     End if 
  End if 

Else!! Different masses are not possible! 
   C2C12C22 =0._dp 
End if 
 
End Function C2C12C22 


Real(dp) Function C1C12C11(m1in,m2in,m3in) 
Real(dp),Intent(in)::m1in,m2in,m3in 
Real(dp)::eps=1E-10_dp,large=0._dp,epsR=1E-03_dp 
Real(dp)::m1,m2,r 

!  C1 + C11 + C12

If (Abs(m1in-m2in)/Abs(m1in+m2in).lt.eps) Then! m1==m2 
 m1=m1in
 m2=m3in
   If (m1.gt.m2) Then 
     r=m2/m1 
     If ((1._dp-r).lt.epsR) Then  ! Taylor
        C1C12C11=1/(24._dp*m1) - (-1 + r)/(120._dp*m1) + (-1 + r)**2/(360._dp*m1)
     Elseif (Abs(r).lt.eps) Then 
        C1C12C11=1/(18._dp*m1)
     Else 
        C1C12C11=(-((-1 + r)*(2 + r*(-7 + 11*r))) + 6*r**3*Log(r))/(36._dp*m1*(-1 + r)**4)
     End if 
   Else 
     r=m1/m2 
     If ((1._dp-r).lt.epsR) Then 
        C1C12C11=1/(24._dp*m2) - (-1 + r)/(30._dp*m2) + (-1 + r)**2/(36._dp*m2)
     Elseif (Abs(r).lt.eps) Then 
        C1C12C11=large
     Else 
        C1C12C11=((-1 + r)*(11 + r*(-7 + 2*r)) - 6*Log(r))/(36._dp*m2*(-1 + r)**4)
    End if 
   End if 

Else if (Abs(m2in-m3in)/Abs(m2in+m3in).lt.eps) Then! m2==m3 
 m1=m1in 
 m2=m3in 
   If (m1.gt.m2) Then 
     r=m2/m1 
     If ((1._dp-r).lt.epsR) Then 
        C1C12C11=1/(24._dp*m1) - (-1 + r)/(40._dp*m1) + (-1 + r)**2/(60._dp*m1)
     Elseif (Abs(r).lt.eps) Then 
        C1C12C11=1/(6._dp*m1)
     Else 
        C1C12C11=(2 + r*(3 + (-6 + r)*r) + 6*r*Log(r))/(12._dp*m1*(-1 + r)**4)
     End if 
   Else 
     r=m1/m2 
     If ((1._dp-r).lt.epsR) Then 
        C1C12C11=1/(24._dp*m2) - (-1 + r)/(60._dp*m2) + (-1 + r)**2/(120._dp*m2)
     Elseif (Abs(r).lt.eps) Then 
        C1C12C11=1/(12._dp*m2)
     Else 
        C1C12C11=((-1 + r)*(-1 + r*(5 + 2*r)) - 6*r**2*Log(r))/(12._dp*m2*(-1 + r)**4)
     End if 
  End if 

Else!! Different masses are not possible! 
   C1C12C11 =0._dp 
End if 
 
End Function C1C12C11 


Real(dp) Function C0C1C2(m1in,m2in,m3in) 
Real(dp),Intent(in)::m1in,m2in,m3in 
Real(dp)::eps=1E-10_dp,large=0._dp,epsR=1E-03_dp 
Real(dp)::m1,m2,r 

!  C0 + C1 + C2

If (Abs(m1in-m2in)/Abs(m1in+m2in).lt.eps) Then! m1==m2 
 m1=m1in
 m2=m3in
   If (m1.gt.m2) Then 
     r=m2/m1 
     If ((1._dp-r).lt.epsR) Then  ! Taylor
        C0C1C2=-1/(6._dp*m1) + (-1 + r)/(24._dp*m1) - (-1 + r)**2/(60._dp*m1)
     Elseif (Abs(r).lt.eps) Then 
        C0C1C2=-1/(4._dp*m1)
     Else 
        C0C1C2=(1 - 4*r + 3*r**2 - 2*r**2*Log(r))/(4._dp*m1*(-1 + r)**3)
     End if 
   Else 
     r=m1/m2 
     If ((1._dp-r).lt.epsR) Then 
        C0C1C2=-1/(6._dp*m2) + (-1 + r)/(8._dp*m2) - (-1 + r)**2/(10._dp*m2)
     Elseif (Abs(r).lt.eps) Then 
        C0C1C2=large
     Else 
        C0C1C2=-(3 - 4*r + r**2 + 2*Log(r))/(4._dp*m2*(-1 + r)**3)
    End if 
   End if 

Else if (Abs(m2in-m3in)/Abs(m2in+m3in).lt.eps) Then! m2==m3 
 m1=m1in 
 m2=m3in 
   If (m1.gt.m2) Then 
     r=m2/m1 
     If ((1._dp-r).lt.epsR) Then 
        C0C1C2=-1/(6._dp*m1) + (-1 + r)/(12._dp*m1) - (-1 + r)**2/(20._dp*m1)
     Elseif (Abs(r).lt.eps) Then 
        C0C1C2=-1/(2._dp*m1)
     Else 
        C0C1C2=(1 - r**2 + 2*r*Log(r))/(2._dp*m1*(-1 + r)**3)
     End if 
   Else 
     r=m1/m2 
     If ((1._dp-r).lt.epsR) Then 
        C0C1C2=-1/(6._dp*m2) + (-1 + r)/(12._dp*m2) - (-1 + r)**2/(20._dp*m2)
     Elseif (Abs(r).lt.eps) Then 
        C0C1C2=-1/(2._dp*m2)
     Else 
        C0C1C2=(1 - r**2 + 2*r*Log(r))/(2._dp*m2*(-1 + r)**3)
     End if 
  End if 

Else!! Different masses are not possible! 
   C0C1C2 =0._dp 
End if 
 
End Function C0C1C2 


Real(dp) Function C12C11C2(m1in,m2in,m3in) 
Real(dp),Intent(in)::m1in,m2in,m3in 
Real(dp)::eps=1E-10_dp,large=0._dp,epsR=1E-03_dp 
Real(dp)::m1,m2,r 

!  2 C11 + 2 C12 - C2

If (Abs(m1in-m2in)/Abs(m1in+m2in).lt.eps) Then! m1==m2 
 m1=m1in
 m2=m3in
   If (m1.gt.m2) Then 
     r=m2/m1 
     If ((1._dp-r).lt.epsR) Then  ! Taylor
        C12C11C2=-5/(12._dp*m1) + (3*(-1 + r))/(20._dp*m1) - (7*(-1 + r)**2)/(90._dp*m1)
     Elseif (Abs(r).lt.eps) Then 
        C12C11C2=-8/(9._dp*m1)
     Else 
        C12C11C2=((-1 + r)*(16 + r*(-29 + 7*r)) - 6*r*(3 + 2*(-3 + r)*r)*Log(r))/(18._dp*m1*(-1 + r)**4)
     End if 
   Else 
     r=m1/m2 
     If ((1._dp-r).lt.epsR) Then 
        C12C11C2=-5/(12._dp*m2) + (4*(-1 + r))/(15._dp*m2) - (7*(-1 + r)**2)/(36._dp*m2)
     Elseif (Abs(r).lt.eps) Then 
        C12C11C2=large
     Else 
        C12C11C2=(-((-1 + r)*(7 + r*(-29 + 16*r))) + 6*(2 + 3*(-2 + r)*r)*Log(r))/(18._dp*m2*(-1 + r)**4)
    End if 
   End if 

Else if (Abs(m2in-m3in)/Abs(m2in+m3in).lt.eps) Then! m2==m3 
 m1=m1in 
 m2=m3in 
   If (m1.gt.m2) Then 
     r=m2/m1 
     If ((1._dp-r).lt.epsR) Then 
        C12C11C2=-5/(12._dp*m1) + (13*(-1 + r))/(40._dp*m1) - (4*(-1 + r)**2)/(15._dp*m1)
     Elseif (Abs(r).lt.eps) Then 
        C12C11C2=large
     Else 
        C12C11C2=-((-1 + r)*(31 + r*(-26 + 7*r)) + 6*(-3 + r)*Log(r))/(12._dp*m1*(-1 + r)**4)
     End if 
   Else 
     r=m1/m2 
     If ((1._dp-r).lt.epsR) Then 
        C12C11C2=-5/(12._dp*m2) + (11*(-1 + r))/(120._dp*m2) - (-1 + r)**2/(30._dp*m2)
     Elseif (Abs(r).lt.eps) Then 
        C12C11C2=-7/(12._dp*m2)
     Else 
        C12C11C2=((-1 + r)*(7 + r*(-26 + 31*r)) + 6*(1 - 3*r)*r**2*Log(r))/(12._dp*m2*(-1 + r)**4)
     End if 
  End if 

Else!! Different masses are not possible! 
   C12C11C2 =0._dp 
End if 
 
End Function C12C11C2 


Real(dp) Function C12C22C1(m1in,m2in,m3in) 
Real(dp),Intent(in)::m1in,m2in,m3in 
Real(dp)::eps=1E-10_dp,large=0._dp,epsR=1E-03_dp 
Real(dp)::m1,m2,r 

!  -C1 + 2 C12 + 2 C22

If (Abs(m1in-m2in)/Abs(m1in+m2in).lt.eps) Then! m1==m2 
 m1=m1in
 m2=m3in
   If (m1.gt.m2) Then 
     r=m2/m1 
     If ((1._dp-r).lt.epsR) Then  ! Taylor
        C12C22C1=-5/(12._dp*m1) + (7*(-1 + r))/(40._dp*m1) - (-1 + r)**2/(10._dp*m1)
     Elseif (Abs(r).lt.eps) Then 
        C12C22C1=-13/(12._dp*m1)
     Else 
        C12C22C1=((-1 + r)*(13 + (-2 + r)*r) - 6*r*(4 + (-3 + r)*r)*Log(r))/(12._dp*m1*(-1 + r)**4)
     End if 
   Else 
     r=m1/m2 
     If ((1._dp-r).lt.epsR) Then 
        C12C22C1=-5/(12._dp*m2) + (29*(-1 + r))/(120._dp*m2) - (-1 + r)**2/(6._dp*m2)
     Elseif (Abs(r).lt.eps) Then 
        C12C22C1=large
     Else 
        C12C22C1=(-((-1 + r)*(1 + r*(-2 + 13*r))) + 6*(1 + r*(-3 + 4*r))*Log(r))/(12._dp*m2*(-1 + r)**4)
    End if 
   End if 

Else if (Abs(m2in-m3in)/Abs(m2in+m3in).lt.eps) Then! m2==m3 
 m1=m1in 
 m2=m3in 
   If (m1.gt.m2) Then 
     r=m2/m1 
     If ((1._dp-r).lt.epsR) Then 
        C12C22C1=-5/(12._dp*m1) + (13*(-1 + r))/(40._dp*m1) - (4*(-1 + r)**2)/(15._dp*m1)
     Elseif (Abs(r).lt.eps) Then 
        C12C22C1=large
     Else 
        C12C22C1=-((-1 + r)*(31 + r*(-26 + 7*r)) + 6*(-3 + r)*Log(r))/(12._dp*m1*(-1 + r)**4)
     End if 
   Else 
     r=m1/m2 
     If ((1._dp-r).lt.epsR) Then 
        C12C22C1=-5/(12._dp*m2) + (11*(-1 + r))/(120._dp*m2) - (-1 + r)**2/(30._dp*m2)
     Elseif (Abs(r).lt.eps) Then 
        C12C22C1=-7/(12._dp*m2)
     Else 
        C12C22C1=((-1 + r)*(7 + r*(-26 + 31*r)) + 6*(1 - 3*r)*r**2*Log(r))/(12._dp*m2*(-1 + r)**4)
     End if 
  End if 

Else!! Different masses are not possible! 
   C12C22C1 =0._dp 
End if 
 
End Function C12C22C1 


Real(dp) Function C12C22(m1in,m2in,m3in) 
Real(dp),Intent(in)::m1in,m2in,m3in 
Real(dp)::eps=1E-10_dp,large=0._dp,epsR=1E-03_dp 
Real(dp)::m1,m2,r 

!  C12 + C22

If (Abs(m1in-m2in)/Abs(m1in+m2in).lt.eps) Then! m1==m2 
 m1=m1in
 m2=m3in
   If (m1.gt.m2) Then 
     r=m2/m1 
     If ((1._dp-r).lt.epsR) Then  ! Taylor
        C12C22=-1/(8._dp*m1) + (-1 + r)/(15._dp*m1) - (-1 + r)**2/(24._dp*m1)
     Elseif (Abs(r).lt.eps) Then 
        C12C22=-5/(12._dp*m1)
     Else 
        C12C22=(-5 + (9 - 4*r)*r**2 + 6*(-2 + r)*r*Log(r))/(12._dp*m1*(-1 + r)**4)
     End if 
   Else 
     r=m1/m2 
     If ((1._dp-r).lt.epsR) Then 
        C12C22=-1/(8._dp*m2) + (7*(-1 + r))/(120._dp*m2) - (-1 + r)**2/(30._dp*m2)
     Elseif (Abs(r).lt.eps) Then 
        C12C22=-1/(3._dp*m2)
     Else 
        C12C22=(-4 + 9*r - 5*r**3 + 6*r*(-1 + 2*r)*Log(r))/(12._dp*m2*(-1 + r)**4)
    End if 
   End if 

Else if (Abs(m2in-m3in)/Abs(m2in+m3in).lt.eps) Then! m2==m3 
 m1=m1in 
 m2=m3in 
   If (m1.gt.m2) Then 
     r=m2/m1 
     If ((1._dp-r).lt.epsR) Then 
        C12C22=-1/(8._dp*m1) + (-1 + r)/(10._dp*m1) - (-1 + r)**2/(12._dp*m1)
     Elseif (Abs(r).lt.eps) Then 
        C12C22=large
     Else 
        C12C22=(-((-1 + r)*(11 + r*(-7 + 2*r))) + 6*Log(r))/(12._dp*m1*(-1 + r)**4)
     End if 
   Else 
     r=m1/m2 
     If ((1._dp-r).lt.epsR) Then 
        C12C22=-1/(8._dp*m2) + (-1 + r)/(40._dp*m2) - (-1 + r)**2/(120._dp*m2)
     Elseif (Abs(r).lt.eps) Then 
        C12C22=-1/(6._dp*m2)
     Else 
        C12C22=((-1 + r)*(2 + r*(-7 + 11*r)) - 6*r**3*Log(r))/(12._dp*m2*(-1 + r)**4)
     End if 
  End if 

Else!! Different masses are not possible! 
   C12C22 =0._dp 
End if 
 
End Function C12C22 


Real(dp) Function C2C12(m1in,m2in,m3in) 
Real(dp),Intent(in)::m1in,m2in,m3in 
Real(dp)::eps=1E-10_dp,large=0._dp,epsR=1E-03_dp 
Real(dp)::m1,m2,r 

!  C12 + C2

If (Abs(m1in-m2in)/Abs(m1in+m2in).lt.eps) Then! m1==m2 
 m1=m1in
 m2=m3in
   If (m1.gt.m2) Then 
     r=m2/m1 
     If ((1._dp-r).lt.epsR) Then  ! Taylor
        C2C12=1/(8._dp*m1) - (-1 + r)/(15._dp*m1) + (-1 + r)**2/(24._dp*m1)
     Elseif (Abs(r).lt.eps) Then 
        C2C12=5/(12._dp*m1)
     Else 
        C2C12=(5 + r**2*(-9 + 4*r) - 6*(-2 + r)*r*Log(r))/(12._dp*m1*(-1 + r)**4)
     End if 
   Else 
     r=m1/m2 
     If ((1._dp-r).lt.epsR) Then 
        C2C12=1/(8._dp*m2) - (7*(-1 + r))/(120._dp*m2) + (-1 + r)**2/(30._dp*m2)
     Elseif (Abs(r).lt.eps) Then 
        C2C12=1/(3._dp*m2)
     Else 
        C2C12=(4 - 9*r + 5*r**3 + 6*(1 - 2*r)*r*Log(r))/(12._dp*m2*(-1 + r)**4)
    End if 
   End if 

Else if (Abs(m2in-m3in)/Abs(m2in+m3in).lt.eps) Then! m2==m3 
 m1=m1in 
 m2=m3in 
   If (m1.gt.m2) Then 
     r=m2/m1 
     If ((1._dp-r).lt.epsR) Then 
        C2C12=1/(8._dp*m1) - (11*(-1 + r))/(120._dp*m1) + (13*(-1 + r)**2)/(180._dp*m1)
     Elseif (Abs(r).lt.eps) Then 
        C2C12=large
     Else 
        C2C12=((-1 + r)*(16 + r*(-29 + 7*r)) + 6*(-2 + 3*r)*Log(r))/(36._dp*m1*(-1 + r)**4)
     End if 
   Else 
     r=m1/m2 
     If ((1._dp-r).lt.epsR) Then 
        C2C12=1/(8._dp*m2) - (-1 + r)/(30._dp*m2) + (-1 + r)**2/(72._dp*m2)
     Elseif (Abs(r).lt.eps) Then 
        C2C12=7/(36._dp*m2)
     Else 
        C2C12=(-((-1 + r)*(7 + r*(-29 + 16*r))) + 6*r**2*(-3 + 2*r)*Log(r))/(36._dp*m2*(-1 + r)**4)
     End if 
  End if 

Else!! Different masses are not possible! 
   C2C12 =0._dp 
End if 
 
End Function C2C12 


Real(dp) Function C1C2(m1in,m2in,m3in) 
Real(dp),Intent(in)::m1in,m2in,m3in 
Real(dp)::eps=1E-10_dp,large=0._dp,epsR=1E-03_dp 
Real(dp)::m1,m2,r 

!  C1 + C2

If (Abs(m1in-m2in)/Abs(m1in+m2in).lt.eps) Then! m1==m2 
 m1=m1in
 m2=m3in
   If (m1.gt.m2) Then 
     r=m2/m1 
     If ((1._dp-r).lt.epsR) Then  ! Taylor
        C1C2=1/(3._dp*m1) - (-1 + r)/(8._dp*m1) + (-1 + r)**2/(15._dp*m1)
     Elseif (Abs(r).lt.eps) Then 
        C1C2=3/(4._dp*m1)
     Else 
        C1C2=-(3 - 4*r + r**2 - 2*(-2 + r)*r*Log(r))/(4._dp*m1*(-1 + r)**3)
     End if 
   Else 
     r=m1/m2 
     If ((1._dp-r).lt.epsR) Then 
        C1C2=1/(3._dp*m2) - (5*(-1 + r))/(24._dp*m2) + (3*(-1 + r)**2)/(20._dp*m2)
     Elseif (Abs(r).lt.eps) Then 
        C1C2=large
     Else 
        C1C2=(1 - 4*r + 3*r**2 + (2 - 4*r)*Log(r))/(4._dp*m2*(-1 + r)**3)
    End if 
   End if 

Else if (Abs(m2in-m3in)/Abs(m2in+m3in).lt.eps) Then! m2==m3 
 m1=m1in 
 m2=m3in 
   If (m1.gt.m2) Then 
     r=m2/m1 
     If ((1._dp-r).lt.epsR) Then 
        C1C2=1/(3._dp*m1) - (-1 + r)/(4._dp*m1) + (-1 + r)**2/(5._dp*m1)
     Elseif (Abs(r).lt.eps) Then 
        C1C2=large
     Else 
        C1C2=(3 - 4*r + r**2 + 2*Log(r))/(2._dp*m1*(-1 + r)**3)
     End if 
   Else 
     r=m1/m2 
     If ((1._dp-r).lt.epsR) Then 
        C1C2=1/(3._dp*m2) - (-1 + r)/(12._dp*m2) + (-1 + r)**2/(30._dp*m2)
     Elseif (Abs(r).lt.eps) Then 
        C1C2=1/(2._dp*m2)
     Else 
        C1C2=(-1 + (4 - 3*r)*r + 2*r**2*Log(r))/(2._dp*m2*(-1 + r)**3)
     End if 
  End if 

Else!! Different masses are not possible! 
   C1C2 =0._dp 
End if 
 
End Function C1C2 
End Module LowEnergy_SSDM 

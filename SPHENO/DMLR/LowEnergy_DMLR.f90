! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.8.5 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 8:36 on 17.5.2016   
! ----------------------------------------------------------------------  
 
 
Module LowEnergy_DMLR 
Use Control 
Use Couplings_DMLR 
Use LoopCouplings_DMLR 
Use LoopFunctions 
Use LoopMasses_DMLR 
Use StandardModel 
Private::F1,F2,F3,F4,F3Gamma
!private variables
 

Contains


Subroutine Gminus2(Ifermion,MAh,MAh2,MdeltaRpp,MdeltaRpp2,MFe,MFe2,MFv,               & 
& MFv2,Mhh,Mhh2,MHpm,MHpm2,cplcFeFeAhL,cplcFeFeAhR,cplAhhhVP,cpldeltaRppcdeltaRppVP,     & 
& cplcFecFedeltaRppL,cplcFecFedeltaRppR,cplFeFecdeltaRppL,cplFeFecdeltaRppR,             & 
& cplFvFeHpmL,cplFvFeHpmR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,               & 
& cplFvFvVPL,cplFvFvVPR,cplcFeFvcHpmL,cplcFeFvcHpmR,cplHpmcHpmVP,a_mu)

Real(dp),Intent(in)  :: MAh(3),MAh2(3),MdeltaRpp,MdeltaRpp2,MFe(3),MFe2(3),MFv(6),MFv2(6),Mhh(3),             & 
& Mhh2(3),MHpm(3),MHpm2(3)

Complex(dp),Intent(in)  :: cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),cplAhhhVP(3,3),cpldeltaRppcdeltaRppVP,          & 
& cplcFecFedeltaRppL(3,3),cplcFecFedeltaRppR(3,3),cplFeFecdeltaRppL(3,3),cplFeFecdeltaRppR(3,3),& 
& cplFvFeHpmL(6,3,3),cplFvFeHpmR(6,3,3),cplcFeFehhL(3,3,3),cplcFeFehhR(3,3,3),           & 
& cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplFvFvVPL(6,6),cplFvFvVPR(6,6),cplcFeFvcHpmL(3,6,3),& 
& cplcFeFvcHpmR(3,6,3),cplHpmcHpmVP(3,3)

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
Do i1= 3,3
  Do i2= 1,3
   i3 = i2
  If ((MAh2(i1).gt.mz2).Or.(MFe2(i2).gt.mz2).Or.(MFe2(i3).gt.mz2)) Then
coup1L = cplcFeFeAhL(gt1,i2,i1)
coup1R = cplcFeFeAhR(gt1,i2,i1)
coup2L = cplcFeFeAhL(i3,gt2,i1)
coup2R = cplcFeFeAhR(i3,gt2,i1)
ratio = MAh2(i1)/MFe2(i2)
 If ((ratio.eq.ratio).and.(ratio.lt.1.0E+30_dp).and.(ratio.gt.1.0E-30_dp)) Then 
a_mu = a_mu - Real(coup1L*Conjg(coup1R),dp)*F3gamma(ratio)/MFe(i2)& 
      & + 2._dp*MFe(Ifermion)*(Abs(coup1L)**2 + Abs(coup1R)**2)*F2(ratio)/MFe2(i2) 
End if 
 
End if 
   End Do
  End Do


chargefactor = 1 
  Do i2= 1,3
   i3 = i2
  If ((MdeltaRpp2.gt.mz2).Or.(MFe2(i2).gt.mz2).Or.(MFe2(i3).gt.mz2)) Then
coup1L = cplcFecFedeltaRppL(gt1,i2)
coup1R = cplcFecFedeltaRppR(gt1,i2)
coup2L = cplFeFecdeltaRppL(gt2,i3)
coup2R = cplFeFecdeltaRppR(gt2,i3)
ratio = MdeltaRpp2/MFe2(i2)
 If ((ratio.eq.ratio).and.(ratio.lt.1.0E+30_dp).and.(ratio.gt.1.0E-30_dp)) Then 
a_mu = a_mu - Real(coup1L*Conjg(coup1R),dp)*F3gamma(ratio)/MFe(i2)& 
      & + 2._dp*MFe(Ifermion)*(Abs(coup1L)**2 + Abs(coup1R)**2)*F2(ratio)/MFe2(i2) 
End if 
 
End if 
  End Do


chargefactor = 1 
Do i1= 1,3
  Do i2= 1,3
   i3 = i2
  If ((MFe2(i1).gt.mz2).Or.(Mhh2(i2).gt.mz2).Or.(MAh2(i3).gt.mz2)) Then
coup1L = cplcFeFehhL(gt1,i1,i2)
coup1R = cplcFeFehhR(gt1,i1,i2)
coup2L = cplcFeFeAhL(i1,gt2,i3)
coup2R = cplcFeFeAhR(i1,gt2,i3)
ratio = Mhh2(i2)/MFe2(i1)
 If ((ratio.eq.ratio).and.(ratio.lt.1.0E+30_dp).and.(ratio.gt.1.0E-30_dp)) Then 
a_mu = a_mu - 2._dp*Real(coup1L*Conjg(coup1R),dp)*F4(ratio)/MFe(i1)& 
      & - 2._dp*MFe(Ifermion)*(Abs(coup1L)**2 + Abs(coup1R)**2)*F1(ratio)/MFe2(i1) 
End if 
 
End if 
   End Do
  End Do


chargefactor = 1 
Do i1= 1,3
  Do i2= 3,3
   i3 = i2
  If ((MFe2(i1).gt.mz2).Or.(MAh2(i2).gt.mz2).Or.(Mhh2(i3).gt.mz2)) Then
coup1L = cplcFeFeAhL(gt1,i1,i2)
coup1R = cplcFeFeAhR(gt1,i1,i2)
coup2L = cplcFeFehhL(i1,gt2,i3)
coup2R = cplcFeFehhR(i1,gt2,i3)
ratio = MAh2(i2)/MFe2(i1)
 If ((ratio.eq.ratio).and.(ratio.lt.1.0E+30_dp).and.(ratio.gt.1.0E-30_dp)) Then 
a_mu = a_mu - 2._dp*Real(coup1L*Conjg(coup1R),dp)*F4(ratio)/MFe(i1)& 
      & - 2._dp*MFe(Ifermion)*(Abs(coup1L)**2 + Abs(coup1R)**2)*F1(ratio)/MFe2(i1) 
End if 
 
End if 
   End Do
  End Do


chargefactor = 1 
Do i1= 1,6
  Do i2= 3,3
   i3 = i2
  If ((MFv2(i1).gt.mz2).Or.(MHpm2(i2).gt.mz2).Or.(MHpm2(i3).gt.mz2)) Then
coup1L = cplcFeFvcHpmL(gt1,i1,i2)
coup1R = cplcFeFvcHpmR(gt1,i1,i2)
coup2L = cplFvFeHpmL(i1,gt2,i3)
coup2R = cplFvFeHpmR(i1,gt2,i3)
ratio = MHpm2(i2)/MFv2(i1)
 If ((ratio.eq.ratio).and.(ratio.lt.1.0E+30_dp).and.(ratio.gt.1.0E-30_dp)) Then 
a_mu = a_mu - 2._dp*Real(coup1L*Conjg(coup1R),dp)*F4(ratio)/MFv(i1)& 
      & - 2._dp*MFe(Ifermion)*(Abs(coup1L)**2 + Abs(coup1R)**2)*F1(ratio)/MFv2(i1) 
End if 
 
End if 
   End Do
  End Do


chargefactor = 1 
Do i1= 1,3
  Do i2= 1,3
   i3 = i2
  If ((Mhh2(i1).gt.mz2).Or.(MFe2(i2).gt.mz2).Or.(MFe2(i3).gt.mz2)) Then
coup1L = cplcFeFehhL(gt1,i2,i1)
coup1R = cplcFeFehhR(gt1,i2,i1)
coup2L = cplcFeFehhL(i3,gt2,i1)
coup2R = cplcFeFehhR(i3,gt2,i1)
ratio = Mhh2(i1)/MFe2(i2)
 If ((ratio.eq.ratio).and.(ratio.lt.1.0E+30_dp).and.(ratio.gt.1.0E-30_dp)) Then 
a_mu = a_mu - Real(coup1L*Conjg(coup1R),dp)*F3gamma(ratio)/MFe(i2)& 
      & + 2._dp*MFe(Ifermion)*(Abs(coup1L)**2 + Abs(coup1R)**2)*F2(ratio)/MFe2(i2) 
End if 
 
End if 
   End Do
  End Do


chargefactor = 1 
Do i1= 1,3
  If ((MFe2(i1).gt.mz2).Or.(MdeltaRpp2.gt.mz2).Or.(MdeltaRpp2.gt.mz2)) Then
coup1L = cplcFecFedeltaRppL(gt1,i1)
coup1R = cplcFecFedeltaRppR(gt1,i1)
coup2L = cplFeFecdeltaRppL(gt2,i1)
coup2R = cplFeFecdeltaRppR(gt2,i1)
ratio = MdeltaRpp2/MFe2(i1)
 If ((ratio.eq.ratio).and.(ratio.lt.1.0E+30_dp).and.(ratio.gt.1.0E-30_dp)) Then 
a_mu = a_mu - 2._dp*Real(coup1L*Conjg(coup1R),dp)*F4(ratio)/MFe(i1)& 
      & - 2._dp*MFe(Ifermion)*(Abs(coup1L)**2 + Abs(coup1R)**2)*F1(ratio)/MFe2(i1) 
End if 
 
End if 
   End Do


chargefactor = 1 
Do i1= 3,3
  Do i2= 1,6
   i3 = i2
  If ((MHpm2(i1).gt.mz2).Or.(MFv2(i2).gt.mz2).Or.(MFv2(i3).gt.mz2)) Then
coup1L = cplcFeFvcHpmL(gt1,i2,i1)
coup1R = cplcFeFvcHpmR(gt1,i2,i1)
coup2L = cplFvFeHpmL(i3,gt2,i1)
coup2R = cplFvFeHpmR(i3,gt2,i1)
ratio = MHpm2(i1)/MFv2(i2)
 If ((ratio.eq.ratio).and.(ratio.lt.1.0E+30_dp).and.(ratio.gt.1.0E-30_dp)) Then 
a_mu = a_mu - Real(coup1L*Conjg(coup1R),dp)*F3gamma(ratio)/MFv(i2)& 
      & + 2._dp*MFe(Ifermion)*(Abs(coup1L)**2 + Abs(coup1R)**2)*F2(ratio)/MFv2(i2) 
End if 
 
End if 
   End Do
  End Do


a_mu = a_mu*MFe(Ifermion)*oo16pi2 
Iname = Iname -1 
 
End Subroutine Gminus2 
 
 
Subroutine LeptonEDM(Ifermion,MAh,MAh2,MdeltaRpp,MdeltaRpp2,MFe,MFe2,MFv,             & 
& MFv2,Mhh,Mhh2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,cplcFeFeAhL,    & 
& cplcFeFeAhR,cplAhhhVP,cpldeltaRppcdeltaRppVP,cplcFecFedeltaRppL,cplcFecFedeltaRppR,    & 
& cplFeFecdeltaRppL,cplFeFecdeltaRppR,cplFvFeHpmL,cplFvFeHpmR,cplFvFeVWLmL,              & 
& cplFvFeVWLmR,cplFvFeVWRmL,cplFvFeVWRmR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,            & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZRL,cplcFeFeVZRR,cplFvFvVPL,              & 
& cplFvFvVPR,cplcFeFvcHpmL,cplcFeFvcHpmR,cplcFeFvcVWLmL,cplcFeFvcVWLmR,cplcFeFvcVWRmL,   & 
& cplcFeFvcVWRmR,cplHpmcHpmVP,cplcVWLmVPVWLm,cplcVWRmVPVWLm,cplcVWLmVPVWRm,              & 
& cplcVWRmVPVWRm,EDM)

Implicit None
Real(dp),Intent(in)  :: MAh(3),MAh2(3),MdeltaRpp,MdeltaRpp2,MFe(3),MFe2(3),MFv(6),MFv2(6),Mhh(3),             & 
& Mhh2(3),MHpm(3),MHpm2(3),MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2

Complex(dp),Intent(in)  :: cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),cplAhhhVP(3,3),cpldeltaRppcdeltaRppVP,          & 
& cplcFecFedeltaRppL(3,3),cplcFecFedeltaRppR(3,3),cplFeFecdeltaRppL(3,3),cplFeFecdeltaRppR(3,3),& 
& cplFvFeHpmL(6,3,3),cplFvFeHpmR(6,3,3),cplFvFeVWLmL(6,3),cplFvFeVWLmR(6,3),             & 
& cplFvFeVWRmL(6,3),cplFvFeVWRmR(6,3),cplcFeFehhL(3,3,3),cplcFeFehhR(3,3,3),             & 
& cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFeVZRL(3,3), & 
& cplcFeFeVZRR(3,3),cplFvFvVPL(6,6),cplFvFvVPR(6,6),cplcFeFvcHpmL(3,6,3),cplcFeFvcHpmR(3,6,3),& 
& cplcFeFvcVWLmL(3,6),cplcFeFvcVWLmR(3,6),cplcFeFvcVWRmL(3,6),cplcFeFvcVWRmR(3,6),       & 
& cplHpmcHpmVP(3,3),cplcVWLmVPVWLm,cplcVWRmVPVWLm,cplcVWLmVPVWRm,cplcVWRmVPVWRm

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
Do i1= 3,3
  Do i2= 1,3
   i3 = i2
  If ((MAh2(i1).gt.mz2).Or.(MFe2(i2).gt.mz2).Or.(MFe2(i3).gt.mz2)) Then
coup1L = cplcFeFeAhL(gt1,i2,i1)
coup1R = cplcFeFeAhR(gt1,i2,i1)
coup2L = cplcFeFeAhL(i3,gt2,i1)
coup2R = cplcFeFeAhR(i3,gt2,i1)
ratio = MFe2(i2)/MAh2(i1)
 If ((ratio.eq.ratio).and.(ratio.lt.1.0E+30_dp).and.(ratio.gt.1.0E-30_dp)) Then 
EDM = EDM -(1)* Aimag(coup1R*Conjg(coup1L))*FeynFunctionA(ratio)*& 
    &MFe(i2)/MAh2(i1) 
End if 
 
End if 
   End Do
  End Do


chargefactor = 1 
  Do i2= 1,3
   i3 = i2
  If ((MdeltaRpp2.gt.mz2).Or.(MFe2(i2).gt.mz2).Or.(MFe2(i3).gt.mz2)) Then
coup1L = cplcFecFedeltaRppL(gt1,i2)
coup1R = cplcFecFedeltaRppR(gt1,i2)
coup2L = cplFeFecdeltaRppL(gt2,i3)
coup2R = cplFeFecdeltaRppR(gt2,i3)
ratio = MFe2(i2)/MdeltaRpp2
 If ((ratio.eq.ratio).and.(ratio.lt.1.0E+30_dp).and.(ratio.gt.1.0E-30_dp)) Then 
EDM = EDM -(1)* Aimag(coup1R*Conjg(coup1L))*FeynFunctionA(ratio)*& 
    &MFe(i2)/MdeltaRpp2 
End if 
 
End if 
  End Do


chargefactor = 1 
Do i1= 1,3
  Do i2= 1,3
   i3 = i2
  If ((MFe2(i1).gt.mz2).Or.(Mhh2(i2).gt.mz2).Or.(MAh2(i3).gt.mz2)) Then
coup1L = cplcFeFehhL(gt1,i1,i2)
coup1R = cplcFeFehhR(gt1,i1,i2)
coup2L = cplcFeFeAhL(i1,gt2,i3)
coup2R = cplcFeFeAhR(i1,gt2,i3)
ratio = MFe2(i1)/Mhh2(i2)
 If ((ratio.eq.ratio).and.(ratio.lt.1.0E+30_dp).and.(ratio.gt.1.0E-30_dp)) Then 
EDM = EDM +(0)* Aimag(coup1L*Conjg(coup1R))*FeynFunctionB(ratio)*& 
    &MFe(i1)/Mhh2(i2) 
End if 
 
End if 
   End Do
  End Do


chargefactor = 1 
Do i1= 1,3
  Do i2= 3,3
   i3 = i2
  If ((MFe2(i1).gt.mz2).Or.(MAh2(i2).gt.mz2).Or.(Mhh2(i3).gt.mz2)) Then
coup1L = cplcFeFeAhL(gt1,i1,i2)
coup1R = cplcFeFeAhR(gt1,i1,i2)
coup2L = cplcFeFehhL(i1,gt2,i3)
coup2R = cplcFeFehhR(i1,gt2,i3)
ratio = MFe2(i1)/MAh2(i2)
 If ((ratio.eq.ratio).and.(ratio.lt.1.0E+30_dp).and.(ratio.gt.1.0E-30_dp)) Then 
EDM = EDM +(0)* Aimag(coup1L*Conjg(coup1R))*FeynFunctionB(ratio)*& 
    &MFe(i1)/MAh2(i2) 
End if 
 
End if 
   End Do
  End Do


chargefactor = 1 
Do i1= 1,6
  Do i2= 3,3
   i3 = i2
  If ((MFv2(i1).gt.mz2).Or.(MHpm2(i2).gt.mz2).Or.(MHpm2(i3).gt.mz2)) Then
coup1L = cplcFeFvcHpmL(gt1,i1,i2)
coup1R = cplcFeFvcHpmR(gt1,i1,i2)
coup2L = cplFvFeHpmL(i1,gt2,i3)
coup2R = cplFvFeHpmR(i1,gt2,i3)
ratio = MFv2(i1)/MHpm2(i2)
 If ((ratio.eq.ratio).and.(ratio.lt.1.0E+30_dp).and.(ratio.gt.1.0E-30_dp)) Then 
EDM = EDM +(-1)* Aimag(coup1L*Conjg(coup1R))*FeynFunctionB(ratio)*& 
    &MFv(i1)/MHpm2(i2) 
End if 
 
End if 
   End Do
  End Do


chargefactor = 1 
Do i1= 1,6
  If ((MFv2(i1).gt.mz2).Or.(MVWLm2.gt.mz2).Or.(MVWLm2.gt.mz2)) Then
coup1L = cplcFeFvcVWLmL(gt1,i1)
coup1R = cplcFeFvcVWLmR(gt1,i1)
coup2L = cplFvFeVWLmL(i1,gt2)
coup2R = cplFvFeVWLmR(i1,gt2)
End if 
   End Do


chargefactor = 1 
Do i1= 1,6
  If ((MFv2(i1).gt.mz2).Or.(MVWRm2.gt.mz2).Or.(MVWLm2.gt.mz2)) Then
coup1L = cplcFeFvcVWRmL(gt1,i1)
coup1R = cplcFeFvcVWRmR(gt1,i1)
coup2L = cplFvFeVWLmL(i1,gt2)
coup2R = cplFvFeVWLmR(i1,gt2)
End if 
   End Do


chargefactor = 1 
Do i1= 1,6
  If ((MFv2(i1).gt.mz2).Or.(MVWLm2.gt.mz2).Or.(MVWRm2.gt.mz2)) Then
coup1L = cplcFeFvcVWLmL(gt1,i1)
coup1R = cplcFeFvcVWLmR(gt1,i1)
coup2L = cplFvFeVWRmL(i1,gt2)
coup2R = cplFvFeVWRmR(i1,gt2)
End if 
   End Do


chargefactor = 1 
Do i1= 1,6
  If ((MFv2(i1).gt.mz2).Or.(MVWRm2.gt.mz2).Or.(MVWRm2.gt.mz2)) Then
coup1L = cplcFeFvcVWRmL(gt1,i1)
coup1R = cplcFeFvcVWRmR(gt1,i1)
coup2L = cplFvFeVWRmL(i1,gt2)
coup2R = cplFvFeVWRmR(i1,gt2)
End if 
   End Do


chargefactor = 1 
Do i1= 1,3
  Do i2= 1,3
   i3 = i2
  If ((Mhh2(i1).gt.mz2).Or.(MFe2(i2).gt.mz2).Or.(MFe2(i3).gt.mz2)) Then
coup1L = cplcFeFehhL(gt1,i2,i1)
coup1R = cplcFeFehhR(gt1,i2,i1)
coup2L = cplcFeFehhL(i3,gt2,i1)
coup2R = cplcFeFehhR(i3,gt2,i1)
ratio = MFe2(i2)/Mhh2(i1)
 If ((ratio.eq.ratio).and.(ratio.lt.1.0E+30_dp).and.(ratio.gt.1.0E-30_dp)) Then 
EDM = EDM -(1)* Aimag(coup1R*Conjg(coup1L))*FeynFunctionA(ratio)*& 
    &MFe(i2)/Mhh2(i1) 
End if 
 
End if 
   End Do
  End Do


chargefactor = 1 
  Do i2= 1,3
   i3 = i2
  If ((0._dp.gt.mz2).Or.(MFe2(i2).gt.mz2).Or.(MFe2(i3).gt.mz2)) Then
coup1L = cplcFeFeVPL(gt1,i2)
coup1R = cplcFeFeVPR(gt1,i2)
coup2L = cplcFeFeVPL(i3,gt2)
coup2R = cplcFeFeVPR(i3,gt2)
End if 
  End Do


chargefactor = 1 
  Do i2= 1,3
   i3 = i2
  If ((MVZ2.gt.mz2).Or.(MFe2(i2).gt.mz2).Or.(MFe2(i3).gt.mz2)) Then
coup1L = cplcFeFeVZL(gt1,i2)
coup1R = cplcFeFeVZR(gt1,i2)
coup2L = cplcFeFeVZL(i3,gt2)
coup2R = cplcFeFeVZR(i3,gt2)
End if 
  End Do


chargefactor = 1 
  Do i2= 1,3
   i3 = i2
  If ((MVZR2.gt.mz2).Or.(MFe2(i2).gt.mz2).Or.(MFe2(i3).gt.mz2)) Then
coup1L = cplcFeFeVZRL(gt1,i2)
coup1R = cplcFeFeVZRR(gt1,i2)
coup2L = cplcFeFeVZRL(i3,gt2)
coup2R = cplcFeFeVZRR(i3,gt2)
End if 
  End Do


chargefactor = 1 
Do i1= 1,3
  If ((MFe2(i1).gt.mz2).Or.(MdeltaRpp2.gt.mz2).Or.(MdeltaRpp2.gt.mz2)) Then
coup1L = cplcFecFedeltaRppL(gt1,i1)
coup1R = cplcFecFedeltaRppR(gt1,i1)
coup2L = cplFeFecdeltaRppL(gt2,i1)
coup2R = cplFeFecdeltaRppR(gt2,i1)
ratio = MFe2(i1)/MdeltaRpp2
 If ((ratio.eq.ratio).and.(ratio.lt.1.0E+30_dp).and.(ratio.gt.1.0E-30_dp)) Then 
EDM = EDM +(2)* Aimag(coup1L*Conjg(coup1R))*FeynFunctionB(ratio)*& 
    &MFe(i1)/MdeltaRpp2 
End if 
 
End if 
   End Do


chargefactor = 1 
Do i1= 3,3
  Do i2= 1,6
   i3 = i2
  If ((MHpm2(i1).gt.mz2).Or.(MFv2(i2).gt.mz2).Or.(MFv2(i3).gt.mz2)) Then
coup1L = cplcFeFvcHpmL(gt1,i2,i1)
coup1R = cplcFeFvcHpmR(gt1,i2,i1)
coup2L = cplFvFeHpmL(i3,gt2,i1)
coup2R = cplFvFeHpmR(i3,gt2,i1)
ratio = MFv2(i2)/MHpm2(i1)
 If ((ratio.eq.ratio).and.(ratio.lt.1.0E+30_dp).and.(ratio.gt.1.0E-30_dp)) Then 
EDM = EDM -(0)* Aimag(coup1R*Conjg(coup1L))*FeynFunctionA(ratio)*& 
    &MFv(i2)/MHpm2(i1) 
End if 
 
End if 
   End Do
  End Do


chargefactor = 1 
  Do i2= 1,6
   i3 = i2
  If ((MVWLm2.gt.mz2).Or.(MFv2(i2).gt.mz2).Or.(MFv2(i3).gt.mz2)) Then
coup1L = cplcFeFvcVWLmL(gt1,i2)
coup1R = cplcFeFvcVWLmR(gt1,i2)
coup2L = cplFvFeVWLmL(i3,gt2)
coup2R = cplFvFeVWLmR(i3,gt2)
End if 
  End Do


chargefactor = 1 
  Do i2= 1,6
   i3 = i2
  If ((MVWRm2.gt.mz2).Or.(MFv2(i2).gt.mz2).Or.(MFv2(i3).gt.mz2)) Then
coup1L = cplcFeFvcVWRmL(gt1,i2)
coup1R = cplcFeFvcVWRmR(gt1,i2)
coup2L = cplFvFeVWRmL(i3,gt2)
coup2R = cplFvFeVWRmR(i3,gt2)
End if 
  End Do


EDM = ecmfactor*EDM*oo16pi2 
Iname = Iname -1 
 
End Subroutine LeptonEDM 
 
 
Subroutine DeltaRho(MAh,MAh2,MdeltaRpp,MdeltaRpp2,MFc,MFc2,MFcp,MFcp2,MFcpp,          & 
& MFcpp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MVWLm,MVWLm2,           & 
& MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,cplAhAhcVWLmVWLm,cplAhAhVZVZ,cplAhcVWLmVWRm,          & 
& cplAhhhVZ,cplAhHpmcVWLm,cplcdeltaRppcHpmcVWLm,cplcdeltaRppcVWLmcVWLm,cplcdeltaRppcVWLmcVWRm,& 
& cplcFcFcVZL,cplcFcFcVZR,cplcFcpFccVWLmL,cplcFcpFccVWLmR,cplcFcpFcpVZL,cplcFcpFcpVZR,   & 
& cplcFcppFcpcVWLmL,cplcFcppFcpcVWLmR,cplcFcppFcppVZL,cplcFcppFcppVZR,cplcFdFdVZL,       & 
& cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFvcVWLmL,cplcFeFvcVWLmR,cplcFuFdcVWLmL,      & 
& cplcFuFdcVWLmR,cplcFuFuVZL,cplcFuFuVZR,cplcgPgWLmcVWLm,cplcgPgWRmcVWLm,cplcgWLmgWLmVZ, & 
& cplcgWLpgPcVWLm,cplcgWLpgWLpVZ,cplcgWLpgZcVWLm,cplcgWLpgZpcVWLm,cplcgWRmgWLmVZ,        & 
& cplcgWRmgWRmVZ,cplcgWRpgPcVWLm,cplcgWRpgWLpVZ,cplcgWRpgWRpVZ,cplcgWRpgZcVWLm,          & 
& cplcgWRpgZpcVWLm,cplcgZgWLmcVWLm,cplcgZgWRmcVWLm,cplcgZpgWLmcVWLm,cplcgZpgWRmcVWLm,    & 
& cplcVWLmcVWLmVWLmVWLm1,cplcVWLmcVWLmVWLmVWLm2,cplcVWLmcVWLmVWLmVWLm3,cplcVWLmcVWRmVWLmVWRm1,& 
& cplcVWLmcVWRmVWLmVWRm2,cplcVWLmcVWRmVWLmVWRm3,cplcVWLmVPVPVWLm1,cplcVWLmVPVPVWLm2,     & 
& cplcVWLmVPVPVWLm3,cplcVWLmVPVWLm,cplcVWLmVPVWRm,cplcVWLmVWLmVZ,cplcVWLmVWLmVZR,        & 
& cplcVWLmVWLmVZRVZR1,cplcVWLmVWLmVZRVZR2,cplcVWLmVWLmVZRVZR3,cplcVWLmVWLmVZVZ1,         & 
& cplcVWLmVWLmVZVZ2,cplcVWLmVWLmVZVZ3,cplcVWLmVWRmVZ,cplcVWLmVWRmVZR,cplcVWRmVWLmVZ,     & 
& cplcVWRmVWRmVZ,cplcVWRmVWRmVZVZ1,cplcVWRmVWRmVZVZ2,cplcVWRmVWRmVZVZ3,cpldeltaRppcdeltaRppcVWLmVWLm,& 
& cpldeltaRppcdeltaRppVZ,cpldeltaRppcdeltaRppVZVZ,cplFvFvVZL,cplFvFvVZR,cplhhcVWLmVWLm,  & 
& cplhhcVWLmVWRm,cplhhhhcVWLmVWLm,cplhhhhVZVZ,cplhhHpmcVWLm,cplhhVPVZ,cplhhVZVZ,         & 
& cplhhVZVZR,cplHpmcHpmcVWLmVWLm,cplHpmcHpmVZ,cplHpmcHpmVZVZ,cplHpmcVWLmVP,              & 
& cplHpmcVWLmVZ,cplHpmcVWLmVZR,cplHpmcVWRmVZ,rho)

Implicit None
Real(dp),Intent(in)  :: MAh(3),MAh2(3),MdeltaRpp,MdeltaRpp2,MFc,MFc2,MFcp,MFcp2,MFcpp,MFcpp2,MFd(3),          & 
& MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),Mhh(3),Mhh2(3),MHpm(3),           & 
& MHpm2(3),MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2

Complex(dp),Intent(in)  :: cplAhAhcVWLmVWLm(3,3),cplAhAhVZVZ(3,3),cplAhcVWLmVWRm(3),cplAhhhVZ(3,3),              & 
& cplAhHpmcVWLm(3,3),cplcdeltaRppcHpmcVWLm(3),cplcdeltaRppcVWLmcVWLm,cplcdeltaRppcVWLmcVWRm,& 
& cplcFcFcVZL,cplcFcFcVZR,cplcFcpFccVWLmL,cplcFcpFccVWLmR,cplcFcpFcpVZL,cplcFcpFcpVZR,   & 
& cplcFcppFcpcVWLmL,cplcFcppFcpcVWLmR,cplcFcppFcppVZL,cplcFcppFcppVZR,cplcFdFdVZL(3,3),  & 
& cplcFdFdVZR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFvcVWLmL(3,6),cplcFeFvcVWLmR(3,6),& 
& cplcFuFdcVWLmL(3,3),cplcFuFdcVWLmR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),             & 
& cplcgPgWLmcVWLm,cplcgPgWRmcVWLm,cplcgWLmgWLmVZ,cplcgWLpgPcVWLm,cplcgWLpgWLpVZ,         & 
& cplcgWLpgZcVWLm,cplcgWLpgZpcVWLm,cplcgWRmgWLmVZ,cplcgWRmgWRmVZ,cplcgWRpgPcVWLm,        & 
& cplcgWRpgWLpVZ,cplcgWRpgWRpVZ,cplcgWRpgZcVWLm,cplcgWRpgZpcVWLm,cplcgZgWLmcVWLm,        & 
& cplcgZgWRmcVWLm,cplcgZpgWLmcVWLm,cplcgZpgWRmcVWLm,cplcVWLmcVWLmVWLmVWLm1,              & 
& cplcVWLmcVWLmVWLmVWLm2,cplcVWLmcVWLmVWLmVWLm3,cplcVWLmcVWRmVWLmVWRm1,cplcVWLmcVWRmVWLmVWRm2,& 
& cplcVWLmcVWRmVWLmVWRm3,cplcVWLmVPVPVWLm1,cplcVWLmVPVPVWLm2,cplcVWLmVPVPVWLm3,          & 
& cplcVWLmVPVWLm,cplcVWLmVPVWRm,cplcVWLmVWLmVZ,cplcVWLmVWLmVZR,cplcVWLmVWLmVZRVZR1,      & 
& cplcVWLmVWLmVZRVZR2,cplcVWLmVWLmVZRVZR3,cplcVWLmVWLmVZVZ1,cplcVWLmVWLmVZVZ2,           & 
& cplcVWLmVWLmVZVZ3,cplcVWLmVWRmVZ,cplcVWLmVWRmVZR,cplcVWRmVWLmVZ,cplcVWRmVWRmVZ,        & 
& cplcVWRmVWRmVZVZ1,cplcVWRmVWRmVZVZ2,cplcVWRmVWRmVZVZ3,cpldeltaRppcdeltaRppcVWLmVWLm,   & 
& cpldeltaRppcdeltaRppVZ,cpldeltaRppcdeltaRppVZVZ,cplFvFvVZL(6,6),cplFvFvVZR(6,6),       & 
& cplhhcVWLmVWLm(3),cplhhcVWLmVWRm(3),cplhhhhcVWLmVWLm(3,3),cplhhhhVZVZ(3,3),            & 
& cplhhHpmcVWLm(3,3),cplhhVPVZ(3),cplhhVZVZ(3),cplhhVZVZR(3),cplHpmcHpmcVWLmVWLm(3,3),   & 
& cplHpmcHpmVZ(3,3),cplHpmcHpmVZVZ(3,3),cplHpmcVWLmVP(3),cplHpmcVWLmVZ(3),               & 
& cplHpmcVWLmVZR(3),cplHpmcVWRmVZ(3)

Real(dp), Intent(out) :: rho 
Integer :: i1, i2, i3, kont 
Real(dp) ::  delta_rho, delta_rho0, Drho_top, mu_old 
Complex(dp) ::  dmW2, dmz2 
mu_old = SetRenormalizationScale(mZ2) 
 
Call Pi1LoopVZ(0._dp,Mhh,Mhh2,MAh,MAh2,MdeltaRpp,MdeltaRpp2,MFc,MFc2,MFcp,            & 
& MFcp2,MFcpp,MFcpp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MVZR,MVZR2,            & 
& MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,cplAhhhVZ,cpldeltaRppcdeltaRppVZ,cplcFcFcVZL,     & 
& cplcFcFcVZR,cplcFcpFcpVZL,cplcFcpFcpVZR,cplcFcppFcppVZL,cplcFcppFcppVZR,               & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplFvFvVZL,cplFvFvVZR,cplcgWLmgWLmVZ,cplcgWRmgWLmVZ,cplcgWLpgWLpVZ,cplcgWRpgWLpVZ,     & 
& cplcgWRmgWRmVZ,cplcgWRpgWRpVZ,cplhhVPVZ,cplhhVZVZ,cplhhVZVZR,cplHpmcHpmVZ,             & 
& cplHpmcVWLmVZ,cplHpmcVWRmVZ,cplcVWLmVWLmVZ,cplcVWRmVWLmVZ,cplcVWRmVWRmVZ,              & 
& cplAhAhVZVZ,cpldeltaRppcdeltaRppVZVZ,cplhhhhVZVZ,cplHpmcHpmVZVZ,cplcVWLmVWLmVZVZ1,     & 
& cplcVWLmVWLmVZVZ2,cplcVWLmVWLmVZVZ3,cplcVWRmVWRmVZVZ1,cplcVWRmVWRmVZVZ2,               & 
& cplcVWRmVWRmVZVZ3,kont,dmZ2)

Call Pi1LoopVWLm(0._dp,MHpm,MHpm2,MAh,MAh2,MVWRm,MVWRm2,MFcp,MFcp2,MFc,               & 
& MFc2,MFcpp,MFcpp2,MFu,MFu2,MFd,MFd2,MFe,MFe2,MFv,MFv2,Mhh,Mhh2,MVWLm,MVWLm2,           & 
& MVZ,MVZ2,MVZR,MVZR2,MdeltaRpp,MdeltaRpp2,cplAhHpmcVWLm,cplAhcVWLmVWRm,cplcFcpFccVWLmL, & 
& cplcFcpFccVWLmR,cplcFcppFcpcVWLmL,cplcFcppFcpcVWLmR,cplcFuFdcVWLmL,cplcFuFdcVWLmR,     & 
& cplcFeFvcVWLmL,cplcFeFvcVWLmR,cplcgWLpgPcVWLm,cplcgWRpgPcVWLm,cplcgPgWLmcVWLm,         & 
& cplcgZgWLmcVWLm,cplcgZpgWLmcVWLm,cplcgPgWRmcVWLm,cplcgZgWRmcVWLm,cplcgZpgWRmcVWLm,     & 
& cplcgWLpgZcVWLm,cplcgWRpgZcVWLm,cplcgWLpgZpcVWLm,cplcgWRpgZpcVWLm,cplhhHpmcVWLm,       & 
& cplhhcVWLmVWLm,cplhhcVWLmVWRm,cplHpmcVWLmVP,cplHpmcVWLmVZ,cplHpmcVWLmVZR,              & 
& cplcVWLmVPVWLm,cplcVWLmVPVWRm,cplcVWLmVWLmVZ,cplcVWLmVWLmVZR,cplcVWLmVWRmVZ,           & 
& cplcVWLmVWRmVZR,cplcdeltaRppcHpmcVWLm,cplcdeltaRppcVWLmcVWLm,cplcdeltaRppcVWLmcVWRm,   & 
& cplAhAhcVWLmVWLm,cpldeltaRppcdeltaRppcVWLmVWLm,cplhhhhcVWLmVWLm,cplHpmcHpmcVWLmVWLm,   & 
& cplcVWLmVPVPVWLm3,cplcVWLmVPVPVWLm1,cplcVWLmVPVPVWLm2,cplcVWLmcVWLmVWLmVWLm2,          & 
& cplcVWLmcVWLmVWLmVWLm3,cplcVWLmcVWLmVWLmVWLm1,cplcVWLmcVWRmVWLmVWRm2,cplcVWLmcVWRmVWLmVWRm3,& 
& cplcVWLmcVWRmVWLmVWRm1,cplcVWLmVWLmVZVZ1,cplcVWLmVWLmVZVZ2,cplcVWLmVWLmVZVZ3,          & 
& cplcVWLmVWLmVZRVZR1,cplcVWLmVWLmVZRVZR2,cplcVWLmVWLmVZRVZR3,kont,dmW2)

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
End Module LowEnergy_DMLR 

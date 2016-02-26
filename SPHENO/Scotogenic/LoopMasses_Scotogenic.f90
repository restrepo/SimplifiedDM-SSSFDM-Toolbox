! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.5.8 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 11:42 on 28.11.2015   
! ----------------------------------------------------------------------  
 
 
Module LoopMasses_Scotogenic 
 
Use Control 
Use Couplings_Scotogenic 
Use LoopFunctions 
Use Mathematics 
Use MathematicsQP 
Use Model_Data_Scotogenic 
Use StandardModel 
Use Tadpoles_Scotogenic 
 Use SusyMasses_Scotogenic 
 
Real(dp), Private :: MChi_1L(3), MChi2_1L(3)  
Complex(dp), Private :: ZX_1L(3,3)  
Real(dp), Private :: MFv_1L(3), MFv2_1L(3)  
Complex(dp), Private :: UV_1L(3,3)  
Real(dp), Private :: MHp_1L, MHp2_1L  
Real(dp), Private :: Metp_1L, Metp2_1L  
Real(dp), Private :: MAh_1L, MAh2_1L  
Real(dp), Private :: Mhh_1L, Mhh2_1L  
Real(dp), Private :: MetI_1L, MetI2_1L  
Real(dp), Private :: MetR_1L, MetR2_1L  
Real(dp), Private :: MVZ_1L, MVZ2_1L  
Real(dp), Private :: MVWp_1L, MVWp2_1L  
Real(dp), save :: rMS = 1._dp 
Contains 
 
Subroutine OneLoopMasses(MAh,MAh2,MChi,MChi2,MetI,MetI2,Metp,Metp2,MetR,              & 
& MetR2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,            & 
& MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZW,ZX,ZZ,v,g1,g2,g3,lam1,lam2,lam4,lam3,            & 
& lam5,Yn,Yu,Yd,Ye,Mn,mH2,mEt2,kont)

Implicit None 
Real(dp),Intent(inout) :: g1,g2,g3,lam5

Complex(dp),Intent(inout) :: lam1,lam2,lam4,lam3,Yn(3,3),Yu(3,3),Yd(3,3),Ye(3,3),Mn(3,3),mH2,mEt2

Real(dp),Intent(inout) :: MAh,MAh2,MChi(3),MChi2(3),MetI,MetI2,Metp,Metp2,MetR,MetR2,MFd(3),MFd2(3),            & 
& MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(3),MFv2(3),Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,             & 
& MVZ,MVZ2,TW,ZZ(2,2)

Complex(dp),Intent(inout) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),UV(3,3),ZW(2,2),ZX(3,3)

Real(dp),Intent(inout) :: v

Complex(dp) :: cplAhAhAhAh,cplAhAhcVWpVWp,cplAhAhetIetI,cplAhAhetpcetp,cplAhAhetRetR,cplAhAhhh,      & 
& cplAhAhhhhh,cplAhAhHpcHp,cplAhAhVZVZ,cplAhcHpVWp,cplAhetIetR,cplAhhhVZ,cplAhHpcVWp,    & 
& cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),cplcFdFdhhL(3,3),cplcFdFdhhR(3,3),cplcFdFdVZL(3,3),  & 
& cplcFdFdVZR(3,3),cplcFdFucHpL(3,3),cplcFdFucHpR(3,3),cplcFdFucVWpL(3,3),               & 
& cplcFdFucVWpR(3,3),cplcFeChicetpL(3,3),cplcFeChicetpR(3,3),cplcFeFeAhL(3,3),           & 
& cplcFeFeAhR(3,3),cplcFeFehhL(3,3),cplcFeFehhR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),  & 
& cplcFeFvcHpL(3,3),cplcFeFvcHpR(3,3),cplcFeFvcVWpL(3,3),cplcFeFvcVWpR(3,3),             & 
& cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),cplcFuFuhhL(3,3),cplcFuFuhhR(3,3),cplcFuFuVZL(3,3),  & 
& cplcFuFuVZR(3,3),cplcgAgWpcVWp,cplcgWCgAcVWp,cplcgWCgWCAh,cplcgWCgWChh,cplcgWCgWCVZ,   & 
& cplcgWCgZcHp,cplcgWCgZcVWp,cplcgWpgWpAh,cplcgWpgWphh,cplcgWpgWpVZ,cplcgWpgZHp,         & 
& cplcgZgWCHp,cplcgZgWpcHp,cplcgZgWpcVWp,cplcgZgZhh,cplChiFvetIL(3,3),cplChiFvetIR(3,3), & 
& cplChiFvetRL(3,3),cplChiFvetRR(3,3),cplChiUFvetIL(3,3),cplChiUFvetIR(3,3),             & 
& cplChiUFvetRL(3,3),cplChiUFvetRR(3,3),cplcHpVPVWp,cplcHpVWpVZ,cplcUFdFdAhL(3,3),       & 
& cplcUFdFdAhR(3,3),cplcUFdFdhhL(3,3),cplcUFdFdhhR(3,3),cplcUFdFdVGL(3,3),               & 
& cplcUFdFdVGR(3,3),cplcUFdFdVPL(3,3),cplcUFdFdVPR(3,3),cplcUFdFdVZL(3,3),               & 
& cplcUFdFdVZR(3,3),cplcUFdFucHpL(3,3),cplcUFdFucHpR(3,3),cplcUFdFucVWpL(3,3),           & 
& cplcUFdFucVWpR(3,3),cplcUFeChicetpL(3,3),cplcUFeChicetpR(3,3),cplcUFeFeAhL(3,3),       & 
& cplcUFeFeAhR(3,3),cplcUFeFehhL(3,3),cplcUFeFehhR(3,3),cplcUFeFeVPL(3,3),               & 
& cplcUFeFeVPR(3,3),cplcUFeFeVZL(3,3),cplcUFeFeVZR(3,3),cplcUFeFvcHpL(3,3),              & 
& cplcUFeFvcHpR(3,3),cplcUFeFvcVWpL(3,3),cplcUFeFvcVWpR(3,3),cplcUFuFdHpL(3,3),          & 
& cplcUFuFdHpR(3,3),cplcUFuFdVWpL(3,3),cplcUFuFdVWpR(3,3),cplcUFuFuAhL(3,3),             & 
& cplcUFuFuAhR(3,3),cplcUFuFuhhL(3,3),cplcUFuFuhhR(3,3),cplcUFuFuVGL(3,3),               & 
& cplcUFuFuVGR(3,3),cplcUFuFuVPL(3,3),cplcUFuFuVPR(3,3),cplcUFuFuVZL(3,3),               & 
& cplcUFuFuVZR(3,3),cplcVWpcVWpVWpVWp1,cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3,            & 
& cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,cplcVWpVPVPVWp3,cplcVWpVPVWp,cplcVWpVWpVZ,             & 
& cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,cpletIcetpVWp,cpletIetIcVWpVWp,        & 
& cpletIetIetIetI,cpletIetIetpcetp,cpletIetIetRetR,cpletIetIhh,cpletIetIhhhh,            & 
& cpletIetIHpcHp,cpletIetIVZVZ,cpletIetpcHp,cpletIetpcVWp,cpletIetRVZ,cpletIHpcetp,      & 
& cpletpcetpcVWpVWp,cpletpcetpVP,cpletpcetpVPVP,cpletpcetpVZ,cpletpcetpVZVZ,             & 
& cpletpetpcetpcetp,cpletpetRcHp,cpletpetRcVWp,cpletpetRetRcetp,cpletphhcetp,            & 
& cpletphhhhcetp,cpletpHpcetpcHp,cpletRcetpVWp,cpletRetRcVWpVWp,cpletRetRetRetR,         & 
& cpletRetRhh,cpletRetRhhhh,cpletRetRHpcHp,cpletRetRVZVZ,cpletRHpcetp,cplFvFvVZL(3,3),   & 
& cplFvFvVZR(3,3),cplhhcHpVWp,cplhhcVWpVWp,cplhhhhcVWpVWp,cplhhhhhh,cplhhhhhhhh,         & 
& cplhhhhHpcHp,cplhhhhVZVZ,cplhhHpcHp,cplhhHpcVWp,cplhhVZVZ,cplHpcHpcVWpVWp,             & 
& cplHpcHpVP,cplHpcHpVPVP,cplHpcHpVZ,cplHpcHpVZVZ,cplHpcVWpVP,cplHpcVWpVZ,               & 
& cplHpHpcHpcHp,cplUChiFeetpL(3,3),cplUChiFeetpR(3,3),cplUChiFvetIL(3,3),cplUChiFvetIR(3,3),& 
& cplUChiFvetRL(3,3),cplUChiFvetRR(3,3),cplUFvFeHpL(3,3),cplUFvFeHpR(3,3)

Complex(dp) :: cplUFvFeVWpL(3,3),cplUFvFeVWpR(3,3),cplUFvFvVZL(3,3),cplUFvFvVZR(3,3)

Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1, j2, j3, j4, il, i_count, ierr 
Complex(dp) :: Tad1Loop(2), dmz2  
Real(dp) :: comp(1), tanbQ, vev2
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopMasses' 
 
kont = 0 
 
Call TreeMasses(MAh,MAh2,MChi,MChi2,MetI,MetI2,Metp,Metp2,MetR,MetR2,MFd,             & 
& MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,              & 
& ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZW,ZX,ZZ,v,g1,g2,g3,lam1,lam2,lam4,lam3,lam5,               & 
& Yn,Yu,Yd,Ye,Mn,mH2,mEt2,GenerationMixing,kont)

mH2Tree  = mH2

 
 If (CalculateOneLoopMasses) Then 
 
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

Call Pi1LoopVZ(mZ2,Mhh,Mhh2,MAh,MAh2,MetR,MetR2,MetI,MetI2,Metp,Metp2,MFd,            & 
& MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MHp,MHp2,MVWp,MVWp2,cplAhhhVZ,cpletIetRVZ,    & 
& cpletpcetpVZ,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,              & 
& cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcgWpgWpVZ,cplcgWCgWCVZ,cplhhVZVZ,cplHpcHpVZ,      & 
& cplHpcVWpVZ,cplcVWpVWpVZ,cplAhAhVZVZ,cpletIetIVZVZ,cpletpcetpVZVZ,cpletRetRVZVZ,       & 
& cplhhhhVZVZ,cplHpcHpVZVZ,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,              & 
& kont,dmZ2)

vev2=4._dp*Real(mZ2+dmz2,dp)/(g1**2+g2**2) -0 
v= sqrt(vev2)
Call SolveTadpoleEquations(g1,g2,g3,lam1,lam2,lam4,lam3,lam5,Yn,Yu,Yd,Ye,             & 
& Mn,mH2,mEt2,v,(/ ZeroC, ZeroC /))

Call TreeMasses(MAh,MAh2,MChi,MChi2,MetI,MetI2,Metp,Metp2,MetR,MetR2,MFd,             & 
& MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,              & 
& ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZW,ZX,ZZ,v,g1,g2,g3,lam1,lam2,lam4,lam3,lam5,               & 
& Yn,Yu,Yd,Ye,Mn,mH2,mEt2,GenerationMixing,kont)

Call CouplingsForLoopMasses(Yn,UV,ZEL,ZX,Ye,ZER,g2,g1,TW,Yd,ZDL,ZDR,g3,               & 
& Yu,ZUL,ZUR,lam4,lam5,v,lam1,lam3,lam2,cplUChiFvetIL,cplUChiFvetIR,cplUChiFeetpL,       & 
& cplUChiFeetpR,cplUChiFvetRL,cplUChiFvetRR,cplChiUFvetIL,cplChiUFvetIR,cplChiUFvetRL,   & 
& cplChiUFvetRR,cplUFvFeHpL,cplUFvFeHpR,cplUFvFeVWpL,cplUFvFeVWpR,cplUFvFvVZL,           & 
& cplUFvFvVZR,cplcUFdFdAhL,cplcUFdFdAhR,cplcUFdFdhhL,cplcUFdFdhhR,cplcUFdFdVGL,          & 
& cplcUFdFdVGR,cplcUFdFdVPL,cplcUFdFdVPR,cplcUFdFdVZL,cplcUFdFdVZR,cplcUFdFucHpL,        & 
& cplcUFdFucHpR,cplcUFdFucVWpL,cplcUFdFucVWpR,cplcUFuFuAhL,cplcUFuFuAhR,cplcUFuFdHpL,    & 
& cplcUFuFdHpR,cplcUFuFdVWpL,cplcUFuFdVWpR,cplcUFuFuhhL,cplcUFuFuhhR,cplcUFuFuVGL,       & 
& cplcUFuFuVGR,cplcUFuFuVPL,cplcUFuFuVPR,cplcUFuFuVZL,cplcUFuFuVZR,cplcUFeFeAhL,         & 
& cplcUFeFeAhR,cplcUFeChicetpL,cplcUFeChicetpR,cplcUFeFehhL,cplcUFeFehhR,cplcUFeFeVPL,   & 
& cplcUFeFeVPR,cplcUFeFeVZL,cplcUFeFeVZR,cplcUFeFvcHpL,cplcUFeFvcHpR,cplcUFeFvcVWpL,     & 
& cplcUFeFvcVWpR,cplAhcHpVWp,cpletIetpcHp,cpletpetRcHp,cplcFdFucHpL,cplcFdFucHpR,        & 
& cplcFeFvcHpL,cplcFeFvcHpR,cplcgZgWpcHp,cplcgWpgZHp,cplcgWCgZcHp,cplcgZgWCHp,           & 
& cplhhHpcHp,cplhhcHpVWp,cplHpcHpVP,cplHpcHpVZ,cplcHpVPVWp,cplcHpVWpVZ,cplAhAhHpcHp,     & 
& cpletIetIHpcHp,cpletpHpcetpcHp,cpletRetRHpcHp,cplhhhhHpcHp,cplHpHpcHpcHp,              & 
& cplHpcHpVPVP,cplHpcHpcVWpVWp,cplHpcHpVZVZ,cplcFeChicetpL,cplcFeChicetpR,               & 
& cpletIHpcetp,cpletIcetpVWp,cpletphhcetp,cpletpcetpVP,cpletpcetpVZ,cpletRHpcetp,        & 
& cpletRcetpVWp,cplAhAhetpcetp,cpletIetIetpcetp,cpletpetpcetpcetp,cpletpetRetRcetp,      & 
& cpletphhhhcetp,cpletpcetpVPVP,cpletpcetpcVWpVWp,cpletpcetpVZVZ,cplAhAhhh,              & 
& cplAhetIetR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,               & 
& cplcFuFuAhR,cplcgWpgWpAh,cplcgWCgWCAh,cplAhhhVZ,cplAhHpcVWp,cplAhAhAhAh,               & 
& cplAhAhetIetI,cplAhAhetRetR,cplAhAhhhhh,cplAhAhcVWpVWp,cplAhAhVZVZ,cpletIetIhh,        & 
& cpletRetRhh,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,               & 
& cplcFuFuhhR,cplcgWpgWphh,cplcgWCgWChh,cplcgZgZhh,cplhhhhhh,cplhhHpcVWp,cplhhcVWpVWp,   & 
& cplhhVZVZ,cpletIetIhhhh,cpletRetRhhhh,cplhhhhhhhh,cplhhhhcVWpVWp,cplhhhhVZVZ,          & 
& cplChiFvetIL,cplChiFvetIR,cpletIetpcVWp,cpletIetRVZ,cpletIetIetIetI,cpletIetIetRetR,   & 
& cpletIetIcVWpVWp,cpletIetIVZVZ,cplChiFvetRL,cplChiFvetRR,cpletpetRcVWp,cpletRetRetRetR,& 
& cpletRetRcVWpVWp,cpletRetRVZVZ,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,        & 
& cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcgWpgWpVZ,cplcgWCgWCVZ,               & 
& cplHpcVWpVZ,cplcVWpVWpVZ,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,              & 
& cplcFdFucVWpL,cplcFdFucVWpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplcgWCgAcVWp,cplcgAgWpcVWp,   & 
& cplcgZgWpcVWp,cplcgWCgZcVWp,cplHpcVWpVP,cplcVWpVPVWp,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,  & 
& cplcVWpVPVPVWp3,cplcVWpcVWpVWpVWp1,cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3)

Call OneLoopTadpoleshh(v,MAh,MAh2,MetI,MetI2,Metp,Metp2,MetR,MetR2,MFd,               & 
& MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,cplAhAhhh,cpletIetIhh,    & 
& cpletphhcetp,cpletRetRhh,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,              & 
& cplcFuFuhhL,cplcFuFuhhR,cplcgWpgWphh,cplcgWCgWChh,cplcgZgZhh,cplhhhhhh,cplhhHpcHp,     & 
& cplhhcVWpVWp,cplhhVZVZ,Tad1Loop(1:1))

mH2Tree  = mH2
Call OneLoopChi(Mn,MFv,MFv2,MetI,MetI2,MFe,MFe2,Metp,Metp2,MetR,MetR2,cplUChiFvetIL,  & 
& cplUChiFvetIR,cplUChiFeetpL,cplUChiFeetpR,cplUChiFvetRL,cplUChiFvetRR,0.1_dp*delta_mass,& 
& MChi_1L,MChi2_1L,ZX_1L,kont)

Call OneLoopFv(MetI,MetI2,MChi,MChi2,MetR,MetR2,MHp,MHp2,MFe,MFe2,MVWp,               & 
& MVWp2,MVZ,MVZ2,MFv,MFv2,cplChiUFvetIL,cplChiUFvetIR,cplChiUFvetRL,cplChiUFvetRR,       & 
& cplUFvFeHpL,cplUFvFeHpR,cplUFvFeVWpL,cplUFvFeVWpR,cplUFvFvVZL,cplUFvFvVZR,             & 
& 0.1_dp*delta_mass,MFv_1L,MFv2_1L,UV_1L,kont)

Call OneLoopHp(g2,mH2,lam1,v,MVWp,MVWp2,MAh,MAh2,Metp,Metp2,MetI,MetI2,               & 
& MetR,MetR2,MFd,MFd2,MFu,MFu2,MFe,MFe2,MFv,MFv2,MHp,MHp2,Mhh,Mhh2,MVZ,MVZ2,             & 
& cplAhcHpVWp,cpletIetpcHp,cpletpetRcHp,cplcFdFucHpL,cplcFdFucHpR,cplcFeFvcHpL,          & 
& cplcFeFvcHpR,cplcgZgWpcHp,cplcgWpgZHp,cplcgWCgZcHp,cplcgZgWCHp,cplhhHpcHp,             & 
& cplhhcHpVWp,cplHpcHpVP,cplHpcHpVZ,cplcHpVPVWp,cplcHpVWpVZ,cplAhAhHpcHp,cpletIetIHpcHp, & 
& cpletpHpcetpcHp,cpletRetRHpcHp,cplhhhhHpcHp,cplHpHpcHpcHp,cplHpcHpVPVP,cplHpcHpcVWpVWp,& 
& cplHpcHpVZVZ,0.1_dp*delta_mass,MHp_1L,MHp2_1L,kont)

Call OneLoopetp(mEt2,lam3,v,MFe,MFe2,MChi,MChi2,MHp,MHp2,MetI,MetI2,MVWp,             & 
& MVWp2,Mhh,Mhh2,Metp,Metp2,MVZ,MVZ2,MetR,MetR2,MAh,MAh2,cplcFeChicetpL,cplcFeChicetpR,  & 
& cpletIHpcetp,cpletIcetpVWp,cpletphhcetp,cpletpcetpVP,cpletpcetpVZ,cpletRHpcetp,        & 
& cpletRcetpVWp,cplAhAhetpcetp,cpletIetIetpcetp,cpletpetpcetpcetp,cpletpetRetRcetp,      & 
& cpletphhhhcetp,cpletpHpcetpcHp,cpletpcetpVPVP,cpletpcetpcVWpVWp,cpletpcetpVZVZ,        & 
& 0.1_dp*delta_mass,Metp_1L,Metp2_1L,kont)

Call OneLoopAh(g1,g2,mH2,lam1,v,TW,Mhh,Mhh2,MAh,MAh2,MetR,MetR2,MetI,MetI2,           & 
& MFd,MFd2,MFe,MFe2,MFu,MFu2,MVZ,MVZ2,MVWp,MVWp2,MHp,MHp2,Metp,Metp2,cplAhAhhh,          & 
& cplAhetIetR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,               & 
& cplcFuFuAhR,cplcgWpgWpAh,cplcgWCgWCAh,cplAhhhVZ,cplAhHpcVWp,cplAhAhAhAh,               & 
& cplAhAhetIetI,cplAhAhetpcetp,cplAhAhetRetR,cplAhAhhhhh,cplAhAhHpcHp,cplAhAhcVWpVWp,    & 
& cplAhAhVZVZ,0.1_dp*delta_mass,MAh_1L,MAh2_1L,kont)

Call OneLoophh(mH2,lam1,v,MAh,MAh2,MVZ,MVZ2,MetI,MetI2,Metp,Metp2,MetR,               & 
& MetR2,MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,cplAhAhhh,               & 
& cplAhhhVZ,cpletIetIhh,cpletphhcetp,cpletRetRhh,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,    & 
& cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcgWpgWphh,cplcgWCgWChh,cplcgZgZhh,              & 
& cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhcVWpVWp,cplhhVZVZ,cplAhAhhhhh,cpletIetIhhhh,     & 
& cpletphhhhcetp,cpletRetRhhhh,cplhhhhhhhh,cplhhhhHpcHp,cplhhhhcVWpVWp,cplhhhhVZVZ,      & 
& 0.1_dp*delta_mass,Mhh_1L,Mhh2_1L,kont)

Call OneLoopetI(mEt2,lam4,lam3,lam5,v,MetR,MetR2,MAh,MAh2,MFv,MFv2,MChi,              & 
& MChi2,Mhh,Mhh2,MetI,MetI2,MHp,MHp2,Metp,Metp2,MVWp,MVWp2,MVZ,MVZ2,cplAhetIetR,         & 
& cplChiFvetIL,cplChiFvetIR,cpletIetIhh,cpletIetpcHp,cpletIetpcVWp,cpletIetRVZ,          & 
& cplAhAhetIetI,cpletIetIetIetI,cpletIetIetpcetp,cpletIetIetRetR,cpletIetIhhhh,          & 
& cpletIetIHpcHp,cpletIetIcVWpVWp,cpletIetIVZVZ,0.1_dp*delta_mass,MetI_1L,               & 
& MetI2_1L,kont)

Call OneLoopetR(mEt2,lam4,lam3,lam5,v,MetI,MetI2,MAh,MAh2,MFv,MFv2,MChi,              & 
& MChi2,MVZ,MVZ2,MHp,MHp2,Metp,Metp2,MVWp,MVWp2,Mhh,Mhh2,MetR,MetR2,cplAhetIetR,         & 
& cplChiFvetRL,cplChiFvetRR,cpletIetRVZ,cpletpetRcHp,cpletpetRcVWp,cpletRetRhh,          & 
& cplAhAhetRetR,cpletIetIetRetR,cpletpetRetRcetp,cpletRetRetRetR,cpletRetRhhhh,          & 
& cpletRetRHpcHp,cpletRetRcVWpVWp,cpletRetRVZVZ,0.1_dp*delta_mass,MetR_1L,               & 
& MetR2_1L,kont)

MChi = MChi_1L 
MChi2 = MChi2_1L 
ZX = ZX_1L 
MFv = MFv_1L 
MFv2 = MFv2_1L 
UV = UV_1L 
MHp = MHp_1L 
MHp2 = MHp2_1L 
Metp = Metp_1L 
Metp2 = Metp2_1L 
MAh = MAh_1L 
MAh2 = MAh2_1L 
Mhh = Mhh_1L 
Mhh2 = Mhh2_1L 
MetI = MetI_1L 
MetI2 = MetI2_1L 
MetR = MetR_1L 
MetR2 = MetR2_1L 
End If 
 
Call SortGoldstones(MAh,MAh2,MChi,MChi2,MetI,MetI2,Metp,Metp2,MetR,MetR2,             & 
& MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,             & 
& TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZW,ZX,ZZ,kont)

! Set pole masses 
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
! Shift Everything to t'Hooft Gauge
MAh=MVZ
MAh2=MVZ2
MHp=MVWp
MHp2=MVWp2
mf_u2 = mf_u**2 
mf_d2 = mf_d**2 
mf_l2 = mf_l**2 
 

 If (WriteTreeLevelTadpoleSolutions) Then 
! Saving tree-level parameters for output
mH2  = mH2Tree 
End if 


Iname = Iname -1 
End Subroutine OneLoopMasses 
 
Subroutine OneLoopTadpoleshh(v,MAh,MAh2,MetI,MetI2,Metp,Metp2,MetR,MetR2,             & 
& MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,cplAhAhhh,            & 
& cpletIetIhh,cpletphhcetp,cpletRetRhh,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,              & 
& cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcgWpgWphh,cplcgWCgWChh,cplcgZgZhh,              & 
& cplhhhhhh,cplhhHpcHp,cplhhcVWpVWp,cplhhVZVZ,tadpoles)

Implicit None 
Real(dp), Intent(in) :: MAh,MAh2,MetI,MetI2,Metp,Metp2,MetR,MetR2,MFd(3),MFd2(3),MFe(3),MFe2(3),              & 
& MFu(3),MFu2(3),Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh,cpletIetIhh,cpletphhcetp,cpletRetRhh,cplcFdFdhhL(3,3),cplcFdFdhhR(3,3),     & 
& cplcFeFehhL(3,3),cplcFeFehhR(3,3),cplcFuFuhhL(3,3),cplcFuFuhhR(3,3),cplcgWpgWphh,      & 
& cplcgWCgWChh,cplcgZgZhh,cplhhhhhh,cplhhHpcHp,cplhhcVWpVWp,cplhhVZVZ

Real(dp), Intent(in) :: v

Integer :: i1,i2, gO1, gO2 
Complex(dp) :: coupL, coupR, coup, temp, res, A0m, sumI(1)  
Real(dp) :: m1 
Complex(dp), Intent(out) :: tadpoles(1) 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopTadpoleshh'
 
tadpoles = 0._dp 
 
!------------------------ 
! Ah 
!------------------------ 
A0m = A0(MAh2) 
  Do gO1 = 1, 1
   coup = cplAhAhhh
   sumI(gO1) = -coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp/2._dp*sumI 
!------------------------ 
! etI 
!------------------------ 
A0m = A0(MetI2) 
  Do gO1 = 1, 1
   coup = cpletIetIhh
   sumI(gO1) = -coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp/2._dp*sumI 
!------------------------ 
! conj[etp] 
!------------------------ 
A0m = A0(Metp2) 
  Do gO1 = 1, 1
   coup = cpletphhcetp
   sumI(gO1) = -coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp*sumI 
!------------------------ 
! etR 
!------------------------ 
A0m = A0(MetR2) 
  Do gO1 = 1, 1
   coup = cpletRetRhh
   sumI(gO1) = -coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp/2._dp*sumI 
!------------------------ 
! bar[Fd] 
!------------------------ 
Do i1 = 1, 3
 A0m = 2._dp*MFd(i1)*A0(MFd2(i1)) 
  Do gO1 = 1, 1
   coupL = cplcFdFdhhL(i1,i1)
   coupR = cplcFdFdhhR(i1,i1)
   sumI(gO1) = (coupL+coupR)*A0m 
  End Do 
 
tadpoles =  tadpoles + 3._dp*sumI 
End Do 
 !------------------------ 
! bar[Fe] 
!------------------------ 
Do i1 = 1, 3
 A0m = 2._dp*MFe(i1)*A0(MFe2(i1)) 
  Do gO1 = 1, 1
   coupL = cplcFeFehhL(i1,i1)
   coupR = cplcFeFehhR(i1,i1)
   sumI(gO1) = (coupL+coupR)*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp*sumI 
End Do 
 !------------------------ 
! bar[Fu] 
!------------------------ 
Do i1 = 1, 3
 A0m = 2._dp*MFu(i1)*A0(MFu2(i1)) 
  Do gO1 = 1, 1
   coupL = cplcFuFuhhL(i1,i1)
   coupR = cplcFuFuhhR(i1,i1)
   sumI(gO1) = (coupL+coupR)*A0m 
  End Do 
 
tadpoles =  tadpoles + 3._dp*sumI 
End Do 
 !------------------------ 
! bar[gWp] 
!------------------------ 
A0m = 1._dp*A0(MVWp2) 
  Do gO1 = 1, 1
    coup = cplcgWpgWphh
    sumI(gO1) = coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp*sumI 
!------------------------ 
! bar[gWpC] 
!------------------------ 
A0m = 1._dp*A0(MVWp2) 
  Do gO1 = 1, 1
    coup = cplcgWCgWChh
    sumI(gO1) = coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp*sumI 
!------------------------ 
! bar[gZ] 
!------------------------ 
A0m = 1._dp*A0(MVZ2) 
  Do gO1 = 1, 1
    coup = cplcgZgZhh
    sumI(gO1) = coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp*sumI 
!------------------------ 
! hh 
!------------------------ 
A0m = A0(Mhh2) 
  Do gO1 = 1, 1
   coup = cplhhhhhh
   sumI(gO1) = -coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp/2._dp*sumI 
!------------------------ 
! conj[Hp] 
!------------------------ 
A0m = A0(MHp2) 
  Do gO1 = 1, 1
   coup = cplhhHpcHp
   sumI(gO1) = -coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp*sumI 
!------------------------ 
! conj[VWp] 
!------------------------ 
A0m = 4._dp*(A0(MVWp2) - 0.5_dp*MVWp2*rMS) 
  Do gO1 = 1, 1
    coup = cplhhcVWpVWp
    sumI(gO1) = coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp*sumI 
!------------------------ 
! VZ 
!------------------------ 
A0m = 4._dp*(A0(MVZ2) - 0.5_dp*MVZ2*rMS) 
  Do gO1 = 1, 1
    coup = cplhhVZVZ
    sumI(gO1) = coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp/2._dp*sumI 



tadpoles = oo16pi2*tadpoles 
Iname = Iname - 1 
End Subroutine OneLoopTadpoleshh 
 
Subroutine OneLoopChi(Mn,MFv,MFv2,MetI,MetI2,MFe,MFe2,Metp,Metp2,MetR,MetR2,          & 
& cplUChiFvetIL,cplUChiFvetIR,cplUChiFeetpL,cplUChiFeetpR,cplUChiFvetRL,cplUChiFvetRR,   & 
& delta,MChi_1L,MChi2_1L,ZX_1L,ierr)

Implicit None 
Real(dp), Intent(in) :: MFv(3),MFv2(3),MetI,MetI2,MFe(3),MFe2(3),Metp,Metp2,MetR,MetR2

Complex(dp), Intent(in) :: Mn(3,3)

Complex(dp), Intent(in) :: cplUChiFvetIL(3,3),cplUChiFvetIR(3,3),cplUChiFeetpL(3,3),cplUChiFeetpR(3,3),          & 
& cplUChiFvetRL(3,3),cplUChiFvetRR(3,3)

Complex(dp) :: mat1a(3,3), mat1(3,3), mat2(3,3) 
Integer , Intent(inout):: ierr 
Integer :: i1,i2,i3,i4,j1, j2,j3,j4,il,i_count 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi2(3), test_m2(3),p2 
Real(dp), Intent(out) :: MChi_1L(3),MChi2_1L(3) 
Complex(dp), Intent(out) ::  ZX_1L(3,3) 
Real(dp) :: MChi_t(3),MChi2_t(3) 
Complex(dp) ::  ZX_t(3,3) 
Complex(dp) ::  phaseM, E3(3), sigL(3,3), sigR(3,3), sigS(3,3) 
Real(dp) :: ZXa(3,3), test(2), eig(3) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopMChi'
 
mat1a(1,1) = 0._dp 
mat1a(1,1) = mat1a(1,1)-Mn(1,1)
mat1a(1,2) = 0._dp 
mat1a(1,2) = mat1a(1,2)-Mn(1,2)/2._dp
mat1a(1,2) = mat1a(1,2)-Mn(2,1)/2._dp
mat1a(1,3) = 0._dp 
mat1a(1,3) = mat1a(1,3)-Mn(1,3)/2._dp
mat1a(1,3) = mat1a(1,3)-Mn(3,1)/2._dp
mat1a(2,1) = 0._dp 
mat1a(2,1) = mat1a(2,1)-Mn(1,2)/2._dp
mat1a(2,1) = mat1a(2,1)-Mn(2,1)/2._dp
mat1a(2,2) = 0._dp 
mat1a(2,2) = mat1a(2,2)-Mn(2,2)
mat1a(2,3) = 0._dp 
mat1a(2,3) = mat1a(2,3)-Mn(2,3)/2._dp
mat1a(2,3) = mat1a(2,3)-Mn(3,2)/2._dp
mat1a(3,1) = 0._dp 
mat1a(3,1) = mat1a(3,1)-Mn(1,3)/2._dp
mat1a(3,1) = mat1a(3,1)-Mn(3,1)/2._dp
mat1a(3,2) = 0._dp 
mat1a(3,2) = mat1a(3,2)-Mn(2,3)/2._dp
mat1a(3,2) = mat1a(3,2)-Mn(3,2)/2._dp
mat1a(3,3) = 0._dp 
mat1a(3,3) = mat1a(3,3)-Mn(3,3)

 
 Do il=3,1,-1
sigL=0._dp 
sigR=0._dp 
sigS=0._dp 
p2 = MChi2(il)
Call Sigma1LoopChi(p2,MFv,MFv2,MetI,MetI2,MFe,MFe2,Metp,Metp2,MetR,MetR2,             & 
& cplUChiFvetIL,cplUChiFvetIR,cplUChiFeetpL,cplUChiFeetpR,cplUChiFvetRL,cplUChiFvetRR,   & 
& sigL,sigR,sigS)

mat1 = mat1a - 0.5_dp*(SigS + Transpose(SigS) + & 
      & MatMul(Transpose(SigL),mat1a) + MatMul(SigR,mat1a) + & 
      & MatMul(mat1a,Transpose(SigR)) + MatMul(mat1a,SigL)) 
 
If (ForceRealMatrices) mat1 = Real(mat1,dp) 
If (Maxval(Abs(Aimag(mat1))).Eq.0._dp) Then 
Call EigenSystem(Real(mat1,dp),Eig,ZXa,ierr,test) 
 
   Do i1=1,3
   If (Eig(i1).Lt.0._dp) Then 
    MChi_t(i1) = - Eig(i1) 
    ZX_1L(i1,:) = (0._dp,1._dp)*ZXa(i1,:) 
   Else 
    MChi_t(i1) = Eig(i1) 
    ZX_1L(i1,:) = ZXa(i1,:)
    End If 
   End Do 
 
Do i1=1,2
  Do i2=i1+1,3
    If (Abs(MChi_t(i1)).Gt.Abs(MChi_t(i2))) Then 
      Eig(1) = MChi_t(i1) 
      MChi_t(i1) = MChi_t(i2) 
      MChi_t(i2) = Eig(1) 
      E3 = ZX_1L(i1,:) 
      ZX_1L(i1,:) = ZX_1L(i2,:) 
      ZX_1L(i2,:) = E3
    End If 
   End Do 
End Do 
 
MChi_1L(iL) = MChi_t(iL) 
MChi2_1L(iL) = MChi_t(iL)**2 
Else 
 
mat2 = Matmul( Transpose(Conjg( mat1) ), mat1 ) 
Call Eigensystem(mat2, Eig, ZX_1L, ierr, test) 
mat2 = Matmul( Conjg(ZX_1L), Matmul( mat1, Transpose( Conjg(ZX_1L)))) 
Do i1=1,3
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
  phaseM = Sqrt( mat2(i1,i1) / Abs(mat2(i1,i1))) 
  ZX_1L(i1,:)= phaseM * ZX_1L(i1,:) 
End if 
  If (Eig(i1).Le.0._dp) Then 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,Eig(i1) 
      Write(*,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(*,*) 'a mass squarred is negative: ',i1,Eig(i1) 
      Call TerminateProgram 
    End If 
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,Eig(i1) 
  Eig(i1) = 1._dp 
   SignOfMassChanged = .True. 
 End if 
End Do 
MChi_1L = Sqrt( Eig ) 
 
MChi2_1L = Eig 
 
End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
!---------------------------------------- 
! Redoing Calculation using redefined p2 
!----------------------------------------- 
 
i_count = 0 
p2_loop: Do  
i_count = i_count + 1 
sigL=0._dp 
sigR=0._dp 
sigS=0._dp 
p2 = MChi2_1L(iL)
Call Sigma1LoopChi(p2,MFv,MFv2,MetI,MetI2,MFe,MFe2,Metp,Metp2,MetR,MetR2,             & 
& cplUChiFvetIL,cplUChiFvetIR,cplUChiFeetpL,cplUChiFeetpR,cplUChiFvetRL,cplUChiFvetRR,   & 
& sigL,sigR,sigS)

mat1 = mat1a - 0.5_dp*(SigS + Transpose(SigS) + & 
      & MatMul(Transpose(SigL),mat1a) + MatMul(SigR,mat1a) + & 
      & MatMul(mat1a,Transpose(SigR)) + MatMul(mat1a,SigL)) 
 
If (ForceRealMatrices) mat1 = Real(mat1,dp) 
If (Maxval(Abs(Aimag(mat1))).Eq.0._dp) Then 
Call EigenSystem(Real(mat1,dp),Eig,ZXa,ierr,test) 
 
   Do i1=1,3
   If (Eig(i1).Lt.0._dp) Then 
    MChi_t(i1) = - Eig(i1) 
    ZX_1L(i1,:) = (0._dp,1._dp)*ZXa(i1,:) 
   Else 
    MChi_t(i1) = Eig(i1) 
    ZX_1L(i1,:) = ZXa(i1,:)
    End If 
   End Do 
 
Do i1=1,2
  Do i2=i1+1,3
    If (Abs(MChi_t(i1)).Gt.Abs(MChi_t(i2))) Then 
      Eig(1) = MChi_t(i1) 
      MChi_t(i1) = MChi_t(i2) 
      MChi_t(i2) = Eig(1) 
      E3 = ZX_1L(i1,:) 
      ZX_1L(i1,:) = ZX_1L(i2,:) 
      ZX_1L(i2,:) = E3
    End If 
   End Do 
End Do 
 
MChi_1L(iL) = MChi_t(iL) 
MChi2_1L(iL) = MChi_t(iL)**2 
Else 
 
mat2 = Matmul( Transpose(Conjg( mat1) ), mat1 ) 
Call Eigensystem(mat2, Eig, ZX_1L, ierr, test) 
mat2 = Matmul( Conjg(ZX_1L), Matmul( mat1, Transpose( Conjg(ZX_1L)))) 
Do i1=1,3
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
  phaseM = Sqrt( mat2(i1,i1) / Abs(mat2(i1,i1))) 
  ZX_1L(i1,:)= phaseM * ZX_1L(i1,:) 
End if 
  If (Eig(i1).Le.0._dp) Then 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,Eig(i1) 
      Write(*,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(*,*) 'a mass squarred is negative: ',i1,Eig(i1) 
      Call TerminateProgram 
    End If 
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,Eig(i1) 
  Eig(i1) = 1._dp 
   SignOfMassChanged = .True. 
 End if 
End Do 
MChi_1L = Sqrt( Eig ) 
 
MChi2_1L = Eig 
 
End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
If (p2.Ne.0._dp) Then 
  test(1) = Abs(MChi2_1L(il)-p2)/p2
Else 
  test(2) = Abs(MChi2_1L(il))
End If 
If (Abs(MChi2_1L(il)).lt.1.0E-30_dp) Exit p2_loop 
If (test(1).lt.0.1_dp*delta) Exit p2_loop 
If(i_count.gt.30) then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Exit p2_loop 
End if
End Do p2_loop 
End Do 
 
Iname = Iname -1 
End Subroutine OneLoopChi
 
 
Subroutine Sigma1LoopChi(p2,MFv,MFv2,MetI,MetI2,MFe,MFe2,Metp,Metp2,MetR,             & 
& MetR2,cplUChiFvetIL,cplUChiFvetIR,cplUChiFeetpL,cplUChiFeetpR,cplUChiFvetRL,           & 
& cplUChiFvetRR,sigL,sigR,sigS)

Implicit None 
Real(dp), Intent(in) :: MFv(3),MFv2(3),MetI,MetI2,MFe(3),MFe2(3),Metp,Metp2,MetR,MetR2

Complex(dp), Intent(in) :: cplUChiFvetIL(3,3),cplUChiFvetIR(3,3),cplUChiFeetpL(3,3),cplUChiFeetpR(3,3),          & 
& cplUChiFvetRL(3,3),cplUChiFvetRR(3,3)

Complex(dp), Intent(out) :: SigL(3,3),SigR(3,3), SigS(3,3) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumL(3,3), sumR(3,3), sumS(3,3) 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
SigL = Cmplx(0._dp,0._dp,dp) 
SigR = Cmplx(0._dp,0._dp,dp) 
SigS = Cmplx(0._dp,0._dp,dp) 
 
!------------------------ 
! Fv, etI 
!------------------------ 
    Do i1 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -1._dp*B1(p2,MFv2(i1),MetI2) 
B0m2 = 2._dp*MFv(i1)*B0(p2,MFv2(i1),MetI2) 
coupL1 = cplUChiFvetIL(gO1,i1)
coupR1 = cplUChiFvetIR(gO1,i1)
coupL2 =  Conjg(cplUChiFvetIL(gO2,i1))
coupR2 =  Conjg(cplUChiFvetIR(gO2,i1))
SumS(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigS = SigS +1._dp/2._dp* sumS 
      End Do 
 !------------------------ 
! Fe, etp 
!------------------------ 
    Do i1 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -1._dp*B1(p2,MFe2(i1),Metp2) 
B0m2 = 2._dp*MFe(i1)*B0(p2,MFe2(i1),Metp2) 
coupL1 = cplUChiFeetpL(gO1,i1)
coupR1 = cplUChiFeetpR(gO1,i1)
coupL2 =  Conjg(cplUChiFeetpL(gO2,i1))
coupR2 =  Conjg(cplUChiFeetpR(gO2,i1))
SumS(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
      End Do 
 !------------------------ 
! Fv, etR 
!------------------------ 
    Do i1 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -1._dp*B1(p2,MFv2(i1),MetR2) 
B0m2 = 2._dp*MFv(i1)*B0(p2,MFv2(i1),MetR2) 
coupL1 = cplUChiFvetRL(gO1,i1)
coupR1 = cplUChiFvetRR(gO1,i1)
coupL2 =  Conjg(cplUChiFvetRL(gO2,i1))
coupR2 =  Conjg(cplUChiFvetRR(gO2,i1))
SumS(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigS = SigS +1._dp/2._dp* sumS 
      End Do 
 

SigL = oo16pi2*SigL 
 
SigR = oo16pi2*SigR 
 
SigS = oo16pi2*SigS 
 
End Subroutine Sigma1LoopChi 
 
Subroutine OneLoopFv(MetI,MetI2,MChi,MChi2,MetR,MetR2,MHp,MHp2,MFe,MFe2,              & 
& MVWp,MVWp2,MVZ,MVZ2,MFv,MFv2,cplChiUFvetIL,cplChiUFvetIR,cplChiUFvetRL,cplChiUFvetRR,  & 
& cplUFvFeHpL,cplUFvFeHpR,cplUFvFeVWpL,cplUFvFeVWpR,cplUFvFvVZL,cplUFvFvVZR,             & 
& delta,MFv_1L,MFv2_1L,Vv_1L,ierr)

Implicit None 
Real(dp), Intent(in) :: MetI,MetI2,MChi(3),MChi2(3),MetR,MetR2,MHp,MHp2,MFe(3),MFe2(3),MVWp,MVWp2,            & 
& MVZ,MVZ2,MFv(3),MFv2(3)

Complex(dp), Intent(in) :: cplChiUFvetIL(3,3),cplChiUFvetIR(3,3),cplChiUFvetRL(3,3),cplChiUFvetRR(3,3),          & 
& cplUFvFeHpL(3,3),cplUFvFeHpR(3,3),cplUFvFeVWpL(3,3),cplUFvFeVWpR(3,3),cplUFvFvVZL(3,3),& 
& cplUFvFvVZR(3,3)

Complex(dp) :: mat1a(3,3), mat1(3,3), mat2(3,3) 
Integer , Intent(inout):: ierr 
Integer :: i1,i2,i3,i4,j1, j2,j3,j4,il,i_count 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi2(3), test_m2(3),p2 
Real(dp), Intent(out) :: MFv_1L(3),MFv2_1L(3) 
Complex(dp), Intent(out) ::  Vv_1L(3,3) 
Real(dp) :: MFv_t(3),MFv2_t(3) 
Complex(dp) ::  Vv_t(3,3) 
Complex(dp) ::  phaseM, E3(3), sigL(3,3), sigR(3,3), sigS(3,3) 
Real(dp) :: Vva(3,3), test(2), eig(3) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopMFv'
 
mat1a(1,1) = 0._dp 
mat1a(1,2) = 0._dp 
mat1a(1,3) = 0._dp 
mat1a(2,1) = 0._dp 
mat1a(2,2) = 0._dp 
mat1a(2,3) = 0._dp 
mat1a(3,1) = 0._dp 
mat1a(3,2) = 0._dp 
mat1a(3,3) = 0._dp 

 
 Do il=3,1,-1
sigL=0._dp 
sigR=0._dp 
sigS=0._dp 
p2 = MFv2(il)
Call Sigma1LoopFv(p2,MetI,MetI2,MChi,MChi2,MetR,MetR2,MHp,MHp2,MFe,MFe2,              & 
& MVWp,MVWp2,MVZ,MVZ2,MFv,MFv2,cplChiUFvetIL,cplChiUFvetIR,cplChiUFvetRL,cplChiUFvetRR,  & 
& cplUFvFeHpL,cplUFvFeHpR,cplUFvFeVWpL,cplUFvFeVWpR,cplUFvFvVZL,cplUFvFvVZR,             & 
& sigL,sigR,sigS)

mat1 = mat1a - 0.5_dp*(SigS + Transpose(SigS) + & 
      & MatMul(Transpose(SigL),mat1a) + MatMul(SigR,mat1a) + & 
      & MatMul(mat1a,Transpose(SigR)) + MatMul(mat1a,SigL)) 
 
If (ForceRealMatrices) mat1 = Real(mat1,dp) 
If (Maxval(Abs(Aimag(mat1))).Eq.0._dp) Then 
Call EigenSystem(Real(mat1,dp),Eig,Vva,ierr,test) 
 
   Do i1=1,3
   If (Eig(i1).Lt.0._dp) Then 
    MFv_t(i1) = - Eig(i1) 
    Vv_1L(i1,:) = (0._dp,1._dp)*Vva(i1,:) 
   Else 
    MFv_t(i1) = Eig(i1) 
    Vv_1L(i1,:) = Vva(i1,:)
    End If 
   End Do 
 
Do i1=1,2
  Do i2=i1+1,3
    If (Abs(MFv_t(i1)).Gt.Abs(MFv_t(i2))) Then 
      Eig(1) = MFv_t(i1) 
      MFv_t(i1) = MFv_t(i2) 
      MFv_t(i2) = Eig(1) 
      E3 = Vv_1L(i1,:) 
      Vv_1L(i1,:) = Vv_1L(i2,:) 
      Vv_1L(i2,:) = E3
    End If 
   End Do 
End Do 
 
MFv_1L(iL) = MFv_t(iL) 
MFv2_1L(iL) = MFv_t(iL)**2 
Else 
 
mat2 = Matmul( Transpose(Conjg( mat1) ), mat1 ) 
Call Eigensystem(mat2, Eig, Vv_1L, ierr, test) 
mat2 = Matmul( Conjg(Vv_1L), Matmul( mat1, Transpose( Conjg(Vv_1L)))) 
Do i1=1,3
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
  phaseM = Sqrt( mat2(i1,i1) / Abs(mat2(i1,i1))) 
  Vv_1L(i1,:)= phaseM * Vv_1L(i1,:) 
End if 
  If (Eig(i1).Le.0._dp) Then 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,Eig(i1) 
      Write(*,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(*,*) 'a mass squarred is negative: ',i1,Eig(i1) 
      Call TerminateProgram 
    End If 
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,Eig(i1) 
  Eig(i1) = 1._dp 
   SignOfMassChanged = .True. 
 End if 
End Do 
MFv_1L = Sqrt( Eig ) 
 
MFv2_1L = Eig 
 
End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
!---------------------------------------- 
! Redoing Calculation using redefined p2 
!----------------------------------------- 
 
i_count = 0 
p2_loop: Do  
i_count = i_count + 1 
sigL=0._dp 
sigR=0._dp 
sigS=0._dp 
p2 = MFv2_1L(iL)
Call Sigma1LoopFv(p2,MetI,MetI2,MChi,MChi2,MetR,MetR2,MHp,MHp2,MFe,MFe2,              & 
& MVWp,MVWp2,MVZ,MVZ2,MFv,MFv2,cplChiUFvetIL,cplChiUFvetIR,cplChiUFvetRL,cplChiUFvetRR,  & 
& cplUFvFeHpL,cplUFvFeHpR,cplUFvFeVWpL,cplUFvFeVWpR,cplUFvFvVZL,cplUFvFvVZR,             & 
& sigL,sigR,sigS)

mat1 = mat1a - 0.5_dp*(SigS + Transpose(SigS) + & 
      & MatMul(Transpose(SigL),mat1a) + MatMul(SigR,mat1a) + & 
      & MatMul(mat1a,Transpose(SigR)) + MatMul(mat1a,SigL)) 
 
If (ForceRealMatrices) mat1 = Real(mat1,dp) 
If (Maxval(Abs(Aimag(mat1))).Eq.0._dp) Then 
Call EigenSystem(Real(mat1,dp),Eig,Vva,ierr,test) 
 
   Do i1=1,3
   If (Eig(i1).Lt.0._dp) Then 
    MFv_t(i1) = - Eig(i1) 
    Vv_1L(i1,:) = (0._dp,1._dp)*Vva(i1,:) 
   Else 
    MFv_t(i1) = Eig(i1) 
    Vv_1L(i1,:) = Vva(i1,:)
    End If 
   End Do 
 
Do i1=1,2
  Do i2=i1+1,3
    If (Abs(MFv_t(i1)).Gt.Abs(MFv_t(i2))) Then 
      Eig(1) = MFv_t(i1) 
      MFv_t(i1) = MFv_t(i2) 
      MFv_t(i2) = Eig(1) 
      E3 = Vv_1L(i1,:) 
      Vv_1L(i1,:) = Vv_1L(i2,:) 
      Vv_1L(i2,:) = E3
    End If 
   End Do 
End Do 
 
MFv_1L(iL) = MFv_t(iL) 
MFv2_1L(iL) = MFv_t(iL)**2 
Else 
 
mat2 = Matmul( Transpose(Conjg( mat1) ), mat1 ) 
Call Eigensystem(mat2, Eig, Vv_1L, ierr, test) 
mat2 = Matmul( Conjg(Vv_1L), Matmul( mat1, Transpose( Conjg(Vv_1L)))) 
Do i1=1,3
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
  phaseM = Sqrt( mat2(i1,i1) / Abs(mat2(i1,i1))) 
  Vv_1L(i1,:)= phaseM * Vv_1L(i1,:) 
End if 
  If (Eig(i1).Le.0._dp) Then 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,Eig(i1) 
      Write(*,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(*,*) 'a mass squarred is negative: ',i1,Eig(i1) 
      Call TerminateProgram 
    End If 
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,Eig(i1) 
  Eig(i1) = 1._dp 
   SignOfMassChanged = .True. 
 End if 
End Do 
MFv_1L = Sqrt( Eig ) 
 
MFv2_1L = Eig 
 
End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
If (p2.Ne.0._dp) Then 
  test(1) = Abs(MFv2_1L(il)-p2)/p2
Else 
  test(2) = Abs(MFv2_1L(il))
End If 
If (Abs(MFv2_1L(il)).lt.1.0E-30_dp) Exit p2_loop 
If (test(1).lt.0.1_dp*delta) Exit p2_loop 
If(i_count.gt.30) then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Exit p2_loop 
End if
End Do p2_loop 
End Do 
 
Iname = Iname -1 
End Subroutine OneLoopFv
 
 
Subroutine Sigma1LoopFv(p2,MetI,MetI2,MChi,MChi2,MetR,MetR2,MHp,MHp2,MFe,             & 
& MFe2,MVWp,MVWp2,MVZ,MVZ2,MFv,MFv2,cplChiUFvetIL,cplChiUFvetIR,cplChiUFvetRL,           & 
& cplChiUFvetRR,cplUFvFeHpL,cplUFvFeHpR,cplUFvFeVWpL,cplUFvFeVWpR,cplUFvFvVZL,           & 
& cplUFvFvVZR,sigL,sigR,sigS)

Implicit None 
Real(dp), Intent(in) :: MetI,MetI2,MChi(3),MChi2(3),MetR,MetR2,MHp,MHp2,MFe(3),MFe2(3),MVWp,MVWp2,            & 
& MVZ,MVZ2,MFv(3),MFv2(3)

Complex(dp), Intent(in) :: cplChiUFvetIL(3,3),cplChiUFvetIR(3,3),cplChiUFvetRL(3,3),cplChiUFvetRR(3,3),          & 
& cplUFvFeHpL(3,3),cplUFvFeHpR(3,3),cplUFvFeVWpL(3,3),cplUFvFeVWpR(3,3),cplUFvFvVZL(3,3),& 
& cplUFvFvVZR(3,3)

Complex(dp), Intent(out) :: SigL(3,3),SigR(3,3), SigS(3,3) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumL(3,3), sumR(3,3), sumS(3,3) 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
SigL = Cmplx(0._dp,0._dp,dp) 
SigR = Cmplx(0._dp,0._dp,dp) 
SigS = Cmplx(0._dp,0._dp,dp) 
 
!------------------------ 
! etI, Chi 
!------------------------ 
      Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -1._dp*B1(p2,MChi2(i2),MetI2) 
B0m2 = 2._dp*MChi(i2)*B0(p2,MChi2(i2),MetI2) 
coupL1 = cplChiUFvetIL(i2,gO1)
coupR1 = cplChiUFvetIR(i2,gO1)
coupL2 =  Conjg(cplChiUFvetIL(i2,gO2))
coupR2 =  Conjg(cplChiUFvetIR(i2,gO2))
SumS(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigS = SigS +1._dp/2._dp* sumS 
    End Do 
 !------------------------ 
! etR, Chi 
!------------------------ 
      Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -1._dp*B1(p2,MChi2(i2),MetR2) 
B0m2 = 2._dp*MChi(i2)*B0(p2,MChi2(i2),MetR2) 
coupL1 = cplChiUFvetRL(i2,gO1)
coupR1 = cplChiUFvetRR(i2,gO1)
coupL2 =  Conjg(cplChiUFvetRL(i2,gO2))
coupR2 =  Conjg(cplChiUFvetRR(i2,gO2))
SumS(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigS = SigS +1._dp/2._dp* sumS 
    End Do 
 !------------------------ 
! Hp, Fe 
!------------------------ 
      Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -1._dp*B1(p2,MFe2(i2),MHp2) 
B0m2 = 2._dp*MFe(i2)*B0(p2,MFe2(i2),MHp2) 
coupL1 = cplUFvFeHpL(gO1,i2)
coupR1 = cplUFvFeHpR(gO1,i2)
coupL2 =  Conjg(cplUFvFeHpL(gO2,i2))
coupR2 =  Conjg(cplUFvFeHpR(gO2,i2))
SumS(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
    End Do 
 !------------------------ 
! VWp, Fe 
!------------------------ 
      Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*B1(p2,MFe2(i2),MVWp2) 
B0m2 = -8._dp*MFe(i2)*(B0(p2,MFe2(i2),MVWp2) - 0.5_dp*rMS) 
coupL1 = cplUFvFeVWpL(gO1,i2)
coupR1 = cplUFvFeVWpR(gO1,i2)
coupL2 =  Conjg(cplUFvFeVWpL(gO2,i2))
coupR2 =  Conjg(cplUFvFeVWpR(gO2,i2))
SumS(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
    End Do 
 !------------------------ 
! VZ, Fv 
!------------------------ 
      Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*B1(p2,MFv2(i2),MVZ2) 
B0m2 = -8._dp*MFv(i2)*(B0(p2,MFv2(i2),MVZ2) - 0.5_dp*rMS) 
coupL1 = cplUFvFvVZL(gO1,i2)
coupR1 = cplUFvFvVZR(gO1,i2)
coupL2 =  Conjg(cplUFvFvVZL(gO2,i2))
coupR2 =  Conjg(cplUFvFvVZR(gO2,i2))
SumS(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigS = SigS +1._dp/2._dp* sumS 
    End Do 
 

SigL = oo16pi2*SigL 
 
SigR = oo16pi2*SigR 
 
SigS = oo16pi2*SigS 
 
End Subroutine Sigma1LoopFv 
 
Subroutine OneLoopFd(Yd,v,MFd,MFd2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MHp,MHp2,               & 
& MFu,MFu2,MVWp,MVWp2,cplcUFdFdAhL,cplcUFdFdAhR,cplcUFdFdhhL,cplcUFdFdhhR,               & 
& cplcUFdFdVGL,cplcUFdFdVGR,cplcUFdFdVPL,cplcUFdFdVPR,cplcUFdFdVZL,cplcUFdFdVZR,         & 
& cplcUFdFucHpL,cplcUFdFucHpR,cplcUFdFucVWpL,cplcUFdFucVWpR,delta,MFd_1L,MFd2_1L,        & 
& ZDL_1L,ZDR_1L,ierr)

Implicit None 
Real(dp), Intent(in) :: MFd(3),MFd2(3),MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MHp,MHp2,MFu(3),MFu2(3),MVWp,MVWp2

Real(dp), Intent(in) :: v

Complex(dp), Intent(in) :: Yd(3,3)

Complex(dp), Intent(in) :: cplcUFdFdAhL(3,3),cplcUFdFdAhR(3,3),cplcUFdFdhhL(3,3),cplcUFdFdhhR(3,3),              & 
& cplcUFdFdVGL(3,3),cplcUFdFdVGR(3,3),cplcUFdFdVPL(3,3),cplcUFdFdVPR(3,3),               & 
& cplcUFdFdVZL(3,3),cplcUFdFdVZR(3,3),cplcUFdFucHpL(3,3),cplcUFdFucHpR(3,3),             & 
& cplcUFdFucVWpL(3,3),cplcUFdFucVWpR(3,3)

Complex(dp) :: mat1a(3,3), mat1(3,3) 
Integer , Intent(inout):: ierr 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi2(3), test_m2(3), p2 
Real(dp), Intent(out) :: MFd_1L(3),MFd2_1L(3) 
 Complex(dp), Intent(out) :: ZDL_1L(3,3), ZDR_1L(3,3) 
 
 Real(dp) :: MFd_t(3),MFd2_t(3) 
 Complex(dp) :: ZDL_t(3,3), ZDR_t(3,3), sigL(3,3), sigR(3,3), sigS(3,3) 
 
 Complex(dp) :: mat(3,3)=0._dp, mat2(3,3)=0._dp, phaseM 

Complex(dp) :: ZDL2(3,3), ZDR2(3,3) 
 
 Real(dp) :: ZDL1(3,3), ZDR1(3,3), test(2) 
 
 Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopMFd'
 
mat1a(1,1) = 0._dp 
mat1a(1,1) = mat1a(1,1)-((v*Yd(1,1))/sqrt(2._dp))
mat1a(1,2) = 0._dp 
mat1a(1,2) = mat1a(1,2)-((v*Yd(2,1))/sqrt(2._dp))
mat1a(1,3) = 0._dp 
mat1a(1,3) = mat1a(1,3)-((v*Yd(3,1))/sqrt(2._dp))
mat1a(2,1) = 0._dp 
mat1a(2,1) = mat1a(2,1)-((v*Yd(1,2))/sqrt(2._dp))
mat1a(2,2) = 0._dp 
mat1a(2,2) = mat1a(2,2)-((v*Yd(2,2))/sqrt(2._dp))
mat1a(2,3) = 0._dp 
mat1a(2,3) = mat1a(2,3)-((v*Yd(3,2))/sqrt(2._dp))
mat1a(3,1) = 0._dp 
mat1a(3,1) = mat1a(3,1)-((v*Yd(1,3))/sqrt(2._dp))
mat1a(3,2) = 0._dp 
mat1a(3,2) = mat1a(3,2)-((v*Yd(2,3))/sqrt(2._dp))
mat1a(3,3) = 0._dp 
mat1a(3,3) = mat1a(3,3)-((v*Yd(3,3))/sqrt(2._dp))

 
 Do il=3,1,-1
sigL=0._dp 
sigR=0._dp 
sigS=0._dp 
p2 = MFd2(il) 
Call Sigma1LoopFd(p2,MFd,MFd2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MHp,MHp2,MFu,MFu2,           & 
& MVWp,MVWp2,cplcUFdFdAhL,cplcUFdFdAhR,cplcUFdFdhhL,cplcUFdFdhhR,cplcUFdFdVGL,           & 
& cplcUFdFdVGR,cplcUFdFdVPL,cplcUFdFdVPR,cplcUFdFdVZL,cplcUFdFdVZR,cplcUFdFucHpL,        & 
& cplcUFdFucHpR,cplcUFdFucVWpL,cplcUFdFucVWpR,sigL,sigR,sigS)

mat1 = mat1a - SigS - MatMul(SigR,mat1a) - MatMul(mat1a,SigL) 
 
mat2 = Matmul(Transpose(Conjg(mat1)),mat1) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFd2_t,ZDR1,ierr,test) 
ZDR2 = ZDR1 
Else 
Call EigenSystem(mat2,MFd2_t,ZDR2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
!---------------------------------------- 
! Redoing Calculation using redefined p2 
!----------------------------------------- 
 
i_count = 0 
p2_loop: Do  
i_count = i_count + 1 
sigL=0._dp 
sigR=0._dp 
sigS=0._dp 
p2 = MFd2_t(iL)
Call Sigma1LoopFd(p2,MFd,MFd2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MHp,MHp2,MFu,MFu2,           & 
& MVWp,MVWp2,cplcUFdFdAhL,cplcUFdFdAhR,cplcUFdFdhhL,cplcUFdFdhhR,cplcUFdFdVGL,           & 
& cplcUFdFdVGR,cplcUFdFdVPL,cplcUFdFdVPR,cplcUFdFdVZL,cplcUFdFdVZR,cplcUFdFucHpL,        & 
& cplcUFdFucHpR,cplcUFdFucVWpL,cplcUFdFucVWpR,sigL,sigR,sigS)

mat1 = mat1a - SigS - MatMul(SigR,mat1a) - MatMul(mat1a,SigL) 
 
mat2 = Matmul(Transpose(Conjg(mat1)),mat1) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFd2_t,ZDR1,ierr,test) 
ZDR2 = ZDR1 
Else 
Call EigenSystem(mat2,MFd2_t,ZDR2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
MFd2_1L(il) = MFd2_t(il) 
MFd_1L(il) = Sqrt(MFd2_1L(il)) 
 
If (p2.Ne.0._dp) Then 
  test(1) = Abs(MFd2_1L(il)-p2)/p2
Else 
  test(2) = Abs(MFd2_1L(il))
End If 
If (Abs(MFd2_1L(il)).lt.1.0E-30_dp) Exit p2_loop 
If (test(1).lt.0.1_dp*delta) Exit p2_loop 
If(i_count.gt.30) then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Exit p2_loop 
End if
End Do p2_loop 
mat2 = Matmul(mat1,Transpose(Conjg(mat1))) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFd2_t,ZDL1,ierr,test) 
 
 
ZDL2 = ZDL1 
Else 
Call EigenSystem(mat2,MFd2_t,ZDL2,ierr,test) 
 
 
End If 
ZDL2 = Conjg(ZDL2) 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
mat2 = Matmul(Matmul( Conjg(ZDL2),mat1),Transpose( Conjg(ZDR2))) 
Do i1=1,3
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
phaseM = mat2(i1,i1) / Abs(mat2(i1,i1)) 
ZDR2(i1,:) = phaseM *ZDR2(i1,:) 
 End if 
End Do 
 
ZDL_1L = ZDL2 
 ZDR_1L = ZDR2 
 End Do  
 
Iname = Iname -1 
End Subroutine OneLoopFd
 
 
Subroutine Sigma1LoopFd(p2,MFd,MFd2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MHp,MHp2,              & 
& MFu,MFu2,MVWp,MVWp2,cplcUFdFdAhL,cplcUFdFdAhR,cplcUFdFdhhL,cplcUFdFdhhR,               & 
& cplcUFdFdVGL,cplcUFdFdVGR,cplcUFdFdVPL,cplcUFdFdVPR,cplcUFdFdVZL,cplcUFdFdVZR,         & 
& cplcUFdFucHpL,cplcUFdFucHpR,cplcUFdFucVWpL,cplcUFdFucVWpR,sigL,sigR,sigS)

Implicit None 
Real(dp), Intent(in) :: MFd(3),MFd2(3),MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MHp,MHp2,MFu(3),MFu2(3),MVWp,MVWp2

Complex(dp), Intent(in) :: cplcUFdFdAhL(3,3),cplcUFdFdAhR(3,3),cplcUFdFdhhL(3,3),cplcUFdFdhhR(3,3),              & 
& cplcUFdFdVGL(3,3),cplcUFdFdVGR(3,3),cplcUFdFdVPL(3,3),cplcUFdFdVPR(3,3),               & 
& cplcUFdFdVZL(3,3),cplcUFdFdVZR(3,3),cplcUFdFucHpL(3,3),cplcUFdFucHpR(3,3),             & 
& cplcUFdFucVWpL(3,3),cplcUFdFucVWpR(3,3)

Complex(dp), Intent(out) :: SigL(3,3),SigR(3,3), SigS(3,3) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumL(3,3), sumR(3,3), sumS(3,3) 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
SigL = Cmplx(0._dp,0._dp,dp) 
SigR = Cmplx(0._dp,0._dp,dp) 
SigS = Cmplx(0._dp,0._dp,dp) 
 
!------------------------ 
! Fd, Ah 
!------------------------ 
    Do i1 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -0.5_dp*Real(B1(p2,MFd2(i1),MAh2),dp) 
B0m2 = MFd(i1)*Real(B0(p2,MFd2(i1),MAh2),dp) 
coupL1 = cplcUFdFdAhL(gO1,i1)
coupR1 = cplcUFdFdAhR(gO1,i1)
coupL2 =  Conjg(cplcUFdFdAhL(gO2,i1))
coupR2 =  Conjg(cplcUFdFdAhR(gO2,i1))
SumS(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
      End Do 
 !------------------------ 
! hh, Fd 
!------------------------ 
      Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -0.5_dp*Real(B1(p2,MFd2(i2),Mhh2),dp) 
B0m2 = MFd(i2)*Real(B0(p2,MFd2(i2),Mhh2),dp) 
coupL1 = cplcUFdFdhhL(gO1,i2)
coupR1 = cplcUFdFdhhR(gO1,i2)
coupL2 =  Conjg(cplcUFdFdhhL(gO2,i2))
coupR2 =  Conjg(cplcUFdFdhhR(gO2,i2))
SumS(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
    End Do 
 !------------------------ 
! VG, Fd 
!------------------------ 
      Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = - Real(B1(p2,MFd2(i2),0._dp),dp) 
B0m2 = -4._dp*MFd(i2)*Real(B0(p2,MFd2(i2),0._dp)-0.5_dp*rMS,dp) 
coupL1 = cplcUFdFdVGL(gO1,i2)
coupR1 = cplcUFdFdVGR(gO1,i2)
coupL2 =  Conjg(cplcUFdFdVGL(gO2,i2))
coupR2 =  Conjg(cplcUFdFdVGR(gO2,i2))
SumS(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +4._dp/3._dp* sumL
SigR = SigR +4._dp/3._dp* sumR 
SigS = SigS +4._dp/3._dp* sumS 
    End Do 
 !------------------------ 
! VP, Fd 
!------------------------ 
      Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = - Real(B1(p2,MFd2(i2),0._dp),dp) 
B0m2 = -4._dp*MFd(i2)*Real(B0(p2,MFd2(i2),0._dp)-0.5_dp*rMS,dp) 
coupL1 = cplcUFdFdVPL(gO1,i2)
coupR1 = cplcUFdFdVPR(gO1,i2)
coupL2 =  Conjg(cplcUFdFdVPL(gO2,i2))
coupR2 =  Conjg(cplcUFdFdVPR(gO2,i2))
SumS(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
    End Do 
 !------------------------ 
! VZ, Fd 
!------------------------ 
      Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = - Real(B1(p2,MFd2(i2),MVZ2),dp) 
B0m2 = -4._dp*MFd(i2)*Real(B0(p2,MFd2(i2),MVZ2)-0.5_dp*rMS,dp) 
coupL1 = cplcUFdFdVZL(gO1,i2)
coupR1 = cplcUFdFdVZR(gO1,i2)
coupL2 =  Conjg(cplcUFdFdVZL(gO2,i2))
coupR2 =  Conjg(cplcUFdFdVZR(gO2,i2))
SumS(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
    End Do 
 !------------------------ 
! conj[Hp], Fu 
!------------------------ 
      Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -0.5_dp*Real(B1(p2,MFu2(i2),MHp2),dp) 
B0m2 = MFu(i2)*Real(B0(p2,MFu2(i2),MHp2),dp) 
coupL1 = cplcUFdFucHpL(gO1,i2)
coupR1 = cplcUFdFucHpR(gO1,i2)
coupL2 =  Conjg(cplcUFdFucHpL(gO2,i2))
coupR2 =  Conjg(cplcUFdFucHpR(gO2,i2))
SumS(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
    End Do 
 !------------------------ 
! conj[VWp], Fu 
!------------------------ 
      Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = - Real(B1(p2,MFu2(i2),MVWp2),dp) 
B0m2 = -4._dp*MFu(i2)*Real(B0(p2,MFu2(i2),MVWp2)-0.5_dp*rMS,dp) 
coupL1 = cplcUFdFucVWpL(gO1,i2)
coupR1 = cplcUFdFucVWpR(gO1,i2)
coupL2 =  Conjg(cplcUFdFucVWpL(gO2,i2))
coupR2 =  Conjg(cplcUFdFucVWpR(gO2,i2))
SumS(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
    End Do 
 SigL = oo16pi2*SigL 
 
SigR = oo16pi2*SigR 
 
SigS = oo16pi2*SigS 
 
End Subroutine Sigma1LoopFd 
 
Subroutine OneLoopFu(Yu,v,MFu,MFu2,MAh,MAh2,MHp,MHp2,MFd,MFd2,MVWp,MVWp2,             & 
& Mhh,Mhh2,MVZ,MVZ2,cplcUFuFuAhL,cplcUFuFuAhR,cplcUFuFdHpL,cplcUFuFdHpR,cplcUFuFdVWpL,   & 
& cplcUFuFdVWpR,cplcUFuFuhhL,cplcUFuFuhhR,cplcUFuFuVGL,cplcUFuFuVGR,cplcUFuFuVPL,        & 
& cplcUFuFuVPR,cplcUFuFuVZL,cplcUFuFuVZR,delta,MFu_1L,MFu2_1L,ZUL_1L,ZUR_1L,ierr)

Implicit None 
Real(dp), Intent(in) :: MFu(3),MFu2(3),MAh,MAh2,MHp,MHp2,MFd(3),MFd2(3),MVWp,MVWp2,Mhh,Mhh2,MVZ,MVZ2

Real(dp), Intent(in) :: v

Complex(dp), Intent(in) :: Yu(3,3)

Complex(dp), Intent(in) :: cplcUFuFuAhL(3,3),cplcUFuFuAhR(3,3),cplcUFuFdHpL(3,3),cplcUFuFdHpR(3,3),              & 
& cplcUFuFdVWpL(3,3),cplcUFuFdVWpR(3,3),cplcUFuFuhhL(3,3),cplcUFuFuhhR(3,3),             & 
& cplcUFuFuVGL(3,3),cplcUFuFuVGR(3,3),cplcUFuFuVPL(3,3),cplcUFuFuVPR(3,3),               & 
& cplcUFuFuVZL(3,3),cplcUFuFuVZR(3,3)

Complex(dp) :: mat1a(3,3), mat1(3,3) 
Integer , Intent(inout):: ierr 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi2(3), test_m2(3), p2 
Real(dp), Intent(out) :: MFu_1L(3),MFu2_1L(3) 
 Complex(dp), Intent(out) :: ZUL_1L(3,3), ZUR_1L(3,3) 
 
 Real(dp) :: MFu_t(3),MFu2_t(3) 
 Complex(dp) :: ZUL_t(3,3), ZUR_t(3,3), sigL(3,3), sigR(3,3), sigS(3,3) 
 
 Complex(dp) :: mat(3,3)=0._dp, mat2(3,3)=0._dp, phaseM 

Complex(dp) :: ZUL2(3,3), ZUR2(3,3) 
 
 Real(dp) :: ZUL1(3,3), ZUR1(3,3), test(2) 
 
 Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopMFu'
 
mat1a(1,1) = 0._dp 
mat1a(1,1) = mat1a(1,1)+(v*Yu(1,1))/sqrt(2._dp)
mat1a(1,2) = 0._dp 
mat1a(1,2) = mat1a(1,2)+(v*Yu(2,1))/sqrt(2._dp)
mat1a(1,3) = 0._dp 
mat1a(1,3) = mat1a(1,3)+(v*Yu(3,1))/sqrt(2._dp)
mat1a(2,1) = 0._dp 
mat1a(2,1) = mat1a(2,1)+(v*Yu(1,2))/sqrt(2._dp)
mat1a(2,2) = 0._dp 
mat1a(2,2) = mat1a(2,2)+(v*Yu(2,2))/sqrt(2._dp)
mat1a(2,3) = 0._dp 
mat1a(2,3) = mat1a(2,3)+(v*Yu(3,2))/sqrt(2._dp)
mat1a(3,1) = 0._dp 
mat1a(3,1) = mat1a(3,1)+(v*Yu(1,3))/sqrt(2._dp)
mat1a(3,2) = 0._dp 
mat1a(3,2) = mat1a(3,2)+(v*Yu(2,3))/sqrt(2._dp)
mat1a(3,3) = 0._dp 
mat1a(3,3) = mat1a(3,3)+(v*Yu(3,3))/sqrt(2._dp)

 
 Do il=3,1,-1
sigL=0._dp 
sigR=0._dp 
sigS=0._dp 
p2 = MFu2(il) 
Call Sigma1LoopFu(p2,MFu,MFu2,MAh,MAh2,MHp,MHp2,MFd,MFd2,MVWp,MVWp2,Mhh,              & 
& Mhh2,MVZ,MVZ2,cplcUFuFuAhL,cplcUFuFuAhR,cplcUFuFdHpL,cplcUFuFdHpR,cplcUFuFdVWpL,       & 
& cplcUFuFdVWpR,cplcUFuFuhhL,cplcUFuFuhhR,cplcUFuFuVGL,cplcUFuFuVGR,cplcUFuFuVPL,        & 
& cplcUFuFuVPR,cplcUFuFuVZL,cplcUFuFuVZR,sigL,sigR,sigS)

mat1 = mat1a - SigS - MatMul(SigR,mat1a) - MatMul(mat1a,SigL) 
 
mat2 = Matmul(Transpose(Conjg(mat1)),mat1) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFu2_t,ZUR1,ierr,test) 
ZUR2 = ZUR1 
Else 
Call EigenSystem(mat2,MFu2_t,ZUR2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
!---------------------------------------- 
! Redoing Calculation using redefined p2 
!----------------------------------------- 
 
i_count = 0 
p2_loop: Do  
i_count = i_count + 1 
sigL=0._dp 
sigR=0._dp 
sigS=0._dp 
p2 = MFu2_t(iL)
Call Sigma1LoopFu(p2,MFu,MFu2,MAh,MAh2,MHp,MHp2,MFd,MFd2,MVWp,MVWp2,Mhh,              & 
& Mhh2,MVZ,MVZ2,cplcUFuFuAhL,cplcUFuFuAhR,cplcUFuFdHpL,cplcUFuFdHpR,cplcUFuFdVWpL,       & 
& cplcUFuFdVWpR,cplcUFuFuhhL,cplcUFuFuhhR,cplcUFuFuVGL,cplcUFuFuVGR,cplcUFuFuVPL,        & 
& cplcUFuFuVPR,cplcUFuFuVZL,cplcUFuFuVZR,sigL,sigR,sigS)

mat1 = mat1a - SigS - MatMul(SigR,mat1a) - MatMul(mat1a,SigL) 
 
mat2 = Matmul(Transpose(Conjg(mat1)),mat1) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFu2_t,ZUR1,ierr,test) 
ZUR2 = ZUR1 
Else 
Call EigenSystem(mat2,MFu2_t,ZUR2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
MFu2_1L(il) = MFu2_t(il) 
MFu_1L(il) = Sqrt(MFu2_1L(il)) 
 
If (p2.Ne.0._dp) Then 
  test(1) = Abs(MFu2_1L(il)-p2)/p2
Else 
  test(2) = Abs(MFu2_1L(il))
End If 
If (Abs(MFu2_1L(il)).lt.1.0E-30_dp) Exit p2_loop 
If (test(1).lt.0.1_dp*delta) Exit p2_loop 
If(i_count.gt.30) then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Exit p2_loop 
End if
End Do p2_loop 
mat2 = Matmul(mat1,Transpose(Conjg(mat1))) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFu2_t,ZUL1,ierr,test) 
 
 
ZUL2 = ZUL1 
Else 
Call EigenSystem(mat2,MFu2_t,ZUL2,ierr,test) 
 
 
End If 
ZUL2 = Conjg(ZUL2) 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
mat2 = Matmul(Matmul( Conjg(ZUL2),mat1),Transpose( Conjg(ZUR2))) 
Do i1=1,3
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
phaseM = mat2(i1,i1) / Abs(mat2(i1,i1)) 
ZUR2(i1,:) = phaseM *ZUR2(i1,:) 
 End if 
End Do 
 
ZUL_1L = ZUL2 
 ZUR_1L = ZUR2 
 End Do  
 
Iname = Iname -1 
End Subroutine OneLoopFu
 
 
Subroutine Sigma1LoopFu(p2,MFu,MFu2,MAh,MAh2,MHp,MHp2,MFd,MFd2,MVWp,MVWp2,            & 
& Mhh,Mhh2,MVZ,MVZ2,cplcUFuFuAhL,cplcUFuFuAhR,cplcUFuFdHpL,cplcUFuFdHpR,cplcUFuFdVWpL,   & 
& cplcUFuFdVWpR,cplcUFuFuhhL,cplcUFuFuhhR,cplcUFuFuVGL,cplcUFuFuVGR,cplcUFuFuVPL,        & 
& cplcUFuFuVPR,cplcUFuFuVZL,cplcUFuFuVZR,sigL,sigR,sigS)

Implicit None 
Real(dp), Intent(in) :: MFu(3),MFu2(3),MAh,MAh2,MHp,MHp2,MFd(3),MFd2(3),MVWp,MVWp2,Mhh,Mhh2,MVZ,MVZ2

Complex(dp), Intent(in) :: cplcUFuFuAhL(3,3),cplcUFuFuAhR(3,3),cplcUFuFdHpL(3,3),cplcUFuFdHpR(3,3),              & 
& cplcUFuFdVWpL(3,3),cplcUFuFdVWpR(3,3),cplcUFuFuhhL(3,3),cplcUFuFuhhR(3,3),             & 
& cplcUFuFuVGL(3,3),cplcUFuFuVGR(3,3),cplcUFuFuVPL(3,3),cplcUFuFuVPR(3,3),               & 
& cplcUFuFuVZL(3,3),cplcUFuFuVZR(3,3)

Complex(dp), Intent(out) :: SigL(3,3),SigR(3,3), SigS(3,3) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumL(3,3), sumR(3,3), sumS(3,3) 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
SigL = Cmplx(0._dp,0._dp,dp) 
SigR = Cmplx(0._dp,0._dp,dp) 
SigS = Cmplx(0._dp,0._dp,dp) 
 
!------------------------ 
! Fu, Ah 
!------------------------ 
    Do i1 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -0.5_dp*Real(B1(p2,MFu2(i1),MAh2),dp) 
B0m2 = MFu(i1)*Real(B0(p2,MFu2(i1),MAh2),dp) 
coupL1 = cplcUFuFuAhL(gO1,i1)
coupR1 = cplcUFuFuAhR(gO1,i1)
coupL2 =  Conjg(cplcUFuFuAhL(gO2,i1))
coupR2 =  Conjg(cplcUFuFuAhR(gO2,i1))
SumS(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
      End Do 
 !------------------------ 
! Hp, Fd 
!------------------------ 
      Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -0.5_dp*Real(B1(p2,MFd2(i2),MHp2),dp) 
B0m2 = MFd(i2)*Real(B0(p2,MFd2(i2),MHp2),dp) 
coupL1 = cplcUFuFdHpL(gO1,i2)
coupR1 = cplcUFuFdHpR(gO1,i2)
coupL2 =  Conjg(cplcUFuFdHpL(gO2,i2))
coupR2 =  Conjg(cplcUFuFdHpR(gO2,i2))
SumS(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
    End Do 
 !------------------------ 
! VWp, Fd 
!------------------------ 
      Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = - Real(B1(p2,MFd2(i2),MVWp2),dp) 
B0m2 = -4._dp*MFd(i2)*Real(B0(p2,MFd2(i2),MVWp2)-0.5_dp*rMS,dp) 
coupL1 = cplcUFuFdVWpL(gO1,i2)
coupR1 = cplcUFuFdVWpR(gO1,i2)
coupL2 =  Conjg(cplcUFuFdVWpL(gO2,i2))
coupR2 =  Conjg(cplcUFuFdVWpR(gO2,i2))
SumS(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
    End Do 
 !------------------------ 
! hh, Fu 
!------------------------ 
      Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -0.5_dp*Real(B1(p2,MFu2(i2),Mhh2),dp) 
B0m2 = MFu(i2)*Real(B0(p2,MFu2(i2),Mhh2),dp) 
coupL1 = cplcUFuFuhhL(gO1,i2)
coupR1 = cplcUFuFuhhR(gO1,i2)
coupL2 =  Conjg(cplcUFuFuhhL(gO2,i2))
coupR2 =  Conjg(cplcUFuFuhhR(gO2,i2))
SumS(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
    End Do 
 !------------------------ 
! VG, Fu 
!------------------------ 
      Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = - Real(B1(p2,MFu2(i2),0._dp),dp) 
B0m2 = -4._dp*MFu(i2)*Real(B0(p2,MFu2(i2),0._dp)-0.5_dp*rMS,dp) 
coupL1 = cplcUFuFuVGL(gO1,i2)
coupR1 = cplcUFuFuVGR(gO1,i2)
coupL2 =  Conjg(cplcUFuFuVGL(gO2,i2))
coupR2 =  Conjg(cplcUFuFuVGR(gO2,i2))
SumS(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +4._dp/3._dp* sumL
SigR = SigR +4._dp/3._dp* sumR 
SigS = SigS +4._dp/3._dp* sumS 
    End Do 
 !------------------------ 
! VP, Fu 
!------------------------ 
      Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = - Real(B1(p2,MFu2(i2),0._dp),dp) 
B0m2 = -4._dp*MFu(i2)*Real(B0(p2,MFu2(i2),0._dp)-0.5_dp*rMS,dp) 
coupL1 = cplcUFuFuVPL(gO1,i2)
coupR1 = cplcUFuFuVPR(gO1,i2)
coupL2 =  Conjg(cplcUFuFuVPL(gO2,i2))
coupR2 =  Conjg(cplcUFuFuVPR(gO2,i2))
SumS(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
    End Do 
 !------------------------ 
! VZ, Fu 
!------------------------ 
      Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = - Real(B1(p2,MFu2(i2),MVZ2),dp) 
B0m2 = -4._dp*MFu(i2)*Real(B0(p2,MFu2(i2),MVZ2)-0.5_dp*rMS,dp) 
coupL1 = cplcUFuFuVZL(gO1,i2)
coupR1 = cplcUFuFuVZR(gO1,i2)
coupL2 =  Conjg(cplcUFuFuVZL(gO2,i2))
coupR2 =  Conjg(cplcUFuFuVZR(gO2,i2))
SumS(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
    End Do 
 SigL = oo16pi2*SigL 
 
SigR = oo16pi2*SigR 
 
SigS = oo16pi2*SigS 
 
End Subroutine Sigma1LoopFu 
 
Subroutine OneLoopFe(Ye,v,MFe,MFe2,MAh,MAh2,Metp,Metp2,MChi,MChi2,Mhh,Mhh2,           & 
& MVZ,MVZ2,MHp,MHp2,MFv,MFv2,MVWp,MVWp2,cplcUFeFeAhL,cplcUFeFeAhR,cplcUFeChicetpL,       & 
& cplcUFeChicetpR,cplcUFeFehhL,cplcUFeFehhR,cplcUFeFeVPL,cplcUFeFeVPR,cplcUFeFeVZL,      & 
& cplcUFeFeVZR,cplcUFeFvcHpL,cplcUFeFvcHpR,cplcUFeFvcVWpL,cplcUFeFvcVWpR,delta,          & 
& MFe_1L,MFe2_1L,ZEL_1L,ZER_1L,ierr)

Implicit None 
Real(dp), Intent(in) :: MFe(3),MFe2(3),MAh,MAh2,Metp,Metp2,MChi(3),MChi2(3),Mhh,Mhh2,MVZ,MVZ2,MHp,            & 
& MHp2,MFv(3),MFv2(3),MVWp,MVWp2

Real(dp), Intent(in) :: v

Complex(dp), Intent(in) :: Ye(3,3)

Complex(dp), Intent(in) :: cplcUFeFeAhL(3,3),cplcUFeFeAhR(3,3),cplcUFeChicetpL(3,3),cplcUFeChicetpR(3,3),        & 
& cplcUFeFehhL(3,3),cplcUFeFehhR(3,3),cplcUFeFeVPL(3,3),cplcUFeFeVPR(3,3),               & 
& cplcUFeFeVZL(3,3),cplcUFeFeVZR(3,3),cplcUFeFvcHpL(3,3),cplcUFeFvcHpR(3,3),             & 
& cplcUFeFvcVWpL(3,3),cplcUFeFvcVWpR(3,3)

Complex(dp) :: mat1a(3,3), mat1(3,3) 
Integer , Intent(inout):: ierr 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi2(3), test_m2(3), p2 
Real(dp), Intent(out) :: MFe_1L(3),MFe2_1L(3) 
 Complex(dp), Intent(out) :: ZEL_1L(3,3), ZER_1L(3,3) 
 
 Real(dp) :: MFe_t(3),MFe2_t(3) 
 Complex(dp) :: ZEL_t(3,3), ZER_t(3,3), sigL(3,3), sigR(3,3), sigS(3,3) 
 
 Complex(dp) :: mat(3,3)=0._dp, mat2(3,3)=0._dp, phaseM 

Complex(dp) :: ZEL2(3,3), ZER2(3,3) 
 
 Real(dp) :: ZEL1(3,3), ZER1(3,3), test(2) 
 
 Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopMFe'
 
mat1a(1,1) = 0._dp 
mat1a(1,1) = mat1a(1,1)-((v*Ye(1,1))/sqrt(2._dp))
mat1a(1,2) = 0._dp 
mat1a(1,2) = mat1a(1,2)-((v*Ye(2,1))/sqrt(2._dp))
mat1a(1,3) = 0._dp 
mat1a(1,3) = mat1a(1,3)-((v*Ye(3,1))/sqrt(2._dp))
mat1a(2,1) = 0._dp 
mat1a(2,1) = mat1a(2,1)-((v*Ye(1,2))/sqrt(2._dp))
mat1a(2,2) = 0._dp 
mat1a(2,2) = mat1a(2,2)-((v*Ye(2,2))/sqrt(2._dp))
mat1a(2,3) = 0._dp 
mat1a(2,3) = mat1a(2,3)-((v*Ye(3,2))/sqrt(2._dp))
mat1a(3,1) = 0._dp 
mat1a(3,1) = mat1a(3,1)-((v*Ye(1,3))/sqrt(2._dp))
mat1a(3,2) = 0._dp 
mat1a(3,2) = mat1a(3,2)-((v*Ye(2,3))/sqrt(2._dp))
mat1a(3,3) = 0._dp 
mat1a(3,3) = mat1a(3,3)-((v*Ye(3,3))/sqrt(2._dp))

 
 Do il=3,1,-1
sigL=0._dp 
sigR=0._dp 
sigS=0._dp 
p2 = MFe2(il) 
Call Sigma1LoopFe(p2,MFe,MFe2,MAh,MAh2,Metp,Metp2,MChi,MChi2,Mhh,Mhh2,MVZ,            & 
& MVZ2,MHp,MHp2,MFv,MFv2,MVWp,MVWp2,cplcUFeFeAhL,cplcUFeFeAhR,cplcUFeChicetpL,           & 
& cplcUFeChicetpR,cplcUFeFehhL,cplcUFeFehhR,cplcUFeFeVPL,cplcUFeFeVPR,cplcUFeFeVZL,      & 
& cplcUFeFeVZR,cplcUFeFvcHpL,cplcUFeFvcHpR,cplcUFeFvcVWpL,cplcUFeFvcVWpR,sigL,           & 
& sigR,sigS)

mat1 = mat1a - SigS - MatMul(SigR,mat1a) - MatMul(mat1a,SigL) 
 
mat2 = Matmul(Transpose(Conjg(mat1)),mat1) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFe2_t,ZER1,ierr,test) 
ZER2 = ZER1 
Else 
Call EigenSystem(mat2,MFe2_t,ZER2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
!---------------------------------------- 
! Redoing Calculation using redefined p2 
!----------------------------------------- 
 
i_count = 0 
p2_loop: Do  
i_count = i_count + 1 
sigL=0._dp 
sigR=0._dp 
sigS=0._dp 
p2 = MFe2_t(iL)
Call Sigma1LoopFe(p2,MFe,MFe2,MAh,MAh2,Metp,Metp2,MChi,MChi2,Mhh,Mhh2,MVZ,            & 
& MVZ2,MHp,MHp2,MFv,MFv2,MVWp,MVWp2,cplcUFeFeAhL,cplcUFeFeAhR,cplcUFeChicetpL,           & 
& cplcUFeChicetpR,cplcUFeFehhL,cplcUFeFehhR,cplcUFeFeVPL,cplcUFeFeVPR,cplcUFeFeVZL,      & 
& cplcUFeFeVZR,cplcUFeFvcHpL,cplcUFeFvcHpR,cplcUFeFvcVWpL,cplcUFeFvcVWpR,sigL,           & 
& sigR,sigS)

mat1 = mat1a - SigS - MatMul(SigR,mat1a) - MatMul(mat1a,SigL) 
 
mat2 = Matmul(Transpose(Conjg(mat1)),mat1) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFe2_t,ZER1,ierr,test) 
ZER2 = ZER1 
Else 
Call EigenSystem(mat2,MFe2_t,ZER2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
MFe2_1L(il) = MFe2_t(il) 
MFe_1L(il) = Sqrt(MFe2_1L(il)) 
 
If (p2.Ne.0._dp) Then 
  test(1) = Abs(MFe2_1L(il)-p2)/p2
Else 
  test(2) = Abs(MFe2_1L(il))
End If 
If (Abs(MFe2_1L(il)).lt.1.0E-30_dp) Exit p2_loop 
If (test(1).lt.0.1_dp*delta) Exit p2_loop 
If(i_count.gt.30) then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Exit p2_loop 
End if
End Do p2_loop 
mat2 = Matmul(mat1,Transpose(Conjg(mat1))) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFe2_t,ZEL1,ierr,test) 
 
 
ZEL2 = ZEL1 
Else 
Call EigenSystem(mat2,MFe2_t,ZEL2,ierr,test) 
 
 
End If 
ZEL2 = Conjg(ZEL2) 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
mat2 = Matmul(Matmul( Conjg(ZEL2),mat1),Transpose( Conjg(ZER2))) 
Do i1=1,3
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
phaseM = mat2(i1,i1) / Abs(mat2(i1,i1)) 
ZER2(i1,:) = phaseM *ZER2(i1,:) 
 End if 
End Do 
 
ZEL_1L = ZEL2 
 ZER_1L = ZER2 
 End Do  
 
Iname = Iname -1 
End Subroutine OneLoopFe
 
 
Subroutine Sigma1LoopFe(p2,MFe,MFe2,MAh,MAh2,Metp,Metp2,MChi,MChi2,Mhh,               & 
& Mhh2,MVZ,MVZ2,MHp,MHp2,MFv,MFv2,MVWp,MVWp2,cplcUFeFeAhL,cplcUFeFeAhR,cplcUFeChicetpL,  & 
& cplcUFeChicetpR,cplcUFeFehhL,cplcUFeFehhR,cplcUFeFeVPL,cplcUFeFeVPR,cplcUFeFeVZL,      & 
& cplcUFeFeVZR,cplcUFeFvcHpL,cplcUFeFvcHpR,cplcUFeFvcVWpL,cplcUFeFvcVWpR,sigL,           & 
& sigR,sigS)

Implicit None 
Real(dp), Intent(in) :: MFe(3),MFe2(3),MAh,MAh2,Metp,Metp2,MChi(3),MChi2(3),Mhh,Mhh2,MVZ,MVZ2,MHp,            & 
& MHp2,MFv(3),MFv2(3),MVWp,MVWp2

Complex(dp), Intent(in) :: cplcUFeFeAhL(3,3),cplcUFeFeAhR(3,3),cplcUFeChicetpL(3,3),cplcUFeChicetpR(3,3),        & 
& cplcUFeFehhL(3,3),cplcUFeFehhR(3,3),cplcUFeFeVPL(3,3),cplcUFeFeVPR(3,3),               & 
& cplcUFeFeVZL(3,3),cplcUFeFeVZR(3,3),cplcUFeFvcHpL(3,3),cplcUFeFvcHpR(3,3),             & 
& cplcUFeFvcVWpL(3,3),cplcUFeFvcVWpR(3,3)

Complex(dp), Intent(out) :: SigL(3,3),SigR(3,3), SigS(3,3) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumL(3,3), sumR(3,3), sumS(3,3) 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
SigL = Cmplx(0._dp,0._dp,dp) 
SigR = Cmplx(0._dp,0._dp,dp) 
SigS = Cmplx(0._dp,0._dp,dp) 
 
!------------------------ 
! Fe, Ah 
!------------------------ 
    Do i1 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -0.5_dp*Real(B1(p2,MFe2(i1),MAh2),dp) 
B0m2 = MFe(i1)*Real(B0(p2,MFe2(i1),MAh2),dp) 
coupL1 = cplcUFeFeAhL(gO1,i1)
coupR1 = cplcUFeFeAhR(gO1,i1)
coupL2 =  Conjg(cplcUFeFeAhL(gO2,i1))
coupR2 =  Conjg(cplcUFeFeAhR(gO2,i1))
SumS(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
      End Do 
 !------------------------ 
! conj[etp], Chi 
!------------------------ 
      Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -0.5_dp*Real(B1(p2,MChi2(i2),Metp2),dp) 
B0m2 = MChi(i2)*Real(B0(p2,MChi2(i2),Metp2),dp) 
coupL1 = cplcUFeChicetpL(gO1,i2)
coupR1 = cplcUFeChicetpR(gO1,i2)
coupL2 =  Conjg(cplcUFeChicetpL(gO2,i2))
coupR2 =  Conjg(cplcUFeChicetpR(gO2,i2))
SumS(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
    End Do 
 !------------------------ 
! hh, Fe 
!------------------------ 
      Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -0.5_dp*Real(B1(p2,MFe2(i2),Mhh2),dp) 
B0m2 = MFe(i2)*Real(B0(p2,MFe2(i2),Mhh2),dp) 
coupL1 = cplcUFeFehhL(gO1,i2)
coupR1 = cplcUFeFehhR(gO1,i2)
coupL2 =  Conjg(cplcUFeFehhL(gO2,i2))
coupR2 =  Conjg(cplcUFeFehhR(gO2,i2))
SumS(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
    End Do 
 !------------------------ 
! VP, Fe 
!------------------------ 
      Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = - Real(B1(p2,MFe2(i2),0._dp),dp) 
B0m2 = -4._dp*MFe(i2)*Real(B0(p2,MFe2(i2),0._dp)-0.5_dp*rMS,dp) 
coupL1 = cplcUFeFeVPL(gO1,i2)
coupR1 = cplcUFeFeVPR(gO1,i2)
coupL2 =  Conjg(cplcUFeFeVPL(gO2,i2))
coupR2 =  Conjg(cplcUFeFeVPR(gO2,i2))
SumS(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
    End Do 
 !------------------------ 
! VZ, Fe 
!------------------------ 
      Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = - Real(B1(p2,MFe2(i2),MVZ2),dp) 
B0m2 = -4._dp*MFe(i2)*Real(B0(p2,MFe2(i2),MVZ2)-0.5_dp*rMS,dp) 
coupL1 = cplcUFeFeVZL(gO1,i2)
coupR1 = cplcUFeFeVZR(gO1,i2)
coupL2 =  Conjg(cplcUFeFeVZL(gO2,i2))
coupR2 =  Conjg(cplcUFeFeVZR(gO2,i2))
SumS(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
    End Do 
 !------------------------ 
! conj[Hp], Fv 
!------------------------ 
      Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -0.5_dp*Real(B1(p2,MFv2(i2),MHp2),dp) 
B0m2 = MFv(i2)*Real(B0(p2,MFv2(i2),MHp2),dp) 
coupL1 = cplcUFeFvcHpL(gO1,i2)
coupR1 = cplcUFeFvcHpR(gO1,i2)
coupL2 =  Conjg(cplcUFeFvcHpL(gO2,i2))
coupR2 =  Conjg(cplcUFeFvcHpR(gO2,i2))
SumS(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
    End Do 
 !------------------------ 
! conj[VWp], Fv 
!------------------------ 
      Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = - Real(B1(p2,MFv2(i2),MVWp2),dp) 
B0m2 = -4._dp*MFv(i2)*Real(B0(p2,MFv2(i2),MVWp2)-0.5_dp*rMS,dp) 
coupL1 = cplcUFeFvcVWpL(gO1,i2)
coupR1 = cplcUFeFvcVWpR(gO1,i2)
coupL2 =  Conjg(cplcUFeFvcVWpL(gO2,i2))
coupR2 =  Conjg(cplcUFeFvcVWpR(gO2,i2))
SumS(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
    End Do 
 SigL = oo16pi2*SigL 
 
SigR = oo16pi2*SigR 
 
SigS = oo16pi2*SigS 
 
End Subroutine Sigma1LoopFe 
 
Subroutine OneLoopHp(g2,mH2,lam1,v,MVWp,MVWp2,MAh,MAh2,Metp,Metp2,MetI,               & 
& MetI2,MetR,MetR2,MFd,MFd2,MFu,MFu2,MFe,MFe2,MFv,MFv2,MHp,MHp2,Mhh,Mhh2,MVZ,            & 
& MVZ2,cplAhcHpVWp,cpletIetpcHp,cpletpetRcHp,cplcFdFucHpL,cplcFdFucHpR,cplcFeFvcHpL,     & 
& cplcFeFvcHpR,cplcgZgWpcHp,cplcgWpgZHp,cplcgWCgZcHp,cplcgZgWCHp,cplhhHpcHp,             & 
& cplhhcHpVWp,cplHpcHpVP,cplHpcHpVZ,cplcHpVPVWp,cplcHpVWpVZ,cplAhAhHpcHp,cpletIetIHpcHp, & 
& cpletpHpcetpcHp,cpletRetRHpcHp,cplhhhhHpcHp,cplHpHpcHpcHp,cplHpcHpVPVP,cplHpcHpcVWpVWp,& 
& cplHpcHpVZVZ,delta,mass,mass2,kont)

Real(dp), Intent(in) :: MVWp,MVWp2,MAh,MAh2,Metp,Metp2,MetI,MetI2,MetR,MetR2,MFd(3),MFd2(3),MFu(3),           & 
& MFu2(3),MFe(3),MFe2(3),MFv(3),MFv2(3),MHp,MHp2,Mhh,Mhh2,MVZ,MVZ2

Real(dp), Intent(in) :: g2,v

Complex(dp), Intent(in) :: mH2,lam1

Complex(dp), Intent(in) :: cplAhcHpVWp,cpletIetpcHp,cpletpetRcHp,cplcFdFucHpL(3,3),cplcFdFucHpR(3,3),            & 
& cplcFeFvcHpL(3,3),cplcFeFvcHpR(3,3),cplcgZgWpcHp,cplcgWpgZHp,cplcgWCgZcHp,             & 
& cplcgZgWCHp,cplhhHpcHp,cplhhcHpVWp,cplHpcHpVP,cplHpcHpVZ,cplcHpVPVWp,cplcHpVWpVZ,      & 
& cplAhAhHpcHp,cpletIetIHpcHp,cpletpHpcetpcHp,cpletRetRHpcHp,cplhhhhHpcHp,               & 
& cplHpHpcHpcHp,cplHpcHpVPVP,cplHpcHpcVWpVWp,cplHpcHpVZVZ

Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count, ierr 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi, mi2, p2, test_m2 
Complex(dp) :: PiSf, sig 
Real(dp), Intent(out) :: mass, mass2 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopHp'
 
mi2 = MHp2 

 
p2 = MHp2
PiSf = ZeroC 
Call Pi1LoopHp(p2,MVWp,MVWp2,MAh,MAh2,Metp,Metp2,MetI,MetI2,MetR,MetR2,               & 
& MFd,MFd2,MFu,MFu2,MFe,MFe2,MFv,MFv2,MHp,MHp2,Mhh,Mhh2,MVZ,MVZ2,cplAhcHpVWp,            & 
& cpletIetpcHp,cpletpetRcHp,cplcFdFucHpL,cplcFdFucHpR,cplcFeFvcHpL,cplcFeFvcHpR,         & 
& cplcgZgWpcHp,cplcgWpgZHp,cplcgWCgZcHp,cplcgZgWCHp,cplhhHpcHp,cplhhcHpVWp,              & 
& cplHpcHpVP,cplHpcHpVZ,cplcHpVPVWp,cplcHpVWpVZ,cplAhAhHpcHp,cpletIetIHpcHp,             & 
& cpletpHpcetpcHp,cpletRetRHpcHp,cplhhhhHpcHp,cplHpHpcHpcHp,cplHpcHpVPVP,cplHpcHpcVWpVWp,& 
& cplHpcHpVZVZ,kont,PiSf)

mass2 = mi2 - Real(PiSf,dp) 
mass = sqrt(mass2) 
i_count = 0 
Do  
i_count = i_count + 1 
test_m2 = mass2 
p2 =  mass2 
PiSf = ZeroC 
Call Pi1LoopHp(p2,MVWp,MVWp2,MAh,MAh2,Metp,Metp2,MetI,MetI2,MetR,MetR2,               & 
& MFd,MFd2,MFu,MFu2,MFe,MFe2,MFv,MFv2,MHp,MHp2,Mhh,Mhh2,MVZ,MVZ2,cplAhcHpVWp,            & 
& cpletIetpcHp,cpletpetRcHp,cplcFdFucHpL,cplcFdFucHpR,cplcFeFvcHpL,cplcFeFvcHpR,         & 
& cplcgZgWpcHp,cplcgWpgZHp,cplcgWCgZcHp,cplcgZgWCHp,cplhhHpcHp,cplhhcHpVWp,              & 
& cplHpcHpVP,cplHpcHpVZ,cplcHpVPVWp,cplcHpVWpVZ,cplAhAhHpcHp,cpletIetIHpcHp,             & 
& cpletpHpcetpcHp,cpletRetRHpcHp,cplhhhhHpcHp,cplHpHpcHpcHp,cplHpcHpVPVP,cplHpcHpcVWpVWp,& 
& cplHpcHpVZVZ,kont,PiSf)

mass2 = mi2 - Real(PiSf,dp) 
mass = sqrt(mass2) 
 If (test_m2.Ne.0._dp) Then 
    test_m2 = Abs(test_m2 - mass2) / test_m2 
 Else 
    test_m2 = Abs(mass2) 
 End If 
 If (mass2.Ge.0._dp) Then 
    mass = sqrt(mass2) 
  Else 
 If (Abs(mass2).lt.1.0E-30_dp) test_m2 = 0._dp 
     Write(ErrCan,*) 'Warning from routine'//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
   SignOfMassChanged = .True. 
   mass = 0._dp 
  End If 
If (test_m2.LT.0.1_dp*delta) Exit 
If (i_count.Gt.30) Then 
  Write(*,*) "Problem in "//NameOfUnit(Iname), test_m2, mass2 
  kont = -510 
  Call AddError(510) 
 Exit 
End If 
End Do 
 
 
Iname = Iname -1 
End Subroutine OneLoopHp
 
 
Subroutine Pi1LoopHp(p2,MVWp,MVWp2,MAh,MAh2,Metp,Metp2,MetI,MetI2,MetR,               & 
& MetR2,MFd,MFd2,MFu,MFu2,MFe,MFe2,MFv,MFv2,MHp,MHp2,Mhh,Mhh2,MVZ,MVZ2,cplAhcHpVWp,      & 
& cpletIetpcHp,cpletpetRcHp,cplcFdFucHpL,cplcFdFucHpR,cplcFeFvcHpL,cplcFeFvcHpR,         & 
& cplcgZgWpcHp,cplcgWpgZHp,cplcgWCgZcHp,cplcgZgWCHp,cplhhHpcHp,cplhhcHpVWp,              & 
& cplHpcHpVP,cplHpcHpVZ,cplcHpVPVWp,cplcHpVWpVZ,cplAhAhHpcHp,cpletIetIHpcHp,             & 
& cpletpHpcetpcHp,cpletRetRHpcHp,cplhhhhHpcHp,cplHpHpcHpcHp,cplHpcHpVPVP,cplHpcHpcVWpVWp,& 
& cplHpcHpVZVZ,kont,res)

Implicit None 
Real(dp), Intent(in) :: MVWp,MVWp2,MAh,MAh2,Metp,Metp2,MetI,MetI2,MetR,MetR2,MFd(3),MFd2(3),MFu(3),           & 
& MFu2(3),MFe(3),MFe2(3),MFv(3),MFv2(3),MHp,MHp2,Mhh,Mhh2,MVZ,MVZ2

Complex(dp), Intent(in) :: cplAhcHpVWp,cpletIetpcHp,cpletpetRcHp,cplcFdFucHpL(3,3),cplcFdFucHpR(3,3),            & 
& cplcFeFvcHpL(3,3),cplcFeFvcHpR(3,3),cplcgZgWpcHp,cplcgWpgZHp,cplcgWCgZcHp,             & 
& cplcgZgWCHp,cplhhHpcHp,cplhhcHpVWp,cplHpcHpVP,cplHpcHpVZ,cplcHpVPVWp,cplcHpVWpVZ,      & 
& cplAhAhHpcHp,cpletIetIHpcHp,cpletpHpcetpcHp,cpletRetRHpcHp,cplhhhhHpcHp,               & 
& cplHpHpcHpcHp,cplHpcHpVPVP,cplHpcHpcVWpVWp,cplHpcHpVZVZ

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumI 
Integer :: i1,i2,i3,i4,ierr 
 
 
res = 0._dp 
 
!------------------------ 
! VWp, Ah 
!------------------------ 
sumI = 0._dp 
 
F0m2 = Floop(p2,MAh2,MVWp2) 
coup1 = cplAhcHpVWp
coup2 =  Conjg(cplAhcHpVWp)
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
!------------------------ 
! etp, etI 
!------------------------ 
sumI = 0._dp 
 
B0m2 = B0(p2,Metp2,MetI2) 
coup1 = cpletIetpcHp
coup2 = Conjg(cpletIetpcHp)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! etR, etp 
!------------------------ 
sumI = 0._dp 
 
B0m2 = B0(p2,MetR2,Metp2) 
coup1 = cpletpetRcHp
coup2 = Conjg(cpletpetRcHp)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[Fd], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Gloop(p2,MFd2(i1),MFu2(i2)) 
B0m2 = -2._dp*MFd(i1)*MFu(i2)*B0(p2,MFd2(i1),MFu2(i2)) 
coupL1 = cplcFdFucHpL(i1,i2)
coupR1 = cplcFdFucHpR(i1,i2)
coupL2 =  Conjg(cplcFdFucHpL(i1,i2))
coupR2 =  Conjg(cplcFdFucHpR(i1,i2))
    SumI = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Gloop(p2,MFe2(i1),MFv2(i2)) 
B0m2 = -2._dp*MFe(i1)*MFv(i2)*B0(p2,MFe2(i1),MFv2(i2)) 
coupL1 = cplcFeFvcHpL(i1,i2)
coupR1 = cplcFeFvcHpR(i1,i2)
coupL2 =  Conjg(cplcFeFvcHpL(i1,i2))
coupR2 =  Conjg(cplcFeFvcHpR(i1,i2))
    SumI = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gZ], gWp 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(B0(p2,MVWp2,MVZ2),dp) 
 coup1 = cplcgZgWpcHp
coup2 =  cplcgWpgZHp 
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWpC], gZ 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(B0(p2,MVZ2,MVWp2),dp) 
 coup1 = cplcgWCgZcHp
coup2 =  cplcgZgWCHp 
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
!------------------------ 
! Hp, hh 
!------------------------ 
sumI = 0._dp 
 
B0m2 = B0(p2,MHp2,Mhh2) 
coup1 = cplhhHpcHp
coup2 = Conjg(cplhhHpcHp)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! VWp, hh 
!------------------------ 
sumI = 0._dp 
 
F0m2 = Floop(p2,Mhh2,MVWp2) 
coup1 = cplhhcHpVWp
coup2 =  Conjg(cplhhcHpVWp)
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
!------------------------ 
! VP, Hp 
!------------------------ 
sumI = 0._dp 
 
F0m2 = Floop(p2,MHp2,0._dp) 
coup1 = cplHpcHpVP
coup2 =  Conjg(cplHpcHpVP)
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
!------------------------ 
! VZ, Hp 
!------------------------ 
sumI = 0._dp 
 
F0m2 = Floop(p2,MHp2,MVZ2) 
coup1 = cplHpcHpVZ
coup2 =  Conjg(cplHpcHpVZ)
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
!------------------------ 
! VWp, VP 
!------------------------ 
sumI = 0._dp 
 
F0m2 = 4._dp*Real(B0(p2,0._dp,MVWp2) - 0.5_dp*rMS,dp) 
coup1 = cplcHpVPVWp
coup2 =  Conjg(cplcHpVPVWp)
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
!------------------------ 
! VZ, VWp 
!------------------------ 
sumI = 0._dp 
 
F0m2 = 4._dp*Real(B0(p2,MVWp2,MVZ2) - 0.5_dp*rMS,dp) 
coup1 = cplcHpVWpVZ
coup2 =  Conjg(cplcHpVWpVZ)
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
!------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
A0m2 = A0(MAh2) 
coup1 = cplAhAhHpcHp
    SumI = -coup1*A0m2 
res = res +1._dp* SumI  
!------------------------ 
! etI, etI 
!------------------------ 
sumI = 0._dp 
 
A0m2 = A0(MetI2) 
coup1 = cpletIetIHpcHp
    SumI = -coup1*A0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[etp], etp 
!------------------------ 
sumI = 0._dp 
 
A0m2 = A0(Metp2) 
coup1 = cpletpHpcetpcHp
    SumI = -coup1*A0m2 
res = res +1._dp* SumI  
!------------------------ 
! etR, etR 
!------------------------ 
sumI = 0._dp 
 
A0m2 = A0(MetR2) 
coup1 = cpletRetRHpcHp
    SumI = -coup1*A0m2 
res = res +1._dp* SumI  
!------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
A0m2 = A0(Mhh2) 
coup1 = cplhhhhHpcHp
    SumI = -coup1*A0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[Hp], Hp 
!------------------------ 
sumI = 0._dp 
 
A0m2 = A0(MHp2) 
coup1 = cplHpHpcHpcHp
    SumI = -coup1*A0m2 
res = res +1._dp* SumI  
!------------------------ 
! VP, VP 
!------------------------ 
sumI = 0._dp 
 
A0m2 = A0(0._dp) - 0.5_dp*0._dp*rMS
coup1 = cplHpcHpVPVP
    SumI = coup1*A0m2 
res = res +2._dp* SumI  
!------------------------ 
! conj[VWp], VWp 
!------------------------ 
sumI = 0._dp 
 
A0m2 = A0(MVWp2) - 0.5_dp*MVWp2*rMS
coup1 = cplHpcHpcVWpVWp
    SumI = coup1*A0m2 
res = res +4._dp* SumI  
!------------------------ 
! VZ, VZ 
!------------------------ 
sumI = 0._dp 
 
A0m2 = A0(MVZ2) - 0.5_dp*MVZ2*rMS
coup1 = cplHpcHpVZVZ
    SumI = coup1*A0m2 
res = res +2._dp* SumI  


res = oo16pi2*res 
 
End Subroutine Pi1LoopHp 
 
Subroutine OneLoopetp(mEt2,lam3,v,MFe,MFe2,MChi,MChi2,MHp,MHp2,MetI,MetI2,            & 
& MVWp,MVWp2,Mhh,Mhh2,Metp,Metp2,MVZ,MVZ2,MetR,MetR2,MAh,MAh2,cplcFeChicetpL,            & 
& cplcFeChicetpR,cpletIHpcetp,cpletIcetpVWp,cpletphhcetp,cpletpcetpVP,cpletpcetpVZ,      & 
& cpletRHpcetp,cpletRcetpVWp,cplAhAhetpcetp,cpletIetIetpcetp,cpletpetpcetpcetp,          & 
& cpletpetRetRcetp,cpletphhhhcetp,cpletpHpcetpcHp,cpletpcetpVPVP,cpletpcetpcVWpVWp,      & 
& cpletpcetpVZVZ,delta,mass,mass2,kont)

Real(dp), Intent(in) :: MFe(3),MFe2(3),MChi(3),MChi2(3),MHp,MHp2,MetI,MetI2,MVWp,MVWp2,Mhh,Mhh2,              & 
& Metp,Metp2,MVZ,MVZ2,MetR,MetR2,MAh,MAh2

Real(dp), Intent(in) :: v

Complex(dp), Intent(in) :: mEt2,lam3

Complex(dp), Intent(in) :: cplcFeChicetpL(3,3),cplcFeChicetpR(3,3),cpletIHpcetp,cpletIcetpVWp,cpletphhcetp,      & 
& cpletpcetpVP,cpletpcetpVZ,cpletRHpcetp,cpletRcetpVWp,cplAhAhetpcetp,cpletIetIetpcetp,  & 
& cpletpetpcetpcetp,cpletpetRetRcetp,cpletphhhhcetp,cpletpHpcetpcHp,cpletpcetpVPVP,      & 
& cpletpcetpcVWpVWp,cpletpcetpVZVZ

Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count, ierr 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi, mi2, p2, test_m2 
Complex(dp) :: PiSf, sig 
Real(dp), Intent(out) :: mass, mass2 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopetp'
 
mi2 = Metp2 

 
p2 = Metp2
PiSf = ZeroC 
Call Pi1Loopetp(p2,MFe,MFe2,MChi,MChi2,MHp,MHp2,MetI,MetI2,MVWp,MVWp2,Mhh,            & 
& Mhh2,Metp,Metp2,MVZ,MVZ2,MetR,MetR2,MAh,MAh2,cplcFeChicetpL,cplcFeChicetpR,            & 
& cpletIHpcetp,cpletIcetpVWp,cpletphhcetp,cpletpcetpVP,cpletpcetpVZ,cpletRHpcetp,        & 
& cpletRcetpVWp,cplAhAhetpcetp,cpletIetIetpcetp,cpletpetpcetpcetp,cpletpetRetRcetp,      & 
& cpletphhhhcetp,cpletpHpcetpcHp,cpletpcetpVPVP,cpletpcetpcVWpVWp,cpletpcetpVZVZ,        & 
& kont,PiSf)

mass2 = mi2 - Real(PiSf,dp) 
mass = sqrt(mass2) 
i_count = 0 
Do  
i_count = i_count + 1 
test_m2 = mass2 
p2 =  mass2 
PiSf = ZeroC 
Call Pi1Loopetp(p2,MFe,MFe2,MChi,MChi2,MHp,MHp2,MetI,MetI2,MVWp,MVWp2,Mhh,            & 
& Mhh2,Metp,Metp2,MVZ,MVZ2,MetR,MetR2,MAh,MAh2,cplcFeChicetpL,cplcFeChicetpR,            & 
& cpletIHpcetp,cpletIcetpVWp,cpletphhcetp,cpletpcetpVP,cpletpcetpVZ,cpletRHpcetp,        & 
& cpletRcetpVWp,cplAhAhetpcetp,cpletIetIetpcetp,cpletpetpcetpcetp,cpletpetRetRcetp,      & 
& cpletphhhhcetp,cpletpHpcetpcHp,cpletpcetpVPVP,cpletpcetpcVWpVWp,cpletpcetpVZVZ,        & 
& kont,PiSf)

mass2 = mi2 - Real(PiSf,dp) 
mass = sqrt(mass2) 
 If (test_m2.Ne.0._dp) Then 
    test_m2 = Abs(test_m2 - mass2) / test_m2 
 Else 
    test_m2 = Abs(mass2) 
 End If 
 If (mass2.Ge.0._dp) Then 
    mass = sqrt(mass2) 
  Else 
 If (Abs(mass2).lt.1.0E-30_dp) test_m2 = 0._dp 
     Write(ErrCan,*) 'Warning from routine'//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
   SignOfMassChanged = .True. 
   mass = 0._dp 
  End If 
If (test_m2.LT.0.1_dp*delta) Exit 
If (i_count.Gt.30) Then 
  Write(*,*) "Problem in "//NameOfUnit(Iname), test_m2, mass2 
  kont = -510 
  Call AddError(510) 
 Exit 
End If 
End Do 
 
 
Iname = Iname -1 
End Subroutine OneLoopetp
 
 
Subroutine Pi1Loopetp(p2,MFe,MFe2,MChi,MChi2,MHp,MHp2,MetI,MetI2,MVWp,MVWp2,          & 
& Mhh,Mhh2,Metp,Metp2,MVZ,MVZ2,MetR,MetR2,MAh,MAh2,cplcFeChicetpL,cplcFeChicetpR,        & 
& cpletIHpcetp,cpletIcetpVWp,cpletphhcetp,cpletpcetpVP,cpletpcetpVZ,cpletRHpcetp,        & 
& cpletRcetpVWp,cplAhAhetpcetp,cpletIetIetpcetp,cpletpetpcetpcetp,cpletpetRetRcetp,      & 
& cpletphhhhcetp,cpletpHpcetpcHp,cpletpcetpVPVP,cpletpcetpcVWpVWp,cpletpcetpVZVZ,kont,res)

Implicit None 
Real(dp), Intent(in) :: MFe(3),MFe2(3),MChi(3),MChi2(3),MHp,MHp2,MetI,MetI2,MVWp,MVWp2,Mhh,Mhh2,              & 
& Metp,Metp2,MVZ,MVZ2,MetR,MetR2,MAh,MAh2

Complex(dp), Intent(in) :: cplcFeChicetpL(3,3),cplcFeChicetpR(3,3),cpletIHpcetp,cpletIcetpVWp,cpletphhcetp,      & 
& cpletpcetpVP,cpletpcetpVZ,cpletRHpcetp,cpletRcetpVWp,cplAhAhetpcetp,cpletIetIetpcetp,  & 
& cpletpetpcetpcetp,cpletpetRetRcetp,cpletphhhhcetp,cpletpHpcetpcHp,cpletpcetpVPVP,      & 
& cpletpcetpcVWpVWp,cpletpcetpVZVZ

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumI 
Integer :: i1,i2,i3,i4,ierr 
 
 
res = 0._dp 
 
!------------------------ 
! bar[Fe], Chi 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Gloop(p2,MFe2(i1),MChi2(i2)) 
B0m2 = -2._dp*MFe(i1)*MChi(i2)*B0(p2,MFe2(i1),MChi2(i2)) 
coupL1 = cplcFeChicetpL(i1,i2)
coupR1 = cplcFeChicetpR(i1,i2)
coupL2 =  Conjg(cplcFeChicetpL(i1,i2))
coupR2 =  Conjg(cplcFeChicetpR(i1,i2))
    SumI = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Hp, etI 
!------------------------ 
sumI = 0._dp 
 
B0m2 = B0(p2,MHp2,MetI2) 
coup1 = cpletIHpcetp
coup2 = Conjg(cpletIHpcetp)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! VWp, etI 
!------------------------ 
sumI = 0._dp 
 
F0m2 = Floop(p2,MetI2,MVWp2) 
coup1 = cpletIcetpVWp
coup2 =  Conjg(cpletIcetpVWp)
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
!------------------------ 
! hh, etp 
!------------------------ 
sumI = 0._dp 
 
B0m2 = B0(p2,Mhh2,Metp2) 
coup1 = cpletphhcetp
coup2 = Conjg(cpletphhcetp)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! VP, etp 
!------------------------ 
sumI = 0._dp 
 
F0m2 = Floop(p2,Metp2,0._dp) 
coup1 = cpletpcetpVP
coup2 =  Conjg(cpletpcetpVP)
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
!------------------------ 
! VZ, etp 
!------------------------ 
sumI = 0._dp 
 
F0m2 = Floop(p2,Metp2,MVZ2) 
coup1 = cpletpcetpVZ
coup2 =  Conjg(cpletpcetpVZ)
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
!------------------------ 
! Hp, etR 
!------------------------ 
sumI = 0._dp 
 
B0m2 = B0(p2,MHp2,MetR2) 
coup1 = cpletRHpcetp
coup2 = Conjg(cpletRHpcetp)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! VWp, etR 
!------------------------ 
sumI = 0._dp 
 
F0m2 = Floop(p2,MetR2,MVWp2) 
coup1 = cpletRcetpVWp
coup2 =  Conjg(cpletRcetpVWp)
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
!------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
A0m2 = A0(MAh2) 
coup1 = cplAhAhetpcetp
    SumI = -coup1*A0m2 
res = res +1._dp* SumI  
!------------------------ 
! etI, etI 
!------------------------ 
sumI = 0._dp 
 
A0m2 = A0(MetI2) 
coup1 = cpletIetIetpcetp
    SumI = -coup1*A0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[etp], etp 
!------------------------ 
sumI = 0._dp 
 
A0m2 = A0(Metp2) 
coup1 = cpletpetpcetpcetp
    SumI = -coup1*A0m2 
res = res +1._dp* SumI  
!------------------------ 
! etR, etR 
!------------------------ 
sumI = 0._dp 
 
A0m2 = A0(MetR2) 
coup1 = cpletpetRetRcetp
    SumI = -coup1*A0m2 
res = res +1._dp* SumI  
!------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
A0m2 = A0(Mhh2) 
coup1 = cpletphhhhcetp
    SumI = -coup1*A0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[Hp], Hp 
!------------------------ 
sumI = 0._dp 
 
A0m2 = A0(MHp2) 
coup1 = cpletpHpcetpcHp
    SumI = -coup1*A0m2 
res = res +1._dp* SumI  
!------------------------ 
! VP, VP 
!------------------------ 
sumI = 0._dp 
 
A0m2 = A0(0._dp) - 0.5_dp*0._dp*rMS
coup1 = cpletpcetpVPVP
    SumI = coup1*A0m2 
res = res +2._dp* SumI  
!------------------------ 
! conj[VWp], VWp 
!------------------------ 
sumI = 0._dp 
 
A0m2 = A0(MVWp2) - 0.5_dp*MVWp2*rMS
coup1 = cpletpcetpcVWpVWp
    SumI = coup1*A0m2 
res = res +4._dp* SumI  
!------------------------ 
! VZ, VZ 
!------------------------ 
sumI = 0._dp 
 
A0m2 = A0(MVZ2) - 0.5_dp*MVZ2*rMS
coup1 = cpletpcetpVZVZ
    SumI = coup1*A0m2 
res = res +2._dp* SumI  


res = oo16pi2*res 
 
End Subroutine Pi1Loopetp 
 
Subroutine OneLoopAh(g1,g2,mH2,lam1,v,TW,Mhh,Mhh2,MAh,MAh2,MetR,MetR2,MetI,           & 
& MetI2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MVZ,MVZ2,MVWp,MVWp2,MHp,MHp2,Metp,Metp2,              & 
& cplAhAhhh,cplAhetIetR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,     & 
& cplcFuFuAhR,cplcgWpgWpAh,cplcgWCgWCAh,cplAhhhVZ,cplAhHpcVWp,cplAhAhAhAh,               & 
& cplAhAhetIetI,cplAhAhetpcetp,cplAhAhetRetR,cplAhAhhhhh,cplAhAhHpcHp,cplAhAhcVWpVWp,    & 
& cplAhAhVZVZ,delta,mass,mass2,kont)

Real(dp), Intent(in) :: Mhh,Mhh2,MAh,MAh2,MetR,MetR2,MetI,MetI2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),         & 
& MFu2(3),MVZ,MVZ2,MVWp,MVWp2,MHp,MHp2,Metp,Metp2

Real(dp), Intent(in) :: g1,g2,v,TW

Complex(dp), Intent(in) :: mH2,lam1

Complex(dp), Intent(in) :: cplAhAhhh,cplAhetIetR,cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),cplcFeFeAhL(3,3),             & 
& cplcFeFeAhR(3,3),cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),cplcgWpgWpAh,cplcgWCgWCAh,          & 
& cplAhhhVZ,cplAhHpcVWp,cplAhAhAhAh,cplAhAhetIetI,cplAhAhetpcetp,cplAhAhetRetR,          & 
& cplAhAhhhhh,cplAhAhHpcHp,cplAhAhcVWpVWp,cplAhAhVZVZ

Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count, ierr 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi, mi2, p2, test_m2 
Complex(dp) :: PiSf, sig 
Real(dp), Intent(out) :: mass, mass2 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopAh'
 
mi2 = MAh2 

 
p2 = MAh2
PiSf = ZeroC 
Call Pi1LoopAh(p2,Mhh,Mhh2,MAh,MAh2,MetR,MetR2,MetI,MetI2,MFd,MFd2,MFe,               & 
& MFe2,MFu,MFu2,MVZ,MVZ2,MVWp,MVWp2,MHp,MHp2,Metp,Metp2,cplAhAhhh,cplAhetIetR,           & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,               & 
& cplcgWpgWpAh,cplcgWCgWCAh,cplAhhhVZ,cplAhHpcVWp,cplAhAhAhAh,cplAhAhetIetI,             & 
& cplAhAhetpcetp,cplAhAhetRetR,cplAhAhhhhh,cplAhAhHpcHp,cplAhAhcVWpVWp,cplAhAhVZVZ,      & 
& kont,PiSf)

mass2 = mi2 - Real(PiSf,dp) 
mass = sqrt(mass2) 
i_count = 0 
Do  
i_count = i_count + 1 
test_m2 = mass2 
p2 =  mass2 
PiSf = ZeroC 
Call Pi1LoopAh(p2,Mhh,Mhh2,MAh,MAh2,MetR,MetR2,MetI,MetI2,MFd,MFd2,MFe,               & 
& MFe2,MFu,MFu2,MVZ,MVZ2,MVWp,MVWp2,MHp,MHp2,Metp,Metp2,cplAhAhhh,cplAhetIetR,           & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,               & 
& cplcgWpgWpAh,cplcgWCgWCAh,cplAhhhVZ,cplAhHpcVWp,cplAhAhAhAh,cplAhAhetIetI,             & 
& cplAhAhetpcetp,cplAhAhetRetR,cplAhAhhhhh,cplAhAhHpcHp,cplAhAhcVWpVWp,cplAhAhVZVZ,      & 
& kont,PiSf)

mass2 = mi2 - Real(PiSf,dp) 
mass = sqrt(mass2) 
 If (test_m2.Ne.0._dp) Then 
    test_m2 = Abs(test_m2 - mass2) / test_m2 
 Else 
    test_m2 = Abs(mass2) 
 End If 
 If (mass2.Ge.0._dp) Then 
    mass = sqrt(mass2) 
  Else 
 If (Abs(mass2).lt.1.0E-30_dp) test_m2 = 0._dp 
     Write(ErrCan,*) 'Warning from routine'//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
   SignOfMassChanged = .True. 
   mass = 0._dp 
  End If 
If (test_m2.LT.0.1_dp*delta) Exit 
If (i_count.Gt.30) Then 
  Write(*,*) "Problem in "//NameOfUnit(Iname), test_m2, mass2 
  kont = -510 
  Call AddError(510) 
 Exit 
End If 
End Do 
 
 
Iname = Iname -1 
End Subroutine OneLoopAh
 
 
Subroutine Pi1LoopAh(p2,Mhh,Mhh2,MAh,MAh2,MetR,MetR2,MetI,MetI2,MFd,MFd2,             & 
& MFe,MFe2,MFu,MFu2,MVZ,MVZ2,MVWp,MVWp2,MHp,MHp2,Metp,Metp2,cplAhAhhh,cplAhetIetR,       & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,               & 
& cplcgWpgWpAh,cplcgWCgWCAh,cplAhhhVZ,cplAhHpcVWp,cplAhAhAhAh,cplAhAhetIetI,             & 
& cplAhAhetpcetp,cplAhAhetRetR,cplAhAhhhhh,cplAhAhHpcHp,cplAhAhcVWpVWp,cplAhAhVZVZ,kont,res)

Implicit None 
Real(dp), Intent(in) :: Mhh,Mhh2,MAh,MAh2,MetR,MetR2,MetI,MetI2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),         & 
& MFu2(3),MVZ,MVZ2,MVWp,MVWp2,MHp,MHp2,Metp,Metp2

Complex(dp), Intent(in) :: cplAhAhhh,cplAhetIetR,cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),cplcFeFeAhL(3,3),             & 
& cplcFeFeAhR(3,3),cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),cplcgWpgWpAh,cplcgWCgWCAh,          & 
& cplAhhhVZ,cplAhHpcVWp,cplAhAhAhAh,cplAhAhetIetI,cplAhAhetpcetp,cplAhAhetRetR,          & 
& cplAhAhhhhh,cplAhAhHpcHp,cplAhAhcVWpVWp,cplAhAhVZVZ

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumI 
Integer :: i1,i2,i3,i4,ierr 
 
 
res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
B0m2 = B0(p2,Mhh2,MAh2) 
coup1 = cplAhAhhh
coup2 = Conjg(cplAhAhhh)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! etR, etI 
!------------------------ 
sumI = 0._dp 
 
B0m2 = B0(p2,MetR2,MetI2) 
coup1 = cplAhetIetR
coup2 = Conjg(cplAhetIetR)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Gloop(p2,MFd2(i1),MFd2(i2)) 
B0m2 = -2._dp*MFd(i1)*MFd(i2)*B0(p2,MFd2(i1),MFd2(i2)) 
coupL1 = cplcFdFdAhL(i1,i2)
coupR1 = cplcFdFdAhR(i1,i2)
coupL2 =  Conjg(cplcFdFdAhL(i1,i2))
coupR2 =  Conjg(cplcFdFdAhR(i1,i2))
    SumI = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Gloop(p2,MFe2(i1),MFe2(i2)) 
B0m2 = -2._dp*MFe(i1)*MFe(i2)*B0(p2,MFe2(i1),MFe2(i2)) 
coupL1 = cplcFeFeAhL(i1,i2)
coupR1 = cplcFeFeAhR(i1,i2)
coupL2 =  Conjg(cplcFeFeAhL(i1,i2))
coupR2 =  Conjg(cplcFeFeAhR(i1,i2))
    SumI = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Gloop(p2,MFu2(i1),MFu2(i2)) 
B0m2 = -2._dp*MFu(i1)*MFu(i2)*B0(p2,MFu2(i1),MFu2(i2)) 
coupL1 = cplcFuFuAhL(i1,i2)
coupR1 = cplcFuFuAhR(i1,i2)
coupL2 =  Conjg(cplcFuFuAhL(i1,i2))
coupR2 =  Conjg(cplcFuFuAhR(i1,i2))
    SumI = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWp], gWp 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(B0(p2,MVWp2,MVWp2),dp) 
 coup1 = cplcgWpgWpAh
coup2 =  cplcgWpgWpAh 
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWpC], gWpC 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(B0(p2,MVWp2,MVWp2),dp) 
 coup1 = cplcgWCgWCAh
coup2 =  cplcgWCgWCAh 
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
!------------------------ 
! VZ, hh 
!------------------------ 
sumI = 0._dp 
 
F0m2 = Floop(p2,Mhh2,MVZ2) 
coup1 = cplAhhhVZ
coup2 =  Conjg(cplAhhhVZ)
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWp], Hp 
!------------------------ 
sumI = 0._dp 
 
F0m2 = Floop(p2,MHp2,MVWp2) 
coup1 = cplAhHpcVWp
coup2 =  Conjg(cplAhHpcVWp)
    SumI = coup1*coup2*F0m2 
res = res +2._dp* SumI  
!------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
A0m2 = A0(MAh2) 
coup1 = cplAhAhAhAh
    SumI = -coup1*A0m2 
res = res +1._dp* SumI  
!------------------------ 
! etI, etI 
!------------------------ 
sumI = 0._dp 
 
A0m2 = A0(MetI2) 
coup1 = cplAhAhetIetI
    SumI = -coup1*A0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[etp], etp 
!------------------------ 
sumI = 0._dp 
 
A0m2 = A0(Metp2) 
coup1 = cplAhAhetpcetp
    SumI = -coup1*A0m2 
res = res +1._dp* SumI  
!------------------------ 
! etR, etR 
!------------------------ 
sumI = 0._dp 
 
A0m2 = A0(MetR2) 
coup1 = cplAhAhetRetR
    SumI = -coup1*A0m2 
res = res +1._dp* SumI  
!------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
A0m2 = A0(Mhh2) 
coup1 = cplAhAhhhhh
    SumI = -coup1*A0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[Hp], Hp 
!------------------------ 
sumI = 0._dp 
 
A0m2 = A0(MHp2) 
coup1 = cplAhAhHpcHp
    SumI = -coup1*A0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWp], VWp 
!------------------------ 
sumI = 0._dp 
 
A0m2 = A0(MVWp2) - 0.5_dp*MVWp2*rMS
coup1 = cplAhAhcVWpVWp
    SumI = coup1*A0m2 
res = res +4._dp* SumI  
!------------------------ 
! VZ, VZ 
!------------------------ 
sumI = 0._dp 
 
A0m2 = A0(MVZ2) - 0.5_dp*MVZ2*rMS
coup1 = cplAhAhVZVZ
    SumI = coup1*A0m2 
res = res +2._dp* SumI  


res = oo16pi2*res 
 
End Subroutine Pi1LoopAh 
 
Subroutine OneLoophh(mH2,lam1,v,MAh,MAh2,MVZ,MVZ2,MetI,MetI2,Metp,Metp2,              & 
& MetR,MetR2,MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,cplAhAhhh,          & 
& cplAhhhVZ,cpletIetIhh,cpletphhcetp,cpletRetRhh,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,    & 
& cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcgWpgWphh,cplcgWCgWChh,cplcgZgZhh,              & 
& cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhcVWpVWp,cplhhVZVZ,cplAhAhhhhh,cpletIetIhhhh,     & 
& cpletphhhhcetp,cpletRetRhhhh,cplhhhhhhhh,cplhhhhHpcHp,cplhhhhcVWpVWp,cplhhhhVZVZ,      & 
& delta,mass,mass2,kont)

Real(dp), Intent(in) :: MAh,MAh2,MVZ,MVZ2,MetI,MetI2,Metp,Metp2,MetR,MetR2,MFd(3),MFd2(3),MFe(3),             & 
& MFe2(3),MFu(3),MFu2(3),Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2

Real(dp), Intent(in) :: v

Complex(dp), Intent(in) :: mH2,lam1

Complex(dp), Intent(in) :: cplAhAhhh,cplAhhhVZ,cpletIetIhh,cpletphhcetp,cpletRetRhh,cplcFdFdhhL(3,3),            & 
& cplcFdFdhhR(3,3),cplcFeFehhL(3,3),cplcFeFehhR(3,3),cplcFuFuhhL(3,3),cplcFuFuhhR(3,3),  & 
& cplcgWpgWphh,cplcgWCgWChh,cplcgZgZhh,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhcVWpVWp,    & 
& cplhhVZVZ,cplAhAhhhhh,cpletIetIhhhh,cpletphhhhcetp,cpletRetRhhhh,cplhhhhhhhh,          & 
& cplhhhhHpcHp,cplhhhhcVWpVWp,cplhhhhVZVZ

Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count, ierr 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi, mi2, p2, test_m2 
Complex(dp) :: PiSf, sig 
Real(dp), Intent(out) :: mass, mass2 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoophh'
 
mi2 = Mhh2 

 
p2 = Mhh2
PiSf = ZeroC 
Call Pi1Loophh(p2,MAh,MAh2,MVZ,MVZ2,MetI,MetI2,Metp,Metp2,MetR,MetR2,MFd,             & 
& MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,cplAhAhhh,cplAhhhVZ,               & 
& cpletIetIhh,cpletphhcetp,cpletRetRhh,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,              & 
& cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcgWpgWphh,cplcgWCgWChh,cplcgZgZhh,              & 
& cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhcVWpVWp,cplhhVZVZ,cplAhAhhhhh,cpletIetIhhhh,     & 
& cpletphhhhcetp,cpletRetRhhhh,cplhhhhhhhh,cplhhhhHpcHp,cplhhhhcVWpVWp,cplhhhhVZVZ,      & 
& kont,PiSf)

mass2 = mi2 - Real(PiSf,dp) 
mass = sqrt(mass2) 
i_count = 0 
Do  
i_count = i_count + 1 
test_m2 = mass2 
p2 =  mass2 
PiSf = ZeroC 
Call Pi1Loophh(p2,MAh,MAh2,MVZ,MVZ2,MetI,MetI2,Metp,Metp2,MetR,MetR2,MFd,             & 
& MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,cplAhAhhh,cplAhhhVZ,               & 
& cpletIetIhh,cpletphhcetp,cpletRetRhh,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,              & 
& cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcgWpgWphh,cplcgWCgWChh,cplcgZgZhh,              & 
& cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhcVWpVWp,cplhhVZVZ,cplAhAhhhhh,cpletIetIhhhh,     & 
& cpletphhhhcetp,cpletRetRhhhh,cplhhhhhhhh,cplhhhhHpcHp,cplhhhhcVWpVWp,cplhhhhVZVZ,      & 
& kont,PiSf)

mass2 = mi2 - Real(PiSf,dp) 
mass = sqrt(mass2) 
 If (test_m2.Ne.0._dp) Then 
    test_m2 = Abs(test_m2 - mass2) / test_m2 
 Else 
    test_m2 = Abs(mass2) 
 End If 
 If (mass2.Ge.0._dp) Then 
    mass = sqrt(mass2) 
  Else 
 If (Abs(mass2).lt.1.0E-30_dp) test_m2 = 0._dp 
     Write(ErrCan,*) 'Warning from routine'//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
   SignOfMassChanged = .True. 
   mass = 0._dp 
  End If 
If (test_m2.LT.0.1_dp*delta) Exit 
If (i_count.Gt.30) Then 
  Write(*,*) "Problem in "//NameOfUnit(Iname), test_m2, mass2 
  kont = -510 
  Call AddError(510) 
 Exit 
End If 
End Do 
 
 
Iname = Iname -1 
End Subroutine OneLoophh
 
 
Subroutine Pi1Loophh(p2,MAh,MAh2,MVZ,MVZ2,MetI,MetI2,Metp,Metp2,MetR,MetR2,           & 
& MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,cplAhAhhh,cplAhhhVZ,           & 
& cpletIetIhh,cpletphhcetp,cpletRetRhh,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,              & 
& cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcgWpgWphh,cplcgWCgWChh,cplcgZgZhh,              & 
& cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhcVWpVWp,cplhhVZVZ,cplAhAhhhhh,cpletIetIhhhh,     & 
& cpletphhhhcetp,cpletRetRhhhh,cplhhhhhhhh,cplhhhhHpcHp,cplhhhhcVWpVWp,cplhhhhVZVZ,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh,MAh2,MVZ,MVZ2,MetI,MetI2,Metp,Metp2,MetR,MetR2,MFd(3),MFd2(3),MFe(3),             & 
& MFe2(3),MFu(3),MFu2(3),Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2

Complex(dp), Intent(in) :: cplAhAhhh,cplAhhhVZ,cpletIetIhh,cpletphhcetp,cpletRetRhh,cplcFdFdhhL(3,3),            & 
& cplcFdFdhhR(3,3),cplcFeFehhL(3,3),cplcFeFehhR(3,3),cplcFuFuhhL(3,3),cplcFuFuhhR(3,3),  & 
& cplcgWpgWphh,cplcgWCgWChh,cplcgZgZhh,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhcVWpVWp,    & 
& cplhhVZVZ,cplAhAhhhhh,cpletIetIhhhh,cpletphhhhcetp,cpletRetRhhhh,cplhhhhhhhh,          & 
& cplhhhhHpcHp,cplhhhhcVWpVWp,cplhhhhVZVZ

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumI 
Integer :: i1,i2,i3,i4,ierr 
 
 
res = 0._dp 
 
!------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
B0m2 = B0(p2,MAh2,MAh2) 
coup1 = cplAhAhhh
coup2 = Conjg(cplAhAhhh)
    SumI = coup1*coup2*B0m2 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! VZ, Ah 
!------------------------ 
sumI = 0._dp 
 
F0m2 = Floop(p2,MAh2,MVZ2) 
coup1 = cplAhhhVZ
coup2 =  Conjg(cplAhhhVZ)
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
!------------------------ 
! etI, etI 
!------------------------ 
sumI = 0._dp 
 
B0m2 = B0(p2,MetI2,MetI2) 
coup1 = cpletIetIhh
coup2 = Conjg(cpletIetIhh)
    SumI = coup1*coup2*B0m2 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! conj[etp], etp 
!------------------------ 
sumI = 0._dp 
 
B0m2 = B0(p2,Metp2,Metp2) 
coup1 = cpletphhcetp
coup2 = Conjg(cpletphhcetp)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! etR, etR 
!------------------------ 
sumI = 0._dp 
 
B0m2 = B0(p2,MetR2,MetR2) 
coup1 = cpletRetRhh
coup2 = Conjg(cpletRetRhh)
    SumI = coup1*coup2*B0m2 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Gloop(p2,MFd2(i1),MFd2(i2)) 
B0m2 = -2._dp*MFd(i1)*MFd(i2)*B0(p2,MFd2(i1),MFd2(i2)) 
coupL1 = cplcFdFdhhL(i1,i2)
coupR1 = cplcFdFdhhR(i1,i2)
coupL2 =  Conjg(cplcFdFdhhL(i1,i2))
coupR2 =  Conjg(cplcFdFdhhR(i1,i2))
    SumI = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Gloop(p2,MFe2(i1),MFe2(i2)) 
B0m2 = -2._dp*MFe(i1)*MFe(i2)*B0(p2,MFe2(i1),MFe2(i2)) 
coupL1 = cplcFeFehhL(i1,i2)
coupR1 = cplcFeFehhR(i1,i2)
coupL2 =  Conjg(cplcFeFehhL(i1,i2))
coupR2 =  Conjg(cplcFeFehhR(i1,i2))
    SumI = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Gloop(p2,MFu2(i1),MFu2(i2)) 
B0m2 = -2._dp*MFu(i1)*MFu(i2)*B0(p2,MFu2(i1),MFu2(i2)) 
coupL1 = cplcFuFuhhL(i1,i2)
coupR1 = cplcFuFuhhR(i1,i2)
coupL2 =  Conjg(cplcFuFuhhL(i1,i2))
coupR2 =  Conjg(cplcFuFuhhR(i1,i2))
    SumI = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWp], gWp 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(B0(p2,MVWp2,MVWp2),dp) 
 coup1 = cplcgWpgWphh
coup2 =  cplcgWpgWphh 
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWpC], gWpC 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(B0(p2,MVWp2,MVWp2),dp) 
 coup1 = cplcgWCgWChh
coup2 =  cplcgWCgWChh 
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZ], gZ 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(B0(p2,MVZ2,MVZ2),dp) 
 coup1 = cplcgZgZhh
coup2 =  cplcgZgZhh 
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
!------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
B0m2 = B0(p2,Mhh2,Mhh2) 
coup1 = cplhhhhhh
coup2 = Conjg(cplhhhhhh)
    SumI = coup1*coup2*B0m2 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! conj[Hp], Hp 
!------------------------ 
sumI = 0._dp 
 
B0m2 = B0(p2,MHp2,MHp2) 
coup1 = cplhhHpcHp
coup2 = Conjg(cplhhHpcHp)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWp], Hp 
!------------------------ 
sumI = 0._dp 
 
F0m2 = Floop(p2,MHp2,MVWp2) 
coup1 = cplhhHpcVWp
coup2 =  Conjg(cplhhHpcVWp)
    SumI = coup1*coup2*F0m2 
res = res +2._dp* SumI  
!------------------------ 
! conj[VWp], VWp 
!------------------------ 
sumI = 0._dp 
 
F0m2 = 4._dp*Real(B0(p2,MVWp2,MVWp2) - 0.5_dp*rMS,dp) 
coup1 = cplhhcVWpVWp
coup2 =  Conjg(cplhhcVWpVWp)
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
!------------------------ 
! VZ, VZ 
!------------------------ 
sumI = 0._dp 
 
F0m2 = 4._dp*Real(B0(p2,MVZ2,MVZ2) - 0.5_dp*rMS,dp) 
coup1 = cplhhVZVZ
coup2 =  Conjg(cplhhVZVZ)
    SumI = coup1*coup2*F0m2 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
A0m2 = A0(MAh2) 
coup1 = cplAhAhhhhh
    SumI = -coup1*A0m2 
res = res +1._dp* SumI  
!------------------------ 
! etI, etI 
!------------------------ 
sumI = 0._dp 
 
A0m2 = A0(MetI2) 
coup1 = cpletIetIhhhh
    SumI = -coup1*A0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[etp], etp 
!------------------------ 
sumI = 0._dp 
 
A0m2 = A0(Metp2) 
coup1 = cpletphhhhcetp
    SumI = -coup1*A0m2 
res = res +1._dp* SumI  
!------------------------ 
! etR, etR 
!------------------------ 
sumI = 0._dp 
 
A0m2 = A0(MetR2) 
coup1 = cpletRetRhhhh
    SumI = -coup1*A0m2 
res = res +1._dp* SumI  
!------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
A0m2 = A0(Mhh2) 
coup1 = cplhhhhhhhh
    SumI = -coup1*A0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[Hp], Hp 
!------------------------ 
sumI = 0._dp 
 
A0m2 = A0(MHp2) 
coup1 = cplhhhhHpcHp
    SumI = -coup1*A0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWp], VWp 
!------------------------ 
sumI = 0._dp 
 
A0m2 = A0(MVWp2) - 0.5_dp*MVWp2*rMS
coup1 = cplhhhhcVWpVWp
    SumI = coup1*A0m2 
res = res +4._dp* SumI  
!------------------------ 
! VZ, VZ 
!------------------------ 
sumI = 0._dp 
 
A0m2 = A0(MVZ2) - 0.5_dp*MVZ2*rMS
coup1 = cplhhhhVZVZ
    SumI = coup1*A0m2 
res = res +2._dp* SumI  


res = oo16pi2*res 
 
End Subroutine Pi1Loophh 
 
Subroutine OneLoopetI(mEt2,lam4,lam3,lam5,v,MetR,MetR2,MAh,MAh2,MFv,MFv2,             & 
& MChi,MChi2,Mhh,Mhh2,MetI,MetI2,MHp,MHp2,Metp,Metp2,MVWp,MVWp2,MVZ,MVZ2,cplAhetIetR,    & 
& cplChiFvetIL,cplChiFvetIR,cpletIetIhh,cpletIetpcHp,cpletIetpcVWp,cpletIetRVZ,          & 
& cplAhAhetIetI,cpletIetIetIetI,cpletIetIetpcetp,cpletIetIetRetR,cpletIetIhhhh,          & 
& cpletIetIHpcHp,cpletIetIcVWpVWp,cpletIetIVZVZ,delta,mass,mass2,kont)

Real(dp), Intent(in) :: MetR,MetR2,MAh,MAh2,MFv(3),MFv2(3),MChi(3),MChi2(3),Mhh,Mhh2,MetI,MetI2,              & 
& MHp,MHp2,Metp,Metp2,MVWp,MVWp2,MVZ,MVZ2

Real(dp), Intent(in) :: lam5,v

Complex(dp), Intent(in) :: mEt2,lam4,lam3

Complex(dp), Intent(in) :: cplAhetIetR,cplChiFvetIL(3,3),cplChiFvetIR(3,3),cpletIetIhh,cpletIetpcHp,             & 
& cpletIetpcVWp,cpletIetRVZ,cplAhAhetIetI,cpletIetIetIetI,cpletIetIetpcetp,              & 
& cpletIetIetRetR,cpletIetIhhhh,cpletIetIHpcHp,cpletIetIcVWpVWp,cpletIetIVZVZ

Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count, ierr 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi, mi2, p2, test_m2 
Complex(dp) :: PiSf, sig 
Real(dp), Intent(out) :: mass, mass2 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopetI'
 
mi2 = MetI2 

 
p2 = MetI2
PiSf = ZeroC 
Call Pi1LoopetI(p2,MetR,MetR2,MAh,MAh2,MFv,MFv2,MChi,MChi2,Mhh,Mhh2,MetI,             & 
& MetI2,MHp,MHp2,Metp,Metp2,MVWp,MVWp2,MVZ,MVZ2,cplAhetIetR,cplChiFvetIL,cplChiFvetIR,   & 
& cpletIetIhh,cpletIetpcHp,cpletIetpcVWp,cpletIetRVZ,cplAhAhetIetI,cpletIetIetIetI,      & 
& cpletIetIetpcetp,cpletIetIetRetR,cpletIetIhhhh,cpletIetIHpcHp,cpletIetIcVWpVWp,        & 
& cpletIetIVZVZ,kont,PiSf)

mass2 = mi2 - Real(PiSf,dp) 
mass = sqrt(mass2) 
i_count = 0 
Do  
i_count = i_count + 1 
test_m2 = mass2 
p2 =  mass2 
PiSf = ZeroC 
Call Pi1LoopetI(p2,MetR,MetR2,MAh,MAh2,MFv,MFv2,MChi,MChi2,Mhh,Mhh2,MetI,             & 
& MetI2,MHp,MHp2,Metp,Metp2,MVWp,MVWp2,MVZ,MVZ2,cplAhetIetR,cplChiFvetIL,cplChiFvetIR,   & 
& cpletIetIhh,cpletIetpcHp,cpletIetpcVWp,cpletIetRVZ,cplAhAhetIetI,cpletIetIetIetI,      & 
& cpletIetIetpcetp,cpletIetIetRetR,cpletIetIhhhh,cpletIetIHpcHp,cpletIetIcVWpVWp,        & 
& cpletIetIVZVZ,kont,PiSf)

mass2 = mi2 - Real(PiSf,dp) 
mass = sqrt(mass2) 
 If (test_m2.Ne.0._dp) Then 
    test_m2 = Abs(test_m2 - mass2) / test_m2 
 Else 
    test_m2 = Abs(mass2) 
 End If 
 If (mass2.Ge.0._dp) Then 
    mass = sqrt(mass2) 
  Else 
 If (Abs(mass2).lt.1.0E-30_dp) test_m2 = 0._dp 
     Write(ErrCan,*) 'Warning from routine'//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
   SignOfMassChanged = .True. 
   mass = 0._dp 
  End If 
If (test_m2.LT.0.1_dp*delta) Exit 
If (i_count.Gt.30) Then 
  Write(*,*) "Problem in "//NameOfUnit(Iname), test_m2, mass2 
  kont = -510 
  Call AddError(510) 
 Exit 
End If 
End Do 
 
 
Iname = Iname -1 
End Subroutine OneLoopetI
 
 
Subroutine Pi1LoopetI(p2,MetR,MetR2,MAh,MAh2,MFv,MFv2,MChi,MChi2,Mhh,Mhh2,            & 
& MetI,MetI2,MHp,MHp2,Metp,Metp2,MVWp,MVWp2,MVZ,MVZ2,cplAhetIetR,cplChiFvetIL,           & 
& cplChiFvetIR,cpletIetIhh,cpletIetpcHp,cpletIetpcVWp,cpletIetRVZ,cplAhAhetIetI,         & 
& cpletIetIetIetI,cpletIetIetpcetp,cpletIetIetRetR,cpletIetIhhhh,cpletIetIHpcHp,         & 
& cpletIetIcVWpVWp,cpletIetIVZVZ,kont,res)

Implicit None 
Real(dp), Intent(in) :: MetR,MetR2,MAh,MAh2,MFv(3),MFv2(3),MChi(3),MChi2(3),Mhh,Mhh2,MetI,MetI2,              & 
& MHp,MHp2,Metp,Metp2,MVWp,MVWp2,MVZ,MVZ2

Complex(dp), Intent(in) :: cplAhetIetR,cplChiFvetIL(3,3),cplChiFvetIR(3,3),cpletIetIhh,cpletIetpcHp,             & 
& cpletIetpcVWp,cpletIetRVZ,cplAhAhetIetI,cpletIetIetIetI,cpletIetIetpcetp,              & 
& cpletIetIetRetR,cpletIetIhhhh,cpletIetIHpcHp,cpletIetIcVWpVWp,cpletIetIVZVZ

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumI 
Integer :: i1,i2,i3,i4,ierr 
 
 
res = 0._dp 
 
!------------------------ 
! etR, Ah 
!------------------------ 
sumI = 0._dp 
 
B0m2 = B0(p2,MetR2,MAh2) 
coup1 = cplAhetIetR
coup2 = Conjg(cplAhetIetR)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! Fv, Chi 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Gloop(p2,MFv2(i1),MChi2(i2)) 
B0m2 = -2._dp*MFv(i1)*MChi(i2)*B0(p2,MFv2(i1),MChi2(i2)) 
coupL1 = cplChiFvetIL(i2,i1)
coupR1 = cplChiFvetIR(i2,i1)
coupL2 =  Conjg(cplChiFvetIL(i2,i1))
coupR2 =  Conjg(cplChiFvetIR(i2,i1))
    SumI = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! hh, etI 
!------------------------ 
sumI = 0._dp 
 
B0m2 = B0(p2,Mhh2,MetI2) 
coup1 = cpletIetIhh
coup2 = Conjg(cpletIetIhh)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[Hp], etp 
!------------------------ 
sumI = 0._dp 
 
B0m2 = B0(p2,MHp2,Metp2) 
coup1 = cpletIetpcHp
coup2 = Conjg(cpletIetpcHp)
    SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! conj[VWp], etp 
!------------------------ 
sumI = 0._dp 
 
F0m2 = Floop(p2,Metp2,MVWp2) 
coup1 = cpletIetpcVWp
coup2 =  Conjg(cpletIetpcVWp)
    SumI = coup1*coup2*F0m2 
res = res +2._dp* SumI  
!------------------------ 
! VZ, etR 
!------------------------ 
sumI = 0._dp 
 
F0m2 = Floop(p2,MetR2,MVZ2) 
coup1 = cpletIetRVZ
coup2 =  Conjg(cpletIetRVZ)
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
!------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
A0m2 = A0(MAh2) 
coup1 = cplAhAhetIetI
    SumI = -coup1*A0m2 
res = res +1._dp* SumI  
!------------------------ 
! etI, etI 
!------------------------ 
sumI = 0._dp 
 
A0m2 = A0(MetI2) 
coup1 = cpletIetIetIetI
    SumI = -coup1*A0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[etp], etp 
!------------------------ 
sumI = 0._dp 
 
A0m2 = A0(Metp2) 
coup1 = cpletIetIetpcetp
    SumI = -coup1*A0m2 
res = res +1._dp* SumI  
!------------------------ 
! etR, etR 
!------------------------ 
sumI = 0._dp 
 
A0m2 = A0(MetR2) 
coup1 = cpletIetIetRetR
    SumI = -coup1*A0m2 
res = res +1._dp* SumI  
!------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
A0m2 = A0(Mhh2) 
coup1 = cpletIetIhhhh
    SumI = -coup1*A0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[Hp], Hp 
!------------------------ 
sumI = 0._dp 
 
A0m2 = A0(MHp2) 
coup1 = cpletIetIHpcHp
    SumI = -coup1*A0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWp], VWp 
!------------------------ 
sumI = 0._dp 
 
A0m2 = A0(MVWp2) - 0.5_dp*MVWp2*rMS
coup1 = cpletIetIcVWpVWp
    SumI = coup1*A0m2 
res = res +4._dp* SumI  
!------------------------ 
! VZ, VZ 
!------------------------ 
sumI = 0._dp 
 
A0m2 = A0(MVZ2) - 0.5_dp*MVZ2*rMS
coup1 = cpletIetIVZVZ
    SumI = coup1*A0m2 
res = res +2._dp* SumI  


res = oo16pi2*res 
 
End Subroutine Pi1LoopetI 
 
Subroutine OneLoopetR(mEt2,lam4,lam3,lam5,v,MetI,MetI2,MAh,MAh2,MFv,MFv2,             & 
& MChi,MChi2,MVZ,MVZ2,MHp,MHp2,Metp,Metp2,MVWp,MVWp2,Mhh,Mhh2,MetR,MetR2,cplAhetIetR,    & 
& cplChiFvetRL,cplChiFvetRR,cpletIetRVZ,cpletpetRcHp,cpletpetRcVWp,cpletRetRhh,          & 
& cplAhAhetRetR,cpletIetIetRetR,cpletpetRetRcetp,cpletRetRetRetR,cpletRetRhhhh,          & 
& cpletRetRHpcHp,cpletRetRcVWpVWp,cpletRetRVZVZ,delta,mass,mass2,kont)

Real(dp), Intent(in) :: MetI,MetI2,MAh,MAh2,MFv(3),MFv2(3),MChi(3),MChi2(3),MVZ,MVZ2,MHp,MHp2,Metp,           & 
& Metp2,MVWp,MVWp2,Mhh,Mhh2,MetR,MetR2

Real(dp), Intent(in) :: lam5,v

Complex(dp), Intent(in) :: mEt2,lam4,lam3

Complex(dp), Intent(in) :: cplAhetIetR,cplChiFvetRL(3,3),cplChiFvetRR(3,3),cpletIetRVZ,cpletpetRcHp,             & 
& cpletpetRcVWp,cpletRetRhh,cplAhAhetRetR,cpletIetIetRetR,cpletpetRetRcetp,              & 
& cpletRetRetRetR,cpletRetRhhhh,cpletRetRHpcHp,cpletRetRcVWpVWp,cpletRetRVZVZ

Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count, ierr 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi, mi2, p2, test_m2 
Complex(dp) :: PiSf, sig 
Real(dp), Intent(out) :: mass, mass2 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopetR'
 
mi2 = MetR2 

 
p2 = MetR2
PiSf = ZeroC 
Call Pi1LoopetR(p2,MetI,MetI2,MAh,MAh2,MFv,MFv2,MChi,MChi2,MVZ,MVZ2,MHp,              & 
& MHp2,Metp,Metp2,MVWp,MVWp2,Mhh,Mhh2,MetR,MetR2,cplAhetIetR,cplChiFvetRL,               & 
& cplChiFvetRR,cpletIetRVZ,cpletpetRcHp,cpletpetRcVWp,cpletRetRhh,cplAhAhetRetR,         & 
& cpletIetIetRetR,cpletpetRetRcetp,cpletRetRetRetR,cpletRetRhhhh,cpletRetRHpcHp,         & 
& cpletRetRcVWpVWp,cpletRetRVZVZ,kont,PiSf)

mass2 = mi2 - Real(PiSf,dp) 
mass = sqrt(mass2) 
i_count = 0 
Do  
i_count = i_count + 1 
test_m2 = mass2 
p2 =  mass2 
PiSf = ZeroC 
Call Pi1LoopetR(p2,MetI,MetI2,MAh,MAh2,MFv,MFv2,MChi,MChi2,MVZ,MVZ2,MHp,              & 
& MHp2,Metp,Metp2,MVWp,MVWp2,Mhh,Mhh2,MetR,MetR2,cplAhetIetR,cplChiFvetRL,               & 
& cplChiFvetRR,cpletIetRVZ,cpletpetRcHp,cpletpetRcVWp,cpletRetRhh,cplAhAhetRetR,         & 
& cpletIetIetRetR,cpletpetRetRcetp,cpletRetRetRetR,cpletRetRhhhh,cpletRetRHpcHp,         & 
& cpletRetRcVWpVWp,cpletRetRVZVZ,kont,PiSf)

mass2 = mi2 - Real(PiSf,dp) 
mass = sqrt(mass2) 
 If (test_m2.Ne.0._dp) Then 
    test_m2 = Abs(test_m2 - mass2) / test_m2 
 Else 
    test_m2 = Abs(mass2) 
 End If 
 If (mass2.Ge.0._dp) Then 
    mass = sqrt(mass2) 
  Else 
 If (Abs(mass2).lt.1.0E-30_dp) test_m2 = 0._dp 
     Write(ErrCan,*) 'Warning from routine'//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
   SignOfMassChanged = .True. 
   mass = 0._dp 
  End If 
If (test_m2.LT.0.1_dp*delta) Exit 
If (i_count.Gt.30) Then 
  Write(*,*) "Problem in "//NameOfUnit(Iname), test_m2, mass2 
  kont = -510 
  Call AddError(510) 
 Exit 
End If 
End Do 
 
 
Iname = Iname -1 
End Subroutine OneLoopetR
 
 
Subroutine Pi1LoopetR(p2,MetI,MetI2,MAh,MAh2,MFv,MFv2,MChi,MChi2,MVZ,MVZ2,            & 
& MHp,MHp2,Metp,Metp2,MVWp,MVWp2,Mhh,Mhh2,MetR,MetR2,cplAhetIetR,cplChiFvetRL,           & 
& cplChiFvetRR,cpletIetRVZ,cpletpetRcHp,cpletpetRcVWp,cpletRetRhh,cplAhAhetRetR,         & 
& cpletIetIetRetR,cpletpetRetRcetp,cpletRetRetRetR,cpletRetRhhhh,cpletRetRHpcHp,         & 
& cpletRetRcVWpVWp,cpletRetRVZVZ,kont,res)

Implicit None 
Real(dp), Intent(in) :: MetI,MetI2,MAh,MAh2,MFv(3),MFv2(3),MChi(3),MChi2(3),MVZ,MVZ2,MHp,MHp2,Metp,           & 
& Metp2,MVWp,MVWp2,Mhh,Mhh2,MetR,MetR2

Complex(dp), Intent(in) :: cplAhetIetR,cplChiFvetRL(3,3),cplChiFvetRR(3,3),cpletIetRVZ,cpletpetRcHp,             & 
& cpletpetRcVWp,cpletRetRhh,cplAhAhetRetR,cpletIetIetRetR,cpletpetRetRcetp,              & 
& cpletRetRetRetR,cpletRetRhhhh,cpletRetRHpcHp,cpletRetRcVWpVWp,cpletRetRVZVZ

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumI 
Integer :: i1,i2,i3,i4,ierr 
 
 
res = 0._dp 
 
!------------------------ 
! etI, Ah 
!------------------------ 
sumI = 0._dp 
 
B0m2 = B0(p2,MetI2,MAh2) 
coup1 = cplAhetIetR
coup2 = Conjg(cplAhetIetR)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! Fv, Chi 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Gloop(p2,MFv2(i1),MChi2(i2)) 
B0m2 = -2._dp*MFv(i1)*MChi(i2)*B0(p2,MFv2(i1),MChi2(i2)) 
coupL1 = cplChiFvetRL(i2,i1)
coupR1 = cplChiFvetRR(i2,i1)
coupL2 =  Conjg(cplChiFvetRL(i2,i1))
coupR2 =  Conjg(cplChiFvetRR(i2,i1))
    SumI = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VZ, etI 
!------------------------ 
sumI = 0._dp 
 
F0m2 = Floop(p2,MetI2,MVZ2) 
coup1 = cpletIetRVZ
coup2 =  Conjg(cpletIetRVZ)
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[Hp], etp 
!------------------------ 
sumI = 0._dp 
 
B0m2 = B0(p2,MHp2,Metp2) 
coup1 = cpletpetRcHp
coup2 = Conjg(cpletpetRcHp)
    SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! conj[VWp], etp 
!------------------------ 
sumI = 0._dp 
 
F0m2 = Floop(p2,Metp2,MVWp2) 
coup1 = cpletpetRcVWp
coup2 =  Conjg(cpletpetRcVWp)
    SumI = coup1*coup2*F0m2 
res = res +2._dp* SumI  
!------------------------ 
! hh, etR 
!------------------------ 
sumI = 0._dp 
 
B0m2 = B0(p2,Mhh2,MetR2) 
coup1 = cpletRetRhh
coup2 = Conjg(cpletRetRhh)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
A0m2 = A0(MAh2) 
coup1 = cplAhAhetRetR
    SumI = -coup1*A0m2 
res = res +1._dp* SumI  
!------------------------ 
! etI, etI 
!------------------------ 
sumI = 0._dp 
 
A0m2 = A0(MetI2) 
coup1 = cpletIetIetRetR
    SumI = -coup1*A0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[etp], etp 
!------------------------ 
sumI = 0._dp 
 
A0m2 = A0(Metp2) 
coup1 = cpletpetRetRcetp
    SumI = -coup1*A0m2 
res = res +1._dp* SumI  
!------------------------ 
! etR, etR 
!------------------------ 
sumI = 0._dp 
 
A0m2 = A0(MetR2) 
coup1 = cpletRetRetRetR
    SumI = -coup1*A0m2 
res = res +1._dp* SumI  
!------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
A0m2 = A0(Mhh2) 
coup1 = cpletRetRhhhh
    SumI = -coup1*A0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[Hp], Hp 
!------------------------ 
sumI = 0._dp 
 
A0m2 = A0(MHp2) 
coup1 = cpletRetRHpcHp
    SumI = -coup1*A0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWp], VWp 
!------------------------ 
sumI = 0._dp 
 
A0m2 = A0(MVWp2) - 0.5_dp*MVWp2*rMS
coup1 = cpletRetRcVWpVWp
    SumI = coup1*A0m2 
res = res +4._dp* SumI  
!------------------------ 
! VZ, VZ 
!------------------------ 
sumI = 0._dp 
 
A0m2 = A0(MVZ2) - 0.5_dp*MVZ2*rMS
coup1 = cpletRetRVZVZ
    SumI = coup1*A0m2 
res = res +2._dp* SumI  


res = oo16pi2*res 
 
End Subroutine Pi1LoopetR 
 
Subroutine OneLoopVZ(g1,g2,v,TW,Mhh,Mhh2,MAh,MAh2,MetR,MetR2,MetI,MetI2,              & 
& Metp,Metp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MHp,MHp2,MVWp,MVWp2,           & 
& cplAhhhVZ,cpletIetRVZ,cpletpcetpVZ,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,    & 
& cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcgWpgWpVZ,cplcgWCgWCVZ,               & 
& cplhhVZVZ,cplHpcHpVZ,cplHpcVWpVZ,cplcVWpVWpVZ,cplAhAhVZVZ,cpletIetIVZVZ,               & 
& cpletpcetpVZVZ,cpletRetRVZVZ,cplhhhhVZVZ,cplHpcHpVZVZ,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2, & 
& cplcVWpVWpVZVZ3,delta,mass,mass2,kont)

Real(dp), Intent(in) :: Mhh,Mhh2,MAh,MAh2,MetR,MetR2,MetI,MetI2,Metp,Metp2,MFd(3),MFd2(3),MFe(3),             & 
& MFe2(3),MFu(3),MFu2(3),MFv(3),MFv2(3),MVZ,MVZ2,MHp,MHp2,MVWp,MVWp2

Real(dp), Intent(in) :: g1,g2,v,TW

Complex(dp), Intent(in) :: cplAhhhVZ,cpletIetRVZ,cpletpcetpVZ,cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFeVZL(3,3),& 
& cplcFeFeVZR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplFvFvVZL(3,3),cplFvFvVZR(3,3),    & 
& cplcgWpgWpVZ,cplcgWCgWCVZ,cplhhVZVZ,cplHpcHpVZ,cplHpcVWpVZ,cplcVWpVWpVZ,               & 
& cplAhAhVZVZ,cpletIetIVZVZ,cpletpcetpVZVZ,cpletRetRVZVZ,cplhhhhVZVZ,cplHpcHpVZVZ,       & 
& cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3

Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count, ierr 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi, mi2, p2, test_m2 
Complex(dp) :: PiSf, sig 
Real(dp), Intent(out) :: mass, mass2 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopVZ'
 
mi2 = MVZ2 

 
p2 = MVZ2
PiSf = ZeroC 
Call Pi1LoopVZ(p2,Mhh,Mhh2,MAh,MAh2,MetR,MetR2,MetI,MetI2,Metp,Metp2,MFd,             & 
& MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MHp,MHp2,MVWp,MVWp2,cplAhhhVZ,cpletIetRVZ,    & 
& cpletpcetpVZ,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,              & 
& cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcgWpgWpVZ,cplcgWCgWCVZ,cplhhVZVZ,cplHpcHpVZ,      & 
& cplHpcVWpVZ,cplcVWpVWpVZ,cplAhAhVZVZ,cpletIetIVZVZ,cpletpcetpVZVZ,cpletRetRVZVZ,       & 
& cplhhhhVZVZ,cplHpcHpVZVZ,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,              & 
& kont,PiSf)

mass2 = mi2 + Real(PiSf,dp) 
mass = sqrt(mass2) 
i_count = 0 
Do  
i_count = i_count + 1 
test_m2 = mass2 
p2 =  mass2 
PiSf = ZeroC 
Call Pi1LoopVZ(p2,Mhh,Mhh2,MAh,MAh2,MetR,MetR2,MetI,MetI2,Metp,Metp2,MFd,             & 
& MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MHp,MHp2,MVWp,MVWp2,cplAhhhVZ,cpletIetRVZ,    & 
& cpletpcetpVZ,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,              & 
& cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcgWpgWpVZ,cplcgWCgWCVZ,cplhhVZVZ,cplHpcHpVZ,      & 
& cplHpcVWpVZ,cplcVWpVWpVZ,cplAhAhVZVZ,cpletIetIVZVZ,cpletpcetpVZVZ,cpletRetRVZVZ,       & 
& cplhhhhVZVZ,cplHpcHpVZVZ,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,              & 
& kont,PiSf)

mass2 = mi2 + Real(PiSf,dp) 
mass = sqrt(mass2) 
 If (test_m2.Ne.0._dp) Then 
    test_m2 = Abs(test_m2 - mass2) / test_m2 
 Else 
    test_m2 = Abs(mass2) 
 End If 
 If (mass2.Ge.0._dp) Then 
    mass = sqrt(mass2) 
  Else 
 If (Abs(mass2).lt.1.0E-30_dp) test_m2 = 0._dp 
     Write(ErrCan,*) 'Warning from routine'//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
   SignOfMassChanged = .True. 
   mass = 0._dp 
  End If 
If (test_m2.LT.0.1_dp*delta) Exit 
If (i_count.Gt.30) Then 
  Write(*,*) "Problem in "//NameOfUnit(Iname), test_m2, mass2 
  kont = -510 
  Call AddError(510) 
 Exit 
End If 
End Do 
 
 
Iname = Iname -1 
End Subroutine OneLoopVZ
 
 
Subroutine Pi1LoopVZ(p2,Mhh,Mhh2,MAh,MAh2,MetR,MetR2,MetI,MetI2,Metp,Metp2,           & 
& MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MHp,MHp2,MVWp,MVWp2,cplAhhhVZ,            & 
& cpletIetRVZ,cpletpcetpVZ,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,              & 
& cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcgWpgWpVZ,cplcgWCgWCVZ,               & 
& cplhhVZVZ,cplHpcHpVZ,cplHpcVWpVZ,cplcVWpVWpVZ,cplAhAhVZVZ,cpletIetIVZVZ,               & 
& cpletpcetpVZVZ,cpletRetRVZVZ,cplhhhhVZVZ,cplHpcHpVZVZ,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2, & 
& cplcVWpVWpVZVZ3,kont,res)

Implicit None 
Real(dp), Intent(in) :: Mhh,Mhh2,MAh,MAh2,MetR,MetR2,MetI,MetI2,Metp,Metp2,MFd(3),MFd2(3),MFe(3),             & 
& MFe2(3),MFu(3),MFu2(3),MFv(3),MFv2(3),MVZ,MVZ2,MHp,MHp2,MVWp,MVWp2

Complex(dp), Intent(in) :: cplAhhhVZ,cpletIetRVZ,cpletpcetpVZ,cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFeVZL(3,3),& 
& cplcFeFeVZR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplFvFvVZL(3,3),cplFvFvVZR(3,3),    & 
& cplcgWpgWpVZ,cplcgWCgWCVZ,cplhhVZVZ,cplHpcHpVZ,cplHpcVWpVZ,cplcVWpVWpVZ,               & 
& cplAhAhVZVZ,cpletIetIVZVZ,cpletpcetpVZVZ,cpletRetRVZVZ,cplhhhhVZVZ,cplHpcHpVZVZ,       & 
& cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2, A0m12, A0m22 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
B22m2 = -4._dp*B00(p2,MAh2,Mhh2)  
coup1 = cplAhhhVZ
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
!------------------------ 
! etR, etI 
!------------------------ 
sumI = 0._dp 
 
B22m2 = -4._dp*B00(p2,MetI2,MetR2)  
coup1 = cpletIetRVZ
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[etp], etp 
!------------------------ 
sumI = 0._dp 
 
B22m2 = -4._dp*B00(p2,Metp2,Metp2)  
coup1 = cpletpcetpVZ
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Hloop(p2,MFd2(i1),MFd2(i2)) 
B0m2 = 4._dp*MFd(i1)*MFd(i2)*B0(p2,MFd2(i1),MFd2(i2)) 
coupL1 = cplcFdFdVZL(i1,i2)
coupR1 = cplcFdFdVZR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Hloop(p2,MFe2(i1),MFe2(i2)) 
B0m2 = 4._dp*MFe(i1)*MFe(i2)*B0(p2,MFe2(i1),MFe2(i2)) 
coupL1 = cplcFeFeVZL(i1,i2)
coupR1 = cplcFeFeVZR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Hloop(p2,MFu2(i1),MFu2(i2)) 
B0m2 = 4._dp*MFu(i1)*MFu(i2)*B0(p2,MFu2(i1),MFu2(i2)) 
coupL1 = cplcFuFuVZL(i1,i2)
coupR1 = cplcFuFuVZR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Hloop(p2,MFv2(i1),MFv2(i2)) 
B0m2 = 4._dp*MFv(i1)*MFv(i2)*B0(p2,MFv2(i1),MFv2(i2)) 
coupL1 = cplFvFvVZL(i1,i2)
coupR1 = cplFvFvVZR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWp], gWp 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = B00(p2,MVWp2,MVWp2)
coup1 = cplcgWpgWpVZ
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWpC], gWpC 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = B00(p2,MVWp2,MVWp2)
coup1 = cplcgWCgWCVZ
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! VZ, hh 
!------------------------ 
sumI = 0._dp 
 
B0m2 = B0(p2,MVZ2,Mhh2) 
coup1 = cplhhVZVZ
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[Hp], Hp 
!------------------------ 
sumI = 0._dp 
 
B22m2 = -4._dp*B00(p2,MHp2,MHp2)  
coup1 = cplHpcHpVZ
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWp], Hp 
!------------------------ 
sumI = 0._dp 
 
B0m2 = B0(p2,MVWp2,MHp2) 
coup1 = cplHpcVWpVZ
    SumI = Abs(coup1)**2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! conj[VWp], VWp 
!------------------------ 
sumI = 0._dp 
 
B0m2 = 10._dp*B00(p2,MVWp2,MVWp2)+(MVWp2+MVWp2+4._dp*p2)*B0(p2,MVWp2,MVWp2)
A0m12 = A0(MVWp2) 
A0m22 =A0(MVWp2) 
coup1 = cplcVWpVWpVZ
coup2 = Conjg(coup1) 
    SumI = -2._dp*rMS*(MVWp2+MVWp2-p2/3._dp)+A0m12+A0m22+B0m2  
    SumI = -SumI*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! Ah 
!------------------------ 
SumI = 0._dp 
 A0m2 = A0(MAh2)
 coup1 = cplAhAhVZVZ
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! etI 
!------------------------ 
SumI = 0._dp 
 A0m2 = A0(MetI2)
 coup1 = cpletIetIVZVZ
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! conj[etp] 
!------------------------ 
SumI = 0._dp 
 A0m2 = A0(Metp2)
 coup1 = cpletpcetpVZVZ
 SumI = coup1*A0m2 
res = res +1* SumI  
!------------------------ 
! etR 
!------------------------ 
SumI = 0._dp 
 A0m2 = A0(MetR2)
 coup1 = cpletRetRVZVZ
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! hh 
!------------------------ 
SumI = 0._dp 
 A0m2 = A0(Mhh2)
 coup1 = cplhhhhVZVZ
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! conj[Hp] 
!------------------------ 
SumI = 0._dp 
 A0m2 = A0(MHp2)
 coup1 = cplHpcHpVZVZ
 SumI = coup1*A0m2 
res = res +1* SumI  
!------------------------ 
! conj[VWp] 
!------------------------ 
SumI = 0._dp 
A0m2 = A0(MVWp2) 
coup1 = cplcVWpVWpVZVZ1
coup2 = cplcVWpVWpVZVZ2
coup3 = cplcVWpVWpVZVZ3
SumI = (2._dp*rMS*coup1*MVWp2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
res = oo16pi2*res 
 
End Subroutine Pi1LoopVZ 
 
Subroutine OneLoopVWp(g2,v,MHp,MHp2,MAh,MAh2,Metp,Metp2,MetI,MetI2,MetR,              & 
& MetR2,MFd,MFd2,MFu,MFu2,MFe,MFe2,MFv,MFv2,Mhh,Mhh2,MVWp,MVWp2,MVZ,MVZ2,cplAhHpcVWp,    & 
& cpletIetpcVWp,cpletpetRcVWp,cplcFdFucVWpL,cplcFdFucVWpR,cplcFeFvcVWpL,cplcFeFvcVWpR,   & 
& cplcgWCgAcVWp,cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgWCgZcVWp,cplhhHpcVWp,cplhhcVWpVWp,      & 
& cplHpcVWpVP,cplHpcVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,cplAhAhcVWpVWp,cpletIetIcVWpVWp,     & 
& cpletpcetpcVWpVWp,cpletRetRcVWpVWp,cplhhhhcVWpVWp,cplHpcHpcVWpVWp,cplcVWpVPVPVWp3,     & 
& cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3,cplcVWpcVWpVWpVWp1,& 
& cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,delta,mass,mass2,kont)

Real(dp), Intent(in) :: MHp,MHp2,MAh,MAh2,Metp,Metp2,MetI,MetI2,MetR,MetR2,MFd(3),MFd2(3),MFu(3),             & 
& MFu2(3),MFe(3),MFe2(3),MFv(3),MFv2(3),Mhh,Mhh2,MVWp,MVWp2,MVZ,MVZ2

Real(dp), Intent(in) :: g2,v

Complex(dp), Intent(in) :: cplAhHpcVWp,cpletIetpcVWp,cpletpetRcVWp,cplcFdFucVWpL(3,3),cplcFdFucVWpR(3,3),        & 
& cplcFeFvcVWpL(3,3),cplcFeFvcVWpR(3,3),cplcgWCgAcVWp,cplcgAgWpcVWp,cplcgZgWpcVWp,       & 
& cplcgWCgZcVWp,cplhhHpcVWp,cplhhcVWpVWp,cplHpcVWpVP,cplHpcVWpVZ,cplcVWpVPVWp,           & 
& cplcVWpVWpVZ,cplAhAhcVWpVWp,cpletIetIcVWpVWp,cpletpcetpcVWpVWp,cpletRetRcVWpVWp,       & 
& cplhhhhcVWpVWp,cplHpcHpcVWpVWp,cplcVWpVPVPVWp3,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,        & 
& cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3,cplcVWpcVWpVWpVWp1,cplcVWpVWpVZVZ1,              & 
& cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3

Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count, ierr 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi, mi2, p2, test_m2 
Complex(dp) :: PiSf, sig 
Real(dp), Intent(out) :: mass, mass2 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopVWp'
 
mi2 = MVWp2 

 
p2 = MVWp2
PiSf = ZeroC 
Call Pi1LoopVWp(p2,MHp,MHp2,MAh,MAh2,Metp,Metp2,MetI,MetI2,MetR,MetR2,MFd,            & 
& MFd2,MFu,MFu2,MFe,MFe2,MFv,MFv2,Mhh,Mhh2,MVWp,MVWp2,MVZ,MVZ2,cplAhHpcVWp,              & 
& cpletIetpcVWp,cpletpetRcVWp,cplcFdFucVWpL,cplcFdFucVWpR,cplcFeFvcVWpL,cplcFeFvcVWpR,   & 
& cplcgWCgAcVWp,cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgWCgZcVWp,cplhhHpcVWp,cplhhcVWpVWp,      & 
& cplHpcVWpVP,cplHpcVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,cplAhAhcVWpVWp,cpletIetIcVWpVWp,     & 
& cpletpcetpcVWpVWp,cpletRetRcVWpVWp,cplhhhhcVWpVWp,cplHpcHpcVWpVWp,cplcVWpVPVPVWp3,     & 
& cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3,cplcVWpcVWpVWpVWp1,& 
& cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,kont,PiSf)

mass2 = mi2 + Real(PiSf,dp) 
mass = sqrt(mass2) 
i_count = 0 
Do  
i_count = i_count + 1 
test_m2 = mass2 
p2 =  mass2 
PiSf = ZeroC 
Call Pi1LoopVWp(p2,MHp,MHp2,MAh,MAh2,Metp,Metp2,MetI,MetI2,MetR,MetR2,MFd,            & 
& MFd2,MFu,MFu2,MFe,MFe2,MFv,MFv2,Mhh,Mhh2,MVWp,MVWp2,MVZ,MVZ2,cplAhHpcVWp,              & 
& cpletIetpcVWp,cpletpetRcVWp,cplcFdFucVWpL,cplcFdFucVWpR,cplcFeFvcVWpL,cplcFeFvcVWpR,   & 
& cplcgWCgAcVWp,cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgWCgZcVWp,cplhhHpcVWp,cplhhcVWpVWp,      & 
& cplHpcVWpVP,cplHpcVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,cplAhAhcVWpVWp,cpletIetIcVWpVWp,     & 
& cpletpcetpcVWpVWp,cpletRetRcVWpVWp,cplhhhhcVWpVWp,cplHpcHpcVWpVWp,cplcVWpVPVPVWp3,     & 
& cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3,cplcVWpcVWpVWpVWp1,& 
& cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,kont,PiSf)

mass2 = mi2 + Real(PiSf,dp) 
mass = sqrt(mass2) 
 If (test_m2.Ne.0._dp) Then 
    test_m2 = Abs(test_m2 - mass2) / test_m2 
 Else 
    test_m2 = Abs(mass2) 
 End If 
 If (mass2.Ge.0._dp) Then 
    mass = sqrt(mass2) 
  Else 
 If (Abs(mass2).lt.1.0E-30_dp) test_m2 = 0._dp 
     Write(ErrCan,*) 'Warning from routine'//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
   SignOfMassChanged = .True. 
   mass = 0._dp 
  End If 
If (test_m2.LT.0.1_dp*delta) Exit 
If (i_count.Gt.30) Then 
  Write(*,*) "Problem in "//NameOfUnit(Iname), test_m2, mass2 
  kont = -510 
  Call AddError(510) 
 Exit 
End If 
End Do 
 
 
Iname = Iname -1 
End Subroutine OneLoopVWp
 
 
Subroutine Pi1LoopVWp(p2,MHp,MHp2,MAh,MAh2,Metp,Metp2,MetI,MetI2,MetR,MetR2,          & 
& MFd,MFd2,MFu,MFu2,MFe,MFe2,MFv,MFv2,Mhh,Mhh2,MVWp,MVWp2,MVZ,MVZ2,cplAhHpcVWp,          & 
& cpletIetpcVWp,cpletpetRcVWp,cplcFdFucVWpL,cplcFdFucVWpR,cplcFeFvcVWpL,cplcFeFvcVWpR,   & 
& cplcgWCgAcVWp,cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgWCgZcVWp,cplhhHpcVWp,cplhhcVWpVWp,      & 
& cplHpcVWpVP,cplHpcVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,cplAhAhcVWpVWp,cpletIetIcVWpVWp,     & 
& cpletpcetpcVWpVWp,cpletRetRcVWpVWp,cplhhhhcVWpVWp,cplHpcHpcVWpVWp,cplcVWpVPVPVWp3,     & 
& cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3,cplcVWpcVWpVWpVWp1,& 
& cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,kont,res)

Implicit None 
Real(dp), Intent(in) :: MHp,MHp2,MAh,MAh2,Metp,Metp2,MetI,MetI2,MetR,MetR2,MFd(3),MFd2(3),MFu(3),             & 
& MFu2(3),MFe(3),MFe2(3),MFv(3),MFv2(3),Mhh,Mhh2,MVWp,MVWp2,MVZ,MVZ2

Complex(dp), Intent(in) :: cplAhHpcVWp,cpletIetpcVWp,cpletpetRcVWp,cplcFdFucVWpL(3,3),cplcFdFucVWpR(3,3),        & 
& cplcFeFvcVWpL(3,3),cplcFeFvcVWpR(3,3),cplcgWCgAcVWp,cplcgAgWpcVWp,cplcgZgWpcVWp,       & 
& cplcgWCgZcVWp,cplhhHpcVWp,cplhhcVWpVWp,cplHpcVWpVP,cplHpcVWpVZ,cplcVWpVPVWp,           & 
& cplcVWpVWpVZ,cplAhAhcVWpVWp,cpletIetIcVWpVWp,cpletpcetpcVWpVWp,cpletRetRcVWpVWp,       & 
& cplhhhhcVWpVWp,cplHpcHpcVWpVWp,cplcVWpVPVPVWp3,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,        & 
& cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3,cplcVWpcVWpVWpVWp1,cplcVWpVWpVZVZ1,              & 
& cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2, A0m12, A0m22 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! Hp, Ah 
!------------------------ 
sumI = 0._dp 
 
B22m2 = -4._dp*B00(p2,MAh2,MHp2)  
coup1 = cplAhHpcVWp
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
!------------------------ 
! etp, etI 
!------------------------ 
sumI = 0._dp 
 
B22m2 = -4._dp*B00(p2,MetI2,Metp2)  
coup1 = cpletIetpcVWp
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
!------------------------ 
! etR, etp 
!------------------------ 
sumI = 0._dp 
 
B22m2 = -4._dp*B00(p2,Metp2,MetR2)  
coup1 = cpletpetRcVWp
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[Fd], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Hloop(p2,MFd2(i1),MFu2(i2)) 
B0m2 = 4._dp*MFd(i1)*MFu(i2)*B0(p2,MFd2(i1),MFu2(i2)) 
coupL1 = cplcFdFucVWpL(i1,i2)
coupR1 = cplcFdFucVWpR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Hloop(p2,MFe2(i1),MFv2(i2)) 
B0m2 = 4._dp*MFe(i1)*MFv(i2)*B0(p2,MFe2(i1),MFv2(i2)) 
coupL1 = cplcFeFvcVWpL(i1,i2)
coupR1 = cplcFeFvcVWpR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWpC], gP 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = B00(p2,0._dp,MVWp2)
coup1 = cplcgWCgAcVWp
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gP], gWp 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = B00(p2,MVWp2,0._dp)
coup1 = cplcgAgWpcVWp
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZ], gWp 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = B00(p2,MVWp2,MVZ2)
coup1 = cplcgZgWpcVWp
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWpC], gZ 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = B00(p2,MVZ2,MVWp2)
coup1 = cplcgWCgZcVWp
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! Hp, hh 
!------------------------ 
sumI = 0._dp 
 
B22m2 = -4._dp*B00(p2,Mhh2,MHp2)  
coup1 = cplhhHpcVWp
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
!------------------------ 
! VWp, hh 
!------------------------ 
sumI = 0._dp 
 
B0m2 = B0(p2,MVWp2,Mhh2) 
coup1 = cplhhcVWpVWp
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! VP, Hp 
!------------------------ 
sumI = 0._dp 
 
B0m2 = B0(p2,0._dp,MHp2) 
coup1 = cplHpcVWpVP
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! VZ, Hp 
!------------------------ 
sumI = 0._dp 
 
B0m2 = B0(p2,MVZ2,MHp2) 
coup1 = cplHpcVWpVZ
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! VWp, VP 
!------------------------ 
sumI = 0._dp 
 
B0m2 = 10._dp*B00(p2,MVWp2,0._dp)+(MVWp2+0._dp+4._dp*p2)*B0(p2,MVWp2,0._dp)
A0m12 = A0(MVWp2) 
A0m22 =A0(0._dp) 
coup1 = cplcVWpVPVWp
coup2 = Conjg(coup1) 
    SumI = -2._dp*rMS*(MVWp2+0._dp-p2/3._dp)+A0m12+A0m22+B0m2  
    SumI = -SumI*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! VZ, VWp 
!------------------------ 
sumI = 0._dp 
 
B0m2 = 10._dp*B00(p2,MVZ2,MVWp2)+(MVZ2+MVWp2+4._dp*p2)*B0(p2,MVZ2,MVWp2)
A0m12 = A0(MVZ2) 
A0m22 =A0(MVWp2) 
coup1 = cplcVWpVWpVZ
coup2 = Conjg(coup1) 
    SumI = -2._dp*rMS*(MVZ2+MVWp2-p2/3._dp)+A0m12+A0m22+B0m2  
    SumI = -SumI*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! Ah 
!------------------------ 
SumI = 0._dp 
 A0m2 = A0(MAh2)
 coup1 = cplAhAhcVWpVWp
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! etI 
!------------------------ 
SumI = 0._dp 
 A0m2 = A0(MetI2)
 coup1 = cpletIetIcVWpVWp
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! conj[etp] 
!------------------------ 
SumI = 0._dp 
 A0m2 = A0(Metp2)
 coup1 = cpletpcetpcVWpVWp
 SumI = coup1*A0m2 
res = res +1* SumI  
!------------------------ 
! etR 
!------------------------ 
SumI = 0._dp 
 A0m2 = A0(MetR2)
 coup1 = cpletRetRcVWpVWp
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! hh 
!------------------------ 
SumI = 0._dp 
 A0m2 = A0(Mhh2)
 coup1 = cplhhhhcVWpVWp
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! conj[Hp] 
!------------------------ 
SumI = 0._dp 
 A0m2 = A0(MHp2)
 coup1 = cplHpcHpcVWpVWp
 SumI = coup1*A0m2 
res = res +1* SumI  
!------------------------ 
! VP 
!------------------------ 
SumI = 0._dp 
A0m2 = A0(0._dp) 
coup1 = cplcVWpVPVPVWp3
coup2 = cplcVWpVPVPVWp1
coup3 = cplcVWpVPVPVWp2
SumI = (2._dp*rMS*coup1*0._dp-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1._dp/2._dp* SumI  
!------------------------ 
! conj[VWp] 
!------------------------ 
SumI = 0._dp 
A0m2 = A0(MVWp2) 
coup1 = cplcVWpcVWpVWpVWp2
coup2 = cplcVWpcVWpVWpVWp3
coup3 = cplcVWpcVWpVWpVWp1
SumI = (2._dp*rMS*coup1*MVWp2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
!------------------------ 
! VZ 
!------------------------ 
SumI = 0._dp 
A0m2 = A0(MVZ2) 
coup1 = cplcVWpVWpVZVZ1
coup2 = cplcVWpVWpVZVZ2
coup3 = cplcVWpVWpVZVZ3
SumI = (2._dp*rMS*coup1*MVZ2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1._dp/2._dp* SumI  
res = oo16pi2*res 
 
End Subroutine Pi1LoopVWp 
 
End Module LoopMasses_Scotogenic 

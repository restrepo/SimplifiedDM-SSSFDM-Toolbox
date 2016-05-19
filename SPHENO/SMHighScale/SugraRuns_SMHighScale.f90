! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.8.5 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 17:43 on 2.5.2016   
! ----------------------------------------------------------------------  
 
 
Module SugraRuns_SMHighScale 
 
Use Control 
Use LoopCouplings_SMHighScale 
Use LoopMasses_SMHighScale 
Use LoopFunctions 
Use Mathematics 
Use Model_Data_SMHighScale 
Use RGEs_SMHighScale 
Use Tadpoles_SMHighScale 
 Use CouplingsForDecays_SMHighScale 
Use StandardModel 
 
Integer, save :: YukScen 
Real(dp), save :: Lambda, MlambdaS,F_GMSB 
Real(dp),save::mGUT_save,sinW2_DR_mZ&
&,mf_l_DR_SM(3),mf_d_DR_SM(3),mf_u_DR_SM(3)
Complex(dp),save::Yl_mZ(3,3),Yu_mZ(3,3),Yd_mZ(3,3)
Real(dp),Save::vevs_DR_save(2)
Contains 
 
Subroutine BoundarySUSY(gA,gB) 
Implicit None 
Real(dp),Intent(in)::gA(:)
Real(dp),Intent(out)::gB(:)
Integer::i1,i2,i_count,kont
Complex(dp) :: Tad1Loop(1) 
Real(dp) :: comp(1) 
Complex(dp) :: cplcUFdFdhhL(3,3),cplcUFdFdhhR(3,3),cplcUFuFuhhL(3,3),cplcUFuFuhhR(3,3),              & 
& cplcUFeFehhL(3,3),cplcUFeFehhR(3,3),cplhhHpcHp,cplhhcHpVWp,cplhhhhHpcHp,               & 
& cplAhAhhh,cplAhhhVZ,cplAhAhhhhh,cplcFdFdhhL(3,3),cplcFdFdhhR(3,3),cplcFeFehhL(3,3),    & 
& cplcFeFehhR(3,3),cplcFuFuhhL(3,3),cplcFuFuhhR(3,3),cplcgWpgWphh,cplcgWCgWChh,          & 
& cplcgZgZhh,cplhhhhhh,cplhhHpcVWp,cplhhcVWpVWp,cplhhVZVZ,cplhhhhhhhh,cplhhhhcVWpVWp,    & 
& cplhhhhVZVZ

Real(dp) :: g1,g2,g3

Complex(dp) :: Lam,Yu(3,3),Yd(3,3),Ye(3,3)

Iname=Iname+1
NameOfUnit(Iname)='BoundarySUSY'
Call GToParameters59(gA,g1,g2,g3,Lam,Yu,Yd,Ye)


 
 ! --- Remove GUT-normalization of gauge couplings --- 
g1 = Sqrt(3._dp/5._dp)*g1 
! ----------------------- 
 

 
 ! --- Boundary conditions at SUSY-scale --- 
If (HighScaleModel.ne."LOW") Then 
 else If (HighScaleModel.Eq."LOW") Then 
 ! Setting values 
 Mu = MuIN 
 Lam = LamIN 
 End if
 
 ! ----------------------- 
 
If (.Not.FirstRun) Then 
v = vSUSY 

 
 ! --- Boundary conditions at SUSY-scale --- 
If (HighScaleModel.ne."LOW") Then 
 else If (HighScaleModel.Eq."LOW") Then 
 ! Setting values 
 Mu = MuIN 
 Lam = LamIN 
 End if
 
 ! ----------------------- 
 
End if 

 
 ! --- GUT normalize gauge couplings --- 
g1 = Sqrt(5._dp/3._dp)*g1 
! ----------------------- 
 
Call ParametersToG59(g1,g2,g3,Lam,Yu,Yd,Ye,gB)

Iname=Iname-1
End Subroutine BoundarySUSY 
 
Subroutine BoundaryHS(gA,gB) 
Implicit None 
Real(dp),Intent(in)::gA(:)
Real(dp),Intent(out)::gB(:)
Integer::i1,i2
Real(dp) :: g1,g2,g3

Complex(dp) :: Lam,Yu(3,3),Yd(3,3),Ye(3,3)

Iname=Iname+1
NameOfUnit(Iname)='BoundaryHS'
Call GToParameters59(gA,g1,g2,g3,Lam,Yu,Yd,Ye)

If (HighScaleModel.ne."LOW") Then 
 If (InputValueforLam) Then 
Lam = LamIN 
Else 
Lam = LambdaIN
End If 
If (InputValueforMu) Then 
Mu = MuIN 
Else 
Mu = 0
End If 
else If (HighScaleModel.Eq."LOW") Then 
 ! Setting values 
 Mu = MuIN 
 Lam = LamIN 
 End if
 
 MuGUT =Mu
g1GUT =g1
g2GUT =g2
g3GUT =g3
LamGUT =Lam
YuGUT =Yu
YdGUT =Yd
YeGUT =Ye
If (Maxval(Abs(Yu)).gt.3._dp) Then 
Write(*,*) "Non pertubative coupling at GUT scale Yu" 
If (ErrorLevel.gt.0) Call TerminateProgram 
End if 
If (Maxval(Abs(Yd)).gt.3._dp) Then 
Write(*,*) "Non pertubative coupling at GUT scale Yd" 
If (ErrorLevel.gt.0) Call TerminateProgram 
End if 
If (Maxval(Abs(Ye)).gt.3._dp) Then 
Write(*,*) "Non pertubative coupling at GUT scale Ye" 
If (ErrorLevel.gt.0) Call TerminateProgram 
End if 
If (Abs(g1).gt.3._dp) Then 
Write(*,*) "Non pertubative coupling at GUT scale appearing for: g1" 
If (ErrorLevel.gt.0) Call TerminateProgram 
End if 
If (Abs(g2).gt.3._dp) Then 
Write(*,*) "Non pertubative coupling at GUT scale appearing for: g2" 
If (ErrorLevel.gt.0) Call TerminateProgram 
End if 
If (Abs(g3).gt.3._dp) Then 
Write(*,*) "Non pertubative coupling at GUT scale appearing for: g3" 
If (ErrorLevel.gt.0) Call TerminateProgram 
End if 
Call ParametersToG61(g1,g2,g3,Lam,Yu,Yd,Ye,Mu,gB)

Iname=Iname-1
End Subroutine BoundaryHS 
 
Subroutine BoundaryEW(i_run,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,             & 
& MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,ZW,ZZ,v,g1,g2,g3,              & 
& Lam,Yu,Yd,Ye,Mu,delta0,gMZ,kont)

Implicit None 
Real(dp),Intent(out)::gMZ(:)
Real(dp),Intent(inout) :: g1,g2,g3

Complex(dp),Intent(inout) :: Lam,Yu(3,3),Yd(3,3),Ye(3,3),Mu

Real(dp),Intent(inout) :: MAh,MAh2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),Mhh,Mhh2,MHp,MHp2,              & 
& MVWp,MVWp2,MVZ,MVZ2,TW,ZZ(2,2)

Complex(dp),Intent(inout) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZW(2,2)

Real(dp),Intent(inout) :: v

Complex(dp) :: cplAhcHpVWp,cplhhcHpVWp,cplHpcHpVZ,cplcHpVPVWp,cplcHpVWpVZ,cplHpcHpcVWpVWp,           & 
& cplHpcHpVZVZ,cplAhhhVZ,cplAhHpcVWp,cplAhAhcVWpVWp,cplAhAhVZVZ,cplhhHpcVWp,             & 
& cplhhcVWpVWp,cplhhVZVZ,cplhhhhcVWpVWp,cplhhhhVZVZ,cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),   & 
& cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcFvFvVZL(3,3),  & 
& cplcFvFvVZR(3,3),cplcgWpgWpVZ,cplcgWCgWCVZ,cplHpcVWpVZ,cplcVWpVWpVZ,cplcVWpVWpVZVZ1,   & 
& cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,cplcFdFucVWpL(3,3),cplcFdFucVWpR(3,3),cplcFeFvcVWpL(3,3),& 
& cplcFeFvcVWpR(3,3),cplcgWCgAcVWp,cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgWCgZcVWp,            & 
& cplHpcVWpVP,cplcVWpVPVWp,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,cplcVWpVPVPVWp3,              & 
& cplcVWpcVWpVWpVWp1,cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3

Complex(dp) :: cplcUFdFdAhL(3,3),cplcUFdFdAhR(3,3),cplcUFdFdhhL(3,3),cplcUFdFdhhR(3,3),              & 
& cplcUFdFdVGL(3,3),cplcUFdFdVGR(3,3),cplcUFdFdVPL(3,3),cplcUFdFdVPR(3,3),               & 
& cplcUFdFdVZL(3,3),cplcUFdFdVZR(3,3),cplcUFdFucHpL(3,3),cplcUFdFucHpR(3,3),             & 
& cplcUFdFucVWpL(3,3),cplcUFdFucVWpR(3,3),cplcUFuFuAhL(3,3),cplcUFuFuAhR(3,3),           & 
& cplcUFuFdHpL(3,3),cplcUFuFdHpR(3,3),cplcUFuFdVWpL(3,3),cplcUFuFdVWpR(3,3),             & 
& cplcUFuFuhhL(3,3),cplcUFuFuhhR(3,3),cplcUFuFuVGL(3,3),cplcUFuFuVGR(3,3),               & 
& cplcUFuFuVPL(3,3),cplcUFuFuVPR(3,3),cplcUFuFuVZL(3,3),cplcUFuFuVZR(3,3),               & 
& cplcUFeFeAhL(3,3),cplcUFeFeAhR(3,3),cplcUFeFehhL(3,3),cplcUFeFehhR(3,3),               & 
& cplcUFeFeVPL(3,3),cplcUFeFeVPR(3,3),cplcUFeFeVZL(3,3),cplcUFeFeVZR(3,3),               & 
& cplcUFeFvcHpL(3,3),cplcUFeFvcHpR(3,3),cplcUFeFvcVWpL(3,3),cplcUFeFvcVWpR(3,3)

Integer, Intent(in) :: i_run 
Real(dp), Intent(in) :: delta0 
Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4 
Iname=Iname+1
NameOfUnit(Iname)='BoundaryEW'

 
 ! --- Boundary conditions at EW-scale --- 
! ----------------------- 
 
Call RunSMohdm(MZ,0.001_dp, g1,g2,g3,Yu,Yd,Ye,v) 
vMZ =v 
YuMZ = Y_u 
YdMZ = Y_d 
YeMZ = Y_l 
Call SolveTadpoleEquations(g1,g2,g3,Lam,Yu,Yd,Ye,Mu,v,(/ ZeroC /))


 
 ! --- GUT normalize gauge couplings --- 
g1 = Sqrt(5._dp/3._dp)*g1 
! ----------------------- 
 
Call ParametersToG59(g1,g2,g3,Lam,Yu,Yd,Ye,gMZ)

Iname=Iname-1

End Subroutine BoundaryEW 
 
Subroutine Sugra(delta0,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHp,             & 
& MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,ZW,ZZ,g1,g2,g3,Lam,Yu,             & 
& Yd,Ye,Mu,mGut,kont,WriteComment,niter)

Implicit None
Logical,Intent(in) :: WriteComment
Integer,Intent(inout) :: kont
Integer,Intent(in) :: niter
Real(dp) :: delta0,deltaG0, gA(61), gB(59)
Real(dp) :: gC(62),  gD(62) 
Real(dp),Intent(out) :: mGUT
Complex(dp) :: Tad1Loop(1) 
Real(dp) :: comp(1), tanbQ, vev2 
Complex(dp) :: cplcUFdFdhhL(3,3),cplcUFdFdhhR(3,3),cplcUFuFuhhL(3,3),cplcUFuFuhhR(3,3),              & 
& cplcUFeFehhL(3,3),cplcUFeFehhR(3,3),cplhhHpcHp,cplhhcHpVWp,cplhhhhHpcHp,               & 
& cplAhAhhh,cplAhhhVZ,cplAhAhhhhh,cplcFdFdhhL(3,3),cplcFdFdhhR(3,3),cplcFeFehhL(3,3),    & 
& cplcFeFehhR(3,3),cplcFuFuhhL(3,3),cplcFuFuhhR(3,3),cplcgWpgWphh,cplcgWCgWChh,          & 
& cplcgZgZhh,cplhhhhhh,cplhhHpcVWp,cplhhcVWpVWp,cplhhVZVZ,cplhhhhhhhh,cplhhhhcVWpVWp,    & 
& cplhhhhVZVZ

Real(dp),Intent(inout) :: MAh,MAh2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),Mhh,Mhh2,MHp,MHp2,              & 
& MVWp,MVWp2,MVZ,MVZ2,TW,ZZ(2,2)

Complex(dp),Intent(inout) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZW(2,2)

Real(dp),Intent(inout) :: g1,g2,g3

Complex(dp),Intent(inout) :: Lam,Yu(3,3),Yd(3,3),Ye(3,3),Mu

Real(dp) ::mass_new(12),mass_old(12),diff_m(12)
Real(dp) :: tz,dt,q,q2,mudim,mudimNew, vev, sinW2 
Logical::FoundResult, SignMassChangedSave 
Integer::j,n_tot, i_count, i1, i2 
Iname=Iname+1
NameOfUnit(Iname)='Sugra'
kont=0
FoundResult= .False.
n_tot =1
mass_old(n_tot:n_tot+2) = MFd
n_tot = n_tot + 3 
mass_old(n_tot:n_tot+2) = MFu
n_tot = n_tot + 3 
mass_old(n_tot:n_tot+2) = MFe
n_tot = n_tot + 3 
mass_old(n_tot:n_tot+0) = MHp
n_tot = n_tot + 1 
mass_old(n_tot:n_tot+0) = MAh
n_tot = n_tot + 1 
mass_old(n_tot:n_tot+0) = Mhh
If (.Not.UseFixedScale) Then 
mudim=Max(mZ**2,Abs(v**2)) 
Call SetRGEScale(mudim) 
UseFixedScale= .False. 
End If 
Write(*,*) "Calculating mass spectrum" 
CalculateOneLoopMassesSave = CalculateOneLoopMasses 
CalculateOneLoopMasses = .false. 
Do j=1,niter 
Write(*,*) "  ", j,".-iteration" 
Write(ErrCan,*) "sugra ", j,".-iteration" 
Call BoundaryEW(j,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,              & 
& MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,ZW,ZZ,v,g1,g2,g3,Lam,Yu,Yd,             & 
& Ye,Mu,delta0,gB,kont)

If (kont.Ne.0) Then
Iname=Iname-1
    Write(*,*) " Problem with boundary conditions at EW scale" 
    Call TerminateProgram
End If
 
Call RunRGE(kont,0.1_dp*delta0,gB,gA,mGUT)
 
Call GToParameters61(gA,g1,g2,g3,Lam,Yu,Yd,Ye,Mu)


 
 ! --- Remove GUT-normalization of gauge couplings --- 
g1 = Sqrt(3._dp/5._dp)*g1 
! ----------------------- 
 
If (kont.Ne.0) Then
Iname=Iname-1
    Write(*,*) " RGE running not possible. Errorcode:", kont 
    Call TerminateProgram
End If
mudim=GetRenormalizationScale() 
Q=Sqrt(mudim) 
Q2=mudim 
tz=Log(Q/mZ)
dt=-tz/50._dp

 
 ! --- Boundary conditions at SUSY-scale --- 
If (HighScaleModel.ne."LOW") Then 
 else If (HighScaleModel.Eq."LOW") Then 
 ! Setting values 
 Mu = MuIN 
 Lam = LamIN 
 End if
 
 ! ----------------------- 
 
Call SolveTadpoleEquations(g1,g2,g3,Lam,Yu,Yd,Ye,Mu,v,(/ ZeroC /))


 
 ! --- GUT normalize gauge couplings --- 
g1 = Sqrt(5._dp/3._dp)*g1 
! ----------------------- 
 
Call ParametersToG62(g1,g2,g3,Lam,Yu,Yd,Ye,Mu,v,gC)

Call odeint(gC,62,tz,0._dp,0.1_dp*delta0,dt,0._dp,rge62,kont)
Call GToParameters62(gC,g1,g2,g3,Lam,Yu,Yd,Ye,Mu,v)


 
 ! --- Remove GUT-normalization of gauge couplings --- 
g1 = Sqrt(3._dp/5._dp)*g1 
! ----------------------- 
 

 
 ! --- Boundary conditions at EW-scale --- 
! ----------------------- 
 
Call SolveTadpoleEquations(g1,g2,g3,Lam,Yu,Yd,Ye,Mu,v,(/ ZeroC /))

vMZ = v 

 
 ! --- GUT normalize gauge couplings --- 
g1 = Sqrt(5._dp/3._dp)*g1 
! ----------------------- 
 
Call ParametersToG62(g1,g2,g3,Lam,Yu,Yd,Ye,Mu,v,gD)

tz=Log(mZ/Q)
dt=-tz/50._dp
Call odeint(gD,62,tz,0._dp,0.1_dp*delta0,dt,0._dp,rge62,kont)
Call GToParameters62(gD,g1,g2,g3,Lam,Yu,Yd,Ye,Mu,v)


 
 ! --- Remove GUT-normalization of gauge couplings --- 
g1 = Sqrt(3._dp/5._dp)*g1 
! ----------------------- 
 


vev2=4._dp*Real(mZ2,dp)/(g1**2+g2**2) -0._dp
v=Sqrt(vev2)
vSUSY = v 

 
 ! --- Boundary conditions at SUSY-scale --- 
If (HighScaleModel.ne."LOW") Then 
 else If (HighScaleModel.Eq."LOW") Then 
 ! Setting values 
 Mu = MuIN 
 Lam = LamIN 
 End if
 
 ! ----------------------- 
 
Call SolveTadpoleEquations(g1,g2,g3,Lam,Yu,Yd,Ye,Mu,v,(/ ZeroC /))

Call OneLoopMasses(MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,             & 
& MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,ZW,ZZ,v,g1,g2,g3,Lam,Yu,Yd,             & 
& Ye,Mu,kont)

 FirstRun = .False. 
If (kont.Ne.0) Then
Iname=Iname-1
    Write(*,*) " Problem in SugraRuns. Errorcode:", kont 
    If (kont.eq.-12) Then 
      Write(*,*) "Stepsize underflow in rkqs (most likely due to a Landau pole) " 
    Else If ((kont.eq.-1).or.(kont.eq.-5).or.(kont.eq.-9)) Then 
      Write(*,*) "Stepsize smaller than minimum." 
    Else If ((kont.eq.-2).or.(kont.eq.-6).or.(kont.eq.-10)) Then 
      Write(*,*) "Running values larger 10^36." 
    Else If ((kont.eq.-3).or.(kont.eq.-7).or.(kont.eq.-11)) Then 
      Write(*,*) "Too many steps: Running has not converged." 
    Else If ((kont.eq.-4).or.(kont.eq.-8)) Then 
      Write(*,*) "No GUT scale found." 
End If
    Call TerminateProgram
End If
n_tot =1
mass_new(n_tot:n_tot+2) = MFd
n_tot = n_tot + 3 
mass_new(n_tot:n_tot+2) = MFu
n_tot = n_tot + 3 
mass_new(n_tot:n_tot+2) = MFe
n_tot = n_tot + 3 
mass_new(n_tot:n_tot+0) = MHp
n_tot = n_tot + 1 
mass_new(n_tot:n_tot+0) = MAh
n_tot = n_tot + 1 
mass_new(n_tot:n_tot+0) = Mhh
Where (mass_new.lt.1E-10_dp) mass_new=0._dp 
diff_m=Abs(mass_new-mass_old)
Where (Abs(mass_old).Gt.0._dp) diff_m=diff_m/Abs(mass_old)
deltag0=Maxval(diff_m)
Write(*,*) "  ... reached precision:", deltag0 
If (WriteComment) Write(*,*) "Sugra,Comparing",deltag0
If ((deltag0.Lt.delta0).And.(j.Gt.1)) Then! require at least two iterations
   FoundResult= .True.
If (SignOfMassChanged) Then
  If (.Not.IgnoreNegativeMasses) Then
  Write(*,*) " Mass spectrum converged, but negative mass squared present." 
   Call TerminateProgram 
  Else 
   SignOfMassChanged = .False. 
   kont = 0 
  End If
End If
If (SignOfMuChanged) Then
  If (.Not.IgnoreMuSignFlip) Then
  Write(*,*) " Mass spectrum converged, but negative |mu|^2 from tadpoles." 
   Call TerminateProgram 
  Else 
   SignOfMuChanged = .False. 
   kont = 0 
  End If
End If
Exit
Else
If (SignOfMassChanged) Then
  If ((j.ge.MinimalNumberIterations).And.(.Not.IgnoreNegativeMasses)) Then
  Write(*,*) " Still a negative mass squared after ",MinimalNumberIterations," iterations. Stop calculation. "  
   Call TerminateProgram 
  Else 
   SignOfMassChanged = .False. 
   kont = 0 
  End If
End If
If (SignOfMuChanged) Then
  If ((j.ge.MinimalNumberIterations).And.(.Not.IgnoreMuSignFlip)) Then
  Write(*,*) " Still a negative |mu|^2 after ",MinimalNumberIterations," iterations. Stop calculation. "  
   Call TerminateProgram 
  Else 
   SignOfMuChanged = .False. 
   kont = 0 
  End If
End If
mass_old=mass_new 
If (.Not.UseFixedScale) Then 
mudimNew=Max(mZ**2,Abs(v**2)) 
If (HighScaleModel.eq."LOW") GUT_Scale = sqrt(mudimNew) 
 UseFixedScale= .False. 
End If 
If (j.lt.niter) Then 
Call GToParameters62(gC,g1,g2,g3,Lam,Yu,Yd,Ye,Mu,v)

v = vMZ 

 
 ! --- Remove GUT-normalization of gauge couplings --- 
g1 = Sqrt(3._dp/5._dp)*g1 
! ----------------------- 
 

 
 ! --- Boundary conditions at EW-scale when running down --- 
! ----------------------- 
 

 
 ! --- Boundary conditions at EW-scale --- 
! ----------------------- 
 
Call SolveTadpoleEquations(g1,g2,g3,Lam,Yu,Yd,Ye,Mu,v,(/ ZeroC /))


 
 ! --- Boundary conditions at EW-scale --- 
! ----------------------- 
 
If (IgnoreNegativeMassesMZ) Then 
  SignMassChangedSave = SignOfMassChanged 
End if 
Call TreeMasses(MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,           & 
& MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,ZW,ZZ,v,g1,g2,g3,Lam,Yu,Yd,Ye,               & 
& Mu,GenerationMixing,kont)

If (IgnoreNegativeMassesMZ) Then 
  SignOfMassChanged = SignMassChangedSave  
End if 
If (.Not.UseFixedScale) Then 
Call SetRGEScale(mudimNew) 
UseFixedScale= .False. 
End If 
Else
  FoundIterativeSolution = .False. 
End if
End If
End Do
If (CalculateOneLoopMassesSave) Then 
CalculateOneLoopMasses =  CalculateOneLoopMassesSave 
Write(*,*) "Calculate loop corrected masses " 
Call OneLoopMasses(MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,             & 
& MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,ZW,ZZ,v,g1,g2,g3,Lam,Yu,Yd,             & 
& Ye,Mu,kont)

If (SignOfMassChanged) Then
  If (.Not.IgnoreNegativeMasses) Then
  Write(*,*) " Mass spectrum converged, but negative mass squared present." 
   Call TerminateProgram 
  Else 
   SignOfMassChanged = .False. 
   kont = 0 
  End If
End If
If (SignOfMuChanged) Then
  If (.Not.IgnoreMuSignFlip) Then
  Write(*,*) " Mass spectrum converged, but negative |mu|^2 from tadpoles." 
   Call TerminateProgram 
  Else 
   SignOfMuChanged = .False. 
   kont = 0 
  End If
End If
End if 
Iname=Iname-1
 
End Subroutine Sugra
 
Subroutine RunRGE(kont, delta0, g1A, g1C, mGUT)
Implicit None
Integer,Intent(inout)::kont
Real(dp),Intent(in)::delta0
Integer :: i1, i2, i3, i4 
Real(dp),Intent(inout)::g1A(59)
Real(dp),Intent(out)::g1C(61),mGUT
Real(dp)::tz,dt,t_out 
Real(dp)::mudim,gGUT,gA_h(59),g1b(59),m_hi,m_lo
Real(dp)::g1S(59)
Logical :: FoundUnification, unified, greater 

Iname=Iname+1
NameOfUnit(Iname)='runRGE'

If (.Not.UseFixedGUTScale) Then
m_lo=5.e12_dp
Else 
m_lo=Min(5.e12_dp,GUT_Scale)
End If 
mudim=GetRenormalizationScale()
mudim=Max(mudim,mZ2)
tz=0.5_dp*Log(mZ2/mudim)
dt=tz/100._dp
Call odeint(g1A,59,tz,0._dp,delta0,dt,0._dp,rge59,kont)

If (kont.Ne.0) Then 
  Iname=Iname-1 
  Write(*,*) " Problem with RGE running. Errorcode:", kont 
  Call TerminateProgram 
End If 
Call BoundarySUSY(g1a,g1B)

FoundUnification= .False. 
tz=Log(sqrt(mudim)/m_lo)
dt=-tz/50._dp

Call odeint(g1B,59,tz,0._dp,delta0,dt,0._dp,rge59,kont)

If (kont.Ne.0) Then 
Iname=Iname-1 
  Write(*,*) " Problem with RGE running. Errorcode:", kont 
Call TerminateProgram 
End If 
If (.Not.UseFixedGUTScale) Then
tz=Log(m_lo/1.e20_dp)
dt=-tz/50._dp

Call odeintB2(g1B,59,tz,0._dp,delta0,dt,0._dp,rge59,checkGUT59,t_out,kont)

If (kont.Eq.0) Then
FoundUnification= .True. 
mGUT=1.e20_dp*Exp(t_out)
gGUT=Sqrt(0.5_dp*(g1b(1)**2+g1b(2)**2))
If (StrictUnification) g1b(3)=gGUT
Else
Write(ErrCan,*) "kont",kont,delta0,tz,dt
Write (ErrCan,*) "t_out",t_out,1.e20_dp*Exp(t_out)
Write(ErrCan,*) " "
Iname=Iname-1
Return
End If
Else
  tz=Log(m_lo/GUT_scale)
  mGUT=GUT_scale
  dt=-tz/50._dp
Call odeint(g1B,59,tz,0._dp,delta0,dt,0._dp,rge59,kont)

If (kont.Ne.0) Then 
Iname=Iname-1 
  Write(*,*) " Problem with RGE running. Errorcode:", kont 
Call TerminateProgram 
End If 
End If

mGUT_Save=mGUT
Call BoundaryHS(g1B,g1c)

mudim=GetRenormalizationScale()
mudim=Max(mudim,mZ2)
tz=0.5_dp*Log(mudim/mGUT_save**2)
dt=tz/100._dp
Call odeint(g1c,61,0._dp,tz,delta0,dt,0._dp,rge61,kont)
Iname=Iname-1
Contains 

Function InverseMatrix(M) Result(Inv) 
Implicit None
Complex(dp), Intent(in) :: M(:,:) 
Complex(dp) :: Inv(Size(M,1),Size(M,2)) 

inv = M 
Call gaussj(kont,inv,Size(M,1),Size(M,2)) 
End Function InverseMatrix 

End Subroutine RunRGE

Subroutine checkGUT59(y,eps,unified,greater)  
Implicit None 
Real(dp), Intent(in) :: y(59), eps 
Logical, Intent(out) :: unified, greater 
Call GToParameters59(y,g1,g2,g3,Lam,Yu,Yd,Ye)

If ((((g1)-(g2)).Gt.0._dp).And.(((g1)-(g2)).Lt.eps)) Then 
  unified = .True. 
Else 
   unified = .False. 
End If 
If ((g1).Gt.(g2)) Then 
  greater = .True. 
Else 
  greater = .False. 
End If 
End Subroutine checkGUT59
 
Subroutine FirstGuess(MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHp,               & 
& MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,ZW,ZZ,v,g1,g2,g3,Lam,              & 
& Yu,Yd,Ye,Mu,kont)

Implicit None 
Real(dp),Intent(out) :: g1,g2,g3

Complex(dp),Intent(out) :: Lam,Yu(3,3),Yd(3,3),Ye(3,3),Mu

Real(dp),Intent(out) :: MAh,MAh2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),Mhh,Mhh2,MHp,MHp2,              & 
& MVWp,MVWp2,MVZ,MVZ2,TW,ZZ(2,2)

Complex(dp),Intent(out) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZW(2,2)

Integer,Intent(inout)::kont
Integer :: i1, i2
Real(dp),Intent(inout) :: v

Real(dp):: gauge(3),vev,vevs(2),vev2,mgut,mudim,mudimNew,sigma(2),mt,mb,cosW,cosW2,sinW2 
Complex(dp):: Y_l(3,3), Y_d(3,3), Y_u(3,3) 
Real(dp) :: k_fac 
Real(dp), Parameter :: oo2pi=1._dp/(2._dp*pi),oo6pi=oo2pi/3._dp 
Real(dp):: gA(59), gB(61), Scale_Save 
Logical::TwoLoopRGE_save, UseFixedScale_save 
Real(dp) :: VEVSM1,VEVSM2,VEVSM1MZ,VEVSM2MZ 
Iname=Iname+1 
NameOfUnit(Iname)="FirstGuess" 
If (HighScaleModel.eq."LOW") UseFixedGUTScale = .true. 

mW2=mZ2*(0.5_dp+Sqrt(0.25_dp-Alpha_Mz*pi/(sqrt2*G_F*mZ2)))
mW=Sqrt(mW2) 
cosW2=mw2/mZ2 
sinW2=1._dp-cosW2 
cosW=Sqrt(cosW2) 
 
 k_fac=1._dp-alpha*(oo6pi & 
  &-oo2pi*(57._dp*Log(10._dp)+16._dp*Log(mf_u(3)/mZ))/9._dp) 
gauge(1)=Sqrt(20._dp*pi*alpha_mZ/(k_fac*3._dp*(1._dp-sinW2))) 
gauge(2)=Sqrt(4._dp*pi*alpha_mZ/(k_fac*sinW2)) 
 k_fac=1-AlphaS_mZ*oo2pi*(0.5_dp-4._dp*Log(10._dp) &
  &-2._dp*Log(mf_u(3)/mZ)/3._dp) 
gauge(3)=Sqrt(4._dp*pi*alphas_mZ) 
gauge(3)=Sqrt(4._dp*pi*alphas_mZ/k_fac) 
 
vev=2._dp*mW/gauge(2) 
v = vev 
Call RunSMohdm(MZ,0.001_dp,gauge(1),gauge(2),gauge(3),Y_u,Y_d,Y_l,v) 
TwoLoopRGE_save=TwoLoopRGE 
UseFixedScale_save = UseFixedScale 
Scale_save=GetRenormalizationScale() 
UseFixedScale = .True. 
Call SetRGEScale(mZ2) 
g1 = gauge(1)*Sqrt(3._dp/5._dp) 
g2 = gauge(2) 
g3 = gauge(3) 
Yu = Transpose(Y_u) 
Yd = Transpose(Y_d) 
Ye = Transpose(Y_l) 
 
 ! 1. Run 
 

 
 ! --- Boundary conditions at EW-scale --- 
! ----------------------- 
 

 
 ! --- Boundary conditions at SUSY-scale --- 
If (HighScaleModel.ne."LOW") Then 
 else If (HighScaleModel.Eq."LOW") Then 
 ! Setting values 
 Mu = MuIN 
 Lam = LamIN 
 End if
 
 ! ----------------------- 
 

 
 ! --- GUT normalize gauge couplings --- 
g1 = Sqrt(5._dp/3._dp)*g1 
! ----------------------- 
 


Call ParametersToG59(g1,g2,g3,Lam,Yu,Yd,Ye,gA)

If (.Not.UseFixedScale) Then 
  If (HighScaleModel.eq."LOW") Then 
     mudim=1000._dp**2 
   Else 
    mudim= Real(10000, dp) 
    mudim=Max(mf_u2(3),mudim) 
  End if  
   Call SetRGEScale(mudim) 
   UseFixedScale= .False. 
Else 
  mudim=GetRenormalizationScale() 
End If 
If (HighScaleModel.eq."LOW") GUT_Scale = sqrt(mudim) 
 TwoLoopRGE= .False. 
kont=0 
Call RunRGE(kont,0.001_dp,gA,gB,mGUT) 
If (kont.Ne.0) Then 
Iname=Iname-1 
    Write(*,*) " Problem with RGE running. Errorcode:", kont 
    Call TerminateProgram
End if 
Call GToParameters61(gB,g1,g2,g3,Lam,Yu,Yd,Ye,Mu)


 
 ! --- Remove GUT-normalization of gauge couplings --- 
g1 = Sqrt(3._dp/5._dp)*g1 
! ----------------------- 
 



 
 ! --- Boundary conditions at EW-scale when running down --- 
! ----------------------- 
 
g1 = gauge(1)*Sqrt(3._dp/5._dp) 
g2 = gauge(2) 
g3 = gauge(3) 
Yu = Transpose(Y_u) 
Yd = Transpose(Y_d) 
Ye = Transpose(Y_l) 
 
 ! 2. Run 
 

 
 ! --- Boundary conditions at EW-scale --- 
! ----------------------- 
 

 
 ! --- Boundary conditions at SUSY-scale --- 
If (HighScaleModel.ne."LOW") Then 
 else If (HighScaleModel.Eq."LOW") Then 
 ! Setting values 
 Mu = MuIN 
 Lam = LamIN 
 End if
 
 ! ----------------------- 
 

 
 ! --- GUT normalize gauge couplings --- 
g1 = Sqrt(5._dp/3._dp)*g1 
! ----------------------- 
 


Call ParametersToG59(g1,g2,g3,Lam,Yu,Yd,Ye,gA)

If (.Not.UseFixedScale) Then 
  If (HighScaleModel.eq."LOW") Then 
     mudim=1000._dp**2 
   Else 
    mudim= Real(10000, dp) 
    mudim=Max(mf_u2(3),mudim) 
  End if  
   Call SetRGEScale(mudim) 
   UseFixedScale= .False. 
Else 
  mudim=GetRenormalizationScale() 
End If 
If (HighScaleModel.eq."LOW") GUT_Scale = sqrt(mudim) 
 TwoLoopRGE= .False. 
kont=0 
Call RunRGE(kont,0.001_dp,gA,gB,mGUT) 
If (kont.Ne.0) Then 
Iname=Iname-1 
    Write(*,*) " Problem with RGE running. Errorcode:", kont 
    Call TerminateProgram
End if 
Call GToParameters61(gB,g1,g2,g3,Lam,Yu,Yd,Ye,Mu)


 
 ! --- Remove GUT-normalization of gauge couplings --- 
g1 = Sqrt(3._dp/5._dp)*g1 
! ----------------------- 
 



 
 ! --- Boundary conditions at EW-scale when running down --- 
! ----------------------- 
 
g1 = gauge(1)*Sqrt(3._dp/5._dp) 
g2 = gauge(2) 
g3 = gauge(3) 
Yu = Transpose(Y_u) 
Yd = Transpose(Y_d) 
Ye = Transpose(Y_l) 
 
 ! 3. Run 
 

 
 ! --- Boundary conditions at EW-scale --- 
! ----------------------- 
 

 
 ! --- Boundary conditions at SUSY-scale --- 
If (HighScaleModel.ne."LOW") Then 
 else If (HighScaleModel.Eq."LOW") Then 
 ! Setting values 
 Mu = MuIN 
 Lam = LamIN 
 End if
 
 ! ----------------------- 
 

 
 ! --- GUT normalize gauge couplings --- 
g1 = Sqrt(5._dp/3._dp)*g1 
! ----------------------- 
 


Call ParametersToG59(g1,g2,g3,Lam,Yu,Yd,Ye,gA)

Call SetRGEScale(Scale_save) 
UseFixedScale = UseFixedScale_save 
If (.Not.UseFixedScale) Then 
  If (HighScaleModel.eq."LOW") Then 
     mudim=1000._dp**2 
   Else 
    mudim= Real(10000, dp) 
    mudim=Max(mf_u2(3),mudim) 
  End if  
   Call SetRGEScale(mudim) 
   UseFixedScale= .False. 
Else 
  mudim=GetRenormalizationScale() 
End If 
If (HighScaleModel.eq."LOW") GUT_Scale = sqrt(mudim) 
 TwoLoopRGE= .False. 
kont=0 
Call RunRGE(kont,0.001_dp,gA,gB,mGUT) 
If (kont.Ne.0) Then 
Iname=Iname-1 
    Write(*,*) " Problem with RGE running. Errorcode:", kont 
    Call TerminateProgram
End if 
Call GToParameters61(gB,g1,g2,g3,Lam,Yu,Yd,Ye,Mu)


 
 ! --- Remove GUT-normalization of gauge couplings --- 
g1 = Sqrt(3._dp/5._dp)*g1 
! ----------------------- 
 



 
 ! --- Boundary conditions at EW-scale when running down --- 
! ----------------------- 
 
TwoLoopRGE = TwoLoopRGE_save 
MuMZ = Mu 
v = sqrt(vev) 

 
 ! --- Boundary conditions at EW-scale --- 
! ----------------------- 
 
Call SolveTadpoleEquations(g1,g2,g3,Lam,Yu,Yd,Ye,Mu,v,(/ ZeroC /))

Call TreeMasses(MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,           & 
& MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,ZW,ZZ,v,g1,g2,g3,Lam,Yu,Yd,Ye,               & 
& Mu,GenerationMixing,kont)

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
Iname=Iname-1 
End subroutine FirstGuess 
End Module SugraRuns_SMHighScale 

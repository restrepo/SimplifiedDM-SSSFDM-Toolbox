! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.7.0 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 22:08 on 3.3.2016   
! ----------------------------------------------------------------------  
 
 
Module InputOutput_tripletLR 
 
Use Control 
!Use Experiment 
Use Model_Data_tripletLR 
Use LoopFunctions 
Use StandardModel 
Use LoopCouplings_tripletLR 
 
Logical,Save::LesHouches_Format
Character(len=8),Save,Private::versionSARAH="4.7.0"
Integer,Private::i_cpv=0
Integer,Save,Private::in_kont(2)
Logical,Save::Add_Rparity= .False. 
Logical,Save::Write_HiggsBounds= .False. 
Character(len=40),Private::sp_info

Logical,Private::l_RP_Pythia= .False. 
Logical,Save,Private::Use_Flavour_States= .False. 
Real(dp),Save,Private::BrMin=1.e-4_dp 
Real(dp),Save,Private::SigMin=1.e-4_dp 
Character(len=60)::inputFileName,outputFileName 
Contains 
 
Subroutine LesHouches_Input(kont, Ecms, Pm, Pp, l_ISR, Fgmsb) 
 
Implicit None 
Integer, Intent(out) :: kont
Real(dp), Intent(out) :: Fgmsb, Ecms(:), Pm(:), Pp(:)
Logical, Intent(out) :: l_ISR(:)
Character(len=80) :: read_line
Integer :: i_mod=-1, i_sm=-1, i_par=-1, set_mod_par(25)=-1 &
& , i1, p_max, p_act, i_sp, i_model=-1, i_particles=-1
Real(dp) :: wert, Abs_Mu2, cosb2, cos2b, sinb2, RG0(3,3) &
 & , mat_D(3,3), R2(2,2), s12,s13,s23,c12,c13,c23
Logical :: check, calc_ferm, check_alpha(2)
Complex(dp) :: lam_vS
Logical, Save :: l_open = .True. 
 
Iname = Iname + 1
NameOfUnit(Iname) = "LesHouches_Input" 

check_alpha = .False. ! used to check consistency of alpha(mZ) calculation
in_kont = 0

Call InitializeStandardModel 
Call InitializeLoopFunctions 
 
i_mod = -1
i_sm = -1
i_par = -1
set_mod_par = -1 

ErrorLevel = -1
GenerationMixing=.False.
If (l_open) Then
   Open(ErrCan,file="Messages.out",status="unknown")
   Open(11,file="SPheno.out",status="unknown")
   l_open = .False.
End If 

Call Set_All_Parameters_0()

lam_vs = 0._dp
sp_info = " "
HighScaleModel="SARAH_Generated_Model" 
TwoLoopRGE = .True.
Fgmsb = 1.e12_dp
m32 = 1.e20_dp 
 
kont = 0
Open(99,file=inputFileName,status="old",err=200)
 
Do 
  Read(99,"(a80)",End=200,err=200) read_line 
  If (read_line(1:1).Eq."#") Cycle 
  If (read_line.Eq." ") Cycle 
  Call PutUpperCase(read_line) 
  If (read_line(1:5).Eq."BLOCK") Then  
    If (read_line(7:12).Eq."MODSEL") Then  
      kont = 0  
     Call Read_MODSEL(99,i_particles,i_model,i_cpv,kont)  
 CKMcomplex = CKM 
 If (i_cpv.Eq.0) Then 
 s12=lam_wolf 
 s23=s12**2*A_wolf 
 s13=s23*lam_wolf*Sqrt(eta_wolf**2+rho_wolf**2) 
 c12=Sqrt(1._dp-s12*s12) 
 c23=Sqrt(1._dp-s23*s23) 
 c13=Sqrt(1._dp-s13*s13) 
 CKM(1,1)=c12*c13 
 CKM(1,2)=s12*c13 
 CKM(1,3)=s13 
 CKM(2,1)=-s12*c23-c12*s23*s13 
 CKM(2,2)=c12*c23-s12*s23*s13 
 CKM(2,3)=s23*c13 
 CKM(3,1)=s12*s23-c12*c23*s13 
 CKM(3,2)=-c12*s23-s12*c23*s13 
 CKM(3,3)=c23*c13 
 End If 
    Else If (read_line(7:14).Eq."SMINPUTS") Then  
     Call Read_SMinput(99)  
    Else If (read_line(7:12).Eq."VCKMIN") Then  
     Call Read_CKM(99,i_cpv)  
    Else If (read_line(7:12).Eq."FCONST") Then  
     Call Read_FCONST(99)  
    Else If (read_line(7:11).Eq."FMASS") Then  
     Call Read_FMASS(99)  
    Else If (read_line(7:11).Eq."FLIFE") Then  
     Call Read_FLIFE(99)  
    Else If (read_line(7:17).Eq."SPHENOINPUT") Then  
     Call Read_SPhenoInput(99)  
    Else If (read_line(7:12).Eq."MINPAR") Then  
     Call Read_MINPAR(99,0,i_model,set_mod_par,kont)  
    Else If (read_line(7:14).Eq."IMMINPAR") Then  
       If (i_cpv.Lt.2) Then 
       Call Warn_CPV(i_cpv,"IMMINPAR") 
       End If 
    Call Read_MINPAR(99,1,i_model,set_mod_par,kont)  
    Else If (read_line(7:12).Eq."EXTPAR") Then  
     Call Read_EXTPAR(99,0,i_model,set_mod_par,kont)  
    Else If (read_line(7:14).Eq."IMEXTPAR") Then  
       If (i_cpv.Lt.2) Then 
       Call Warn_CPV(i_cpv,"IMEXTPAR") 
       End If 
    Call Read_EXTPAR(99,1,i_model,set_mod_par,kont)  
   Else If (read_line(7:11).Eq."YDRIN") Then 
InputValueforYDR= .True. 
    Call ReadMatrixC(99,3,3,YDRIN,0, "YDRIN",kont)

 
   Else If (read_line(7:13).Eq."IMYDRIN") Then 
     If (i_cpv.Lt.2) Then  
       Call Warn_CPV(i_cpv,"IMYDR") 
       Cycle 
     End If 
    Call ReadMatrixC(99,3,3,YDRIN,1, "YDRIN",kont)

 
   Else If (read_line(7:11).Eq."YL1IN") Then 
InputValueforYL1= .True. 
    Call ReadMatrixC(99,3,3,YL1IN,0, "YL1IN",kont)

 
   Else If (read_line(7:13).Eq."IMYL1IN") Then 
     If (i_cpv.Lt.2) Then  
       Call Warn_CPV(i_cpv,"IMYL1") 
       Cycle 
     End If 
    Call ReadMatrixC(99,3,3,YL1IN,1, "YL1IN",kont)

 
   Else If (read_line(7:11).Eq."YQ1IN") Then 
InputValueforYQ1= .True. 
    Call ReadMatrixC(99,3,3,YQ1IN,0, "YQ1IN",kont)

 
   Else If (read_line(7:13).Eq."IMYQ1IN") Then 
     If (i_cpv.Lt.2) Then  
       Call Warn_CPV(i_cpv,"IMYQ1") 
       Cycle 
     End If 
    Call ReadMatrixC(99,3,3,YQ1IN,1, "YQ1IN",kont)

 
   Else If (read_line(7:11).Eq."YL2IN") Then 
InputValueforYL2= .True. 
    Call ReadMatrixC(99,3,3,YL2IN,0, "YL2IN",kont)

 
   Else If (read_line(7:13).Eq."IMYL2IN") Then 
     If (i_cpv.Lt.2) Then  
       Call Warn_CPV(i_cpv,"IMYL2") 
       Cycle 
     End If 
    Call ReadMatrixC(99,3,3,YL2IN,1, "YL2IN",kont)

 
   Else If (read_line(7:11).Eq."YQ2IN") Then 
InputValueforYQ2= .True. 
    Call ReadMatrixC(99,3,3,YQ2IN,0, "YQ2IN",kont)

 
   Else If (read_line(7:13).Eq."IMYQ2IN") Then 
     If (i_cpv.Lt.2) Then  
       Call Warn_CPV(i_cpv,"IMYQ2") 
       Cycle 
     End If 
    Call ReadMatrixC(99,3,3,YQ2IN,1, "YQ2IN",kont)

 
   Else If (read_line(7:13).Eq."GAUGEIN") Then 
    Call Read_GAUGEIN(99,0,i_model,set_mod_par,kont) 
 
   Else If (read_line(7:15).Eq."LRINPUTIN") Then 
    Call Read_LRINPUTIN(99,0,i_model,set_mod_par,kont) 
 
   Else If (read_line(7:11).Eq."VEVIN") Then 
    Call Read_VEVIN(99,0,i_model,set_mod_par,kont) 
 
   Else If (read_line(7:14).Eq."PHASETIN") Then 
    Call Read_PHASETIN(99,0,i_model,set_mod_par,kont) 
 
   Else If (read_line(7:14).Eq."THETAWIN") Then 
    Call Read_THETAWIN(99,0,i_model,set_mod_par,kont) 
 
   Else If (read_line(7:12).Eq."PHIWIN") Then 
    Call Read_PHIWIN(99,0,i_model,set_mod_par,kont) 
 
End if 
End If 
End Do 
200 Close(99) 
gmZ = gamZ * mZ
gmZ2 = gmZ**2
mW2 = mZ2 * (0.5_dp + Sqrt(0.25_dp-Alpha_Mz*pi / (sqrt2*G_F*mZ2))) / 0.987_dp
mW = Sqrt(mW2) 
mW_SM = MW 
gamW = 2.06_dp 
gamW2 = gamW**2
gmW = gamW * mW
gmW2 = gmW**2
Iname=Iname-1
Contains
Subroutine Read_MINPAR(io,i_c,i_model,set_mod_par,kont) 
Implicit None 
Integer,Intent(in)::io,i_c,i_model 
Integer,Intent(inout)::kont,set_mod_par(:) 
Integer::i_par 
Real(dp)::wert 
Character(len=80)::read_line 
Do 
Read(io,*,End=200) read_line 
If (read_line(1:1).Eq."#") Cycle! this loop 
Backspace(io)! resetting to the beginning of the line 
If ((read_line(1:1).Eq."B").Or.(read_line(1:1).Eq."b")) Exit! this loop 
Read(io,*) i_par,wert!,read_line 
If (i_par.Eq.1) Then 
vRinput= wert 
Else If (i_par.Eq.2) Then 
TanBeta= wert 
Else If (i_par.Eq.3) Then 
If (i_c.Eq.0) lam1INPUT= Cmplx(wert,Aimag(lam1INPUT),dp) 
If (i_c.Eq.1) lam1INPUT= Cmplx(Real(lam1INPUT,dp),wert,dp) 
Else If (i_par.Eq.4) Then 
If (i_c.Eq.0) lam2INPUT= Cmplx(wert,Aimag(lam2INPUT),dp) 
If (i_c.Eq.1) lam2INPUT= Cmplx(Real(lam2INPUT,dp),wert,dp) 
Else If (i_par.Eq.5) Then 
If (i_c.Eq.0) lam3INPUT= Cmplx(wert,Aimag(lam3INPUT),dp) 
If (i_c.Eq.1) lam3INPUT= Cmplx(Real(lam3INPUT,dp),wert,dp) 
Else If (i_par.Eq.6) Then 
If (i_c.Eq.0) lam4INPUT= Cmplx(wert,Aimag(lam4INPUT),dp) 
If (i_c.Eq.1) lam4INPUT= Cmplx(Real(lam4INPUT,dp),wert,dp) 
Else If (i_par.Eq.7) Then 
If (i_c.Eq.0) rho1INPUT= Cmplx(wert,Aimag(rho1INPUT),dp) 
If (i_c.Eq.1) rho1INPUT= Cmplx(Real(rho1INPUT,dp),wert,dp) 
Else If (i_par.Eq.8) Then 
If (i_c.Eq.0) rho2INPUT= Cmplx(wert,Aimag(rho2INPUT),dp) 
If (i_c.Eq.1) rho2INPUT= Cmplx(Real(rho2INPUT,dp),wert,dp) 
Else If (i_par.Eq.9) Then 
If (i_c.Eq.0) alp1INPUT= Cmplx(wert,Aimag(alp1INPUT),dp) 
If (i_c.Eq.1) alp1INPUT= Cmplx(Real(alp1INPUT,dp),wert,dp) 
Else If (i_par.Eq.10) Then 
If (i_c.Eq.0) alp2INPUT= Cmplx(wert,Aimag(alp2INPUT),dp) 
If (i_c.Eq.1) alp2INPUT= Cmplx(Real(alp2INPUT,dp),wert,dp) 
Else If (i_par.Eq.11) Then 
If (i_c.Eq.0) alp3INPUT= Cmplx(wert,Aimag(alp3INPUT),dp) 
If (i_c.Eq.1) alp3INPUT= Cmplx(Real(alp3INPUT,dp),wert,dp) 
Else If (i_par.Eq.12) Then 
If (i_c.Eq.0) M1INPUT= Cmplx(wert,Aimag(M1INPUT),dp) 
If (i_c.Eq.1) M1INPUT= Cmplx(Real(M1INPUT,dp),wert,dp) 
Else If (i_par.Eq.13) Then 
If (i_c.Eq.0) M23INPUT= Cmplx(wert,Aimag(M23INPUT),dp) 
If (i_c.Eq.1) M23INPUT= Cmplx(Real(M23INPUT,dp),wert,dp) 
Else If (i_par.Eq.14) Then 
If (i_c.Eq.0) lamT1INPUT= Cmplx(wert,Aimag(lamT1INPUT),dp) 
If (i_c.Eq.1) lamT1INPUT= Cmplx(Real(lamT1INPUT,dp),wert,dp) 
Else If (i_par.Eq.15) Then 
If (i_c.Eq.0) lamT2INPUT= Cmplx(wert,Aimag(lamT2INPUT),dp) 
If (i_c.Eq.1) lamT2INPUT= Cmplx(Real(lamT2INPUT,dp),wert,dp) 
Else
Write(ErrCan,*) "Error in routine "//NameOfUnit(Iname)
If (i_c.Eq.0) Write(ErrCan,*) "Unknown entry for Block MINPAR ",i_par
If (i_c.Eq.1) Write(ErrCan,*) "Unknown entry for Block IMMINPAR ",i_par
If (i_c.Eq.0) Write(*,*) "Unknown entry for Block MINPAR ",i_par
If (i_c.Eq.1) Write(*,*) "Unknown entry for Block IMMINPAR ",i_par
Call AddError(304)
If (ErrorLevel.Eq.2) Call TerminateProgram
End If
End Do! i_par
200 Return
End Subroutine Read_MINPAR 
 
 
Subroutine Read_EXTPAR(io,i_c,i_model,set_mod_par,kont) 
Implicit None 
Integer,Intent(in)::io,i_c,i_model 
Integer,Intent(inout)::kont,set_mod_par(:) 
Integer::i_par 
Real(dp)::wert 
Character(len=80)::read_line 
Do 
Read(io,*,End=200) read_line 
If (read_line(1:1).Eq."#") Cycle! this loop 
Backspace(io)! resetting to the beginning of the line 
If ((read_line(1:1).Eq."B").Or.(read_line(1:1).Eq."b")) Exit! this loop 
Read(io,*) i_par,wert!,read_line 
End Do! i_par
200 Return
End Subroutine Read_EXTPAR 
 
 
 Subroutine Read_MODSEL(io, i_particles, i_model, i_cpv, kont)
  Implicit None
   Integer, Intent(in) :: io
   Integer, Intent(out) :: i_particles, i_model, i_cpv
   Integer, Intent(inout) :: kont
    Real(dp) :: r_mod

   Integer :: i_mod, i_test, i_rp
   Character(len=80) :: read_line

   i_cpv = 0
   i_rp = 0

    Do 
     Read(io,*) read_line
     If (read_line(1:1).Eq."#") Cycle ! this loop
     Backspace(io) ! resetting to the beginning of the line
     If ((read_line(1:1).Eq."B").Or.(read_line(1:1).Eq."b") ) Exit ! this loop

     Read(io,*) i_test,r_mod ! ,read_line
     If (i_test.Ne.12) Then
      Backspace(io)
      Read(io,*) i_test,i_mod ! ,read_line
     End If

!      Read(io,*) i_test,i_mod,read_line
     If (i_test.Eq.1) Then
      i_particles = i_test
      i_model = i_mod
      If ((i_mod.Lt.0).Or.(i_mod.Gt.99)) Then
       Write(ErrCan,*) "Error in routine "//NameOfUnit(Iname)
       Write(ErrCan,*) "MSSM, Unknown entry for Block MODSEL ",i_mod
       kont = -302
       Call AddError(-kont)
       Return
      Else If (i_mod.Eq.1) Then
       HighScaleModel = "GUT"
      Else If (i_mod.Eq.0) Then
       HighScaleModel = "LOW"
      End If

     Else If (i_test.Eq.2) Then
      BoundaryCondition = i_mod
     Else If (i_test.Eq.4) Then
      If (i_mod.Eq.1) Then
       i_rp = 1

      Else If (i_mod.Ne.0) Then
       Write(ErrCan,*) "Error in routine "//NameOfUnit(Iname)
       Write(ErrCan,*) "Unknown entry for Block MODSEL ",i_test,i_mod
       kont = -302
       Call AddError(-kont)
       Return
      End If

     Else If (i_test.Eq.5) Then
      i_cpv = i_mod
      If ((i_mod.Lt.0).Or.(i_mod.Gt.2)) Then
       Write(ErrCan,*) "Error in routine "//NameOfUnit(Iname)
       Write(ErrCan,*) "Unknown entry for Block MODSEL ",i_test,i_mod
       kont = -302
       Call AddError(-kont)
       Return
      End If

     Else If (i_test.Eq.6) Then
      If (i_mod.Eq.0) Then
       GenerationMixing = .False.
      Else If ((i_mod.Ge.1).And.(i_mod.Le.3)) Then
       GenerationMixing = .True.
      Else
       Write(ErrCan,*) "Error in routine "//NameOfUnit(Iname)
       Write(ErrCan,*) "GenerationMixing, Unknown entry for Block MODSEL ",i_mod
       kont = -302
       Call AddError(-kont)
       Return
      End If

    Else If (i_test.Eq.12) Then
      Call SetRGEScale(r_mod**2)  ! set Q_EWSB

     End If
    End Do ! i_mod

  End Subroutine Read_MODSEL

  Subroutine Read_SMinput(io)
  Implicit None
   Integer, Intent(in) :: io
   
   Integer :: i_sm
   Real(dp) :: wert
   Character(len=80) :: read_line

    Do 
     Read(io,*) read_line
     If (read_line(1:1).Eq."#") Cycle ! this loop
     Backspace(io) ! resetting to the beginning of the line
     If ((read_line(1:1).Eq."B").Or.(read_line(1:1).Eq."b") ) Exit ! this loop

     Read(io,*) i_sm,wert,read_line

     Select Case(i_sm)
     Case(1)
      check_alpha(1) = .True.
      MZ_input = .True.
      Alpha_MZ_MS = 1._dp / wert

     Case(2) ! G_F
      G_F = wert

     Case(3) ! alpha_s(m_Z)
      alphaS_mZ = wert

     Case(4) ! m_Z
      mZ = wert
      mZ2 = mZ**2
      calc_ferm = .True.

     Case(5) ! m_b(m_b)^MSbar
      mf_d(3) = wert
      mf_d2(3) = mf_d(3)**2
      calc_ferm = .True.

     Case(6) ! m_t^pole
      mf_u(3) = wert
      mf_u2(3) = mf_u(3)**2

     Case(7) ! m_tau^pole
      mf_l(3) = wert
      mf_l2(3) = mf_l(3)**2
      calc_ferm = .True.

     Case(8) ! m_nu_3, input is in GeV
      Mf_nu(3) = wert

     Case(11) ! electron mass
      mf_l(1) = wert
      mf_l2(1) = wert**2
      calc_ferm = .True.

     Case(12) ! m_nu_1, input is in GeV
      Mf_nu(1) = wert 

     Case(13) ! muon mass
      mf_l(2) = wert
      mf_l2(2) = wert**2
      calc_ferm = .True.

     Case(14) ! m_nu_2, input is in eV, transform to GeV
      Mf_nu(2) = wert 

     Case(21) ! d-quark mass at 2 GeV
      mf_d(1) = wert
      mf_d2(1) = wert**2
      calc_ferm = .True.

     Case(22) ! u-quark mass at 2 GeV
      mf_u(1) = wert
      mf_u2(1) = wert**2
      calc_ferm = .True.

     Case(23) ! s-quark mass at 2 GeV
      mf_d(2) = wert
      mf_d2(2) = wert**2
      calc_ferm = .True.

     Case(24) ! c-quark mass at Q=m_c
      mf_u(2) = wert
      mf_u2(2) = wert**2
      calc_ferm = .True.

     Case Default
      If (output_screen) &
           & Write(*,*) "Ignoring unknown entry for Block SMINPUTS ",i_sm 
      Write(ErrCan,*) "Ignoring unknown entry for Block SMINPUTS ",i_sm 
     End Select

    End Do ! i_sm

  End Subroutine Read_SMinput

 Subroutine Read_CKM(io, i_cpv)
  Implicit None
   Integer, Intent(in) :: io, i_cpv

   Real(dp) :: s12, s13, s23, c12, c13, c23, phase
    
    Do 
     Read(io,*,End=200) read_line
!     Write(*,*) read_line
     Backspace(io) ! resetting to the beginning of the line
     If ((read_line(1:1).Eq."#").Or.(read_line(1:1).Eq."B")  &
                                .Or.(read_line(1:1).Eq."b") ) Exit ! this loop
     Read(io,*) i1, wert, read_line
     Select Case(i1)     
     Case(1)
      lam_wolf = wert
     Case(2)
      A_wolf = wert
     Case(3)
      rho_wolf = wert
     Case(4)
      eta_wolf = wert
     Case default
     End Select

    End Do

 200   s12 = lam_wolf
    s23 = s12**2 * A_wolf
    s13 = s23 * lam_wolf * Sqrt(eta_wolf**2+rho_wolf**2)
    If (i_cpv.Eq.0) Then
     Write(ErrCan,*) "Warning: CP violation is switched of, ignoring CKM phase."
     phase = 0._dp
    Else
     phase = Atan(eta_wolf/rho_wolf)
    End If


    c12 = Sqrt(1._dp-s12*s12)
    c23 = Sqrt(1._dp-s23*s23)
    c13 = Sqrt(1._dp-s13*s13)

    CKM(1,1) = c12 * c13
    CKM(1,2) = s12 * c13
    CKM(2,3) = s23 * c13
    CKM(3,3) = c23 * c13
    If (phase.Ne.0._dp) Then
     CKM(1,3) = s13 * Exp( (0._dp,-1._dp) * phase )
     CKM(2,1) = -s12*c23 -c12*s23*s13 * Exp( (0._dp,1._dp) * phase )
     CKM(2,2) = c12*c23 -s12*s23*s13 * Exp( (0._dp,1._dp) * phase )
     CKM(3,1) = s12*s23 -c12*c23*s13 * Exp( (0._dp,1._dp) * phase )
     CKM(3,2) = -c12*s23 - s12*c23*s13 * Exp( (0._dp,1._dp) * phase )
    Else
     CKM(1,3) = s13
     CKM(2,1) = -s12*c23 -c12*s23*s13
     CKM(2,2) = c12*c23 -s12*s23*s13
     CKM(3,1) = s12*s23 -c12*c23*s13
     CKM(3,2) = -c12*s23 - s12*c23*s13
    End If

  End Subroutine Read_CKM

 Subroutine Read_SPINFO(io, kont)
  Implicit None
   Integer, Intent(in) :: io
   Integer, Intent(inout) :: kont

    Do 
     Read(io,*,End=200) read_line
!     Write(*,*) read_line

     If (read_line(1:1).Eq."#") Cycle ! this loop
     Backspace(io) ! resetting to the beginning of the line
     If ((read_line(1:1).Eq."B").Or.(read_line(1:1).Eq."b") ) Exit ! this loop

     Read(io,*) i_sp, read_line

     If (i_sp.Eq.1) Then
      sp_info = Trim(read_line)//" "//Trim(sp_info)
     Else If (i_sp.Eq.2) Then
      sp_info = Trim(sp_info)//" "//Trim(read_line)
     Else If (i_sp.Eq.4) Then ! there is some inconsistency, exit
      kont = -306
      Call AddError(306)
      Iname = Iname - 1
      Return
     Else
      Write(ErrCan,*) "Unknown entry in BLOCK SPINFO, is ignored:"
      Write(ErrCan,*) i_sp, read_line
     End If
    End Do

   200 Return

  End Subroutine Read_SPINFO

  Subroutine Read_SPhenoInput(io)
  Implicit None
   Integer, Intent(in) :: io

   Integer :: i_par
   Real(dp) :: wert
   Character(len=80) :: read_line

    ! This initialization is necessary for the arrar of production infos
    p_max = Size(Ecms)
    p_act = 0
    Ecms = 0._dp
    Pm = 0._dp
    Pp = 0._dp
    l_ISR = .False.
    Do 
     Read(io,*,End=200,err=200) read_line
!     Write(*,*) trim(read_line)
     If (read_line(1:1).Eq."#") Cycle ! this loop
     Backspace(io) ! resetting to the beginning of the line
     If ((read_line(1:1).Eq."B").Or.(read_line(1:1).Eq."b") ) Exit ! this loop

     Read(io,*,End=200) i_par,wert,read_line
!     write(*,*) i_par,wert,trim(read_line)
     Select Case(i_par)
     Case(1)
      ErrorLevel = Int(wert)

     Case(2)
      If (Int(wert).Ne.0) Then
       SPA_convention = .True.
       Call SetRGEScale(1.e3_dp**2)
      End If

     Case(3)
      If (Int(wert).Ne.0) Then 
       External_Spectrum = .True.
       External_Higgs = .True.
      End If

     Case(4)
      If (Int(wert).Ne.0) Use_Flavour_States = .True.

     Case(5)
      If (Int(wert).Ne.0) FermionMassResummation = .False.
      
     Case(6)
       RXiNew = wert      

     Case(7)
       If (wert.eq.1) then
         CalculateTwoLoopHiggsMasses=.False.
       Else
         CalculateTwoLoopHiggsMasses=.True.
       End if

     Case(8)
        SELECT CASE (int(WERT))
        CASE ( 1 )
           PurelyNumericalEffPot = .true.
           CalculateMSSM2Loop = .false.
           TwoLoopMethod=1
        CASE ( 2 )
           PurelyNumericalEffPot = .false.
           CalculateMSSM2Loop = .false.
           TwoLoopMethod=2
        CASE ( 3 )
           CalculateMSSM2Loop = .false.
           TwoLoopMethod=3
        CASE ( 8 )
           CalculateMSSM2Loop = .True.
           TwoLoopMethod=8
        CASE ( 9 )
           CalculateMSSM2Loop = .True.
           TwoLoopMethod=9
        CASE DEFAULT 
           Write(*,*) "Unknown option for two-loop mass calculation"
           CalculateTwoLoopHiggsMasses=.False.
        END SELECT


 
     Case(9)
       If (wert.Ne.0) Then
        GaugelessLimit=.true.
       Else
        GaugelessLimit=.false.
       End If

     Case(400)
       hstep_pn = wert
     Case(401)
       hstep_sa = wert

     Case(10)
       If (wert.Ne.1) Then
        TwoLoopSafeMode=.false.
       Else
        TwoLoopSafeMode=.true.
       End If

     Case(11)  ! whether to calculate  branching ratios or not
      If (Int(wert).Eq.1) L_BR = .True.
      If (Int(wert).Eq.0) L_BR = .False.

     Case(12) ! minimal value such that a branching ratio is written out
      Call SetWriteMinBR(wert)

     Case(13) ! minimal value such that a branching ratio is written out
      If (wert.Eq.0) Then
           Enable3BDecaysF = .False.
           Enable3BDecaysS = .False.        
      Elseif (wert.Eq.1) Then
           Enable3BDecaysF = .True.
           Enable3BDecaysS = .False.        
      Elseif (wert.Eq.2) Then
           Enable3BDecaysS = .True.
           Enable3BDecaysF = .False.        
      Elseif (wert.Eq.3) Then
           Enable3BDecaysF = .True.
           Enable3BDecaysS = .True.        
      Else 
          Write(*,*) "Unknown option for flag 13 (three-body decays): ",wert
      End if


     Case(14) ! run SUSY couplings to scale of decaying particle
      If (wert.Eq.0) RunningCouplingsDecays = .False.    

     Case(15) ! run SUSY couplings to scale of decaying particle
      MinWidth = wert    

!      Case(21)  ! whether to calculate cross sections or not
!       If (Int(wert).Eq.1) L_CS = .True.
!       If (Int(wert).Eq.0) L_CS = .False.
! 
!      Case(22) ! cms energy
!       p_act = p_act + 1
!       ! this test is necessary to avoid a memory violation
!       If (p_act.Le.p_max) Then
!        Ecms(p_act) = wert
!       Else
!        If (output_screen) &
!            & Write(*,*) "The number of required points for the calculation"// &
!            &  " of cross sections exceeds",p_max
!        If (output_screen) &
!            & Write(*,*) "Ignoring this information"
!        If (output_screen) &
!      &  Write(*,*) "Please enlarge the corresponding arrays in the main program."
!        Write(ErrCan,*) "The number of required points for the calculation"// &
!                &   " of cross sections exceeds",p_max
!        Write(ErrCan,*) "Ignoring this information"
!        Write(ErrCan,*) &
!          &"Please enlarge the corresponding arrays in the main program."
!       End If

!      Case (23) ! polarisation of incoming e- beam
!       If (Abs(wert).Gt.1._dp) Then
!        If (output_screen) Write(*,*) &
!            & "e- beam polarisation has to between -1 and 1 and not",wert
!        If (output_screen) &
!            & Write(*,*) "using now unpolarised e- beam"
!        Write(ErrCan,*) &
!           & "e- beam polarisation has to between -1 and 1 and not",wert
!        Write(ErrCan,*) "using now unpolarised e- beam"
!        If (p_act.Le.p_max) Pm(p_act) = 0
!       Else
!        If (p_act.Le.p_max) Pm(p_act) = wert
!       End If
! 
!      Case (24) ! polarisation of incoming e+ beam
!       If (Abs(wert).Gt.1._dp) Then
!        If (output_screen) Write(*,*) &
!            & "e+ beam polarisation has to between -1 and 1 and not",wert
!        If (output_screen) &
!            & Write(*,*) "using now unpolarised e+ beam"
!        Write(ErrCan,*) &
!           & "e+ beam polarisation has to between -1 and 1 and not",wert
!        Write(ErrCan,*) "using now unpolarised e+ beam"
!        If (p_act.Le.p_max) Pp(p_act) = 0
!       Else
!        If (p_act.Le.p_max) Pp(p_act) = wert
!       End If

!      Case(25)
!       If ((wert.Eq.1._dp).And.(p_act.Le.p_max)) L_ISR(p_act) = .True.
! 
!      Case(26) ! minimal value such that a cross section is written out
!       Call SetWriteMinSig(wert)

     Case(31) ! setting a fixed GUT scale if wert > 0
      If (wert.Gt.0._dp) Call SetGUTScale(wert)

     Case(32) ! requires strict unification
      If (Int(wert).Ne.0) check = SetStrictUnification(.True.)

     Case(33) ! setting a fixed renormalization scale if wert > 0
      If (wert.Gt.0._dp) Call SetRGEScale(wert**2)

     Case(34) ! precision of mass calculation
      delta_mass = wert

     Case(35) ! maximal number of iterations
      n_run = Int(wert)

     Case(36) ! minimal number of iterations
      MinimalNumberIterations = Int(wert)

!      Case(36) ! write out debug information
!       If (wert.Eq.0) Then
!        WriteOut = .False.
!       Else
!        WriteOut = .True.
!       End If

     Case(37) ! if =1 -> CKM thourgh V_u, if =2 CKM through V_d 
      If ((wert.Eq.1._dp).Or.(wert.Eq.2._dp)) i1 =  SetYukawaScheme(Int(wert))

     Case(38) ! set looplevel of RGEs
      If (wert.Ne.2._dp) Then
       TwoLoopRGE=.False.
      Else
       TwoLoopRGE=.True.
      End If

     Case(39) ! write out debug information
      If (wert.Eq.0) Then
       WriteSLHA1 = .False.
      Else
       WriteSLHA1 = .True.
      End If


     Case(40) ! alpha(0)
      check_alpha(2) = .True.
      Alpha = 1._dp / wert

     Case(41) ! Z-boson width
      gamZ = wert

     Case(42) ! W-boson width
      gamW = wert

     Case(50) ! W-boson width
      If (wert.Ne.1._dp) Then
       RotateNegativeFermionMasses=.False.
      Else
       RotateNegativeFermionMasses=.True.
      End If

     Case(51)
      If (wert.Ne.1._dp) Then
       SwitchToSCKM=.False.
      Else
       SwitchToSCKM=.True.
      End If

     Case(52)
      If (wert.Ne.1._dp) Then
       IgnoreNegativeMasses=.False.
      Else
       IgnoreNegativeMasses=.True.
      End If

     Case(53)
      If (wert.Ne.1._dp) Then
       IgnoreNegativeMassesMZ=.False.
      Else
       IgnoreNegativeMassesMZ=.True.
      End If

     Case(54)
      If (wert.Ne.1._dp) Then
       WriteOutputForNonConvergence=.False.
      Else
       WriteOutputForNonConvergence=.True.
      End If

     Case(55)
      If (wert.Ne.0._dp) Then
       CalculateOneLoopMasses=.True.
      Else
       CalculateOneLoopMasses=.False.
      End If

!      Case(56)
!       If (wert.Ne.0._dp) Then
!        CalculateTwoLoopHiggsMasses=.True.
!       Else
!        CalculateTwoLoopHiggsMasses=.False.
!       End If

     Case(57)
      If (wert.Ne.0._dp) Then
       CalculateLowEnergy=.True.
      Else
       CalculateLowEnergy=.False.
      End If

     Case(58)
      If (wert.Ne.0._dp) Then
        IncludeDeltaVB=.True.
        If (wert.Ne.2._dp) Then
         IncludeBSMdeltaVB=.True.
        Else
         IncludeBSMdeltaVB=.False.
        End If
      Else
       IncludeDeltaVB=.False.
      End If

     Case(60)
      If (wert.Ne.0._dp) Then
       KineticMixing=.True.
      Else
       KineticMixing=.False.
      End If

     Case(61)
      If (wert.Ne.0._dp) Then
       SMrunningLowScaleInput=.True.
      Else
       SMrunningLowScaleInput=.False.
      End If

     Case(62)
      If (wert.Ne.0._dp) Then
       RunningSUSYparametersLowEnergy=.True.
      Else
       RunningSUSYparametersLowEnergy=.False.
      End If

     Case(63)
      If (wert.Ne.0._dp) Then
       RunningSMparametersLowEnergy=.True.
      Else
       RunningSMparametersLowEnergy=.False.
      End If

     Case(64)
      If (wert.Ne.0._dp) Then
       WriteParametersAtQ=.True.
      Else
       WriteParametersAtQ=.False.
      End If

     Case(70)
      If (wert.Ne.0._dp) Then
       SUSYrunningFromMZ=.True.
      Else
       SUSYrunningFromMZ=.False.
      End If

     Case(65)
      If (wert.gt.0) SolutionTadpoleNr = wert 


     Case(75) ! Writes the parameter file for WHIZARD
      If (wert.Eq.1) Write_WHIZARD = .True.     

     Case(76) ! Writes input files for HiggsBounfs
      If (wert.Eq.1) Write_HiggsBounds = .True.      


     Case(80) ! exit for sure with non-zero value if a problem occurs
      If (wert.Eq.1) Non_Zero_Exit = .True.      

     Case(86) ! width to be counted as inivisble in HiggsBounds output
      WidthToBeInvisible = wert   

     Case(88) ! maximal mass allowed in loops
      MaxMassLoop = wert**2
   
     Case(89) ! maximal mass counted as numerical zero
      MaxMassNumericalZero = wert

     Case(95) ! Force mass matrices at 1-loop to be real
      If (wert.Eq.1) ForceRealMatrices  = .True.


!      Case(90) ! add R-parity at low energies
!       If (wert.Eq.1) Add_Rparity = .True.      
! 
!      Case(91) ! fit RP parameters such, that neutrino data are o.k.
!       If (wert.Eq.1) l_fit_RP_parameters = .True.      
! 
!      Case(92) ! for Pythia input
!       If (wert.Eq.1) l_RP_Pythia = .True.      
! 
!      Case(97) ! for Pythia input
!       If (wert.Eq.1) PrintPartialContributions = .True.     


     Case(510)
      If (wert.Ne.1._dp) Then
       WriteTreeLevelTadpoleSolutions=.False.
      Else
       WriteTreeLevelTadpoleSolutions=.True.
      End If

     Case(515)
      If (wert.Ne.0._dp) Then
       WriteGUTvalues=.True.
      Else
       WriteGUTvalues=.False.
      End If

     Case(520)
      If (wert.Ne.1._dp) Then
       WriteEffHiggsCouplingRatios=.False.
      Else
       WriteEffHiggsCouplingRatios=.True.
      End If

     Case(521)
      If (wert.Ne.1._dp) Then
       HigherOrderDiboson=.False.
      Else
       HigherOrderDiboson=.True.
      End If      

     Case(525)
      If (wert.Ne.1._dp) Then
       WriteHiggsDiphotonLoopContributions=.False.
      Else
       WriteHiggsDiphotonLoopContributions=.True.
      End If

     Case(530)
      If (wert.Ne.1._dp) Then
       WriteTreeLevelTadpoleParameters=.False.
      Else
       WriteTreeLevelTadpoleParameters=.True.
      End If

     Case(550)
      If (wert.Ne.1._dp) Then
       CalcFT=.False.
      Else
       CalcFT=.True.
      End If

     Case(551)
      If (wert.Ne.1._dp) Then
       OneLoopFT=.False.
      Else
       OneLoopFT=.True.
      End If



     Case(990)
      If (wert.Ne.1._dp) Then
       MakeQTEST=.False.
      Else
       MakeQTEST=.True.
      End If
      

     Case(999)
      If (wert.Ne.1._dp) Then
       PrintDebugInformation=.False.
      Else
       PrintDebugInformation=.True.
      End If
 

    Case Default
      If (output_screen) Write(*,*) &
           & "Problem while reading SPhenoInput, ignoring unknown entry" &
           & ,i_par,wert
      Write(Errcan,*) &
          & "Problem while reading  SPhenoInput, ignoring unknown entry" &
               & ,i_par,wert
     End Select ! i_par

    End Do  ! i_par 

   200 Return

  End Subroutine Read_SPhenoInput
End Subroutine LesHouches_Input 
 
 
 
Subroutine LesHouches_Out(io_L,io,kont,M_GUT,ae,amu,atau,EDMe,EDMmu,EDMtau,           & 
& dRho,BrBsGamma,ratioBsGamma,BrDmunu,ratioDmunu,BrDsmunu,ratioDsmunu,BrDstaunu,         & 
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
& epsK,ratioepsK,GenerationMixing,f_name)

Implicit None 
Integer, Intent(in) :: io_L, io, kont
Real(dp),Intent(in) :: ae,amu,atau,EDMe,EDMmu,EDMtau,dRho,BrBsGamma,ratioBsGamma,BrDmunu,ratioDmunu,         & 
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

Real(dp), Intent(in) :: M_GUT
Character(len=8)::Datum 
Character(len=10)::Zeit 
Logical,Intent(in)::GenerationMixing 
Logical,Save::l_open= .True. 
Integer,Parameter::n_max=500 
Integer :: i1, i2 
Logical :: WriteNextBlock 
Character(len=30),Dimension(n_max)::Fnames,Lnames 
Character(len=*),Intent(in),Optional::f_name
Real(dp) :: Q, MassLSP(2), facPP, facGG, facPZ 
Integer :: CurrentPDG2(2), CurrentPDG3(3), PDGlsp(2) 
Integer::ierr,i_errors(1100),gt1,gt2,gt3,icount
Complex(dp) :: PDGhh(3),PDGAh(3),PDGHpm(3),PDGdeltaRpp,PDGVP,PDGVZ,PDGVZR,PDGVG,PDGVWLm,             & 
& PDGVWRm,PDGgP,PDGgWLm,PDGgWLmC,PDGgWRmC,PDGgWRm,PDGgZ,PDGgZR,PDGgG,PDGFd(3),           & 
& PDGFu(3),PDGFe(3),PDGFv(6),PDGFcpp,PDGFcp(2),PDGFc(3)

Character(len=30),Dimension(3):: NameParticlehh
Character(len=30),Dimension(3):: NameParticleAh
Character(len=30),Dimension(3):: NameParticleHpm
Character(len=30) :: NameParticledeltaRpp
Character(len=30) :: NameParticleVP
Character(len=30) :: NameParticleVZ
Character(len=30) :: NameParticleVZR
Character(len=30) :: NameParticleVG
Character(len=30) :: NameParticleVWLm
Character(len=30) :: NameParticleVWRm
Character(len=30) :: NameParticlegP
Character(len=30) :: NameParticlegWLm
Character(len=30) :: NameParticlegWLmC
Character(len=30) :: NameParticlegWRmC
Character(len=30) :: NameParticlegWRm
Character(len=30) :: NameParticlegZ
Character(len=30) :: NameParticlegZR
Character(len=30) :: NameParticlegG
Character(len=30),Dimension(3):: NameParticleFd
Character(len=30),Dimension(3):: NameParticleFu
Character(len=30),Dimension(3):: NameParticleFe
Character(len=30),Dimension(6):: NameParticleFv
Character(len=30) :: NameParticleFcpp
Character(len=30),Dimension(2):: NameParticleFcp
Character(len=30),Dimension(3):: NameParticleFc
Complex(dp) :: Zbottom(2,2), Ztop(2,2), Ztau(2,2) 

 
 
 ! ----------- Set names and PDGs -------- 
 
PDGhh(1)=25
NameParticlehh(1)="hh_1"
PDGhh(2)=35
NameParticlehh(2)="hh_2"
PDGhh(3)=335
NameParticlehh(3)="hh_3"
PDGAh(1)=0
NameParticleAh(1)="Ah_1"
PDGAh(2)=0
NameParticleAh(2)="Ah_2"
PDGAh(3)=36
NameParticleAh(3)="Ah_3"
PDGHpm(1)=0
NameParticleHpm(1)="Hpm_1"
PDGHpm(2)=0
NameParticleHpm(2)="Hpm_2"
PDGHpm(3)=-37
NameParticleHpm(3)="Hpm_3"
PDGdeltaRpp=9000055
NameParticledeltaRpp="deltaRpp"
PDGVP=22
NameParticleVP="VP"
PDGVZ=23
NameParticleVZ="VZ"
PDGVZR=32
NameParticleVZR="VZR"
PDGVG=21
NameParticleVG="VG"
PDGVWLm=-24
NameParticleVWLm="VWLm"
PDGVWRm=34
NameParticleVWRm="VWRm"
PDGgP=0
NameParticlegP="gP"
PDGgWLm=0
NameParticlegWLm="gWLm"
PDGgWLmC=0
NameParticlegWLmC="gWLmC"
PDGgWRmC=0
NameParticlegWRmC="gWRmC"
PDGgWRm=0
NameParticlegWRm="gWRm"
PDGgZ=0
NameParticlegZ="gZ"
PDGgZR=0
NameParticlegZR="gZR"
PDGgG=0
NameParticlegG="gG"
PDGFd(1)=1
NameParticleFd(1)="Fd_1"
PDGFd(2)=3
NameParticleFd(2)="Fd_2"
PDGFd(3)=5
NameParticleFd(3)="Fd_3"
PDGFu(1)=2
NameParticleFu(1)="Fu_1"
PDGFu(2)=4
NameParticleFu(2)="Fu_2"
PDGFu(3)=6
NameParticleFu(3)="Fu_3"
PDGFe(1)=11
NameParticleFe(1)="Fe_1"
PDGFe(2)=13
NameParticleFe(2)="Fe_2"
PDGFe(3)=15
NameParticleFe(3)="Fe_3"
PDGFv(1)=12
NameParticleFv(1)="Fv_1"
PDGFv(2)=14
NameParticleFv(2)="Fv_2"
PDGFv(3)=16
NameParticleFv(3)="Fv_3"
PDGFv(4)=6000012
NameParticleFv(4)="Fv_4"
PDGFv(5)=6000014
NameParticleFv(5)="Fv_5"
PDGFv(6)=6000016
NameParticleFv(6)="Fv_6"
PDGFcpp=6000055
NameParticleFcpp="Fcpp"
PDGFcp(1)=17
NameParticleFcp(1)="Fcp_1"
PDGFcp(2)=19
NameParticleFcp(2)="Fcp_2"
PDGFc(1)=9000012
NameParticleFc(1)="Fc_1"
PDGFc(2)=9000014
NameParticleFc(2)="Fc_2"
PDGFc(3)=9000016
NameParticleFc(3)="Fc_3"

 
 
 ! ----------- Use SLHA 1 conventions if demanded -------- 
 
If(WriteSLHA1) Write(*,*) "SLHA 1 output for given model not possible" 
Q=Sqrt(GetRenormalizationScale())
Call Date_and_time(datum,zeit)
If (l_open) Then
If (Present(f_name)) Then
Open(io_L,file=Trim(f_name),status="unknown")
Else
Open(io_L,file=outputFileName,status="unknown")
End If
l_open= .False.
End If
If (.Not.RotateNegativeFermionMasses) Then 
Do i1=1,3
  If (MaxVal(Abs(AImag(UT(i1,:)))).gt.MaxVal(Abs(Real(UT(i1,:),dp)))) Then 
MFc(i1) = - MFc(i1) 
UT(i1,:) = -(0._dp,1._dp)*UT(i1,:) 
  End If 
End Do 
Do i1=1,6
  If (MaxVal(Abs(AImag(UV(i1,:)))).gt.MaxVal(Abs(Real(UV(i1,:),dp)))) Then 
MFv(i1) = - MFv(i1) 
UV(i1,:) = -(0._dp,1._dp)*UV(i1,:) 
  End If 
End Do 
End If 
 
Write(io_L,100) "# SUSY Les Houches Accord 2 - tripletLR Spectrum + Decays + Flavor Observables"
Write(io_L,100) "# SPheno module generated by SARAH" 
Write(io_L,100) "# ----------------------------------------------------------------------" 
Write(io_L,100) "# SPheno "//version 
Write(io_L,100) "#   W. Porod, Comput. Phys. Commun. 153 (2003) 275-315, hep-ph/0301101"
Write(io_L,100) "#   W. Porod, F.Staub, Comput.Phys.Commun.183 (2012) 2458-2469, arXiv:1104.1573"
Write(io_L,100) "# SARAH: "//versionSARAH 
Write(io_L,100) "#   F. Staub; arXiv:0806.0538 (online manual)"
Write(io_L,100) "#   F. Staub; Comput. Phys. Commun. 181 (2010) 1077-1086; arXiv:0909.2863"
Write(io_L,100) "#   F. Staub; Comput. Phys. Commun. 182 (2011)  808-833; arXiv:1002.0840"
Write(io_L,100) "#   F. Staub; Comput. Phys. Commun. 184 (2013)  1792-1809; arXiv:1207.0906"
Write(io_L,100) "#   F. Staub; Comput. Phys. Commun. 185 (2014)  1773-1790; arXiv:1309.7223 "
Write(io_L,100) "# Including the calculation of flavor observables based on the FlavorKit "
Write(io_L,100) "#   W. Porod, F. Staub, A. Vicente; Eur.Phys.J. C74 (2014) 8, 2992; arXiv:1405.1434 "
Write(io_L,100) "# Two-loop masss corrections to Higgs fields based on "
Write(io_L,100) "#   M. D. Goodsell, K. Nickel, F. Staub; arXiv:1411.0675 "
Write(io_L,100) "#   M. D. Goodsell, K. Nickel, F. Staub; arXiv:1503.03098"
Write(io_L,100) "#  "
Write(io_L,100) "# in case of problems send email to florian.staub@cern.ch and goodsell@lpthe.jussieu.fr "
Write(io_L,100) "# ----------------------------------------------------------------------" 
Write(io_L,100) "# Created: "//Datum(7:8)//"."//Datum(5:6)//"."//Datum(1:4)&
&//",  "//Zeit(1:2)//":"//Zeit(3:4)
Write(io_L,100) "Block SPINFO         # Program information"
Write(io_L,100) "     1   SPhenoSARAH      # spectrum calculator"
Write(io_L,100) "     2   "//version//"    # version number of SPheno"
Write(io_L,100) "     9   "//versionSARAH//"    # version number of SARAH"
Call GetError(i_errors)
If ((i_errors(1)+i_errors(3)+i_errors(5)+i_errors(7)+i_errors(8)& 
&+i_errors(10)+i_errors(12)+Sum(i_errors(14:19))).Gt.0)&
& Write(io_L,100)&
& "     3               # potential numerical problem, check file Messages.out"
Write(io_L,100) "Block MODSEL  # Input parameters"
Write(io_L,110)  1, 1, " GUT scale input"
Write(io_L,110) 2, BoundaryCondition, " Boundary conditions "
If (i_cpv.Gt.0) Write(io_L,110) 5,i_cpv," switching on CP violation"
If (GenerationMixing) Write(io_L,110) &
&     6,1, " switching on flavour violation" 
Write(io_L,100) "Block MINPAR  # Input parameters"
Write(io_L,101) 1, Real(vRinput,dp) ,"# vRinput"
Write(io_L,101) 2, Real(TanBeta,dp) ,"# TanBeta"
Write(io_L,101) 3, Real(lam1INPUT,dp) ,"# lam1INPUT"
Write(io_L,101) 4, Real(lam2INPUT,dp) ,"# lam2INPUT"
Write(io_L,101) 5, Real(lam3INPUT,dp) ,"# lam3INPUT"
Write(io_L,101) 6, Real(lam4INPUT,dp) ,"# lam4INPUT"
Write(io_L,101) 7, Real(rho1INPUT,dp) ,"# rho1INPUT"
Write(io_L,101) 8, Real(rho2INPUT,dp) ,"# rho2INPUT"
Write(io_L,101) 9, Real(alp1INPUT,dp) ,"# alp1INPUT"
Write(io_L,101) 10, Real(alp2INPUT,dp) ,"# alp2INPUT"
Write(io_L,101) 11, Real(alp3INPUT,dp) ,"# alp3INPUT"
Write(io_L,101) 12, Real(M1INPUT,dp) ,"# M1INPUT"
Write(io_L,101) 13, Real(M23INPUT,dp) ,"# M23INPUT"
Write(io_L,101) 14, Real(lamT1INPUT,dp) ,"# lamT1INPUT"
Write(io_L,101) 15, Real(lamT2INPUT,dp) ,"# lamT2INPUT"
WriteNextBlock = .False. 
If (Abs(Aimag(lam1INPUT)).gt.0._dp) WriteNextBlock = .True. 
If (Abs(Aimag(lam2INPUT)).gt.0._dp) WriteNextBlock = .True. 
If (Abs(Aimag(lam3INPUT)).gt.0._dp) WriteNextBlock = .True. 
If (Abs(Aimag(lam4INPUT)).gt.0._dp) WriteNextBlock = .True. 
If (Abs(Aimag(rho1INPUT)).gt.0._dp) WriteNextBlock = .True. 
If (Abs(Aimag(rho2INPUT)).gt.0._dp) WriteNextBlock = .True. 
If (Abs(Aimag(alp1INPUT)).gt.0._dp) WriteNextBlock = .True. 
If (Abs(Aimag(alp2INPUT)).gt.0._dp) WriteNextBlock = .True. 
If (Abs(Aimag(alp3INPUT)).gt.0._dp) WriteNextBlock = .True. 
If (Abs(Aimag(M1INPUT)).gt.0._dp) WriteNextBlock = .True. 
If (Abs(Aimag(M23INPUT)).gt.0._dp) WriteNextBlock = .True. 
If (Abs(Aimag(lamT1INPUT)).gt.0._dp) WriteNextBlock = .True. 
If (Abs(Aimag(lamT2INPUT)).gt.0._dp) WriteNextBlock = .True. 
If(WriteNextBlock) Then 
Write(io_L,100) "Block IMMINPAR  # Input parameters"
If (Abs(Aimag(lam1INPUT)).gt.0._dp) Then 
Write(io_L,101) 3, Aimag(lam1INPUT) ,"# lam1INPUT"
End if 
If (Abs(Aimag(lam2INPUT)).gt.0._dp) Then 
Write(io_L,101) 4, Aimag(lam2INPUT) ,"# lam2INPUT"
End if 
If (Abs(Aimag(lam3INPUT)).gt.0._dp) Then 
Write(io_L,101) 5, Aimag(lam3INPUT) ,"# lam3INPUT"
End if 
If (Abs(Aimag(lam4INPUT)).gt.0._dp) Then 
Write(io_L,101) 6, Aimag(lam4INPUT) ,"# lam4INPUT"
End if 
If (Abs(Aimag(rho1INPUT)).gt.0._dp) Then 
Write(io_L,101) 7, Aimag(rho1INPUT) ,"# rho1INPUT"
End if 
If (Abs(Aimag(rho2INPUT)).gt.0._dp) Then 
Write(io_L,101) 8, Aimag(rho2INPUT) ,"# rho2INPUT"
End if 
If (Abs(Aimag(alp1INPUT)).gt.0._dp) Then 
Write(io_L,101) 9, Aimag(alp1INPUT) ,"# alp1INPUT"
End if 
If (Abs(Aimag(alp2INPUT)).gt.0._dp) Then 
Write(io_L,101) 10, Aimag(alp2INPUT) ,"# alp2INPUT"
End if 
If (Abs(Aimag(alp3INPUT)).gt.0._dp) Then 
Write(io_L,101) 11, Aimag(alp3INPUT) ,"# alp3INPUT"
End if 
If (Abs(Aimag(M1INPUT)).gt.0._dp) Then 
Write(io_L,101) 12, Aimag(M1INPUT) ,"# M1INPUT"
End if 
If (Abs(Aimag(M23INPUT)).gt.0._dp) Then 
Write(io_L,101) 13, Aimag(M23INPUT) ,"# M23INPUT"
End if 
If (Abs(Aimag(lamT1INPUT)).gt.0._dp) Then 
Write(io_L,101) 14, Aimag(lamT1INPUT) ,"# lamT1INPUT"
End if 
If (Abs(Aimag(lamT2INPUT)).gt.0._dp) Then 
Write(io_L,101) 15, Aimag(lamT2INPUT) ,"# lamT2INPUT"
End if 
End if 
Write(io_L,106) "Block gaugeGUT Q=",m_GUT,"# (GUT scale)" 
Write(io_L,104) 1,gBLGUT, "# gBL(Q)^DRbar" 
Write(io_L,104) 2,g2GUT, "# g2(Q)^DRbar" 
Write(io_L,104) 3,gRGUT, "# gR(Q)^DRbar" 
Write(io_L,104) 4,g3GUT, "# g3(Q)^DRbar" 
Write(io_L,100) "Block SMINPUTS  # SM parameters"
Write(io_L,102) 2,G_F,"# G_mu [GeV^-2]"
Write(io_L,102) 3,alphaS_MZ,"# alpha_s(MZ)^MSbar"
Write(io_L,102) 4,mZ,"# m_Z(pole)"
Write(io_L,102) 5,mf_d(3),"# m_b(m_b), MSbar"
Write(io_L,102) 6,mf_u(3),"# m_t(pole)"
Write(io_L,102) 7,mf_l(3),"# m_tau(pole)"
 
WriteNextBlock = .false. 
Write(io_L,106) "Block GAUGE Q=",Q,"# (Renormalization Scale)" 
Write(io_L,104) 4,Real(gBL,dp), "# gBL" 
Write(io_L,104) 2,Real(g2,dp), "# g2" 
Write(io_L,104) 5,Real(gR,dp), "# gR" 
Write(io_L,104) 3,Real(g3,dp), "# g3" 
If(WriteNextBlock) Then 
Write(io_L,106) "Block IMGAUGE Q=",Q,"# (Renormalization Scale)" 
End if 
WriteNextBlock = .false. 
Write(io_L,106) "Block LRINPUT Q=",Q,"# (Renormalization Scale)" 
Write(io_L,104) 9,Real(RHO2,dp), "# RHO2" 
Write(io_L,104) 7,Real(RHO1,dp), "# RHO1" 
Write(io_L,104) 14,Real(ALP1,dp), "# ALP1" 
Write(io_L,104) 1,Real(LAM1,dp), "# LAM1" 
Write(io_L,104) 20,Real(ALP3,dp), "# ALP3" 
Write(io_L,104) 16,Real(ALP2,dp), "# ALP2" 
Write(io_L,104) 5,Real(LAM4,dp), "# LAM4" 
Write(io_L,104) 2,Real(LAM2,dp), "# LAM2" 
Write(io_L,104) 4,Real(LAM3,dp), "# LAM3" 
Write(io_L,104) 202,Real(LAMT1,dp), "# LAMT1" 
Write(io_L,104) 203,Real(LAMT2,dp), "# LAMT2" 
Write(io_L,104) 200,Real(M1,dp), "# M1" 
Write(io_L,104) 201,Real(M23,dp), "# M23" 
Write(io_L,104) 103,Real(mu32,dp), "# mu32" 
Write(io_L,104) 98,Real(MU22,dp), "# MU22" 
Write(io_L,104) 100,Real(MU12,dp), "# MU12" 
If(WriteNextBlock) Then 
Write(io_L,106) "Block IMLRINPUT Q=",Q,"# (Renormalization Scale)" 
End if 
WriteNextBlock = .false. 
Write(io_L,106) "Block VEV Q=",Q,"# (Renormalization Scale)" 
Write(io_L,104) 4,Real(vR,dp), "# vR" 
Write(io_L,104) 1,Real(vd,dp), "# vd" 
Write(io_L,104) 2,Real(vu,dp), "# vu" 
Write(io_L,104) 4,Real(vR,dp), "# vR" 
If(WriteNextBlock) Then 
Write(io_L,106) "Block IMVEV Q=",Q,"# (Renormalization Scale)" 
End if 
WriteNextBlock = .false. 
Write(io_L,106) "Block PHASET Q=",Q,"# (Renormalization Scale)" 
Write(io_L,104) 1,Real(phaT,dp), "# phaT" 
If (Abs(Aimag(phaT)).gt.0._dp) WriteNextBlock = .True. 
If(WriteNextBlock) Then 
Write(io_L,106) "Block IMPHASET Q=",Q,"# (Renormalization Scale)" 
Write(io_L,104) 1,Aimag(phaT), "# phaT" 
End if 
WriteNextBlock = .false. 
Write(io_L,106) "Block THETAW Q=",Q,"# (Renormalization Scale)" 
Write(io_L,104) 1,Real(ASin(Abs(ZZ(2,1))),dp), "# TW" 
If(WriteNextBlock) Then 
Write(io_L,106) "Block IMTHETAW Q=",Q,"# (Renormalization Scale)" 
End if 
WriteNextBlock = .false. 
Write(io_L,106) "Block PHIW Q=",Q,"# (Renormalization Scale)" 
Write(io_L,104) 1,Real(ACos(Sqrt(Abs(ZW(1,1))**2 + Abs(ZW(1,2))**2)),dp), "# PhiW" 
If(WriteNextBlock) Then 
Write(io_L,106) "Block IMPHIW Q=",Q,"# (Renormalization Scale)" 
End if 
If (WriteTreeLevelTadpoleParameters) Then 
If (HighScaleModel.Eq."LOW") Then 
WriteNextBlock = .false. 
Write(io_L,106) "Block TREELRINPUT Q=",Q,"# (Renormalization Scale)" 
Write(io_L,104) 103,Real(mu32Tree,dp), "# mu32" 
Write(io_L,104) 98,Real(MU22Tree,dp), "# MU22" 
Write(io_L,104) 100,Real(MU12Tree,dp), "# MU12" 
If(WriteNextBlock) Then 
Write(io_L,106) "Block TREEIMLRINPUT Q=",Q,"# (Renormalization Scale)" 
End if 
WriteNextBlock = .false. 
Write(io_L,106) "Block LOOPLRINPUT Q=",Q,"# (Renormalization Scale)" 
Write(io_L,104) 103,Real(mu321L,dp), "# mu32" 
Write(io_L,104) 98,Real(MU221L,dp), "# MU22" 
Write(io_L,104) 100,Real(MU121L,dp), "# MU12" 
If(WriteNextBlock) Then 
Write(io_L,106) "Block LOOPIMLRINPUT Q=",Q,"# (Renormalization Scale)" 
End if 
Else 
WriteNextBlock = .false. 
Write(io_L,106) "Block TREELRINPUT Q=",Q,"# (Renormalization Scale)" 
Write(io_L,104) 103,Real(mu32Tree,dp), "# mu32" 
Write(io_L,104) 98,Real(MU22Tree,dp), "# MU22" 
Write(io_L,104) 100,Real(MU12Tree,dp), "# MU12" 
If(WriteNextBlock) Then 
Write(io_L,106) "Block TREEIMLRINPUT Q=",Q,"# (Renormalization Scale)" 
End if 
WriteNextBlock = .false. 
Write(io_L,106) "Block LOOPLRINPUT Q=",Q,"# (Renormalization Scale)" 
Write(io_L,104) 103,Real(mu321L,dp), "# mu32" 
Write(io_L,104) 98,Real(MU221L,dp), "# MU22" 
Write(io_L,104) 100,Real(MU121L,dp), "# MU12" 
If(WriteNextBlock) Then 
Write(io_L,106) "Block LOOPIMLRINPUT Q=",Q,"# (Renormalization Scale)" 
End if 
End if 
End if 
Write(io_L,106) "Block YDR Q=",Q,"# (Renormalization Scale)" 
Write(io_L,107)1,1,Real(YDR(1,1),dp), "# Real(YDR(1,1),dp)" 
Write(io_L,107)1,2,Real(YDR(1,2),dp), "# Real(YDR(1,2),dp)" 
Write(io_L,107)1,3,Real(YDR(1,3),dp), "# Real(YDR(1,3),dp)" 
Write(io_L,107)2,1,Real(YDR(2,1),dp), "# Real(YDR(2,1),dp)" 
Write(io_L,107)2,2,Real(YDR(2,2),dp), "# Real(YDR(2,2),dp)" 
Write(io_L,107)2,3,Real(YDR(2,3),dp), "# Real(YDR(2,3),dp)" 
Write(io_L,107)3,1,Real(YDR(3,1),dp), "# Real(YDR(3,1),dp)" 
Write(io_L,107)3,2,Real(YDR(3,2),dp), "# Real(YDR(3,2),dp)" 
Write(io_L,107)3,3,Real(YDR(3,3),dp), "# Real(YDR(3,3),dp)" 
If (MaxVal(Abs(AImag(YDR))).gt.0._dp) Then 
Write(io_L,106) "Block IMYDR Q=",Q,"# (Renormalization Scale)" 
Write(io_L,107)1,1,Aimag(YDR(1,1)), "# Aimag(YDR(1,1))" 
Write(io_L,107)1,2,Aimag(YDR(1,2)), "# Aimag(YDR(1,2))" 
Write(io_L,107)1,3,Aimag(YDR(1,3)), "# Aimag(YDR(1,3))" 
Write(io_L,107)2,1,Aimag(YDR(2,1)), "# Aimag(YDR(2,1))" 
Write(io_L,107)2,2,Aimag(YDR(2,2)), "# Aimag(YDR(2,2))" 
Write(io_L,107)2,3,Aimag(YDR(2,3)), "# Aimag(YDR(2,3))" 
Write(io_L,107)3,1,Aimag(YDR(3,1)), "# Aimag(YDR(3,1))" 
Write(io_L,107)3,2,Aimag(YDR(3,2)), "# Aimag(YDR(3,2))" 
Write(io_L,107)3,3,Aimag(YDR(3,3)), "# Aimag(YDR(3,3))" 
End If 

Write(io_L,106) "Block YL1 Q=",Q,"# (Renormalization Scale)" 
Write(io_L,107)1,1,Real(YL1(1,1),dp), "# Real(YL1(1,1),dp)" 
Write(io_L,107)1,2,Real(YL1(1,2),dp), "# Real(YL1(1,2),dp)" 
Write(io_L,107)1,3,Real(YL1(1,3),dp), "# Real(YL1(1,3),dp)" 
Write(io_L,107)2,1,Real(YL1(2,1),dp), "# Real(YL1(2,1),dp)" 
Write(io_L,107)2,2,Real(YL1(2,2),dp), "# Real(YL1(2,2),dp)" 
Write(io_L,107)2,3,Real(YL1(2,3),dp), "# Real(YL1(2,3),dp)" 
Write(io_L,107)3,1,Real(YL1(3,1),dp), "# Real(YL1(3,1),dp)" 
Write(io_L,107)3,2,Real(YL1(3,2),dp), "# Real(YL1(3,2),dp)" 
Write(io_L,107)3,3,Real(YL1(3,3),dp), "# Real(YL1(3,3),dp)" 
If (MaxVal(Abs(AImag(YL1))).gt.0._dp) Then 
Write(io_L,106) "Block IMYL1 Q=",Q,"# (Renormalization Scale)" 
Write(io_L,107)1,1,Aimag(YL1(1,1)), "# Aimag(YL1(1,1))" 
Write(io_L,107)1,2,Aimag(YL1(1,2)), "# Aimag(YL1(1,2))" 
Write(io_L,107)1,3,Aimag(YL1(1,3)), "# Aimag(YL1(1,3))" 
Write(io_L,107)2,1,Aimag(YL1(2,1)), "# Aimag(YL1(2,1))" 
Write(io_L,107)2,2,Aimag(YL1(2,2)), "# Aimag(YL1(2,2))" 
Write(io_L,107)2,3,Aimag(YL1(2,3)), "# Aimag(YL1(2,3))" 
Write(io_L,107)3,1,Aimag(YL1(3,1)), "# Aimag(YL1(3,1))" 
Write(io_L,107)3,2,Aimag(YL1(3,2)), "# Aimag(YL1(3,2))" 
Write(io_L,107)3,3,Aimag(YL1(3,3)), "# Aimag(YL1(3,3))" 
End If 

Write(io_L,106) "Block YQ1 Q=",Q,"# (Renormalization Scale)" 
Write(io_L,107)1,1,Real(YQ1(1,1),dp), "# Real(YQ1(1,1),dp)" 
Write(io_L,107)1,2,Real(YQ1(1,2),dp), "# Real(YQ1(1,2),dp)" 
Write(io_L,107)1,3,Real(YQ1(1,3),dp), "# Real(YQ1(1,3),dp)" 
Write(io_L,107)2,1,Real(YQ1(2,1),dp), "# Real(YQ1(2,1),dp)" 
Write(io_L,107)2,2,Real(YQ1(2,2),dp), "# Real(YQ1(2,2),dp)" 
Write(io_L,107)2,3,Real(YQ1(2,3),dp), "# Real(YQ1(2,3),dp)" 
Write(io_L,107)3,1,Real(YQ1(3,1),dp), "# Real(YQ1(3,1),dp)" 
Write(io_L,107)3,2,Real(YQ1(3,2),dp), "# Real(YQ1(3,2),dp)" 
Write(io_L,107)3,3,Real(YQ1(3,3),dp), "# Real(YQ1(3,3),dp)" 
If (MaxVal(Abs(AImag(YQ1))).gt.0._dp) Then 
Write(io_L,106) "Block IMYQ1 Q=",Q,"# (Renormalization Scale)" 
Write(io_L,107)1,1,Aimag(YQ1(1,1)), "# Aimag(YQ1(1,1))" 
Write(io_L,107)1,2,Aimag(YQ1(1,2)), "# Aimag(YQ1(1,2))" 
Write(io_L,107)1,3,Aimag(YQ1(1,3)), "# Aimag(YQ1(1,3))" 
Write(io_L,107)2,1,Aimag(YQ1(2,1)), "# Aimag(YQ1(2,1))" 
Write(io_L,107)2,2,Aimag(YQ1(2,2)), "# Aimag(YQ1(2,2))" 
Write(io_L,107)2,3,Aimag(YQ1(2,3)), "# Aimag(YQ1(2,3))" 
Write(io_L,107)3,1,Aimag(YQ1(3,1)), "# Aimag(YQ1(3,1))" 
Write(io_L,107)3,2,Aimag(YQ1(3,2)), "# Aimag(YQ1(3,2))" 
Write(io_L,107)3,3,Aimag(YQ1(3,3)), "# Aimag(YQ1(3,3))" 
End If 

Write(io_L,106) "Block YL2 Q=",Q,"# (Renormalization Scale)" 
Write(io_L,107)1,1,Real(YL2(1,1),dp), "# Real(YL2(1,1),dp)" 
Write(io_L,107)1,2,Real(YL2(1,2),dp), "# Real(YL2(1,2),dp)" 
Write(io_L,107)1,3,Real(YL2(1,3),dp), "# Real(YL2(1,3),dp)" 
Write(io_L,107)2,1,Real(YL2(2,1),dp), "# Real(YL2(2,1),dp)" 
Write(io_L,107)2,2,Real(YL2(2,2),dp), "# Real(YL2(2,2),dp)" 
Write(io_L,107)2,3,Real(YL2(2,3),dp), "# Real(YL2(2,3),dp)" 
Write(io_L,107)3,1,Real(YL2(3,1),dp), "# Real(YL2(3,1),dp)" 
Write(io_L,107)3,2,Real(YL2(3,2),dp), "# Real(YL2(3,2),dp)" 
Write(io_L,107)3,3,Real(YL2(3,3),dp), "# Real(YL2(3,3),dp)" 
If (MaxVal(Abs(AImag(YL2))).gt.0._dp) Then 
Write(io_L,106) "Block IMYL2 Q=",Q,"# (Renormalization Scale)" 
Write(io_L,107)1,1,Aimag(YL2(1,1)), "# Aimag(YL2(1,1))" 
Write(io_L,107)1,2,Aimag(YL2(1,2)), "# Aimag(YL2(1,2))" 
Write(io_L,107)1,3,Aimag(YL2(1,3)), "# Aimag(YL2(1,3))" 
Write(io_L,107)2,1,Aimag(YL2(2,1)), "# Aimag(YL2(2,1))" 
Write(io_L,107)2,2,Aimag(YL2(2,2)), "# Aimag(YL2(2,2))" 
Write(io_L,107)2,3,Aimag(YL2(2,3)), "# Aimag(YL2(2,3))" 
Write(io_L,107)3,1,Aimag(YL2(3,1)), "# Aimag(YL2(3,1))" 
Write(io_L,107)3,2,Aimag(YL2(3,2)), "# Aimag(YL2(3,2))" 
Write(io_L,107)3,3,Aimag(YL2(3,3)), "# Aimag(YL2(3,3))" 
End If 

Write(io_L,106) "Block YQ2 Q=",Q,"# (Renormalization Scale)" 
Write(io_L,107)1,1,Real(YQ2(1,1),dp), "# Real(YQ2(1,1),dp)" 
Write(io_L,107)1,2,Real(YQ2(1,2),dp), "# Real(YQ2(1,2),dp)" 
Write(io_L,107)1,3,Real(YQ2(1,3),dp), "# Real(YQ2(1,3),dp)" 
Write(io_L,107)2,1,Real(YQ2(2,1),dp), "# Real(YQ2(2,1),dp)" 
Write(io_L,107)2,2,Real(YQ2(2,2),dp), "# Real(YQ2(2,2),dp)" 
Write(io_L,107)2,3,Real(YQ2(2,3),dp), "# Real(YQ2(2,3),dp)" 
Write(io_L,107)3,1,Real(YQ2(3,1),dp), "# Real(YQ2(3,1),dp)" 
Write(io_L,107)3,2,Real(YQ2(3,2),dp), "# Real(YQ2(3,2),dp)" 
Write(io_L,107)3,3,Real(YQ2(3,3),dp), "# Real(YQ2(3,3),dp)" 
If (MaxVal(Abs(AImag(YQ2))).gt.0._dp) Then 
Write(io_L,106) "Block IMYQ2 Q=",Q,"# (Renormalization Scale)" 
Write(io_L,107)1,1,Aimag(YQ2(1,1)), "# Aimag(YQ2(1,1))" 
Write(io_L,107)1,2,Aimag(YQ2(1,2)), "# Aimag(YQ2(1,2))" 
Write(io_L,107)1,3,Aimag(YQ2(1,3)), "# Aimag(YQ2(1,3))" 
Write(io_L,107)2,1,Aimag(YQ2(2,1)), "# Aimag(YQ2(2,1))" 
Write(io_L,107)2,2,Aimag(YQ2(2,2)), "# Aimag(YQ2(2,2))" 
Write(io_L,107)2,3,Aimag(YQ2(2,3)), "# Aimag(YQ2(2,3))" 
Write(io_L,107)3,1,Aimag(YQ2(3,1)), "# Aimag(YQ2(3,1))" 
Write(io_L,107)3,2,Aimag(YQ2(3,2)), "# Aimag(YQ2(3,2))" 
Write(io_L,107)3,3,Aimag(YQ2(3,3)), "# Aimag(YQ2(3,3))" 
End If 

If (WriteGUTvalues) Then 
Write(io_L,106) "Block GAUGEGUT Q=",M_GUT,"# (GUT scale)" 
Write(io_L,104) 4,Real(gBLGUT,dp), "# gBL" 
Write(io_L,104) 2,Real(g2GUT,dp), "# g2" 
Write(io_L,104) 5,Real(gRGUT,dp), "# gR" 
Write(io_L,104) 3,Real(g3GUT,dp), "# g3" 
Write(io_L,106) "Block LRINPUTGUT Q=",M_GUT,"# (GUT scale)" 
Write(io_L,104) 9,Real(RHO2GUT,dp), "# RHO2" 
Write(io_L,104) 7,Real(RHO1GUT,dp), "# RHO1" 
Write(io_L,104) 14,Real(ALP1GUT,dp), "# ALP1" 
Write(io_L,104) 1,Real(LAM1GUT,dp), "# LAM1" 
Write(io_L,104) 20,Real(ALP3GUT,dp), "# ALP3" 
Write(io_L,104) 16,Real(ALP2GUT,dp), "# ALP2" 
Write(io_L,104) 5,Real(LAM4GUT,dp), "# LAM4" 
Write(io_L,104) 2,Real(LAM2GUT,dp), "# LAM2" 
Write(io_L,104) 4,Real(LAM3GUT,dp), "# LAM3" 
Write(io_L,104) 202,Real(LAMT1GUT,dp), "# LAMT1" 
Write(io_L,104) 203,Real(LAMT2GUT,dp), "# LAMT2" 
Write(io_L,104) 200,Real(M1GUT,dp), "# M1" 
Write(io_L,104) 201,Real(M23GUT,dp), "# M23" 
Write(io_L,104) 103,Real(mu32GUT,dp), "# mu32" 
Write(io_L,104) 98,Real(MU22GUT,dp), "# MU22" 
Write(io_L,104) 100,Real(MU12GUT,dp), "# MU12" 
Write(io_L,106) "Block YDRGUT Q=",M_GUT,"# (GUT Scale)" 
Write(io_L,107)1,1,Real(YDRGUT(1,1),dp), "# Real(YDRGUT(1,1),dp)" 
Write(io_L,107)1,2,Real(YDRGUT(1,2),dp), "# Real(YDRGUT(1,2),dp)" 
Write(io_L,107)1,3,Real(YDRGUT(1,3),dp), "# Real(YDRGUT(1,3),dp)" 
Write(io_L,107)2,1,Real(YDRGUT(2,1),dp), "# Real(YDRGUT(2,1),dp)" 
Write(io_L,107)2,2,Real(YDRGUT(2,2),dp), "# Real(YDRGUT(2,2),dp)" 
Write(io_L,107)2,3,Real(YDRGUT(2,3),dp), "# Real(YDRGUT(2,3),dp)" 
Write(io_L,107)3,1,Real(YDRGUT(3,1),dp), "# Real(YDRGUT(3,1),dp)" 
Write(io_L,107)3,2,Real(YDRGUT(3,2),dp), "# Real(YDRGUT(3,2),dp)" 
Write(io_L,107)3,3,Real(YDRGUT(3,3),dp), "# Real(YDRGUT(3,3),dp)" 
If (MaxVal(Abs(AImag(YDRGUT))).gt.0._dp) Then 
Write(io_L,106) "Block IMYDRGUT Q=",M_GUT,"# (GUT Scale)" 
Write(io_L,107)1,1,Aimag(YDRGUT(1,1)), "# Aimag(YDRGUT(1,1))" 
Write(io_L,107)1,2,Aimag(YDRGUT(1,2)), "# Aimag(YDRGUT(1,2))" 
Write(io_L,107)1,3,Aimag(YDRGUT(1,3)), "# Aimag(YDRGUT(1,3))" 
Write(io_L,107)2,1,Aimag(YDRGUT(2,1)), "# Aimag(YDRGUT(2,1))" 
Write(io_L,107)2,2,Aimag(YDRGUT(2,2)), "# Aimag(YDRGUT(2,2))" 
Write(io_L,107)2,3,Aimag(YDRGUT(2,3)), "# Aimag(YDRGUT(2,3))" 
Write(io_L,107)3,1,Aimag(YDRGUT(3,1)), "# Aimag(YDRGUT(3,1))" 
Write(io_L,107)3,2,Aimag(YDRGUT(3,2)), "# Aimag(YDRGUT(3,2))" 
Write(io_L,107)3,3,Aimag(YDRGUT(3,3)), "# Aimag(YDRGUT(3,3))" 
End If 

Write(io_L,106) "Block YL1GUT Q=",M_GUT,"# (GUT Scale)" 
Write(io_L,107)1,1,Real(YL1GUT(1,1),dp), "# Real(YL1GUT(1,1),dp)" 
Write(io_L,107)1,2,Real(YL1GUT(1,2),dp), "# Real(YL1GUT(1,2),dp)" 
Write(io_L,107)1,3,Real(YL1GUT(1,3),dp), "# Real(YL1GUT(1,3),dp)" 
Write(io_L,107)2,1,Real(YL1GUT(2,1),dp), "# Real(YL1GUT(2,1),dp)" 
Write(io_L,107)2,2,Real(YL1GUT(2,2),dp), "# Real(YL1GUT(2,2),dp)" 
Write(io_L,107)2,3,Real(YL1GUT(2,3),dp), "# Real(YL1GUT(2,3),dp)" 
Write(io_L,107)3,1,Real(YL1GUT(3,1),dp), "# Real(YL1GUT(3,1),dp)" 
Write(io_L,107)3,2,Real(YL1GUT(3,2),dp), "# Real(YL1GUT(3,2),dp)" 
Write(io_L,107)3,3,Real(YL1GUT(3,3),dp), "# Real(YL1GUT(3,3),dp)" 
If (MaxVal(Abs(AImag(YL1GUT))).gt.0._dp) Then 
Write(io_L,106) "Block IMYL1GUT Q=",M_GUT,"# (GUT Scale)" 
Write(io_L,107)1,1,Aimag(YL1GUT(1,1)), "# Aimag(YL1GUT(1,1))" 
Write(io_L,107)1,2,Aimag(YL1GUT(1,2)), "# Aimag(YL1GUT(1,2))" 
Write(io_L,107)1,3,Aimag(YL1GUT(1,3)), "# Aimag(YL1GUT(1,3))" 
Write(io_L,107)2,1,Aimag(YL1GUT(2,1)), "# Aimag(YL1GUT(2,1))" 
Write(io_L,107)2,2,Aimag(YL1GUT(2,2)), "# Aimag(YL1GUT(2,2))" 
Write(io_L,107)2,3,Aimag(YL1GUT(2,3)), "# Aimag(YL1GUT(2,3))" 
Write(io_L,107)3,1,Aimag(YL1GUT(3,1)), "# Aimag(YL1GUT(3,1))" 
Write(io_L,107)3,2,Aimag(YL1GUT(3,2)), "# Aimag(YL1GUT(3,2))" 
Write(io_L,107)3,3,Aimag(YL1GUT(3,3)), "# Aimag(YL1GUT(3,3))" 
End If 

Write(io_L,106) "Block YQ1GUT Q=",M_GUT,"# (GUT Scale)" 
Write(io_L,107)1,1,Real(YQ1GUT(1,1),dp), "# Real(YQ1GUT(1,1),dp)" 
Write(io_L,107)1,2,Real(YQ1GUT(1,2),dp), "# Real(YQ1GUT(1,2),dp)" 
Write(io_L,107)1,3,Real(YQ1GUT(1,3),dp), "# Real(YQ1GUT(1,3),dp)" 
Write(io_L,107)2,1,Real(YQ1GUT(2,1),dp), "# Real(YQ1GUT(2,1),dp)" 
Write(io_L,107)2,2,Real(YQ1GUT(2,2),dp), "# Real(YQ1GUT(2,2),dp)" 
Write(io_L,107)2,3,Real(YQ1GUT(2,3),dp), "# Real(YQ1GUT(2,3),dp)" 
Write(io_L,107)3,1,Real(YQ1GUT(3,1),dp), "# Real(YQ1GUT(3,1),dp)" 
Write(io_L,107)3,2,Real(YQ1GUT(3,2),dp), "# Real(YQ1GUT(3,2),dp)" 
Write(io_L,107)3,3,Real(YQ1GUT(3,3),dp), "# Real(YQ1GUT(3,3),dp)" 
If (MaxVal(Abs(AImag(YQ1GUT))).gt.0._dp) Then 
Write(io_L,106) "Block IMYQ1GUT Q=",M_GUT,"# (GUT Scale)" 
Write(io_L,107)1,1,Aimag(YQ1GUT(1,1)), "# Aimag(YQ1GUT(1,1))" 
Write(io_L,107)1,2,Aimag(YQ1GUT(1,2)), "# Aimag(YQ1GUT(1,2))" 
Write(io_L,107)1,3,Aimag(YQ1GUT(1,3)), "# Aimag(YQ1GUT(1,3))" 
Write(io_L,107)2,1,Aimag(YQ1GUT(2,1)), "# Aimag(YQ1GUT(2,1))" 
Write(io_L,107)2,2,Aimag(YQ1GUT(2,2)), "# Aimag(YQ1GUT(2,2))" 
Write(io_L,107)2,3,Aimag(YQ1GUT(2,3)), "# Aimag(YQ1GUT(2,3))" 
Write(io_L,107)3,1,Aimag(YQ1GUT(3,1)), "# Aimag(YQ1GUT(3,1))" 
Write(io_L,107)3,2,Aimag(YQ1GUT(3,2)), "# Aimag(YQ1GUT(3,2))" 
Write(io_L,107)3,3,Aimag(YQ1GUT(3,3)), "# Aimag(YQ1GUT(3,3))" 
End If 

Write(io_L,106) "Block YL2GUT Q=",M_GUT,"# (GUT Scale)" 
Write(io_L,107)1,1,Real(YL2GUT(1,1),dp), "# Real(YL2GUT(1,1),dp)" 
Write(io_L,107)1,2,Real(YL2GUT(1,2),dp), "# Real(YL2GUT(1,2),dp)" 
Write(io_L,107)1,3,Real(YL2GUT(1,3),dp), "# Real(YL2GUT(1,3),dp)" 
Write(io_L,107)2,1,Real(YL2GUT(2,1),dp), "# Real(YL2GUT(2,1),dp)" 
Write(io_L,107)2,2,Real(YL2GUT(2,2),dp), "# Real(YL2GUT(2,2),dp)" 
Write(io_L,107)2,3,Real(YL2GUT(2,3),dp), "# Real(YL2GUT(2,3),dp)" 
Write(io_L,107)3,1,Real(YL2GUT(3,1),dp), "# Real(YL2GUT(3,1),dp)" 
Write(io_L,107)3,2,Real(YL2GUT(3,2),dp), "# Real(YL2GUT(3,2),dp)" 
Write(io_L,107)3,3,Real(YL2GUT(3,3),dp), "# Real(YL2GUT(3,3),dp)" 
If (MaxVal(Abs(AImag(YL2GUT))).gt.0._dp) Then 
Write(io_L,106) "Block IMYL2GUT Q=",M_GUT,"# (GUT Scale)" 
Write(io_L,107)1,1,Aimag(YL2GUT(1,1)), "# Aimag(YL2GUT(1,1))" 
Write(io_L,107)1,2,Aimag(YL2GUT(1,2)), "# Aimag(YL2GUT(1,2))" 
Write(io_L,107)1,3,Aimag(YL2GUT(1,3)), "# Aimag(YL2GUT(1,3))" 
Write(io_L,107)2,1,Aimag(YL2GUT(2,1)), "# Aimag(YL2GUT(2,1))" 
Write(io_L,107)2,2,Aimag(YL2GUT(2,2)), "# Aimag(YL2GUT(2,2))" 
Write(io_L,107)2,3,Aimag(YL2GUT(2,3)), "# Aimag(YL2GUT(2,3))" 
Write(io_L,107)3,1,Aimag(YL2GUT(3,1)), "# Aimag(YL2GUT(3,1))" 
Write(io_L,107)3,2,Aimag(YL2GUT(3,2)), "# Aimag(YL2GUT(3,2))" 
Write(io_L,107)3,3,Aimag(YL2GUT(3,3)), "# Aimag(YL2GUT(3,3))" 
End If 

Write(io_L,106) "Block YQ2GUT Q=",M_GUT,"# (GUT Scale)" 
Write(io_L,107)1,1,Real(YQ2GUT(1,1),dp), "# Real(YQ2GUT(1,1),dp)" 
Write(io_L,107)1,2,Real(YQ2GUT(1,2),dp), "# Real(YQ2GUT(1,2),dp)" 
Write(io_L,107)1,3,Real(YQ2GUT(1,3),dp), "# Real(YQ2GUT(1,3),dp)" 
Write(io_L,107)2,1,Real(YQ2GUT(2,1),dp), "# Real(YQ2GUT(2,1),dp)" 
Write(io_L,107)2,2,Real(YQ2GUT(2,2),dp), "# Real(YQ2GUT(2,2),dp)" 
Write(io_L,107)2,3,Real(YQ2GUT(2,3),dp), "# Real(YQ2GUT(2,3),dp)" 
Write(io_L,107)3,1,Real(YQ2GUT(3,1),dp), "# Real(YQ2GUT(3,1),dp)" 
Write(io_L,107)3,2,Real(YQ2GUT(3,2),dp), "# Real(YQ2GUT(3,2),dp)" 
Write(io_L,107)3,3,Real(YQ2GUT(3,3),dp), "# Real(YQ2GUT(3,3),dp)" 
If (MaxVal(Abs(AImag(YQ2GUT))).gt.0._dp) Then 
Write(io_L,106) "Block IMYQ2GUT Q=",M_GUT,"# (GUT Scale)" 
Write(io_L,107)1,1,Aimag(YQ2GUT(1,1)), "# Aimag(YQ2GUT(1,1))" 
Write(io_L,107)1,2,Aimag(YQ2GUT(1,2)), "# Aimag(YQ2GUT(1,2))" 
Write(io_L,107)1,3,Aimag(YQ2GUT(1,3)), "# Aimag(YQ2GUT(1,3))" 
Write(io_L,107)2,1,Aimag(YQ2GUT(2,1)), "# Aimag(YQ2GUT(2,1))" 
Write(io_L,107)2,2,Aimag(YQ2GUT(2,2)), "# Aimag(YQ2GUT(2,2))" 
Write(io_L,107)2,3,Aimag(YQ2GUT(2,3)), "# Aimag(YQ2GUT(2,3))" 
Write(io_L,107)3,1,Aimag(YQ2GUT(3,1)), "# Aimag(YQ2GUT(3,1))" 
Write(io_L,107)3,2,Aimag(YQ2GUT(3,2)), "# Aimag(YQ2GUT(3,2))" 
Write(io_L,107)3,3,Aimag(YQ2GUT(3,3)), "# Aimag(YQ2GUT(3,3))" 
End If 

End if 
 
MassLSP = 100000._dp 
Write(io_L,100) "Block MASS  # Mass spectrum"
Write(io_L,100) "#   PDG code      mass          particle" 
 Write(io_L,102) INT(Abs(PDGhh(1))),Mhh(1),"# "//Trim(NameParticlehh(1))// "" 
 Write(io_L,102) INT(Abs(PDGhh(2))),Mhh(2),"# "//Trim(NameParticlehh(2))// "" 
 Write(io_L,102) INT(Abs(PDGhh(3))),Mhh(3),"# "//Trim(NameParticlehh(3))// "" 
 Write(io_L,102) INT(Abs(PDGAh(3))),MAh(3),"# "//Trim(NameParticleAh(3))// "" 
 Write(io_L,102) INT(Abs(PDGHpm(3))),MHpm(3),"# "//Trim(NameParticleHpm(3))// "" 
 Write(io_L,102) 9000055,MdeltaRpp,"# deltaRpp" 
 Write(io_L,102) 23,MVZ,"# VZ" 
 Write(io_L,102) 32,MVZR,"# VZR" 
 Write(io_L,102) 24,MVWLm,"# VWLm" 
 Write(io_L,102) 34,MVWRm,"# VWRm" 
 Write(io_L,102) INT(Abs(PDGFd(1))),MFd(1),"# "//Trim(NameParticleFd(1))// "" 
 Write(io_L,102) INT(Abs(PDGFd(2))),MFd(2),"# "//Trim(NameParticleFd(2))// "" 
 Write(io_L,102) INT(Abs(PDGFd(3))),MFd(3),"# "//Trim(NameParticleFd(3))// "" 
 Write(io_L,102) INT(Abs(PDGFu(1))),MFu(1),"# "//Trim(NameParticleFu(1))// "" 
 Write(io_L,102) INT(Abs(PDGFu(2))),MFu(2),"# "//Trim(NameParticleFu(2))// "" 
 Write(io_L,102) INT(Abs(PDGFu(3))),MFu(3),"# "//Trim(NameParticleFu(3))// "" 
 Write(io_L,102) INT(Abs(PDGFe(1))),MFe(1),"# "//Trim(NameParticleFe(1))// "" 
 Write(io_L,102) INT(Abs(PDGFe(2))),MFe(2),"# "//Trim(NameParticleFe(2))// "" 
 Write(io_L,102) INT(Abs(PDGFe(3))),MFe(3),"# "//Trim(NameParticleFe(3))// "" 
 Write(io_L,102) INT(Abs(PDGFv(1))),MFv(1),"# "//Trim(NameParticleFv(1))// "" 
 Write(io_L,102) INT(Abs(PDGFv(2))),MFv(2),"# "//Trim(NameParticleFv(2))// "" 
 Write(io_L,102) INT(Abs(PDGFv(3))),MFv(3),"# "//Trim(NameParticleFv(3))// "" 
 Write(io_L,102) INT(Abs(PDGFv(4))),MFv(4),"# "//Trim(NameParticleFv(4))// "" 
 Write(io_L,102) INT(Abs(PDGFv(5))),MFv(5),"# "//Trim(NameParticleFv(5))// "" 
 Write(io_L,102) INT(Abs(PDGFv(6))),MFv(6),"# "//Trim(NameParticleFv(6))// "" 
 Write(io_L,102) 6000055,MFcpp,"# Fcpp" 
 Write(io_L,102) INT(Abs(PDGFcp(1))),MFcp(1),"# "//Trim(NameParticleFcp(1))// "" 
 Write(io_L,102) INT(Abs(PDGFcp(2))),MFcp(2),"# "//Trim(NameParticleFcp(2))// "" 
 Write(io_L,102) INT(Abs(PDGFc(1))),MFc(1),"# "//Trim(NameParticleFc(1))// "" 
 Write(io_L,102) INT(Abs(PDGFc(2))),MFc(2),"# "//Trim(NameParticleFc(2))// "" 
 Write(io_L,102) INT(Abs(PDGFc(3))),MFc(3),"# "//Trim(NameParticleFc(3))// "" 

 
Write(io_L,106) "Block SCALARMIX Q=",Q,"# ()" 
Write(io_L,107)1,1,ZH(1,1), "# ZH(1,1)" 
Write(io_L,107)1,2,ZH(1,2), "# ZH(1,2)" 
Write(io_L,107)1,3,ZH(1,3), "# ZH(1,3)" 
Write(io_L,107)2,1,ZH(2,1), "# ZH(2,1)" 
Write(io_L,107)2,2,ZH(2,2), "# ZH(2,2)" 
Write(io_L,107)2,3,ZH(2,3), "# ZH(2,3)" 
Write(io_L,107)3,1,ZH(3,1), "# ZH(3,1)" 
Write(io_L,107)3,2,ZH(3,2), "# ZH(3,2)" 
Write(io_L,107)3,3,ZH(3,3), "# ZH(3,3)" 
Write(io_L,106) "Block AMIX Q=",Q,"# ()" 
Write(io_L,107)1,1,UP(1,1), "# UP(1,1)" 
Write(io_L,107)1,2,UP(1,2), "# UP(1,2)" 
Write(io_L,107)1,3,UP(1,3), "# UP(1,3)" 
Write(io_L,107)2,1,UP(2,1), "# UP(2,1)" 
Write(io_L,107)2,2,UP(2,2), "# UP(2,2)" 
Write(io_L,107)2,3,UP(2,3), "# UP(2,3)" 
Write(io_L,107)3,1,UP(3,1), "# UP(3,1)" 
Write(io_L,107)3,2,UP(3,2), "# UP(3,2)" 
Write(io_L,107)3,3,UP(3,3), "# UP(3,3)" 
Write(io_L,106) "Block CHMIX Q=",Q,"# ()" 
Write(io_L,107)1,1,UC(1,1), "# UC(1,1)" 
Write(io_L,107)1,2,UC(1,2), "# UC(1,2)" 
Write(io_L,107)1,3,UC(1,3), "# UC(1,3)" 
Write(io_L,107)2,1,UC(2,1), "# UC(2,1)" 
Write(io_L,107)2,2,UC(2,2), "# UC(2,2)" 
Write(io_L,107)2,3,UC(2,3), "# UC(2,3)" 
Write(io_L,107)3,1,UC(3,1), "# UC(3,1)" 
Write(io_L,107)3,2,UC(3,2), "# UC(3,2)" 
Write(io_L,107)3,3,UC(3,3), "# UC(3,3)" 
Write(io_L,106) "Block UDLMIX Q=",Q,"# ()" 
Write(io_L,107)1,1,Real(ZDL(1,1),dp), "# Real(ZDL(1,1),dp)" 
Write(io_L,107)1,2,Real(ZDL(1,2),dp), "# Real(ZDL(1,2),dp)" 
Write(io_L,107)1,3,Real(ZDL(1,3),dp), "# Real(ZDL(1,3),dp)" 
Write(io_L,107)2,1,Real(ZDL(2,1),dp), "# Real(ZDL(2,1),dp)" 
Write(io_L,107)2,2,Real(ZDL(2,2),dp), "# Real(ZDL(2,2),dp)" 
Write(io_L,107)2,3,Real(ZDL(2,3),dp), "# Real(ZDL(2,3),dp)" 
Write(io_L,107)3,1,Real(ZDL(3,1),dp), "# Real(ZDL(3,1),dp)" 
Write(io_L,107)3,2,Real(ZDL(3,2),dp), "# Real(ZDL(3,2),dp)" 
Write(io_L,107)3,3,Real(ZDL(3,3),dp), "# Real(ZDL(3,3),dp)" 
If (MaxVal(Abs(AImag(ZDL))).gt.0._dp) Then 
Write(io_L,106) "Block IMUDLMIX Q=",Q,"# ()" 
Write(io_L,107)1,1,Aimag(ZDL(1,1)), "# Aimag(ZDL(1,1))" 
Write(io_L,107)1,2,Aimag(ZDL(1,2)), "# Aimag(ZDL(1,2))" 
Write(io_L,107)1,3,Aimag(ZDL(1,3)), "# Aimag(ZDL(1,3))" 
Write(io_L,107)2,1,Aimag(ZDL(2,1)), "# Aimag(ZDL(2,1))" 
Write(io_L,107)2,2,Aimag(ZDL(2,2)), "# Aimag(ZDL(2,2))" 
Write(io_L,107)2,3,Aimag(ZDL(2,3)), "# Aimag(ZDL(2,3))" 
Write(io_L,107)3,1,Aimag(ZDL(3,1)), "# Aimag(ZDL(3,1))" 
Write(io_L,107)3,2,Aimag(ZDL(3,2)), "# Aimag(ZDL(3,2))" 
Write(io_L,107)3,3,Aimag(ZDL(3,3)), "# Aimag(ZDL(3,3))" 
End If 

Write(io_L,106) "Block UDRMIX Q=",Q,"# ()" 
Write(io_L,107)1,1,Real(ZDR(1,1),dp), "# Real(ZDR(1,1),dp)" 
Write(io_L,107)1,2,Real(ZDR(1,2),dp), "# Real(ZDR(1,2),dp)" 
Write(io_L,107)1,3,Real(ZDR(1,3),dp), "# Real(ZDR(1,3),dp)" 
Write(io_L,107)2,1,Real(ZDR(2,1),dp), "# Real(ZDR(2,1),dp)" 
Write(io_L,107)2,2,Real(ZDR(2,2),dp), "# Real(ZDR(2,2),dp)" 
Write(io_L,107)2,3,Real(ZDR(2,3),dp), "# Real(ZDR(2,3),dp)" 
Write(io_L,107)3,1,Real(ZDR(3,1),dp), "# Real(ZDR(3,1),dp)" 
Write(io_L,107)3,2,Real(ZDR(3,2),dp), "# Real(ZDR(3,2),dp)" 
Write(io_L,107)3,3,Real(ZDR(3,3),dp), "# Real(ZDR(3,3),dp)" 
If (MaxVal(Abs(AImag(ZDR))).gt.0._dp) Then 
Write(io_L,106) "Block IMUDRMIX Q=",Q,"# ()" 
Write(io_L,107)1,1,Aimag(ZDR(1,1)), "# Aimag(ZDR(1,1))" 
Write(io_L,107)1,2,Aimag(ZDR(1,2)), "# Aimag(ZDR(1,2))" 
Write(io_L,107)1,3,Aimag(ZDR(1,3)), "# Aimag(ZDR(1,3))" 
Write(io_L,107)2,1,Aimag(ZDR(2,1)), "# Aimag(ZDR(2,1))" 
Write(io_L,107)2,2,Aimag(ZDR(2,2)), "# Aimag(ZDR(2,2))" 
Write(io_L,107)2,3,Aimag(ZDR(2,3)), "# Aimag(ZDR(2,3))" 
Write(io_L,107)3,1,Aimag(ZDR(3,1)), "# Aimag(ZDR(3,1))" 
Write(io_L,107)3,2,Aimag(ZDR(3,2)), "# Aimag(ZDR(3,2))" 
Write(io_L,107)3,3,Aimag(ZDR(3,3)), "# Aimag(ZDR(3,3))" 
End If 

Write(io_L,106) "Block UULMIX Q=",Q,"# ()" 
Write(io_L,107)1,1,Real(ZUL(1,1),dp), "# Real(ZUL(1,1),dp)" 
Write(io_L,107)1,2,Real(ZUL(1,2),dp), "# Real(ZUL(1,2),dp)" 
Write(io_L,107)1,3,Real(ZUL(1,3),dp), "# Real(ZUL(1,3),dp)" 
Write(io_L,107)2,1,Real(ZUL(2,1),dp), "# Real(ZUL(2,1),dp)" 
Write(io_L,107)2,2,Real(ZUL(2,2),dp), "# Real(ZUL(2,2),dp)" 
Write(io_L,107)2,3,Real(ZUL(2,3),dp), "# Real(ZUL(2,3),dp)" 
Write(io_L,107)3,1,Real(ZUL(3,1),dp), "# Real(ZUL(3,1),dp)" 
Write(io_L,107)3,2,Real(ZUL(3,2),dp), "# Real(ZUL(3,2),dp)" 
Write(io_L,107)3,3,Real(ZUL(3,3),dp), "# Real(ZUL(3,3),dp)" 
If (MaxVal(Abs(AImag(ZUL))).gt.0._dp) Then 
Write(io_L,106) "Block IMUULMIX Q=",Q,"# ()" 
Write(io_L,107)1,1,Aimag(ZUL(1,1)), "# Aimag(ZUL(1,1))" 
Write(io_L,107)1,2,Aimag(ZUL(1,2)), "# Aimag(ZUL(1,2))" 
Write(io_L,107)1,3,Aimag(ZUL(1,3)), "# Aimag(ZUL(1,3))" 
Write(io_L,107)2,1,Aimag(ZUL(2,1)), "# Aimag(ZUL(2,1))" 
Write(io_L,107)2,2,Aimag(ZUL(2,2)), "# Aimag(ZUL(2,2))" 
Write(io_L,107)2,3,Aimag(ZUL(2,3)), "# Aimag(ZUL(2,3))" 
Write(io_L,107)3,1,Aimag(ZUL(3,1)), "# Aimag(ZUL(3,1))" 
Write(io_L,107)3,2,Aimag(ZUL(3,2)), "# Aimag(ZUL(3,2))" 
Write(io_L,107)3,3,Aimag(ZUL(3,3)), "# Aimag(ZUL(3,3))" 
End If 

Write(io_L,106) "Block UURMIX Q=",Q,"# ()" 
Write(io_L,107)1,1,Real(ZUR(1,1),dp), "# Real(ZUR(1,1),dp)" 
Write(io_L,107)1,2,Real(ZUR(1,2),dp), "# Real(ZUR(1,2),dp)" 
Write(io_L,107)1,3,Real(ZUR(1,3),dp), "# Real(ZUR(1,3),dp)" 
Write(io_L,107)2,1,Real(ZUR(2,1),dp), "# Real(ZUR(2,1),dp)" 
Write(io_L,107)2,2,Real(ZUR(2,2),dp), "# Real(ZUR(2,2),dp)" 
Write(io_L,107)2,3,Real(ZUR(2,3),dp), "# Real(ZUR(2,3),dp)" 
Write(io_L,107)3,1,Real(ZUR(3,1),dp), "# Real(ZUR(3,1),dp)" 
Write(io_L,107)3,2,Real(ZUR(3,2),dp), "# Real(ZUR(3,2),dp)" 
Write(io_L,107)3,3,Real(ZUR(3,3),dp), "# Real(ZUR(3,3),dp)" 
If (MaxVal(Abs(AImag(ZUR))).gt.0._dp) Then 
Write(io_L,106) "Block IMUURMIX Q=",Q,"# ()" 
Write(io_L,107)1,1,Aimag(ZUR(1,1)), "# Aimag(ZUR(1,1))" 
Write(io_L,107)1,2,Aimag(ZUR(1,2)), "# Aimag(ZUR(1,2))" 
Write(io_L,107)1,3,Aimag(ZUR(1,3)), "# Aimag(ZUR(1,3))" 
Write(io_L,107)2,1,Aimag(ZUR(2,1)), "# Aimag(ZUR(2,1))" 
Write(io_L,107)2,2,Aimag(ZUR(2,2)), "# Aimag(ZUR(2,2))" 
Write(io_L,107)2,3,Aimag(ZUR(2,3)), "# Aimag(ZUR(2,3))" 
Write(io_L,107)3,1,Aimag(ZUR(3,1)), "# Aimag(ZUR(3,1))" 
Write(io_L,107)3,2,Aimag(ZUR(3,2)), "# Aimag(ZUR(3,2))" 
Write(io_L,107)3,3,Aimag(ZUR(3,3)), "# Aimag(ZUR(3,3))" 
End If 

Write(io_L,106) "Block UELMIX Q=",Q,"# ()" 
Write(io_L,107)1,1,Real(ZEL(1,1),dp), "# Real(ZEL(1,1),dp)" 
Write(io_L,107)1,2,Real(ZEL(1,2),dp), "# Real(ZEL(1,2),dp)" 
Write(io_L,107)1,3,Real(ZEL(1,3),dp), "# Real(ZEL(1,3),dp)" 
Write(io_L,107)2,1,Real(ZEL(2,1),dp), "# Real(ZEL(2,1),dp)" 
Write(io_L,107)2,2,Real(ZEL(2,2),dp), "# Real(ZEL(2,2),dp)" 
Write(io_L,107)2,3,Real(ZEL(2,3),dp), "# Real(ZEL(2,3),dp)" 
Write(io_L,107)3,1,Real(ZEL(3,1),dp), "# Real(ZEL(3,1),dp)" 
Write(io_L,107)3,2,Real(ZEL(3,2),dp), "# Real(ZEL(3,2),dp)" 
Write(io_L,107)3,3,Real(ZEL(3,3),dp), "# Real(ZEL(3,3),dp)" 
If (MaxVal(Abs(AImag(ZEL))).gt.0._dp) Then 
Write(io_L,106) "Block IMUELMIX Q=",Q,"# ()" 
Write(io_L,107)1,1,Aimag(ZEL(1,1)), "# Aimag(ZEL(1,1))" 
Write(io_L,107)1,2,Aimag(ZEL(1,2)), "# Aimag(ZEL(1,2))" 
Write(io_L,107)1,3,Aimag(ZEL(1,3)), "# Aimag(ZEL(1,3))" 
Write(io_L,107)2,1,Aimag(ZEL(2,1)), "# Aimag(ZEL(2,1))" 
Write(io_L,107)2,2,Aimag(ZEL(2,2)), "# Aimag(ZEL(2,2))" 
Write(io_L,107)2,3,Aimag(ZEL(2,3)), "# Aimag(ZEL(2,3))" 
Write(io_L,107)3,1,Aimag(ZEL(3,1)), "# Aimag(ZEL(3,1))" 
Write(io_L,107)3,2,Aimag(ZEL(3,2)), "# Aimag(ZEL(3,2))" 
Write(io_L,107)3,3,Aimag(ZEL(3,3)), "# Aimag(ZEL(3,3))" 
End If 

Write(io_L,106) "Block UERMIX Q=",Q,"# ()" 
Write(io_L,107)1,1,Real(ZER(1,1),dp), "# Real(ZER(1,1),dp)" 
Write(io_L,107)1,2,Real(ZER(1,2),dp), "# Real(ZER(1,2),dp)" 
Write(io_L,107)1,3,Real(ZER(1,3),dp), "# Real(ZER(1,3),dp)" 
Write(io_L,107)2,1,Real(ZER(2,1),dp), "# Real(ZER(2,1),dp)" 
Write(io_L,107)2,2,Real(ZER(2,2),dp), "# Real(ZER(2,2),dp)" 
Write(io_L,107)2,3,Real(ZER(2,3),dp), "# Real(ZER(2,3),dp)" 
Write(io_L,107)3,1,Real(ZER(3,1),dp), "# Real(ZER(3,1),dp)" 
Write(io_L,107)3,2,Real(ZER(3,2),dp), "# Real(ZER(3,2),dp)" 
Write(io_L,107)3,3,Real(ZER(3,3),dp), "# Real(ZER(3,3),dp)" 
If (MaxVal(Abs(AImag(ZER))).gt.0._dp) Then 
Write(io_L,106) "Block IMUERMIX Q=",Q,"# ()" 
Write(io_L,107)1,1,Aimag(ZER(1,1)), "# Aimag(ZER(1,1))" 
Write(io_L,107)1,2,Aimag(ZER(1,2)), "# Aimag(ZER(1,2))" 
Write(io_L,107)1,3,Aimag(ZER(1,3)), "# Aimag(ZER(1,3))" 
Write(io_L,107)2,1,Aimag(ZER(2,1)), "# Aimag(ZER(2,1))" 
Write(io_L,107)2,2,Aimag(ZER(2,2)), "# Aimag(ZER(2,2))" 
Write(io_L,107)2,3,Aimag(ZER(2,3)), "# Aimag(ZER(2,3))" 
Write(io_L,107)3,1,Aimag(ZER(3,1)), "# Aimag(ZER(3,1))" 
Write(io_L,107)3,2,Aimag(ZER(3,2)), "# Aimag(ZER(3,2))" 
Write(io_L,107)3,3,Aimag(ZER(3,3)), "# Aimag(ZER(3,3))" 
End If 

Write(io_L,106) "Block UVMIX Q=",Q,"# ()" 
Write(io_L,107)1,1,Real(UV(1,1),dp), "# Real(UV(1,1),dp)" 
Write(io_L,107)1,2,Real(UV(1,2),dp), "# Real(UV(1,2),dp)" 
Write(io_L,107)1,3,Real(UV(1,3),dp), "# Real(UV(1,3),dp)" 
Write(io_L,107)1,4,Real(UV(1,4),dp), "# Real(UV(1,4),dp)" 
Write(io_L,107)1,5,Real(UV(1,5),dp), "# Real(UV(1,5),dp)" 
Write(io_L,107)1,6,Real(UV(1,6),dp), "# Real(UV(1,6),dp)" 
Write(io_L,107)2,1,Real(UV(2,1),dp), "# Real(UV(2,1),dp)" 
Write(io_L,107)2,2,Real(UV(2,2),dp), "# Real(UV(2,2),dp)" 
Write(io_L,107)2,3,Real(UV(2,3),dp), "# Real(UV(2,3),dp)" 
Write(io_L,107)2,4,Real(UV(2,4),dp), "# Real(UV(2,4),dp)" 
Write(io_L,107)2,5,Real(UV(2,5),dp), "# Real(UV(2,5),dp)" 
Write(io_L,107)2,6,Real(UV(2,6),dp), "# Real(UV(2,6),dp)" 
Write(io_L,107)3,1,Real(UV(3,1),dp), "# Real(UV(3,1),dp)" 
Write(io_L,107)3,2,Real(UV(3,2),dp), "# Real(UV(3,2),dp)" 
Write(io_L,107)3,3,Real(UV(3,3),dp), "# Real(UV(3,3),dp)" 
Write(io_L,107)3,4,Real(UV(3,4),dp), "# Real(UV(3,4),dp)" 
Write(io_L,107)3,5,Real(UV(3,5),dp), "# Real(UV(3,5),dp)" 
Write(io_L,107)3,6,Real(UV(3,6),dp), "# Real(UV(3,6),dp)" 
Write(io_L,107)4,1,Real(UV(4,1),dp), "# Real(UV(4,1),dp)" 
Write(io_L,107)4,2,Real(UV(4,2),dp), "# Real(UV(4,2),dp)" 
Write(io_L,107)4,3,Real(UV(4,3),dp), "# Real(UV(4,3),dp)" 
Write(io_L,107)4,4,Real(UV(4,4),dp), "# Real(UV(4,4),dp)" 
Write(io_L,107)4,5,Real(UV(4,5),dp), "# Real(UV(4,5),dp)" 
Write(io_L,107)4,6,Real(UV(4,6),dp), "# Real(UV(4,6),dp)" 
Write(io_L,107)5,1,Real(UV(5,1),dp), "# Real(UV(5,1),dp)" 
Write(io_L,107)5,2,Real(UV(5,2),dp), "# Real(UV(5,2),dp)" 
Write(io_L,107)5,3,Real(UV(5,3),dp), "# Real(UV(5,3),dp)" 
Write(io_L,107)5,4,Real(UV(5,4),dp), "# Real(UV(5,4),dp)" 
Write(io_L,107)5,5,Real(UV(5,5),dp), "# Real(UV(5,5),dp)" 
Write(io_L,107)5,6,Real(UV(5,6),dp), "# Real(UV(5,6),dp)" 
Write(io_L,107)6,1,Real(UV(6,1),dp), "# Real(UV(6,1),dp)" 
Write(io_L,107)6,2,Real(UV(6,2),dp), "# Real(UV(6,2),dp)" 
Write(io_L,107)6,3,Real(UV(6,3),dp), "# Real(UV(6,3),dp)" 
Write(io_L,107)6,4,Real(UV(6,4),dp), "# Real(UV(6,4),dp)" 
Write(io_L,107)6,5,Real(UV(6,5),dp), "# Real(UV(6,5),dp)" 
Write(io_L,107)6,6,Real(UV(6,6),dp), "# Real(UV(6,6),dp)" 
If (MaxVal(Abs(AImag(UV))).gt.0._dp) Then 
Write(io_L,106) "Block IMUVMIX Q=",Q,"# ()" 
Write(io_L,107)1,1,Aimag(UV(1,1)), "# Aimag(UV(1,1))" 
Write(io_L,107)1,2,Aimag(UV(1,2)), "# Aimag(UV(1,2))" 
Write(io_L,107)1,3,Aimag(UV(1,3)), "# Aimag(UV(1,3))" 
Write(io_L,107)1,4,Aimag(UV(1,4)), "# Aimag(UV(1,4))" 
Write(io_L,107)1,5,Aimag(UV(1,5)), "# Aimag(UV(1,5))" 
Write(io_L,107)1,6,Aimag(UV(1,6)), "# Aimag(UV(1,6))" 
Write(io_L,107)2,1,Aimag(UV(2,1)), "# Aimag(UV(2,1))" 
Write(io_L,107)2,2,Aimag(UV(2,2)), "# Aimag(UV(2,2))" 
Write(io_L,107)2,3,Aimag(UV(2,3)), "# Aimag(UV(2,3))" 
Write(io_L,107)2,4,Aimag(UV(2,4)), "# Aimag(UV(2,4))" 
Write(io_L,107)2,5,Aimag(UV(2,5)), "# Aimag(UV(2,5))" 
Write(io_L,107)2,6,Aimag(UV(2,6)), "# Aimag(UV(2,6))" 
Write(io_L,107)3,1,Aimag(UV(3,1)), "# Aimag(UV(3,1))" 
Write(io_L,107)3,2,Aimag(UV(3,2)), "# Aimag(UV(3,2))" 
Write(io_L,107)3,3,Aimag(UV(3,3)), "# Aimag(UV(3,3))" 
Write(io_L,107)3,4,Aimag(UV(3,4)), "# Aimag(UV(3,4))" 
Write(io_L,107)3,5,Aimag(UV(3,5)), "# Aimag(UV(3,5))" 
Write(io_L,107)3,6,Aimag(UV(3,6)), "# Aimag(UV(3,6))" 
Write(io_L,107)4,1,Aimag(UV(4,1)), "# Aimag(UV(4,1))" 
Write(io_L,107)4,2,Aimag(UV(4,2)), "# Aimag(UV(4,2))" 
Write(io_L,107)4,3,Aimag(UV(4,3)), "# Aimag(UV(4,3))" 
Write(io_L,107)4,4,Aimag(UV(4,4)), "# Aimag(UV(4,4))" 
Write(io_L,107)4,5,Aimag(UV(4,5)), "# Aimag(UV(4,5))" 
Write(io_L,107)4,6,Aimag(UV(4,6)), "# Aimag(UV(4,6))" 
Write(io_L,107)5,1,Aimag(UV(5,1)), "# Aimag(UV(5,1))" 
Write(io_L,107)5,2,Aimag(UV(5,2)), "# Aimag(UV(5,2))" 
Write(io_L,107)5,3,Aimag(UV(5,3)), "# Aimag(UV(5,3))" 
Write(io_L,107)5,4,Aimag(UV(5,4)), "# Aimag(UV(5,4))" 
Write(io_L,107)5,5,Aimag(UV(5,5)), "# Aimag(UV(5,5))" 
Write(io_L,107)5,6,Aimag(UV(5,6)), "# Aimag(UV(5,6))" 
Write(io_L,107)6,1,Aimag(UV(6,1)), "# Aimag(UV(6,1))" 
Write(io_L,107)6,2,Aimag(UV(6,2)), "# Aimag(UV(6,2))" 
Write(io_L,107)6,3,Aimag(UV(6,3)), "# Aimag(UV(6,3))" 
Write(io_L,107)6,4,Aimag(UV(6,4)), "# Aimag(UV(6,4))" 
Write(io_L,107)6,5,Aimag(UV(6,5)), "# Aimag(UV(6,5))" 
Write(io_L,107)6,6,Aimag(UV(6,6)), "# Aimag(UV(6,6))" 
End If 

Write(io_L,106) "Block UTMIX Q=",Q,"# ()" 
Write(io_L,107)1,1,Real(UT(1,1),dp), "# Real(UT(1,1),dp)" 
Write(io_L,107)1,2,Real(UT(1,2),dp), "# Real(UT(1,2),dp)" 
Write(io_L,107)1,3,Real(UT(1,3),dp), "# Real(UT(1,3),dp)" 
Write(io_L,107)2,1,Real(UT(2,1),dp), "# Real(UT(2,1),dp)" 
Write(io_L,107)2,2,Real(UT(2,2),dp), "# Real(UT(2,2),dp)" 
Write(io_L,107)2,3,Real(UT(2,3),dp), "# Real(UT(2,3),dp)" 
Write(io_L,107)3,1,Real(UT(3,1),dp), "# Real(UT(3,1),dp)" 
Write(io_L,107)3,2,Real(UT(3,2),dp), "# Real(UT(3,2),dp)" 
Write(io_L,107)3,3,Real(UT(3,3),dp), "# Real(UT(3,3),dp)" 
If (MaxVal(Abs(AImag(UT))).gt.0._dp) Then 
Write(io_L,106) "Block IMUTMIX Q=",Q,"# ()" 
Write(io_L,107)1,1,Aimag(UT(1,1)), "# Aimag(UT(1,1))" 
Write(io_L,107)1,2,Aimag(UT(1,2)), "# Aimag(UT(1,2))" 
Write(io_L,107)1,3,Aimag(UT(1,3)), "# Aimag(UT(1,3))" 
Write(io_L,107)2,1,Aimag(UT(2,1)), "# Aimag(UT(2,1))" 
Write(io_L,107)2,2,Aimag(UT(2,2)), "# Aimag(UT(2,2))" 
Write(io_L,107)2,3,Aimag(UT(2,3)), "# Aimag(UT(2,3))" 
Write(io_L,107)3,1,Aimag(UT(3,1)), "# Aimag(UT(3,1))" 
Write(io_L,107)3,2,Aimag(UT(3,2)), "# Aimag(UT(3,2))" 
Write(io_L,107)3,3,Aimag(UT(3,3)), "# Aimag(UT(3,3))" 
End If 

Write(io_L,106) "Block VTEMIX Q=",Q,"# ()" 
Write(io_L,107)1,1,Real(VTE(1,1),dp), "# Real(VTE(1,1),dp)" 
Write(io_L,107)1,2,Real(VTE(1,2),dp), "# Real(VTE(1,2),dp)" 
Write(io_L,107)2,1,Real(VTE(2,1),dp), "# Real(VTE(2,1),dp)" 
Write(io_L,107)2,2,Real(VTE(2,2),dp), "# Real(VTE(2,2),dp)" 
If (MaxVal(Abs(AImag(VTE))).gt.0._dp) Then 
Write(io_L,106) "Block IMVTEMIX Q=",Q,"# ()" 
Write(io_L,107)1,1,Aimag(VTE(1,1)), "# Aimag(VTE(1,1))" 
Write(io_L,107)1,2,Aimag(VTE(1,2)), "# Aimag(VTE(1,2))" 
Write(io_L,107)2,1,Aimag(VTE(2,1)), "# Aimag(VTE(2,1))" 
Write(io_L,107)2,2,Aimag(VTE(2,2)), "# Aimag(VTE(2,2))" 
End If 

Write(io_L,106) "Block UTEMIX Q=",Q,"# ()" 
Write(io_L,107)1,1,Real(UTE(1,1),dp), "# Real(UTE(1,1),dp)" 
Write(io_L,107)1,2,Real(UTE(1,2),dp), "# Real(UTE(1,2),dp)" 
Write(io_L,107)2,1,Real(UTE(2,1),dp), "# Real(UTE(2,1),dp)" 
Write(io_L,107)2,2,Real(UTE(2,2),dp), "# Real(UTE(2,2),dp)" 
If (MaxVal(Abs(AImag(UTE))).gt.0._dp) Then 
Write(io_L,106) "Block IMUTEMIX Q=",Q,"# ()" 
Write(io_L,107)1,1,Aimag(UTE(1,1)), "# Aimag(UTE(1,1))" 
Write(io_L,107)1,2,Aimag(UTE(1,2)), "# Aimag(UTE(1,2))" 
Write(io_L,107)2,1,Aimag(UTE(2,1)), "# Aimag(UTE(2,1))" 
Write(io_L,107)2,2,Aimag(UTE(2,2)), "# Aimag(UTE(2,2))" 
End If 

Write(io_L,106) "Block ZZMIX Q=",Q,"# ()" 
Write(io_L,107)1,1,Real(ZZ(1,1),dp), "# Real(ZZ(1,1),dp)" 
Write(io_L,107)1,2,Real(ZZ(1,2),dp), "# Real(ZZ(1,2),dp)" 
Write(io_L,107)1,3,Real(ZZ(1,3),dp), "# Real(ZZ(1,3),dp)" 
Write(io_L,107)2,1,Real(ZZ(2,1),dp), "# Real(ZZ(2,1),dp)" 
Write(io_L,107)2,2,Real(ZZ(2,2),dp), "# Real(ZZ(2,2),dp)" 
Write(io_L,107)2,3,Real(ZZ(2,3),dp), "# Real(ZZ(2,3),dp)" 
Write(io_L,107)3,1,Real(ZZ(3,1),dp), "# Real(ZZ(3,1),dp)" 
Write(io_L,107)3,2,Real(ZZ(3,2),dp), "# Real(ZZ(3,2),dp)" 
Write(io_L,107)3,3,Real(ZZ(3,3),dp), "# Real(ZZ(3,3),dp)" 
If (MaxVal(Abs(AImag(ZZ))).gt.0._dp) Then 
Write(io_L,106) "Block IMZZMIX Q=",Q,"# ()" 
Write(io_L,107)1,1,Aimag(ZZ(1,1)), "# Aimag(ZZ(1,1))" 
Write(io_L,107)1,2,Aimag(ZZ(1,2)), "# Aimag(ZZ(1,2))" 
Write(io_L,107)1,3,Aimag(ZZ(1,3)), "# Aimag(ZZ(1,3))" 
Write(io_L,107)2,1,Aimag(ZZ(2,1)), "# Aimag(ZZ(2,1))" 
Write(io_L,107)2,2,Aimag(ZZ(2,2)), "# Aimag(ZZ(2,2))" 
Write(io_L,107)2,3,Aimag(ZZ(2,3)), "# Aimag(ZZ(2,3))" 
Write(io_L,107)3,1,Aimag(ZZ(3,1)), "# Aimag(ZZ(3,1))" 
Write(io_L,107)3,2,Aimag(ZZ(3,2)), "# Aimag(ZZ(3,2))" 
Write(io_L,107)3,3,Aimag(ZZ(3,3)), "# Aimag(ZZ(3,3))" 
End If 

Write(io_L,100) "Block SPheno # SPheno internal parameters " 
Write(io_L,102) 1,1.*ErrorLevel,"# ErrorLevel"

If (SPA_convention) Then
Write(io_L,102) 2,1.,"# SPA_conventions"
Else
Write(io_L,102) 2,0.,"# SPA_conventions"
End if

If (L_BR) Then
Write(io_L,102) 11,1.,"# Branching ratios"
Else
Write(io_L,102) 11,0.,"# Branching ratios"
End if


If (Enable3BDecays) Then
Write(io_L,102) 13,1.,"# 3 Body decays"
Else
Write(io_L,102) 13,0.,"# 3 Body decays"
End if


Write(io_L,102) 31,m_GUT,"# GUT scale"

Write(io_L,102) 33,Q,"# Renormalization scale"

Write(io_L,102) 34,delta_mass,"# Precision"

Write(io_L,102) 35,1.*n_run,"# Iterations"


If (TwoLoopRGE) Then
Write(io_L,102) 38,2.,"# RGE level"
Else
Write(io_L,102) 38,1.,"# RGE level"
End if

Write(io_L,102) 40,Alpha,"# Alpha"

Write(io_L,102) 41,gamZ,"# Gamma_Z"

Write(io_L,102) 42,gamW,"# Gamma_W"

If (RotateNegativeFermionMasses) Then
Write(io_L,102) 50,1.,"# Rotate negative fermion masses"
Else
Write(io_L,102) 50,0.,"# Rotate negative fermion masses"
End if


If (SwitchToSCKM) Then
Write(io_L,102) 51,1.,"# Switch to SCKM matrix"
Else
Write(io_L,102) 51,0.,"# Switch to SCKM matrix"
End if


If (IgnoreNegativeMasses) Then
Write(io_L,102) 52,1.,"# Ignore negative masses"
Else
Write(io_L,102) 52,0.,"# Ignore negative masses"
End if


If (IgnoreNegativeMassesMZ) Then
Write(io_L,102) 53,1.,"# Ignore negative masses at MZ"
Else
Write(io_L,102) 53,0.,"# Ignore negative masses at MZ"
End if


If (CalculateOneLoopMasses) Then
Write(io_L,102) 55,1.,"# Calculate one loop masses"
Else
Write(io_L,102) 55,0.,"# Calculate one loop masses"
End if


If (CalculateTwoLoopHiggsMasses) Then
Write(io_L,102) 56,1.,"# Calculate two-loop Higgs masses"
Else
Write(io_L,102) 56,0.,"# Calculate two-loop Higgs masses"
End if

If (CalculateLowEnergy) Then
Write(io_L,102) 57,1.,"# Calculate low energy"
Else
Write(io_L,102) 57,0.,"# Calculate low energy"
End if

If (KineticMixing) Then
Write(io_L,102) 60,1.,"# Include kinetic mixing"
Else
Write(io_L,102) 60,0.,"# Include kinetic mixing"
End if

Write(io_L,102) 65,1.*SolutionTadpoleNr,"# Solution of tadpole equation"
 


 
If(Write_WHIZARD) Call WriteWHIZARD 
 
If(Write_HiggsBounds) Call WriteHiggsBounds
 

 
If (L_BR) Then 
Write(io_L,100) "Block HiggsLHC7 # Higgs production cross section at LHC7 [pb] " 
Do i1=1,3
CurrentPDG2(1) = Abs(PDGhh(i1)) 
If (CS_Higgs_LHC(1,i1,1).gt.0._dp) Write(io_L,119) 1, CurrentPDG2(1), CS_Higgs_LHC(1,i1,1), " # Gluon fusion " 
If (CS_Higgs_LHC(1,i1,2).gt.0._dp) Write(io_L,119) 2, CurrentPDG2(1), CS_Higgs_LHC(1,i1,2), " # Vector boson fusion " 
If (CS_Higgs_LHC(1,i1,3).gt.0._dp) Write(io_L,119) 3, CurrentPDG2(1), CS_Higgs_LHC(1,i1,3), " # W-H production " 
If (CS_Higgs_LHC(1,i1,4).gt.0._dp) Write(io_L,119) 4, CurrentPDG2(1), CS_Higgs_LHC(1,i1,4), " # Z-H production " 
If (CS_Higgs_LHC(1,i1,5).gt.0._dp) Write(io_L,119) 5, CurrentPDG2(1), CS_Higgs_LHC(1,i1,5), " # t-t-H production " 
End Do 
Write(io_L,100) "Block HiggsLHC8 # Higgs production cross section at LHC8 [pb] " 
Do i1=1,3
CurrentPDG2(1) = Abs(PDGhh(i1)) 
If (CS_Higgs_LHC(2,i1,1).gt.0._dp) Write(io_L,119) 1, CurrentPDG2(1), CS_Higgs_LHC(2,i1,1), " # Gluon fusion " 
If (CS_Higgs_LHC(2,i1,2).gt.0._dp) Write(io_L,119) 2, CurrentPDG2(1), CS_Higgs_LHC(2,i1,2), " # Vector boson fusion " 
If (CS_Higgs_LHC(2,i1,3).gt.0._dp) Write(io_L,119) 3, CurrentPDG2(1), CS_Higgs_LHC(2,i1,3), " # W-H production " 
If (CS_Higgs_LHC(2,i1,4).gt.0._dp) Write(io_L,119) 4, CurrentPDG2(1), CS_Higgs_LHC(2,i1,4), " # Z-H production " 
If (CS_Higgs_LHC(2,i1,5).gt.0._dp) Write(io_L,119) 5, CurrentPDG2(1), CS_Higgs_LHC(2,i1,5), " # t-t-H production " 
End Do 
If (WriteEffHiggsCouplingRatios) Then 
Write(io_L,100) "Block HiggsBoundsInputHiggsCouplingsFermions # " 
Write(io_L,1101) rHB_S_S_Fd(1,3),rHB_S_P_Fd(1,3), 3 ,25,5,5, " # h_1 b b coupling " 
Write(io_L,1101) rHB_S_S_Fd(1,2),rHB_S_P_Fd(1,2), 3 ,25,3,3, " # h_1 s s coupling " 
Write(io_L,1101) rHB_S_S_Fu(1,3),rHB_S_P_Fu(1,3), 3 ,25,6,6, " # h_1 t t coupling  " 
Write(io_L,1101) rHB_S_S_Fu(1,2),rHB_S_P_Fu(1,2),3 ,25,4,4, " # h_1 c c coupling " 
Write(io_L,1101) rHB_S_S_Fe(1,3),rHB_S_P_Fe(1,3), 3 ,25,15,15, " # h_1 tau tau coupling " 
Write(io_L,1101) rHB_S_S_Fe(1,2),rHB_S_P_Fe(1,2), 3 ,25,13,13, " # h_1 mu mu coupling  " 
Write(io_L,1101) rHB_S_S_Fd(2,3),rHB_S_P_Fd(2,3), 3 ,35,5,5, " # h_2 b b coupling " 
Write(io_L,1101) rHB_S_S_Fd(2,2),rHB_S_P_Fd(2,2), 3 ,35,3,3, " # h_2 s s coupling " 
Write(io_L,1101) rHB_S_S_Fu(2,3),rHB_S_P_Fu(2,3), 3 ,35,6,6, " # h_2 t t coupling  " 
Write(io_L,1101) rHB_S_S_Fu(2,2),rHB_S_P_Fu(2,2),3 ,35,4,4, " # h_2 c c coupling " 
Write(io_L,1101) rHB_S_S_Fe(2,3),rHB_S_P_Fe(2,3), 3 ,35,15,15, " # h_2 tau tau coupling " 
Write(io_L,1101) rHB_S_S_Fe(2,2),rHB_S_P_Fe(2,2), 3 ,35,13,13, " # h_2 mu mu coupling  " 
Write(io_L,1101) rHB_S_S_Fd(3,3),rHB_S_P_Fd(3,3), 3 ,335,5,5, " # h_3 b b coupling " 
Write(io_L,1101) rHB_S_S_Fd(3,2),rHB_S_P_Fd(3,2), 3 ,335,3,3, " # h_3 s s coupling " 
Write(io_L,1101) rHB_S_S_Fu(3,3),rHB_S_P_Fu(3,3), 3 ,335,6,6, " # h_3 t t coupling  " 
Write(io_L,1101) rHB_S_S_Fu(3,2),rHB_S_P_Fu(3,2),3 ,335,4,4, " # h_3 c c coupling " 
Write(io_L,1101) rHB_S_S_Fe(3,3),rHB_S_P_Fe(3,3), 3 ,335,15,15, " # h_3 tau tau coupling " 
Write(io_L,1101) rHB_S_S_Fe(3,2),rHB_S_P_Fe(3,2), 3 ,335,13,13, " # h_3 mu mu coupling  " 
Write(io_L,1101) rHB_P_S_Fd(3,3),rHB_P_P_Fd(3,3), 3 ,36,5,5, " # A_3 b b coupling " 
Write(io_L,1101) rHB_P_S_Fd(3,2),rHB_P_P_Fd(3,2), 3 ,36,3,3, " # A_3 s s coupling " 
Write(io_L,1101) rHB_P_S_Fu(3,3),rHB_P_P_Fu(3,3), 3 ,36,6,6, " # A_3 t t coupling "  
Write(io_L,1101) rHB_P_S_Fu(3,2),rHB_P_P_Fu(3,2), 3 ,36,4,4, " # A_3 c c coupling " 
Write(io_L,1101) rHB_P_S_Fe(3,3),rHB_P_P_Fe(3,3), 3 ,36,15,15, " # A_3 tau tau coupling " 
Write(io_L,1101) rHB_P_S_Fe(3,2),rHB_P_P_Fe(3,2), 3 ,36,13,13, " # A_3 mu mu coupling " 
Write(io_L,100) "Block HiggsBoundsInputHiggsCouplingsBosons # " 
Write(io_L,1102) rHB_S_VWLm(1),3 ,25,24,24, " # h_1 W W coupling " 
Write(io_L,1102) rHB_S_VZ(1),3 ,25,23,23, " # h_1 Z Z coupling  " 
Write(io_L,1102) 0._dp ,3 ,25,23,22, " # h_1 Z gamma coupling " 
Write(io_L,1102) Real(ratioPP(1),dp),3 ,25,22,22, " # h_1 gamma gamma coupling " 
Write(io_L,1102) Real(ratioGG(1),dp),3 ,25,21,21, " # h_1 g g coupling " 
Write(io_L,1103) 0._dp,4 ,25,21,21,23, " # h_1 g g Z coupling " 
Write(io_L,1102) rHB_S_VWLm(2),3 ,35,24,24, " # h_2 W W coupling " 
Write(io_L,1102) rHB_S_VZ(2),3 ,35,23,23, " # h_2 Z Z coupling  " 
Write(io_L,1102) 0._dp ,3 ,35,23,22, " # h_2 Z gamma coupling " 
Write(io_L,1102) Real(ratioPP(2),dp),3 ,35,22,22, " # h_2 gamma gamma coupling " 
Write(io_L,1102) Real(ratioGG(2),dp),3 ,35,21,21, " # h_2 g g coupling " 
Write(io_L,1103) 0._dp,4 ,35,21,21,23, " # h_2 g g Z coupling " 
Write(io_L,1102) rHB_S_VWLm(3),3 ,335,24,24, " # h_3 W W coupling " 
Write(io_L,1102) rHB_S_VZ(3),3 ,335,23,23, " # h_3 Z Z coupling  " 
Write(io_L,1102) 0._dp ,3 ,335,23,22, " # h_3 Z gamma coupling " 
Write(io_L,1102) Real(ratioPP(3),dp),3 ,335,22,22, " # h_3 gamma gamma coupling " 
Write(io_L,1102) Real(ratioGG(3),dp),3 ,335,21,21, " # h_3 g g coupling " 
Write(io_L,1103) 0._dp,4 ,335,21,21,23, " # h_3 g g Z coupling " 
Write(io_L,1102) rHB_P_VWLm(3),3 ,36,24,24, " # A_3 W W coupling " 
Write(io_L,1102) rHB_P_VZ(3),3 ,36,23,23, " # A_3 Z Z coupling " 
Write(io_L,1102) 0._dp ,3 ,36,23,22, " # A_3 Z gamma coupling " 
Write(io_L,1102) Real(ratioPPP(3),dp),3 ,36,22,22, " # A_3 gamma gamma coupling " 
Write(io_L,1102) Real(ratioPGG(3),dp),3 ,36,21,21, " # A_3 g g coupling " 
Write(io_L,1103) 0._dp,4 ,36,21,21,23, " # A_3 g g Z coupling " 
Write(io_L,1102) Real(CPL_H_H_Z(1,1), dp),3 ,25,25,23, " # h_1 h_1 Z coupling  "
Write(io_L,1102) Real(CPL_H_H_Z(1,2), dp),3 ,25,35,23, " # h_1 h_2 Z coupling  "
Write(io_L,1102) Real(CPL_H_H_Z(1,3), dp),3 ,25,335,23, " # h_1 h_3 Z coupling  "
Write(io_L,1102) Real(CPL_A_H_Z(3,1), dp),3 ,25,36,23, " # h_1 A_3 Z coupling " 
Write(io_L,1102) Real(CPL_H_H_Z(2,1), dp),3 ,35,25,23, " # h_2 h_1 Z coupling  "
Write(io_L,1102) Real(CPL_H_H_Z(2,2), dp),3 ,35,35,23, " # h_2 h_2 Z coupling  "
Write(io_L,1102) Real(CPL_H_H_Z(2,3), dp),3 ,35,335,23, " # h_2 h_3 Z coupling  "
Write(io_L,1102) Real(CPL_A_H_Z(3,2), dp),3 ,35,36,23, " # h_2 A_3 Z coupling " 
Write(io_L,1102) Real(CPL_H_H_Z(3,1), dp),3 ,335,25,23, " # h_3 h_1 Z coupling  "
Write(io_L,1102) Real(CPL_H_H_Z(3,2), dp),3 ,335,35,23, " # h_3 h_2 Z coupling  "
Write(io_L,1102) Real(CPL_H_H_Z(3,3), dp),3 ,335,335,23, " # h_3 h_3 Z coupling  "
Write(io_L,1102) Real(CPL_A_H_Z(3,3), dp),3 ,335,36,23, " # h_3 A_3 Z coupling " 
Write(io_L,1102) Real(CPL_A_A_Z(3,3), dp),3 ,36,36,23, " # A_3 A_3 Z coupling " 
End If 

 
If (WriteHiggsDiphotonLoopContributions) Then 
Write(io_L,100) "Block HPPloops # Loop contributions to H-Photon-Photon coupling " 
Do i1=1,3
CurrentPDG2(1) = Abs(PDGhh(i1)) 
Do i2=1,1
CurrentPDG2(2) = Abs(PDGdeltaRpp) 
Write(io_L,122) CurrentPDG2(1), CurrentPDG2(2), HPPloopdeltaRpp(i1), " # h(",i1,")-deltaRpp(",i2,")-loop " 
End do 
Do i2=1,1
CurrentPDG2(2) = Abs(PDGVWLm) 
Write(io_L,122) CurrentPDG2(1), CurrentPDG2(2), HPPloopVWLm(i1), " # h(",i1,")-VWLm(",i2,")-loop " 
End do 
Do i2=1,1
CurrentPDG2(2) = Abs(PDGVWRm) 
Write(io_L,122) CurrentPDG2(1), CurrentPDG2(2), HPPloopVWRm(i1), " # h(",i1,")-VWRm(",i2,")-loop " 
End do 
Do i2=3,3
CurrentPDG2(2) = Abs(PDGHpm(i2)) 
Write(io_L,122) CurrentPDG2(1), CurrentPDG2(2), HPPloopHpm(i2,i1), " # h(",i1,")-Hpm(",i2,")-loop " 
End do 
Do i2=1,3
CurrentPDG2(2) = Abs(PDGFd(i2)) 
Write(io_L,122) CurrentPDG2(1), CurrentPDG2(2), HPPloopFd(i2,i1), " # h(",i1,")-Fd(",i2,")-loop " 
End do 
Do i2=1,3
CurrentPDG2(2) = Abs(PDGFu(i2)) 
Write(io_L,122) CurrentPDG2(1), CurrentPDG2(2), HPPloopFu(i2,i1), " # h(",i1,")-Fu(",i2,")-loop " 
End do 
Do i2=1,3
CurrentPDG2(2) = Abs(PDGFe(i2)) 
Write(io_L,122) CurrentPDG2(1), CurrentPDG2(2), HPPloopFe(i2,i1), " # h(",i1,")-Fe(",i2,")-loop " 
End do 
Do i2=1,2
CurrentPDG2(2) = Abs(PDGFcp(i2)) 
Write(io_L,122) CurrentPDG2(1), CurrentPDG2(2), HPPloopFcp(i2,i1), " # h(",i1,")-Fcp(",i2,")-loop " 
End do 
End Do 
End if 

 
Write(io_L,100) "Block EFFHIGGSCOUPLINGS # values of loop-induced couplings " 
facPP = Alpha*Sqrt(2._dp*G_F/sqrt(2._dp))/(2._dp*Pi) 
facGG = Sqrt(2._dp*G_F/sqrt(2._dp))/(Sqrt(2._dp)*2._dp*Pi)*sqrt(8._dp/9._dp)
facPZ = 0._dp 
Do i1=1,3
CurrentPDG3(1) = Abs(PDGhh(i1)) 
CurrentPDG3(2) = Abs(PDGVP) 
CurrentPDG3(3) = Abs(PDGVP) 
Write(io_L,121) CurrentPDG3(1), CurrentPDG3(2), CurrentPDG3(3), Abs(CoupHPP(i1))*facPP, " # H-Photon-Photon " 
CurrentPDG3(2) = Abs(PDGVG) 
CurrentPDG3(3) = Abs(PDGVG) 
Write(io_L,121) CurrentPDG3(1), CurrentPDG3(2), CurrentPDG3(3), Abs(CoupHGG(i1))*facGG, " # H-Gluon-Gluon " 
CurrentPDG3(2) = Abs(PDGVP) 
CurrentPDG3(3) = Abs(PDGVZ) 
Write(io_L,121) CurrentPDG3(1), CurrentPDG3(2), CurrentPDG3(3), 0._dp, " # H-Photon-Z (not yet calculated by SPheno) " 
End Do 
Do i1=3,3
CurrentPDG3(1) = Abs(PDGAh(i1)) 
CurrentPDG3(2) = Abs(PDGVP) 
CurrentPDG3(3) = Abs(PDGVP) 
Write(io_L,121) CurrentPDG3(1), CurrentPDG3(2), CurrentPDG3(3), Abs(CoupAPP(i1))*facPP, " # A-Photon-Photon " 
CurrentPDG3(2) = Abs(PDGVG) 
CurrentPDG3(3) = Abs(PDGVG) 
Write(io_L,121) CurrentPDG3(1), CurrentPDG3(2), CurrentPDG3(3), Abs(CoupAGG(i1))*facGG, " # A-Gluon-Gluon " 
CurrentPDG3(2) = Abs(PDGVP) 
CurrentPDG3(3) = Abs(PDGVZ) 
Write(io_L,121) CurrentPDG3(1), CurrentPDG3(2), CurrentPDG3(3), 0._dp, " # A-Photon-Z (not yet calculated by SPheno) " 
End Do 
End If 

 
Write(io_L,100) "Block SPhenoLowEnergy # low energy observables " 
Write(io_L,1010) 20,ae,  "# (g-2)_e" 
Write(io_L,1010) 21,amu,  "# (g-2)_mu" 
Write(io_L,1010) 22,atau,  "# (g-2)_tau" 
Write(io_L,1010) 23,EDMe,  "# EDM(e)" 
Write(io_L,1010) 24,EDMmu,  "# EDM(mu)" 
Write(io_L,1010) 25,EDMtau,  "# EDM(tau)" 
Write(io_L,1010) 39,dRho,  "# delta(rho)" 
Write(io_L,100) "Block FlavorKitQFV # quark flavor violating observables " 
Write(io_L,1010) 200,BrBsGamma,  "# BR(B->X_s gamma)" 
Write(io_L,1010) 201,ratioBsGamma,  "# BR(B->X_s gamma)/BR(B->X_s gamma)_SM" 
Write(io_L,1010) 300,BrDmunu,  "# BR(D->mu nu)" 
Write(io_L,1010) 301,ratioDmunu,  "# BR(D->mu nu)/BR(D->mu nu)_SM" 
Write(io_L,1010) 400,BrDsmunu,  "# BR(Ds->mu nu)" 
Write(io_L,1010) 401,ratioDsmunu,  "# BR(Ds->mu nu)/BR(Ds->mu nu)_SM" 
Write(io_L,1010) 402,BrDstaunu,  "# BR(Ds->tau nu)" 
Write(io_L,1010) 403,ratioDstaunu,  "# BR(Ds->tau nu)/BR(Ds->tau nu)_SM" 
Write(io_L,1010) 500,BrBmunu,  "# BR(B->mu nu)" 
Write(io_L,1010) 501,ratioBmunu,  "# BR(B->mu nu)/BR(B->mu nu)_SM" 
Write(io_L,1010) 502,BrBtaunu,  "# BR(B->tau nu)" 
Write(io_L,1010) 503,ratioBtaunu,  "# BR(B->tau nu)/BR(B->tau nu)_SM" 
Write(io_L,1010) 600,BrKmunu,  "# BR(K->mu nu)" 
Write(io_L,1010) 601,ratioKmunu,  "# BR(K->mu nu)/BR(K->mu nu)_SM" 
Write(io_L,1010) 602,RK,  "# R_K = BR(K->e nu)/(K->mu nu)" 
Write(io_L,1010) 603,RKSM,  "# R_K^SM = BR(K->e nu)_SM/(K->mu nu)_SM" 
Write(io_L,1010) 1900,DeltaMBs,  "# Delta(M_Bs)" 
Write(io_L,1010) 1901,ratioDeltaMBs,  "# Delta(M_Bs)/Delta(M_Bs)_SM" 
Write(io_L,1010) 1902,DeltaMBq,  "# Delta(M_Bd)" 
Write(io_L,1010) 1903,ratioDeltaMBq,  "# Delta(M_Bd)/Delta(M_Bd)_SM" 
Write(io_L,1010) 4000,BrB0dEE,  "# BR(B^0_d->e e)" 
Write(io_L,1010) 4001,ratioB0dEE,  "# BR(B^0_d->e e)/BR(B^0_d->e e)_SM" 
Write(io_L,1010) 4002,BrB0sEE,  "# BR(B^0_s->e e)" 
Write(io_L,1010) 4003,ratioB0sEE,  "# BR(B^0_s->e e)/BR(B^0_s->e e)_SM" 
Write(io_L,1010) 4004,BrB0dMuMu,  "# BR(B^0_d->mu mu)" 
Write(io_L,1010) 4005,ratioB0dMuMu,  "# BR(B^0_d->mu mu)/BR(B^0_d->mu mu)_SM" 
Write(io_L,1010) 4006,BrB0sMuMu,  "# BR(B^0_s->mu mu)" 
Write(io_L,1010) 4007,ratioB0sMuMu,  "# BR(B^0_s->mu mu)/BR(B^0_s->mu mu)_SM" 
Write(io_L,1010) 4008,BrB0dTauTau,  "# BR(B^0_d->tau tau)" 
Write(io_L,1010) 4009,ratioB0dTauTau,  "# BR(B^0_d->tau tau)/BR(B^0_d->tau tau)_SM" 
Write(io_L,1010) 4010,BrB0sTauTau,  "# BR(B^0_s->tau tau)" 
Write(io_L,1010) 4011,ratioB0sTauTau,  "# BR(B^0_s->tau tau)/BR(B^0_s->tau tau)_SM" 
Write(io_L,1010) 5000,BrBtoSEE,  "# BR(B-> s e e)" 
Write(io_L,1010) 5001,ratioBtoSEE,  "# BR(B-> s e e)/BR(B-> s e e)_SM" 
Write(io_L,1010) 5002,BrBtoSMuMu,  "# BR(B-> s mu mu)" 
Write(io_L,1010) 5003,ratioBtoSMuMu,  "# BR(B-> s mu mu)/BR(B-> s mu mu)_SM" 
Write(io_L,1010) 6000,BrBtoKmumu,  "# BR(B -> K mu mu)" 
Write(io_L,1010) 6001,ratioBtoKmumu,  "# BR(B -> K mu mu)/BR(B -> K mu mu)_SM" 
Write(io_L,1010) 7000,BrBtoSnunu,  "# BR(B->s nu nu)" 
Write(io_L,1010) 7001,ratioBtoSnunu,  "# BR(B->s nu nu)/BR(B->s nu nu)_SM" 
Write(io_L,1010) 7002,BrBtoDnunu,  "# BR(B->D nu nu)" 
Write(io_L,1010) 7003,ratioBtoDnunu,  "# BR(B->D nu nu)/BR(B->D nu nu)_SM" 
Write(io_L,1010) 8000,BrKptoPipnunu,  "# BR(K^+ -> pi^+ nu nu)" 
Write(io_L,1010) 8001,ratioKptoPipnunu,  "# BR(K^+ -> pi^+ nu nu)/BR(K^+ -> pi^+ nu nu)_SM" 
Write(io_L,1010) 8002,BrKltoPinunu,  "# BR(K_L -> pi^0 nu nu)" 
Write(io_L,1010) 8003,ratioKltoPinunu,  "# BR(K_L -> pi^0 nu nu)/BR(K_L -> pi^0 nu nu)_SM" 
Write(io_L,1010) 9100,DelMK,  "# Delta(M_K)" 
Write(io_L,1010) 9102,ratioDelMK,  "# Delta(M_K)/Delta(M_K)_SM" 
Write(io_L,1010) 9103,epsK,  "# epsilon_K" 
Write(io_L,1010) 9104,ratioepsK,  "# epsilon_K/epsilon_K^SM" 
Write(io_L,100) "Block FlavorKitLFV # lepton flavor violating observables " 
Write(io_L,1010) 701,muEgamma,  "# BR(mu->e gamma)" 
Write(io_L,1010) 702,tauEgamma,  "# BR(tau->e gamma)" 
Write(io_L,1010) 703,tauMuGamma,  "# BR(tau->mu gamma)" 
Write(io_L,1010) 800,CRmuEAl,  "# CR(mu-e, Al)" 
Write(io_L,1010) 801,CRmuETi,  "# CR(mu-e, Ti)" 
Write(io_L,1010) 802,CRmuESr,  "# CR(mu-e, Sr)" 
Write(io_L,1010) 803,CRmuESb,  "# CR(mu-e, Sb)" 
Write(io_L,1010) 804,CRmuEAu,  "# CR(mu-e, Au)" 
Write(io_L,1010) 805,CRmuEPb,  "# CR(mu-e, Pb)" 
Write(io_L,1010) 901,BRmuTo3e,  "# BR(mu->3e)" 
Write(io_L,1010) 902,BRtauTo3e,  "# BR(tau->3e)" 
Write(io_L,1010) 903,BRtauTo3mu,  "# BR(tau->3mu)" 
Write(io_L,1010) 904,BRtauToemumu,  "# BR(tau- -> e- mu+ mu-)" 
Write(io_L,1010) 905,BRtauTomuee,  "# BR(tau- -> mu- e+ e-)" 
Write(io_L,1010) 906,BRtauToemumu2,  "# BR(tau- -> e+ mu- mu-)" 
Write(io_L,1010) 907,BRtauTomuee2,  "# BR(tau- -> mu+ e- e-)" 
Write(io_L,1010) 1001,BrZtoMuE,  "# BR(Z->e mu)" 
Write(io_L,1010) 1002,BrZtoTauE,  "# BR(Z->e tau)" 
Write(io_L,1010) 1003,BrZtoTauMu,  "# BR(Z->mu tau)" 
Write(io_L,1010) 1101,BrhtoMuE,  "# BR(h->e mu)" 
Write(io_L,1010) 1102,BrhtoTauE,  "# BR(h->e tau)" 
Write(io_L,1010) 1103,BrhtoTauMu,  "# BR(h->mu tau)" 
Write(io_L,1010) 2001,BrTautoEPi,  "# BR(tau->e pi)" 
Write(io_L,1010) 2002,BrTautoEEta,  "# BR(tau->e eta)" 
Write(io_L,1010) 2003,BrTautoEEtap,  "# BR(tau->e eta')" 
Write(io_L,1010) 2004,BrTautoMuPi,  "# BR(tau->mu pi)" 
Write(io_L,1010) 2005,BrTautoMuEta,  "# BR(tau->mu eta)" 
Write(io_L,1010) 2006,BrTautoMuEtap,  "# BR(tau->mu eta')" 

 
Write(io_L,100) "Block FWCOEF Q=  1.60000000E+02  # Wilson coefficients at scale Q " 
Write(io_L,222) "     0305" , "4422" , "00", "0", Real(coeffC7sm,dp),  " # coeffC7sm"  
Write(io_L,222) "     0305" , "4422" , "00", "2", Real(coeffC7,dp),  " # coeffC7"  
Write(io_L,222) "     0305" , "4322" , "00", "2", Real(coeffC7p,dp),  " # coeffC7p"  
Write(io_L,222) "     0305" , "6421" , "00", "0", Real(coeffC8sm,dp),  " # coeffC8sm"  
Write(io_L,222) "     0305" , "6421" , "00", "2", Real(coeffC8,dp),  " # coeffC8"  
Write(io_L,222) "     0305" , "6321" , "00", "2", Real(coeffC8p,dp),  " # coeffC8p"  
Write(io_L,222) " 03051111" , "4133" , "00", "0", Real(coeffC9eeSM,dp),  " # coeffC9eeSM"  
Write(io_L,222) " 03051111" , "4133" , "00", "2", Real(coeffC9ee,dp),  " # coeffC9ee"  
Write(io_L,222) " 03051111" , "4233" , "00", "2", Real(coeffC9Pee,dp),  " # coeffC9Pee"  
Write(io_L,222) " 03051111" , "4137" , "00", "0", Real(coeffC10eeSM,dp),  " # coeffC10eeSM"  
Write(io_L,222) " 03051111" , "4137" , "00", "2", Real(coeffC10ee,dp),  " # coeffC10ee"  
Write(io_L,222) " 03051111" , "4237" , "00", "2", Real(coeffC10Pee,dp),  " # coeffC10Pee"  
Write(io_L,222) " 03051313" , "4133" , "00", "0", Real(coeffC9mumuSM,dp),  " # coeffC9mumuSM"  
Write(io_L,222) " 03051313" , "4133" , "00", "2", Real(coeffC9mumu,dp),  " # coeffC9mumu"  
Write(io_L,222) " 03051313" , "4233" , "00", "2", Real(coeffC9Pmumu,dp),  " # coeffC9Pmumu"  
Write(io_L,222) " 03051313" , "4137" , "00", "0", Real(coeffC10mumuSM,dp),  " # coeffC10mumuSM"  
Write(io_L,222) " 03051313" , "4137" , "00", "2", Real(coeffC10mumu,dp),  " # coeffC10mumu"  
Write(io_L,222) " 03051313" , "4237" , "00", "2", Real(coeffC10Pmumu,dp),  " # coeffC10Pmumu"  
Write(io_L,222) " 03051212" , "4137" , "00", "0", Real(coeffC11nu1nu1SM,dp),  " # coeffC11nu1nu1SM"  
Write(io_L,222) " 03051212" , "4137" , "00", "2", Real(coeffC11nu1nu1,dp),  " # coeffC11nu1nu1"  
Write(io_L,222) " 03051212" , "4237" , "00", "2", Real(coeffC11Pnu1nu1,dp),  " # coeffC11Pnu1nu1"  
Write(io_L,222) " 03051414" , "4137" , "00", "0", Real(coeffC11nu2nu2SM,dp),  " # coeffC11nu2nu2SM"  
Write(io_L,222) " 03051414" , "4137" , "00", "2", Real(coeffC11nu2nu2,dp),  " # coeffC11nu2nu2"  
Write(io_L,222) " 03051414" , "4237" , "00", "2", Real(coeffC11Pnu2nu2,dp),  " # coeffC11Pnu2nu2"  
Write(io_L,222) " 03051616" , "4137" , "00", "0", Real(coeffC11nu3nu3SM,dp),  " # coeffC11nu3nu3SM"  
Write(io_L,222) " 03051616" , "4137" , "00", "2", Real(coeffC11nu3nu3,dp),  " # coeffC11nu3nu3"  
Write(io_L,222) " 03051616" , "4237" , "00", "2", Real(coeffC11Pnu3nu3,dp),  " # coeffC11Pnu3nu3"  
Write(io_L,100) "Block IMFWCOEF Q=  1.60000000E+02  # Im(Wilson coefficients) at scale Q " 
Write(io_L,222) "     0305" , "4422" , "00", "0", Aimag(coeffC7sm),  " # coeffC7sm"  
Write(io_L,222) "     0305" , "4422" , "00", "2", Aimag(coeffC7),  " # coeffC7"  
Write(io_L,222) "     0305" , "4322" , "00", "2", Aimag(coeffC7p),  " # coeffC7p"  
Write(io_L,222) "     0305" , "6421" , "00", "0", Aimag(coeffC8sm),  " # coeffC8sm"  
Write(io_L,222) "     0305" , "6421" , "00", "2", Aimag(coeffC8),  " # coeffC8"  
Write(io_L,222) "     0305" , "6321" , "00", "2", Aimag(coeffC8p),  " # coeffC8p"  
Write(io_L,222) " 03051111" , "4133" , "00", "0", Aimag(coeffC9eeSM),  " # coeffC9eeSM"  
Write(io_L,222) " 03051111" , "4133" , "00", "2", Aimag(coeffC9ee),  " # coeffC9ee"  
Write(io_L,222) " 03051111" , "4233" , "00", "2", Aimag(coeffC9Pee),  " # coeffC9Pee"  
Write(io_L,222) " 03051111" , "4137" , "00", "0", Aimag(coeffC10eeSM),  " # coeffC10eeSM"  
Write(io_L,222) " 03051111" , "4137" , "00", "2", Aimag(coeffC10ee),  " # coeffC10ee"  
Write(io_L,222) " 03051111" , "4237" , "00", "2", Aimag(coeffC10Pee),  " # coeffC10Pee"  
Write(io_L,222) " 03051313" , "4133" , "00", "0", Aimag(coeffC9mumuSM),  " # coeffC9mumuSM"  
Write(io_L,222) " 03051313" , "4133" , "00", "2", Aimag(coeffC9mumu),  " # coeffC9mumu"  
Write(io_L,222) " 03051313" , "4233" , "00", "2", Aimag(coeffC9Pmumu),  " # coeffC9Pmumu"  
Write(io_L,222) " 03051313" , "4137" , "00", "0", Aimag(coeffC10mumuSM),  " # coeffC10mumuSM"  
Write(io_L,222) " 03051313" , "4137" , "00", "2", Aimag(coeffC10mumu),  " # coeffC10mumu"  
Write(io_L,222) " 03051313" , "4237" , "00", "2", Aimag(coeffC10Pmumu),  " # coeffC10Pmumu"  
Write(io_L,222) " 03051212" , "4137" , "00", "0", Aimag(coeffC11nu1nu1SM),  " # coeffC11nu1nu1SM"  
Write(io_L,222) " 03051212" , "4137" , "00", "2", Aimag(coeffC11nu1nu1),  " # coeffC11nu1nu1"  
Write(io_L,222) " 03051212" , "4237" , "00", "2", Aimag(coeffC11Pnu1nu1),  " # coeffC11Pnu1nu1"  
Write(io_L,222) " 03051414" , "4137" , "00", "0", Aimag(coeffC11nu2nu2SM),  " # coeffC11nu2nu2SM"  
Write(io_L,222) " 03051414" , "4137" , "00", "2", Aimag(coeffC11nu2nu2),  " # coeffC11nu2nu2"  
Write(io_L,222) " 03051414" , "4237" , "00", "2", Aimag(coeffC11Pnu2nu2),  " # coeffC11Pnu2nu2"  
Write(io_L,222) " 03051616" , "4137" , "00", "0", Aimag(coeffC11nu3nu3SM),  " # coeffC11nu3nu3SM"  
Write(io_L,222) " 03051616" , "4137" , "00", "2", Aimag(coeffC11nu3nu3),  " # coeffC11nu3nu3"  
Write(io_L,222) " 03051616" , "4237" , "00", "2", Aimag(coeffC11Pnu3nu3),  " # coeffC11Pnu3nu3"  

 
 !-------------------------------
!Fu
!-------------------------------
 
If(gTFu(1).gt.MinWidth) Then 
Write(io_L,200) INT(PDGFu(1)),gTFu(1),Trim(NameParticleFu(1)) 
Write(io_L,100) "#    BR                NDA      ID1      ID2" 
icount = 1 
Do gt1= 1, 3
  Do gt2=3, 3
If (BRFu(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFu(gt1) 
CurrentPDG2(2) = PDGAh(gt2) 
Write(io_L,201) BRFu(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticleFu(1))//" -> "//Trim(NameParticleFu(gt1))//" "//Trim(NameParticleAh(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 1, 3
  Do gt2=3, 3
If (BRFu(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFd(gt1) 
CurrentPDG2(2) = -PDGHpm(gt2) 
Write(io_L,201) BRFu(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticleFu(1))//" -> "//Trim(NameParticleFd(gt1))//" "//Trim(NameParticleHpm(gt2))//"^* "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 1, 3
If (BRFu(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFd(gt1) 
CurrentPDG2(2) = -PDGVWLm 
Write(io_L,201) BRFu(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticleFu(1))//" -> "//Trim(NameParticleFd(gt1))//" "//Trim(NameParticleVWLm)//"^* "//")"
End if 
icount = icount +1 
  End Do 
Do gt1= 1, 3
If (BRFu(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFd(gt1) 
CurrentPDG2(2) = -PDGVWRm 
Write(io_L,201) BRFu(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticleFu(1))//" -> "//Trim(NameParticleFd(gt1))//" "//Trim(NameParticleVWRm)//"^* "//")"
End if 
icount = icount +1 
  End Do 
Do gt1= 1, 3
  Do gt2=1, 3
If (BRFu(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFu(gt1) 
CurrentPDG2(2) = PDGhh(gt2) 
Write(io_L,201) BRFu(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticleFu(1))//" -> "//Trim(NameParticleFu(gt1))//" "//Trim(NameParticlehh(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 1, 3
If (BRFu(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFu(gt1) 
CurrentPDG2(2) = PDGVZ 
Write(io_L,201) BRFu(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticleFu(1))//" -> "//Trim(NameParticleFu(gt1))//" "//Trim(NameParticleVZ)//" "//")"
End if 
icount = icount +1 
  End Do 
Do gt1= 1, 3
If (BRFu(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFu(gt1) 
CurrentPDG2(2) = PDGVZR 
Write(io_L,201) BRFu(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticleFu(1))//" -> "//Trim(NameParticleFu(gt1))//" "//Trim(NameParticleVZR)//" "//")"
End if 
icount = icount +1 
  End Do 
If (Maxval(BRFu(1,28:336)).Gt.BRmin) Then 
Write(io_L,100) "#    BR                NDA      ID1      ID2       ID3" 
End If 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=gt2,3
If (BRFu(1,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFu(gt1) 
CurrentPDG3(2) = PDGFc(gt2) 
CurrentPDG3(3) = PDGFc(gt3) 
Write(io_L,202) BRFu(1,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFu(1))//" -> "//Trim(NameParticleFu(gt1))//" "//Trim(NameParticleFc(gt2))//" "//Trim(NameParticleFc(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,3
  Do gt2=1,2
    Do gt3=1,2
If (BRFu(1,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFu(gt1) 
CurrentPDG3(2) = -PDGFcp(gt2) 
CurrentPDG3(3) = PDGFcp(gt3) 
Write(io_L,202) BRFu(1,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFu(1))//" -> "//Trim(NameParticleFu(gt1))//" "//Trim(NameParticleFcp(gt2))//"^* "//Trim(NameParticleFcp(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
If (BRFu(1,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFu(gt1) 
CurrentPDG3(2) = -PDGFd(gt2) 
CurrentPDG3(3) = PDGFd(gt3) 
Write(io_L,202) BRFu(1,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFu(1))//" -> "//Trim(NameParticleFu(gt1))//" "//Trim(NameParticleFd(gt2))//"^* "//Trim(NameParticleFd(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
If (BRFu(1,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFu(gt1) 
CurrentPDG3(2) = -PDGFe(gt2) 
CurrentPDG3(3) = PDGFe(gt3) 
Write(io_L,202) BRFu(1,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFu(1))//" -> "//Trim(NameParticleFu(gt1))//" "//Trim(NameParticleFe(gt2))//"^* "//Trim(NameParticleFe(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=gt1,3
If (BRFu(1,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFu(gt1) 
CurrentPDG3(2) = -PDGFu(gt2) 
CurrentPDG3(3) = PDGFu(gt3) 
Write(io_L,202) BRFu(1,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFu(1))//" -> "//Trim(NameParticleFu(gt1))//" "//Trim(NameParticleFu(gt2))//"^* "//Trim(NameParticleFu(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,3
  Do gt2=1,6
    Do gt3=gt2,6
If (BRFu(1,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFu(gt1) 
CurrentPDG3(2) = PDGFv(gt2) 
CurrentPDG3(3) = PDGFv(gt3) 
Write(io_L,202) BRFu(1,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFu(1))//" -> "//Trim(NameParticleFu(gt1))//" "//Trim(NameParticleFv(gt2))//" "//Trim(NameParticleFv(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,3
  Do gt2=1,2
    Do gt3=1,3
If (BRFu(1,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFd(gt1) 
CurrentPDG3(2) = PDGFcp(gt2) 
CurrentPDG3(3) = PDGFc(gt3) 
Write(io_L,202) BRFu(1,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFu(1))//" -> "//Trim(NameParticleFd(gt1))//" "//Trim(NameParticleFcp(gt2))//" "//Trim(NameParticleFc(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,3
  Do gt2=1,2
If (BRFu(1,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFd(gt1) 
CurrentPDG3(2) = -PDGFcp(gt2) 
CurrentPDG3(3) = PDGFcpp 
Write(io_L,202) BRFu(1,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFu(1))//" -> "//Trim(NameParticleFd(gt1))//" "//Trim(NameParticleFcp(gt2))//"^* "//Trim(NameParticleFcpp)//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1=1,3
  Do gt2=1,6
    Do gt3=1,3
If (BRFu(1,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFd(gt1) 
CurrentPDG3(2) = PDGFv(gt2) 
CurrentPDG3(3) = PDGFe(gt3) 
Write(io_L,202) BRFu(1,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFu(1))//" -> "//Trim(NameParticleFd(gt1))//" "//Trim(NameParticleFv(gt2))//" "//Trim(NameParticleFe(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,3
If (BRFu(1,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFu(gt1) 
CurrentPDG3(2) = -PDGFcpp 
CurrentPDG3(3) = PDGFcpp 
Write(io_L,202) BRFu(1,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFu(1))//" -> "//Trim(NameParticleFu(gt1))//" "//Trim(NameParticleFcpp)//"^* "//Trim(NameParticleFcpp)//" "//")"
End if 
icount = icount +1 
  End Do 
End if 
If(gTFu(2).gt.MinWidth) Then 
Write(io_L,200) INT(PDGFu(2)),gTFu(2),Trim(NameParticleFu(2)) 
Write(io_L,100) "#    BR                NDA      ID1      ID2" 
icount = 1 
Do gt1= 1, 3
  Do gt2=3, 3
If (BRFu(2,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFu(gt1) 
CurrentPDG2(2) = PDGAh(gt2) 
Write(io_L,201) BRFu(2,icount),2,CurrentPDG2, & 
 & Trim(NameParticleFu(2))//" -> "//Trim(NameParticleFu(gt1))//" "//Trim(NameParticleAh(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 1, 3
  Do gt2=3, 3
If (BRFu(2,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFd(gt1) 
CurrentPDG2(2) = -PDGHpm(gt2) 
Write(io_L,201) BRFu(2,icount),2,CurrentPDG2, & 
 & Trim(NameParticleFu(2))//" -> "//Trim(NameParticleFd(gt1))//" "//Trim(NameParticleHpm(gt2))//"^* "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 1, 3
If (BRFu(2,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFd(gt1) 
CurrentPDG2(2) = -PDGVWLm 
Write(io_L,201) BRFu(2,icount),2,CurrentPDG2, & 
 & Trim(NameParticleFu(2))//" -> "//Trim(NameParticleFd(gt1))//" "//Trim(NameParticleVWLm)//"^* "//")"
End if 
icount = icount +1 
  End Do 
Do gt1= 1, 3
If (BRFu(2,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFd(gt1) 
CurrentPDG2(2) = -PDGVWRm 
Write(io_L,201) BRFu(2,icount),2,CurrentPDG2, & 
 & Trim(NameParticleFu(2))//" -> "//Trim(NameParticleFd(gt1))//" "//Trim(NameParticleVWRm)//"^* "//")"
End if 
icount = icount +1 
  End Do 
Do gt1= 1, 3
  Do gt2=1, 3
If (BRFu(2,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFu(gt1) 
CurrentPDG2(2) = PDGhh(gt2) 
Write(io_L,201) BRFu(2,icount),2,CurrentPDG2, & 
 & Trim(NameParticleFu(2))//" -> "//Trim(NameParticleFu(gt1))//" "//Trim(NameParticlehh(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 1, 3
If (BRFu(2,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFu(gt1) 
CurrentPDG2(2) = PDGVZ 
Write(io_L,201) BRFu(2,icount),2,CurrentPDG2, & 
 & Trim(NameParticleFu(2))//" -> "//Trim(NameParticleFu(gt1))//" "//Trim(NameParticleVZ)//" "//")"
End if 
icount = icount +1 
  End Do 
Do gt1= 1, 3
If (BRFu(2,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFu(gt1) 
CurrentPDG2(2) = PDGVZR 
Write(io_L,201) BRFu(2,icount),2,CurrentPDG2, & 
 & Trim(NameParticleFu(2))//" -> "//Trim(NameParticleFu(gt1))//" "//Trim(NameParticleVZR)//" "//")"
End if 
icount = icount +1 
  End Do 
If (Maxval(BRFu(2,28:336)).Gt.BRmin) Then 
Write(io_L,100) "#    BR                NDA      ID1      ID2       ID3" 
End If 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=gt2,3
If (BRFu(2,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFu(gt1) 
CurrentPDG3(2) = PDGFc(gt2) 
CurrentPDG3(3) = PDGFc(gt3) 
Write(io_L,202) BRFu(2,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFu(2))//" -> "//Trim(NameParticleFu(gt1))//" "//Trim(NameParticleFc(gt2))//" "//Trim(NameParticleFc(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,3
  Do gt2=1,2
    Do gt3=1,2
If (BRFu(2,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFu(gt1) 
CurrentPDG3(2) = -PDGFcp(gt2) 
CurrentPDG3(3) = PDGFcp(gt3) 
Write(io_L,202) BRFu(2,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFu(2))//" -> "//Trim(NameParticleFu(gt1))//" "//Trim(NameParticleFcp(gt2))//"^* "//Trim(NameParticleFcp(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
If (BRFu(2,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFu(gt1) 
CurrentPDG3(2) = -PDGFd(gt2) 
CurrentPDG3(3) = PDGFd(gt3) 
Write(io_L,202) BRFu(2,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFu(2))//" -> "//Trim(NameParticleFu(gt1))//" "//Trim(NameParticleFd(gt2))//"^* "//Trim(NameParticleFd(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
If (BRFu(2,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFu(gt1) 
CurrentPDG3(2) = -PDGFe(gt2) 
CurrentPDG3(3) = PDGFe(gt3) 
Write(io_L,202) BRFu(2,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFu(2))//" -> "//Trim(NameParticleFu(gt1))//" "//Trim(NameParticleFe(gt2))//"^* "//Trim(NameParticleFe(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=gt1,3
If (BRFu(2,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFu(gt1) 
CurrentPDG3(2) = -PDGFu(gt2) 
CurrentPDG3(3) = PDGFu(gt3) 
Write(io_L,202) BRFu(2,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFu(2))//" -> "//Trim(NameParticleFu(gt1))//" "//Trim(NameParticleFu(gt2))//"^* "//Trim(NameParticleFu(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,3
  Do gt2=1,6
    Do gt3=gt2,6
If (BRFu(2,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFu(gt1) 
CurrentPDG3(2) = PDGFv(gt2) 
CurrentPDG3(3) = PDGFv(gt3) 
Write(io_L,202) BRFu(2,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFu(2))//" -> "//Trim(NameParticleFu(gt1))//" "//Trim(NameParticleFv(gt2))//" "//Trim(NameParticleFv(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,3
  Do gt2=1,2
    Do gt3=1,3
If (BRFu(2,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFd(gt1) 
CurrentPDG3(2) = PDGFcp(gt2) 
CurrentPDG3(3) = PDGFc(gt3) 
Write(io_L,202) BRFu(2,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFu(2))//" -> "//Trim(NameParticleFd(gt1))//" "//Trim(NameParticleFcp(gt2))//" "//Trim(NameParticleFc(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,3
  Do gt2=1,2
If (BRFu(2,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFd(gt1) 
CurrentPDG3(2) = -PDGFcp(gt2) 
CurrentPDG3(3) = PDGFcpp 
Write(io_L,202) BRFu(2,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFu(2))//" -> "//Trim(NameParticleFd(gt1))//" "//Trim(NameParticleFcp(gt2))//"^* "//Trim(NameParticleFcpp)//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1=1,3
  Do gt2=1,6
    Do gt3=1,3
If (BRFu(2,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFd(gt1) 
CurrentPDG3(2) = PDGFv(gt2) 
CurrentPDG3(3) = PDGFe(gt3) 
Write(io_L,202) BRFu(2,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFu(2))//" -> "//Trim(NameParticleFd(gt1))//" "//Trim(NameParticleFv(gt2))//" "//Trim(NameParticleFe(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,3
If (BRFu(2,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFu(gt1) 
CurrentPDG3(2) = -PDGFcpp 
CurrentPDG3(3) = PDGFcpp 
Write(io_L,202) BRFu(2,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFu(2))//" -> "//Trim(NameParticleFu(gt1))//" "//Trim(NameParticleFcpp)//"^* "//Trim(NameParticleFcpp)//" "//")"
End if 
icount = icount +1 
  End Do 
End if 
If(gTFu(3).gt.MinWidth) Then 
Write(io_L,200) INT(PDGFu(3)),gTFu(3),Trim(NameParticleFu(3)) 
Write(io_L,100) "#    BR                NDA      ID1      ID2" 
icount = 1 
Do gt1= 1, 3
  Do gt2=3, 3
If (BRFu(3,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFu(gt1) 
CurrentPDG2(2) = PDGAh(gt2) 
Write(io_L,201) BRFu(3,icount),2,CurrentPDG2, & 
 & Trim(NameParticleFu(3))//" -> "//Trim(NameParticleFu(gt1))//" "//Trim(NameParticleAh(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 1, 3
  Do gt2=3, 3
If (BRFu(3,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFd(gt1) 
CurrentPDG2(2) = -PDGHpm(gt2) 
Write(io_L,201) BRFu(3,icount),2,CurrentPDG2, & 
 & Trim(NameParticleFu(3))//" -> "//Trim(NameParticleFd(gt1))//" "//Trim(NameParticleHpm(gt2))//"^* "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 1, 3
If (BRFu(3,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFd(gt1) 
CurrentPDG2(2) = -PDGVWLm 
Write(io_L,201) BRFu(3,icount),2,CurrentPDG2, & 
 & Trim(NameParticleFu(3))//" -> "//Trim(NameParticleFd(gt1))//" "//Trim(NameParticleVWLm)//"^* "//")"
End if 
icount = icount +1 
  End Do 
Do gt1= 1, 3
If (BRFu(3,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFd(gt1) 
CurrentPDG2(2) = -PDGVWRm 
Write(io_L,201) BRFu(3,icount),2,CurrentPDG2, & 
 & Trim(NameParticleFu(3))//" -> "//Trim(NameParticleFd(gt1))//" "//Trim(NameParticleVWRm)//"^* "//")"
End if 
icount = icount +1 
  End Do 
Do gt1= 1, 3
  Do gt2=1, 3
If (BRFu(3,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFu(gt1) 
CurrentPDG2(2) = PDGhh(gt2) 
Write(io_L,201) BRFu(3,icount),2,CurrentPDG2, & 
 & Trim(NameParticleFu(3))//" -> "//Trim(NameParticleFu(gt1))//" "//Trim(NameParticlehh(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 1, 3
If (BRFu(3,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFu(gt1) 
CurrentPDG2(2) = PDGVZ 
Write(io_L,201) BRFu(3,icount),2,CurrentPDG2, & 
 & Trim(NameParticleFu(3))//" -> "//Trim(NameParticleFu(gt1))//" "//Trim(NameParticleVZ)//" "//")"
End if 
icount = icount +1 
  End Do 
Do gt1= 1, 3
If (BRFu(3,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFu(gt1) 
CurrentPDG2(2) = PDGVZR 
Write(io_L,201) BRFu(3,icount),2,CurrentPDG2, & 
 & Trim(NameParticleFu(3))//" -> "//Trim(NameParticleFu(gt1))//" "//Trim(NameParticleVZR)//" "//")"
End if 
icount = icount +1 
  End Do 
If (Maxval(BRFu(3,28:336)).Gt.BRmin) Then 
Write(io_L,100) "#    BR                NDA      ID1      ID2       ID3" 
End If 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=gt2,3
If (BRFu(3,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFu(gt1) 
CurrentPDG3(2) = PDGFc(gt2) 
CurrentPDG3(3) = PDGFc(gt3) 
Write(io_L,202) BRFu(3,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFu(3))//" -> "//Trim(NameParticleFu(gt1))//" "//Trim(NameParticleFc(gt2))//" "//Trim(NameParticleFc(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,3
  Do gt2=1,2
    Do gt3=1,2
If (BRFu(3,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFu(gt1) 
CurrentPDG3(2) = -PDGFcp(gt2) 
CurrentPDG3(3) = PDGFcp(gt3) 
Write(io_L,202) BRFu(3,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFu(3))//" -> "//Trim(NameParticleFu(gt1))//" "//Trim(NameParticleFcp(gt2))//"^* "//Trim(NameParticleFcp(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
If (BRFu(3,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFu(gt1) 
CurrentPDG3(2) = -PDGFd(gt2) 
CurrentPDG3(3) = PDGFd(gt3) 
Write(io_L,202) BRFu(3,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFu(3))//" -> "//Trim(NameParticleFu(gt1))//" "//Trim(NameParticleFd(gt2))//"^* "//Trim(NameParticleFd(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
If (BRFu(3,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFu(gt1) 
CurrentPDG3(2) = -PDGFe(gt2) 
CurrentPDG3(3) = PDGFe(gt3) 
Write(io_L,202) BRFu(3,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFu(3))//" -> "//Trim(NameParticleFu(gt1))//" "//Trim(NameParticleFe(gt2))//"^* "//Trim(NameParticleFe(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=gt1,3
If (BRFu(3,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFu(gt1) 
CurrentPDG3(2) = -PDGFu(gt2) 
CurrentPDG3(3) = PDGFu(gt3) 
Write(io_L,202) BRFu(3,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFu(3))//" -> "//Trim(NameParticleFu(gt1))//" "//Trim(NameParticleFu(gt2))//"^* "//Trim(NameParticleFu(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,3
  Do gt2=1,6
    Do gt3=gt2,6
If (BRFu(3,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFu(gt1) 
CurrentPDG3(2) = PDGFv(gt2) 
CurrentPDG3(3) = PDGFv(gt3) 
Write(io_L,202) BRFu(3,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFu(3))//" -> "//Trim(NameParticleFu(gt1))//" "//Trim(NameParticleFv(gt2))//" "//Trim(NameParticleFv(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,3
  Do gt2=1,2
    Do gt3=1,3
If (BRFu(3,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFd(gt1) 
CurrentPDG3(2) = PDGFcp(gt2) 
CurrentPDG3(3) = PDGFc(gt3) 
Write(io_L,202) BRFu(3,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFu(3))//" -> "//Trim(NameParticleFd(gt1))//" "//Trim(NameParticleFcp(gt2))//" "//Trim(NameParticleFc(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,3
  Do gt2=1,2
If (BRFu(3,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFd(gt1) 
CurrentPDG3(2) = -PDGFcp(gt2) 
CurrentPDG3(3) = PDGFcpp 
Write(io_L,202) BRFu(3,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFu(3))//" -> "//Trim(NameParticleFd(gt1))//" "//Trim(NameParticleFcp(gt2))//"^* "//Trim(NameParticleFcpp)//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1=1,3
  Do gt2=1,6
    Do gt3=1,3
If (BRFu(3,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFd(gt1) 
CurrentPDG3(2) = PDGFv(gt2) 
CurrentPDG3(3) = PDGFe(gt3) 
Write(io_L,202) BRFu(3,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFu(3))//" -> "//Trim(NameParticleFd(gt1))//" "//Trim(NameParticleFv(gt2))//" "//Trim(NameParticleFe(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,3
If (BRFu(3,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFu(gt1) 
CurrentPDG3(2) = -PDGFcpp 
CurrentPDG3(3) = PDGFcpp 
Write(io_L,202) BRFu(3,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFu(3))//" -> "//Trim(NameParticleFu(gt1))//" "//Trim(NameParticleFcpp)//"^* "//Trim(NameParticleFcpp)//" "//")"
End if 
icount = icount +1 
  End Do 
End if 

 
 !-------------------------------
!Fe
!-------------------------------
 
If(gTFe(1).gt.MinWidth) Then 
Write(io_L,200) INT(PDGFe(1)),gTFe(1),Trim(NameParticleFe(1)) 
Write(io_L,100) "#    BR                NDA      ID1      ID2" 
icount = 1 
Do gt1= 1, 3
  Do gt2=3, 3
If (BRFe(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFe(gt1) 
CurrentPDG2(2) = PDGAh(gt2) 
Write(io_L,201) BRFe(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticleFe(1))//" -> "//Trim(NameParticleFe(gt1))//" "//Trim(NameParticleAh(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 1, 3
If (BRFe(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = -PDGFe(gt1) 
CurrentPDG2(2) = PDGdeltaRpp 
Write(io_L,201) BRFe(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticleFe(1))//" -> "//Trim(NameParticleFe(gt1))//"^* "//Trim(NameParticledeltaRpp)//" "//")"
End if 
icount = icount +1 
  End Do 
Do gt1= 1, 3
  Do gt2=1, 3
If (BRFe(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFe(gt1) 
CurrentPDG2(2) = PDGhh(gt2) 
Write(io_L,201) BRFe(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticleFe(1))//" -> "//Trim(NameParticleFe(gt1))//" "//Trim(NameParticlehh(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 1, 3
If (BRFe(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFe(gt1) 
CurrentPDG2(2) = PDGVZ 
Write(io_L,201) BRFe(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticleFe(1))//" -> "//Trim(NameParticleFe(gt1))//" "//Trim(NameParticleVZ)//" "//")"
End if 
icount = icount +1 
  End Do 
Do gt1= 1, 3
If (BRFe(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFe(gt1) 
CurrentPDG2(2) = PDGVZR 
Write(io_L,201) BRFe(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticleFe(1))//" -> "//Trim(NameParticleFe(gt1))//" "//Trim(NameParticleVZR)//" "//")"
End if 
icount = icount +1 
  End Do 
Do gt1= 1, 6
  Do gt2=3, 3
If (BRFe(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFv(gt1) 
CurrentPDG2(2) = -PDGHpm(gt2) 
Write(io_L,201) BRFe(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticleFe(1))//" -> "//Trim(NameParticleFv(gt1))//" "//Trim(NameParticleHpm(gt2))//"^* "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 1, 6
If (BRFe(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFv(gt1) 
CurrentPDG2(2) = -PDGVWLm 
Write(io_L,201) BRFe(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticleFe(1))//" -> "//Trim(NameParticleFv(gt1))//" "//Trim(NameParticleVWLm)//"^* "//")"
End if 
icount = icount +1 
  End Do 
Do gt1= 1, 6
If (BRFe(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFv(gt1) 
CurrentPDG2(2) = -PDGVWRm 
Write(io_L,201) BRFe(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticleFe(1))//" -> "//Trim(NameParticleFv(gt1))//" "//Trim(NameParticleVWRm)//"^* "//")"
End if 
icount = icount +1 
  End Do 
If (Maxval(BRFe(1,40:393)).Gt.BRmin) Then 
Write(io_L,100) "#    BR                NDA      ID1      ID2       ID3" 
End If 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=gt2,3
If (BRFe(1,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFe(gt1) 
CurrentPDG3(2) = PDGFc(gt2) 
CurrentPDG3(3) = PDGFc(gt3) 
Write(io_L,202) BRFe(1,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFe(1))//" -> "//Trim(NameParticleFe(gt1))//" "//Trim(NameParticleFc(gt2))//" "//Trim(NameParticleFc(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,3
  Do gt2=1,2
    Do gt3=1,2
If (BRFe(1,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFe(gt1) 
CurrentPDG3(2) = -PDGFcp(gt2) 
CurrentPDG3(3) = PDGFcp(gt3) 
Write(io_L,202) BRFe(1,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFe(1))//" -> "//Trim(NameParticleFe(gt1))//" "//Trim(NameParticleFcp(gt2))//"^* "//Trim(NameParticleFcp(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
If (BRFe(1,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFe(gt1) 
CurrentPDG3(2) = -PDGFd(gt2) 
CurrentPDG3(3) = PDGFd(gt3) 
Write(io_L,202) BRFe(1,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFe(1))//" -> "//Trim(NameParticleFe(gt1))//" "//Trim(NameParticleFd(gt2))//"^* "//Trim(NameParticleFd(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=gt1,3
If (BRFe(1,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFe(gt1) 
CurrentPDG3(2) = -PDGFe(gt2) 
CurrentPDG3(3) = PDGFe(gt3) 
Write(io_L,202) BRFe(1,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFe(1))//" -> "//Trim(NameParticleFe(gt1))//" "//Trim(NameParticleFe(gt2))//"^* "//Trim(NameParticleFe(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
If (BRFe(1,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFe(gt1) 
CurrentPDG3(2) = -PDGFu(gt2) 
CurrentPDG3(3) = PDGFu(gt3) 
Write(io_L,202) BRFe(1,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFe(1))//" -> "//Trim(NameParticleFe(gt1))//" "//Trim(NameParticleFu(gt2))//"^* "//Trim(NameParticleFu(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,3
  Do gt2=1,6
    Do gt3=gt2,6
If (BRFe(1,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFe(gt1) 
CurrentPDG3(2) = PDGFv(gt2) 
CurrentPDG3(3) = PDGFv(gt3) 
Write(io_L,202) BRFe(1,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFe(1))//" -> "//Trim(NameParticleFe(gt1))//" "//Trim(NameParticleFv(gt2))//" "//Trim(NameParticleFv(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,3
    Do gt3=1,3
If (BRFe(1,icount).Gt.BrMin) Then 
CurrentPDG3(1) = -PDGFe(gt1) 
CurrentPDG3(2) = PDGFcpp 
CurrentPDG3(3) = PDGFc(gt3) 
Write(io_L,202) BRFe(1,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFe(1))//" -> "//Trim(NameParticleFe(gt1))//"^* "//Trim(NameParticleFcpp)//" "//Trim(NameParticleFc(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1=1,3
  Do gt2=1,2
    Do gt3=gt2,2
If (BRFe(1,icount).Gt.BrMin) Then 
CurrentPDG3(1) = -PDGFe(gt1) 
CurrentPDG3(2) = PDGFcp(gt2) 
CurrentPDG3(3) = PDGFcp(gt3) 
Write(io_L,202) BRFe(1,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFe(1))//" -> "//Trim(NameParticleFe(gt1))//"^* "//Trim(NameParticleFcp(gt2))//" "//Trim(NameParticleFcp(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,3
If (BRFe(1,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFe(gt1) 
CurrentPDG3(2) = -PDGFcpp 
CurrentPDG3(3) = PDGFcpp 
Write(io_L,202) BRFe(1,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFe(1))//" -> "//Trim(NameParticleFe(gt1))//" "//Trim(NameParticleFcpp)//"^* "//Trim(NameParticleFcpp)//" "//")"
End if 
icount = icount +1 
  End Do 
Do gt1=1,6
  Do gt2=1,2
    Do gt3=1,3
If (BRFe(1,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFv(gt1) 
CurrentPDG3(2) = PDGFcp(gt2) 
CurrentPDG3(3) = PDGFc(gt3) 
Write(io_L,202) BRFe(1,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFe(1))//" -> "//Trim(NameParticleFv(gt1))//" "//Trim(NameParticleFcp(gt2))//" "//Trim(NameParticleFc(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,6
  Do gt2=1,2
If (BRFe(1,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFv(gt1) 
CurrentPDG3(2) = -PDGFcp(gt2) 
CurrentPDG3(3) = PDGFcpp 
Write(io_L,202) BRFe(1,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFe(1))//" -> "//Trim(NameParticleFv(gt1))//" "//Trim(NameParticleFcp(gt2))//"^* "//Trim(NameParticleFcpp)//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1=1,6
  Do gt2=1,3
    Do gt3=1,3
If (BRFe(1,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFv(gt1) 
CurrentPDG3(2) = -PDGFd(gt2) 
CurrentPDG3(3) = PDGFu(gt3) 
Write(io_L,202) BRFe(1,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFe(1))//" -> "//Trim(NameParticleFv(gt1))//" "//Trim(NameParticleFd(gt2))//"^* "//Trim(NameParticleFu(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
End if 
If(gTFe(2).gt.MinWidth) Then 
Write(io_L,200) INT(PDGFe(2)),gTFe(2),Trim(NameParticleFe(2)) 
Write(io_L,100) "#    BR                NDA      ID1      ID2" 
icount = 1 
Do gt1= 1, 3
  Do gt2=3, 3
If (BRFe(2,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFe(gt1) 
CurrentPDG2(2) = PDGAh(gt2) 
Write(io_L,201) BRFe(2,icount),2,CurrentPDG2, & 
 & Trim(NameParticleFe(2))//" -> "//Trim(NameParticleFe(gt1))//" "//Trim(NameParticleAh(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 1, 3
If (BRFe(2,icount).Gt.BrMin) Then 
CurrentPDG2(1) = -PDGFe(gt1) 
CurrentPDG2(2) = PDGdeltaRpp 
Write(io_L,201) BRFe(2,icount),2,CurrentPDG2, & 
 & Trim(NameParticleFe(2))//" -> "//Trim(NameParticleFe(gt1))//"^* "//Trim(NameParticledeltaRpp)//" "//")"
End if 
icount = icount +1 
  End Do 
Do gt1= 1, 3
  Do gt2=1, 3
If (BRFe(2,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFe(gt1) 
CurrentPDG2(2) = PDGhh(gt2) 
Write(io_L,201) BRFe(2,icount),2,CurrentPDG2, & 
 & Trim(NameParticleFe(2))//" -> "//Trim(NameParticleFe(gt1))//" "//Trim(NameParticlehh(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 1, 3
If (BRFe(2,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFe(gt1) 
CurrentPDG2(2) = PDGVZ 
Write(io_L,201) BRFe(2,icount),2,CurrentPDG2, & 
 & Trim(NameParticleFe(2))//" -> "//Trim(NameParticleFe(gt1))//" "//Trim(NameParticleVZ)//" "//")"
End if 
icount = icount +1 
  End Do 
Do gt1= 1, 3
If (BRFe(2,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFe(gt1) 
CurrentPDG2(2) = PDGVZR 
Write(io_L,201) BRFe(2,icount),2,CurrentPDG2, & 
 & Trim(NameParticleFe(2))//" -> "//Trim(NameParticleFe(gt1))//" "//Trim(NameParticleVZR)//" "//")"
End if 
icount = icount +1 
  End Do 
Do gt1= 1, 6
  Do gt2=3, 3
If (BRFe(2,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFv(gt1) 
CurrentPDG2(2) = -PDGHpm(gt2) 
Write(io_L,201) BRFe(2,icount),2,CurrentPDG2, & 
 & Trim(NameParticleFe(2))//" -> "//Trim(NameParticleFv(gt1))//" "//Trim(NameParticleHpm(gt2))//"^* "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 1, 6
If (BRFe(2,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFv(gt1) 
CurrentPDG2(2) = -PDGVWLm 
Write(io_L,201) BRFe(2,icount),2,CurrentPDG2, & 
 & Trim(NameParticleFe(2))//" -> "//Trim(NameParticleFv(gt1))//" "//Trim(NameParticleVWLm)//"^* "//")"
End if 
icount = icount +1 
  End Do 
Do gt1= 1, 6
If (BRFe(2,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFv(gt1) 
CurrentPDG2(2) = -PDGVWRm 
Write(io_L,201) BRFe(2,icount),2,CurrentPDG2, & 
 & Trim(NameParticleFe(2))//" -> "//Trim(NameParticleFv(gt1))//" "//Trim(NameParticleVWRm)//"^* "//")"
End if 
icount = icount +1 
  End Do 
If (Maxval(BRFe(2,40:393)).Gt.BRmin) Then 
Write(io_L,100) "#    BR                NDA      ID1      ID2       ID3" 
End If 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=gt2,3
If (BRFe(2,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFe(gt1) 
CurrentPDG3(2) = PDGFc(gt2) 
CurrentPDG3(3) = PDGFc(gt3) 
Write(io_L,202) BRFe(2,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFe(2))//" -> "//Trim(NameParticleFe(gt1))//" "//Trim(NameParticleFc(gt2))//" "//Trim(NameParticleFc(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,3
  Do gt2=1,2
    Do gt3=1,2
If (BRFe(2,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFe(gt1) 
CurrentPDG3(2) = -PDGFcp(gt2) 
CurrentPDG3(3) = PDGFcp(gt3) 
Write(io_L,202) BRFe(2,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFe(2))//" -> "//Trim(NameParticleFe(gt1))//" "//Trim(NameParticleFcp(gt2))//"^* "//Trim(NameParticleFcp(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
If (BRFe(2,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFe(gt1) 
CurrentPDG3(2) = -PDGFd(gt2) 
CurrentPDG3(3) = PDGFd(gt3) 
Write(io_L,202) BRFe(2,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFe(2))//" -> "//Trim(NameParticleFe(gt1))//" "//Trim(NameParticleFd(gt2))//"^* "//Trim(NameParticleFd(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=gt1,3
If (BRFe(2,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFe(gt1) 
CurrentPDG3(2) = -PDGFe(gt2) 
CurrentPDG3(3) = PDGFe(gt3) 
Write(io_L,202) BRFe(2,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFe(2))//" -> "//Trim(NameParticleFe(gt1))//" "//Trim(NameParticleFe(gt2))//"^* "//Trim(NameParticleFe(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
If (BRFe(2,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFe(gt1) 
CurrentPDG3(2) = -PDGFu(gt2) 
CurrentPDG3(3) = PDGFu(gt3) 
Write(io_L,202) BRFe(2,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFe(2))//" -> "//Trim(NameParticleFe(gt1))//" "//Trim(NameParticleFu(gt2))//"^* "//Trim(NameParticleFu(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,3
  Do gt2=1,6
    Do gt3=gt2,6
If (BRFe(2,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFe(gt1) 
CurrentPDG3(2) = PDGFv(gt2) 
CurrentPDG3(3) = PDGFv(gt3) 
Write(io_L,202) BRFe(2,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFe(2))//" -> "//Trim(NameParticleFe(gt1))//" "//Trim(NameParticleFv(gt2))//" "//Trim(NameParticleFv(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,3
    Do gt3=1,3
If (BRFe(2,icount).Gt.BrMin) Then 
CurrentPDG3(1) = -PDGFe(gt1) 
CurrentPDG3(2) = PDGFcpp 
CurrentPDG3(3) = PDGFc(gt3) 
Write(io_L,202) BRFe(2,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFe(2))//" -> "//Trim(NameParticleFe(gt1))//"^* "//Trim(NameParticleFcpp)//" "//Trim(NameParticleFc(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1=1,3
  Do gt2=1,2
    Do gt3=gt2,2
If (BRFe(2,icount).Gt.BrMin) Then 
CurrentPDG3(1) = -PDGFe(gt1) 
CurrentPDG3(2) = PDGFcp(gt2) 
CurrentPDG3(3) = PDGFcp(gt3) 
Write(io_L,202) BRFe(2,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFe(2))//" -> "//Trim(NameParticleFe(gt1))//"^* "//Trim(NameParticleFcp(gt2))//" "//Trim(NameParticleFcp(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,3
If (BRFe(2,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFe(gt1) 
CurrentPDG3(2) = -PDGFcpp 
CurrentPDG3(3) = PDGFcpp 
Write(io_L,202) BRFe(2,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFe(2))//" -> "//Trim(NameParticleFe(gt1))//" "//Trim(NameParticleFcpp)//"^* "//Trim(NameParticleFcpp)//" "//")"
End if 
icount = icount +1 
  End Do 
Do gt1=1,6
  Do gt2=1,2
    Do gt3=1,3
If (BRFe(2,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFv(gt1) 
CurrentPDG3(2) = PDGFcp(gt2) 
CurrentPDG3(3) = PDGFc(gt3) 
Write(io_L,202) BRFe(2,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFe(2))//" -> "//Trim(NameParticleFv(gt1))//" "//Trim(NameParticleFcp(gt2))//" "//Trim(NameParticleFc(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,6
  Do gt2=1,2
If (BRFe(2,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFv(gt1) 
CurrentPDG3(2) = -PDGFcp(gt2) 
CurrentPDG3(3) = PDGFcpp 
Write(io_L,202) BRFe(2,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFe(2))//" -> "//Trim(NameParticleFv(gt1))//" "//Trim(NameParticleFcp(gt2))//"^* "//Trim(NameParticleFcpp)//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1=1,6
  Do gt2=1,3
    Do gt3=1,3
If (BRFe(2,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFv(gt1) 
CurrentPDG3(2) = -PDGFd(gt2) 
CurrentPDG3(3) = PDGFu(gt3) 
Write(io_L,202) BRFe(2,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFe(2))//" -> "//Trim(NameParticleFv(gt1))//" "//Trim(NameParticleFd(gt2))//"^* "//Trim(NameParticleFu(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
End if 
If(gTFe(3).gt.MinWidth) Then 
Write(io_L,200) INT(PDGFe(3)),gTFe(3),Trim(NameParticleFe(3)) 
Write(io_L,100) "#    BR                NDA      ID1      ID2" 
icount = 1 
Do gt1= 1, 3
  Do gt2=3, 3
If (BRFe(3,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFe(gt1) 
CurrentPDG2(2) = PDGAh(gt2) 
Write(io_L,201) BRFe(3,icount),2,CurrentPDG2, & 
 & Trim(NameParticleFe(3))//" -> "//Trim(NameParticleFe(gt1))//" "//Trim(NameParticleAh(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 1, 3
If (BRFe(3,icount).Gt.BrMin) Then 
CurrentPDG2(1) = -PDGFe(gt1) 
CurrentPDG2(2) = PDGdeltaRpp 
Write(io_L,201) BRFe(3,icount),2,CurrentPDG2, & 
 & Trim(NameParticleFe(3))//" -> "//Trim(NameParticleFe(gt1))//"^* "//Trim(NameParticledeltaRpp)//" "//")"
End if 
icount = icount +1 
  End Do 
Do gt1= 1, 3
  Do gt2=1, 3
If (BRFe(3,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFe(gt1) 
CurrentPDG2(2) = PDGhh(gt2) 
Write(io_L,201) BRFe(3,icount),2,CurrentPDG2, & 
 & Trim(NameParticleFe(3))//" -> "//Trim(NameParticleFe(gt1))//" "//Trim(NameParticlehh(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 1, 3
If (BRFe(3,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFe(gt1) 
CurrentPDG2(2) = PDGVZ 
Write(io_L,201) BRFe(3,icount),2,CurrentPDG2, & 
 & Trim(NameParticleFe(3))//" -> "//Trim(NameParticleFe(gt1))//" "//Trim(NameParticleVZ)//" "//")"
End if 
icount = icount +1 
  End Do 
Do gt1= 1, 3
If (BRFe(3,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFe(gt1) 
CurrentPDG2(2) = PDGVZR 
Write(io_L,201) BRFe(3,icount),2,CurrentPDG2, & 
 & Trim(NameParticleFe(3))//" -> "//Trim(NameParticleFe(gt1))//" "//Trim(NameParticleVZR)//" "//")"
End if 
icount = icount +1 
  End Do 
Do gt1= 1, 6
  Do gt2=3, 3
If (BRFe(3,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFv(gt1) 
CurrentPDG2(2) = -PDGHpm(gt2) 
Write(io_L,201) BRFe(3,icount),2,CurrentPDG2, & 
 & Trim(NameParticleFe(3))//" -> "//Trim(NameParticleFv(gt1))//" "//Trim(NameParticleHpm(gt2))//"^* "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 1, 6
If (BRFe(3,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFv(gt1) 
CurrentPDG2(2) = -PDGVWLm 
Write(io_L,201) BRFe(3,icount),2,CurrentPDG2, & 
 & Trim(NameParticleFe(3))//" -> "//Trim(NameParticleFv(gt1))//" "//Trim(NameParticleVWLm)//"^* "//")"
End if 
icount = icount +1 
  End Do 
Do gt1= 1, 6
If (BRFe(3,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFv(gt1) 
CurrentPDG2(2) = -PDGVWRm 
Write(io_L,201) BRFe(3,icount),2,CurrentPDG2, & 
 & Trim(NameParticleFe(3))//" -> "//Trim(NameParticleFv(gt1))//" "//Trim(NameParticleVWRm)//"^* "//")"
End if 
icount = icount +1 
  End Do 
If (Maxval(BRFe(3,40:393)).Gt.BRmin) Then 
Write(io_L,100) "#    BR                NDA      ID1      ID2       ID3" 
End If 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=gt2,3
If (BRFe(3,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFe(gt1) 
CurrentPDG3(2) = PDGFc(gt2) 
CurrentPDG3(3) = PDGFc(gt3) 
Write(io_L,202) BRFe(3,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFe(3))//" -> "//Trim(NameParticleFe(gt1))//" "//Trim(NameParticleFc(gt2))//" "//Trim(NameParticleFc(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,3
  Do gt2=1,2
    Do gt3=1,2
If (BRFe(3,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFe(gt1) 
CurrentPDG3(2) = -PDGFcp(gt2) 
CurrentPDG3(3) = PDGFcp(gt3) 
Write(io_L,202) BRFe(3,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFe(3))//" -> "//Trim(NameParticleFe(gt1))//" "//Trim(NameParticleFcp(gt2))//"^* "//Trim(NameParticleFcp(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
If (BRFe(3,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFe(gt1) 
CurrentPDG3(2) = -PDGFd(gt2) 
CurrentPDG3(3) = PDGFd(gt3) 
Write(io_L,202) BRFe(3,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFe(3))//" -> "//Trim(NameParticleFe(gt1))//" "//Trim(NameParticleFd(gt2))//"^* "//Trim(NameParticleFd(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=gt1,3
If (BRFe(3,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFe(gt1) 
CurrentPDG3(2) = -PDGFe(gt2) 
CurrentPDG3(3) = PDGFe(gt3) 
Write(io_L,202) BRFe(3,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFe(3))//" -> "//Trim(NameParticleFe(gt1))//" "//Trim(NameParticleFe(gt2))//"^* "//Trim(NameParticleFe(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
If (BRFe(3,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFe(gt1) 
CurrentPDG3(2) = -PDGFu(gt2) 
CurrentPDG3(3) = PDGFu(gt3) 
Write(io_L,202) BRFe(3,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFe(3))//" -> "//Trim(NameParticleFe(gt1))//" "//Trim(NameParticleFu(gt2))//"^* "//Trim(NameParticleFu(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,3
  Do gt2=1,6
    Do gt3=gt2,6
If (BRFe(3,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFe(gt1) 
CurrentPDG3(2) = PDGFv(gt2) 
CurrentPDG3(3) = PDGFv(gt3) 
Write(io_L,202) BRFe(3,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFe(3))//" -> "//Trim(NameParticleFe(gt1))//" "//Trim(NameParticleFv(gt2))//" "//Trim(NameParticleFv(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,3
    Do gt3=1,3
If (BRFe(3,icount).Gt.BrMin) Then 
CurrentPDG3(1) = -PDGFe(gt1) 
CurrentPDG3(2) = PDGFcpp 
CurrentPDG3(3) = PDGFc(gt3) 
Write(io_L,202) BRFe(3,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFe(3))//" -> "//Trim(NameParticleFe(gt1))//"^* "//Trim(NameParticleFcpp)//" "//Trim(NameParticleFc(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1=1,3
  Do gt2=1,2
    Do gt3=gt2,2
If (BRFe(3,icount).Gt.BrMin) Then 
CurrentPDG3(1) = -PDGFe(gt1) 
CurrentPDG3(2) = PDGFcp(gt2) 
CurrentPDG3(3) = PDGFcp(gt3) 
Write(io_L,202) BRFe(3,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFe(3))//" -> "//Trim(NameParticleFe(gt1))//"^* "//Trim(NameParticleFcp(gt2))//" "//Trim(NameParticleFcp(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,3
If (BRFe(3,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFe(gt1) 
CurrentPDG3(2) = -PDGFcpp 
CurrentPDG3(3) = PDGFcpp 
Write(io_L,202) BRFe(3,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFe(3))//" -> "//Trim(NameParticleFe(gt1))//" "//Trim(NameParticleFcpp)//"^* "//Trim(NameParticleFcpp)//" "//")"
End if 
icount = icount +1 
  End Do 
Do gt1=1,6
  Do gt2=1,2
    Do gt3=1,3
If (BRFe(3,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFv(gt1) 
CurrentPDG3(2) = PDGFcp(gt2) 
CurrentPDG3(3) = PDGFc(gt3) 
Write(io_L,202) BRFe(3,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFe(3))//" -> "//Trim(NameParticleFv(gt1))//" "//Trim(NameParticleFcp(gt2))//" "//Trim(NameParticleFc(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,6
  Do gt2=1,2
If (BRFe(3,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFv(gt1) 
CurrentPDG3(2) = -PDGFcp(gt2) 
CurrentPDG3(3) = PDGFcpp 
Write(io_L,202) BRFe(3,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFe(3))//" -> "//Trim(NameParticleFv(gt1))//" "//Trim(NameParticleFcp(gt2))//"^* "//Trim(NameParticleFcpp)//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1=1,6
  Do gt2=1,3
    Do gt3=1,3
If (BRFe(3,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFv(gt1) 
CurrentPDG3(2) = -PDGFd(gt2) 
CurrentPDG3(3) = PDGFu(gt3) 
Write(io_L,202) BRFe(3,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFe(3))//" -> "//Trim(NameParticleFv(gt1))//" "//Trim(NameParticleFd(gt2))//"^* "//Trim(NameParticleFu(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
End if 

 
 !-------------------------------
!Fd
!-------------------------------
 
If(gTFd(1).gt.MinWidth) Then 
Write(io_L,200) INT(PDGFd(1)),gTFd(1),Trim(NameParticleFd(1)) 
Write(io_L,100) "#    BR                NDA      ID1      ID2" 
icount = 1 
Do gt1= 1, 3
  Do gt2=3, 3
If (BRFd(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFd(gt1) 
CurrentPDG2(2) = PDGAh(gt2) 
Write(io_L,201) BRFd(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticleFd(1))//" -> "//Trim(NameParticleFd(gt1))//" "//Trim(NameParticleAh(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 1, 3
  Do gt2=1, 3
If (BRFd(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFd(gt1) 
CurrentPDG2(2) = PDGhh(gt2) 
Write(io_L,201) BRFd(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticleFd(1))//" -> "//Trim(NameParticleFd(gt1))//" "//Trim(NameParticlehh(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 1, 3
If (BRFd(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFd(gt1) 
CurrentPDG2(2) = PDGVZ 
Write(io_L,201) BRFd(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticleFd(1))//" -> "//Trim(NameParticleFd(gt1))//" "//Trim(NameParticleVZ)//" "//")"
End if 
icount = icount +1 
  End Do 
Do gt1= 1, 3
If (BRFd(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFd(gt1) 
CurrentPDG2(2) = PDGVZR 
Write(io_L,201) BRFd(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticleFd(1))//" -> "//Trim(NameParticleFd(gt1))//" "//Trim(NameParticleVZR)//" "//")"
End if 
icount = icount +1 
  End Do 
Do gt1= 1, 3
  Do gt2=3, 3
If (BRFd(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFu(gt1) 
CurrentPDG2(2) = PDGHpm(gt2) 
Write(io_L,201) BRFd(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticleFd(1))//" -> "//Trim(NameParticleFu(gt1))//" "//Trim(NameParticleHpm(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 1, 3
If (BRFd(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFu(gt1) 
CurrentPDG2(2) = PDGVWLm 
Write(io_L,201) BRFd(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticleFd(1))//" -> "//Trim(NameParticleFu(gt1))//" "//Trim(NameParticleVWLm)//" "//")"
End if 
icount = icount +1 
  End Do 
Do gt1= 1, 3
If (BRFd(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFu(gt1) 
CurrentPDG2(2) = PDGVWRm 
Write(io_L,201) BRFd(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticleFd(1))//" -> "//Trim(NameParticleFu(gt1))//" "//Trim(NameParticleVWRm)//" "//")"
End if 
icount = icount +1 
  End Do 
If (Maxval(BRFd(1,28:336)).Gt.BRmin) Then 
Write(io_L,100) "#    BR                NDA      ID1      ID2       ID3" 
End If 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=gt2,3
If (BRFd(1,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFd(gt1) 
CurrentPDG3(2) = PDGFc(gt2) 
CurrentPDG3(3) = PDGFc(gt3) 
Write(io_L,202) BRFd(1,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFd(1))//" -> "//Trim(NameParticleFd(gt1))//" "//Trim(NameParticleFc(gt2))//" "//Trim(NameParticleFc(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,3
  Do gt2=1,2
    Do gt3=1,2
If (BRFd(1,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFd(gt1) 
CurrentPDG3(2) = -PDGFcp(gt2) 
CurrentPDG3(3) = PDGFcp(gt3) 
Write(io_L,202) BRFd(1,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFd(1))//" -> "//Trim(NameParticleFd(gt1))//" "//Trim(NameParticleFcp(gt2))//"^* "//Trim(NameParticleFcp(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=gt1,3
If (BRFd(1,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFd(gt1) 
CurrentPDG3(2) = -PDGFd(gt2) 
CurrentPDG3(3) = PDGFd(gt3) 
Write(io_L,202) BRFd(1,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFd(1))//" -> "//Trim(NameParticleFd(gt1))//" "//Trim(NameParticleFd(gt2))//"^* "//Trim(NameParticleFd(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
If (BRFd(1,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFd(gt1) 
CurrentPDG3(2) = -PDGFe(gt2) 
CurrentPDG3(3) = PDGFe(gt3) 
Write(io_L,202) BRFd(1,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFd(1))//" -> "//Trim(NameParticleFd(gt1))//" "//Trim(NameParticleFe(gt2))//"^* "//Trim(NameParticleFe(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
If (BRFd(1,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFd(gt1) 
CurrentPDG3(2) = -PDGFu(gt2) 
CurrentPDG3(3) = PDGFu(gt3) 
Write(io_L,202) BRFd(1,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFd(1))//" -> "//Trim(NameParticleFd(gt1))//" "//Trim(NameParticleFu(gt2))//"^* "//Trim(NameParticleFu(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,3
  Do gt2=1,6
    Do gt3=gt2,6
If (BRFd(1,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFd(gt1) 
CurrentPDG3(2) = PDGFv(gt2) 
CurrentPDG3(3) = PDGFv(gt3) 
Write(io_L,202) BRFd(1,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFd(1))//" -> "//Trim(NameParticleFd(gt1))//" "//Trim(NameParticleFv(gt2))//" "//Trim(NameParticleFv(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,3
If (BRFd(1,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFd(gt1) 
CurrentPDG3(2) = -PDGFcpp 
CurrentPDG3(3) = PDGFcpp 
Write(io_L,202) BRFd(1,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFd(1))//" -> "//Trim(NameParticleFd(gt1))//" "//Trim(NameParticleFcpp)//"^* "//Trim(NameParticleFcpp)//" "//")"
End if 
icount = icount +1 
  End Do 
Do gt1=1,3
  Do gt2=1,2
    Do gt3=1,3
If (BRFd(1,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFu(gt1) 
CurrentPDG3(2) = -PDGFcp(gt2) 
CurrentPDG3(3) = PDGFc(gt3) 
Write(io_L,202) BRFd(1,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFd(1))//" -> "//Trim(NameParticleFu(gt1))//" "//Trim(NameParticleFcp(gt2))//"^* "//Trim(NameParticleFc(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,3
    Do gt3=1,2
If (BRFd(1,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFu(gt1) 
CurrentPDG3(2) = -PDGFcpp 
CurrentPDG3(3) = PDGFcp(gt3) 
Write(io_L,202) BRFd(1,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFd(1))//" -> "//Trim(NameParticleFu(gt1))//" "//Trim(NameParticleFcpp)//"^* "//Trim(NameParticleFcp(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,6
If (BRFd(1,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFu(gt1) 
CurrentPDG3(2) = -PDGFe(gt2) 
CurrentPDG3(3) = PDGFv(gt3) 
Write(io_L,202) BRFd(1,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFd(1))//" -> "//Trim(NameParticleFu(gt1))//" "//Trim(NameParticleFe(gt2))//"^* "//Trim(NameParticleFv(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
End if 
If(gTFd(2).gt.MinWidth) Then 
Write(io_L,200) INT(PDGFd(2)),gTFd(2),Trim(NameParticleFd(2)) 
Write(io_L,100) "#    BR                NDA      ID1      ID2" 
icount = 1 
Do gt1= 1, 3
  Do gt2=3, 3
If (BRFd(2,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFd(gt1) 
CurrentPDG2(2) = PDGAh(gt2) 
Write(io_L,201) BRFd(2,icount),2,CurrentPDG2, & 
 & Trim(NameParticleFd(2))//" -> "//Trim(NameParticleFd(gt1))//" "//Trim(NameParticleAh(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 1, 3
  Do gt2=1, 3
If (BRFd(2,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFd(gt1) 
CurrentPDG2(2) = PDGhh(gt2) 
Write(io_L,201) BRFd(2,icount),2,CurrentPDG2, & 
 & Trim(NameParticleFd(2))//" -> "//Trim(NameParticleFd(gt1))//" "//Trim(NameParticlehh(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 1, 3
If (BRFd(2,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFd(gt1) 
CurrentPDG2(2) = PDGVZ 
Write(io_L,201) BRFd(2,icount),2,CurrentPDG2, & 
 & Trim(NameParticleFd(2))//" -> "//Trim(NameParticleFd(gt1))//" "//Trim(NameParticleVZ)//" "//")"
End if 
icount = icount +1 
  End Do 
Do gt1= 1, 3
If (BRFd(2,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFd(gt1) 
CurrentPDG2(2) = PDGVZR 
Write(io_L,201) BRFd(2,icount),2,CurrentPDG2, & 
 & Trim(NameParticleFd(2))//" -> "//Trim(NameParticleFd(gt1))//" "//Trim(NameParticleVZR)//" "//")"
End if 
icount = icount +1 
  End Do 
Do gt1= 1, 3
  Do gt2=3, 3
If (BRFd(2,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFu(gt1) 
CurrentPDG2(2) = PDGHpm(gt2) 
Write(io_L,201) BRFd(2,icount),2,CurrentPDG2, & 
 & Trim(NameParticleFd(2))//" -> "//Trim(NameParticleFu(gt1))//" "//Trim(NameParticleHpm(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 1, 3
If (BRFd(2,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFu(gt1) 
CurrentPDG2(2) = PDGVWLm 
Write(io_L,201) BRFd(2,icount),2,CurrentPDG2, & 
 & Trim(NameParticleFd(2))//" -> "//Trim(NameParticleFu(gt1))//" "//Trim(NameParticleVWLm)//" "//")"
End if 
icount = icount +1 
  End Do 
Do gt1= 1, 3
If (BRFd(2,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFu(gt1) 
CurrentPDG2(2) = PDGVWRm 
Write(io_L,201) BRFd(2,icount),2,CurrentPDG2, & 
 & Trim(NameParticleFd(2))//" -> "//Trim(NameParticleFu(gt1))//" "//Trim(NameParticleVWRm)//" "//")"
End if 
icount = icount +1 
  End Do 
If (Maxval(BRFd(2,28:336)).Gt.BRmin) Then 
Write(io_L,100) "#    BR                NDA      ID1      ID2       ID3" 
End If 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=gt2,3
If (BRFd(2,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFd(gt1) 
CurrentPDG3(2) = PDGFc(gt2) 
CurrentPDG3(3) = PDGFc(gt3) 
Write(io_L,202) BRFd(2,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFd(2))//" -> "//Trim(NameParticleFd(gt1))//" "//Trim(NameParticleFc(gt2))//" "//Trim(NameParticleFc(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,3
  Do gt2=1,2
    Do gt3=1,2
If (BRFd(2,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFd(gt1) 
CurrentPDG3(2) = -PDGFcp(gt2) 
CurrentPDG3(3) = PDGFcp(gt3) 
Write(io_L,202) BRFd(2,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFd(2))//" -> "//Trim(NameParticleFd(gt1))//" "//Trim(NameParticleFcp(gt2))//"^* "//Trim(NameParticleFcp(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=gt1,3
If (BRFd(2,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFd(gt1) 
CurrentPDG3(2) = -PDGFd(gt2) 
CurrentPDG3(3) = PDGFd(gt3) 
Write(io_L,202) BRFd(2,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFd(2))//" -> "//Trim(NameParticleFd(gt1))//" "//Trim(NameParticleFd(gt2))//"^* "//Trim(NameParticleFd(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
If (BRFd(2,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFd(gt1) 
CurrentPDG3(2) = -PDGFe(gt2) 
CurrentPDG3(3) = PDGFe(gt3) 
Write(io_L,202) BRFd(2,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFd(2))//" -> "//Trim(NameParticleFd(gt1))//" "//Trim(NameParticleFe(gt2))//"^* "//Trim(NameParticleFe(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
If (BRFd(2,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFd(gt1) 
CurrentPDG3(2) = -PDGFu(gt2) 
CurrentPDG3(3) = PDGFu(gt3) 
Write(io_L,202) BRFd(2,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFd(2))//" -> "//Trim(NameParticleFd(gt1))//" "//Trim(NameParticleFu(gt2))//"^* "//Trim(NameParticleFu(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,3
  Do gt2=1,6
    Do gt3=gt2,6
If (BRFd(2,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFd(gt1) 
CurrentPDG3(2) = PDGFv(gt2) 
CurrentPDG3(3) = PDGFv(gt3) 
Write(io_L,202) BRFd(2,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFd(2))//" -> "//Trim(NameParticleFd(gt1))//" "//Trim(NameParticleFv(gt2))//" "//Trim(NameParticleFv(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,3
If (BRFd(2,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFd(gt1) 
CurrentPDG3(2) = -PDGFcpp 
CurrentPDG3(3) = PDGFcpp 
Write(io_L,202) BRFd(2,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFd(2))//" -> "//Trim(NameParticleFd(gt1))//" "//Trim(NameParticleFcpp)//"^* "//Trim(NameParticleFcpp)//" "//")"
End if 
icount = icount +1 
  End Do 
Do gt1=1,3
  Do gt2=1,2
    Do gt3=1,3
If (BRFd(2,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFu(gt1) 
CurrentPDG3(2) = -PDGFcp(gt2) 
CurrentPDG3(3) = PDGFc(gt3) 
Write(io_L,202) BRFd(2,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFd(2))//" -> "//Trim(NameParticleFu(gt1))//" "//Trim(NameParticleFcp(gt2))//"^* "//Trim(NameParticleFc(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,3
    Do gt3=1,2
If (BRFd(2,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFu(gt1) 
CurrentPDG3(2) = -PDGFcpp 
CurrentPDG3(3) = PDGFcp(gt3) 
Write(io_L,202) BRFd(2,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFd(2))//" -> "//Trim(NameParticleFu(gt1))//" "//Trim(NameParticleFcpp)//"^* "//Trim(NameParticleFcp(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,6
If (BRFd(2,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFu(gt1) 
CurrentPDG3(2) = -PDGFe(gt2) 
CurrentPDG3(3) = PDGFv(gt3) 
Write(io_L,202) BRFd(2,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFd(2))//" -> "//Trim(NameParticleFu(gt1))//" "//Trim(NameParticleFe(gt2))//"^* "//Trim(NameParticleFv(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
End if 
If(gTFd(3).gt.MinWidth) Then 
Write(io_L,200) INT(PDGFd(3)),gTFd(3),Trim(NameParticleFd(3)) 
Write(io_L,100) "#    BR                NDA      ID1      ID2" 
icount = 1 
Do gt1= 1, 3
  Do gt2=3, 3
If (BRFd(3,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFd(gt1) 
CurrentPDG2(2) = PDGAh(gt2) 
Write(io_L,201) BRFd(3,icount),2,CurrentPDG2, & 
 & Trim(NameParticleFd(3))//" -> "//Trim(NameParticleFd(gt1))//" "//Trim(NameParticleAh(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 1, 3
  Do gt2=1, 3
If (BRFd(3,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFd(gt1) 
CurrentPDG2(2) = PDGhh(gt2) 
Write(io_L,201) BRFd(3,icount),2,CurrentPDG2, & 
 & Trim(NameParticleFd(3))//" -> "//Trim(NameParticleFd(gt1))//" "//Trim(NameParticlehh(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 1, 3
If (BRFd(3,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFd(gt1) 
CurrentPDG2(2) = PDGVZ 
Write(io_L,201) BRFd(3,icount),2,CurrentPDG2, & 
 & Trim(NameParticleFd(3))//" -> "//Trim(NameParticleFd(gt1))//" "//Trim(NameParticleVZ)//" "//")"
End if 
icount = icount +1 
  End Do 
Do gt1= 1, 3
If (BRFd(3,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFd(gt1) 
CurrentPDG2(2) = PDGVZR 
Write(io_L,201) BRFd(3,icount),2,CurrentPDG2, & 
 & Trim(NameParticleFd(3))//" -> "//Trim(NameParticleFd(gt1))//" "//Trim(NameParticleVZR)//" "//")"
End if 
icount = icount +1 
  End Do 
Do gt1= 1, 3
  Do gt2=3, 3
If (BRFd(3,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFu(gt1) 
CurrentPDG2(2) = PDGHpm(gt2) 
Write(io_L,201) BRFd(3,icount),2,CurrentPDG2, & 
 & Trim(NameParticleFd(3))//" -> "//Trim(NameParticleFu(gt1))//" "//Trim(NameParticleHpm(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 1, 3
If (BRFd(3,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFu(gt1) 
CurrentPDG2(2) = PDGVWLm 
Write(io_L,201) BRFd(3,icount),2,CurrentPDG2, & 
 & Trim(NameParticleFd(3))//" -> "//Trim(NameParticleFu(gt1))//" "//Trim(NameParticleVWLm)//" "//")"
End if 
icount = icount +1 
  End Do 
Do gt1= 1, 3
If (BRFd(3,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFu(gt1) 
CurrentPDG2(2) = PDGVWRm 
Write(io_L,201) BRFd(3,icount),2,CurrentPDG2, & 
 & Trim(NameParticleFd(3))//" -> "//Trim(NameParticleFu(gt1))//" "//Trim(NameParticleVWRm)//" "//")"
End if 
icount = icount +1 
  End Do 
If (Maxval(BRFd(3,28:336)).Gt.BRmin) Then 
Write(io_L,100) "#    BR                NDA      ID1      ID2       ID3" 
End If 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=gt2,3
If (BRFd(3,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFd(gt1) 
CurrentPDG3(2) = PDGFc(gt2) 
CurrentPDG3(3) = PDGFc(gt3) 
Write(io_L,202) BRFd(3,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFd(3))//" -> "//Trim(NameParticleFd(gt1))//" "//Trim(NameParticleFc(gt2))//" "//Trim(NameParticleFc(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,3
  Do gt2=1,2
    Do gt3=1,2
If (BRFd(3,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFd(gt1) 
CurrentPDG3(2) = -PDGFcp(gt2) 
CurrentPDG3(3) = PDGFcp(gt3) 
Write(io_L,202) BRFd(3,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFd(3))//" -> "//Trim(NameParticleFd(gt1))//" "//Trim(NameParticleFcp(gt2))//"^* "//Trim(NameParticleFcp(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=gt1,3
If (BRFd(3,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFd(gt1) 
CurrentPDG3(2) = -PDGFd(gt2) 
CurrentPDG3(3) = PDGFd(gt3) 
Write(io_L,202) BRFd(3,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFd(3))//" -> "//Trim(NameParticleFd(gt1))//" "//Trim(NameParticleFd(gt2))//"^* "//Trim(NameParticleFd(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
If (BRFd(3,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFd(gt1) 
CurrentPDG3(2) = -PDGFe(gt2) 
CurrentPDG3(3) = PDGFe(gt3) 
Write(io_L,202) BRFd(3,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFd(3))//" -> "//Trim(NameParticleFd(gt1))//" "//Trim(NameParticleFe(gt2))//"^* "//Trim(NameParticleFe(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
If (BRFd(3,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFd(gt1) 
CurrentPDG3(2) = -PDGFu(gt2) 
CurrentPDG3(3) = PDGFu(gt3) 
Write(io_L,202) BRFd(3,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFd(3))//" -> "//Trim(NameParticleFd(gt1))//" "//Trim(NameParticleFu(gt2))//"^* "//Trim(NameParticleFu(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,3
  Do gt2=1,6
    Do gt3=gt2,6
If (BRFd(3,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFd(gt1) 
CurrentPDG3(2) = PDGFv(gt2) 
CurrentPDG3(3) = PDGFv(gt3) 
Write(io_L,202) BRFd(3,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFd(3))//" -> "//Trim(NameParticleFd(gt1))//" "//Trim(NameParticleFv(gt2))//" "//Trim(NameParticleFv(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,3
If (BRFd(3,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFd(gt1) 
CurrentPDG3(2) = -PDGFcpp 
CurrentPDG3(3) = PDGFcpp 
Write(io_L,202) BRFd(3,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFd(3))//" -> "//Trim(NameParticleFd(gt1))//" "//Trim(NameParticleFcpp)//"^* "//Trim(NameParticleFcpp)//" "//")"
End if 
icount = icount +1 
  End Do 
Do gt1=1,3
  Do gt2=1,2
    Do gt3=1,3
If (BRFd(3,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFu(gt1) 
CurrentPDG3(2) = -PDGFcp(gt2) 
CurrentPDG3(3) = PDGFc(gt3) 
Write(io_L,202) BRFd(3,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFd(3))//" -> "//Trim(NameParticleFu(gt1))//" "//Trim(NameParticleFcp(gt2))//"^* "//Trim(NameParticleFc(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,3
    Do gt3=1,2
If (BRFd(3,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFu(gt1) 
CurrentPDG3(2) = -PDGFcpp 
CurrentPDG3(3) = PDGFcp(gt3) 
Write(io_L,202) BRFd(3,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFd(3))//" -> "//Trim(NameParticleFu(gt1))//" "//Trim(NameParticleFcpp)//"^* "//Trim(NameParticleFcp(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,6
If (BRFd(3,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFu(gt1) 
CurrentPDG3(2) = -PDGFe(gt2) 
CurrentPDG3(3) = PDGFv(gt3) 
Write(io_L,202) BRFd(3,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFd(3))//" -> "//Trim(NameParticleFu(gt1))//" "//Trim(NameParticleFe(gt2))//"^* "//Trim(NameParticleFv(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
End if 

 
 !-------------------------------
!hh
!-------------------------------
 
If(gThh(1).gt.MinWidth) Then 
Write(io_L,200) INT(PDGhh(1)),gThh(1),Trim(NameParticlehh(1)) 
Write(io_L,100) "#    BR                NDA      ID1      ID2" 
icount = 1 
If (BRhh(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGVP 
CurrentPDG2(2) = PDGVP 
Write(io_L,201) BRhh(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticlehh(1))//" -> "//Trim(NameParticleVP)//" "//Trim(NameParticleVP)//" "//")"
End if 
icount = icount +1 
If (BRhh(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGVG 
CurrentPDG2(2) = PDGVG 
Write(io_L,201) BRhh(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticlehh(1))//" -> "//Trim(NameParticleVG)//" "//Trim(NameParticleVG)//" "//")"
End if 
icount = icount +1 
If (BRhh(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGVZ 
CurrentPDG2(2) = PDGVZ 
Write(io_L,201) BRhh(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticlehh(1))//" -> "//Trim(NameParticleVZ)//" "//Trim(NameParticleVZ)//" "//")"
End if 
icount = icount +1 
If (BRhh(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = -PDGVWLm 
CurrentPDG2(2) = PDGVWLm 
Write(io_L,201) BRhh(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticlehh(1))//" -> "//Trim(NameParticleVWLm)//"^* "//Trim(NameParticleVWLm)//"_virt "//")"
End if 
icount = icount +1 
Do gt1= 3, 3
  Do gt2= gt1, 3
If (BRhh(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGAh(gt1) 
CurrentPDG2(2) = PDGAh(gt2) 
Write(io_L,201) BRhh(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticlehh(1))//" -> "//Trim(NameParticleAh(gt1))//" "//Trim(NameParticleAh(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 3, 3
If (BRhh(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGAh(gt1) 
CurrentPDG2(2) = PDGVZ 
Write(io_L,201) BRhh(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticlehh(1))//" -> "//Trim(NameParticleAh(gt1))//" "//Trim(NameParticleVZ)//" "//")"
End if 
icount = icount +1 
  End Do 
Do gt1= 3, 3
If (BRhh(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGAh(gt1) 
CurrentPDG2(2) = PDGVZR 
Write(io_L,201) BRhh(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticlehh(1))//" -> "//Trim(NameParticleAh(gt1))//" "//Trim(NameParticleVZR)//" "//")"
End if 
icount = icount +1 
  End Do 
If (BRhh(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = -PDGdeltaRpp 
CurrentPDG2(2) = PDGdeltaRpp 
Write(io_L,201) BRhh(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticlehh(1))//" -> "//Trim(NameParticledeltaRpp)//"^* "//Trim(NameParticledeltaRpp)//" "//")"
End if 
icount = icount +1 
Do gt1= 1, 3
  Do gt2= gt1, 3
If (BRhh(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFc(gt1) 
CurrentPDG2(2) = PDGFc(gt2) 
Write(io_L,201) BRhh(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticlehh(1))//" -> "//Trim(NameParticleFc(gt1))//" "//Trim(NameParticleFc(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 1, 2
  Do gt2=1, 2
If (BRhh(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = -PDGFcp(gt1) 
CurrentPDG2(2) = PDGFcp(gt2) 
Write(io_L,201) BRhh(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticlehh(1))//" -> "//Trim(NameParticleFcp(gt1))//"^* "//Trim(NameParticleFcp(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 1, 3
  Do gt2=1, 3
If (BRhh(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = -PDGFd(gt1) 
CurrentPDG2(2) = PDGFd(gt2) 
Write(io_L,201) BRhh(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticlehh(1))//" -> "//Trim(NameParticleFd(gt1))//"^* "//Trim(NameParticleFd(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 1, 3
  Do gt2=1, 3
If (BRhh(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = -PDGFe(gt1) 
CurrentPDG2(2) = PDGFe(gt2) 
Write(io_L,201) BRhh(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticlehh(1))//" -> "//Trim(NameParticleFe(gt1))//"^* "//Trim(NameParticleFe(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 1, 3
  Do gt2=1, 3
If (BRhh(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = -PDGFu(gt1) 
CurrentPDG2(2) = PDGFu(gt2) 
Write(io_L,201) BRhh(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticlehh(1))//" -> "//Trim(NameParticleFu(gt1))//"^* "//Trim(NameParticleFu(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 1, 6
  Do gt2= gt1, 6
If (BRhh(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFv(gt1) 
CurrentPDG2(2) = PDGFv(gt2) 
Write(io_L,201) BRhh(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticlehh(1))//" -> "//Trim(NameParticleFv(gt1))//" "//Trim(NameParticleFv(gt2))//" "//")"
If (((gTFv(gt1).le.WidthToBeInvisible).and.(gTFv(gt2).le.WidthToBeInvisible)).OR. & 
 & ((WidthToBeInvisible.le.-1._dp).And.(CurrentPDG2(1).eq.PDGLSP(1)).And.(CurrentPDG2(2).eq.PDGLSP(1)))) Then 
  BRinvH(1) = BRinvH(1)+BRhh(1,icount) 
End if 
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 1, 3
  Do gt2= gt1, 3
If (BRhh(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGhh(gt1) 
CurrentPDG2(2) = PDGhh(gt2) 
Write(io_L,201) BRhh(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticlehh(1))//" -> "//Trim(NameParticlehh(gt1))//" "//Trim(NameParticlehh(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 3, 3
  Do gt2=3, 3
If (BRhh(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = -PDGHpm(gt1) 
CurrentPDG2(2) = PDGHpm(gt2) 
Write(io_L,201) BRhh(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticlehh(1))//" -> "//Trim(NameParticleHpm(gt1))//"^* "//Trim(NameParticleHpm(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 3, 3
If (BRhh(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGHpm(gt1) 
CurrentPDG2(2) = -PDGVWLm 
Write(io_L,201) BRhh(1,icount)/2._dp,2,CurrentPDG2, & 
 & Trim(NameParticlehh(1))//" -> "//Trim(NameParticleHpm(gt1))//" "//Trim(NameParticleVWLm)//"^* "//")"
Write(io_L,201) BRhh(1,icount)/2._dp,2,-CurrentPDG2, & 
 & Trim(NameParticlehh(1))//" -> "//Trim(NameParticleHpm(gt1))//"^* "//Trim(NameParticleVWLm)//" "//")"
End if 
icount = icount +1 
  End Do 
Do gt1= 3, 3
If (BRhh(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGHpm(gt1) 
CurrentPDG2(2) = -PDGVWRm 
Write(io_L,201) BRhh(1,icount)/2._dp,2,CurrentPDG2, & 
 & Trim(NameParticlehh(1))//" -> "//Trim(NameParticleHpm(gt1))//" "//Trim(NameParticleVWRm)//"^* "//")"
Write(io_L,201) BRhh(1,icount)/2._dp,2,-CurrentPDG2, & 
 & Trim(NameParticlehh(1))//" -> "//Trim(NameParticleHpm(gt1))//"^* "//Trim(NameParticleVWRm)//" "//")"
End if 
icount = icount +1 
  End Do 
If (BRhh(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGVWLm 
CurrentPDG2(2) = -PDGVWLm 
Write(io_L,201) BRhh(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticlehh(1))//" -> "//Trim(NameParticleVWLm)//" "//Trim(NameParticleVWLm)//"^* "//")"
End if 
icount = icount +1 
If (BRhh(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGVWLm 
CurrentPDG2(2) = -PDGVWRm 
Write(io_L,201) BRhh(1,icount)/2._dp,2,CurrentPDG2, & 
 & Trim(NameParticlehh(1))//" -> "//Trim(NameParticleVWLm)//" "//Trim(NameParticleVWRm)//"^* "//")"
Write(io_L,201) BRhh(1,icount)/2._dp,2,-CurrentPDG2, & 
 & Trim(NameParticlehh(1))//" -> "//Trim(NameParticleVWLm)//"^* "//Trim(NameParticleVWRm)//" "//")"
End if 
icount = icount +1 
If (BRhh(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGVWRm 
CurrentPDG2(2) = -PDGVWRm 
Write(io_L,201) BRhh(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticlehh(1))//" -> "//Trim(NameParticleVWRm)//" "//Trim(NameParticleVWRm)//"^* "//")"
End if 
icount = icount +1 
If (BRhh(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGVZ 
CurrentPDG2(2) = PDGVZ 
Write(io_L,201) BRhh(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticlehh(1))//" -> "//Trim(NameParticleVZ)//" "//Trim(NameParticleVZ)//" "//")"
End if 
icount = icount +1 
If (BRhh(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGVZ 
CurrentPDG2(2) = PDGVZR 
Write(io_L,201) BRhh(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticlehh(1))//" -> "//Trim(NameParticleVZ)//" "//Trim(NameParticleVZR)//" "//")"
End if 
icount = icount +1 
If (BRhh(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGVZR 
CurrentPDG2(2) = PDGVZR 
Write(io_L,201) BRhh(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticlehh(1))//" -> "//Trim(NameParticleVZR)//" "//Trim(NameParticleVZR)//" "//")"
End if 
icount = icount +1 
End if 
If(gThh(2).gt.MinWidth) Then 
Write(io_L,200) INT(PDGhh(2)),gThh(2),Trim(NameParticlehh(2)) 
Write(io_L,100) "#    BR                NDA      ID1      ID2" 
icount = 1 
If (BRhh(2,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGVP 
CurrentPDG2(2) = PDGVP 
Write(io_L,201) BRhh(2,icount),2,CurrentPDG2, & 
 & Trim(NameParticlehh(2))//" -> "//Trim(NameParticleVP)//" "//Trim(NameParticleVP)//" "//")"
End if 
icount = icount +1 
If (BRhh(2,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGVG 
CurrentPDG2(2) = PDGVG 
Write(io_L,201) BRhh(2,icount),2,CurrentPDG2, & 
 & Trim(NameParticlehh(2))//" -> "//Trim(NameParticleVG)//" "//Trim(NameParticleVG)//" "//")"
End if 
icount = icount +1 
If (BRhh(2,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGVZ 
CurrentPDG2(2) = PDGVZ 
Write(io_L,201) BRhh(2,icount),2,CurrentPDG2, & 
 & Trim(NameParticlehh(2))//" -> "//Trim(NameParticleVZ)//" "//Trim(NameParticleVZ)//" "//")"
End if 
icount = icount +1 
If (BRhh(2,icount).Gt.BrMin) Then 
CurrentPDG2(1) = -PDGVWLm 
CurrentPDG2(2) = PDGVWLm 
Write(io_L,201) BRhh(2,icount),2,CurrentPDG2, & 
 & Trim(NameParticlehh(2))//" -> "//Trim(NameParticleVWLm)//"^* "//Trim(NameParticleVWLm)//"_virt "//")"
End if 
icount = icount +1 
Do gt1= 3, 3
  Do gt2= gt1, 3
If (BRhh(2,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGAh(gt1) 
CurrentPDG2(2) = PDGAh(gt2) 
Write(io_L,201) BRhh(2,icount),2,CurrentPDG2, & 
 & Trim(NameParticlehh(2))//" -> "//Trim(NameParticleAh(gt1))//" "//Trim(NameParticleAh(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 3, 3
If (BRhh(2,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGAh(gt1) 
CurrentPDG2(2) = PDGVZ 
Write(io_L,201) BRhh(2,icount),2,CurrentPDG2, & 
 & Trim(NameParticlehh(2))//" -> "//Trim(NameParticleAh(gt1))//" "//Trim(NameParticleVZ)//" "//")"
End if 
icount = icount +1 
  End Do 
Do gt1= 3, 3
If (BRhh(2,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGAh(gt1) 
CurrentPDG2(2) = PDGVZR 
Write(io_L,201) BRhh(2,icount),2,CurrentPDG2, & 
 & Trim(NameParticlehh(2))//" -> "//Trim(NameParticleAh(gt1))//" "//Trim(NameParticleVZR)//" "//")"
End if 
icount = icount +1 
  End Do 
If (BRhh(2,icount).Gt.BrMin) Then 
CurrentPDG2(1) = -PDGdeltaRpp 
CurrentPDG2(2) = PDGdeltaRpp 
Write(io_L,201) BRhh(2,icount),2,CurrentPDG2, & 
 & Trim(NameParticlehh(2))//" -> "//Trim(NameParticledeltaRpp)//"^* "//Trim(NameParticledeltaRpp)//" "//")"
End if 
icount = icount +1 
Do gt1= 1, 3
  Do gt2= gt1, 3
If (BRhh(2,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFc(gt1) 
CurrentPDG2(2) = PDGFc(gt2) 
Write(io_L,201) BRhh(2,icount),2,CurrentPDG2, & 
 & Trim(NameParticlehh(2))//" -> "//Trim(NameParticleFc(gt1))//" "//Trim(NameParticleFc(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 1, 2
  Do gt2=1, 2
If (BRhh(2,icount).Gt.BrMin) Then 
CurrentPDG2(1) = -PDGFcp(gt1) 
CurrentPDG2(2) = PDGFcp(gt2) 
Write(io_L,201) BRhh(2,icount),2,CurrentPDG2, & 
 & Trim(NameParticlehh(2))//" -> "//Trim(NameParticleFcp(gt1))//"^* "//Trim(NameParticleFcp(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 1, 3
  Do gt2=1, 3
If (BRhh(2,icount).Gt.BrMin) Then 
CurrentPDG2(1) = -PDGFd(gt1) 
CurrentPDG2(2) = PDGFd(gt2) 
Write(io_L,201) BRhh(2,icount),2,CurrentPDG2, & 
 & Trim(NameParticlehh(2))//" -> "//Trim(NameParticleFd(gt1))//"^* "//Trim(NameParticleFd(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 1, 3
  Do gt2=1, 3
If (BRhh(2,icount).Gt.BrMin) Then 
CurrentPDG2(1) = -PDGFe(gt1) 
CurrentPDG2(2) = PDGFe(gt2) 
Write(io_L,201) BRhh(2,icount),2,CurrentPDG2, & 
 & Trim(NameParticlehh(2))//" -> "//Trim(NameParticleFe(gt1))//"^* "//Trim(NameParticleFe(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 1, 3
  Do gt2=1, 3
If (BRhh(2,icount).Gt.BrMin) Then 
CurrentPDG2(1) = -PDGFu(gt1) 
CurrentPDG2(2) = PDGFu(gt2) 
Write(io_L,201) BRhh(2,icount),2,CurrentPDG2, & 
 & Trim(NameParticlehh(2))//" -> "//Trim(NameParticleFu(gt1))//"^* "//Trim(NameParticleFu(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 1, 6
  Do gt2= gt1, 6
If (BRhh(2,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFv(gt1) 
CurrentPDG2(2) = PDGFv(gt2) 
Write(io_L,201) BRhh(2,icount),2,CurrentPDG2, & 
 & Trim(NameParticlehh(2))//" -> "//Trim(NameParticleFv(gt1))//" "//Trim(NameParticleFv(gt2))//" "//")"
If (((gTFv(gt1).le.WidthToBeInvisible).and.(gTFv(gt2).le.WidthToBeInvisible)).OR. & 
 & ((WidthToBeInvisible.le.-1._dp).And.(CurrentPDG2(1).eq.PDGLSP(1)).And.(CurrentPDG2(2).eq.PDGLSP(1)))) Then 
  BRinvH(2) = BRinvH(2)+BRhh(2,icount) 
End if 
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 1, 3
  Do gt2= gt1, 3
If (BRhh(2,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGhh(gt1) 
CurrentPDG2(2) = PDGhh(gt2) 
Write(io_L,201) BRhh(2,icount),2,CurrentPDG2, & 
 & Trim(NameParticlehh(2))//" -> "//Trim(NameParticlehh(gt1))//" "//Trim(NameParticlehh(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 3, 3
  Do gt2=3, 3
If (BRhh(2,icount).Gt.BrMin) Then 
CurrentPDG2(1) = -PDGHpm(gt1) 
CurrentPDG2(2) = PDGHpm(gt2) 
Write(io_L,201) BRhh(2,icount),2,CurrentPDG2, & 
 & Trim(NameParticlehh(2))//" -> "//Trim(NameParticleHpm(gt1))//"^* "//Trim(NameParticleHpm(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 3, 3
If (BRhh(2,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGHpm(gt1) 
CurrentPDG2(2) = -PDGVWLm 
Write(io_L,201) BRhh(2,icount)/2._dp,2,CurrentPDG2, & 
 & Trim(NameParticlehh(2))//" -> "//Trim(NameParticleHpm(gt1))//" "//Trim(NameParticleVWLm)//"^* "//")"
Write(io_L,201) BRhh(2,icount)/2._dp,2,-CurrentPDG2, & 
 & Trim(NameParticlehh(2))//" -> "//Trim(NameParticleHpm(gt1))//"^* "//Trim(NameParticleVWLm)//" "//")"
End if 
icount = icount +1 
  End Do 
Do gt1= 3, 3
If (BRhh(2,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGHpm(gt1) 
CurrentPDG2(2) = -PDGVWRm 
Write(io_L,201) BRhh(2,icount)/2._dp,2,CurrentPDG2, & 
 & Trim(NameParticlehh(2))//" -> "//Trim(NameParticleHpm(gt1))//" "//Trim(NameParticleVWRm)//"^* "//")"
Write(io_L,201) BRhh(2,icount)/2._dp,2,-CurrentPDG2, & 
 & Trim(NameParticlehh(2))//" -> "//Trim(NameParticleHpm(gt1))//"^* "//Trim(NameParticleVWRm)//" "//")"
End if 
icount = icount +1 
  End Do 
If (BRhh(2,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGVWLm 
CurrentPDG2(2) = -PDGVWLm 
Write(io_L,201) BRhh(2,icount),2,CurrentPDG2, & 
 & Trim(NameParticlehh(2))//" -> "//Trim(NameParticleVWLm)//" "//Trim(NameParticleVWLm)//"^* "//")"
End if 
icount = icount +1 
If (BRhh(2,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGVWLm 
CurrentPDG2(2) = -PDGVWRm 
Write(io_L,201) BRhh(2,icount)/2._dp,2,CurrentPDG2, & 
 & Trim(NameParticlehh(2))//" -> "//Trim(NameParticleVWLm)//" "//Trim(NameParticleVWRm)//"^* "//")"
Write(io_L,201) BRhh(2,icount)/2._dp,2,-CurrentPDG2, & 
 & Trim(NameParticlehh(2))//" -> "//Trim(NameParticleVWLm)//"^* "//Trim(NameParticleVWRm)//" "//")"
End if 
icount = icount +1 
If (BRhh(2,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGVWRm 
CurrentPDG2(2) = -PDGVWRm 
Write(io_L,201) BRhh(2,icount),2,CurrentPDG2, & 
 & Trim(NameParticlehh(2))//" -> "//Trim(NameParticleVWRm)//" "//Trim(NameParticleVWRm)//"^* "//")"
End if 
icount = icount +1 
If (BRhh(2,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGVZ 
CurrentPDG2(2) = PDGVZ 
Write(io_L,201) BRhh(2,icount),2,CurrentPDG2, & 
 & Trim(NameParticlehh(2))//" -> "//Trim(NameParticleVZ)//" "//Trim(NameParticleVZ)//" "//")"
End if 
icount = icount +1 
If (BRhh(2,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGVZ 
CurrentPDG2(2) = PDGVZR 
Write(io_L,201) BRhh(2,icount),2,CurrentPDG2, & 
 & Trim(NameParticlehh(2))//" -> "//Trim(NameParticleVZ)//" "//Trim(NameParticleVZR)//" "//")"
End if 
icount = icount +1 
If (BRhh(2,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGVZR 
CurrentPDG2(2) = PDGVZR 
Write(io_L,201) BRhh(2,icount),2,CurrentPDG2, & 
 & Trim(NameParticlehh(2))//" -> "//Trim(NameParticleVZR)//" "//Trim(NameParticleVZR)//" "//")"
End if 
icount = icount +1 
End if 
If(gThh(3).gt.MinWidth) Then 
Write(io_L,200) INT(PDGhh(3)),gThh(3),Trim(NameParticlehh(3)) 
Write(io_L,100) "#    BR                NDA      ID1      ID2" 
icount = 1 
If (BRhh(3,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGVP 
CurrentPDG2(2) = PDGVP 
Write(io_L,201) BRhh(3,icount),2,CurrentPDG2, & 
 & Trim(NameParticlehh(3))//" -> "//Trim(NameParticleVP)//" "//Trim(NameParticleVP)//" "//")"
End if 
icount = icount +1 
If (BRhh(3,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGVG 
CurrentPDG2(2) = PDGVG 
Write(io_L,201) BRhh(3,icount),2,CurrentPDG2, & 
 & Trim(NameParticlehh(3))//" -> "//Trim(NameParticleVG)//" "//Trim(NameParticleVG)//" "//")"
End if 
icount = icount +1 
If (BRhh(3,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGVZ 
CurrentPDG2(2) = PDGVZ 
Write(io_L,201) BRhh(3,icount),2,CurrentPDG2, & 
 & Trim(NameParticlehh(3))//" -> "//Trim(NameParticleVZ)//" "//Trim(NameParticleVZ)//" "//")"
End if 
icount = icount +1 
If (BRhh(3,icount).Gt.BrMin) Then 
CurrentPDG2(1) = -PDGVWLm 
CurrentPDG2(2) = PDGVWLm 
Write(io_L,201) BRhh(3,icount),2,CurrentPDG2, & 
 & Trim(NameParticlehh(3))//" -> "//Trim(NameParticleVWLm)//"^* "//Trim(NameParticleVWLm)//"_virt "//")"
End if 
icount = icount +1 
Do gt1= 3, 3
  Do gt2= gt1, 3
If (BRhh(3,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGAh(gt1) 
CurrentPDG2(2) = PDGAh(gt2) 
Write(io_L,201) BRhh(3,icount),2,CurrentPDG2, & 
 & Trim(NameParticlehh(3))//" -> "//Trim(NameParticleAh(gt1))//" "//Trim(NameParticleAh(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 3, 3
If (BRhh(3,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGAh(gt1) 
CurrentPDG2(2) = PDGVZ 
Write(io_L,201) BRhh(3,icount),2,CurrentPDG2, & 
 & Trim(NameParticlehh(3))//" -> "//Trim(NameParticleAh(gt1))//" "//Trim(NameParticleVZ)//" "//")"
End if 
icount = icount +1 
  End Do 
Do gt1= 3, 3
If (BRhh(3,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGAh(gt1) 
CurrentPDG2(2) = PDGVZR 
Write(io_L,201) BRhh(3,icount),2,CurrentPDG2, & 
 & Trim(NameParticlehh(3))//" -> "//Trim(NameParticleAh(gt1))//" "//Trim(NameParticleVZR)//" "//")"
End if 
icount = icount +1 
  End Do 
If (BRhh(3,icount).Gt.BrMin) Then 
CurrentPDG2(1) = -PDGdeltaRpp 
CurrentPDG2(2) = PDGdeltaRpp 
Write(io_L,201) BRhh(3,icount),2,CurrentPDG2, & 
 & Trim(NameParticlehh(3))//" -> "//Trim(NameParticledeltaRpp)//"^* "//Trim(NameParticledeltaRpp)//" "//")"
End if 
icount = icount +1 
Do gt1= 1, 3
  Do gt2= gt1, 3
If (BRhh(3,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFc(gt1) 
CurrentPDG2(2) = PDGFc(gt2) 
Write(io_L,201) BRhh(3,icount),2,CurrentPDG2, & 
 & Trim(NameParticlehh(3))//" -> "//Trim(NameParticleFc(gt1))//" "//Trim(NameParticleFc(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 1, 2
  Do gt2=1, 2
If (BRhh(3,icount).Gt.BrMin) Then 
CurrentPDG2(1) = -PDGFcp(gt1) 
CurrentPDG2(2) = PDGFcp(gt2) 
Write(io_L,201) BRhh(3,icount),2,CurrentPDG2, & 
 & Trim(NameParticlehh(3))//" -> "//Trim(NameParticleFcp(gt1))//"^* "//Trim(NameParticleFcp(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 1, 3
  Do gt2=1, 3
If (BRhh(3,icount).Gt.BrMin) Then 
CurrentPDG2(1) = -PDGFd(gt1) 
CurrentPDG2(2) = PDGFd(gt2) 
Write(io_L,201) BRhh(3,icount),2,CurrentPDG2, & 
 & Trim(NameParticlehh(3))//" -> "//Trim(NameParticleFd(gt1))//"^* "//Trim(NameParticleFd(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 1, 3
  Do gt2=1, 3
If (BRhh(3,icount).Gt.BrMin) Then 
CurrentPDG2(1) = -PDGFe(gt1) 
CurrentPDG2(2) = PDGFe(gt2) 
Write(io_L,201) BRhh(3,icount),2,CurrentPDG2, & 
 & Trim(NameParticlehh(3))//" -> "//Trim(NameParticleFe(gt1))//"^* "//Trim(NameParticleFe(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 1, 3
  Do gt2=1, 3
If (BRhh(3,icount).Gt.BrMin) Then 
CurrentPDG2(1) = -PDGFu(gt1) 
CurrentPDG2(2) = PDGFu(gt2) 
Write(io_L,201) BRhh(3,icount),2,CurrentPDG2, & 
 & Trim(NameParticlehh(3))//" -> "//Trim(NameParticleFu(gt1))//"^* "//Trim(NameParticleFu(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 1, 6
  Do gt2= gt1, 6
If (BRhh(3,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFv(gt1) 
CurrentPDG2(2) = PDGFv(gt2) 
Write(io_L,201) BRhh(3,icount),2,CurrentPDG2, & 
 & Trim(NameParticlehh(3))//" -> "//Trim(NameParticleFv(gt1))//" "//Trim(NameParticleFv(gt2))//" "//")"
If (((gTFv(gt1).le.WidthToBeInvisible).and.(gTFv(gt2).le.WidthToBeInvisible)).OR. & 
 & ((WidthToBeInvisible.le.-1._dp).And.(CurrentPDG2(1).eq.PDGLSP(1)).And.(CurrentPDG2(2).eq.PDGLSP(1)))) Then 
  BRinvH(3) = BRinvH(3)+BRhh(3,icount) 
End if 
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 1, 3
  Do gt2= gt1, 3
If (BRhh(3,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGhh(gt1) 
CurrentPDG2(2) = PDGhh(gt2) 
Write(io_L,201) BRhh(3,icount),2,CurrentPDG2, & 
 & Trim(NameParticlehh(3))//" -> "//Trim(NameParticlehh(gt1))//" "//Trim(NameParticlehh(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 3, 3
  Do gt2=3, 3
If (BRhh(3,icount).Gt.BrMin) Then 
CurrentPDG2(1) = -PDGHpm(gt1) 
CurrentPDG2(2) = PDGHpm(gt2) 
Write(io_L,201) BRhh(3,icount),2,CurrentPDG2, & 
 & Trim(NameParticlehh(3))//" -> "//Trim(NameParticleHpm(gt1))//"^* "//Trim(NameParticleHpm(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 3, 3
If (BRhh(3,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGHpm(gt1) 
CurrentPDG2(2) = -PDGVWLm 
Write(io_L,201) BRhh(3,icount)/2._dp,2,CurrentPDG2, & 
 & Trim(NameParticlehh(3))//" -> "//Trim(NameParticleHpm(gt1))//" "//Trim(NameParticleVWLm)//"^* "//")"
Write(io_L,201) BRhh(3,icount)/2._dp,2,-CurrentPDG2, & 
 & Trim(NameParticlehh(3))//" -> "//Trim(NameParticleHpm(gt1))//"^* "//Trim(NameParticleVWLm)//" "//")"
End if 
icount = icount +1 
  End Do 
Do gt1= 3, 3
If (BRhh(3,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGHpm(gt1) 
CurrentPDG2(2) = -PDGVWRm 
Write(io_L,201) BRhh(3,icount)/2._dp,2,CurrentPDG2, & 
 & Trim(NameParticlehh(3))//" -> "//Trim(NameParticleHpm(gt1))//" "//Trim(NameParticleVWRm)//"^* "//")"
Write(io_L,201) BRhh(3,icount)/2._dp,2,-CurrentPDG2, & 
 & Trim(NameParticlehh(3))//" -> "//Trim(NameParticleHpm(gt1))//"^* "//Trim(NameParticleVWRm)//" "//")"
End if 
icount = icount +1 
  End Do 
If (BRhh(3,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGVWLm 
CurrentPDG2(2) = -PDGVWLm 
Write(io_L,201) BRhh(3,icount),2,CurrentPDG2, & 
 & Trim(NameParticlehh(3))//" -> "//Trim(NameParticleVWLm)//" "//Trim(NameParticleVWLm)//"^* "//")"
End if 
icount = icount +1 
If (BRhh(3,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGVWLm 
CurrentPDG2(2) = -PDGVWRm 
Write(io_L,201) BRhh(3,icount)/2._dp,2,CurrentPDG2, & 
 & Trim(NameParticlehh(3))//" -> "//Trim(NameParticleVWLm)//" "//Trim(NameParticleVWRm)//"^* "//")"
Write(io_L,201) BRhh(3,icount)/2._dp,2,-CurrentPDG2, & 
 & Trim(NameParticlehh(3))//" -> "//Trim(NameParticleVWLm)//"^* "//Trim(NameParticleVWRm)//" "//")"
End if 
icount = icount +1 
If (BRhh(3,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGVWRm 
CurrentPDG2(2) = -PDGVWRm 
Write(io_L,201) BRhh(3,icount),2,CurrentPDG2, & 
 & Trim(NameParticlehh(3))//" -> "//Trim(NameParticleVWRm)//" "//Trim(NameParticleVWRm)//"^* "//")"
End if 
icount = icount +1 
If (BRhh(3,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGVZ 
CurrentPDG2(2) = PDGVZ 
Write(io_L,201) BRhh(3,icount),2,CurrentPDG2, & 
 & Trim(NameParticlehh(3))//" -> "//Trim(NameParticleVZ)//" "//Trim(NameParticleVZ)//" "//")"
End if 
icount = icount +1 
If (BRhh(3,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGVZ 
CurrentPDG2(2) = PDGVZR 
Write(io_L,201) BRhh(3,icount),2,CurrentPDG2, & 
 & Trim(NameParticlehh(3))//" -> "//Trim(NameParticleVZ)//" "//Trim(NameParticleVZR)//" "//")"
End if 
icount = icount +1 
If (BRhh(3,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGVZR 
CurrentPDG2(2) = PDGVZR 
Write(io_L,201) BRhh(3,icount),2,CurrentPDG2, & 
 & Trim(NameParticlehh(3))//" -> "//Trim(NameParticleVZR)//" "//Trim(NameParticleVZR)//" "//")"
End if 
icount = icount +1 
End if 

 
 !-------------------------------
!Fv
!-------------------------------
 
If(gTFv(1).gt.MinWidth) Then 
Write(io_L,200) INT(PDGFv(1)),gTFv(1),Trim(NameParticleFv(1)) 
Write(io_L,100) "#    BR                NDA      ID1      ID2" 
icount = 1 
Do gt1= 1, 6
  Do gt2=3, 3
If (BRFv(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFv(gt1) 
CurrentPDG2(2) = PDGAh(gt2) 
Write(io_L,201) BRFv(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticleFv(1))//" -> "//Trim(NameParticleFv(gt1))//" "//Trim(NameParticleAh(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 1, 3
  Do gt2=3, 3
If (BRFv(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFe(gt1) 
CurrentPDG2(2) = PDGHpm(gt2) 
Write(io_L,201) BRFv(1,icount)/2._dp,2,CurrentPDG2, & 
 & Trim(NameParticleFv(1))//" -> "//Trim(NameParticleFe(gt1))//" "//Trim(NameParticleHpm(gt2))//" "//")"
Write(io_L,201) BRFv(1,icount)/2._dp,2,-CurrentPDG2, & 
 & Trim(NameParticleFv(1))//" -> "//Trim(NameParticleFe(gt1))//"^* "//Trim(NameParticleHpm(gt2))//"^* "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 1, 3
If (BRFv(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFe(gt1) 
CurrentPDG2(2) = PDGVWLm 
Write(io_L,201) BRFv(1,icount)/2._dp,2,CurrentPDG2, & 
 & Trim(NameParticleFv(1))//" -> "//Trim(NameParticleFe(gt1))//" "//Trim(NameParticleVWLm)//" "//")"
Write(io_L,201) BRFv(1,icount)/2._dp,2,-CurrentPDG2, & 
 & Trim(NameParticleFv(1))//" -> "//Trim(NameParticleFe(gt1))//"^* "//Trim(NameParticleVWLm)//"^* "//")"
End if 
icount = icount +1 
  End Do 
Do gt1= 1, 3
If (BRFv(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFe(gt1) 
CurrentPDG2(2) = PDGVWRm 
Write(io_L,201) BRFv(1,icount)/2._dp,2,CurrentPDG2, & 
 & Trim(NameParticleFv(1))//" -> "//Trim(NameParticleFe(gt1))//" "//Trim(NameParticleVWRm)//" "//")"
Write(io_L,201) BRFv(1,icount)/2._dp,2,-CurrentPDG2, & 
 & Trim(NameParticleFv(1))//" -> "//Trim(NameParticleFe(gt1))//"^* "//Trim(NameParticleVWRm)//"^* "//")"
End if 
icount = icount +1 
  End Do 
Do gt1= 1, 6
  Do gt2=1, 3
If (BRFv(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFv(gt1) 
CurrentPDG2(2) = PDGhh(gt2) 
Write(io_L,201) BRFv(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticleFv(1))//" -> "//Trim(NameParticleFv(gt1))//" "//Trim(NameParticlehh(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 1, 6
If (BRFv(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFv(gt1) 
CurrentPDG2(2) = PDGVZ 
Write(io_L,201) BRFv(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticleFv(1))//" -> "//Trim(NameParticleFv(gt1))//" "//Trim(NameParticleVZ)//" "//")"
End if 
icount = icount +1 
  End Do 
Do gt1= 1, 6
If (BRFv(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFv(gt1) 
CurrentPDG2(2) = PDGVZR 
Write(io_L,201) BRFv(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticleFv(1))//" -> "//Trim(NameParticleFv(gt1))//" "//Trim(NameParticleVZR)//" "//")"
End if 
icount = icount +1 
  End Do 
If (Maxval(BRFv(1,46:558)).Gt.BRmin) Then 
Write(io_L,100) "#    BR                NDA      ID1      ID2       ID3" 
End If 
Do gt1=1,6
  Do gt2=1,3
    Do gt3=gt2,3
If (BRFv(1,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFv(gt1) 
CurrentPDG3(2) = PDGFc(gt2) 
CurrentPDG3(3) = PDGFc(gt3) 
Write(io_L,202) BRFv(1,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFv(1))//" -> "//Trim(NameParticleFv(gt1))//" "//Trim(NameParticleFc(gt2))//" "//Trim(NameParticleFc(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,6
  Do gt2=1,2
    Do gt3=1,2
If (BRFv(1,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFv(gt1) 
CurrentPDG3(2) = -PDGFcp(gt2) 
CurrentPDG3(3) = PDGFcp(gt3) 
Write(io_L,202) BRFv(1,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFv(1))//" -> "//Trim(NameParticleFv(gt1))//" "//Trim(NameParticleFcp(gt2))//"^* "//Trim(NameParticleFcp(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,6
  Do gt2=1,3
    Do gt3=1,3
If (BRFv(1,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFv(gt1) 
CurrentPDG3(2) = -PDGFd(gt2) 
CurrentPDG3(3) = PDGFd(gt3) 
Write(io_L,202) BRFv(1,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFv(1))//" -> "//Trim(NameParticleFv(gt1))//" "//Trim(NameParticleFd(gt2))//"^* "//Trim(NameParticleFd(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,6
  Do gt2=1,3
    Do gt3=1,3
If (BRFv(1,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFv(gt1) 
CurrentPDG3(2) = -PDGFe(gt2) 
CurrentPDG3(3) = PDGFe(gt3) 
Write(io_L,202) BRFv(1,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFv(1))//" -> "//Trim(NameParticleFv(gt1))//" "//Trim(NameParticleFe(gt2))//"^* "//Trim(NameParticleFe(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,6
  Do gt2=1,3
    Do gt3=1,3
If (BRFv(1,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFv(gt1) 
CurrentPDG3(2) = -PDGFu(gt2) 
CurrentPDG3(3) = PDGFu(gt3) 
Write(io_L,202) BRFv(1,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFv(1))//" -> "//Trim(NameParticleFv(gt1))//" "//Trim(NameParticleFu(gt2))//"^* "//Trim(NameParticleFu(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,6
  Do gt2=gt1,6
    Do gt3=gt2,6
If (BRFv(1,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFv(gt1) 
CurrentPDG3(2) = PDGFv(gt2) 
CurrentPDG3(3) = PDGFv(gt3) 
Write(io_L,202) BRFv(1,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFv(1))//" -> "//Trim(NameParticleFv(gt1))//" "//Trim(NameParticleFv(gt2))//" "//Trim(NameParticleFv(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,3
  Do gt2=1,2
    Do gt3=1,3
If (BRFv(1,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFe(gt1) 
CurrentPDG3(2) = -PDGFcp(gt2) 
CurrentPDG3(3) = PDGFc(gt3) 
Write(io_L,202) BRFv(1,icount)/2._dp,3,CurrentPDG3, & 
 & Trim(NameParticleFv(1))//" -> "//Trim(NameParticleFe(gt1))//" "//Trim(NameParticleFcp(gt2))//"^* "//Trim(NameParticleFc(gt3))//" "//")"
Write(io_L,202) BRFv(1,icount)/2._dp,3,-CurrentPDG3, & 
 & Trim(NameParticleFv(1))//" -> "//Trim(NameParticleFe(gt1))//"^* "//Trim(NameParticleFcp(gt2))//" "//Trim(NameParticleFc(gt3))//"^* "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,3
    Do gt3=1,2
If (BRFv(1,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFe(gt1) 
CurrentPDG3(2) = -PDGFcpp 
CurrentPDG3(3) = PDGFcp(gt3) 
Write(io_L,202) BRFv(1,icount)/2._dp,3,CurrentPDG3, & 
 & Trim(NameParticleFv(1))//" -> "//Trim(NameParticleFe(gt1))//" "//Trim(NameParticleFcpp)//"^* "//Trim(NameParticleFcp(gt3))//" "//")"
Write(io_L,202) BRFv(1,icount)/2._dp,3,-CurrentPDG3, & 
 & Trim(NameParticleFv(1))//" -> "//Trim(NameParticleFe(gt1))//"^* "//Trim(NameParticleFcpp)//" "//Trim(NameParticleFcp(gt3))//"^* "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
If (BRFv(1,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFe(gt1) 
CurrentPDG3(2) = -PDGFu(gt2) 
CurrentPDG3(3) = PDGFd(gt3) 
Write(io_L,202) BRFv(1,icount)/2._dp,3,CurrentPDG3, & 
 & Trim(NameParticleFv(1))//" -> "//Trim(NameParticleFe(gt1))//" "//Trim(NameParticleFu(gt2))//"^* "//Trim(NameParticleFd(gt3))//" "//")"
Write(io_L,202) BRFv(1,icount)/2._dp,3,-CurrentPDG3, & 
 & Trim(NameParticleFv(1))//" -> "//Trim(NameParticleFe(gt1))//"^* "//Trim(NameParticleFu(gt2))//" "//Trim(NameParticleFd(gt3))//"^* "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,6
If (BRFv(1,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFv(gt1) 
CurrentPDG3(2) = -PDGFcpp 
CurrentPDG3(3) = PDGFcpp 
Write(io_L,202) BRFv(1,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFv(1))//" -> "//Trim(NameParticleFv(gt1))//" "//Trim(NameParticleFcpp)//"^* "//Trim(NameParticleFcpp)//" "//")"
End if 
icount = icount +1 
  End Do 
End if 
If(gTFv(2).gt.MinWidth) Then 
Write(io_L,200) INT(PDGFv(2)),gTFv(2),Trim(NameParticleFv(2)) 
Write(io_L,100) "#    BR                NDA      ID1      ID2" 
icount = 1 
Do gt1= 1, 6
  Do gt2=3, 3
If (BRFv(2,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFv(gt1) 
CurrentPDG2(2) = PDGAh(gt2) 
Write(io_L,201) BRFv(2,icount),2,CurrentPDG2, & 
 & Trim(NameParticleFv(2))//" -> "//Trim(NameParticleFv(gt1))//" "//Trim(NameParticleAh(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 1, 3
  Do gt2=3, 3
If (BRFv(2,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFe(gt1) 
CurrentPDG2(2) = PDGHpm(gt2) 
Write(io_L,201) BRFv(2,icount)/2._dp,2,CurrentPDG2, & 
 & Trim(NameParticleFv(2))//" -> "//Trim(NameParticleFe(gt1))//" "//Trim(NameParticleHpm(gt2))//" "//")"
Write(io_L,201) BRFv(2,icount)/2._dp,2,-CurrentPDG2, & 
 & Trim(NameParticleFv(2))//" -> "//Trim(NameParticleFe(gt1))//"^* "//Trim(NameParticleHpm(gt2))//"^* "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 1, 3
If (BRFv(2,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFe(gt1) 
CurrentPDG2(2) = PDGVWLm 
Write(io_L,201) BRFv(2,icount)/2._dp,2,CurrentPDG2, & 
 & Trim(NameParticleFv(2))//" -> "//Trim(NameParticleFe(gt1))//" "//Trim(NameParticleVWLm)//" "//")"
Write(io_L,201) BRFv(2,icount)/2._dp,2,-CurrentPDG2, & 
 & Trim(NameParticleFv(2))//" -> "//Trim(NameParticleFe(gt1))//"^* "//Trim(NameParticleVWLm)//"^* "//")"
End if 
icount = icount +1 
  End Do 
Do gt1= 1, 3
If (BRFv(2,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFe(gt1) 
CurrentPDG2(2) = PDGVWRm 
Write(io_L,201) BRFv(2,icount)/2._dp,2,CurrentPDG2, & 
 & Trim(NameParticleFv(2))//" -> "//Trim(NameParticleFe(gt1))//" "//Trim(NameParticleVWRm)//" "//")"
Write(io_L,201) BRFv(2,icount)/2._dp,2,-CurrentPDG2, & 
 & Trim(NameParticleFv(2))//" -> "//Trim(NameParticleFe(gt1))//"^* "//Trim(NameParticleVWRm)//"^* "//")"
End if 
icount = icount +1 
  End Do 
Do gt1= 1, 6
  Do gt2=1, 3
If (BRFv(2,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFv(gt1) 
CurrentPDG2(2) = PDGhh(gt2) 
Write(io_L,201) BRFv(2,icount),2,CurrentPDG2, & 
 & Trim(NameParticleFv(2))//" -> "//Trim(NameParticleFv(gt1))//" "//Trim(NameParticlehh(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 1, 6
If (BRFv(2,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFv(gt1) 
CurrentPDG2(2) = PDGVZ 
Write(io_L,201) BRFv(2,icount),2,CurrentPDG2, & 
 & Trim(NameParticleFv(2))//" -> "//Trim(NameParticleFv(gt1))//" "//Trim(NameParticleVZ)//" "//")"
End if 
icount = icount +1 
  End Do 
Do gt1= 1, 6
If (BRFv(2,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFv(gt1) 
CurrentPDG2(2) = PDGVZR 
Write(io_L,201) BRFv(2,icount),2,CurrentPDG2, & 
 & Trim(NameParticleFv(2))//" -> "//Trim(NameParticleFv(gt1))//" "//Trim(NameParticleVZR)//" "//")"
End if 
icount = icount +1 
  End Do 
If (Maxval(BRFv(2,46:558)).Gt.BRmin) Then 
Write(io_L,100) "#    BR                NDA      ID1      ID2       ID3" 
End If 
Do gt1=1,6
  Do gt2=1,3
    Do gt3=gt2,3
If (BRFv(2,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFv(gt1) 
CurrentPDG3(2) = PDGFc(gt2) 
CurrentPDG3(3) = PDGFc(gt3) 
Write(io_L,202) BRFv(2,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFv(2))//" -> "//Trim(NameParticleFv(gt1))//" "//Trim(NameParticleFc(gt2))//" "//Trim(NameParticleFc(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,6
  Do gt2=1,2
    Do gt3=1,2
If (BRFv(2,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFv(gt1) 
CurrentPDG3(2) = -PDGFcp(gt2) 
CurrentPDG3(3) = PDGFcp(gt3) 
Write(io_L,202) BRFv(2,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFv(2))//" -> "//Trim(NameParticleFv(gt1))//" "//Trim(NameParticleFcp(gt2))//"^* "//Trim(NameParticleFcp(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,6
  Do gt2=1,3
    Do gt3=1,3
If (BRFv(2,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFv(gt1) 
CurrentPDG3(2) = -PDGFd(gt2) 
CurrentPDG3(3) = PDGFd(gt3) 
Write(io_L,202) BRFv(2,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFv(2))//" -> "//Trim(NameParticleFv(gt1))//" "//Trim(NameParticleFd(gt2))//"^* "//Trim(NameParticleFd(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,6
  Do gt2=1,3
    Do gt3=1,3
If (BRFv(2,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFv(gt1) 
CurrentPDG3(2) = -PDGFe(gt2) 
CurrentPDG3(3) = PDGFe(gt3) 
Write(io_L,202) BRFv(2,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFv(2))//" -> "//Trim(NameParticleFv(gt1))//" "//Trim(NameParticleFe(gt2))//"^* "//Trim(NameParticleFe(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,6
  Do gt2=1,3
    Do gt3=1,3
If (BRFv(2,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFv(gt1) 
CurrentPDG3(2) = -PDGFu(gt2) 
CurrentPDG3(3) = PDGFu(gt3) 
Write(io_L,202) BRFv(2,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFv(2))//" -> "//Trim(NameParticleFv(gt1))//" "//Trim(NameParticleFu(gt2))//"^* "//Trim(NameParticleFu(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,6
  Do gt2=gt1,6
    Do gt3=gt2,6
If (BRFv(2,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFv(gt1) 
CurrentPDG3(2) = PDGFv(gt2) 
CurrentPDG3(3) = PDGFv(gt3) 
Write(io_L,202) BRFv(2,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFv(2))//" -> "//Trim(NameParticleFv(gt1))//" "//Trim(NameParticleFv(gt2))//" "//Trim(NameParticleFv(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,3
  Do gt2=1,2
    Do gt3=1,3
If (BRFv(2,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFe(gt1) 
CurrentPDG3(2) = -PDGFcp(gt2) 
CurrentPDG3(3) = PDGFc(gt3) 
Write(io_L,202) BRFv(2,icount)/2._dp,3,CurrentPDG3, & 
 & Trim(NameParticleFv(2))//" -> "//Trim(NameParticleFe(gt1))//" "//Trim(NameParticleFcp(gt2))//"^* "//Trim(NameParticleFc(gt3))//" "//")"
Write(io_L,202) BRFv(2,icount)/2._dp,3,-CurrentPDG3, & 
 & Trim(NameParticleFv(2))//" -> "//Trim(NameParticleFe(gt1))//"^* "//Trim(NameParticleFcp(gt2))//" "//Trim(NameParticleFc(gt3))//"^* "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,3
    Do gt3=1,2
If (BRFv(2,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFe(gt1) 
CurrentPDG3(2) = -PDGFcpp 
CurrentPDG3(3) = PDGFcp(gt3) 
Write(io_L,202) BRFv(2,icount)/2._dp,3,CurrentPDG3, & 
 & Trim(NameParticleFv(2))//" -> "//Trim(NameParticleFe(gt1))//" "//Trim(NameParticleFcpp)//"^* "//Trim(NameParticleFcp(gt3))//" "//")"
Write(io_L,202) BRFv(2,icount)/2._dp,3,-CurrentPDG3, & 
 & Trim(NameParticleFv(2))//" -> "//Trim(NameParticleFe(gt1))//"^* "//Trim(NameParticleFcpp)//" "//Trim(NameParticleFcp(gt3))//"^* "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
If (BRFv(2,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFe(gt1) 
CurrentPDG3(2) = -PDGFu(gt2) 
CurrentPDG3(3) = PDGFd(gt3) 
Write(io_L,202) BRFv(2,icount)/2._dp,3,CurrentPDG3, & 
 & Trim(NameParticleFv(2))//" -> "//Trim(NameParticleFe(gt1))//" "//Trim(NameParticleFu(gt2))//"^* "//Trim(NameParticleFd(gt3))//" "//")"
Write(io_L,202) BRFv(2,icount)/2._dp,3,-CurrentPDG3, & 
 & Trim(NameParticleFv(2))//" -> "//Trim(NameParticleFe(gt1))//"^* "//Trim(NameParticleFu(gt2))//" "//Trim(NameParticleFd(gt3))//"^* "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,6
If (BRFv(2,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFv(gt1) 
CurrentPDG3(2) = -PDGFcpp 
CurrentPDG3(3) = PDGFcpp 
Write(io_L,202) BRFv(2,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFv(2))//" -> "//Trim(NameParticleFv(gt1))//" "//Trim(NameParticleFcpp)//"^* "//Trim(NameParticleFcpp)//" "//")"
End if 
icount = icount +1 
  End Do 
End if 
If(gTFv(3).gt.MinWidth) Then 
Write(io_L,200) INT(PDGFv(3)),gTFv(3),Trim(NameParticleFv(3)) 
Write(io_L,100) "#    BR                NDA      ID1      ID2" 
icount = 1 
Do gt1= 1, 6
  Do gt2=3, 3
If (BRFv(3,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFv(gt1) 
CurrentPDG2(2) = PDGAh(gt2) 
Write(io_L,201) BRFv(3,icount),2,CurrentPDG2, & 
 & Trim(NameParticleFv(3))//" -> "//Trim(NameParticleFv(gt1))//" "//Trim(NameParticleAh(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 1, 3
  Do gt2=3, 3
If (BRFv(3,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFe(gt1) 
CurrentPDG2(2) = PDGHpm(gt2) 
Write(io_L,201) BRFv(3,icount)/2._dp,2,CurrentPDG2, & 
 & Trim(NameParticleFv(3))//" -> "//Trim(NameParticleFe(gt1))//" "//Trim(NameParticleHpm(gt2))//" "//")"
Write(io_L,201) BRFv(3,icount)/2._dp,2,-CurrentPDG2, & 
 & Trim(NameParticleFv(3))//" -> "//Trim(NameParticleFe(gt1))//"^* "//Trim(NameParticleHpm(gt2))//"^* "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 1, 3
If (BRFv(3,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFe(gt1) 
CurrentPDG2(2) = PDGVWLm 
Write(io_L,201) BRFv(3,icount)/2._dp,2,CurrentPDG2, & 
 & Trim(NameParticleFv(3))//" -> "//Trim(NameParticleFe(gt1))//" "//Trim(NameParticleVWLm)//" "//")"
Write(io_L,201) BRFv(3,icount)/2._dp,2,-CurrentPDG2, & 
 & Trim(NameParticleFv(3))//" -> "//Trim(NameParticleFe(gt1))//"^* "//Trim(NameParticleVWLm)//"^* "//")"
End if 
icount = icount +1 
  End Do 
Do gt1= 1, 3
If (BRFv(3,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFe(gt1) 
CurrentPDG2(2) = PDGVWRm 
Write(io_L,201) BRFv(3,icount)/2._dp,2,CurrentPDG2, & 
 & Trim(NameParticleFv(3))//" -> "//Trim(NameParticleFe(gt1))//" "//Trim(NameParticleVWRm)//" "//")"
Write(io_L,201) BRFv(3,icount)/2._dp,2,-CurrentPDG2, & 
 & Trim(NameParticleFv(3))//" -> "//Trim(NameParticleFe(gt1))//"^* "//Trim(NameParticleVWRm)//"^* "//")"
End if 
icount = icount +1 
  End Do 
Do gt1= 1, 6
  Do gt2=1, 3
If (BRFv(3,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFv(gt1) 
CurrentPDG2(2) = PDGhh(gt2) 
Write(io_L,201) BRFv(3,icount),2,CurrentPDG2, & 
 & Trim(NameParticleFv(3))//" -> "//Trim(NameParticleFv(gt1))//" "//Trim(NameParticlehh(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 1, 6
If (BRFv(3,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFv(gt1) 
CurrentPDG2(2) = PDGVZ 
Write(io_L,201) BRFv(3,icount),2,CurrentPDG2, & 
 & Trim(NameParticleFv(3))//" -> "//Trim(NameParticleFv(gt1))//" "//Trim(NameParticleVZ)//" "//")"
End if 
icount = icount +1 
  End Do 
Do gt1= 1, 6
If (BRFv(3,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFv(gt1) 
CurrentPDG2(2) = PDGVZR 
Write(io_L,201) BRFv(3,icount),2,CurrentPDG2, & 
 & Trim(NameParticleFv(3))//" -> "//Trim(NameParticleFv(gt1))//" "//Trim(NameParticleVZR)//" "//")"
End if 
icount = icount +1 
  End Do 
If (Maxval(BRFv(3,46:558)).Gt.BRmin) Then 
Write(io_L,100) "#    BR                NDA      ID1      ID2       ID3" 
End If 
Do gt1=1,6
  Do gt2=1,3
    Do gt3=gt2,3
If (BRFv(3,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFv(gt1) 
CurrentPDG3(2) = PDGFc(gt2) 
CurrentPDG3(3) = PDGFc(gt3) 
Write(io_L,202) BRFv(3,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFv(3))//" -> "//Trim(NameParticleFv(gt1))//" "//Trim(NameParticleFc(gt2))//" "//Trim(NameParticleFc(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,6
  Do gt2=1,2
    Do gt3=1,2
If (BRFv(3,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFv(gt1) 
CurrentPDG3(2) = -PDGFcp(gt2) 
CurrentPDG3(3) = PDGFcp(gt3) 
Write(io_L,202) BRFv(3,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFv(3))//" -> "//Trim(NameParticleFv(gt1))//" "//Trim(NameParticleFcp(gt2))//"^* "//Trim(NameParticleFcp(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,6
  Do gt2=1,3
    Do gt3=1,3
If (BRFv(3,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFv(gt1) 
CurrentPDG3(2) = -PDGFd(gt2) 
CurrentPDG3(3) = PDGFd(gt3) 
Write(io_L,202) BRFv(3,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFv(3))//" -> "//Trim(NameParticleFv(gt1))//" "//Trim(NameParticleFd(gt2))//"^* "//Trim(NameParticleFd(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,6
  Do gt2=1,3
    Do gt3=1,3
If (BRFv(3,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFv(gt1) 
CurrentPDG3(2) = -PDGFe(gt2) 
CurrentPDG3(3) = PDGFe(gt3) 
Write(io_L,202) BRFv(3,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFv(3))//" -> "//Trim(NameParticleFv(gt1))//" "//Trim(NameParticleFe(gt2))//"^* "//Trim(NameParticleFe(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,6
  Do gt2=1,3
    Do gt3=1,3
If (BRFv(3,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFv(gt1) 
CurrentPDG3(2) = -PDGFu(gt2) 
CurrentPDG3(3) = PDGFu(gt3) 
Write(io_L,202) BRFv(3,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFv(3))//" -> "//Trim(NameParticleFv(gt1))//" "//Trim(NameParticleFu(gt2))//"^* "//Trim(NameParticleFu(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,6
  Do gt2=gt1,6
    Do gt3=gt2,6
If (BRFv(3,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFv(gt1) 
CurrentPDG3(2) = PDGFv(gt2) 
CurrentPDG3(3) = PDGFv(gt3) 
Write(io_L,202) BRFv(3,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFv(3))//" -> "//Trim(NameParticleFv(gt1))//" "//Trim(NameParticleFv(gt2))//" "//Trim(NameParticleFv(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,3
  Do gt2=1,2
    Do gt3=1,3
If (BRFv(3,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFe(gt1) 
CurrentPDG3(2) = -PDGFcp(gt2) 
CurrentPDG3(3) = PDGFc(gt3) 
Write(io_L,202) BRFv(3,icount)/2._dp,3,CurrentPDG3, & 
 & Trim(NameParticleFv(3))//" -> "//Trim(NameParticleFe(gt1))//" "//Trim(NameParticleFcp(gt2))//"^* "//Trim(NameParticleFc(gt3))//" "//")"
Write(io_L,202) BRFv(3,icount)/2._dp,3,-CurrentPDG3, & 
 & Trim(NameParticleFv(3))//" -> "//Trim(NameParticleFe(gt1))//"^* "//Trim(NameParticleFcp(gt2))//" "//Trim(NameParticleFc(gt3))//"^* "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,3
    Do gt3=1,2
If (BRFv(3,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFe(gt1) 
CurrentPDG3(2) = -PDGFcpp 
CurrentPDG3(3) = PDGFcp(gt3) 
Write(io_L,202) BRFv(3,icount)/2._dp,3,CurrentPDG3, & 
 & Trim(NameParticleFv(3))//" -> "//Trim(NameParticleFe(gt1))//" "//Trim(NameParticleFcpp)//"^* "//Trim(NameParticleFcp(gt3))//" "//")"
Write(io_L,202) BRFv(3,icount)/2._dp,3,-CurrentPDG3, & 
 & Trim(NameParticleFv(3))//" -> "//Trim(NameParticleFe(gt1))//"^* "//Trim(NameParticleFcpp)//" "//Trim(NameParticleFcp(gt3))//"^* "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
If (BRFv(3,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFe(gt1) 
CurrentPDG3(2) = -PDGFu(gt2) 
CurrentPDG3(3) = PDGFd(gt3) 
Write(io_L,202) BRFv(3,icount)/2._dp,3,CurrentPDG3, & 
 & Trim(NameParticleFv(3))//" -> "//Trim(NameParticleFe(gt1))//" "//Trim(NameParticleFu(gt2))//"^* "//Trim(NameParticleFd(gt3))//" "//")"
Write(io_L,202) BRFv(3,icount)/2._dp,3,-CurrentPDG3, & 
 & Trim(NameParticleFv(3))//" -> "//Trim(NameParticleFe(gt1))//"^* "//Trim(NameParticleFu(gt2))//" "//Trim(NameParticleFd(gt3))//"^* "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,6
If (BRFv(3,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFv(gt1) 
CurrentPDG3(2) = -PDGFcpp 
CurrentPDG3(3) = PDGFcpp 
Write(io_L,202) BRFv(3,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFv(3))//" -> "//Trim(NameParticleFv(gt1))//" "//Trim(NameParticleFcpp)//"^* "//Trim(NameParticleFcpp)//" "//")"
End if 
icount = icount +1 
  End Do 
End if 
If(gTFv(4).gt.MinWidth) Then 
Write(io_L,200) INT(PDGFv(4)),gTFv(4),Trim(NameParticleFv(4)) 
Write(io_L,100) "#    BR                NDA      ID1      ID2" 
icount = 1 
Do gt1= 1, 6
  Do gt2=3, 3
If (BRFv(4,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFv(gt1) 
CurrentPDG2(2) = PDGAh(gt2) 
Write(io_L,201) BRFv(4,icount),2,CurrentPDG2, & 
 & Trim(NameParticleFv(4))//" -> "//Trim(NameParticleFv(gt1))//" "//Trim(NameParticleAh(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 1, 3
  Do gt2=3, 3
If (BRFv(4,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFe(gt1) 
CurrentPDG2(2) = PDGHpm(gt2) 
Write(io_L,201) BRFv(4,icount)/2._dp,2,CurrentPDG2, & 
 & Trim(NameParticleFv(4))//" -> "//Trim(NameParticleFe(gt1))//" "//Trim(NameParticleHpm(gt2))//" "//")"
Write(io_L,201) BRFv(4,icount)/2._dp,2,-CurrentPDG2, & 
 & Trim(NameParticleFv(4))//" -> "//Trim(NameParticleFe(gt1))//"^* "//Trim(NameParticleHpm(gt2))//"^* "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 1, 3
If (BRFv(4,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFe(gt1) 
CurrentPDG2(2) = PDGVWLm 
Write(io_L,201) BRFv(4,icount)/2._dp,2,CurrentPDG2, & 
 & Trim(NameParticleFv(4))//" -> "//Trim(NameParticleFe(gt1))//" "//Trim(NameParticleVWLm)//" "//")"
Write(io_L,201) BRFv(4,icount)/2._dp,2,-CurrentPDG2, & 
 & Trim(NameParticleFv(4))//" -> "//Trim(NameParticleFe(gt1))//"^* "//Trim(NameParticleVWLm)//"^* "//")"
End if 
icount = icount +1 
  End Do 
Do gt1= 1, 3
If (BRFv(4,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFe(gt1) 
CurrentPDG2(2) = PDGVWRm 
Write(io_L,201) BRFv(4,icount)/2._dp,2,CurrentPDG2, & 
 & Trim(NameParticleFv(4))//" -> "//Trim(NameParticleFe(gt1))//" "//Trim(NameParticleVWRm)//" "//")"
Write(io_L,201) BRFv(4,icount)/2._dp,2,-CurrentPDG2, & 
 & Trim(NameParticleFv(4))//" -> "//Trim(NameParticleFe(gt1))//"^* "//Trim(NameParticleVWRm)//"^* "//")"
End if 
icount = icount +1 
  End Do 
Do gt1= 1, 6
  Do gt2=1, 3
If (BRFv(4,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFv(gt1) 
CurrentPDG2(2) = PDGhh(gt2) 
Write(io_L,201) BRFv(4,icount),2,CurrentPDG2, & 
 & Trim(NameParticleFv(4))//" -> "//Trim(NameParticleFv(gt1))//" "//Trim(NameParticlehh(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 1, 6
If (BRFv(4,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFv(gt1) 
CurrentPDG2(2) = PDGVZ 
Write(io_L,201) BRFv(4,icount),2,CurrentPDG2, & 
 & Trim(NameParticleFv(4))//" -> "//Trim(NameParticleFv(gt1))//" "//Trim(NameParticleVZ)//" "//")"
End if 
icount = icount +1 
  End Do 
Do gt1= 1, 6
If (BRFv(4,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFv(gt1) 
CurrentPDG2(2) = PDGVZR 
Write(io_L,201) BRFv(4,icount),2,CurrentPDG2, & 
 & Trim(NameParticleFv(4))//" -> "//Trim(NameParticleFv(gt1))//" "//Trim(NameParticleVZR)//" "//")"
End if 
icount = icount +1 
  End Do 
If (Maxval(BRFv(4,46:558)).Gt.BRmin) Then 
Write(io_L,100) "#    BR                NDA      ID1      ID2       ID3" 
End If 
Do gt1=1,6
  Do gt2=1,3
    Do gt3=gt2,3
If (BRFv(4,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFv(gt1) 
CurrentPDG3(2) = PDGFc(gt2) 
CurrentPDG3(3) = PDGFc(gt3) 
Write(io_L,202) BRFv(4,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFv(4))//" -> "//Trim(NameParticleFv(gt1))//" "//Trim(NameParticleFc(gt2))//" "//Trim(NameParticleFc(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,6
  Do gt2=1,2
    Do gt3=1,2
If (BRFv(4,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFv(gt1) 
CurrentPDG3(2) = -PDGFcp(gt2) 
CurrentPDG3(3) = PDGFcp(gt3) 
Write(io_L,202) BRFv(4,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFv(4))//" -> "//Trim(NameParticleFv(gt1))//" "//Trim(NameParticleFcp(gt2))//"^* "//Trim(NameParticleFcp(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,6
  Do gt2=1,3
    Do gt3=1,3
If (BRFv(4,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFv(gt1) 
CurrentPDG3(2) = -PDGFd(gt2) 
CurrentPDG3(3) = PDGFd(gt3) 
Write(io_L,202) BRFv(4,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFv(4))//" -> "//Trim(NameParticleFv(gt1))//" "//Trim(NameParticleFd(gt2))//"^* "//Trim(NameParticleFd(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,6
  Do gt2=1,3
    Do gt3=1,3
If (BRFv(4,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFv(gt1) 
CurrentPDG3(2) = -PDGFe(gt2) 
CurrentPDG3(3) = PDGFe(gt3) 
Write(io_L,202) BRFv(4,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFv(4))//" -> "//Trim(NameParticleFv(gt1))//" "//Trim(NameParticleFe(gt2))//"^* "//Trim(NameParticleFe(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,6
  Do gt2=1,3
    Do gt3=1,3
If (BRFv(4,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFv(gt1) 
CurrentPDG3(2) = -PDGFu(gt2) 
CurrentPDG3(3) = PDGFu(gt3) 
Write(io_L,202) BRFv(4,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFv(4))//" -> "//Trim(NameParticleFv(gt1))//" "//Trim(NameParticleFu(gt2))//"^* "//Trim(NameParticleFu(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,6
  Do gt2=gt1,6
    Do gt3=gt2,6
If (BRFv(4,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFv(gt1) 
CurrentPDG3(2) = PDGFv(gt2) 
CurrentPDG3(3) = PDGFv(gt3) 
Write(io_L,202) BRFv(4,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFv(4))//" -> "//Trim(NameParticleFv(gt1))//" "//Trim(NameParticleFv(gt2))//" "//Trim(NameParticleFv(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,3
  Do gt2=1,2
    Do gt3=1,3
If (BRFv(4,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFe(gt1) 
CurrentPDG3(2) = -PDGFcp(gt2) 
CurrentPDG3(3) = PDGFc(gt3) 
Write(io_L,202) BRFv(4,icount)/2._dp,3,CurrentPDG3, & 
 & Trim(NameParticleFv(4))//" -> "//Trim(NameParticleFe(gt1))//" "//Trim(NameParticleFcp(gt2))//"^* "//Trim(NameParticleFc(gt3))//" "//")"
Write(io_L,202) BRFv(4,icount)/2._dp,3,-CurrentPDG3, & 
 & Trim(NameParticleFv(4))//" -> "//Trim(NameParticleFe(gt1))//"^* "//Trim(NameParticleFcp(gt2))//" "//Trim(NameParticleFc(gt3))//"^* "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,3
    Do gt3=1,2
If (BRFv(4,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFe(gt1) 
CurrentPDG3(2) = -PDGFcpp 
CurrentPDG3(3) = PDGFcp(gt3) 
Write(io_L,202) BRFv(4,icount)/2._dp,3,CurrentPDG3, & 
 & Trim(NameParticleFv(4))//" -> "//Trim(NameParticleFe(gt1))//" "//Trim(NameParticleFcpp)//"^* "//Trim(NameParticleFcp(gt3))//" "//")"
Write(io_L,202) BRFv(4,icount)/2._dp,3,-CurrentPDG3, & 
 & Trim(NameParticleFv(4))//" -> "//Trim(NameParticleFe(gt1))//"^* "//Trim(NameParticleFcpp)//" "//Trim(NameParticleFcp(gt3))//"^* "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
If (BRFv(4,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFe(gt1) 
CurrentPDG3(2) = -PDGFu(gt2) 
CurrentPDG3(3) = PDGFd(gt3) 
Write(io_L,202) BRFv(4,icount)/2._dp,3,CurrentPDG3, & 
 & Trim(NameParticleFv(4))//" -> "//Trim(NameParticleFe(gt1))//" "//Trim(NameParticleFu(gt2))//"^* "//Trim(NameParticleFd(gt3))//" "//")"
Write(io_L,202) BRFv(4,icount)/2._dp,3,-CurrentPDG3, & 
 & Trim(NameParticleFv(4))//" -> "//Trim(NameParticleFe(gt1))//"^* "//Trim(NameParticleFu(gt2))//" "//Trim(NameParticleFd(gt3))//"^* "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,6
If (BRFv(4,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFv(gt1) 
CurrentPDG3(2) = -PDGFcpp 
CurrentPDG3(3) = PDGFcpp 
Write(io_L,202) BRFv(4,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFv(4))//" -> "//Trim(NameParticleFv(gt1))//" "//Trim(NameParticleFcpp)//"^* "//Trim(NameParticleFcpp)//" "//")"
End if 
icount = icount +1 
  End Do 
End if 
If(gTFv(5).gt.MinWidth) Then 
Write(io_L,200) INT(PDGFv(5)),gTFv(5),Trim(NameParticleFv(5)) 
Write(io_L,100) "#    BR                NDA      ID1      ID2" 
icount = 1 
Do gt1= 1, 6
  Do gt2=3, 3
If (BRFv(5,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFv(gt1) 
CurrentPDG2(2) = PDGAh(gt2) 
Write(io_L,201) BRFv(5,icount),2,CurrentPDG2, & 
 & Trim(NameParticleFv(5))//" -> "//Trim(NameParticleFv(gt1))//" "//Trim(NameParticleAh(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 1, 3
  Do gt2=3, 3
If (BRFv(5,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFe(gt1) 
CurrentPDG2(2) = PDGHpm(gt2) 
Write(io_L,201) BRFv(5,icount)/2._dp,2,CurrentPDG2, & 
 & Trim(NameParticleFv(5))//" -> "//Trim(NameParticleFe(gt1))//" "//Trim(NameParticleHpm(gt2))//" "//")"
Write(io_L,201) BRFv(5,icount)/2._dp,2,-CurrentPDG2, & 
 & Trim(NameParticleFv(5))//" -> "//Trim(NameParticleFe(gt1))//"^* "//Trim(NameParticleHpm(gt2))//"^* "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 1, 3
If (BRFv(5,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFe(gt1) 
CurrentPDG2(2) = PDGVWLm 
Write(io_L,201) BRFv(5,icount)/2._dp,2,CurrentPDG2, & 
 & Trim(NameParticleFv(5))//" -> "//Trim(NameParticleFe(gt1))//" "//Trim(NameParticleVWLm)//" "//")"
Write(io_L,201) BRFv(5,icount)/2._dp,2,-CurrentPDG2, & 
 & Trim(NameParticleFv(5))//" -> "//Trim(NameParticleFe(gt1))//"^* "//Trim(NameParticleVWLm)//"^* "//")"
End if 
icount = icount +1 
  End Do 
Do gt1= 1, 3
If (BRFv(5,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFe(gt1) 
CurrentPDG2(2) = PDGVWRm 
Write(io_L,201) BRFv(5,icount)/2._dp,2,CurrentPDG2, & 
 & Trim(NameParticleFv(5))//" -> "//Trim(NameParticleFe(gt1))//" "//Trim(NameParticleVWRm)//" "//")"
Write(io_L,201) BRFv(5,icount)/2._dp,2,-CurrentPDG2, & 
 & Trim(NameParticleFv(5))//" -> "//Trim(NameParticleFe(gt1))//"^* "//Trim(NameParticleVWRm)//"^* "//")"
End if 
icount = icount +1 
  End Do 
Do gt1= 1, 6
  Do gt2=1, 3
If (BRFv(5,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFv(gt1) 
CurrentPDG2(2) = PDGhh(gt2) 
Write(io_L,201) BRFv(5,icount),2,CurrentPDG2, & 
 & Trim(NameParticleFv(5))//" -> "//Trim(NameParticleFv(gt1))//" "//Trim(NameParticlehh(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 1, 6
If (BRFv(5,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFv(gt1) 
CurrentPDG2(2) = PDGVZ 
Write(io_L,201) BRFv(5,icount),2,CurrentPDG2, & 
 & Trim(NameParticleFv(5))//" -> "//Trim(NameParticleFv(gt1))//" "//Trim(NameParticleVZ)//" "//")"
End if 
icount = icount +1 
  End Do 
Do gt1= 1, 6
If (BRFv(5,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFv(gt1) 
CurrentPDG2(2) = PDGVZR 
Write(io_L,201) BRFv(5,icount),2,CurrentPDG2, & 
 & Trim(NameParticleFv(5))//" -> "//Trim(NameParticleFv(gt1))//" "//Trim(NameParticleVZR)//" "//")"
End if 
icount = icount +1 
  End Do 
If (Maxval(BRFv(5,46:558)).Gt.BRmin) Then 
Write(io_L,100) "#    BR                NDA      ID1      ID2       ID3" 
End If 
Do gt1=1,6
  Do gt2=1,3
    Do gt3=gt2,3
If (BRFv(5,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFv(gt1) 
CurrentPDG3(2) = PDGFc(gt2) 
CurrentPDG3(3) = PDGFc(gt3) 
Write(io_L,202) BRFv(5,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFv(5))//" -> "//Trim(NameParticleFv(gt1))//" "//Trim(NameParticleFc(gt2))//" "//Trim(NameParticleFc(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,6
  Do gt2=1,2
    Do gt3=1,2
If (BRFv(5,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFv(gt1) 
CurrentPDG3(2) = -PDGFcp(gt2) 
CurrentPDG3(3) = PDGFcp(gt3) 
Write(io_L,202) BRFv(5,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFv(5))//" -> "//Trim(NameParticleFv(gt1))//" "//Trim(NameParticleFcp(gt2))//"^* "//Trim(NameParticleFcp(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,6
  Do gt2=1,3
    Do gt3=1,3
If (BRFv(5,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFv(gt1) 
CurrentPDG3(2) = -PDGFd(gt2) 
CurrentPDG3(3) = PDGFd(gt3) 
Write(io_L,202) BRFv(5,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFv(5))//" -> "//Trim(NameParticleFv(gt1))//" "//Trim(NameParticleFd(gt2))//"^* "//Trim(NameParticleFd(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,6
  Do gt2=1,3
    Do gt3=1,3
If (BRFv(5,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFv(gt1) 
CurrentPDG3(2) = -PDGFe(gt2) 
CurrentPDG3(3) = PDGFe(gt3) 
Write(io_L,202) BRFv(5,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFv(5))//" -> "//Trim(NameParticleFv(gt1))//" "//Trim(NameParticleFe(gt2))//"^* "//Trim(NameParticleFe(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,6
  Do gt2=1,3
    Do gt3=1,3
If (BRFv(5,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFv(gt1) 
CurrentPDG3(2) = -PDGFu(gt2) 
CurrentPDG3(3) = PDGFu(gt3) 
Write(io_L,202) BRFv(5,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFv(5))//" -> "//Trim(NameParticleFv(gt1))//" "//Trim(NameParticleFu(gt2))//"^* "//Trim(NameParticleFu(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,6
  Do gt2=gt1,6
    Do gt3=gt2,6
If (BRFv(5,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFv(gt1) 
CurrentPDG3(2) = PDGFv(gt2) 
CurrentPDG3(3) = PDGFv(gt3) 
Write(io_L,202) BRFv(5,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFv(5))//" -> "//Trim(NameParticleFv(gt1))//" "//Trim(NameParticleFv(gt2))//" "//Trim(NameParticleFv(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,3
  Do gt2=1,2
    Do gt3=1,3
If (BRFv(5,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFe(gt1) 
CurrentPDG3(2) = -PDGFcp(gt2) 
CurrentPDG3(3) = PDGFc(gt3) 
Write(io_L,202) BRFv(5,icount)/2._dp,3,CurrentPDG3, & 
 & Trim(NameParticleFv(5))//" -> "//Trim(NameParticleFe(gt1))//" "//Trim(NameParticleFcp(gt2))//"^* "//Trim(NameParticleFc(gt3))//" "//")"
Write(io_L,202) BRFv(5,icount)/2._dp,3,-CurrentPDG3, & 
 & Trim(NameParticleFv(5))//" -> "//Trim(NameParticleFe(gt1))//"^* "//Trim(NameParticleFcp(gt2))//" "//Trim(NameParticleFc(gt3))//"^* "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,3
    Do gt3=1,2
If (BRFv(5,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFe(gt1) 
CurrentPDG3(2) = -PDGFcpp 
CurrentPDG3(3) = PDGFcp(gt3) 
Write(io_L,202) BRFv(5,icount)/2._dp,3,CurrentPDG3, & 
 & Trim(NameParticleFv(5))//" -> "//Trim(NameParticleFe(gt1))//" "//Trim(NameParticleFcpp)//"^* "//Trim(NameParticleFcp(gt3))//" "//")"
Write(io_L,202) BRFv(5,icount)/2._dp,3,-CurrentPDG3, & 
 & Trim(NameParticleFv(5))//" -> "//Trim(NameParticleFe(gt1))//"^* "//Trim(NameParticleFcpp)//" "//Trim(NameParticleFcp(gt3))//"^* "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
If (BRFv(5,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFe(gt1) 
CurrentPDG3(2) = -PDGFu(gt2) 
CurrentPDG3(3) = PDGFd(gt3) 
Write(io_L,202) BRFv(5,icount)/2._dp,3,CurrentPDG3, & 
 & Trim(NameParticleFv(5))//" -> "//Trim(NameParticleFe(gt1))//" "//Trim(NameParticleFu(gt2))//"^* "//Trim(NameParticleFd(gt3))//" "//")"
Write(io_L,202) BRFv(5,icount)/2._dp,3,-CurrentPDG3, & 
 & Trim(NameParticleFv(5))//" -> "//Trim(NameParticleFe(gt1))//"^* "//Trim(NameParticleFu(gt2))//" "//Trim(NameParticleFd(gt3))//"^* "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,6
If (BRFv(5,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFv(gt1) 
CurrentPDG3(2) = -PDGFcpp 
CurrentPDG3(3) = PDGFcpp 
Write(io_L,202) BRFv(5,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFv(5))//" -> "//Trim(NameParticleFv(gt1))//" "//Trim(NameParticleFcpp)//"^* "//Trim(NameParticleFcpp)//" "//")"
End if 
icount = icount +1 
  End Do 
End if 
If(gTFv(6).gt.MinWidth) Then 
Write(io_L,200) INT(PDGFv(6)),gTFv(6),Trim(NameParticleFv(6)) 
Write(io_L,100) "#    BR                NDA      ID1      ID2" 
icount = 1 
Do gt1= 1, 6
  Do gt2=3, 3
If (BRFv(6,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFv(gt1) 
CurrentPDG2(2) = PDGAh(gt2) 
Write(io_L,201) BRFv(6,icount),2,CurrentPDG2, & 
 & Trim(NameParticleFv(6))//" -> "//Trim(NameParticleFv(gt1))//" "//Trim(NameParticleAh(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 1, 3
  Do gt2=3, 3
If (BRFv(6,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFe(gt1) 
CurrentPDG2(2) = PDGHpm(gt2) 
Write(io_L,201) BRFv(6,icount)/2._dp,2,CurrentPDG2, & 
 & Trim(NameParticleFv(6))//" -> "//Trim(NameParticleFe(gt1))//" "//Trim(NameParticleHpm(gt2))//" "//")"
Write(io_L,201) BRFv(6,icount)/2._dp,2,-CurrentPDG2, & 
 & Trim(NameParticleFv(6))//" -> "//Trim(NameParticleFe(gt1))//"^* "//Trim(NameParticleHpm(gt2))//"^* "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 1, 3
If (BRFv(6,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFe(gt1) 
CurrentPDG2(2) = PDGVWLm 
Write(io_L,201) BRFv(6,icount)/2._dp,2,CurrentPDG2, & 
 & Trim(NameParticleFv(6))//" -> "//Trim(NameParticleFe(gt1))//" "//Trim(NameParticleVWLm)//" "//")"
Write(io_L,201) BRFv(6,icount)/2._dp,2,-CurrentPDG2, & 
 & Trim(NameParticleFv(6))//" -> "//Trim(NameParticleFe(gt1))//"^* "//Trim(NameParticleVWLm)//"^* "//")"
End if 
icount = icount +1 
  End Do 
Do gt1= 1, 3
If (BRFv(6,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFe(gt1) 
CurrentPDG2(2) = PDGVWRm 
Write(io_L,201) BRFv(6,icount)/2._dp,2,CurrentPDG2, & 
 & Trim(NameParticleFv(6))//" -> "//Trim(NameParticleFe(gt1))//" "//Trim(NameParticleVWRm)//" "//")"
Write(io_L,201) BRFv(6,icount)/2._dp,2,-CurrentPDG2, & 
 & Trim(NameParticleFv(6))//" -> "//Trim(NameParticleFe(gt1))//"^* "//Trim(NameParticleVWRm)//"^* "//")"
End if 
icount = icount +1 
  End Do 
Do gt1= 1, 6
  Do gt2=1, 3
If (BRFv(6,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFv(gt1) 
CurrentPDG2(2) = PDGhh(gt2) 
Write(io_L,201) BRFv(6,icount),2,CurrentPDG2, & 
 & Trim(NameParticleFv(6))//" -> "//Trim(NameParticleFv(gt1))//" "//Trim(NameParticlehh(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 1, 6
If (BRFv(6,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFv(gt1) 
CurrentPDG2(2) = PDGVZ 
Write(io_L,201) BRFv(6,icount),2,CurrentPDG2, & 
 & Trim(NameParticleFv(6))//" -> "//Trim(NameParticleFv(gt1))//" "//Trim(NameParticleVZ)//" "//")"
End if 
icount = icount +1 
  End Do 
Do gt1= 1, 6
If (BRFv(6,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFv(gt1) 
CurrentPDG2(2) = PDGVZR 
Write(io_L,201) BRFv(6,icount),2,CurrentPDG2, & 
 & Trim(NameParticleFv(6))//" -> "//Trim(NameParticleFv(gt1))//" "//Trim(NameParticleVZR)//" "//")"
End if 
icount = icount +1 
  End Do 
If (Maxval(BRFv(6,46:558)).Gt.BRmin) Then 
Write(io_L,100) "#    BR                NDA      ID1      ID2       ID3" 
End If 
Do gt1=1,6
  Do gt2=1,3
    Do gt3=gt2,3
If (BRFv(6,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFv(gt1) 
CurrentPDG3(2) = PDGFc(gt2) 
CurrentPDG3(3) = PDGFc(gt3) 
Write(io_L,202) BRFv(6,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFv(6))//" -> "//Trim(NameParticleFv(gt1))//" "//Trim(NameParticleFc(gt2))//" "//Trim(NameParticleFc(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,6
  Do gt2=1,2
    Do gt3=1,2
If (BRFv(6,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFv(gt1) 
CurrentPDG3(2) = -PDGFcp(gt2) 
CurrentPDG3(3) = PDGFcp(gt3) 
Write(io_L,202) BRFv(6,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFv(6))//" -> "//Trim(NameParticleFv(gt1))//" "//Trim(NameParticleFcp(gt2))//"^* "//Trim(NameParticleFcp(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,6
  Do gt2=1,3
    Do gt3=1,3
If (BRFv(6,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFv(gt1) 
CurrentPDG3(2) = -PDGFd(gt2) 
CurrentPDG3(3) = PDGFd(gt3) 
Write(io_L,202) BRFv(6,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFv(6))//" -> "//Trim(NameParticleFv(gt1))//" "//Trim(NameParticleFd(gt2))//"^* "//Trim(NameParticleFd(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,6
  Do gt2=1,3
    Do gt3=1,3
If (BRFv(6,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFv(gt1) 
CurrentPDG3(2) = -PDGFe(gt2) 
CurrentPDG3(3) = PDGFe(gt3) 
Write(io_L,202) BRFv(6,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFv(6))//" -> "//Trim(NameParticleFv(gt1))//" "//Trim(NameParticleFe(gt2))//"^* "//Trim(NameParticleFe(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,6
  Do gt2=1,3
    Do gt3=1,3
If (BRFv(6,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFv(gt1) 
CurrentPDG3(2) = -PDGFu(gt2) 
CurrentPDG3(3) = PDGFu(gt3) 
Write(io_L,202) BRFv(6,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFv(6))//" -> "//Trim(NameParticleFv(gt1))//" "//Trim(NameParticleFu(gt2))//"^* "//Trim(NameParticleFu(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,6
  Do gt2=gt1,6
    Do gt3=gt2,6
If (BRFv(6,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFv(gt1) 
CurrentPDG3(2) = PDGFv(gt2) 
CurrentPDG3(3) = PDGFv(gt3) 
Write(io_L,202) BRFv(6,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFv(6))//" -> "//Trim(NameParticleFv(gt1))//" "//Trim(NameParticleFv(gt2))//" "//Trim(NameParticleFv(gt3))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,3
  Do gt2=1,2
    Do gt3=1,3
If (BRFv(6,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFe(gt1) 
CurrentPDG3(2) = -PDGFcp(gt2) 
CurrentPDG3(3) = PDGFc(gt3) 
Write(io_L,202) BRFv(6,icount)/2._dp,3,CurrentPDG3, & 
 & Trim(NameParticleFv(6))//" -> "//Trim(NameParticleFe(gt1))//" "//Trim(NameParticleFcp(gt2))//"^* "//Trim(NameParticleFc(gt3))//" "//")"
Write(io_L,202) BRFv(6,icount)/2._dp,3,-CurrentPDG3, & 
 & Trim(NameParticleFv(6))//" -> "//Trim(NameParticleFe(gt1))//"^* "//Trim(NameParticleFcp(gt2))//" "//Trim(NameParticleFc(gt3))//"^* "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,3
    Do gt3=1,2
If (BRFv(6,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFe(gt1) 
CurrentPDG3(2) = -PDGFcpp 
CurrentPDG3(3) = PDGFcp(gt3) 
Write(io_L,202) BRFv(6,icount)/2._dp,3,CurrentPDG3, & 
 & Trim(NameParticleFv(6))//" -> "//Trim(NameParticleFe(gt1))//" "//Trim(NameParticleFcpp)//"^* "//Trim(NameParticleFcp(gt3))//" "//")"
Write(io_L,202) BRFv(6,icount)/2._dp,3,-CurrentPDG3, & 
 & Trim(NameParticleFv(6))//" -> "//Trim(NameParticleFe(gt1))//"^* "//Trim(NameParticleFcpp)//" "//Trim(NameParticleFcp(gt3))//"^* "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
If (BRFv(6,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFe(gt1) 
CurrentPDG3(2) = -PDGFu(gt2) 
CurrentPDG3(3) = PDGFd(gt3) 
Write(io_L,202) BRFv(6,icount)/2._dp,3,CurrentPDG3, & 
 & Trim(NameParticleFv(6))//" -> "//Trim(NameParticleFe(gt1))//" "//Trim(NameParticleFu(gt2))//"^* "//Trim(NameParticleFd(gt3))//" "//")"
Write(io_L,202) BRFv(6,icount)/2._dp,3,-CurrentPDG3, & 
 & Trim(NameParticleFv(6))//" -> "//Trim(NameParticleFe(gt1))//"^* "//Trim(NameParticleFu(gt2))//" "//Trim(NameParticleFd(gt3))//"^* "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
End Do 
 
Do gt1=1,6
If (BRFv(6,icount).Gt.BrMin) Then 
CurrentPDG3(1) = PDGFv(gt1) 
CurrentPDG3(2) = -PDGFcpp 
CurrentPDG3(3) = PDGFcpp 
Write(io_L,202) BRFv(6,icount),3,CurrentPDG3, & 
 & Trim(NameParticleFv(6))//" -> "//Trim(NameParticleFv(gt1))//" "//Trim(NameParticleFcpp)//"^* "//Trim(NameParticleFcpp)//" "//")"
End if 
icount = icount +1 
  End Do 
End if 

 
 !-------------------------------
!VZ
!-------------------------------
 
If(gTVZ.gt.MinWidth) Then 
Write(io_L,200) INT(PDGVZ),gTVZ,Trim(NameParticleVZ) 
Write(io_L,100) "#    BR                NDA      ID1      ID2" 
icount = 1 
Do gt1= 1, 3
  Do gt2=3, 3
If (BRVZ(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGhh(gt1) 
CurrentPDG2(2) = PDGAh(gt2) 
Write(io_L,201) BRVZ(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticleVZ)//" -> "//Trim(NameParticlehh(gt1))//" "//Trim(NameParticleAh(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
If (BRVZ(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = -PDGdeltaRpp 
CurrentPDG2(2) = PDGdeltaRpp 
Write(io_L,201) BRVZ(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticleVZ)//" -> "//Trim(NameParticledeltaRpp)//"^* "//Trim(NameParticledeltaRpp)//" "//")"
End if 
icount = icount +1 
Do gt1= 1, 3
  Do gt2= gt1, 3
If (BRVZ(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFc(gt1) 
CurrentPDG2(2) = PDGFc(gt2) 
Write(io_L,201) BRVZ(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticleVZ)//" -> "//Trim(NameParticleFc(gt1))//" "//Trim(NameParticleFc(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 1, 2
  Do gt2=1, 2
If (BRVZ(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = -PDGFcp(gt1) 
CurrentPDG2(2) = PDGFcp(gt2) 
Write(io_L,201) BRVZ(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticleVZ)//" -> "//Trim(NameParticleFcp(gt1))//"^* "//Trim(NameParticleFcp(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
If (BRVZ(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = -PDGFcpp 
CurrentPDG2(2) = PDGFcpp 
Write(io_L,201) BRVZ(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticleVZ)//" -> "//Trim(NameParticleFcpp)//"^* "//Trim(NameParticleFcpp)//" "//")"
End if 
icount = icount +1 
Do gt1= 1, 3
  Do gt2=1, 3
If (BRVZ(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = -PDGFd(gt1) 
CurrentPDG2(2) = PDGFd(gt2) 
Write(io_L,201) BRVZ(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticleVZ)//" -> "//Trim(NameParticleFd(gt1))//"^* "//Trim(NameParticleFd(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 1, 3
  Do gt2=1, 3
If (BRVZ(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = -PDGFe(gt1) 
CurrentPDG2(2) = PDGFe(gt2) 
Write(io_L,201) BRVZ(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticleVZ)//" -> "//Trim(NameParticleFe(gt1))//"^* "//Trim(NameParticleFe(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 1, 3
  Do gt2=1, 3
If (BRVZ(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = -PDGFu(gt1) 
CurrentPDG2(2) = PDGFu(gt2) 
Write(io_L,201) BRVZ(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticleVZ)//" -> "//Trim(NameParticleFu(gt1))//"^* "//Trim(NameParticleFu(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 1, 6
  Do gt2= gt1, 6
If (BRVZ(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFv(gt1) 
CurrentPDG2(2) = PDGFv(gt2) 
Write(io_L,201) BRVZ(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticleVZ)//" -> "//Trim(NameParticleFv(gt1))//" "//Trim(NameParticleFv(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 1, 3
If (BRVZ(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGhh(gt1) 
CurrentPDG2(2) = PDGVZ 
Write(io_L,201) BRVZ(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticleVZ)//" -> "//Trim(NameParticlehh(gt1))//" "//Trim(NameParticleVZ)//" "//")"
End if 
icount = icount +1 
  End Do 
Do gt1= 1, 3
If (BRVZ(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGhh(gt1) 
CurrentPDG2(2) = PDGVZR 
Write(io_L,201) BRVZ(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticleVZ)//" -> "//Trim(NameParticlehh(gt1))//" "//Trim(NameParticleVZR)//" "//")"
End if 
icount = icount +1 
  End Do 
Do gt1= 3, 3
  Do gt2=3, 3
If (BRVZ(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = -PDGHpm(gt1) 
CurrentPDG2(2) = PDGHpm(gt2) 
Write(io_L,201) BRVZ(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticleVZ)//" -> "//Trim(NameParticleHpm(gt1))//"^* "//Trim(NameParticleHpm(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 3, 3
If (BRVZ(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGHpm(gt1) 
CurrentPDG2(2) = -PDGVWLm 
Write(io_L,201) BRVZ(1,icount)/2._dp,2,CurrentPDG2, & 
 & Trim(NameParticleVZ)//" -> "//Trim(NameParticleHpm(gt1))//" "//Trim(NameParticleVWLm)//"^* "//")"
Write(io_L,201) BRVZ(1,icount)/2._dp,2,-CurrentPDG2, & 
 & Trim(NameParticleVZ)//" -> "//Trim(NameParticleHpm(gt1))//"^* "//Trim(NameParticleVWLm)//" "//")"
End if 
icount = icount +1 
  End Do 
Do gt1= 3, 3
If (BRVZ(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGHpm(gt1) 
CurrentPDG2(2) = -PDGVWRm 
Write(io_L,201) BRVZ(1,icount)/2._dp,2,CurrentPDG2, & 
 & Trim(NameParticleVZ)//" -> "//Trim(NameParticleHpm(gt1))//" "//Trim(NameParticleVWRm)//"^* "//")"
Write(io_L,201) BRVZ(1,icount)/2._dp,2,-CurrentPDG2, & 
 & Trim(NameParticleVZ)//" -> "//Trim(NameParticleHpm(gt1))//"^* "//Trim(NameParticleVWRm)//" "//")"
End if 
icount = icount +1 
  End Do 
If (BRVZ(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGVWLm 
CurrentPDG2(2) = -PDGVWLm 
Write(io_L,201) BRVZ(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticleVZ)//" -> "//Trim(NameParticleVWLm)//" "//Trim(NameParticleVWLm)//"^* "//")"
End if 
icount = icount +1 
If (BRVZ(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGVWLm 
CurrentPDG2(2) = -PDGVWRm 
Write(io_L,201) BRVZ(1,icount)/2._dp,2,CurrentPDG2, & 
 & Trim(NameParticleVZ)//" -> "//Trim(NameParticleVWLm)//" "//Trim(NameParticleVWRm)//"^* "//")"
Write(io_L,201) BRVZ(1,icount)/2._dp,2,-CurrentPDG2, & 
 & Trim(NameParticleVZ)//" -> "//Trim(NameParticleVWLm)//"^* "//Trim(NameParticleVWRm)//" "//")"
End if 
icount = icount +1 
If (BRVZ(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGVWRm 
CurrentPDG2(2) = -PDGVWRm 
Write(io_L,201) BRVZ(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticleVZ)//" -> "//Trim(NameParticleVWRm)//" "//Trim(NameParticleVWRm)//"^* "//")"
End if 
icount = icount +1 
End if 

 
 !-------------------------------
!VZR
!-------------------------------
 
If(gTVZR.gt.MinWidth) Then 
Write(io_L,200) INT(PDGVZR),gTVZR,Trim(NameParticleVZR) 
Write(io_L,100) "#    BR                NDA      ID1      ID2" 
icount = 1 
Do gt1= 1, 3
  Do gt2=3, 3
If (BRVZR(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGhh(gt1) 
CurrentPDG2(2) = PDGAh(gt2) 
Write(io_L,201) BRVZR(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticleVZR)//" -> "//Trim(NameParticlehh(gt1))//" "//Trim(NameParticleAh(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
If (BRVZR(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = -PDGdeltaRpp 
CurrentPDG2(2) = PDGdeltaRpp 
Write(io_L,201) BRVZR(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticleVZR)//" -> "//Trim(NameParticledeltaRpp)//"^* "//Trim(NameParticledeltaRpp)//" "//")"
End if 
icount = icount +1 
Do gt1= 1, 3
  Do gt2= gt1, 3
If (BRVZR(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFc(gt1) 
CurrentPDG2(2) = PDGFc(gt2) 
Write(io_L,201) BRVZR(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticleVZR)//" -> "//Trim(NameParticleFc(gt1))//" "//Trim(NameParticleFc(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 1, 2
  Do gt2=1, 2
If (BRVZR(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = -PDGFcp(gt1) 
CurrentPDG2(2) = PDGFcp(gt2) 
Write(io_L,201) BRVZR(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticleVZR)//" -> "//Trim(NameParticleFcp(gt1))//"^* "//Trim(NameParticleFcp(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
If (BRVZR(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = -PDGFcpp 
CurrentPDG2(2) = PDGFcpp 
Write(io_L,201) BRVZR(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticleVZR)//" -> "//Trim(NameParticleFcpp)//"^* "//Trim(NameParticleFcpp)//" "//")"
End if 
icount = icount +1 
Do gt1= 1, 3
  Do gt2=1, 3
If (BRVZR(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = -PDGFd(gt1) 
CurrentPDG2(2) = PDGFd(gt2) 
Write(io_L,201) BRVZR(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticleVZR)//" -> "//Trim(NameParticleFd(gt1))//"^* "//Trim(NameParticleFd(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 1, 3
  Do gt2=1, 3
If (BRVZR(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = -PDGFe(gt1) 
CurrentPDG2(2) = PDGFe(gt2) 
Write(io_L,201) BRVZR(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticleVZR)//" -> "//Trim(NameParticleFe(gt1))//"^* "//Trim(NameParticleFe(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 1, 3
  Do gt2=1, 3
If (BRVZR(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = -PDGFu(gt1) 
CurrentPDG2(2) = PDGFu(gt2) 
Write(io_L,201) BRVZR(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticleVZR)//" -> "//Trim(NameParticleFu(gt1))//"^* "//Trim(NameParticleFu(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 1, 6
  Do gt2= gt1, 6
If (BRVZR(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFv(gt1) 
CurrentPDG2(2) = PDGFv(gt2) 
Write(io_L,201) BRVZR(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticleVZR)//" -> "//Trim(NameParticleFv(gt1))//" "//Trim(NameParticleFv(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 1, 3
If (BRVZR(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGhh(gt1) 
CurrentPDG2(2) = PDGVZ 
Write(io_L,201) BRVZR(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticleVZR)//" -> "//Trim(NameParticlehh(gt1))//" "//Trim(NameParticleVZ)//" "//")"
End if 
icount = icount +1 
  End Do 
Do gt1= 1, 3
If (BRVZR(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGhh(gt1) 
CurrentPDG2(2) = PDGVZR 
Write(io_L,201) BRVZR(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticleVZR)//" -> "//Trim(NameParticlehh(gt1))//" "//Trim(NameParticleVZR)//" "//")"
End if 
icount = icount +1 
  End Do 
Do gt1= 3, 3
  Do gt2=3, 3
If (BRVZR(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = -PDGHpm(gt1) 
CurrentPDG2(2) = PDGHpm(gt2) 
Write(io_L,201) BRVZR(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticleVZR)//" -> "//Trim(NameParticleHpm(gt1))//"^* "//Trim(NameParticleHpm(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 3, 3
If (BRVZR(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGHpm(gt1) 
CurrentPDG2(2) = -PDGVWLm 
Write(io_L,201) BRVZR(1,icount)/2._dp,2,CurrentPDG2, & 
 & Trim(NameParticleVZR)//" -> "//Trim(NameParticleHpm(gt1))//" "//Trim(NameParticleVWLm)//"^* "//")"
Write(io_L,201) BRVZR(1,icount)/2._dp,2,-CurrentPDG2, & 
 & Trim(NameParticleVZR)//" -> "//Trim(NameParticleHpm(gt1))//"^* "//Trim(NameParticleVWLm)//" "//")"
End if 
icount = icount +1 
  End Do 
Do gt1= 3, 3
If (BRVZR(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGHpm(gt1) 
CurrentPDG2(2) = -PDGVWRm 
Write(io_L,201) BRVZR(1,icount)/2._dp,2,CurrentPDG2, & 
 & Trim(NameParticleVZR)//" -> "//Trim(NameParticleHpm(gt1))//" "//Trim(NameParticleVWRm)//"^* "//")"
Write(io_L,201) BRVZR(1,icount)/2._dp,2,-CurrentPDG2, & 
 & Trim(NameParticleVZR)//" -> "//Trim(NameParticleHpm(gt1))//"^* "//Trim(NameParticleVWRm)//" "//")"
End if 
icount = icount +1 
  End Do 
If (BRVZR(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGVWLm 
CurrentPDG2(2) = -PDGVWLm 
Write(io_L,201) BRVZR(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticleVZR)//" -> "//Trim(NameParticleVWLm)//" "//Trim(NameParticleVWLm)//"^* "//")"
End if 
icount = icount +1 
If (BRVZR(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGVWLm 
CurrentPDG2(2) = -PDGVWRm 
Write(io_L,201) BRVZR(1,icount)/2._dp,2,CurrentPDG2, & 
 & Trim(NameParticleVZR)//" -> "//Trim(NameParticleVWLm)//" "//Trim(NameParticleVWRm)//"^* "//")"
Write(io_L,201) BRVZR(1,icount)/2._dp,2,-CurrentPDG2, & 
 & Trim(NameParticleVZR)//" -> "//Trim(NameParticleVWLm)//"^* "//Trim(NameParticleVWRm)//" "//")"
End if 
icount = icount +1 
If (BRVZR(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGVWRm 
CurrentPDG2(2) = -PDGVWRm 
Write(io_L,201) BRVZR(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticleVZR)//" -> "//Trim(NameParticleVWRm)//" "//Trim(NameParticleVWRm)//"^* "//")"
End if 
icount = icount +1 
End if 

 
 !-------------------------------
!deltaRpp
!-------------------------------
 
If(gTdeltaRpp.gt.MinWidth) Then 
Write(io_L,200) INT(PDGdeltaRpp),gTdeltaRpp,Trim(NameParticledeltaRpp) 
Write(io_L,100) "#    BR                NDA      ID1      ID2" 
icount = 1 
Do gt1= 1, 3
If (BRdeltaRpp(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGhh(gt1) 
CurrentPDG2(2) = PDGdeltaRpp 
Write(io_L,201) BRdeltaRpp(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticledeltaRpp)//" -> "//Trim(NameParticlehh(gt1))//" "//Trim(NameParticledeltaRpp)//" "//")"
End if 
icount = icount +1 
  End Do 
If (BRdeltaRpp(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGdeltaRpp 
CurrentPDG2(2) = PDGVZ 
Write(io_L,201) BRdeltaRpp(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticledeltaRpp)//" -> "//Trim(NameParticledeltaRpp)//" "//Trim(NameParticleVZ)//" "//")"
End if 
icount = icount +1 
If (BRdeltaRpp(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGdeltaRpp 
CurrentPDG2(2) = PDGVZR 
Write(io_L,201) BRdeltaRpp(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticledeltaRpp)//" -> "//Trim(NameParticledeltaRpp)//" "//Trim(NameParticleVZR)//" "//")"
End if 
icount = icount +1 
  Do gt2=1, 3
If (BRdeltaRpp(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFcpp 
CurrentPDG2(2) = PDGFc(gt2) 
Write(io_L,201) BRdeltaRpp(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticledeltaRpp)//" -> "//Trim(NameParticleFcpp)//" "//Trim(NameParticleFc(gt2))//" "//")"
End if 
icount = icount +1 
End Do 
 
Do gt1= 1, 2
  Do gt2= gt1, 2
If (BRdeltaRpp(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFcp(gt1) 
CurrentPDG2(2) = PDGFcp(gt2) 
Write(io_L,201) BRdeltaRpp(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticledeltaRpp)//" -> "//Trim(NameParticleFcp(gt1))//" "//Trim(NameParticleFcp(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 1, 3
  Do gt2= gt1, 3
If (BRdeltaRpp(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFe(gt1) 
CurrentPDG2(2) = PDGFe(gt2) 
Write(io_L,201) BRdeltaRpp(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticledeltaRpp)//" -> "//Trim(NameParticleFe(gt1))//" "//Trim(NameParticleFe(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 3, 3
  Do gt2= gt1, 3
If (BRdeltaRpp(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = -PDGHpm(gt1) 
CurrentPDG2(2) = -PDGHpm(gt2) 
Write(io_L,201) BRdeltaRpp(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticledeltaRpp)//" -> "//Trim(NameParticleHpm(gt1))//"^* "//Trim(NameParticleHpm(gt2))//"^* "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 3, 3
If (BRdeltaRpp(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = -PDGHpm(gt1) 
CurrentPDG2(2) = -PDGVWLm 
Write(io_L,201) BRdeltaRpp(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticledeltaRpp)//" -> "//Trim(NameParticleHpm(gt1))//"^* "//Trim(NameParticleVWLm)//"^* "//")"
End if 
icount = icount +1 
  End Do 
Do gt1= 3, 3
If (BRdeltaRpp(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = -PDGHpm(gt1) 
CurrentPDG2(2) = -PDGVWRm 
Write(io_L,201) BRdeltaRpp(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticledeltaRpp)//" -> "//Trim(NameParticleHpm(gt1))//"^* "//Trim(NameParticleVWRm)//"^* "//")"
End if 
icount = icount +1 
  End Do 
If (BRdeltaRpp(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = -PDGVWLm 
CurrentPDG2(2) = -PDGVWLm 
Write(io_L,201) BRdeltaRpp(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticledeltaRpp)//" -> "//Trim(NameParticleVWLm)//"^* "//Trim(NameParticleVWLm)//"^* "//")"
End if 
icount = icount +1 
If (BRdeltaRpp(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = -PDGVWLm 
CurrentPDG2(2) = -PDGVWRm 
Write(io_L,201) BRdeltaRpp(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticledeltaRpp)//" -> "//Trim(NameParticleVWLm)//"^* "//Trim(NameParticleVWRm)//"^* "//")"
End if 
icount = icount +1 
If (BRdeltaRpp(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = -PDGVWRm 
CurrentPDG2(2) = -PDGVWRm 
Write(io_L,201) BRdeltaRpp(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticledeltaRpp)//" -> "//Trim(NameParticleVWRm)//"^* "//Trim(NameParticleVWRm)//"^* "//")"
End if 
icount = icount +1 
End if 

 
 !-------------------------------
!Hpm
!-------------------------------
 
If(gTHpm(3).gt.MinWidth) Then 
Write(io_L,200) -INT(PDGHpm(3)),gTHpm(3),Trim(NameParticleHpm(3)) 
Write(io_L,100) "#    BR                NDA      ID1      ID2" 
icount = 1 
Do gt1= 3, 3
  Do gt2=3, 3
If (BRHpm(3,icount).Gt.BrMin) Then 
CurrentPDG2(1) = -PDGHpm(gt1) 
CurrentPDG2(2) = PDGAh(gt2) 
Write(io_L,201) BRHpm(3,icount),2,CurrentPDG2, & 
 & Trim(NameParticleHpm(3))//"^* -> "//Trim(NameParticleHpm(gt1))//"^* "//Trim(NameParticleAh(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 3, 3
If (BRHpm(3,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGAh(gt1) 
CurrentPDG2(2) = -PDGVWLm 
Write(io_L,201) BRHpm(3,icount),2,CurrentPDG2, & 
 & Trim(NameParticleHpm(3))//"^* -> "//Trim(NameParticleAh(gt1))//" "//Trim(NameParticleVWLm)//"^* "//")"
End if 
icount = icount +1 
  End Do 
Do gt1= 3, 3
If (BRHpm(3,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGAh(gt1) 
CurrentPDG2(2) = -PDGVWRm 
Write(io_L,201) BRHpm(3,icount),2,CurrentPDG2, & 
 & Trim(NameParticleHpm(3))//"^* -> "//Trim(NameParticleAh(gt1))//" "//Trim(NameParticleVWRm)//"^* "//")"
End if 
icount = icount +1 
  End Do 
Do gt1= 1, 2
  Do gt2=1, 3
If (BRHpm(3,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFcp(gt1) 
CurrentPDG2(2) = PDGFc(gt2) 
Write(io_L,201) BRHpm(3,icount),2,CurrentPDG2, & 
 & Trim(NameParticleHpm(3))//"^* -> "//Trim(NameParticleFcp(gt1))//" "//Trim(NameParticleFc(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
  Do gt2=1, 2
If (BRHpm(3,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFcpp 
CurrentPDG2(2) = -PDGFcp(gt2) 
Write(io_L,201) BRHpm(3,icount),2,CurrentPDG2, & 
 & Trim(NameParticleHpm(3))//"^* -> "//Trim(NameParticleFcpp)//" "//Trim(NameParticleFcp(gt2))//"^* "//")"
End if 
icount = icount +1 
End Do 
 
Do gt1= 1, 3
  Do gt2=1, 3
If (BRHpm(3,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFu(gt1) 
CurrentPDG2(2) = -PDGFd(gt2) 
Write(io_L,201) BRHpm(3,icount),2,CurrentPDG2, & 
 & Trim(NameParticleHpm(3))//"^* -> "//Trim(NameParticleFu(gt1))//" "//Trim(NameParticleFd(gt2))//"^* "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 1, 3
  Do gt2=1, 6
If (BRHpm(3,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFe(gt1) 
CurrentPDG2(2) = PDGFv(gt2) 
Write(io_L,201) BRHpm(3,icount),2,CurrentPDG2, & 
 & Trim(NameParticleHpm(3))//"^* -> "//Trim(NameParticleFe(gt1))//" "//Trim(NameParticleFv(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 3, 3
  Do gt2=1, 3
If (BRHpm(3,icount).Gt.BrMin) Then 
CurrentPDG2(1) = -PDGHpm(gt1) 
CurrentPDG2(2) = PDGhh(gt2) 
Write(io_L,201) BRHpm(3,icount),2,CurrentPDG2, & 
 & Trim(NameParticleHpm(3))//"^* -> "//Trim(NameParticleHpm(gt1))//"^* "//Trim(NameParticlehh(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 1, 3
If (BRHpm(3,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGhh(gt1) 
CurrentPDG2(2) = -PDGVWLm 
Write(io_L,201) BRHpm(3,icount),2,CurrentPDG2, & 
 & Trim(NameParticleHpm(3))//"^* -> "//Trim(NameParticlehh(gt1))//" "//Trim(NameParticleVWLm)//"^* "//")"
End if 
icount = icount +1 
  End Do 
Do gt1= 1, 3
If (BRHpm(3,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGhh(gt1) 
CurrentPDG2(2) = -PDGVWRm 
Write(io_L,201) BRHpm(3,icount),2,CurrentPDG2, & 
 & Trim(NameParticleHpm(3))//"^* -> "//Trim(NameParticlehh(gt1))//" "//Trim(NameParticleVWRm)//"^* "//")"
End if 
icount = icount +1 
  End Do 
Do gt1= 3, 3
If (BRHpm(3,icount).Gt.BrMin) Then 
CurrentPDG2(1) = -PDGHpm(gt1) 
CurrentPDG2(2) = PDGVZ 
Write(io_L,201) BRHpm(3,icount),2,CurrentPDG2, & 
 & Trim(NameParticleHpm(3))//"^* -> "//Trim(NameParticleHpm(gt1))//"^* "//Trim(NameParticleVZ)//" "//")"
End if 
icount = icount +1 
  End Do 
Do gt1= 3, 3
If (BRHpm(3,icount).Gt.BrMin) Then 
CurrentPDG2(1) = -PDGHpm(gt1) 
CurrentPDG2(2) = PDGVZR 
Write(io_L,201) BRHpm(3,icount),2,CurrentPDG2, & 
 & Trim(NameParticleHpm(3))//"^* -> "//Trim(NameParticleHpm(gt1))//"^* "//Trim(NameParticleVZR)//" "//")"
End if 
icount = icount +1 
  End Do 
If (BRHpm(3,icount).Gt.BrMin) Then 
CurrentPDG2(1) = -PDGVWLm 
CurrentPDG2(2) = PDGVZ 
Write(io_L,201) BRHpm(3,icount),2,CurrentPDG2, & 
 & Trim(NameParticleHpm(3))//"^* -> "//Trim(NameParticleVWLm)//"^* "//Trim(NameParticleVZ)//" "//")"
End if 
icount = icount +1 
If (BRHpm(3,icount).Gt.BrMin) Then 
CurrentPDG2(1) = -PDGVWLm 
CurrentPDG2(2) = PDGVZR 
Write(io_L,201) BRHpm(3,icount),2,CurrentPDG2, & 
 & Trim(NameParticleHpm(3))//"^* -> "//Trim(NameParticleVWLm)//"^* "//Trim(NameParticleVZR)//" "//")"
End if 
icount = icount +1 
If (BRHpm(3,icount).Gt.BrMin) Then 
CurrentPDG2(1) = -PDGVWRm 
CurrentPDG2(2) = PDGVZ 
Write(io_L,201) BRHpm(3,icount),2,CurrentPDG2, & 
 & Trim(NameParticleHpm(3))//"^* -> "//Trim(NameParticleVWRm)//"^* "//Trim(NameParticleVZ)//" "//")"
End if 
icount = icount +1 
If (BRHpm(3,icount).Gt.BrMin) Then 
CurrentPDG2(1) = -PDGVWRm 
CurrentPDG2(2) = PDGVZR 
Write(io_L,201) BRHpm(3,icount),2,CurrentPDG2, & 
 & Trim(NameParticleHpm(3))//"^* -> "//Trim(NameParticleVWRm)//"^* "//Trim(NameParticleVZR)//" "//")"
End if 
icount = icount +1 
Do gt1= 3, 3
If (BRHpm(3,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGHpm(gt1) 
CurrentPDG2(2) = PDGdeltaRpp 
Write(io_L,201) BRHpm(3,icount),2,CurrentPDG2, & 
 & Trim(NameParticleHpm(3))//"^* -> "//Trim(NameParticleHpm(gt1))//" "//Trim(NameParticledeltaRpp)//" "//")"
End if 
icount = icount +1 
  End Do 
If (BRHpm(3,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGdeltaRpp 
CurrentPDG2(2) = PDGVWLm 
Write(io_L,201) BRHpm(3,icount),2,CurrentPDG2, & 
 & Trim(NameParticleHpm(3))//"^* -> "//Trim(NameParticledeltaRpp)//" "//Trim(NameParticleVWLm)//" "//")"
End if 
icount = icount +1 
If (BRHpm(3,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGdeltaRpp 
CurrentPDG2(2) = PDGVWRm 
Write(io_L,201) BRHpm(3,icount),2,CurrentPDG2, & 
 & Trim(NameParticleHpm(3))//"^* -> "//Trim(NameParticledeltaRpp)//" "//Trim(NameParticleVWRm)//" "//")"
End if 
icount = icount +1 
End if 

 
 !-------------------------------
!Ah
!-------------------------------
 
If(gTAh(3).gt.MinWidth) Then 
Write(io_L,200) INT(PDGAh(3)),gTAh(3),Trim(NameParticleAh(3)) 
Write(io_L,100) "#    BR                NDA      ID1      ID2" 
icount = 1 
If (BRAh(3,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGVP 
CurrentPDG2(2) = PDGVP 
Write(io_L,201) BRAh(3,icount),2,CurrentPDG2, & 
 & Trim(NameParticleAh(3))//" -> "//Trim(NameParticleVP)//" "//Trim(NameParticleVP)//" "//")"
End if 
icount = icount +1 
If (BRAh(3,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGVG 
CurrentPDG2(2) = PDGVG 
Write(io_L,201) BRAh(3,icount),2,CurrentPDG2, & 
 & Trim(NameParticleAh(3))//" -> "//Trim(NameParticleVG)//" "//Trim(NameParticleVG)//" "//")"
End if 
icount = icount +1 
Do gt1= 1, 3
  Do gt2=3, 3
If (BRAh(3,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGhh(gt1) 
CurrentPDG2(2) = PDGAh(gt2) 
Write(io_L,201) BRAh(3,icount),2,CurrentPDG2, & 
 & Trim(NameParticleAh(3))//" -> "//Trim(NameParticlehh(gt1))//" "//Trim(NameParticleAh(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 1, 3
  Do gt2= gt1, 3
If (BRAh(3,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFc(gt1) 
CurrentPDG2(2) = PDGFc(gt2) 
Write(io_L,201) BRAh(3,icount),2,CurrentPDG2, & 
 & Trim(NameParticleAh(3))//" -> "//Trim(NameParticleFc(gt1))//" "//Trim(NameParticleFc(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 1, 2
  Do gt2=1, 2
If (BRAh(3,icount).Gt.BrMin) Then 
CurrentPDG2(1) = -PDGFcp(gt1) 
CurrentPDG2(2) = PDGFcp(gt2) 
Write(io_L,201) BRAh(3,icount),2,CurrentPDG2, & 
 & Trim(NameParticleAh(3))//" -> "//Trim(NameParticleFcp(gt1))//"^* "//Trim(NameParticleFcp(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 1, 3
  Do gt2=1, 3
If (BRAh(3,icount).Gt.BrMin) Then 
CurrentPDG2(1) = -PDGFd(gt1) 
CurrentPDG2(2) = PDGFd(gt2) 
Write(io_L,201) BRAh(3,icount),2,CurrentPDG2, & 
 & Trim(NameParticleAh(3))//" -> "//Trim(NameParticleFd(gt1))//"^* "//Trim(NameParticleFd(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 1, 3
  Do gt2=1, 3
If (BRAh(3,icount).Gt.BrMin) Then 
CurrentPDG2(1) = -PDGFe(gt1) 
CurrentPDG2(2) = PDGFe(gt2) 
Write(io_L,201) BRAh(3,icount),2,CurrentPDG2, & 
 & Trim(NameParticleAh(3))//" -> "//Trim(NameParticleFe(gt1))//"^* "//Trim(NameParticleFe(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 1, 3
  Do gt2=1, 3
If (BRAh(3,icount).Gt.BrMin) Then 
CurrentPDG2(1) = -PDGFu(gt1) 
CurrentPDG2(2) = PDGFu(gt2) 
Write(io_L,201) BRAh(3,icount),2,CurrentPDG2, & 
 & Trim(NameParticleAh(3))//" -> "//Trim(NameParticleFu(gt1))//"^* "//Trim(NameParticleFu(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 1, 6
  Do gt2= gt1, 6
If (BRAh(3,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFv(gt1) 
CurrentPDG2(2) = PDGFv(gt2) 
Write(io_L,201) BRAh(3,icount),2,CurrentPDG2, & 
 & Trim(NameParticleAh(3))//" -> "//Trim(NameParticleFv(gt1))//" "//Trim(NameParticleFv(gt2))//" "//")"
If (((gTFv(gt1).le.WidthToBeInvisible).and.(gTFv(gt2).le.WidthToBeInvisible)).OR. & 
 & ((WidthToBeInvisible.le.-1._dp).And.(CurrentPDG2(1).eq.PDGLSP(1)).And.(CurrentPDG2(2).eq.PDGLSP(1)))) Then 
  BRinvA(3) = BRinvA(3)+BRAh(3,icount) 
End if 
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 1, 3
If (BRAh(3,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGhh(gt1) 
CurrentPDG2(2) = PDGVZ 
Write(io_L,201) BRAh(3,icount),2,CurrentPDG2, & 
 & Trim(NameParticleAh(3))//" -> "//Trim(NameParticlehh(gt1))//" "//Trim(NameParticleVZ)//" "//")"
End if 
icount = icount +1 
  End Do 
Do gt1= 1, 3
If (BRAh(3,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGhh(gt1) 
CurrentPDG2(2) = PDGVZR 
Write(io_L,201) BRAh(3,icount),2,CurrentPDG2, & 
 & Trim(NameParticleAh(3))//" -> "//Trim(NameParticlehh(gt1))//" "//Trim(NameParticleVZR)//" "//")"
End if 
icount = icount +1 
  End Do 
Do gt1= 3, 3
  Do gt2=3, 3
If (BRAh(3,icount).Gt.BrMin) Then 
CurrentPDG2(1) = -PDGHpm(gt1) 
CurrentPDG2(2) = PDGHpm(gt2) 
Write(io_L,201) BRAh(3,icount),2,CurrentPDG2, & 
 & Trim(NameParticleAh(3))//" -> "//Trim(NameParticleHpm(gt1))//"^* "//Trim(NameParticleHpm(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 3, 3
If (BRAh(3,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGHpm(gt1) 
CurrentPDG2(2) = -PDGVWLm 
Write(io_L,201) BRAh(3,icount)/2._dp,2,CurrentPDG2, & 
 & Trim(NameParticleAh(3))//" -> "//Trim(NameParticleHpm(gt1))//" "//Trim(NameParticleVWLm)//"^* "//")"
Write(io_L,201) BRAh(3,icount)/2._dp,2,-CurrentPDG2, & 
 & Trim(NameParticleAh(3))//" -> "//Trim(NameParticleHpm(gt1))//"^* "//Trim(NameParticleVWLm)//" "//")"
End if 
icount = icount +1 
  End Do 
Do gt1= 3, 3
If (BRAh(3,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGHpm(gt1) 
CurrentPDG2(2) = -PDGVWRm 
Write(io_L,201) BRAh(3,icount)/2._dp,2,CurrentPDG2, & 
 & Trim(NameParticleAh(3))//" -> "//Trim(NameParticleHpm(gt1))//" "//Trim(NameParticleVWRm)//"^* "//")"
Write(io_L,201) BRAh(3,icount)/2._dp,2,-CurrentPDG2, & 
 & Trim(NameParticleAh(3))//" -> "//Trim(NameParticleHpm(gt1))//"^* "//Trim(NameParticleVWRm)//" "//")"
End if 
icount = icount +1 
  End Do 
If (BRAh(3,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGVWLm 
CurrentPDG2(2) = -PDGVWRm 
Write(io_L,201) BRAh(3,icount)/2._dp,2,CurrentPDG2, & 
 & Trim(NameParticleAh(3))//" -> "//Trim(NameParticleVWLm)//" "//Trim(NameParticleVWRm)//"^* "//")"
Write(io_L,201) BRAh(3,icount)/2._dp,2,-CurrentPDG2, & 
 & Trim(NameParticleAh(3))//" -> "//Trim(NameParticleVWLm)//"^* "//Trim(NameParticleVWRm)//" "//")"
End if 
icount = icount +1 
End if 

 
 !-------------------------------
!VWLm
!-------------------------------
 
If(gTVWLm.gt.MinWidth) Then 
Write(io_L,200) -INT(PDGVWLm),gTVWLm,Trim(NameParticleVWLm) 
Write(io_L,100) "#    BR                NDA      ID1      ID2" 
icount = 1 
Do gt1= 3, 3
  Do gt2=3, 3
If (BRVWLm(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = -PDGHpm(gt1) 
CurrentPDG2(2) = PDGAh(gt2) 
Write(io_L,201) BRVWLm(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticleVWLm)//"^* -> "//Trim(NameParticleHpm(gt1))//"^* "//Trim(NameParticleAh(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 3, 3
If (BRVWLm(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGAh(gt1) 
CurrentPDG2(2) = -PDGVWRm 
Write(io_L,201) BRVWLm(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticleVWLm)//"^* -> "//Trim(NameParticleAh(gt1))//" "//Trim(NameParticleVWRm)//"^* "//")"
End if 
icount = icount +1 
  End Do 
Do gt1= 1, 2
  Do gt2=1, 3
If (BRVWLm(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFcp(gt1) 
CurrentPDG2(2) = PDGFc(gt2) 
Write(io_L,201) BRVWLm(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticleVWLm)//"^* -> "//Trim(NameParticleFcp(gt1))//" "//Trim(NameParticleFc(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
  Do gt2=1, 2
If (BRVWLm(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFcpp 
CurrentPDG2(2) = -PDGFcp(gt2) 
Write(io_L,201) BRVWLm(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticleVWLm)//"^* -> "//Trim(NameParticleFcpp)//" "//Trim(NameParticleFcp(gt2))//"^* "//")"
End if 
icount = icount +1 
End Do 
 
Do gt1= 1, 3
  Do gt2=1, 3
If (BRVWLm(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFu(gt1) 
CurrentPDG2(2) = -PDGFd(gt2) 
Write(io_L,201) BRVWLm(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticleVWLm)//"^* -> "//Trim(NameParticleFu(gt1))//" "//Trim(NameParticleFd(gt2))//"^* "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 1, 3
  Do gt2=1, 6
If (BRVWLm(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGFe(gt1) 
CurrentPDG2(2) = PDGFv(gt2) 
Write(io_L,201) BRVWLm(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticleVWLm)//"^* -> "//Trim(NameParticleFe(gt1))//" "//Trim(NameParticleFv(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 3, 3
  Do gt2=1, 3
If (BRVWLm(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = -PDGHpm(gt1) 
CurrentPDG2(2) = PDGhh(gt2) 
Write(io_L,201) BRVWLm(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticleVWLm)//"^* -> "//Trim(NameParticleHpm(gt1))//"^* "//Trim(NameParticlehh(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 1, 3
If (BRVWLm(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGhh(gt1) 
CurrentPDG2(2) = -PDGVWLm 
Write(io_L,201) BRVWLm(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticleVWLm)//"^* -> "//Trim(NameParticlehh(gt1))//" "//Trim(NameParticleVWLm)//"^* "//")"
End if 
icount = icount +1 
  End Do 
Do gt1= 1, 3
If (BRVWLm(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGhh(gt1) 
CurrentPDG2(2) = -PDGVWRm 
Write(io_L,201) BRVWLm(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticleVWLm)//"^* -> "//Trim(NameParticlehh(gt1))//" "//Trim(NameParticleVWRm)//"^* "//")"
End if 
icount = icount +1 
  End Do 
Do gt1= 3, 3
If (BRVWLm(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = -PDGHpm(gt1) 
CurrentPDG2(2) = PDGVZ 
Write(io_L,201) BRVWLm(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticleVWLm)//"^* -> "//Trim(NameParticleHpm(gt1))//"^* "//Trim(NameParticleVZ)//" "//")"
End if 
icount = icount +1 
  End Do 
Do gt1= 3, 3
If (BRVWLm(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = -PDGHpm(gt1) 
CurrentPDG2(2) = PDGVZR 
Write(io_L,201) BRVWLm(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticleVWLm)//"^* -> "//Trim(NameParticleHpm(gt1))//"^* "//Trim(NameParticleVZR)//" "//")"
End if 
icount = icount +1 
  End Do 
If (BRVWLm(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = -PDGVWLm 
CurrentPDG2(2) = PDGVZ 
Write(io_L,201) BRVWLm(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticleVWLm)//"^* -> "//Trim(NameParticleVWLm)//"^* "//Trim(NameParticleVZ)//" "//")"
End if 
icount = icount +1 
If (BRVWLm(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = -PDGVWLm 
CurrentPDG2(2) = PDGVZR 
Write(io_L,201) BRVWLm(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticleVWLm)//"^* -> "//Trim(NameParticleVWLm)//"^* "//Trim(NameParticleVZR)//" "//")"
End if 
icount = icount +1 
If (BRVWLm(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = -PDGVWRm 
CurrentPDG2(2) = PDGVZ 
Write(io_L,201) BRVWLm(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticleVWLm)//"^* -> "//Trim(NameParticleVWRm)//"^* "//Trim(NameParticleVZ)//" "//")"
End if 
icount = icount +1 
If (BRVWLm(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = -PDGVWRm 
CurrentPDG2(2) = PDGVZR 
Write(io_L,201) BRVWLm(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticleVWLm)//"^* -> "//Trim(NameParticleVWRm)//"^* "//Trim(NameParticleVZR)//" "//")"
End if 
icount = icount +1 
Do gt1= 3, 3
If (BRVWLm(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGHpm(gt1) 
CurrentPDG2(2) = PDGdeltaRpp 
Write(io_L,201) BRVWLm(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticleVWLm)//"^* -> "//Trim(NameParticleHpm(gt1))//" "//Trim(NameParticledeltaRpp)//" "//")"
End if 
icount = icount +1 
  End Do 
If (BRVWLm(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGdeltaRpp 
CurrentPDG2(2) = PDGVWLm 
Write(io_L,201) BRVWLm(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticleVWLm)//"^* -> "//Trim(NameParticledeltaRpp)//" "//Trim(NameParticleVWLm)//" "//")"
End if 
icount = icount +1 
If (BRVWLm(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGdeltaRpp 
CurrentPDG2(2) = PDGVWRm 
Write(io_L,201) BRVWLm(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticleVWLm)//"^* -> "//Trim(NameParticledeltaRpp)//" "//Trim(NameParticleVWRm)//" "//")"
End if 
icount = icount +1 
End if 

 
 !-------------------------------
!VWRm
!-------------------------------
 
If(gTVWRm.gt.MinWidth) Then 
Write(io_L,200) INT(PDGVWRm),gTVWRm,Trim(NameParticleVWRm) 
Write(io_L,100) "#    BR                NDA      ID1      ID2" 
icount = 1 
Do gt1= 3, 3
  Do gt2=3, 3
If (BRVWRm(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGHpm(gt1) 
CurrentPDG2(2) = PDGAh(gt2) 
Write(io_L,201) BRVWRm(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticleVWRm)//" -> "//Trim(NameParticleHpm(gt1))//" "//Trim(NameParticleAh(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 3, 3
If (BRVWRm(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGAh(gt1) 
CurrentPDG2(2) = PDGVWLm 
Write(io_L,201) BRVWRm(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticleVWRm)//" -> "//Trim(NameParticleAh(gt1))//" "//Trim(NameParticleVWLm)//" "//")"
End if 
icount = icount +1 
  End Do 
Do gt1= 1, 2
  Do gt2=1, 3
If (BRVWRm(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = -PDGFcp(gt1) 
CurrentPDG2(2) = PDGFc(gt2) 
Write(io_L,201) BRVWRm(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticleVWRm)//" -> "//Trim(NameParticleFcp(gt1))//"^* "//Trim(NameParticleFc(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
  Do gt2=1, 2
If (BRVWRm(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = -PDGFcpp 
CurrentPDG2(2) = PDGFcp(gt2) 
Write(io_L,201) BRVWRm(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticleVWRm)//" -> "//Trim(NameParticleFcpp)//"^* "//Trim(NameParticleFcp(gt2))//" "//")"
End if 
icount = icount +1 
End Do 
 
Do gt1= 1, 3
  Do gt2=1, 3
If (BRVWRm(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = -PDGFu(gt1) 
CurrentPDG2(2) = PDGFd(gt2) 
Write(io_L,201) BRVWRm(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticleVWRm)//" -> "//Trim(NameParticleFu(gt1))//"^* "//Trim(NameParticleFd(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 1, 3
  Do gt2=1, 6
If (BRVWRm(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = -PDGFe(gt1) 
CurrentPDG2(2) = PDGFv(gt2) 
Write(io_L,201) BRVWRm(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticleVWRm)//" -> "//Trim(NameParticleFe(gt1))//"^* "//Trim(NameParticleFv(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 3, 3
  Do gt2=1, 3
If (BRVWRm(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGHpm(gt1) 
CurrentPDG2(2) = PDGhh(gt2) 
Write(io_L,201) BRVWRm(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticleVWRm)//" -> "//Trim(NameParticleHpm(gt1))//" "//Trim(NameParticlehh(gt2))//" "//")"
End if 
icount = icount +1 
  End Do 
End Do 
 
Do gt1= 1, 3
If (BRVWRm(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGhh(gt1) 
CurrentPDG2(2) = PDGVWLm 
Write(io_L,201) BRVWRm(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticleVWRm)//" -> "//Trim(NameParticlehh(gt1))//" "//Trim(NameParticleVWLm)//" "//")"
End if 
icount = icount +1 
  End Do 
Do gt1= 1, 3
If (BRVWRm(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGhh(gt1) 
CurrentPDG2(2) = PDGVWRm 
Write(io_L,201) BRVWRm(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticleVWRm)//" -> "//Trim(NameParticlehh(gt1))//" "//Trim(NameParticleVWRm)//" "//")"
End if 
icount = icount +1 
  End Do 
Do gt1= 3, 3
If (BRVWRm(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGHpm(gt1) 
CurrentPDG2(2) = PDGVZ 
Write(io_L,201) BRVWRm(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticleVWRm)//" -> "//Trim(NameParticleHpm(gt1))//" "//Trim(NameParticleVZ)//" "//")"
End if 
icount = icount +1 
  End Do 
Do gt1= 3, 3
If (BRVWRm(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGHpm(gt1) 
CurrentPDG2(2) = PDGVZR 
Write(io_L,201) BRVWRm(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticleVWRm)//" -> "//Trim(NameParticleHpm(gt1))//" "//Trim(NameParticleVZR)//" "//")"
End if 
icount = icount +1 
  End Do 
If (BRVWRm(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGVWLm 
CurrentPDG2(2) = PDGVZ 
Write(io_L,201) BRVWRm(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticleVWRm)//" -> "//Trim(NameParticleVWLm)//" "//Trim(NameParticleVZ)//" "//")"
End if 
icount = icount +1 
If (BRVWRm(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGVWLm 
CurrentPDG2(2) = PDGVZR 
Write(io_L,201) BRVWRm(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticleVWRm)//" -> "//Trim(NameParticleVWLm)//" "//Trim(NameParticleVZR)//" "//")"
End if 
icount = icount +1 
If (BRVWRm(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGVWRm 
CurrentPDG2(2) = PDGVZ 
Write(io_L,201) BRVWRm(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticleVWRm)//" -> "//Trim(NameParticleVWRm)//" "//Trim(NameParticleVZ)//" "//")"
End if 
icount = icount +1 
If (BRVWRm(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = PDGVWRm 
CurrentPDG2(2) = PDGVZR 
Write(io_L,201) BRVWRm(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticleVWRm)//" -> "//Trim(NameParticleVWRm)//" "//Trim(NameParticleVZR)//" "//")"
End if 
icount = icount +1 
Do gt1= 3, 3
If (BRVWRm(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = -PDGHpm(gt1) 
CurrentPDG2(2) = -PDGdeltaRpp 
Write(io_L,201) BRVWRm(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticleVWRm)//" -> "//Trim(NameParticleHpm(gt1))//"^* "//Trim(NameParticledeltaRpp)//"^* "//")"
End if 
icount = icount +1 
  End Do 
If (BRVWRm(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = -PDGdeltaRpp 
CurrentPDG2(2) = -PDGVWLm 
Write(io_L,201) BRVWRm(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticleVWRm)//" -> "//Trim(NameParticledeltaRpp)//"^* "//Trim(NameParticleVWLm)//"^* "//")"
End if 
icount = icount +1 
If (BRVWRm(1,icount).Gt.BrMin) Then 
CurrentPDG2(1) = -PDGdeltaRpp 
CurrentPDG2(2) = -PDGVWRm 
Write(io_L,201) BRVWRm(1,icount),2,CurrentPDG2, & 
 & Trim(NameParticleVWRm)//" -> "//Trim(NameParticledeltaRpp)//"^* "//Trim(NameParticleVWRm)//"^* "//")"
End if 
icount = icount +1 
End if 
99 Format(1x,i5,3x,a) 
100 Format(a) 
101 Format(2x,i3,2x,1P,e16.8,2x,a) 
1010 Format(2x,i6,2x,1P,e16.8,2x,a) 
102 Format(1x,i9,3x,1P,e16.8,2x,a) 
103 Format(a13,1P,e16.8,2x,a) 
104 Format(i4,2x,1P,e16.8,2x,a) 
105 Format(1x,2i3,3x,1P,e16.8,3x,a) 
106 Format(a,1P,e16.8,2x,a) 
107 Format(2i3,3x,1P,e16.8,3x,a) 
127 Format(3i3,3x,1P,e16.8,3x,a) 
117 Format(i3,i8,3x,1P,e16.8,3x,a) 
118 Format(i3,i10,3x,1P,a) 
119 Format(i3,i10,3x,1P,3x,e16.8,a) 
120 Format(i3,i10,3x,1P,3x,e16.8,a,i2,a,i2,a) 
121 Format(i10,3x,i10,3x,i10,3x,e16.8,a) 
122 Format(i10,i10,3x,1P,3x,e16.8,a,i2,a,i2,a) 
108 Format(9x,1P,E16.8,0P,3x,a) 
109 Format(1x,3i3,3x,1P,e16.8,3x,a) 
110 Format(3x,2i3,3x,"# ",a) 
200 Format("DECAY",1x,I9,3x,1P,E16.8,0P,3x,"# ",a) 
201 Format(3x,1P,e16.8,0p,3x,I2,3x,2(i10,1x),2x,"# BR(",a) 
202 Format(3x,1P,e16.8,0p,3x,I2,3x,3(i10,1x),2x,"# BR(",a) 
222 Format(1x,a8,1x,a4,3x,a2,3x,a1,3x,E16.8,3x,a) 
4711 Format(3x,1P,e16.8,0p,3x,I2,3x,2(i10,1x),2x," # ",A)
4712 Format("XS 11 -11 ",F7.1," ",F5.2," ",F5.2," ",A)

5410 Format(a25,1p,e16.7) 
5411 Format(a25,1p,"(",e16.7,",",e16.7,")") 
1101 Format(1P,2x,e16.8,2x,e16.8,0P,5x,i4,5x,3i10,a) 
1102 Format(1P,2x,e16.8,0P,5x,i4,5x,3i10,a) 
1103 Format(1P,2x,e16.8,0P,5x,i4,5x,4i10,a) 
End Subroutine LesHouches_Out 
 
 
Subroutine WriteWHIZARD 
   Open(123,file="WHIZARD.par.tripletLR",status="unknown")
Write(123,*) "# Couplings and VEVs" 
 
Write(123,*) "" 
Write(123,*) "gBL= ",gBL
Write(123,*) "gR= ",gR
Write(123,*) "RHO2= ",RHO2
Write(123,*) "RHO1= ",RHO1
Write(123,*) "ALP1= ",ALP1
Write(123,*) "LAM1= ",LAM1
Write(123,*) "ALP3= ",ALP3
Write(123,*) "ALP2= ",ALP2
Write(123,*) "LAM4= ",LAM4
Write(123,*) "LAM2= ",LAM2
Write(123,*) "LAM3= ",LAM3
Write(123,*) "LAMT1= ",LAMT1
Write(123,*) "YDR11_r= ",Real(YDR(1,1),dp)
Write(123,*) "YDR12_r= ",Real(YDR(1,2),dp)
Write(123,*) "YDR13_r= ",Real(YDR(1,3),dp)
Write(123,*) "YDR21_r= ",Real(YDR(2,1),dp)
Write(123,*) "YDR22_r= ",Real(YDR(2,2),dp)
Write(123,*) "YDR23_r= ",Real(YDR(2,3),dp)
Write(123,*) "YDR31_r= ",Real(YDR(3,1),dp)
Write(123,*) "YDR32_r= ",Real(YDR(3,2),dp)
Write(123,*) "YDR33_r= ",Real(YDR(3,3),dp)
Write(123,*) "YDR11_i= ",AImag(YDR(1,1))
Write(123,*) "YDR12_i= ",AImag(YDR(1,2))
Write(123,*) "YDR13_i= ",AImag(YDR(1,3))
Write(123,*) "YDR21_i= ",AImag(YDR(2,1))
Write(123,*) "YDR22_i= ",AImag(YDR(2,2))
Write(123,*) "YDR23_i= ",AImag(YDR(2,3))
Write(123,*) "YDR31_i= ",AImag(YDR(3,1))
Write(123,*) "YDR32_i= ",AImag(YDR(3,2))
Write(123,*) "YDR33_i= ",AImag(YDR(3,3))
Write(123,*) "YL111_r= ",Real(YL1(1,1),dp)
Write(123,*) "YL112_r= ",Real(YL1(1,2),dp)
Write(123,*) "YL113_r= ",Real(YL1(1,3),dp)
Write(123,*) "YL121_r= ",Real(YL1(2,1),dp)
Write(123,*) "YL122_r= ",Real(YL1(2,2),dp)
Write(123,*) "YL123_r= ",Real(YL1(2,3),dp)
Write(123,*) "YL131_r= ",Real(YL1(3,1),dp)
Write(123,*) "YL132_r= ",Real(YL1(3,2),dp)
Write(123,*) "YL133_r= ",Real(YL1(3,3),dp)
Write(123,*) "YL111_i= ",AImag(YL1(1,1))
Write(123,*) "YL112_i= ",AImag(YL1(1,2))
Write(123,*) "YL113_i= ",AImag(YL1(1,3))
Write(123,*) "YL121_i= ",AImag(YL1(2,1))
Write(123,*) "YL122_i= ",AImag(YL1(2,2))
Write(123,*) "YL123_i= ",AImag(YL1(2,3))
Write(123,*) "YL131_i= ",AImag(YL1(3,1))
Write(123,*) "YL132_i= ",AImag(YL1(3,2))
Write(123,*) "YL133_i= ",AImag(YL1(3,3))
Write(123,*) "YQ111_r= ",Real(YQ1(1,1),dp)
Write(123,*) "YQ112_r= ",Real(YQ1(1,2),dp)
Write(123,*) "YQ113_r= ",Real(YQ1(1,3),dp)
Write(123,*) "YQ121_r= ",Real(YQ1(2,1),dp)
Write(123,*) "YQ122_r= ",Real(YQ1(2,2),dp)
Write(123,*) "YQ123_r= ",Real(YQ1(2,3),dp)
Write(123,*) "YQ131_r= ",Real(YQ1(3,1),dp)
Write(123,*) "YQ132_r= ",Real(YQ1(3,2),dp)
Write(123,*) "YQ133_r= ",Real(YQ1(3,3),dp)
Write(123,*) "YQ111_i= ",AImag(YQ1(1,1))
Write(123,*) "YQ112_i= ",AImag(YQ1(1,2))
Write(123,*) "YQ113_i= ",AImag(YQ1(1,3))
Write(123,*) "YQ121_i= ",AImag(YQ1(2,1))
Write(123,*) "YQ122_i= ",AImag(YQ1(2,2))
Write(123,*) "YQ123_i= ",AImag(YQ1(2,3))
Write(123,*) "YQ131_i= ",AImag(YQ1(3,1))
Write(123,*) "YQ132_i= ",AImag(YQ1(3,2))
Write(123,*) "YQ133_i= ",AImag(YQ1(3,3))
Write(123,*) "LAMT2= ",LAMT2
Write(123,*) "YL211_r= ",Real(YL2(1,1),dp)
Write(123,*) "YL212_r= ",Real(YL2(1,2),dp)
Write(123,*) "YL213_r= ",Real(YL2(1,3),dp)
Write(123,*) "YL221_r= ",Real(YL2(2,1),dp)
Write(123,*) "YL222_r= ",Real(YL2(2,2),dp)
Write(123,*) "YL223_r= ",Real(YL2(2,3),dp)
Write(123,*) "YL231_r= ",Real(YL2(3,1),dp)
Write(123,*) "YL232_r= ",Real(YL2(3,2),dp)
Write(123,*) "YL233_r= ",Real(YL2(3,3),dp)
Write(123,*) "YL211_i= ",AImag(YL2(1,1))
Write(123,*) "YL212_i= ",AImag(YL2(1,2))
Write(123,*) "YL213_i= ",AImag(YL2(1,3))
Write(123,*) "YL221_i= ",AImag(YL2(2,1))
Write(123,*) "YL222_i= ",AImag(YL2(2,2))
Write(123,*) "YL223_i= ",AImag(YL2(2,3))
Write(123,*) "YL231_i= ",AImag(YL2(3,1))
Write(123,*) "YL232_i= ",AImag(YL2(3,2))
Write(123,*) "YL233_i= ",AImag(YL2(3,3))
Write(123,*) "YQ211_r= ",Real(YQ2(1,1),dp)
Write(123,*) "YQ212_r= ",Real(YQ2(1,2),dp)
Write(123,*) "YQ213_r= ",Real(YQ2(1,3),dp)
Write(123,*) "YQ221_r= ",Real(YQ2(2,1),dp)
Write(123,*) "YQ222_r= ",Real(YQ2(2,2),dp)
Write(123,*) "YQ223_r= ",Real(YQ2(2,3),dp)
Write(123,*) "YQ231_r= ",Real(YQ2(3,1),dp)
Write(123,*) "YQ232_r= ",Real(YQ2(3,2),dp)
Write(123,*) "YQ233_r= ",Real(YQ2(3,3),dp)
Write(123,*) "YQ211_i= ",AImag(YQ2(1,1))
Write(123,*) "YQ212_i= ",AImag(YQ2(1,2))
Write(123,*) "YQ213_i= ",AImag(YQ2(1,3))
Write(123,*) "YQ221_i= ",AImag(YQ2(2,1))
Write(123,*) "YQ222_i= ",AImag(YQ2(2,2))
Write(123,*) "YQ223_i= ",AImag(YQ2(2,3))
Write(123,*) "YQ231_i= ",AImag(YQ2(3,1))
Write(123,*) "YQ232_i= ",AImag(YQ2(3,2))
Write(123,*) "YQ233_i= ",AImag(YQ2(3,3))
Write(123,*) "vR= ",vR
Write(123,*) "vd= ",vd
Write(123,*) "vu= ",vu
Write(123,*) "vR= ",vR
Write(123,*) "phaT_r = ",Real(phaT,dp) 
Write(123,*) "phaT_i = ",AImag(phaT) 
Write(123,*) "" 
Write(123,*) "" 

 
 
 Write(123,*) "# Dependent parameters " 
 
Write(123,*) "" 
Write(123,*) "TW= ",ASin(Abs(ZZ(2,1)))
Write(123,*) "PhiW= ",ACos(Sqrt(Abs(ZW(1,1))**2 + Abs(ZW(1,2))**2))
Write(123,*) "" 
Write(123,*) "" 

 
 
 Write(123,*) "# Necessary MINPAR parameters " 
 
Write(123,*) "" 
Write(123,*) "" 
Write(123,*) "" 

 
 
 Write(123,*) "# Masses of particles" 
 
Write(123,*) "" 
Write(123,*) "Mhh1= ", Abs(Mhh(1)) 
Write(123,*) "Mhh2= ", Abs(Mhh(2)) 
Write(123,*) "Mhh3= ", Abs(Mhh(3)) 
Write(123,*) "MAh3= ", Abs(MAh(3)) 
Write(123,*) "MHm3= ", Abs(MHpm(3)) 
Write(123,*) "MHmm= ", Abs(MdeltaRpp) 
Write(123,*) "MZ= ", Abs(MVZ) 
Write(123,*) "MZp= ", Abs(MVZR) 
Write(123,*) "MWRm= ", Abs(MVWRm) 
Write(123,*) "Md1= ", Abs(MFd(1)) 
Write(123,*) "Md2= ", Abs(MFd(2)) 
Write(123,*) "Md3= ", Abs(MFd(3)) 
Write(123,*) "Mu1= ", Abs(MFu(1)) 
Write(123,*) "Mu2= ", Abs(MFu(2)) 
Write(123,*) "Mu3= ", Abs(MFu(3)) 
Write(123,*) "Me1= ", Abs(MFe(1)) 
Write(123,*) "Me2= ", Abs(MFe(2)) 
Write(123,*) "Me3= ", Abs(MFe(3)) 
Write(123,*) "Mnu1= ", Abs(MFv(1)) 
Write(123,*) "Mnu2= ", Abs(MFv(2)) 
Write(123,*) "Mnu3= ", Abs(MFv(3)) 
Write(123,*) "Mnu4= ", Abs(MFv(4)) 
Write(123,*) "Mnu5= ", Abs(MFv(5)) 
Write(123,*) "Mnu6= ", Abs(MFv(6)) 
Write(123,*) "Mcpp= ", Abs(MFcpp) 
Write(123,*) "Mcp1= ", Abs(MFcp(1)) 
Write(123,*) "Mcp2= ", Abs(MFcp(2)) 
Write(123,*) "Mc01= ", Abs(MFc(1)) 
Write(123,*) "Mc02= ", Abs(MFc(2)) 
Write(123,*) "Mc03= ", Abs(MFc(3)) 
Write(123,*) "" 
Write(123,*) "" 

 
 
 Write(123,*) "# Widths of particles" 
 
Write(123,*) "" 
Write(123,*) "Wu3 = ",gTFu(3)
Write(123,*) "Whh1 = ",gThh(1)
Write(123,*) "Whh2 = ",gThh(2)
Write(123,*) "Whh3 = ",gThh(3)
Write(123,*) "Wnu1 = ",gTFv(1)
Write(123,*) "Wnu2 = ",gTFv(2)
Write(123,*) "Wnu3 = ",gTFv(3)
Write(123,*) "Wnu4 = ",gTFv(4)
Write(123,*) "Wnu5 = ",gTFv(5)
Write(123,*) "Wnu6 = ",gTFv(6)
Write(123,*) "WZ = ",gTVZ
Write(123,*) "WZp = ",gTVZR
Write(123,*) "WHmm = ",gTdeltaRpp
Write(123,*) "WHm3 = ",gTHpm(3)
Write(123,*) "WAh3 = ",gTAh(3)
Write(123,*) "WWLm = ",gTVWLm
Write(123,*) "WWRm = ",gTVWRm
Write(123,*) "" 
Write(123,*) "" 

 
 
 Write(123,*) "# Mixing matrices" 
 
Write(123,*) "" 
Write(123,*) "ZH11= ",ZH(1,1)
Write(123,*) "ZH12= ",ZH(1,2)
Write(123,*) "ZH13= ",ZH(1,3)
Write(123,*) "ZH21= ",ZH(2,1)
Write(123,*) "ZH22= ",ZH(2,2)
Write(123,*) "ZH23= ",ZH(2,3)
Write(123,*) "ZH31= ",ZH(3,1)
Write(123,*) "ZH32= ",ZH(3,2)
Write(123,*) "ZH33= ",ZH(3,3)
Write(123,*) "UP11= ",UP(1,1)
Write(123,*) "UP12= ",UP(1,2)
Write(123,*) "UP13= ",UP(1,3)
Write(123,*) "UP21= ",UP(2,1)
Write(123,*) "UP22= ",UP(2,2)
Write(123,*) "UP23= ",UP(2,3)
Write(123,*) "UP31= ",UP(3,1)
Write(123,*) "UP32= ",UP(3,2)
Write(123,*) "UP33= ",UP(3,3)
Write(123,*) "UC11= ",UC(1,1)
Write(123,*) "UC12= ",UC(1,2)
Write(123,*) "UC13= ",UC(1,3)
Write(123,*) "UC21= ",UC(2,1)
Write(123,*) "UC22= ",UC(2,2)
Write(123,*) "UC23= ",UC(2,3)
Write(123,*) "UC31= ",UC(3,1)
Write(123,*) "UC32= ",UC(3,2)
Write(123,*) "UC33= ",UC(3,3)
If (MFv(1).Gt.0._dp) Then 
Write(123,*) "UV11_r = ", Real(UV(1,1),dp)
Write(123,*) "UV11_i = ", AImag(UV(1,1))
Write(123,*) "UV12_r = ", Real(UV(1,2),dp)
Write(123,*) "UV12_i = ", AImag(UV(1,2))
Write(123,*) "UV13_r = ", Real(UV(1,3),dp)
Write(123,*) "UV13_i = ", AImag(UV(1,3))
Write(123,*) "UV14_r = ", Real(UV(1,4),dp)
Write(123,*) "UV14_i = ", AImag(UV(1,4))
Write(123,*) "UV15_r = ", Real(UV(1,5),dp)
Write(123,*) "UV15_i = ", AImag(UV(1,5))
Write(123,*) "UV16_r = ", Real(UV(1,6),dp)
Write(123,*) "UV16_i = ", AImag(UV(1,6))
Else 
Write(123,*) "UV11_i = ", Real(UV(1,1),dp)
Write(123,*) "UV11_r = ", -AImag(UV(1,1))
Write(123,*) "UV12_i = ", Real(UV(1,2),dp)
Write(123,*) "UV12_r = ", -AImag(UV(1,2))
Write(123,*) "UV13_i = ", Real(UV(1,3),dp)
Write(123,*) "UV13_r = ", -AImag(UV(1,3))
Write(123,*) "UV14_i = ", Real(UV(1,4),dp)
Write(123,*) "UV14_r = ", -AImag(UV(1,4))
Write(123,*) "UV15_i = ", Real(UV(1,5),dp)
Write(123,*) "UV15_r = ", -AImag(UV(1,5))
Write(123,*) "UV16_i = ", Real(UV(1,6),dp)
Write(123,*) "UV16_r = ", -AImag(UV(1,6))
End if 
If (MFv(2).Gt.0._dp) Then 
Write(123,*) "UV21_r = ", Real(UV(2,1),dp)
Write(123,*) "UV21_i = ", AImag(UV(2,1))
Write(123,*) "UV22_r = ", Real(UV(2,2),dp)
Write(123,*) "UV22_i = ", AImag(UV(2,2))
Write(123,*) "UV23_r = ", Real(UV(2,3),dp)
Write(123,*) "UV23_i = ", AImag(UV(2,3))
Write(123,*) "UV24_r = ", Real(UV(2,4),dp)
Write(123,*) "UV24_i = ", AImag(UV(2,4))
Write(123,*) "UV25_r = ", Real(UV(2,5),dp)
Write(123,*) "UV25_i = ", AImag(UV(2,5))
Write(123,*) "UV26_r = ", Real(UV(2,6),dp)
Write(123,*) "UV26_i = ", AImag(UV(2,6))
Else 
Write(123,*) "UV21_i = ", Real(UV(2,1),dp)
Write(123,*) "UV21_r = ", -AImag(UV(2,1))
Write(123,*) "UV22_i = ", Real(UV(2,2),dp)
Write(123,*) "UV22_r = ", -AImag(UV(2,2))
Write(123,*) "UV23_i = ", Real(UV(2,3),dp)
Write(123,*) "UV23_r = ", -AImag(UV(2,3))
Write(123,*) "UV24_i = ", Real(UV(2,4),dp)
Write(123,*) "UV24_r = ", -AImag(UV(2,4))
Write(123,*) "UV25_i = ", Real(UV(2,5),dp)
Write(123,*) "UV25_r = ", -AImag(UV(2,5))
Write(123,*) "UV26_i = ", Real(UV(2,6),dp)
Write(123,*) "UV26_r = ", -AImag(UV(2,6))
End if 
If (MFv(3).Gt.0._dp) Then 
Write(123,*) "UV31_r = ", Real(UV(3,1),dp)
Write(123,*) "UV31_i = ", AImag(UV(3,1))
Write(123,*) "UV32_r = ", Real(UV(3,2),dp)
Write(123,*) "UV32_i = ", AImag(UV(3,2))
Write(123,*) "UV33_r = ", Real(UV(3,3),dp)
Write(123,*) "UV33_i = ", AImag(UV(3,3))
Write(123,*) "UV34_r = ", Real(UV(3,4),dp)
Write(123,*) "UV34_i = ", AImag(UV(3,4))
Write(123,*) "UV35_r = ", Real(UV(3,5),dp)
Write(123,*) "UV35_i = ", AImag(UV(3,5))
Write(123,*) "UV36_r = ", Real(UV(3,6),dp)
Write(123,*) "UV36_i = ", AImag(UV(3,6))
Else 
Write(123,*) "UV31_i = ", Real(UV(3,1),dp)
Write(123,*) "UV31_r = ", -AImag(UV(3,1))
Write(123,*) "UV32_i = ", Real(UV(3,2),dp)
Write(123,*) "UV32_r = ", -AImag(UV(3,2))
Write(123,*) "UV33_i = ", Real(UV(3,3),dp)
Write(123,*) "UV33_r = ", -AImag(UV(3,3))
Write(123,*) "UV34_i = ", Real(UV(3,4),dp)
Write(123,*) "UV34_r = ", -AImag(UV(3,4))
Write(123,*) "UV35_i = ", Real(UV(3,5),dp)
Write(123,*) "UV35_r = ", -AImag(UV(3,5))
Write(123,*) "UV36_i = ", Real(UV(3,6),dp)
Write(123,*) "UV36_r = ", -AImag(UV(3,6))
End if 
If (MFv(4).Gt.0._dp) Then 
Write(123,*) "UV41_r = ", Real(UV(4,1),dp)
Write(123,*) "UV41_i = ", AImag(UV(4,1))
Write(123,*) "UV42_r = ", Real(UV(4,2),dp)
Write(123,*) "UV42_i = ", AImag(UV(4,2))
Write(123,*) "UV43_r = ", Real(UV(4,3),dp)
Write(123,*) "UV43_i = ", AImag(UV(4,3))
Write(123,*) "UV44_r = ", Real(UV(4,4),dp)
Write(123,*) "UV44_i = ", AImag(UV(4,4))
Write(123,*) "UV45_r = ", Real(UV(4,5),dp)
Write(123,*) "UV45_i = ", AImag(UV(4,5))
Write(123,*) "UV46_r = ", Real(UV(4,6),dp)
Write(123,*) "UV46_i = ", AImag(UV(4,6))
Else 
Write(123,*) "UV41_i = ", Real(UV(4,1),dp)
Write(123,*) "UV41_r = ", -AImag(UV(4,1))
Write(123,*) "UV42_i = ", Real(UV(4,2),dp)
Write(123,*) "UV42_r = ", -AImag(UV(4,2))
Write(123,*) "UV43_i = ", Real(UV(4,3),dp)
Write(123,*) "UV43_r = ", -AImag(UV(4,3))
Write(123,*) "UV44_i = ", Real(UV(4,4),dp)
Write(123,*) "UV44_r = ", -AImag(UV(4,4))
Write(123,*) "UV45_i = ", Real(UV(4,5),dp)
Write(123,*) "UV45_r = ", -AImag(UV(4,5))
Write(123,*) "UV46_i = ", Real(UV(4,6),dp)
Write(123,*) "UV46_r = ", -AImag(UV(4,6))
End if 
If (MFv(5).Gt.0._dp) Then 
Write(123,*) "UV51_r = ", Real(UV(5,1),dp)
Write(123,*) "UV51_i = ", AImag(UV(5,1))
Write(123,*) "UV52_r = ", Real(UV(5,2),dp)
Write(123,*) "UV52_i = ", AImag(UV(5,2))
Write(123,*) "UV53_r = ", Real(UV(5,3),dp)
Write(123,*) "UV53_i = ", AImag(UV(5,3))
Write(123,*) "UV54_r = ", Real(UV(5,4),dp)
Write(123,*) "UV54_i = ", AImag(UV(5,4))
Write(123,*) "UV55_r = ", Real(UV(5,5),dp)
Write(123,*) "UV55_i = ", AImag(UV(5,5))
Write(123,*) "UV56_r = ", Real(UV(5,6),dp)
Write(123,*) "UV56_i = ", AImag(UV(5,6))
Else 
Write(123,*) "UV51_i = ", Real(UV(5,1),dp)
Write(123,*) "UV51_r = ", -AImag(UV(5,1))
Write(123,*) "UV52_i = ", Real(UV(5,2),dp)
Write(123,*) "UV52_r = ", -AImag(UV(5,2))
Write(123,*) "UV53_i = ", Real(UV(5,3),dp)
Write(123,*) "UV53_r = ", -AImag(UV(5,3))
Write(123,*) "UV54_i = ", Real(UV(5,4),dp)
Write(123,*) "UV54_r = ", -AImag(UV(5,4))
Write(123,*) "UV55_i = ", Real(UV(5,5),dp)
Write(123,*) "UV55_r = ", -AImag(UV(5,5))
Write(123,*) "UV56_i = ", Real(UV(5,6),dp)
Write(123,*) "UV56_r = ", -AImag(UV(5,6))
End if 
If (MFv(6).Gt.0._dp) Then 
Write(123,*) "UV61_r = ", Real(UV(6,1),dp)
Write(123,*) "UV61_i = ", AImag(UV(6,1))
Write(123,*) "UV62_r = ", Real(UV(6,2),dp)
Write(123,*) "UV62_i = ", AImag(UV(6,2))
Write(123,*) "UV63_r = ", Real(UV(6,3),dp)
Write(123,*) "UV63_i = ", AImag(UV(6,3))
Write(123,*) "UV64_r = ", Real(UV(6,4),dp)
Write(123,*) "UV64_i = ", AImag(UV(6,4))
Write(123,*) "UV65_r = ", Real(UV(6,5),dp)
Write(123,*) "UV65_i = ", AImag(UV(6,5))
Write(123,*) "UV66_r = ", Real(UV(6,6),dp)
Write(123,*) "UV66_i = ", AImag(UV(6,6))
Else 
Write(123,*) "UV61_i = ", Real(UV(6,1),dp)
Write(123,*) "UV61_r = ", -AImag(UV(6,1))
Write(123,*) "UV62_i = ", Real(UV(6,2),dp)
Write(123,*) "UV62_r = ", -AImag(UV(6,2))
Write(123,*) "UV63_i = ", Real(UV(6,3),dp)
Write(123,*) "UV63_r = ", -AImag(UV(6,3))
Write(123,*) "UV64_i = ", Real(UV(6,4),dp)
Write(123,*) "UV64_r = ", -AImag(UV(6,4))
Write(123,*) "UV65_i = ", Real(UV(6,5),dp)
Write(123,*) "UV65_r = ", -AImag(UV(6,5))
Write(123,*) "UV66_i = ", Real(UV(6,6),dp)
Write(123,*) "UV66_r = ", -AImag(UV(6,6))
End if 
If (MFc(1).Gt.0._dp) Then 
Write(123,*) "UT11_r = ", Real(UT(1,1),dp)
Write(123,*) "UT11_i = ", AImag(UT(1,1))
Write(123,*) "UT12_r = ", Real(UT(1,2),dp)
Write(123,*) "UT12_i = ", AImag(UT(1,2))
Write(123,*) "UT13_r = ", Real(UT(1,3),dp)
Write(123,*) "UT13_i = ", AImag(UT(1,3))
Else 
Write(123,*) "UT11_i = ", Real(UT(1,1),dp)
Write(123,*) "UT11_r = ", -AImag(UT(1,1))
Write(123,*) "UT12_i = ", Real(UT(1,2),dp)
Write(123,*) "UT12_r = ", -AImag(UT(1,2))
Write(123,*) "UT13_i = ", Real(UT(1,3),dp)
Write(123,*) "UT13_r = ", -AImag(UT(1,3))
End if 
If (MFc(2).Gt.0._dp) Then 
Write(123,*) "UT21_r = ", Real(UT(2,1),dp)
Write(123,*) "UT21_i = ", AImag(UT(2,1))
Write(123,*) "UT22_r = ", Real(UT(2,2),dp)
Write(123,*) "UT22_i = ", AImag(UT(2,2))
Write(123,*) "UT23_r = ", Real(UT(2,3),dp)
Write(123,*) "UT23_i = ", AImag(UT(2,3))
Else 
Write(123,*) "UT21_i = ", Real(UT(2,1),dp)
Write(123,*) "UT21_r = ", -AImag(UT(2,1))
Write(123,*) "UT22_i = ", Real(UT(2,2),dp)
Write(123,*) "UT22_r = ", -AImag(UT(2,2))
Write(123,*) "UT23_i = ", Real(UT(2,3),dp)
Write(123,*) "UT23_r = ", -AImag(UT(2,3))
End if 
If (MFc(3).Gt.0._dp) Then 
Write(123,*) "UT31_r = ", Real(UT(3,1),dp)
Write(123,*) "UT31_i = ", AImag(UT(3,1))
Write(123,*) "UT32_r = ", Real(UT(3,2),dp)
Write(123,*) "UT32_i = ", AImag(UT(3,2))
Write(123,*) "UT33_r = ", Real(UT(3,3),dp)
Write(123,*) "UT33_i = ", AImag(UT(3,3))
Else 
Write(123,*) "UT31_i = ", Real(UT(3,1),dp)
Write(123,*) "UT31_r = ", -AImag(UT(3,1))
Write(123,*) "UT32_i = ", Real(UT(3,2),dp)
Write(123,*) "UT32_r = ", -AImag(UT(3,2))
Write(123,*) "UT33_i = ", Real(UT(3,3),dp)
Write(123,*) "UT33_r = ", -AImag(UT(3,3))
End if 
Write(123,*) "ZDL11_r = ", Real(ZDL(1,1),dp)
Write(123,*) "ZDL11_i = ", AImag(ZDL(1,1))
Write(123,*) "ZDL12_r = ", Real(ZDL(1,2),dp)
Write(123,*) "ZDL12_i = ", AImag(ZDL(1,2))
Write(123,*) "ZDL13_r = ", Real(ZDL(1,3),dp)
Write(123,*) "ZDL13_i = ", AImag(ZDL(1,3))
Write(123,*) "ZDL21_r = ", Real(ZDL(2,1),dp)
Write(123,*) "ZDL21_i = ", AImag(ZDL(2,1))
Write(123,*) "ZDL22_r = ", Real(ZDL(2,2),dp)
Write(123,*) "ZDL22_i = ", AImag(ZDL(2,2))
Write(123,*) "ZDL23_r = ", Real(ZDL(2,3),dp)
Write(123,*) "ZDL23_i = ", AImag(ZDL(2,3))
Write(123,*) "ZDL31_r = ", Real(ZDL(3,1),dp)
Write(123,*) "ZDL31_i = ", AImag(ZDL(3,1))
Write(123,*) "ZDL32_r = ", Real(ZDL(3,2),dp)
Write(123,*) "ZDL32_i = ", AImag(ZDL(3,2))
Write(123,*) "ZDL33_r = ", Real(ZDL(3,3),dp)
Write(123,*) "ZDL33_i = ", AImag(ZDL(3,3))
Write(123,*) "ZDR11_r = ", Real(ZDR(1,1),dp)
Write(123,*) "ZDR11_i = ", AImag(ZDR(1,1))
Write(123,*) "ZDR12_r = ", Real(ZDR(1,2),dp)
Write(123,*) "ZDR12_i = ", AImag(ZDR(1,2))
Write(123,*) "ZDR13_r = ", Real(ZDR(1,3),dp)
Write(123,*) "ZDR13_i = ", AImag(ZDR(1,3))
Write(123,*) "ZDR21_r = ", Real(ZDR(2,1),dp)
Write(123,*) "ZDR21_i = ", AImag(ZDR(2,1))
Write(123,*) "ZDR22_r = ", Real(ZDR(2,2),dp)
Write(123,*) "ZDR22_i = ", AImag(ZDR(2,2))
Write(123,*) "ZDR23_r = ", Real(ZDR(2,3),dp)
Write(123,*) "ZDR23_i = ", AImag(ZDR(2,3))
Write(123,*) "ZDR31_r = ", Real(ZDR(3,1),dp)
Write(123,*) "ZDR31_i = ", AImag(ZDR(3,1))
Write(123,*) "ZDR32_r = ", Real(ZDR(3,2),dp)
Write(123,*) "ZDR32_i = ", AImag(ZDR(3,2))
Write(123,*) "ZDR33_r = ", Real(ZDR(3,3),dp)
Write(123,*) "ZDR33_i = ", AImag(ZDR(3,3))
Write(123,*) "ZUL11_r = ", Real(ZUL(1,1),dp)
Write(123,*) "ZUL11_i = ", AImag(ZUL(1,1))
Write(123,*) "ZUL12_r = ", Real(ZUL(1,2),dp)
Write(123,*) "ZUL12_i = ", AImag(ZUL(1,2))
Write(123,*) "ZUL13_r = ", Real(ZUL(1,3),dp)
Write(123,*) "ZUL13_i = ", AImag(ZUL(1,3))
Write(123,*) "ZUL21_r = ", Real(ZUL(2,1),dp)
Write(123,*) "ZUL21_i = ", AImag(ZUL(2,1))
Write(123,*) "ZUL22_r = ", Real(ZUL(2,2),dp)
Write(123,*) "ZUL22_i = ", AImag(ZUL(2,2))
Write(123,*) "ZUL23_r = ", Real(ZUL(2,3),dp)
Write(123,*) "ZUL23_i = ", AImag(ZUL(2,3))
Write(123,*) "ZUL31_r = ", Real(ZUL(3,1),dp)
Write(123,*) "ZUL31_i = ", AImag(ZUL(3,1))
Write(123,*) "ZUL32_r = ", Real(ZUL(3,2),dp)
Write(123,*) "ZUL32_i = ", AImag(ZUL(3,2))
Write(123,*) "ZUL33_r = ", Real(ZUL(3,3),dp)
Write(123,*) "ZUL33_i = ", AImag(ZUL(3,3))
Write(123,*) "ZUR11_r = ", Real(ZUR(1,1),dp)
Write(123,*) "ZUR11_i = ", AImag(ZUR(1,1))
Write(123,*) "ZUR12_r = ", Real(ZUR(1,2),dp)
Write(123,*) "ZUR12_i = ", AImag(ZUR(1,2))
Write(123,*) "ZUR13_r = ", Real(ZUR(1,3),dp)
Write(123,*) "ZUR13_i = ", AImag(ZUR(1,3))
Write(123,*) "ZUR21_r = ", Real(ZUR(2,1),dp)
Write(123,*) "ZUR21_i = ", AImag(ZUR(2,1))
Write(123,*) "ZUR22_r = ", Real(ZUR(2,2),dp)
Write(123,*) "ZUR22_i = ", AImag(ZUR(2,2))
Write(123,*) "ZUR23_r = ", Real(ZUR(2,3),dp)
Write(123,*) "ZUR23_i = ", AImag(ZUR(2,3))
Write(123,*) "ZUR31_r = ", Real(ZUR(3,1),dp)
Write(123,*) "ZUR31_i = ", AImag(ZUR(3,1))
Write(123,*) "ZUR32_r = ", Real(ZUR(3,2),dp)
Write(123,*) "ZUR32_i = ", AImag(ZUR(3,2))
Write(123,*) "ZUR33_r = ", Real(ZUR(3,3),dp)
Write(123,*) "ZUR33_i = ", AImag(ZUR(3,3))
Write(123,*) "ZEL11_r = ", Real(ZEL(1,1),dp)
Write(123,*) "ZEL11_i = ", AImag(ZEL(1,1))
Write(123,*) "ZEL12_r = ", Real(ZEL(1,2),dp)
Write(123,*) "ZEL12_i = ", AImag(ZEL(1,2))
Write(123,*) "ZEL13_r = ", Real(ZEL(1,3),dp)
Write(123,*) "ZEL13_i = ", AImag(ZEL(1,3))
Write(123,*) "ZEL21_r = ", Real(ZEL(2,1),dp)
Write(123,*) "ZEL21_i = ", AImag(ZEL(2,1))
Write(123,*) "ZEL22_r = ", Real(ZEL(2,2),dp)
Write(123,*) "ZEL22_i = ", AImag(ZEL(2,2))
Write(123,*) "ZEL23_r = ", Real(ZEL(2,3),dp)
Write(123,*) "ZEL23_i = ", AImag(ZEL(2,3))
Write(123,*) "ZEL31_r = ", Real(ZEL(3,1),dp)
Write(123,*) "ZEL31_i = ", AImag(ZEL(3,1))
Write(123,*) "ZEL32_r = ", Real(ZEL(3,2),dp)
Write(123,*) "ZEL32_i = ", AImag(ZEL(3,2))
Write(123,*) "ZEL33_r = ", Real(ZEL(3,3),dp)
Write(123,*) "ZEL33_i = ", AImag(ZEL(3,3))
Write(123,*) "ZER11_r = ", Real(ZER(1,1),dp)
Write(123,*) "ZER11_i = ", AImag(ZER(1,1))
Write(123,*) "ZER12_r = ", Real(ZER(1,2),dp)
Write(123,*) "ZER12_i = ", AImag(ZER(1,2))
Write(123,*) "ZER13_r = ", Real(ZER(1,3),dp)
Write(123,*) "ZER13_i = ", AImag(ZER(1,3))
Write(123,*) "ZER21_r = ", Real(ZER(2,1),dp)
Write(123,*) "ZER21_i = ", AImag(ZER(2,1))
Write(123,*) "ZER22_r = ", Real(ZER(2,2),dp)
Write(123,*) "ZER22_i = ", AImag(ZER(2,2))
Write(123,*) "ZER23_r = ", Real(ZER(2,3),dp)
Write(123,*) "ZER23_i = ", AImag(ZER(2,3))
Write(123,*) "ZER31_r = ", Real(ZER(3,1),dp)
Write(123,*) "ZER31_i = ", AImag(ZER(3,1))
Write(123,*) "ZER32_r = ", Real(ZER(3,2),dp)
Write(123,*) "ZER32_i = ", AImag(ZER(3,2))
Write(123,*) "ZER33_r = ", Real(ZER(3,3),dp)
Write(123,*) "ZER33_i = ", AImag(ZER(3,3))
Write(123,*) "VTE11_r = ", Real(VTE(1,1),dp)
Write(123,*) "VTE11_i = ", AImag(VTE(1,1))
Write(123,*) "VTE12_r = ", Real(VTE(1,2),dp)
Write(123,*) "VTE12_i = ", AImag(VTE(1,2))
Write(123,*) "VTE21_r = ", Real(VTE(2,1),dp)
Write(123,*) "VTE21_i = ", AImag(VTE(2,1))
Write(123,*) "VTE22_r = ", Real(VTE(2,2),dp)
Write(123,*) "VTE22_i = ", AImag(VTE(2,2))
Write(123,*) "UTE11_r = ", Real(UTE(1,1),dp)
Write(123,*) "UTE11_i = ", AImag(UTE(1,1))
Write(123,*) "UTE12_r = ", Real(UTE(1,2),dp)
Write(123,*) "UTE12_i = ", AImag(UTE(1,2))
Write(123,*) "UTE21_r = ", Real(UTE(2,1),dp)
Write(123,*) "UTE21_i = ", AImag(UTE(2,1))
Write(123,*) "UTE22_r = ", Real(UTE(2,2),dp)
Write(123,*) "UTE22_i = ", AImag(UTE(2,2))
Write(123,*) "ZZ11_r = ", Real(ZZ(1,1),dp)
Write(123,*) "ZZ11_i = ", AImag(ZZ(1,1))
Write(123,*) "ZZ12_r = ", Real(ZZ(1,2),dp)
Write(123,*) "ZZ12_i = ", AImag(ZZ(1,2))
Write(123,*) "ZZ13_r = ", Real(ZZ(1,3),dp)
Write(123,*) "ZZ13_i = ", AImag(ZZ(1,3))
Write(123,*) "ZZ21_r = ", Real(ZZ(2,1),dp)
Write(123,*) "ZZ21_i = ", AImag(ZZ(2,1))
Write(123,*) "ZZ22_r = ", Real(ZZ(2,2),dp)
Write(123,*) "ZZ22_i = ", AImag(ZZ(2,2))
Write(123,*) "ZZ23_r = ", Real(ZZ(2,3),dp)
Write(123,*) "ZZ23_i = ", AImag(ZZ(2,3))
Write(123,*) "ZZ31_r = ", Real(ZZ(3,1),dp)
Write(123,*) "ZZ31_i = ", AImag(ZZ(3,1))
Write(123,*) "ZZ32_r = ", Real(ZZ(3,2),dp)
Write(123,*) "ZZ32_i = ", AImag(ZZ(3,2))
Write(123,*) "ZZ33_r = ", Real(ZZ(3,3),dp)
Write(123,*) "ZZ33_i = ", AImag(ZZ(3,3))
    Close(123) 
End Subroutine WriteWHIZARD 

 
 Subroutine WriteHiggsBounds 
Implicit None 
Open(87,file="MH_GammaTot.dat",status="unknown") 
Open(88,file="MHplus_GammaTot.dat",status="unknown") 
Open(89,file="effC.dat",status="unknown") 
Open(90,file="BR_H_NP.dat",status="unknown") 
Open(91,file="BR_Hplus.dat",status="unknown") 
Open(92,file="BR_t.dat",status="unknown") 
Open(93,file="LEP_HpHm_CS_ratios.dat",status="unknown") 
Write(87,"(I1)",advance="No") 1 
Write(88,"(I1)",advance="No") 1 
Write(87,"(2e16.8)",advance="No") Mhh(1)
Write(87,"(2e16.8)",advance="No") Mhh(2)
Write(87,"(2e16.8)",advance="No") Mhh(3)
Write(87,"(2e16.8)",advance="No") MAh(3)
Write(88,"(2e16.8)",advance="No") MHpm(3)
Write(87,"(2e16.8)",advance="No") gThh(1)
Write(87,"(2e16.8)",advance="No") gThh(2)
Write(87,"(2e16.8)",advance="No") gThh(3)
Write(87,"(2e16.8)",advance="No") gTAh(3)
Write(88,"(2e16.8)",advance="No") gTHpm(3)
Write(90,"(I1)",advance="No") 1 
Write(90,"(e16.8)",advance="No") BRinvH(1) 
Write(90,"(e16.8)",advance="No") BRinvH(2) 
Write(90,"(e16.8)",advance="No") BRinvH(3) 
Write(90,"(e16.8)",advance="No") BRinvA(3) 
Write(90,"(e16.8)",advance="No") BRHHH(1,2) 
Write(90,"(e16.8)",advance="No") BRHHH(1,3) 
Write(90,"(e16.8)",advance="No") BRHAA(1,3) 
Write(90,"(e16.8)",advance="No") BRHHH(2,1) 
Write(90,"(e16.8)",advance="No") BRHHH(2,3) 
Write(90,"(e16.8)",advance="No") BRHAA(2,3) 
Write(90,"(e16.8)",advance="No") BRHHH(3,1) 
Write(90,"(e16.8)",advance="No") BRHHH(3,2) 
Write(90,"(e16.8)",advance="No") BRHAA(3,3) 
Write(90,"(e16.8)",advance="No") BRAHH(3,1) 
Write(90,"(e16.8)",advance="No") BRAHH(3,2) 
Write(90,"(e16.8)",advance="No") BRAHH(3,3) 

 
 
Write(92,"(I1)",advance="No") 1
Write(92,"(e16.8)",advance="No") BR_tWb 
Write(92,"(e16.8)",advance="No") BR_tHb(3) 
Write(91,"(I1)",advance="No") 1 
Write(91,"(3e16.8)",advance="No") BR_Hcs(3) 
Write(91,"(3e16.8)",advance="No")BR_Hcb(3) 
Write(91,"(3e16.8)",advance="No")BR_Htaunu(3) 
Write(89,"(I1)",advance="No") 1 
Write(89,"(3e16.8)",advance="No") rHB_S_S_Fd(1,2)
Write(89,"(3e16.8)",advance="No") rHB_S_S_Fd(2,2)
Write(89,"(3e16.8)",advance="No") rHB_S_S_Fd(3,2)
Write(89,"(3e16.8)",advance="No") rHB_P_S_Fd(3,2)
Write(89,"(3e16.8)",advance="No") rHB_S_P_Fd(1,2)
Write(89,"(3e16.8)",advance="No") rHB_S_P_Fd(2,2)
Write(89,"(3e16.8)",advance="No") rHB_S_P_Fd(3,2)
Write(89,"(3e16.8)",advance="No") rHB_P_P_Fd(3,2)
Write(89,"(3e16.8)",advance="No") rHB_S_S_Fu(1,2)
Write(89,"(3e16.8)",advance="No") rHB_S_S_Fu(2,2)
Write(89,"(3e16.8)",advance="No") rHB_S_S_Fu(3,2)
Write(89,"(3e16.8)",advance="No") rHB_P_S_Fu(3,2)
Write(89,"(3e16.8)",advance="No") rHB_S_P_Fu(1,2)
Write(89,"(3e16.8)",advance="No") rHB_S_P_Fu(2,2)
Write(89,"(3e16.8)",advance="No") rHB_S_P_Fu(3,2)
Write(89,"(3e16.8)",advance="No") rHB_P_P_Fu(3,2)
Write(89,"(3e16.8)",advance="No") rHB_S_S_Fd(1,3)
Write(89,"(3e16.8)",advance="No") rHB_S_S_Fd(2,3)
Write(89,"(3e16.8)",advance="No") rHB_S_S_Fd(3,3)
Write(89,"(3e16.8)",advance="No") rHB_P_S_Fd(3,3)
Write(89,"(3e16.8)",advance="No") rHB_S_P_Fd(1,3)
Write(89,"(3e16.8)",advance="No") rHB_S_P_Fd(2,3)
Write(89,"(3e16.8)",advance="No") rHB_S_P_Fd(3,3)
Write(89,"(3e16.8)",advance="No") rHB_P_P_Fd(3,3)
Write(89,"(3e16.8)",advance="No") rHB_S_S_Fu(1,3)
Write(89,"(3e16.8)",advance="No") rHB_S_S_Fu(2,3)
Write(89,"(3e16.8)",advance="No") rHB_S_S_Fu(3,3)
Write(89,"(3e16.8)",advance="No") rHB_P_S_Fu(3,3)
Write(89,"(3e16.8)",advance="No") rHB_S_P_Fu(1,3)
Write(89,"(3e16.8)",advance="No") rHB_S_P_Fu(2,3)
Write(89,"(3e16.8)",advance="No") rHB_S_P_Fu(3,3)
Write(89,"(3e16.8)",advance="No") rHB_P_P_Fu(3,3)
Write(89,"(3e16.8)",advance="No") rHB_S_S_Fe(1,2)
Write(89,"(3e16.8)",advance="No") rHB_S_S_Fe(2,2)
Write(89,"(3e16.8)",advance="No") rHB_S_S_Fe(3,2)
Write(89,"(3e16.8)",advance="No") rHB_P_S_Fe(3,2)
Write(89,"(3e16.8)",advance="No") rHB_S_P_Fe(1,2)
Write(89,"(3e16.8)",advance="No") rHB_S_P_Fe(2,2)
Write(89,"(3e16.8)",advance="No") rHB_S_P_Fe(3,2)
Write(89,"(3e16.8)",advance="No") rHB_P_P_Fe(3,2)
Write(89,"(3e16.8)",advance="No") rHB_S_S_Fe(1,3)
Write(89,"(3e16.8)",advance="No") rHB_S_S_Fe(2,3)
Write(89,"(3e16.8)",advance="No") rHB_S_S_Fe(3,3)
Write(89,"(3e16.8)",advance="No") rHB_P_S_Fe(3,3)
Write(89,"(3e16.8)",advance="No") rHB_S_P_Fe(1,3)
Write(89,"(3e16.8)",advance="No") rHB_S_P_Fe(2,3)
Write(89,"(3e16.8)",advance="No") rHB_S_P_Fe(3,3)
Write(89,"(3e16.8)",advance="No") rHB_P_P_Fe(3,3)
Write(89,"(3e16.8)",advance="No") rHB_S_VWLm(1)
Write(89,"(3e16.8)",advance="No") rHB_S_VWLm(2)
Write(89,"(3e16.8)",advance="No") rHB_S_VWLm(3)
Write(89,"(3e16.8)",advance="No") rHB_P_VWLm(3)
Write(89,"(3e16.8)",advance="No") rHB_S_VZ(1)
Write(89,"(3e16.8)",advance="No") rHB_S_VZ(2)
Write(89,"(3e16.8)",advance="No") rHB_S_VZ(3)
Write(89,"(3e16.8)",advance="No") rHB_P_VZ(3)
Write(89,"(3e16.8)",advance="No") 0._dp 
Write(89,"(3e16.8)",advance="No") 0._dp 
Write(89,"(3e16.8)",advance="No") 0._dp 
Write(89,"(3e16.8)",advance="No") 0._dp 
Write(89,"(3e16.8)",advance="No")  Real(ratioPP(1),dp) 
Write(89,"(3e16.8)",advance="No")  Real(ratioPP(2),dp) 
Write(89,"(3e16.8)",advance="No")  Real(ratioPP(3),dp) 
Write(89,"(3e16.8)",advance="No") Real(ratioPPP(3),dp) 
Write(89,"(3e16.8)",advance="No")  Real(ratioGG(1),dp) 
Write(89,"(3e16.8)",advance="No")  Real(ratioGG(2),dp) 
Write(89,"(3e16.8)",advance="No")  Real(ratioGG(3),dp) 
Write(89,"(3e16.8)",advance="No") Real(ratioPGG(3),dp) 
Write(89,"(3e16.8)",advance="No") 0._dp 
Write(89,"(3e16.8)",advance="No") 0._dp 
Write(89,"(3e16.8)",advance="No") 0._dp 
Write(89,"(3e16.8)",advance="No") 0._dp 
Write(89,"(e16.8)",advance="No") Real(CPL_H_H_Z(1,1), dp) 
 Write(89,"(e16.8)",advance="No") Real(CPL_H_H_Z(1,2), dp) 
 Write(89,"(e16.8)",advance="No") Real(CPL_H_H_Z(2,2), dp) 
 Write(89,"(e16.8)",advance="No") Real(CPL_H_H_Z(1,3), dp) 
 Write(89,"(e16.8)",advance="No") Real(CPL_H_H_Z(2,3), dp) 
 Write(89,"(e16.8)",advance="No") Real(CPL_H_H_Z(3,3), dp) 
 Write(89,"(e16.8)",advance="No") Real(CPL_A_H_Z(3,1), dp) 
 Write(89,"(e16.8)",advance="No") Real(CPL_A_H_Z(3,2), dp) 
 Write(89,"(e16.8)",advance="No") Real(CPL_A_H_Z(3,3), dp) 
 Write(89,"(e16.8)",advance="No") Real(CPL_A_A_Z(3,3), dp) 
 
 
 
Write(93,"(I1)",advance="No") 1 
Write(93,"(e16.8)",advance="No") 0.0000 
Close(87) 
Close(88) 
Close(90) 
Close(91) 
Close(92) 
Close(93) 
End Subroutine WriteHiggsBounds 
 
 
 Subroutine ReadMatrixC(io, nmax1, nmax2, mat, ic, mat_name, kont, fill)
  Implicit None
   Character(len=*) :: mat_name
   Integer, Intent(in) :: nmax1, nmax2, io, ic
   Integer, Intent(in), Optional :: fill
   Complex(dp), Intent(inout) :: mat(nmax1, nmax2)
   Integer, Intent(out) :: kont

   Character(len=80) :: read_line
   Integer :: i1, i2
   Real(dp) :: wert

   kont = 0

   Iname = Iname + 1
   NameOfUnit(Iname) = "ReadMatrixC"
   Do 
    Read(io,*,End=200) read_line
!     Write(*,*) read_line
    If (read_line(1:1).Eq."#") Cycle ! ignore comments
    Backspace(io)                    ! resetting to the beginning of the line
    If ((read_line(1:1).Eq."B").Or.(read_line(1:1).Eq."b") ) Then
     Iname = Iname - 1
     Return ! new block
    End If

    Read(io,*) i1, i2, wert, read_line

    If ((i1.Lt.1).Or.(i1.Gt.nmax1)) Then
     Write(ErrCan,*) "Problem while reading "//mat_name//" in routine"// &
        & Trim(NameOfUnit(Iname))//", index i1=",i1
     Iname = Iname - 2
     kont = -305 
     Call TerminateProgram()
    End If
    If ((i2.Lt.1).Or.(i2.Gt.nmax2)) Then
     Write(ErrCan,*) "Problem while reading "//mat_name//" in routine"// &
        & Trim(NameOfUnit(Iname))//", index i2=",i2
     Iname = Iname - 2
     kont = -305 
     Call TerminateProgram()
    End If

    If (ic.Eq.0) Then
     mat(i1,i2) = Cmplx(0._dp,Aimag(mat(i1,i2)),dp) + wert
     If (Present(fill).And.(i1.Ne.i2)) &
       &  mat(i2,i1) = Cmplx(0._dp, Aimag(mat(i2,i1)), dp) + wert
    Else If (ic.Eq.1) Then
     mat(i1,i2) = Real(mat(i1,i2),dp) + Cmplx(0._dp, wert, dp)
     !-------------------------------------------------------------
     ! if fill==1 -> matrix is hermitian
     ! if fill==2 -> matrix is complex symmetric
     !-------------------------------------------------------------
     If (Present(fill).And.(i1.Ne.i2)) Then
      If (fill.Eq.1) mat(i2,i1) = Real(mat(i2,i1),dp) - Cmplx(0._dp, wert, dp)
      If (fill.Eq.2) mat(i2,i1) = Real(mat(i2,i1),dp) + Cmplx(0._dp, wert, dp)
     End If
    End If

   End Do

   200 Return

  End Subroutine ReadMatrixC

 
  Subroutine ReadMatrixR(io, nmax1, nmax2, mat, mat_name, kont)
  Implicit None
   Character(len=*) :: mat_name
   Integer, Intent(in) :: nmax1, nmax2, io
   Real(dp), Intent(inout) :: mat(nmax1, nmax2)
   Integer, Intent(out) :: kont

   Character(len=80) :: read_line
   Integer :: i1, i2
   Real(dp) :: wert

   kont = 0

   Iname = Iname + 1
   NameOfUnit(Iname) = "ReadMatrixR"
   Do 
    Read(io,*,End=200) read_line
!     Write(*,*) read_line
    If (read_line(1:1).Eq."#") Cycle ! ignore comments
    Backspace(io)                    ! resetting to the beginning of the line
    If ((read_line(1:1).Eq."B").Or.(read_line(1:1).Eq."b") ) Then
     Iname = Iname - 1
     Return ! new block
    End If

    Read(io,*) i1, i2, wert, read_line

    If ((i1.Lt.1).Or.(i1.Gt.nmax1)) Then
     Write(ErrCan,*) "Problem while reading "//mat_name//" in routine"// &
        & Trim(NameOfUnit(Iname))//", index i1=",i1
     Iname = Iname - 2
     kont = -305 
     Call TerminateProgram()
    End If
    If ((i2.Lt.1).Or.(i2.Gt.nmax2)) Then
     Write(ErrCan,*) "Problem while reading "//mat_name//" in routine"// &
        & Trim(NameOfUnit(Iname))//", index i2=",i2
     Iname = Iname - 2
     kont = -305 
     Call TerminateProgram()
    End If

    mat(i1,i2) = wert

   End Do

   200 Return

  End Subroutine ReadMatrixR

  
  Subroutine ReadVectorC(io, nmax, vec, ic, vec_name, kont)
  Implicit None
   Character(len=*) :: vec_name
   Integer, Intent(in) :: nmax, io, ic
   Complex(dp), Intent(inout) :: vec(nmax)
   Integer, Intent(out) :: kont

   Character(len=80) :: read_line
   Integer :: i1
   Real(dp) :: wert

   kont = 0

   Iname = Iname + 1
   NameOfUnit(Iname) = "ReadVectorC"
   Do 
    Read(io,*,End=200) read_line
!     Write(*,*) read_line
    If (read_line(1:1).Eq."#") Cycle ! ignore comments
    Backspace(io)                    ! resetting to the beginning of the line
    If ((read_line(1:1).Eq."B").Or.(read_line(1:1).Eq."b") ) Then
     Iname = Iname - 1
     Return ! new block
    End If

    Read(io,*) i1, wert, read_line

    If ((i1.Lt.1).Or.(i1.Gt.nmax)) Then
     Write(ErrCan,*) "Problem while reading "//vec_name//" in routine"// &
        & Trim(NameOfUnit(Iname))//", index i1=",i1
     Iname = Iname - 2
     kont = -305 
     Call TerminateProgram()
    End If

    If (ic.Eq.0) vec(i1) = Cmplx(0._dp, Aimag(vec(i1)), dp) + wert
    If (ic.Eq.1) vec(i1) = Real(vec(i1),dp) + Cmplx(0._dp, wert, dp)

   End Do

   200 Return

  End Subroutine ReadVectorC


Subroutine ReadScalarC(io, vec, ic, vec_name, kont)
  Implicit None
   Character(len=*) :: vec_name
   Integer, Intent(in) :: io, ic
   Complex(dp), Intent(inout) :: vec
   Integer, Intent(out) :: kont

   Character(len=80) :: read_line
   Integer :: i1
   Real(dp) :: wert

   kont = 0

   Iname = Iname + 1
   NameOfUnit(Iname) = "ReadVectorC"
   Do 
    Read(io,*,End=200) read_line
!     Write(*,*) read_line
    If (read_line(1:1).Eq."#") Cycle ! ignore comments
    Backspace(io)                    ! resetting to the beginning of the line
    If ((read_line(1:1).Eq."B").Or.(read_line(1:1).Eq."b") ) Then
     Iname = Iname - 1
     Return ! new block
    End If

    Read(io,*) wert, read_line

!     If ((i1.Lt.1).Or.(i1.Gt.nmax)) Then
!      Write(ErrCan,*) "Problem while reading "//vec_name//" in routine"// &
!         & Trim(NameOfUnit(Iname))//", index i1=",i1
!      Iname = Iname - 2
!      kont = -305 
!      Call TerminateProgram()
!     End If

    If (ic.Eq.0) vec = Cmplx(0._dp, Aimag(vec), dp) + wert
    If (ic.Eq.1) vec = Real(vec,dp) + Cmplx(0._dp, wert, dp)

   End Do

   200 Return

  End Subroutine ReadScalarC

  
  Subroutine ReadVectorR(io, nmax, vec, vec_name, kont)
  Implicit None
   Character(len=*) :: vec_name
   Integer, Intent(in) :: nmax, io
   Real(dp), Intent(inout) :: vec(nmax)
   Integer, Intent(out) :: kont

   Character(len=80) :: read_line
   Integer :: i1
   Real(dp) :: wert

   kont = 0

   Iname = Iname + 1
   NameOfUnit(Iname) = "ReadVectorR"
   Do 
    Read(io,*,End=200) read_line
!     Write(*,*) read_line
    If (read_line(1:1).Eq."#") Cycle ! ignore comments
    Backspace(io)                    ! resetting to the beginning of the line
    If ((read_line(1:1).Eq."B").Or.(read_line(1:1).Eq."b") ) Then
     Iname = Iname - 1
     Return ! new block
    End If

    Read(io,*) i1, wert, read_line

    If ((i1.Lt.1).Or.(i1.Gt.nmax)) Then
     Write(ErrCan,*) "Problem while reading "//vec_name//" in routine"// &
        & Trim(NameOfUnit(Iname))//", index i1=",i1
     Iname = Iname - 2
     kont = -305 
     Call TerminateProgram()
    End If

    vec(i1) = wert

   End Do

   200 Return

  End Subroutine ReadVectorR

Subroutine ReadScalarR(io, vec, vec_name, kont)
  Implicit None
   Character(len=*) :: vec_name
   Integer, Intent(in) :: io
   Real(dp), Intent(inout) :: vec
   Integer, Intent(out) :: kont

   Character(len=80) :: read_line
   Integer :: i1
   Real(dp) :: wert

   kont = 0

   Iname = Iname + 1
   NameOfUnit(Iname) = "ReadVectorR"
   Do 
    Read(io,*,End=200) read_line
!     Write(*,*) read_line
    If (read_line(1:1).Eq."#") Cycle ! ignore comments
    Backspace(io)                    ! resetting to the beginning of the line
    If ((read_line(1:1).Eq."B").Or.(read_line(1:1).Eq."b") ) Then
     Iname = Iname - 1
     Return ! new block
    End If

    Read(io,*) wert, read_line

!     If ((i1.Lt.1).Or.(i1.Gt.nmax)) Then
!      Write(ErrCan,*) "Problem while reading "//vec_name//" in routine"// &
!         & Trim(NameOfUnit(Iname))//", index i1=",i1
!      Iname = Iname - 2
!      kont = -305 
!      Call TerminateProgram()
!     End If

    vec = wert

   End Do

   200 Return

  End Subroutine ReadScalarR

  
  Subroutine ReadTensorC(io, nmax1, nmax2, nmax3, mat, ic, mat_name, kont)
  Implicit None
   Character(len=*) :: mat_name
   Integer, Intent(in) :: nmax1, nmax2, nmax3, io, ic
   Complex(dp), Intent(inout) :: mat(nmax1, nmax2, nmax3)
   Integer, Intent(out) :: kont

   Character(len=80) :: read_line
   Integer :: i1, i2, i3
   Real(dp) :: wert

   kont = 0

   Iname = Iname + 1
   NameOfUnit(Iname) = "ReadTensorC"
   Do 
    Read(io,*,End=200) read_line
!     Write(*,*) read_line
    If (read_line(1:1).Eq."#") Cycle ! ignore comments
    Backspace(io)                    ! resetting to the beginning of the line
    If ((read_line(1:1).Eq."B").Or.(read_line(1:1).Eq."b") ) Then
     Iname = Iname - 1
     Return ! new block
    End If

    Read(io,*) i1, i2, i3, wert, read_line

    If ((i1.Lt.1).Or.(i1.Gt.nmax1)) Then
     Write(ErrCan,*) "Problem while reading "//mat_name//" in routine"// &
        & Trim(NameOfUnit(Iname))//", index i1=",i1
     Iname = Iname - 2
     kont = -305 
     Call TerminateProgram()
    End If
    If ((i2.Lt.1).Or.(i2.Gt.nmax2)) Then
     Write(ErrCan,*) "Problem while reading "//mat_name//" in routine"// &
        & Trim(NameOfUnit(Iname))//", index i2=",i2
     Iname = Iname - 2
     kont = -305 
     Call TerminateProgram()
    End If
    If ((i3.Lt.1).Or.(i3.Gt.nmax3)) Then
     Write(ErrCan,*) "Problem while reading "//mat_name//" in routine"// &
        & Trim(NameOfUnit(Iname))//", index i3=",i3
     Iname = Iname - 2
     kont = -305 
     Call TerminateProgram()
    End If

    If (ic.Eq.0) mat(i1,i2,i3) = Cmplx(0._dp, Aimag(mat(i1,i2,i3)), dp) + wert
    If (ic.Eq.1) mat(i1,i2,i3) = mat(i1,i2,i3) + Cmplx(0._dp, wert, dp)

   End Do

   200 Return

  End Subroutine ReadTensorC

 Subroutine SetWriteMinBR(wert)
 !-------------------------------------------------------------------
 ! sets the minimal branching ratio (=wert) appearing in the output
 !-------------------------------------------------------------------
 Implicit None
  Real(dp), Intent(in) :: wert
  BrMin = wert
 End Subroutine SetWriteMinBR


 Subroutine SetWriteMinSig(wert)
 !-------------------------------------------------------------------
 ! sets the minimal cross section (=wert) appearing in the output
 !-------------------------------------------------------------------
 Implicit None
  Real(dp), Intent(in) :: wert
  SigMin = wert
 End Subroutine SetWriteMinSig

 Subroutine Warn_CPV(i_cpv, name)
  Implicit None 
   Integer, Intent(in) :: i_cpv
   Character(len=*), Intent(in) :: name
   If (i_cpv.Eq.0) Write(ErrCan,*) "CP violation is switched off"
   If (i_cpv.Eq.1) Write(ErrCan,*) "CP violation beyond CKM is switched off"
   Write(ErrCan,*) "Ignoring block "//Trim(name)
   If (ErrorLevel.Eq.2) Call TerminateProgram
  End Subroutine Warn_CPV

Subroutine PutUpperCase(name)
 Implicit None
  Character(len=80), Intent(inout) :: name
  Integer :: len=80, i1
  Do i1=1,len
   If (name(i1:i1).Eq."a") name(i1:i1) = "A"
   If (name(i1:i1).Eq."b") name(i1:i1) = "B"
   If (name(i1:i1).Eq."c") name(i1:i1) = "C"
   If (name(i1:i1).Eq."d") name(i1:i1) = "D"
   If (name(i1:i1).Eq."e") name(i1:i1) = "E"
   If (name(i1:i1).Eq."f") name(i1:i1) = "F"
   If (name(i1:i1).Eq."g") name(i1:i1) = "G"
   If (name(i1:i1).Eq."h") name(i1:i1) = "H"
   If (name(i1:i1).Eq."i") name(i1:i1) = "I"
   If (name(i1:i1).Eq."j") name(i1:i1) = "J"
   If (name(i1:i1).Eq."k") name(i1:i1) = "K"
   If (name(i1:i1).Eq."l") name(i1:i1) = "L"
   If (name(i1:i1).Eq."m") name(i1:i1) = "M"
   If (name(i1:i1).Eq."n") name(i1:i1) = "N"
   If (name(i1:i1).Eq."o") name(i1:i1) = "O"
   If (name(i1:i1).Eq."p") name(i1:i1) = "P"
   If (name(i1:i1).Eq."q") name(i1:i1) = "Q"
   If (name(i1:i1).Eq."r") name(i1:i1) = "R"
   If (name(i1:i1).Eq."s") name(i1:i1) = "S"
   If (name(i1:i1).Eq."t") name(i1:i1) = "T"
   If (name(i1:i1).Eq."u") name(i1:i1) = "U"
   If (name(i1:i1).Eq."v") name(i1:i1) = "V"
   If (name(i1:i1).Eq."w") name(i1:i1) = "W"
   If (name(i1:i1).Eq."x") name(i1:i1) = "X"
   If (name(i1:i1).Eq."y") name(i1:i1) = "Y"
   If (name(i1:i1).Eq."z") name(i1:i1) = "Z"
  End Do
 End Subroutine PutUpperCase

Subroutine Read_FLIFE(io) 
Implicit None 
Integer,Intent(in)::io 
Real(dp)::r_mod,wert 
Integer::i_mod,i_test,i_rp 
Character(len=80)::read_line 
Do 
Read(io,*) read_line 
If (read_line(1:1).Eq."#") Cycle! this loop 
Backspace(io)! resetting to the beginning of the line
If ((read_line(1:1).Eq."B").Or.(read_line(1:1).Eq."b")) Exit! this loop 
Read(io,*) i_test,wert!,read_line 
   if (i_test.Eq.111) Then 
    tau_pi0 =wert 
  Else if (i_test.Eq.211) Then 
    tau_pip =wert 
  Else if (i_test.Eq.113) Then 
    tau_rho0 =wert 
  Else if (i_test.Eq.421) Then 
    tau_D0 =wert 
  Else if (i_test.Eq.411) Then 
    tau_Dp =wert 
  Else if (i_test.Eq.431) Then 
    tau_DSp =wert 
  Else if (i_test.Eq.433) Then 
    tau_DSsp =wert 
  Else if (i_test.Eq.221) Then 
    tau_eta =wert 
  Else if (i_test.Eq.331) Then 
    tau_etap =wert 
  Else if (i_test.Eq.223) Then 
    tau_omega =wert 
  Else if (i_test.Eq.333) Then 
    tau_phi =wert 
  Else if (i_test.Eq.130) Then 
    tau_KL0 =wert 
  Else if (i_test.Eq.310) Then 
    tau_KS0 =wert 
  Else if (i_test.Eq.311) Then 
    tau_K0 =wert 
  Else if (i_test.Eq.321) Then 
    tau_Kp =wert 
  Else if (i_test.Eq.511) Then 
    tau_B0d =wert 
  Else if (i_test.Eq.531) Then 
    tau_B0s =wert 
  Else if (i_test.Eq.521) Then 
    tau_Bp =wert 
  Else if (i_test.Eq.513) Then 
    tau_B0c =wert 
  Else if (i_test.Eq.523) Then 
    tau_Bpc =wert 
  Else if (i_test.Eq.541) Then 
    tau_Bcp =wert 
  Else if (i_test.Eq.313) Then 
    tau_K0c =wert 
  Else if (i_test.Eq.323) Then 
    tau_Kpc =wert 
  Else if (i_test.Eq.441) Then 
    tau_etac =wert 
  Else if (i_test.Eq.443) Then 
    tau_JPsi =wert 
  Else if (i_test.Eq.553) Then 
    tau_Ups =wert 
End If 
End Do! i_mod 
End Subroutine Read_FLIFE 


Subroutine Read_FMASS(io) 
Implicit None 
Integer,Intent(in)::io 
Real(dp)::r_mod,wert 
Integer::i_mod,i_test,i_rp 
Character(len=80)::read_line 
Do 
Read(io,*) read_line 
If (read_line(1:1).Eq."#") Cycle! this loop 
Backspace(io)! resetting to the beginning of the line
If ((read_line(1:1).Eq."B").Or.(read_line(1:1).Eq."b")) Exit! this loop 
Read(io,*) i_test,wert!,read_line 
   if (i_test.Eq.111) Then 
    mass_pi0 =wert 
  Else if (i_test.Eq.211) Then 
    mass_pip =wert 
  Else if (i_test.Eq.113) Then 
    mass_rho0 =wert 
  Else if (i_test.Eq.421) Then 
    mass_D0 =wert 
  Else if (i_test.Eq.411) Then 
    mass_Dp =wert 
  Else if (i_test.Eq.431) Then 
    mass_DSp =wert 
  Else if (i_test.Eq.433) Then 
    mass_DSsp =wert 
  Else if (i_test.Eq.221) Then 
    mass_eta =wert 
  Else if (i_test.Eq.331) Then 
    mass_etap =wert 
  Else if (i_test.Eq.223) Then 
    mass_omega =wert 
  Else if (i_test.Eq.333) Then 
    mass_phi =wert 
  Else if (i_test.Eq.130) Then 
    mass_KL0 =wert 
  Else if (i_test.Eq.310) Then 
    mass_KS0 =wert 
  Else if (i_test.Eq.311) Then 
    mass_K0 =wert 
  Else if (i_test.Eq.321) Then 
    mass_Kp =wert 
  Else if (i_test.Eq.511) Then 
    mass_B0d =wert 
  Else if (i_test.Eq.531) Then 
    mass_B0s =wert 
  Else if (i_test.Eq.521) Then 
    mass_Bp =wert 
  Else if (i_test.Eq.513) Then 
    mass_B0c =wert 
  Else if (i_test.Eq.523) Then 
    mass_Bpc =wert 
  Else if (i_test.Eq.541) Then 
    mass_Bcp =wert 
  Else if (i_test.Eq.313) Then 
    mass_K0c =wert 
  Else if (i_test.Eq.323) Then 
    mass_Kpc =wert 
  Else if (i_test.Eq.441) Then 
    mass_etac =wert 
  Else if (i_test.Eq.443) Then 
    mass_JPSi =wert 
  Else if (i_test.Eq.553) Then 
    mass_Ups =wert 
End If 
End Do! i_mod 
End Subroutine Read_FMASS 


Subroutine Read_FCONST(io) 
Implicit None 
Integer,Intent(in)::io 
Real(dp)::r_mod,wert 
Integer::i_mod,i_test,i_rp 
Character(len=80)::read_line 
Do 
Read(io,*) read_line 
If (read_line(1:1).Eq."#") Cycle! this loop 
Backspace(io)! resetting to the beginning of the line
If ((read_line(1:1).Eq."B").Or.(read_line(1:1).Eq."b")) Exit! this loop 
Read(io,*) i_test, i_mod, wert!,read_line 
    If (i_test.Eq.111) Then 
    If (i_mod.Eq.1) Then 
    f_pi_CONST =wert 
    End If 
   Else If (i_test.Eq.213) Then 
    If (i_mod.Eq.1) Then 
    f_rho_CONST =wert 
   Else If (i_mod.Eq.11) Then 
    h_rho_CONST =wert 
    End If 
   Else If (i_test.Eq.221) Then 
    If (i_mod.Eq.1) Then 
    f_eta_q_CONST =wert 
   Else If (i_mod.Eq.2) Then 
    f_eta_s_CONST =wert 
   Else If (i_mod.Eq.11) Then 
    h_eta_q_CONST =wert 
   Else If (i_mod.Eq.12) Then 
    h_eta_s_CONST =wert 
    End If 
   Else If (i_test.Eq.223) Then 
    If (i_mod.Eq.1) Then 
    f_omega_q_CONST =wert 
   Else If (i_mod.Eq.2) Then 
    f_omega_s_CONST =wert 
   Else If (i_mod.Eq.11) Then 
    h_omega_q_CONST =wert 
   Else If (i_mod.Eq.12) Then 
    h_omega_s_CONST =wert 
    End If 
   Else If (i_test.Eq.231) Then 
    If (i_mod.Eq.1) Then 
    f_etap_CONST =wert 
    End If 
   Else If (i_test.Eq.311) Then 
    If (i_mod.Eq.1) Then 
    f_k_CONST =wert 
    End If 
   Else If (i_test.Eq.321) Then 
    If (i_mod.Eq.1) Then 
    f_Kp_CONST =wert 
   Else If (i_mod.Eq.11) Then 
    h_k_CONST =wert 
    End If 
   Else If (i_test.Eq.411) Then 
    If (i_mod.Eq.1) Then 
    f_Dp_CONST =wert 
    End If 
   Else If (i_test.Eq.421) Then 
    If (i_mod.Eq.1) Then 
    f_D_CONST =wert 
    End If 
   Else If (i_test.Eq.431) Then 
    If (i_mod.Eq.1) Then 
    f_Dsp_CONST =wert 
    End If 
   Else If (i_test.Eq.511) Then 
    If (i_mod.Eq.1) Then 
    f_B0d_CONST =wert 
    End If 
   Else If (i_test.Eq.521) Then 
    If (i_mod.Eq.1) Then 
    f_Bp_CONST =wert 
    End If 
   Else If (i_test.Eq.531) Then 
    If (i_mod.Eq.1) Then 
    f_B0s_CONST =wert 
    End If 
End If 
End Do! i_mod 
End Subroutine Read_FCONST 


Subroutine Read_GAUGEIN(io,i_c,i_model,set_mod_par,kont) 
Implicit None 
Integer,Intent(in)::io,i_c,i_model 
Integer,Intent(inout)::kont,set_mod_par(:) 
Integer::i_par 
Real(dp)::wert 
Character(len=80)::read_line 
Do 
Read(io,*,End=200) read_line 
If (read_line(1:1).Eq."#") Cycle! this loop 
Backspace(io)! resetting to the beginning of the line 
If ((read_line(1:1).Eq."B").Or.(read_line(1:1).Eq."b")) Exit! this loop 
Read(io,*) i_par,wert!,read_line 
If (i_par.Eq.4) Then 
gBLIN= wert 
InputValueforgBL= .True. 
Else If (i_par.Eq.2) Then 
g2IN= wert 
InputValueforg2= .True. 
Else If (i_par.Eq.5) Then 
gRIN= wert 
InputValueforgR= .True. 
Else If (i_par.Eq.3) Then 
g3IN= wert 
InputValueforg3= .True. 
Else
Write(ErrCan,*) "Error in routine "//NameOfUnit(Iname)
If (i_c.Eq.0) Write(ErrCan,*) "Unknown entry for Block GAUGEIN ",i_par
If (i_c.Eq.1) Write(ErrCan,*) "Unknown entry for Block IMGAUGEIN ",i_par
If (i_c.Eq.0) Write(*,*) "Unknown entry for Block GAUGEIN ",i_par
If (i_c.Eq.1) Write(*,*) "Unknown entry for Block IMGAUGEIN ",i_par
Call AddError(304)
If (ErrorLevel.Eq.2) Call TerminateProgram
End If
End Do! i_par
200 Return
End Subroutine Read_GAUGEIN 
 
 
Subroutine Read_LRINPUTIN(io,i_c,i_model,set_mod_par,kont) 
Implicit None 
Integer,Intent(in)::io,i_c,i_model 
Integer,Intent(inout)::kont,set_mod_par(:) 
Integer::i_par 
Real(dp)::wert 
Character(len=80)::read_line 
Do 
Read(io,*,End=200) read_line 
If (read_line(1:1).Eq."#") Cycle! this loop 
Backspace(io)! resetting to the beginning of the line 
If ((read_line(1:1).Eq."B").Or.(read_line(1:1).Eq."b")) Exit! this loop 
Read(io,*) i_par,wert!,read_line 
If (i_par.Eq.9) Then 
RHO2IN= wert 
InputValueforRHO2= .True. 
Else If (i_par.Eq.7) Then 
RHO1IN= wert 
InputValueforRHO1= .True. 
Else If (i_par.Eq.14) Then 
ALP1IN= wert 
InputValueforALP1= .True. 
Else If (i_par.Eq.1) Then 
LAM1IN= wert 
InputValueforLAM1= .True. 
Else If (i_par.Eq.20) Then 
ALP3IN= wert 
InputValueforALP3= .True. 
Else If (i_par.Eq.16) Then 
ALP2IN= wert 
InputValueforALP2= .True. 
Else If (i_par.Eq.5) Then 
LAM4IN= wert 
InputValueforLAM4= .True. 
Else If (i_par.Eq.2) Then 
LAM2IN= wert 
InputValueforLAM2= .True. 
Else If (i_par.Eq.4) Then 
LAM3IN= wert 
InputValueforLAM3= .True. 
Else If (i_par.Eq.202) Then 
LAMT1IN= wert 
InputValueforLAMT1= .True. 
Else If (i_par.Eq.203) Then 
LAMT2IN= wert 
InputValueforLAMT2= .True. 
Else If (i_par.Eq.200) Then 
M1IN= wert 
InputValueforM1= .True. 
Else If (i_par.Eq.201) Then 
M23IN= wert 
InputValueforM23= .True. 
Else If (i_par.Eq.103) Then 
mu32IN= wert 
InputValueformu32= .True. 
Else If (i_par.Eq.98) Then 
MU22IN= wert 
InputValueforMU22= .True. 
Else If (i_par.Eq.100) Then 
MU12IN= wert 
InputValueforMU12= .True. 
Else
Write(ErrCan,*) "Error in routine "//NameOfUnit(Iname)
If (i_c.Eq.0) Write(ErrCan,*) "Unknown entry for Block LRINPUTIN ",i_par
If (i_c.Eq.1) Write(ErrCan,*) "Unknown entry for Block IMLRINPUTIN ",i_par
If (i_c.Eq.0) Write(*,*) "Unknown entry for Block LRINPUTIN ",i_par
If (i_c.Eq.1) Write(*,*) "Unknown entry for Block IMLRINPUTIN ",i_par
Call AddError(304)
If (ErrorLevel.Eq.2) Call TerminateProgram
End If
End Do! i_par
200 Return
End Subroutine Read_LRINPUTIN 
 
 
Subroutine Read_VEVIN(io,i_c,i_model,set_mod_par,kont) 
Implicit None 
Integer,Intent(in)::io,i_c,i_model 
Integer,Intent(inout)::kont,set_mod_par(:) 
Integer::i_par 
Real(dp)::wert 
Character(len=80)::read_line 
Do 
Read(io,*,End=200) read_line 
If (read_line(1:1).Eq."#") Cycle! this loop 
Backspace(io)! resetting to the beginning of the line 
If ((read_line(1:1).Eq."B").Or.(read_line(1:1).Eq."b")) Exit! this loop 
Read(io,*) i_par,wert!,read_line 
If (i_par.Eq.4) Then 
vRIN= wert 
Else If (i_par.Eq.1) Then 
vdIN= wert 
Else If (i_par.Eq.2) Then 
vuIN= wert 
Else If (i_par.Eq.4) Then 
vRIN= wert 
Else
Write(ErrCan,*) "Error in routine "//NameOfUnit(Iname)
If (i_c.Eq.0) Write(ErrCan,*) "Unknown entry for Block VEVIN ",i_par
If (i_c.Eq.1) Write(ErrCan,*) "Unknown entry for Block IMVEVIN ",i_par
If (i_c.Eq.0) Write(*,*) "Unknown entry for Block VEVIN ",i_par
If (i_c.Eq.1) Write(*,*) "Unknown entry for Block IMVEVIN ",i_par
Call AddError(304)
If (ErrorLevel.Eq.2) Call TerminateProgram
End If
End Do! i_par
200 Return
End Subroutine Read_VEVIN 
 
 
Subroutine Read_PHASETIN(io,i_c,i_model,set_mod_par,kont) 
Implicit None 
Integer,Intent(in)::io,i_c,i_model 
Integer,Intent(inout)::kont,set_mod_par(:) 
Integer::i_par 
Real(dp)::wert 
Character(len=80)::read_line 
Do 
Read(io,*,End=200) read_line 
If (read_line(1:1).Eq."#") Cycle! this loop 
Backspace(io)! resetting to the beginning of the line 
If ((read_line(1:1).Eq."B").Or.(read_line(1:1).Eq."b")) Exit! this loop 
Read(io,*) i_par,wert!,read_line 
End Do! i_par
200 Return
End Subroutine Read_PHASETIN 
 
 
Subroutine Read_THETAWIN(io,i_c,i_model,set_mod_par,kont) 
Implicit None 
Integer,Intent(in)::io,i_c,i_model 
Integer,Intent(inout)::kont,set_mod_par(:) 
Integer::i_par 
Real(dp)::wert 
Character(len=80)::read_line 
Do 
Read(io,*,End=200) read_line 
If (read_line(1:1).Eq."#") Cycle! this loop 
Backspace(io)! resetting to the beginning of the line 
If ((read_line(1:1).Eq."B").Or.(read_line(1:1).Eq."b")) Exit! this loop 
Read(io,*) i_par,wert!,read_line 
End Do! i_par
200 Return
End Subroutine Read_THETAWIN 
 
 
Subroutine Read_PHIWIN(io,i_c,i_model,set_mod_par,kont) 
Implicit None 
Integer,Intent(in)::io,i_c,i_model 
Integer,Intent(inout)::kont,set_mod_par(:) 
Integer::i_par 
Real(dp)::wert 
Character(len=80)::read_line 
Do 
Read(io,*,End=200) read_line 
If (read_line(1:1).Eq."#") Cycle! this loop 
Backspace(io)! resetting to the beginning of the line 
If ((read_line(1:1).Eq."B").Or.(read_line(1:1).Eq."b")) Exit! this loop 
Read(io,*) i_par,wert!,read_line 
End Do! i_par
200 Return
End Subroutine Read_PHIWIN 
 
 
Subroutine SLHA1converter(MSd,MSd2, MSu,MSu2, MSe, MSe2, MSv, MSv2, &
   & ZD,ZU,ZE,ZV,Ztop,Zbottom,Ztau,  &
   & PDGd, PDGu, PDGe, PDGv, NamesD, NamesU, NamesE, NamesV)
Implicit None
Real(dp), Intent(inout) :: MSd(6), MSu(6), MSe(6), MSv(3), MSd2(6), MSu2(6), MSe2(6), MSv2(3)
Character(len=30),Dimension(6), Intent(inout) :: NamesD, NamesU, NamesE
Character(len=30),Dimension(3), Intent(inout) :: NamesV
Complex(dp), Intent(inout) :: PDGd(6), PDGu(6), PDGe(6), PDGv(3)
Complex(dp), Intent(in) :: ZU(6,6), ZD(6,6), ZE(6,6), ZV(3,3)
Complex(dp), Intent(out) :: Ztop(2,2), Zbottom(2,2), Ztau(2,2)
Real(dp) :: MSdt(6), MSut(6), MSet(6), MSvt(3)
Character(len=30),Dimension(6) :: NamesDt, NamesUt, NamesEt
Character(len=30),Dimension(3) :: NamesVt
Complex(dp) :: PDGdt(6), PDGut(6), PDGet(6), PDGvt(3)


Integer :: i1, i2, i3, ii, jj, i_zaehl


! Down-Squark

Call CheckMixingMatrix6(ZD, Zbottom,MSd,MSdt, PDGd, PDGdt, NamesD, NamesDt, 1)
!GammaD = GammaDt
!BrD = BrDt
PDGd = PDGdt
NamesD = NamesDt
! MSd = MSdt
! MSd2 = MSdt**2
   

! Up-Squark

Call CheckMixingMatrix6(ZU, Ztop,MSu,MSut, PDGu, PDGut, NamesU, NamesUt,2)
!GammaU = GammaUt
!BrU = BrUt
PDGu = PDGut
NamesU = NamesUt
! MSu = MSut
! MSu2 = MSut**2


! Selectron

Call CheckMixingMatrix6(ZE, Ztau,MSe,MSet, PDGe, PDGet, NamesE, NamesEt,3)
!GammaE = GammaEt
PDGe = PDGet
NamesE = NamesEt
!BrE = BrEt
! MSe = MSet
! MSe2 = MSet**2

! Sneutrino

Call CheckMixingMatrix3(ZV, MSv,MSvt, PDGv, PDGvt, NamesV, NamesVt)
!GammaV = GammaVt
PDGv = PDGvt
NamesV = NamesVt
!BrV = BrVt
! MSv = MSvt
! MSv2 = MSvt**2

Contains 

Subroutine CheckMixingMatrix6(Z,Z_out,m_in,m_out, PDG_in, PDG_out, Names_in, Names_out,particle)
Implicit None
Complex(dp), Intent(in) :: Z(6,6)
Complex(dp), Intent(out) :: Z_out(2,2)
Character(len=30),Dimension(6), Intent(in) :: Names_in
Character(len=30),Dimension(6), Intent(out) :: Names_out
Character(len=30) :: Names_temp, Names_save(6)
Complex(dp), Intent(in) :: PDG_in(6)
Complex(dp), Intent(out) :: PDG_out(6)
Complex(dp) :: PDG_temp, PDG_save(6)
Real(dp), Intent(in) :: m_in(6)
Real(dp) :: mat6R(6,6), mtemp, Maxcont, Z_temp(2)
Integer, Intent(in) ::particle
Real(dp), Intent(out) :: m_out(6)
Integer :: i1, ii, jj, PDG3, PDG6

      Select Case(particle)
       Case(1)  ! d-squark
          Names_save(1) = "SdL"
          Names_save(2) = "SsL"
          Names_save(3) = "Sb1" 
          Names_save(4) = "SdR"
          Names_save(5) = "SsR"
          Names_save(6) = "Sb2" 
          PDG_save(1) = 1000001
          PDG_save(2) = 1000003
          PDG_save(3) = 1000005
          PDG_save(4) = 2000001
          PDG_save(5) = 2000003
          PDG_save(6) = 2000005
       Case(2)  ! u-squark
          Names_save(1) = "SuL"
          Names_save(2) = "ScL"
          Names_save(3) = "St1" 
          Names_save(4) = "SuR"
          Names_save(5) = "ScR"
          Names_save(6) = "St2"
          PDG_save(1) = 1000002
          PDG_save(2) = 1000004
          PDG_save(3) = 1000006
          PDG_save(4) = 2000002
          PDG_save(5) = 2000004
          PDG_save(6) = 2000006 
       Case(3)  ! selectron
          Names_save(1) = "SeL"
          Names_save(2) = "SmuL"
          Names_save(3) = "Stau1" 
          Names_save(4) = "SeR"
          Names_save(5) = "SmuR"
          Names_save(6) = "Stau2"
          PDG_save(1) = 1000011
          PDG_save(2) = 1000013
          PDG_save(3) = 1000015
          PDG_save(4) = 2000011
          PDG_save(5) = 2000013
          PDG_save(6) = 2000015 
      End Select


     mat6R = Abs(Z)
     Do i1=1,6
      jj = Maxloc(mat6R(i1,:),1)
      m_out(jj) = m_in(i1)
      PDG_out(i1) = PDG_save(jj)
      Names_out(i1) = Names_save(jj)
      If (jj.eq.3) Then
         Z_out(1,1) = MaxVal(mat6R(i1,:))
         PDG3 = i1
      End if
      If (jj.eq.6) Then
          Z_out(2,2) = MaxVal(mat6R(i1,:)) 
          PDG6 = i1
      End if
!       mat6R(ii,:) = 0._dp
!       mat6R(:,jj) = 0._dp
     End Do
      Z_out(1,2) = sqrt(1._dp - Z_out(1,1)**2)
      Z_out(2,1) = -Z_out(1,2)
     If (M_out(3).gt.M_out(6)) Then

      Names_out(PDG3) = Names_save(6)
      Names_out(PDG6) = Names_save(3) 

      PDG_out(PDG3) = PDG_save(6)
      PDG_out(PDG6) = PDG_save(3) 

      Z_temp = Z_out(1,:)
      Z_out(1,:) = Z_out(2,:)
      Z_out(2,:) = Z_temp
     End if






End Subroutine CheckMixingMatrix6


Subroutine CheckMixingMatrix3(Z,m_in,m_out, PDG_in, PDG_out, Names_in, Names_out)
Implicit None
Complex(dp), Intent(in) :: Z(3,3)
Real(dp), Intent(in) :: m_in(3)
Character(len=30),Dimension(3), Intent(in) :: Names_in
Character(len=30),Dimension(3), Intent(out) :: Names_out
Character(len=30),Dimension(3) :: Names_save
Complex(dp), Intent(in) :: PDG_in(3)
Complex(dp), Intent(out) :: PDG_out(3)
Complex(dp) :: PDG_save(3)
Real(dp), Intent(out) :: m_out(3)
Real(dp) :: mat6R(3,3), mtemp, Maxcont
Integer :: i1, ii, jj

          PDG_save(1) = 1000012
          PDG_save(2) = 1000014
          PDG_save(3) = 1000016
          Names_save(1) = "Snu_e"
          Names_save(2) = "Snu_mu"
          Names_save(3) = "Snu_tau" 

     mat6R = Abs(Z)
     Do i1=1,3
      jj = Maxloc(mat6R(i1,:),1)
      m_out(jj) = m_in(i1)
      PDG_out(i1) = PDG_save(jj)
      Names_out(i1) = Names_save(jj)
!       mat6R(ii,:) = 0._dp
!       mat6R(:,jj) = 0._dp
     End Do

End Subroutine CheckMixingMatrix3


End Subroutine SLHA1converter
End Module InputOutput_tripletLR 
 

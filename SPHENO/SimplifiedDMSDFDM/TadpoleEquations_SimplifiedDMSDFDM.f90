! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.8.5 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 23:19 on 17.6.2016   
! ----------------------------------------------------------------------  
 
 
Module Tadpoles_SimplifiedDMSDFDM 
 
Use Model_Data_SimplifiedDMSDFDM 
Use SUSYMasses_SimplifiedDMSDFDM 
Use RGEs_SimplifiedDMSDFDM 
Use Control 

Use Mathematics 

Contains 


Subroutine SolveTadpoleEquations(g1,g2,g3,Lam,Yu,Yd,Ye,YR3,YR4,Mn,MDF,mu2,            & 
& v,Tad1Loop)

Implicit None
Real(dp),Intent(inout) :: g1,g2,g3,YR3,YR4,v

Complex(dp),Intent(inout) :: Lam,Yu(3,3),Yd(3,3),Ye(3,3),Mn,MDF,mu2

Complex(dp), Intent(in) :: Tad1Loop(1)

! For numerical routines 
Real(dp) :: gC(68)
logical :: broycheck 
Real(dp) :: broyx(1)

If (HighScaleModel.Eq."LOW") Then 
mu2 = -(Lam*v**2)/2._dp + Tad1Loop(1)/v

 ! ----------- Check solutions for consistency  -------- 

 ! Check for NaNs 
If (Real(mu2,dp).ne.Real(mu2,dp)) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for mu2" 
   Call TerminateProgram  
 End If 
 If (Abs(AImag(mu2)).gt.1.0E-04_dp) Then 
   Write(*,*) "No real solution of tadpole equations for mu2" 
   !Call TerminateProgram  
   mu2 = Real(mu2,dp) 
  SignOfMuChanged= .True. 
End If 
 Else 
mu2 = -(Lam*v**2)/2._dp + Tad1Loop(1)/v

 ! ----------- Check solutions for consistency  -------- 

 ! Check for NaNs 
If (Real(mu2,dp).ne.Real(mu2,dp)) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for mu2" 
   Call TerminateProgram  
 End If 
 If (Abs(AImag(mu2)).gt.1.0E-04_dp) Then 
   Write(*,*) "No real solution of tadpole equations for mu2" 
   !Call TerminateProgram  
   mu2 = Real(mu2,dp) 
  SignOfMuChanged= .True. 
End If 
 End if 
End Subroutine SolveTadpoleEquations

Subroutine CalculateTadpoles(g1,g2,g3,Lam,Yu,Yd,Ye,YR3,YR4,Mn,MDF,mu2,v,              & 
& Tad1Loop,TadpoleValues)

Real(dp),Intent(in) :: g1,g2,g3,YR3,YR4,v

Complex(dp),Intent(in) :: Lam,Yu(3,3),Yd(3,3),Ye(3,3),Mn,MDF,mu2

Complex(dp), Intent(in) :: Tad1Loop(1)

Real(dp), Intent(out) :: TadpoleValues(1)

TadpoleValues(1) = Real(mu2*v + (Lam*v**3)/2._dp - Tad1Loop(1),dp) 
End Subroutine CalculateTadpoles 

End Module Tadpoles_SimplifiedDMSDFDM 
 

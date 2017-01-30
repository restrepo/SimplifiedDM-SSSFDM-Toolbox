! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.9.1 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 16:55 on 30.1.2017   
! ----------------------------------------------------------------------  
 
 
Module Tadpoles_SimplifiedDMSSSFDM 
 
Use Model_Data_SimplifiedDMSSSFDM 
Use TreeLevelMasses_SimplifiedDMSSSFDM 
Use RGEs_SimplifiedDMSSSFDM 
Use Control 

Use Mathematics 

Contains 


Subroutine SolveTadpoleEquations(g1,g2,g3,LS,LSH,Lam,Yu,Ys,Yd,Ye,MFS,MS2,             & 
& Mu,v,Tad1Loop)

Implicit None
Real(dp),Intent(inout) :: g1,g2,g3,Ys(3),MS2,v

Complex(dp),Intent(inout) :: LS,LSH,Lam,Yu(3,3),Yd(3,3),Ye(3,3),MFS,Mu

Complex(dp), Intent(in) :: Tad1Loop(1)

! For numerical routines 
Real(dp) :: gC(72)
logical :: broycheck 
Real(dp) :: broyx(1)

If (HighScaleModel.Eq."LOW") Then 
Mu = -(Lam*v**2)/2._dp + Tad1Loop(1)/v

 ! ----------- Check solutions for consistency  -------- 

 ! Check for NaNs 
If (Real(Mu,dp).ne.Real(Mu,dp)) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for Mu" 
   Call TerminateProgram  
 End If 
 If (Abs(AImag(Mu)).gt.1.0E-04_dp) Then 
   Write(*,*) "No real solution of tadpole equations for Mu" 
   !Call TerminateProgram  
   Mu = Real(Mu,dp) 
  SignOfMuChanged= .True. 
End If 
 Else 
Mu = -(Lam*v**2)/2._dp + Tad1Loop(1)/v

 ! ----------- Check solutions for consistency  -------- 

 ! Check for NaNs 
If (Real(Mu,dp).ne.Real(Mu,dp)) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for Mu" 
   Call TerminateProgram  
 End If 
 If (Abs(AImag(Mu)).gt.1.0E-04_dp) Then 
   Write(*,*) "No real solution of tadpole equations for Mu" 
   !Call TerminateProgram  
   Mu = Real(Mu,dp) 
  SignOfMuChanged= .True. 
End If 
 End if 
End Subroutine SolveTadpoleEquations

Subroutine CalculateTadpoles(g1,g2,g3,LS,LSH,Lam,Yu,Ys,Yd,Ye,MFS,MS2,Mu,              & 
& v,Tad1Loop,TadpoleValues)

Real(dp),Intent(in) :: g1,g2,g3,Ys(3),MS2,v

Complex(dp),Intent(in) :: LS,LSH,Lam,Yu(3,3),Yd(3,3),Ye(3,3),MFS,Mu

Complex(dp), Intent(in) :: Tad1Loop(1)

Real(dp), Intent(out) :: TadpoleValues(1)

TadpoleValues(1) = Real(Mu*v + (Lam*v**3)/2._dp - Tad1Loop(1),dp) 
End Subroutine CalculateTadpoles 

End Module Tadpoles_SimplifiedDMSSSFDM 
 

! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.5.8 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 11:44 on 28.11.2015   
! ----------------------------------------------------------------------  
 
 
Module Tadpoles_Scotogenic 
 
Use Model_Data_Scotogenic 
Use SUSYMasses_Scotogenic 
Use RGEs_Scotogenic 
Use Control 

Use Mathematics 

Contains 


Subroutine SolveTadpoleEquations(g1,g2,g3,lam1,lam2,lam4,lam3,lam5,Yn,Yu,             & 
& Yd,Ye,Mn,mH2,mEt2,v,Tad1Loop)

Implicit None
Real(dp),Intent(inout) :: g1,g2,g3,lam5,v

Complex(dp),Intent(inout) :: lam1,lam2,lam4,lam3,Yn(3,3),Yu(3,3),Yd(3,3),Ye(3,3),Mn(3,3),mH2,mEt2

Complex(dp), Intent(in) :: Tad1Loop(2)

! For numerical routines 
Real(dp) :: gC(107)
logical :: broycheck 
Real(dp) :: broyx(1)

If (HighScaleModel.Eq."LOW") Then 
mH2 = (lam1*v**2)/2._dp - Tad1Loop(1)/v

 ! ----------- Check solutions for consistency  -------- 

 ! Check for NaNs 
If (Real(mH2,dp).ne.Real(mH2,dp)) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for mH2" 
   Call TerminateProgram  
 End If 
 If (Abs(AImag(mH2)).gt.1.0E-04_dp) Then 
   Write(*,*) "No real solution of tadpole equations for mH2" 
   Call TerminateProgram  
 End If 
 Else 
mH2 = (lam1*v**2)/2._dp - Tad1Loop(1)/v

 ! ----------- Check solutions for consistency  -------- 

 ! Check for NaNs 
If (Real(mH2,dp).ne.Real(mH2,dp)) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for mH2" 
   Call TerminateProgram  
 End If 
 If (Abs(AImag(mH2)).gt.1.0E-04_dp) Then 
   Write(*,*) "No real solution of tadpole equations for mH2" 
   Call TerminateProgram  
 End If 
 End if 
End Subroutine SolveTadpoleEquations

Subroutine CalculateTadpoles(g1,g2,g3,lam1,lam2,lam4,lam3,lam5,Yn,Yu,Yd,              & 
& Ye,Mn,mH2,mEt2,v,Tad1Loop,TadpoleValues)

Real(dp),Intent(in) :: g1,g2,g3,lam5,v

Complex(dp),Intent(in) :: lam1,lam2,lam4,lam3,Yn(3,3),Yu(3,3),Yd(3,3),Ye(3,3),Mn(3,3),mH2,mEt2

Complex(dp), Intent(in) :: Tad1Loop(1)

Real(dp), Intent(out) :: TadpoleValues(1)

TadpoleValues(1) = Real(-(mH2*v) + (lam1*v**3)/2._dp - Tad1Loop(1),dp) 
End Subroutine CalculateTadpoles 

End Module Tadpoles_Scotogenic 
 

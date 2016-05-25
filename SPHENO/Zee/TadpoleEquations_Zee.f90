! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.8.5 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 23:15 on 24.5.2016   
! ----------------------------------------------------------------------  
 
 
Module Tadpoles_Zee 
 
Use Model_Data_Zee 
Use SUSYMasses_Zee 
Use RGEs_Zee 
Use Control 

Use Mathematics 

Contains 


Subroutine SolveTadpoleEquations(g1,g2,g3,Lam6,Lam5,Lam7,Lam10,Lam1,Lam4,             & 
& Lam3,Lam2,Lam8,Lam9,Lamh,epsU,Yu,Yd,Ye,epsD,epsE,Yh,Mu,M12,M112,M222,Mh,               & 
& vd,vu,Tad1Loop)

Implicit None
Real(dp),Intent(inout) :: g1,g2,g3,Lam6,Lam5,Lam7,Lam10,Mu,M12,vd,vu

Complex(dp),Intent(inout) :: Lam1,Lam4,Lam3,Lam2,Lam8,Lam9,Lamh,epsU(3,3),Yu(3,3),Yd(3,3),Ye(3,3),epsD(3,3),       & 
& epsE(3,3),Yh(3,3),M112,M222,Mh

Complex(dp), Intent(in) :: Tad1Loop(2)

! For numerical routines 
Real(dp) :: gC(157)
logical :: broycheck 
Real(dp) :: broyx(2)

If (HighScaleModel.Eq."LOW") Then 
M112 = -(2*Lam1*vd**3 - 2*M12*vu + 3*Lam6*vd**2*vu + Lam3*vd*vu**2 + Lam4*vd*vu**2 +         & 
&  Lam5*vd*vu**2 + Lam7*vu**3 - 2*Tad1Loop(1))/(2._dp*vd)
M222 = -(-2*M12*vd + Lam6*vd**3 + Lam3*vd**2*vu + Lam4*vd**2*vu + Lam5*vd**2*vu +            & 
&  3*Lam7*vd*vu**2 + 2*Lam2*vu**3 - 2*Tad1Loop(2))/(2._dp*vu)

 ! ----------- Check solutions for consistency  -------- 

 ! Check for NaNs 
If (Real(M112,dp).ne.Real(M112,dp)) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for M112" 
   Call TerminateProgram  
 End If 
 If (Abs(AImag(M112)).gt.1.0E-04_dp) Then 
   Write(*,*) "No real solution of tadpole equations for M112" 
   !Call TerminateProgram  
   M112 = Real(M112,dp) 
  SignOfMuChanged= .True. 
End If 
 If (Real(M222,dp).ne.Real(M222,dp)) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for M222" 
   Call TerminateProgram  
 End If 
 If (Abs(AImag(M222)).gt.1.0E-04_dp) Then 
   Write(*,*) "No real solution of tadpole equations for M222" 
   !Call TerminateProgram  
   M222 = Real(M222,dp) 
  SignOfMuChanged= .True. 
End If 
 Else 
M112 = -(2*Lam1*vd**3 - 2*M12*vu + 3*Lam6*vd**2*vu + Lam3*vd*vu**2 + Lam4*vd*vu**2 +         & 
&  Lam5*vd*vu**2 + Lam7*vu**3 - 2*Tad1Loop(1))/(2._dp*vd)
M222 = -(-2*M12*vd + Lam6*vd**3 + Lam3*vd**2*vu + Lam4*vd**2*vu + Lam5*vd**2*vu +            & 
&  3*Lam7*vd*vu**2 + 2*Lam2*vu**3 - 2*Tad1Loop(2))/(2._dp*vu)

 ! ----------- Check solutions for consistency  -------- 

 ! Check for NaNs 
If (Real(M112,dp).ne.Real(M112,dp)) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for M112" 
   Call TerminateProgram  
 End If 
 If (Abs(AImag(M112)).gt.1.0E-04_dp) Then 
   Write(*,*) "No real solution of tadpole equations for M112" 
   !Call TerminateProgram  
   M112 = Real(M112,dp) 
  SignOfMuChanged= .True. 
End If 
 If (Real(M222,dp).ne.Real(M222,dp)) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for M222" 
   Call TerminateProgram  
 End If 
 If (Abs(AImag(M222)).gt.1.0E-04_dp) Then 
   Write(*,*) "No real solution of tadpole equations for M222" 
   !Call TerminateProgram  
   M222 = Real(M222,dp) 
  SignOfMuChanged= .True. 
End If 
 End if 
End Subroutine SolveTadpoleEquations

Subroutine CalculateTadpoles(g1,g2,g3,Lam6,Lam5,Lam7,Lam10,Lam1,Lam4,Lam3,            & 
& Lam2,Lam8,Lam9,Lamh,epsU,Yu,Yd,Ye,epsD,epsE,Yh,Mu,M12,M112,M222,Mh,vd,vu,              & 
& Tad1Loop,TadpoleValues)

Real(dp),Intent(in) :: g1,g2,g3,Lam6,Lam5,Lam7,Lam10,Mu,M12,vd,vu

Complex(dp),Intent(in) :: Lam1,Lam4,Lam3,Lam2,Lam8,Lam9,Lamh,epsU(3,3),Yu(3,3),Yd(3,3),Ye(3,3),epsD(3,3),       & 
& epsE(3,3),Yh(3,3),M112,M222,Mh

Complex(dp), Intent(in) :: Tad1Loop(2)

Real(dp), Intent(out) :: TadpoleValues(2)

TadpoleValues(1) = Real((2*Lam1*vd**3 - 2*M12*vu + 3*Lam6*vd**2*vu + Lam7*vu**3 + vd*(2._dp*(M112)& 
&  + (Lam3 + Lam4 + Lam5)*vu**2))/2._dp - Tad1Loop(1),dp) 
TadpoleValues(2) = Real((Lam6*vd**3 + (Lam3 + Lam4 + Lam5)*vd**2*vu + 2*vu*(M222 + Lam2*vu**2)& 
&  + vd*(-2._dp*(M12) + 3*Lam7*vu**2))/2._dp - Tad1Loop(2),dp) 
End Subroutine CalculateTadpoles 

End Module Tadpoles_Zee 
 

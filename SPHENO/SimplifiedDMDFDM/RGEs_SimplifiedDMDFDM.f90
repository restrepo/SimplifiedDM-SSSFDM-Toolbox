! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.8.5 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 10:58 on 18.6.2016   
! ----------------------------------------------------------------------  
 
 
Module RGEs_SimplifiedDMDFDM 
 
Use Control 
Use Model_Data_SimplifiedDMDFDM 
Use Mathematics 
 
Logical,Private,Save::OnlyDiagonal

Real(dp),Parameter::id3R(3,3)=& 
   & Reshape(Source=(/& 
   & 1,0,0,& 
 &0,1,0,& 
 &0,0,1& 
 &/),shape=(/3,3/)) 
Contains 


Subroutine GToParameters62(g,g1,g2,g3,lam1,Yu,Yd,Ye,MDF,mH2)

Implicit None 
Real(dp), Intent(in) :: g(62) 
Real(dp),Intent(out) :: g1,g2,g3,MDF

Complex(dp),Intent(out) :: lam1,Yu(3,3),Yd(3,3),Ye(3,3),mH2

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'GToParameters62' 
 
g1= g(1) 
g2= g(2) 
g3= g(3) 
lam1= Cmplx(g(4),g(5),dp) 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yu(i1,i2) = Cmplx( g(SumI+6), g(SumI+7), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yd(i1,i2) = Cmplx( g(SumI+24), g(SumI+25), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Ye(i1,i2) = Cmplx( g(SumI+42), g(SumI+43), dp) 
End Do 
 End Do 
 
MDF= g(60) 
mH2= Cmplx(g(61),g(62),dp) 
Do i1=1,62 
If (g(i1).ne.g(i1)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Write(*,*) "At position ", i1 
 Call TerminateProgram 
End if 
End do 
Iname = Iname - 1 
 
End Subroutine GToParameters62

Subroutine ParametersToG62(g1,g2,g3,lam1,Yu,Yd,Ye,MDF,mH2,g)

Implicit None 
Real(dp), Intent(out) :: g(62) 
Real(dp), Intent(in) :: g1,g2,g3,MDF

Complex(dp), Intent(in) :: lam1,Yu(3,3),Yd(3,3),Ye(3,3),mH2

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'ParametersToG62' 
 
g(1) = g1  
g(2) = g2  
g(3) = g3  
g(4) = Real(lam1,dp)  
g(5) = Aimag(lam1)  
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+6) = Real(Yu(i1,i2), dp) 
g(SumI+7) = Aimag(Yu(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+24) = Real(Yd(i1,i2), dp) 
g(SumI+25) = Aimag(Yd(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+42) = Real(Ye(i1,i2), dp) 
g(SumI+43) = Aimag(Ye(i1,i2)) 
End Do 
End Do 

g(60) = MDF  
g(61) = Real(mH2,dp)  
g(62) = Aimag(mH2)  
Iname = Iname - 1 
 
End Subroutine ParametersToG62

Subroutine rge62(len, T, GY, F) 
Implicit None 
Integer, Intent(in) :: len 
Real(dp), Intent(in) :: T, GY(len) 
Real(dp), Intent(out) :: F(len) 
Integer :: i1,i2,i3,i4 
Integer :: j1,j2,j3,j4,j5,j6,j7 
Real(dp) :: q 
Real(dp) :: g1,betag11,betag12,Dg1,g2,betag21,betag22,Dg2,g3,betag31,betag32,         & 
& Dg3,MDF,betaMDF1,betaMDF2,DMDF
Complex(dp) :: lam1,betalam11,betalam12,Dlam1,Yu(3,3),betaYu1(3,3),betaYu2(3,3)       & 
& ,DYu(3,3),adjYu(3,3),Yd(3,3),betaYd1(3,3),betaYd2(3,3),DYd(3,3),adjYd(3,3)             & 
& ,Ye(3,3),betaYe1(3,3),betaYe2(3,3),DYe(3,3),adjYe(3,3),mH2,betamH21,betamH22,DmH2
Iname = Iname +1 
NameOfUnit(Iname) = 'rge62' 
 
OnlyDiagonal = .Not.GenerationMixing 
q = t 
 
Call GToParameters62(gy,g1,g2,g3,lam1,Yu,Yd,Ye,MDF,mH2)

Call Adjungate(Yu,adjYu)
Call Adjungate(Yd,adjYd)
Call Adjungate(Ye,adjYe)


If (TwoLoopRGE) Then 
End If 
 
 
!-------------------- 
! g1 
!-------------------- 
 
betag11  = 0

 
 
If (TwoLoopRGE) Then 
betag12 = 0

 
Dg1 = oo16pi2*( betag11 + oo16pi2 * betag12 ) 

 
Else 
Dg1 = oo16pi2* betag11 
End If 
 
 
!-------------------- 
! g2 
!-------------------- 
 
betag21  = 0

 
 
If (TwoLoopRGE) Then 
betag22 = 0

 
Dg2 = oo16pi2*( betag21 + oo16pi2 * betag22 ) 

 
Else 
Dg2 = oo16pi2* betag21 
End If 
 
 
!-------------------- 
! g3 
!-------------------- 
 
betag31  = 0

 
 
If (TwoLoopRGE) Then 
betag32 = 0

 
Dg3 = oo16pi2*( betag31 + oo16pi2 * betag32 ) 

 
Else 
Dg3 = oo16pi2* betag31 
End If 
 
 
!-------------------- 
! lam1 
!-------------------- 
 
betalam11  = 0

 
 
If (TwoLoopRGE) Then 
betalam12 = 0

 
Dlam1 = oo16pi2*( betalam11 + oo16pi2 * betalam12 ) 

 
Else 
Dlam1 = oo16pi2* betalam11 
End If 
 
 
Call Chop(Dlam1) 

!-------------------- 
! Yu 
!-------------------- 
 
betaYu1  = 0

 
 
If (TwoLoopRGE) Then 
betaYu2 = 0

 
DYu = oo16pi2*( betaYu1 + oo16pi2 * betaYu2 ) 

 
Else 
DYu = oo16pi2* betaYu1 
End If 
 
 
Call Chop(DYu) 

!-------------------- 
! Yd 
!-------------------- 
 
betaYd1  = 0

 
 
If (TwoLoopRGE) Then 
betaYd2 = 0

 
DYd = oo16pi2*( betaYd1 + oo16pi2 * betaYd2 ) 

 
Else 
DYd = oo16pi2* betaYd1 
End If 
 
 
Call Chop(DYd) 

!-------------------- 
! Ye 
!-------------------- 
 
betaYe1  = 0

 
 
If (TwoLoopRGE) Then 
betaYe2 = 0

 
DYe = oo16pi2*( betaYe1 + oo16pi2 * betaYe2 ) 

 
Else 
DYe = oo16pi2* betaYe1 
End If 
 
 
Call Chop(DYe) 

!-------------------- 
! MDF 
!-------------------- 
 
betaMDF1  = 0

 
 
If (TwoLoopRGE) Then 
betaMDF2 = 0

 
DMDF = oo16pi2*( betaMDF1 + oo16pi2 * betaMDF2 ) 

 
Else 
DMDF = oo16pi2* betaMDF1 
End If 
 
 
!-------------------- 
! mH2 
!-------------------- 
 
betamH21  = 0

 
 
If (TwoLoopRGE) Then 
betamH22 = 0

 
DmH2 = oo16pi2*( betamH21 + oo16pi2 * betamH22 ) 

 
Else 
DmH2 = oo16pi2* betamH21 
End If 
 
 
Call Chop(DmH2) 

Call ParametersToG62(Dg1,Dg2,Dg3,Dlam1,DYu,DYd,DYe,DMDF,DmH2,f)

Iname = Iname - 1 
 
End Subroutine rge62  

Subroutine GToParameters63(g,g1,g2,g3,lam1,Yu,Yd,Ye,MDF,mH2,v)

Implicit None 
Real(dp), Intent(in) :: g(63) 
Real(dp),Intent(out) :: g1,g2,g3,MDF,v

Complex(dp),Intent(out) :: lam1,Yu(3,3),Yd(3,3),Ye(3,3),mH2

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'GToParameters63' 
 
g1= g(1) 
g2= g(2) 
g3= g(3) 
lam1= Cmplx(g(4),g(5),dp) 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yu(i1,i2) = Cmplx( g(SumI+6), g(SumI+7), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yd(i1,i2) = Cmplx( g(SumI+24), g(SumI+25), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Ye(i1,i2) = Cmplx( g(SumI+42), g(SumI+43), dp) 
End Do 
 End Do 
 
MDF= g(60) 
mH2= Cmplx(g(61),g(62),dp) 
v= g(63) 
Do i1=1,63 
If (g(i1).ne.g(i1)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Write(*,*) "At position ", i1 
 Call TerminateProgram 
End if 
End do 
Iname = Iname - 1 
 
End Subroutine GToParameters63

Subroutine ParametersToG63(g1,g2,g3,lam1,Yu,Yd,Ye,MDF,mH2,v,g)

Implicit None 
Real(dp), Intent(out) :: g(63) 
Real(dp), Intent(in) :: g1,g2,g3,MDF,v

Complex(dp), Intent(in) :: lam1,Yu(3,3),Yd(3,3),Ye(3,3),mH2

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'ParametersToG63' 
 
g(1) = g1  
g(2) = g2  
g(3) = g3  
g(4) = Real(lam1,dp)  
g(5) = Aimag(lam1)  
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+6) = Real(Yu(i1,i2), dp) 
g(SumI+7) = Aimag(Yu(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+24) = Real(Yd(i1,i2), dp) 
g(SumI+25) = Aimag(Yd(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+42) = Real(Ye(i1,i2), dp) 
g(SumI+43) = Aimag(Ye(i1,i2)) 
End Do 
End Do 

g(60) = MDF  
g(61) = Real(mH2,dp)  
g(62) = Aimag(mH2)  
g(63) = v  
Iname = Iname - 1 
 
End Subroutine ParametersToG63

Subroutine rge63(len, T, GY, F) 
Implicit None 
Integer, Intent(in) :: len 
Real(dp), Intent(in) :: T, GY(len) 
Real(dp), Intent(out) :: F(len) 
Integer :: i1,i2,i3,i4 
Integer :: j1,j2,j3,j4,j5,j6,j7 
Real(dp) :: q 
Real(dp) :: g1,betag11,betag12,Dg1,g2,betag21,betag22,Dg2,g3,betag31,betag32,         & 
& Dg3,MDF,betaMDF1,betaMDF2,DMDF,v,betav1,betav2,Dv
Complex(dp) :: lam1,betalam11,betalam12,Dlam1,Yu(3,3),betaYu1(3,3),betaYu2(3,3)       & 
& ,DYu(3,3),adjYu(3,3),Yd(3,3),betaYd1(3,3),betaYd2(3,3),DYd(3,3),adjYd(3,3)             & 
& ,Ye(3,3),betaYe1(3,3),betaYe2(3,3),DYe(3,3),adjYe(3,3),mH2,betamH21,betamH22,DmH2
Iname = Iname +1 
NameOfUnit(Iname) = 'rge63' 
 
OnlyDiagonal = .Not.GenerationMixing 
q = t 
 
Call GToParameters63(gy,g1,g2,g3,lam1,Yu,Yd,Ye,MDF,mH2,v)

Call Adjungate(Yu,adjYu)
Call Adjungate(Yd,adjYd)
Call Adjungate(Ye,adjYe)


If (TwoLoopRGE) Then 
End If 
 
 
!-------------------- 
! g1 
!-------------------- 
 
betag11  = 0

 
 
If (TwoLoopRGE) Then 
betag12 = 0

 
Dg1 = oo16pi2*( betag11 + oo16pi2 * betag12 ) 

 
Else 
Dg1 = oo16pi2* betag11 
End If 
 
 
!-------------------- 
! g2 
!-------------------- 
 
betag21  = 0

 
 
If (TwoLoopRGE) Then 
betag22 = 0

 
Dg2 = oo16pi2*( betag21 + oo16pi2 * betag22 ) 

 
Else 
Dg2 = oo16pi2* betag21 
End If 
 
 
!-------------------- 
! g3 
!-------------------- 
 
betag31  = 0

 
 
If (TwoLoopRGE) Then 
betag32 = 0

 
Dg3 = oo16pi2*( betag31 + oo16pi2 * betag32 ) 

 
Else 
Dg3 = oo16pi2* betag31 
End If 
 
 
!-------------------- 
! lam1 
!-------------------- 
 
betalam11  = 0

 
 
If (TwoLoopRGE) Then 
betalam12 = 0

 
Dlam1 = oo16pi2*( betalam11 + oo16pi2 * betalam12 ) 

 
Else 
Dlam1 = oo16pi2* betalam11 
End If 
 
 
Call Chop(Dlam1) 

!-------------------- 
! Yu 
!-------------------- 
 
betaYu1  = 0

 
 
If (TwoLoopRGE) Then 
betaYu2 = 0

 
DYu = oo16pi2*( betaYu1 + oo16pi2 * betaYu2 ) 

 
Else 
DYu = oo16pi2* betaYu1 
End If 
 
 
Call Chop(DYu) 

!-------------------- 
! Yd 
!-------------------- 
 
betaYd1  = 0

 
 
If (TwoLoopRGE) Then 
betaYd2 = 0

 
DYd = oo16pi2*( betaYd1 + oo16pi2 * betaYd2 ) 

 
Else 
DYd = oo16pi2* betaYd1 
End If 
 
 
Call Chop(DYd) 

!-------------------- 
! Ye 
!-------------------- 
 
betaYe1  = 0

 
 
If (TwoLoopRGE) Then 
betaYe2 = 0

 
DYe = oo16pi2*( betaYe1 + oo16pi2 * betaYe2 ) 

 
Else 
DYe = oo16pi2* betaYe1 
End If 
 
 
Call Chop(DYe) 

!-------------------- 
! MDF 
!-------------------- 
 
betaMDF1  = 0

 
 
If (TwoLoopRGE) Then 
betaMDF2 = 0

 
DMDF = oo16pi2*( betaMDF1 + oo16pi2 * betaMDF2 ) 

 
Else 
DMDF = oo16pi2* betaMDF1 
End If 
 
 
!-------------------- 
! mH2 
!-------------------- 
 
betamH21  = 0

 
 
If (TwoLoopRGE) Then 
betamH22 = 0

 
DmH2 = oo16pi2*( betamH21 + oo16pi2 * betamH22 ) 

 
Else 
DmH2 = oo16pi2* betamH21 
End If 
 
 
Call Chop(DmH2) 

!-------------------- 
! v 
!-------------------- 
 
betav1  = 0

 
 
If (TwoLoopRGE) Then 
betav2 = 0

 
Dv = oo16pi2*( betav1 + oo16pi2 * betav2 ) 

 
Else 
Dv = oo16pi2* betav1 
End If 
 
 
Call ParametersToG63(Dg1,Dg2,Dg3,Dlam1,DYu,DYd,DYe,DMDF,DmH2,Dv,f)

Iname = Iname - 1 
 
End Subroutine rge63  

End Module RGEs_SimplifiedDMDFDM 
 

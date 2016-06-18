! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.8.5 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 23:17 on 17.6.2016   
! ----------------------------------------------------------------------  
 
 
Module RGEs_SimplifiedDMSDFDM 
 
Use Control 
Use Model_Data_SimplifiedDMSDFDM 
Use Mathematics 
 
Logical,Private,Save::OnlyDiagonal

Real(dp),Parameter::id3R(3,3)=& 
   & Reshape(Source=(/& 
   & 1,0,0,& 
 &0,1,0,& 
 &0,0,1& 
 &/),shape=(/3,3/)) 
Contains 


Subroutine GToParameters67(g,g1,g2,g3,Lam,Yu,Yd,Ye,YR3,YR4,Mn,MDF,mu2)

Implicit None 
Real(dp), Intent(in) :: g(67) 
Real(dp),Intent(out) :: g1,g2,g3,YR3,YR4

Complex(dp),Intent(out) :: Lam,Yu(3,3),Yd(3,3),Ye(3,3),Mn,MDF,mu2

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'GToParameters67' 
 
g1= g(1) 
g2= g(2) 
g3= g(3) 
Lam= Cmplx(g(4),g(5),dp) 
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
 
YR3= g(60) 
YR4= g(61) 
Mn= Cmplx(g(62),g(63),dp) 
MDF= Cmplx(g(64),g(65),dp) 
mu2= Cmplx(g(66),g(67),dp) 
Do i1=1,67 
If (g(i1).ne.g(i1)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Write(*,*) "At position ", i1 
 Call TerminateProgram 
End if 
End do 
Iname = Iname - 1 
 
End Subroutine GToParameters67

Subroutine ParametersToG67(g1,g2,g3,Lam,Yu,Yd,Ye,YR3,YR4,Mn,MDF,mu2,g)

Implicit None 
Real(dp), Intent(out) :: g(67) 
Real(dp), Intent(in) :: g1,g2,g3,YR3,YR4

Complex(dp), Intent(in) :: Lam,Yu(3,3),Yd(3,3),Ye(3,3),Mn,MDF,mu2

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'ParametersToG67' 
 
g(1) = g1  
g(2) = g2  
g(3) = g3  
g(4) = Real(Lam,dp)  
g(5) = Aimag(Lam)  
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

g(60) = YR3  
g(61) = YR4  
g(62) = Real(Mn,dp)  
g(63) = Aimag(Mn)  
g(64) = Real(MDF,dp)  
g(65) = Aimag(MDF)  
g(66) = Real(mu2,dp)  
g(67) = Aimag(mu2)  
Iname = Iname - 1 
 
End Subroutine ParametersToG67

Subroutine rge67(len, T, GY, F) 
Implicit None 
Integer, Intent(in) :: len 
Real(dp), Intent(in) :: T, GY(len) 
Real(dp), Intent(out) :: F(len) 
Integer :: i1,i2,i3,i4 
Integer :: j1,j2,j3,j4,j5,j6,j7 
Real(dp) :: q 
Real(dp) :: g1,betag11,betag12,Dg1,g2,betag21,betag22,Dg2,g3,betag31,betag32,         & 
& Dg3,YR3,betaYR31,betaYR32,DYR3,YR4,betaYR41,betaYR42,DYR4
Complex(dp) :: Lam,betaLam1,betaLam2,DLam,Yu(3,3),betaYu1(3,3),betaYu2(3,3)           & 
& ,DYu(3,3),adjYu(3,3),Yd(3,3),betaYd1(3,3),betaYd2(3,3),DYd(3,3),adjYd(3,3)             & 
& ,Ye(3,3),betaYe1(3,3),betaYe2(3,3),DYe(3,3),adjYe(3,3),Mn,betaMn1,betaMn2,             & 
& DMn,MDF,betaMDF1,betaMDF2,DMDF,mu2,betamu21,betamu22,Dmu2
Iname = Iname +1 
NameOfUnit(Iname) = 'rge67' 
 
OnlyDiagonal = .Not.GenerationMixing 
q = t 
 
Call GToParameters67(gy,g1,g2,g3,Lam,Yu,Yd,Ye,YR3,YR4,Mn,MDF,mu2)

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
! Lam 
!-------------------- 
 
betaLam1  = 0

 
 
If (TwoLoopRGE) Then 
betaLam2 = 0

 
DLam = oo16pi2*( betaLam1 + oo16pi2 * betaLam2 ) 

 
Else 
DLam = oo16pi2* betaLam1 
End If 
 
 
Call Chop(DLam) 

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
! YR3 
!-------------------- 
 
betaYR31  = 0

 
 
If (TwoLoopRGE) Then 
betaYR32 = 0

 
DYR3 = oo16pi2*( betaYR31 + oo16pi2 * betaYR32 ) 

 
Else 
DYR3 = oo16pi2* betaYR31 
End If 
 
 
!-------------------- 
! YR4 
!-------------------- 
 
betaYR41  = 0

 
 
If (TwoLoopRGE) Then 
betaYR42 = 0

 
DYR4 = oo16pi2*( betaYR41 + oo16pi2 * betaYR42 ) 

 
Else 
DYR4 = oo16pi2* betaYR41 
End If 
 
 
!-------------------- 
! Mn 
!-------------------- 
 
betaMn1  = 0

 
 
If (TwoLoopRGE) Then 
betaMn2 = 0

 
DMn = oo16pi2*( betaMn1 + oo16pi2 * betaMn2 ) 

 
Else 
DMn = oo16pi2* betaMn1 
End If 
 
 
Call Chop(DMn) 

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
 
 
Call Chop(DMDF) 

!-------------------- 
! mu2 
!-------------------- 
 
betamu21  = 0

 
 
If (TwoLoopRGE) Then 
betamu22 = 0

 
Dmu2 = oo16pi2*( betamu21 + oo16pi2 * betamu22 ) 

 
Else 
Dmu2 = oo16pi2* betamu21 
End If 
 
 
Call Chop(Dmu2) 

Call ParametersToG67(Dg1,Dg2,Dg3,DLam,DYu,DYd,DYe,DYR3,DYR4,DMn,DMDF,Dmu2,f)

Iname = Iname - 1 
 
End Subroutine rge67  

Subroutine GToParameters68(g,g1,g2,g3,Lam,Yu,Yd,Ye,YR3,YR4,Mn,MDF,mu2,v)

Implicit None 
Real(dp), Intent(in) :: g(68) 
Real(dp),Intent(out) :: g1,g2,g3,YR3,YR4,v

Complex(dp),Intent(out) :: Lam,Yu(3,3),Yd(3,3),Ye(3,3),Mn,MDF,mu2

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'GToParameters68' 
 
g1= g(1) 
g2= g(2) 
g3= g(3) 
Lam= Cmplx(g(4),g(5),dp) 
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
 
YR3= g(60) 
YR4= g(61) 
Mn= Cmplx(g(62),g(63),dp) 
MDF= Cmplx(g(64),g(65),dp) 
mu2= Cmplx(g(66),g(67),dp) 
v= g(68) 
Do i1=1,68 
If (g(i1).ne.g(i1)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Write(*,*) "At position ", i1 
 Call TerminateProgram 
End if 
End do 
Iname = Iname - 1 
 
End Subroutine GToParameters68

Subroutine ParametersToG68(g1,g2,g3,Lam,Yu,Yd,Ye,YR3,YR4,Mn,MDF,mu2,v,g)

Implicit None 
Real(dp), Intent(out) :: g(68) 
Real(dp), Intent(in) :: g1,g2,g3,YR3,YR4,v

Complex(dp), Intent(in) :: Lam,Yu(3,3),Yd(3,3),Ye(3,3),Mn,MDF,mu2

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'ParametersToG68' 
 
g(1) = g1  
g(2) = g2  
g(3) = g3  
g(4) = Real(Lam,dp)  
g(5) = Aimag(Lam)  
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

g(60) = YR3  
g(61) = YR4  
g(62) = Real(Mn,dp)  
g(63) = Aimag(Mn)  
g(64) = Real(MDF,dp)  
g(65) = Aimag(MDF)  
g(66) = Real(mu2,dp)  
g(67) = Aimag(mu2)  
g(68) = v  
Iname = Iname - 1 
 
End Subroutine ParametersToG68

Subroutine rge68(len, T, GY, F) 
Implicit None 
Integer, Intent(in) :: len 
Real(dp), Intent(in) :: T, GY(len) 
Real(dp), Intent(out) :: F(len) 
Integer :: i1,i2,i3,i4 
Integer :: j1,j2,j3,j4,j5,j6,j7 
Real(dp) :: q 
Real(dp) :: g1,betag11,betag12,Dg1,g2,betag21,betag22,Dg2,g3,betag31,betag32,         & 
& Dg3,YR3,betaYR31,betaYR32,DYR3,YR4,betaYR41,betaYR42,DYR4,v,betav1,betav2,Dv
Complex(dp) :: Lam,betaLam1,betaLam2,DLam,Yu(3,3),betaYu1(3,3),betaYu2(3,3)           & 
& ,DYu(3,3),adjYu(3,3),Yd(3,3),betaYd1(3,3),betaYd2(3,3),DYd(3,3),adjYd(3,3)             & 
& ,Ye(3,3),betaYe1(3,3),betaYe2(3,3),DYe(3,3),adjYe(3,3),Mn,betaMn1,betaMn2,             & 
& DMn,MDF,betaMDF1,betaMDF2,DMDF,mu2,betamu21,betamu22,Dmu2
Iname = Iname +1 
NameOfUnit(Iname) = 'rge68' 
 
OnlyDiagonal = .Not.GenerationMixing 
q = t 
 
Call GToParameters68(gy,g1,g2,g3,Lam,Yu,Yd,Ye,YR3,YR4,Mn,MDF,mu2,v)

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
! Lam 
!-------------------- 
 
betaLam1  = 0

 
 
If (TwoLoopRGE) Then 
betaLam2 = 0

 
DLam = oo16pi2*( betaLam1 + oo16pi2 * betaLam2 ) 

 
Else 
DLam = oo16pi2* betaLam1 
End If 
 
 
Call Chop(DLam) 

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
! YR3 
!-------------------- 
 
betaYR31  = 0

 
 
If (TwoLoopRGE) Then 
betaYR32 = 0

 
DYR3 = oo16pi2*( betaYR31 + oo16pi2 * betaYR32 ) 

 
Else 
DYR3 = oo16pi2* betaYR31 
End If 
 
 
!-------------------- 
! YR4 
!-------------------- 
 
betaYR41  = 0

 
 
If (TwoLoopRGE) Then 
betaYR42 = 0

 
DYR4 = oo16pi2*( betaYR41 + oo16pi2 * betaYR42 ) 

 
Else 
DYR4 = oo16pi2* betaYR41 
End If 
 
 
!-------------------- 
! Mn 
!-------------------- 
 
betaMn1  = 0

 
 
If (TwoLoopRGE) Then 
betaMn2 = 0

 
DMn = oo16pi2*( betaMn1 + oo16pi2 * betaMn2 ) 

 
Else 
DMn = oo16pi2* betaMn1 
End If 
 
 
Call Chop(DMn) 

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
 
 
Call Chop(DMDF) 

!-------------------- 
! mu2 
!-------------------- 
 
betamu21  = 0

 
 
If (TwoLoopRGE) Then 
betamu22 = 0

 
Dmu2 = oo16pi2*( betamu21 + oo16pi2 * betamu22 ) 

 
Else 
Dmu2 = oo16pi2* betamu21 
End If 
 
 
Call Chop(Dmu2) 

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
 
 
Call ParametersToG68(Dg1,Dg2,Dg3,DLam,DYu,DYd,DYe,DYR3,DYR4,DMn,DMDF,Dmu2,Dv,f)

Iname = Iname - 1 
 
End Subroutine rge68  

End Module RGEs_SimplifiedDMSDFDM 
 

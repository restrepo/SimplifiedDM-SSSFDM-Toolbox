! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.8.1 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 17:00 on 10.3.2016   
! ----------------------------------------------------------------------  
 
 
Module RGEs_Scotogenic 
 
Use Control 
Use Model_Data_Scotogenic 
Use Mathematics 
 
Logical,Private,Save::OnlyDiagonal

Real(dp),Parameter::id3R(3,3)=& 
   & Reshape(Source=(/& 
   & 1,0,0,& 
 &0,1,0,& 
 &0,0,1& 
 &/),shape=(/3,3/)) 
Contains 


Subroutine GToParameters106(g,g1,g2,g3,lam1,lam2,lam4,lam3,lam5,Yn,Yu,Yd,             & 
& Ye,Mn,mH2,mEt2)

Implicit None 
Real(dp), Intent(in) :: g(106) 
Real(dp),Intent(out) :: g1,g2,g3,lam5

Complex(dp),Intent(out) :: lam1,lam2,lam4,lam3,Yn(3,3),Yu(3,3),Yd(3,3),Ye(3,3),Mn(3,3),mH2,mEt2

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'GToParameters106' 
 
g1= g(1) 
g2= g(2) 
g3= g(3) 
lam1= Cmplx(g(4),g(5),dp) 
lam2= Cmplx(g(6),g(7),dp) 
lam4= Cmplx(g(8),g(9),dp) 
lam3= Cmplx(g(10),g(11),dp) 
lam5= g(12) 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yn(i1,i2) = Cmplx( g(SumI+13), g(SumI+14), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yu(i1,i2) = Cmplx( g(SumI+31), g(SumI+32), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yd(i1,i2) = Cmplx( g(SumI+49), g(SumI+50), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Ye(i1,i2) = Cmplx( g(SumI+67), g(SumI+68), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Mn(i1,i2) = Cmplx( g(SumI+85), g(SumI+86), dp) 
End Do 
 End Do 
 
mH2= Cmplx(g(103),g(104),dp) 
mEt2= Cmplx(g(105),g(106),dp) 
Do i1=1,106 
If (g(i1).ne.g(i1)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Write(*,*) "At position ", i1 
 Call TerminateProgram 
End if 
End do 
Iname = Iname - 1 
 
End Subroutine GToParameters106

Subroutine ParametersToG106(g1,g2,g3,lam1,lam2,lam4,lam3,lam5,Yn,Yu,Yd,               & 
& Ye,Mn,mH2,mEt2,g)

Implicit None 
Real(dp), Intent(out) :: g(106) 
Real(dp), Intent(in) :: g1,g2,g3,lam5

Complex(dp), Intent(in) :: lam1,lam2,lam4,lam3,Yn(3,3),Yu(3,3),Yd(3,3),Ye(3,3),Mn(3,3),mH2,mEt2

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'ParametersToG106' 
 
g(1) = g1  
g(2) = g2  
g(3) = g3  
g(4) = Real(lam1,dp)  
g(5) = Aimag(lam1)  
g(6) = Real(lam2,dp)  
g(7) = Aimag(lam2)  
g(8) = Real(lam4,dp)  
g(9) = Aimag(lam4)  
g(10) = Real(lam3,dp)  
g(11) = Aimag(lam3)  
g(12) = lam5  
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+13) = Real(Yn(i1,i2), dp) 
g(SumI+14) = Aimag(Yn(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+31) = Real(Yu(i1,i2), dp) 
g(SumI+32) = Aimag(Yu(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+49) = Real(Yd(i1,i2), dp) 
g(SumI+50) = Aimag(Yd(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+67) = Real(Ye(i1,i2), dp) 
g(SumI+68) = Aimag(Ye(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+85) = Real(Mn(i1,i2), dp) 
g(SumI+86) = Aimag(Mn(i1,i2)) 
End Do 
End Do 

g(103) = Real(mH2,dp)  
g(104) = Aimag(mH2)  
g(105) = Real(mEt2,dp)  
g(106) = Aimag(mEt2)  
Iname = Iname - 1 
 
End Subroutine ParametersToG106

Subroutine rge106(len, T, GY, F) 
Implicit None 
Integer, Intent(in) :: len 
Real(dp), Intent(in) :: T, GY(len) 
Real(dp), Intent(out) :: F(len) 
Integer :: i1,i2,i3,i4 
Integer :: j1,j2,j3,j4,j5,j6,j7 
Real(dp) :: q 
Real(dp) :: g1,betag11,betag12,Dg1,g2,betag21,betag22,Dg2,g3,betag31,betag32,         & 
& Dg3,lam5,betalam51,betalam52,Dlam5
Complex(dp) :: lam1,betalam11,betalam12,Dlam1,lam2,betalam21,betalam22,               & 
& Dlam2,lam4,betalam41,betalam42,Dlam4,lam3,betalam31,betalam32,Dlam3,Yn(3,3)            & 
& ,betaYn1(3,3),betaYn2(3,3),DYn(3,3),adjYn(3,3),Yu(3,3),betaYu1(3,3),betaYu2(3,3)       & 
& ,DYu(3,3),adjYu(3,3),Yd(3,3),betaYd1(3,3),betaYd2(3,3),DYd(3,3),adjYd(3,3)             & 
& ,Ye(3,3),betaYe1(3,3),betaYe2(3,3),DYe(3,3),adjYe(3,3),Mn(3,3),betaMn1(3,3)            & 
& ,betaMn2(3,3),DMn(3,3),adjMn(3,3),mH2,betamH21,betamH22,DmH2,mEt2,betamEt21,           & 
& betamEt22,DmEt2
Iname = Iname +1 
NameOfUnit(Iname) = 'rge106' 
 
OnlyDiagonal = .Not.GenerationMixing 
q = t 
 
Call GToParameters106(gy,g1,g2,g3,lam1,lam2,lam4,lam3,lam5,Yn,Yu,Yd,Ye,               & 
& Mn,mH2,mEt2)

Call Adjungate(Yn,adjYn)
Call Adjungate(Yu,adjYu)
Call Adjungate(Yd,adjYd)
Call Adjungate(Ye,adjYe)
Call Adjungate(Mn,adjMn)


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
! lam2 
!-------------------- 
 
betalam21  = 0

 
 
If (TwoLoopRGE) Then 
betalam22 = 0

 
Dlam2 = oo16pi2*( betalam21 + oo16pi2 * betalam22 ) 

 
Else 
Dlam2 = oo16pi2* betalam21 
End If 
 
 
Call Chop(Dlam2) 

!-------------------- 
! lam4 
!-------------------- 
 
betalam41  = 0

 
 
If (TwoLoopRGE) Then 
betalam42 = 0

 
Dlam4 = oo16pi2*( betalam41 + oo16pi2 * betalam42 ) 

 
Else 
Dlam4 = oo16pi2* betalam41 
End If 
 
 
Call Chop(Dlam4) 

!-------------------- 
! lam3 
!-------------------- 
 
betalam31  = 0

 
 
If (TwoLoopRGE) Then 
betalam32 = 0

 
Dlam3 = oo16pi2*( betalam31 + oo16pi2 * betalam32 ) 

 
Else 
Dlam3 = oo16pi2* betalam31 
End If 
 
 
Call Chop(Dlam3) 

!-------------------- 
! lam5 
!-------------------- 
 
betalam51  = 0

 
 
If (TwoLoopRGE) Then 
betalam52 = 0

 
Dlam5 = oo16pi2*( betalam51 + oo16pi2 * betalam52 ) 

 
Else 
Dlam5 = oo16pi2* betalam51 
End If 
 
 
!-------------------- 
! Yn 
!-------------------- 
 
betaYn1  = 0

 
 
If (TwoLoopRGE) Then 
betaYn2 = 0

 
DYn = oo16pi2*( betaYn1 + oo16pi2 * betaYn2 ) 

 
Else 
DYn = oo16pi2* betaYn1 
End If 
 
 
Call Chop(DYn) 

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
! mEt2 
!-------------------- 
 
betamEt21  = 0

 
 
If (TwoLoopRGE) Then 
betamEt22 = 0

 
DmEt2 = oo16pi2*( betamEt21 + oo16pi2 * betamEt22 ) 

 
Else 
DmEt2 = oo16pi2* betamEt21 
End If 
 
 
Call Chop(DmEt2) 

Call ParametersToG106(Dg1,Dg2,Dg3,Dlam1,Dlam2,Dlam4,Dlam3,Dlam5,DYn,DYu,              & 
& DYd,DYe,DMn,DmH2,DmEt2,f)

Iname = Iname - 1 
 
End Subroutine rge106  

Subroutine GToParameters107(g,g1,g2,g3,lam1,lam2,lam4,lam3,lam5,Yn,Yu,Yd,             & 
& Ye,Mn,mH2,mEt2,v)

Implicit None 
Real(dp), Intent(in) :: g(107) 
Real(dp),Intent(out) :: g1,g2,g3,lam5,v

Complex(dp),Intent(out) :: lam1,lam2,lam4,lam3,Yn(3,3),Yu(3,3),Yd(3,3),Ye(3,3),Mn(3,3),mH2,mEt2

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'GToParameters107' 
 
g1= g(1) 
g2= g(2) 
g3= g(3) 
lam1= Cmplx(g(4),g(5),dp) 
lam2= Cmplx(g(6),g(7),dp) 
lam4= Cmplx(g(8),g(9),dp) 
lam3= Cmplx(g(10),g(11),dp) 
lam5= g(12) 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yn(i1,i2) = Cmplx( g(SumI+13), g(SumI+14), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yu(i1,i2) = Cmplx( g(SumI+31), g(SumI+32), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yd(i1,i2) = Cmplx( g(SumI+49), g(SumI+50), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Ye(i1,i2) = Cmplx( g(SumI+67), g(SumI+68), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Mn(i1,i2) = Cmplx( g(SumI+85), g(SumI+86), dp) 
End Do 
 End Do 
 
mH2= Cmplx(g(103),g(104),dp) 
mEt2= Cmplx(g(105),g(106),dp) 
v= g(107) 
Do i1=1,107 
If (g(i1).ne.g(i1)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Write(*,*) "At position ", i1 
 Call TerminateProgram 
End if 
End do 
Iname = Iname - 1 
 
End Subroutine GToParameters107

Subroutine ParametersToG107(g1,g2,g3,lam1,lam2,lam4,lam3,lam5,Yn,Yu,Yd,               & 
& Ye,Mn,mH2,mEt2,v,g)

Implicit None 
Real(dp), Intent(out) :: g(107) 
Real(dp), Intent(in) :: g1,g2,g3,lam5,v

Complex(dp), Intent(in) :: lam1,lam2,lam4,lam3,Yn(3,3),Yu(3,3),Yd(3,3),Ye(3,3),Mn(3,3),mH2,mEt2

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'ParametersToG107' 
 
g(1) = g1  
g(2) = g2  
g(3) = g3  
g(4) = Real(lam1,dp)  
g(5) = Aimag(lam1)  
g(6) = Real(lam2,dp)  
g(7) = Aimag(lam2)  
g(8) = Real(lam4,dp)  
g(9) = Aimag(lam4)  
g(10) = Real(lam3,dp)  
g(11) = Aimag(lam3)  
g(12) = lam5  
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+13) = Real(Yn(i1,i2), dp) 
g(SumI+14) = Aimag(Yn(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+31) = Real(Yu(i1,i2), dp) 
g(SumI+32) = Aimag(Yu(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+49) = Real(Yd(i1,i2), dp) 
g(SumI+50) = Aimag(Yd(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+67) = Real(Ye(i1,i2), dp) 
g(SumI+68) = Aimag(Ye(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+85) = Real(Mn(i1,i2), dp) 
g(SumI+86) = Aimag(Mn(i1,i2)) 
End Do 
End Do 

g(103) = Real(mH2,dp)  
g(104) = Aimag(mH2)  
g(105) = Real(mEt2,dp)  
g(106) = Aimag(mEt2)  
g(107) = v  
Iname = Iname - 1 
 
End Subroutine ParametersToG107

Subroutine rge107(len, T, GY, F) 
Implicit None 
Integer, Intent(in) :: len 
Real(dp), Intent(in) :: T, GY(len) 
Real(dp), Intent(out) :: F(len) 
Integer :: i1,i2,i3,i4 
Integer :: j1,j2,j3,j4,j5,j6,j7 
Real(dp) :: q 
Real(dp) :: g1,betag11,betag12,Dg1,g2,betag21,betag22,Dg2,g3,betag31,betag32,         & 
& Dg3,lam5,betalam51,betalam52,Dlam5,v,betav1,betav2,Dv
Complex(dp) :: lam1,betalam11,betalam12,Dlam1,lam2,betalam21,betalam22,               & 
& Dlam2,lam4,betalam41,betalam42,Dlam4,lam3,betalam31,betalam32,Dlam3,Yn(3,3)            & 
& ,betaYn1(3,3),betaYn2(3,3),DYn(3,3),adjYn(3,3),Yu(3,3),betaYu1(3,3),betaYu2(3,3)       & 
& ,DYu(3,3),adjYu(3,3),Yd(3,3),betaYd1(3,3),betaYd2(3,3),DYd(3,3),adjYd(3,3)             & 
& ,Ye(3,3),betaYe1(3,3),betaYe2(3,3),DYe(3,3),adjYe(3,3),Mn(3,3),betaMn1(3,3)            & 
& ,betaMn2(3,3),DMn(3,3),adjMn(3,3),mH2,betamH21,betamH22,DmH2,mEt2,betamEt21,           & 
& betamEt22,DmEt2
Iname = Iname +1 
NameOfUnit(Iname) = 'rge107' 
 
OnlyDiagonal = .Not.GenerationMixing 
q = t 
 
Call GToParameters107(gy,g1,g2,g3,lam1,lam2,lam4,lam3,lam5,Yn,Yu,Yd,Ye,               & 
& Mn,mH2,mEt2,v)

Call Adjungate(Yn,adjYn)
Call Adjungate(Yu,adjYu)
Call Adjungate(Yd,adjYd)
Call Adjungate(Ye,adjYe)
Call Adjungate(Mn,adjMn)


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
! lam2 
!-------------------- 
 
betalam21  = 0

 
 
If (TwoLoopRGE) Then 
betalam22 = 0

 
Dlam2 = oo16pi2*( betalam21 + oo16pi2 * betalam22 ) 

 
Else 
Dlam2 = oo16pi2* betalam21 
End If 
 
 
Call Chop(Dlam2) 

!-------------------- 
! lam4 
!-------------------- 
 
betalam41  = 0

 
 
If (TwoLoopRGE) Then 
betalam42 = 0

 
Dlam4 = oo16pi2*( betalam41 + oo16pi2 * betalam42 ) 

 
Else 
Dlam4 = oo16pi2* betalam41 
End If 
 
 
Call Chop(Dlam4) 

!-------------------- 
! lam3 
!-------------------- 
 
betalam31  = 0

 
 
If (TwoLoopRGE) Then 
betalam32 = 0

 
Dlam3 = oo16pi2*( betalam31 + oo16pi2 * betalam32 ) 

 
Else 
Dlam3 = oo16pi2* betalam31 
End If 
 
 
Call Chop(Dlam3) 

!-------------------- 
! lam5 
!-------------------- 
 
betalam51  = 0

 
 
If (TwoLoopRGE) Then 
betalam52 = 0

 
Dlam5 = oo16pi2*( betalam51 + oo16pi2 * betalam52 ) 

 
Else 
Dlam5 = oo16pi2* betalam51 
End If 
 
 
!-------------------- 
! Yn 
!-------------------- 
 
betaYn1  = 0

 
 
If (TwoLoopRGE) Then 
betaYn2 = 0

 
DYn = oo16pi2*( betaYn1 + oo16pi2 * betaYn2 ) 

 
Else 
DYn = oo16pi2* betaYn1 
End If 
 
 
Call Chop(DYn) 

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
! mEt2 
!-------------------- 
 
betamEt21  = 0

 
 
If (TwoLoopRGE) Then 
betamEt22 = 0

 
DmEt2 = oo16pi2*( betamEt21 + oo16pi2 * betamEt22 ) 

 
Else 
DmEt2 = oo16pi2* betamEt21 
End If 
 
 
Call Chop(DmEt2) 

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
 
 
Call ParametersToG107(Dg1,Dg2,Dg3,Dlam1,Dlam2,Dlam4,Dlam3,Dlam5,DYn,DYu,              & 
& DYd,DYe,DMn,DmH2,DmEt2,Dv,f)

Iname = Iname - 1 
 
End Subroutine rge107  

End Module RGEs_Scotogenic 
 

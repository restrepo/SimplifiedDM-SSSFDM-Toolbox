! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.8.5 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 17:14 on 20.5.2016   
! ----------------------------------------------------------------------  
 
 
Module RGEs_Zee 
 
Use Control 
Use Model_Data_Zee 
Use Mathematics 
 
Logical,Private,Save::OnlyDiagonal

Real(dp),Parameter::id3R(3,3)=& 
   & Reshape(Source=(/& 
   & 1,0,0,& 
 &0,1,0,& 
 &0,0,1& 
 &/),shape=(/3,3/)) 
Contains 


Subroutine GToParameters155(g,g1,g2,g3,Lam6,Lam5,Lam7,Lam10,Lam1,Lam4,Lam3,           & 
& Lam2,Lam8,Lam9,Lamh,epsU,Yu,Yd,Ye,epsD,epsE,Yh,Mu,M12,M112,M222,Mh)

Implicit None 
Real(dp), Intent(in) :: g(155) 
Real(dp),Intent(out) :: g1,g2,g3,Lam6,Lam5,Lam7,Lam10,Mu,M12

Complex(dp),Intent(out) :: Lam1,Lam4,Lam3,Lam2,Lam8,Lam9,Lamh,epsU(3,3),Yu(3,3),Yd(3,3),Ye(3,3),epsD(3,3),       & 
& epsE(3,3),Yh(3,3),M112,M222,Mh

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'GToParameters155' 
 
g1= g(1) 
g2= g(2) 
g3= g(3) 
Lam6= g(4) 
Lam5= g(5) 
Lam7= g(6) 
Lam10= g(7) 
Lam1= Cmplx(g(8),g(9),dp) 
Lam4= Cmplx(g(10),g(11),dp) 
Lam3= Cmplx(g(12),g(13),dp) 
Lam2= Cmplx(g(14),g(15),dp) 
Lam8= Cmplx(g(16),g(17),dp) 
Lam9= Cmplx(g(18),g(19),dp) 
Lamh= Cmplx(g(20),g(21),dp) 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
epsU(i1,i2) = Cmplx( g(SumI+22), g(SumI+23), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yu(i1,i2) = Cmplx( g(SumI+40), g(SumI+41), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yd(i1,i2) = Cmplx( g(SumI+58), g(SumI+59), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Ye(i1,i2) = Cmplx( g(SumI+76), g(SumI+77), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
epsD(i1,i2) = Cmplx( g(SumI+94), g(SumI+95), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
epsE(i1,i2) = Cmplx( g(SumI+112), g(SumI+113), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yh(i1,i2) = Cmplx( g(SumI+130), g(SumI+131), dp) 
End Do 
 End Do 
 
Mu= g(148) 
M12= g(149) 
M112= Cmplx(g(150),g(151),dp) 
M222= Cmplx(g(152),g(153),dp) 
Mh= Cmplx(g(154),g(155),dp) 
Do i1=1,155 
If (g(i1).ne.g(i1)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Write(*,*) "At position ", i1 
 Call TerminateProgram 
End if 
End do 
Iname = Iname - 1 
 
End Subroutine GToParameters155

Subroutine ParametersToG155(g1,g2,g3,Lam6,Lam5,Lam7,Lam10,Lam1,Lam4,Lam3,             & 
& Lam2,Lam8,Lam9,Lamh,epsU,Yu,Yd,Ye,epsD,epsE,Yh,Mu,M12,M112,M222,Mh,g)

Implicit None 
Real(dp), Intent(out) :: g(155) 
Real(dp), Intent(in) :: g1,g2,g3,Lam6,Lam5,Lam7,Lam10,Mu,M12

Complex(dp), Intent(in) :: Lam1,Lam4,Lam3,Lam2,Lam8,Lam9,Lamh,epsU(3,3),Yu(3,3),Yd(3,3),Ye(3,3),epsD(3,3),       & 
& epsE(3,3),Yh(3,3),M112,M222,Mh

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'ParametersToG155' 
 
g(1) = g1  
g(2) = g2  
g(3) = g3  
g(4) = Lam6  
g(5) = Lam5  
g(6) = Lam7  
g(7) = Lam10  
g(8) = Real(Lam1,dp)  
g(9) = Aimag(Lam1)  
g(10) = Real(Lam4,dp)  
g(11) = Aimag(Lam4)  
g(12) = Real(Lam3,dp)  
g(13) = Aimag(Lam3)  
g(14) = Real(Lam2,dp)  
g(15) = Aimag(Lam2)  
g(16) = Real(Lam8,dp)  
g(17) = Aimag(Lam8)  
g(18) = Real(Lam9,dp)  
g(19) = Aimag(Lam9)  
g(20) = Real(Lamh,dp)  
g(21) = Aimag(Lamh)  
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+22) = Real(epsU(i1,i2), dp) 
g(SumI+23) = Aimag(epsU(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+40) = Real(Yu(i1,i2), dp) 
g(SumI+41) = Aimag(Yu(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+58) = Real(Yd(i1,i2), dp) 
g(SumI+59) = Aimag(Yd(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+76) = Real(Ye(i1,i2), dp) 
g(SumI+77) = Aimag(Ye(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+94) = Real(epsD(i1,i2), dp) 
g(SumI+95) = Aimag(epsD(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+112) = Real(epsE(i1,i2), dp) 
g(SumI+113) = Aimag(epsE(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+130) = Real(Yh(i1,i2), dp) 
g(SumI+131) = Aimag(Yh(i1,i2)) 
End Do 
End Do 

g(148) = Mu  
g(149) = M12  
g(150) = Real(M112,dp)  
g(151) = Aimag(M112)  
g(152) = Real(M222,dp)  
g(153) = Aimag(M222)  
g(154) = Real(Mh,dp)  
g(155) = Aimag(Mh)  
Iname = Iname - 1 
 
End Subroutine ParametersToG155

Subroutine rge155(len, T, GY, F) 
Implicit None 
Integer, Intent(in) :: len 
Real(dp), Intent(in) :: T, GY(len) 
Real(dp), Intent(out) :: F(len) 
Integer :: i1,i2,i3,i4 
Integer :: j1,j2,j3,j4,j5,j6,j7 
Real(dp) :: q 
Real(dp) :: g1,betag11,betag12,Dg1,g2,betag21,betag22,Dg2,g3,betag31,betag32,         & 
& Dg3,Lam6,betaLam61,betaLam62,DLam6,Lam5,betaLam51,betaLam52,DLam5,Lam7,betaLam71,      & 
& betaLam72,DLam7,Lam10,betaLam101,betaLam102,DLam10,Mu,betaMu1,betaMu2,DMu,             & 
& M12,betaM121,betaM122,DM12
Complex(dp) :: Lam1,betaLam11,betaLam12,DLam1,Lam4,betaLam41,betaLam42,               & 
& DLam4,Lam3,betaLam31,betaLam32,DLam3,Lam2,betaLam21,betaLam22,DLam2,Lam8,              & 
& betaLam81,betaLam82,DLam8,Lam9,betaLam91,betaLam92,DLam9,Lamh,betaLamh1,               & 
& betaLamh2,DLamh,epsU(3,3),betaepsU1(3,3),betaepsU2(3,3),DepsU(3,3),adjepsU(3,3)        & 
& ,Yu(3,3),betaYu1(3,3),betaYu2(3,3),DYu(3,3),adjYu(3,3),Yd(3,3),betaYd1(3,3)            & 
& ,betaYd2(3,3),DYd(3,3),adjYd(3,3),Ye(3,3),betaYe1(3,3),betaYe2(3,3),DYe(3,3)           & 
& ,adjYe(3,3),epsD(3,3),betaepsD1(3,3),betaepsD2(3,3),DepsD(3,3),adjepsD(3,3)            & 
& ,epsE(3,3),betaepsE1(3,3),betaepsE2(3,3),DepsE(3,3),adjepsE(3,3),Yh(3,3)               & 
& ,betaYh1(3,3),betaYh2(3,3),DYh(3,3),adjYh(3,3),M112,betaM1121,betaM1122,               & 
& DM112,M222,betaM2221,betaM2222,DM222,Mh,betaMh1,betaMh2,DMh
Iname = Iname +1 
NameOfUnit(Iname) = 'rge155' 
 
OnlyDiagonal = .Not.GenerationMixing 
q = t 
 
Call GToParameters155(gy,g1,g2,g3,Lam6,Lam5,Lam7,Lam10,Lam1,Lam4,Lam3,Lam2,           & 
& Lam8,Lam9,Lamh,epsU,Yu,Yd,Ye,epsD,epsE,Yh,Mu,M12,M112,M222,Mh)

Call Adjungate(epsU,adjepsU)
Call Adjungate(Yu,adjYu)
Call Adjungate(Yd,adjYd)
Call Adjungate(Ye,adjYe)
Call Adjungate(epsD,adjepsD)
Call Adjungate(epsE,adjepsE)
Call Adjungate(Yh,adjYh)


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
! Lam6 
!-------------------- 
 
betaLam61  = 0

 
 
If (TwoLoopRGE) Then 
betaLam62 = 0

 
DLam6 = oo16pi2*( betaLam61 + oo16pi2 * betaLam62 ) 

 
Else 
DLam6 = oo16pi2* betaLam61 
End If 
 
 
!-------------------- 
! Lam5 
!-------------------- 
 
betaLam51  = 0

 
 
If (TwoLoopRGE) Then 
betaLam52 = 0

 
DLam5 = oo16pi2*( betaLam51 + oo16pi2 * betaLam52 ) 

 
Else 
DLam5 = oo16pi2* betaLam51 
End If 
 
 
!-------------------- 
! Lam7 
!-------------------- 
 
betaLam71  = 0

 
 
If (TwoLoopRGE) Then 
betaLam72 = 0

 
DLam7 = oo16pi2*( betaLam71 + oo16pi2 * betaLam72 ) 

 
Else 
DLam7 = oo16pi2* betaLam71 
End If 
 
 
!-------------------- 
! Lam10 
!-------------------- 
 
betaLam101  = 0

 
 
If (TwoLoopRGE) Then 
betaLam102 = 0

 
DLam10 = oo16pi2*( betaLam101 + oo16pi2 * betaLam102 ) 

 
Else 
DLam10 = oo16pi2* betaLam101 
End If 
 
 
!-------------------- 
! Lam1 
!-------------------- 
 
betaLam11  = 0

 
 
If (TwoLoopRGE) Then 
betaLam12 = 0

 
DLam1 = oo16pi2*( betaLam11 + oo16pi2 * betaLam12 ) 

 
Else 
DLam1 = oo16pi2* betaLam11 
End If 
 
 
Call Chop(DLam1) 

!-------------------- 
! Lam4 
!-------------------- 
 
betaLam41  = 0

 
 
If (TwoLoopRGE) Then 
betaLam42 = 0

 
DLam4 = oo16pi2*( betaLam41 + oo16pi2 * betaLam42 ) 

 
Else 
DLam4 = oo16pi2* betaLam41 
End If 
 
 
Call Chop(DLam4) 

!-------------------- 
! Lam3 
!-------------------- 
 
betaLam31  = 0

 
 
If (TwoLoopRGE) Then 
betaLam32 = 0

 
DLam3 = oo16pi2*( betaLam31 + oo16pi2 * betaLam32 ) 

 
Else 
DLam3 = oo16pi2* betaLam31 
End If 
 
 
Call Chop(DLam3) 

!-------------------- 
! Lam2 
!-------------------- 
 
betaLam21  = 0

 
 
If (TwoLoopRGE) Then 
betaLam22 = 0

 
DLam2 = oo16pi2*( betaLam21 + oo16pi2 * betaLam22 ) 

 
Else 
DLam2 = oo16pi2* betaLam21 
End If 
 
 
Call Chop(DLam2) 

!-------------------- 
! Lam8 
!-------------------- 
 
betaLam81  = 0

 
 
If (TwoLoopRGE) Then 
betaLam82 = 0

 
DLam8 = oo16pi2*( betaLam81 + oo16pi2 * betaLam82 ) 

 
Else 
DLam8 = oo16pi2* betaLam81 
End If 
 
 
Call Chop(DLam8) 

!-------------------- 
! Lam9 
!-------------------- 
 
betaLam91  = 0

 
 
If (TwoLoopRGE) Then 
betaLam92 = 0

 
DLam9 = oo16pi2*( betaLam91 + oo16pi2 * betaLam92 ) 

 
Else 
DLam9 = oo16pi2* betaLam91 
End If 
 
 
Call Chop(DLam9) 

!-------------------- 
! Lamh 
!-------------------- 
 
betaLamh1  = 0

 
 
If (TwoLoopRGE) Then 
betaLamh2 = 0

 
DLamh = oo16pi2*( betaLamh1 + oo16pi2 * betaLamh2 ) 

 
Else 
DLamh = oo16pi2* betaLamh1 
End If 
 
 
Call Chop(DLamh) 

!-------------------- 
! epsU 
!-------------------- 
 
betaepsU1  = 0

 
 
If (TwoLoopRGE) Then 
betaepsU2 = 0

 
DepsU = oo16pi2*( betaepsU1 + oo16pi2 * betaepsU2 ) 

 
Else 
DepsU = oo16pi2* betaepsU1 
End If 
 
 
Call Chop(DepsU) 

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
! epsD 
!-------------------- 
 
betaepsD1  = 0

 
 
If (TwoLoopRGE) Then 
betaepsD2 = 0

 
DepsD = oo16pi2*( betaepsD1 + oo16pi2 * betaepsD2 ) 

 
Else 
DepsD = oo16pi2* betaepsD1 
End If 
 
 
Call Chop(DepsD) 

!-------------------- 
! epsE 
!-------------------- 
 
betaepsE1  = 0

 
 
If (TwoLoopRGE) Then 
betaepsE2 = 0

 
DepsE = oo16pi2*( betaepsE1 + oo16pi2 * betaepsE2 ) 

 
Else 
DepsE = oo16pi2* betaepsE1 
End If 
 
 
Call Chop(DepsE) 

!-------------------- 
! Yh 
!-------------------- 
 
betaYh1  = 0

 
 
If (TwoLoopRGE) Then 
betaYh2 = 0

 
DYh = oo16pi2*( betaYh1 + oo16pi2 * betaYh2 ) 

 
Else 
DYh = oo16pi2* betaYh1 
End If 
 
 
Call Chop(DYh) 

!-------------------- 
! Mu 
!-------------------- 
 
betaMu1  = 0

 
 
If (TwoLoopRGE) Then 
betaMu2 = 0

 
DMu = oo16pi2*( betaMu1 + oo16pi2 * betaMu2 ) 

 
Else 
DMu = oo16pi2* betaMu1 
End If 
 
 
!-------------------- 
! M12 
!-------------------- 
 
betaM121  = 0

 
 
If (TwoLoopRGE) Then 
betaM122 = 0

 
DM12 = oo16pi2*( betaM121 + oo16pi2 * betaM122 ) 

 
Else 
DM12 = oo16pi2* betaM121 
End If 
 
 
!-------------------- 
! M112 
!-------------------- 
 
betaM1121  = 0

 
 
If (TwoLoopRGE) Then 
betaM1122 = 0

 
DM112 = oo16pi2*( betaM1121 + oo16pi2 * betaM1122 ) 

 
Else 
DM112 = oo16pi2* betaM1121 
End If 
 
 
Call Chop(DM112) 

!-------------------- 
! M222 
!-------------------- 
 
betaM2221  = 0

 
 
If (TwoLoopRGE) Then 
betaM2222 = 0

 
DM222 = oo16pi2*( betaM2221 + oo16pi2 * betaM2222 ) 

 
Else 
DM222 = oo16pi2* betaM2221 
End If 
 
 
Call Chop(DM222) 

!-------------------- 
! Mh 
!-------------------- 
 
betaMh1  = 0

 
 
If (TwoLoopRGE) Then 
betaMh2 = 0

 
DMh = oo16pi2*( betaMh1 + oo16pi2 * betaMh2 ) 

 
Else 
DMh = oo16pi2* betaMh1 
End If 
 
 
Call Chop(DMh) 

Call ParametersToG155(Dg1,Dg2,Dg3,DLam6,DLam5,DLam7,DLam10,DLam1,DLam4,               & 
& DLam3,DLam2,DLam8,DLam9,DLamh,DepsU,DYu,DYd,DYe,DepsD,DepsE,DYh,DMu,DM12,              & 
& DM112,DM222,DMh,f)

Iname = Iname - 1 
 
End Subroutine rge155  

Subroutine GToParameters157(g,g1,g2,g3,Lam6,Lam5,Lam7,Lam10,Lam1,Lam4,Lam3,           & 
& Lam2,Lam8,Lam9,Lamh,epsU,Yu,Yd,Ye,epsD,epsE,Yh,Mu,M12,M112,M222,Mh,vd,vu)

Implicit None 
Real(dp), Intent(in) :: g(157) 
Real(dp),Intent(out) :: g1,g2,g3,Lam6,Lam5,Lam7,Lam10,Mu,M12,vd,vu

Complex(dp),Intent(out) :: Lam1,Lam4,Lam3,Lam2,Lam8,Lam9,Lamh,epsU(3,3),Yu(3,3),Yd(3,3),Ye(3,3),epsD(3,3),       & 
& epsE(3,3),Yh(3,3),M112,M222,Mh

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'GToParameters157' 
 
g1= g(1) 
g2= g(2) 
g3= g(3) 
Lam6= g(4) 
Lam5= g(5) 
Lam7= g(6) 
Lam10= g(7) 
Lam1= Cmplx(g(8),g(9),dp) 
Lam4= Cmplx(g(10),g(11),dp) 
Lam3= Cmplx(g(12),g(13),dp) 
Lam2= Cmplx(g(14),g(15),dp) 
Lam8= Cmplx(g(16),g(17),dp) 
Lam9= Cmplx(g(18),g(19),dp) 
Lamh= Cmplx(g(20),g(21),dp) 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
epsU(i1,i2) = Cmplx( g(SumI+22), g(SumI+23), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yu(i1,i2) = Cmplx( g(SumI+40), g(SumI+41), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yd(i1,i2) = Cmplx( g(SumI+58), g(SumI+59), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Ye(i1,i2) = Cmplx( g(SumI+76), g(SumI+77), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
epsD(i1,i2) = Cmplx( g(SumI+94), g(SumI+95), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
epsE(i1,i2) = Cmplx( g(SumI+112), g(SumI+113), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yh(i1,i2) = Cmplx( g(SumI+130), g(SumI+131), dp) 
End Do 
 End Do 
 
Mu= g(148) 
M12= g(149) 
M112= Cmplx(g(150),g(151),dp) 
M222= Cmplx(g(152),g(153),dp) 
Mh= Cmplx(g(154),g(155),dp) 
vd= g(156) 
vu= g(157) 
Do i1=1,157 
If (g(i1).ne.g(i1)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Write(*,*) "At position ", i1 
 Call TerminateProgram 
End if 
End do 
Iname = Iname - 1 
 
End Subroutine GToParameters157

Subroutine ParametersToG157(g1,g2,g3,Lam6,Lam5,Lam7,Lam10,Lam1,Lam4,Lam3,             & 
& Lam2,Lam8,Lam9,Lamh,epsU,Yu,Yd,Ye,epsD,epsE,Yh,Mu,M12,M112,M222,Mh,vd,vu,g)

Implicit None 
Real(dp), Intent(out) :: g(157) 
Real(dp), Intent(in) :: g1,g2,g3,Lam6,Lam5,Lam7,Lam10,Mu,M12,vd,vu

Complex(dp), Intent(in) :: Lam1,Lam4,Lam3,Lam2,Lam8,Lam9,Lamh,epsU(3,3),Yu(3,3),Yd(3,3),Ye(3,3),epsD(3,3),       & 
& epsE(3,3),Yh(3,3),M112,M222,Mh

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'ParametersToG157' 
 
g(1) = g1  
g(2) = g2  
g(3) = g3  
g(4) = Lam6  
g(5) = Lam5  
g(6) = Lam7  
g(7) = Lam10  
g(8) = Real(Lam1,dp)  
g(9) = Aimag(Lam1)  
g(10) = Real(Lam4,dp)  
g(11) = Aimag(Lam4)  
g(12) = Real(Lam3,dp)  
g(13) = Aimag(Lam3)  
g(14) = Real(Lam2,dp)  
g(15) = Aimag(Lam2)  
g(16) = Real(Lam8,dp)  
g(17) = Aimag(Lam8)  
g(18) = Real(Lam9,dp)  
g(19) = Aimag(Lam9)  
g(20) = Real(Lamh,dp)  
g(21) = Aimag(Lamh)  
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+22) = Real(epsU(i1,i2), dp) 
g(SumI+23) = Aimag(epsU(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+40) = Real(Yu(i1,i2), dp) 
g(SumI+41) = Aimag(Yu(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+58) = Real(Yd(i1,i2), dp) 
g(SumI+59) = Aimag(Yd(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+76) = Real(Ye(i1,i2), dp) 
g(SumI+77) = Aimag(Ye(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+94) = Real(epsD(i1,i2), dp) 
g(SumI+95) = Aimag(epsD(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+112) = Real(epsE(i1,i2), dp) 
g(SumI+113) = Aimag(epsE(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+130) = Real(Yh(i1,i2), dp) 
g(SumI+131) = Aimag(Yh(i1,i2)) 
End Do 
End Do 

g(148) = Mu  
g(149) = M12  
g(150) = Real(M112,dp)  
g(151) = Aimag(M112)  
g(152) = Real(M222,dp)  
g(153) = Aimag(M222)  
g(154) = Real(Mh,dp)  
g(155) = Aimag(Mh)  
g(156) = vd  
g(157) = vu  
Iname = Iname - 1 
 
End Subroutine ParametersToG157

Subroutine rge157(len, T, GY, F) 
Implicit None 
Integer, Intent(in) :: len 
Real(dp), Intent(in) :: T, GY(len) 
Real(dp), Intent(out) :: F(len) 
Integer :: i1,i2,i3,i4 
Integer :: j1,j2,j3,j4,j5,j6,j7 
Real(dp) :: q 
Real(dp) :: g1,betag11,betag12,Dg1,g2,betag21,betag22,Dg2,g3,betag31,betag32,         & 
& Dg3,Lam6,betaLam61,betaLam62,DLam6,Lam5,betaLam51,betaLam52,DLam5,Lam7,betaLam71,      & 
& betaLam72,DLam7,Lam10,betaLam101,betaLam102,DLam10,Mu,betaMu1,betaMu2,DMu,             & 
& M12,betaM121,betaM122,DM12,vd,betavd1,betavd2,Dvd,vu,betavu1,betavu2,Dvu
Complex(dp) :: Lam1,betaLam11,betaLam12,DLam1,Lam4,betaLam41,betaLam42,               & 
& DLam4,Lam3,betaLam31,betaLam32,DLam3,Lam2,betaLam21,betaLam22,DLam2,Lam8,              & 
& betaLam81,betaLam82,DLam8,Lam9,betaLam91,betaLam92,DLam9,Lamh,betaLamh1,               & 
& betaLamh2,DLamh,epsU(3,3),betaepsU1(3,3),betaepsU2(3,3),DepsU(3,3),adjepsU(3,3)        & 
& ,Yu(3,3),betaYu1(3,3),betaYu2(3,3),DYu(3,3),adjYu(3,3),Yd(3,3),betaYd1(3,3)            & 
& ,betaYd2(3,3),DYd(3,3),adjYd(3,3),Ye(3,3),betaYe1(3,3),betaYe2(3,3),DYe(3,3)           & 
& ,adjYe(3,3),epsD(3,3),betaepsD1(3,3),betaepsD2(3,3),DepsD(3,3),adjepsD(3,3)            & 
& ,epsE(3,3),betaepsE1(3,3),betaepsE2(3,3),DepsE(3,3),adjepsE(3,3),Yh(3,3)               & 
& ,betaYh1(3,3),betaYh2(3,3),DYh(3,3),adjYh(3,3),M112,betaM1121,betaM1122,               & 
& DM112,M222,betaM2221,betaM2222,DM222,Mh,betaMh1,betaMh2,DMh
Iname = Iname +1 
NameOfUnit(Iname) = 'rge157' 
 
OnlyDiagonal = .Not.GenerationMixing 
q = t 
 
Call GToParameters157(gy,g1,g2,g3,Lam6,Lam5,Lam7,Lam10,Lam1,Lam4,Lam3,Lam2,           & 
& Lam8,Lam9,Lamh,epsU,Yu,Yd,Ye,epsD,epsE,Yh,Mu,M12,M112,M222,Mh,vd,vu)

Call Adjungate(epsU,adjepsU)
Call Adjungate(Yu,adjYu)
Call Adjungate(Yd,adjYd)
Call Adjungate(Ye,adjYe)
Call Adjungate(epsD,adjepsD)
Call Adjungate(epsE,adjepsE)
Call Adjungate(Yh,adjYh)


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
! Lam6 
!-------------------- 
 
betaLam61  = 0

 
 
If (TwoLoopRGE) Then 
betaLam62 = 0

 
DLam6 = oo16pi2*( betaLam61 + oo16pi2 * betaLam62 ) 

 
Else 
DLam6 = oo16pi2* betaLam61 
End If 
 
 
!-------------------- 
! Lam5 
!-------------------- 
 
betaLam51  = 0

 
 
If (TwoLoopRGE) Then 
betaLam52 = 0

 
DLam5 = oo16pi2*( betaLam51 + oo16pi2 * betaLam52 ) 

 
Else 
DLam5 = oo16pi2* betaLam51 
End If 
 
 
!-------------------- 
! Lam7 
!-------------------- 
 
betaLam71  = 0

 
 
If (TwoLoopRGE) Then 
betaLam72 = 0

 
DLam7 = oo16pi2*( betaLam71 + oo16pi2 * betaLam72 ) 

 
Else 
DLam7 = oo16pi2* betaLam71 
End If 
 
 
!-------------------- 
! Lam10 
!-------------------- 
 
betaLam101  = 0

 
 
If (TwoLoopRGE) Then 
betaLam102 = 0

 
DLam10 = oo16pi2*( betaLam101 + oo16pi2 * betaLam102 ) 

 
Else 
DLam10 = oo16pi2* betaLam101 
End If 
 
 
!-------------------- 
! Lam1 
!-------------------- 
 
betaLam11  = 0

 
 
If (TwoLoopRGE) Then 
betaLam12 = 0

 
DLam1 = oo16pi2*( betaLam11 + oo16pi2 * betaLam12 ) 

 
Else 
DLam1 = oo16pi2* betaLam11 
End If 
 
 
Call Chop(DLam1) 

!-------------------- 
! Lam4 
!-------------------- 
 
betaLam41  = 0

 
 
If (TwoLoopRGE) Then 
betaLam42 = 0

 
DLam4 = oo16pi2*( betaLam41 + oo16pi2 * betaLam42 ) 

 
Else 
DLam4 = oo16pi2* betaLam41 
End If 
 
 
Call Chop(DLam4) 

!-------------------- 
! Lam3 
!-------------------- 
 
betaLam31  = 0

 
 
If (TwoLoopRGE) Then 
betaLam32 = 0

 
DLam3 = oo16pi2*( betaLam31 + oo16pi2 * betaLam32 ) 

 
Else 
DLam3 = oo16pi2* betaLam31 
End If 
 
 
Call Chop(DLam3) 

!-------------------- 
! Lam2 
!-------------------- 
 
betaLam21  = 0

 
 
If (TwoLoopRGE) Then 
betaLam22 = 0

 
DLam2 = oo16pi2*( betaLam21 + oo16pi2 * betaLam22 ) 

 
Else 
DLam2 = oo16pi2* betaLam21 
End If 
 
 
Call Chop(DLam2) 

!-------------------- 
! Lam8 
!-------------------- 
 
betaLam81  = 0

 
 
If (TwoLoopRGE) Then 
betaLam82 = 0

 
DLam8 = oo16pi2*( betaLam81 + oo16pi2 * betaLam82 ) 

 
Else 
DLam8 = oo16pi2* betaLam81 
End If 
 
 
Call Chop(DLam8) 

!-------------------- 
! Lam9 
!-------------------- 
 
betaLam91  = 0

 
 
If (TwoLoopRGE) Then 
betaLam92 = 0

 
DLam9 = oo16pi2*( betaLam91 + oo16pi2 * betaLam92 ) 

 
Else 
DLam9 = oo16pi2* betaLam91 
End If 
 
 
Call Chop(DLam9) 

!-------------------- 
! Lamh 
!-------------------- 
 
betaLamh1  = 0

 
 
If (TwoLoopRGE) Then 
betaLamh2 = 0

 
DLamh = oo16pi2*( betaLamh1 + oo16pi2 * betaLamh2 ) 

 
Else 
DLamh = oo16pi2* betaLamh1 
End If 
 
 
Call Chop(DLamh) 

!-------------------- 
! epsU 
!-------------------- 
 
betaepsU1  = 0

 
 
If (TwoLoopRGE) Then 
betaepsU2 = 0

 
DepsU = oo16pi2*( betaepsU1 + oo16pi2 * betaepsU2 ) 

 
Else 
DepsU = oo16pi2* betaepsU1 
End If 
 
 
Call Chop(DepsU) 

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
! epsD 
!-------------------- 
 
betaepsD1  = 0

 
 
If (TwoLoopRGE) Then 
betaepsD2 = 0

 
DepsD = oo16pi2*( betaepsD1 + oo16pi2 * betaepsD2 ) 

 
Else 
DepsD = oo16pi2* betaepsD1 
End If 
 
 
Call Chop(DepsD) 

!-------------------- 
! epsE 
!-------------------- 
 
betaepsE1  = 0

 
 
If (TwoLoopRGE) Then 
betaepsE2 = 0

 
DepsE = oo16pi2*( betaepsE1 + oo16pi2 * betaepsE2 ) 

 
Else 
DepsE = oo16pi2* betaepsE1 
End If 
 
 
Call Chop(DepsE) 

!-------------------- 
! Yh 
!-------------------- 
 
betaYh1  = 0

 
 
If (TwoLoopRGE) Then 
betaYh2 = 0

 
DYh = oo16pi2*( betaYh1 + oo16pi2 * betaYh2 ) 

 
Else 
DYh = oo16pi2* betaYh1 
End If 
 
 
Call Chop(DYh) 

!-------------------- 
! Mu 
!-------------------- 
 
betaMu1  = 0

 
 
If (TwoLoopRGE) Then 
betaMu2 = 0

 
DMu = oo16pi2*( betaMu1 + oo16pi2 * betaMu2 ) 

 
Else 
DMu = oo16pi2* betaMu1 
End If 
 
 
!-------------------- 
! M12 
!-------------------- 
 
betaM121  = 0

 
 
If (TwoLoopRGE) Then 
betaM122 = 0

 
DM12 = oo16pi2*( betaM121 + oo16pi2 * betaM122 ) 

 
Else 
DM12 = oo16pi2* betaM121 
End If 
 
 
!-------------------- 
! M112 
!-------------------- 
 
betaM1121  = 0

 
 
If (TwoLoopRGE) Then 
betaM1122 = 0

 
DM112 = oo16pi2*( betaM1121 + oo16pi2 * betaM1122 ) 

 
Else 
DM112 = oo16pi2* betaM1121 
End If 
 
 
Call Chop(DM112) 

!-------------------- 
! M222 
!-------------------- 
 
betaM2221  = 0

 
 
If (TwoLoopRGE) Then 
betaM2222 = 0

 
DM222 = oo16pi2*( betaM2221 + oo16pi2 * betaM2222 ) 

 
Else 
DM222 = oo16pi2* betaM2221 
End If 
 
 
Call Chop(DM222) 

!-------------------- 
! Mh 
!-------------------- 
 
betaMh1  = 0

 
 
If (TwoLoopRGE) Then 
betaMh2 = 0

 
DMh = oo16pi2*( betaMh1 + oo16pi2 * betaMh2 ) 

 
Else 
DMh = oo16pi2* betaMh1 
End If 
 
 
Call Chop(DMh) 

!-------------------- 
! vd 
!-------------------- 
 
betavd1  = 0

 
 
If (TwoLoopRGE) Then 
betavd2 = 0

 
Dvd = oo16pi2*( betavd1 + oo16pi2 * betavd2 ) 

 
Else 
Dvd = oo16pi2* betavd1 
End If 
 
 
!-------------------- 
! vu 
!-------------------- 
 
betavu1  = 0

 
 
If (TwoLoopRGE) Then 
betavu2 = 0

 
Dvu = oo16pi2*( betavu1 + oo16pi2 * betavu2 ) 

 
Else 
Dvu = oo16pi2* betavu1 
End If 
 
 
Call ParametersToG157(Dg1,Dg2,Dg3,DLam6,DLam5,DLam7,DLam10,DLam1,DLam4,               & 
& DLam3,DLam2,DLam8,DLam9,DLamh,DepsU,DYu,DYd,DYe,DepsD,DepsE,DYh,DMu,DM12,              & 
& DM112,DM222,DMh,Dvd,Dvu,f)

Iname = Iname - 1 
 
End Subroutine rge157  

End Module RGEs_Zee 
 

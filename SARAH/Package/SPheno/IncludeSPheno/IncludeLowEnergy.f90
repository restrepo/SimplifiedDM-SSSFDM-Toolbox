! Real(dp) Function C0m(m1, m2, m3)
! Implicit None
! Real(dp), Intent(in) :: m1, m2, m3
! Real(dp) :: eps=1E-10_dp, large = 1E+5_dp
! 
! ! !    C0m  = -C0_3m(m1,m2,m3)  ! check sign
! 
! If ((Abs(m1-m2).lt.eps).And.(Abs(m1-m3).lt.eps)) Then ! all masse equal
!   If (Abs(m1).lt.eps) Then
!     Write(ErrCan,*) "Numerical problem in C0m"
!     Write(ErrCan,*) "Involved masses: ",m1,m2,m3
!    C0m = large
!   Else
!    C0m = 1/(2.*m1)
!   End if
! 
! Else If (Abs(m1-m2).lt.eps) Then ! m1 = m2
!  If (Abs(m3).lt.eps) Then
!    C0m = 1/m2
!  Else If (Abs(m2).lt.eps) Then
!     Write(ErrCan,*) "Numerical problem in C0m"
!     Write(ErrCan,*) "Involved masses: ",m1,m2,m3
!    C0m = large/m3
!  Else
!    C0m = (m2 - m3 + m3*Log(m3/m2))/(m2 - m3)**2
!  End if
! 
! Else If (Abs(m1-m3).lt.eps) Then ! m1 = m3
!  If (Abs(m2).lt.eps) Then
!    C0m = 1/m3
!  Else If (Abs(m3).lt.eps) Then
!     Write(ErrCan,*) "Numerical problem in C0m"
!     Write(ErrCan,*) "Involved masses: ",m1,m2,m3
!    C0m = large/m2
!  Else
!    C0m =   (-m2 + m3 + m2*Log(m2/m3))/(m2 - m3)**2
!  End if
! 
! Else If (Abs(m3-m2).lt.eps) Then ! m2 = m3
!  If (Abs(m1).lt.eps) Then
!    C0m = 1/m3
!  Else If (Abs(m3).lt.eps) Then
!     Write(ErrCan,*) "Numerical problem in C0m"
!     Write(ErrCan,*) "Involved masses: ",m1,m2,m3
!    C0m = large/m1
!  Else
!    C0m =  (-m1 + m3 - m1*Log(m3/m1))/(m1 - m3)**2
!  End if
! 
! Else
!  If (Abs(m1).lt.eps) Then
!   C0m = -Log(m3/m2)/(m2 - m3)
!  Else if (Abs(m2).lt.eps) Then
!   C0m = -Log(m3/m1)/(m1 - m3)
!  Else if (Abs(m3).lt.eps) Then
!   C0m = -Log(m2/m1)/(m1 - m2)
!  Else
!   C0m =  (m2*(-m1 + m3)*Log(m2/m1) + (m1 - m2)*m3*Log(m3/m1))/ &
!      &  ((m1 - m2)*(m1 - m3)*(m2 - m3))
!  End if
! 
! End if
! 
!  C0m = - C0m
! 
! End Function C0m
! 
! Real(dp) Function C00m(m1, m2, m3)
! Implicit None
! Real(dp), Intent(in) :: m1, m2, m3
! Real(dp) :: eps=1E-10_dp, large = 1E+5_dp
! 
! If ((Abs(m1-m2).lt.eps).And.(Abs(m1-m3).lt.eps)) Then ! all masse equal
!  If (Abs(m3).lt.eps) Then
!     Write(ErrCan,*) "Numerical problem in C00m"
!     Write(ErrCan,*) "Involved masses: ",m1,m2,m3
!    C00m = large
!  Else
!    C00m = -Log(m3)/4.
!  End if
! 
! Else If (Abs(m1-m2).lt.eps) Then ! m1 = m2
!   If (Abs(m3).lt.eps) Then
!    C00m = 0.125_dp - Log(m2)/4._dp
!   Else if (Abs(m2).lt.eps) Then
!    C00m = 0.375_dp - Log(m3)/4._dp
!   Else
!    C00m = ((m2 - m3)*(m2 - 3*m3 + 2*(-m2 + m3)*Log(m2)) - &
!    &  2*m3**2*Log(m3/m2))/(8.*(m2 - m3)**2)
!   End if
! 
! Else If (Abs(m1-m3).lt.eps) Then ! m1 = m3
!   If (Abs(m2).lt.eps) Then
!    C00m = 0.125_dp - Log(m2)/4._dp
!   Else if (Abs(m3).lt.eps) Then
!    C00m = 0.375_dp - Log(m3)/4._dp
!   Else
!    C00m =    -(2*m2**2*Log(m2/m3) +  &
!     &      (m2 - m3)*(-3*m2 + m3 + 2*(m2 - m3)*Log(m3)))/ &
!     &   (8.*(m2 - m3)**2)
!   End if
! 
! Else If (Abs(m3-m2).lt.eps) Then ! m2 = m3
!   If (Abs(m1).lt.eps) Then
!    C00m = 0.125_dp - Log(m2)/4._dp
!   Else if (Abs(m3).lt.eps) Then
!    C00m = 0.375_dp - Log(m3)/4._dp
!   Else
!    C00m =  (-((m1 - m3)*(-3*m1 + m3 + 2*(m1 - m3)*Log(m1))) + &
!    &    2*(2*m1 - m3)*m3*Log(m3/m1))/(8.*(m1 - m3)**2)
!   End if
! 
! Else
!  If (Abs(m1).lt.eps) Then
!   C00m = -(-3*m2 + 3*m3 + 2*m2*Log(m2) - 2*m3*Log(m3))/(8.*(m2 - m3))
!  Else If (Abs(m2).lt.eps) Then
!   C00m = -(-3*m1 + 3*m3 + 2*m1*Log(m1) - 2*m3*Log(m3))/(8.*(m1 - m3))
!  Else If (Abs(m3).lt.eps) Then
!   C00m = -(-3*m1 + 3*m2 + 2*m1*Log(m1) - 2*m2*Log(m2))/(8.*(m1 - m2))
!  Else 
!    C00m =  ((-m1 + m3)*((m1 - m2)*(m2 - m3)*(-3 + 2*Log(m1)) -  &
!   &          2*m2**2*Log(m2/m1)) + 2*(-m1 + m2)*m3**2*Log(m3/m1))/ &
!   &      (8.*(m1 - m2)*(m1 - m3)*(m2 - m3))
!   End if
! 
! End if
! 
!   C00m = - C00m 
! 
! End Function C00m
! 
! 
! 
! Real(dp) Function C11m(m1, m2, m3)
! Implicit None
! Real(dp), Intent(in) :: m1, m2, m3
! Real(dp) :: eps=1E-10_dp, large = 1E+5_dp
! 
! If ((Abs(m1-m2).lt.eps).And.(Abs(m1-m3).lt.eps)) Then ! all masse equal
!   If (Abs(m1).lt.eps) Then
!     Write(ErrCan,*) "Numerical problem in C11m"
!     Write(ErrCan,*) "Involved masses: ",m1,m2,m3
!    C11m = large
!   Else
!    C11m = 1/(12.*m1)
!   End if
! 
! Else If (Abs(m1-m2).lt.eps) Then ! m1 = m2
!   If (Abs(m1).lt.eps) Then
!     Write(ErrCan,*) "Numerical problem in C11m"
!     Write(ErrCan,*) "Involved masses: ",m1,m2,m3
!    C11m = -large
!   Else if (Abs(m3).lt.eps) Then
!    C11m = -1/(9.*m2)
!   Else
!    C11m = ((m2 - m3)*(2*m2**2 - 7*m2*m3 + 11*m3**2) + &
!    &      6*m3**3*Log(m3/m2))/(18.*(m2 - m3)**4)
!   End if
! 
! Else If (Abs(m1-m3).lt.eps) Then ! m1 = m3
!  If (Abs(m1).lt.eps) Then
!    C11m = -1/(6.*m2)
!   Else if (Abs(m2).lt.eps) Then
!    C11m =-1/(3.*m3)
!   Else
!    C11m = (m2**3 - 6*m2**2*m3 + 3*m2*m3**2 + 2*m3**3 + &
!    &      6*m2*m3**2*Log(m2/m3))/(6.*(m2 - m3)**4)
!   End if
! 
! Else If (Abs(m3-m2).lt.eps) Then ! m2 = m3
!  If (Abs(m1).lt.eps) Then
!    C11m = -1/(9.*m3)
!   Else if (Abs(m2).lt.eps) Then
!     Write(ErrCan,*) "Numerical problem in C11m"
!     Write(ErrCan,*) "Involved masses: ",m1,m2,m3
!    C11m =-large
!   Else
!    C11m =  -((m1 - m3)*(11*m1**2 - 7*m1*m3 + 2*m3**2) + &
!    &       6*m1**3*Log(m3/m1))/(18.*(m1 - m3)**4)
!   End if
! 
! Else
!  If (Abs(m1).lt.eps) Then
!   C11m = (-((m2 - 3*m3)*(m2 - m3)) + 2*m3**2*Log(m3/m2))/(6.*(m2 - m3)**3)
!  Else If (Abs(m2).lt.eps) Then
!   C11m =Log(m3/m1)/(3*m1 - 3*m3)
!  Else If (Abs(m3).lt.eps) Then
!   C11m = (3*m1**2 - 4*m1*m2 + m2**2 + 2*m1**2*Log(m2/m1))/(6.*(m1 - m2)**3)
!  Else 
!    C11m =   (m2*(m1 - m3)*(-((-m1 + m2)*(m2 - m3)* &
!      &          (-3*m1*m2 + m2**2 + 5*m1*m3 - 3*m2*m3)) -  &
!      &       2*(m1*m2*(m2 - 3*m3)*m3 + m2**2*m3**2 +  &
!      &          m1**2*(m2**2 - 3*m2*m3 + 3*m3**2))*Log(m2/m1)) +  &
!      &    2*(m1 - m2)**3*m3**3*Log(m3/m1))/ &
!      &  (6.*(m1 - m2)**3*(m1 - m3)*(m2 - m3)**3)
!  End if
! End if
! 
!  C11m = - C11m
! 
! End Function C11m
! 
! 
! Real(dp) Function C12m(m1, m2, m3)
! Implicit None
! Real(dp), Intent(in) :: m1, m2, m3
! Real(dp) :: eps=1E-10_dp, large = 1E+5_dp
! 
! If ((Abs(m1-m2).lt.eps).And.(Abs(m1-m3).lt.eps)) Then ! all masse equal
!   If (Abs(m1).lt.eps) Then
!     Write(ErrCan,*) "Numerical problem in C12m"
!     Write(ErrCan,*) "Involved masses: ",m1,m2,m3
!    C12m = large
!   Else
!    C12m = 1/(24.*m1)
!   End if
! 
! Else If (Abs(m1-m2).lt.eps) Then ! m1 = m2
!  If (Abs(m1).lt.eps) Then
!     Write(ErrCan,*) "Numerical problem in C12m"
!     Write(ErrCan,*) "Involved masses: ",m1,m2,m3
!    C12m = -large
!   Else if (Abs(m3).lt.eps) Then
!    C12m = -1/(9.*m2)
!   Else
!    C12m = (m2**3 - 6*m2**2*m3 + 3*m2*m3**2 + 2*m3**3 &
!     &  - 6*m2*m3**2*Log(m3/m2))/(12.*(m2 - m3)**4)
!   End if
! 
! Else If (Abs(m1-m3).lt.eps) Then ! m1 = m3
!  If (Abs(m2).lt.eps) Then
!    C12m = -1/(3.*m3)
!   Else if (Abs(m3).lt.eps) Then
!    C12m = -1/(6.*m2)
!   Else
!    C12m = (2*m2**3 + 3*m2**2*m3 - 6*m2*m3**2 + m3**3 &
!    & - 6*m2**2*m3*Log(m2/m3))/(12.*(m2 - m3)**4)
!   End if
! 
! Else If (Abs(m3-m2).lt.eps) Then ! m2 = m3
!  If (Abs(m1).lt.eps) Then
!    C12m = -1/(9.*m3)
!   Else if (Abs(m3).lt.eps) Then
!     Write(ErrCan,*) "Numerical problem in C12m"
!     Write(ErrCan,*) "Involved masses: ",m1,m2,m3
!    C12m = -large
!   Else
!    C12m = -((m1 - m3)*(11*m1**2 - 7*m1*m3 + 2*m3**2) &
!    &  + 6*m1**3*Log(m3/m1))/(36.*(m1 - m3)**4)
!   End if
! 
! Else
!  If (Abs(m1).lt.eps) Then
!   C12m = (m2**2 - m3**2 + 2*m2*m3*Log(m3/m2))/(6.*(m2 - m3)**3)
!  Else If (Abs(m2).lt.eps) Then
!   C12m =(-m1 + m3 + m1*Log(m1/m3))/(6.*(m1 - m3)**2)
!  Else If (Abs(m3).lt.eps) Then
!   C12m = (-m1 + m2 + m1*Log(m1/m2))/(6.*(m1 - m2)**2)
!  Else 
!    C12m =   -(m2**2*(m1 - m3)**2*(m1*(m2 - 3*m3) + 2*m2*m3)* &
!      &      Log(m2/m1) + (m1 - m2)* &
!      &      ((m1 - m3)*(m2 - m3)*  &
!      &         (-(m2*m3*(m2 + m3)) + m1*(m2**2 + m3**2)) +  &
!      &        (m1 - m2)*m3**2*(3*m1*m2 - (m1 + 2*m2)*m3)*Log(m3/m1)) &
!      &     )/(6.*(m1 - m2)**2*(m1 - m3)**2*(m2 - m3)**3)
!  End if
! 
! End if
! 
!  C12m = - C12m
! 
! End Function C12m
! 
! 
! 
! Real(dp) Function C22m(m1, m2, m3)
! Implicit None
! Real(dp), Intent(in) :: m1, m2, m3
! Real(dp) :: r1, r2
! Real(dp) :: eps=1E-10_dp, large = 1E+5_dp
! 
! r1 = m2/m1
! r2 = m3/m1
! 
! If ((Abs(m1-m2).lt.eps).And.(Abs(m1-m3).lt.eps)) Then ! all masse equal
!   If (Abs(m1).lt.eps) Then
!     Write(ErrCan,*) "Numerical problem in C22m"
!     Write(ErrCan,*) "Involved masses: ",m1,m2,m3
!    C22m = -large 
!   Else
!    C22m = -1/(12.*m1)
!   End if
! 
! Else If (Abs(m1-m2).lt.eps) Then ! m1 = m2
!  If (Abs(m1).lt.eps) Then
!    C22m = 1/(6.*m3)
!   Else if (Abs(m3).lt.eps) Then
!    C22m = 1/(3.*m2)
!   Else
!     C22m=-(2*m2**3 + 3*m2**2*m3 - 6*m2*m3**2 + m3**3 -  &
!     &       6*m2**2*m3*Log(m2/m3))/(6.*(m2 - m3)**4)
!   Endif
! 
! Else If (Abs(m1-m3).lt.eps) Then ! m1 = m3
!  If (Abs(m2).lt.eps) Then
!    C22m = 1/(9.*m3)
!   Else if (Abs(m3).lt.eps) Then
!     Write(ErrCan,*) "Numerical problem in C22m"
!     Write(ErrCan,*) "Involved masses: ",m1,m2,m3
!    C22m = large
!   Else
!      C22m=((m2 - m3)*(11*m2**2 - 7*m2*m3 + 2*m3**2) -  &
!     &      6*m2**3*Log(m2/m3))/(18.*(m2 - m3)**4)
!   End if
! 
! Else If (Abs(m3-m2).lt.eps) Then ! m2 = m3
!  If (Abs(m1).lt.eps) Then
!    C22m = 1/(9.*m3)
!   Else if (Abs(m3).lt.eps) Then
!     Write(ErrCan,*) "Numerical problem in C22m"
!     Write(ErrCan,*) "Involved masses: ",m1,m2,m3
!    C22m = large
!   Else
!      C22m =  ((m1 - m3)*(11*m1**2 - 7*m1*m3 + 2*m3**2) +  &
!     &     6*m1**3*Log(m3/m1))/(18.*(m1 - m3)**4)  
!   End if
! 
! Else
!  If (Abs(m1).lt.eps) Then
!   C22m = -(3*m2**2 - 4*m2*m3 + m3**2 - 2*m2**2*Log(m2/m3))/(6.*(m2 - m3)**3)
!  Else If (Abs(m2).lt.eps) Then
!   C22m = -(3*m1**2 - 4*m1*m3 + m3**2 - 2*m1**2*Log(m1/m3))/(6.*(m1 - m3)**3)
!  Else If (Abs(m3).lt.eps) Then
!   C22m = Log(m1/m2)/(3*m1 - 3*m2)
!  Else
!    C22m =   (2*m1**3*(m2 - m3)**3*Log(m2/m1) + (m1 - m2)*m3* &
!      &     (-((m1 - m3)*(m2 - m3)*(5*m1*m2 - 3*(m1 + m2)*m3 + m3**2)) + &
!      &       2*(3*m1**2*m2**2 - 3*m1*m2*(m1 + m2)*m3 + &
!      & (m1**2 + m1*m2 + m2**2)*m3**2)*Log(m2/m3)))/  &
!      &  (6.*(m1 - m2)*(m1 - m3)**3*(m2 - m3)**3)
!  End if
! 
! End if
! 
! ! ! C22m = - C22m ! check sign!
! End Function C22m
! 
! 
! 
! Real(dp) Function C2m(m1, m2, m3)
! Implicit None
! Real(dp), Intent(in) :: m1, m2, m3
! Real(dp) :: eps=1E-10_dp, large = 1E+5_dp
! 
! If ((Abs(m1-m2).lt.eps).And.(Abs(m1-m3).lt.eps)) Then ! all masse equal
!    C2m = -1/(6.*m1)
! 
! Else If (Abs(m1-m2).lt.eps) Then ! m1 = m2
!  If (Abs(m1).lt.eps) Then
!    C2m =-1/(2.*m3)
!   Else if (Abs(m3).lt.eps) Then
!    C2m = -1/(2.*m2)
!   Else
!    C2m = (-m2**2 + m3**2 + 2*m2*m3*Log(m2/m3))/(2.*(m2 - m3)**3)
!   End if
! 
! Else If (Abs(m1-m3).lt.eps) Then ! m1 = m3
!  If (Abs(m2).lt.eps) Then
!    C2m = -1/(4.*m3)
!   Else if (Abs(m3).lt.eps) Then
!     Write(ErrCan,*) "Numerical problem in C2m"
!     Write(ErrCan,*) "Involved masses: ",m1,m2,m3
!    C2m = -large
!   Else
!    C2m = (3*m2**2 - 4*m2*m3 + m3**2 - 2*m2**2*Log(m2/m3))/(4.*(m2 - m3)**3)
!   End if
! 
! Else If (Abs(m3-m2).lt.eps) Then ! m2 = m3
!  If (Abs(m1).lt.eps) Then
!    C2m = -1/(4.*m3)
!   Else if (Abs(m3).lt.eps) Then
!     Write(ErrCan,*) "Numerical problem in C2m"
!     Write(ErrCan,*) "Involved masses: ",m1,m2,m3
!    C2m = -large
!   Else
!    C2m = (3*m1**2 - 4*m1*m3 + m3**2 + 2*m1**2*Log(m3/m1))/(4.*(m1 - m3)**3)
!   End if
! 
! Else
! 
!  If (Abs(m1).lt.eps) Then
!   C2m = (m2 - m3 + m2*Log(m3/m2))/(2.*(m2 - m3)**2)
!  Else If (Abs(m2).lt.eps) Then
!   C2m = (m1 - m3 + m1*Log(m3/m1))/(2.*(m1 - m3)**2)
!  Else If (Abs(m3).lt.eps) Then
!   C2m = Log(m2/m1)/(2*m1 - 2*m2)
!  Else
!    C2m =  (m1**2*(m2 - m3)**2*Log(m2/m1) +   &
!      &    (-m1 + m2)*m3*((m1 - m3)*(m2 - m3) +  & 
!      &       (-2*m1*m2 + (m1 + m2)*m3)*Log(m2/m3)))/ &
!      &  (2.*(m1 - m2)*(m1 - m3)**2*(m2 - m3)**2) 
!   End if
! End if
! 
!  C2m = - C2m
! 
! End Function C2m
! 
! 
! 
! Real(dp) Function C1m(m1, m2, m3)
! Implicit None
! Real(dp), Intent(in) :: m1, m2, m3
! Real(dp) :: eps=1E-10_dp, large = 1E+5_dp
! 
! If ((Abs(m1-m2).lt.eps).And.(Abs(m1-m3).lt.eps)) Then ! all masse equal
!   If (Abs(m1).lt.eps) Then
!     Write(ErrCan,*) "Numerical problem in C12m"
!     Write(ErrCan,*) "Involved masses: ",m1,m2,m3
!    C1m = -large 
!   Else
!    C1m = -1/(6.*m1)
!   End if
! 
! Else If (Abs(m1-m2).lt.eps) Then ! m1 = m2
!  If (Abs(m2).lt.eps) Then
!     Write(ErrCan,*) "Numerical problem in C12m"
!     Write(ErrCan,*) "Involved masses: ",m1,m2,m3
!    C1m = -large
!   Else if (Abs(m3).lt.eps) Then
!    C1m = -1/(4.*m2)
!   Else
!    C1m = -((m2 - 3*m3)*(m2 - m3) - 2*m3**2*Log(m3/m2))/(4.*(m2 - m3)**3)
!   End if
! 
! Else If (Abs(m1-m3).lt.eps) Then ! m1 = m3
!  If (Abs(m2).lt.eps) Then
!    C1m = -1/(2.*m3)
!   Else if (Abs(m3).lt.eps) Then
!    C1m = -1/(2.*m2)
!   Else
!    C1m = (-m2**2 + m3**2 + 2*m2*m3*Log(m2/m3))/(2.*(m2 - m3)**3)
!   End if
! 
! Else If (Abs(m3-m2).lt.eps) Then ! m2 = m3
!  If (Abs(m2).lt.eps) Then
!     Write(ErrCan,*) "Numerical problem in C12m"
!     Write(ErrCan,*) "Involved masses: ",m1,m2,m3
!    C1m = -large
!   Else if (Abs(m1).lt.eps) Then
!    C1m = -1/(4.*m3)
!   Else
!    C1m = (3*m1**2 - 4*m1*m3 + m3**2 + 2*m1**2*Log(m3/m1))/(4.*(m1 - m3)**3)
!   End if
! 
! Else
!  If (Abs(m1).lt.eps) Then
!   C1m = (-m2 + m3 + m3*Log(m2/m3))/(2.*(m2 - m3)**2)
!  Else If (Abs(m2).lt.eps) Then
!   C1m = Log(m3/m1)/(2*m1 - 2*m3)
!  Else If (Abs(m3).lt.eps) Then
!   C1m =(m1 - m2 + m1*Log(m2/m1))/(2.*(m1 - m2)**2)
!  Else
!    C1m =   (m2*(-m1 + m3)*((-m1 + m2)*(m2 - m3) -      &
!      &       (m1*(m2 - 2*m3) + m2*m3)*Log(m2/m1)) +    &
!      &    (m1 - m2)**2*m3**2*Log(m3/m1))/              &
!      &  (2.*(m1 - m2)**2*(m1 - m3)*(m2 - m3)**2) 
!  End if
! End if
! 
!  C1m = - C1m
! 
! End Function C1m
! 
! 
! Real(dp) Function MonopoleFSS(m1, m2, m3)
! Implicit None
! Real(dp), Intent(in) :: m1, m2, m3
! Real(dp) :: eps=1E-10_dp
! 
! If ((Abs(m2-m3).lt.eps).and.(Abs(m1-m2).lt.eps)) Then
!  If (Abs(m1).lt. eps) Then
!     Write(ErrCan,*) "Numerical problem in MonopoleFSS"
!     Write(ErrCan,*) "Involved masses: ",m1,m2,m3
!     MonopoleFSS = -1/eps
!  Else
!     MonopoleFSS = -1/(24.*m1)
!  End if
! 
! Else If (Abs(m2-m3).lt.eps) Then
!   If (Abs(m1).lt.eps) Then
!     MonopoleFSS = -1/(18.*m3)
!   Else If (Abs(m2).lt.eps) Then
!     Write(ErrCan,*) "Numerical problem in MonopoleFSS"
!     Write(ErrCan,*) "Involved masses: ",m1,m2,m3
!     MonopoleFSS = -1/eps
!   Else 
!     MonopoleFSS = (11*m1**3 - 18*m1**2*m3 + 9*m1*m3**2 - 2*m3**3 & 
!          & - 6*m1**3*Log(m1) + 6*m1**3*Log(m3))/(36.*(m1 - m3)**4)
!   End if
! 
! Else If (Abs(m1-m3).lt.eps) Then
!   If (Abs(m3).lt.eps) Then
!     MonopoleFSS = -1/(6.*m2)
!   Else If (Abs(m2).lt.eps) Then
!     MonopoleFSS = -1/(12.*m3)
!   Else 
!     MonopoleFSS = -(2*m2**3 + 3*m2**2*m3 - 6*m2*m3**2 + m3**3 - 6*m2**2*m3*Log(m2) &
!          &  + 6*m2**2*m3*Log(m3))/(12.*(m2 - m3)**4)
!   End if
! 
! Else If (Abs(m1-m2).lt.eps) Then
!   If (Abs(m3).lt.eps) Then
!     MonopoleFSS = -1/(12.*m2)
!   Else If (Abs(m2).lt.eps) Then
!     MonopoleFSS = -1/(6.*m3)
!   Else 
!     MonopoleFSS = -(m2**3 - 6*m2**2*m3 + 3*m2*m3**2 + 2*m3**3 +  6*m2*m3**2*Log(m2) &
!          & - 6*m2*m3**2*Log(m3))/(12.*(m2 - m3)**4)
!   End if
! 
! Else 
! 
!  If (Abs(m1).lt.eps) Then
!    MonopoleFSS = (-m2**2 + m3**2 + 2*m2*m3*Log(m2/m3))/(6.*(m2 - m3)**3)  
!  Else If (Abs(m2).lt.eps) Then
!    MonopoleFSS = (m1 - m3 + m1*Log(m3/m1))/(6.*(m1 - m3)**2)
!  Else If (Abs(m3).lt.eps) Then
!    MonopoleFSS = (m1 - m2 + m1*Log(m2/m1))/(6.*(m1 - m2)**2)
!  Else
!   MonopoleFSS = (-(m1**3*(m2 - m3)**3*Log(m1)) + (m1 - m3)*((m1 - m2)*(m2 - m3)*(-(m2*m3*(m2 + m3)) + m1*(m2**2 + m3**2)) +  &
!      &       m2**2*(m1 - m3)*(m1*(m2 - 3*m3) + 2*m2*m3)*Log(m2)) + (m1 - m2)**2*m3**2*(3*m1*m2 - (m1 + 2*m2)*m3)*Log(m3))/   &
!      &  (6.*(m1 - m2)**2*(m1 - m3)**2*(m2 - m3)**3)
!   End if
! End If
! 
! End Function MonopoleFSS
! 
! 
! Real(dp) Function MonopoleSFF(m1, m2, m3)
! Implicit None
! Real(dp), Intent(in) :: m1, m2, m3
! Real(dp) :: eps=1E-10_dp
! 
! If ((Abs(m2-m3).lt.eps).and.(Abs(m1-m2).lt.eps)) Then
!  If (Abs(m1).lt.eps) Then 
!     Write(ErrCan,*) "Numerical problem in MonopoleSFF"
!     Write(ErrCan,*) "Involved masses: ",m1,m2,m3
!   MonopoleSFF = -1/eps
!  Else
!   MonopoleSFF = -1/(8.*m1)
!  End if
! 
! Else If (Abs(m2-m3).lt.eps) Then
!   If (Abs(m2).lt.eps) Then 
!     Write(ErrCan,*) "Numerical problem in MonopoleSFF"
!     Write(ErrCan,*) "Involved masses: ",m1,m2,m3
!    MonopoleSFF =1/eps
!   Else If (Abs(m1).lt.eps) Then 
!     Write(ErrCan,*) "Numerical problem in MonopoleSFF"
!     Write(ErrCan,*) "Involved masses: ",m1,m2,m3
!    MonopoleSFF =1/eps
!   Else 
!    MonopoleSFF = ((m1 - m3)*(16*m1**2 - 29*m1*m3 + 7*m3**2) + 6*m1**2*(3*m3*Log(m1/m3) + 2*m1*Log(m3/m1)))/(36.*(m1 - m3)**4)
!   End if
! 
! Else If (Abs(m1-m3).lt.eps) Then
!     Write(ErrCan,*) "Numerical problem in MonopoleSFF"
!     Write(ErrCan,*) "Involved masses: ",m1,m2,m3
!     MonopoleSFF = 1/eps
! 
! Else If (Abs(m2-m3).lt.eps) Then
!     Write(ErrCan,*) "Numerical problem in MonopoleSFF"
!     Write(ErrCan,*) "Involved masses: ",m1,m2,m3
!     MonopoleSFF = 1/eps
! 
! Else 
!  If (Abs(m1).lt.eps) Then
!    MonopoleSFF = (-m2**2 + m3**2 + 2*m2*m3*Log(m2/m3))/(6.*(m2 - m3)**3)  
!  Else If (Abs(m2).lt.eps) Then
!    MonopoleSFF = (m1 - m3 + m1*Log(m3/m1))/(6.*(m1 - m3)**2)
!  Else If (Abs(m3).lt.eps) Then
!    MonopoleSFF = (m1 - m2 + m1*Log(m2/m1))/(6.*(m1 - m2)**2)
!  Else
!   MonopoleSFF = (-2*m2**4*(m1 - m3)**2 - 3*m1**3*Sqrt(m2**5*m3) + 3*m1**2*Sqrt(m2**7*m3) + 3*m1**3*Sqrt(m2*m3**5) - 3*m1**2*Sqrt(m2*m3**7) + &
!      &    3*m1**2*Sqrt(m2**7*m3)*Log(m1/m2) - 3*m2*(m2*m3)**2.5*Log(m2) - 3*m3*(m2*m3)**2.5*Log(m2) + 2*m1**2*m3**3*(-m1 + m3 + m1*Log(m1/m3)) + & 
!      &    2*m1*m2*m3**2*((m1 - m3)*(m1 + 2*m3) - 3*m1**2*Log(m1/m3)) + 6*m1**3*(m2*m3)**1.5*Log(m2/m3) + 6*m1*(m2*m3)**2.5*Log(m2/m3) +  &
!      &    3*m1*m2**1.5*m3**2.5*(-3*m1 + 3*m3 + 3*m1*Log(m1) + 2*(-2*m1 + m3)*Log(m2) + (m1 - 2*m3)*Log(m3)) +  &
!      &    3*m2**3.5*m3**1.5*(-3*m1 + 2*m3 + 2*m1*Log(m2) + (-2*m1 + m3)*Log(m3)) +  &
!      &    3*m2**2.5*m3**1.5*(3*m1**2 - 2*m3**2 - m1**2*Log(m1**3*m2) + (4*m1**2 + m3**2)*Log(m3)) + 3*m1**2*Sqrt(m2*m3**7)*Log(m3/m1) -  &
!      &    2*m2**3*(m1**2*(-m1 + m3) + m1**3*Log(m1/m2) + 3*m1*m3**2*Log(m2/m3) + 2*m3**3*Log(m3/m2)) +  &
!      &    2*m2**2*m3*(-m1**3 + m3**3 + 3*m1**3*Log(m1/m2) + 3*m1*m3*(2*m1*Log(m2/m3) + m3*Log(m3/m2))))/(6.*(m1 - m2)**2*(m1 - m3)**2*(m2 - m3)**3)
!   End if
! End If
! 
! End Function MonopoleSFF
! 
! 
! Real(dp) Function MonopoleVFF(m1, m2, m3)
! Implicit None
! Real(dp), Intent(in) :: m1, m2, m3
! Real(dp) :: eps=1E-10_dp
! 
! If ((Abs(m2-m3).lt.eps).and.(Abs(m1-m2).lt.eps)) Then
!  If (Abs(m1).lt.eps) Then
!     Write(ErrCan,*) "Numerical problem in MonopoleVFF"
!     Write(ErrCan,*) "Involved masses: ",m1,m2,m3
!     MonopoleVFF = 1/eps
!  Else 
!   MonopoleVFF = -7/(12.*m1)
!  End if
! 
! Else If (Abs(m2-m3).lt.eps) Then
!  If (Abs(m1).lt.eps) Then
!     Write(ErrCan,*) "Numerical problem in MonopoleVFF"
!     Write(ErrCan,*) "Involved masses: ",m1,m2,m3
!     MonopoleVFF = 1/eps
!  Else If (Abs(m2).lt.eps) Then
!     Write(ErrCan,*) "Numerical problem in MonopoleVFF"
!     Write(ErrCan,*) "Involved masses: ",m1,m2,m3
!     MonopoleVFF = 1/eps
!  Else
!   MonopoleVFF = (-((m1 - m3)*(2*m1**2 + 29*m1*m3 - 25*m3**2)) + &
!      & 6*m1*(2*m1**2 - 9*m1*m3 + 6*m3**2)*Log(m3/m1))/(18.*(m1 - m3)**4)
!   End if
! 
! Else If (Abs(m1-m3).lt.eps) Then
!     Write(ErrCan,*) "Numerical problem in MonopoleVFF"
!     Write(ErrCan,*) "Involved masses: ",m1,m2,m3
!     MonopoleVFF = 1/eps
! 
! Else If (Abs(m1-m2).lt.eps) Then
!     Write(ErrCan,*) "Numerical problem in MonopoleVFF"
!     Write(ErrCan,*) "Involved masses: ",m1,m2,m3
!     MonopoleVFF = 1/eps
! 
! Else 
!  If (Abs(m1).lt. eps) Then
!   MonopoleVFF =  (2*(-m2**2 + m3**2 + 3*Sqrt(m2**3*m3) - 3*Sqrt(m2*m3**3)) &
!      &  - 3*Sqrt(m2*m3)*(m2 + m3)*Log(m2/m3) +  &
!      &    (3*m2**2 - 10*m2*m3 + 3*m3**2)*Log(m3/m2))/(3.*(m2 - m3)**3)
!  Else If (Abs(m2).lt. eps) Then
!   MonopoleVFF = (-m1 + m3 + (-2*m1 + 3*m3)*Log(m1/m3))/(3.*(m1 - m3)**2)
!  Else If (Abs(m3).lt. eps) Then
!   MonopoleVFF = (-m1 + m2 + (-2*m1 + 3*m2)*Log(m1/m2))/(3.*(m1 - m2)**2)
!  Else 
!   MonopoleVFF = (-3*m1**3*Sqrt(m2**5*m3) + 3*m1**2*Sqrt(m2**7*m3) + 3*m1**3*Sqrt(m2*m3**5) - 3*m1**2*Sqrt(m2*m3**7) + 9*m1**2*(m2*m3)**1.5*(-m2 + m3)*Log(m1) + &
!      &    m1**2*(3*m2**4 + 6*m1*m2**2*m3 + 3*Sqrt(m2**7*m3) - 2*m2**3*(m1 + 3*m3))*Log(m1/m2) + m1**2*m3**3*(m1 - m3 + (2*m1 - 3*m3)*Log(m1/m3)) +  &
!      &    6*m1**3*(m2*m3)**1.5*Log(m2/m3) + 6*m1*(m2*m3)**2.5*Log(m2/m3) -  &
!      &    3*m2**2.5*m3**1.5*(-3*m1**2 + 2*m3**2 + m1**2*Log(m2/m3**4) + m3**2*Log(m2/m3)) - 3*m2**3.5*m3**1.5*(3*m1 - 2*m3 + (-2*m1 + m3)*Log(m2/m3)) +  &
!      &    3*m1*m2**1.5*m3**2.5*(-3*m1 + 3*m3 + 2*(-2*m1 + m3)*Log(m2) + (m1 - 2*m3)*Log(m3)) + 3*m1**2*Sqrt(m2*m3**7)*Log(m3/m1) +  &
!      &    m1*m2*m3**2*(-7*m1**2 + 8*m1*m3 - m3**2 - 6*m1**2*Log(m1/m3) - 6*m3*(m1 + m3)*Log(m3/m1)) +  &
!      &    m2**4*(m1**2 + m1*m3 - 2*m3**2 + 6*m1*m3*Log(m2/m1) + 3*m3**2*Log(m3/m2)) +   &
!      &    m2**2*m3*(7*m1**3 - 9*m1*m3**2 + 2*m3**3 + 9*m1*m3*(m1*Log(m2/m3) + 2*m3*Log(m3/m1)) + 3*m3**3*Log(m3/m2)) -   &
!      &    m2**3*(m1*(m1 - m3)*(m1 + 9*m3) + 2*m3**2*(9*m1*Log(m2/m1) + 5*m3*Log(m3/m2))))/(3.*(m1 - m2)**2*(m1 - m3)**2*(m2 - m3)**3)  
!  End If
! End if
! 
! End Function MonopoleVFF
! 
! Real(dp) Function MonopoleFVV(m1, m2, m3)
! Implicit None
! Real(dp), Intent(in) :: m1, m2, m3
! Real(dp) :: eps=1E-10_dp
! 
! If ((Abs(m2-m3).lt.eps).and.(Abs(m1-m2).lt.eps)) Then
!  If (Abs(m1).lt.eps) Then
!     Write(ErrCan,*) "Numerical problem in MonopoleFVV"
!     Write(ErrCan,*) "Involved masses: ",m1,m2,m3
!   MonopoleFVV = 1/eps
!  Else
!   MonopoleFVV = 1/(3.*m1)
!  End if
! 
! Else If (Abs(m2-m3).lt.eps) Then
!  If (Abs(m1).lt.eps) Then
!   MonopoleFVV = 5/(9.*m2)
!  Else If (Abs(m2).lt.eps) Then
!     Write(ErrCan,*) "Numerical problem in MonopoleFVV"
!     Write(ErrCan,*) "Involved masses: ",m1,m2,m3
!   MonopoleFVV = 1/eps
!  Else
!   MonopoleFVV = (-((m1 - m2)*(5*m1**2 - 22*m1*m2 + 5*m2**2)) + 6*m1**2*(m1 - 3*m2)*Log(m1/m2))/(9.*(m1 - m2)**4)
!  End if
! !! Assuming always identical vector bosons
! Else 
!  
!  If (Abs(m1).lt.eps) Then
!   MonopoleFVV = 5/(9.*m2)
!  Else If (Abs(m2).lt.eps) Then
!     Write(ErrCan,*) "Numerical problem in MonopoleFVV"
!     Write(ErrCan,*) "Involved masses: ",m1,m2,m3
!   MonopoleFVV = 1/eps
!  Else
!   MonopoleFVV = (-((m1 - m2)*(5*m1**2 - 22*m1*m2 + 5*m2**2)) + 6*m1**2*(m1 - 3*m2)*Log(m1/m2))/(9.*(m1 - m2)**4)
!  End if
! 
! End If
! 
! End Function MonopoleFVV
! 
! Real(dp) Function MonopoleFVS(m1, m2, m3)
! Implicit None
! Real(dp), Intent(in) :: m1, m2, m3
! Real(dp) :: eps=1E-10_dp
! 
! If ((Abs(m2-m3).lt.eps).and.(Abs(m1-m2).lt.eps)) Then
!  If (Abs(m1).lt.eps) Then 
!     Write(ErrCan,*) "Numerical problem in MonopoleFVS"
!     Write(ErrCan,*) "Involved masses: ",m1,m2,m3
!   MonopoleFVS = 1/eps
!  Else
!   MonopoleFVS = 1/(24.*m2**1.5)
!  End if
! 
! Else If (Abs(m2-m3).lt.eps) Then
!   If (Abs(m1).lt.eps) Then 
!    MonopoleFVS = 0
!  Else if (Abs(m2).lt.eps) Then 
!     Write(ErrCan,*) "Numerical problem in MonopoleFVS"
!     Write(ErrCan,*) "Involved masses: ",m1,m2,m3
!     MonopoleFVS = 1/eps
!  Else
!    MonopoleFVS =(Sqrt(m1)*(2*m1**3 + 3*m1**2*m3 - 6*m1*m3**2 + m3**3 + 6*m1**2*m3*Log(m3/m1)))/(12.*(m1 - m3)**4*m3)
!  End if
! 
! Else If (Abs(m1-m3).lt.eps) Then
!  If (Abs(m1).lt.eps) Then 
!     MonopoleFVS = 0
!  Else if (Abs(m2).lt.eps) Then 
!     MonopoleFVS = 1/(4.*m3**1.5)
!  Else
!     MonopoleFVS = (Sqrt(m3)*(-5*m2**2 + 4*m2*m3 + m3**2 + 2*m2*(m2 + 2*m3)*Log(m2/m3)))/(4.*(m2 - m3)**4)
!  End if
! 
! Else If (Abs(m1-m2).lt.eps) Then
!  If (Abs(m1).lt.eps) Then 
!     MonopoleFVS = 0
!   Else if (Abs(m3).lt.eps) Then 
!     MonopoleFVS = 1/(4.*m2**1.5)
!   Else
!     MonopoleFVS = (Sqrt(m2)*((m2 - m3)*(m2 + 5*m3) + 2*m3*(2*m2 + m3)*Log(m3/m2)))/(4.*(m2 - m3)**4)
!   End if
! 
! Else 
!   If (Abs(m1).lt.eps) Then 
!     MonopoleFVS = 0
!   Else if (Abs(m2).lt.eps) Then 
!     MonopoleFVS = (Sqrt(m1)*(m1 - m3 - m3*Log(m1) + m3*Log(m3)))/(2.*(m1 - m3)**2*m3)
!   Else if (Abs(m3).lt.eps) Then 
!     MonopoleFVS = (Sqrt(m1)*(m1 - m2 - m2*Log(m1) + m2*Log(m2)))/(2.*(m1 - m2)**2*m2)
!   Else
!   MonopoleFVS =  (Sqrt(m1)*((m1 - m2)*(m1 - m3)*(m2 - m3)*(-2*m2*m3 + m1*(m2 + m3)) - m1**2*(m2 - m3)**3*Log(m1) +  &
!      &      m2*(m1 - m3)**2*(-2*m1*m3 + m2*(m2 + m3))*Log(m2) + (m1 - m2)**2*m3*(2*m1*m2 - m3*(m2 + m3))*Log(m3)))/ &
!      &  (2.*(m1 - m2)**2*(m1 - m3)**2*(m2 - m3)**3)
!   End if
! End If
! 
! End Function MonopoleFVS
! 
! Real(dp) Function MonopoleFSV(m1, m2, m3)
! Implicit None
! Real(dp), Intent(in) :: m1, m2, m3
!  MonopoleFSV = MonopoleFVS(m1,m3,m2)
! End Function MonopoleFSV


! Complex(dp) Function D00check(a,b,c,d)
! Implicit None
! Real(dp), Intent(in) :: a,b,c,d
! D00check = KilianD00(a,b,c,d)
! If ((Real(D00check,dp).ne.Real(D00check,dp)).or. &
!   & (Abs(D00check).gt.1.0E+30_dp)) D00check = 0._dp
! End Function D00check
! 
! Complex(dp) Function C0check(a,b,c)
! Implicit None
! Real(dp), Intent(in) :: a,b,c
! C0check = C0_3m(a,b,c)
! If ((Real(C0check,dp).ne.Real(C0check,dp)).or. &
!   & (Abs(C0check).gt.1.0E+30_dp))  C0check = 0._dp
! End Function C0check
! 
! Complex(dp) Function D0check(a,b,c,d)
! Implicit None
! Real(dp), Intent(in) :: a,b,c,d
! D0check = KilianD0(a,b,c,d)
! If ((Real(D0check,dp).ne.Real(D0check,dp)).or.  & 
!  & (Abs(D0check).gt.1.0E+30_dp))  D0check = 0._dp
! End Function D0check
! 
! Complex(dp) Function C0D0check(a,b,c,d)
! Implicit None
! Real(dp), Intent(in) :: a,b,c,d
! C0D0check = KilianC0D0(a,b,c,d)
! If ((Real(C0D0check,dp).ne.Real(C0D0check,dp)).or. &
!   & (Abs(C0D0check).gt.1.0E+30_dp))  C0D0check = 0._dp
! End Function C0D0check
! 
! Complex(dp) Function B0C0check(a,b,c)
! Implicit None
! Real(dp), Intent(in) :: a,b,c
! B0C0check = KilianB0C0(a,b,c)
! If ((Real(B0C0check,dp).ne.Real(B0C0check,dp)).or. &
!  & (Abs(B0C0check).gt.1.0E+30_dp))  B0C0check = 0._dp
! End Function B0C0check



! Complex(dp) Function D00check(a,b,c,d)
! Implicit None
! Real(dp), Intent(in) :: a,b,c,d
! D00check = KilianD00(a,b,c,d)
! If ((Real(D00check,dp).ne.Real(D00check,dp)).or. &
!   & (Abs(D00check).gt.1.0E+30_dp)) Then 
! 
! Write(ErrCan,*) "Numerical problem in D00check"
! Write(ErrCan,*) "Involved masses: ",a,b,c,d
! 
!  If (ErrorLevel.gt.0) Then
!    Call TerminateProgram
!  Else 
!    D00check = 0._dp
!   End if
! End if
! End Function D00check
! 
! Complex(dp) Function C0check(a,b,c)
! Implicit None
! Real(dp), Intent(in) :: a,b,c
! C0check = C0_3m(a,b,c)
! If ((Real(C0check,dp).ne.Real(C0check,dp)).or. &
!   & (Abs(C0check).gt.1.0E+30_dp))  Then 
!     Write(ErrCan,*) "Numerical problem in C0check"
!     Write(ErrCan,*) "Involved masses: ",a,b,c
! 
!      If (ErrorLevel.gt.0) Then
!        Call TerminateProgram
!      Else 
!        C0check = 0._dp
!      End if 
! End if
! End Function C0check
! 
! Complex(dp) Function D0check(a,b,c,d)
! Implicit None
! Real(dp), Intent(in) :: a,b,c,d
! D0check = KilianD0(a,b,c,d)
! If ((Real(D0check,dp).ne.Real(D0check,dp)).or.  & 
!  & (Abs(D0check).gt.1.0E+30_dp))  Then 
!    Write(ErrCan,*) "Numerical problem in D0check"
!    Write(ErrCan,*) "Involved masses: ",a,b,c,d
! 
!     If (ErrorLevel.gt.0) Then
!        Call TerminateProgram
!     Else 
!        D0check = 0._dp
!     End if
! End if
! End Function D0check
! 
! Complex(dp) Function C0D0check(a,b,c,d)
! Implicit None
! Real(dp), Intent(in) :: a,b,c,d
! C0D0check = KilianC0D0(a,b,c,d)
! If ((Real(C0D0check,dp).ne.Real(C0D0check,dp)).or. &
!   & (Abs(C0D0check).gt.1.0E+30_dp))  Then 
!    Write(ErrCan,*) "Numerical problem in C0D0check"
!    Write(ErrCan,*) "Involved masses: ",a,b,c,d
! 
!    If (ErrorLevel.gt.0) Then
!      Call TerminateProgram
!    Else 
!      C0D0check = 0._dp
!    End if 
! End if
! End Function C0D0check
! 
! Complex(dp) Function B0C0check(a,b,c)
! Implicit None
! Real(dp), Intent(in) :: a,b,c
! B0C0check = KilianB0C0(a,b,c)
! If ((Real(B0C0check,dp).ne.Real(B0C0check,dp)).or. &
!  & (Abs(B0C0check).gt.1.0E+30_dp))  Then 
! 
!    Write(ErrCan,*) "Numerical problem in B0C0check"
!    Write(ErrCan,*) "Involved masses: ",a,b,c
! 
!    If (ErrorLevel.gt.0) Then
!      Call TerminateProgram
!    Else 
!      B0C0check = 0._dp
!    End if
! End if
! End Function B0C0check

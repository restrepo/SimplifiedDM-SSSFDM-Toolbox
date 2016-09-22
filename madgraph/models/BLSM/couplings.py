from object_library import all_couplings,Coupling 
from cmath import exp 
from function_library import complexconjugate,re,im,csc,sec,acsc,asec 
 
 
GC_1 = Coupling(name = 'GC_1',
	 value = '1*complex(0,1)*(ZA12**2*(2*vX*ZH12*complexconjugate(lam2) + v*ZH11*complexconjugate(lam3)) + ZA11**2*(2*v*ZH11*complexconjugate(lam1) + vX*ZH12*complexconjugate(lam3)))', 
	 order = {'QED':1} ) 
 
GC_2 = Coupling(name = 'GC_2',
	 value = '1*complex(0,1)*(ZA12**2*(2*vX*ZH22*complexconjugate(lam2) + v*ZH21*complexconjugate(lam3)) + ZA11**2*(2*v*ZH21*complexconjugate(lam1) + vX*ZH22*complexconjugate(lam3)))', 
	 order = {'QED':1} ) 
 
GC_3 = Coupling(name = 'GC_3',
	 value = '1*complex(0,1)*(ZA12*ZA22*(2*vX*ZH12*complexconjugate(lam2) + v*ZH11*complexconjugate(lam3)) + ZA11*ZA21*(2*v*ZH11*complexconjugate(lam1) + vX*ZH12*complexconjugate(lam3)))', 
	 order = {'QED':1} ) 
 
GC_4 = Coupling(name = 'GC_4',
	 value = '1*complex(0,1)*(ZA12*ZA22*(2*vX*ZH22*complexconjugate(lam2) + v*ZH21*complexconjugate(lam3)) + ZA11*ZA21*(2*v*ZH21*complexconjugate(lam1) + vX*ZH22*complexconjugate(lam3)))', 
	 order = {'QED':1} ) 
 
GC_5 = Coupling(name = 'GC_5',
	 value = '1*complex(0,1)*(ZA22**2*(2*vX*ZH12*complexconjugate(lam2) + v*ZH11*complexconjugate(lam3)) + ZA21**2*(2*v*ZH11*complexconjugate(lam1) + vX*ZH12*complexconjugate(lam3)))', 
	 order = {'QED':1} ) 
 
GC_6 = Coupling(name = 'GC_6',
	 value = '1*complex(0,1)*(ZA22**2*(2*vX*ZH22*complexconjugate(lam2) + v*ZH21*complexconjugate(lam3)) + ZA21**2*(2*v*ZH21*complexconjugate(lam1) + vX*ZH22*complexconjugate(lam3)))', 
	 order = {'QED':1} ) 
 
GC_7 = Coupling(name = 'GC_7',
	 value = '1*complex(0,1)*(ZH12*(ZH11*(vX*ZH11 + v*ZH12)*complexconjugate(lam3) + ZH12*(6*vX*ZH12*complexconjugate(lam2) + v*ZH11*complexconjugate(lam3))) + ZH11*(ZH12*(vX*ZH11 + v*ZH12)*complexconjugate(lam3) + ZH11*(6*v*ZH11*complexconjugate(lam1) + vX*ZH12*complexconjugate(lam3))))', 
	 order = {'QED':1} ) 
 
GC_8 = Coupling(name = 'GC_8',
	 value = '1*complex(0,1)*(ZH12*(ZH11*(vX*ZH21 + v*ZH22)*complexconjugate(lam3) + ZH12*(6*vX*ZH22*complexconjugate(lam2) + v*ZH21*complexconjugate(lam3))) + ZH11*(ZH12*(vX*ZH21 + v*ZH22)*complexconjugate(lam3) + ZH11*(6*v*ZH21*complexconjugate(lam1) + vX*ZH22*complexconjugate(lam3))))', 
	 order = {'QED':1} ) 
 
GC_9 = Coupling(name = 'GC_9',
	 value = '1*complex(0,1)*(ZH12*(ZH21*(vX*ZH21 + v*ZH22)*complexconjugate(lam3) + ZH22*(6*vX*ZH22*complexconjugate(lam2) + v*ZH21*complexconjugate(lam3))) + ZH11*(ZH22*(vX*ZH21 + v*ZH22)*complexconjugate(lam3) + ZH21*(6*v*ZH21*complexconjugate(lam1) + vX*ZH22*complexconjugate(lam3))))', 
	 order = {'QED':1} ) 
 
GC_10 = Coupling(name = 'GC_10',
	 value = '1*complex(0,1)*(ZH22*(ZH21*(vX*ZH21 + v*ZH22)*complexconjugate(lam3) + ZH22*(6*vX*ZH22*complexconjugate(lam2) + v*ZH21*complexconjugate(lam3))) + ZH21*(ZH22*(vX*ZH21 + v*ZH22)*complexconjugate(lam3) + ZH21*(6*v*ZH21*complexconjugate(lam1) + vX*ZH22*complexconjugate(lam3))))', 
	 order = {'QED':1} ) 
 
GC_11 = Coupling(name = 'GC_11',
	 value = '1*complex(0,1)*(2*v*ZH11*complexconjugate(lam1) + vX*ZH12*complexconjugate(lam3))', 
	 order = {'QED':1} ) 
 
GC_12 = Coupling(name = 'GC_12',
	 value = '1*complex(0,1)*(2*v*ZH21*complexconjugate(lam1) + vX*ZH22*complexconjugate(lam3))', 
	 order = {'QED':1} ) 
 
GC_13 = Coupling(name = 'GC_13',
	 value = '1./2.*complex(0,1)*(16*gYB**2*ZA12**2*cmath.cos(TW)**2 + ZA11**2*(g1*cmath.cos(TW) - g2*cmath.sin(TW))**2)', 
	 order = {'QED':2} ) 
 
GC_14 = Coupling(name = 'GC_14',
	 value = '1./2.*complex(0,1)*(16*gYB**2*ZA12*ZA22*cmath.cos(TW)**2 + ZA11*ZA21*(g1*cmath.cos(TW) - g2*cmath.sin(TW))**2)', 
	 order = {'QED':2} ) 
 
GC_15 = Coupling(name = 'GC_15',
	 value = '1./2.*complex(0,1)*(16*gYB**2*ZA22**2*cmath.cos(TW)**2 + ZA21**2*(g1*cmath.cos(TW) - g2*cmath.sin(TW))**2)', 
	 order = {'QED':2} ) 
 
GC_16 = Coupling(name = 'GC_16',
	 value = '-1./2.*complex(0,1)*(ZA11**2*(g1*cmath.cos(TW) - g2*cmath.sin(TW))*(g2*cmath.cos(TW)*cmath.cos(TWp) + g1*cmath.cos(TWp)*cmath.sin(TW) - gBY*cmath.sin(TWp)) + 8*gYB*ZA12**2*(gYB*cmath.cos(TWp)*cmath.sin(2*TW) - 2*gBL*cmath.cos(TW)*cmath.sin(TWp)))', 
	 order = {'QED':2} ) 
 
GC_17 = Coupling(name = 'GC_17',
	 value = '-1./2.*complex(0,1)*(ZA11*ZA21*(g1*cmath.cos(TW) - g2*cmath.sin(TW))*(g2*cmath.cos(TW)*cmath.cos(TWp) + g1*cmath.cos(TWp)*cmath.sin(TW) - gBY*cmath.sin(TWp)) + 8*gYB*ZA12*ZA22*(gYB*cmath.cos(TWp)*cmath.sin(2*TW) - 2*gBL*cmath.cos(TW)*cmath.sin(TWp)))', 
	 order = {'QED':2} ) 
 
GC_18 = Coupling(name = 'GC_18',
	 value = '-1./2.*complex(0,1)*(ZA21**2*(g1*cmath.cos(TW) - g2*cmath.sin(TW))*(g2*cmath.cos(TW)*cmath.cos(TWp) + g1*cmath.cos(TWp)*cmath.sin(TW) - gBY*cmath.sin(TWp)) + 8*gYB*ZA22**2*(gYB*cmath.cos(TWp)*cmath.sin(2*TW) - 2*gBL*cmath.cos(TW)*cmath.sin(TWp)))', 
	 order = {'QED':2} ) 
 
GC_19 = Coupling(name = 'GC_19',
	 value = '1./2.*complex(0,1)*(ZA11**2*(g1*cmath.cos(TW) - g2*cmath.sin(TW))*(gBY*cmath.cos(TWp) + (g2*cmath.cos(TW) + g1*cmath.sin(TW))*cmath.sin(TWp)) + 8*gYB*ZA12**2*(2*gBL*cmath.cos(TW)*cmath.cos(TWp) + gYB*cmath.sin(2*TW)*cmath.sin(TWp)))', 
	 order = {'QED':2} ) 
 
GC_20 = Coupling(name = 'GC_20',
	 value = '1./2.*complex(0,1)*(ZA11*ZA21*(g1*cmath.cos(TW) - g2*cmath.sin(TW))*(gBY*cmath.cos(TWp) + (g2*cmath.cos(TW) + g1*cmath.sin(TW))*cmath.sin(TWp)) + 8*gYB*ZA12*ZA22*(2*gBL*cmath.cos(TW)*cmath.cos(TWp) + gYB*cmath.sin(2*TW)*cmath.sin(TWp)))', 
	 order = {'QED':2} ) 
 
GC_21 = Coupling(name = 'GC_21',
	 value = '1./2.*complex(0,1)*(ZA21**2*(g1*cmath.cos(TW) - g2*cmath.sin(TW))*(gBY*cmath.cos(TWp) + (g2*cmath.cos(TW) + g1*cmath.sin(TW))*cmath.sin(TWp)) + 8*gYB*ZA22**2*(2*gBL*cmath.cos(TW)*cmath.cos(TWp) + gYB*cmath.sin(2*TW)*cmath.sin(TWp)))', 
	 order = {'QED':2} ) 
 
GC_22 = Coupling(name = 'GC_22',
	 value = '1./2.*complex(0,1)*g2**2*ZA11**2', 
	 order = {'QED':2} ) 
 
GC_23 = Coupling(name = 'GC_23',
	 value = '1./2.*complex(0,1)*g2**2*ZA11*ZA21', 
	 order = {'QED':2} ) 
 
GC_24 = Coupling(name = 'GC_24',
	 value = '1./2.*complex(0,1)*g2**2*ZA21**2', 
	 order = {'QED':2} ) 
 
GC_25 = Coupling(name = 'GC_25',
	 value = '1./2.*complex(0,1)*(16*ZA12**2*(gYB*cmath.cos(TWp)*cmath.sin(TW) - gBL*cmath.sin(TWp))**2 + ZA11**2*(g2*cmath.cos(TW)*cmath.cos(TWp) + g1*cmath.cos(TWp)*cmath.sin(TW) - gBY*cmath.sin(TWp))**2)', 
	 order = {'QED':2} ) 
 
GC_26 = Coupling(name = 'GC_26',
	 value = '1./2.*complex(0,1)*(16*ZA12*ZA22*(gYB*cmath.cos(TWp)*cmath.sin(TW) - gBL*cmath.sin(TWp))**2 + ZA11*ZA21*(g2*cmath.cos(TW)*cmath.cos(TWp) + g1*cmath.cos(TWp)*cmath.sin(TW) - gBY*cmath.sin(TWp))**2)', 
	 order = {'QED':2} ) 
 
GC_27 = Coupling(name = 'GC_27',
	 value = '1./2.*complex(0,1)*(16*ZA22**2*(gYB*cmath.cos(TWp)*cmath.sin(TW) - gBL*cmath.sin(TWp))**2 + ZA21**2*(g2*cmath.cos(TW)*cmath.cos(TWp) + g1*cmath.cos(TWp)*cmath.sin(TW) - gBY*cmath.sin(TWp))**2)', 
	 order = {'QED':2} ) 
 
GC_28 = Coupling(name = 'GC_28',
	 value = '-1./2.*complex(0,1)*(8*ZA12**2*(2*gBL*gYB*cmath.cos(TWp)**2*cmath.sin(TW) - 2*gBL*gYB*cmath.sin(TW)*cmath.sin(TWp)**2 - gBL**2*cmath.sin(2*TWp) + gYB**2*cmath.sin(TW)**2*cmath.sin(2*TWp)) + ZA11**2*(g1*gBY*cmath.cos(TWp)**2*cmath.sin(TW) + g2**2*cmath.cos(TW)**2*cmath.cos(TWp)*cmath.sin(TWp) + cmath.cos(TWp)*(-gBY**2 + g1**2*cmath.sin(TW)**2)*cmath.sin(TWp) - g1*gBY*cmath.sin(TW)*cmath.sin(TWp)**2 + g2*cmath.cos(TW)*(gBY*cmath.cos(TWp)**2 - gBY*cmath.sin(TWp)**2 + g1*cmath.sin(TW)*cmath.sin(2*TWp))))', 
	 order = {'QED':2} ) 
 
GC_29 = Coupling(name = 'GC_29',
	 value = '-1./2.*complex(0,1)*(8*ZA12*ZA22*(2*gBL*gYB*cmath.cos(TWp)**2*cmath.sin(TW) - 2*gBL*gYB*cmath.sin(TW)*cmath.sin(TWp)**2 - gBL**2*cmath.sin(2*TWp) + gYB**2*cmath.sin(TW)**2*cmath.sin(2*TWp)) + ZA11*ZA21*(g1*gBY*cmath.cos(TWp)**2*cmath.sin(TW) + g2**2*cmath.cos(TW)**2*cmath.cos(TWp)*cmath.sin(TWp) + cmath.cos(TWp)*(-gBY**2 + g1**2*cmath.sin(TW)**2)*cmath.sin(TWp) - g1*gBY*cmath.sin(TW)*cmath.sin(TWp)**2 + g2*cmath.cos(TW)*(gBY*cmath.cos(TWp)**2 - gBY*cmath.sin(TWp)**2 + g1*cmath.sin(TW)*cmath.sin(2*TWp))))', 
	 order = {'QED':2} ) 
 
GC_30 = Coupling(name = 'GC_30',
	 value = '-1./2.*complex(0,1)*(8*ZA22**2*(2*gBL*gYB*cmath.cos(TWp)**2*cmath.sin(TW) - 2*gBL*gYB*cmath.sin(TW)*cmath.sin(TWp)**2 - gBL**2*cmath.sin(2*TWp) + gYB**2*cmath.sin(TW)**2*cmath.sin(2*TWp)) + ZA21**2*(g1*gBY*cmath.cos(TWp)**2*cmath.sin(TW) + g2**2*cmath.cos(TW)**2*cmath.cos(TWp)*cmath.sin(TWp) + cmath.cos(TWp)*(-gBY**2 + g1**2*cmath.sin(TW)**2)*cmath.sin(TWp) - g1*gBY*cmath.sin(TW)*cmath.sin(TWp)**2 + g2*cmath.cos(TW)*(gBY*cmath.cos(TWp)**2 - gBY*cmath.sin(TWp)**2 + g1*cmath.sin(TW)*cmath.sin(2*TWp))))', 
	 order = {'QED':2} ) 
 
GC_31 = Coupling(name = 'GC_31',
	 value = '1./2.*complex(0,1)*(16*ZA12**2*(gBL*cmath.cos(TWp) + gYB*cmath.sin(TW)*cmath.sin(TWp))**2 + ZA11**2*(gBY*cmath.cos(TWp) + (g2*cmath.cos(TW) + g1*cmath.sin(TW))*cmath.sin(TWp))**2)', 
	 order = {'QED':2} ) 
 
GC_32 = Coupling(name = 'GC_32',
	 value = '1./2.*complex(0,1)*(16*ZA12*ZA22*(gBL*cmath.cos(TWp) + gYB*cmath.sin(TW)*cmath.sin(TWp))**2 + ZA11*ZA21*(gBY*cmath.cos(TWp) + (g2*cmath.cos(TW) + g1*cmath.sin(TW))*cmath.sin(TWp))**2)', 
	 order = {'QED':2} ) 
 
GC_33 = Coupling(name = 'GC_33',
	 value = '1./2.*complex(0,1)*(16*ZA22**2*(gBL*cmath.cos(TWp) + gYB*cmath.sin(TW)*cmath.sin(TWp))**2 + ZA21**2*(gBY*cmath.cos(TWp) + (g2*cmath.cos(TW) + g1*cmath.sin(TW))*cmath.sin(TWp))**2)', 
	 order = {'QED':2} ) 
 
GC_34 = Coupling(name = 'GC_34',
	 value = '-(g1*g2*ZA11*cmath.cos(TW))/2.', 
	 order = {'QED':2} ) 
 
GC_35 = Coupling(name = 'GC_35',
	 value = '-(g1*g2*ZA21*cmath.cos(TW))/2.', 
	 order = {'QED':2} ) 
 
GC_36 = Coupling(name = 'GC_36',
	 value = '(g2*ZA11*(g1*cmath.cos(TWp)*cmath.sin(TW) - gBY*cmath.sin(TWp)))/2.', 
	 order = {'QED':2} ) 
 
GC_37 = Coupling(name = 'GC_37',
	 value = '(g2*ZA21*(g1*cmath.cos(TWp)*cmath.sin(TW) - gBY*cmath.sin(TWp)))/2.', 
	 order = {'QED':2} ) 
 
GC_38 = Coupling(name = 'GC_38',
	 value = '-(g2*ZA11*(gBY*cmath.cos(TWp) + g1*cmath.sin(TW)*cmath.sin(TWp)))/2.', 
	 order = {'QED':2} ) 
 
GC_39 = Coupling(name = 'GC_39',
	 value = '-(g2*ZA21*(gBY*cmath.cos(TWp) + g1*cmath.sin(TW)*cmath.sin(TWp)))/2.', 
	 order = {'QED':2} ) 
 
GC_40 = Coupling(name = 'GC_40',
	 value = '(g1*g2*ZA11*cmath.cos(TW))/2.', 
	 order = {'QED':2} ) 
 
GC_41 = Coupling(name = 'GC_41',
	 value = '(g1*g2*ZA21*cmath.cos(TW))/2.', 
	 order = {'QED':2} ) 
 
GC_42 = Coupling(name = 'GC_42',
	 value = '(g2*ZA11*(-(g1*cmath.cos(TWp)*cmath.sin(TW)) + gBY*cmath.sin(TWp)))/2.', 
	 order = {'QED':2} ) 
 
GC_43 = Coupling(name = 'GC_43',
	 value = '(g2*ZA21*(-(g1*cmath.cos(TWp)*cmath.sin(TW)) + gBY*cmath.sin(TWp)))/2.', 
	 order = {'QED':2} ) 
 
GC_44 = Coupling(name = 'GC_44',
	 value = '(g2*ZA11*(gBY*cmath.cos(TWp) + g1*cmath.sin(TW)*cmath.sin(TWp)))/2.', 
	 order = {'QED':2} ) 
 
GC_45 = Coupling(name = 'GC_45',
	 value = '(g2*ZA21*(gBY*cmath.cos(TWp) + g1*cmath.sin(TW)*cmath.sin(TWp)))/2.', 
	 order = {'QED':2} ) 
 
GC_46 = Coupling(name = 'GC_46',
	 value = '1./2.*complex(0,1)*(16*gYB**2*ZH12**2*cmath.cos(TW)**2 + ZH11**2*(g1*cmath.cos(TW) - g2*cmath.sin(TW))**2)', 
	 order = {'QED':2} ) 
 
GC_47 = Coupling(name = 'GC_47',
	 value = '1./2.*complex(0,1)*(16*gYB**2*ZH12*ZH22*cmath.cos(TW)**2 + ZH11*ZH21*(g1*cmath.cos(TW) - g2*cmath.sin(TW))**2)', 
	 order = {'QED':2} ) 
 
GC_48 = Coupling(name = 'GC_48',
	 value = '1./2.*complex(0,1)*(16*gYB**2*ZH22**2*cmath.cos(TW)**2 + ZH21**2*(g1*cmath.cos(TW) - g2*cmath.sin(TW))**2)', 
	 order = {'QED':2} ) 
 
GC_49 = Coupling(name = 'GC_49',
	 value = '-1./2.*complex(0,1)*(ZH11**2*(g1*cmath.cos(TW) - g2*cmath.sin(TW))*(g2*cmath.cos(TW)*cmath.cos(TWp) + g1*cmath.cos(TWp)*cmath.sin(TW) - gBY*cmath.sin(TWp)) + 8*gYB*ZH12**2*(gYB*cmath.cos(TWp)*cmath.sin(2*TW) - 2*gBL*cmath.cos(TW)*cmath.sin(TWp)))', 
	 order = {'QED':2} ) 
 
GC_50 = Coupling(name = 'GC_50',
	 value = '-1./2.*complex(0,1)*(ZH11*ZH21*(g1*cmath.cos(TW) - g2*cmath.sin(TW))*(g2*cmath.cos(TW)*cmath.cos(TWp) + g1*cmath.cos(TWp)*cmath.sin(TW) - gBY*cmath.sin(TWp)) + 8*gYB*ZH12*ZH22*(gYB*cmath.cos(TWp)*cmath.sin(2*TW) - 2*gBL*cmath.cos(TW)*cmath.sin(TWp)))', 
	 order = {'QED':2} ) 
 
GC_51 = Coupling(name = 'GC_51',
	 value = '-1./2.*complex(0,1)*(ZH21**2*(g1*cmath.cos(TW) - g2*cmath.sin(TW))*(g2*cmath.cos(TW)*cmath.cos(TWp) + g1*cmath.cos(TWp)*cmath.sin(TW) - gBY*cmath.sin(TWp)) + 8*gYB*ZH22**2*(gYB*cmath.cos(TWp)*cmath.sin(2*TW) - 2*gBL*cmath.cos(TW)*cmath.sin(TWp)))', 
	 order = {'QED':2} ) 
 
GC_52 = Coupling(name = 'GC_52',
	 value = '1./2.*complex(0,1)*(ZH11**2*(g1*cmath.cos(TW) - g2*cmath.sin(TW))*(gBY*cmath.cos(TWp) + (g2*cmath.cos(TW) + g1*cmath.sin(TW))*cmath.sin(TWp)) + 8*gYB*ZH12**2*(2*gBL*cmath.cos(TW)*cmath.cos(TWp) + gYB*cmath.sin(2*TW)*cmath.sin(TWp)))', 
	 order = {'QED':2} ) 
 
GC_53 = Coupling(name = 'GC_53',
	 value = '1./2.*complex(0,1)*(ZH11*ZH21*(g1*cmath.cos(TW) - g2*cmath.sin(TW))*(gBY*cmath.cos(TWp) + (g2*cmath.cos(TW) + g1*cmath.sin(TW))*cmath.sin(TWp)) + 8*gYB*ZH12*ZH22*(2*gBL*cmath.cos(TW)*cmath.cos(TWp) + gYB*cmath.sin(2*TW)*cmath.sin(TWp)))', 
	 order = {'QED':2} ) 
 
GC_54 = Coupling(name = 'GC_54',
	 value = '1./2.*complex(0,1)*(ZH21**2*(g1*cmath.cos(TW) - g2*cmath.sin(TW))*(gBY*cmath.cos(TWp) + (g2*cmath.cos(TW) + g1*cmath.sin(TW))*cmath.sin(TWp)) + 8*gYB*ZH22**2*(2*gBL*cmath.cos(TW)*cmath.cos(TWp) + gYB*cmath.sin(2*TW)*cmath.sin(TWp)))', 
	 order = {'QED':2} ) 
 
GC_55 = Coupling(name = 'GC_55',
	 value = '1./2.*complex(0,1)*g2**2*ZH11**2', 
	 order = {'QED':2} ) 
 
GC_56 = Coupling(name = 'GC_56',
	 value = '1./2.*complex(0,1)*g2**2*ZH11*ZH21', 
	 order = {'QED':2} ) 
 
GC_57 = Coupling(name = 'GC_57',
	 value = '1./2.*complex(0,1)*g2**2*ZH21**2', 
	 order = {'QED':2} ) 
 
GC_58 = Coupling(name = 'GC_58',
	 value = '1./2.*complex(0,1)*(16*ZH12**2*(gYB*cmath.cos(TWp)*cmath.sin(TW) - gBL*cmath.sin(TWp))**2 + ZH11**2*(g2*cmath.cos(TW)*cmath.cos(TWp) + g1*cmath.cos(TWp)*cmath.sin(TW) - gBY*cmath.sin(TWp))**2)', 
	 order = {'QED':2} ) 
 
GC_59 = Coupling(name = 'GC_59',
	 value = '1./2.*complex(0,1)*(16*ZH12*ZH22*(gYB*cmath.cos(TWp)*cmath.sin(TW) - gBL*cmath.sin(TWp))**2 + ZH11*ZH21*(g2*cmath.cos(TW)*cmath.cos(TWp) + g1*cmath.cos(TWp)*cmath.sin(TW) - gBY*cmath.sin(TWp))**2)', 
	 order = {'QED':2} ) 
 
GC_60 = Coupling(name = 'GC_60',
	 value = '1./2.*complex(0,1)*(16*ZH22**2*(gYB*cmath.cos(TWp)*cmath.sin(TW) - gBL*cmath.sin(TWp))**2 + ZH21**2*(g2*cmath.cos(TW)*cmath.cos(TWp) + g1*cmath.cos(TWp)*cmath.sin(TW) - gBY*cmath.sin(TWp))**2)', 
	 order = {'QED':2} ) 
 
GC_61 = Coupling(name = 'GC_61',
	 value = '-1./2.*complex(0,1)*(8*ZH12**2*(2*gBL*gYB*cmath.cos(TWp)**2*cmath.sin(TW) - 2*gBL*gYB*cmath.sin(TW)*cmath.sin(TWp)**2 - gBL**2*cmath.sin(2*TWp) + gYB**2*cmath.sin(TW)**2*cmath.sin(2*TWp)) + ZH11**2*(g1*gBY*cmath.cos(TWp)**2*cmath.sin(TW) + g2**2*cmath.cos(TW)**2*cmath.cos(TWp)*cmath.sin(TWp) + cmath.cos(TWp)*(-gBY**2 + g1**2*cmath.sin(TW)**2)*cmath.sin(TWp) - g1*gBY*cmath.sin(TW)*cmath.sin(TWp)**2 + g2*cmath.cos(TW)*(gBY*cmath.cos(TWp)**2 - gBY*cmath.sin(TWp)**2 + g1*cmath.sin(TW)*cmath.sin(2*TWp))))', 
	 order = {'QED':2} ) 
 
GC_62 = Coupling(name = 'GC_62',
	 value = '-1./2.*complex(0,1)*(8*ZH12*ZH22*(2*gBL*gYB*cmath.cos(TWp)**2*cmath.sin(TW) - 2*gBL*gYB*cmath.sin(TW)*cmath.sin(TWp)**2 - gBL**2*cmath.sin(2*TWp) + gYB**2*cmath.sin(TW)**2*cmath.sin(2*TWp)) + ZH11*ZH21*(g1*gBY*cmath.cos(TWp)**2*cmath.sin(TW) + g2**2*cmath.cos(TW)**2*cmath.cos(TWp)*cmath.sin(TWp) + cmath.cos(TWp)*(-gBY**2 + g1**2*cmath.sin(TW)**2)*cmath.sin(TWp) - g1*gBY*cmath.sin(TW)*cmath.sin(TWp)**2 + g2*cmath.cos(TW)*(gBY*cmath.cos(TWp)**2 - gBY*cmath.sin(TWp)**2 + g1*cmath.sin(TW)*cmath.sin(2*TWp))))', 
	 order = {'QED':2} ) 
 
GC_63 = Coupling(name = 'GC_63',
	 value = '-1./2.*complex(0,1)*(8*ZH22**2*(2*gBL*gYB*cmath.cos(TWp)**2*cmath.sin(TW) - 2*gBL*gYB*cmath.sin(TW)*cmath.sin(TWp)**2 - gBL**2*cmath.sin(2*TWp) + gYB**2*cmath.sin(TW)**2*cmath.sin(2*TWp)) + ZH21**2*(g1*gBY*cmath.cos(TWp)**2*cmath.sin(TW) + g2**2*cmath.cos(TW)**2*cmath.cos(TWp)*cmath.sin(TWp) + cmath.cos(TWp)*(-gBY**2 + g1**2*cmath.sin(TW)**2)*cmath.sin(TWp) - g1*gBY*cmath.sin(TW)*cmath.sin(TWp)**2 + g2*cmath.cos(TW)*(gBY*cmath.cos(TWp)**2 - gBY*cmath.sin(TWp)**2 + g1*cmath.sin(TW)*cmath.sin(2*TWp))))', 
	 order = {'QED':2} ) 
 
GC_64 = Coupling(name = 'GC_64',
	 value = '1./2.*complex(0,1)*(16*ZH12**2*(gBL*cmath.cos(TWp) + gYB*cmath.sin(TW)*cmath.sin(TWp))**2 + ZH11**2*(gBY*cmath.cos(TWp) + (g2*cmath.cos(TW) + g1*cmath.sin(TW))*cmath.sin(TWp))**2)', 
	 order = {'QED':2} ) 
 
GC_65 = Coupling(name = 'GC_65',
	 value = '1./2.*complex(0,1)*(16*ZH12*ZH22*(gBL*cmath.cos(TWp) + gYB*cmath.sin(TW)*cmath.sin(TWp))**2 + ZH11*ZH21*(gBY*cmath.cos(TWp) + (g2*cmath.cos(TW) + g1*cmath.sin(TW))*cmath.sin(TWp))**2)', 
	 order = {'QED':2} ) 
 
GC_66 = Coupling(name = 'GC_66',
	 value = '1./2.*complex(0,1)*(16*ZH22**2*(gBL*cmath.cos(TWp) + gYB*cmath.sin(TW)*cmath.sin(TWp))**2 + ZH21**2*(gBY*cmath.cos(TWp) + (g2*cmath.cos(TW) + g1*cmath.sin(TW))*cmath.sin(TWp))**2)', 
	 order = {'QED':2} ) 
 
GC_67 = Coupling(name = 'GC_67',
	 value = '-1./2.*complex(0,1)*g1*g2*ZH11*cmath.cos(TW)', 
	 order = {'QED':2} ) 
 
GC_68 = Coupling(name = 'GC_68',
	 value = '-1./2.*complex(0,1)*g1*g2*ZH21*cmath.cos(TW)', 
	 order = {'QED':2} ) 
 
GC_69 = Coupling(name = 'GC_69',
	 value = '1./2.*complex(0,1)*g2*ZH11*(g1*cmath.cos(TWp)*cmath.sin(TW) - gBY*cmath.sin(TWp))', 
	 order = {'QED':2} ) 
 
GC_70 = Coupling(name = 'GC_70',
	 value = '1./2.*complex(0,1)*g2*ZH21*(g1*cmath.cos(TWp)*cmath.sin(TW) - gBY*cmath.sin(TWp))', 
	 order = {'QED':2} ) 
 
GC_71 = Coupling(name = 'GC_71',
	 value = '-1./2.*complex(0,1)*g2*ZH11*(gBY*cmath.cos(TWp) + g1*cmath.sin(TW)*cmath.sin(TWp))', 
	 order = {'QED':2} ) 
 
GC_72 = Coupling(name = 'GC_72',
	 value = '-1./2.*complex(0,1)*g2*ZH21*(gBY*cmath.cos(TWp) + g1*cmath.sin(TW)*cmath.sin(TWp))', 
	 order = {'QED':2} ) 
 
GC_73 = Coupling(name = 'GC_73',
	 value = '-1./2.*complex(0,1)*g1*g2*ZH11*cmath.cos(TW)', 
	 order = {'QED':2} ) 
 
GC_74 = Coupling(name = 'GC_74',
	 value = '-1./2.*complex(0,1)*g1*g2*ZH21*cmath.cos(TW)', 
	 order = {'QED':2} ) 
 
GC_75 = Coupling(name = 'GC_75',
	 value = '1./2.*complex(0,1)*g2*ZH11*(g1*cmath.cos(TWp)*cmath.sin(TW) - gBY*cmath.sin(TWp))', 
	 order = {'QED':2} ) 
 
GC_76 = Coupling(name = 'GC_76',
	 value = '1./2.*complex(0,1)*g2*ZH21*(g1*cmath.cos(TWp)*cmath.sin(TW) - gBY*cmath.sin(TWp))', 
	 order = {'QED':2} ) 
 
GC_77 = Coupling(name = 'GC_77',
	 value = '-1./2.*complex(0,1)*g2*ZH11*(gBY*cmath.cos(TWp) + g1*cmath.sin(TW)*cmath.sin(TWp))', 
	 order = {'QED':2} ) 
 
GC_78 = Coupling(name = 'GC_78',
	 value = '-1./2.*complex(0,1)*g2*ZH21*(gBY*cmath.cos(TWp) + g1*cmath.sin(TW)*cmath.sin(TWp))', 
	 order = {'QED':2} ) 
 
GC_79 = Coupling(name = 'GC_79',
	 value = '1./2.*complex(0,1)*(g1*cmath.cos(TW) + g2*cmath.sin(TW))**2', 
	 order = {'QED':2} ) 
 
GC_80 = Coupling(name = 'GC_80',
	 value = '1./2.*complex(0,1)*(g1*cmath.cos(TW) + g2*cmath.sin(TW))*(g2*cmath.cos(TW)*cmath.cos(TWp) - g1*cmath.cos(TWp)*cmath.sin(TW) + gBY*cmath.sin(TWp))', 
	 order = {'QED':2} ) 
 
GC_81 = Coupling(name = 'GC_81',
	 value = '1./2.*complex(0,1)*(g1*cmath.cos(TW) + g2*cmath.sin(TW))*(gBY*cmath.cos(TWp) + (-(g2*cmath.cos(TW)) + g1*cmath.sin(TW))*cmath.sin(TWp))', 
	 order = {'QED':2} ) 
 
GC_82 = Coupling(name = 'GC_82',
	 value = '1./2.*complex(0,1)*g2**2', 
	 order = {'QED':2} ) 
 
GC_83 = Coupling(name = 'GC_83',
	 value = '1./2.*complex(0,1)*(g2*cmath.cos(TW)*cmath.cos(TWp) - g1*cmath.cos(TWp)*cmath.sin(TW) + gBY*cmath.sin(TWp))**2', 
	 order = {'QED':2} ) 
 
GC_84 = Coupling(name = 'GC_84',
	 value = '1./2.*complex(0,1)*(-(g1*gBY*cmath.cos(TWp)**2*cmath.sin(TW)) - g2**2*cmath.cos(TW)**2*cmath.cos(TWp)*cmath.sin(TWp) + cmath.cos(TWp)*(gBY**2 - g1**2*cmath.sin(TW)**2)*cmath.sin(TWp) + g1*gBY*cmath.sin(TW)*cmath.sin(TWp)**2 + g2*cmath.cos(TW)*(gBY*cmath.cos(TWp)**2 - gBY*cmath.sin(TWp)**2 + g1*cmath.sin(TW)*cmath.sin(2*TWp)))', 
	 order = {'QED':2} ) 
 
GC_85 = Coupling(name = 'GC_85',
	 value = '1./2.*complex(0,1)*(gBY*cmath.cos(TWp) + (-(g2*cmath.cos(TW)) + g1*cmath.sin(TW))*cmath.sin(TWp))**2', 
	 order = {'QED':2} ) 
 
GC_86 = Coupling(name = 'GC_86',
	 value = '(4*gYB*ZA12*ZH12*cmath.cos(TW) + ZA11*ZH11*(g1*cmath.cos(TW) - g2*cmath.sin(TW)))/2.', 
	 order = {'QED':1} ) 
 
GC_87 = Coupling(name = 'GC_87',
	 value = '(4*gYB*ZA12*ZH22*cmath.cos(TW) + ZA11*ZH21*(g1*cmath.cos(TW) - g2*cmath.sin(TW)))/2.', 
	 order = {'QED':1} ) 
 
GC_88 = Coupling(name = 'GC_88',
	 value = '(4*gYB*ZA22*ZH12*cmath.cos(TW) + ZA21*ZH11*(g1*cmath.cos(TW) - g2*cmath.sin(TW)))/2.', 
	 order = {'QED':1} ) 
 
GC_89 = Coupling(name = 'GC_89',
	 value = '(4*gYB*ZA22*ZH22*cmath.cos(TW) + ZA21*ZH21*(g1*cmath.cos(TW) - g2*cmath.sin(TW)))/2.', 
	 order = {'QED':1} ) 
 
GC_90 = Coupling(name = 'GC_90',
	 value = '(-4*ZA12*ZH12*(gYB*cmath.cos(TWp)*cmath.sin(TW) - gBL*cmath.sin(TWp)) - ZA11*ZH11*(g2*cmath.cos(TW)*cmath.cos(TWp) + g1*cmath.cos(TWp)*cmath.sin(TW) - gBY*cmath.sin(TWp)))/2.', 
	 order = {'QED':1} ) 
 
GC_91 = Coupling(name = 'GC_91',
	 value = '(-4*ZA12*ZH22*(gYB*cmath.cos(TWp)*cmath.sin(TW) - gBL*cmath.sin(TWp)) - ZA11*ZH21*(g2*cmath.cos(TW)*cmath.cos(TWp) + g1*cmath.cos(TWp)*cmath.sin(TW) - gBY*cmath.sin(TWp)))/2.', 
	 order = {'QED':1} ) 
 
GC_92 = Coupling(name = 'GC_92',
	 value = '(-4*ZA22*ZH12*(gYB*cmath.cos(TWp)*cmath.sin(TW) - gBL*cmath.sin(TWp)) - ZA21*ZH11*(g2*cmath.cos(TW)*cmath.cos(TWp) + g1*cmath.cos(TWp)*cmath.sin(TW) - gBY*cmath.sin(TWp)))/2.', 
	 order = {'QED':1} ) 
 
GC_93 = Coupling(name = 'GC_93',
	 value = '(-4*ZA22*ZH22*(gYB*cmath.cos(TWp)*cmath.sin(TW) - gBL*cmath.sin(TWp)) - ZA21*ZH21*(g2*cmath.cos(TW)*cmath.cos(TWp) + g1*cmath.cos(TWp)*cmath.sin(TW) - gBY*cmath.sin(TWp)))/2.', 
	 order = {'QED':1} ) 
 
GC_94 = Coupling(name = 'GC_94',
	 value = '(4*ZA12*ZH12*(gBL*cmath.cos(TWp) + gYB*cmath.sin(TW)*cmath.sin(TWp)) + ZA11*ZH11*(gBY*cmath.cos(TWp) + (g2*cmath.cos(TW) + g1*cmath.sin(TW))*cmath.sin(TWp)))/2.', 
	 order = {'QED':1} ) 
 
GC_95 = Coupling(name = 'GC_95',
	 value = '(4*ZA12*ZH22*(gBL*cmath.cos(TWp) + gYB*cmath.sin(TW)*cmath.sin(TWp)) + ZA11*ZH21*(gBY*cmath.cos(TWp) + (g2*cmath.cos(TW) + g1*cmath.sin(TW))*cmath.sin(TWp)))/2.', 
	 order = {'QED':1} ) 
 
GC_96 = Coupling(name = 'GC_96',
	 value = '(4*ZA22*ZH12*(gBL*cmath.cos(TWp) + gYB*cmath.sin(TW)*cmath.sin(TWp)) + ZA21*ZH11*(gBY*cmath.cos(TWp) + (g2*cmath.cos(TW) + g1*cmath.sin(TW))*cmath.sin(TWp)))/2.', 
	 order = {'QED':1} ) 
 
GC_97 = Coupling(name = 'GC_97',
	 value = '(4*ZA22*ZH22*(gBL*cmath.cos(TWp) + gYB*cmath.sin(TW)*cmath.sin(TWp)) + ZA21*ZH21*(gBY*cmath.cos(TWp) + (g2*cmath.cos(TW) + g1*cmath.sin(TW))*cmath.sin(TWp)))/2.', 
	 order = {'QED':1} ) 
 
GC_98 = Coupling(name = 'GC_98',
	 value = '-(g2*ZA11)/2.', 
	 order = {'QED':1} ) 
 
GC_99 = Coupling(name = 'GC_99',
	 value = '-(g2*ZA21)/2.', 
	 order = {'QED':1} ) 
 
GC_100 = Coupling(name = 'GC_100',
	 value = '-(g2*ZA11)/2.', 
	 order = {'QED':1} ) 
 
GC_101 = Coupling(name = 'GC_101',
	 value = '-(g2*ZA21)/2.', 
	 order = {'QED':1} ) 
 
GC_102 = Coupling(name = 'GC_102',
	 value = '-1./2.*complex(0,1)*g2*ZH11', 
	 order = {'QED':1} ) 
 
GC_103 = Coupling(name = 'GC_103',
	 value = '-1./2.*complex(0,1)*g2*ZH21', 
	 order = {'QED':1} ) 
 
GC_104 = Coupling(name = 'GC_104',
	 value = '1./2.*complex(0,1)*g2*ZH11', 
	 order = {'QED':1} ) 
 
GC_105 = Coupling(name = 'GC_105',
	 value = '1./2.*complex(0,1)*g2*ZH21', 
	 order = {'QED':1} ) 
 
GC_106 = Coupling(name = 'GC_106',
	 value = '-1./2.*complex(0,1)*(g1*cmath.cos(TW) + g2*cmath.sin(TW))', 
	 order = {'QED':1} ) 
 
GC_107 = Coupling(name = 'GC_107',
	 value = '-1./2.*complex(0,1)*(g2*cmath.cos(TW)*cmath.cos(TWp) - g1*cmath.cos(TWp)*cmath.sin(TW) + gBY*cmath.sin(TWp))', 
	 order = {'QED':1} ) 
 
GC_108 = Coupling(name = 'GC_108',
	 value = '-1./2.*complex(0,1)*(gBY*cmath.cos(TWp) + (-(g2*cmath.cos(TW)) + g1*cmath.sin(TW))*cmath.sin(TWp))', 
	 order = {'QED':1} ) 
 
GC_109 = Coupling(name = 'GC_109',
	 value = '-1./2.*complex(0,1)*(v*ZH11*(g1*cmath.cos(TW) - g2*cmath.sin(TW))*(g2*cmath.cos(TW)*cmath.cos(TWp) + g1*cmath.cos(TWp)*cmath.sin(TW) - gBY*cmath.sin(TWp)) + 8*gYB*vX*ZH12*(gYB*cmath.cos(TWp)*cmath.sin(2*TW) - 2*gBL*cmath.cos(TW)*cmath.sin(TWp)))', 
	 order = {'QED':1} ) 
 
GC_110 = Coupling(name = 'GC_110',
	 value = '-1./2.*complex(0,1)*(v*ZH21*(g1*cmath.cos(TW) - g2*cmath.sin(TW))*(g2*cmath.cos(TW)*cmath.cos(TWp) + g1*cmath.cos(TWp)*cmath.sin(TW) - gBY*cmath.sin(TWp)) + 8*gYB*vX*ZH22*(gYB*cmath.cos(TWp)*cmath.sin(2*TW) - 2*gBL*cmath.cos(TW)*cmath.sin(TWp)))', 
	 order = {'QED':1} ) 
 
GC_111 = Coupling(name = 'GC_111',
	 value = '1./2.*complex(0,1)*(v*ZH11*(g1*cmath.cos(TW) - g2*cmath.sin(TW))*(gBY*cmath.cos(TWp) + (g2*cmath.cos(TW) + g1*cmath.sin(TW))*cmath.sin(TWp)) + 8*gYB*vX*ZH12*(2*gBL*cmath.cos(TW)*cmath.cos(TWp) + gYB*cmath.sin(2*TW)*cmath.sin(TWp)))', 
	 order = {'QED':1} ) 
 
GC_112 = Coupling(name = 'GC_112',
	 value = '1./2.*complex(0,1)*(v*ZH21*(g1*cmath.cos(TW) - g2*cmath.sin(TW))*(gBY*cmath.cos(TWp) + (g2*cmath.cos(TW) + g1*cmath.sin(TW))*cmath.sin(TWp)) + 8*gYB*vX*ZH22*(2*gBL*cmath.cos(TW)*cmath.cos(TWp) + gYB*cmath.sin(2*TW)*cmath.sin(TWp)))', 
	 order = {'QED':1} ) 
 
GC_113 = Coupling(name = 'GC_113',
	 value = '1./2.*complex(0,1)*g2**2*v*ZH11', 
	 order = {'QED':1} ) 
 
GC_114 = Coupling(name = 'GC_114',
	 value = '1./2.*complex(0,1)*g2**2*v*ZH21', 
	 order = {'QED':1} ) 
 
GC_115 = Coupling(name = 'GC_115',
	 value = '1./2.*complex(0,1)*(16*vX*ZH12*(gYB*cmath.cos(TWp)*cmath.sin(TW) - gBL*cmath.sin(TWp))**2 + v*ZH11*(g2*cmath.cos(TW)*cmath.cos(TWp) + g1*cmath.cos(TWp)*cmath.sin(TW) - gBY*cmath.sin(TWp))**2)', 
	 order = {'QED':1} ) 
 
GC_116 = Coupling(name = 'GC_116',
	 value = '1./2.*complex(0,1)*(16*vX*ZH22*(gYB*cmath.cos(TWp)*cmath.sin(TW) - gBL*cmath.sin(TWp))**2 + v*ZH21*(g2*cmath.cos(TW)*cmath.cos(TWp) + g1*cmath.cos(TWp)*cmath.sin(TW) - gBY*cmath.sin(TWp))**2)', 
	 order = {'QED':1} ) 
 
GC_117 = Coupling(name = 'GC_117',
	 value = '-1./2.*complex(0,1)*(8*vX*ZH12*(2*gBL*gYB*cmath.cos(TWp)**2*cmath.sin(TW) - 2*gBL*gYB*cmath.sin(TW)*cmath.sin(TWp)**2 - gBL**2*cmath.sin(2*TWp) + gYB**2*cmath.sin(TW)**2*cmath.sin(2*TWp)) + v*ZH11*(g1*gBY*cmath.cos(TWp)**2*cmath.sin(TW) + g2**2*cmath.cos(TW)**2*cmath.cos(TWp)*cmath.sin(TWp) + cmath.cos(TWp)*(-gBY**2 + g1**2*cmath.sin(TW)**2)*cmath.sin(TWp) - g1*gBY*cmath.sin(TW)*cmath.sin(TWp)**2 + g2*cmath.cos(TW)*(gBY*cmath.cos(TWp)**2 - gBY*cmath.sin(TWp)**2 + g1*cmath.sin(TW)*cmath.sin(2*TWp))))', 
	 order = {'QED':1} ) 
 
GC_118 = Coupling(name = 'GC_118',
	 value = '-1./2.*complex(0,1)*(8*vX*ZH22*(2*gBL*gYB*cmath.cos(TWp)**2*cmath.sin(TW) - 2*gBL*gYB*cmath.sin(TW)*cmath.sin(TWp)**2 - gBL**2*cmath.sin(2*TWp) + gYB**2*cmath.sin(TW)**2*cmath.sin(2*TWp)) + v*ZH21*(g1*gBY*cmath.cos(TWp)**2*cmath.sin(TW) + g2**2*cmath.cos(TW)**2*cmath.cos(TWp)*cmath.sin(TWp) + cmath.cos(TWp)*(-gBY**2 + g1**2*cmath.sin(TW)**2)*cmath.sin(TWp) - g1*gBY*cmath.sin(TW)*cmath.sin(TWp)**2 + g2*cmath.cos(TW)*(gBY*cmath.cos(TWp)**2 - gBY*cmath.sin(TWp)**2 + g1*cmath.sin(TW)*cmath.sin(2*TWp))))', 
	 order = {'QED':1} ) 
 
GC_119 = Coupling(name = 'GC_119',
	 value = '1./2.*complex(0,1)*(16*vX*ZH12*(gBL*cmath.cos(TWp) + gYB*cmath.sin(TW)*cmath.sin(TWp))**2 + v*ZH11*(gBY*cmath.cos(TWp) + (g2*cmath.cos(TW) + g1*cmath.sin(TW))*cmath.sin(TWp))**2)', 
	 order = {'QED':1} ) 
 
GC_120 = Coupling(name = 'GC_120',
	 value = '1./2.*complex(0,1)*(16*vX*ZH22*(gBL*cmath.cos(TWp) + gYB*cmath.sin(TW)*cmath.sin(TWp))**2 + v*ZH21*(gBY*cmath.cos(TWp) + (g2*cmath.cos(TW) + g1*cmath.sin(TW))*cmath.sin(TWp))**2)', 
	 order = {'QED':1} ) 
 
GC_121 = Coupling(name = 'GC_121',
	 value = '-1./2.*complex(0,1)*g1*g2*v*cmath.cos(TW)', 
	 order = {'QED':1} ) 
 
GC_122 = Coupling(name = 'GC_122',
	 value = '1./2.*complex(0,1)*g2*v*(g1*cmath.cos(TWp)*cmath.sin(TW) - gBY*cmath.sin(TWp))', 
	 order = {'QED':1} ) 
 
GC_123 = Coupling(name = 'GC_123',
	 value = '-1./2.*complex(0,1)*g2*v*(gBY*cmath.cos(TWp) + g1*cmath.sin(TW)*cmath.sin(TWp))', 
	 order = {'QED':1} ) 
 
GC_124 = Coupling(name = 'GC_124',
	 value = '-1./2.*complex(0,1)*g1*g2*v*cmath.cos(TW)', 
	 order = {'QED':1} ) 
 
GC_125 = Coupling(name = 'GC_125',
	 value = '1./2.*complex(0,1)*g2*v*(g1*cmath.cos(TWp)*cmath.sin(TW) - gBY*cmath.sin(TWp))', 
	 order = {'QED':1} ) 
 
GC_126 = Coupling(name = 'GC_126',
	 value = '-1./2.*complex(0,1)*g2*v*(gBY*cmath.cos(TWp) + g1*cmath.sin(TW)*cmath.sin(TWp))', 
	 order = {'QED':1} ) 
 
GC_127 = Coupling(name = 'GC_127',
	 value = '(ZA11*(complexconjugate(ZDL11)*(Yd11*complexconjugate(ZDR11) + Yd21*complexconjugate(ZDR12) + Yd31*complexconjugate(ZDR13)) + complexconjugate(ZDL12)*(Yd12*complexconjugate(ZDR11) + Yd22*complexconjugate(ZDR12) + Yd32*complexconjugate(ZDR13)) + complexconjugate(ZDL13)*(Yd13*complexconjugate(ZDR11) + Yd23*complexconjugate(ZDR12) + Yd33*complexconjugate(ZDR13))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_128 = Coupling(name = 'GC_128',
	 value = '-((ZA11*(ZDL11*(ZDR11*complexconjugate(Yd11) + ZDR12*complexconjugate(Yd21) + ZDR13*complexconjugate(Yd31)) + ZDL12*(ZDR11*complexconjugate(Yd12) + ZDR12*complexconjugate(Yd22) + ZDR13*complexconjugate(Yd32)) + ZDL13*(ZDR11*complexconjugate(Yd13) + ZDR12*complexconjugate(Yd23) + ZDR13*complexconjugate(Yd33))))/cmath.sqrt(2))', 
	 order = {'QED':1} ) 
 
GC_129 = Coupling(name = 'GC_129',
	 value = '(ZA21*(complexconjugate(ZDL11)*(Yd11*complexconjugate(ZDR11) + Yd21*complexconjugate(ZDR12) + Yd31*complexconjugate(ZDR13)) + complexconjugate(ZDL12)*(Yd12*complexconjugate(ZDR11) + Yd22*complexconjugate(ZDR12) + Yd32*complexconjugate(ZDR13)) + complexconjugate(ZDL13)*(Yd13*complexconjugate(ZDR11) + Yd23*complexconjugate(ZDR12) + Yd33*complexconjugate(ZDR13))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_130 = Coupling(name = 'GC_130',
	 value = '-((ZA21*(ZDL11*(ZDR11*complexconjugate(Yd11) + ZDR12*complexconjugate(Yd21) + ZDR13*complexconjugate(Yd31)) + ZDL12*(ZDR11*complexconjugate(Yd12) + ZDR12*complexconjugate(Yd22) + ZDR13*complexconjugate(Yd32)) + ZDL13*(ZDR11*complexconjugate(Yd13) + ZDR12*complexconjugate(Yd23) + ZDR13*complexconjugate(Yd33))))/cmath.sqrt(2))', 
	 order = {'QED':1} ) 
 
GC_131 = Coupling(name = 'GC_131',
	 value = '(ZA11*(complexconjugate(ZDL21)*(Yd11*complexconjugate(ZDR11) + Yd21*complexconjugate(ZDR12) + Yd31*complexconjugate(ZDR13)) + complexconjugate(ZDL22)*(Yd12*complexconjugate(ZDR11) + Yd22*complexconjugate(ZDR12) + Yd32*complexconjugate(ZDR13)) + complexconjugate(ZDL23)*(Yd13*complexconjugate(ZDR11) + Yd23*complexconjugate(ZDR12) + Yd33*complexconjugate(ZDR13))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_132 = Coupling(name = 'GC_132',
	 value = '-((ZA11*(ZDL11*(ZDR21*complexconjugate(Yd11) + ZDR22*complexconjugate(Yd21) + ZDR23*complexconjugate(Yd31)) + ZDL12*(ZDR21*complexconjugate(Yd12) + ZDR22*complexconjugate(Yd22) + ZDR23*complexconjugate(Yd32)) + ZDL13*(ZDR21*complexconjugate(Yd13) + ZDR22*complexconjugate(Yd23) + ZDR23*complexconjugate(Yd33))))/cmath.sqrt(2))', 
	 order = {'QED':1} ) 
 
GC_133 = Coupling(name = 'GC_133',
	 value = '(ZA21*(complexconjugate(ZDL21)*(Yd11*complexconjugate(ZDR11) + Yd21*complexconjugate(ZDR12) + Yd31*complexconjugate(ZDR13)) + complexconjugate(ZDL22)*(Yd12*complexconjugate(ZDR11) + Yd22*complexconjugate(ZDR12) + Yd32*complexconjugate(ZDR13)) + complexconjugate(ZDL23)*(Yd13*complexconjugate(ZDR11) + Yd23*complexconjugate(ZDR12) + Yd33*complexconjugate(ZDR13))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_134 = Coupling(name = 'GC_134',
	 value = '-((ZA21*(ZDL11*(ZDR21*complexconjugate(Yd11) + ZDR22*complexconjugate(Yd21) + ZDR23*complexconjugate(Yd31)) + ZDL12*(ZDR21*complexconjugate(Yd12) + ZDR22*complexconjugate(Yd22) + ZDR23*complexconjugate(Yd32)) + ZDL13*(ZDR21*complexconjugate(Yd13) + ZDR22*complexconjugate(Yd23) + ZDR23*complexconjugate(Yd33))))/cmath.sqrt(2))', 
	 order = {'QED':1} ) 
 
GC_135 = Coupling(name = 'GC_135',
	 value = '(ZA11*(complexconjugate(ZDL31)*(Yd11*complexconjugate(ZDR11) + Yd21*complexconjugate(ZDR12) + Yd31*complexconjugate(ZDR13)) + complexconjugate(ZDL32)*(Yd12*complexconjugate(ZDR11) + Yd22*complexconjugate(ZDR12) + Yd32*complexconjugate(ZDR13)) + complexconjugate(ZDL33)*(Yd13*complexconjugate(ZDR11) + Yd23*complexconjugate(ZDR12) + Yd33*complexconjugate(ZDR13))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_136 = Coupling(name = 'GC_136',
	 value = '-((ZA11*(ZDL11*(ZDR31*complexconjugate(Yd11) + ZDR32*complexconjugate(Yd21) + ZDR33*complexconjugate(Yd31)) + ZDL12*(ZDR31*complexconjugate(Yd12) + ZDR32*complexconjugate(Yd22) + ZDR33*complexconjugate(Yd32)) + ZDL13*(ZDR31*complexconjugate(Yd13) + ZDR32*complexconjugate(Yd23) + ZDR33*complexconjugate(Yd33))))/cmath.sqrt(2))', 
	 order = {'QED':1} ) 
 
GC_137 = Coupling(name = 'GC_137',
	 value = '(ZA21*(complexconjugate(ZDL31)*(Yd11*complexconjugate(ZDR11) + Yd21*complexconjugate(ZDR12) + Yd31*complexconjugate(ZDR13)) + complexconjugate(ZDL32)*(Yd12*complexconjugate(ZDR11) + Yd22*complexconjugate(ZDR12) + Yd32*complexconjugate(ZDR13)) + complexconjugate(ZDL33)*(Yd13*complexconjugate(ZDR11) + Yd23*complexconjugate(ZDR12) + Yd33*complexconjugate(ZDR13))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_138 = Coupling(name = 'GC_138',
	 value = '-((ZA21*(ZDL11*(ZDR31*complexconjugate(Yd11) + ZDR32*complexconjugate(Yd21) + ZDR33*complexconjugate(Yd31)) + ZDL12*(ZDR31*complexconjugate(Yd12) + ZDR32*complexconjugate(Yd22) + ZDR33*complexconjugate(Yd32)) + ZDL13*(ZDR31*complexconjugate(Yd13) + ZDR32*complexconjugate(Yd23) + ZDR33*complexconjugate(Yd33))))/cmath.sqrt(2))', 
	 order = {'QED':1} ) 
 
GC_139 = Coupling(name = 'GC_139',
	 value = '(ZA11*(complexconjugate(ZDL11)*(Yd11*complexconjugate(ZDR21) + Yd21*complexconjugate(ZDR22) + Yd31*complexconjugate(ZDR23)) + complexconjugate(ZDL12)*(Yd12*complexconjugate(ZDR21) + Yd22*complexconjugate(ZDR22) + Yd32*complexconjugate(ZDR23)) + complexconjugate(ZDL13)*(Yd13*complexconjugate(ZDR21) + Yd23*complexconjugate(ZDR22) + Yd33*complexconjugate(ZDR23))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_140 = Coupling(name = 'GC_140',
	 value = '-((ZA11*(ZDL21*(ZDR11*complexconjugate(Yd11) + ZDR12*complexconjugate(Yd21) + ZDR13*complexconjugate(Yd31)) + ZDL22*(ZDR11*complexconjugate(Yd12) + ZDR12*complexconjugate(Yd22) + ZDR13*complexconjugate(Yd32)) + ZDL23*(ZDR11*complexconjugate(Yd13) + ZDR12*complexconjugate(Yd23) + ZDR13*complexconjugate(Yd33))))/cmath.sqrt(2))', 
	 order = {'QED':1} ) 
 
GC_141 = Coupling(name = 'GC_141',
	 value = '(ZA21*(complexconjugate(ZDL11)*(Yd11*complexconjugate(ZDR21) + Yd21*complexconjugate(ZDR22) + Yd31*complexconjugate(ZDR23)) + complexconjugate(ZDL12)*(Yd12*complexconjugate(ZDR21) + Yd22*complexconjugate(ZDR22) + Yd32*complexconjugate(ZDR23)) + complexconjugate(ZDL13)*(Yd13*complexconjugate(ZDR21) + Yd23*complexconjugate(ZDR22) + Yd33*complexconjugate(ZDR23))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_142 = Coupling(name = 'GC_142',
	 value = '-((ZA21*(ZDL21*(ZDR11*complexconjugate(Yd11) + ZDR12*complexconjugate(Yd21) + ZDR13*complexconjugate(Yd31)) + ZDL22*(ZDR11*complexconjugate(Yd12) + ZDR12*complexconjugate(Yd22) + ZDR13*complexconjugate(Yd32)) + ZDL23*(ZDR11*complexconjugate(Yd13) + ZDR12*complexconjugate(Yd23) + ZDR13*complexconjugate(Yd33))))/cmath.sqrt(2))', 
	 order = {'QED':1} ) 
 
GC_143 = Coupling(name = 'GC_143',
	 value = '(ZA11*(complexconjugate(ZDL21)*(Yd11*complexconjugate(ZDR21) + Yd21*complexconjugate(ZDR22) + Yd31*complexconjugate(ZDR23)) + complexconjugate(ZDL22)*(Yd12*complexconjugate(ZDR21) + Yd22*complexconjugate(ZDR22) + Yd32*complexconjugate(ZDR23)) + complexconjugate(ZDL23)*(Yd13*complexconjugate(ZDR21) + Yd23*complexconjugate(ZDR22) + Yd33*complexconjugate(ZDR23))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_144 = Coupling(name = 'GC_144',
	 value = '-((ZA11*(ZDL21*(ZDR21*complexconjugate(Yd11) + ZDR22*complexconjugate(Yd21) + ZDR23*complexconjugate(Yd31)) + ZDL22*(ZDR21*complexconjugate(Yd12) + ZDR22*complexconjugate(Yd22) + ZDR23*complexconjugate(Yd32)) + ZDL23*(ZDR21*complexconjugate(Yd13) + ZDR22*complexconjugate(Yd23) + ZDR23*complexconjugate(Yd33))))/cmath.sqrt(2))', 
	 order = {'QED':1} ) 
 
GC_145 = Coupling(name = 'GC_145',
	 value = '(ZA21*(complexconjugate(ZDL21)*(Yd11*complexconjugate(ZDR21) + Yd21*complexconjugate(ZDR22) + Yd31*complexconjugate(ZDR23)) + complexconjugate(ZDL22)*(Yd12*complexconjugate(ZDR21) + Yd22*complexconjugate(ZDR22) + Yd32*complexconjugate(ZDR23)) + complexconjugate(ZDL23)*(Yd13*complexconjugate(ZDR21) + Yd23*complexconjugate(ZDR22) + Yd33*complexconjugate(ZDR23))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_146 = Coupling(name = 'GC_146',
	 value = '-((ZA21*(ZDL21*(ZDR21*complexconjugate(Yd11) + ZDR22*complexconjugate(Yd21) + ZDR23*complexconjugate(Yd31)) + ZDL22*(ZDR21*complexconjugate(Yd12) + ZDR22*complexconjugate(Yd22) + ZDR23*complexconjugate(Yd32)) + ZDL23*(ZDR21*complexconjugate(Yd13) + ZDR22*complexconjugate(Yd23) + ZDR23*complexconjugate(Yd33))))/cmath.sqrt(2))', 
	 order = {'QED':1} ) 
 
GC_147 = Coupling(name = 'GC_147',
	 value = '(ZA11*(complexconjugate(ZDL31)*(Yd11*complexconjugate(ZDR21) + Yd21*complexconjugate(ZDR22) + Yd31*complexconjugate(ZDR23)) + complexconjugate(ZDL32)*(Yd12*complexconjugate(ZDR21) + Yd22*complexconjugate(ZDR22) + Yd32*complexconjugate(ZDR23)) + complexconjugate(ZDL33)*(Yd13*complexconjugate(ZDR21) + Yd23*complexconjugate(ZDR22) + Yd33*complexconjugate(ZDR23))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_148 = Coupling(name = 'GC_148',
	 value = '-((ZA11*(ZDL21*(ZDR31*complexconjugate(Yd11) + ZDR32*complexconjugate(Yd21) + ZDR33*complexconjugate(Yd31)) + ZDL22*(ZDR31*complexconjugate(Yd12) + ZDR32*complexconjugate(Yd22) + ZDR33*complexconjugate(Yd32)) + ZDL23*(ZDR31*complexconjugate(Yd13) + ZDR32*complexconjugate(Yd23) + ZDR33*complexconjugate(Yd33))))/cmath.sqrt(2))', 
	 order = {'QED':1} ) 
 
GC_149 = Coupling(name = 'GC_149',
	 value = '(ZA21*(complexconjugate(ZDL31)*(Yd11*complexconjugate(ZDR21) + Yd21*complexconjugate(ZDR22) + Yd31*complexconjugate(ZDR23)) + complexconjugate(ZDL32)*(Yd12*complexconjugate(ZDR21) + Yd22*complexconjugate(ZDR22) + Yd32*complexconjugate(ZDR23)) + complexconjugate(ZDL33)*(Yd13*complexconjugate(ZDR21) + Yd23*complexconjugate(ZDR22) + Yd33*complexconjugate(ZDR23))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_150 = Coupling(name = 'GC_150',
	 value = '-((ZA21*(ZDL21*(ZDR31*complexconjugate(Yd11) + ZDR32*complexconjugate(Yd21) + ZDR33*complexconjugate(Yd31)) + ZDL22*(ZDR31*complexconjugate(Yd12) + ZDR32*complexconjugate(Yd22) + ZDR33*complexconjugate(Yd32)) + ZDL23*(ZDR31*complexconjugate(Yd13) + ZDR32*complexconjugate(Yd23) + ZDR33*complexconjugate(Yd33))))/cmath.sqrt(2))', 
	 order = {'QED':1} ) 
 
GC_151 = Coupling(name = 'GC_151',
	 value = '(ZA11*(complexconjugate(ZDL11)*(Yd11*complexconjugate(ZDR31) + Yd21*complexconjugate(ZDR32) + Yd31*complexconjugate(ZDR33)) + complexconjugate(ZDL12)*(Yd12*complexconjugate(ZDR31) + Yd22*complexconjugate(ZDR32) + Yd32*complexconjugate(ZDR33)) + complexconjugate(ZDL13)*(Yd13*complexconjugate(ZDR31) + Yd23*complexconjugate(ZDR32) + Yd33*complexconjugate(ZDR33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_152 = Coupling(name = 'GC_152',
	 value = '-((ZA11*(ZDL31*(ZDR11*complexconjugate(Yd11) + ZDR12*complexconjugate(Yd21) + ZDR13*complexconjugate(Yd31)) + ZDL32*(ZDR11*complexconjugate(Yd12) + ZDR12*complexconjugate(Yd22) + ZDR13*complexconjugate(Yd32)) + ZDL33*(ZDR11*complexconjugate(Yd13) + ZDR12*complexconjugate(Yd23) + ZDR13*complexconjugate(Yd33))))/cmath.sqrt(2))', 
	 order = {'QED':1} ) 
 
GC_153 = Coupling(name = 'GC_153',
	 value = '(ZA21*(complexconjugate(ZDL11)*(Yd11*complexconjugate(ZDR31) + Yd21*complexconjugate(ZDR32) + Yd31*complexconjugate(ZDR33)) + complexconjugate(ZDL12)*(Yd12*complexconjugate(ZDR31) + Yd22*complexconjugate(ZDR32) + Yd32*complexconjugate(ZDR33)) + complexconjugate(ZDL13)*(Yd13*complexconjugate(ZDR31) + Yd23*complexconjugate(ZDR32) + Yd33*complexconjugate(ZDR33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_154 = Coupling(name = 'GC_154',
	 value = '-((ZA21*(ZDL31*(ZDR11*complexconjugate(Yd11) + ZDR12*complexconjugate(Yd21) + ZDR13*complexconjugate(Yd31)) + ZDL32*(ZDR11*complexconjugate(Yd12) + ZDR12*complexconjugate(Yd22) + ZDR13*complexconjugate(Yd32)) + ZDL33*(ZDR11*complexconjugate(Yd13) + ZDR12*complexconjugate(Yd23) + ZDR13*complexconjugate(Yd33))))/cmath.sqrt(2))', 
	 order = {'QED':1} ) 
 
GC_155 = Coupling(name = 'GC_155',
	 value = '(ZA11*(complexconjugate(ZDL21)*(Yd11*complexconjugate(ZDR31) + Yd21*complexconjugate(ZDR32) + Yd31*complexconjugate(ZDR33)) + complexconjugate(ZDL22)*(Yd12*complexconjugate(ZDR31) + Yd22*complexconjugate(ZDR32) + Yd32*complexconjugate(ZDR33)) + complexconjugate(ZDL23)*(Yd13*complexconjugate(ZDR31) + Yd23*complexconjugate(ZDR32) + Yd33*complexconjugate(ZDR33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_156 = Coupling(name = 'GC_156',
	 value = '-((ZA11*(ZDL31*(ZDR21*complexconjugate(Yd11) + ZDR22*complexconjugate(Yd21) + ZDR23*complexconjugate(Yd31)) + ZDL32*(ZDR21*complexconjugate(Yd12) + ZDR22*complexconjugate(Yd22) + ZDR23*complexconjugate(Yd32)) + ZDL33*(ZDR21*complexconjugate(Yd13) + ZDR22*complexconjugate(Yd23) + ZDR23*complexconjugate(Yd33))))/cmath.sqrt(2))', 
	 order = {'QED':1} ) 
 
GC_157 = Coupling(name = 'GC_157',
	 value = '(ZA21*(complexconjugate(ZDL21)*(Yd11*complexconjugate(ZDR31) + Yd21*complexconjugate(ZDR32) + Yd31*complexconjugate(ZDR33)) + complexconjugate(ZDL22)*(Yd12*complexconjugate(ZDR31) + Yd22*complexconjugate(ZDR32) + Yd32*complexconjugate(ZDR33)) + complexconjugate(ZDL23)*(Yd13*complexconjugate(ZDR31) + Yd23*complexconjugate(ZDR32) + Yd33*complexconjugate(ZDR33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_158 = Coupling(name = 'GC_158',
	 value = '-((ZA21*(ZDL31*(ZDR21*complexconjugate(Yd11) + ZDR22*complexconjugate(Yd21) + ZDR23*complexconjugate(Yd31)) + ZDL32*(ZDR21*complexconjugate(Yd12) + ZDR22*complexconjugate(Yd22) + ZDR23*complexconjugate(Yd32)) + ZDL33*(ZDR21*complexconjugate(Yd13) + ZDR22*complexconjugate(Yd23) + ZDR23*complexconjugate(Yd33))))/cmath.sqrt(2))', 
	 order = {'QED':1} ) 
 
GC_159 = Coupling(name = 'GC_159',
	 value = '(ZA11*(complexconjugate(ZDL31)*(Yd11*complexconjugate(ZDR31) + Yd21*complexconjugate(ZDR32) + Yd31*complexconjugate(ZDR33)) + complexconjugate(ZDL32)*(Yd12*complexconjugate(ZDR31) + Yd22*complexconjugate(ZDR32) + Yd32*complexconjugate(ZDR33)) + complexconjugate(ZDL33)*(Yd13*complexconjugate(ZDR31) + Yd23*complexconjugate(ZDR32) + Yd33*complexconjugate(ZDR33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_160 = Coupling(name = 'GC_160',
	 value = '-((ZA11*(ZDL31*(ZDR31*complexconjugate(Yd11) + ZDR32*complexconjugate(Yd21) + ZDR33*complexconjugate(Yd31)) + ZDL32*(ZDR31*complexconjugate(Yd12) + ZDR32*complexconjugate(Yd22) + ZDR33*complexconjugate(Yd32)) + ZDL33*(ZDR31*complexconjugate(Yd13) + ZDR32*complexconjugate(Yd23) + ZDR33*complexconjugate(Yd33))))/cmath.sqrt(2))', 
	 order = {'QED':1} ) 
 
GC_161 = Coupling(name = 'GC_161',
	 value = '(ZA21*(complexconjugate(ZDL31)*(Yd11*complexconjugate(ZDR31) + Yd21*complexconjugate(ZDR32) + Yd31*complexconjugate(ZDR33)) + complexconjugate(ZDL32)*(Yd12*complexconjugate(ZDR31) + Yd22*complexconjugate(ZDR32) + Yd32*complexconjugate(ZDR33)) + complexconjugate(ZDL33)*(Yd13*complexconjugate(ZDR31) + Yd23*complexconjugate(ZDR32) + Yd33*complexconjugate(ZDR33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_162 = Coupling(name = 'GC_162',
	 value = '-((ZA21*(ZDL31*(ZDR31*complexconjugate(Yd11) + ZDR32*complexconjugate(Yd21) + ZDR33*complexconjugate(Yd31)) + ZDL32*(ZDR31*complexconjugate(Yd12) + ZDR32*complexconjugate(Yd22) + ZDR33*complexconjugate(Yd32)) + ZDL33*(ZDR31*complexconjugate(Yd13) + ZDR32*complexconjugate(Yd23) + ZDR33*complexconjugate(Yd33))))/cmath.sqrt(2))', 
	 order = {'QED':1} ) 
 
GC_163 = Coupling(name = 'GC_163',
	 value = '(ZA11*(complexconjugate(ZEL11)*(Ye11*complexconjugate(ZER11) + Ye21*complexconjugate(ZER12) + Ye31*complexconjugate(ZER13)) + complexconjugate(ZEL12)*(Ye12*complexconjugate(ZER11) + Ye22*complexconjugate(ZER12) + Ye32*complexconjugate(ZER13)) + complexconjugate(ZEL13)*(Ye13*complexconjugate(ZER11) + Ye23*complexconjugate(ZER12) + Ye33*complexconjugate(ZER13))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_164 = Coupling(name = 'GC_164',
	 value = '-((ZA11*(ZEL11*(ZER11*complexconjugate(Ye11) + ZER12*complexconjugate(Ye21) + ZER13*complexconjugate(Ye31)) + ZEL12*(ZER11*complexconjugate(Ye12) + ZER12*complexconjugate(Ye22) + ZER13*complexconjugate(Ye32)) + ZEL13*(ZER11*complexconjugate(Ye13) + ZER12*complexconjugate(Ye23) + ZER13*complexconjugate(Ye33))))/cmath.sqrt(2))', 
	 order = {'QED':1} ) 
 
GC_165 = Coupling(name = 'GC_165',
	 value = '(ZA21*(complexconjugate(ZEL11)*(Ye11*complexconjugate(ZER11) + Ye21*complexconjugate(ZER12) + Ye31*complexconjugate(ZER13)) + complexconjugate(ZEL12)*(Ye12*complexconjugate(ZER11) + Ye22*complexconjugate(ZER12) + Ye32*complexconjugate(ZER13)) + complexconjugate(ZEL13)*(Ye13*complexconjugate(ZER11) + Ye23*complexconjugate(ZER12) + Ye33*complexconjugate(ZER13))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_166 = Coupling(name = 'GC_166',
	 value = '-((ZA21*(ZEL11*(ZER11*complexconjugate(Ye11) + ZER12*complexconjugate(Ye21) + ZER13*complexconjugate(Ye31)) + ZEL12*(ZER11*complexconjugate(Ye12) + ZER12*complexconjugate(Ye22) + ZER13*complexconjugate(Ye32)) + ZEL13*(ZER11*complexconjugate(Ye13) + ZER12*complexconjugate(Ye23) + ZER13*complexconjugate(Ye33))))/cmath.sqrt(2))', 
	 order = {'QED':1} ) 
 
GC_167 = Coupling(name = 'GC_167',
	 value = '(ZA11*(complexconjugate(ZEL21)*(Ye11*complexconjugate(ZER11) + Ye21*complexconjugate(ZER12) + Ye31*complexconjugate(ZER13)) + complexconjugate(ZEL22)*(Ye12*complexconjugate(ZER11) + Ye22*complexconjugate(ZER12) + Ye32*complexconjugate(ZER13)) + complexconjugate(ZEL23)*(Ye13*complexconjugate(ZER11) + Ye23*complexconjugate(ZER12) + Ye33*complexconjugate(ZER13))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_168 = Coupling(name = 'GC_168',
	 value = '-((ZA11*(ZEL11*(ZER21*complexconjugate(Ye11) + ZER22*complexconjugate(Ye21) + ZER23*complexconjugate(Ye31)) + ZEL12*(ZER21*complexconjugate(Ye12) + ZER22*complexconjugate(Ye22) + ZER23*complexconjugate(Ye32)) + ZEL13*(ZER21*complexconjugate(Ye13) + ZER22*complexconjugate(Ye23) + ZER23*complexconjugate(Ye33))))/cmath.sqrt(2))', 
	 order = {'QED':1} ) 
 
GC_169 = Coupling(name = 'GC_169',
	 value = '(ZA21*(complexconjugate(ZEL21)*(Ye11*complexconjugate(ZER11) + Ye21*complexconjugate(ZER12) + Ye31*complexconjugate(ZER13)) + complexconjugate(ZEL22)*(Ye12*complexconjugate(ZER11) + Ye22*complexconjugate(ZER12) + Ye32*complexconjugate(ZER13)) + complexconjugate(ZEL23)*(Ye13*complexconjugate(ZER11) + Ye23*complexconjugate(ZER12) + Ye33*complexconjugate(ZER13))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_170 = Coupling(name = 'GC_170',
	 value = '-((ZA21*(ZEL11*(ZER21*complexconjugate(Ye11) + ZER22*complexconjugate(Ye21) + ZER23*complexconjugate(Ye31)) + ZEL12*(ZER21*complexconjugate(Ye12) + ZER22*complexconjugate(Ye22) + ZER23*complexconjugate(Ye32)) + ZEL13*(ZER21*complexconjugate(Ye13) + ZER22*complexconjugate(Ye23) + ZER23*complexconjugate(Ye33))))/cmath.sqrt(2))', 
	 order = {'QED':1} ) 
 
GC_171 = Coupling(name = 'GC_171',
	 value = '(ZA11*(complexconjugate(ZEL31)*(Ye11*complexconjugate(ZER11) + Ye21*complexconjugate(ZER12) + Ye31*complexconjugate(ZER13)) + complexconjugate(ZEL32)*(Ye12*complexconjugate(ZER11) + Ye22*complexconjugate(ZER12) + Ye32*complexconjugate(ZER13)) + complexconjugate(ZEL33)*(Ye13*complexconjugate(ZER11) + Ye23*complexconjugate(ZER12) + Ye33*complexconjugate(ZER13))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_172 = Coupling(name = 'GC_172',
	 value = '-((ZA11*(ZEL11*(ZER31*complexconjugate(Ye11) + ZER32*complexconjugate(Ye21) + ZER33*complexconjugate(Ye31)) + ZEL12*(ZER31*complexconjugate(Ye12) + ZER32*complexconjugate(Ye22) + ZER33*complexconjugate(Ye32)) + ZEL13*(ZER31*complexconjugate(Ye13) + ZER32*complexconjugate(Ye23) + ZER33*complexconjugate(Ye33))))/cmath.sqrt(2))', 
	 order = {'QED':1} ) 
 
GC_173 = Coupling(name = 'GC_173',
	 value = '(ZA21*(complexconjugate(ZEL31)*(Ye11*complexconjugate(ZER11) + Ye21*complexconjugate(ZER12) + Ye31*complexconjugate(ZER13)) + complexconjugate(ZEL32)*(Ye12*complexconjugate(ZER11) + Ye22*complexconjugate(ZER12) + Ye32*complexconjugate(ZER13)) + complexconjugate(ZEL33)*(Ye13*complexconjugate(ZER11) + Ye23*complexconjugate(ZER12) + Ye33*complexconjugate(ZER13))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_174 = Coupling(name = 'GC_174',
	 value = '-((ZA21*(ZEL11*(ZER31*complexconjugate(Ye11) + ZER32*complexconjugate(Ye21) + ZER33*complexconjugate(Ye31)) + ZEL12*(ZER31*complexconjugate(Ye12) + ZER32*complexconjugate(Ye22) + ZER33*complexconjugate(Ye32)) + ZEL13*(ZER31*complexconjugate(Ye13) + ZER32*complexconjugate(Ye23) + ZER33*complexconjugate(Ye33))))/cmath.sqrt(2))', 
	 order = {'QED':1} ) 
 
GC_175 = Coupling(name = 'GC_175',
	 value = '(ZA11*(complexconjugate(ZEL11)*(Ye11*complexconjugate(ZER21) + Ye21*complexconjugate(ZER22) + Ye31*complexconjugate(ZER23)) + complexconjugate(ZEL12)*(Ye12*complexconjugate(ZER21) + Ye22*complexconjugate(ZER22) + Ye32*complexconjugate(ZER23)) + complexconjugate(ZEL13)*(Ye13*complexconjugate(ZER21) + Ye23*complexconjugate(ZER22) + Ye33*complexconjugate(ZER23))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_176 = Coupling(name = 'GC_176',
	 value = '-((ZA11*(ZEL21*(ZER11*complexconjugate(Ye11) + ZER12*complexconjugate(Ye21) + ZER13*complexconjugate(Ye31)) + ZEL22*(ZER11*complexconjugate(Ye12) + ZER12*complexconjugate(Ye22) + ZER13*complexconjugate(Ye32)) + ZEL23*(ZER11*complexconjugate(Ye13) + ZER12*complexconjugate(Ye23) + ZER13*complexconjugate(Ye33))))/cmath.sqrt(2))', 
	 order = {'QED':1} ) 
 
GC_177 = Coupling(name = 'GC_177',
	 value = '(ZA21*(complexconjugate(ZEL11)*(Ye11*complexconjugate(ZER21) + Ye21*complexconjugate(ZER22) + Ye31*complexconjugate(ZER23)) + complexconjugate(ZEL12)*(Ye12*complexconjugate(ZER21) + Ye22*complexconjugate(ZER22) + Ye32*complexconjugate(ZER23)) + complexconjugate(ZEL13)*(Ye13*complexconjugate(ZER21) + Ye23*complexconjugate(ZER22) + Ye33*complexconjugate(ZER23))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_178 = Coupling(name = 'GC_178',
	 value = '-((ZA21*(ZEL21*(ZER11*complexconjugate(Ye11) + ZER12*complexconjugate(Ye21) + ZER13*complexconjugate(Ye31)) + ZEL22*(ZER11*complexconjugate(Ye12) + ZER12*complexconjugate(Ye22) + ZER13*complexconjugate(Ye32)) + ZEL23*(ZER11*complexconjugate(Ye13) + ZER12*complexconjugate(Ye23) + ZER13*complexconjugate(Ye33))))/cmath.sqrt(2))', 
	 order = {'QED':1} ) 
 
GC_179 = Coupling(name = 'GC_179',
	 value = '(ZA11*(complexconjugate(ZEL21)*(Ye11*complexconjugate(ZER21) + Ye21*complexconjugate(ZER22) + Ye31*complexconjugate(ZER23)) + complexconjugate(ZEL22)*(Ye12*complexconjugate(ZER21) + Ye22*complexconjugate(ZER22) + Ye32*complexconjugate(ZER23)) + complexconjugate(ZEL23)*(Ye13*complexconjugate(ZER21) + Ye23*complexconjugate(ZER22) + Ye33*complexconjugate(ZER23))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_180 = Coupling(name = 'GC_180',
	 value = '-((ZA11*(ZEL21*(ZER21*complexconjugate(Ye11) + ZER22*complexconjugate(Ye21) + ZER23*complexconjugate(Ye31)) + ZEL22*(ZER21*complexconjugate(Ye12) + ZER22*complexconjugate(Ye22) + ZER23*complexconjugate(Ye32)) + ZEL23*(ZER21*complexconjugate(Ye13) + ZER22*complexconjugate(Ye23) + ZER23*complexconjugate(Ye33))))/cmath.sqrt(2))', 
	 order = {'QED':1} ) 
 
GC_181 = Coupling(name = 'GC_181',
	 value = '(ZA21*(complexconjugate(ZEL21)*(Ye11*complexconjugate(ZER21) + Ye21*complexconjugate(ZER22) + Ye31*complexconjugate(ZER23)) + complexconjugate(ZEL22)*(Ye12*complexconjugate(ZER21) + Ye22*complexconjugate(ZER22) + Ye32*complexconjugate(ZER23)) + complexconjugate(ZEL23)*(Ye13*complexconjugate(ZER21) + Ye23*complexconjugate(ZER22) + Ye33*complexconjugate(ZER23))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_182 = Coupling(name = 'GC_182',
	 value = '-((ZA21*(ZEL21*(ZER21*complexconjugate(Ye11) + ZER22*complexconjugate(Ye21) + ZER23*complexconjugate(Ye31)) + ZEL22*(ZER21*complexconjugate(Ye12) + ZER22*complexconjugate(Ye22) + ZER23*complexconjugate(Ye32)) + ZEL23*(ZER21*complexconjugate(Ye13) + ZER22*complexconjugate(Ye23) + ZER23*complexconjugate(Ye33))))/cmath.sqrt(2))', 
	 order = {'QED':1} ) 
 
GC_183 = Coupling(name = 'GC_183',
	 value = '(ZA11*(complexconjugate(ZEL31)*(Ye11*complexconjugate(ZER21) + Ye21*complexconjugate(ZER22) + Ye31*complexconjugate(ZER23)) + complexconjugate(ZEL32)*(Ye12*complexconjugate(ZER21) + Ye22*complexconjugate(ZER22) + Ye32*complexconjugate(ZER23)) + complexconjugate(ZEL33)*(Ye13*complexconjugate(ZER21) + Ye23*complexconjugate(ZER22) + Ye33*complexconjugate(ZER23))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_184 = Coupling(name = 'GC_184',
	 value = '-((ZA11*(ZEL21*(ZER31*complexconjugate(Ye11) + ZER32*complexconjugate(Ye21) + ZER33*complexconjugate(Ye31)) + ZEL22*(ZER31*complexconjugate(Ye12) + ZER32*complexconjugate(Ye22) + ZER33*complexconjugate(Ye32)) + ZEL23*(ZER31*complexconjugate(Ye13) + ZER32*complexconjugate(Ye23) + ZER33*complexconjugate(Ye33))))/cmath.sqrt(2))', 
	 order = {'QED':1} ) 
 
GC_185 = Coupling(name = 'GC_185',
	 value = '(ZA21*(complexconjugate(ZEL31)*(Ye11*complexconjugate(ZER21) + Ye21*complexconjugate(ZER22) + Ye31*complexconjugate(ZER23)) + complexconjugate(ZEL32)*(Ye12*complexconjugate(ZER21) + Ye22*complexconjugate(ZER22) + Ye32*complexconjugate(ZER23)) + complexconjugate(ZEL33)*(Ye13*complexconjugate(ZER21) + Ye23*complexconjugate(ZER22) + Ye33*complexconjugate(ZER23))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_186 = Coupling(name = 'GC_186',
	 value = '-((ZA21*(ZEL21*(ZER31*complexconjugate(Ye11) + ZER32*complexconjugate(Ye21) + ZER33*complexconjugate(Ye31)) + ZEL22*(ZER31*complexconjugate(Ye12) + ZER32*complexconjugate(Ye22) + ZER33*complexconjugate(Ye32)) + ZEL23*(ZER31*complexconjugate(Ye13) + ZER32*complexconjugate(Ye23) + ZER33*complexconjugate(Ye33))))/cmath.sqrt(2))', 
	 order = {'QED':1} ) 
 
GC_187 = Coupling(name = 'GC_187',
	 value = '(ZA11*(complexconjugate(ZEL11)*(Ye11*complexconjugate(ZER31) + Ye21*complexconjugate(ZER32) + Ye31*complexconjugate(ZER33)) + complexconjugate(ZEL12)*(Ye12*complexconjugate(ZER31) + Ye22*complexconjugate(ZER32) + Ye32*complexconjugate(ZER33)) + complexconjugate(ZEL13)*(Ye13*complexconjugate(ZER31) + Ye23*complexconjugate(ZER32) + Ye33*complexconjugate(ZER33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_188 = Coupling(name = 'GC_188',
	 value = '-((ZA11*(ZEL31*(ZER11*complexconjugate(Ye11) + ZER12*complexconjugate(Ye21) + ZER13*complexconjugate(Ye31)) + ZEL32*(ZER11*complexconjugate(Ye12) + ZER12*complexconjugate(Ye22) + ZER13*complexconjugate(Ye32)) + ZEL33*(ZER11*complexconjugate(Ye13) + ZER12*complexconjugate(Ye23) + ZER13*complexconjugate(Ye33))))/cmath.sqrt(2))', 
	 order = {'QED':1} ) 
 
GC_189 = Coupling(name = 'GC_189',
	 value = '(ZA21*(complexconjugate(ZEL11)*(Ye11*complexconjugate(ZER31) + Ye21*complexconjugate(ZER32) + Ye31*complexconjugate(ZER33)) + complexconjugate(ZEL12)*(Ye12*complexconjugate(ZER31) + Ye22*complexconjugate(ZER32) + Ye32*complexconjugate(ZER33)) + complexconjugate(ZEL13)*(Ye13*complexconjugate(ZER31) + Ye23*complexconjugate(ZER32) + Ye33*complexconjugate(ZER33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_190 = Coupling(name = 'GC_190',
	 value = '-((ZA21*(ZEL31*(ZER11*complexconjugate(Ye11) + ZER12*complexconjugate(Ye21) + ZER13*complexconjugate(Ye31)) + ZEL32*(ZER11*complexconjugate(Ye12) + ZER12*complexconjugate(Ye22) + ZER13*complexconjugate(Ye32)) + ZEL33*(ZER11*complexconjugate(Ye13) + ZER12*complexconjugate(Ye23) + ZER13*complexconjugate(Ye33))))/cmath.sqrt(2))', 
	 order = {'QED':1} ) 
 
GC_191 = Coupling(name = 'GC_191',
	 value = '(ZA11*(complexconjugate(ZEL21)*(Ye11*complexconjugate(ZER31) + Ye21*complexconjugate(ZER32) + Ye31*complexconjugate(ZER33)) + complexconjugate(ZEL22)*(Ye12*complexconjugate(ZER31) + Ye22*complexconjugate(ZER32) + Ye32*complexconjugate(ZER33)) + complexconjugate(ZEL23)*(Ye13*complexconjugate(ZER31) + Ye23*complexconjugate(ZER32) + Ye33*complexconjugate(ZER33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_192 = Coupling(name = 'GC_192',
	 value = '-((ZA11*(ZEL31*(ZER21*complexconjugate(Ye11) + ZER22*complexconjugate(Ye21) + ZER23*complexconjugate(Ye31)) + ZEL32*(ZER21*complexconjugate(Ye12) + ZER22*complexconjugate(Ye22) + ZER23*complexconjugate(Ye32)) + ZEL33*(ZER21*complexconjugate(Ye13) + ZER22*complexconjugate(Ye23) + ZER23*complexconjugate(Ye33))))/cmath.sqrt(2))', 
	 order = {'QED':1} ) 
 
GC_193 = Coupling(name = 'GC_193',
	 value = '(ZA21*(complexconjugate(ZEL21)*(Ye11*complexconjugate(ZER31) + Ye21*complexconjugate(ZER32) + Ye31*complexconjugate(ZER33)) + complexconjugate(ZEL22)*(Ye12*complexconjugate(ZER31) + Ye22*complexconjugate(ZER32) + Ye32*complexconjugate(ZER33)) + complexconjugate(ZEL23)*(Ye13*complexconjugate(ZER31) + Ye23*complexconjugate(ZER32) + Ye33*complexconjugate(ZER33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_194 = Coupling(name = 'GC_194',
	 value = '-((ZA21*(ZEL31*(ZER21*complexconjugate(Ye11) + ZER22*complexconjugate(Ye21) + ZER23*complexconjugate(Ye31)) + ZEL32*(ZER21*complexconjugate(Ye12) + ZER22*complexconjugate(Ye22) + ZER23*complexconjugate(Ye32)) + ZEL33*(ZER21*complexconjugate(Ye13) + ZER22*complexconjugate(Ye23) + ZER23*complexconjugate(Ye33))))/cmath.sqrt(2))', 
	 order = {'QED':1} ) 
 
GC_195 = Coupling(name = 'GC_195',
	 value = '(ZA11*(complexconjugate(ZEL31)*(Ye11*complexconjugate(ZER31) + Ye21*complexconjugate(ZER32) + Ye31*complexconjugate(ZER33)) + complexconjugate(ZEL32)*(Ye12*complexconjugate(ZER31) + Ye22*complexconjugate(ZER32) + Ye32*complexconjugate(ZER33)) + complexconjugate(ZEL33)*(Ye13*complexconjugate(ZER31) + Ye23*complexconjugate(ZER32) + Ye33*complexconjugate(ZER33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_196 = Coupling(name = 'GC_196',
	 value = '-((ZA11*(ZEL31*(ZER31*complexconjugate(Ye11) + ZER32*complexconjugate(Ye21) + ZER33*complexconjugate(Ye31)) + ZEL32*(ZER31*complexconjugate(Ye12) + ZER32*complexconjugate(Ye22) + ZER33*complexconjugate(Ye32)) + ZEL33*(ZER31*complexconjugate(Ye13) + ZER32*complexconjugate(Ye23) + ZER33*complexconjugate(Ye33))))/cmath.sqrt(2))', 
	 order = {'QED':1} ) 
 
GC_197 = Coupling(name = 'GC_197',
	 value = '(ZA21*(complexconjugate(ZEL31)*(Ye11*complexconjugate(ZER31) + Ye21*complexconjugate(ZER32) + Ye31*complexconjugate(ZER33)) + complexconjugate(ZEL32)*(Ye12*complexconjugate(ZER31) + Ye22*complexconjugate(ZER32) + Ye32*complexconjugate(ZER33)) + complexconjugate(ZEL33)*(Ye13*complexconjugate(ZER31) + Ye23*complexconjugate(ZER32) + Ye33*complexconjugate(ZER33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_198 = Coupling(name = 'GC_198',
	 value = '-((ZA21*(ZEL31*(ZER31*complexconjugate(Ye11) + ZER32*complexconjugate(Ye21) + ZER33*complexconjugate(Ye31)) + ZEL32*(ZER31*complexconjugate(Ye12) + ZER32*complexconjugate(Ye22) + ZER33*complexconjugate(Ye32)) + ZEL33*(ZER31*complexconjugate(Ye13) + ZER32*complexconjugate(Ye23) + ZER33*complexconjugate(Ye33))))/cmath.sqrt(2))', 
	 order = {'QED':1} ) 
 
GC_199 = Coupling(name = 'GC_199',
	 value = '-((ZA11*(complexconjugate(ZUL11)*(Yu11*complexconjugate(ZUR11) + Yu21*complexconjugate(ZUR12) + Yu31*complexconjugate(ZUR13)) + complexconjugate(ZUL12)*(Yu12*complexconjugate(ZUR11) + Yu22*complexconjugate(ZUR12) + Yu32*complexconjugate(ZUR13)) + complexconjugate(ZUL13)*(Yu13*complexconjugate(ZUR11) + Yu23*complexconjugate(ZUR12) + Yu33*complexconjugate(ZUR13))))/cmath.sqrt(2))', 
	 order = {'QED':1} ) 
 
GC_200 = Coupling(name = 'GC_200',
	 value = '(ZA11*(ZUL11*(ZUR11*complexconjugate(Yu11) + ZUR12*complexconjugate(Yu21) + ZUR13*complexconjugate(Yu31)) + ZUL12*(ZUR11*complexconjugate(Yu12) + ZUR12*complexconjugate(Yu22) + ZUR13*complexconjugate(Yu32)) + ZUL13*(ZUR11*complexconjugate(Yu13) + ZUR12*complexconjugate(Yu23) + ZUR13*complexconjugate(Yu33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_201 = Coupling(name = 'GC_201',
	 value = '-((ZA21*(complexconjugate(ZUL11)*(Yu11*complexconjugate(ZUR11) + Yu21*complexconjugate(ZUR12) + Yu31*complexconjugate(ZUR13)) + complexconjugate(ZUL12)*(Yu12*complexconjugate(ZUR11) + Yu22*complexconjugate(ZUR12) + Yu32*complexconjugate(ZUR13)) + complexconjugate(ZUL13)*(Yu13*complexconjugate(ZUR11) + Yu23*complexconjugate(ZUR12) + Yu33*complexconjugate(ZUR13))))/cmath.sqrt(2))', 
	 order = {'QED':1} ) 
 
GC_202 = Coupling(name = 'GC_202',
	 value = '(ZA21*(ZUL11*(ZUR11*complexconjugate(Yu11) + ZUR12*complexconjugate(Yu21) + ZUR13*complexconjugate(Yu31)) + ZUL12*(ZUR11*complexconjugate(Yu12) + ZUR12*complexconjugate(Yu22) + ZUR13*complexconjugate(Yu32)) + ZUL13*(ZUR11*complexconjugate(Yu13) + ZUR12*complexconjugate(Yu23) + ZUR13*complexconjugate(Yu33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_203 = Coupling(name = 'GC_203',
	 value = '-((ZA11*(complexconjugate(ZUL21)*(Yu11*complexconjugate(ZUR11) + Yu21*complexconjugate(ZUR12) + Yu31*complexconjugate(ZUR13)) + complexconjugate(ZUL22)*(Yu12*complexconjugate(ZUR11) + Yu22*complexconjugate(ZUR12) + Yu32*complexconjugate(ZUR13)) + complexconjugate(ZUL23)*(Yu13*complexconjugate(ZUR11) + Yu23*complexconjugate(ZUR12) + Yu33*complexconjugate(ZUR13))))/cmath.sqrt(2))', 
	 order = {'QED':1} ) 
 
GC_204 = Coupling(name = 'GC_204',
	 value = '(ZA11*(ZUL11*(ZUR21*complexconjugate(Yu11) + ZUR22*complexconjugate(Yu21) + ZUR23*complexconjugate(Yu31)) + ZUL12*(ZUR21*complexconjugate(Yu12) + ZUR22*complexconjugate(Yu22) + ZUR23*complexconjugate(Yu32)) + ZUL13*(ZUR21*complexconjugate(Yu13) + ZUR22*complexconjugate(Yu23) + ZUR23*complexconjugate(Yu33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_205 = Coupling(name = 'GC_205',
	 value = '-((ZA21*(complexconjugate(ZUL21)*(Yu11*complexconjugate(ZUR11) + Yu21*complexconjugate(ZUR12) + Yu31*complexconjugate(ZUR13)) + complexconjugate(ZUL22)*(Yu12*complexconjugate(ZUR11) + Yu22*complexconjugate(ZUR12) + Yu32*complexconjugate(ZUR13)) + complexconjugate(ZUL23)*(Yu13*complexconjugate(ZUR11) + Yu23*complexconjugate(ZUR12) + Yu33*complexconjugate(ZUR13))))/cmath.sqrt(2))', 
	 order = {'QED':1} ) 
 
GC_206 = Coupling(name = 'GC_206',
	 value = '(ZA21*(ZUL11*(ZUR21*complexconjugate(Yu11) + ZUR22*complexconjugate(Yu21) + ZUR23*complexconjugate(Yu31)) + ZUL12*(ZUR21*complexconjugate(Yu12) + ZUR22*complexconjugate(Yu22) + ZUR23*complexconjugate(Yu32)) + ZUL13*(ZUR21*complexconjugate(Yu13) + ZUR22*complexconjugate(Yu23) + ZUR23*complexconjugate(Yu33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_207 = Coupling(name = 'GC_207',
	 value = '-((ZA11*(complexconjugate(ZUL31)*(Yu11*complexconjugate(ZUR11) + Yu21*complexconjugate(ZUR12) + Yu31*complexconjugate(ZUR13)) + complexconjugate(ZUL32)*(Yu12*complexconjugate(ZUR11) + Yu22*complexconjugate(ZUR12) + Yu32*complexconjugate(ZUR13)) + complexconjugate(ZUL33)*(Yu13*complexconjugate(ZUR11) + Yu23*complexconjugate(ZUR12) + Yu33*complexconjugate(ZUR13))))/cmath.sqrt(2))', 
	 order = {'QED':1} ) 
 
GC_208 = Coupling(name = 'GC_208',
	 value = '(ZA11*(ZUL11*(ZUR31*complexconjugate(Yu11) + ZUR32*complexconjugate(Yu21) + ZUR33*complexconjugate(Yu31)) + ZUL12*(ZUR31*complexconjugate(Yu12) + ZUR32*complexconjugate(Yu22) + ZUR33*complexconjugate(Yu32)) + ZUL13*(ZUR31*complexconjugate(Yu13) + ZUR32*complexconjugate(Yu23) + ZUR33*complexconjugate(Yu33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_209 = Coupling(name = 'GC_209',
	 value = '-((ZA21*(complexconjugate(ZUL31)*(Yu11*complexconjugate(ZUR11) + Yu21*complexconjugate(ZUR12) + Yu31*complexconjugate(ZUR13)) + complexconjugate(ZUL32)*(Yu12*complexconjugate(ZUR11) + Yu22*complexconjugate(ZUR12) + Yu32*complexconjugate(ZUR13)) + complexconjugate(ZUL33)*(Yu13*complexconjugate(ZUR11) + Yu23*complexconjugate(ZUR12) + Yu33*complexconjugate(ZUR13))))/cmath.sqrt(2))', 
	 order = {'QED':1} ) 
 
GC_210 = Coupling(name = 'GC_210',
	 value = '(ZA21*(ZUL11*(ZUR31*complexconjugate(Yu11) + ZUR32*complexconjugate(Yu21) + ZUR33*complexconjugate(Yu31)) + ZUL12*(ZUR31*complexconjugate(Yu12) + ZUR32*complexconjugate(Yu22) + ZUR33*complexconjugate(Yu32)) + ZUL13*(ZUR31*complexconjugate(Yu13) + ZUR32*complexconjugate(Yu23) + ZUR33*complexconjugate(Yu33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_211 = Coupling(name = 'GC_211',
	 value = '-((ZA11*(complexconjugate(ZUL11)*(Yu11*complexconjugate(ZUR21) + Yu21*complexconjugate(ZUR22) + Yu31*complexconjugate(ZUR23)) + complexconjugate(ZUL12)*(Yu12*complexconjugate(ZUR21) + Yu22*complexconjugate(ZUR22) + Yu32*complexconjugate(ZUR23)) + complexconjugate(ZUL13)*(Yu13*complexconjugate(ZUR21) + Yu23*complexconjugate(ZUR22) + Yu33*complexconjugate(ZUR23))))/cmath.sqrt(2))', 
	 order = {'QED':1} ) 
 
GC_212 = Coupling(name = 'GC_212',
	 value = '(ZA11*(ZUL21*(ZUR11*complexconjugate(Yu11) + ZUR12*complexconjugate(Yu21) + ZUR13*complexconjugate(Yu31)) + ZUL22*(ZUR11*complexconjugate(Yu12) + ZUR12*complexconjugate(Yu22) + ZUR13*complexconjugate(Yu32)) + ZUL23*(ZUR11*complexconjugate(Yu13) + ZUR12*complexconjugate(Yu23) + ZUR13*complexconjugate(Yu33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_213 = Coupling(name = 'GC_213',
	 value = '-((ZA21*(complexconjugate(ZUL11)*(Yu11*complexconjugate(ZUR21) + Yu21*complexconjugate(ZUR22) + Yu31*complexconjugate(ZUR23)) + complexconjugate(ZUL12)*(Yu12*complexconjugate(ZUR21) + Yu22*complexconjugate(ZUR22) + Yu32*complexconjugate(ZUR23)) + complexconjugate(ZUL13)*(Yu13*complexconjugate(ZUR21) + Yu23*complexconjugate(ZUR22) + Yu33*complexconjugate(ZUR23))))/cmath.sqrt(2))', 
	 order = {'QED':1} ) 
 
GC_214 = Coupling(name = 'GC_214',
	 value = '(ZA21*(ZUL21*(ZUR11*complexconjugate(Yu11) + ZUR12*complexconjugate(Yu21) + ZUR13*complexconjugate(Yu31)) + ZUL22*(ZUR11*complexconjugate(Yu12) + ZUR12*complexconjugate(Yu22) + ZUR13*complexconjugate(Yu32)) + ZUL23*(ZUR11*complexconjugate(Yu13) + ZUR12*complexconjugate(Yu23) + ZUR13*complexconjugate(Yu33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_215 = Coupling(name = 'GC_215',
	 value = '-((ZA11*(complexconjugate(ZUL21)*(Yu11*complexconjugate(ZUR21) + Yu21*complexconjugate(ZUR22) + Yu31*complexconjugate(ZUR23)) + complexconjugate(ZUL22)*(Yu12*complexconjugate(ZUR21) + Yu22*complexconjugate(ZUR22) + Yu32*complexconjugate(ZUR23)) + complexconjugate(ZUL23)*(Yu13*complexconjugate(ZUR21) + Yu23*complexconjugate(ZUR22) + Yu33*complexconjugate(ZUR23))))/cmath.sqrt(2))', 
	 order = {'QED':1} ) 
 
GC_216 = Coupling(name = 'GC_216',
	 value = '(ZA11*(ZUL21*(ZUR21*complexconjugate(Yu11) + ZUR22*complexconjugate(Yu21) + ZUR23*complexconjugate(Yu31)) + ZUL22*(ZUR21*complexconjugate(Yu12) + ZUR22*complexconjugate(Yu22) + ZUR23*complexconjugate(Yu32)) + ZUL23*(ZUR21*complexconjugate(Yu13) + ZUR22*complexconjugate(Yu23) + ZUR23*complexconjugate(Yu33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_217 = Coupling(name = 'GC_217',
	 value = '-((ZA21*(complexconjugate(ZUL21)*(Yu11*complexconjugate(ZUR21) + Yu21*complexconjugate(ZUR22) + Yu31*complexconjugate(ZUR23)) + complexconjugate(ZUL22)*(Yu12*complexconjugate(ZUR21) + Yu22*complexconjugate(ZUR22) + Yu32*complexconjugate(ZUR23)) + complexconjugate(ZUL23)*(Yu13*complexconjugate(ZUR21) + Yu23*complexconjugate(ZUR22) + Yu33*complexconjugate(ZUR23))))/cmath.sqrt(2))', 
	 order = {'QED':1} ) 
 
GC_218 = Coupling(name = 'GC_218',
	 value = '(ZA21*(ZUL21*(ZUR21*complexconjugate(Yu11) + ZUR22*complexconjugate(Yu21) + ZUR23*complexconjugate(Yu31)) + ZUL22*(ZUR21*complexconjugate(Yu12) + ZUR22*complexconjugate(Yu22) + ZUR23*complexconjugate(Yu32)) + ZUL23*(ZUR21*complexconjugate(Yu13) + ZUR22*complexconjugate(Yu23) + ZUR23*complexconjugate(Yu33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_219 = Coupling(name = 'GC_219',
	 value = '-((ZA11*(complexconjugate(ZUL31)*(Yu11*complexconjugate(ZUR21) + Yu21*complexconjugate(ZUR22) + Yu31*complexconjugate(ZUR23)) + complexconjugate(ZUL32)*(Yu12*complexconjugate(ZUR21) + Yu22*complexconjugate(ZUR22) + Yu32*complexconjugate(ZUR23)) + complexconjugate(ZUL33)*(Yu13*complexconjugate(ZUR21) + Yu23*complexconjugate(ZUR22) + Yu33*complexconjugate(ZUR23))))/cmath.sqrt(2))', 
	 order = {'QED':1} ) 
 
GC_220 = Coupling(name = 'GC_220',
	 value = '(ZA11*(ZUL21*(ZUR31*complexconjugate(Yu11) + ZUR32*complexconjugate(Yu21) + ZUR33*complexconjugate(Yu31)) + ZUL22*(ZUR31*complexconjugate(Yu12) + ZUR32*complexconjugate(Yu22) + ZUR33*complexconjugate(Yu32)) + ZUL23*(ZUR31*complexconjugate(Yu13) + ZUR32*complexconjugate(Yu23) + ZUR33*complexconjugate(Yu33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_221 = Coupling(name = 'GC_221',
	 value = '-((ZA21*(complexconjugate(ZUL31)*(Yu11*complexconjugate(ZUR21) + Yu21*complexconjugate(ZUR22) + Yu31*complexconjugate(ZUR23)) + complexconjugate(ZUL32)*(Yu12*complexconjugate(ZUR21) + Yu22*complexconjugate(ZUR22) + Yu32*complexconjugate(ZUR23)) + complexconjugate(ZUL33)*(Yu13*complexconjugate(ZUR21) + Yu23*complexconjugate(ZUR22) + Yu33*complexconjugate(ZUR23))))/cmath.sqrt(2))', 
	 order = {'QED':1} ) 
 
GC_222 = Coupling(name = 'GC_222',
	 value = '(ZA21*(ZUL21*(ZUR31*complexconjugate(Yu11) + ZUR32*complexconjugate(Yu21) + ZUR33*complexconjugate(Yu31)) + ZUL22*(ZUR31*complexconjugate(Yu12) + ZUR32*complexconjugate(Yu22) + ZUR33*complexconjugate(Yu32)) + ZUL23*(ZUR31*complexconjugate(Yu13) + ZUR32*complexconjugate(Yu23) + ZUR33*complexconjugate(Yu33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_223 = Coupling(name = 'GC_223',
	 value = '-((ZA11*(complexconjugate(ZUL11)*(Yu11*complexconjugate(ZUR31) + Yu21*complexconjugate(ZUR32) + Yu31*complexconjugate(ZUR33)) + complexconjugate(ZUL12)*(Yu12*complexconjugate(ZUR31) + Yu22*complexconjugate(ZUR32) + Yu32*complexconjugate(ZUR33)) + complexconjugate(ZUL13)*(Yu13*complexconjugate(ZUR31) + Yu23*complexconjugate(ZUR32) + Yu33*complexconjugate(ZUR33))))/cmath.sqrt(2))', 
	 order = {'QED':1} ) 
 
GC_224 = Coupling(name = 'GC_224',
	 value = '(ZA11*(ZUL31*(ZUR11*complexconjugate(Yu11) + ZUR12*complexconjugate(Yu21) + ZUR13*complexconjugate(Yu31)) + ZUL32*(ZUR11*complexconjugate(Yu12) + ZUR12*complexconjugate(Yu22) + ZUR13*complexconjugate(Yu32)) + ZUL33*(ZUR11*complexconjugate(Yu13) + ZUR12*complexconjugate(Yu23) + ZUR13*complexconjugate(Yu33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_225 = Coupling(name = 'GC_225',
	 value = '-((ZA21*(complexconjugate(ZUL11)*(Yu11*complexconjugate(ZUR31) + Yu21*complexconjugate(ZUR32) + Yu31*complexconjugate(ZUR33)) + complexconjugate(ZUL12)*(Yu12*complexconjugate(ZUR31) + Yu22*complexconjugate(ZUR32) + Yu32*complexconjugate(ZUR33)) + complexconjugate(ZUL13)*(Yu13*complexconjugate(ZUR31) + Yu23*complexconjugate(ZUR32) + Yu33*complexconjugate(ZUR33))))/cmath.sqrt(2))', 
	 order = {'QED':1} ) 
 
GC_226 = Coupling(name = 'GC_226',
	 value = '(ZA21*(ZUL31*(ZUR11*complexconjugate(Yu11) + ZUR12*complexconjugate(Yu21) + ZUR13*complexconjugate(Yu31)) + ZUL32*(ZUR11*complexconjugate(Yu12) + ZUR12*complexconjugate(Yu22) + ZUR13*complexconjugate(Yu32)) + ZUL33*(ZUR11*complexconjugate(Yu13) + ZUR12*complexconjugate(Yu23) + ZUR13*complexconjugate(Yu33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_227 = Coupling(name = 'GC_227',
	 value = '-((ZA11*(complexconjugate(ZUL21)*(Yu11*complexconjugate(ZUR31) + Yu21*complexconjugate(ZUR32) + Yu31*complexconjugate(ZUR33)) + complexconjugate(ZUL22)*(Yu12*complexconjugate(ZUR31) + Yu22*complexconjugate(ZUR32) + Yu32*complexconjugate(ZUR33)) + complexconjugate(ZUL23)*(Yu13*complexconjugate(ZUR31) + Yu23*complexconjugate(ZUR32) + Yu33*complexconjugate(ZUR33))))/cmath.sqrt(2))', 
	 order = {'QED':1} ) 
 
GC_228 = Coupling(name = 'GC_228',
	 value = '(ZA11*(ZUL31*(ZUR21*complexconjugate(Yu11) + ZUR22*complexconjugate(Yu21) + ZUR23*complexconjugate(Yu31)) + ZUL32*(ZUR21*complexconjugate(Yu12) + ZUR22*complexconjugate(Yu22) + ZUR23*complexconjugate(Yu32)) + ZUL33*(ZUR21*complexconjugate(Yu13) + ZUR22*complexconjugate(Yu23) + ZUR23*complexconjugate(Yu33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_229 = Coupling(name = 'GC_229',
	 value = '-((ZA21*(complexconjugate(ZUL21)*(Yu11*complexconjugate(ZUR31) + Yu21*complexconjugate(ZUR32) + Yu31*complexconjugate(ZUR33)) + complexconjugate(ZUL22)*(Yu12*complexconjugate(ZUR31) + Yu22*complexconjugate(ZUR32) + Yu32*complexconjugate(ZUR33)) + complexconjugate(ZUL23)*(Yu13*complexconjugate(ZUR31) + Yu23*complexconjugate(ZUR32) + Yu33*complexconjugate(ZUR33))))/cmath.sqrt(2))', 
	 order = {'QED':1} ) 
 
GC_230 = Coupling(name = 'GC_230',
	 value = '(ZA21*(ZUL31*(ZUR21*complexconjugate(Yu11) + ZUR22*complexconjugate(Yu21) + ZUR23*complexconjugate(Yu31)) + ZUL32*(ZUR21*complexconjugate(Yu12) + ZUR22*complexconjugate(Yu22) + ZUR23*complexconjugate(Yu32)) + ZUL33*(ZUR21*complexconjugate(Yu13) + ZUR22*complexconjugate(Yu23) + ZUR23*complexconjugate(Yu33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_231 = Coupling(name = 'GC_231',
	 value = '-((ZA11*(complexconjugate(ZUL31)*(Yu11*complexconjugate(ZUR31) + Yu21*complexconjugate(ZUR32) + Yu31*complexconjugate(ZUR33)) + complexconjugate(ZUL32)*(Yu12*complexconjugate(ZUR31) + Yu22*complexconjugate(ZUR32) + Yu32*complexconjugate(ZUR33)) + complexconjugate(ZUL33)*(Yu13*complexconjugate(ZUR31) + Yu23*complexconjugate(ZUR32) + Yu33*complexconjugate(ZUR33))))/cmath.sqrt(2))', 
	 order = {'QED':1} ) 
 
GC_232 = Coupling(name = 'GC_232',
	 value = '(ZA11*(ZUL31*(ZUR31*complexconjugate(Yu11) + ZUR32*complexconjugate(Yu21) + ZUR33*complexconjugate(Yu31)) + ZUL32*(ZUR31*complexconjugate(Yu12) + ZUR32*complexconjugate(Yu22) + ZUR33*complexconjugate(Yu32)) + ZUL33*(ZUR31*complexconjugate(Yu13) + ZUR32*complexconjugate(Yu23) + ZUR33*complexconjugate(Yu33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_233 = Coupling(name = 'GC_233',
	 value = '-((ZA21*(complexconjugate(ZUL31)*(Yu11*complexconjugate(ZUR31) + Yu21*complexconjugate(ZUR32) + Yu31*complexconjugate(ZUR33)) + complexconjugate(ZUL32)*(Yu12*complexconjugate(ZUR31) + Yu22*complexconjugate(ZUR32) + Yu32*complexconjugate(ZUR33)) + complexconjugate(ZUL33)*(Yu13*complexconjugate(ZUR31) + Yu23*complexconjugate(ZUR32) + Yu33*complexconjugate(ZUR33))))/cmath.sqrt(2))', 
	 order = {'QED':1} ) 
 
GC_234 = Coupling(name = 'GC_234',
	 value = '(ZA21*(ZUL31*(ZUR31*complexconjugate(Yu11) + ZUR32*complexconjugate(Yu21) + ZUR33*complexconjugate(Yu31)) + ZUL32*(ZUR31*complexconjugate(Yu12) + ZUR32*complexconjugate(Yu22) + ZUR33*complexconjugate(Yu32)) + ZUL33*(ZUR31*complexconjugate(Yu13) + ZUR32*complexconjugate(Yu23) + ZUR33*complexconjugate(Yu33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_235 = Coupling(name = 'GC_235',
	 value = '(-2*ZA11*((Yv11*complexconjugate(UV11) + Yv21*complexconjugate(UV12) + Yv31*complexconjugate(UV13))*complexconjugate(UV14) + (Yv12*complexconjugate(UV11) + Yv22*complexconjugate(UV12) + Yv32*complexconjugate(UV13))*complexconjugate(UV15) + (Yv13*complexconjugate(UV11) + Yv23*complexconjugate(UV12) + Yv33*complexconjugate(UV13))*complexconjugate(UV16)) + ZA12*(2*complexconjugate(UV14)*(Yx11*complexconjugate(UV14) + Yx21*complexconjugate(UV15) + Yx31*complexconjugate(UV16)) + 2*complexconjugate(UV15)*(Yx12*complexconjugate(UV14) + Yx22*complexconjugate(UV15) + Yx32*complexconjugate(UV16)) + 2*complexconjugate(UV16)*(Yx13*complexconjugate(UV14) + Yx23*complexconjugate(UV15) + Yx33*complexconjugate(UV16))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_236 = Coupling(name = 'GC_236',
	 value = '(2*ZA11*(UV14*(UV11*complexconjugate(Yv11) + UV12*complexconjugate(Yv21) + UV13*complexconjugate(Yv31)) + UV15*(UV11*complexconjugate(Yv12) + UV12*complexconjugate(Yv22) + UV13*complexconjugate(Yv32)) + UV16*(UV11*complexconjugate(Yv13) + UV12*complexconjugate(Yv23) + UV13*complexconjugate(Yv33))) - ZA12*(2*UV14*(UV14*complexconjugate(Yx11) + UV15*complexconjugate(Yx21) + UV16*complexconjugate(Yx31)) + 2*UV15*(UV14*complexconjugate(Yx12) + UV15*complexconjugate(Yx22) + UV16*complexconjugate(Yx32)) + 2*UV16*(UV14*complexconjugate(Yx13) + UV15*complexconjugate(Yx23) + UV16*complexconjugate(Yx33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_237 = Coupling(name = 'GC_237',
	 value = '(-2*ZA21*((Yv11*complexconjugate(UV11) + Yv21*complexconjugate(UV12) + Yv31*complexconjugate(UV13))*complexconjugate(UV14) + (Yv12*complexconjugate(UV11) + Yv22*complexconjugate(UV12) + Yv32*complexconjugate(UV13))*complexconjugate(UV15) + (Yv13*complexconjugate(UV11) + Yv23*complexconjugate(UV12) + Yv33*complexconjugate(UV13))*complexconjugate(UV16)) + ZA22*(2*complexconjugate(UV14)*(Yx11*complexconjugate(UV14) + Yx21*complexconjugate(UV15) + Yx31*complexconjugate(UV16)) + 2*complexconjugate(UV15)*(Yx12*complexconjugate(UV14) + Yx22*complexconjugate(UV15) + Yx32*complexconjugate(UV16)) + 2*complexconjugate(UV16)*(Yx13*complexconjugate(UV14) + Yx23*complexconjugate(UV15) + Yx33*complexconjugate(UV16))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_238 = Coupling(name = 'GC_238',
	 value = '(2*ZA21*(UV14*(UV11*complexconjugate(Yv11) + UV12*complexconjugate(Yv21) + UV13*complexconjugate(Yv31)) + UV15*(UV11*complexconjugate(Yv12) + UV12*complexconjugate(Yv22) + UV13*complexconjugate(Yv32)) + UV16*(UV11*complexconjugate(Yv13) + UV12*complexconjugate(Yv23) + UV13*complexconjugate(Yv33))) - ZA22*(2*UV14*(UV14*complexconjugate(Yx11) + UV15*complexconjugate(Yx21) + UV16*complexconjugate(Yx31)) + 2*UV15*(UV14*complexconjugate(Yx12) + UV15*complexconjugate(Yx22) + UV16*complexconjugate(Yx32)) + 2*UV16*(UV14*complexconjugate(Yx13) + UV15*complexconjugate(Yx23) + UV16*complexconjugate(Yx33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_239 = Coupling(name = 'GC_239',
	 value = '(-(ZA11*(complexconjugate(UV14)*(Yv11*complexconjugate(UV21) + Yv21*complexconjugate(UV22) + Yv31*complexconjugate(UV23)) + complexconjugate(UV15)*(Yv12*complexconjugate(UV21) + Yv22*complexconjugate(UV22) + Yv32*complexconjugate(UV23)) + complexconjugate(UV16)*(Yv13*complexconjugate(UV21) + Yv23*complexconjugate(UV22) + Yv33*complexconjugate(UV23)))) - ZA11*((Yv11*complexconjugate(UV11) + Yv21*complexconjugate(UV12) + Yv31*complexconjugate(UV13))*complexconjugate(UV24) + (Yv12*complexconjugate(UV11) + Yv22*complexconjugate(UV12) + Yv32*complexconjugate(UV13))*complexconjugate(UV25) + (Yv13*complexconjugate(UV11) + Yv23*complexconjugate(UV12) + Yv33*complexconjugate(UV13))*complexconjugate(UV26)) + ZA12*((Yx11*complexconjugate(UV14) + Yx21*complexconjugate(UV15) + Yx31*complexconjugate(UV16))*complexconjugate(UV24) + (Yx12*complexconjugate(UV14) + Yx22*complexconjugate(UV15) + Yx32*complexconjugate(UV16))*complexconjugate(UV25) + (Yx13*complexconjugate(UV14) + Yx23*complexconjugate(UV15) + Yx33*complexconjugate(UV16))*complexconjugate(UV26) + complexconjugate(UV14)*(Yx11*complexconjugate(UV24) + Yx21*complexconjugate(UV25) + Yx31*complexconjugate(UV26)) + complexconjugate(UV15)*(Yx12*complexconjugate(UV24) + Yx22*complexconjugate(UV25) + Yx32*complexconjugate(UV26)) + complexconjugate(UV16)*(Yx13*complexconjugate(UV24) + Yx23*complexconjugate(UV25) + Yx33*complexconjugate(UV26))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_240 = Coupling(name = 'GC_240',
	 value = '(ZA11*(UV24*(UV11*complexconjugate(Yv11) + UV12*complexconjugate(Yv21) + UV13*complexconjugate(Yv31)) + UV25*(UV11*complexconjugate(Yv12) + UV12*complexconjugate(Yv22) + UV13*complexconjugate(Yv32)) + UV26*(UV11*complexconjugate(Yv13) + UV12*complexconjugate(Yv23) + UV13*complexconjugate(Yv33))) + ZA11*(UV14*(UV21*complexconjugate(Yv11) + UV22*complexconjugate(Yv21) + UV23*complexconjugate(Yv31)) + UV15*(UV21*complexconjugate(Yv12) + UV22*complexconjugate(Yv22) + UV23*complexconjugate(Yv32)) + UV16*(UV21*complexconjugate(Yv13) + UV22*complexconjugate(Yv23) + UV23*complexconjugate(Yv33))) - ZA12*(UV24*(UV14*complexconjugate(Yx11) + UV15*complexconjugate(Yx21) + UV16*complexconjugate(Yx31)) + UV14*(UV24*complexconjugate(Yx11) + UV25*complexconjugate(Yx21) + UV26*complexconjugate(Yx31)) + UV25*(UV14*complexconjugate(Yx12) + UV15*complexconjugate(Yx22) + UV16*complexconjugate(Yx32)) + UV15*(UV24*complexconjugate(Yx12) + UV25*complexconjugate(Yx22) + UV26*complexconjugate(Yx32)) + UV26*(UV14*complexconjugate(Yx13) + UV15*complexconjugate(Yx23) + UV16*complexconjugate(Yx33)) + UV16*(UV24*complexconjugate(Yx13) + UV25*complexconjugate(Yx23) + UV26*complexconjugate(Yx33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_241 = Coupling(name = 'GC_241',
	 value = '(-(ZA21*(complexconjugate(UV14)*(Yv11*complexconjugate(UV21) + Yv21*complexconjugate(UV22) + Yv31*complexconjugate(UV23)) + complexconjugate(UV15)*(Yv12*complexconjugate(UV21) + Yv22*complexconjugate(UV22) + Yv32*complexconjugate(UV23)) + complexconjugate(UV16)*(Yv13*complexconjugate(UV21) + Yv23*complexconjugate(UV22) + Yv33*complexconjugate(UV23)))) - ZA21*((Yv11*complexconjugate(UV11) + Yv21*complexconjugate(UV12) + Yv31*complexconjugate(UV13))*complexconjugate(UV24) + (Yv12*complexconjugate(UV11) + Yv22*complexconjugate(UV12) + Yv32*complexconjugate(UV13))*complexconjugate(UV25) + (Yv13*complexconjugate(UV11) + Yv23*complexconjugate(UV12) + Yv33*complexconjugate(UV13))*complexconjugate(UV26)) + ZA22*((Yx11*complexconjugate(UV14) + Yx21*complexconjugate(UV15) + Yx31*complexconjugate(UV16))*complexconjugate(UV24) + (Yx12*complexconjugate(UV14) + Yx22*complexconjugate(UV15) + Yx32*complexconjugate(UV16))*complexconjugate(UV25) + (Yx13*complexconjugate(UV14) + Yx23*complexconjugate(UV15) + Yx33*complexconjugate(UV16))*complexconjugate(UV26) + complexconjugate(UV14)*(Yx11*complexconjugate(UV24) + Yx21*complexconjugate(UV25) + Yx31*complexconjugate(UV26)) + complexconjugate(UV15)*(Yx12*complexconjugate(UV24) + Yx22*complexconjugate(UV25) + Yx32*complexconjugate(UV26)) + complexconjugate(UV16)*(Yx13*complexconjugate(UV24) + Yx23*complexconjugate(UV25) + Yx33*complexconjugate(UV26))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_242 = Coupling(name = 'GC_242',
	 value = '(ZA21*(UV24*(UV11*complexconjugate(Yv11) + UV12*complexconjugate(Yv21) + UV13*complexconjugate(Yv31)) + UV25*(UV11*complexconjugate(Yv12) + UV12*complexconjugate(Yv22) + UV13*complexconjugate(Yv32)) + UV26*(UV11*complexconjugate(Yv13) + UV12*complexconjugate(Yv23) + UV13*complexconjugate(Yv33))) + ZA21*(UV14*(UV21*complexconjugate(Yv11) + UV22*complexconjugate(Yv21) + UV23*complexconjugate(Yv31)) + UV15*(UV21*complexconjugate(Yv12) + UV22*complexconjugate(Yv22) + UV23*complexconjugate(Yv32)) + UV16*(UV21*complexconjugate(Yv13) + UV22*complexconjugate(Yv23) + UV23*complexconjugate(Yv33))) - ZA22*(UV24*(UV14*complexconjugate(Yx11) + UV15*complexconjugate(Yx21) + UV16*complexconjugate(Yx31)) + UV14*(UV24*complexconjugate(Yx11) + UV25*complexconjugate(Yx21) + UV26*complexconjugate(Yx31)) + UV25*(UV14*complexconjugate(Yx12) + UV15*complexconjugate(Yx22) + UV16*complexconjugate(Yx32)) + UV15*(UV24*complexconjugate(Yx12) + UV25*complexconjugate(Yx22) + UV26*complexconjugate(Yx32)) + UV26*(UV14*complexconjugate(Yx13) + UV15*complexconjugate(Yx23) + UV16*complexconjugate(Yx33)) + UV16*(UV24*complexconjugate(Yx13) + UV25*complexconjugate(Yx23) + UV26*complexconjugate(Yx33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_243 = Coupling(name = 'GC_243',
	 value = '(-(ZA11*(complexconjugate(UV14)*(Yv11*complexconjugate(UV31) + Yv21*complexconjugate(UV32) + Yv31*complexconjugate(UV33)) + complexconjugate(UV15)*(Yv12*complexconjugate(UV31) + Yv22*complexconjugate(UV32) + Yv32*complexconjugate(UV33)) + complexconjugate(UV16)*(Yv13*complexconjugate(UV31) + Yv23*complexconjugate(UV32) + Yv33*complexconjugate(UV33)))) - ZA11*((Yv11*complexconjugate(UV11) + Yv21*complexconjugate(UV12) + Yv31*complexconjugate(UV13))*complexconjugate(UV34) + (Yv12*complexconjugate(UV11) + Yv22*complexconjugate(UV12) + Yv32*complexconjugate(UV13))*complexconjugate(UV35) + (Yv13*complexconjugate(UV11) + Yv23*complexconjugate(UV12) + Yv33*complexconjugate(UV13))*complexconjugate(UV36)) + ZA12*((Yx11*complexconjugate(UV14) + Yx21*complexconjugate(UV15) + Yx31*complexconjugate(UV16))*complexconjugate(UV34) + (Yx12*complexconjugate(UV14) + Yx22*complexconjugate(UV15) + Yx32*complexconjugate(UV16))*complexconjugate(UV35) + (Yx13*complexconjugate(UV14) + Yx23*complexconjugate(UV15) + Yx33*complexconjugate(UV16))*complexconjugate(UV36) + complexconjugate(UV14)*(Yx11*complexconjugate(UV34) + Yx21*complexconjugate(UV35) + Yx31*complexconjugate(UV36)) + complexconjugate(UV15)*(Yx12*complexconjugate(UV34) + Yx22*complexconjugate(UV35) + Yx32*complexconjugate(UV36)) + complexconjugate(UV16)*(Yx13*complexconjugate(UV34) + Yx23*complexconjugate(UV35) + Yx33*complexconjugate(UV36))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_244 = Coupling(name = 'GC_244',
	 value = '(ZA11*(UV34*(UV11*complexconjugate(Yv11) + UV12*complexconjugate(Yv21) + UV13*complexconjugate(Yv31)) + UV35*(UV11*complexconjugate(Yv12) + UV12*complexconjugate(Yv22) + UV13*complexconjugate(Yv32)) + UV36*(UV11*complexconjugate(Yv13) + UV12*complexconjugate(Yv23) + UV13*complexconjugate(Yv33))) + ZA11*(UV14*(UV31*complexconjugate(Yv11) + UV32*complexconjugate(Yv21) + UV33*complexconjugate(Yv31)) + UV15*(UV31*complexconjugate(Yv12) + UV32*complexconjugate(Yv22) + UV33*complexconjugate(Yv32)) + UV16*(UV31*complexconjugate(Yv13) + UV32*complexconjugate(Yv23) + UV33*complexconjugate(Yv33))) - ZA12*(UV34*(UV14*complexconjugate(Yx11) + UV15*complexconjugate(Yx21) + UV16*complexconjugate(Yx31)) + UV14*(UV34*complexconjugate(Yx11) + UV35*complexconjugate(Yx21) + UV36*complexconjugate(Yx31)) + UV35*(UV14*complexconjugate(Yx12) + UV15*complexconjugate(Yx22) + UV16*complexconjugate(Yx32)) + UV15*(UV34*complexconjugate(Yx12) + UV35*complexconjugate(Yx22) + UV36*complexconjugate(Yx32)) + UV36*(UV14*complexconjugate(Yx13) + UV15*complexconjugate(Yx23) + UV16*complexconjugate(Yx33)) + UV16*(UV34*complexconjugate(Yx13) + UV35*complexconjugate(Yx23) + UV36*complexconjugate(Yx33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_245 = Coupling(name = 'GC_245',
	 value = '(-(ZA21*(complexconjugate(UV14)*(Yv11*complexconjugate(UV31) + Yv21*complexconjugate(UV32) + Yv31*complexconjugate(UV33)) + complexconjugate(UV15)*(Yv12*complexconjugate(UV31) + Yv22*complexconjugate(UV32) + Yv32*complexconjugate(UV33)) + complexconjugate(UV16)*(Yv13*complexconjugate(UV31) + Yv23*complexconjugate(UV32) + Yv33*complexconjugate(UV33)))) - ZA21*((Yv11*complexconjugate(UV11) + Yv21*complexconjugate(UV12) + Yv31*complexconjugate(UV13))*complexconjugate(UV34) + (Yv12*complexconjugate(UV11) + Yv22*complexconjugate(UV12) + Yv32*complexconjugate(UV13))*complexconjugate(UV35) + (Yv13*complexconjugate(UV11) + Yv23*complexconjugate(UV12) + Yv33*complexconjugate(UV13))*complexconjugate(UV36)) + ZA22*((Yx11*complexconjugate(UV14) + Yx21*complexconjugate(UV15) + Yx31*complexconjugate(UV16))*complexconjugate(UV34) + (Yx12*complexconjugate(UV14) + Yx22*complexconjugate(UV15) + Yx32*complexconjugate(UV16))*complexconjugate(UV35) + (Yx13*complexconjugate(UV14) + Yx23*complexconjugate(UV15) + Yx33*complexconjugate(UV16))*complexconjugate(UV36) + complexconjugate(UV14)*(Yx11*complexconjugate(UV34) + Yx21*complexconjugate(UV35) + Yx31*complexconjugate(UV36)) + complexconjugate(UV15)*(Yx12*complexconjugate(UV34) + Yx22*complexconjugate(UV35) + Yx32*complexconjugate(UV36)) + complexconjugate(UV16)*(Yx13*complexconjugate(UV34) + Yx23*complexconjugate(UV35) + Yx33*complexconjugate(UV36))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_246 = Coupling(name = 'GC_246',
	 value = '(ZA21*(UV34*(UV11*complexconjugate(Yv11) + UV12*complexconjugate(Yv21) + UV13*complexconjugate(Yv31)) + UV35*(UV11*complexconjugate(Yv12) + UV12*complexconjugate(Yv22) + UV13*complexconjugate(Yv32)) + UV36*(UV11*complexconjugate(Yv13) + UV12*complexconjugate(Yv23) + UV13*complexconjugate(Yv33))) + ZA21*(UV14*(UV31*complexconjugate(Yv11) + UV32*complexconjugate(Yv21) + UV33*complexconjugate(Yv31)) + UV15*(UV31*complexconjugate(Yv12) + UV32*complexconjugate(Yv22) + UV33*complexconjugate(Yv32)) + UV16*(UV31*complexconjugate(Yv13) + UV32*complexconjugate(Yv23) + UV33*complexconjugate(Yv33))) - ZA22*(UV34*(UV14*complexconjugate(Yx11) + UV15*complexconjugate(Yx21) + UV16*complexconjugate(Yx31)) + UV14*(UV34*complexconjugate(Yx11) + UV35*complexconjugate(Yx21) + UV36*complexconjugate(Yx31)) + UV35*(UV14*complexconjugate(Yx12) + UV15*complexconjugate(Yx22) + UV16*complexconjugate(Yx32)) + UV15*(UV34*complexconjugate(Yx12) + UV35*complexconjugate(Yx22) + UV36*complexconjugate(Yx32)) + UV36*(UV14*complexconjugate(Yx13) + UV15*complexconjugate(Yx23) + UV16*complexconjugate(Yx33)) + UV16*(UV34*complexconjugate(Yx13) + UV35*complexconjugate(Yx23) + UV36*complexconjugate(Yx33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_247 = Coupling(name = 'GC_247',
	 value = '(-(ZA11*(complexconjugate(UV14)*(Yv11*complexconjugate(UV41) + Yv21*complexconjugate(UV42) + Yv31*complexconjugate(UV43)) + complexconjugate(UV15)*(Yv12*complexconjugate(UV41) + Yv22*complexconjugate(UV42) + Yv32*complexconjugate(UV43)) + complexconjugate(UV16)*(Yv13*complexconjugate(UV41) + Yv23*complexconjugate(UV42) + Yv33*complexconjugate(UV43)))) - ZA11*((Yv11*complexconjugate(UV11) + Yv21*complexconjugate(UV12) + Yv31*complexconjugate(UV13))*complexconjugate(UV44) + (Yv12*complexconjugate(UV11) + Yv22*complexconjugate(UV12) + Yv32*complexconjugate(UV13))*complexconjugate(UV45) + (Yv13*complexconjugate(UV11) + Yv23*complexconjugate(UV12) + Yv33*complexconjugate(UV13))*complexconjugate(UV46)) + ZA12*((Yx11*complexconjugate(UV14) + Yx21*complexconjugate(UV15) + Yx31*complexconjugate(UV16))*complexconjugate(UV44) + (Yx12*complexconjugate(UV14) + Yx22*complexconjugate(UV15) + Yx32*complexconjugate(UV16))*complexconjugate(UV45) + (Yx13*complexconjugate(UV14) + Yx23*complexconjugate(UV15) + Yx33*complexconjugate(UV16))*complexconjugate(UV46) + complexconjugate(UV14)*(Yx11*complexconjugate(UV44) + Yx21*complexconjugate(UV45) + Yx31*complexconjugate(UV46)) + complexconjugate(UV15)*(Yx12*complexconjugate(UV44) + Yx22*complexconjugate(UV45) + Yx32*complexconjugate(UV46)) + complexconjugate(UV16)*(Yx13*complexconjugate(UV44) + Yx23*complexconjugate(UV45) + Yx33*complexconjugate(UV46))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_248 = Coupling(name = 'GC_248',
	 value = '(ZA11*(UV44*(UV11*complexconjugate(Yv11) + UV12*complexconjugate(Yv21) + UV13*complexconjugate(Yv31)) + UV45*(UV11*complexconjugate(Yv12) + UV12*complexconjugate(Yv22) + UV13*complexconjugate(Yv32)) + UV46*(UV11*complexconjugate(Yv13) + UV12*complexconjugate(Yv23) + UV13*complexconjugate(Yv33))) + ZA11*(UV14*(UV41*complexconjugate(Yv11) + UV42*complexconjugate(Yv21) + UV43*complexconjugate(Yv31)) + UV15*(UV41*complexconjugate(Yv12) + UV42*complexconjugate(Yv22) + UV43*complexconjugate(Yv32)) + UV16*(UV41*complexconjugate(Yv13) + UV42*complexconjugate(Yv23) + UV43*complexconjugate(Yv33))) - ZA12*(UV44*(UV14*complexconjugate(Yx11) + UV15*complexconjugate(Yx21) + UV16*complexconjugate(Yx31)) + UV14*(UV44*complexconjugate(Yx11) + UV45*complexconjugate(Yx21) + UV46*complexconjugate(Yx31)) + UV45*(UV14*complexconjugate(Yx12) + UV15*complexconjugate(Yx22) + UV16*complexconjugate(Yx32)) + UV15*(UV44*complexconjugate(Yx12) + UV45*complexconjugate(Yx22) + UV46*complexconjugate(Yx32)) + UV46*(UV14*complexconjugate(Yx13) + UV15*complexconjugate(Yx23) + UV16*complexconjugate(Yx33)) + UV16*(UV44*complexconjugate(Yx13) + UV45*complexconjugate(Yx23) + UV46*complexconjugate(Yx33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_249 = Coupling(name = 'GC_249',
	 value = '(-(ZA21*(complexconjugate(UV14)*(Yv11*complexconjugate(UV41) + Yv21*complexconjugate(UV42) + Yv31*complexconjugate(UV43)) + complexconjugate(UV15)*(Yv12*complexconjugate(UV41) + Yv22*complexconjugate(UV42) + Yv32*complexconjugate(UV43)) + complexconjugate(UV16)*(Yv13*complexconjugate(UV41) + Yv23*complexconjugate(UV42) + Yv33*complexconjugate(UV43)))) - ZA21*((Yv11*complexconjugate(UV11) + Yv21*complexconjugate(UV12) + Yv31*complexconjugate(UV13))*complexconjugate(UV44) + (Yv12*complexconjugate(UV11) + Yv22*complexconjugate(UV12) + Yv32*complexconjugate(UV13))*complexconjugate(UV45) + (Yv13*complexconjugate(UV11) + Yv23*complexconjugate(UV12) + Yv33*complexconjugate(UV13))*complexconjugate(UV46)) + ZA22*((Yx11*complexconjugate(UV14) + Yx21*complexconjugate(UV15) + Yx31*complexconjugate(UV16))*complexconjugate(UV44) + (Yx12*complexconjugate(UV14) + Yx22*complexconjugate(UV15) + Yx32*complexconjugate(UV16))*complexconjugate(UV45) + (Yx13*complexconjugate(UV14) + Yx23*complexconjugate(UV15) + Yx33*complexconjugate(UV16))*complexconjugate(UV46) + complexconjugate(UV14)*(Yx11*complexconjugate(UV44) + Yx21*complexconjugate(UV45) + Yx31*complexconjugate(UV46)) + complexconjugate(UV15)*(Yx12*complexconjugate(UV44) + Yx22*complexconjugate(UV45) + Yx32*complexconjugate(UV46)) + complexconjugate(UV16)*(Yx13*complexconjugate(UV44) + Yx23*complexconjugate(UV45) + Yx33*complexconjugate(UV46))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_250 = Coupling(name = 'GC_250',
	 value = '(ZA21*(UV44*(UV11*complexconjugate(Yv11) + UV12*complexconjugate(Yv21) + UV13*complexconjugate(Yv31)) + UV45*(UV11*complexconjugate(Yv12) + UV12*complexconjugate(Yv22) + UV13*complexconjugate(Yv32)) + UV46*(UV11*complexconjugate(Yv13) + UV12*complexconjugate(Yv23) + UV13*complexconjugate(Yv33))) + ZA21*(UV14*(UV41*complexconjugate(Yv11) + UV42*complexconjugate(Yv21) + UV43*complexconjugate(Yv31)) + UV15*(UV41*complexconjugate(Yv12) + UV42*complexconjugate(Yv22) + UV43*complexconjugate(Yv32)) + UV16*(UV41*complexconjugate(Yv13) + UV42*complexconjugate(Yv23) + UV43*complexconjugate(Yv33))) - ZA22*(UV44*(UV14*complexconjugate(Yx11) + UV15*complexconjugate(Yx21) + UV16*complexconjugate(Yx31)) + UV14*(UV44*complexconjugate(Yx11) + UV45*complexconjugate(Yx21) + UV46*complexconjugate(Yx31)) + UV45*(UV14*complexconjugate(Yx12) + UV15*complexconjugate(Yx22) + UV16*complexconjugate(Yx32)) + UV15*(UV44*complexconjugate(Yx12) + UV45*complexconjugate(Yx22) + UV46*complexconjugate(Yx32)) + UV46*(UV14*complexconjugate(Yx13) + UV15*complexconjugate(Yx23) + UV16*complexconjugate(Yx33)) + UV16*(UV44*complexconjugate(Yx13) + UV45*complexconjugate(Yx23) + UV46*complexconjugate(Yx33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_251 = Coupling(name = 'GC_251',
	 value = '(-(ZA11*(complexconjugate(UV14)*(Yv11*complexconjugate(UV51) + Yv21*complexconjugate(UV52) + Yv31*complexconjugate(UV53)) + complexconjugate(UV15)*(Yv12*complexconjugate(UV51) + Yv22*complexconjugate(UV52) + Yv32*complexconjugate(UV53)) + complexconjugate(UV16)*(Yv13*complexconjugate(UV51) + Yv23*complexconjugate(UV52) + Yv33*complexconjugate(UV53)))) - ZA11*((Yv11*complexconjugate(UV11) + Yv21*complexconjugate(UV12) + Yv31*complexconjugate(UV13))*complexconjugate(UV54) + (Yv12*complexconjugate(UV11) + Yv22*complexconjugate(UV12) + Yv32*complexconjugate(UV13))*complexconjugate(UV55) + (Yv13*complexconjugate(UV11) + Yv23*complexconjugate(UV12) + Yv33*complexconjugate(UV13))*complexconjugate(UV56)) + ZA12*((Yx11*complexconjugate(UV14) + Yx21*complexconjugate(UV15) + Yx31*complexconjugate(UV16))*complexconjugate(UV54) + (Yx12*complexconjugate(UV14) + Yx22*complexconjugate(UV15) + Yx32*complexconjugate(UV16))*complexconjugate(UV55) + (Yx13*complexconjugate(UV14) + Yx23*complexconjugate(UV15) + Yx33*complexconjugate(UV16))*complexconjugate(UV56) + complexconjugate(UV14)*(Yx11*complexconjugate(UV54) + Yx21*complexconjugate(UV55) + Yx31*complexconjugate(UV56)) + complexconjugate(UV15)*(Yx12*complexconjugate(UV54) + Yx22*complexconjugate(UV55) + Yx32*complexconjugate(UV56)) + complexconjugate(UV16)*(Yx13*complexconjugate(UV54) + Yx23*complexconjugate(UV55) + Yx33*complexconjugate(UV56))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_252 = Coupling(name = 'GC_252',
	 value = '(ZA11*(UV54*(UV11*complexconjugate(Yv11) + UV12*complexconjugate(Yv21) + UV13*complexconjugate(Yv31)) + UV55*(UV11*complexconjugate(Yv12) + UV12*complexconjugate(Yv22) + UV13*complexconjugate(Yv32)) + UV56*(UV11*complexconjugate(Yv13) + UV12*complexconjugate(Yv23) + UV13*complexconjugate(Yv33))) + ZA11*(UV14*(UV51*complexconjugate(Yv11) + UV52*complexconjugate(Yv21) + UV53*complexconjugate(Yv31)) + UV15*(UV51*complexconjugate(Yv12) + UV52*complexconjugate(Yv22) + UV53*complexconjugate(Yv32)) + UV16*(UV51*complexconjugate(Yv13) + UV52*complexconjugate(Yv23) + UV53*complexconjugate(Yv33))) - ZA12*(UV54*(UV14*complexconjugate(Yx11) + UV15*complexconjugate(Yx21) + UV16*complexconjugate(Yx31)) + UV14*(UV54*complexconjugate(Yx11) + UV55*complexconjugate(Yx21) + UV56*complexconjugate(Yx31)) + UV55*(UV14*complexconjugate(Yx12) + UV15*complexconjugate(Yx22) + UV16*complexconjugate(Yx32)) + UV15*(UV54*complexconjugate(Yx12) + UV55*complexconjugate(Yx22) + UV56*complexconjugate(Yx32)) + UV56*(UV14*complexconjugate(Yx13) + UV15*complexconjugate(Yx23) + UV16*complexconjugate(Yx33)) + UV16*(UV54*complexconjugate(Yx13) + UV55*complexconjugate(Yx23) + UV56*complexconjugate(Yx33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_253 = Coupling(name = 'GC_253',
	 value = '(-(ZA21*(complexconjugate(UV14)*(Yv11*complexconjugate(UV51) + Yv21*complexconjugate(UV52) + Yv31*complexconjugate(UV53)) + complexconjugate(UV15)*(Yv12*complexconjugate(UV51) + Yv22*complexconjugate(UV52) + Yv32*complexconjugate(UV53)) + complexconjugate(UV16)*(Yv13*complexconjugate(UV51) + Yv23*complexconjugate(UV52) + Yv33*complexconjugate(UV53)))) - ZA21*((Yv11*complexconjugate(UV11) + Yv21*complexconjugate(UV12) + Yv31*complexconjugate(UV13))*complexconjugate(UV54) + (Yv12*complexconjugate(UV11) + Yv22*complexconjugate(UV12) + Yv32*complexconjugate(UV13))*complexconjugate(UV55) + (Yv13*complexconjugate(UV11) + Yv23*complexconjugate(UV12) + Yv33*complexconjugate(UV13))*complexconjugate(UV56)) + ZA22*((Yx11*complexconjugate(UV14) + Yx21*complexconjugate(UV15) + Yx31*complexconjugate(UV16))*complexconjugate(UV54) + (Yx12*complexconjugate(UV14) + Yx22*complexconjugate(UV15) + Yx32*complexconjugate(UV16))*complexconjugate(UV55) + (Yx13*complexconjugate(UV14) + Yx23*complexconjugate(UV15) + Yx33*complexconjugate(UV16))*complexconjugate(UV56) + complexconjugate(UV14)*(Yx11*complexconjugate(UV54) + Yx21*complexconjugate(UV55) + Yx31*complexconjugate(UV56)) + complexconjugate(UV15)*(Yx12*complexconjugate(UV54) + Yx22*complexconjugate(UV55) + Yx32*complexconjugate(UV56)) + complexconjugate(UV16)*(Yx13*complexconjugate(UV54) + Yx23*complexconjugate(UV55) + Yx33*complexconjugate(UV56))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_254 = Coupling(name = 'GC_254',
	 value = '(ZA21*(UV54*(UV11*complexconjugate(Yv11) + UV12*complexconjugate(Yv21) + UV13*complexconjugate(Yv31)) + UV55*(UV11*complexconjugate(Yv12) + UV12*complexconjugate(Yv22) + UV13*complexconjugate(Yv32)) + UV56*(UV11*complexconjugate(Yv13) + UV12*complexconjugate(Yv23) + UV13*complexconjugate(Yv33))) + ZA21*(UV14*(UV51*complexconjugate(Yv11) + UV52*complexconjugate(Yv21) + UV53*complexconjugate(Yv31)) + UV15*(UV51*complexconjugate(Yv12) + UV52*complexconjugate(Yv22) + UV53*complexconjugate(Yv32)) + UV16*(UV51*complexconjugate(Yv13) + UV52*complexconjugate(Yv23) + UV53*complexconjugate(Yv33))) - ZA22*(UV54*(UV14*complexconjugate(Yx11) + UV15*complexconjugate(Yx21) + UV16*complexconjugate(Yx31)) + UV14*(UV54*complexconjugate(Yx11) + UV55*complexconjugate(Yx21) + UV56*complexconjugate(Yx31)) + UV55*(UV14*complexconjugate(Yx12) + UV15*complexconjugate(Yx22) + UV16*complexconjugate(Yx32)) + UV15*(UV54*complexconjugate(Yx12) + UV55*complexconjugate(Yx22) + UV56*complexconjugate(Yx32)) + UV56*(UV14*complexconjugate(Yx13) + UV15*complexconjugate(Yx23) + UV16*complexconjugate(Yx33)) + UV16*(UV54*complexconjugate(Yx13) + UV55*complexconjugate(Yx23) + UV56*complexconjugate(Yx33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_255 = Coupling(name = 'GC_255',
	 value = '(-(ZA11*(complexconjugate(UV14)*(Yv11*complexconjugate(UV61) + Yv21*complexconjugate(UV62) + Yv31*complexconjugate(UV63)) + complexconjugate(UV15)*(Yv12*complexconjugate(UV61) + Yv22*complexconjugate(UV62) + Yv32*complexconjugate(UV63)) + complexconjugate(UV16)*(Yv13*complexconjugate(UV61) + Yv23*complexconjugate(UV62) + Yv33*complexconjugate(UV63)))) - ZA11*((Yv11*complexconjugate(UV11) + Yv21*complexconjugate(UV12) + Yv31*complexconjugate(UV13))*complexconjugate(UV64) + (Yv12*complexconjugate(UV11) + Yv22*complexconjugate(UV12) + Yv32*complexconjugate(UV13))*complexconjugate(UV65) + (Yv13*complexconjugate(UV11) + Yv23*complexconjugate(UV12) + Yv33*complexconjugate(UV13))*complexconjugate(UV66)) + ZA12*((Yx11*complexconjugate(UV14) + Yx21*complexconjugate(UV15) + Yx31*complexconjugate(UV16))*complexconjugate(UV64) + (Yx12*complexconjugate(UV14) + Yx22*complexconjugate(UV15) + Yx32*complexconjugate(UV16))*complexconjugate(UV65) + (Yx13*complexconjugate(UV14) + Yx23*complexconjugate(UV15) + Yx33*complexconjugate(UV16))*complexconjugate(UV66) + complexconjugate(UV14)*(Yx11*complexconjugate(UV64) + Yx21*complexconjugate(UV65) + Yx31*complexconjugate(UV66)) + complexconjugate(UV15)*(Yx12*complexconjugate(UV64) + Yx22*complexconjugate(UV65) + Yx32*complexconjugate(UV66)) + complexconjugate(UV16)*(Yx13*complexconjugate(UV64) + Yx23*complexconjugate(UV65) + Yx33*complexconjugate(UV66))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_256 = Coupling(name = 'GC_256',
	 value = '(ZA11*(UV64*(UV11*complexconjugate(Yv11) + UV12*complexconjugate(Yv21) + UV13*complexconjugate(Yv31)) + UV65*(UV11*complexconjugate(Yv12) + UV12*complexconjugate(Yv22) + UV13*complexconjugate(Yv32)) + UV66*(UV11*complexconjugate(Yv13) + UV12*complexconjugate(Yv23) + UV13*complexconjugate(Yv33))) + ZA11*(UV14*(UV61*complexconjugate(Yv11) + UV62*complexconjugate(Yv21) + UV63*complexconjugate(Yv31)) + UV15*(UV61*complexconjugate(Yv12) + UV62*complexconjugate(Yv22) + UV63*complexconjugate(Yv32)) + UV16*(UV61*complexconjugate(Yv13) + UV62*complexconjugate(Yv23) + UV63*complexconjugate(Yv33))) - ZA12*(UV64*(UV14*complexconjugate(Yx11) + UV15*complexconjugate(Yx21) + UV16*complexconjugate(Yx31)) + UV14*(UV64*complexconjugate(Yx11) + UV65*complexconjugate(Yx21) + UV66*complexconjugate(Yx31)) + UV65*(UV14*complexconjugate(Yx12) + UV15*complexconjugate(Yx22) + UV16*complexconjugate(Yx32)) + UV15*(UV64*complexconjugate(Yx12) + UV65*complexconjugate(Yx22) + UV66*complexconjugate(Yx32)) + UV66*(UV14*complexconjugate(Yx13) + UV15*complexconjugate(Yx23) + UV16*complexconjugate(Yx33)) + UV16*(UV64*complexconjugate(Yx13) + UV65*complexconjugate(Yx23) + UV66*complexconjugate(Yx33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_257 = Coupling(name = 'GC_257',
	 value = '(-(ZA21*(complexconjugate(UV14)*(Yv11*complexconjugate(UV61) + Yv21*complexconjugate(UV62) + Yv31*complexconjugate(UV63)) + complexconjugate(UV15)*(Yv12*complexconjugate(UV61) + Yv22*complexconjugate(UV62) + Yv32*complexconjugate(UV63)) + complexconjugate(UV16)*(Yv13*complexconjugate(UV61) + Yv23*complexconjugate(UV62) + Yv33*complexconjugate(UV63)))) - ZA21*((Yv11*complexconjugate(UV11) + Yv21*complexconjugate(UV12) + Yv31*complexconjugate(UV13))*complexconjugate(UV64) + (Yv12*complexconjugate(UV11) + Yv22*complexconjugate(UV12) + Yv32*complexconjugate(UV13))*complexconjugate(UV65) + (Yv13*complexconjugate(UV11) + Yv23*complexconjugate(UV12) + Yv33*complexconjugate(UV13))*complexconjugate(UV66)) + ZA22*((Yx11*complexconjugate(UV14) + Yx21*complexconjugate(UV15) + Yx31*complexconjugate(UV16))*complexconjugate(UV64) + (Yx12*complexconjugate(UV14) + Yx22*complexconjugate(UV15) + Yx32*complexconjugate(UV16))*complexconjugate(UV65) + (Yx13*complexconjugate(UV14) + Yx23*complexconjugate(UV15) + Yx33*complexconjugate(UV16))*complexconjugate(UV66) + complexconjugate(UV14)*(Yx11*complexconjugate(UV64) + Yx21*complexconjugate(UV65) + Yx31*complexconjugate(UV66)) + complexconjugate(UV15)*(Yx12*complexconjugate(UV64) + Yx22*complexconjugate(UV65) + Yx32*complexconjugate(UV66)) + complexconjugate(UV16)*(Yx13*complexconjugate(UV64) + Yx23*complexconjugate(UV65) + Yx33*complexconjugate(UV66))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_258 = Coupling(name = 'GC_258',
	 value = '(ZA21*(UV64*(UV11*complexconjugate(Yv11) + UV12*complexconjugate(Yv21) + UV13*complexconjugate(Yv31)) + UV65*(UV11*complexconjugate(Yv12) + UV12*complexconjugate(Yv22) + UV13*complexconjugate(Yv32)) + UV66*(UV11*complexconjugate(Yv13) + UV12*complexconjugate(Yv23) + UV13*complexconjugate(Yv33))) + ZA21*(UV14*(UV61*complexconjugate(Yv11) + UV62*complexconjugate(Yv21) + UV63*complexconjugate(Yv31)) + UV15*(UV61*complexconjugate(Yv12) + UV62*complexconjugate(Yv22) + UV63*complexconjugate(Yv32)) + UV16*(UV61*complexconjugate(Yv13) + UV62*complexconjugate(Yv23) + UV63*complexconjugate(Yv33))) - ZA22*(UV64*(UV14*complexconjugate(Yx11) + UV15*complexconjugate(Yx21) + UV16*complexconjugate(Yx31)) + UV14*(UV64*complexconjugate(Yx11) + UV65*complexconjugate(Yx21) + UV66*complexconjugate(Yx31)) + UV65*(UV14*complexconjugate(Yx12) + UV15*complexconjugate(Yx22) + UV16*complexconjugate(Yx32)) + UV15*(UV64*complexconjugate(Yx12) + UV65*complexconjugate(Yx22) + UV66*complexconjugate(Yx32)) + UV66*(UV14*complexconjugate(Yx13) + UV15*complexconjugate(Yx23) + UV16*complexconjugate(Yx33)) + UV16*(UV64*complexconjugate(Yx13) + UV65*complexconjugate(Yx23) + UV66*complexconjugate(Yx33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_259 = Coupling(name = 'GC_259',
	 value = '(-2*ZA11*((Yv11*complexconjugate(UV21) + Yv21*complexconjugate(UV22) + Yv31*complexconjugate(UV23))*complexconjugate(UV24) + (Yv12*complexconjugate(UV21) + Yv22*complexconjugate(UV22) + Yv32*complexconjugate(UV23))*complexconjugate(UV25) + (Yv13*complexconjugate(UV21) + Yv23*complexconjugate(UV22) + Yv33*complexconjugate(UV23))*complexconjugate(UV26)) + ZA12*(2*complexconjugate(UV24)*(Yx11*complexconjugate(UV24) + Yx21*complexconjugate(UV25) + Yx31*complexconjugate(UV26)) + 2*complexconjugate(UV25)*(Yx12*complexconjugate(UV24) + Yx22*complexconjugate(UV25) + Yx32*complexconjugate(UV26)) + 2*complexconjugate(UV26)*(Yx13*complexconjugate(UV24) + Yx23*complexconjugate(UV25) + Yx33*complexconjugate(UV26))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_260 = Coupling(name = 'GC_260',
	 value = '(2*ZA11*(UV24*(UV21*complexconjugate(Yv11) + UV22*complexconjugate(Yv21) + UV23*complexconjugate(Yv31)) + UV25*(UV21*complexconjugate(Yv12) + UV22*complexconjugate(Yv22) + UV23*complexconjugate(Yv32)) + UV26*(UV21*complexconjugate(Yv13) + UV22*complexconjugate(Yv23) + UV23*complexconjugate(Yv33))) - ZA12*(2*UV24*(UV24*complexconjugate(Yx11) + UV25*complexconjugate(Yx21) + UV26*complexconjugate(Yx31)) + 2*UV25*(UV24*complexconjugate(Yx12) + UV25*complexconjugate(Yx22) + UV26*complexconjugate(Yx32)) + 2*UV26*(UV24*complexconjugate(Yx13) + UV25*complexconjugate(Yx23) + UV26*complexconjugate(Yx33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_261 = Coupling(name = 'GC_261',
	 value = '(-2*ZA21*((Yv11*complexconjugate(UV21) + Yv21*complexconjugate(UV22) + Yv31*complexconjugate(UV23))*complexconjugate(UV24) + (Yv12*complexconjugate(UV21) + Yv22*complexconjugate(UV22) + Yv32*complexconjugate(UV23))*complexconjugate(UV25) + (Yv13*complexconjugate(UV21) + Yv23*complexconjugate(UV22) + Yv33*complexconjugate(UV23))*complexconjugate(UV26)) + ZA22*(2*complexconjugate(UV24)*(Yx11*complexconjugate(UV24) + Yx21*complexconjugate(UV25) + Yx31*complexconjugate(UV26)) + 2*complexconjugate(UV25)*(Yx12*complexconjugate(UV24) + Yx22*complexconjugate(UV25) + Yx32*complexconjugate(UV26)) + 2*complexconjugate(UV26)*(Yx13*complexconjugate(UV24) + Yx23*complexconjugate(UV25) + Yx33*complexconjugate(UV26))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_262 = Coupling(name = 'GC_262',
	 value = '(2*ZA21*(UV24*(UV21*complexconjugate(Yv11) + UV22*complexconjugate(Yv21) + UV23*complexconjugate(Yv31)) + UV25*(UV21*complexconjugate(Yv12) + UV22*complexconjugate(Yv22) + UV23*complexconjugate(Yv32)) + UV26*(UV21*complexconjugate(Yv13) + UV22*complexconjugate(Yv23) + UV23*complexconjugate(Yv33))) - ZA22*(2*UV24*(UV24*complexconjugate(Yx11) + UV25*complexconjugate(Yx21) + UV26*complexconjugate(Yx31)) + 2*UV25*(UV24*complexconjugate(Yx12) + UV25*complexconjugate(Yx22) + UV26*complexconjugate(Yx32)) + 2*UV26*(UV24*complexconjugate(Yx13) + UV25*complexconjugate(Yx23) + UV26*complexconjugate(Yx33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_263 = Coupling(name = 'GC_263',
	 value = '(-(ZA11*(complexconjugate(UV24)*(Yv11*complexconjugate(UV31) + Yv21*complexconjugate(UV32) + Yv31*complexconjugate(UV33)) + complexconjugate(UV25)*(Yv12*complexconjugate(UV31) + Yv22*complexconjugate(UV32) + Yv32*complexconjugate(UV33)) + complexconjugate(UV26)*(Yv13*complexconjugate(UV31) + Yv23*complexconjugate(UV32) + Yv33*complexconjugate(UV33)))) - ZA11*((Yv11*complexconjugate(UV21) + Yv21*complexconjugate(UV22) + Yv31*complexconjugate(UV23))*complexconjugate(UV34) + (Yv12*complexconjugate(UV21) + Yv22*complexconjugate(UV22) + Yv32*complexconjugate(UV23))*complexconjugate(UV35) + (Yv13*complexconjugate(UV21) + Yv23*complexconjugate(UV22) + Yv33*complexconjugate(UV23))*complexconjugate(UV36)) + ZA12*((Yx11*complexconjugate(UV24) + Yx21*complexconjugate(UV25) + Yx31*complexconjugate(UV26))*complexconjugate(UV34) + (Yx12*complexconjugate(UV24) + Yx22*complexconjugate(UV25) + Yx32*complexconjugate(UV26))*complexconjugate(UV35) + (Yx13*complexconjugate(UV24) + Yx23*complexconjugate(UV25) + Yx33*complexconjugate(UV26))*complexconjugate(UV36) + complexconjugate(UV24)*(Yx11*complexconjugate(UV34) + Yx21*complexconjugate(UV35) + Yx31*complexconjugate(UV36)) + complexconjugate(UV25)*(Yx12*complexconjugate(UV34) + Yx22*complexconjugate(UV35) + Yx32*complexconjugate(UV36)) + complexconjugate(UV26)*(Yx13*complexconjugate(UV34) + Yx23*complexconjugate(UV35) + Yx33*complexconjugate(UV36))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_264 = Coupling(name = 'GC_264',
	 value = '(ZA11*(UV34*(UV21*complexconjugate(Yv11) + UV22*complexconjugate(Yv21) + UV23*complexconjugate(Yv31)) + UV35*(UV21*complexconjugate(Yv12) + UV22*complexconjugate(Yv22) + UV23*complexconjugate(Yv32)) + UV36*(UV21*complexconjugate(Yv13) + UV22*complexconjugate(Yv23) + UV23*complexconjugate(Yv33))) + ZA11*(UV24*(UV31*complexconjugate(Yv11) + UV32*complexconjugate(Yv21) + UV33*complexconjugate(Yv31)) + UV25*(UV31*complexconjugate(Yv12) + UV32*complexconjugate(Yv22) + UV33*complexconjugate(Yv32)) + UV26*(UV31*complexconjugate(Yv13) + UV32*complexconjugate(Yv23) + UV33*complexconjugate(Yv33))) - ZA12*(UV34*(UV24*complexconjugate(Yx11) + UV25*complexconjugate(Yx21) + UV26*complexconjugate(Yx31)) + UV24*(UV34*complexconjugate(Yx11) + UV35*complexconjugate(Yx21) + UV36*complexconjugate(Yx31)) + UV35*(UV24*complexconjugate(Yx12) + UV25*complexconjugate(Yx22) + UV26*complexconjugate(Yx32)) + UV25*(UV34*complexconjugate(Yx12) + UV35*complexconjugate(Yx22) + UV36*complexconjugate(Yx32)) + UV36*(UV24*complexconjugate(Yx13) + UV25*complexconjugate(Yx23) + UV26*complexconjugate(Yx33)) + UV26*(UV34*complexconjugate(Yx13) + UV35*complexconjugate(Yx23) + UV36*complexconjugate(Yx33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_265 = Coupling(name = 'GC_265',
	 value = '(-(ZA21*(complexconjugate(UV24)*(Yv11*complexconjugate(UV31) + Yv21*complexconjugate(UV32) + Yv31*complexconjugate(UV33)) + complexconjugate(UV25)*(Yv12*complexconjugate(UV31) + Yv22*complexconjugate(UV32) + Yv32*complexconjugate(UV33)) + complexconjugate(UV26)*(Yv13*complexconjugate(UV31) + Yv23*complexconjugate(UV32) + Yv33*complexconjugate(UV33)))) - ZA21*((Yv11*complexconjugate(UV21) + Yv21*complexconjugate(UV22) + Yv31*complexconjugate(UV23))*complexconjugate(UV34) + (Yv12*complexconjugate(UV21) + Yv22*complexconjugate(UV22) + Yv32*complexconjugate(UV23))*complexconjugate(UV35) + (Yv13*complexconjugate(UV21) + Yv23*complexconjugate(UV22) + Yv33*complexconjugate(UV23))*complexconjugate(UV36)) + ZA22*((Yx11*complexconjugate(UV24) + Yx21*complexconjugate(UV25) + Yx31*complexconjugate(UV26))*complexconjugate(UV34) + (Yx12*complexconjugate(UV24) + Yx22*complexconjugate(UV25) + Yx32*complexconjugate(UV26))*complexconjugate(UV35) + (Yx13*complexconjugate(UV24) + Yx23*complexconjugate(UV25) + Yx33*complexconjugate(UV26))*complexconjugate(UV36) + complexconjugate(UV24)*(Yx11*complexconjugate(UV34) + Yx21*complexconjugate(UV35) + Yx31*complexconjugate(UV36)) + complexconjugate(UV25)*(Yx12*complexconjugate(UV34) + Yx22*complexconjugate(UV35) + Yx32*complexconjugate(UV36)) + complexconjugate(UV26)*(Yx13*complexconjugate(UV34) + Yx23*complexconjugate(UV35) + Yx33*complexconjugate(UV36))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_266 = Coupling(name = 'GC_266',
	 value = '(ZA21*(UV34*(UV21*complexconjugate(Yv11) + UV22*complexconjugate(Yv21) + UV23*complexconjugate(Yv31)) + UV35*(UV21*complexconjugate(Yv12) + UV22*complexconjugate(Yv22) + UV23*complexconjugate(Yv32)) + UV36*(UV21*complexconjugate(Yv13) + UV22*complexconjugate(Yv23) + UV23*complexconjugate(Yv33))) + ZA21*(UV24*(UV31*complexconjugate(Yv11) + UV32*complexconjugate(Yv21) + UV33*complexconjugate(Yv31)) + UV25*(UV31*complexconjugate(Yv12) + UV32*complexconjugate(Yv22) + UV33*complexconjugate(Yv32)) + UV26*(UV31*complexconjugate(Yv13) + UV32*complexconjugate(Yv23) + UV33*complexconjugate(Yv33))) - ZA22*(UV34*(UV24*complexconjugate(Yx11) + UV25*complexconjugate(Yx21) + UV26*complexconjugate(Yx31)) + UV24*(UV34*complexconjugate(Yx11) + UV35*complexconjugate(Yx21) + UV36*complexconjugate(Yx31)) + UV35*(UV24*complexconjugate(Yx12) + UV25*complexconjugate(Yx22) + UV26*complexconjugate(Yx32)) + UV25*(UV34*complexconjugate(Yx12) + UV35*complexconjugate(Yx22) + UV36*complexconjugate(Yx32)) + UV36*(UV24*complexconjugate(Yx13) + UV25*complexconjugate(Yx23) + UV26*complexconjugate(Yx33)) + UV26*(UV34*complexconjugate(Yx13) + UV35*complexconjugate(Yx23) + UV36*complexconjugate(Yx33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_267 = Coupling(name = 'GC_267',
	 value = '(-(ZA11*(complexconjugate(UV24)*(Yv11*complexconjugate(UV41) + Yv21*complexconjugate(UV42) + Yv31*complexconjugate(UV43)) + complexconjugate(UV25)*(Yv12*complexconjugate(UV41) + Yv22*complexconjugate(UV42) + Yv32*complexconjugate(UV43)) + complexconjugate(UV26)*(Yv13*complexconjugate(UV41) + Yv23*complexconjugate(UV42) + Yv33*complexconjugate(UV43)))) - ZA11*((Yv11*complexconjugate(UV21) + Yv21*complexconjugate(UV22) + Yv31*complexconjugate(UV23))*complexconjugate(UV44) + (Yv12*complexconjugate(UV21) + Yv22*complexconjugate(UV22) + Yv32*complexconjugate(UV23))*complexconjugate(UV45) + (Yv13*complexconjugate(UV21) + Yv23*complexconjugate(UV22) + Yv33*complexconjugate(UV23))*complexconjugate(UV46)) + ZA12*((Yx11*complexconjugate(UV24) + Yx21*complexconjugate(UV25) + Yx31*complexconjugate(UV26))*complexconjugate(UV44) + (Yx12*complexconjugate(UV24) + Yx22*complexconjugate(UV25) + Yx32*complexconjugate(UV26))*complexconjugate(UV45) + (Yx13*complexconjugate(UV24) + Yx23*complexconjugate(UV25) + Yx33*complexconjugate(UV26))*complexconjugate(UV46) + complexconjugate(UV24)*(Yx11*complexconjugate(UV44) + Yx21*complexconjugate(UV45) + Yx31*complexconjugate(UV46)) + complexconjugate(UV25)*(Yx12*complexconjugate(UV44) + Yx22*complexconjugate(UV45) + Yx32*complexconjugate(UV46)) + complexconjugate(UV26)*(Yx13*complexconjugate(UV44) + Yx23*complexconjugate(UV45) + Yx33*complexconjugate(UV46))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_268 = Coupling(name = 'GC_268',
	 value = '(ZA11*(UV44*(UV21*complexconjugate(Yv11) + UV22*complexconjugate(Yv21) + UV23*complexconjugate(Yv31)) + UV45*(UV21*complexconjugate(Yv12) + UV22*complexconjugate(Yv22) + UV23*complexconjugate(Yv32)) + UV46*(UV21*complexconjugate(Yv13) + UV22*complexconjugate(Yv23) + UV23*complexconjugate(Yv33))) + ZA11*(UV24*(UV41*complexconjugate(Yv11) + UV42*complexconjugate(Yv21) + UV43*complexconjugate(Yv31)) + UV25*(UV41*complexconjugate(Yv12) + UV42*complexconjugate(Yv22) + UV43*complexconjugate(Yv32)) + UV26*(UV41*complexconjugate(Yv13) + UV42*complexconjugate(Yv23) + UV43*complexconjugate(Yv33))) - ZA12*(UV44*(UV24*complexconjugate(Yx11) + UV25*complexconjugate(Yx21) + UV26*complexconjugate(Yx31)) + UV24*(UV44*complexconjugate(Yx11) + UV45*complexconjugate(Yx21) + UV46*complexconjugate(Yx31)) + UV45*(UV24*complexconjugate(Yx12) + UV25*complexconjugate(Yx22) + UV26*complexconjugate(Yx32)) + UV25*(UV44*complexconjugate(Yx12) + UV45*complexconjugate(Yx22) + UV46*complexconjugate(Yx32)) + UV46*(UV24*complexconjugate(Yx13) + UV25*complexconjugate(Yx23) + UV26*complexconjugate(Yx33)) + UV26*(UV44*complexconjugate(Yx13) + UV45*complexconjugate(Yx23) + UV46*complexconjugate(Yx33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_269 = Coupling(name = 'GC_269',
	 value = '(-(ZA21*(complexconjugate(UV24)*(Yv11*complexconjugate(UV41) + Yv21*complexconjugate(UV42) + Yv31*complexconjugate(UV43)) + complexconjugate(UV25)*(Yv12*complexconjugate(UV41) + Yv22*complexconjugate(UV42) + Yv32*complexconjugate(UV43)) + complexconjugate(UV26)*(Yv13*complexconjugate(UV41) + Yv23*complexconjugate(UV42) + Yv33*complexconjugate(UV43)))) - ZA21*((Yv11*complexconjugate(UV21) + Yv21*complexconjugate(UV22) + Yv31*complexconjugate(UV23))*complexconjugate(UV44) + (Yv12*complexconjugate(UV21) + Yv22*complexconjugate(UV22) + Yv32*complexconjugate(UV23))*complexconjugate(UV45) + (Yv13*complexconjugate(UV21) + Yv23*complexconjugate(UV22) + Yv33*complexconjugate(UV23))*complexconjugate(UV46)) + ZA22*((Yx11*complexconjugate(UV24) + Yx21*complexconjugate(UV25) + Yx31*complexconjugate(UV26))*complexconjugate(UV44) + (Yx12*complexconjugate(UV24) + Yx22*complexconjugate(UV25) + Yx32*complexconjugate(UV26))*complexconjugate(UV45) + (Yx13*complexconjugate(UV24) + Yx23*complexconjugate(UV25) + Yx33*complexconjugate(UV26))*complexconjugate(UV46) + complexconjugate(UV24)*(Yx11*complexconjugate(UV44) + Yx21*complexconjugate(UV45) + Yx31*complexconjugate(UV46)) + complexconjugate(UV25)*(Yx12*complexconjugate(UV44) + Yx22*complexconjugate(UV45) + Yx32*complexconjugate(UV46)) + complexconjugate(UV26)*(Yx13*complexconjugate(UV44) + Yx23*complexconjugate(UV45) + Yx33*complexconjugate(UV46))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_270 = Coupling(name = 'GC_270',
	 value = '(ZA21*(UV44*(UV21*complexconjugate(Yv11) + UV22*complexconjugate(Yv21) + UV23*complexconjugate(Yv31)) + UV45*(UV21*complexconjugate(Yv12) + UV22*complexconjugate(Yv22) + UV23*complexconjugate(Yv32)) + UV46*(UV21*complexconjugate(Yv13) + UV22*complexconjugate(Yv23) + UV23*complexconjugate(Yv33))) + ZA21*(UV24*(UV41*complexconjugate(Yv11) + UV42*complexconjugate(Yv21) + UV43*complexconjugate(Yv31)) + UV25*(UV41*complexconjugate(Yv12) + UV42*complexconjugate(Yv22) + UV43*complexconjugate(Yv32)) + UV26*(UV41*complexconjugate(Yv13) + UV42*complexconjugate(Yv23) + UV43*complexconjugate(Yv33))) - ZA22*(UV44*(UV24*complexconjugate(Yx11) + UV25*complexconjugate(Yx21) + UV26*complexconjugate(Yx31)) + UV24*(UV44*complexconjugate(Yx11) + UV45*complexconjugate(Yx21) + UV46*complexconjugate(Yx31)) + UV45*(UV24*complexconjugate(Yx12) + UV25*complexconjugate(Yx22) + UV26*complexconjugate(Yx32)) + UV25*(UV44*complexconjugate(Yx12) + UV45*complexconjugate(Yx22) + UV46*complexconjugate(Yx32)) + UV46*(UV24*complexconjugate(Yx13) + UV25*complexconjugate(Yx23) + UV26*complexconjugate(Yx33)) + UV26*(UV44*complexconjugate(Yx13) + UV45*complexconjugate(Yx23) + UV46*complexconjugate(Yx33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_271 = Coupling(name = 'GC_271',
	 value = '(-(ZA11*(complexconjugate(UV24)*(Yv11*complexconjugate(UV51) + Yv21*complexconjugate(UV52) + Yv31*complexconjugate(UV53)) + complexconjugate(UV25)*(Yv12*complexconjugate(UV51) + Yv22*complexconjugate(UV52) + Yv32*complexconjugate(UV53)) + complexconjugate(UV26)*(Yv13*complexconjugate(UV51) + Yv23*complexconjugate(UV52) + Yv33*complexconjugate(UV53)))) - ZA11*((Yv11*complexconjugate(UV21) + Yv21*complexconjugate(UV22) + Yv31*complexconjugate(UV23))*complexconjugate(UV54) + (Yv12*complexconjugate(UV21) + Yv22*complexconjugate(UV22) + Yv32*complexconjugate(UV23))*complexconjugate(UV55) + (Yv13*complexconjugate(UV21) + Yv23*complexconjugate(UV22) + Yv33*complexconjugate(UV23))*complexconjugate(UV56)) + ZA12*((Yx11*complexconjugate(UV24) + Yx21*complexconjugate(UV25) + Yx31*complexconjugate(UV26))*complexconjugate(UV54) + (Yx12*complexconjugate(UV24) + Yx22*complexconjugate(UV25) + Yx32*complexconjugate(UV26))*complexconjugate(UV55) + (Yx13*complexconjugate(UV24) + Yx23*complexconjugate(UV25) + Yx33*complexconjugate(UV26))*complexconjugate(UV56) + complexconjugate(UV24)*(Yx11*complexconjugate(UV54) + Yx21*complexconjugate(UV55) + Yx31*complexconjugate(UV56)) + complexconjugate(UV25)*(Yx12*complexconjugate(UV54) + Yx22*complexconjugate(UV55) + Yx32*complexconjugate(UV56)) + complexconjugate(UV26)*(Yx13*complexconjugate(UV54) + Yx23*complexconjugate(UV55) + Yx33*complexconjugate(UV56))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_272 = Coupling(name = 'GC_272',
	 value = '(ZA11*(UV54*(UV21*complexconjugate(Yv11) + UV22*complexconjugate(Yv21) + UV23*complexconjugate(Yv31)) + UV55*(UV21*complexconjugate(Yv12) + UV22*complexconjugate(Yv22) + UV23*complexconjugate(Yv32)) + UV56*(UV21*complexconjugate(Yv13) + UV22*complexconjugate(Yv23) + UV23*complexconjugate(Yv33))) + ZA11*(UV24*(UV51*complexconjugate(Yv11) + UV52*complexconjugate(Yv21) + UV53*complexconjugate(Yv31)) + UV25*(UV51*complexconjugate(Yv12) + UV52*complexconjugate(Yv22) + UV53*complexconjugate(Yv32)) + UV26*(UV51*complexconjugate(Yv13) + UV52*complexconjugate(Yv23) + UV53*complexconjugate(Yv33))) - ZA12*(UV54*(UV24*complexconjugate(Yx11) + UV25*complexconjugate(Yx21) + UV26*complexconjugate(Yx31)) + UV24*(UV54*complexconjugate(Yx11) + UV55*complexconjugate(Yx21) + UV56*complexconjugate(Yx31)) + UV55*(UV24*complexconjugate(Yx12) + UV25*complexconjugate(Yx22) + UV26*complexconjugate(Yx32)) + UV25*(UV54*complexconjugate(Yx12) + UV55*complexconjugate(Yx22) + UV56*complexconjugate(Yx32)) + UV56*(UV24*complexconjugate(Yx13) + UV25*complexconjugate(Yx23) + UV26*complexconjugate(Yx33)) + UV26*(UV54*complexconjugate(Yx13) + UV55*complexconjugate(Yx23) + UV56*complexconjugate(Yx33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_273 = Coupling(name = 'GC_273',
	 value = '(-(ZA21*(complexconjugate(UV24)*(Yv11*complexconjugate(UV51) + Yv21*complexconjugate(UV52) + Yv31*complexconjugate(UV53)) + complexconjugate(UV25)*(Yv12*complexconjugate(UV51) + Yv22*complexconjugate(UV52) + Yv32*complexconjugate(UV53)) + complexconjugate(UV26)*(Yv13*complexconjugate(UV51) + Yv23*complexconjugate(UV52) + Yv33*complexconjugate(UV53)))) - ZA21*((Yv11*complexconjugate(UV21) + Yv21*complexconjugate(UV22) + Yv31*complexconjugate(UV23))*complexconjugate(UV54) + (Yv12*complexconjugate(UV21) + Yv22*complexconjugate(UV22) + Yv32*complexconjugate(UV23))*complexconjugate(UV55) + (Yv13*complexconjugate(UV21) + Yv23*complexconjugate(UV22) + Yv33*complexconjugate(UV23))*complexconjugate(UV56)) + ZA22*((Yx11*complexconjugate(UV24) + Yx21*complexconjugate(UV25) + Yx31*complexconjugate(UV26))*complexconjugate(UV54) + (Yx12*complexconjugate(UV24) + Yx22*complexconjugate(UV25) + Yx32*complexconjugate(UV26))*complexconjugate(UV55) + (Yx13*complexconjugate(UV24) + Yx23*complexconjugate(UV25) + Yx33*complexconjugate(UV26))*complexconjugate(UV56) + complexconjugate(UV24)*(Yx11*complexconjugate(UV54) + Yx21*complexconjugate(UV55) + Yx31*complexconjugate(UV56)) + complexconjugate(UV25)*(Yx12*complexconjugate(UV54) + Yx22*complexconjugate(UV55) + Yx32*complexconjugate(UV56)) + complexconjugate(UV26)*(Yx13*complexconjugate(UV54) + Yx23*complexconjugate(UV55) + Yx33*complexconjugate(UV56))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_274 = Coupling(name = 'GC_274',
	 value = '(ZA21*(UV54*(UV21*complexconjugate(Yv11) + UV22*complexconjugate(Yv21) + UV23*complexconjugate(Yv31)) + UV55*(UV21*complexconjugate(Yv12) + UV22*complexconjugate(Yv22) + UV23*complexconjugate(Yv32)) + UV56*(UV21*complexconjugate(Yv13) + UV22*complexconjugate(Yv23) + UV23*complexconjugate(Yv33))) + ZA21*(UV24*(UV51*complexconjugate(Yv11) + UV52*complexconjugate(Yv21) + UV53*complexconjugate(Yv31)) + UV25*(UV51*complexconjugate(Yv12) + UV52*complexconjugate(Yv22) + UV53*complexconjugate(Yv32)) + UV26*(UV51*complexconjugate(Yv13) + UV52*complexconjugate(Yv23) + UV53*complexconjugate(Yv33))) - ZA22*(UV54*(UV24*complexconjugate(Yx11) + UV25*complexconjugate(Yx21) + UV26*complexconjugate(Yx31)) + UV24*(UV54*complexconjugate(Yx11) + UV55*complexconjugate(Yx21) + UV56*complexconjugate(Yx31)) + UV55*(UV24*complexconjugate(Yx12) + UV25*complexconjugate(Yx22) + UV26*complexconjugate(Yx32)) + UV25*(UV54*complexconjugate(Yx12) + UV55*complexconjugate(Yx22) + UV56*complexconjugate(Yx32)) + UV56*(UV24*complexconjugate(Yx13) + UV25*complexconjugate(Yx23) + UV26*complexconjugate(Yx33)) + UV26*(UV54*complexconjugate(Yx13) + UV55*complexconjugate(Yx23) + UV56*complexconjugate(Yx33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_275 = Coupling(name = 'GC_275',
	 value = '(-(ZA11*(complexconjugate(UV24)*(Yv11*complexconjugate(UV61) + Yv21*complexconjugate(UV62) + Yv31*complexconjugate(UV63)) + complexconjugate(UV25)*(Yv12*complexconjugate(UV61) + Yv22*complexconjugate(UV62) + Yv32*complexconjugate(UV63)) + complexconjugate(UV26)*(Yv13*complexconjugate(UV61) + Yv23*complexconjugate(UV62) + Yv33*complexconjugate(UV63)))) - ZA11*((Yv11*complexconjugate(UV21) + Yv21*complexconjugate(UV22) + Yv31*complexconjugate(UV23))*complexconjugate(UV64) + (Yv12*complexconjugate(UV21) + Yv22*complexconjugate(UV22) + Yv32*complexconjugate(UV23))*complexconjugate(UV65) + (Yv13*complexconjugate(UV21) + Yv23*complexconjugate(UV22) + Yv33*complexconjugate(UV23))*complexconjugate(UV66)) + ZA12*((Yx11*complexconjugate(UV24) + Yx21*complexconjugate(UV25) + Yx31*complexconjugate(UV26))*complexconjugate(UV64) + (Yx12*complexconjugate(UV24) + Yx22*complexconjugate(UV25) + Yx32*complexconjugate(UV26))*complexconjugate(UV65) + (Yx13*complexconjugate(UV24) + Yx23*complexconjugate(UV25) + Yx33*complexconjugate(UV26))*complexconjugate(UV66) + complexconjugate(UV24)*(Yx11*complexconjugate(UV64) + Yx21*complexconjugate(UV65) + Yx31*complexconjugate(UV66)) + complexconjugate(UV25)*(Yx12*complexconjugate(UV64) + Yx22*complexconjugate(UV65) + Yx32*complexconjugate(UV66)) + complexconjugate(UV26)*(Yx13*complexconjugate(UV64) + Yx23*complexconjugate(UV65) + Yx33*complexconjugate(UV66))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_276 = Coupling(name = 'GC_276',
	 value = '(ZA11*(UV64*(UV21*complexconjugate(Yv11) + UV22*complexconjugate(Yv21) + UV23*complexconjugate(Yv31)) + UV65*(UV21*complexconjugate(Yv12) + UV22*complexconjugate(Yv22) + UV23*complexconjugate(Yv32)) + UV66*(UV21*complexconjugate(Yv13) + UV22*complexconjugate(Yv23) + UV23*complexconjugate(Yv33))) + ZA11*(UV24*(UV61*complexconjugate(Yv11) + UV62*complexconjugate(Yv21) + UV63*complexconjugate(Yv31)) + UV25*(UV61*complexconjugate(Yv12) + UV62*complexconjugate(Yv22) + UV63*complexconjugate(Yv32)) + UV26*(UV61*complexconjugate(Yv13) + UV62*complexconjugate(Yv23) + UV63*complexconjugate(Yv33))) - ZA12*(UV64*(UV24*complexconjugate(Yx11) + UV25*complexconjugate(Yx21) + UV26*complexconjugate(Yx31)) + UV24*(UV64*complexconjugate(Yx11) + UV65*complexconjugate(Yx21) + UV66*complexconjugate(Yx31)) + UV65*(UV24*complexconjugate(Yx12) + UV25*complexconjugate(Yx22) + UV26*complexconjugate(Yx32)) + UV25*(UV64*complexconjugate(Yx12) + UV65*complexconjugate(Yx22) + UV66*complexconjugate(Yx32)) + UV66*(UV24*complexconjugate(Yx13) + UV25*complexconjugate(Yx23) + UV26*complexconjugate(Yx33)) + UV26*(UV64*complexconjugate(Yx13) + UV65*complexconjugate(Yx23) + UV66*complexconjugate(Yx33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_277 = Coupling(name = 'GC_277',
	 value = '(-(ZA21*(complexconjugate(UV24)*(Yv11*complexconjugate(UV61) + Yv21*complexconjugate(UV62) + Yv31*complexconjugate(UV63)) + complexconjugate(UV25)*(Yv12*complexconjugate(UV61) + Yv22*complexconjugate(UV62) + Yv32*complexconjugate(UV63)) + complexconjugate(UV26)*(Yv13*complexconjugate(UV61) + Yv23*complexconjugate(UV62) + Yv33*complexconjugate(UV63)))) - ZA21*((Yv11*complexconjugate(UV21) + Yv21*complexconjugate(UV22) + Yv31*complexconjugate(UV23))*complexconjugate(UV64) + (Yv12*complexconjugate(UV21) + Yv22*complexconjugate(UV22) + Yv32*complexconjugate(UV23))*complexconjugate(UV65) + (Yv13*complexconjugate(UV21) + Yv23*complexconjugate(UV22) + Yv33*complexconjugate(UV23))*complexconjugate(UV66)) + ZA22*((Yx11*complexconjugate(UV24) + Yx21*complexconjugate(UV25) + Yx31*complexconjugate(UV26))*complexconjugate(UV64) + (Yx12*complexconjugate(UV24) + Yx22*complexconjugate(UV25) + Yx32*complexconjugate(UV26))*complexconjugate(UV65) + (Yx13*complexconjugate(UV24) + Yx23*complexconjugate(UV25) + Yx33*complexconjugate(UV26))*complexconjugate(UV66) + complexconjugate(UV24)*(Yx11*complexconjugate(UV64) + Yx21*complexconjugate(UV65) + Yx31*complexconjugate(UV66)) + complexconjugate(UV25)*(Yx12*complexconjugate(UV64) + Yx22*complexconjugate(UV65) + Yx32*complexconjugate(UV66)) + complexconjugate(UV26)*(Yx13*complexconjugate(UV64) + Yx23*complexconjugate(UV65) + Yx33*complexconjugate(UV66))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_278 = Coupling(name = 'GC_278',
	 value = '(ZA21*(UV64*(UV21*complexconjugate(Yv11) + UV22*complexconjugate(Yv21) + UV23*complexconjugate(Yv31)) + UV65*(UV21*complexconjugate(Yv12) + UV22*complexconjugate(Yv22) + UV23*complexconjugate(Yv32)) + UV66*(UV21*complexconjugate(Yv13) + UV22*complexconjugate(Yv23) + UV23*complexconjugate(Yv33))) + ZA21*(UV24*(UV61*complexconjugate(Yv11) + UV62*complexconjugate(Yv21) + UV63*complexconjugate(Yv31)) + UV25*(UV61*complexconjugate(Yv12) + UV62*complexconjugate(Yv22) + UV63*complexconjugate(Yv32)) + UV26*(UV61*complexconjugate(Yv13) + UV62*complexconjugate(Yv23) + UV63*complexconjugate(Yv33))) - ZA22*(UV64*(UV24*complexconjugate(Yx11) + UV25*complexconjugate(Yx21) + UV26*complexconjugate(Yx31)) + UV24*(UV64*complexconjugate(Yx11) + UV65*complexconjugate(Yx21) + UV66*complexconjugate(Yx31)) + UV65*(UV24*complexconjugate(Yx12) + UV25*complexconjugate(Yx22) + UV26*complexconjugate(Yx32)) + UV25*(UV64*complexconjugate(Yx12) + UV65*complexconjugate(Yx22) + UV66*complexconjugate(Yx32)) + UV66*(UV24*complexconjugate(Yx13) + UV25*complexconjugate(Yx23) + UV26*complexconjugate(Yx33)) + UV26*(UV64*complexconjugate(Yx13) + UV65*complexconjugate(Yx23) + UV66*complexconjugate(Yx33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_279 = Coupling(name = 'GC_279',
	 value = '(-2*ZA11*((Yv11*complexconjugate(UV31) + Yv21*complexconjugate(UV32) + Yv31*complexconjugate(UV33))*complexconjugate(UV34) + (Yv12*complexconjugate(UV31) + Yv22*complexconjugate(UV32) + Yv32*complexconjugate(UV33))*complexconjugate(UV35) + (Yv13*complexconjugate(UV31) + Yv23*complexconjugate(UV32) + Yv33*complexconjugate(UV33))*complexconjugate(UV36)) + ZA12*(2*complexconjugate(UV34)*(Yx11*complexconjugate(UV34) + Yx21*complexconjugate(UV35) + Yx31*complexconjugate(UV36)) + 2*complexconjugate(UV35)*(Yx12*complexconjugate(UV34) + Yx22*complexconjugate(UV35) + Yx32*complexconjugate(UV36)) + 2*complexconjugate(UV36)*(Yx13*complexconjugate(UV34) + Yx23*complexconjugate(UV35) + Yx33*complexconjugate(UV36))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_280 = Coupling(name = 'GC_280',
	 value = '(2*ZA11*(UV34*(UV31*complexconjugate(Yv11) + UV32*complexconjugate(Yv21) + UV33*complexconjugate(Yv31)) + UV35*(UV31*complexconjugate(Yv12) + UV32*complexconjugate(Yv22) + UV33*complexconjugate(Yv32)) + UV36*(UV31*complexconjugate(Yv13) + UV32*complexconjugate(Yv23) + UV33*complexconjugate(Yv33))) - ZA12*(2*UV34*(UV34*complexconjugate(Yx11) + UV35*complexconjugate(Yx21) + UV36*complexconjugate(Yx31)) + 2*UV35*(UV34*complexconjugate(Yx12) + UV35*complexconjugate(Yx22) + UV36*complexconjugate(Yx32)) + 2*UV36*(UV34*complexconjugate(Yx13) + UV35*complexconjugate(Yx23) + UV36*complexconjugate(Yx33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_281 = Coupling(name = 'GC_281',
	 value = '(-2*ZA21*((Yv11*complexconjugate(UV31) + Yv21*complexconjugate(UV32) + Yv31*complexconjugate(UV33))*complexconjugate(UV34) + (Yv12*complexconjugate(UV31) + Yv22*complexconjugate(UV32) + Yv32*complexconjugate(UV33))*complexconjugate(UV35) + (Yv13*complexconjugate(UV31) + Yv23*complexconjugate(UV32) + Yv33*complexconjugate(UV33))*complexconjugate(UV36)) + ZA22*(2*complexconjugate(UV34)*(Yx11*complexconjugate(UV34) + Yx21*complexconjugate(UV35) + Yx31*complexconjugate(UV36)) + 2*complexconjugate(UV35)*(Yx12*complexconjugate(UV34) + Yx22*complexconjugate(UV35) + Yx32*complexconjugate(UV36)) + 2*complexconjugate(UV36)*(Yx13*complexconjugate(UV34) + Yx23*complexconjugate(UV35) + Yx33*complexconjugate(UV36))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_282 = Coupling(name = 'GC_282',
	 value = '(2*ZA21*(UV34*(UV31*complexconjugate(Yv11) + UV32*complexconjugate(Yv21) + UV33*complexconjugate(Yv31)) + UV35*(UV31*complexconjugate(Yv12) + UV32*complexconjugate(Yv22) + UV33*complexconjugate(Yv32)) + UV36*(UV31*complexconjugate(Yv13) + UV32*complexconjugate(Yv23) + UV33*complexconjugate(Yv33))) - ZA22*(2*UV34*(UV34*complexconjugate(Yx11) + UV35*complexconjugate(Yx21) + UV36*complexconjugate(Yx31)) + 2*UV35*(UV34*complexconjugate(Yx12) + UV35*complexconjugate(Yx22) + UV36*complexconjugate(Yx32)) + 2*UV36*(UV34*complexconjugate(Yx13) + UV35*complexconjugate(Yx23) + UV36*complexconjugate(Yx33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_283 = Coupling(name = 'GC_283',
	 value = '(-(ZA11*(complexconjugate(UV34)*(Yv11*complexconjugate(UV41) + Yv21*complexconjugate(UV42) + Yv31*complexconjugate(UV43)) + complexconjugate(UV35)*(Yv12*complexconjugate(UV41) + Yv22*complexconjugate(UV42) + Yv32*complexconjugate(UV43)) + complexconjugate(UV36)*(Yv13*complexconjugate(UV41) + Yv23*complexconjugate(UV42) + Yv33*complexconjugate(UV43)))) - ZA11*((Yv11*complexconjugate(UV31) + Yv21*complexconjugate(UV32) + Yv31*complexconjugate(UV33))*complexconjugate(UV44) + (Yv12*complexconjugate(UV31) + Yv22*complexconjugate(UV32) + Yv32*complexconjugate(UV33))*complexconjugate(UV45) + (Yv13*complexconjugate(UV31) + Yv23*complexconjugate(UV32) + Yv33*complexconjugate(UV33))*complexconjugate(UV46)) + ZA12*((Yx11*complexconjugate(UV34) + Yx21*complexconjugate(UV35) + Yx31*complexconjugate(UV36))*complexconjugate(UV44) + (Yx12*complexconjugate(UV34) + Yx22*complexconjugate(UV35) + Yx32*complexconjugate(UV36))*complexconjugate(UV45) + (Yx13*complexconjugate(UV34) + Yx23*complexconjugate(UV35) + Yx33*complexconjugate(UV36))*complexconjugate(UV46) + complexconjugate(UV34)*(Yx11*complexconjugate(UV44) + Yx21*complexconjugate(UV45) + Yx31*complexconjugate(UV46)) + complexconjugate(UV35)*(Yx12*complexconjugate(UV44) + Yx22*complexconjugate(UV45) + Yx32*complexconjugate(UV46)) + complexconjugate(UV36)*(Yx13*complexconjugate(UV44) + Yx23*complexconjugate(UV45) + Yx33*complexconjugate(UV46))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_284 = Coupling(name = 'GC_284',
	 value = '(ZA11*(UV44*(UV31*complexconjugate(Yv11) + UV32*complexconjugate(Yv21) + UV33*complexconjugate(Yv31)) + UV45*(UV31*complexconjugate(Yv12) + UV32*complexconjugate(Yv22) + UV33*complexconjugate(Yv32)) + UV46*(UV31*complexconjugate(Yv13) + UV32*complexconjugate(Yv23) + UV33*complexconjugate(Yv33))) + ZA11*(UV34*(UV41*complexconjugate(Yv11) + UV42*complexconjugate(Yv21) + UV43*complexconjugate(Yv31)) + UV35*(UV41*complexconjugate(Yv12) + UV42*complexconjugate(Yv22) + UV43*complexconjugate(Yv32)) + UV36*(UV41*complexconjugate(Yv13) + UV42*complexconjugate(Yv23) + UV43*complexconjugate(Yv33))) - ZA12*(UV44*(UV34*complexconjugate(Yx11) + UV35*complexconjugate(Yx21) + UV36*complexconjugate(Yx31)) + UV34*(UV44*complexconjugate(Yx11) + UV45*complexconjugate(Yx21) + UV46*complexconjugate(Yx31)) + UV45*(UV34*complexconjugate(Yx12) + UV35*complexconjugate(Yx22) + UV36*complexconjugate(Yx32)) + UV35*(UV44*complexconjugate(Yx12) + UV45*complexconjugate(Yx22) + UV46*complexconjugate(Yx32)) + UV46*(UV34*complexconjugate(Yx13) + UV35*complexconjugate(Yx23) + UV36*complexconjugate(Yx33)) + UV36*(UV44*complexconjugate(Yx13) + UV45*complexconjugate(Yx23) + UV46*complexconjugate(Yx33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_285 = Coupling(name = 'GC_285',
	 value = '(-(ZA21*(complexconjugate(UV34)*(Yv11*complexconjugate(UV41) + Yv21*complexconjugate(UV42) + Yv31*complexconjugate(UV43)) + complexconjugate(UV35)*(Yv12*complexconjugate(UV41) + Yv22*complexconjugate(UV42) + Yv32*complexconjugate(UV43)) + complexconjugate(UV36)*(Yv13*complexconjugate(UV41) + Yv23*complexconjugate(UV42) + Yv33*complexconjugate(UV43)))) - ZA21*((Yv11*complexconjugate(UV31) + Yv21*complexconjugate(UV32) + Yv31*complexconjugate(UV33))*complexconjugate(UV44) + (Yv12*complexconjugate(UV31) + Yv22*complexconjugate(UV32) + Yv32*complexconjugate(UV33))*complexconjugate(UV45) + (Yv13*complexconjugate(UV31) + Yv23*complexconjugate(UV32) + Yv33*complexconjugate(UV33))*complexconjugate(UV46)) + ZA22*((Yx11*complexconjugate(UV34) + Yx21*complexconjugate(UV35) + Yx31*complexconjugate(UV36))*complexconjugate(UV44) + (Yx12*complexconjugate(UV34) + Yx22*complexconjugate(UV35) + Yx32*complexconjugate(UV36))*complexconjugate(UV45) + (Yx13*complexconjugate(UV34) + Yx23*complexconjugate(UV35) + Yx33*complexconjugate(UV36))*complexconjugate(UV46) + complexconjugate(UV34)*(Yx11*complexconjugate(UV44) + Yx21*complexconjugate(UV45) + Yx31*complexconjugate(UV46)) + complexconjugate(UV35)*(Yx12*complexconjugate(UV44) + Yx22*complexconjugate(UV45) + Yx32*complexconjugate(UV46)) + complexconjugate(UV36)*(Yx13*complexconjugate(UV44) + Yx23*complexconjugate(UV45) + Yx33*complexconjugate(UV46))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_286 = Coupling(name = 'GC_286',
	 value = '(ZA21*(UV44*(UV31*complexconjugate(Yv11) + UV32*complexconjugate(Yv21) + UV33*complexconjugate(Yv31)) + UV45*(UV31*complexconjugate(Yv12) + UV32*complexconjugate(Yv22) + UV33*complexconjugate(Yv32)) + UV46*(UV31*complexconjugate(Yv13) + UV32*complexconjugate(Yv23) + UV33*complexconjugate(Yv33))) + ZA21*(UV34*(UV41*complexconjugate(Yv11) + UV42*complexconjugate(Yv21) + UV43*complexconjugate(Yv31)) + UV35*(UV41*complexconjugate(Yv12) + UV42*complexconjugate(Yv22) + UV43*complexconjugate(Yv32)) + UV36*(UV41*complexconjugate(Yv13) + UV42*complexconjugate(Yv23) + UV43*complexconjugate(Yv33))) - ZA22*(UV44*(UV34*complexconjugate(Yx11) + UV35*complexconjugate(Yx21) + UV36*complexconjugate(Yx31)) + UV34*(UV44*complexconjugate(Yx11) + UV45*complexconjugate(Yx21) + UV46*complexconjugate(Yx31)) + UV45*(UV34*complexconjugate(Yx12) + UV35*complexconjugate(Yx22) + UV36*complexconjugate(Yx32)) + UV35*(UV44*complexconjugate(Yx12) + UV45*complexconjugate(Yx22) + UV46*complexconjugate(Yx32)) + UV46*(UV34*complexconjugate(Yx13) + UV35*complexconjugate(Yx23) + UV36*complexconjugate(Yx33)) + UV36*(UV44*complexconjugate(Yx13) + UV45*complexconjugate(Yx23) + UV46*complexconjugate(Yx33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_287 = Coupling(name = 'GC_287',
	 value = '(-(ZA11*(complexconjugate(UV34)*(Yv11*complexconjugate(UV51) + Yv21*complexconjugate(UV52) + Yv31*complexconjugate(UV53)) + complexconjugate(UV35)*(Yv12*complexconjugate(UV51) + Yv22*complexconjugate(UV52) + Yv32*complexconjugate(UV53)) + complexconjugate(UV36)*(Yv13*complexconjugate(UV51) + Yv23*complexconjugate(UV52) + Yv33*complexconjugate(UV53)))) - ZA11*((Yv11*complexconjugate(UV31) + Yv21*complexconjugate(UV32) + Yv31*complexconjugate(UV33))*complexconjugate(UV54) + (Yv12*complexconjugate(UV31) + Yv22*complexconjugate(UV32) + Yv32*complexconjugate(UV33))*complexconjugate(UV55) + (Yv13*complexconjugate(UV31) + Yv23*complexconjugate(UV32) + Yv33*complexconjugate(UV33))*complexconjugate(UV56)) + ZA12*((Yx11*complexconjugate(UV34) + Yx21*complexconjugate(UV35) + Yx31*complexconjugate(UV36))*complexconjugate(UV54) + (Yx12*complexconjugate(UV34) + Yx22*complexconjugate(UV35) + Yx32*complexconjugate(UV36))*complexconjugate(UV55) + (Yx13*complexconjugate(UV34) + Yx23*complexconjugate(UV35) + Yx33*complexconjugate(UV36))*complexconjugate(UV56) + complexconjugate(UV34)*(Yx11*complexconjugate(UV54) + Yx21*complexconjugate(UV55) + Yx31*complexconjugate(UV56)) + complexconjugate(UV35)*(Yx12*complexconjugate(UV54) + Yx22*complexconjugate(UV55) + Yx32*complexconjugate(UV56)) + complexconjugate(UV36)*(Yx13*complexconjugate(UV54) + Yx23*complexconjugate(UV55) + Yx33*complexconjugate(UV56))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_288 = Coupling(name = 'GC_288',
	 value = '(ZA11*(UV54*(UV31*complexconjugate(Yv11) + UV32*complexconjugate(Yv21) + UV33*complexconjugate(Yv31)) + UV55*(UV31*complexconjugate(Yv12) + UV32*complexconjugate(Yv22) + UV33*complexconjugate(Yv32)) + UV56*(UV31*complexconjugate(Yv13) + UV32*complexconjugate(Yv23) + UV33*complexconjugate(Yv33))) + ZA11*(UV34*(UV51*complexconjugate(Yv11) + UV52*complexconjugate(Yv21) + UV53*complexconjugate(Yv31)) + UV35*(UV51*complexconjugate(Yv12) + UV52*complexconjugate(Yv22) + UV53*complexconjugate(Yv32)) + UV36*(UV51*complexconjugate(Yv13) + UV52*complexconjugate(Yv23) + UV53*complexconjugate(Yv33))) - ZA12*(UV54*(UV34*complexconjugate(Yx11) + UV35*complexconjugate(Yx21) + UV36*complexconjugate(Yx31)) + UV34*(UV54*complexconjugate(Yx11) + UV55*complexconjugate(Yx21) + UV56*complexconjugate(Yx31)) + UV55*(UV34*complexconjugate(Yx12) + UV35*complexconjugate(Yx22) + UV36*complexconjugate(Yx32)) + UV35*(UV54*complexconjugate(Yx12) + UV55*complexconjugate(Yx22) + UV56*complexconjugate(Yx32)) + UV56*(UV34*complexconjugate(Yx13) + UV35*complexconjugate(Yx23) + UV36*complexconjugate(Yx33)) + UV36*(UV54*complexconjugate(Yx13) + UV55*complexconjugate(Yx23) + UV56*complexconjugate(Yx33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_289 = Coupling(name = 'GC_289',
	 value = '(-(ZA21*(complexconjugate(UV34)*(Yv11*complexconjugate(UV51) + Yv21*complexconjugate(UV52) + Yv31*complexconjugate(UV53)) + complexconjugate(UV35)*(Yv12*complexconjugate(UV51) + Yv22*complexconjugate(UV52) + Yv32*complexconjugate(UV53)) + complexconjugate(UV36)*(Yv13*complexconjugate(UV51) + Yv23*complexconjugate(UV52) + Yv33*complexconjugate(UV53)))) - ZA21*((Yv11*complexconjugate(UV31) + Yv21*complexconjugate(UV32) + Yv31*complexconjugate(UV33))*complexconjugate(UV54) + (Yv12*complexconjugate(UV31) + Yv22*complexconjugate(UV32) + Yv32*complexconjugate(UV33))*complexconjugate(UV55) + (Yv13*complexconjugate(UV31) + Yv23*complexconjugate(UV32) + Yv33*complexconjugate(UV33))*complexconjugate(UV56)) + ZA22*((Yx11*complexconjugate(UV34) + Yx21*complexconjugate(UV35) + Yx31*complexconjugate(UV36))*complexconjugate(UV54) + (Yx12*complexconjugate(UV34) + Yx22*complexconjugate(UV35) + Yx32*complexconjugate(UV36))*complexconjugate(UV55) + (Yx13*complexconjugate(UV34) + Yx23*complexconjugate(UV35) + Yx33*complexconjugate(UV36))*complexconjugate(UV56) + complexconjugate(UV34)*(Yx11*complexconjugate(UV54) + Yx21*complexconjugate(UV55) + Yx31*complexconjugate(UV56)) + complexconjugate(UV35)*(Yx12*complexconjugate(UV54) + Yx22*complexconjugate(UV55) + Yx32*complexconjugate(UV56)) + complexconjugate(UV36)*(Yx13*complexconjugate(UV54) + Yx23*complexconjugate(UV55) + Yx33*complexconjugate(UV56))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_290 = Coupling(name = 'GC_290',
	 value = '(ZA21*(UV54*(UV31*complexconjugate(Yv11) + UV32*complexconjugate(Yv21) + UV33*complexconjugate(Yv31)) + UV55*(UV31*complexconjugate(Yv12) + UV32*complexconjugate(Yv22) + UV33*complexconjugate(Yv32)) + UV56*(UV31*complexconjugate(Yv13) + UV32*complexconjugate(Yv23) + UV33*complexconjugate(Yv33))) + ZA21*(UV34*(UV51*complexconjugate(Yv11) + UV52*complexconjugate(Yv21) + UV53*complexconjugate(Yv31)) + UV35*(UV51*complexconjugate(Yv12) + UV52*complexconjugate(Yv22) + UV53*complexconjugate(Yv32)) + UV36*(UV51*complexconjugate(Yv13) + UV52*complexconjugate(Yv23) + UV53*complexconjugate(Yv33))) - ZA22*(UV54*(UV34*complexconjugate(Yx11) + UV35*complexconjugate(Yx21) + UV36*complexconjugate(Yx31)) + UV34*(UV54*complexconjugate(Yx11) + UV55*complexconjugate(Yx21) + UV56*complexconjugate(Yx31)) + UV55*(UV34*complexconjugate(Yx12) + UV35*complexconjugate(Yx22) + UV36*complexconjugate(Yx32)) + UV35*(UV54*complexconjugate(Yx12) + UV55*complexconjugate(Yx22) + UV56*complexconjugate(Yx32)) + UV56*(UV34*complexconjugate(Yx13) + UV35*complexconjugate(Yx23) + UV36*complexconjugate(Yx33)) + UV36*(UV54*complexconjugate(Yx13) + UV55*complexconjugate(Yx23) + UV56*complexconjugate(Yx33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_291 = Coupling(name = 'GC_291',
	 value = '(-(ZA11*(complexconjugate(UV34)*(Yv11*complexconjugate(UV61) + Yv21*complexconjugate(UV62) + Yv31*complexconjugate(UV63)) + complexconjugate(UV35)*(Yv12*complexconjugate(UV61) + Yv22*complexconjugate(UV62) + Yv32*complexconjugate(UV63)) + complexconjugate(UV36)*(Yv13*complexconjugate(UV61) + Yv23*complexconjugate(UV62) + Yv33*complexconjugate(UV63)))) - ZA11*((Yv11*complexconjugate(UV31) + Yv21*complexconjugate(UV32) + Yv31*complexconjugate(UV33))*complexconjugate(UV64) + (Yv12*complexconjugate(UV31) + Yv22*complexconjugate(UV32) + Yv32*complexconjugate(UV33))*complexconjugate(UV65) + (Yv13*complexconjugate(UV31) + Yv23*complexconjugate(UV32) + Yv33*complexconjugate(UV33))*complexconjugate(UV66)) + ZA12*((Yx11*complexconjugate(UV34) + Yx21*complexconjugate(UV35) + Yx31*complexconjugate(UV36))*complexconjugate(UV64) + (Yx12*complexconjugate(UV34) + Yx22*complexconjugate(UV35) + Yx32*complexconjugate(UV36))*complexconjugate(UV65) + (Yx13*complexconjugate(UV34) + Yx23*complexconjugate(UV35) + Yx33*complexconjugate(UV36))*complexconjugate(UV66) + complexconjugate(UV34)*(Yx11*complexconjugate(UV64) + Yx21*complexconjugate(UV65) + Yx31*complexconjugate(UV66)) + complexconjugate(UV35)*(Yx12*complexconjugate(UV64) + Yx22*complexconjugate(UV65) + Yx32*complexconjugate(UV66)) + complexconjugate(UV36)*(Yx13*complexconjugate(UV64) + Yx23*complexconjugate(UV65) + Yx33*complexconjugate(UV66))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_292 = Coupling(name = 'GC_292',
	 value = '(ZA11*(UV64*(UV31*complexconjugate(Yv11) + UV32*complexconjugate(Yv21) + UV33*complexconjugate(Yv31)) + UV65*(UV31*complexconjugate(Yv12) + UV32*complexconjugate(Yv22) + UV33*complexconjugate(Yv32)) + UV66*(UV31*complexconjugate(Yv13) + UV32*complexconjugate(Yv23) + UV33*complexconjugate(Yv33))) + ZA11*(UV34*(UV61*complexconjugate(Yv11) + UV62*complexconjugate(Yv21) + UV63*complexconjugate(Yv31)) + UV35*(UV61*complexconjugate(Yv12) + UV62*complexconjugate(Yv22) + UV63*complexconjugate(Yv32)) + UV36*(UV61*complexconjugate(Yv13) + UV62*complexconjugate(Yv23) + UV63*complexconjugate(Yv33))) - ZA12*(UV64*(UV34*complexconjugate(Yx11) + UV35*complexconjugate(Yx21) + UV36*complexconjugate(Yx31)) + UV34*(UV64*complexconjugate(Yx11) + UV65*complexconjugate(Yx21) + UV66*complexconjugate(Yx31)) + UV65*(UV34*complexconjugate(Yx12) + UV35*complexconjugate(Yx22) + UV36*complexconjugate(Yx32)) + UV35*(UV64*complexconjugate(Yx12) + UV65*complexconjugate(Yx22) + UV66*complexconjugate(Yx32)) + UV66*(UV34*complexconjugate(Yx13) + UV35*complexconjugate(Yx23) + UV36*complexconjugate(Yx33)) + UV36*(UV64*complexconjugate(Yx13) + UV65*complexconjugate(Yx23) + UV66*complexconjugate(Yx33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_293 = Coupling(name = 'GC_293',
	 value = '(-(ZA21*(complexconjugate(UV34)*(Yv11*complexconjugate(UV61) + Yv21*complexconjugate(UV62) + Yv31*complexconjugate(UV63)) + complexconjugate(UV35)*(Yv12*complexconjugate(UV61) + Yv22*complexconjugate(UV62) + Yv32*complexconjugate(UV63)) + complexconjugate(UV36)*(Yv13*complexconjugate(UV61) + Yv23*complexconjugate(UV62) + Yv33*complexconjugate(UV63)))) - ZA21*((Yv11*complexconjugate(UV31) + Yv21*complexconjugate(UV32) + Yv31*complexconjugate(UV33))*complexconjugate(UV64) + (Yv12*complexconjugate(UV31) + Yv22*complexconjugate(UV32) + Yv32*complexconjugate(UV33))*complexconjugate(UV65) + (Yv13*complexconjugate(UV31) + Yv23*complexconjugate(UV32) + Yv33*complexconjugate(UV33))*complexconjugate(UV66)) + ZA22*((Yx11*complexconjugate(UV34) + Yx21*complexconjugate(UV35) + Yx31*complexconjugate(UV36))*complexconjugate(UV64) + (Yx12*complexconjugate(UV34) + Yx22*complexconjugate(UV35) + Yx32*complexconjugate(UV36))*complexconjugate(UV65) + (Yx13*complexconjugate(UV34) + Yx23*complexconjugate(UV35) + Yx33*complexconjugate(UV36))*complexconjugate(UV66) + complexconjugate(UV34)*(Yx11*complexconjugate(UV64) + Yx21*complexconjugate(UV65) + Yx31*complexconjugate(UV66)) + complexconjugate(UV35)*(Yx12*complexconjugate(UV64) + Yx22*complexconjugate(UV65) + Yx32*complexconjugate(UV66)) + complexconjugate(UV36)*(Yx13*complexconjugate(UV64) + Yx23*complexconjugate(UV65) + Yx33*complexconjugate(UV66))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_294 = Coupling(name = 'GC_294',
	 value = '(ZA21*(UV64*(UV31*complexconjugate(Yv11) + UV32*complexconjugate(Yv21) + UV33*complexconjugate(Yv31)) + UV65*(UV31*complexconjugate(Yv12) + UV32*complexconjugate(Yv22) + UV33*complexconjugate(Yv32)) + UV66*(UV31*complexconjugate(Yv13) + UV32*complexconjugate(Yv23) + UV33*complexconjugate(Yv33))) + ZA21*(UV34*(UV61*complexconjugate(Yv11) + UV62*complexconjugate(Yv21) + UV63*complexconjugate(Yv31)) + UV35*(UV61*complexconjugate(Yv12) + UV62*complexconjugate(Yv22) + UV63*complexconjugate(Yv32)) + UV36*(UV61*complexconjugate(Yv13) + UV62*complexconjugate(Yv23) + UV63*complexconjugate(Yv33))) - ZA22*(UV64*(UV34*complexconjugate(Yx11) + UV35*complexconjugate(Yx21) + UV36*complexconjugate(Yx31)) + UV34*(UV64*complexconjugate(Yx11) + UV65*complexconjugate(Yx21) + UV66*complexconjugate(Yx31)) + UV65*(UV34*complexconjugate(Yx12) + UV35*complexconjugate(Yx22) + UV36*complexconjugate(Yx32)) + UV35*(UV64*complexconjugate(Yx12) + UV65*complexconjugate(Yx22) + UV66*complexconjugate(Yx32)) + UV66*(UV34*complexconjugate(Yx13) + UV35*complexconjugate(Yx23) + UV36*complexconjugate(Yx33)) + UV36*(UV64*complexconjugate(Yx13) + UV65*complexconjugate(Yx23) + UV66*complexconjugate(Yx33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_295 = Coupling(name = 'GC_295',
	 value = '(-2*ZA11*((Yv11*complexconjugate(UV41) + Yv21*complexconjugate(UV42) + Yv31*complexconjugate(UV43))*complexconjugate(UV44) + (Yv12*complexconjugate(UV41) + Yv22*complexconjugate(UV42) + Yv32*complexconjugate(UV43))*complexconjugate(UV45) + (Yv13*complexconjugate(UV41) + Yv23*complexconjugate(UV42) + Yv33*complexconjugate(UV43))*complexconjugate(UV46)) + ZA12*(2*complexconjugate(UV44)*(Yx11*complexconjugate(UV44) + Yx21*complexconjugate(UV45) + Yx31*complexconjugate(UV46)) + 2*complexconjugate(UV45)*(Yx12*complexconjugate(UV44) + Yx22*complexconjugate(UV45) + Yx32*complexconjugate(UV46)) + 2*complexconjugate(UV46)*(Yx13*complexconjugate(UV44) + Yx23*complexconjugate(UV45) + Yx33*complexconjugate(UV46))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_296 = Coupling(name = 'GC_296',
	 value = '(2*ZA11*(UV44*(UV41*complexconjugate(Yv11) + UV42*complexconjugate(Yv21) + UV43*complexconjugate(Yv31)) + UV45*(UV41*complexconjugate(Yv12) + UV42*complexconjugate(Yv22) + UV43*complexconjugate(Yv32)) + UV46*(UV41*complexconjugate(Yv13) + UV42*complexconjugate(Yv23) + UV43*complexconjugate(Yv33))) - ZA12*(2*UV44*(UV44*complexconjugate(Yx11) + UV45*complexconjugate(Yx21) + UV46*complexconjugate(Yx31)) + 2*UV45*(UV44*complexconjugate(Yx12) + UV45*complexconjugate(Yx22) + UV46*complexconjugate(Yx32)) + 2*UV46*(UV44*complexconjugate(Yx13) + UV45*complexconjugate(Yx23) + UV46*complexconjugate(Yx33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_297 = Coupling(name = 'GC_297',
	 value = '(-2*ZA21*((Yv11*complexconjugate(UV41) + Yv21*complexconjugate(UV42) + Yv31*complexconjugate(UV43))*complexconjugate(UV44) + (Yv12*complexconjugate(UV41) + Yv22*complexconjugate(UV42) + Yv32*complexconjugate(UV43))*complexconjugate(UV45) + (Yv13*complexconjugate(UV41) + Yv23*complexconjugate(UV42) + Yv33*complexconjugate(UV43))*complexconjugate(UV46)) + ZA22*(2*complexconjugate(UV44)*(Yx11*complexconjugate(UV44) + Yx21*complexconjugate(UV45) + Yx31*complexconjugate(UV46)) + 2*complexconjugate(UV45)*(Yx12*complexconjugate(UV44) + Yx22*complexconjugate(UV45) + Yx32*complexconjugate(UV46)) + 2*complexconjugate(UV46)*(Yx13*complexconjugate(UV44) + Yx23*complexconjugate(UV45) + Yx33*complexconjugate(UV46))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_298 = Coupling(name = 'GC_298',
	 value = '(2*ZA21*(UV44*(UV41*complexconjugate(Yv11) + UV42*complexconjugate(Yv21) + UV43*complexconjugate(Yv31)) + UV45*(UV41*complexconjugate(Yv12) + UV42*complexconjugate(Yv22) + UV43*complexconjugate(Yv32)) + UV46*(UV41*complexconjugate(Yv13) + UV42*complexconjugate(Yv23) + UV43*complexconjugate(Yv33))) - ZA22*(2*UV44*(UV44*complexconjugate(Yx11) + UV45*complexconjugate(Yx21) + UV46*complexconjugate(Yx31)) + 2*UV45*(UV44*complexconjugate(Yx12) + UV45*complexconjugate(Yx22) + UV46*complexconjugate(Yx32)) + 2*UV46*(UV44*complexconjugate(Yx13) + UV45*complexconjugate(Yx23) + UV46*complexconjugate(Yx33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_299 = Coupling(name = 'GC_299',
	 value = '(-(ZA11*(complexconjugate(UV44)*(Yv11*complexconjugate(UV51) + Yv21*complexconjugate(UV52) + Yv31*complexconjugate(UV53)) + complexconjugate(UV45)*(Yv12*complexconjugate(UV51) + Yv22*complexconjugate(UV52) + Yv32*complexconjugate(UV53)) + complexconjugate(UV46)*(Yv13*complexconjugate(UV51) + Yv23*complexconjugate(UV52) + Yv33*complexconjugate(UV53)))) - ZA11*((Yv11*complexconjugate(UV41) + Yv21*complexconjugate(UV42) + Yv31*complexconjugate(UV43))*complexconjugate(UV54) + (Yv12*complexconjugate(UV41) + Yv22*complexconjugate(UV42) + Yv32*complexconjugate(UV43))*complexconjugate(UV55) + (Yv13*complexconjugate(UV41) + Yv23*complexconjugate(UV42) + Yv33*complexconjugate(UV43))*complexconjugate(UV56)) + ZA12*((Yx11*complexconjugate(UV44) + Yx21*complexconjugate(UV45) + Yx31*complexconjugate(UV46))*complexconjugate(UV54) + (Yx12*complexconjugate(UV44) + Yx22*complexconjugate(UV45) + Yx32*complexconjugate(UV46))*complexconjugate(UV55) + (Yx13*complexconjugate(UV44) + Yx23*complexconjugate(UV45) + Yx33*complexconjugate(UV46))*complexconjugate(UV56) + complexconjugate(UV44)*(Yx11*complexconjugate(UV54) + Yx21*complexconjugate(UV55) + Yx31*complexconjugate(UV56)) + complexconjugate(UV45)*(Yx12*complexconjugate(UV54) + Yx22*complexconjugate(UV55) + Yx32*complexconjugate(UV56)) + complexconjugate(UV46)*(Yx13*complexconjugate(UV54) + Yx23*complexconjugate(UV55) + Yx33*complexconjugate(UV56))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_300 = Coupling(name = 'GC_300',
	 value = '(ZA11*(UV54*(UV41*complexconjugate(Yv11) + UV42*complexconjugate(Yv21) + UV43*complexconjugate(Yv31)) + UV55*(UV41*complexconjugate(Yv12) + UV42*complexconjugate(Yv22) + UV43*complexconjugate(Yv32)) + UV56*(UV41*complexconjugate(Yv13) + UV42*complexconjugate(Yv23) + UV43*complexconjugate(Yv33))) + ZA11*(UV44*(UV51*complexconjugate(Yv11) + UV52*complexconjugate(Yv21) + UV53*complexconjugate(Yv31)) + UV45*(UV51*complexconjugate(Yv12) + UV52*complexconjugate(Yv22) + UV53*complexconjugate(Yv32)) + UV46*(UV51*complexconjugate(Yv13) + UV52*complexconjugate(Yv23) + UV53*complexconjugate(Yv33))) - ZA12*(UV54*(UV44*complexconjugate(Yx11) + UV45*complexconjugate(Yx21) + UV46*complexconjugate(Yx31)) + UV44*(UV54*complexconjugate(Yx11) + UV55*complexconjugate(Yx21) + UV56*complexconjugate(Yx31)) + UV55*(UV44*complexconjugate(Yx12) + UV45*complexconjugate(Yx22) + UV46*complexconjugate(Yx32)) + UV45*(UV54*complexconjugate(Yx12) + UV55*complexconjugate(Yx22) + UV56*complexconjugate(Yx32)) + UV56*(UV44*complexconjugate(Yx13) + UV45*complexconjugate(Yx23) + UV46*complexconjugate(Yx33)) + UV46*(UV54*complexconjugate(Yx13) + UV55*complexconjugate(Yx23) + UV56*complexconjugate(Yx33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_301 = Coupling(name = 'GC_301',
	 value = '(-(ZA21*(complexconjugate(UV44)*(Yv11*complexconjugate(UV51) + Yv21*complexconjugate(UV52) + Yv31*complexconjugate(UV53)) + complexconjugate(UV45)*(Yv12*complexconjugate(UV51) + Yv22*complexconjugate(UV52) + Yv32*complexconjugate(UV53)) + complexconjugate(UV46)*(Yv13*complexconjugate(UV51) + Yv23*complexconjugate(UV52) + Yv33*complexconjugate(UV53)))) - ZA21*((Yv11*complexconjugate(UV41) + Yv21*complexconjugate(UV42) + Yv31*complexconjugate(UV43))*complexconjugate(UV54) + (Yv12*complexconjugate(UV41) + Yv22*complexconjugate(UV42) + Yv32*complexconjugate(UV43))*complexconjugate(UV55) + (Yv13*complexconjugate(UV41) + Yv23*complexconjugate(UV42) + Yv33*complexconjugate(UV43))*complexconjugate(UV56)) + ZA22*((Yx11*complexconjugate(UV44) + Yx21*complexconjugate(UV45) + Yx31*complexconjugate(UV46))*complexconjugate(UV54) + (Yx12*complexconjugate(UV44) + Yx22*complexconjugate(UV45) + Yx32*complexconjugate(UV46))*complexconjugate(UV55) + (Yx13*complexconjugate(UV44) + Yx23*complexconjugate(UV45) + Yx33*complexconjugate(UV46))*complexconjugate(UV56) + complexconjugate(UV44)*(Yx11*complexconjugate(UV54) + Yx21*complexconjugate(UV55) + Yx31*complexconjugate(UV56)) + complexconjugate(UV45)*(Yx12*complexconjugate(UV54) + Yx22*complexconjugate(UV55) + Yx32*complexconjugate(UV56)) + complexconjugate(UV46)*(Yx13*complexconjugate(UV54) + Yx23*complexconjugate(UV55) + Yx33*complexconjugate(UV56))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_302 = Coupling(name = 'GC_302',
	 value = '(ZA21*(UV54*(UV41*complexconjugate(Yv11) + UV42*complexconjugate(Yv21) + UV43*complexconjugate(Yv31)) + UV55*(UV41*complexconjugate(Yv12) + UV42*complexconjugate(Yv22) + UV43*complexconjugate(Yv32)) + UV56*(UV41*complexconjugate(Yv13) + UV42*complexconjugate(Yv23) + UV43*complexconjugate(Yv33))) + ZA21*(UV44*(UV51*complexconjugate(Yv11) + UV52*complexconjugate(Yv21) + UV53*complexconjugate(Yv31)) + UV45*(UV51*complexconjugate(Yv12) + UV52*complexconjugate(Yv22) + UV53*complexconjugate(Yv32)) + UV46*(UV51*complexconjugate(Yv13) + UV52*complexconjugate(Yv23) + UV53*complexconjugate(Yv33))) - ZA22*(UV54*(UV44*complexconjugate(Yx11) + UV45*complexconjugate(Yx21) + UV46*complexconjugate(Yx31)) + UV44*(UV54*complexconjugate(Yx11) + UV55*complexconjugate(Yx21) + UV56*complexconjugate(Yx31)) + UV55*(UV44*complexconjugate(Yx12) + UV45*complexconjugate(Yx22) + UV46*complexconjugate(Yx32)) + UV45*(UV54*complexconjugate(Yx12) + UV55*complexconjugate(Yx22) + UV56*complexconjugate(Yx32)) + UV56*(UV44*complexconjugate(Yx13) + UV45*complexconjugate(Yx23) + UV46*complexconjugate(Yx33)) + UV46*(UV54*complexconjugate(Yx13) + UV55*complexconjugate(Yx23) + UV56*complexconjugate(Yx33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_303 = Coupling(name = 'GC_303',
	 value = '(-(ZA11*(complexconjugate(UV44)*(Yv11*complexconjugate(UV61) + Yv21*complexconjugate(UV62) + Yv31*complexconjugate(UV63)) + complexconjugate(UV45)*(Yv12*complexconjugate(UV61) + Yv22*complexconjugate(UV62) + Yv32*complexconjugate(UV63)) + complexconjugate(UV46)*(Yv13*complexconjugate(UV61) + Yv23*complexconjugate(UV62) + Yv33*complexconjugate(UV63)))) - ZA11*((Yv11*complexconjugate(UV41) + Yv21*complexconjugate(UV42) + Yv31*complexconjugate(UV43))*complexconjugate(UV64) + (Yv12*complexconjugate(UV41) + Yv22*complexconjugate(UV42) + Yv32*complexconjugate(UV43))*complexconjugate(UV65) + (Yv13*complexconjugate(UV41) + Yv23*complexconjugate(UV42) + Yv33*complexconjugate(UV43))*complexconjugate(UV66)) + ZA12*((Yx11*complexconjugate(UV44) + Yx21*complexconjugate(UV45) + Yx31*complexconjugate(UV46))*complexconjugate(UV64) + (Yx12*complexconjugate(UV44) + Yx22*complexconjugate(UV45) + Yx32*complexconjugate(UV46))*complexconjugate(UV65) + (Yx13*complexconjugate(UV44) + Yx23*complexconjugate(UV45) + Yx33*complexconjugate(UV46))*complexconjugate(UV66) + complexconjugate(UV44)*(Yx11*complexconjugate(UV64) + Yx21*complexconjugate(UV65) + Yx31*complexconjugate(UV66)) + complexconjugate(UV45)*(Yx12*complexconjugate(UV64) + Yx22*complexconjugate(UV65) + Yx32*complexconjugate(UV66)) + complexconjugate(UV46)*(Yx13*complexconjugate(UV64) + Yx23*complexconjugate(UV65) + Yx33*complexconjugate(UV66))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_304 = Coupling(name = 'GC_304',
	 value = '(ZA11*(UV64*(UV41*complexconjugate(Yv11) + UV42*complexconjugate(Yv21) + UV43*complexconjugate(Yv31)) + UV65*(UV41*complexconjugate(Yv12) + UV42*complexconjugate(Yv22) + UV43*complexconjugate(Yv32)) + UV66*(UV41*complexconjugate(Yv13) + UV42*complexconjugate(Yv23) + UV43*complexconjugate(Yv33))) + ZA11*(UV44*(UV61*complexconjugate(Yv11) + UV62*complexconjugate(Yv21) + UV63*complexconjugate(Yv31)) + UV45*(UV61*complexconjugate(Yv12) + UV62*complexconjugate(Yv22) + UV63*complexconjugate(Yv32)) + UV46*(UV61*complexconjugate(Yv13) + UV62*complexconjugate(Yv23) + UV63*complexconjugate(Yv33))) - ZA12*(UV64*(UV44*complexconjugate(Yx11) + UV45*complexconjugate(Yx21) + UV46*complexconjugate(Yx31)) + UV44*(UV64*complexconjugate(Yx11) + UV65*complexconjugate(Yx21) + UV66*complexconjugate(Yx31)) + UV65*(UV44*complexconjugate(Yx12) + UV45*complexconjugate(Yx22) + UV46*complexconjugate(Yx32)) + UV45*(UV64*complexconjugate(Yx12) + UV65*complexconjugate(Yx22) + UV66*complexconjugate(Yx32)) + UV66*(UV44*complexconjugate(Yx13) + UV45*complexconjugate(Yx23) + UV46*complexconjugate(Yx33)) + UV46*(UV64*complexconjugate(Yx13) + UV65*complexconjugate(Yx23) + UV66*complexconjugate(Yx33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_305 = Coupling(name = 'GC_305',
	 value = '(-(ZA21*(complexconjugate(UV44)*(Yv11*complexconjugate(UV61) + Yv21*complexconjugate(UV62) + Yv31*complexconjugate(UV63)) + complexconjugate(UV45)*(Yv12*complexconjugate(UV61) + Yv22*complexconjugate(UV62) + Yv32*complexconjugate(UV63)) + complexconjugate(UV46)*(Yv13*complexconjugate(UV61) + Yv23*complexconjugate(UV62) + Yv33*complexconjugate(UV63)))) - ZA21*((Yv11*complexconjugate(UV41) + Yv21*complexconjugate(UV42) + Yv31*complexconjugate(UV43))*complexconjugate(UV64) + (Yv12*complexconjugate(UV41) + Yv22*complexconjugate(UV42) + Yv32*complexconjugate(UV43))*complexconjugate(UV65) + (Yv13*complexconjugate(UV41) + Yv23*complexconjugate(UV42) + Yv33*complexconjugate(UV43))*complexconjugate(UV66)) + ZA22*((Yx11*complexconjugate(UV44) + Yx21*complexconjugate(UV45) + Yx31*complexconjugate(UV46))*complexconjugate(UV64) + (Yx12*complexconjugate(UV44) + Yx22*complexconjugate(UV45) + Yx32*complexconjugate(UV46))*complexconjugate(UV65) + (Yx13*complexconjugate(UV44) + Yx23*complexconjugate(UV45) + Yx33*complexconjugate(UV46))*complexconjugate(UV66) + complexconjugate(UV44)*(Yx11*complexconjugate(UV64) + Yx21*complexconjugate(UV65) + Yx31*complexconjugate(UV66)) + complexconjugate(UV45)*(Yx12*complexconjugate(UV64) + Yx22*complexconjugate(UV65) + Yx32*complexconjugate(UV66)) + complexconjugate(UV46)*(Yx13*complexconjugate(UV64) + Yx23*complexconjugate(UV65) + Yx33*complexconjugate(UV66))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_306 = Coupling(name = 'GC_306',
	 value = '(ZA21*(UV64*(UV41*complexconjugate(Yv11) + UV42*complexconjugate(Yv21) + UV43*complexconjugate(Yv31)) + UV65*(UV41*complexconjugate(Yv12) + UV42*complexconjugate(Yv22) + UV43*complexconjugate(Yv32)) + UV66*(UV41*complexconjugate(Yv13) + UV42*complexconjugate(Yv23) + UV43*complexconjugate(Yv33))) + ZA21*(UV44*(UV61*complexconjugate(Yv11) + UV62*complexconjugate(Yv21) + UV63*complexconjugate(Yv31)) + UV45*(UV61*complexconjugate(Yv12) + UV62*complexconjugate(Yv22) + UV63*complexconjugate(Yv32)) + UV46*(UV61*complexconjugate(Yv13) + UV62*complexconjugate(Yv23) + UV63*complexconjugate(Yv33))) - ZA22*(UV64*(UV44*complexconjugate(Yx11) + UV45*complexconjugate(Yx21) + UV46*complexconjugate(Yx31)) + UV44*(UV64*complexconjugate(Yx11) + UV65*complexconjugate(Yx21) + UV66*complexconjugate(Yx31)) + UV65*(UV44*complexconjugate(Yx12) + UV45*complexconjugate(Yx22) + UV46*complexconjugate(Yx32)) + UV45*(UV64*complexconjugate(Yx12) + UV65*complexconjugate(Yx22) + UV66*complexconjugate(Yx32)) + UV66*(UV44*complexconjugate(Yx13) + UV45*complexconjugate(Yx23) + UV46*complexconjugate(Yx33)) + UV46*(UV64*complexconjugate(Yx13) + UV65*complexconjugate(Yx23) + UV66*complexconjugate(Yx33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_307 = Coupling(name = 'GC_307',
	 value = '(-2*ZA11*((Yv11*complexconjugate(UV51) + Yv21*complexconjugate(UV52) + Yv31*complexconjugate(UV53))*complexconjugate(UV54) + (Yv12*complexconjugate(UV51) + Yv22*complexconjugate(UV52) + Yv32*complexconjugate(UV53))*complexconjugate(UV55) + (Yv13*complexconjugate(UV51) + Yv23*complexconjugate(UV52) + Yv33*complexconjugate(UV53))*complexconjugate(UV56)) + ZA12*(2*complexconjugate(UV54)*(Yx11*complexconjugate(UV54) + Yx21*complexconjugate(UV55) + Yx31*complexconjugate(UV56)) + 2*complexconjugate(UV55)*(Yx12*complexconjugate(UV54) + Yx22*complexconjugate(UV55) + Yx32*complexconjugate(UV56)) + 2*complexconjugate(UV56)*(Yx13*complexconjugate(UV54) + Yx23*complexconjugate(UV55) + Yx33*complexconjugate(UV56))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_308 = Coupling(name = 'GC_308',
	 value = '(2*ZA11*(UV54*(UV51*complexconjugate(Yv11) + UV52*complexconjugate(Yv21) + UV53*complexconjugate(Yv31)) + UV55*(UV51*complexconjugate(Yv12) + UV52*complexconjugate(Yv22) + UV53*complexconjugate(Yv32)) + UV56*(UV51*complexconjugate(Yv13) + UV52*complexconjugate(Yv23) + UV53*complexconjugate(Yv33))) - ZA12*(2*UV54*(UV54*complexconjugate(Yx11) + UV55*complexconjugate(Yx21) + UV56*complexconjugate(Yx31)) + 2*UV55*(UV54*complexconjugate(Yx12) + UV55*complexconjugate(Yx22) + UV56*complexconjugate(Yx32)) + 2*UV56*(UV54*complexconjugate(Yx13) + UV55*complexconjugate(Yx23) + UV56*complexconjugate(Yx33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_309 = Coupling(name = 'GC_309',
	 value = '(-2*ZA21*((Yv11*complexconjugate(UV51) + Yv21*complexconjugate(UV52) + Yv31*complexconjugate(UV53))*complexconjugate(UV54) + (Yv12*complexconjugate(UV51) + Yv22*complexconjugate(UV52) + Yv32*complexconjugate(UV53))*complexconjugate(UV55) + (Yv13*complexconjugate(UV51) + Yv23*complexconjugate(UV52) + Yv33*complexconjugate(UV53))*complexconjugate(UV56)) + ZA22*(2*complexconjugate(UV54)*(Yx11*complexconjugate(UV54) + Yx21*complexconjugate(UV55) + Yx31*complexconjugate(UV56)) + 2*complexconjugate(UV55)*(Yx12*complexconjugate(UV54) + Yx22*complexconjugate(UV55) + Yx32*complexconjugate(UV56)) + 2*complexconjugate(UV56)*(Yx13*complexconjugate(UV54) + Yx23*complexconjugate(UV55) + Yx33*complexconjugate(UV56))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_310 = Coupling(name = 'GC_310',
	 value = '(2*ZA21*(UV54*(UV51*complexconjugate(Yv11) + UV52*complexconjugate(Yv21) + UV53*complexconjugate(Yv31)) + UV55*(UV51*complexconjugate(Yv12) + UV52*complexconjugate(Yv22) + UV53*complexconjugate(Yv32)) + UV56*(UV51*complexconjugate(Yv13) + UV52*complexconjugate(Yv23) + UV53*complexconjugate(Yv33))) - ZA22*(2*UV54*(UV54*complexconjugate(Yx11) + UV55*complexconjugate(Yx21) + UV56*complexconjugate(Yx31)) + 2*UV55*(UV54*complexconjugate(Yx12) + UV55*complexconjugate(Yx22) + UV56*complexconjugate(Yx32)) + 2*UV56*(UV54*complexconjugate(Yx13) + UV55*complexconjugate(Yx23) + UV56*complexconjugate(Yx33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_311 = Coupling(name = 'GC_311',
	 value = '(-(ZA11*(complexconjugate(UV54)*(Yv11*complexconjugate(UV61) + Yv21*complexconjugate(UV62) + Yv31*complexconjugate(UV63)) + complexconjugate(UV55)*(Yv12*complexconjugate(UV61) + Yv22*complexconjugate(UV62) + Yv32*complexconjugate(UV63)) + complexconjugate(UV56)*(Yv13*complexconjugate(UV61) + Yv23*complexconjugate(UV62) + Yv33*complexconjugate(UV63)))) - ZA11*((Yv11*complexconjugate(UV51) + Yv21*complexconjugate(UV52) + Yv31*complexconjugate(UV53))*complexconjugate(UV64) + (Yv12*complexconjugate(UV51) + Yv22*complexconjugate(UV52) + Yv32*complexconjugate(UV53))*complexconjugate(UV65) + (Yv13*complexconjugate(UV51) + Yv23*complexconjugate(UV52) + Yv33*complexconjugate(UV53))*complexconjugate(UV66)) + ZA12*((Yx11*complexconjugate(UV54) + Yx21*complexconjugate(UV55) + Yx31*complexconjugate(UV56))*complexconjugate(UV64) + (Yx12*complexconjugate(UV54) + Yx22*complexconjugate(UV55) + Yx32*complexconjugate(UV56))*complexconjugate(UV65) + (Yx13*complexconjugate(UV54) + Yx23*complexconjugate(UV55) + Yx33*complexconjugate(UV56))*complexconjugate(UV66) + complexconjugate(UV54)*(Yx11*complexconjugate(UV64) + Yx21*complexconjugate(UV65) + Yx31*complexconjugate(UV66)) + complexconjugate(UV55)*(Yx12*complexconjugate(UV64) + Yx22*complexconjugate(UV65) + Yx32*complexconjugate(UV66)) + complexconjugate(UV56)*(Yx13*complexconjugate(UV64) + Yx23*complexconjugate(UV65) + Yx33*complexconjugate(UV66))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_312 = Coupling(name = 'GC_312',
	 value = '(ZA11*(UV64*(UV51*complexconjugate(Yv11) + UV52*complexconjugate(Yv21) + UV53*complexconjugate(Yv31)) + UV65*(UV51*complexconjugate(Yv12) + UV52*complexconjugate(Yv22) + UV53*complexconjugate(Yv32)) + UV66*(UV51*complexconjugate(Yv13) + UV52*complexconjugate(Yv23) + UV53*complexconjugate(Yv33))) + ZA11*(UV54*(UV61*complexconjugate(Yv11) + UV62*complexconjugate(Yv21) + UV63*complexconjugate(Yv31)) + UV55*(UV61*complexconjugate(Yv12) + UV62*complexconjugate(Yv22) + UV63*complexconjugate(Yv32)) + UV56*(UV61*complexconjugate(Yv13) + UV62*complexconjugate(Yv23) + UV63*complexconjugate(Yv33))) - ZA12*(UV64*(UV54*complexconjugate(Yx11) + UV55*complexconjugate(Yx21) + UV56*complexconjugate(Yx31)) + UV54*(UV64*complexconjugate(Yx11) + UV65*complexconjugate(Yx21) + UV66*complexconjugate(Yx31)) + UV65*(UV54*complexconjugate(Yx12) + UV55*complexconjugate(Yx22) + UV56*complexconjugate(Yx32)) + UV55*(UV64*complexconjugate(Yx12) + UV65*complexconjugate(Yx22) + UV66*complexconjugate(Yx32)) + UV66*(UV54*complexconjugate(Yx13) + UV55*complexconjugate(Yx23) + UV56*complexconjugate(Yx33)) + UV56*(UV64*complexconjugate(Yx13) + UV65*complexconjugate(Yx23) + UV66*complexconjugate(Yx33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_313 = Coupling(name = 'GC_313',
	 value = '(-(ZA21*(complexconjugate(UV54)*(Yv11*complexconjugate(UV61) + Yv21*complexconjugate(UV62) + Yv31*complexconjugate(UV63)) + complexconjugate(UV55)*(Yv12*complexconjugate(UV61) + Yv22*complexconjugate(UV62) + Yv32*complexconjugate(UV63)) + complexconjugate(UV56)*(Yv13*complexconjugate(UV61) + Yv23*complexconjugate(UV62) + Yv33*complexconjugate(UV63)))) - ZA21*((Yv11*complexconjugate(UV51) + Yv21*complexconjugate(UV52) + Yv31*complexconjugate(UV53))*complexconjugate(UV64) + (Yv12*complexconjugate(UV51) + Yv22*complexconjugate(UV52) + Yv32*complexconjugate(UV53))*complexconjugate(UV65) + (Yv13*complexconjugate(UV51) + Yv23*complexconjugate(UV52) + Yv33*complexconjugate(UV53))*complexconjugate(UV66)) + ZA22*((Yx11*complexconjugate(UV54) + Yx21*complexconjugate(UV55) + Yx31*complexconjugate(UV56))*complexconjugate(UV64) + (Yx12*complexconjugate(UV54) + Yx22*complexconjugate(UV55) + Yx32*complexconjugate(UV56))*complexconjugate(UV65) + (Yx13*complexconjugate(UV54) + Yx23*complexconjugate(UV55) + Yx33*complexconjugate(UV56))*complexconjugate(UV66) + complexconjugate(UV54)*(Yx11*complexconjugate(UV64) + Yx21*complexconjugate(UV65) + Yx31*complexconjugate(UV66)) + complexconjugate(UV55)*(Yx12*complexconjugate(UV64) + Yx22*complexconjugate(UV65) + Yx32*complexconjugate(UV66)) + complexconjugate(UV56)*(Yx13*complexconjugate(UV64) + Yx23*complexconjugate(UV65) + Yx33*complexconjugate(UV66))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_314 = Coupling(name = 'GC_314',
	 value = '(ZA21*(UV64*(UV51*complexconjugate(Yv11) + UV52*complexconjugate(Yv21) + UV53*complexconjugate(Yv31)) + UV65*(UV51*complexconjugate(Yv12) + UV52*complexconjugate(Yv22) + UV53*complexconjugate(Yv32)) + UV66*(UV51*complexconjugate(Yv13) + UV52*complexconjugate(Yv23) + UV53*complexconjugate(Yv33))) + ZA21*(UV54*(UV61*complexconjugate(Yv11) + UV62*complexconjugate(Yv21) + UV63*complexconjugate(Yv31)) + UV55*(UV61*complexconjugate(Yv12) + UV62*complexconjugate(Yv22) + UV63*complexconjugate(Yv32)) + UV56*(UV61*complexconjugate(Yv13) + UV62*complexconjugate(Yv23) + UV63*complexconjugate(Yv33))) - ZA22*(UV64*(UV54*complexconjugate(Yx11) + UV55*complexconjugate(Yx21) + UV56*complexconjugate(Yx31)) + UV54*(UV64*complexconjugate(Yx11) + UV65*complexconjugate(Yx21) + UV66*complexconjugate(Yx31)) + UV65*(UV54*complexconjugate(Yx12) + UV55*complexconjugate(Yx22) + UV56*complexconjugate(Yx32)) + UV55*(UV64*complexconjugate(Yx12) + UV65*complexconjugate(Yx22) + UV66*complexconjugate(Yx32)) + UV66*(UV54*complexconjugate(Yx13) + UV55*complexconjugate(Yx23) + UV56*complexconjugate(Yx33)) + UV56*(UV64*complexconjugate(Yx13) + UV65*complexconjugate(Yx23) + UV66*complexconjugate(Yx33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_315 = Coupling(name = 'GC_315',
	 value = '(-2*ZA11*((Yv11*complexconjugate(UV61) + Yv21*complexconjugate(UV62) + Yv31*complexconjugate(UV63))*complexconjugate(UV64) + (Yv12*complexconjugate(UV61) + Yv22*complexconjugate(UV62) + Yv32*complexconjugate(UV63))*complexconjugate(UV65) + (Yv13*complexconjugate(UV61) + Yv23*complexconjugate(UV62) + Yv33*complexconjugate(UV63))*complexconjugate(UV66)) + ZA12*(2*complexconjugate(UV64)*(Yx11*complexconjugate(UV64) + Yx21*complexconjugate(UV65) + Yx31*complexconjugate(UV66)) + 2*complexconjugate(UV65)*(Yx12*complexconjugate(UV64) + Yx22*complexconjugate(UV65) + Yx32*complexconjugate(UV66)) + 2*complexconjugate(UV66)*(Yx13*complexconjugate(UV64) + Yx23*complexconjugate(UV65) + Yx33*complexconjugate(UV66))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_316 = Coupling(name = 'GC_316',
	 value = '(2*ZA11*(UV64*(UV61*complexconjugate(Yv11) + UV62*complexconjugate(Yv21) + UV63*complexconjugate(Yv31)) + UV65*(UV61*complexconjugate(Yv12) + UV62*complexconjugate(Yv22) + UV63*complexconjugate(Yv32)) + UV66*(UV61*complexconjugate(Yv13) + UV62*complexconjugate(Yv23) + UV63*complexconjugate(Yv33))) - ZA12*(2*UV64*(UV64*complexconjugate(Yx11) + UV65*complexconjugate(Yx21) + UV66*complexconjugate(Yx31)) + 2*UV65*(UV64*complexconjugate(Yx12) + UV65*complexconjugate(Yx22) + UV66*complexconjugate(Yx32)) + 2*UV66*(UV64*complexconjugate(Yx13) + UV65*complexconjugate(Yx23) + UV66*complexconjugate(Yx33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_317 = Coupling(name = 'GC_317',
	 value = '(-2*ZA21*((Yv11*complexconjugate(UV61) + Yv21*complexconjugate(UV62) + Yv31*complexconjugate(UV63))*complexconjugate(UV64) + (Yv12*complexconjugate(UV61) + Yv22*complexconjugate(UV62) + Yv32*complexconjugate(UV63))*complexconjugate(UV65) + (Yv13*complexconjugate(UV61) + Yv23*complexconjugate(UV62) + Yv33*complexconjugate(UV63))*complexconjugate(UV66)) + ZA22*(2*complexconjugate(UV64)*(Yx11*complexconjugate(UV64) + Yx21*complexconjugate(UV65) + Yx31*complexconjugate(UV66)) + 2*complexconjugate(UV65)*(Yx12*complexconjugate(UV64) + Yx22*complexconjugate(UV65) + Yx32*complexconjugate(UV66)) + 2*complexconjugate(UV66)*(Yx13*complexconjugate(UV64) + Yx23*complexconjugate(UV65) + Yx33*complexconjugate(UV66))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_318 = Coupling(name = 'GC_318',
	 value = '(2*ZA21*(UV64*(UV61*complexconjugate(Yv11) + UV62*complexconjugate(Yv21) + UV63*complexconjugate(Yv31)) + UV65*(UV61*complexconjugate(Yv12) + UV62*complexconjugate(Yv22) + UV63*complexconjugate(Yv32)) + UV66*(UV61*complexconjugate(Yv13) + UV62*complexconjugate(Yv23) + UV63*complexconjugate(Yv33))) - ZA22*(2*UV64*(UV64*complexconjugate(Yx11) + UV65*complexconjugate(Yx21) + UV66*complexconjugate(Yx31)) + 2*UV65*(UV64*complexconjugate(Yx12) + UV65*complexconjugate(Yx22) + UV66*complexconjugate(Yx32)) + 2*UV66*(UV64*complexconjugate(Yx13) + UV65*complexconjugate(Yx23) + UV66*complexconjugate(Yx33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_319 = Coupling(name = 'GC_319',
	 value = '(-1*complex(0,1)*ZH11*(complexconjugate(ZDL11)*(Yd11*complexconjugate(ZDR11) + Yd21*complexconjugate(ZDR12) + Yd31*complexconjugate(ZDR13)) + complexconjugate(ZDL12)*(Yd12*complexconjugate(ZDR11) + Yd22*complexconjugate(ZDR12) + Yd32*complexconjugate(ZDR13)) + complexconjugate(ZDL13)*(Yd13*complexconjugate(ZDR11) + Yd23*complexconjugate(ZDR12) + Yd33*complexconjugate(ZDR13))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_320 = Coupling(name = 'GC_320',
	 value = '(-1*complex(0,1)*ZH11*(ZDL11*(ZDR11*complexconjugate(Yd11) + ZDR12*complexconjugate(Yd21) + ZDR13*complexconjugate(Yd31)) + ZDL12*(ZDR11*complexconjugate(Yd12) + ZDR12*complexconjugate(Yd22) + ZDR13*complexconjugate(Yd32)) + ZDL13*(ZDR11*complexconjugate(Yd13) + ZDR12*complexconjugate(Yd23) + ZDR13*complexconjugate(Yd33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_321 = Coupling(name = 'GC_321',
	 value = '(-1*complex(0,1)*ZH21*(complexconjugate(ZDL11)*(Yd11*complexconjugate(ZDR11) + Yd21*complexconjugate(ZDR12) + Yd31*complexconjugate(ZDR13)) + complexconjugate(ZDL12)*(Yd12*complexconjugate(ZDR11) + Yd22*complexconjugate(ZDR12) + Yd32*complexconjugate(ZDR13)) + complexconjugate(ZDL13)*(Yd13*complexconjugate(ZDR11) + Yd23*complexconjugate(ZDR12) + Yd33*complexconjugate(ZDR13))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_322 = Coupling(name = 'GC_322',
	 value = '(-1*complex(0,1)*ZH21*(ZDL11*(ZDR11*complexconjugate(Yd11) + ZDR12*complexconjugate(Yd21) + ZDR13*complexconjugate(Yd31)) + ZDL12*(ZDR11*complexconjugate(Yd12) + ZDR12*complexconjugate(Yd22) + ZDR13*complexconjugate(Yd32)) + ZDL13*(ZDR11*complexconjugate(Yd13) + ZDR12*complexconjugate(Yd23) + ZDR13*complexconjugate(Yd33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_323 = Coupling(name = 'GC_323',
	 value = '(-1*complex(0,1)*ZH11*(complexconjugate(ZDL21)*(Yd11*complexconjugate(ZDR11) + Yd21*complexconjugate(ZDR12) + Yd31*complexconjugate(ZDR13)) + complexconjugate(ZDL22)*(Yd12*complexconjugate(ZDR11) + Yd22*complexconjugate(ZDR12) + Yd32*complexconjugate(ZDR13)) + complexconjugate(ZDL23)*(Yd13*complexconjugate(ZDR11) + Yd23*complexconjugate(ZDR12) + Yd33*complexconjugate(ZDR13))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_324 = Coupling(name = 'GC_324',
	 value = '(-1*complex(0,1)*ZH11*(ZDL11*(ZDR21*complexconjugate(Yd11) + ZDR22*complexconjugate(Yd21) + ZDR23*complexconjugate(Yd31)) + ZDL12*(ZDR21*complexconjugate(Yd12) + ZDR22*complexconjugate(Yd22) + ZDR23*complexconjugate(Yd32)) + ZDL13*(ZDR21*complexconjugate(Yd13) + ZDR22*complexconjugate(Yd23) + ZDR23*complexconjugate(Yd33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_325 = Coupling(name = 'GC_325',
	 value = '(-1*complex(0,1)*ZH21*(complexconjugate(ZDL21)*(Yd11*complexconjugate(ZDR11) + Yd21*complexconjugate(ZDR12) + Yd31*complexconjugate(ZDR13)) + complexconjugate(ZDL22)*(Yd12*complexconjugate(ZDR11) + Yd22*complexconjugate(ZDR12) + Yd32*complexconjugate(ZDR13)) + complexconjugate(ZDL23)*(Yd13*complexconjugate(ZDR11) + Yd23*complexconjugate(ZDR12) + Yd33*complexconjugate(ZDR13))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_326 = Coupling(name = 'GC_326',
	 value = '(-1*complex(0,1)*ZH21*(ZDL11*(ZDR21*complexconjugate(Yd11) + ZDR22*complexconjugate(Yd21) + ZDR23*complexconjugate(Yd31)) + ZDL12*(ZDR21*complexconjugate(Yd12) + ZDR22*complexconjugate(Yd22) + ZDR23*complexconjugate(Yd32)) + ZDL13*(ZDR21*complexconjugate(Yd13) + ZDR22*complexconjugate(Yd23) + ZDR23*complexconjugate(Yd33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_327 = Coupling(name = 'GC_327',
	 value = '(-1*complex(0,1)*ZH11*(complexconjugate(ZDL31)*(Yd11*complexconjugate(ZDR11) + Yd21*complexconjugate(ZDR12) + Yd31*complexconjugate(ZDR13)) + complexconjugate(ZDL32)*(Yd12*complexconjugate(ZDR11) + Yd22*complexconjugate(ZDR12) + Yd32*complexconjugate(ZDR13)) + complexconjugate(ZDL33)*(Yd13*complexconjugate(ZDR11) + Yd23*complexconjugate(ZDR12) + Yd33*complexconjugate(ZDR13))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_328 = Coupling(name = 'GC_328',
	 value = '(-1*complex(0,1)*ZH11*(ZDL11*(ZDR31*complexconjugate(Yd11) + ZDR32*complexconjugate(Yd21) + ZDR33*complexconjugate(Yd31)) + ZDL12*(ZDR31*complexconjugate(Yd12) + ZDR32*complexconjugate(Yd22) + ZDR33*complexconjugate(Yd32)) + ZDL13*(ZDR31*complexconjugate(Yd13) + ZDR32*complexconjugate(Yd23) + ZDR33*complexconjugate(Yd33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_329 = Coupling(name = 'GC_329',
	 value = '(-1*complex(0,1)*ZH21*(complexconjugate(ZDL31)*(Yd11*complexconjugate(ZDR11) + Yd21*complexconjugate(ZDR12) + Yd31*complexconjugate(ZDR13)) + complexconjugate(ZDL32)*(Yd12*complexconjugate(ZDR11) + Yd22*complexconjugate(ZDR12) + Yd32*complexconjugate(ZDR13)) + complexconjugate(ZDL33)*(Yd13*complexconjugate(ZDR11) + Yd23*complexconjugate(ZDR12) + Yd33*complexconjugate(ZDR13))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_330 = Coupling(name = 'GC_330',
	 value = '(-1*complex(0,1)*ZH21*(ZDL11*(ZDR31*complexconjugate(Yd11) + ZDR32*complexconjugate(Yd21) + ZDR33*complexconjugate(Yd31)) + ZDL12*(ZDR31*complexconjugate(Yd12) + ZDR32*complexconjugate(Yd22) + ZDR33*complexconjugate(Yd32)) + ZDL13*(ZDR31*complexconjugate(Yd13) + ZDR32*complexconjugate(Yd23) + ZDR33*complexconjugate(Yd33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_331 = Coupling(name = 'GC_331',
	 value = '(-1*complex(0,1)*ZH11*(complexconjugate(ZDL11)*(Yd11*complexconjugate(ZDR21) + Yd21*complexconjugate(ZDR22) + Yd31*complexconjugate(ZDR23)) + complexconjugate(ZDL12)*(Yd12*complexconjugate(ZDR21) + Yd22*complexconjugate(ZDR22) + Yd32*complexconjugate(ZDR23)) + complexconjugate(ZDL13)*(Yd13*complexconjugate(ZDR21) + Yd23*complexconjugate(ZDR22) + Yd33*complexconjugate(ZDR23))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_332 = Coupling(name = 'GC_332',
	 value = '(-1*complex(0,1)*ZH11*(ZDL21*(ZDR11*complexconjugate(Yd11) + ZDR12*complexconjugate(Yd21) + ZDR13*complexconjugate(Yd31)) + ZDL22*(ZDR11*complexconjugate(Yd12) + ZDR12*complexconjugate(Yd22) + ZDR13*complexconjugate(Yd32)) + ZDL23*(ZDR11*complexconjugate(Yd13) + ZDR12*complexconjugate(Yd23) + ZDR13*complexconjugate(Yd33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_333 = Coupling(name = 'GC_333',
	 value = '(-1*complex(0,1)*ZH21*(complexconjugate(ZDL11)*(Yd11*complexconjugate(ZDR21) + Yd21*complexconjugate(ZDR22) + Yd31*complexconjugate(ZDR23)) + complexconjugate(ZDL12)*(Yd12*complexconjugate(ZDR21) + Yd22*complexconjugate(ZDR22) + Yd32*complexconjugate(ZDR23)) + complexconjugate(ZDL13)*(Yd13*complexconjugate(ZDR21) + Yd23*complexconjugate(ZDR22) + Yd33*complexconjugate(ZDR23))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_334 = Coupling(name = 'GC_334',
	 value = '(-1*complex(0,1)*ZH21*(ZDL21*(ZDR11*complexconjugate(Yd11) + ZDR12*complexconjugate(Yd21) + ZDR13*complexconjugate(Yd31)) + ZDL22*(ZDR11*complexconjugate(Yd12) + ZDR12*complexconjugate(Yd22) + ZDR13*complexconjugate(Yd32)) + ZDL23*(ZDR11*complexconjugate(Yd13) + ZDR12*complexconjugate(Yd23) + ZDR13*complexconjugate(Yd33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_335 = Coupling(name = 'GC_335',
	 value = '(-1*complex(0,1)*ZH11*(complexconjugate(ZDL21)*(Yd11*complexconjugate(ZDR21) + Yd21*complexconjugate(ZDR22) + Yd31*complexconjugate(ZDR23)) + complexconjugate(ZDL22)*(Yd12*complexconjugate(ZDR21) + Yd22*complexconjugate(ZDR22) + Yd32*complexconjugate(ZDR23)) + complexconjugate(ZDL23)*(Yd13*complexconjugate(ZDR21) + Yd23*complexconjugate(ZDR22) + Yd33*complexconjugate(ZDR23))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_336 = Coupling(name = 'GC_336',
	 value = '(-1*complex(0,1)*ZH11*(ZDL21*(ZDR21*complexconjugate(Yd11) + ZDR22*complexconjugate(Yd21) + ZDR23*complexconjugate(Yd31)) + ZDL22*(ZDR21*complexconjugate(Yd12) + ZDR22*complexconjugate(Yd22) + ZDR23*complexconjugate(Yd32)) + ZDL23*(ZDR21*complexconjugate(Yd13) + ZDR22*complexconjugate(Yd23) + ZDR23*complexconjugate(Yd33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_337 = Coupling(name = 'GC_337',
	 value = '(-1*complex(0,1)*ZH21*(complexconjugate(ZDL21)*(Yd11*complexconjugate(ZDR21) + Yd21*complexconjugate(ZDR22) + Yd31*complexconjugate(ZDR23)) + complexconjugate(ZDL22)*(Yd12*complexconjugate(ZDR21) + Yd22*complexconjugate(ZDR22) + Yd32*complexconjugate(ZDR23)) + complexconjugate(ZDL23)*(Yd13*complexconjugate(ZDR21) + Yd23*complexconjugate(ZDR22) + Yd33*complexconjugate(ZDR23))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_338 = Coupling(name = 'GC_338',
	 value = '(-1*complex(0,1)*ZH21*(ZDL21*(ZDR21*complexconjugate(Yd11) + ZDR22*complexconjugate(Yd21) + ZDR23*complexconjugate(Yd31)) + ZDL22*(ZDR21*complexconjugate(Yd12) + ZDR22*complexconjugate(Yd22) + ZDR23*complexconjugate(Yd32)) + ZDL23*(ZDR21*complexconjugate(Yd13) + ZDR22*complexconjugate(Yd23) + ZDR23*complexconjugate(Yd33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_339 = Coupling(name = 'GC_339',
	 value = '(-1*complex(0,1)*ZH11*(complexconjugate(ZDL31)*(Yd11*complexconjugate(ZDR21) + Yd21*complexconjugate(ZDR22) + Yd31*complexconjugate(ZDR23)) + complexconjugate(ZDL32)*(Yd12*complexconjugate(ZDR21) + Yd22*complexconjugate(ZDR22) + Yd32*complexconjugate(ZDR23)) + complexconjugate(ZDL33)*(Yd13*complexconjugate(ZDR21) + Yd23*complexconjugate(ZDR22) + Yd33*complexconjugate(ZDR23))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_340 = Coupling(name = 'GC_340',
	 value = '(-1*complex(0,1)*ZH11*(ZDL21*(ZDR31*complexconjugate(Yd11) + ZDR32*complexconjugate(Yd21) + ZDR33*complexconjugate(Yd31)) + ZDL22*(ZDR31*complexconjugate(Yd12) + ZDR32*complexconjugate(Yd22) + ZDR33*complexconjugate(Yd32)) + ZDL23*(ZDR31*complexconjugate(Yd13) + ZDR32*complexconjugate(Yd23) + ZDR33*complexconjugate(Yd33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_341 = Coupling(name = 'GC_341',
	 value = '(-1*complex(0,1)*ZH21*(complexconjugate(ZDL31)*(Yd11*complexconjugate(ZDR21) + Yd21*complexconjugate(ZDR22) + Yd31*complexconjugate(ZDR23)) + complexconjugate(ZDL32)*(Yd12*complexconjugate(ZDR21) + Yd22*complexconjugate(ZDR22) + Yd32*complexconjugate(ZDR23)) + complexconjugate(ZDL33)*(Yd13*complexconjugate(ZDR21) + Yd23*complexconjugate(ZDR22) + Yd33*complexconjugate(ZDR23))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_342 = Coupling(name = 'GC_342',
	 value = '(-1*complex(0,1)*ZH21*(ZDL21*(ZDR31*complexconjugate(Yd11) + ZDR32*complexconjugate(Yd21) + ZDR33*complexconjugate(Yd31)) + ZDL22*(ZDR31*complexconjugate(Yd12) + ZDR32*complexconjugate(Yd22) + ZDR33*complexconjugate(Yd32)) + ZDL23*(ZDR31*complexconjugate(Yd13) + ZDR32*complexconjugate(Yd23) + ZDR33*complexconjugate(Yd33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_343 = Coupling(name = 'GC_343',
	 value = '(-1*complex(0,1)*ZH11*(complexconjugate(ZDL11)*(Yd11*complexconjugate(ZDR31) + Yd21*complexconjugate(ZDR32) + Yd31*complexconjugate(ZDR33)) + complexconjugate(ZDL12)*(Yd12*complexconjugate(ZDR31) + Yd22*complexconjugate(ZDR32) + Yd32*complexconjugate(ZDR33)) + complexconjugate(ZDL13)*(Yd13*complexconjugate(ZDR31) + Yd23*complexconjugate(ZDR32) + Yd33*complexconjugate(ZDR33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_344 = Coupling(name = 'GC_344',
	 value = '(-1*complex(0,1)*ZH11*(ZDL31*(ZDR11*complexconjugate(Yd11) + ZDR12*complexconjugate(Yd21) + ZDR13*complexconjugate(Yd31)) + ZDL32*(ZDR11*complexconjugate(Yd12) + ZDR12*complexconjugate(Yd22) + ZDR13*complexconjugate(Yd32)) + ZDL33*(ZDR11*complexconjugate(Yd13) + ZDR12*complexconjugate(Yd23) + ZDR13*complexconjugate(Yd33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_345 = Coupling(name = 'GC_345',
	 value = '(-1*complex(0,1)*ZH21*(complexconjugate(ZDL11)*(Yd11*complexconjugate(ZDR31) + Yd21*complexconjugate(ZDR32) + Yd31*complexconjugate(ZDR33)) + complexconjugate(ZDL12)*(Yd12*complexconjugate(ZDR31) + Yd22*complexconjugate(ZDR32) + Yd32*complexconjugate(ZDR33)) + complexconjugate(ZDL13)*(Yd13*complexconjugate(ZDR31) + Yd23*complexconjugate(ZDR32) + Yd33*complexconjugate(ZDR33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_346 = Coupling(name = 'GC_346',
	 value = '(-1*complex(0,1)*ZH21*(ZDL31*(ZDR11*complexconjugate(Yd11) + ZDR12*complexconjugate(Yd21) + ZDR13*complexconjugate(Yd31)) + ZDL32*(ZDR11*complexconjugate(Yd12) + ZDR12*complexconjugate(Yd22) + ZDR13*complexconjugate(Yd32)) + ZDL33*(ZDR11*complexconjugate(Yd13) + ZDR12*complexconjugate(Yd23) + ZDR13*complexconjugate(Yd33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_347 = Coupling(name = 'GC_347',
	 value = '(-1*complex(0,1)*ZH11*(complexconjugate(ZDL21)*(Yd11*complexconjugate(ZDR31) + Yd21*complexconjugate(ZDR32) + Yd31*complexconjugate(ZDR33)) + complexconjugate(ZDL22)*(Yd12*complexconjugate(ZDR31) + Yd22*complexconjugate(ZDR32) + Yd32*complexconjugate(ZDR33)) + complexconjugate(ZDL23)*(Yd13*complexconjugate(ZDR31) + Yd23*complexconjugate(ZDR32) + Yd33*complexconjugate(ZDR33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_348 = Coupling(name = 'GC_348',
	 value = '(-1*complex(0,1)*ZH11*(ZDL31*(ZDR21*complexconjugate(Yd11) + ZDR22*complexconjugate(Yd21) + ZDR23*complexconjugate(Yd31)) + ZDL32*(ZDR21*complexconjugate(Yd12) + ZDR22*complexconjugate(Yd22) + ZDR23*complexconjugate(Yd32)) + ZDL33*(ZDR21*complexconjugate(Yd13) + ZDR22*complexconjugate(Yd23) + ZDR23*complexconjugate(Yd33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_349 = Coupling(name = 'GC_349',
	 value = '(-1*complex(0,1)*ZH21*(complexconjugate(ZDL21)*(Yd11*complexconjugate(ZDR31) + Yd21*complexconjugate(ZDR32) + Yd31*complexconjugate(ZDR33)) + complexconjugate(ZDL22)*(Yd12*complexconjugate(ZDR31) + Yd22*complexconjugate(ZDR32) + Yd32*complexconjugate(ZDR33)) + complexconjugate(ZDL23)*(Yd13*complexconjugate(ZDR31) + Yd23*complexconjugate(ZDR32) + Yd33*complexconjugate(ZDR33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_350 = Coupling(name = 'GC_350',
	 value = '(-1*complex(0,1)*ZH21*(ZDL31*(ZDR21*complexconjugate(Yd11) + ZDR22*complexconjugate(Yd21) + ZDR23*complexconjugate(Yd31)) + ZDL32*(ZDR21*complexconjugate(Yd12) + ZDR22*complexconjugate(Yd22) + ZDR23*complexconjugate(Yd32)) + ZDL33*(ZDR21*complexconjugate(Yd13) + ZDR22*complexconjugate(Yd23) + ZDR23*complexconjugate(Yd33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_351 = Coupling(name = 'GC_351',
	 value = '(-1*complex(0,1)*ZH11*(complexconjugate(ZDL31)*(Yd11*complexconjugate(ZDR31) + Yd21*complexconjugate(ZDR32) + Yd31*complexconjugate(ZDR33)) + complexconjugate(ZDL32)*(Yd12*complexconjugate(ZDR31) + Yd22*complexconjugate(ZDR32) + Yd32*complexconjugate(ZDR33)) + complexconjugate(ZDL33)*(Yd13*complexconjugate(ZDR31) + Yd23*complexconjugate(ZDR32) + Yd33*complexconjugate(ZDR33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_352 = Coupling(name = 'GC_352',
	 value = '(-1*complex(0,1)*ZH11*(ZDL31*(ZDR31*complexconjugate(Yd11) + ZDR32*complexconjugate(Yd21) + ZDR33*complexconjugate(Yd31)) + ZDL32*(ZDR31*complexconjugate(Yd12) + ZDR32*complexconjugate(Yd22) + ZDR33*complexconjugate(Yd32)) + ZDL33*(ZDR31*complexconjugate(Yd13) + ZDR32*complexconjugate(Yd23) + ZDR33*complexconjugate(Yd33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_353 = Coupling(name = 'GC_353',
	 value = '(-1*complex(0,1)*ZH21*(complexconjugate(ZDL31)*(Yd11*complexconjugate(ZDR31) + Yd21*complexconjugate(ZDR32) + Yd31*complexconjugate(ZDR33)) + complexconjugate(ZDL32)*(Yd12*complexconjugate(ZDR31) + Yd22*complexconjugate(ZDR32) + Yd32*complexconjugate(ZDR33)) + complexconjugate(ZDL33)*(Yd13*complexconjugate(ZDR31) + Yd23*complexconjugate(ZDR32) + Yd33*complexconjugate(ZDR33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_354 = Coupling(name = 'GC_354',
	 value = '(-1*complex(0,1)*ZH21*(ZDL31*(ZDR31*complexconjugate(Yd11) + ZDR32*complexconjugate(Yd21) + ZDR33*complexconjugate(Yd31)) + ZDL32*(ZDR31*complexconjugate(Yd12) + ZDR32*complexconjugate(Yd22) + ZDR33*complexconjugate(Yd32)) + ZDL33*(ZDR31*complexconjugate(Yd13) + ZDR32*complexconjugate(Yd23) + ZDR33*complexconjugate(Yd33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_355 = Coupling(name = 'GC_355',
	 value = '-1*complex(0,1)*(complexconjugate(ZDL11)*(Yu11*complexconjugate(ZUR11) + Yu21*complexconjugate(ZUR12) + Yu31*complexconjugate(ZUR13)) + complexconjugate(ZDL12)*(Yu12*complexconjugate(ZUR11) + Yu22*complexconjugate(ZUR12) + Yu32*complexconjugate(ZUR13)) + complexconjugate(ZDL13)*(Yu13*complexconjugate(ZUR11) + Yu23*complexconjugate(ZUR12) + Yu33*complexconjugate(ZUR13)))', 
	 order = {'QED':1} ) 
 
GC_356 = Coupling(name = 'GC_356',
	 value = '1*complex(0,1)*(ZUL11*(ZDR11*complexconjugate(Yd11) + ZDR12*complexconjugate(Yd21) + ZDR13*complexconjugate(Yd31)) + ZUL12*(ZDR11*complexconjugate(Yd12) + ZDR12*complexconjugate(Yd22) + ZDR13*complexconjugate(Yd32)) + ZUL13*(ZDR11*complexconjugate(Yd13) + ZDR12*complexconjugate(Yd23) + ZDR13*complexconjugate(Yd33)))', 
	 order = {'QED':1} ) 
 
GC_357 = Coupling(name = 'GC_357',
	 value = '-1*complex(0,1)*(complexconjugate(ZDL21)*(Yu11*complexconjugate(ZUR11) + Yu21*complexconjugate(ZUR12) + Yu31*complexconjugate(ZUR13)) + complexconjugate(ZDL22)*(Yu12*complexconjugate(ZUR11) + Yu22*complexconjugate(ZUR12) + Yu32*complexconjugate(ZUR13)) + complexconjugate(ZDL23)*(Yu13*complexconjugate(ZUR11) + Yu23*complexconjugate(ZUR12) + Yu33*complexconjugate(ZUR13)))', 
	 order = {'QED':1} ) 
 
GC_358 = Coupling(name = 'GC_358',
	 value = '1*complex(0,1)*(ZUL11*(ZDR21*complexconjugate(Yd11) + ZDR22*complexconjugate(Yd21) + ZDR23*complexconjugate(Yd31)) + ZUL12*(ZDR21*complexconjugate(Yd12) + ZDR22*complexconjugate(Yd22) + ZDR23*complexconjugate(Yd32)) + ZUL13*(ZDR21*complexconjugate(Yd13) + ZDR22*complexconjugate(Yd23) + ZDR23*complexconjugate(Yd33)))', 
	 order = {'QED':1} ) 
 
GC_359 = Coupling(name = 'GC_359',
	 value = '-1*complex(0,1)*(complexconjugate(ZDL31)*(Yu11*complexconjugate(ZUR11) + Yu21*complexconjugate(ZUR12) + Yu31*complexconjugate(ZUR13)) + complexconjugate(ZDL32)*(Yu12*complexconjugate(ZUR11) + Yu22*complexconjugate(ZUR12) + Yu32*complexconjugate(ZUR13)) + complexconjugate(ZDL33)*(Yu13*complexconjugate(ZUR11) + Yu23*complexconjugate(ZUR12) + Yu33*complexconjugate(ZUR13)))', 
	 order = {'QED':1} ) 
 
GC_360 = Coupling(name = 'GC_360',
	 value = '1*complex(0,1)*(ZUL11*(ZDR31*complexconjugate(Yd11) + ZDR32*complexconjugate(Yd21) + ZDR33*complexconjugate(Yd31)) + ZUL12*(ZDR31*complexconjugate(Yd12) + ZDR32*complexconjugate(Yd22) + ZDR33*complexconjugate(Yd32)) + ZUL13*(ZDR31*complexconjugate(Yd13) + ZDR32*complexconjugate(Yd23) + ZDR33*complexconjugate(Yd33)))', 
	 order = {'QED':1} ) 
 
GC_361 = Coupling(name = 'GC_361',
	 value = '-1*complex(0,1)*(complexconjugate(ZDL11)*(Yu11*complexconjugate(ZUR21) + Yu21*complexconjugate(ZUR22) + Yu31*complexconjugate(ZUR23)) + complexconjugate(ZDL12)*(Yu12*complexconjugate(ZUR21) + Yu22*complexconjugate(ZUR22) + Yu32*complexconjugate(ZUR23)) + complexconjugate(ZDL13)*(Yu13*complexconjugate(ZUR21) + Yu23*complexconjugate(ZUR22) + Yu33*complexconjugate(ZUR23)))', 
	 order = {'QED':1} ) 
 
GC_362 = Coupling(name = 'GC_362',
	 value = '1*complex(0,1)*(ZUL21*(ZDR11*complexconjugate(Yd11) + ZDR12*complexconjugate(Yd21) + ZDR13*complexconjugate(Yd31)) + ZUL22*(ZDR11*complexconjugate(Yd12) + ZDR12*complexconjugate(Yd22) + ZDR13*complexconjugate(Yd32)) + ZUL23*(ZDR11*complexconjugate(Yd13) + ZDR12*complexconjugate(Yd23) + ZDR13*complexconjugate(Yd33)))', 
	 order = {'QED':1} ) 
 
GC_363 = Coupling(name = 'GC_363',
	 value = '-1*complex(0,1)*(complexconjugate(ZDL21)*(Yu11*complexconjugate(ZUR21) + Yu21*complexconjugate(ZUR22) + Yu31*complexconjugate(ZUR23)) + complexconjugate(ZDL22)*(Yu12*complexconjugate(ZUR21) + Yu22*complexconjugate(ZUR22) + Yu32*complexconjugate(ZUR23)) + complexconjugate(ZDL23)*(Yu13*complexconjugate(ZUR21) + Yu23*complexconjugate(ZUR22) + Yu33*complexconjugate(ZUR23)))', 
	 order = {'QED':1} ) 
 
GC_364 = Coupling(name = 'GC_364',
	 value = '1*complex(0,1)*(ZUL21*(ZDR21*complexconjugate(Yd11) + ZDR22*complexconjugate(Yd21) + ZDR23*complexconjugate(Yd31)) + ZUL22*(ZDR21*complexconjugate(Yd12) + ZDR22*complexconjugate(Yd22) + ZDR23*complexconjugate(Yd32)) + ZUL23*(ZDR21*complexconjugate(Yd13) + ZDR22*complexconjugate(Yd23) + ZDR23*complexconjugate(Yd33)))', 
	 order = {'QED':1} ) 
 
GC_365 = Coupling(name = 'GC_365',
	 value = '-1*complex(0,1)*(complexconjugate(ZDL31)*(Yu11*complexconjugate(ZUR21) + Yu21*complexconjugate(ZUR22) + Yu31*complexconjugate(ZUR23)) + complexconjugate(ZDL32)*(Yu12*complexconjugate(ZUR21) + Yu22*complexconjugate(ZUR22) + Yu32*complexconjugate(ZUR23)) + complexconjugate(ZDL33)*(Yu13*complexconjugate(ZUR21) + Yu23*complexconjugate(ZUR22) + Yu33*complexconjugate(ZUR23)))', 
	 order = {'QED':1} ) 
 
GC_366 = Coupling(name = 'GC_366',
	 value = '1*complex(0,1)*(ZUL21*(ZDR31*complexconjugate(Yd11) + ZDR32*complexconjugate(Yd21) + ZDR33*complexconjugate(Yd31)) + ZUL22*(ZDR31*complexconjugate(Yd12) + ZDR32*complexconjugate(Yd22) + ZDR33*complexconjugate(Yd32)) + ZUL23*(ZDR31*complexconjugate(Yd13) + ZDR32*complexconjugate(Yd23) + ZDR33*complexconjugate(Yd33)))', 
	 order = {'QED':1} ) 
 
GC_367 = Coupling(name = 'GC_367',
	 value = '-1*complex(0,1)*(complexconjugate(ZDL11)*(Yu11*complexconjugate(ZUR31) + Yu21*complexconjugate(ZUR32) + Yu31*complexconjugate(ZUR33)) + complexconjugate(ZDL12)*(Yu12*complexconjugate(ZUR31) + Yu22*complexconjugate(ZUR32) + Yu32*complexconjugate(ZUR33)) + complexconjugate(ZDL13)*(Yu13*complexconjugate(ZUR31) + Yu23*complexconjugate(ZUR32) + Yu33*complexconjugate(ZUR33)))', 
	 order = {'QED':1} ) 
 
GC_368 = Coupling(name = 'GC_368',
	 value = '1*complex(0,1)*(ZUL31*(ZDR11*complexconjugate(Yd11) + ZDR12*complexconjugate(Yd21) + ZDR13*complexconjugate(Yd31)) + ZUL32*(ZDR11*complexconjugate(Yd12) + ZDR12*complexconjugate(Yd22) + ZDR13*complexconjugate(Yd32)) + ZUL33*(ZDR11*complexconjugate(Yd13) + ZDR12*complexconjugate(Yd23) + ZDR13*complexconjugate(Yd33)))', 
	 order = {'QED':1} ) 
 
GC_369 = Coupling(name = 'GC_369',
	 value = '-1*complex(0,1)*(complexconjugate(ZDL21)*(Yu11*complexconjugate(ZUR31) + Yu21*complexconjugate(ZUR32) + Yu31*complexconjugate(ZUR33)) + complexconjugate(ZDL22)*(Yu12*complexconjugate(ZUR31) + Yu22*complexconjugate(ZUR32) + Yu32*complexconjugate(ZUR33)) + complexconjugate(ZDL23)*(Yu13*complexconjugate(ZUR31) + Yu23*complexconjugate(ZUR32) + Yu33*complexconjugate(ZUR33)))', 
	 order = {'QED':1} ) 
 
GC_370 = Coupling(name = 'GC_370',
	 value = '1*complex(0,1)*(ZUL31*(ZDR21*complexconjugate(Yd11) + ZDR22*complexconjugate(Yd21) + ZDR23*complexconjugate(Yd31)) + ZUL32*(ZDR21*complexconjugate(Yd12) + ZDR22*complexconjugate(Yd22) + ZDR23*complexconjugate(Yd32)) + ZUL33*(ZDR21*complexconjugate(Yd13) + ZDR22*complexconjugate(Yd23) + ZDR23*complexconjugate(Yd33)))', 
	 order = {'QED':1} ) 
 
GC_371 = Coupling(name = 'GC_371',
	 value = '-1*complex(0,1)*(complexconjugate(ZDL31)*(Yu11*complexconjugate(ZUR31) + Yu21*complexconjugate(ZUR32) + Yu31*complexconjugate(ZUR33)) + complexconjugate(ZDL32)*(Yu12*complexconjugate(ZUR31) + Yu22*complexconjugate(ZUR32) + Yu32*complexconjugate(ZUR33)) + complexconjugate(ZDL33)*(Yu13*complexconjugate(ZUR31) + Yu23*complexconjugate(ZUR32) + Yu33*complexconjugate(ZUR33)))', 
	 order = {'QED':1} ) 
 
GC_372 = Coupling(name = 'GC_372',
	 value = '1*complex(0,1)*(ZUL31*(ZDR31*complexconjugate(Yd11) + ZDR32*complexconjugate(Yd21) + ZDR33*complexconjugate(Yd31)) + ZUL32*(ZDR31*complexconjugate(Yd12) + ZDR32*complexconjugate(Yd22) + ZDR33*complexconjugate(Yd32)) + ZUL33*(ZDR31*complexconjugate(Yd13) + ZDR32*complexconjugate(Yd23) + ZDR33*complexconjugate(Yd33)))', 
	 order = {'QED':1} ) 
 
GC_373 = Coupling(name = 'GC_373',
	 value = '-1*complex(0,1)*(complexconjugate(UV14)*(Yv11*complexconjugate(ZEL11) + Yv21*complexconjugate(ZEL12) + Yv31*complexconjugate(ZEL13)) + complexconjugate(UV15)*(Yv12*complexconjugate(ZEL11) + Yv22*complexconjugate(ZEL12) + Yv32*complexconjugate(ZEL13)) + complexconjugate(UV16)*(Yv13*complexconjugate(ZEL11) + Yv23*complexconjugate(ZEL12) + Yv33*complexconjugate(ZEL13)))', 
	 order = {'QED':1} ) 
 
GC_374 = Coupling(name = 'GC_374',
	 value = '1*complex(0,1)*(UV11*(ZER11*complexconjugate(Ye11) + ZER12*complexconjugate(Ye21) + ZER13*complexconjugate(Ye31)) + UV12*(ZER11*complexconjugate(Ye12) + ZER12*complexconjugate(Ye22) + ZER13*complexconjugate(Ye32)) + UV13*(ZER11*complexconjugate(Ye13) + ZER12*complexconjugate(Ye23) + ZER13*complexconjugate(Ye33)))', 
	 order = {'QED':1} ) 
 
GC_375 = Coupling(name = 'GC_375',
	 value = '-1*complex(0,1)*(complexconjugate(UV14)*(Yv11*complexconjugate(ZEL21) + Yv21*complexconjugate(ZEL22) + Yv31*complexconjugate(ZEL23)) + complexconjugate(UV15)*(Yv12*complexconjugate(ZEL21) + Yv22*complexconjugate(ZEL22) + Yv32*complexconjugate(ZEL23)) + complexconjugate(UV16)*(Yv13*complexconjugate(ZEL21) + Yv23*complexconjugate(ZEL22) + Yv33*complexconjugate(ZEL23)))', 
	 order = {'QED':1} ) 
 
GC_376 = Coupling(name = 'GC_376',
	 value = '1*complex(0,1)*(UV11*(ZER21*complexconjugate(Ye11) + ZER22*complexconjugate(Ye21) + ZER23*complexconjugate(Ye31)) + UV12*(ZER21*complexconjugate(Ye12) + ZER22*complexconjugate(Ye22) + ZER23*complexconjugate(Ye32)) + UV13*(ZER21*complexconjugate(Ye13) + ZER22*complexconjugate(Ye23) + ZER23*complexconjugate(Ye33)))', 
	 order = {'QED':1} ) 
 
GC_377 = Coupling(name = 'GC_377',
	 value = '-1*complex(0,1)*(complexconjugate(UV14)*(Yv11*complexconjugate(ZEL31) + Yv21*complexconjugate(ZEL32) + Yv31*complexconjugate(ZEL33)) + complexconjugate(UV15)*(Yv12*complexconjugate(ZEL31) + Yv22*complexconjugate(ZEL32) + Yv32*complexconjugate(ZEL33)) + complexconjugate(UV16)*(Yv13*complexconjugate(ZEL31) + Yv23*complexconjugate(ZEL32) + Yv33*complexconjugate(ZEL33)))', 
	 order = {'QED':1} ) 
 
GC_378 = Coupling(name = 'GC_378',
	 value = '1*complex(0,1)*(UV11*(ZER31*complexconjugate(Ye11) + ZER32*complexconjugate(Ye21) + ZER33*complexconjugate(Ye31)) + UV12*(ZER31*complexconjugate(Ye12) + ZER32*complexconjugate(Ye22) + ZER33*complexconjugate(Ye32)) + UV13*(ZER31*complexconjugate(Ye13) + ZER32*complexconjugate(Ye23) + ZER33*complexconjugate(Ye33)))', 
	 order = {'QED':1} ) 
 
GC_379 = Coupling(name = 'GC_379',
	 value = '-1*complex(0,1)*(complexconjugate(UV24)*(Yv11*complexconjugate(ZEL11) + Yv21*complexconjugate(ZEL12) + Yv31*complexconjugate(ZEL13)) + complexconjugate(UV25)*(Yv12*complexconjugate(ZEL11) + Yv22*complexconjugate(ZEL12) + Yv32*complexconjugate(ZEL13)) + complexconjugate(UV26)*(Yv13*complexconjugate(ZEL11) + Yv23*complexconjugate(ZEL12) + Yv33*complexconjugate(ZEL13)))', 
	 order = {'QED':1} ) 
 
GC_380 = Coupling(name = 'GC_380',
	 value = '1*complex(0,1)*(UV21*(ZER11*complexconjugate(Ye11) + ZER12*complexconjugate(Ye21) + ZER13*complexconjugate(Ye31)) + UV22*(ZER11*complexconjugate(Ye12) + ZER12*complexconjugate(Ye22) + ZER13*complexconjugate(Ye32)) + UV23*(ZER11*complexconjugate(Ye13) + ZER12*complexconjugate(Ye23) + ZER13*complexconjugate(Ye33)))', 
	 order = {'QED':1} ) 
 
GC_381 = Coupling(name = 'GC_381',
	 value = '-1*complex(0,1)*(complexconjugate(UV24)*(Yv11*complexconjugate(ZEL21) + Yv21*complexconjugate(ZEL22) + Yv31*complexconjugate(ZEL23)) + complexconjugate(UV25)*(Yv12*complexconjugate(ZEL21) + Yv22*complexconjugate(ZEL22) + Yv32*complexconjugate(ZEL23)) + complexconjugate(UV26)*(Yv13*complexconjugate(ZEL21) + Yv23*complexconjugate(ZEL22) + Yv33*complexconjugate(ZEL23)))', 
	 order = {'QED':1} ) 
 
GC_382 = Coupling(name = 'GC_382',
	 value = '1*complex(0,1)*(UV21*(ZER21*complexconjugate(Ye11) + ZER22*complexconjugate(Ye21) + ZER23*complexconjugate(Ye31)) + UV22*(ZER21*complexconjugate(Ye12) + ZER22*complexconjugate(Ye22) + ZER23*complexconjugate(Ye32)) + UV23*(ZER21*complexconjugate(Ye13) + ZER22*complexconjugate(Ye23) + ZER23*complexconjugate(Ye33)))', 
	 order = {'QED':1} ) 
 
GC_383 = Coupling(name = 'GC_383',
	 value = '-1*complex(0,1)*(complexconjugate(UV24)*(Yv11*complexconjugate(ZEL31) + Yv21*complexconjugate(ZEL32) + Yv31*complexconjugate(ZEL33)) + complexconjugate(UV25)*(Yv12*complexconjugate(ZEL31) + Yv22*complexconjugate(ZEL32) + Yv32*complexconjugate(ZEL33)) + complexconjugate(UV26)*(Yv13*complexconjugate(ZEL31) + Yv23*complexconjugate(ZEL32) + Yv33*complexconjugate(ZEL33)))', 
	 order = {'QED':1} ) 
 
GC_384 = Coupling(name = 'GC_384',
	 value = '1*complex(0,1)*(UV21*(ZER31*complexconjugate(Ye11) + ZER32*complexconjugate(Ye21) + ZER33*complexconjugate(Ye31)) + UV22*(ZER31*complexconjugate(Ye12) + ZER32*complexconjugate(Ye22) + ZER33*complexconjugate(Ye32)) + UV23*(ZER31*complexconjugate(Ye13) + ZER32*complexconjugate(Ye23) + ZER33*complexconjugate(Ye33)))', 
	 order = {'QED':1} ) 
 
GC_385 = Coupling(name = 'GC_385',
	 value = '-1*complex(0,1)*(complexconjugate(UV34)*(Yv11*complexconjugate(ZEL11) + Yv21*complexconjugate(ZEL12) + Yv31*complexconjugate(ZEL13)) + complexconjugate(UV35)*(Yv12*complexconjugate(ZEL11) + Yv22*complexconjugate(ZEL12) + Yv32*complexconjugate(ZEL13)) + complexconjugate(UV36)*(Yv13*complexconjugate(ZEL11) + Yv23*complexconjugate(ZEL12) + Yv33*complexconjugate(ZEL13)))', 
	 order = {'QED':1} ) 
 
GC_386 = Coupling(name = 'GC_386',
	 value = '1*complex(0,1)*(UV31*(ZER11*complexconjugate(Ye11) + ZER12*complexconjugate(Ye21) + ZER13*complexconjugate(Ye31)) + UV32*(ZER11*complexconjugate(Ye12) + ZER12*complexconjugate(Ye22) + ZER13*complexconjugate(Ye32)) + UV33*(ZER11*complexconjugate(Ye13) + ZER12*complexconjugate(Ye23) + ZER13*complexconjugate(Ye33)))', 
	 order = {'QED':1} ) 
 
GC_387 = Coupling(name = 'GC_387',
	 value = '-1*complex(0,1)*(complexconjugate(UV34)*(Yv11*complexconjugate(ZEL21) + Yv21*complexconjugate(ZEL22) + Yv31*complexconjugate(ZEL23)) + complexconjugate(UV35)*(Yv12*complexconjugate(ZEL21) + Yv22*complexconjugate(ZEL22) + Yv32*complexconjugate(ZEL23)) + complexconjugate(UV36)*(Yv13*complexconjugate(ZEL21) + Yv23*complexconjugate(ZEL22) + Yv33*complexconjugate(ZEL23)))', 
	 order = {'QED':1} ) 
 
GC_388 = Coupling(name = 'GC_388',
	 value = '1*complex(0,1)*(UV31*(ZER21*complexconjugate(Ye11) + ZER22*complexconjugate(Ye21) + ZER23*complexconjugate(Ye31)) + UV32*(ZER21*complexconjugate(Ye12) + ZER22*complexconjugate(Ye22) + ZER23*complexconjugate(Ye32)) + UV33*(ZER21*complexconjugate(Ye13) + ZER22*complexconjugate(Ye23) + ZER23*complexconjugate(Ye33)))', 
	 order = {'QED':1} ) 
 
GC_389 = Coupling(name = 'GC_389',
	 value = '-1*complex(0,1)*(complexconjugate(UV34)*(Yv11*complexconjugate(ZEL31) + Yv21*complexconjugate(ZEL32) + Yv31*complexconjugate(ZEL33)) + complexconjugate(UV35)*(Yv12*complexconjugate(ZEL31) + Yv22*complexconjugate(ZEL32) + Yv32*complexconjugate(ZEL33)) + complexconjugate(UV36)*(Yv13*complexconjugate(ZEL31) + Yv23*complexconjugate(ZEL32) + Yv33*complexconjugate(ZEL33)))', 
	 order = {'QED':1} ) 
 
GC_390 = Coupling(name = 'GC_390',
	 value = '1*complex(0,1)*(UV31*(ZER31*complexconjugate(Ye11) + ZER32*complexconjugate(Ye21) + ZER33*complexconjugate(Ye31)) + UV32*(ZER31*complexconjugate(Ye12) + ZER32*complexconjugate(Ye22) + ZER33*complexconjugate(Ye32)) + UV33*(ZER31*complexconjugate(Ye13) + ZER32*complexconjugate(Ye23) + ZER33*complexconjugate(Ye33)))', 
	 order = {'QED':1} ) 
 
GC_391 = Coupling(name = 'GC_391',
	 value = '-1*complex(0,1)*(complexconjugate(UV44)*(Yv11*complexconjugate(ZEL11) + Yv21*complexconjugate(ZEL12) + Yv31*complexconjugate(ZEL13)) + complexconjugate(UV45)*(Yv12*complexconjugate(ZEL11) + Yv22*complexconjugate(ZEL12) + Yv32*complexconjugate(ZEL13)) + complexconjugate(UV46)*(Yv13*complexconjugate(ZEL11) + Yv23*complexconjugate(ZEL12) + Yv33*complexconjugate(ZEL13)))', 
	 order = {'QED':1} ) 
 
GC_392 = Coupling(name = 'GC_392',
	 value = '1*complex(0,1)*(UV41*(ZER11*complexconjugate(Ye11) + ZER12*complexconjugate(Ye21) + ZER13*complexconjugate(Ye31)) + UV42*(ZER11*complexconjugate(Ye12) + ZER12*complexconjugate(Ye22) + ZER13*complexconjugate(Ye32)) + UV43*(ZER11*complexconjugate(Ye13) + ZER12*complexconjugate(Ye23) + ZER13*complexconjugate(Ye33)))', 
	 order = {'QED':1} ) 
 
GC_393 = Coupling(name = 'GC_393',
	 value = '-1*complex(0,1)*(complexconjugate(UV44)*(Yv11*complexconjugate(ZEL21) + Yv21*complexconjugate(ZEL22) + Yv31*complexconjugate(ZEL23)) + complexconjugate(UV45)*(Yv12*complexconjugate(ZEL21) + Yv22*complexconjugate(ZEL22) + Yv32*complexconjugate(ZEL23)) + complexconjugate(UV46)*(Yv13*complexconjugate(ZEL21) + Yv23*complexconjugate(ZEL22) + Yv33*complexconjugate(ZEL23)))', 
	 order = {'QED':1} ) 
 
GC_394 = Coupling(name = 'GC_394',
	 value = '1*complex(0,1)*(UV41*(ZER21*complexconjugate(Ye11) + ZER22*complexconjugate(Ye21) + ZER23*complexconjugate(Ye31)) + UV42*(ZER21*complexconjugate(Ye12) + ZER22*complexconjugate(Ye22) + ZER23*complexconjugate(Ye32)) + UV43*(ZER21*complexconjugate(Ye13) + ZER22*complexconjugate(Ye23) + ZER23*complexconjugate(Ye33)))', 
	 order = {'QED':1} ) 
 
GC_395 = Coupling(name = 'GC_395',
	 value = '-1*complex(0,1)*(complexconjugate(UV44)*(Yv11*complexconjugate(ZEL31) + Yv21*complexconjugate(ZEL32) + Yv31*complexconjugate(ZEL33)) + complexconjugate(UV45)*(Yv12*complexconjugate(ZEL31) + Yv22*complexconjugate(ZEL32) + Yv32*complexconjugate(ZEL33)) + complexconjugate(UV46)*(Yv13*complexconjugate(ZEL31) + Yv23*complexconjugate(ZEL32) + Yv33*complexconjugate(ZEL33)))', 
	 order = {'QED':1} ) 
 
GC_396 = Coupling(name = 'GC_396',
	 value = '1*complex(0,1)*(UV41*(ZER31*complexconjugate(Ye11) + ZER32*complexconjugate(Ye21) + ZER33*complexconjugate(Ye31)) + UV42*(ZER31*complexconjugate(Ye12) + ZER32*complexconjugate(Ye22) + ZER33*complexconjugate(Ye32)) + UV43*(ZER31*complexconjugate(Ye13) + ZER32*complexconjugate(Ye23) + ZER33*complexconjugate(Ye33)))', 
	 order = {'QED':1} ) 
 
GC_397 = Coupling(name = 'GC_397',
	 value = '-1*complex(0,1)*(complexconjugate(UV54)*(Yv11*complexconjugate(ZEL11) + Yv21*complexconjugate(ZEL12) + Yv31*complexconjugate(ZEL13)) + complexconjugate(UV55)*(Yv12*complexconjugate(ZEL11) + Yv22*complexconjugate(ZEL12) + Yv32*complexconjugate(ZEL13)) + complexconjugate(UV56)*(Yv13*complexconjugate(ZEL11) + Yv23*complexconjugate(ZEL12) + Yv33*complexconjugate(ZEL13)))', 
	 order = {'QED':1} ) 
 
GC_398 = Coupling(name = 'GC_398',
	 value = '1*complex(0,1)*(UV51*(ZER11*complexconjugate(Ye11) + ZER12*complexconjugate(Ye21) + ZER13*complexconjugate(Ye31)) + UV52*(ZER11*complexconjugate(Ye12) + ZER12*complexconjugate(Ye22) + ZER13*complexconjugate(Ye32)) + UV53*(ZER11*complexconjugate(Ye13) + ZER12*complexconjugate(Ye23) + ZER13*complexconjugate(Ye33)))', 
	 order = {'QED':1} ) 
 
GC_399 = Coupling(name = 'GC_399',
	 value = '-1*complex(0,1)*(complexconjugate(UV54)*(Yv11*complexconjugate(ZEL21) + Yv21*complexconjugate(ZEL22) + Yv31*complexconjugate(ZEL23)) + complexconjugate(UV55)*(Yv12*complexconjugate(ZEL21) + Yv22*complexconjugate(ZEL22) + Yv32*complexconjugate(ZEL23)) + complexconjugate(UV56)*(Yv13*complexconjugate(ZEL21) + Yv23*complexconjugate(ZEL22) + Yv33*complexconjugate(ZEL23)))', 
	 order = {'QED':1} ) 
 
GC_400 = Coupling(name = 'GC_400',
	 value = '1*complex(0,1)*(UV51*(ZER21*complexconjugate(Ye11) + ZER22*complexconjugate(Ye21) + ZER23*complexconjugate(Ye31)) + UV52*(ZER21*complexconjugate(Ye12) + ZER22*complexconjugate(Ye22) + ZER23*complexconjugate(Ye32)) + UV53*(ZER21*complexconjugate(Ye13) + ZER22*complexconjugate(Ye23) + ZER23*complexconjugate(Ye33)))', 
	 order = {'QED':1} ) 
 
GC_401 = Coupling(name = 'GC_401',
	 value = '-1*complex(0,1)*(complexconjugate(UV54)*(Yv11*complexconjugate(ZEL31) + Yv21*complexconjugate(ZEL32) + Yv31*complexconjugate(ZEL33)) + complexconjugate(UV55)*(Yv12*complexconjugate(ZEL31) + Yv22*complexconjugate(ZEL32) + Yv32*complexconjugate(ZEL33)) + complexconjugate(UV56)*(Yv13*complexconjugate(ZEL31) + Yv23*complexconjugate(ZEL32) + Yv33*complexconjugate(ZEL33)))', 
	 order = {'QED':1} ) 
 
GC_402 = Coupling(name = 'GC_402',
	 value = '1*complex(0,1)*(UV51*(ZER31*complexconjugate(Ye11) + ZER32*complexconjugate(Ye21) + ZER33*complexconjugate(Ye31)) + UV52*(ZER31*complexconjugate(Ye12) + ZER32*complexconjugate(Ye22) + ZER33*complexconjugate(Ye32)) + UV53*(ZER31*complexconjugate(Ye13) + ZER32*complexconjugate(Ye23) + ZER33*complexconjugate(Ye33)))', 
	 order = {'QED':1} ) 
 
GC_403 = Coupling(name = 'GC_403',
	 value = '-1*complex(0,1)*(complexconjugate(UV64)*(Yv11*complexconjugate(ZEL11) + Yv21*complexconjugate(ZEL12) + Yv31*complexconjugate(ZEL13)) + complexconjugate(UV65)*(Yv12*complexconjugate(ZEL11) + Yv22*complexconjugate(ZEL12) + Yv32*complexconjugate(ZEL13)) + complexconjugate(UV66)*(Yv13*complexconjugate(ZEL11) + Yv23*complexconjugate(ZEL12) + Yv33*complexconjugate(ZEL13)))', 
	 order = {'QED':1} ) 
 
GC_404 = Coupling(name = 'GC_404',
	 value = '1*complex(0,1)*(UV61*(ZER11*complexconjugate(Ye11) + ZER12*complexconjugate(Ye21) + ZER13*complexconjugate(Ye31)) + UV62*(ZER11*complexconjugate(Ye12) + ZER12*complexconjugate(Ye22) + ZER13*complexconjugate(Ye32)) + UV63*(ZER11*complexconjugate(Ye13) + ZER12*complexconjugate(Ye23) + ZER13*complexconjugate(Ye33)))', 
	 order = {'QED':1} ) 
 
GC_405 = Coupling(name = 'GC_405',
	 value = '-1*complex(0,1)*(complexconjugate(UV64)*(Yv11*complexconjugate(ZEL21) + Yv21*complexconjugate(ZEL22) + Yv31*complexconjugate(ZEL23)) + complexconjugate(UV65)*(Yv12*complexconjugate(ZEL21) + Yv22*complexconjugate(ZEL22) + Yv32*complexconjugate(ZEL23)) + complexconjugate(UV66)*(Yv13*complexconjugate(ZEL21) + Yv23*complexconjugate(ZEL22) + Yv33*complexconjugate(ZEL23)))', 
	 order = {'QED':1} ) 
 
GC_406 = Coupling(name = 'GC_406',
	 value = '1*complex(0,1)*(UV61*(ZER21*complexconjugate(Ye11) + ZER22*complexconjugate(Ye21) + ZER23*complexconjugate(Ye31)) + UV62*(ZER21*complexconjugate(Ye12) + ZER22*complexconjugate(Ye22) + ZER23*complexconjugate(Ye32)) + UV63*(ZER21*complexconjugate(Ye13) + ZER22*complexconjugate(Ye23) + ZER23*complexconjugate(Ye33)))', 
	 order = {'QED':1} ) 
 
GC_407 = Coupling(name = 'GC_407',
	 value = '-1*complex(0,1)*(complexconjugate(UV64)*(Yv11*complexconjugate(ZEL31) + Yv21*complexconjugate(ZEL32) + Yv31*complexconjugate(ZEL33)) + complexconjugate(UV65)*(Yv12*complexconjugate(ZEL31) + Yv22*complexconjugate(ZEL32) + Yv32*complexconjugate(ZEL33)) + complexconjugate(UV66)*(Yv13*complexconjugate(ZEL31) + Yv23*complexconjugate(ZEL32) + Yv33*complexconjugate(ZEL33)))', 
	 order = {'QED':1} ) 
 
GC_408 = Coupling(name = 'GC_408',
	 value = '1*complex(0,1)*(UV61*(ZER31*complexconjugate(Ye11) + ZER32*complexconjugate(Ye21) + ZER33*complexconjugate(Ye31)) + UV62*(ZER31*complexconjugate(Ye12) + ZER32*complexconjugate(Ye22) + ZER33*complexconjugate(Ye32)) + UV63*(ZER31*complexconjugate(Ye13) + ZER32*complexconjugate(Ye23) + ZER33*complexconjugate(Ye33)))', 
	 order = {'QED':1} ) 
 
GC_409 = Coupling(name = 'GC_409',
	 value = '(-1*complex(0,1)*ZH11*(complexconjugate(ZEL11)*(Ye11*complexconjugate(ZER11) + Ye21*complexconjugate(ZER12) + Ye31*complexconjugate(ZER13)) + complexconjugate(ZEL12)*(Ye12*complexconjugate(ZER11) + Ye22*complexconjugate(ZER12) + Ye32*complexconjugate(ZER13)) + complexconjugate(ZEL13)*(Ye13*complexconjugate(ZER11) + Ye23*complexconjugate(ZER12) + Ye33*complexconjugate(ZER13))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_410 = Coupling(name = 'GC_410',
	 value = '(-1*complex(0,1)*ZH11*(ZEL11*(ZER11*complexconjugate(Ye11) + ZER12*complexconjugate(Ye21) + ZER13*complexconjugate(Ye31)) + ZEL12*(ZER11*complexconjugate(Ye12) + ZER12*complexconjugate(Ye22) + ZER13*complexconjugate(Ye32)) + ZEL13*(ZER11*complexconjugate(Ye13) + ZER12*complexconjugate(Ye23) + ZER13*complexconjugate(Ye33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_411 = Coupling(name = 'GC_411',
	 value = '(-1*complex(0,1)*ZH21*(complexconjugate(ZEL11)*(Ye11*complexconjugate(ZER11) + Ye21*complexconjugate(ZER12) + Ye31*complexconjugate(ZER13)) + complexconjugate(ZEL12)*(Ye12*complexconjugate(ZER11) + Ye22*complexconjugate(ZER12) + Ye32*complexconjugate(ZER13)) + complexconjugate(ZEL13)*(Ye13*complexconjugate(ZER11) + Ye23*complexconjugate(ZER12) + Ye33*complexconjugate(ZER13))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_412 = Coupling(name = 'GC_412',
	 value = '(-1*complex(0,1)*ZH21*(ZEL11*(ZER11*complexconjugate(Ye11) + ZER12*complexconjugate(Ye21) + ZER13*complexconjugate(Ye31)) + ZEL12*(ZER11*complexconjugate(Ye12) + ZER12*complexconjugate(Ye22) + ZER13*complexconjugate(Ye32)) + ZEL13*(ZER11*complexconjugate(Ye13) + ZER12*complexconjugate(Ye23) + ZER13*complexconjugate(Ye33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_413 = Coupling(name = 'GC_413',
	 value = '(-1*complex(0,1)*ZH11*(complexconjugate(ZEL21)*(Ye11*complexconjugate(ZER11) + Ye21*complexconjugate(ZER12) + Ye31*complexconjugate(ZER13)) + complexconjugate(ZEL22)*(Ye12*complexconjugate(ZER11) + Ye22*complexconjugate(ZER12) + Ye32*complexconjugate(ZER13)) + complexconjugate(ZEL23)*(Ye13*complexconjugate(ZER11) + Ye23*complexconjugate(ZER12) + Ye33*complexconjugate(ZER13))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_414 = Coupling(name = 'GC_414',
	 value = '(-1*complex(0,1)*ZH11*(ZEL11*(ZER21*complexconjugate(Ye11) + ZER22*complexconjugate(Ye21) + ZER23*complexconjugate(Ye31)) + ZEL12*(ZER21*complexconjugate(Ye12) + ZER22*complexconjugate(Ye22) + ZER23*complexconjugate(Ye32)) + ZEL13*(ZER21*complexconjugate(Ye13) + ZER22*complexconjugate(Ye23) + ZER23*complexconjugate(Ye33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_415 = Coupling(name = 'GC_415',
	 value = '(-1*complex(0,1)*ZH21*(complexconjugate(ZEL21)*(Ye11*complexconjugate(ZER11) + Ye21*complexconjugate(ZER12) + Ye31*complexconjugate(ZER13)) + complexconjugate(ZEL22)*(Ye12*complexconjugate(ZER11) + Ye22*complexconjugate(ZER12) + Ye32*complexconjugate(ZER13)) + complexconjugate(ZEL23)*(Ye13*complexconjugate(ZER11) + Ye23*complexconjugate(ZER12) + Ye33*complexconjugate(ZER13))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_416 = Coupling(name = 'GC_416',
	 value = '(-1*complex(0,1)*ZH21*(ZEL11*(ZER21*complexconjugate(Ye11) + ZER22*complexconjugate(Ye21) + ZER23*complexconjugate(Ye31)) + ZEL12*(ZER21*complexconjugate(Ye12) + ZER22*complexconjugate(Ye22) + ZER23*complexconjugate(Ye32)) + ZEL13*(ZER21*complexconjugate(Ye13) + ZER22*complexconjugate(Ye23) + ZER23*complexconjugate(Ye33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_417 = Coupling(name = 'GC_417',
	 value = '(-1*complex(0,1)*ZH11*(complexconjugate(ZEL31)*(Ye11*complexconjugate(ZER11) + Ye21*complexconjugate(ZER12) + Ye31*complexconjugate(ZER13)) + complexconjugate(ZEL32)*(Ye12*complexconjugate(ZER11) + Ye22*complexconjugate(ZER12) + Ye32*complexconjugate(ZER13)) + complexconjugate(ZEL33)*(Ye13*complexconjugate(ZER11) + Ye23*complexconjugate(ZER12) + Ye33*complexconjugate(ZER13))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_418 = Coupling(name = 'GC_418',
	 value = '(-1*complex(0,1)*ZH11*(ZEL11*(ZER31*complexconjugate(Ye11) + ZER32*complexconjugate(Ye21) + ZER33*complexconjugate(Ye31)) + ZEL12*(ZER31*complexconjugate(Ye12) + ZER32*complexconjugate(Ye22) + ZER33*complexconjugate(Ye32)) + ZEL13*(ZER31*complexconjugate(Ye13) + ZER32*complexconjugate(Ye23) + ZER33*complexconjugate(Ye33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_419 = Coupling(name = 'GC_419',
	 value = '(-1*complex(0,1)*ZH21*(complexconjugate(ZEL31)*(Ye11*complexconjugate(ZER11) + Ye21*complexconjugate(ZER12) + Ye31*complexconjugate(ZER13)) + complexconjugate(ZEL32)*(Ye12*complexconjugate(ZER11) + Ye22*complexconjugate(ZER12) + Ye32*complexconjugate(ZER13)) + complexconjugate(ZEL33)*(Ye13*complexconjugate(ZER11) + Ye23*complexconjugate(ZER12) + Ye33*complexconjugate(ZER13))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_420 = Coupling(name = 'GC_420',
	 value = '(-1*complex(0,1)*ZH21*(ZEL11*(ZER31*complexconjugate(Ye11) + ZER32*complexconjugate(Ye21) + ZER33*complexconjugate(Ye31)) + ZEL12*(ZER31*complexconjugate(Ye12) + ZER32*complexconjugate(Ye22) + ZER33*complexconjugate(Ye32)) + ZEL13*(ZER31*complexconjugate(Ye13) + ZER32*complexconjugate(Ye23) + ZER33*complexconjugate(Ye33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_421 = Coupling(name = 'GC_421',
	 value = '(-1*complex(0,1)*ZH11*(complexconjugate(ZEL11)*(Ye11*complexconjugate(ZER21) + Ye21*complexconjugate(ZER22) + Ye31*complexconjugate(ZER23)) + complexconjugate(ZEL12)*(Ye12*complexconjugate(ZER21) + Ye22*complexconjugate(ZER22) + Ye32*complexconjugate(ZER23)) + complexconjugate(ZEL13)*(Ye13*complexconjugate(ZER21) + Ye23*complexconjugate(ZER22) + Ye33*complexconjugate(ZER23))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_422 = Coupling(name = 'GC_422',
	 value = '(-1*complex(0,1)*ZH11*(ZEL21*(ZER11*complexconjugate(Ye11) + ZER12*complexconjugate(Ye21) + ZER13*complexconjugate(Ye31)) + ZEL22*(ZER11*complexconjugate(Ye12) + ZER12*complexconjugate(Ye22) + ZER13*complexconjugate(Ye32)) + ZEL23*(ZER11*complexconjugate(Ye13) + ZER12*complexconjugate(Ye23) + ZER13*complexconjugate(Ye33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_423 = Coupling(name = 'GC_423',
	 value = '(-1*complex(0,1)*ZH21*(complexconjugate(ZEL11)*(Ye11*complexconjugate(ZER21) + Ye21*complexconjugate(ZER22) + Ye31*complexconjugate(ZER23)) + complexconjugate(ZEL12)*(Ye12*complexconjugate(ZER21) + Ye22*complexconjugate(ZER22) + Ye32*complexconjugate(ZER23)) + complexconjugate(ZEL13)*(Ye13*complexconjugate(ZER21) + Ye23*complexconjugate(ZER22) + Ye33*complexconjugate(ZER23))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_424 = Coupling(name = 'GC_424',
	 value = '(-1*complex(0,1)*ZH21*(ZEL21*(ZER11*complexconjugate(Ye11) + ZER12*complexconjugate(Ye21) + ZER13*complexconjugate(Ye31)) + ZEL22*(ZER11*complexconjugate(Ye12) + ZER12*complexconjugate(Ye22) + ZER13*complexconjugate(Ye32)) + ZEL23*(ZER11*complexconjugate(Ye13) + ZER12*complexconjugate(Ye23) + ZER13*complexconjugate(Ye33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_425 = Coupling(name = 'GC_425',
	 value = '(-1*complex(0,1)*ZH11*(complexconjugate(ZEL21)*(Ye11*complexconjugate(ZER21) + Ye21*complexconjugate(ZER22) + Ye31*complexconjugate(ZER23)) + complexconjugate(ZEL22)*(Ye12*complexconjugate(ZER21) + Ye22*complexconjugate(ZER22) + Ye32*complexconjugate(ZER23)) + complexconjugate(ZEL23)*(Ye13*complexconjugate(ZER21) + Ye23*complexconjugate(ZER22) + Ye33*complexconjugate(ZER23))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_426 = Coupling(name = 'GC_426',
	 value = '(-1*complex(0,1)*ZH11*(ZEL21*(ZER21*complexconjugate(Ye11) + ZER22*complexconjugate(Ye21) + ZER23*complexconjugate(Ye31)) + ZEL22*(ZER21*complexconjugate(Ye12) + ZER22*complexconjugate(Ye22) + ZER23*complexconjugate(Ye32)) + ZEL23*(ZER21*complexconjugate(Ye13) + ZER22*complexconjugate(Ye23) + ZER23*complexconjugate(Ye33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_427 = Coupling(name = 'GC_427',
	 value = '(-1*complex(0,1)*ZH21*(complexconjugate(ZEL21)*(Ye11*complexconjugate(ZER21) + Ye21*complexconjugate(ZER22) + Ye31*complexconjugate(ZER23)) + complexconjugate(ZEL22)*(Ye12*complexconjugate(ZER21) + Ye22*complexconjugate(ZER22) + Ye32*complexconjugate(ZER23)) + complexconjugate(ZEL23)*(Ye13*complexconjugate(ZER21) + Ye23*complexconjugate(ZER22) + Ye33*complexconjugate(ZER23))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_428 = Coupling(name = 'GC_428',
	 value = '(-1*complex(0,1)*ZH21*(ZEL21*(ZER21*complexconjugate(Ye11) + ZER22*complexconjugate(Ye21) + ZER23*complexconjugate(Ye31)) + ZEL22*(ZER21*complexconjugate(Ye12) + ZER22*complexconjugate(Ye22) + ZER23*complexconjugate(Ye32)) + ZEL23*(ZER21*complexconjugate(Ye13) + ZER22*complexconjugate(Ye23) + ZER23*complexconjugate(Ye33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_429 = Coupling(name = 'GC_429',
	 value = '(-1*complex(0,1)*ZH11*(complexconjugate(ZEL31)*(Ye11*complexconjugate(ZER21) + Ye21*complexconjugate(ZER22) + Ye31*complexconjugate(ZER23)) + complexconjugate(ZEL32)*(Ye12*complexconjugate(ZER21) + Ye22*complexconjugate(ZER22) + Ye32*complexconjugate(ZER23)) + complexconjugate(ZEL33)*(Ye13*complexconjugate(ZER21) + Ye23*complexconjugate(ZER22) + Ye33*complexconjugate(ZER23))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_430 = Coupling(name = 'GC_430',
	 value = '(-1*complex(0,1)*ZH11*(ZEL21*(ZER31*complexconjugate(Ye11) + ZER32*complexconjugate(Ye21) + ZER33*complexconjugate(Ye31)) + ZEL22*(ZER31*complexconjugate(Ye12) + ZER32*complexconjugate(Ye22) + ZER33*complexconjugate(Ye32)) + ZEL23*(ZER31*complexconjugate(Ye13) + ZER32*complexconjugate(Ye23) + ZER33*complexconjugate(Ye33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_431 = Coupling(name = 'GC_431',
	 value = '(-1*complex(0,1)*ZH21*(complexconjugate(ZEL31)*(Ye11*complexconjugate(ZER21) + Ye21*complexconjugate(ZER22) + Ye31*complexconjugate(ZER23)) + complexconjugate(ZEL32)*(Ye12*complexconjugate(ZER21) + Ye22*complexconjugate(ZER22) + Ye32*complexconjugate(ZER23)) + complexconjugate(ZEL33)*(Ye13*complexconjugate(ZER21) + Ye23*complexconjugate(ZER22) + Ye33*complexconjugate(ZER23))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_432 = Coupling(name = 'GC_432',
	 value = '(-1*complex(0,1)*ZH21*(ZEL21*(ZER31*complexconjugate(Ye11) + ZER32*complexconjugate(Ye21) + ZER33*complexconjugate(Ye31)) + ZEL22*(ZER31*complexconjugate(Ye12) + ZER32*complexconjugate(Ye22) + ZER33*complexconjugate(Ye32)) + ZEL23*(ZER31*complexconjugate(Ye13) + ZER32*complexconjugate(Ye23) + ZER33*complexconjugate(Ye33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_433 = Coupling(name = 'GC_433',
	 value = '(-1*complex(0,1)*ZH11*(complexconjugate(ZEL11)*(Ye11*complexconjugate(ZER31) + Ye21*complexconjugate(ZER32) + Ye31*complexconjugate(ZER33)) + complexconjugate(ZEL12)*(Ye12*complexconjugate(ZER31) + Ye22*complexconjugate(ZER32) + Ye32*complexconjugate(ZER33)) + complexconjugate(ZEL13)*(Ye13*complexconjugate(ZER31) + Ye23*complexconjugate(ZER32) + Ye33*complexconjugate(ZER33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_434 = Coupling(name = 'GC_434',
	 value = '(-1*complex(0,1)*ZH11*(ZEL31*(ZER11*complexconjugate(Ye11) + ZER12*complexconjugate(Ye21) + ZER13*complexconjugate(Ye31)) + ZEL32*(ZER11*complexconjugate(Ye12) + ZER12*complexconjugate(Ye22) + ZER13*complexconjugate(Ye32)) + ZEL33*(ZER11*complexconjugate(Ye13) + ZER12*complexconjugate(Ye23) + ZER13*complexconjugate(Ye33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_435 = Coupling(name = 'GC_435',
	 value = '(-1*complex(0,1)*ZH21*(complexconjugate(ZEL11)*(Ye11*complexconjugate(ZER31) + Ye21*complexconjugate(ZER32) + Ye31*complexconjugate(ZER33)) + complexconjugate(ZEL12)*(Ye12*complexconjugate(ZER31) + Ye22*complexconjugate(ZER32) + Ye32*complexconjugate(ZER33)) + complexconjugate(ZEL13)*(Ye13*complexconjugate(ZER31) + Ye23*complexconjugate(ZER32) + Ye33*complexconjugate(ZER33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_436 = Coupling(name = 'GC_436',
	 value = '(-1*complex(0,1)*ZH21*(ZEL31*(ZER11*complexconjugate(Ye11) + ZER12*complexconjugate(Ye21) + ZER13*complexconjugate(Ye31)) + ZEL32*(ZER11*complexconjugate(Ye12) + ZER12*complexconjugate(Ye22) + ZER13*complexconjugate(Ye32)) + ZEL33*(ZER11*complexconjugate(Ye13) + ZER12*complexconjugate(Ye23) + ZER13*complexconjugate(Ye33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_437 = Coupling(name = 'GC_437',
	 value = '(-1*complex(0,1)*ZH11*(complexconjugate(ZEL21)*(Ye11*complexconjugate(ZER31) + Ye21*complexconjugate(ZER32) + Ye31*complexconjugate(ZER33)) + complexconjugate(ZEL22)*(Ye12*complexconjugate(ZER31) + Ye22*complexconjugate(ZER32) + Ye32*complexconjugate(ZER33)) + complexconjugate(ZEL23)*(Ye13*complexconjugate(ZER31) + Ye23*complexconjugate(ZER32) + Ye33*complexconjugate(ZER33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_438 = Coupling(name = 'GC_438',
	 value = '(-1*complex(0,1)*ZH11*(ZEL31*(ZER21*complexconjugate(Ye11) + ZER22*complexconjugate(Ye21) + ZER23*complexconjugate(Ye31)) + ZEL32*(ZER21*complexconjugate(Ye12) + ZER22*complexconjugate(Ye22) + ZER23*complexconjugate(Ye32)) + ZEL33*(ZER21*complexconjugate(Ye13) + ZER22*complexconjugate(Ye23) + ZER23*complexconjugate(Ye33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_439 = Coupling(name = 'GC_439',
	 value = '(-1*complex(0,1)*ZH21*(complexconjugate(ZEL21)*(Ye11*complexconjugate(ZER31) + Ye21*complexconjugate(ZER32) + Ye31*complexconjugate(ZER33)) + complexconjugate(ZEL22)*(Ye12*complexconjugate(ZER31) + Ye22*complexconjugate(ZER32) + Ye32*complexconjugate(ZER33)) + complexconjugate(ZEL23)*(Ye13*complexconjugate(ZER31) + Ye23*complexconjugate(ZER32) + Ye33*complexconjugate(ZER33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_440 = Coupling(name = 'GC_440',
	 value = '(-1*complex(0,1)*ZH21*(ZEL31*(ZER21*complexconjugate(Ye11) + ZER22*complexconjugate(Ye21) + ZER23*complexconjugate(Ye31)) + ZEL32*(ZER21*complexconjugate(Ye12) + ZER22*complexconjugate(Ye22) + ZER23*complexconjugate(Ye32)) + ZEL33*(ZER21*complexconjugate(Ye13) + ZER22*complexconjugate(Ye23) + ZER23*complexconjugate(Ye33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_441 = Coupling(name = 'GC_441',
	 value = '(-1*complex(0,1)*ZH11*(complexconjugate(ZEL31)*(Ye11*complexconjugate(ZER31) + Ye21*complexconjugate(ZER32) + Ye31*complexconjugate(ZER33)) + complexconjugate(ZEL32)*(Ye12*complexconjugate(ZER31) + Ye22*complexconjugate(ZER32) + Ye32*complexconjugate(ZER33)) + complexconjugate(ZEL33)*(Ye13*complexconjugate(ZER31) + Ye23*complexconjugate(ZER32) + Ye33*complexconjugate(ZER33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_442 = Coupling(name = 'GC_442',
	 value = '(-1*complex(0,1)*ZH11*(ZEL31*(ZER31*complexconjugate(Ye11) + ZER32*complexconjugate(Ye21) + ZER33*complexconjugate(Ye31)) + ZEL32*(ZER31*complexconjugate(Ye12) + ZER32*complexconjugate(Ye22) + ZER33*complexconjugate(Ye32)) + ZEL33*(ZER31*complexconjugate(Ye13) + ZER32*complexconjugate(Ye23) + ZER33*complexconjugate(Ye33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_443 = Coupling(name = 'GC_443',
	 value = '(-1*complex(0,1)*ZH21*(complexconjugate(ZEL31)*(Ye11*complexconjugate(ZER31) + Ye21*complexconjugate(ZER32) + Ye31*complexconjugate(ZER33)) + complexconjugate(ZEL32)*(Ye12*complexconjugate(ZER31) + Ye22*complexconjugate(ZER32) + Ye32*complexconjugate(ZER33)) + complexconjugate(ZEL33)*(Ye13*complexconjugate(ZER31) + Ye23*complexconjugate(ZER32) + Ye33*complexconjugate(ZER33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_444 = Coupling(name = 'GC_444',
	 value = '(-1*complex(0,1)*ZH21*(ZEL31*(ZER31*complexconjugate(Ye11) + ZER32*complexconjugate(Ye21) + ZER33*complexconjugate(Ye31)) + ZEL32*(ZER31*complexconjugate(Ye12) + ZER32*complexconjugate(Ye22) + ZER33*complexconjugate(Ye32)) + ZEL33*(ZER31*complexconjugate(Ye13) + ZER32*complexconjugate(Ye23) + ZER33*complexconjugate(Ye33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_445 = Coupling(name = 'GC_445',
	 value = '(-1*complex(0,1)*ZH11*(complexconjugate(ZUL11)*(Yu11*complexconjugate(ZUR11) + Yu21*complexconjugate(ZUR12) + Yu31*complexconjugate(ZUR13)) + complexconjugate(ZUL12)*(Yu12*complexconjugate(ZUR11) + Yu22*complexconjugate(ZUR12) + Yu32*complexconjugate(ZUR13)) + complexconjugate(ZUL13)*(Yu13*complexconjugate(ZUR11) + Yu23*complexconjugate(ZUR12) + Yu33*complexconjugate(ZUR13))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_446 = Coupling(name = 'GC_446',
	 value = '(-1*complex(0,1)*ZH11*(ZUL11*(ZUR11*complexconjugate(Yu11) + ZUR12*complexconjugate(Yu21) + ZUR13*complexconjugate(Yu31)) + ZUL12*(ZUR11*complexconjugate(Yu12) + ZUR12*complexconjugate(Yu22) + ZUR13*complexconjugate(Yu32)) + ZUL13*(ZUR11*complexconjugate(Yu13) + ZUR12*complexconjugate(Yu23) + ZUR13*complexconjugate(Yu33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_447 = Coupling(name = 'GC_447',
	 value = '(-1*complex(0,1)*ZH21*(complexconjugate(ZUL11)*(Yu11*complexconjugate(ZUR11) + Yu21*complexconjugate(ZUR12) + Yu31*complexconjugate(ZUR13)) + complexconjugate(ZUL12)*(Yu12*complexconjugate(ZUR11) + Yu22*complexconjugate(ZUR12) + Yu32*complexconjugate(ZUR13)) + complexconjugate(ZUL13)*(Yu13*complexconjugate(ZUR11) + Yu23*complexconjugate(ZUR12) + Yu33*complexconjugate(ZUR13))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_448 = Coupling(name = 'GC_448',
	 value = '(-1*complex(0,1)*ZH21*(ZUL11*(ZUR11*complexconjugate(Yu11) + ZUR12*complexconjugate(Yu21) + ZUR13*complexconjugate(Yu31)) + ZUL12*(ZUR11*complexconjugate(Yu12) + ZUR12*complexconjugate(Yu22) + ZUR13*complexconjugate(Yu32)) + ZUL13*(ZUR11*complexconjugate(Yu13) + ZUR12*complexconjugate(Yu23) + ZUR13*complexconjugate(Yu33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_449 = Coupling(name = 'GC_449',
	 value = '(-1*complex(0,1)*ZH11*(complexconjugate(ZUL21)*(Yu11*complexconjugate(ZUR11) + Yu21*complexconjugate(ZUR12) + Yu31*complexconjugate(ZUR13)) + complexconjugate(ZUL22)*(Yu12*complexconjugate(ZUR11) + Yu22*complexconjugate(ZUR12) + Yu32*complexconjugate(ZUR13)) + complexconjugate(ZUL23)*(Yu13*complexconjugate(ZUR11) + Yu23*complexconjugate(ZUR12) + Yu33*complexconjugate(ZUR13))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_450 = Coupling(name = 'GC_450',
	 value = '(-1*complex(0,1)*ZH11*(ZUL11*(ZUR21*complexconjugate(Yu11) + ZUR22*complexconjugate(Yu21) + ZUR23*complexconjugate(Yu31)) + ZUL12*(ZUR21*complexconjugate(Yu12) + ZUR22*complexconjugate(Yu22) + ZUR23*complexconjugate(Yu32)) + ZUL13*(ZUR21*complexconjugate(Yu13) + ZUR22*complexconjugate(Yu23) + ZUR23*complexconjugate(Yu33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_451 = Coupling(name = 'GC_451',
	 value = '(-1*complex(0,1)*ZH21*(complexconjugate(ZUL21)*(Yu11*complexconjugate(ZUR11) + Yu21*complexconjugate(ZUR12) + Yu31*complexconjugate(ZUR13)) + complexconjugate(ZUL22)*(Yu12*complexconjugate(ZUR11) + Yu22*complexconjugate(ZUR12) + Yu32*complexconjugate(ZUR13)) + complexconjugate(ZUL23)*(Yu13*complexconjugate(ZUR11) + Yu23*complexconjugate(ZUR12) + Yu33*complexconjugate(ZUR13))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_452 = Coupling(name = 'GC_452',
	 value = '(-1*complex(0,1)*ZH21*(ZUL11*(ZUR21*complexconjugate(Yu11) + ZUR22*complexconjugate(Yu21) + ZUR23*complexconjugate(Yu31)) + ZUL12*(ZUR21*complexconjugate(Yu12) + ZUR22*complexconjugate(Yu22) + ZUR23*complexconjugate(Yu32)) + ZUL13*(ZUR21*complexconjugate(Yu13) + ZUR22*complexconjugate(Yu23) + ZUR23*complexconjugate(Yu33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_453 = Coupling(name = 'GC_453',
	 value = '(-1*complex(0,1)*ZH11*(complexconjugate(ZUL31)*(Yu11*complexconjugate(ZUR11) + Yu21*complexconjugate(ZUR12) + Yu31*complexconjugate(ZUR13)) + complexconjugate(ZUL32)*(Yu12*complexconjugate(ZUR11) + Yu22*complexconjugate(ZUR12) + Yu32*complexconjugate(ZUR13)) + complexconjugate(ZUL33)*(Yu13*complexconjugate(ZUR11) + Yu23*complexconjugate(ZUR12) + Yu33*complexconjugate(ZUR13))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_454 = Coupling(name = 'GC_454',
	 value = '(-1*complex(0,1)*ZH11*(ZUL11*(ZUR31*complexconjugate(Yu11) + ZUR32*complexconjugate(Yu21) + ZUR33*complexconjugate(Yu31)) + ZUL12*(ZUR31*complexconjugate(Yu12) + ZUR32*complexconjugate(Yu22) + ZUR33*complexconjugate(Yu32)) + ZUL13*(ZUR31*complexconjugate(Yu13) + ZUR32*complexconjugate(Yu23) + ZUR33*complexconjugate(Yu33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_455 = Coupling(name = 'GC_455',
	 value = '(-1*complex(0,1)*ZH21*(complexconjugate(ZUL31)*(Yu11*complexconjugate(ZUR11) + Yu21*complexconjugate(ZUR12) + Yu31*complexconjugate(ZUR13)) + complexconjugate(ZUL32)*(Yu12*complexconjugate(ZUR11) + Yu22*complexconjugate(ZUR12) + Yu32*complexconjugate(ZUR13)) + complexconjugate(ZUL33)*(Yu13*complexconjugate(ZUR11) + Yu23*complexconjugate(ZUR12) + Yu33*complexconjugate(ZUR13))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_456 = Coupling(name = 'GC_456',
	 value = '(-1*complex(0,1)*ZH21*(ZUL11*(ZUR31*complexconjugate(Yu11) + ZUR32*complexconjugate(Yu21) + ZUR33*complexconjugate(Yu31)) + ZUL12*(ZUR31*complexconjugate(Yu12) + ZUR32*complexconjugate(Yu22) + ZUR33*complexconjugate(Yu32)) + ZUL13*(ZUR31*complexconjugate(Yu13) + ZUR32*complexconjugate(Yu23) + ZUR33*complexconjugate(Yu33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_457 = Coupling(name = 'GC_457',
	 value = '(-1*complex(0,1)*ZH11*(complexconjugate(ZUL11)*(Yu11*complexconjugate(ZUR21) + Yu21*complexconjugate(ZUR22) + Yu31*complexconjugate(ZUR23)) + complexconjugate(ZUL12)*(Yu12*complexconjugate(ZUR21) + Yu22*complexconjugate(ZUR22) + Yu32*complexconjugate(ZUR23)) + complexconjugate(ZUL13)*(Yu13*complexconjugate(ZUR21) + Yu23*complexconjugate(ZUR22) + Yu33*complexconjugate(ZUR23))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_458 = Coupling(name = 'GC_458',
	 value = '(-1*complex(0,1)*ZH11*(ZUL21*(ZUR11*complexconjugate(Yu11) + ZUR12*complexconjugate(Yu21) + ZUR13*complexconjugate(Yu31)) + ZUL22*(ZUR11*complexconjugate(Yu12) + ZUR12*complexconjugate(Yu22) + ZUR13*complexconjugate(Yu32)) + ZUL23*(ZUR11*complexconjugate(Yu13) + ZUR12*complexconjugate(Yu23) + ZUR13*complexconjugate(Yu33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_459 = Coupling(name = 'GC_459',
	 value = '(-1*complex(0,1)*ZH21*(complexconjugate(ZUL11)*(Yu11*complexconjugate(ZUR21) + Yu21*complexconjugate(ZUR22) + Yu31*complexconjugate(ZUR23)) + complexconjugate(ZUL12)*(Yu12*complexconjugate(ZUR21) + Yu22*complexconjugate(ZUR22) + Yu32*complexconjugate(ZUR23)) + complexconjugate(ZUL13)*(Yu13*complexconjugate(ZUR21) + Yu23*complexconjugate(ZUR22) + Yu33*complexconjugate(ZUR23))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_460 = Coupling(name = 'GC_460',
	 value = '(-1*complex(0,1)*ZH21*(ZUL21*(ZUR11*complexconjugate(Yu11) + ZUR12*complexconjugate(Yu21) + ZUR13*complexconjugate(Yu31)) + ZUL22*(ZUR11*complexconjugate(Yu12) + ZUR12*complexconjugate(Yu22) + ZUR13*complexconjugate(Yu32)) + ZUL23*(ZUR11*complexconjugate(Yu13) + ZUR12*complexconjugate(Yu23) + ZUR13*complexconjugate(Yu33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_461 = Coupling(name = 'GC_461',
	 value = '(-1*complex(0,1)*ZH11*(complexconjugate(ZUL21)*(Yu11*complexconjugate(ZUR21) + Yu21*complexconjugate(ZUR22) + Yu31*complexconjugate(ZUR23)) + complexconjugate(ZUL22)*(Yu12*complexconjugate(ZUR21) + Yu22*complexconjugate(ZUR22) + Yu32*complexconjugate(ZUR23)) + complexconjugate(ZUL23)*(Yu13*complexconjugate(ZUR21) + Yu23*complexconjugate(ZUR22) + Yu33*complexconjugate(ZUR23))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_462 = Coupling(name = 'GC_462',
	 value = '(-1*complex(0,1)*ZH11*(ZUL21*(ZUR21*complexconjugate(Yu11) + ZUR22*complexconjugate(Yu21) + ZUR23*complexconjugate(Yu31)) + ZUL22*(ZUR21*complexconjugate(Yu12) + ZUR22*complexconjugate(Yu22) + ZUR23*complexconjugate(Yu32)) + ZUL23*(ZUR21*complexconjugate(Yu13) + ZUR22*complexconjugate(Yu23) + ZUR23*complexconjugate(Yu33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_463 = Coupling(name = 'GC_463',
	 value = '(-1*complex(0,1)*ZH21*(complexconjugate(ZUL21)*(Yu11*complexconjugate(ZUR21) + Yu21*complexconjugate(ZUR22) + Yu31*complexconjugate(ZUR23)) + complexconjugate(ZUL22)*(Yu12*complexconjugate(ZUR21) + Yu22*complexconjugate(ZUR22) + Yu32*complexconjugate(ZUR23)) + complexconjugate(ZUL23)*(Yu13*complexconjugate(ZUR21) + Yu23*complexconjugate(ZUR22) + Yu33*complexconjugate(ZUR23))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_464 = Coupling(name = 'GC_464',
	 value = '(-1*complex(0,1)*ZH21*(ZUL21*(ZUR21*complexconjugate(Yu11) + ZUR22*complexconjugate(Yu21) + ZUR23*complexconjugate(Yu31)) + ZUL22*(ZUR21*complexconjugate(Yu12) + ZUR22*complexconjugate(Yu22) + ZUR23*complexconjugate(Yu32)) + ZUL23*(ZUR21*complexconjugate(Yu13) + ZUR22*complexconjugate(Yu23) + ZUR23*complexconjugate(Yu33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_465 = Coupling(name = 'GC_465',
	 value = '(-1*complex(0,1)*ZH11*(complexconjugate(ZUL31)*(Yu11*complexconjugate(ZUR21) + Yu21*complexconjugate(ZUR22) + Yu31*complexconjugate(ZUR23)) + complexconjugate(ZUL32)*(Yu12*complexconjugate(ZUR21) + Yu22*complexconjugate(ZUR22) + Yu32*complexconjugate(ZUR23)) + complexconjugate(ZUL33)*(Yu13*complexconjugate(ZUR21) + Yu23*complexconjugate(ZUR22) + Yu33*complexconjugate(ZUR23))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_466 = Coupling(name = 'GC_466',
	 value = '(-1*complex(0,1)*ZH11*(ZUL21*(ZUR31*complexconjugate(Yu11) + ZUR32*complexconjugate(Yu21) + ZUR33*complexconjugate(Yu31)) + ZUL22*(ZUR31*complexconjugate(Yu12) + ZUR32*complexconjugate(Yu22) + ZUR33*complexconjugate(Yu32)) + ZUL23*(ZUR31*complexconjugate(Yu13) + ZUR32*complexconjugate(Yu23) + ZUR33*complexconjugate(Yu33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_467 = Coupling(name = 'GC_467',
	 value = '(-1*complex(0,1)*ZH21*(complexconjugate(ZUL31)*(Yu11*complexconjugate(ZUR21) + Yu21*complexconjugate(ZUR22) + Yu31*complexconjugate(ZUR23)) + complexconjugate(ZUL32)*(Yu12*complexconjugate(ZUR21) + Yu22*complexconjugate(ZUR22) + Yu32*complexconjugate(ZUR23)) + complexconjugate(ZUL33)*(Yu13*complexconjugate(ZUR21) + Yu23*complexconjugate(ZUR22) + Yu33*complexconjugate(ZUR23))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_468 = Coupling(name = 'GC_468',
	 value = '(-1*complex(0,1)*ZH21*(ZUL21*(ZUR31*complexconjugate(Yu11) + ZUR32*complexconjugate(Yu21) + ZUR33*complexconjugate(Yu31)) + ZUL22*(ZUR31*complexconjugate(Yu12) + ZUR32*complexconjugate(Yu22) + ZUR33*complexconjugate(Yu32)) + ZUL23*(ZUR31*complexconjugate(Yu13) + ZUR32*complexconjugate(Yu23) + ZUR33*complexconjugate(Yu33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_469 = Coupling(name = 'GC_469',
	 value = '(-1*complex(0,1)*ZH11*(complexconjugate(ZUL11)*(Yu11*complexconjugate(ZUR31) + Yu21*complexconjugate(ZUR32) + Yu31*complexconjugate(ZUR33)) + complexconjugate(ZUL12)*(Yu12*complexconjugate(ZUR31) + Yu22*complexconjugate(ZUR32) + Yu32*complexconjugate(ZUR33)) + complexconjugate(ZUL13)*(Yu13*complexconjugate(ZUR31) + Yu23*complexconjugate(ZUR32) + Yu33*complexconjugate(ZUR33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_470 = Coupling(name = 'GC_470',
	 value = '(-1*complex(0,1)*ZH11*(ZUL31*(ZUR11*complexconjugate(Yu11) + ZUR12*complexconjugate(Yu21) + ZUR13*complexconjugate(Yu31)) + ZUL32*(ZUR11*complexconjugate(Yu12) + ZUR12*complexconjugate(Yu22) + ZUR13*complexconjugate(Yu32)) + ZUL33*(ZUR11*complexconjugate(Yu13) + ZUR12*complexconjugate(Yu23) + ZUR13*complexconjugate(Yu33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_471 = Coupling(name = 'GC_471',
	 value = '(-1*complex(0,1)*ZH21*(complexconjugate(ZUL11)*(Yu11*complexconjugate(ZUR31) + Yu21*complexconjugate(ZUR32) + Yu31*complexconjugate(ZUR33)) + complexconjugate(ZUL12)*(Yu12*complexconjugate(ZUR31) + Yu22*complexconjugate(ZUR32) + Yu32*complexconjugate(ZUR33)) + complexconjugate(ZUL13)*(Yu13*complexconjugate(ZUR31) + Yu23*complexconjugate(ZUR32) + Yu33*complexconjugate(ZUR33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_472 = Coupling(name = 'GC_472',
	 value = '(-1*complex(0,1)*ZH21*(ZUL31*(ZUR11*complexconjugate(Yu11) + ZUR12*complexconjugate(Yu21) + ZUR13*complexconjugate(Yu31)) + ZUL32*(ZUR11*complexconjugate(Yu12) + ZUR12*complexconjugate(Yu22) + ZUR13*complexconjugate(Yu32)) + ZUL33*(ZUR11*complexconjugate(Yu13) + ZUR12*complexconjugate(Yu23) + ZUR13*complexconjugate(Yu33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_473 = Coupling(name = 'GC_473',
	 value = '(-1*complex(0,1)*ZH11*(complexconjugate(ZUL21)*(Yu11*complexconjugate(ZUR31) + Yu21*complexconjugate(ZUR32) + Yu31*complexconjugate(ZUR33)) + complexconjugate(ZUL22)*(Yu12*complexconjugate(ZUR31) + Yu22*complexconjugate(ZUR32) + Yu32*complexconjugate(ZUR33)) + complexconjugate(ZUL23)*(Yu13*complexconjugate(ZUR31) + Yu23*complexconjugate(ZUR32) + Yu33*complexconjugate(ZUR33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_474 = Coupling(name = 'GC_474',
	 value = '(-1*complex(0,1)*ZH11*(ZUL31*(ZUR21*complexconjugate(Yu11) + ZUR22*complexconjugate(Yu21) + ZUR23*complexconjugate(Yu31)) + ZUL32*(ZUR21*complexconjugate(Yu12) + ZUR22*complexconjugate(Yu22) + ZUR23*complexconjugate(Yu32)) + ZUL33*(ZUR21*complexconjugate(Yu13) + ZUR22*complexconjugate(Yu23) + ZUR23*complexconjugate(Yu33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_475 = Coupling(name = 'GC_475',
	 value = '(-1*complex(0,1)*ZH21*(complexconjugate(ZUL21)*(Yu11*complexconjugate(ZUR31) + Yu21*complexconjugate(ZUR32) + Yu31*complexconjugate(ZUR33)) + complexconjugate(ZUL22)*(Yu12*complexconjugate(ZUR31) + Yu22*complexconjugate(ZUR32) + Yu32*complexconjugate(ZUR33)) + complexconjugate(ZUL23)*(Yu13*complexconjugate(ZUR31) + Yu23*complexconjugate(ZUR32) + Yu33*complexconjugate(ZUR33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_476 = Coupling(name = 'GC_476',
	 value = '(-1*complex(0,1)*ZH21*(ZUL31*(ZUR21*complexconjugate(Yu11) + ZUR22*complexconjugate(Yu21) + ZUR23*complexconjugate(Yu31)) + ZUL32*(ZUR21*complexconjugate(Yu12) + ZUR22*complexconjugate(Yu22) + ZUR23*complexconjugate(Yu32)) + ZUL33*(ZUR21*complexconjugate(Yu13) + ZUR22*complexconjugate(Yu23) + ZUR23*complexconjugate(Yu33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_477 = Coupling(name = 'GC_477',
	 value = '(-1*complex(0,1)*ZH11*(complexconjugate(ZUL31)*(Yu11*complexconjugate(ZUR31) + Yu21*complexconjugate(ZUR32) + Yu31*complexconjugate(ZUR33)) + complexconjugate(ZUL32)*(Yu12*complexconjugate(ZUR31) + Yu22*complexconjugate(ZUR32) + Yu32*complexconjugate(ZUR33)) + complexconjugate(ZUL33)*(Yu13*complexconjugate(ZUR31) + Yu23*complexconjugate(ZUR32) + Yu33*complexconjugate(ZUR33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_478 = Coupling(name = 'GC_478',
	 value = '(-1*complex(0,1)*ZH11*(ZUL31*(ZUR31*complexconjugate(Yu11) + ZUR32*complexconjugate(Yu21) + ZUR33*complexconjugate(Yu31)) + ZUL32*(ZUR31*complexconjugate(Yu12) + ZUR32*complexconjugate(Yu22) + ZUR33*complexconjugate(Yu32)) + ZUL33*(ZUR31*complexconjugate(Yu13) + ZUR32*complexconjugate(Yu23) + ZUR33*complexconjugate(Yu33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_479 = Coupling(name = 'GC_479',
	 value = '(-1*complex(0,1)*ZH21*(complexconjugate(ZUL31)*(Yu11*complexconjugate(ZUR31) + Yu21*complexconjugate(ZUR32) + Yu31*complexconjugate(ZUR33)) + complexconjugate(ZUL32)*(Yu12*complexconjugate(ZUR31) + Yu22*complexconjugate(ZUR32) + Yu32*complexconjugate(ZUR33)) + complexconjugate(ZUL33)*(Yu13*complexconjugate(ZUR31) + Yu23*complexconjugate(ZUR32) + Yu33*complexconjugate(ZUR33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_480 = Coupling(name = 'GC_480',
	 value = '(-1*complex(0,1)*ZH21*(ZUL31*(ZUR31*complexconjugate(Yu11) + ZUR32*complexconjugate(Yu21) + ZUR33*complexconjugate(Yu31)) + ZUL32*(ZUR31*complexconjugate(Yu12) + ZUR32*complexconjugate(Yu22) + ZUR33*complexconjugate(Yu32)) + ZUL33*(ZUR31*complexconjugate(Yu13) + ZUR32*complexconjugate(Yu23) + ZUR33*complexconjugate(Yu33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_481 = Coupling(name = 'GC_481',
	 value = '1*complex(0,1)*((Yd11*complexconjugate(ZDR11) + Yd21*complexconjugate(ZDR12) + Yd31*complexconjugate(ZDR13))*complexconjugate(ZUL11) + (Yd12*complexconjugate(ZDR11) + Yd22*complexconjugate(ZDR12) + Yd32*complexconjugate(ZDR13))*complexconjugate(ZUL12) + (Yd13*complexconjugate(ZDR11) + Yd23*complexconjugate(ZDR12) + Yd33*complexconjugate(ZDR13))*complexconjugate(ZUL13))', 
	 order = {'QED':1} ) 
 
GC_482 = Coupling(name = 'GC_482',
	 value = '-1*complex(0,1)*(ZDL11*(ZUR11*complexconjugate(Yu11) + ZUR12*complexconjugate(Yu21) + ZUR13*complexconjugate(Yu31)) + ZDL12*(ZUR11*complexconjugate(Yu12) + ZUR12*complexconjugate(Yu22) + ZUR13*complexconjugate(Yu32)) + ZDL13*(ZUR11*complexconjugate(Yu13) + ZUR12*complexconjugate(Yu23) + ZUR13*complexconjugate(Yu33)))', 
	 order = {'QED':1} ) 
 
GC_483 = Coupling(name = 'GC_483',
	 value = '1*complex(0,1)*((Yd11*complexconjugate(ZDR11) + Yd21*complexconjugate(ZDR12) + Yd31*complexconjugate(ZDR13))*complexconjugate(ZUL21) + (Yd12*complexconjugate(ZDR11) + Yd22*complexconjugate(ZDR12) + Yd32*complexconjugate(ZDR13))*complexconjugate(ZUL22) + (Yd13*complexconjugate(ZDR11) + Yd23*complexconjugate(ZDR12) + Yd33*complexconjugate(ZDR13))*complexconjugate(ZUL23))', 
	 order = {'QED':1} ) 
 
GC_484 = Coupling(name = 'GC_484',
	 value = '-1*complex(0,1)*(ZDL11*(ZUR21*complexconjugate(Yu11) + ZUR22*complexconjugate(Yu21) + ZUR23*complexconjugate(Yu31)) + ZDL12*(ZUR21*complexconjugate(Yu12) + ZUR22*complexconjugate(Yu22) + ZUR23*complexconjugate(Yu32)) + ZDL13*(ZUR21*complexconjugate(Yu13) + ZUR22*complexconjugate(Yu23) + ZUR23*complexconjugate(Yu33)))', 
	 order = {'QED':1} ) 
 
GC_485 = Coupling(name = 'GC_485',
	 value = '1*complex(0,1)*((Yd11*complexconjugate(ZDR11) + Yd21*complexconjugate(ZDR12) + Yd31*complexconjugate(ZDR13))*complexconjugate(ZUL31) + (Yd12*complexconjugate(ZDR11) + Yd22*complexconjugate(ZDR12) + Yd32*complexconjugate(ZDR13))*complexconjugate(ZUL32) + (Yd13*complexconjugate(ZDR11) + Yd23*complexconjugate(ZDR12) + Yd33*complexconjugate(ZDR13))*complexconjugate(ZUL33))', 
	 order = {'QED':1} ) 
 
GC_486 = Coupling(name = 'GC_486',
	 value = '-1*complex(0,1)*(ZDL11*(ZUR31*complexconjugate(Yu11) + ZUR32*complexconjugate(Yu21) + ZUR33*complexconjugate(Yu31)) + ZDL12*(ZUR31*complexconjugate(Yu12) + ZUR32*complexconjugate(Yu22) + ZUR33*complexconjugate(Yu32)) + ZDL13*(ZUR31*complexconjugate(Yu13) + ZUR32*complexconjugate(Yu23) + ZUR33*complexconjugate(Yu33)))', 
	 order = {'QED':1} ) 
 
GC_487 = Coupling(name = 'GC_487',
	 value = '1*complex(0,1)*((Yd11*complexconjugate(ZDR21) + Yd21*complexconjugate(ZDR22) + Yd31*complexconjugate(ZDR23))*complexconjugate(ZUL11) + (Yd12*complexconjugate(ZDR21) + Yd22*complexconjugate(ZDR22) + Yd32*complexconjugate(ZDR23))*complexconjugate(ZUL12) + (Yd13*complexconjugate(ZDR21) + Yd23*complexconjugate(ZDR22) + Yd33*complexconjugate(ZDR23))*complexconjugate(ZUL13))', 
	 order = {'QED':1} ) 
 
GC_488 = Coupling(name = 'GC_488',
	 value = '-1*complex(0,1)*(ZDL21*(ZUR11*complexconjugate(Yu11) + ZUR12*complexconjugate(Yu21) + ZUR13*complexconjugate(Yu31)) + ZDL22*(ZUR11*complexconjugate(Yu12) + ZUR12*complexconjugate(Yu22) + ZUR13*complexconjugate(Yu32)) + ZDL23*(ZUR11*complexconjugate(Yu13) + ZUR12*complexconjugate(Yu23) + ZUR13*complexconjugate(Yu33)))', 
	 order = {'QED':1} ) 
 
GC_489 = Coupling(name = 'GC_489',
	 value = '1*complex(0,1)*((Yd11*complexconjugate(ZDR21) + Yd21*complexconjugate(ZDR22) + Yd31*complexconjugate(ZDR23))*complexconjugate(ZUL21) + (Yd12*complexconjugate(ZDR21) + Yd22*complexconjugate(ZDR22) + Yd32*complexconjugate(ZDR23))*complexconjugate(ZUL22) + (Yd13*complexconjugate(ZDR21) + Yd23*complexconjugate(ZDR22) + Yd33*complexconjugate(ZDR23))*complexconjugate(ZUL23))', 
	 order = {'QED':1} ) 
 
GC_490 = Coupling(name = 'GC_490',
	 value = '-1*complex(0,1)*(ZDL21*(ZUR21*complexconjugate(Yu11) + ZUR22*complexconjugate(Yu21) + ZUR23*complexconjugate(Yu31)) + ZDL22*(ZUR21*complexconjugate(Yu12) + ZUR22*complexconjugate(Yu22) + ZUR23*complexconjugate(Yu32)) + ZDL23*(ZUR21*complexconjugate(Yu13) + ZUR22*complexconjugate(Yu23) + ZUR23*complexconjugate(Yu33)))', 
	 order = {'QED':1} ) 
 
GC_491 = Coupling(name = 'GC_491',
	 value = '1*complex(0,1)*((Yd11*complexconjugate(ZDR21) + Yd21*complexconjugate(ZDR22) + Yd31*complexconjugate(ZDR23))*complexconjugate(ZUL31) + (Yd12*complexconjugate(ZDR21) + Yd22*complexconjugate(ZDR22) + Yd32*complexconjugate(ZDR23))*complexconjugate(ZUL32) + (Yd13*complexconjugate(ZDR21) + Yd23*complexconjugate(ZDR22) + Yd33*complexconjugate(ZDR23))*complexconjugate(ZUL33))', 
	 order = {'QED':1} ) 
 
GC_492 = Coupling(name = 'GC_492',
	 value = '-1*complex(0,1)*(ZDL21*(ZUR31*complexconjugate(Yu11) + ZUR32*complexconjugate(Yu21) + ZUR33*complexconjugate(Yu31)) + ZDL22*(ZUR31*complexconjugate(Yu12) + ZUR32*complexconjugate(Yu22) + ZUR33*complexconjugate(Yu32)) + ZDL23*(ZUR31*complexconjugate(Yu13) + ZUR32*complexconjugate(Yu23) + ZUR33*complexconjugate(Yu33)))', 
	 order = {'QED':1} ) 
 
GC_493 = Coupling(name = 'GC_493',
	 value = '1*complex(0,1)*((Yd11*complexconjugate(ZDR31) + Yd21*complexconjugate(ZDR32) + Yd31*complexconjugate(ZDR33))*complexconjugate(ZUL11) + (Yd12*complexconjugate(ZDR31) + Yd22*complexconjugate(ZDR32) + Yd32*complexconjugate(ZDR33))*complexconjugate(ZUL12) + (Yd13*complexconjugate(ZDR31) + Yd23*complexconjugate(ZDR32) + Yd33*complexconjugate(ZDR33))*complexconjugate(ZUL13))', 
	 order = {'QED':1} ) 
 
GC_494 = Coupling(name = 'GC_494',
	 value = '-1*complex(0,1)*(ZDL31*(ZUR11*complexconjugate(Yu11) + ZUR12*complexconjugate(Yu21) + ZUR13*complexconjugate(Yu31)) + ZDL32*(ZUR11*complexconjugate(Yu12) + ZUR12*complexconjugate(Yu22) + ZUR13*complexconjugate(Yu32)) + ZDL33*(ZUR11*complexconjugate(Yu13) + ZUR12*complexconjugate(Yu23) + ZUR13*complexconjugate(Yu33)))', 
	 order = {'QED':1} ) 
 
GC_495 = Coupling(name = 'GC_495',
	 value = '1*complex(0,1)*((Yd11*complexconjugate(ZDR31) + Yd21*complexconjugate(ZDR32) + Yd31*complexconjugate(ZDR33))*complexconjugate(ZUL21) + (Yd12*complexconjugate(ZDR31) + Yd22*complexconjugate(ZDR32) + Yd32*complexconjugate(ZDR33))*complexconjugate(ZUL22) + (Yd13*complexconjugate(ZDR31) + Yd23*complexconjugate(ZDR32) + Yd33*complexconjugate(ZDR33))*complexconjugate(ZUL23))', 
	 order = {'QED':1} ) 
 
GC_496 = Coupling(name = 'GC_496',
	 value = '-1*complex(0,1)*(ZDL31*(ZUR21*complexconjugate(Yu11) + ZUR22*complexconjugate(Yu21) + ZUR23*complexconjugate(Yu31)) + ZDL32*(ZUR21*complexconjugate(Yu12) + ZUR22*complexconjugate(Yu22) + ZUR23*complexconjugate(Yu32)) + ZDL33*(ZUR21*complexconjugate(Yu13) + ZUR22*complexconjugate(Yu23) + ZUR23*complexconjugate(Yu33)))', 
	 order = {'QED':1} ) 
 
GC_497 = Coupling(name = 'GC_497',
	 value = '1*complex(0,1)*((Yd11*complexconjugate(ZDR31) + Yd21*complexconjugate(ZDR32) + Yd31*complexconjugate(ZDR33))*complexconjugate(ZUL31) + (Yd12*complexconjugate(ZDR31) + Yd22*complexconjugate(ZDR32) + Yd32*complexconjugate(ZDR33))*complexconjugate(ZUL32) + (Yd13*complexconjugate(ZDR31) + Yd23*complexconjugate(ZDR32) + Yd33*complexconjugate(ZDR33))*complexconjugate(ZUL33))', 
	 order = {'QED':1} ) 
 
GC_498 = Coupling(name = 'GC_498',
	 value = '-1*complex(0,1)*(ZDL31*(ZUR31*complexconjugate(Yu11) + ZUR32*complexconjugate(Yu21) + ZUR33*complexconjugate(Yu31)) + ZDL32*(ZUR31*complexconjugate(Yu12) + ZUR32*complexconjugate(Yu22) + ZUR33*complexconjugate(Yu32)) + ZDL33*(ZUR31*complexconjugate(Yu13) + ZUR32*complexconjugate(Yu23) + ZUR33*complexconjugate(Yu33)))', 
	 order = {'QED':1} ) 
 
GC_499 = Coupling(name = 'GC_499',
	 value = '(-1*complex(0,1)*(2*ZH11*((Yv11*complexconjugate(UV11) + Yv21*complexconjugate(UV12) + Yv31*complexconjugate(UV13))*complexconjugate(UV14) + (Yv12*complexconjugate(UV11) + Yv22*complexconjugate(UV12) + Yv32*complexconjugate(UV13))*complexconjugate(UV15) + (Yv13*complexconjugate(UV11) + Yv23*complexconjugate(UV12) + Yv33*complexconjugate(UV13))*complexconjugate(UV16)) + ZH12*(2*complexconjugate(UV14)*(Yx11*complexconjugate(UV14) + Yx21*complexconjugate(UV15) + Yx31*complexconjugate(UV16)) + 2*complexconjugate(UV15)*(Yx12*complexconjugate(UV14) + Yx22*complexconjugate(UV15) + Yx32*complexconjugate(UV16)) + 2*complexconjugate(UV16)*(Yx13*complexconjugate(UV14) + Yx23*complexconjugate(UV15) + Yx33*complexconjugate(UV16)))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_500 = Coupling(name = 'GC_500',
	 value = '(-1*complex(0,1)*(2*ZH11*(UV14*(UV11*complexconjugate(Yv11) + UV12*complexconjugate(Yv21) + UV13*complexconjugate(Yv31)) + UV15*(UV11*complexconjugate(Yv12) + UV12*complexconjugate(Yv22) + UV13*complexconjugate(Yv32)) + UV16*(UV11*complexconjugate(Yv13) + UV12*complexconjugate(Yv23) + UV13*complexconjugate(Yv33))) + ZH12*(2*UV14*(UV14*complexconjugate(Yx11) + UV15*complexconjugate(Yx21) + UV16*complexconjugate(Yx31)) + 2*UV15*(UV14*complexconjugate(Yx12) + UV15*complexconjugate(Yx22) + UV16*complexconjugate(Yx32)) + 2*UV16*(UV14*complexconjugate(Yx13) + UV15*complexconjugate(Yx23) + UV16*complexconjugate(Yx33)))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_501 = Coupling(name = 'GC_501',
	 value = '(-1*complex(0,1)*(2*ZH21*((Yv11*complexconjugate(UV11) + Yv21*complexconjugate(UV12) + Yv31*complexconjugate(UV13))*complexconjugate(UV14) + (Yv12*complexconjugate(UV11) + Yv22*complexconjugate(UV12) + Yv32*complexconjugate(UV13))*complexconjugate(UV15) + (Yv13*complexconjugate(UV11) + Yv23*complexconjugate(UV12) + Yv33*complexconjugate(UV13))*complexconjugate(UV16)) + ZH22*(2*complexconjugate(UV14)*(Yx11*complexconjugate(UV14) + Yx21*complexconjugate(UV15) + Yx31*complexconjugate(UV16)) + 2*complexconjugate(UV15)*(Yx12*complexconjugate(UV14) + Yx22*complexconjugate(UV15) + Yx32*complexconjugate(UV16)) + 2*complexconjugate(UV16)*(Yx13*complexconjugate(UV14) + Yx23*complexconjugate(UV15) + Yx33*complexconjugate(UV16)))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_502 = Coupling(name = 'GC_502',
	 value = '(-1*complex(0,1)*(2*ZH21*(UV14*(UV11*complexconjugate(Yv11) + UV12*complexconjugate(Yv21) + UV13*complexconjugate(Yv31)) + UV15*(UV11*complexconjugate(Yv12) + UV12*complexconjugate(Yv22) + UV13*complexconjugate(Yv32)) + UV16*(UV11*complexconjugate(Yv13) + UV12*complexconjugate(Yv23) + UV13*complexconjugate(Yv33))) + ZH22*(2*UV14*(UV14*complexconjugate(Yx11) + UV15*complexconjugate(Yx21) + UV16*complexconjugate(Yx31)) + 2*UV15*(UV14*complexconjugate(Yx12) + UV15*complexconjugate(Yx22) + UV16*complexconjugate(Yx32)) + 2*UV16*(UV14*complexconjugate(Yx13) + UV15*complexconjugate(Yx23) + UV16*complexconjugate(Yx33)))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_503 = Coupling(name = 'GC_503',
	 value = '(-1*complex(0,1)*(ZH11*(complexconjugate(UV14)*(Yv11*complexconjugate(UV21) + Yv21*complexconjugate(UV22) + Yv31*complexconjugate(UV23)) + complexconjugate(UV15)*(Yv12*complexconjugate(UV21) + Yv22*complexconjugate(UV22) + Yv32*complexconjugate(UV23)) + complexconjugate(UV16)*(Yv13*complexconjugate(UV21) + Yv23*complexconjugate(UV22) + Yv33*complexconjugate(UV23))) + ZH11*((Yv11*complexconjugate(UV11) + Yv21*complexconjugate(UV12) + Yv31*complexconjugate(UV13))*complexconjugate(UV24) + (Yv12*complexconjugate(UV11) + Yv22*complexconjugate(UV12) + Yv32*complexconjugate(UV13))*complexconjugate(UV25) + (Yv13*complexconjugate(UV11) + Yv23*complexconjugate(UV12) + Yv33*complexconjugate(UV13))*complexconjugate(UV26)) + ZH12*((Yx11*complexconjugate(UV14) + Yx21*complexconjugate(UV15) + Yx31*complexconjugate(UV16))*complexconjugate(UV24) + (Yx12*complexconjugate(UV14) + Yx22*complexconjugate(UV15) + Yx32*complexconjugate(UV16))*complexconjugate(UV25) + (Yx13*complexconjugate(UV14) + Yx23*complexconjugate(UV15) + Yx33*complexconjugate(UV16))*complexconjugate(UV26) + complexconjugate(UV14)*(Yx11*complexconjugate(UV24) + Yx21*complexconjugate(UV25) + Yx31*complexconjugate(UV26)) + complexconjugate(UV15)*(Yx12*complexconjugate(UV24) + Yx22*complexconjugate(UV25) + Yx32*complexconjugate(UV26)) + complexconjugate(UV16)*(Yx13*complexconjugate(UV24) + Yx23*complexconjugate(UV25) + Yx33*complexconjugate(UV26)))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_504 = Coupling(name = 'GC_504',
	 value = '(-1*complex(0,1)*(ZH11*(UV24*(UV11*complexconjugate(Yv11) + UV12*complexconjugate(Yv21) + UV13*complexconjugate(Yv31)) + UV25*(UV11*complexconjugate(Yv12) + UV12*complexconjugate(Yv22) + UV13*complexconjugate(Yv32)) + UV26*(UV11*complexconjugate(Yv13) + UV12*complexconjugate(Yv23) + UV13*complexconjugate(Yv33))) + ZH11*(UV14*(UV21*complexconjugate(Yv11) + UV22*complexconjugate(Yv21) + UV23*complexconjugate(Yv31)) + UV15*(UV21*complexconjugate(Yv12) + UV22*complexconjugate(Yv22) + UV23*complexconjugate(Yv32)) + UV16*(UV21*complexconjugate(Yv13) + UV22*complexconjugate(Yv23) + UV23*complexconjugate(Yv33))) + ZH12*(UV24*(UV14*complexconjugate(Yx11) + UV15*complexconjugate(Yx21) + UV16*complexconjugate(Yx31)) + UV14*(UV24*complexconjugate(Yx11) + UV25*complexconjugate(Yx21) + UV26*complexconjugate(Yx31)) + UV25*(UV14*complexconjugate(Yx12) + UV15*complexconjugate(Yx22) + UV16*complexconjugate(Yx32)) + UV15*(UV24*complexconjugate(Yx12) + UV25*complexconjugate(Yx22) + UV26*complexconjugate(Yx32)) + UV26*(UV14*complexconjugate(Yx13) + UV15*complexconjugate(Yx23) + UV16*complexconjugate(Yx33)) + UV16*(UV24*complexconjugate(Yx13) + UV25*complexconjugate(Yx23) + UV26*complexconjugate(Yx33)))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_505 = Coupling(name = 'GC_505',
	 value = '(-1*complex(0,1)*(ZH21*(complexconjugate(UV14)*(Yv11*complexconjugate(UV21) + Yv21*complexconjugate(UV22) + Yv31*complexconjugate(UV23)) + complexconjugate(UV15)*(Yv12*complexconjugate(UV21) + Yv22*complexconjugate(UV22) + Yv32*complexconjugate(UV23)) + complexconjugate(UV16)*(Yv13*complexconjugate(UV21) + Yv23*complexconjugate(UV22) + Yv33*complexconjugate(UV23))) + ZH21*((Yv11*complexconjugate(UV11) + Yv21*complexconjugate(UV12) + Yv31*complexconjugate(UV13))*complexconjugate(UV24) + (Yv12*complexconjugate(UV11) + Yv22*complexconjugate(UV12) + Yv32*complexconjugate(UV13))*complexconjugate(UV25) + (Yv13*complexconjugate(UV11) + Yv23*complexconjugate(UV12) + Yv33*complexconjugate(UV13))*complexconjugate(UV26)) + ZH22*((Yx11*complexconjugate(UV14) + Yx21*complexconjugate(UV15) + Yx31*complexconjugate(UV16))*complexconjugate(UV24) + (Yx12*complexconjugate(UV14) + Yx22*complexconjugate(UV15) + Yx32*complexconjugate(UV16))*complexconjugate(UV25) + (Yx13*complexconjugate(UV14) + Yx23*complexconjugate(UV15) + Yx33*complexconjugate(UV16))*complexconjugate(UV26) + complexconjugate(UV14)*(Yx11*complexconjugate(UV24) + Yx21*complexconjugate(UV25) + Yx31*complexconjugate(UV26)) + complexconjugate(UV15)*(Yx12*complexconjugate(UV24) + Yx22*complexconjugate(UV25) + Yx32*complexconjugate(UV26)) + complexconjugate(UV16)*(Yx13*complexconjugate(UV24) + Yx23*complexconjugate(UV25) + Yx33*complexconjugate(UV26)))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_506 = Coupling(name = 'GC_506',
	 value = '(-1*complex(0,1)*(ZH21*(UV24*(UV11*complexconjugate(Yv11) + UV12*complexconjugate(Yv21) + UV13*complexconjugate(Yv31)) + UV25*(UV11*complexconjugate(Yv12) + UV12*complexconjugate(Yv22) + UV13*complexconjugate(Yv32)) + UV26*(UV11*complexconjugate(Yv13) + UV12*complexconjugate(Yv23) + UV13*complexconjugate(Yv33))) + ZH21*(UV14*(UV21*complexconjugate(Yv11) + UV22*complexconjugate(Yv21) + UV23*complexconjugate(Yv31)) + UV15*(UV21*complexconjugate(Yv12) + UV22*complexconjugate(Yv22) + UV23*complexconjugate(Yv32)) + UV16*(UV21*complexconjugate(Yv13) + UV22*complexconjugate(Yv23) + UV23*complexconjugate(Yv33))) + ZH22*(UV24*(UV14*complexconjugate(Yx11) + UV15*complexconjugate(Yx21) + UV16*complexconjugate(Yx31)) + UV14*(UV24*complexconjugate(Yx11) + UV25*complexconjugate(Yx21) + UV26*complexconjugate(Yx31)) + UV25*(UV14*complexconjugate(Yx12) + UV15*complexconjugate(Yx22) + UV16*complexconjugate(Yx32)) + UV15*(UV24*complexconjugate(Yx12) + UV25*complexconjugate(Yx22) + UV26*complexconjugate(Yx32)) + UV26*(UV14*complexconjugate(Yx13) + UV15*complexconjugate(Yx23) + UV16*complexconjugate(Yx33)) + UV16*(UV24*complexconjugate(Yx13) + UV25*complexconjugate(Yx23) + UV26*complexconjugate(Yx33)))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_507 = Coupling(name = 'GC_507',
	 value = '(-1*complex(0,1)*(ZH11*(complexconjugate(UV14)*(Yv11*complexconjugate(UV31) + Yv21*complexconjugate(UV32) + Yv31*complexconjugate(UV33)) + complexconjugate(UV15)*(Yv12*complexconjugate(UV31) + Yv22*complexconjugate(UV32) + Yv32*complexconjugate(UV33)) + complexconjugate(UV16)*(Yv13*complexconjugate(UV31) + Yv23*complexconjugate(UV32) + Yv33*complexconjugate(UV33))) + ZH11*((Yv11*complexconjugate(UV11) + Yv21*complexconjugate(UV12) + Yv31*complexconjugate(UV13))*complexconjugate(UV34) + (Yv12*complexconjugate(UV11) + Yv22*complexconjugate(UV12) + Yv32*complexconjugate(UV13))*complexconjugate(UV35) + (Yv13*complexconjugate(UV11) + Yv23*complexconjugate(UV12) + Yv33*complexconjugate(UV13))*complexconjugate(UV36)) + ZH12*((Yx11*complexconjugate(UV14) + Yx21*complexconjugate(UV15) + Yx31*complexconjugate(UV16))*complexconjugate(UV34) + (Yx12*complexconjugate(UV14) + Yx22*complexconjugate(UV15) + Yx32*complexconjugate(UV16))*complexconjugate(UV35) + (Yx13*complexconjugate(UV14) + Yx23*complexconjugate(UV15) + Yx33*complexconjugate(UV16))*complexconjugate(UV36) + complexconjugate(UV14)*(Yx11*complexconjugate(UV34) + Yx21*complexconjugate(UV35) + Yx31*complexconjugate(UV36)) + complexconjugate(UV15)*(Yx12*complexconjugate(UV34) + Yx22*complexconjugate(UV35) + Yx32*complexconjugate(UV36)) + complexconjugate(UV16)*(Yx13*complexconjugate(UV34) + Yx23*complexconjugate(UV35) + Yx33*complexconjugate(UV36)))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_508 = Coupling(name = 'GC_508',
	 value = '(-1*complex(0,1)*(ZH11*(UV34*(UV11*complexconjugate(Yv11) + UV12*complexconjugate(Yv21) + UV13*complexconjugate(Yv31)) + UV35*(UV11*complexconjugate(Yv12) + UV12*complexconjugate(Yv22) + UV13*complexconjugate(Yv32)) + UV36*(UV11*complexconjugate(Yv13) + UV12*complexconjugate(Yv23) + UV13*complexconjugate(Yv33))) + ZH11*(UV14*(UV31*complexconjugate(Yv11) + UV32*complexconjugate(Yv21) + UV33*complexconjugate(Yv31)) + UV15*(UV31*complexconjugate(Yv12) + UV32*complexconjugate(Yv22) + UV33*complexconjugate(Yv32)) + UV16*(UV31*complexconjugate(Yv13) + UV32*complexconjugate(Yv23) + UV33*complexconjugate(Yv33))) + ZH12*(UV34*(UV14*complexconjugate(Yx11) + UV15*complexconjugate(Yx21) + UV16*complexconjugate(Yx31)) + UV14*(UV34*complexconjugate(Yx11) + UV35*complexconjugate(Yx21) + UV36*complexconjugate(Yx31)) + UV35*(UV14*complexconjugate(Yx12) + UV15*complexconjugate(Yx22) + UV16*complexconjugate(Yx32)) + UV15*(UV34*complexconjugate(Yx12) + UV35*complexconjugate(Yx22) + UV36*complexconjugate(Yx32)) + UV36*(UV14*complexconjugate(Yx13) + UV15*complexconjugate(Yx23) + UV16*complexconjugate(Yx33)) + UV16*(UV34*complexconjugate(Yx13) + UV35*complexconjugate(Yx23) + UV36*complexconjugate(Yx33)))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_509 = Coupling(name = 'GC_509',
	 value = '(-1*complex(0,1)*(ZH21*(complexconjugate(UV14)*(Yv11*complexconjugate(UV31) + Yv21*complexconjugate(UV32) + Yv31*complexconjugate(UV33)) + complexconjugate(UV15)*(Yv12*complexconjugate(UV31) + Yv22*complexconjugate(UV32) + Yv32*complexconjugate(UV33)) + complexconjugate(UV16)*(Yv13*complexconjugate(UV31) + Yv23*complexconjugate(UV32) + Yv33*complexconjugate(UV33))) + ZH21*((Yv11*complexconjugate(UV11) + Yv21*complexconjugate(UV12) + Yv31*complexconjugate(UV13))*complexconjugate(UV34) + (Yv12*complexconjugate(UV11) + Yv22*complexconjugate(UV12) + Yv32*complexconjugate(UV13))*complexconjugate(UV35) + (Yv13*complexconjugate(UV11) + Yv23*complexconjugate(UV12) + Yv33*complexconjugate(UV13))*complexconjugate(UV36)) + ZH22*((Yx11*complexconjugate(UV14) + Yx21*complexconjugate(UV15) + Yx31*complexconjugate(UV16))*complexconjugate(UV34) + (Yx12*complexconjugate(UV14) + Yx22*complexconjugate(UV15) + Yx32*complexconjugate(UV16))*complexconjugate(UV35) + (Yx13*complexconjugate(UV14) + Yx23*complexconjugate(UV15) + Yx33*complexconjugate(UV16))*complexconjugate(UV36) + complexconjugate(UV14)*(Yx11*complexconjugate(UV34) + Yx21*complexconjugate(UV35) + Yx31*complexconjugate(UV36)) + complexconjugate(UV15)*(Yx12*complexconjugate(UV34) + Yx22*complexconjugate(UV35) + Yx32*complexconjugate(UV36)) + complexconjugate(UV16)*(Yx13*complexconjugate(UV34) + Yx23*complexconjugate(UV35) + Yx33*complexconjugate(UV36)))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_510 = Coupling(name = 'GC_510',
	 value = '(-1*complex(0,1)*(ZH21*(UV34*(UV11*complexconjugate(Yv11) + UV12*complexconjugate(Yv21) + UV13*complexconjugate(Yv31)) + UV35*(UV11*complexconjugate(Yv12) + UV12*complexconjugate(Yv22) + UV13*complexconjugate(Yv32)) + UV36*(UV11*complexconjugate(Yv13) + UV12*complexconjugate(Yv23) + UV13*complexconjugate(Yv33))) + ZH21*(UV14*(UV31*complexconjugate(Yv11) + UV32*complexconjugate(Yv21) + UV33*complexconjugate(Yv31)) + UV15*(UV31*complexconjugate(Yv12) + UV32*complexconjugate(Yv22) + UV33*complexconjugate(Yv32)) + UV16*(UV31*complexconjugate(Yv13) + UV32*complexconjugate(Yv23) + UV33*complexconjugate(Yv33))) + ZH22*(UV34*(UV14*complexconjugate(Yx11) + UV15*complexconjugate(Yx21) + UV16*complexconjugate(Yx31)) + UV14*(UV34*complexconjugate(Yx11) + UV35*complexconjugate(Yx21) + UV36*complexconjugate(Yx31)) + UV35*(UV14*complexconjugate(Yx12) + UV15*complexconjugate(Yx22) + UV16*complexconjugate(Yx32)) + UV15*(UV34*complexconjugate(Yx12) + UV35*complexconjugate(Yx22) + UV36*complexconjugate(Yx32)) + UV36*(UV14*complexconjugate(Yx13) + UV15*complexconjugate(Yx23) + UV16*complexconjugate(Yx33)) + UV16*(UV34*complexconjugate(Yx13) + UV35*complexconjugate(Yx23) + UV36*complexconjugate(Yx33)))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_511 = Coupling(name = 'GC_511',
	 value = '(-1*complex(0,1)*(ZH11*(complexconjugate(UV14)*(Yv11*complexconjugate(UV41) + Yv21*complexconjugate(UV42) + Yv31*complexconjugate(UV43)) + complexconjugate(UV15)*(Yv12*complexconjugate(UV41) + Yv22*complexconjugate(UV42) + Yv32*complexconjugate(UV43)) + complexconjugate(UV16)*(Yv13*complexconjugate(UV41) + Yv23*complexconjugate(UV42) + Yv33*complexconjugate(UV43))) + ZH11*((Yv11*complexconjugate(UV11) + Yv21*complexconjugate(UV12) + Yv31*complexconjugate(UV13))*complexconjugate(UV44) + (Yv12*complexconjugate(UV11) + Yv22*complexconjugate(UV12) + Yv32*complexconjugate(UV13))*complexconjugate(UV45) + (Yv13*complexconjugate(UV11) + Yv23*complexconjugate(UV12) + Yv33*complexconjugate(UV13))*complexconjugate(UV46)) + ZH12*((Yx11*complexconjugate(UV14) + Yx21*complexconjugate(UV15) + Yx31*complexconjugate(UV16))*complexconjugate(UV44) + (Yx12*complexconjugate(UV14) + Yx22*complexconjugate(UV15) + Yx32*complexconjugate(UV16))*complexconjugate(UV45) + (Yx13*complexconjugate(UV14) + Yx23*complexconjugate(UV15) + Yx33*complexconjugate(UV16))*complexconjugate(UV46) + complexconjugate(UV14)*(Yx11*complexconjugate(UV44) + Yx21*complexconjugate(UV45) + Yx31*complexconjugate(UV46)) + complexconjugate(UV15)*(Yx12*complexconjugate(UV44) + Yx22*complexconjugate(UV45) + Yx32*complexconjugate(UV46)) + complexconjugate(UV16)*(Yx13*complexconjugate(UV44) + Yx23*complexconjugate(UV45) + Yx33*complexconjugate(UV46)))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_512 = Coupling(name = 'GC_512',
	 value = '(-1*complex(0,1)*(ZH11*(UV44*(UV11*complexconjugate(Yv11) + UV12*complexconjugate(Yv21) + UV13*complexconjugate(Yv31)) + UV45*(UV11*complexconjugate(Yv12) + UV12*complexconjugate(Yv22) + UV13*complexconjugate(Yv32)) + UV46*(UV11*complexconjugate(Yv13) + UV12*complexconjugate(Yv23) + UV13*complexconjugate(Yv33))) + ZH11*(UV14*(UV41*complexconjugate(Yv11) + UV42*complexconjugate(Yv21) + UV43*complexconjugate(Yv31)) + UV15*(UV41*complexconjugate(Yv12) + UV42*complexconjugate(Yv22) + UV43*complexconjugate(Yv32)) + UV16*(UV41*complexconjugate(Yv13) + UV42*complexconjugate(Yv23) + UV43*complexconjugate(Yv33))) + ZH12*(UV44*(UV14*complexconjugate(Yx11) + UV15*complexconjugate(Yx21) + UV16*complexconjugate(Yx31)) + UV14*(UV44*complexconjugate(Yx11) + UV45*complexconjugate(Yx21) + UV46*complexconjugate(Yx31)) + UV45*(UV14*complexconjugate(Yx12) + UV15*complexconjugate(Yx22) + UV16*complexconjugate(Yx32)) + UV15*(UV44*complexconjugate(Yx12) + UV45*complexconjugate(Yx22) + UV46*complexconjugate(Yx32)) + UV46*(UV14*complexconjugate(Yx13) + UV15*complexconjugate(Yx23) + UV16*complexconjugate(Yx33)) + UV16*(UV44*complexconjugate(Yx13) + UV45*complexconjugate(Yx23) + UV46*complexconjugate(Yx33)))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_513 = Coupling(name = 'GC_513',
	 value = '(-1*complex(0,1)*(ZH21*(complexconjugate(UV14)*(Yv11*complexconjugate(UV41) + Yv21*complexconjugate(UV42) + Yv31*complexconjugate(UV43)) + complexconjugate(UV15)*(Yv12*complexconjugate(UV41) + Yv22*complexconjugate(UV42) + Yv32*complexconjugate(UV43)) + complexconjugate(UV16)*(Yv13*complexconjugate(UV41) + Yv23*complexconjugate(UV42) + Yv33*complexconjugate(UV43))) + ZH21*((Yv11*complexconjugate(UV11) + Yv21*complexconjugate(UV12) + Yv31*complexconjugate(UV13))*complexconjugate(UV44) + (Yv12*complexconjugate(UV11) + Yv22*complexconjugate(UV12) + Yv32*complexconjugate(UV13))*complexconjugate(UV45) + (Yv13*complexconjugate(UV11) + Yv23*complexconjugate(UV12) + Yv33*complexconjugate(UV13))*complexconjugate(UV46)) + ZH22*((Yx11*complexconjugate(UV14) + Yx21*complexconjugate(UV15) + Yx31*complexconjugate(UV16))*complexconjugate(UV44) + (Yx12*complexconjugate(UV14) + Yx22*complexconjugate(UV15) + Yx32*complexconjugate(UV16))*complexconjugate(UV45) + (Yx13*complexconjugate(UV14) + Yx23*complexconjugate(UV15) + Yx33*complexconjugate(UV16))*complexconjugate(UV46) + complexconjugate(UV14)*(Yx11*complexconjugate(UV44) + Yx21*complexconjugate(UV45) + Yx31*complexconjugate(UV46)) + complexconjugate(UV15)*(Yx12*complexconjugate(UV44) + Yx22*complexconjugate(UV45) + Yx32*complexconjugate(UV46)) + complexconjugate(UV16)*(Yx13*complexconjugate(UV44) + Yx23*complexconjugate(UV45) + Yx33*complexconjugate(UV46)))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_514 = Coupling(name = 'GC_514',
	 value = '(-1*complex(0,1)*(ZH21*(UV44*(UV11*complexconjugate(Yv11) + UV12*complexconjugate(Yv21) + UV13*complexconjugate(Yv31)) + UV45*(UV11*complexconjugate(Yv12) + UV12*complexconjugate(Yv22) + UV13*complexconjugate(Yv32)) + UV46*(UV11*complexconjugate(Yv13) + UV12*complexconjugate(Yv23) + UV13*complexconjugate(Yv33))) + ZH21*(UV14*(UV41*complexconjugate(Yv11) + UV42*complexconjugate(Yv21) + UV43*complexconjugate(Yv31)) + UV15*(UV41*complexconjugate(Yv12) + UV42*complexconjugate(Yv22) + UV43*complexconjugate(Yv32)) + UV16*(UV41*complexconjugate(Yv13) + UV42*complexconjugate(Yv23) + UV43*complexconjugate(Yv33))) + ZH22*(UV44*(UV14*complexconjugate(Yx11) + UV15*complexconjugate(Yx21) + UV16*complexconjugate(Yx31)) + UV14*(UV44*complexconjugate(Yx11) + UV45*complexconjugate(Yx21) + UV46*complexconjugate(Yx31)) + UV45*(UV14*complexconjugate(Yx12) + UV15*complexconjugate(Yx22) + UV16*complexconjugate(Yx32)) + UV15*(UV44*complexconjugate(Yx12) + UV45*complexconjugate(Yx22) + UV46*complexconjugate(Yx32)) + UV46*(UV14*complexconjugate(Yx13) + UV15*complexconjugate(Yx23) + UV16*complexconjugate(Yx33)) + UV16*(UV44*complexconjugate(Yx13) + UV45*complexconjugate(Yx23) + UV46*complexconjugate(Yx33)))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_515 = Coupling(name = 'GC_515',
	 value = '(-1*complex(0,1)*(ZH11*(complexconjugate(UV14)*(Yv11*complexconjugate(UV51) + Yv21*complexconjugate(UV52) + Yv31*complexconjugate(UV53)) + complexconjugate(UV15)*(Yv12*complexconjugate(UV51) + Yv22*complexconjugate(UV52) + Yv32*complexconjugate(UV53)) + complexconjugate(UV16)*(Yv13*complexconjugate(UV51) + Yv23*complexconjugate(UV52) + Yv33*complexconjugate(UV53))) + ZH11*((Yv11*complexconjugate(UV11) + Yv21*complexconjugate(UV12) + Yv31*complexconjugate(UV13))*complexconjugate(UV54) + (Yv12*complexconjugate(UV11) + Yv22*complexconjugate(UV12) + Yv32*complexconjugate(UV13))*complexconjugate(UV55) + (Yv13*complexconjugate(UV11) + Yv23*complexconjugate(UV12) + Yv33*complexconjugate(UV13))*complexconjugate(UV56)) + ZH12*((Yx11*complexconjugate(UV14) + Yx21*complexconjugate(UV15) + Yx31*complexconjugate(UV16))*complexconjugate(UV54) + (Yx12*complexconjugate(UV14) + Yx22*complexconjugate(UV15) + Yx32*complexconjugate(UV16))*complexconjugate(UV55) + (Yx13*complexconjugate(UV14) + Yx23*complexconjugate(UV15) + Yx33*complexconjugate(UV16))*complexconjugate(UV56) + complexconjugate(UV14)*(Yx11*complexconjugate(UV54) + Yx21*complexconjugate(UV55) + Yx31*complexconjugate(UV56)) + complexconjugate(UV15)*(Yx12*complexconjugate(UV54) + Yx22*complexconjugate(UV55) + Yx32*complexconjugate(UV56)) + complexconjugate(UV16)*(Yx13*complexconjugate(UV54) + Yx23*complexconjugate(UV55) + Yx33*complexconjugate(UV56)))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_516 = Coupling(name = 'GC_516',
	 value = '(-1*complex(0,1)*(ZH11*(UV54*(UV11*complexconjugate(Yv11) + UV12*complexconjugate(Yv21) + UV13*complexconjugate(Yv31)) + UV55*(UV11*complexconjugate(Yv12) + UV12*complexconjugate(Yv22) + UV13*complexconjugate(Yv32)) + UV56*(UV11*complexconjugate(Yv13) + UV12*complexconjugate(Yv23) + UV13*complexconjugate(Yv33))) + ZH11*(UV14*(UV51*complexconjugate(Yv11) + UV52*complexconjugate(Yv21) + UV53*complexconjugate(Yv31)) + UV15*(UV51*complexconjugate(Yv12) + UV52*complexconjugate(Yv22) + UV53*complexconjugate(Yv32)) + UV16*(UV51*complexconjugate(Yv13) + UV52*complexconjugate(Yv23) + UV53*complexconjugate(Yv33))) + ZH12*(UV54*(UV14*complexconjugate(Yx11) + UV15*complexconjugate(Yx21) + UV16*complexconjugate(Yx31)) + UV14*(UV54*complexconjugate(Yx11) + UV55*complexconjugate(Yx21) + UV56*complexconjugate(Yx31)) + UV55*(UV14*complexconjugate(Yx12) + UV15*complexconjugate(Yx22) + UV16*complexconjugate(Yx32)) + UV15*(UV54*complexconjugate(Yx12) + UV55*complexconjugate(Yx22) + UV56*complexconjugate(Yx32)) + UV56*(UV14*complexconjugate(Yx13) + UV15*complexconjugate(Yx23) + UV16*complexconjugate(Yx33)) + UV16*(UV54*complexconjugate(Yx13) + UV55*complexconjugate(Yx23) + UV56*complexconjugate(Yx33)))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_517 = Coupling(name = 'GC_517',
	 value = '(-1*complex(0,1)*(ZH21*(complexconjugate(UV14)*(Yv11*complexconjugate(UV51) + Yv21*complexconjugate(UV52) + Yv31*complexconjugate(UV53)) + complexconjugate(UV15)*(Yv12*complexconjugate(UV51) + Yv22*complexconjugate(UV52) + Yv32*complexconjugate(UV53)) + complexconjugate(UV16)*(Yv13*complexconjugate(UV51) + Yv23*complexconjugate(UV52) + Yv33*complexconjugate(UV53))) + ZH21*((Yv11*complexconjugate(UV11) + Yv21*complexconjugate(UV12) + Yv31*complexconjugate(UV13))*complexconjugate(UV54) + (Yv12*complexconjugate(UV11) + Yv22*complexconjugate(UV12) + Yv32*complexconjugate(UV13))*complexconjugate(UV55) + (Yv13*complexconjugate(UV11) + Yv23*complexconjugate(UV12) + Yv33*complexconjugate(UV13))*complexconjugate(UV56)) + ZH22*((Yx11*complexconjugate(UV14) + Yx21*complexconjugate(UV15) + Yx31*complexconjugate(UV16))*complexconjugate(UV54) + (Yx12*complexconjugate(UV14) + Yx22*complexconjugate(UV15) + Yx32*complexconjugate(UV16))*complexconjugate(UV55) + (Yx13*complexconjugate(UV14) + Yx23*complexconjugate(UV15) + Yx33*complexconjugate(UV16))*complexconjugate(UV56) + complexconjugate(UV14)*(Yx11*complexconjugate(UV54) + Yx21*complexconjugate(UV55) + Yx31*complexconjugate(UV56)) + complexconjugate(UV15)*(Yx12*complexconjugate(UV54) + Yx22*complexconjugate(UV55) + Yx32*complexconjugate(UV56)) + complexconjugate(UV16)*(Yx13*complexconjugate(UV54) + Yx23*complexconjugate(UV55) + Yx33*complexconjugate(UV56)))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_518 = Coupling(name = 'GC_518',
	 value = '(-1*complex(0,1)*(ZH21*(UV54*(UV11*complexconjugate(Yv11) + UV12*complexconjugate(Yv21) + UV13*complexconjugate(Yv31)) + UV55*(UV11*complexconjugate(Yv12) + UV12*complexconjugate(Yv22) + UV13*complexconjugate(Yv32)) + UV56*(UV11*complexconjugate(Yv13) + UV12*complexconjugate(Yv23) + UV13*complexconjugate(Yv33))) + ZH21*(UV14*(UV51*complexconjugate(Yv11) + UV52*complexconjugate(Yv21) + UV53*complexconjugate(Yv31)) + UV15*(UV51*complexconjugate(Yv12) + UV52*complexconjugate(Yv22) + UV53*complexconjugate(Yv32)) + UV16*(UV51*complexconjugate(Yv13) + UV52*complexconjugate(Yv23) + UV53*complexconjugate(Yv33))) + ZH22*(UV54*(UV14*complexconjugate(Yx11) + UV15*complexconjugate(Yx21) + UV16*complexconjugate(Yx31)) + UV14*(UV54*complexconjugate(Yx11) + UV55*complexconjugate(Yx21) + UV56*complexconjugate(Yx31)) + UV55*(UV14*complexconjugate(Yx12) + UV15*complexconjugate(Yx22) + UV16*complexconjugate(Yx32)) + UV15*(UV54*complexconjugate(Yx12) + UV55*complexconjugate(Yx22) + UV56*complexconjugate(Yx32)) + UV56*(UV14*complexconjugate(Yx13) + UV15*complexconjugate(Yx23) + UV16*complexconjugate(Yx33)) + UV16*(UV54*complexconjugate(Yx13) + UV55*complexconjugate(Yx23) + UV56*complexconjugate(Yx33)))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_519 = Coupling(name = 'GC_519',
	 value = '(-1*complex(0,1)*(ZH11*(complexconjugate(UV14)*(Yv11*complexconjugate(UV61) + Yv21*complexconjugate(UV62) + Yv31*complexconjugate(UV63)) + complexconjugate(UV15)*(Yv12*complexconjugate(UV61) + Yv22*complexconjugate(UV62) + Yv32*complexconjugate(UV63)) + complexconjugate(UV16)*(Yv13*complexconjugate(UV61) + Yv23*complexconjugate(UV62) + Yv33*complexconjugate(UV63))) + ZH11*((Yv11*complexconjugate(UV11) + Yv21*complexconjugate(UV12) + Yv31*complexconjugate(UV13))*complexconjugate(UV64) + (Yv12*complexconjugate(UV11) + Yv22*complexconjugate(UV12) + Yv32*complexconjugate(UV13))*complexconjugate(UV65) + (Yv13*complexconjugate(UV11) + Yv23*complexconjugate(UV12) + Yv33*complexconjugate(UV13))*complexconjugate(UV66)) + ZH12*((Yx11*complexconjugate(UV14) + Yx21*complexconjugate(UV15) + Yx31*complexconjugate(UV16))*complexconjugate(UV64) + (Yx12*complexconjugate(UV14) + Yx22*complexconjugate(UV15) + Yx32*complexconjugate(UV16))*complexconjugate(UV65) + (Yx13*complexconjugate(UV14) + Yx23*complexconjugate(UV15) + Yx33*complexconjugate(UV16))*complexconjugate(UV66) + complexconjugate(UV14)*(Yx11*complexconjugate(UV64) + Yx21*complexconjugate(UV65) + Yx31*complexconjugate(UV66)) + complexconjugate(UV15)*(Yx12*complexconjugate(UV64) + Yx22*complexconjugate(UV65) + Yx32*complexconjugate(UV66)) + complexconjugate(UV16)*(Yx13*complexconjugate(UV64) + Yx23*complexconjugate(UV65) + Yx33*complexconjugate(UV66)))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_520 = Coupling(name = 'GC_520',
	 value = '(-1*complex(0,1)*(ZH11*(UV64*(UV11*complexconjugate(Yv11) + UV12*complexconjugate(Yv21) + UV13*complexconjugate(Yv31)) + UV65*(UV11*complexconjugate(Yv12) + UV12*complexconjugate(Yv22) + UV13*complexconjugate(Yv32)) + UV66*(UV11*complexconjugate(Yv13) + UV12*complexconjugate(Yv23) + UV13*complexconjugate(Yv33))) + ZH11*(UV14*(UV61*complexconjugate(Yv11) + UV62*complexconjugate(Yv21) + UV63*complexconjugate(Yv31)) + UV15*(UV61*complexconjugate(Yv12) + UV62*complexconjugate(Yv22) + UV63*complexconjugate(Yv32)) + UV16*(UV61*complexconjugate(Yv13) + UV62*complexconjugate(Yv23) + UV63*complexconjugate(Yv33))) + ZH12*(UV64*(UV14*complexconjugate(Yx11) + UV15*complexconjugate(Yx21) + UV16*complexconjugate(Yx31)) + UV14*(UV64*complexconjugate(Yx11) + UV65*complexconjugate(Yx21) + UV66*complexconjugate(Yx31)) + UV65*(UV14*complexconjugate(Yx12) + UV15*complexconjugate(Yx22) + UV16*complexconjugate(Yx32)) + UV15*(UV64*complexconjugate(Yx12) + UV65*complexconjugate(Yx22) + UV66*complexconjugate(Yx32)) + UV66*(UV14*complexconjugate(Yx13) + UV15*complexconjugate(Yx23) + UV16*complexconjugate(Yx33)) + UV16*(UV64*complexconjugate(Yx13) + UV65*complexconjugate(Yx23) + UV66*complexconjugate(Yx33)))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_521 = Coupling(name = 'GC_521',
	 value = '(-1*complex(0,1)*(ZH21*(complexconjugate(UV14)*(Yv11*complexconjugate(UV61) + Yv21*complexconjugate(UV62) + Yv31*complexconjugate(UV63)) + complexconjugate(UV15)*(Yv12*complexconjugate(UV61) + Yv22*complexconjugate(UV62) + Yv32*complexconjugate(UV63)) + complexconjugate(UV16)*(Yv13*complexconjugate(UV61) + Yv23*complexconjugate(UV62) + Yv33*complexconjugate(UV63))) + ZH21*((Yv11*complexconjugate(UV11) + Yv21*complexconjugate(UV12) + Yv31*complexconjugate(UV13))*complexconjugate(UV64) + (Yv12*complexconjugate(UV11) + Yv22*complexconjugate(UV12) + Yv32*complexconjugate(UV13))*complexconjugate(UV65) + (Yv13*complexconjugate(UV11) + Yv23*complexconjugate(UV12) + Yv33*complexconjugate(UV13))*complexconjugate(UV66)) + ZH22*((Yx11*complexconjugate(UV14) + Yx21*complexconjugate(UV15) + Yx31*complexconjugate(UV16))*complexconjugate(UV64) + (Yx12*complexconjugate(UV14) + Yx22*complexconjugate(UV15) + Yx32*complexconjugate(UV16))*complexconjugate(UV65) + (Yx13*complexconjugate(UV14) + Yx23*complexconjugate(UV15) + Yx33*complexconjugate(UV16))*complexconjugate(UV66) + complexconjugate(UV14)*(Yx11*complexconjugate(UV64) + Yx21*complexconjugate(UV65) + Yx31*complexconjugate(UV66)) + complexconjugate(UV15)*(Yx12*complexconjugate(UV64) + Yx22*complexconjugate(UV65) + Yx32*complexconjugate(UV66)) + complexconjugate(UV16)*(Yx13*complexconjugate(UV64) + Yx23*complexconjugate(UV65) + Yx33*complexconjugate(UV66)))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_522 = Coupling(name = 'GC_522',
	 value = '(-1*complex(0,1)*(ZH21*(UV64*(UV11*complexconjugate(Yv11) + UV12*complexconjugate(Yv21) + UV13*complexconjugate(Yv31)) + UV65*(UV11*complexconjugate(Yv12) + UV12*complexconjugate(Yv22) + UV13*complexconjugate(Yv32)) + UV66*(UV11*complexconjugate(Yv13) + UV12*complexconjugate(Yv23) + UV13*complexconjugate(Yv33))) + ZH21*(UV14*(UV61*complexconjugate(Yv11) + UV62*complexconjugate(Yv21) + UV63*complexconjugate(Yv31)) + UV15*(UV61*complexconjugate(Yv12) + UV62*complexconjugate(Yv22) + UV63*complexconjugate(Yv32)) + UV16*(UV61*complexconjugate(Yv13) + UV62*complexconjugate(Yv23) + UV63*complexconjugate(Yv33))) + ZH22*(UV64*(UV14*complexconjugate(Yx11) + UV15*complexconjugate(Yx21) + UV16*complexconjugate(Yx31)) + UV14*(UV64*complexconjugate(Yx11) + UV65*complexconjugate(Yx21) + UV66*complexconjugate(Yx31)) + UV65*(UV14*complexconjugate(Yx12) + UV15*complexconjugate(Yx22) + UV16*complexconjugate(Yx32)) + UV15*(UV64*complexconjugate(Yx12) + UV65*complexconjugate(Yx22) + UV66*complexconjugate(Yx32)) + UV66*(UV14*complexconjugate(Yx13) + UV15*complexconjugate(Yx23) + UV16*complexconjugate(Yx33)) + UV16*(UV64*complexconjugate(Yx13) + UV65*complexconjugate(Yx23) + UV66*complexconjugate(Yx33)))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_523 = Coupling(name = 'GC_523',
	 value = '(-1*complex(0,1)*(2*ZH11*((Yv11*complexconjugate(UV21) + Yv21*complexconjugate(UV22) + Yv31*complexconjugate(UV23))*complexconjugate(UV24) + (Yv12*complexconjugate(UV21) + Yv22*complexconjugate(UV22) + Yv32*complexconjugate(UV23))*complexconjugate(UV25) + (Yv13*complexconjugate(UV21) + Yv23*complexconjugate(UV22) + Yv33*complexconjugate(UV23))*complexconjugate(UV26)) + ZH12*(2*complexconjugate(UV24)*(Yx11*complexconjugate(UV24) + Yx21*complexconjugate(UV25) + Yx31*complexconjugate(UV26)) + 2*complexconjugate(UV25)*(Yx12*complexconjugate(UV24) + Yx22*complexconjugate(UV25) + Yx32*complexconjugate(UV26)) + 2*complexconjugate(UV26)*(Yx13*complexconjugate(UV24) + Yx23*complexconjugate(UV25) + Yx33*complexconjugate(UV26)))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_524 = Coupling(name = 'GC_524',
	 value = '(-1*complex(0,1)*(2*ZH11*(UV24*(UV21*complexconjugate(Yv11) + UV22*complexconjugate(Yv21) + UV23*complexconjugate(Yv31)) + UV25*(UV21*complexconjugate(Yv12) + UV22*complexconjugate(Yv22) + UV23*complexconjugate(Yv32)) + UV26*(UV21*complexconjugate(Yv13) + UV22*complexconjugate(Yv23) + UV23*complexconjugate(Yv33))) + ZH12*(2*UV24*(UV24*complexconjugate(Yx11) + UV25*complexconjugate(Yx21) + UV26*complexconjugate(Yx31)) + 2*UV25*(UV24*complexconjugate(Yx12) + UV25*complexconjugate(Yx22) + UV26*complexconjugate(Yx32)) + 2*UV26*(UV24*complexconjugate(Yx13) + UV25*complexconjugate(Yx23) + UV26*complexconjugate(Yx33)))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_525 = Coupling(name = 'GC_525',
	 value = '(-1*complex(0,1)*(2*ZH21*((Yv11*complexconjugate(UV21) + Yv21*complexconjugate(UV22) + Yv31*complexconjugate(UV23))*complexconjugate(UV24) + (Yv12*complexconjugate(UV21) + Yv22*complexconjugate(UV22) + Yv32*complexconjugate(UV23))*complexconjugate(UV25) + (Yv13*complexconjugate(UV21) + Yv23*complexconjugate(UV22) + Yv33*complexconjugate(UV23))*complexconjugate(UV26)) + ZH22*(2*complexconjugate(UV24)*(Yx11*complexconjugate(UV24) + Yx21*complexconjugate(UV25) + Yx31*complexconjugate(UV26)) + 2*complexconjugate(UV25)*(Yx12*complexconjugate(UV24) + Yx22*complexconjugate(UV25) + Yx32*complexconjugate(UV26)) + 2*complexconjugate(UV26)*(Yx13*complexconjugate(UV24) + Yx23*complexconjugate(UV25) + Yx33*complexconjugate(UV26)))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_526 = Coupling(name = 'GC_526',
	 value = '(-1*complex(0,1)*(2*ZH21*(UV24*(UV21*complexconjugate(Yv11) + UV22*complexconjugate(Yv21) + UV23*complexconjugate(Yv31)) + UV25*(UV21*complexconjugate(Yv12) + UV22*complexconjugate(Yv22) + UV23*complexconjugate(Yv32)) + UV26*(UV21*complexconjugate(Yv13) + UV22*complexconjugate(Yv23) + UV23*complexconjugate(Yv33))) + ZH22*(2*UV24*(UV24*complexconjugate(Yx11) + UV25*complexconjugate(Yx21) + UV26*complexconjugate(Yx31)) + 2*UV25*(UV24*complexconjugate(Yx12) + UV25*complexconjugate(Yx22) + UV26*complexconjugate(Yx32)) + 2*UV26*(UV24*complexconjugate(Yx13) + UV25*complexconjugate(Yx23) + UV26*complexconjugate(Yx33)))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_527 = Coupling(name = 'GC_527',
	 value = '(-1*complex(0,1)*(ZH11*(complexconjugate(UV24)*(Yv11*complexconjugate(UV31) + Yv21*complexconjugate(UV32) + Yv31*complexconjugate(UV33)) + complexconjugate(UV25)*(Yv12*complexconjugate(UV31) + Yv22*complexconjugate(UV32) + Yv32*complexconjugate(UV33)) + complexconjugate(UV26)*(Yv13*complexconjugate(UV31) + Yv23*complexconjugate(UV32) + Yv33*complexconjugate(UV33))) + ZH11*((Yv11*complexconjugate(UV21) + Yv21*complexconjugate(UV22) + Yv31*complexconjugate(UV23))*complexconjugate(UV34) + (Yv12*complexconjugate(UV21) + Yv22*complexconjugate(UV22) + Yv32*complexconjugate(UV23))*complexconjugate(UV35) + (Yv13*complexconjugate(UV21) + Yv23*complexconjugate(UV22) + Yv33*complexconjugate(UV23))*complexconjugate(UV36)) + ZH12*((Yx11*complexconjugate(UV24) + Yx21*complexconjugate(UV25) + Yx31*complexconjugate(UV26))*complexconjugate(UV34) + (Yx12*complexconjugate(UV24) + Yx22*complexconjugate(UV25) + Yx32*complexconjugate(UV26))*complexconjugate(UV35) + (Yx13*complexconjugate(UV24) + Yx23*complexconjugate(UV25) + Yx33*complexconjugate(UV26))*complexconjugate(UV36) + complexconjugate(UV24)*(Yx11*complexconjugate(UV34) + Yx21*complexconjugate(UV35) + Yx31*complexconjugate(UV36)) + complexconjugate(UV25)*(Yx12*complexconjugate(UV34) + Yx22*complexconjugate(UV35) + Yx32*complexconjugate(UV36)) + complexconjugate(UV26)*(Yx13*complexconjugate(UV34) + Yx23*complexconjugate(UV35) + Yx33*complexconjugate(UV36)))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_528 = Coupling(name = 'GC_528',
	 value = '(-1*complex(0,1)*(ZH11*(UV34*(UV21*complexconjugate(Yv11) + UV22*complexconjugate(Yv21) + UV23*complexconjugate(Yv31)) + UV35*(UV21*complexconjugate(Yv12) + UV22*complexconjugate(Yv22) + UV23*complexconjugate(Yv32)) + UV36*(UV21*complexconjugate(Yv13) + UV22*complexconjugate(Yv23) + UV23*complexconjugate(Yv33))) + ZH11*(UV24*(UV31*complexconjugate(Yv11) + UV32*complexconjugate(Yv21) + UV33*complexconjugate(Yv31)) + UV25*(UV31*complexconjugate(Yv12) + UV32*complexconjugate(Yv22) + UV33*complexconjugate(Yv32)) + UV26*(UV31*complexconjugate(Yv13) + UV32*complexconjugate(Yv23) + UV33*complexconjugate(Yv33))) + ZH12*(UV34*(UV24*complexconjugate(Yx11) + UV25*complexconjugate(Yx21) + UV26*complexconjugate(Yx31)) + UV24*(UV34*complexconjugate(Yx11) + UV35*complexconjugate(Yx21) + UV36*complexconjugate(Yx31)) + UV35*(UV24*complexconjugate(Yx12) + UV25*complexconjugate(Yx22) + UV26*complexconjugate(Yx32)) + UV25*(UV34*complexconjugate(Yx12) + UV35*complexconjugate(Yx22) + UV36*complexconjugate(Yx32)) + UV36*(UV24*complexconjugate(Yx13) + UV25*complexconjugate(Yx23) + UV26*complexconjugate(Yx33)) + UV26*(UV34*complexconjugate(Yx13) + UV35*complexconjugate(Yx23) + UV36*complexconjugate(Yx33)))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_529 = Coupling(name = 'GC_529',
	 value = '(-1*complex(0,1)*(ZH21*(complexconjugate(UV24)*(Yv11*complexconjugate(UV31) + Yv21*complexconjugate(UV32) + Yv31*complexconjugate(UV33)) + complexconjugate(UV25)*(Yv12*complexconjugate(UV31) + Yv22*complexconjugate(UV32) + Yv32*complexconjugate(UV33)) + complexconjugate(UV26)*(Yv13*complexconjugate(UV31) + Yv23*complexconjugate(UV32) + Yv33*complexconjugate(UV33))) + ZH21*((Yv11*complexconjugate(UV21) + Yv21*complexconjugate(UV22) + Yv31*complexconjugate(UV23))*complexconjugate(UV34) + (Yv12*complexconjugate(UV21) + Yv22*complexconjugate(UV22) + Yv32*complexconjugate(UV23))*complexconjugate(UV35) + (Yv13*complexconjugate(UV21) + Yv23*complexconjugate(UV22) + Yv33*complexconjugate(UV23))*complexconjugate(UV36)) + ZH22*((Yx11*complexconjugate(UV24) + Yx21*complexconjugate(UV25) + Yx31*complexconjugate(UV26))*complexconjugate(UV34) + (Yx12*complexconjugate(UV24) + Yx22*complexconjugate(UV25) + Yx32*complexconjugate(UV26))*complexconjugate(UV35) + (Yx13*complexconjugate(UV24) + Yx23*complexconjugate(UV25) + Yx33*complexconjugate(UV26))*complexconjugate(UV36) + complexconjugate(UV24)*(Yx11*complexconjugate(UV34) + Yx21*complexconjugate(UV35) + Yx31*complexconjugate(UV36)) + complexconjugate(UV25)*(Yx12*complexconjugate(UV34) + Yx22*complexconjugate(UV35) + Yx32*complexconjugate(UV36)) + complexconjugate(UV26)*(Yx13*complexconjugate(UV34) + Yx23*complexconjugate(UV35) + Yx33*complexconjugate(UV36)))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_530 = Coupling(name = 'GC_530',
	 value = '(-1*complex(0,1)*(ZH21*(UV34*(UV21*complexconjugate(Yv11) + UV22*complexconjugate(Yv21) + UV23*complexconjugate(Yv31)) + UV35*(UV21*complexconjugate(Yv12) + UV22*complexconjugate(Yv22) + UV23*complexconjugate(Yv32)) + UV36*(UV21*complexconjugate(Yv13) + UV22*complexconjugate(Yv23) + UV23*complexconjugate(Yv33))) + ZH21*(UV24*(UV31*complexconjugate(Yv11) + UV32*complexconjugate(Yv21) + UV33*complexconjugate(Yv31)) + UV25*(UV31*complexconjugate(Yv12) + UV32*complexconjugate(Yv22) + UV33*complexconjugate(Yv32)) + UV26*(UV31*complexconjugate(Yv13) + UV32*complexconjugate(Yv23) + UV33*complexconjugate(Yv33))) + ZH22*(UV34*(UV24*complexconjugate(Yx11) + UV25*complexconjugate(Yx21) + UV26*complexconjugate(Yx31)) + UV24*(UV34*complexconjugate(Yx11) + UV35*complexconjugate(Yx21) + UV36*complexconjugate(Yx31)) + UV35*(UV24*complexconjugate(Yx12) + UV25*complexconjugate(Yx22) + UV26*complexconjugate(Yx32)) + UV25*(UV34*complexconjugate(Yx12) + UV35*complexconjugate(Yx22) + UV36*complexconjugate(Yx32)) + UV36*(UV24*complexconjugate(Yx13) + UV25*complexconjugate(Yx23) + UV26*complexconjugate(Yx33)) + UV26*(UV34*complexconjugate(Yx13) + UV35*complexconjugate(Yx23) + UV36*complexconjugate(Yx33)))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_531 = Coupling(name = 'GC_531',
	 value = '(-1*complex(0,1)*(ZH11*(complexconjugate(UV24)*(Yv11*complexconjugate(UV41) + Yv21*complexconjugate(UV42) + Yv31*complexconjugate(UV43)) + complexconjugate(UV25)*(Yv12*complexconjugate(UV41) + Yv22*complexconjugate(UV42) + Yv32*complexconjugate(UV43)) + complexconjugate(UV26)*(Yv13*complexconjugate(UV41) + Yv23*complexconjugate(UV42) + Yv33*complexconjugate(UV43))) + ZH11*((Yv11*complexconjugate(UV21) + Yv21*complexconjugate(UV22) + Yv31*complexconjugate(UV23))*complexconjugate(UV44) + (Yv12*complexconjugate(UV21) + Yv22*complexconjugate(UV22) + Yv32*complexconjugate(UV23))*complexconjugate(UV45) + (Yv13*complexconjugate(UV21) + Yv23*complexconjugate(UV22) + Yv33*complexconjugate(UV23))*complexconjugate(UV46)) + ZH12*((Yx11*complexconjugate(UV24) + Yx21*complexconjugate(UV25) + Yx31*complexconjugate(UV26))*complexconjugate(UV44) + (Yx12*complexconjugate(UV24) + Yx22*complexconjugate(UV25) + Yx32*complexconjugate(UV26))*complexconjugate(UV45) + (Yx13*complexconjugate(UV24) + Yx23*complexconjugate(UV25) + Yx33*complexconjugate(UV26))*complexconjugate(UV46) + complexconjugate(UV24)*(Yx11*complexconjugate(UV44) + Yx21*complexconjugate(UV45) + Yx31*complexconjugate(UV46)) + complexconjugate(UV25)*(Yx12*complexconjugate(UV44) + Yx22*complexconjugate(UV45) + Yx32*complexconjugate(UV46)) + complexconjugate(UV26)*(Yx13*complexconjugate(UV44) + Yx23*complexconjugate(UV45) + Yx33*complexconjugate(UV46)))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_532 = Coupling(name = 'GC_532',
	 value = '(-1*complex(0,1)*(ZH11*(UV44*(UV21*complexconjugate(Yv11) + UV22*complexconjugate(Yv21) + UV23*complexconjugate(Yv31)) + UV45*(UV21*complexconjugate(Yv12) + UV22*complexconjugate(Yv22) + UV23*complexconjugate(Yv32)) + UV46*(UV21*complexconjugate(Yv13) + UV22*complexconjugate(Yv23) + UV23*complexconjugate(Yv33))) + ZH11*(UV24*(UV41*complexconjugate(Yv11) + UV42*complexconjugate(Yv21) + UV43*complexconjugate(Yv31)) + UV25*(UV41*complexconjugate(Yv12) + UV42*complexconjugate(Yv22) + UV43*complexconjugate(Yv32)) + UV26*(UV41*complexconjugate(Yv13) + UV42*complexconjugate(Yv23) + UV43*complexconjugate(Yv33))) + ZH12*(UV44*(UV24*complexconjugate(Yx11) + UV25*complexconjugate(Yx21) + UV26*complexconjugate(Yx31)) + UV24*(UV44*complexconjugate(Yx11) + UV45*complexconjugate(Yx21) + UV46*complexconjugate(Yx31)) + UV45*(UV24*complexconjugate(Yx12) + UV25*complexconjugate(Yx22) + UV26*complexconjugate(Yx32)) + UV25*(UV44*complexconjugate(Yx12) + UV45*complexconjugate(Yx22) + UV46*complexconjugate(Yx32)) + UV46*(UV24*complexconjugate(Yx13) + UV25*complexconjugate(Yx23) + UV26*complexconjugate(Yx33)) + UV26*(UV44*complexconjugate(Yx13) + UV45*complexconjugate(Yx23) + UV46*complexconjugate(Yx33)))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_533 = Coupling(name = 'GC_533',
	 value = '(-1*complex(0,1)*(ZH21*(complexconjugate(UV24)*(Yv11*complexconjugate(UV41) + Yv21*complexconjugate(UV42) + Yv31*complexconjugate(UV43)) + complexconjugate(UV25)*(Yv12*complexconjugate(UV41) + Yv22*complexconjugate(UV42) + Yv32*complexconjugate(UV43)) + complexconjugate(UV26)*(Yv13*complexconjugate(UV41) + Yv23*complexconjugate(UV42) + Yv33*complexconjugate(UV43))) + ZH21*((Yv11*complexconjugate(UV21) + Yv21*complexconjugate(UV22) + Yv31*complexconjugate(UV23))*complexconjugate(UV44) + (Yv12*complexconjugate(UV21) + Yv22*complexconjugate(UV22) + Yv32*complexconjugate(UV23))*complexconjugate(UV45) + (Yv13*complexconjugate(UV21) + Yv23*complexconjugate(UV22) + Yv33*complexconjugate(UV23))*complexconjugate(UV46)) + ZH22*((Yx11*complexconjugate(UV24) + Yx21*complexconjugate(UV25) + Yx31*complexconjugate(UV26))*complexconjugate(UV44) + (Yx12*complexconjugate(UV24) + Yx22*complexconjugate(UV25) + Yx32*complexconjugate(UV26))*complexconjugate(UV45) + (Yx13*complexconjugate(UV24) + Yx23*complexconjugate(UV25) + Yx33*complexconjugate(UV26))*complexconjugate(UV46) + complexconjugate(UV24)*(Yx11*complexconjugate(UV44) + Yx21*complexconjugate(UV45) + Yx31*complexconjugate(UV46)) + complexconjugate(UV25)*(Yx12*complexconjugate(UV44) + Yx22*complexconjugate(UV45) + Yx32*complexconjugate(UV46)) + complexconjugate(UV26)*(Yx13*complexconjugate(UV44) + Yx23*complexconjugate(UV45) + Yx33*complexconjugate(UV46)))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_534 = Coupling(name = 'GC_534',
	 value = '(-1*complex(0,1)*(ZH21*(UV44*(UV21*complexconjugate(Yv11) + UV22*complexconjugate(Yv21) + UV23*complexconjugate(Yv31)) + UV45*(UV21*complexconjugate(Yv12) + UV22*complexconjugate(Yv22) + UV23*complexconjugate(Yv32)) + UV46*(UV21*complexconjugate(Yv13) + UV22*complexconjugate(Yv23) + UV23*complexconjugate(Yv33))) + ZH21*(UV24*(UV41*complexconjugate(Yv11) + UV42*complexconjugate(Yv21) + UV43*complexconjugate(Yv31)) + UV25*(UV41*complexconjugate(Yv12) + UV42*complexconjugate(Yv22) + UV43*complexconjugate(Yv32)) + UV26*(UV41*complexconjugate(Yv13) + UV42*complexconjugate(Yv23) + UV43*complexconjugate(Yv33))) + ZH22*(UV44*(UV24*complexconjugate(Yx11) + UV25*complexconjugate(Yx21) + UV26*complexconjugate(Yx31)) + UV24*(UV44*complexconjugate(Yx11) + UV45*complexconjugate(Yx21) + UV46*complexconjugate(Yx31)) + UV45*(UV24*complexconjugate(Yx12) + UV25*complexconjugate(Yx22) + UV26*complexconjugate(Yx32)) + UV25*(UV44*complexconjugate(Yx12) + UV45*complexconjugate(Yx22) + UV46*complexconjugate(Yx32)) + UV46*(UV24*complexconjugate(Yx13) + UV25*complexconjugate(Yx23) + UV26*complexconjugate(Yx33)) + UV26*(UV44*complexconjugate(Yx13) + UV45*complexconjugate(Yx23) + UV46*complexconjugate(Yx33)))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_535 = Coupling(name = 'GC_535',
	 value = '(-1*complex(0,1)*(ZH11*(complexconjugate(UV24)*(Yv11*complexconjugate(UV51) + Yv21*complexconjugate(UV52) + Yv31*complexconjugate(UV53)) + complexconjugate(UV25)*(Yv12*complexconjugate(UV51) + Yv22*complexconjugate(UV52) + Yv32*complexconjugate(UV53)) + complexconjugate(UV26)*(Yv13*complexconjugate(UV51) + Yv23*complexconjugate(UV52) + Yv33*complexconjugate(UV53))) + ZH11*((Yv11*complexconjugate(UV21) + Yv21*complexconjugate(UV22) + Yv31*complexconjugate(UV23))*complexconjugate(UV54) + (Yv12*complexconjugate(UV21) + Yv22*complexconjugate(UV22) + Yv32*complexconjugate(UV23))*complexconjugate(UV55) + (Yv13*complexconjugate(UV21) + Yv23*complexconjugate(UV22) + Yv33*complexconjugate(UV23))*complexconjugate(UV56)) + ZH12*((Yx11*complexconjugate(UV24) + Yx21*complexconjugate(UV25) + Yx31*complexconjugate(UV26))*complexconjugate(UV54) + (Yx12*complexconjugate(UV24) + Yx22*complexconjugate(UV25) + Yx32*complexconjugate(UV26))*complexconjugate(UV55) + (Yx13*complexconjugate(UV24) + Yx23*complexconjugate(UV25) + Yx33*complexconjugate(UV26))*complexconjugate(UV56) + complexconjugate(UV24)*(Yx11*complexconjugate(UV54) + Yx21*complexconjugate(UV55) + Yx31*complexconjugate(UV56)) + complexconjugate(UV25)*(Yx12*complexconjugate(UV54) + Yx22*complexconjugate(UV55) + Yx32*complexconjugate(UV56)) + complexconjugate(UV26)*(Yx13*complexconjugate(UV54) + Yx23*complexconjugate(UV55) + Yx33*complexconjugate(UV56)))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_536 = Coupling(name = 'GC_536',
	 value = '(-1*complex(0,1)*(ZH11*(UV54*(UV21*complexconjugate(Yv11) + UV22*complexconjugate(Yv21) + UV23*complexconjugate(Yv31)) + UV55*(UV21*complexconjugate(Yv12) + UV22*complexconjugate(Yv22) + UV23*complexconjugate(Yv32)) + UV56*(UV21*complexconjugate(Yv13) + UV22*complexconjugate(Yv23) + UV23*complexconjugate(Yv33))) + ZH11*(UV24*(UV51*complexconjugate(Yv11) + UV52*complexconjugate(Yv21) + UV53*complexconjugate(Yv31)) + UV25*(UV51*complexconjugate(Yv12) + UV52*complexconjugate(Yv22) + UV53*complexconjugate(Yv32)) + UV26*(UV51*complexconjugate(Yv13) + UV52*complexconjugate(Yv23) + UV53*complexconjugate(Yv33))) + ZH12*(UV54*(UV24*complexconjugate(Yx11) + UV25*complexconjugate(Yx21) + UV26*complexconjugate(Yx31)) + UV24*(UV54*complexconjugate(Yx11) + UV55*complexconjugate(Yx21) + UV56*complexconjugate(Yx31)) + UV55*(UV24*complexconjugate(Yx12) + UV25*complexconjugate(Yx22) + UV26*complexconjugate(Yx32)) + UV25*(UV54*complexconjugate(Yx12) + UV55*complexconjugate(Yx22) + UV56*complexconjugate(Yx32)) + UV56*(UV24*complexconjugate(Yx13) + UV25*complexconjugate(Yx23) + UV26*complexconjugate(Yx33)) + UV26*(UV54*complexconjugate(Yx13) + UV55*complexconjugate(Yx23) + UV56*complexconjugate(Yx33)))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_537 = Coupling(name = 'GC_537',
	 value = '(-1*complex(0,1)*(ZH21*(complexconjugate(UV24)*(Yv11*complexconjugate(UV51) + Yv21*complexconjugate(UV52) + Yv31*complexconjugate(UV53)) + complexconjugate(UV25)*(Yv12*complexconjugate(UV51) + Yv22*complexconjugate(UV52) + Yv32*complexconjugate(UV53)) + complexconjugate(UV26)*(Yv13*complexconjugate(UV51) + Yv23*complexconjugate(UV52) + Yv33*complexconjugate(UV53))) + ZH21*((Yv11*complexconjugate(UV21) + Yv21*complexconjugate(UV22) + Yv31*complexconjugate(UV23))*complexconjugate(UV54) + (Yv12*complexconjugate(UV21) + Yv22*complexconjugate(UV22) + Yv32*complexconjugate(UV23))*complexconjugate(UV55) + (Yv13*complexconjugate(UV21) + Yv23*complexconjugate(UV22) + Yv33*complexconjugate(UV23))*complexconjugate(UV56)) + ZH22*((Yx11*complexconjugate(UV24) + Yx21*complexconjugate(UV25) + Yx31*complexconjugate(UV26))*complexconjugate(UV54) + (Yx12*complexconjugate(UV24) + Yx22*complexconjugate(UV25) + Yx32*complexconjugate(UV26))*complexconjugate(UV55) + (Yx13*complexconjugate(UV24) + Yx23*complexconjugate(UV25) + Yx33*complexconjugate(UV26))*complexconjugate(UV56) + complexconjugate(UV24)*(Yx11*complexconjugate(UV54) + Yx21*complexconjugate(UV55) + Yx31*complexconjugate(UV56)) + complexconjugate(UV25)*(Yx12*complexconjugate(UV54) + Yx22*complexconjugate(UV55) + Yx32*complexconjugate(UV56)) + complexconjugate(UV26)*(Yx13*complexconjugate(UV54) + Yx23*complexconjugate(UV55) + Yx33*complexconjugate(UV56)))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_538 = Coupling(name = 'GC_538',
	 value = '(-1*complex(0,1)*(ZH21*(UV54*(UV21*complexconjugate(Yv11) + UV22*complexconjugate(Yv21) + UV23*complexconjugate(Yv31)) + UV55*(UV21*complexconjugate(Yv12) + UV22*complexconjugate(Yv22) + UV23*complexconjugate(Yv32)) + UV56*(UV21*complexconjugate(Yv13) + UV22*complexconjugate(Yv23) + UV23*complexconjugate(Yv33))) + ZH21*(UV24*(UV51*complexconjugate(Yv11) + UV52*complexconjugate(Yv21) + UV53*complexconjugate(Yv31)) + UV25*(UV51*complexconjugate(Yv12) + UV52*complexconjugate(Yv22) + UV53*complexconjugate(Yv32)) + UV26*(UV51*complexconjugate(Yv13) + UV52*complexconjugate(Yv23) + UV53*complexconjugate(Yv33))) + ZH22*(UV54*(UV24*complexconjugate(Yx11) + UV25*complexconjugate(Yx21) + UV26*complexconjugate(Yx31)) + UV24*(UV54*complexconjugate(Yx11) + UV55*complexconjugate(Yx21) + UV56*complexconjugate(Yx31)) + UV55*(UV24*complexconjugate(Yx12) + UV25*complexconjugate(Yx22) + UV26*complexconjugate(Yx32)) + UV25*(UV54*complexconjugate(Yx12) + UV55*complexconjugate(Yx22) + UV56*complexconjugate(Yx32)) + UV56*(UV24*complexconjugate(Yx13) + UV25*complexconjugate(Yx23) + UV26*complexconjugate(Yx33)) + UV26*(UV54*complexconjugate(Yx13) + UV55*complexconjugate(Yx23) + UV56*complexconjugate(Yx33)))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_539 = Coupling(name = 'GC_539',
	 value = '(-1*complex(0,1)*(ZH11*(complexconjugate(UV24)*(Yv11*complexconjugate(UV61) + Yv21*complexconjugate(UV62) + Yv31*complexconjugate(UV63)) + complexconjugate(UV25)*(Yv12*complexconjugate(UV61) + Yv22*complexconjugate(UV62) + Yv32*complexconjugate(UV63)) + complexconjugate(UV26)*(Yv13*complexconjugate(UV61) + Yv23*complexconjugate(UV62) + Yv33*complexconjugate(UV63))) + ZH11*((Yv11*complexconjugate(UV21) + Yv21*complexconjugate(UV22) + Yv31*complexconjugate(UV23))*complexconjugate(UV64) + (Yv12*complexconjugate(UV21) + Yv22*complexconjugate(UV22) + Yv32*complexconjugate(UV23))*complexconjugate(UV65) + (Yv13*complexconjugate(UV21) + Yv23*complexconjugate(UV22) + Yv33*complexconjugate(UV23))*complexconjugate(UV66)) + ZH12*((Yx11*complexconjugate(UV24) + Yx21*complexconjugate(UV25) + Yx31*complexconjugate(UV26))*complexconjugate(UV64) + (Yx12*complexconjugate(UV24) + Yx22*complexconjugate(UV25) + Yx32*complexconjugate(UV26))*complexconjugate(UV65) + (Yx13*complexconjugate(UV24) + Yx23*complexconjugate(UV25) + Yx33*complexconjugate(UV26))*complexconjugate(UV66) + complexconjugate(UV24)*(Yx11*complexconjugate(UV64) + Yx21*complexconjugate(UV65) + Yx31*complexconjugate(UV66)) + complexconjugate(UV25)*(Yx12*complexconjugate(UV64) + Yx22*complexconjugate(UV65) + Yx32*complexconjugate(UV66)) + complexconjugate(UV26)*(Yx13*complexconjugate(UV64) + Yx23*complexconjugate(UV65) + Yx33*complexconjugate(UV66)))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_540 = Coupling(name = 'GC_540',
	 value = '(-1*complex(0,1)*(ZH11*(UV64*(UV21*complexconjugate(Yv11) + UV22*complexconjugate(Yv21) + UV23*complexconjugate(Yv31)) + UV65*(UV21*complexconjugate(Yv12) + UV22*complexconjugate(Yv22) + UV23*complexconjugate(Yv32)) + UV66*(UV21*complexconjugate(Yv13) + UV22*complexconjugate(Yv23) + UV23*complexconjugate(Yv33))) + ZH11*(UV24*(UV61*complexconjugate(Yv11) + UV62*complexconjugate(Yv21) + UV63*complexconjugate(Yv31)) + UV25*(UV61*complexconjugate(Yv12) + UV62*complexconjugate(Yv22) + UV63*complexconjugate(Yv32)) + UV26*(UV61*complexconjugate(Yv13) + UV62*complexconjugate(Yv23) + UV63*complexconjugate(Yv33))) + ZH12*(UV64*(UV24*complexconjugate(Yx11) + UV25*complexconjugate(Yx21) + UV26*complexconjugate(Yx31)) + UV24*(UV64*complexconjugate(Yx11) + UV65*complexconjugate(Yx21) + UV66*complexconjugate(Yx31)) + UV65*(UV24*complexconjugate(Yx12) + UV25*complexconjugate(Yx22) + UV26*complexconjugate(Yx32)) + UV25*(UV64*complexconjugate(Yx12) + UV65*complexconjugate(Yx22) + UV66*complexconjugate(Yx32)) + UV66*(UV24*complexconjugate(Yx13) + UV25*complexconjugate(Yx23) + UV26*complexconjugate(Yx33)) + UV26*(UV64*complexconjugate(Yx13) + UV65*complexconjugate(Yx23) + UV66*complexconjugate(Yx33)))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_541 = Coupling(name = 'GC_541',
	 value = '(-1*complex(0,1)*(ZH21*(complexconjugate(UV24)*(Yv11*complexconjugate(UV61) + Yv21*complexconjugate(UV62) + Yv31*complexconjugate(UV63)) + complexconjugate(UV25)*(Yv12*complexconjugate(UV61) + Yv22*complexconjugate(UV62) + Yv32*complexconjugate(UV63)) + complexconjugate(UV26)*(Yv13*complexconjugate(UV61) + Yv23*complexconjugate(UV62) + Yv33*complexconjugate(UV63))) + ZH21*((Yv11*complexconjugate(UV21) + Yv21*complexconjugate(UV22) + Yv31*complexconjugate(UV23))*complexconjugate(UV64) + (Yv12*complexconjugate(UV21) + Yv22*complexconjugate(UV22) + Yv32*complexconjugate(UV23))*complexconjugate(UV65) + (Yv13*complexconjugate(UV21) + Yv23*complexconjugate(UV22) + Yv33*complexconjugate(UV23))*complexconjugate(UV66)) + ZH22*((Yx11*complexconjugate(UV24) + Yx21*complexconjugate(UV25) + Yx31*complexconjugate(UV26))*complexconjugate(UV64) + (Yx12*complexconjugate(UV24) + Yx22*complexconjugate(UV25) + Yx32*complexconjugate(UV26))*complexconjugate(UV65) + (Yx13*complexconjugate(UV24) + Yx23*complexconjugate(UV25) + Yx33*complexconjugate(UV26))*complexconjugate(UV66) + complexconjugate(UV24)*(Yx11*complexconjugate(UV64) + Yx21*complexconjugate(UV65) + Yx31*complexconjugate(UV66)) + complexconjugate(UV25)*(Yx12*complexconjugate(UV64) + Yx22*complexconjugate(UV65) + Yx32*complexconjugate(UV66)) + complexconjugate(UV26)*(Yx13*complexconjugate(UV64) + Yx23*complexconjugate(UV65) + Yx33*complexconjugate(UV66)))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_542 = Coupling(name = 'GC_542',
	 value = '(-1*complex(0,1)*(ZH21*(UV64*(UV21*complexconjugate(Yv11) + UV22*complexconjugate(Yv21) + UV23*complexconjugate(Yv31)) + UV65*(UV21*complexconjugate(Yv12) + UV22*complexconjugate(Yv22) + UV23*complexconjugate(Yv32)) + UV66*(UV21*complexconjugate(Yv13) + UV22*complexconjugate(Yv23) + UV23*complexconjugate(Yv33))) + ZH21*(UV24*(UV61*complexconjugate(Yv11) + UV62*complexconjugate(Yv21) + UV63*complexconjugate(Yv31)) + UV25*(UV61*complexconjugate(Yv12) + UV62*complexconjugate(Yv22) + UV63*complexconjugate(Yv32)) + UV26*(UV61*complexconjugate(Yv13) + UV62*complexconjugate(Yv23) + UV63*complexconjugate(Yv33))) + ZH22*(UV64*(UV24*complexconjugate(Yx11) + UV25*complexconjugate(Yx21) + UV26*complexconjugate(Yx31)) + UV24*(UV64*complexconjugate(Yx11) + UV65*complexconjugate(Yx21) + UV66*complexconjugate(Yx31)) + UV65*(UV24*complexconjugate(Yx12) + UV25*complexconjugate(Yx22) + UV26*complexconjugate(Yx32)) + UV25*(UV64*complexconjugate(Yx12) + UV65*complexconjugate(Yx22) + UV66*complexconjugate(Yx32)) + UV66*(UV24*complexconjugate(Yx13) + UV25*complexconjugate(Yx23) + UV26*complexconjugate(Yx33)) + UV26*(UV64*complexconjugate(Yx13) + UV65*complexconjugate(Yx23) + UV66*complexconjugate(Yx33)))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_543 = Coupling(name = 'GC_543',
	 value = '(-1*complex(0,1)*(2*ZH11*((Yv11*complexconjugate(UV31) + Yv21*complexconjugate(UV32) + Yv31*complexconjugate(UV33))*complexconjugate(UV34) + (Yv12*complexconjugate(UV31) + Yv22*complexconjugate(UV32) + Yv32*complexconjugate(UV33))*complexconjugate(UV35) + (Yv13*complexconjugate(UV31) + Yv23*complexconjugate(UV32) + Yv33*complexconjugate(UV33))*complexconjugate(UV36)) + ZH12*(2*complexconjugate(UV34)*(Yx11*complexconjugate(UV34) + Yx21*complexconjugate(UV35) + Yx31*complexconjugate(UV36)) + 2*complexconjugate(UV35)*(Yx12*complexconjugate(UV34) + Yx22*complexconjugate(UV35) + Yx32*complexconjugate(UV36)) + 2*complexconjugate(UV36)*(Yx13*complexconjugate(UV34) + Yx23*complexconjugate(UV35) + Yx33*complexconjugate(UV36)))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_544 = Coupling(name = 'GC_544',
	 value = '(-1*complex(0,1)*(2*ZH11*(UV34*(UV31*complexconjugate(Yv11) + UV32*complexconjugate(Yv21) + UV33*complexconjugate(Yv31)) + UV35*(UV31*complexconjugate(Yv12) + UV32*complexconjugate(Yv22) + UV33*complexconjugate(Yv32)) + UV36*(UV31*complexconjugate(Yv13) + UV32*complexconjugate(Yv23) + UV33*complexconjugate(Yv33))) + ZH12*(2*UV34*(UV34*complexconjugate(Yx11) + UV35*complexconjugate(Yx21) + UV36*complexconjugate(Yx31)) + 2*UV35*(UV34*complexconjugate(Yx12) + UV35*complexconjugate(Yx22) + UV36*complexconjugate(Yx32)) + 2*UV36*(UV34*complexconjugate(Yx13) + UV35*complexconjugate(Yx23) + UV36*complexconjugate(Yx33)))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_545 = Coupling(name = 'GC_545',
	 value = '(-1*complex(0,1)*(2*ZH21*((Yv11*complexconjugate(UV31) + Yv21*complexconjugate(UV32) + Yv31*complexconjugate(UV33))*complexconjugate(UV34) + (Yv12*complexconjugate(UV31) + Yv22*complexconjugate(UV32) + Yv32*complexconjugate(UV33))*complexconjugate(UV35) + (Yv13*complexconjugate(UV31) + Yv23*complexconjugate(UV32) + Yv33*complexconjugate(UV33))*complexconjugate(UV36)) + ZH22*(2*complexconjugate(UV34)*(Yx11*complexconjugate(UV34) + Yx21*complexconjugate(UV35) + Yx31*complexconjugate(UV36)) + 2*complexconjugate(UV35)*(Yx12*complexconjugate(UV34) + Yx22*complexconjugate(UV35) + Yx32*complexconjugate(UV36)) + 2*complexconjugate(UV36)*(Yx13*complexconjugate(UV34) + Yx23*complexconjugate(UV35) + Yx33*complexconjugate(UV36)))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_546 = Coupling(name = 'GC_546',
	 value = '(-1*complex(0,1)*(2*ZH21*(UV34*(UV31*complexconjugate(Yv11) + UV32*complexconjugate(Yv21) + UV33*complexconjugate(Yv31)) + UV35*(UV31*complexconjugate(Yv12) + UV32*complexconjugate(Yv22) + UV33*complexconjugate(Yv32)) + UV36*(UV31*complexconjugate(Yv13) + UV32*complexconjugate(Yv23) + UV33*complexconjugate(Yv33))) + ZH22*(2*UV34*(UV34*complexconjugate(Yx11) + UV35*complexconjugate(Yx21) + UV36*complexconjugate(Yx31)) + 2*UV35*(UV34*complexconjugate(Yx12) + UV35*complexconjugate(Yx22) + UV36*complexconjugate(Yx32)) + 2*UV36*(UV34*complexconjugate(Yx13) + UV35*complexconjugate(Yx23) + UV36*complexconjugate(Yx33)))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_547 = Coupling(name = 'GC_547',
	 value = '(-1*complex(0,1)*(ZH11*(complexconjugate(UV34)*(Yv11*complexconjugate(UV41) + Yv21*complexconjugate(UV42) + Yv31*complexconjugate(UV43)) + complexconjugate(UV35)*(Yv12*complexconjugate(UV41) + Yv22*complexconjugate(UV42) + Yv32*complexconjugate(UV43)) + complexconjugate(UV36)*(Yv13*complexconjugate(UV41) + Yv23*complexconjugate(UV42) + Yv33*complexconjugate(UV43))) + ZH11*((Yv11*complexconjugate(UV31) + Yv21*complexconjugate(UV32) + Yv31*complexconjugate(UV33))*complexconjugate(UV44) + (Yv12*complexconjugate(UV31) + Yv22*complexconjugate(UV32) + Yv32*complexconjugate(UV33))*complexconjugate(UV45) + (Yv13*complexconjugate(UV31) + Yv23*complexconjugate(UV32) + Yv33*complexconjugate(UV33))*complexconjugate(UV46)) + ZH12*((Yx11*complexconjugate(UV34) + Yx21*complexconjugate(UV35) + Yx31*complexconjugate(UV36))*complexconjugate(UV44) + (Yx12*complexconjugate(UV34) + Yx22*complexconjugate(UV35) + Yx32*complexconjugate(UV36))*complexconjugate(UV45) + (Yx13*complexconjugate(UV34) + Yx23*complexconjugate(UV35) + Yx33*complexconjugate(UV36))*complexconjugate(UV46) + complexconjugate(UV34)*(Yx11*complexconjugate(UV44) + Yx21*complexconjugate(UV45) + Yx31*complexconjugate(UV46)) + complexconjugate(UV35)*(Yx12*complexconjugate(UV44) + Yx22*complexconjugate(UV45) + Yx32*complexconjugate(UV46)) + complexconjugate(UV36)*(Yx13*complexconjugate(UV44) + Yx23*complexconjugate(UV45) + Yx33*complexconjugate(UV46)))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_548 = Coupling(name = 'GC_548',
	 value = '(-1*complex(0,1)*(ZH11*(UV44*(UV31*complexconjugate(Yv11) + UV32*complexconjugate(Yv21) + UV33*complexconjugate(Yv31)) + UV45*(UV31*complexconjugate(Yv12) + UV32*complexconjugate(Yv22) + UV33*complexconjugate(Yv32)) + UV46*(UV31*complexconjugate(Yv13) + UV32*complexconjugate(Yv23) + UV33*complexconjugate(Yv33))) + ZH11*(UV34*(UV41*complexconjugate(Yv11) + UV42*complexconjugate(Yv21) + UV43*complexconjugate(Yv31)) + UV35*(UV41*complexconjugate(Yv12) + UV42*complexconjugate(Yv22) + UV43*complexconjugate(Yv32)) + UV36*(UV41*complexconjugate(Yv13) + UV42*complexconjugate(Yv23) + UV43*complexconjugate(Yv33))) + ZH12*(UV44*(UV34*complexconjugate(Yx11) + UV35*complexconjugate(Yx21) + UV36*complexconjugate(Yx31)) + UV34*(UV44*complexconjugate(Yx11) + UV45*complexconjugate(Yx21) + UV46*complexconjugate(Yx31)) + UV45*(UV34*complexconjugate(Yx12) + UV35*complexconjugate(Yx22) + UV36*complexconjugate(Yx32)) + UV35*(UV44*complexconjugate(Yx12) + UV45*complexconjugate(Yx22) + UV46*complexconjugate(Yx32)) + UV46*(UV34*complexconjugate(Yx13) + UV35*complexconjugate(Yx23) + UV36*complexconjugate(Yx33)) + UV36*(UV44*complexconjugate(Yx13) + UV45*complexconjugate(Yx23) + UV46*complexconjugate(Yx33)))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_549 = Coupling(name = 'GC_549',
	 value = '(-1*complex(0,1)*(ZH21*(complexconjugate(UV34)*(Yv11*complexconjugate(UV41) + Yv21*complexconjugate(UV42) + Yv31*complexconjugate(UV43)) + complexconjugate(UV35)*(Yv12*complexconjugate(UV41) + Yv22*complexconjugate(UV42) + Yv32*complexconjugate(UV43)) + complexconjugate(UV36)*(Yv13*complexconjugate(UV41) + Yv23*complexconjugate(UV42) + Yv33*complexconjugate(UV43))) + ZH21*((Yv11*complexconjugate(UV31) + Yv21*complexconjugate(UV32) + Yv31*complexconjugate(UV33))*complexconjugate(UV44) + (Yv12*complexconjugate(UV31) + Yv22*complexconjugate(UV32) + Yv32*complexconjugate(UV33))*complexconjugate(UV45) + (Yv13*complexconjugate(UV31) + Yv23*complexconjugate(UV32) + Yv33*complexconjugate(UV33))*complexconjugate(UV46)) + ZH22*((Yx11*complexconjugate(UV34) + Yx21*complexconjugate(UV35) + Yx31*complexconjugate(UV36))*complexconjugate(UV44) + (Yx12*complexconjugate(UV34) + Yx22*complexconjugate(UV35) + Yx32*complexconjugate(UV36))*complexconjugate(UV45) + (Yx13*complexconjugate(UV34) + Yx23*complexconjugate(UV35) + Yx33*complexconjugate(UV36))*complexconjugate(UV46) + complexconjugate(UV34)*(Yx11*complexconjugate(UV44) + Yx21*complexconjugate(UV45) + Yx31*complexconjugate(UV46)) + complexconjugate(UV35)*(Yx12*complexconjugate(UV44) + Yx22*complexconjugate(UV45) + Yx32*complexconjugate(UV46)) + complexconjugate(UV36)*(Yx13*complexconjugate(UV44) + Yx23*complexconjugate(UV45) + Yx33*complexconjugate(UV46)))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_550 = Coupling(name = 'GC_550',
	 value = '(-1*complex(0,1)*(ZH21*(UV44*(UV31*complexconjugate(Yv11) + UV32*complexconjugate(Yv21) + UV33*complexconjugate(Yv31)) + UV45*(UV31*complexconjugate(Yv12) + UV32*complexconjugate(Yv22) + UV33*complexconjugate(Yv32)) + UV46*(UV31*complexconjugate(Yv13) + UV32*complexconjugate(Yv23) + UV33*complexconjugate(Yv33))) + ZH21*(UV34*(UV41*complexconjugate(Yv11) + UV42*complexconjugate(Yv21) + UV43*complexconjugate(Yv31)) + UV35*(UV41*complexconjugate(Yv12) + UV42*complexconjugate(Yv22) + UV43*complexconjugate(Yv32)) + UV36*(UV41*complexconjugate(Yv13) + UV42*complexconjugate(Yv23) + UV43*complexconjugate(Yv33))) + ZH22*(UV44*(UV34*complexconjugate(Yx11) + UV35*complexconjugate(Yx21) + UV36*complexconjugate(Yx31)) + UV34*(UV44*complexconjugate(Yx11) + UV45*complexconjugate(Yx21) + UV46*complexconjugate(Yx31)) + UV45*(UV34*complexconjugate(Yx12) + UV35*complexconjugate(Yx22) + UV36*complexconjugate(Yx32)) + UV35*(UV44*complexconjugate(Yx12) + UV45*complexconjugate(Yx22) + UV46*complexconjugate(Yx32)) + UV46*(UV34*complexconjugate(Yx13) + UV35*complexconjugate(Yx23) + UV36*complexconjugate(Yx33)) + UV36*(UV44*complexconjugate(Yx13) + UV45*complexconjugate(Yx23) + UV46*complexconjugate(Yx33)))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_551 = Coupling(name = 'GC_551',
	 value = '(-1*complex(0,1)*(ZH11*(complexconjugate(UV34)*(Yv11*complexconjugate(UV51) + Yv21*complexconjugate(UV52) + Yv31*complexconjugate(UV53)) + complexconjugate(UV35)*(Yv12*complexconjugate(UV51) + Yv22*complexconjugate(UV52) + Yv32*complexconjugate(UV53)) + complexconjugate(UV36)*(Yv13*complexconjugate(UV51) + Yv23*complexconjugate(UV52) + Yv33*complexconjugate(UV53))) + ZH11*((Yv11*complexconjugate(UV31) + Yv21*complexconjugate(UV32) + Yv31*complexconjugate(UV33))*complexconjugate(UV54) + (Yv12*complexconjugate(UV31) + Yv22*complexconjugate(UV32) + Yv32*complexconjugate(UV33))*complexconjugate(UV55) + (Yv13*complexconjugate(UV31) + Yv23*complexconjugate(UV32) + Yv33*complexconjugate(UV33))*complexconjugate(UV56)) + ZH12*((Yx11*complexconjugate(UV34) + Yx21*complexconjugate(UV35) + Yx31*complexconjugate(UV36))*complexconjugate(UV54) + (Yx12*complexconjugate(UV34) + Yx22*complexconjugate(UV35) + Yx32*complexconjugate(UV36))*complexconjugate(UV55) + (Yx13*complexconjugate(UV34) + Yx23*complexconjugate(UV35) + Yx33*complexconjugate(UV36))*complexconjugate(UV56) + complexconjugate(UV34)*(Yx11*complexconjugate(UV54) + Yx21*complexconjugate(UV55) + Yx31*complexconjugate(UV56)) + complexconjugate(UV35)*(Yx12*complexconjugate(UV54) + Yx22*complexconjugate(UV55) + Yx32*complexconjugate(UV56)) + complexconjugate(UV36)*(Yx13*complexconjugate(UV54) + Yx23*complexconjugate(UV55) + Yx33*complexconjugate(UV56)))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_552 = Coupling(name = 'GC_552',
	 value = '(-1*complex(0,1)*(ZH11*(UV54*(UV31*complexconjugate(Yv11) + UV32*complexconjugate(Yv21) + UV33*complexconjugate(Yv31)) + UV55*(UV31*complexconjugate(Yv12) + UV32*complexconjugate(Yv22) + UV33*complexconjugate(Yv32)) + UV56*(UV31*complexconjugate(Yv13) + UV32*complexconjugate(Yv23) + UV33*complexconjugate(Yv33))) + ZH11*(UV34*(UV51*complexconjugate(Yv11) + UV52*complexconjugate(Yv21) + UV53*complexconjugate(Yv31)) + UV35*(UV51*complexconjugate(Yv12) + UV52*complexconjugate(Yv22) + UV53*complexconjugate(Yv32)) + UV36*(UV51*complexconjugate(Yv13) + UV52*complexconjugate(Yv23) + UV53*complexconjugate(Yv33))) + ZH12*(UV54*(UV34*complexconjugate(Yx11) + UV35*complexconjugate(Yx21) + UV36*complexconjugate(Yx31)) + UV34*(UV54*complexconjugate(Yx11) + UV55*complexconjugate(Yx21) + UV56*complexconjugate(Yx31)) + UV55*(UV34*complexconjugate(Yx12) + UV35*complexconjugate(Yx22) + UV36*complexconjugate(Yx32)) + UV35*(UV54*complexconjugate(Yx12) + UV55*complexconjugate(Yx22) + UV56*complexconjugate(Yx32)) + UV56*(UV34*complexconjugate(Yx13) + UV35*complexconjugate(Yx23) + UV36*complexconjugate(Yx33)) + UV36*(UV54*complexconjugate(Yx13) + UV55*complexconjugate(Yx23) + UV56*complexconjugate(Yx33)))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_553 = Coupling(name = 'GC_553',
	 value = '(-1*complex(0,1)*(ZH21*(complexconjugate(UV34)*(Yv11*complexconjugate(UV51) + Yv21*complexconjugate(UV52) + Yv31*complexconjugate(UV53)) + complexconjugate(UV35)*(Yv12*complexconjugate(UV51) + Yv22*complexconjugate(UV52) + Yv32*complexconjugate(UV53)) + complexconjugate(UV36)*(Yv13*complexconjugate(UV51) + Yv23*complexconjugate(UV52) + Yv33*complexconjugate(UV53))) + ZH21*((Yv11*complexconjugate(UV31) + Yv21*complexconjugate(UV32) + Yv31*complexconjugate(UV33))*complexconjugate(UV54) + (Yv12*complexconjugate(UV31) + Yv22*complexconjugate(UV32) + Yv32*complexconjugate(UV33))*complexconjugate(UV55) + (Yv13*complexconjugate(UV31) + Yv23*complexconjugate(UV32) + Yv33*complexconjugate(UV33))*complexconjugate(UV56)) + ZH22*((Yx11*complexconjugate(UV34) + Yx21*complexconjugate(UV35) + Yx31*complexconjugate(UV36))*complexconjugate(UV54) + (Yx12*complexconjugate(UV34) + Yx22*complexconjugate(UV35) + Yx32*complexconjugate(UV36))*complexconjugate(UV55) + (Yx13*complexconjugate(UV34) + Yx23*complexconjugate(UV35) + Yx33*complexconjugate(UV36))*complexconjugate(UV56) + complexconjugate(UV34)*(Yx11*complexconjugate(UV54) + Yx21*complexconjugate(UV55) + Yx31*complexconjugate(UV56)) + complexconjugate(UV35)*(Yx12*complexconjugate(UV54) + Yx22*complexconjugate(UV55) + Yx32*complexconjugate(UV56)) + complexconjugate(UV36)*(Yx13*complexconjugate(UV54) + Yx23*complexconjugate(UV55) + Yx33*complexconjugate(UV56)))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_554 = Coupling(name = 'GC_554',
	 value = '(-1*complex(0,1)*(ZH21*(UV54*(UV31*complexconjugate(Yv11) + UV32*complexconjugate(Yv21) + UV33*complexconjugate(Yv31)) + UV55*(UV31*complexconjugate(Yv12) + UV32*complexconjugate(Yv22) + UV33*complexconjugate(Yv32)) + UV56*(UV31*complexconjugate(Yv13) + UV32*complexconjugate(Yv23) + UV33*complexconjugate(Yv33))) + ZH21*(UV34*(UV51*complexconjugate(Yv11) + UV52*complexconjugate(Yv21) + UV53*complexconjugate(Yv31)) + UV35*(UV51*complexconjugate(Yv12) + UV52*complexconjugate(Yv22) + UV53*complexconjugate(Yv32)) + UV36*(UV51*complexconjugate(Yv13) + UV52*complexconjugate(Yv23) + UV53*complexconjugate(Yv33))) + ZH22*(UV54*(UV34*complexconjugate(Yx11) + UV35*complexconjugate(Yx21) + UV36*complexconjugate(Yx31)) + UV34*(UV54*complexconjugate(Yx11) + UV55*complexconjugate(Yx21) + UV56*complexconjugate(Yx31)) + UV55*(UV34*complexconjugate(Yx12) + UV35*complexconjugate(Yx22) + UV36*complexconjugate(Yx32)) + UV35*(UV54*complexconjugate(Yx12) + UV55*complexconjugate(Yx22) + UV56*complexconjugate(Yx32)) + UV56*(UV34*complexconjugate(Yx13) + UV35*complexconjugate(Yx23) + UV36*complexconjugate(Yx33)) + UV36*(UV54*complexconjugate(Yx13) + UV55*complexconjugate(Yx23) + UV56*complexconjugate(Yx33)))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_555 = Coupling(name = 'GC_555',
	 value = '(-1*complex(0,1)*(ZH11*(complexconjugate(UV34)*(Yv11*complexconjugate(UV61) + Yv21*complexconjugate(UV62) + Yv31*complexconjugate(UV63)) + complexconjugate(UV35)*(Yv12*complexconjugate(UV61) + Yv22*complexconjugate(UV62) + Yv32*complexconjugate(UV63)) + complexconjugate(UV36)*(Yv13*complexconjugate(UV61) + Yv23*complexconjugate(UV62) + Yv33*complexconjugate(UV63))) + ZH11*((Yv11*complexconjugate(UV31) + Yv21*complexconjugate(UV32) + Yv31*complexconjugate(UV33))*complexconjugate(UV64) + (Yv12*complexconjugate(UV31) + Yv22*complexconjugate(UV32) + Yv32*complexconjugate(UV33))*complexconjugate(UV65) + (Yv13*complexconjugate(UV31) + Yv23*complexconjugate(UV32) + Yv33*complexconjugate(UV33))*complexconjugate(UV66)) + ZH12*((Yx11*complexconjugate(UV34) + Yx21*complexconjugate(UV35) + Yx31*complexconjugate(UV36))*complexconjugate(UV64) + (Yx12*complexconjugate(UV34) + Yx22*complexconjugate(UV35) + Yx32*complexconjugate(UV36))*complexconjugate(UV65) + (Yx13*complexconjugate(UV34) + Yx23*complexconjugate(UV35) + Yx33*complexconjugate(UV36))*complexconjugate(UV66) + complexconjugate(UV34)*(Yx11*complexconjugate(UV64) + Yx21*complexconjugate(UV65) + Yx31*complexconjugate(UV66)) + complexconjugate(UV35)*(Yx12*complexconjugate(UV64) + Yx22*complexconjugate(UV65) + Yx32*complexconjugate(UV66)) + complexconjugate(UV36)*(Yx13*complexconjugate(UV64) + Yx23*complexconjugate(UV65) + Yx33*complexconjugate(UV66)))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_556 = Coupling(name = 'GC_556',
	 value = '(-1*complex(0,1)*(ZH11*(UV64*(UV31*complexconjugate(Yv11) + UV32*complexconjugate(Yv21) + UV33*complexconjugate(Yv31)) + UV65*(UV31*complexconjugate(Yv12) + UV32*complexconjugate(Yv22) + UV33*complexconjugate(Yv32)) + UV66*(UV31*complexconjugate(Yv13) + UV32*complexconjugate(Yv23) + UV33*complexconjugate(Yv33))) + ZH11*(UV34*(UV61*complexconjugate(Yv11) + UV62*complexconjugate(Yv21) + UV63*complexconjugate(Yv31)) + UV35*(UV61*complexconjugate(Yv12) + UV62*complexconjugate(Yv22) + UV63*complexconjugate(Yv32)) + UV36*(UV61*complexconjugate(Yv13) + UV62*complexconjugate(Yv23) + UV63*complexconjugate(Yv33))) + ZH12*(UV64*(UV34*complexconjugate(Yx11) + UV35*complexconjugate(Yx21) + UV36*complexconjugate(Yx31)) + UV34*(UV64*complexconjugate(Yx11) + UV65*complexconjugate(Yx21) + UV66*complexconjugate(Yx31)) + UV65*(UV34*complexconjugate(Yx12) + UV35*complexconjugate(Yx22) + UV36*complexconjugate(Yx32)) + UV35*(UV64*complexconjugate(Yx12) + UV65*complexconjugate(Yx22) + UV66*complexconjugate(Yx32)) + UV66*(UV34*complexconjugate(Yx13) + UV35*complexconjugate(Yx23) + UV36*complexconjugate(Yx33)) + UV36*(UV64*complexconjugate(Yx13) + UV65*complexconjugate(Yx23) + UV66*complexconjugate(Yx33)))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_557 = Coupling(name = 'GC_557',
	 value = '(-1*complex(0,1)*(ZH21*(complexconjugate(UV34)*(Yv11*complexconjugate(UV61) + Yv21*complexconjugate(UV62) + Yv31*complexconjugate(UV63)) + complexconjugate(UV35)*(Yv12*complexconjugate(UV61) + Yv22*complexconjugate(UV62) + Yv32*complexconjugate(UV63)) + complexconjugate(UV36)*(Yv13*complexconjugate(UV61) + Yv23*complexconjugate(UV62) + Yv33*complexconjugate(UV63))) + ZH21*((Yv11*complexconjugate(UV31) + Yv21*complexconjugate(UV32) + Yv31*complexconjugate(UV33))*complexconjugate(UV64) + (Yv12*complexconjugate(UV31) + Yv22*complexconjugate(UV32) + Yv32*complexconjugate(UV33))*complexconjugate(UV65) + (Yv13*complexconjugate(UV31) + Yv23*complexconjugate(UV32) + Yv33*complexconjugate(UV33))*complexconjugate(UV66)) + ZH22*((Yx11*complexconjugate(UV34) + Yx21*complexconjugate(UV35) + Yx31*complexconjugate(UV36))*complexconjugate(UV64) + (Yx12*complexconjugate(UV34) + Yx22*complexconjugate(UV35) + Yx32*complexconjugate(UV36))*complexconjugate(UV65) + (Yx13*complexconjugate(UV34) + Yx23*complexconjugate(UV35) + Yx33*complexconjugate(UV36))*complexconjugate(UV66) + complexconjugate(UV34)*(Yx11*complexconjugate(UV64) + Yx21*complexconjugate(UV65) + Yx31*complexconjugate(UV66)) + complexconjugate(UV35)*(Yx12*complexconjugate(UV64) + Yx22*complexconjugate(UV65) + Yx32*complexconjugate(UV66)) + complexconjugate(UV36)*(Yx13*complexconjugate(UV64) + Yx23*complexconjugate(UV65) + Yx33*complexconjugate(UV66)))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_558 = Coupling(name = 'GC_558',
	 value = '(-1*complex(0,1)*(ZH21*(UV64*(UV31*complexconjugate(Yv11) + UV32*complexconjugate(Yv21) + UV33*complexconjugate(Yv31)) + UV65*(UV31*complexconjugate(Yv12) + UV32*complexconjugate(Yv22) + UV33*complexconjugate(Yv32)) + UV66*(UV31*complexconjugate(Yv13) + UV32*complexconjugate(Yv23) + UV33*complexconjugate(Yv33))) + ZH21*(UV34*(UV61*complexconjugate(Yv11) + UV62*complexconjugate(Yv21) + UV63*complexconjugate(Yv31)) + UV35*(UV61*complexconjugate(Yv12) + UV62*complexconjugate(Yv22) + UV63*complexconjugate(Yv32)) + UV36*(UV61*complexconjugate(Yv13) + UV62*complexconjugate(Yv23) + UV63*complexconjugate(Yv33))) + ZH22*(UV64*(UV34*complexconjugate(Yx11) + UV35*complexconjugate(Yx21) + UV36*complexconjugate(Yx31)) + UV34*(UV64*complexconjugate(Yx11) + UV65*complexconjugate(Yx21) + UV66*complexconjugate(Yx31)) + UV65*(UV34*complexconjugate(Yx12) + UV35*complexconjugate(Yx22) + UV36*complexconjugate(Yx32)) + UV35*(UV64*complexconjugate(Yx12) + UV65*complexconjugate(Yx22) + UV66*complexconjugate(Yx32)) + UV66*(UV34*complexconjugate(Yx13) + UV35*complexconjugate(Yx23) + UV36*complexconjugate(Yx33)) + UV36*(UV64*complexconjugate(Yx13) + UV65*complexconjugate(Yx23) + UV66*complexconjugate(Yx33)))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_559 = Coupling(name = 'GC_559',
	 value = '(-1*complex(0,1)*(2*ZH11*((Yv11*complexconjugate(UV41) + Yv21*complexconjugate(UV42) + Yv31*complexconjugate(UV43))*complexconjugate(UV44) + (Yv12*complexconjugate(UV41) + Yv22*complexconjugate(UV42) + Yv32*complexconjugate(UV43))*complexconjugate(UV45) + (Yv13*complexconjugate(UV41) + Yv23*complexconjugate(UV42) + Yv33*complexconjugate(UV43))*complexconjugate(UV46)) + ZH12*(2*complexconjugate(UV44)*(Yx11*complexconjugate(UV44) + Yx21*complexconjugate(UV45) + Yx31*complexconjugate(UV46)) + 2*complexconjugate(UV45)*(Yx12*complexconjugate(UV44) + Yx22*complexconjugate(UV45) + Yx32*complexconjugate(UV46)) + 2*complexconjugate(UV46)*(Yx13*complexconjugate(UV44) + Yx23*complexconjugate(UV45) + Yx33*complexconjugate(UV46)))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_560 = Coupling(name = 'GC_560',
	 value = '(-1*complex(0,1)*(2*ZH11*(UV44*(UV41*complexconjugate(Yv11) + UV42*complexconjugate(Yv21) + UV43*complexconjugate(Yv31)) + UV45*(UV41*complexconjugate(Yv12) + UV42*complexconjugate(Yv22) + UV43*complexconjugate(Yv32)) + UV46*(UV41*complexconjugate(Yv13) + UV42*complexconjugate(Yv23) + UV43*complexconjugate(Yv33))) + ZH12*(2*UV44*(UV44*complexconjugate(Yx11) + UV45*complexconjugate(Yx21) + UV46*complexconjugate(Yx31)) + 2*UV45*(UV44*complexconjugate(Yx12) + UV45*complexconjugate(Yx22) + UV46*complexconjugate(Yx32)) + 2*UV46*(UV44*complexconjugate(Yx13) + UV45*complexconjugate(Yx23) + UV46*complexconjugate(Yx33)))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_561 = Coupling(name = 'GC_561',
	 value = '(-1*complex(0,1)*(2*ZH21*((Yv11*complexconjugate(UV41) + Yv21*complexconjugate(UV42) + Yv31*complexconjugate(UV43))*complexconjugate(UV44) + (Yv12*complexconjugate(UV41) + Yv22*complexconjugate(UV42) + Yv32*complexconjugate(UV43))*complexconjugate(UV45) + (Yv13*complexconjugate(UV41) + Yv23*complexconjugate(UV42) + Yv33*complexconjugate(UV43))*complexconjugate(UV46)) + ZH22*(2*complexconjugate(UV44)*(Yx11*complexconjugate(UV44) + Yx21*complexconjugate(UV45) + Yx31*complexconjugate(UV46)) + 2*complexconjugate(UV45)*(Yx12*complexconjugate(UV44) + Yx22*complexconjugate(UV45) + Yx32*complexconjugate(UV46)) + 2*complexconjugate(UV46)*(Yx13*complexconjugate(UV44) + Yx23*complexconjugate(UV45) + Yx33*complexconjugate(UV46)))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_562 = Coupling(name = 'GC_562',
	 value = '(-1*complex(0,1)*(2*ZH21*(UV44*(UV41*complexconjugate(Yv11) + UV42*complexconjugate(Yv21) + UV43*complexconjugate(Yv31)) + UV45*(UV41*complexconjugate(Yv12) + UV42*complexconjugate(Yv22) + UV43*complexconjugate(Yv32)) + UV46*(UV41*complexconjugate(Yv13) + UV42*complexconjugate(Yv23) + UV43*complexconjugate(Yv33))) + ZH22*(2*UV44*(UV44*complexconjugate(Yx11) + UV45*complexconjugate(Yx21) + UV46*complexconjugate(Yx31)) + 2*UV45*(UV44*complexconjugate(Yx12) + UV45*complexconjugate(Yx22) + UV46*complexconjugate(Yx32)) + 2*UV46*(UV44*complexconjugate(Yx13) + UV45*complexconjugate(Yx23) + UV46*complexconjugate(Yx33)))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_563 = Coupling(name = 'GC_563',
	 value = '(-1*complex(0,1)*(ZH11*(complexconjugate(UV44)*(Yv11*complexconjugate(UV51) + Yv21*complexconjugate(UV52) + Yv31*complexconjugate(UV53)) + complexconjugate(UV45)*(Yv12*complexconjugate(UV51) + Yv22*complexconjugate(UV52) + Yv32*complexconjugate(UV53)) + complexconjugate(UV46)*(Yv13*complexconjugate(UV51) + Yv23*complexconjugate(UV52) + Yv33*complexconjugate(UV53))) + ZH11*((Yv11*complexconjugate(UV41) + Yv21*complexconjugate(UV42) + Yv31*complexconjugate(UV43))*complexconjugate(UV54) + (Yv12*complexconjugate(UV41) + Yv22*complexconjugate(UV42) + Yv32*complexconjugate(UV43))*complexconjugate(UV55) + (Yv13*complexconjugate(UV41) + Yv23*complexconjugate(UV42) + Yv33*complexconjugate(UV43))*complexconjugate(UV56)) + ZH12*((Yx11*complexconjugate(UV44) + Yx21*complexconjugate(UV45) + Yx31*complexconjugate(UV46))*complexconjugate(UV54) + (Yx12*complexconjugate(UV44) + Yx22*complexconjugate(UV45) + Yx32*complexconjugate(UV46))*complexconjugate(UV55) + (Yx13*complexconjugate(UV44) + Yx23*complexconjugate(UV45) + Yx33*complexconjugate(UV46))*complexconjugate(UV56) + complexconjugate(UV44)*(Yx11*complexconjugate(UV54) + Yx21*complexconjugate(UV55) + Yx31*complexconjugate(UV56)) + complexconjugate(UV45)*(Yx12*complexconjugate(UV54) + Yx22*complexconjugate(UV55) + Yx32*complexconjugate(UV56)) + complexconjugate(UV46)*(Yx13*complexconjugate(UV54) + Yx23*complexconjugate(UV55) + Yx33*complexconjugate(UV56)))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_564 = Coupling(name = 'GC_564',
	 value = '(-1*complex(0,1)*(ZH11*(UV54*(UV41*complexconjugate(Yv11) + UV42*complexconjugate(Yv21) + UV43*complexconjugate(Yv31)) + UV55*(UV41*complexconjugate(Yv12) + UV42*complexconjugate(Yv22) + UV43*complexconjugate(Yv32)) + UV56*(UV41*complexconjugate(Yv13) + UV42*complexconjugate(Yv23) + UV43*complexconjugate(Yv33))) + ZH11*(UV44*(UV51*complexconjugate(Yv11) + UV52*complexconjugate(Yv21) + UV53*complexconjugate(Yv31)) + UV45*(UV51*complexconjugate(Yv12) + UV52*complexconjugate(Yv22) + UV53*complexconjugate(Yv32)) + UV46*(UV51*complexconjugate(Yv13) + UV52*complexconjugate(Yv23) + UV53*complexconjugate(Yv33))) + ZH12*(UV54*(UV44*complexconjugate(Yx11) + UV45*complexconjugate(Yx21) + UV46*complexconjugate(Yx31)) + UV44*(UV54*complexconjugate(Yx11) + UV55*complexconjugate(Yx21) + UV56*complexconjugate(Yx31)) + UV55*(UV44*complexconjugate(Yx12) + UV45*complexconjugate(Yx22) + UV46*complexconjugate(Yx32)) + UV45*(UV54*complexconjugate(Yx12) + UV55*complexconjugate(Yx22) + UV56*complexconjugate(Yx32)) + UV56*(UV44*complexconjugate(Yx13) + UV45*complexconjugate(Yx23) + UV46*complexconjugate(Yx33)) + UV46*(UV54*complexconjugate(Yx13) + UV55*complexconjugate(Yx23) + UV56*complexconjugate(Yx33)))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_565 = Coupling(name = 'GC_565',
	 value = '(-1*complex(0,1)*(ZH21*(complexconjugate(UV44)*(Yv11*complexconjugate(UV51) + Yv21*complexconjugate(UV52) + Yv31*complexconjugate(UV53)) + complexconjugate(UV45)*(Yv12*complexconjugate(UV51) + Yv22*complexconjugate(UV52) + Yv32*complexconjugate(UV53)) + complexconjugate(UV46)*(Yv13*complexconjugate(UV51) + Yv23*complexconjugate(UV52) + Yv33*complexconjugate(UV53))) + ZH21*((Yv11*complexconjugate(UV41) + Yv21*complexconjugate(UV42) + Yv31*complexconjugate(UV43))*complexconjugate(UV54) + (Yv12*complexconjugate(UV41) + Yv22*complexconjugate(UV42) + Yv32*complexconjugate(UV43))*complexconjugate(UV55) + (Yv13*complexconjugate(UV41) + Yv23*complexconjugate(UV42) + Yv33*complexconjugate(UV43))*complexconjugate(UV56)) + ZH22*((Yx11*complexconjugate(UV44) + Yx21*complexconjugate(UV45) + Yx31*complexconjugate(UV46))*complexconjugate(UV54) + (Yx12*complexconjugate(UV44) + Yx22*complexconjugate(UV45) + Yx32*complexconjugate(UV46))*complexconjugate(UV55) + (Yx13*complexconjugate(UV44) + Yx23*complexconjugate(UV45) + Yx33*complexconjugate(UV46))*complexconjugate(UV56) + complexconjugate(UV44)*(Yx11*complexconjugate(UV54) + Yx21*complexconjugate(UV55) + Yx31*complexconjugate(UV56)) + complexconjugate(UV45)*(Yx12*complexconjugate(UV54) + Yx22*complexconjugate(UV55) + Yx32*complexconjugate(UV56)) + complexconjugate(UV46)*(Yx13*complexconjugate(UV54) + Yx23*complexconjugate(UV55) + Yx33*complexconjugate(UV56)))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_566 = Coupling(name = 'GC_566',
	 value = '(-1*complex(0,1)*(ZH21*(UV54*(UV41*complexconjugate(Yv11) + UV42*complexconjugate(Yv21) + UV43*complexconjugate(Yv31)) + UV55*(UV41*complexconjugate(Yv12) + UV42*complexconjugate(Yv22) + UV43*complexconjugate(Yv32)) + UV56*(UV41*complexconjugate(Yv13) + UV42*complexconjugate(Yv23) + UV43*complexconjugate(Yv33))) + ZH21*(UV44*(UV51*complexconjugate(Yv11) + UV52*complexconjugate(Yv21) + UV53*complexconjugate(Yv31)) + UV45*(UV51*complexconjugate(Yv12) + UV52*complexconjugate(Yv22) + UV53*complexconjugate(Yv32)) + UV46*(UV51*complexconjugate(Yv13) + UV52*complexconjugate(Yv23) + UV53*complexconjugate(Yv33))) + ZH22*(UV54*(UV44*complexconjugate(Yx11) + UV45*complexconjugate(Yx21) + UV46*complexconjugate(Yx31)) + UV44*(UV54*complexconjugate(Yx11) + UV55*complexconjugate(Yx21) + UV56*complexconjugate(Yx31)) + UV55*(UV44*complexconjugate(Yx12) + UV45*complexconjugate(Yx22) + UV46*complexconjugate(Yx32)) + UV45*(UV54*complexconjugate(Yx12) + UV55*complexconjugate(Yx22) + UV56*complexconjugate(Yx32)) + UV56*(UV44*complexconjugate(Yx13) + UV45*complexconjugate(Yx23) + UV46*complexconjugate(Yx33)) + UV46*(UV54*complexconjugate(Yx13) + UV55*complexconjugate(Yx23) + UV56*complexconjugate(Yx33)))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_567 = Coupling(name = 'GC_567',
	 value = '(-1*complex(0,1)*(ZH11*(complexconjugate(UV44)*(Yv11*complexconjugate(UV61) + Yv21*complexconjugate(UV62) + Yv31*complexconjugate(UV63)) + complexconjugate(UV45)*(Yv12*complexconjugate(UV61) + Yv22*complexconjugate(UV62) + Yv32*complexconjugate(UV63)) + complexconjugate(UV46)*(Yv13*complexconjugate(UV61) + Yv23*complexconjugate(UV62) + Yv33*complexconjugate(UV63))) + ZH11*((Yv11*complexconjugate(UV41) + Yv21*complexconjugate(UV42) + Yv31*complexconjugate(UV43))*complexconjugate(UV64) + (Yv12*complexconjugate(UV41) + Yv22*complexconjugate(UV42) + Yv32*complexconjugate(UV43))*complexconjugate(UV65) + (Yv13*complexconjugate(UV41) + Yv23*complexconjugate(UV42) + Yv33*complexconjugate(UV43))*complexconjugate(UV66)) + ZH12*((Yx11*complexconjugate(UV44) + Yx21*complexconjugate(UV45) + Yx31*complexconjugate(UV46))*complexconjugate(UV64) + (Yx12*complexconjugate(UV44) + Yx22*complexconjugate(UV45) + Yx32*complexconjugate(UV46))*complexconjugate(UV65) + (Yx13*complexconjugate(UV44) + Yx23*complexconjugate(UV45) + Yx33*complexconjugate(UV46))*complexconjugate(UV66) + complexconjugate(UV44)*(Yx11*complexconjugate(UV64) + Yx21*complexconjugate(UV65) + Yx31*complexconjugate(UV66)) + complexconjugate(UV45)*(Yx12*complexconjugate(UV64) + Yx22*complexconjugate(UV65) + Yx32*complexconjugate(UV66)) + complexconjugate(UV46)*(Yx13*complexconjugate(UV64) + Yx23*complexconjugate(UV65) + Yx33*complexconjugate(UV66)))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_568 = Coupling(name = 'GC_568',
	 value = '(-1*complex(0,1)*(ZH11*(UV64*(UV41*complexconjugate(Yv11) + UV42*complexconjugate(Yv21) + UV43*complexconjugate(Yv31)) + UV65*(UV41*complexconjugate(Yv12) + UV42*complexconjugate(Yv22) + UV43*complexconjugate(Yv32)) + UV66*(UV41*complexconjugate(Yv13) + UV42*complexconjugate(Yv23) + UV43*complexconjugate(Yv33))) + ZH11*(UV44*(UV61*complexconjugate(Yv11) + UV62*complexconjugate(Yv21) + UV63*complexconjugate(Yv31)) + UV45*(UV61*complexconjugate(Yv12) + UV62*complexconjugate(Yv22) + UV63*complexconjugate(Yv32)) + UV46*(UV61*complexconjugate(Yv13) + UV62*complexconjugate(Yv23) + UV63*complexconjugate(Yv33))) + ZH12*(UV64*(UV44*complexconjugate(Yx11) + UV45*complexconjugate(Yx21) + UV46*complexconjugate(Yx31)) + UV44*(UV64*complexconjugate(Yx11) + UV65*complexconjugate(Yx21) + UV66*complexconjugate(Yx31)) + UV65*(UV44*complexconjugate(Yx12) + UV45*complexconjugate(Yx22) + UV46*complexconjugate(Yx32)) + UV45*(UV64*complexconjugate(Yx12) + UV65*complexconjugate(Yx22) + UV66*complexconjugate(Yx32)) + UV66*(UV44*complexconjugate(Yx13) + UV45*complexconjugate(Yx23) + UV46*complexconjugate(Yx33)) + UV46*(UV64*complexconjugate(Yx13) + UV65*complexconjugate(Yx23) + UV66*complexconjugate(Yx33)))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_569 = Coupling(name = 'GC_569',
	 value = '(-1*complex(0,1)*(ZH21*(complexconjugate(UV44)*(Yv11*complexconjugate(UV61) + Yv21*complexconjugate(UV62) + Yv31*complexconjugate(UV63)) + complexconjugate(UV45)*(Yv12*complexconjugate(UV61) + Yv22*complexconjugate(UV62) + Yv32*complexconjugate(UV63)) + complexconjugate(UV46)*(Yv13*complexconjugate(UV61) + Yv23*complexconjugate(UV62) + Yv33*complexconjugate(UV63))) + ZH21*((Yv11*complexconjugate(UV41) + Yv21*complexconjugate(UV42) + Yv31*complexconjugate(UV43))*complexconjugate(UV64) + (Yv12*complexconjugate(UV41) + Yv22*complexconjugate(UV42) + Yv32*complexconjugate(UV43))*complexconjugate(UV65) + (Yv13*complexconjugate(UV41) + Yv23*complexconjugate(UV42) + Yv33*complexconjugate(UV43))*complexconjugate(UV66)) + ZH22*((Yx11*complexconjugate(UV44) + Yx21*complexconjugate(UV45) + Yx31*complexconjugate(UV46))*complexconjugate(UV64) + (Yx12*complexconjugate(UV44) + Yx22*complexconjugate(UV45) + Yx32*complexconjugate(UV46))*complexconjugate(UV65) + (Yx13*complexconjugate(UV44) + Yx23*complexconjugate(UV45) + Yx33*complexconjugate(UV46))*complexconjugate(UV66) + complexconjugate(UV44)*(Yx11*complexconjugate(UV64) + Yx21*complexconjugate(UV65) + Yx31*complexconjugate(UV66)) + complexconjugate(UV45)*(Yx12*complexconjugate(UV64) + Yx22*complexconjugate(UV65) + Yx32*complexconjugate(UV66)) + complexconjugate(UV46)*(Yx13*complexconjugate(UV64) + Yx23*complexconjugate(UV65) + Yx33*complexconjugate(UV66)))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_570 = Coupling(name = 'GC_570',
	 value = '(-1*complex(0,1)*(ZH21*(UV64*(UV41*complexconjugate(Yv11) + UV42*complexconjugate(Yv21) + UV43*complexconjugate(Yv31)) + UV65*(UV41*complexconjugate(Yv12) + UV42*complexconjugate(Yv22) + UV43*complexconjugate(Yv32)) + UV66*(UV41*complexconjugate(Yv13) + UV42*complexconjugate(Yv23) + UV43*complexconjugate(Yv33))) + ZH21*(UV44*(UV61*complexconjugate(Yv11) + UV62*complexconjugate(Yv21) + UV63*complexconjugate(Yv31)) + UV45*(UV61*complexconjugate(Yv12) + UV62*complexconjugate(Yv22) + UV63*complexconjugate(Yv32)) + UV46*(UV61*complexconjugate(Yv13) + UV62*complexconjugate(Yv23) + UV63*complexconjugate(Yv33))) + ZH22*(UV64*(UV44*complexconjugate(Yx11) + UV45*complexconjugate(Yx21) + UV46*complexconjugate(Yx31)) + UV44*(UV64*complexconjugate(Yx11) + UV65*complexconjugate(Yx21) + UV66*complexconjugate(Yx31)) + UV65*(UV44*complexconjugate(Yx12) + UV45*complexconjugate(Yx22) + UV46*complexconjugate(Yx32)) + UV45*(UV64*complexconjugate(Yx12) + UV65*complexconjugate(Yx22) + UV66*complexconjugate(Yx32)) + UV66*(UV44*complexconjugate(Yx13) + UV45*complexconjugate(Yx23) + UV46*complexconjugate(Yx33)) + UV46*(UV64*complexconjugate(Yx13) + UV65*complexconjugate(Yx23) + UV66*complexconjugate(Yx33)))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_571 = Coupling(name = 'GC_571',
	 value = '(-1*complex(0,1)*(2*ZH11*((Yv11*complexconjugate(UV51) + Yv21*complexconjugate(UV52) + Yv31*complexconjugate(UV53))*complexconjugate(UV54) + (Yv12*complexconjugate(UV51) + Yv22*complexconjugate(UV52) + Yv32*complexconjugate(UV53))*complexconjugate(UV55) + (Yv13*complexconjugate(UV51) + Yv23*complexconjugate(UV52) + Yv33*complexconjugate(UV53))*complexconjugate(UV56)) + ZH12*(2*complexconjugate(UV54)*(Yx11*complexconjugate(UV54) + Yx21*complexconjugate(UV55) + Yx31*complexconjugate(UV56)) + 2*complexconjugate(UV55)*(Yx12*complexconjugate(UV54) + Yx22*complexconjugate(UV55) + Yx32*complexconjugate(UV56)) + 2*complexconjugate(UV56)*(Yx13*complexconjugate(UV54) + Yx23*complexconjugate(UV55) + Yx33*complexconjugate(UV56)))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_572 = Coupling(name = 'GC_572',
	 value = '(-1*complex(0,1)*(2*ZH11*(UV54*(UV51*complexconjugate(Yv11) + UV52*complexconjugate(Yv21) + UV53*complexconjugate(Yv31)) + UV55*(UV51*complexconjugate(Yv12) + UV52*complexconjugate(Yv22) + UV53*complexconjugate(Yv32)) + UV56*(UV51*complexconjugate(Yv13) + UV52*complexconjugate(Yv23) + UV53*complexconjugate(Yv33))) + ZH12*(2*UV54*(UV54*complexconjugate(Yx11) + UV55*complexconjugate(Yx21) + UV56*complexconjugate(Yx31)) + 2*UV55*(UV54*complexconjugate(Yx12) + UV55*complexconjugate(Yx22) + UV56*complexconjugate(Yx32)) + 2*UV56*(UV54*complexconjugate(Yx13) + UV55*complexconjugate(Yx23) + UV56*complexconjugate(Yx33)))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_573 = Coupling(name = 'GC_573',
	 value = '(-1*complex(0,1)*(2*ZH21*((Yv11*complexconjugate(UV51) + Yv21*complexconjugate(UV52) + Yv31*complexconjugate(UV53))*complexconjugate(UV54) + (Yv12*complexconjugate(UV51) + Yv22*complexconjugate(UV52) + Yv32*complexconjugate(UV53))*complexconjugate(UV55) + (Yv13*complexconjugate(UV51) + Yv23*complexconjugate(UV52) + Yv33*complexconjugate(UV53))*complexconjugate(UV56)) + ZH22*(2*complexconjugate(UV54)*(Yx11*complexconjugate(UV54) + Yx21*complexconjugate(UV55) + Yx31*complexconjugate(UV56)) + 2*complexconjugate(UV55)*(Yx12*complexconjugate(UV54) + Yx22*complexconjugate(UV55) + Yx32*complexconjugate(UV56)) + 2*complexconjugate(UV56)*(Yx13*complexconjugate(UV54) + Yx23*complexconjugate(UV55) + Yx33*complexconjugate(UV56)))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_574 = Coupling(name = 'GC_574',
	 value = '(-1*complex(0,1)*(2*ZH21*(UV54*(UV51*complexconjugate(Yv11) + UV52*complexconjugate(Yv21) + UV53*complexconjugate(Yv31)) + UV55*(UV51*complexconjugate(Yv12) + UV52*complexconjugate(Yv22) + UV53*complexconjugate(Yv32)) + UV56*(UV51*complexconjugate(Yv13) + UV52*complexconjugate(Yv23) + UV53*complexconjugate(Yv33))) + ZH22*(2*UV54*(UV54*complexconjugate(Yx11) + UV55*complexconjugate(Yx21) + UV56*complexconjugate(Yx31)) + 2*UV55*(UV54*complexconjugate(Yx12) + UV55*complexconjugate(Yx22) + UV56*complexconjugate(Yx32)) + 2*UV56*(UV54*complexconjugate(Yx13) + UV55*complexconjugate(Yx23) + UV56*complexconjugate(Yx33)))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_575 = Coupling(name = 'GC_575',
	 value = '(-1*complex(0,1)*(ZH11*(complexconjugate(UV54)*(Yv11*complexconjugate(UV61) + Yv21*complexconjugate(UV62) + Yv31*complexconjugate(UV63)) + complexconjugate(UV55)*(Yv12*complexconjugate(UV61) + Yv22*complexconjugate(UV62) + Yv32*complexconjugate(UV63)) + complexconjugate(UV56)*(Yv13*complexconjugate(UV61) + Yv23*complexconjugate(UV62) + Yv33*complexconjugate(UV63))) + ZH11*((Yv11*complexconjugate(UV51) + Yv21*complexconjugate(UV52) + Yv31*complexconjugate(UV53))*complexconjugate(UV64) + (Yv12*complexconjugate(UV51) + Yv22*complexconjugate(UV52) + Yv32*complexconjugate(UV53))*complexconjugate(UV65) + (Yv13*complexconjugate(UV51) + Yv23*complexconjugate(UV52) + Yv33*complexconjugate(UV53))*complexconjugate(UV66)) + ZH12*((Yx11*complexconjugate(UV54) + Yx21*complexconjugate(UV55) + Yx31*complexconjugate(UV56))*complexconjugate(UV64) + (Yx12*complexconjugate(UV54) + Yx22*complexconjugate(UV55) + Yx32*complexconjugate(UV56))*complexconjugate(UV65) + (Yx13*complexconjugate(UV54) + Yx23*complexconjugate(UV55) + Yx33*complexconjugate(UV56))*complexconjugate(UV66) + complexconjugate(UV54)*(Yx11*complexconjugate(UV64) + Yx21*complexconjugate(UV65) + Yx31*complexconjugate(UV66)) + complexconjugate(UV55)*(Yx12*complexconjugate(UV64) + Yx22*complexconjugate(UV65) + Yx32*complexconjugate(UV66)) + complexconjugate(UV56)*(Yx13*complexconjugate(UV64) + Yx23*complexconjugate(UV65) + Yx33*complexconjugate(UV66)))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_576 = Coupling(name = 'GC_576',
	 value = '(-1*complex(0,1)*(ZH11*(UV64*(UV51*complexconjugate(Yv11) + UV52*complexconjugate(Yv21) + UV53*complexconjugate(Yv31)) + UV65*(UV51*complexconjugate(Yv12) + UV52*complexconjugate(Yv22) + UV53*complexconjugate(Yv32)) + UV66*(UV51*complexconjugate(Yv13) + UV52*complexconjugate(Yv23) + UV53*complexconjugate(Yv33))) + ZH11*(UV54*(UV61*complexconjugate(Yv11) + UV62*complexconjugate(Yv21) + UV63*complexconjugate(Yv31)) + UV55*(UV61*complexconjugate(Yv12) + UV62*complexconjugate(Yv22) + UV63*complexconjugate(Yv32)) + UV56*(UV61*complexconjugate(Yv13) + UV62*complexconjugate(Yv23) + UV63*complexconjugate(Yv33))) + ZH12*(UV64*(UV54*complexconjugate(Yx11) + UV55*complexconjugate(Yx21) + UV56*complexconjugate(Yx31)) + UV54*(UV64*complexconjugate(Yx11) + UV65*complexconjugate(Yx21) + UV66*complexconjugate(Yx31)) + UV65*(UV54*complexconjugate(Yx12) + UV55*complexconjugate(Yx22) + UV56*complexconjugate(Yx32)) + UV55*(UV64*complexconjugate(Yx12) + UV65*complexconjugate(Yx22) + UV66*complexconjugate(Yx32)) + UV66*(UV54*complexconjugate(Yx13) + UV55*complexconjugate(Yx23) + UV56*complexconjugate(Yx33)) + UV56*(UV64*complexconjugate(Yx13) + UV65*complexconjugate(Yx23) + UV66*complexconjugate(Yx33)))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_577 = Coupling(name = 'GC_577',
	 value = '(-1*complex(0,1)*(ZH21*(complexconjugate(UV54)*(Yv11*complexconjugate(UV61) + Yv21*complexconjugate(UV62) + Yv31*complexconjugate(UV63)) + complexconjugate(UV55)*(Yv12*complexconjugate(UV61) + Yv22*complexconjugate(UV62) + Yv32*complexconjugate(UV63)) + complexconjugate(UV56)*(Yv13*complexconjugate(UV61) + Yv23*complexconjugate(UV62) + Yv33*complexconjugate(UV63))) + ZH21*((Yv11*complexconjugate(UV51) + Yv21*complexconjugate(UV52) + Yv31*complexconjugate(UV53))*complexconjugate(UV64) + (Yv12*complexconjugate(UV51) + Yv22*complexconjugate(UV52) + Yv32*complexconjugate(UV53))*complexconjugate(UV65) + (Yv13*complexconjugate(UV51) + Yv23*complexconjugate(UV52) + Yv33*complexconjugate(UV53))*complexconjugate(UV66)) + ZH22*((Yx11*complexconjugate(UV54) + Yx21*complexconjugate(UV55) + Yx31*complexconjugate(UV56))*complexconjugate(UV64) + (Yx12*complexconjugate(UV54) + Yx22*complexconjugate(UV55) + Yx32*complexconjugate(UV56))*complexconjugate(UV65) + (Yx13*complexconjugate(UV54) + Yx23*complexconjugate(UV55) + Yx33*complexconjugate(UV56))*complexconjugate(UV66) + complexconjugate(UV54)*(Yx11*complexconjugate(UV64) + Yx21*complexconjugate(UV65) + Yx31*complexconjugate(UV66)) + complexconjugate(UV55)*(Yx12*complexconjugate(UV64) + Yx22*complexconjugate(UV65) + Yx32*complexconjugate(UV66)) + complexconjugate(UV56)*(Yx13*complexconjugate(UV64) + Yx23*complexconjugate(UV65) + Yx33*complexconjugate(UV66)))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_578 = Coupling(name = 'GC_578',
	 value = '(-1*complex(0,1)*(ZH21*(UV64*(UV51*complexconjugate(Yv11) + UV52*complexconjugate(Yv21) + UV53*complexconjugate(Yv31)) + UV65*(UV51*complexconjugate(Yv12) + UV52*complexconjugate(Yv22) + UV53*complexconjugate(Yv32)) + UV66*(UV51*complexconjugate(Yv13) + UV52*complexconjugate(Yv23) + UV53*complexconjugate(Yv33))) + ZH21*(UV54*(UV61*complexconjugate(Yv11) + UV62*complexconjugate(Yv21) + UV63*complexconjugate(Yv31)) + UV55*(UV61*complexconjugate(Yv12) + UV62*complexconjugate(Yv22) + UV63*complexconjugate(Yv32)) + UV56*(UV61*complexconjugate(Yv13) + UV62*complexconjugate(Yv23) + UV63*complexconjugate(Yv33))) + ZH22*(UV64*(UV54*complexconjugate(Yx11) + UV55*complexconjugate(Yx21) + UV56*complexconjugate(Yx31)) + UV54*(UV64*complexconjugate(Yx11) + UV65*complexconjugate(Yx21) + UV66*complexconjugate(Yx31)) + UV65*(UV54*complexconjugate(Yx12) + UV55*complexconjugate(Yx22) + UV56*complexconjugate(Yx32)) + UV55*(UV64*complexconjugate(Yx12) + UV65*complexconjugate(Yx22) + UV66*complexconjugate(Yx32)) + UV66*(UV54*complexconjugate(Yx13) + UV55*complexconjugate(Yx23) + UV56*complexconjugate(Yx33)) + UV56*(UV64*complexconjugate(Yx13) + UV65*complexconjugate(Yx23) + UV66*complexconjugate(Yx33)))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_579 = Coupling(name = 'GC_579',
	 value = '(-1*complex(0,1)*(2*ZH11*((Yv11*complexconjugate(UV61) + Yv21*complexconjugate(UV62) + Yv31*complexconjugate(UV63))*complexconjugate(UV64) + (Yv12*complexconjugate(UV61) + Yv22*complexconjugate(UV62) + Yv32*complexconjugate(UV63))*complexconjugate(UV65) + (Yv13*complexconjugate(UV61) + Yv23*complexconjugate(UV62) + Yv33*complexconjugate(UV63))*complexconjugate(UV66)) + ZH12*(2*complexconjugate(UV64)*(Yx11*complexconjugate(UV64) + Yx21*complexconjugate(UV65) + Yx31*complexconjugate(UV66)) + 2*complexconjugate(UV65)*(Yx12*complexconjugate(UV64) + Yx22*complexconjugate(UV65) + Yx32*complexconjugate(UV66)) + 2*complexconjugate(UV66)*(Yx13*complexconjugate(UV64) + Yx23*complexconjugate(UV65) + Yx33*complexconjugate(UV66)))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_580 = Coupling(name = 'GC_580',
	 value = '(-1*complex(0,1)*(2*ZH11*(UV64*(UV61*complexconjugate(Yv11) + UV62*complexconjugate(Yv21) + UV63*complexconjugate(Yv31)) + UV65*(UV61*complexconjugate(Yv12) + UV62*complexconjugate(Yv22) + UV63*complexconjugate(Yv32)) + UV66*(UV61*complexconjugate(Yv13) + UV62*complexconjugate(Yv23) + UV63*complexconjugate(Yv33))) + ZH12*(2*UV64*(UV64*complexconjugate(Yx11) + UV65*complexconjugate(Yx21) + UV66*complexconjugate(Yx31)) + 2*UV65*(UV64*complexconjugate(Yx12) + UV65*complexconjugate(Yx22) + UV66*complexconjugate(Yx32)) + 2*UV66*(UV64*complexconjugate(Yx13) + UV65*complexconjugate(Yx23) + UV66*complexconjugate(Yx33)))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_581 = Coupling(name = 'GC_581',
	 value = '(-1*complex(0,1)*(2*ZH21*((Yv11*complexconjugate(UV61) + Yv21*complexconjugate(UV62) + Yv31*complexconjugate(UV63))*complexconjugate(UV64) + (Yv12*complexconjugate(UV61) + Yv22*complexconjugate(UV62) + Yv32*complexconjugate(UV63))*complexconjugate(UV65) + (Yv13*complexconjugate(UV61) + Yv23*complexconjugate(UV62) + Yv33*complexconjugate(UV63))*complexconjugate(UV66)) + ZH22*(2*complexconjugate(UV64)*(Yx11*complexconjugate(UV64) + Yx21*complexconjugate(UV65) + Yx31*complexconjugate(UV66)) + 2*complexconjugate(UV65)*(Yx12*complexconjugate(UV64) + Yx22*complexconjugate(UV65) + Yx32*complexconjugate(UV66)) + 2*complexconjugate(UV66)*(Yx13*complexconjugate(UV64) + Yx23*complexconjugate(UV65) + Yx33*complexconjugate(UV66)))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_582 = Coupling(name = 'GC_582',
	 value = '(-1*complex(0,1)*(2*ZH21*(UV64*(UV61*complexconjugate(Yv11) + UV62*complexconjugate(Yv21) + UV63*complexconjugate(Yv31)) + UV65*(UV61*complexconjugate(Yv12) + UV62*complexconjugate(Yv22) + UV63*complexconjugate(Yv32)) + UV66*(UV61*complexconjugate(Yv13) + UV62*complexconjugate(Yv23) + UV63*complexconjugate(Yv33))) + ZH22*(2*UV64*(UV64*complexconjugate(Yx11) + UV65*complexconjugate(Yx21) + UV66*complexconjugate(Yx31)) + 2*UV65*(UV64*complexconjugate(Yx12) + UV65*complexconjugate(Yx22) + UV66*complexconjugate(Yx32)) + 2*UV66*(UV64*complexconjugate(Yx13) + UV65*complexconjugate(Yx23) + UV66*complexconjugate(Yx33)))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_583 = Coupling(name = 'GC_583',
	 value = '1*complex(0,1)*(complexconjugate(UV11)*(Ye11*complexconjugate(ZER11) + Ye21*complexconjugate(ZER12) + Ye31*complexconjugate(ZER13)) + complexconjugate(UV12)*(Ye12*complexconjugate(ZER11) + Ye22*complexconjugate(ZER12) + Ye32*complexconjugate(ZER13)) + complexconjugate(UV13)*(Ye13*complexconjugate(ZER11) + Ye23*complexconjugate(ZER12) + Ye33*complexconjugate(ZER13)))', 
	 order = {'QED':1} ) 
 
GC_584 = Coupling(name = 'GC_584',
	 value = '-1*complex(0,1)*(UV14*(ZEL11*complexconjugate(Yv11) + ZEL12*complexconjugate(Yv21) + ZEL13*complexconjugate(Yv31)) + UV15*(ZEL11*complexconjugate(Yv12) + ZEL12*complexconjugate(Yv22) + ZEL13*complexconjugate(Yv32)) + UV16*(ZEL11*complexconjugate(Yv13) + ZEL12*complexconjugate(Yv23) + ZEL13*complexconjugate(Yv33)))', 
	 order = {'QED':1} ) 
 
GC_585 = Coupling(name = 'GC_585',
	 value = '1*complex(0,1)*(complexconjugate(UV21)*(Ye11*complexconjugate(ZER11) + Ye21*complexconjugate(ZER12) + Ye31*complexconjugate(ZER13)) + complexconjugate(UV22)*(Ye12*complexconjugate(ZER11) + Ye22*complexconjugate(ZER12) + Ye32*complexconjugate(ZER13)) + complexconjugate(UV23)*(Ye13*complexconjugate(ZER11) + Ye23*complexconjugate(ZER12) + Ye33*complexconjugate(ZER13)))', 
	 order = {'QED':1} ) 
 
GC_586 = Coupling(name = 'GC_586',
	 value = '-1*complex(0,1)*(UV24*(ZEL11*complexconjugate(Yv11) + ZEL12*complexconjugate(Yv21) + ZEL13*complexconjugate(Yv31)) + UV25*(ZEL11*complexconjugate(Yv12) + ZEL12*complexconjugate(Yv22) + ZEL13*complexconjugate(Yv32)) + UV26*(ZEL11*complexconjugate(Yv13) + ZEL12*complexconjugate(Yv23) + ZEL13*complexconjugate(Yv33)))', 
	 order = {'QED':1} ) 
 
GC_587 = Coupling(name = 'GC_587',
	 value = '1*complex(0,1)*(complexconjugate(UV31)*(Ye11*complexconjugate(ZER11) + Ye21*complexconjugate(ZER12) + Ye31*complexconjugate(ZER13)) + complexconjugate(UV32)*(Ye12*complexconjugate(ZER11) + Ye22*complexconjugate(ZER12) + Ye32*complexconjugate(ZER13)) + complexconjugate(UV33)*(Ye13*complexconjugate(ZER11) + Ye23*complexconjugate(ZER12) + Ye33*complexconjugate(ZER13)))', 
	 order = {'QED':1} ) 
 
GC_588 = Coupling(name = 'GC_588',
	 value = '-1*complex(0,1)*(UV34*(ZEL11*complexconjugate(Yv11) + ZEL12*complexconjugate(Yv21) + ZEL13*complexconjugate(Yv31)) + UV35*(ZEL11*complexconjugate(Yv12) + ZEL12*complexconjugate(Yv22) + ZEL13*complexconjugate(Yv32)) + UV36*(ZEL11*complexconjugate(Yv13) + ZEL12*complexconjugate(Yv23) + ZEL13*complexconjugate(Yv33)))', 
	 order = {'QED':1} ) 
 
GC_589 = Coupling(name = 'GC_589',
	 value = '1*complex(0,1)*(complexconjugate(UV41)*(Ye11*complexconjugate(ZER11) + Ye21*complexconjugate(ZER12) + Ye31*complexconjugate(ZER13)) + complexconjugate(UV42)*(Ye12*complexconjugate(ZER11) + Ye22*complexconjugate(ZER12) + Ye32*complexconjugate(ZER13)) + complexconjugate(UV43)*(Ye13*complexconjugate(ZER11) + Ye23*complexconjugate(ZER12) + Ye33*complexconjugate(ZER13)))', 
	 order = {'QED':1} ) 
 
GC_590 = Coupling(name = 'GC_590',
	 value = '-1*complex(0,1)*(UV44*(ZEL11*complexconjugate(Yv11) + ZEL12*complexconjugate(Yv21) + ZEL13*complexconjugate(Yv31)) + UV45*(ZEL11*complexconjugate(Yv12) + ZEL12*complexconjugate(Yv22) + ZEL13*complexconjugate(Yv32)) + UV46*(ZEL11*complexconjugate(Yv13) + ZEL12*complexconjugate(Yv23) + ZEL13*complexconjugate(Yv33)))', 
	 order = {'QED':1} ) 
 
GC_591 = Coupling(name = 'GC_591',
	 value = '1*complex(0,1)*(complexconjugate(UV51)*(Ye11*complexconjugate(ZER11) + Ye21*complexconjugate(ZER12) + Ye31*complexconjugate(ZER13)) + complexconjugate(UV52)*(Ye12*complexconjugate(ZER11) + Ye22*complexconjugate(ZER12) + Ye32*complexconjugate(ZER13)) + complexconjugate(UV53)*(Ye13*complexconjugate(ZER11) + Ye23*complexconjugate(ZER12) + Ye33*complexconjugate(ZER13)))', 
	 order = {'QED':1} ) 
 
GC_592 = Coupling(name = 'GC_592',
	 value = '-1*complex(0,1)*(UV54*(ZEL11*complexconjugate(Yv11) + ZEL12*complexconjugate(Yv21) + ZEL13*complexconjugate(Yv31)) + UV55*(ZEL11*complexconjugate(Yv12) + ZEL12*complexconjugate(Yv22) + ZEL13*complexconjugate(Yv32)) + UV56*(ZEL11*complexconjugate(Yv13) + ZEL12*complexconjugate(Yv23) + ZEL13*complexconjugate(Yv33)))', 
	 order = {'QED':1} ) 
 
GC_593 = Coupling(name = 'GC_593',
	 value = '1*complex(0,1)*(complexconjugate(UV61)*(Ye11*complexconjugate(ZER11) + Ye21*complexconjugate(ZER12) + Ye31*complexconjugate(ZER13)) + complexconjugate(UV62)*(Ye12*complexconjugate(ZER11) + Ye22*complexconjugate(ZER12) + Ye32*complexconjugate(ZER13)) + complexconjugate(UV63)*(Ye13*complexconjugate(ZER11) + Ye23*complexconjugate(ZER12) + Ye33*complexconjugate(ZER13)))', 
	 order = {'QED':1} ) 
 
GC_594 = Coupling(name = 'GC_594',
	 value = '-1*complex(0,1)*(UV64*(ZEL11*complexconjugate(Yv11) + ZEL12*complexconjugate(Yv21) + ZEL13*complexconjugate(Yv31)) + UV65*(ZEL11*complexconjugate(Yv12) + ZEL12*complexconjugate(Yv22) + ZEL13*complexconjugate(Yv32)) + UV66*(ZEL11*complexconjugate(Yv13) + ZEL12*complexconjugate(Yv23) + ZEL13*complexconjugate(Yv33)))', 
	 order = {'QED':1} ) 
 
GC_595 = Coupling(name = 'GC_595',
	 value = '1*complex(0,1)*(complexconjugate(UV11)*(Ye11*complexconjugate(ZER21) + Ye21*complexconjugate(ZER22) + Ye31*complexconjugate(ZER23)) + complexconjugate(UV12)*(Ye12*complexconjugate(ZER21) + Ye22*complexconjugate(ZER22) + Ye32*complexconjugate(ZER23)) + complexconjugate(UV13)*(Ye13*complexconjugate(ZER21) + Ye23*complexconjugate(ZER22) + Ye33*complexconjugate(ZER23)))', 
	 order = {'QED':1} ) 
 
GC_596 = Coupling(name = 'GC_596',
	 value = '-1*complex(0,1)*(UV14*(ZEL21*complexconjugate(Yv11) + ZEL22*complexconjugate(Yv21) + ZEL23*complexconjugate(Yv31)) + UV15*(ZEL21*complexconjugate(Yv12) + ZEL22*complexconjugate(Yv22) + ZEL23*complexconjugate(Yv32)) + UV16*(ZEL21*complexconjugate(Yv13) + ZEL22*complexconjugate(Yv23) + ZEL23*complexconjugate(Yv33)))', 
	 order = {'QED':1} ) 
 
GC_597 = Coupling(name = 'GC_597',
	 value = '1*complex(0,1)*(complexconjugate(UV21)*(Ye11*complexconjugate(ZER21) + Ye21*complexconjugate(ZER22) + Ye31*complexconjugate(ZER23)) + complexconjugate(UV22)*(Ye12*complexconjugate(ZER21) + Ye22*complexconjugate(ZER22) + Ye32*complexconjugate(ZER23)) + complexconjugate(UV23)*(Ye13*complexconjugate(ZER21) + Ye23*complexconjugate(ZER22) + Ye33*complexconjugate(ZER23)))', 
	 order = {'QED':1} ) 
 
GC_598 = Coupling(name = 'GC_598',
	 value = '-1*complex(0,1)*(UV24*(ZEL21*complexconjugate(Yv11) + ZEL22*complexconjugate(Yv21) + ZEL23*complexconjugate(Yv31)) + UV25*(ZEL21*complexconjugate(Yv12) + ZEL22*complexconjugate(Yv22) + ZEL23*complexconjugate(Yv32)) + UV26*(ZEL21*complexconjugate(Yv13) + ZEL22*complexconjugate(Yv23) + ZEL23*complexconjugate(Yv33)))', 
	 order = {'QED':1} ) 
 
GC_599 = Coupling(name = 'GC_599',
	 value = '1*complex(0,1)*(complexconjugate(UV31)*(Ye11*complexconjugate(ZER21) + Ye21*complexconjugate(ZER22) + Ye31*complexconjugate(ZER23)) + complexconjugate(UV32)*(Ye12*complexconjugate(ZER21) + Ye22*complexconjugate(ZER22) + Ye32*complexconjugate(ZER23)) + complexconjugate(UV33)*(Ye13*complexconjugate(ZER21) + Ye23*complexconjugate(ZER22) + Ye33*complexconjugate(ZER23)))', 
	 order = {'QED':1} ) 
 
GC_600 = Coupling(name = 'GC_600',
	 value = '-1*complex(0,1)*(UV34*(ZEL21*complexconjugate(Yv11) + ZEL22*complexconjugate(Yv21) + ZEL23*complexconjugate(Yv31)) + UV35*(ZEL21*complexconjugate(Yv12) + ZEL22*complexconjugate(Yv22) + ZEL23*complexconjugate(Yv32)) + UV36*(ZEL21*complexconjugate(Yv13) + ZEL22*complexconjugate(Yv23) + ZEL23*complexconjugate(Yv33)))', 
	 order = {'QED':1} ) 
 
GC_601 = Coupling(name = 'GC_601',
	 value = '1*complex(0,1)*(complexconjugate(UV41)*(Ye11*complexconjugate(ZER21) + Ye21*complexconjugate(ZER22) + Ye31*complexconjugate(ZER23)) + complexconjugate(UV42)*(Ye12*complexconjugate(ZER21) + Ye22*complexconjugate(ZER22) + Ye32*complexconjugate(ZER23)) + complexconjugate(UV43)*(Ye13*complexconjugate(ZER21) + Ye23*complexconjugate(ZER22) + Ye33*complexconjugate(ZER23)))', 
	 order = {'QED':1} ) 
 
GC_602 = Coupling(name = 'GC_602',
	 value = '-1*complex(0,1)*(UV44*(ZEL21*complexconjugate(Yv11) + ZEL22*complexconjugate(Yv21) + ZEL23*complexconjugate(Yv31)) + UV45*(ZEL21*complexconjugate(Yv12) + ZEL22*complexconjugate(Yv22) + ZEL23*complexconjugate(Yv32)) + UV46*(ZEL21*complexconjugate(Yv13) + ZEL22*complexconjugate(Yv23) + ZEL23*complexconjugate(Yv33)))', 
	 order = {'QED':1} ) 
 
GC_603 = Coupling(name = 'GC_603',
	 value = '1*complex(0,1)*(complexconjugate(UV51)*(Ye11*complexconjugate(ZER21) + Ye21*complexconjugate(ZER22) + Ye31*complexconjugate(ZER23)) + complexconjugate(UV52)*(Ye12*complexconjugate(ZER21) + Ye22*complexconjugate(ZER22) + Ye32*complexconjugate(ZER23)) + complexconjugate(UV53)*(Ye13*complexconjugate(ZER21) + Ye23*complexconjugate(ZER22) + Ye33*complexconjugate(ZER23)))', 
	 order = {'QED':1} ) 
 
GC_604 = Coupling(name = 'GC_604',
	 value = '-1*complex(0,1)*(UV54*(ZEL21*complexconjugate(Yv11) + ZEL22*complexconjugate(Yv21) + ZEL23*complexconjugate(Yv31)) + UV55*(ZEL21*complexconjugate(Yv12) + ZEL22*complexconjugate(Yv22) + ZEL23*complexconjugate(Yv32)) + UV56*(ZEL21*complexconjugate(Yv13) + ZEL22*complexconjugate(Yv23) + ZEL23*complexconjugate(Yv33)))', 
	 order = {'QED':1} ) 
 
GC_605 = Coupling(name = 'GC_605',
	 value = '1*complex(0,1)*(complexconjugate(UV61)*(Ye11*complexconjugate(ZER21) + Ye21*complexconjugate(ZER22) + Ye31*complexconjugate(ZER23)) + complexconjugate(UV62)*(Ye12*complexconjugate(ZER21) + Ye22*complexconjugate(ZER22) + Ye32*complexconjugate(ZER23)) + complexconjugate(UV63)*(Ye13*complexconjugate(ZER21) + Ye23*complexconjugate(ZER22) + Ye33*complexconjugate(ZER23)))', 
	 order = {'QED':1} ) 
 
GC_606 = Coupling(name = 'GC_606',
	 value = '-1*complex(0,1)*(UV64*(ZEL21*complexconjugate(Yv11) + ZEL22*complexconjugate(Yv21) + ZEL23*complexconjugate(Yv31)) + UV65*(ZEL21*complexconjugate(Yv12) + ZEL22*complexconjugate(Yv22) + ZEL23*complexconjugate(Yv32)) + UV66*(ZEL21*complexconjugate(Yv13) + ZEL22*complexconjugate(Yv23) + ZEL23*complexconjugate(Yv33)))', 
	 order = {'QED':1} ) 
 
GC_607 = Coupling(name = 'GC_607',
	 value = '1*complex(0,1)*(complexconjugate(UV11)*(Ye11*complexconjugate(ZER31) + Ye21*complexconjugate(ZER32) + Ye31*complexconjugate(ZER33)) + complexconjugate(UV12)*(Ye12*complexconjugate(ZER31) + Ye22*complexconjugate(ZER32) + Ye32*complexconjugate(ZER33)) + complexconjugate(UV13)*(Ye13*complexconjugate(ZER31) + Ye23*complexconjugate(ZER32) + Ye33*complexconjugate(ZER33)))', 
	 order = {'QED':1} ) 
 
GC_608 = Coupling(name = 'GC_608',
	 value = '-1*complex(0,1)*(UV14*(ZEL31*complexconjugate(Yv11) + ZEL32*complexconjugate(Yv21) + ZEL33*complexconjugate(Yv31)) + UV15*(ZEL31*complexconjugate(Yv12) + ZEL32*complexconjugate(Yv22) + ZEL33*complexconjugate(Yv32)) + UV16*(ZEL31*complexconjugate(Yv13) + ZEL32*complexconjugate(Yv23) + ZEL33*complexconjugate(Yv33)))', 
	 order = {'QED':1} ) 
 
GC_609 = Coupling(name = 'GC_609',
	 value = '1*complex(0,1)*(complexconjugate(UV21)*(Ye11*complexconjugate(ZER31) + Ye21*complexconjugate(ZER32) + Ye31*complexconjugate(ZER33)) + complexconjugate(UV22)*(Ye12*complexconjugate(ZER31) + Ye22*complexconjugate(ZER32) + Ye32*complexconjugate(ZER33)) + complexconjugate(UV23)*(Ye13*complexconjugate(ZER31) + Ye23*complexconjugate(ZER32) + Ye33*complexconjugate(ZER33)))', 
	 order = {'QED':1} ) 
 
GC_610 = Coupling(name = 'GC_610',
	 value = '-1*complex(0,1)*(UV24*(ZEL31*complexconjugate(Yv11) + ZEL32*complexconjugate(Yv21) + ZEL33*complexconjugate(Yv31)) + UV25*(ZEL31*complexconjugate(Yv12) + ZEL32*complexconjugate(Yv22) + ZEL33*complexconjugate(Yv32)) + UV26*(ZEL31*complexconjugate(Yv13) + ZEL32*complexconjugate(Yv23) + ZEL33*complexconjugate(Yv33)))', 
	 order = {'QED':1} ) 
 
GC_611 = Coupling(name = 'GC_611',
	 value = '1*complex(0,1)*(complexconjugate(UV31)*(Ye11*complexconjugate(ZER31) + Ye21*complexconjugate(ZER32) + Ye31*complexconjugate(ZER33)) + complexconjugate(UV32)*(Ye12*complexconjugate(ZER31) + Ye22*complexconjugate(ZER32) + Ye32*complexconjugate(ZER33)) + complexconjugate(UV33)*(Ye13*complexconjugate(ZER31) + Ye23*complexconjugate(ZER32) + Ye33*complexconjugate(ZER33)))', 
	 order = {'QED':1} ) 
 
GC_612 = Coupling(name = 'GC_612',
	 value = '-1*complex(0,1)*(UV34*(ZEL31*complexconjugate(Yv11) + ZEL32*complexconjugate(Yv21) + ZEL33*complexconjugate(Yv31)) + UV35*(ZEL31*complexconjugate(Yv12) + ZEL32*complexconjugate(Yv22) + ZEL33*complexconjugate(Yv32)) + UV36*(ZEL31*complexconjugate(Yv13) + ZEL32*complexconjugate(Yv23) + ZEL33*complexconjugate(Yv33)))', 
	 order = {'QED':1} ) 
 
GC_613 = Coupling(name = 'GC_613',
	 value = '1*complex(0,1)*(complexconjugate(UV41)*(Ye11*complexconjugate(ZER31) + Ye21*complexconjugate(ZER32) + Ye31*complexconjugate(ZER33)) + complexconjugate(UV42)*(Ye12*complexconjugate(ZER31) + Ye22*complexconjugate(ZER32) + Ye32*complexconjugate(ZER33)) + complexconjugate(UV43)*(Ye13*complexconjugate(ZER31) + Ye23*complexconjugate(ZER32) + Ye33*complexconjugate(ZER33)))', 
	 order = {'QED':1} ) 
 
GC_614 = Coupling(name = 'GC_614',
	 value = '-1*complex(0,1)*(UV44*(ZEL31*complexconjugate(Yv11) + ZEL32*complexconjugate(Yv21) + ZEL33*complexconjugate(Yv31)) + UV45*(ZEL31*complexconjugate(Yv12) + ZEL32*complexconjugate(Yv22) + ZEL33*complexconjugate(Yv32)) + UV46*(ZEL31*complexconjugate(Yv13) + ZEL32*complexconjugate(Yv23) + ZEL33*complexconjugate(Yv33)))', 
	 order = {'QED':1} ) 
 
GC_615 = Coupling(name = 'GC_615',
	 value = '1*complex(0,1)*(complexconjugate(UV51)*(Ye11*complexconjugate(ZER31) + Ye21*complexconjugate(ZER32) + Ye31*complexconjugate(ZER33)) + complexconjugate(UV52)*(Ye12*complexconjugate(ZER31) + Ye22*complexconjugate(ZER32) + Ye32*complexconjugate(ZER33)) + complexconjugate(UV53)*(Ye13*complexconjugate(ZER31) + Ye23*complexconjugate(ZER32) + Ye33*complexconjugate(ZER33)))', 
	 order = {'QED':1} ) 
 
GC_616 = Coupling(name = 'GC_616',
	 value = '-1*complex(0,1)*(UV54*(ZEL31*complexconjugate(Yv11) + ZEL32*complexconjugate(Yv21) + ZEL33*complexconjugate(Yv31)) + UV55*(ZEL31*complexconjugate(Yv12) + ZEL32*complexconjugate(Yv22) + ZEL33*complexconjugate(Yv32)) + UV56*(ZEL31*complexconjugate(Yv13) + ZEL32*complexconjugate(Yv23) + ZEL33*complexconjugate(Yv33)))', 
	 order = {'QED':1} ) 
 
GC_617 = Coupling(name = 'GC_617',
	 value = '1*complex(0,1)*(complexconjugate(UV61)*(Ye11*complexconjugate(ZER31) + Ye21*complexconjugate(ZER32) + Ye31*complexconjugate(ZER33)) + complexconjugate(UV62)*(Ye12*complexconjugate(ZER31) + Ye22*complexconjugate(ZER32) + Ye32*complexconjugate(ZER33)) + complexconjugate(UV63)*(Ye13*complexconjugate(ZER31) + Ye23*complexconjugate(ZER32) + Ye33*complexconjugate(ZER33)))', 
	 order = {'QED':1} ) 
 
GC_618 = Coupling(name = 'GC_618',
	 value = '-1*complex(0,1)*(UV64*(ZEL31*complexconjugate(Yv11) + ZEL32*complexconjugate(Yv21) + ZEL33*complexconjugate(Yv31)) + UV65*(ZEL31*complexconjugate(Yv12) + ZEL32*complexconjugate(Yv22) + ZEL33*complexconjugate(Yv32)) + UV66*(ZEL31*complexconjugate(Yv13) + ZEL32*complexconjugate(Yv23) + ZEL33*complexconjugate(Yv33)))', 
	 order = {'QED':1} ) 
 
GC_619 = Coupling(name = 'GC_619',
	 value = '1*complex(0,1)*G', 
	 order = {'QCD':1} ) 
 
GC_620 = Coupling(name = 'GC_620',
	 value = '1*complex(0,1)*G', 
	 order = {'QCD':1} ) 
 
GC_621 = Coupling(name = 'GC_621',
	 value = '1*complex(0,1)*G', 
	 order = {'QCD':1} ) 
 
GC_622 = Coupling(name = 'GC_622',
	 value = '1*complex(0,1)*G', 
	 order = {'QCD':1} ) 
 
GC_623 = Coupling(name = 'GC_623',
	 value = '1*complex(0,1)*G', 
	 order = {'QCD':1} ) 
 
GC_624 = Coupling(name = 'GC_624',
	 value = '1*complex(0,1)*G', 
	 order = {'QCD':1} ) 
 
GC_625 = Coupling(name = 'GC_625',
	 value = '1./6.*complex(0,1)*((g1 + 2*gYB)*cmath.cos(TW) - 3*g2*cmath.sin(TW))', 
	 order = {'QED':1} ) 
 
GC_626 = Coupling(name = 'GC_626',
	 value = '-1./3.*complex(0,1)*(g1 - gYB)*cmath.cos(TW)', 
	 order = {'QED':1} ) 
 
GC_627 = Coupling(name = 'GC_627',
	 value = '1./6.*complex(0,1)*((g1 + 2*gYB)*cmath.cos(TW) - 3*g2*cmath.sin(TW))', 
	 order = {'QED':1} ) 
 
GC_628 = Coupling(name = 'GC_628',
	 value = '-1./3.*complex(0,1)*(g1 - gYB)*cmath.cos(TW)', 
	 order = {'QED':1} ) 
 
GC_629 = Coupling(name = 'GC_629',
	 value = '1./6.*complex(0,1)*((g1 + 2*gYB)*cmath.cos(TW) - 3*g2*cmath.sin(TW))', 
	 order = {'QED':1} ) 
 
GC_630 = Coupling(name = 'GC_630',
	 value = '-1./3.*complex(0,1)*(g1 - gYB)*cmath.cos(TW)', 
	 order = {'QED':1} ) 
 
GC_631 = Coupling(name = 'GC_631',
	 value = '-1./6.*complex(0,1)*(3*g2*cmath.cos(TW)*cmath.cos(TWp) + (g1 + 2*gYB)*cmath.cos(TWp)*cmath.sin(TW) - (2*gBL + gBY)*cmath.sin(TWp))', 
	 order = {'QED':1} ) 
 
GC_632 = Coupling(name = 'GC_632',
	 value = '1./3.*complex(0,1)*((g1 - gYB)*cmath.cos(TWp)*cmath.sin(TW) + (gBL - gBY)*cmath.sin(TWp))', 
	 order = {'QED':1} ) 
 
GC_633 = Coupling(name = 'GC_633',
	 value = '-1./6.*complex(0,1)*(3*g2*cmath.cos(TW)*cmath.cos(TWp) + (g1 + 2*gYB)*cmath.cos(TWp)*cmath.sin(TW) - (2*gBL + gBY)*cmath.sin(TWp))', 
	 order = {'QED':1} ) 
 
GC_634 = Coupling(name = 'GC_634',
	 value = '1./3.*complex(0,1)*((g1 - gYB)*cmath.cos(TWp)*cmath.sin(TW) + (gBL - gBY)*cmath.sin(TWp))', 
	 order = {'QED':1} ) 
 
GC_635 = Coupling(name = 'GC_635',
	 value = '-1./6.*complex(0,1)*(3*g2*cmath.cos(TW)*cmath.cos(TWp) + (g1 + 2*gYB)*cmath.cos(TWp)*cmath.sin(TW) - (2*gBL + gBY)*cmath.sin(TWp))', 
	 order = {'QED':1} ) 
 
GC_636 = Coupling(name = 'GC_636',
	 value = '1./3.*complex(0,1)*((g1 - gYB)*cmath.cos(TWp)*cmath.sin(TW) + (gBL - gBY)*cmath.sin(TWp))', 
	 order = {'QED':1} ) 
 
GC_637 = Coupling(name = 'GC_637',
	 value = '1./6.*complex(0,1)*((2*gBL + gBY)*cmath.cos(TWp) + (3*g2*cmath.cos(TW) + (g1 + 2*gYB)*cmath.sin(TW))*cmath.sin(TWp))', 
	 order = {'QED':1} ) 
 
GC_638 = Coupling(name = 'GC_638',
	 value = '-1./3.*complex(0,1)*((-gBL + gBY)*cmath.cos(TWp) + (g1 - gYB)*cmath.sin(TW)*cmath.sin(TWp))', 
	 order = {'QED':1} ) 
 
GC_639 = Coupling(name = 'GC_639',
	 value = '1./6.*complex(0,1)*((2*gBL + gBY)*cmath.cos(TWp) + (3*g2*cmath.cos(TW) + (g1 + 2*gYB)*cmath.sin(TW))*cmath.sin(TWp))', 
	 order = {'QED':1} ) 
 
GC_640 = Coupling(name = 'GC_640',
	 value = '-1./3.*complex(0,1)*((-gBL + gBY)*cmath.cos(TWp) + (g1 - gYB)*cmath.sin(TW)*cmath.sin(TWp))', 
	 order = {'QED':1} ) 
 
GC_641 = Coupling(name = 'GC_641',
	 value = '1./6.*complex(0,1)*((2*gBL + gBY)*cmath.cos(TWp) + (3*g2*cmath.cos(TW) + (g1 + 2*gYB)*cmath.sin(TW))*cmath.sin(TWp))', 
	 order = {'QED':1} ) 
 
GC_642 = Coupling(name = 'GC_642',
	 value = '-1./3.*complex(0,1)*((-gBL + gBY)*cmath.cos(TWp) + (g1 - gYB)*cmath.sin(TW)*cmath.sin(TWp))', 
	 order = {'QED':1} ) 
 
GC_643 = Coupling(name = 'GC_643',
	 value = '(1*complex(0,1)*g2*(ZUL11*complexconjugate(ZDL11) + ZUL12*complexconjugate(ZDL12) + ZUL13*complexconjugate(ZDL13)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_644 = Coupling(name = 'GC_644',
	 value = '(1*complex(0,1)*g2*(ZUL11*complexconjugate(ZDL21) + ZUL12*complexconjugate(ZDL22) + ZUL13*complexconjugate(ZDL23)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_645 = Coupling(name = 'GC_645',
	 value = '(1*complex(0,1)*g2*(ZUL11*complexconjugate(ZDL31) + ZUL12*complexconjugate(ZDL32) + ZUL13*complexconjugate(ZDL33)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_646 = Coupling(name = 'GC_646',
	 value = '(1*complex(0,1)*g2*(ZUL21*complexconjugate(ZDL11) + ZUL22*complexconjugate(ZDL12) + ZUL23*complexconjugate(ZDL13)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_647 = Coupling(name = 'GC_647',
	 value = '(1*complex(0,1)*g2*(ZUL21*complexconjugate(ZDL21) + ZUL22*complexconjugate(ZDL22) + ZUL23*complexconjugate(ZDL23)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_648 = Coupling(name = 'GC_648',
	 value = '(1*complex(0,1)*g2*(ZUL21*complexconjugate(ZDL31) + ZUL22*complexconjugate(ZDL32) + ZUL23*complexconjugate(ZDL33)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_649 = Coupling(name = 'GC_649',
	 value = '(1*complex(0,1)*g2*(ZUL31*complexconjugate(ZDL11) + ZUL32*complexconjugate(ZDL12) + ZUL33*complexconjugate(ZDL13)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_650 = Coupling(name = 'GC_650',
	 value = '(1*complex(0,1)*g2*(ZUL31*complexconjugate(ZDL21) + ZUL32*complexconjugate(ZDL22) + ZUL33*complexconjugate(ZDL23)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_651 = Coupling(name = 'GC_651',
	 value = '(1*complex(0,1)*g2*(ZUL31*complexconjugate(ZDL31) + ZUL32*complexconjugate(ZDL32) + ZUL33*complexconjugate(ZDL33)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_652 = Coupling(name = 'GC_652',
	 value = '(1*complex(0,1)*g2*(UV11*complexconjugate(ZEL11) + UV12*complexconjugate(ZEL12) + UV13*complexconjugate(ZEL13)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_653 = Coupling(name = 'GC_653',
	 value = '(1*complex(0,1)*g2*(UV11*complexconjugate(ZEL21) + UV12*complexconjugate(ZEL22) + UV13*complexconjugate(ZEL23)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_654 = Coupling(name = 'GC_654',
	 value = '(1*complex(0,1)*g2*(UV11*complexconjugate(ZEL31) + UV12*complexconjugate(ZEL32) + UV13*complexconjugate(ZEL33)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_655 = Coupling(name = 'GC_655',
	 value = '(1*complex(0,1)*g2*(UV21*complexconjugate(ZEL11) + UV22*complexconjugate(ZEL12) + UV23*complexconjugate(ZEL13)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_656 = Coupling(name = 'GC_656',
	 value = '(1*complex(0,1)*g2*(UV21*complexconjugate(ZEL21) + UV22*complexconjugate(ZEL22) + UV23*complexconjugate(ZEL23)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_657 = Coupling(name = 'GC_657',
	 value = '(1*complex(0,1)*g2*(UV21*complexconjugate(ZEL31) + UV22*complexconjugate(ZEL32) + UV23*complexconjugate(ZEL33)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_658 = Coupling(name = 'GC_658',
	 value = '(1*complex(0,1)*g2*(UV31*complexconjugate(ZEL11) + UV32*complexconjugate(ZEL12) + UV33*complexconjugate(ZEL13)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_659 = Coupling(name = 'GC_659',
	 value = '(1*complex(0,1)*g2*(UV31*complexconjugate(ZEL21) + UV32*complexconjugate(ZEL22) + UV33*complexconjugate(ZEL23)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_660 = Coupling(name = 'GC_660',
	 value = '(1*complex(0,1)*g2*(UV31*complexconjugate(ZEL31) + UV32*complexconjugate(ZEL32) + UV33*complexconjugate(ZEL33)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_661 = Coupling(name = 'GC_661',
	 value = '(1*complex(0,1)*g2*(UV41*complexconjugate(ZEL11) + UV42*complexconjugate(ZEL12) + UV43*complexconjugate(ZEL13)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_662 = Coupling(name = 'GC_662',
	 value = '(1*complex(0,1)*g2*(UV41*complexconjugate(ZEL21) + UV42*complexconjugate(ZEL22) + UV43*complexconjugate(ZEL23)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_663 = Coupling(name = 'GC_663',
	 value = '(1*complex(0,1)*g2*(UV41*complexconjugate(ZEL31) + UV42*complexconjugate(ZEL32) + UV43*complexconjugate(ZEL33)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_664 = Coupling(name = 'GC_664',
	 value = '(1*complex(0,1)*g2*(UV51*complexconjugate(ZEL11) + UV52*complexconjugate(ZEL12) + UV53*complexconjugate(ZEL13)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_665 = Coupling(name = 'GC_665',
	 value = '(1*complex(0,1)*g2*(UV51*complexconjugate(ZEL21) + UV52*complexconjugate(ZEL22) + UV53*complexconjugate(ZEL23)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_666 = Coupling(name = 'GC_666',
	 value = '(1*complex(0,1)*g2*(UV51*complexconjugate(ZEL31) + UV52*complexconjugate(ZEL32) + UV53*complexconjugate(ZEL33)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_667 = Coupling(name = 'GC_667',
	 value = '(1*complex(0,1)*g2*(UV61*complexconjugate(ZEL11) + UV62*complexconjugate(ZEL12) + UV63*complexconjugate(ZEL13)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_668 = Coupling(name = 'GC_668',
	 value = '(1*complex(0,1)*g2*(UV61*complexconjugate(ZEL21) + UV62*complexconjugate(ZEL22) + UV63*complexconjugate(ZEL23)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_669 = Coupling(name = 'GC_669',
	 value = '(1*complex(0,1)*g2*(UV61*complexconjugate(ZEL31) + UV62*complexconjugate(ZEL32) + UV63*complexconjugate(ZEL33)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_670 = Coupling(name = 'GC_670',
	 value = '-1./2.*complex(0,1)*((g1 + 2*gYB)*cmath.cos(TW) + g2*cmath.sin(TW))', 
	 order = {'QED':1} ) 
 
GC_671 = Coupling(name = 'GC_671',
	 value = '-1*complex(0,1)*(g1 + gYB)*cmath.cos(TW)', 
	 order = {'QED':1} ) 
 
GC_672 = Coupling(name = 'GC_672',
	 value = '-1./2.*complex(0,1)*((g1 + 2*gYB)*cmath.cos(TW) + g2*cmath.sin(TW))', 
	 order = {'QED':1} ) 
 
GC_673 = Coupling(name = 'GC_673',
	 value = '-1*complex(0,1)*(g1 + gYB)*cmath.cos(TW)', 
	 order = {'QED':1} ) 
 
GC_674 = Coupling(name = 'GC_674',
	 value = '-1./2.*complex(0,1)*((g1 + 2*gYB)*cmath.cos(TW) + g2*cmath.sin(TW))', 
	 order = {'QED':1} ) 
 
GC_675 = Coupling(name = 'GC_675',
	 value = '-1*complex(0,1)*(g1 + gYB)*cmath.cos(TW)', 
	 order = {'QED':1} ) 
 
GC_676 = Coupling(name = 'GC_676',
	 value = '-1./2.*complex(0,1)*(g2*cmath.cos(TW)*cmath.cos(TWp) - (g1 + 2*gYB)*cmath.cos(TWp)*cmath.sin(TW) + (2*gBL + gBY)*cmath.sin(TWp))', 
	 order = {'QED':1} ) 
 
GC_677 = Coupling(name = 'GC_677',
	 value = '1*complex(0,1)*((g1 + gYB)*cmath.cos(TWp)*cmath.sin(TW) - (gBL + gBY)*cmath.sin(TWp))', 
	 order = {'QED':1} ) 
 
GC_678 = Coupling(name = 'GC_678',
	 value = '-1./2.*complex(0,1)*(g2*cmath.cos(TW)*cmath.cos(TWp) - (g1 + 2*gYB)*cmath.cos(TWp)*cmath.sin(TW) + (2*gBL + gBY)*cmath.sin(TWp))', 
	 order = {'QED':1} ) 
 
GC_679 = Coupling(name = 'GC_679',
	 value = '1*complex(0,1)*((g1 + gYB)*cmath.cos(TWp)*cmath.sin(TW) - (gBL + gBY)*cmath.sin(TWp))', 
	 order = {'QED':1} ) 
 
GC_680 = Coupling(name = 'GC_680',
	 value = '-1./2.*complex(0,1)*(g2*cmath.cos(TW)*cmath.cos(TWp) - (g1 + 2*gYB)*cmath.cos(TWp)*cmath.sin(TW) + (2*gBL + gBY)*cmath.sin(TWp))', 
	 order = {'QED':1} ) 
 
GC_681 = Coupling(name = 'GC_681',
	 value = '1*complex(0,1)*((g1 + gYB)*cmath.cos(TWp)*cmath.sin(TW) - (gBL + gBY)*cmath.sin(TWp))', 
	 order = {'QED':1} ) 
 
GC_682 = Coupling(name = 'GC_682',
	 value = '-1./2.*complex(0,1)*((2*gBL + gBY)*cmath.cos(TWp) + (-(g2*cmath.cos(TW)) + (g1 + 2*gYB)*cmath.sin(TW))*cmath.sin(TWp))', 
	 order = {'QED':1} ) 
 
GC_683 = Coupling(name = 'GC_683',
	 value = '-1*complex(0,1)*((gBL + gBY)*cmath.cos(TWp) + (g1 + gYB)*cmath.sin(TW)*cmath.sin(TWp))', 
	 order = {'QED':1} ) 
 
GC_684 = Coupling(name = 'GC_684',
	 value = '-1./2.*complex(0,1)*((2*gBL + gBY)*cmath.cos(TWp) + (-(g2*cmath.cos(TW)) + (g1 + 2*gYB)*cmath.sin(TW))*cmath.sin(TWp))', 
	 order = {'QED':1} ) 
 
GC_685 = Coupling(name = 'GC_685',
	 value = '-1*complex(0,1)*((gBL + gBY)*cmath.cos(TWp) + (g1 + gYB)*cmath.sin(TW)*cmath.sin(TWp))', 
	 order = {'QED':1} ) 
 
GC_686 = Coupling(name = 'GC_686',
	 value = '-1./2.*complex(0,1)*((2*gBL + gBY)*cmath.cos(TWp) + (-(g2*cmath.cos(TW)) + (g1 + 2*gYB)*cmath.sin(TW))*cmath.sin(TWp))', 
	 order = {'QED':1} ) 
 
GC_687 = Coupling(name = 'GC_687',
	 value = '-1*complex(0,1)*((gBL + gBY)*cmath.cos(TWp) + (g1 + gYB)*cmath.sin(TW)*cmath.sin(TWp))', 
	 order = {'QED':1} ) 
 
GC_688 = Coupling(name = 'GC_688',
	 value = '1*complex(0,1)*G', 
	 order = {'QCD':1} ) 
 
GC_689 = Coupling(name = 'GC_689',
	 value = '1*complex(0,1)*G', 
	 order = {'QCD':1} ) 
 
GC_690 = Coupling(name = 'GC_690',
	 value = '1*complex(0,1)*G', 
	 order = {'QCD':1} ) 
 
GC_691 = Coupling(name = 'GC_691',
	 value = '1*complex(0,1)*G', 
	 order = {'QCD':1} ) 
 
GC_692 = Coupling(name = 'GC_692',
	 value = '1*complex(0,1)*G', 
	 order = {'QCD':1} ) 
 
GC_693 = Coupling(name = 'GC_693',
	 value = '1*complex(0,1)*G', 
	 order = {'QCD':1} ) 
 
GC_694 = Coupling(name = 'GC_694',
	 value = '1./6.*complex(0,1)*((g1 + 2*gYB)*cmath.cos(TW) + 3*g2*cmath.sin(TW))', 
	 order = {'QED':1} ) 
 
GC_695 = Coupling(name = 'GC_695',
	 value = '1./3.*complex(0,1)*(2*g1 + gYB)*cmath.cos(TW)', 
	 order = {'QED':1} ) 
 
GC_696 = Coupling(name = 'GC_696',
	 value = '1./6.*complex(0,1)*((g1 + 2*gYB)*cmath.cos(TW) + 3*g2*cmath.sin(TW))', 
	 order = {'QED':1} ) 
 
GC_697 = Coupling(name = 'GC_697',
	 value = '1./3.*complex(0,1)*(2*g1 + gYB)*cmath.cos(TW)', 
	 order = {'QED':1} ) 
 
GC_698 = Coupling(name = 'GC_698',
	 value = '1./6.*complex(0,1)*((g1 + 2*gYB)*cmath.cos(TW) + 3*g2*cmath.sin(TW))', 
	 order = {'QED':1} ) 
 
GC_699 = Coupling(name = 'GC_699',
	 value = '1./3.*complex(0,1)*(2*g1 + gYB)*cmath.cos(TW)', 
	 order = {'QED':1} ) 
 
GC_700 = Coupling(name = 'GC_700',
	 value = '(1*complex(0,1)*g2*(ZDL11*complexconjugate(ZUL11) + ZDL12*complexconjugate(ZUL12) + ZDL13*complexconjugate(ZUL13)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_701 = Coupling(name = 'GC_701',
	 value = '(1*complex(0,1)*g2*(ZDL11*complexconjugate(ZUL21) + ZDL12*complexconjugate(ZUL22) + ZDL13*complexconjugate(ZUL23)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_702 = Coupling(name = 'GC_702',
	 value = '(1*complex(0,1)*g2*(ZDL11*complexconjugate(ZUL31) + ZDL12*complexconjugate(ZUL32) + ZDL13*complexconjugate(ZUL33)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_703 = Coupling(name = 'GC_703',
	 value = '(1*complex(0,1)*g2*(ZDL21*complexconjugate(ZUL11) + ZDL22*complexconjugate(ZUL12) + ZDL23*complexconjugate(ZUL13)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_704 = Coupling(name = 'GC_704',
	 value = '(1*complex(0,1)*g2*(ZDL21*complexconjugate(ZUL21) + ZDL22*complexconjugate(ZUL22) + ZDL23*complexconjugate(ZUL23)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_705 = Coupling(name = 'GC_705',
	 value = '(1*complex(0,1)*g2*(ZDL21*complexconjugate(ZUL31) + ZDL22*complexconjugate(ZUL32) + ZDL23*complexconjugate(ZUL33)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_706 = Coupling(name = 'GC_706',
	 value = '(1*complex(0,1)*g2*(ZDL31*complexconjugate(ZUL11) + ZDL32*complexconjugate(ZUL12) + ZDL33*complexconjugate(ZUL13)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_707 = Coupling(name = 'GC_707',
	 value = '(1*complex(0,1)*g2*(ZDL31*complexconjugate(ZUL21) + ZDL32*complexconjugate(ZUL22) + ZDL33*complexconjugate(ZUL23)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_708 = Coupling(name = 'GC_708',
	 value = '(1*complex(0,1)*g2*(ZDL31*complexconjugate(ZUL31) + ZDL32*complexconjugate(ZUL32) + ZDL33*complexconjugate(ZUL33)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_709 = Coupling(name = 'GC_709',
	 value = '1./6.*complex(0,1)*(3*g2*cmath.cos(TW)*cmath.cos(TWp) - (g1 + 2*gYB)*cmath.cos(TWp)*cmath.sin(TW) + (2*gBL + gBY)*cmath.sin(TWp))', 
	 order = {'QED':1} ) 
 
GC_710 = Coupling(name = 'GC_710',
	 value = '-1./3.*complex(0,1)*((2*g1 + gYB)*cmath.cos(TWp)*cmath.sin(TW) - (gBL + 2*gBY)*cmath.sin(TWp))', 
	 order = {'QED':1} ) 
 
GC_711 = Coupling(name = 'GC_711',
	 value = '1./6.*complex(0,1)*(3*g2*cmath.cos(TW)*cmath.cos(TWp) - (g1 + 2*gYB)*cmath.cos(TWp)*cmath.sin(TW) + (2*gBL + gBY)*cmath.sin(TWp))', 
	 order = {'QED':1} ) 
 
GC_712 = Coupling(name = 'GC_712',
	 value = '-1./3.*complex(0,1)*((2*g1 + gYB)*cmath.cos(TWp)*cmath.sin(TW) - (gBL + 2*gBY)*cmath.sin(TWp))', 
	 order = {'QED':1} ) 
 
GC_713 = Coupling(name = 'GC_713',
	 value = '1./6.*complex(0,1)*(3*g2*cmath.cos(TW)*cmath.cos(TWp) - (g1 + 2*gYB)*cmath.cos(TWp)*cmath.sin(TW) + (2*gBL + gBY)*cmath.sin(TWp))', 
	 order = {'QED':1} ) 
 
GC_714 = Coupling(name = 'GC_714',
	 value = '-1./3.*complex(0,1)*((2*g1 + gYB)*cmath.cos(TWp)*cmath.sin(TW) - (gBL + 2*gBY)*cmath.sin(TWp))', 
	 order = {'QED':1} ) 
 
GC_715 = Coupling(name = 'GC_715',
	 value = '1./6.*complex(0,1)*((2*gBL + gBY)*cmath.cos(TWp) + (-3*g2*cmath.cos(TW) + (g1 + 2*gYB)*cmath.sin(TW))*cmath.sin(TWp))', 
	 order = {'QED':1} ) 
 
GC_716 = Coupling(name = 'GC_716',
	 value = '1./3.*complex(0,1)*((gBL + 2*gBY)*cmath.cos(TWp) + (2*g1 + gYB)*cmath.sin(TW)*cmath.sin(TWp))', 
	 order = {'QED':1} ) 
 
GC_717 = Coupling(name = 'GC_717',
	 value = '1./6.*complex(0,1)*((2*gBL + gBY)*cmath.cos(TWp) + (-3*g2*cmath.cos(TW) + (g1 + 2*gYB)*cmath.sin(TW))*cmath.sin(TWp))', 
	 order = {'QED':1} ) 
 
GC_718 = Coupling(name = 'GC_718',
	 value = '1./3.*complex(0,1)*((gBL + 2*gBY)*cmath.cos(TWp) + (2*g1 + gYB)*cmath.sin(TW)*cmath.sin(TWp))', 
	 order = {'QED':1} ) 
 
GC_719 = Coupling(name = 'GC_719',
	 value = '1./6.*complex(0,1)*((2*gBL + gBY)*cmath.cos(TWp) + (-3*g2*cmath.cos(TW) + (g1 + 2*gYB)*cmath.sin(TW))*cmath.sin(TWp))', 
	 order = {'QED':1} ) 
 
GC_720 = Coupling(name = 'GC_720',
	 value = '1./3.*complex(0,1)*((gBL + 2*gBY)*cmath.cos(TWp) + (2*g1 + gYB)*cmath.sin(TW)*cmath.sin(TWp))', 
	 order = {'QED':1} ) 
 
GC_721 = Coupling(name = 'GC_721',
	 value = '-1./2.*complex(0,1)*(-2*gYB*(UV14*complexconjugate(UV14) + UV15*complexconjugate(UV15) + UV16*complexconjugate(UV16))*cmath.cos(TW) + (UV11*complexconjugate(UV11) + UV12*complexconjugate(UV12) + UV13*complexconjugate(UV13))*((g1 + 2*gYB)*cmath.cos(TW) - g2*cmath.sin(TW)))', 
	 order = {'QED':1} ) 
 
GC_722 = Coupling(name = 'GC_722',
	 value = '1./2.*complex(0,1)*(-2*gYB*(UV14*complexconjugate(UV14) + UV15*complexconjugate(UV15) + UV16*complexconjugate(UV16))*cmath.cos(TW) + (UV11*complexconjugate(UV11) + UV12*complexconjugate(UV12) + UV13*complexconjugate(UV13))*((g1 + 2*gYB)*cmath.cos(TW) - g2*cmath.sin(TW)))', 
	 order = {'QED':1} ) 
 
GC_723 = Coupling(name = 'GC_723',
	 value = '-1./2.*complex(0,1)*(-2*gYB*(UV14*complexconjugate(UV24) + UV15*complexconjugate(UV25) + UV16*complexconjugate(UV26))*cmath.cos(TW) + (UV11*complexconjugate(UV21) + UV12*complexconjugate(UV22) + UV13*complexconjugate(UV23))*((g1 + 2*gYB)*cmath.cos(TW) - g2*cmath.sin(TW)))', 
	 order = {'QED':1} ) 
 
GC_724 = Coupling(name = 'GC_724',
	 value = '1./2.*complex(0,1)*(-2*gYB*(UV24*complexconjugate(UV14) + UV25*complexconjugate(UV15) + UV26*complexconjugate(UV16))*cmath.cos(TW) + (UV21*complexconjugate(UV11) + UV22*complexconjugate(UV12) + UV23*complexconjugate(UV13))*((g1 + 2*gYB)*cmath.cos(TW) - g2*cmath.sin(TW)))', 
	 order = {'QED':1} ) 
 
GC_725 = Coupling(name = 'GC_725',
	 value = '-1./2.*complex(0,1)*(-2*gYB*(UV14*complexconjugate(UV34) + UV15*complexconjugate(UV35) + UV16*complexconjugate(UV36))*cmath.cos(TW) + (UV11*complexconjugate(UV31) + UV12*complexconjugate(UV32) + UV13*complexconjugate(UV33))*((g1 + 2*gYB)*cmath.cos(TW) - g2*cmath.sin(TW)))', 
	 order = {'QED':1} ) 
 
GC_726 = Coupling(name = 'GC_726',
	 value = '1./2.*complex(0,1)*(-2*gYB*(UV34*complexconjugate(UV14) + UV35*complexconjugate(UV15) + UV36*complexconjugate(UV16))*cmath.cos(TW) + (UV31*complexconjugate(UV11) + UV32*complexconjugate(UV12) + UV33*complexconjugate(UV13))*((g1 + 2*gYB)*cmath.cos(TW) - g2*cmath.sin(TW)))', 
	 order = {'QED':1} ) 
 
GC_727 = Coupling(name = 'GC_727',
	 value = '-1./2.*complex(0,1)*(-2*gYB*(UV14*complexconjugate(UV44) + UV15*complexconjugate(UV45) + UV16*complexconjugate(UV46))*cmath.cos(TW) + (UV11*complexconjugate(UV41) + UV12*complexconjugate(UV42) + UV13*complexconjugate(UV43))*((g1 + 2*gYB)*cmath.cos(TW) - g2*cmath.sin(TW)))', 
	 order = {'QED':1} ) 
 
GC_728 = Coupling(name = 'GC_728',
	 value = '1./2.*complex(0,1)*(-2*gYB*(UV44*complexconjugate(UV14) + UV45*complexconjugate(UV15) + UV46*complexconjugate(UV16))*cmath.cos(TW) + (UV41*complexconjugate(UV11) + UV42*complexconjugate(UV12) + UV43*complexconjugate(UV13))*((g1 + 2*gYB)*cmath.cos(TW) - g2*cmath.sin(TW)))', 
	 order = {'QED':1} ) 
 
GC_729 = Coupling(name = 'GC_729',
	 value = '-1./2.*complex(0,1)*(-2*gYB*(UV14*complexconjugate(UV54) + UV15*complexconjugate(UV55) + UV16*complexconjugate(UV56))*cmath.cos(TW) + (UV11*complexconjugate(UV51) + UV12*complexconjugate(UV52) + UV13*complexconjugate(UV53))*((g1 + 2*gYB)*cmath.cos(TW) - g2*cmath.sin(TW)))', 
	 order = {'QED':1} ) 
 
GC_730 = Coupling(name = 'GC_730',
	 value = '1./2.*complex(0,1)*(-2*gYB*(UV54*complexconjugate(UV14) + UV55*complexconjugate(UV15) + UV56*complexconjugate(UV16))*cmath.cos(TW) + (UV51*complexconjugate(UV11) + UV52*complexconjugate(UV12) + UV53*complexconjugate(UV13))*((g1 + 2*gYB)*cmath.cos(TW) - g2*cmath.sin(TW)))', 
	 order = {'QED':1} ) 
 
GC_731 = Coupling(name = 'GC_731',
	 value = '-1./2.*complex(0,1)*(-2*gYB*(UV14*complexconjugate(UV64) + UV15*complexconjugate(UV65) + UV16*complexconjugate(UV66))*cmath.cos(TW) + (UV11*complexconjugate(UV61) + UV12*complexconjugate(UV62) + UV13*complexconjugate(UV63))*((g1 + 2*gYB)*cmath.cos(TW) - g2*cmath.sin(TW)))', 
	 order = {'QED':1} ) 
 
GC_732 = Coupling(name = 'GC_732',
	 value = '1./2.*complex(0,1)*(-2*gYB*(UV64*complexconjugate(UV14) + UV65*complexconjugate(UV15) + UV66*complexconjugate(UV16))*cmath.cos(TW) + (UV61*complexconjugate(UV11) + UV62*complexconjugate(UV12) + UV63*complexconjugate(UV13))*((g1 + 2*gYB)*cmath.cos(TW) - g2*cmath.sin(TW)))', 
	 order = {'QED':1} ) 
 
GC_733 = Coupling(name = 'GC_733',
	 value = '-1./2.*complex(0,1)*(-2*gYB*(UV24*complexconjugate(UV24) + UV25*complexconjugate(UV25) + UV26*complexconjugate(UV26))*cmath.cos(TW) + (UV21*complexconjugate(UV21) + UV22*complexconjugate(UV22) + UV23*complexconjugate(UV23))*((g1 + 2*gYB)*cmath.cos(TW) - g2*cmath.sin(TW)))', 
	 order = {'QED':1} ) 
 
GC_734 = Coupling(name = 'GC_734',
	 value = '1./2.*complex(0,1)*(-2*gYB*(UV24*complexconjugate(UV24) + UV25*complexconjugate(UV25) + UV26*complexconjugate(UV26))*cmath.cos(TW) + (UV21*complexconjugate(UV21) + UV22*complexconjugate(UV22) + UV23*complexconjugate(UV23))*((g1 + 2*gYB)*cmath.cos(TW) - g2*cmath.sin(TW)))', 
	 order = {'QED':1} ) 
 
GC_735 = Coupling(name = 'GC_735',
	 value = '-1./2.*complex(0,1)*(-2*gYB*(UV24*complexconjugate(UV34) + UV25*complexconjugate(UV35) + UV26*complexconjugate(UV36))*cmath.cos(TW) + (UV21*complexconjugate(UV31) + UV22*complexconjugate(UV32) + UV23*complexconjugate(UV33))*((g1 + 2*gYB)*cmath.cos(TW) - g2*cmath.sin(TW)))', 
	 order = {'QED':1} ) 
 
GC_736 = Coupling(name = 'GC_736',
	 value = '1./2.*complex(0,1)*(-2*gYB*(UV34*complexconjugate(UV24) + UV35*complexconjugate(UV25) + UV36*complexconjugate(UV26))*cmath.cos(TW) + (UV31*complexconjugate(UV21) + UV32*complexconjugate(UV22) + UV33*complexconjugate(UV23))*((g1 + 2*gYB)*cmath.cos(TW) - g2*cmath.sin(TW)))', 
	 order = {'QED':1} ) 
 
GC_737 = Coupling(name = 'GC_737',
	 value = '-1./2.*complex(0,1)*(-2*gYB*(UV24*complexconjugate(UV44) + UV25*complexconjugate(UV45) + UV26*complexconjugate(UV46))*cmath.cos(TW) + (UV21*complexconjugate(UV41) + UV22*complexconjugate(UV42) + UV23*complexconjugate(UV43))*((g1 + 2*gYB)*cmath.cos(TW) - g2*cmath.sin(TW)))', 
	 order = {'QED':1} ) 
 
GC_738 = Coupling(name = 'GC_738',
	 value = '1./2.*complex(0,1)*(-2*gYB*(UV44*complexconjugate(UV24) + UV45*complexconjugate(UV25) + UV46*complexconjugate(UV26))*cmath.cos(TW) + (UV41*complexconjugate(UV21) + UV42*complexconjugate(UV22) + UV43*complexconjugate(UV23))*((g1 + 2*gYB)*cmath.cos(TW) - g2*cmath.sin(TW)))', 
	 order = {'QED':1} ) 
 
GC_739 = Coupling(name = 'GC_739',
	 value = '-1./2.*complex(0,1)*(-2*gYB*(UV24*complexconjugate(UV54) + UV25*complexconjugate(UV55) + UV26*complexconjugate(UV56))*cmath.cos(TW) + (UV21*complexconjugate(UV51) + UV22*complexconjugate(UV52) + UV23*complexconjugate(UV53))*((g1 + 2*gYB)*cmath.cos(TW) - g2*cmath.sin(TW)))', 
	 order = {'QED':1} ) 
 
GC_740 = Coupling(name = 'GC_740',
	 value = '1./2.*complex(0,1)*(-2*gYB*(UV54*complexconjugate(UV24) + UV55*complexconjugate(UV25) + UV56*complexconjugate(UV26))*cmath.cos(TW) + (UV51*complexconjugate(UV21) + UV52*complexconjugate(UV22) + UV53*complexconjugate(UV23))*((g1 + 2*gYB)*cmath.cos(TW) - g2*cmath.sin(TW)))', 
	 order = {'QED':1} ) 
 
GC_741 = Coupling(name = 'GC_741',
	 value = '-1./2.*complex(0,1)*(-2*gYB*(UV24*complexconjugate(UV64) + UV25*complexconjugate(UV65) + UV26*complexconjugate(UV66))*cmath.cos(TW) + (UV21*complexconjugate(UV61) + UV22*complexconjugate(UV62) + UV23*complexconjugate(UV63))*((g1 + 2*gYB)*cmath.cos(TW) - g2*cmath.sin(TW)))', 
	 order = {'QED':1} ) 
 
GC_742 = Coupling(name = 'GC_742',
	 value = '1./2.*complex(0,1)*(-2*gYB*(UV64*complexconjugate(UV24) + UV65*complexconjugate(UV25) + UV66*complexconjugate(UV26))*cmath.cos(TW) + (UV61*complexconjugate(UV21) + UV62*complexconjugate(UV22) + UV63*complexconjugate(UV23))*((g1 + 2*gYB)*cmath.cos(TW) - g2*cmath.sin(TW)))', 
	 order = {'QED':1} ) 
 
GC_743 = Coupling(name = 'GC_743',
	 value = '-1./2.*complex(0,1)*(-2*gYB*(UV34*complexconjugate(UV34) + UV35*complexconjugate(UV35) + UV36*complexconjugate(UV36))*cmath.cos(TW) + (UV31*complexconjugate(UV31) + UV32*complexconjugate(UV32) + UV33*complexconjugate(UV33))*((g1 + 2*gYB)*cmath.cos(TW) - g2*cmath.sin(TW)))', 
	 order = {'QED':1} ) 
 
GC_744 = Coupling(name = 'GC_744',
	 value = '1./2.*complex(0,1)*(-2*gYB*(UV34*complexconjugate(UV34) + UV35*complexconjugate(UV35) + UV36*complexconjugate(UV36))*cmath.cos(TW) + (UV31*complexconjugate(UV31) + UV32*complexconjugate(UV32) + UV33*complexconjugate(UV33))*((g1 + 2*gYB)*cmath.cos(TW) - g2*cmath.sin(TW)))', 
	 order = {'QED':1} ) 
 
GC_745 = Coupling(name = 'GC_745',
	 value = '-1./2.*complex(0,1)*(-2*gYB*(UV34*complexconjugate(UV44) + UV35*complexconjugate(UV45) + UV36*complexconjugate(UV46))*cmath.cos(TW) + (UV31*complexconjugate(UV41) + UV32*complexconjugate(UV42) + UV33*complexconjugate(UV43))*((g1 + 2*gYB)*cmath.cos(TW) - g2*cmath.sin(TW)))', 
	 order = {'QED':1} ) 
 
GC_746 = Coupling(name = 'GC_746',
	 value = '1./2.*complex(0,1)*(-2*gYB*(UV44*complexconjugate(UV34) + UV45*complexconjugate(UV35) + UV46*complexconjugate(UV36))*cmath.cos(TW) + (UV41*complexconjugate(UV31) + UV42*complexconjugate(UV32) + UV43*complexconjugate(UV33))*((g1 + 2*gYB)*cmath.cos(TW) - g2*cmath.sin(TW)))', 
	 order = {'QED':1} ) 
 
GC_747 = Coupling(name = 'GC_747',
	 value = '-1./2.*complex(0,1)*(-2*gYB*(UV34*complexconjugate(UV54) + UV35*complexconjugate(UV55) + UV36*complexconjugate(UV56))*cmath.cos(TW) + (UV31*complexconjugate(UV51) + UV32*complexconjugate(UV52) + UV33*complexconjugate(UV53))*((g1 + 2*gYB)*cmath.cos(TW) - g2*cmath.sin(TW)))', 
	 order = {'QED':1} ) 
 
GC_748 = Coupling(name = 'GC_748',
	 value = '1./2.*complex(0,1)*(-2*gYB*(UV54*complexconjugate(UV34) + UV55*complexconjugate(UV35) + UV56*complexconjugate(UV36))*cmath.cos(TW) + (UV51*complexconjugate(UV31) + UV52*complexconjugate(UV32) + UV53*complexconjugate(UV33))*((g1 + 2*gYB)*cmath.cos(TW) - g2*cmath.sin(TW)))', 
	 order = {'QED':1} ) 
 
GC_749 = Coupling(name = 'GC_749',
	 value = '-1./2.*complex(0,1)*(-2*gYB*(UV34*complexconjugate(UV64) + UV35*complexconjugate(UV65) + UV36*complexconjugate(UV66))*cmath.cos(TW) + (UV31*complexconjugate(UV61) + UV32*complexconjugate(UV62) + UV33*complexconjugate(UV63))*((g1 + 2*gYB)*cmath.cos(TW) - g2*cmath.sin(TW)))', 
	 order = {'QED':1} ) 
 
GC_750 = Coupling(name = 'GC_750',
	 value = '1./2.*complex(0,1)*(-2*gYB*(UV64*complexconjugate(UV34) + UV65*complexconjugate(UV35) + UV66*complexconjugate(UV36))*cmath.cos(TW) + (UV61*complexconjugate(UV31) + UV62*complexconjugate(UV32) + UV63*complexconjugate(UV33))*((g1 + 2*gYB)*cmath.cos(TW) - g2*cmath.sin(TW)))', 
	 order = {'QED':1} ) 
 
GC_751 = Coupling(name = 'GC_751',
	 value = '-1./2.*complex(0,1)*(-2*gYB*(UV44*complexconjugate(UV44) + UV45*complexconjugate(UV45) + UV46*complexconjugate(UV46))*cmath.cos(TW) + (UV41*complexconjugate(UV41) + UV42*complexconjugate(UV42) + UV43*complexconjugate(UV43))*((g1 + 2*gYB)*cmath.cos(TW) - g2*cmath.sin(TW)))', 
	 order = {'QED':1} ) 
 
GC_752 = Coupling(name = 'GC_752',
	 value = '1./2.*complex(0,1)*(-2*gYB*(UV44*complexconjugate(UV44) + UV45*complexconjugate(UV45) + UV46*complexconjugate(UV46))*cmath.cos(TW) + (UV41*complexconjugate(UV41) + UV42*complexconjugate(UV42) + UV43*complexconjugate(UV43))*((g1 + 2*gYB)*cmath.cos(TW) - g2*cmath.sin(TW)))', 
	 order = {'QED':1} ) 
 
GC_753 = Coupling(name = 'GC_753',
	 value = '-1./2.*complex(0,1)*(-2*gYB*(UV44*complexconjugate(UV54) + UV45*complexconjugate(UV55) + UV46*complexconjugate(UV56))*cmath.cos(TW) + (UV41*complexconjugate(UV51) + UV42*complexconjugate(UV52) + UV43*complexconjugate(UV53))*((g1 + 2*gYB)*cmath.cos(TW) - g2*cmath.sin(TW)))', 
	 order = {'QED':1} ) 
 
GC_754 = Coupling(name = 'GC_754',
	 value = '1./2.*complex(0,1)*(-2*gYB*(UV54*complexconjugate(UV44) + UV55*complexconjugate(UV45) + UV56*complexconjugate(UV46))*cmath.cos(TW) + (UV51*complexconjugate(UV41) + UV52*complexconjugate(UV42) + UV53*complexconjugate(UV43))*((g1 + 2*gYB)*cmath.cos(TW) - g2*cmath.sin(TW)))', 
	 order = {'QED':1} ) 
 
GC_755 = Coupling(name = 'GC_755',
	 value = '-1./2.*complex(0,1)*(-2*gYB*(UV44*complexconjugate(UV64) + UV45*complexconjugate(UV65) + UV46*complexconjugate(UV66))*cmath.cos(TW) + (UV41*complexconjugate(UV61) + UV42*complexconjugate(UV62) + UV43*complexconjugate(UV63))*((g1 + 2*gYB)*cmath.cos(TW) - g2*cmath.sin(TW)))', 
	 order = {'QED':1} ) 
 
GC_756 = Coupling(name = 'GC_756',
	 value = '1./2.*complex(0,1)*(-2*gYB*(UV64*complexconjugate(UV44) + UV65*complexconjugate(UV45) + UV66*complexconjugate(UV46))*cmath.cos(TW) + (UV61*complexconjugate(UV41) + UV62*complexconjugate(UV42) + UV63*complexconjugate(UV43))*((g1 + 2*gYB)*cmath.cos(TW) - g2*cmath.sin(TW)))', 
	 order = {'QED':1} ) 
 
GC_757 = Coupling(name = 'GC_757',
	 value = '-1./2.*complex(0,1)*(-2*gYB*(UV54*complexconjugate(UV54) + UV55*complexconjugate(UV55) + UV56*complexconjugate(UV56))*cmath.cos(TW) + (UV51*complexconjugate(UV51) + UV52*complexconjugate(UV52) + UV53*complexconjugate(UV53))*((g1 + 2*gYB)*cmath.cos(TW) - g2*cmath.sin(TW)))', 
	 order = {'QED':1} ) 
 
GC_758 = Coupling(name = 'GC_758',
	 value = '1./2.*complex(0,1)*(-2*gYB*(UV54*complexconjugate(UV54) + UV55*complexconjugate(UV55) + UV56*complexconjugate(UV56))*cmath.cos(TW) + (UV51*complexconjugate(UV51) + UV52*complexconjugate(UV52) + UV53*complexconjugate(UV53))*((g1 + 2*gYB)*cmath.cos(TW) - g2*cmath.sin(TW)))', 
	 order = {'QED':1} ) 
 
GC_759 = Coupling(name = 'GC_759',
	 value = '-1./2.*complex(0,1)*(-2*gYB*(UV54*complexconjugate(UV64) + UV55*complexconjugate(UV65) + UV56*complexconjugate(UV66))*cmath.cos(TW) + (UV51*complexconjugate(UV61) + UV52*complexconjugate(UV62) + UV53*complexconjugate(UV63))*((g1 + 2*gYB)*cmath.cos(TW) - g2*cmath.sin(TW)))', 
	 order = {'QED':1} ) 
 
GC_760 = Coupling(name = 'GC_760',
	 value = '1./2.*complex(0,1)*(-2*gYB*(UV64*complexconjugate(UV54) + UV65*complexconjugate(UV55) + UV66*complexconjugate(UV56))*cmath.cos(TW) + (UV61*complexconjugate(UV51) + UV62*complexconjugate(UV52) + UV63*complexconjugate(UV53))*((g1 + 2*gYB)*cmath.cos(TW) - g2*cmath.sin(TW)))', 
	 order = {'QED':1} ) 
 
GC_761 = Coupling(name = 'GC_761',
	 value = '-1./2.*complex(0,1)*(-2*gYB*(UV64*complexconjugate(UV64) + UV65*complexconjugate(UV65) + UV66*complexconjugate(UV66))*cmath.cos(TW) + (UV61*complexconjugate(UV61) + UV62*complexconjugate(UV62) + UV63*complexconjugate(UV63))*((g1 + 2*gYB)*cmath.cos(TW) - g2*cmath.sin(TW)))', 
	 order = {'QED':1} ) 
 
GC_762 = Coupling(name = 'GC_762',
	 value = '1./2.*complex(0,1)*(-2*gYB*(UV64*complexconjugate(UV64) + UV65*complexconjugate(UV65) + UV66*complexconjugate(UV66))*cmath.cos(TW) + (UV61*complexconjugate(UV61) + UV62*complexconjugate(UV62) + UV63*complexconjugate(UV63))*((g1 + 2*gYB)*cmath.cos(TW) - g2*cmath.sin(TW)))', 
	 order = {'QED':1} ) 
 
GC_763 = Coupling(name = 'GC_763',
	 value = '1./2.*complex(0,1)*(2*(UV14*complexconjugate(UV14) + UV15*complexconjugate(UV15) + UV16*complexconjugate(UV16))*(-(gYB*cmath.cos(TWp)*cmath.sin(TW)) + gBL*cmath.sin(TWp)) + (UV11*complexconjugate(UV11) + UV12*complexconjugate(UV12) + UV13*complexconjugate(UV13))*(g2*cmath.cos(TW)*cmath.cos(TWp) + (g1 + 2*gYB)*cmath.cos(TWp)*cmath.sin(TW) - (2*gBL + gBY)*cmath.sin(TWp)))', 
	 order = {'QED':1} ) 
 
GC_764 = Coupling(name = 'GC_764',
	 value = '-1./2.*complex(0,1)*(2*(UV14*complexconjugate(UV14) + UV15*complexconjugate(UV15) + UV16*complexconjugate(UV16))*(-(gYB*cmath.cos(TWp)*cmath.sin(TW)) + gBL*cmath.sin(TWp)) + (UV11*complexconjugate(UV11) + UV12*complexconjugate(UV12) + UV13*complexconjugate(UV13))*(g2*cmath.cos(TW)*cmath.cos(TWp) + (g1 + 2*gYB)*cmath.cos(TWp)*cmath.sin(TW) - (2*gBL + gBY)*cmath.sin(TWp)))', 
	 order = {'QED':1} ) 
 
GC_765 = Coupling(name = 'GC_765',
	 value = '1./2.*complex(0,1)*(2*(UV14*complexconjugate(UV24) + UV15*complexconjugate(UV25) + UV16*complexconjugate(UV26))*(-(gYB*cmath.cos(TWp)*cmath.sin(TW)) + gBL*cmath.sin(TWp)) + (UV11*complexconjugate(UV21) + UV12*complexconjugate(UV22) + UV13*complexconjugate(UV23))*(g2*cmath.cos(TW)*cmath.cos(TWp) + (g1 + 2*gYB)*cmath.cos(TWp)*cmath.sin(TW) - (2*gBL + gBY)*cmath.sin(TWp)))', 
	 order = {'QED':1} ) 
 
GC_766 = Coupling(name = 'GC_766',
	 value = '-1./2.*complex(0,1)*(2*(UV24*complexconjugate(UV14) + UV25*complexconjugate(UV15) + UV26*complexconjugate(UV16))*(-(gYB*cmath.cos(TWp)*cmath.sin(TW)) + gBL*cmath.sin(TWp)) + (UV21*complexconjugate(UV11) + UV22*complexconjugate(UV12) + UV23*complexconjugate(UV13))*(g2*cmath.cos(TW)*cmath.cos(TWp) + (g1 + 2*gYB)*cmath.cos(TWp)*cmath.sin(TW) - (2*gBL + gBY)*cmath.sin(TWp)))', 
	 order = {'QED':1} ) 
 
GC_767 = Coupling(name = 'GC_767',
	 value = '1./2.*complex(0,1)*(2*(UV14*complexconjugate(UV34) + UV15*complexconjugate(UV35) + UV16*complexconjugate(UV36))*(-(gYB*cmath.cos(TWp)*cmath.sin(TW)) + gBL*cmath.sin(TWp)) + (UV11*complexconjugate(UV31) + UV12*complexconjugate(UV32) + UV13*complexconjugate(UV33))*(g2*cmath.cos(TW)*cmath.cos(TWp) + (g1 + 2*gYB)*cmath.cos(TWp)*cmath.sin(TW) - (2*gBL + gBY)*cmath.sin(TWp)))', 
	 order = {'QED':1} ) 
 
GC_768 = Coupling(name = 'GC_768',
	 value = '-1./2.*complex(0,1)*(2*(UV34*complexconjugate(UV14) + UV35*complexconjugate(UV15) + UV36*complexconjugate(UV16))*(-(gYB*cmath.cos(TWp)*cmath.sin(TW)) + gBL*cmath.sin(TWp)) + (UV31*complexconjugate(UV11) + UV32*complexconjugate(UV12) + UV33*complexconjugate(UV13))*(g2*cmath.cos(TW)*cmath.cos(TWp) + (g1 + 2*gYB)*cmath.cos(TWp)*cmath.sin(TW) - (2*gBL + gBY)*cmath.sin(TWp)))', 
	 order = {'QED':1} ) 
 
GC_769 = Coupling(name = 'GC_769',
	 value = '1./2.*complex(0,1)*(2*(UV14*complexconjugate(UV44) + UV15*complexconjugate(UV45) + UV16*complexconjugate(UV46))*(-(gYB*cmath.cos(TWp)*cmath.sin(TW)) + gBL*cmath.sin(TWp)) + (UV11*complexconjugate(UV41) + UV12*complexconjugate(UV42) + UV13*complexconjugate(UV43))*(g2*cmath.cos(TW)*cmath.cos(TWp) + (g1 + 2*gYB)*cmath.cos(TWp)*cmath.sin(TW) - (2*gBL + gBY)*cmath.sin(TWp)))', 
	 order = {'QED':1} ) 
 
GC_770 = Coupling(name = 'GC_770',
	 value = '-1./2.*complex(0,1)*(2*(UV44*complexconjugate(UV14) + UV45*complexconjugate(UV15) + UV46*complexconjugate(UV16))*(-(gYB*cmath.cos(TWp)*cmath.sin(TW)) + gBL*cmath.sin(TWp)) + (UV41*complexconjugate(UV11) + UV42*complexconjugate(UV12) + UV43*complexconjugate(UV13))*(g2*cmath.cos(TW)*cmath.cos(TWp) + (g1 + 2*gYB)*cmath.cos(TWp)*cmath.sin(TW) - (2*gBL + gBY)*cmath.sin(TWp)))', 
	 order = {'QED':1} ) 
 
GC_771 = Coupling(name = 'GC_771',
	 value = '1./2.*complex(0,1)*(2*(UV14*complexconjugate(UV54) + UV15*complexconjugate(UV55) + UV16*complexconjugate(UV56))*(-(gYB*cmath.cos(TWp)*cmath.sin(TW)) + gBL*cmath.sin(TWp)) + (UV11*complexconjugate(UV51) + UV12*complexconjugate(UV52) + UV13*complexconjugate(UV53))*(g2*cmath.cos(TW)*cmath.cos(TWp) + (g1 + 2*gYB)*cmath.cos(TWp)*cmath.sin(TW) - (2*gBL + gBY)*cmath.sin(TWp)))', 
	 order = {'QED':1} ) 
 
GC_772 = Coupling(name = 'GC_772',
	 value = '-1./2.*complex(0,1)*(2*(UV54*complexconjugate(UV14) + UV55*complexconjugate(UV15) + UV56*complexconjugate(UV16))*(-(gYB*cmath.cos(TWp)*cmath.sin(TW)) + gBL*cmath.sin(TWp)) + (UV51*complexconjugate(UV11) + UV52*complexconjugate(UV12) + UV53*complexconjugate(UV13))*(g2*cmath.cos(TW)*cmath.cos(TWp) + (g1 + 2*gYB)*cmath.cos(TWp)*cmath.sin(TW) - (2*gBL + gBY)*cmath.sin(TWp)))', 
	 order = {'QED':1} ) 
 
GC_773 = Coupling(name = 'GC_773',
	 value = '1./2.*complex(0,1)*(2*(UV14*complexconjugate(UV64) + UV15*complexconjugate(UV65) + UV16*complexconjugate(UV66))*(-(gYB*cmath.cos(TWp)*cmath.sin(TW)) + gBL*cmath.sin(TWp)) + (UV11*complexconjugate(UV61) + UV12*complexconjugate(UV62) + UV13*complexconjugate(UV63))*(g2*cmath.cos(TW)*cmath.cos(TWp) + (g1 + 2*gYB)*cmath.cos(TWp)*cmath.sin(TW) - (2*gBL + gBY)*cmath.sin(TWp)))', 
	 order = {'QED':1} ) 
 
GC_774 = Coupling(name = 'GC_774',
	 value = '-1./2.*complex(0,1)*(2*(UV64*complexconjugate(UV14) + UV65*complexconjugate(UV15) + UV66*complexconjugate(UV16))*(-(gYB*cmath.cos(TWp)*cmath.sin(TW)) + gBL*cmath.sin(TWp)) + (UV61*complexconjugate(UV11) + UV62*complexconjugate(UV12) + UV63*complexconjugate(UV13))*(g2*cmath.cos(TW)*cmath.cos(TWp) + (g1 + 2*gYB)*cmath.cos(TWp)*cmath.sin(TW) - (2*gBL + gBY)*cmath.sin(TWp)))', 
	 order = {'QED':1} ) 
 
GC_775 = Coupling(name = 'GC_775',
	 value = '1./2.*complex(0,1)*(2*(UV24*complexconjugate(UV24) + UV25*complexconjugate(UV25) + UV26*complexconjugate(UV26))*(-(gYB*cmath.cos(TWp)*cmath.sin(TW)) + gBL*cmath.sin(TWp)) + (UV21*complexconjugate(UV21) + UV22*complexconjugate(UV22) + UV23*complexconjugate(UV23))*(g2*cmath.cos(TW)*cmath.cos(TWp) + (g1 + 2*gYB)*cmath.cos(TWp)*cmath.sin(TW) - (2*gBL + gBY)*cmath.sin(TWp)))', 
	 order = {'QED':1} ) 
 
GC_776 = Coupling(name = 'GC_776',
	 value = '-1./2.*complex(0,1)*(2*(UV24*complexconjugate(UV24) + UV25*complexconjugate(UV25) + UV26*complexconjugate(UV26))*(-(gYB*cmath.cos(TWp)*cmath.sin(TW)) + gBL*cmath.sin(TWp)) + (UV21*complexconjugate(UV21) + UV22*complexconjugate(UV22) + UV23*complexconjugate(UV23))*(g2*cmath.cos(TW)*cmath.cos(TWp) + (g1 + 2*gYB)*cmath.cos(TWp)*cmath.sin(TW) - (2*gBL + gBY)*cmath.sin(TWp)))', 
	 order = {'QED':1} ) 
 
GC_777 = Coupling(name = 'GC_777',
	 value = '1./2.*complex(0,1)*(2*(UV24*complexconjugate(UV34) + UV25*complexconjugate(UV35) + UV26*complexconjugate(UV36))*(-(gYB*cmath.cos(TWp)*cmath.sin(TW)) + gBL*cmath.sin(TWp)) + (UV21*complexconjugate(UV31) + UV22*complexconjugate(UV32) + UV23*complexconjugate(UV33))*(g2*cmath.cos(TW)*cmath.cos(TWp) + (g1 + 2*gYB)*cmath.cos(TWp)*cmath.sin(TW) - (2*gBL + gBY)*cmath.sin(TWp)))', 
	 order = {'QED':1} ) 
 
GC_778 = Coupling(name = 'GC_778',
	 value = '-1./2.*complex(0,1)*(2*(UV34*complexconjugate(UV24) + UV35*complexconjugate(UV25) + UV36*complexconjugate(UV26))*(-(gYB*cmath.cos(TWp)*cmath.sin(TW)) + gBL*cmath.sin(TWp)) + (UV31*complexconjugate(UV21) + UV32*complexconjugate(UV22) + UV33*complexconjugate(UV23))*(g2*cmath.cos(TW)*cmath.cos(TWp) + (g1 + 2*gYB)*cmath.cos(TWp)*cmath.sin(TW) - (2*gBL + gBY)*cmath.sin(TWp)))', 
	 order = {'QED':1} ) 
 
GC_779 = Coupling(name = 'GC_779',
	 value = '1./2.*complex(0,1)*(2*(UV24*complexconjugate(UV44) + UV25*complexconjugate(UV45) + UV26*complexconjugate(UV46))*(-(gYB*cmath.cos(TWp)*cmath.sin(TW)) + gBL*cmath.sin(TWp)) + (UV21*complexconjugate(UV41) + UV22*complexconjugate(UV42) + UV23*complexconjugate(UV43))*(g2*cmath.cos(TW)*cmath.cos(TWp) + (g1 + 2*gYB)*cmath.cos(TWp)*cmath.sin(TW) - (2*gBL + gBY)*cmath.sin(TWp)))', 
	 order = {'QED':1} ) 
 
GC_780 = Coupling(name = 'GC_780',
	 value = '-1./2.*complex(0,1)*(2*(UV44*complexconjugate(UV24) + UV45*complexconjugate(UV25) + UV46*complexconjugate(UV26))*(-(gYB*cmath.cos(TWp)*cmath.sin(TW)) + gBL*cmath.sin(TWp)) + (UV41*complexconjugate(UV21) + UV42*complexconjugate(UV22) + UV43*complexconjugate(UV23))*(g2*cmath.cos(TW)*cmath.cos(TWp) + (g1 + 2*gYB)*cmath.cos(TWp)*cmath.sin(TW) - (2*gBL + gBY)*cmath.sin(TWp)))', 
	 order = {'QED':1} ) 
 
GC_781 = Coupling(name = 'GC_781',
	 value = '1./2.*complex(0,1)*(2*(UV24*complexconjugate(UV54) + UV25*complexconjugate(UV55) + UV26*complexconjugate(UV56))*(-(gYB*cmath.cos(TWp)*cmath.sin(TW)) + gBL*cmath.sin(TWp)) + (UV21*complexconjugate(UV51) + UV22*complexconjugate(UV52) + UV23*complexconjugate(UV53))*(g2*cmath.cos(TW)*cmath.cos(TWp) + (g1 + 2*gYB)*cmath.cos(TWp)*cmath.sin(TW) - (2*gBL + gBY)*cmath.sin(TWp)))', 
	 order = {'QED':1} ) 
 
GC_782 = Coupling(name = 'GC_782',
	 value = '-1./2.*complex(0,1)*(2*(UV54*complexconjugate(UV24) + UV55*complexconjugate(UV25) + UV56*complexconjugate(UV26))*(-(gYB*cmath.cos(TWp)*cmath.sin(TW)) + gBL*cmath.sin(TWp)) + (UV51*complexconjugate(UV21) + UV52*complexconjugate(UV22) + UV53*complexconjugate(UV23))*(g2*cmath.cos(TW)*cmath.cos(TWp) + (g1 + 2*gYB)*cmath.cos(TWp)*cmath.sin(TW) - (2*gBL + gBY)*cmath.sin(TWp)))', 
	 order = {'QED':1} ) 
 
GC_783 = Coupling(name = 'GC_783',
	 value = '1./2.*complex(0,1)*(2*(UV24*complexconjugate(UV64) + UV25*complexconjugate(UV65) + UV26*complexconjugate(UV66))*(-(gYB*cmath.cos(TWp)*cmath.sin(TW)) + gBL*cmath.sin(TWp)) + (UV21*complexconjugate(UV61) + UV22*complexconjugate(UV62) + UV23*complexconjugate(UV63))*(g2*cmath.cos(TW)*cmath.cos(TWp) + (g1 + 2*gYB)*cmath.cos(TWp)*cmath.sin(TW) - (2*gBL + gBY)*cmath.sin(TWp)))', 
	 order = {'QED':1} ) 
 
GC_784 = Coupling(name = 'GC_784',
	 value = '-1./2.*complex(0,1)*(2*(UV64*complexconjugate(UV24) + UV65*complexconjugate(UV25) + UV66*complexconjugate(UV26))*(-(gYB*cmath.cos(TWp)*cmath.sin(TW)) + gBL*cmath.sin(TWp)) + (UV61*complexconjugate(UV21) + UV62*complexconjugate(UV22) + UV63*complexconjugate(UV23))*(g2*cmath.cos(TW)*cmath.cos(TWp) + (g1 + 2*gYB)*cmath.cos(TWp)*cmath.sin(TW) - (2*gBL + gBY)*cmath.sin(TWp)))', 
	 order = {'QED':1} ) 
 
GC_785 = Coupling(name = 'GC_785',
	 value = '1./2.*complex(0,1)*(2*(UV34*complexconjugate(UV34) + UV35*complexconjugate(UV35) + UV36*complexconjugate(UV36))*(-(gYB*cmath.cos(TWp)*cmath.sin(TW)) + gBL*cmath.sin(TWp)) + (UV31*complexconjugate(UV31) + UV32*complexconjugate(UV32) + UV33*complexconjugate(UV33))*(g2*cmath.cos(TW)*cmath.cos(TWp) + (g1 + 2*gYB)*cmath.cos(TWp)*cmath.sin(TW) - (2*gBL + gBY)*cmath.sin(TWp)))', 
	 order = {'QED':1} ) 
 
GC_786 = Coupling(name = 'GC_786',
	 value = '-1./2.*complex(0,1)*(2*(UV34*complexconjugate(UV34) + UV35*complexconjugate(UV35) + UV36*complexconjugate(UV36))*(-(gYB*cmath.cos(TWp)*cmath.sin(TW)) + gBL*cmath.sin(TWp)) + (UV31*complexconjugate(UV31) + UV32*complexconjugate(UV32) + UV33*complexconjugate(UV33))*(g2*cmath.cos(TW)*cmath.cos(TWp) + (g1 + 2*gYB)*cmath.cos(TWp)*cmath.sin(TW) - (2*gBL + gBY)*cmath.sin(TWp)))', 
	 order = {'QED':1} ) 
 
GC_787 = Coupling(name = 'GC_787',
	 value = '1./2.*complex(0,1)*(2*(UV34*complexconjugate(UV44) + UV35*complexconjugate(UV45) + UV36*complexconjugate(UV46))*(-(gYB*cmath.cos(TWp)*cmath.sin(TW)) + gBL*cmath.sin(TWp)) + (UV31*complexconjugate(UV41) + UV32*complexconjugate(UV42) + UV33*complexconjugate(UV43))*(g2*cmath.cos(TW)*cmath.cos(TWp) + (g1 + 2*gYB)*cmath.cos(TWp)*cmath.sin(TW) - (2*gBL + gBY)*cmath.sin(TWp)))', 
	 order = {'QED':1} ) 
 
GC_788 = Coupling(name = 'GC_788',
	 value = '-1./2.*complex(0,1)*(2*(UV44*complexconjugate(UV34) + UV45*complexconjugate(UV35) + UV46*complexconjugate(UV36))*(-(gYB*cmath.cos(TWp)*cmath.sin(TW)) + gBL*cmath.sin(TWp)) + (UV41*complexconjugate(UV31) + UV42*complexconjugate(UV32) + UV43*complexconjugate(UV33))*(g2*cmath.cos(TW)*cmath.cos(TWp) + (g1 + 2*gYB)*cmath.cos(TWp)*cmath.sin(TW) - (2*gBL + gBY)*cmath.sin(TWp)))', 
	 order = {'QED':1} ) 
 
GC_789 = Coupling(name = 'GC_789',
	 value = '1./2.*complex(0,1)*(2*(UV34*complexconjugate(UV54) + UV35*complexconjugate(UV55) + UV36*complexconjugate(UV56))*(-(gYB*cmath.cos(TWp)*cmath.sin(TW)) + gBL*cmath.sin(TWp)) + (UV31*complexconjugate(UV51) + UV32*complexconjugate(UV52) + UV33*complexconjugate(UV53))*(g2*cmath.cos(TW)*cmath.cos(TWp) + (g1 + 2*gYB)*cmath.cos(TWp)*cmath.sin(TW) - (2*gBL + gBY)*cmath.sin(TWp)))', 
	 order = {'QED':1} ) 
 
GC_790 = Coupling(name = 'GC_790',
	 value = '-1./2.*complex(0,1)*(2*(UV54*complexconjugate(UV34) + UV55*complexconjugate(UV35) + UV56*complexconjugate(UV36))*(-(gYB*cmath.cos(TWp)*cmath.sin(TW)) + gBL*cmath.sin(TWp)) + (UV51*complexconjugate(UV31) + UV52*complexconjugate(UV32) + UV53*complexconjugate(UV33))*(g2*cmath.cos(TW)*cmath.cos(TWp) + (g1 + 2*gYB)*cmath.cos(TWp)*cmath.sin(TW) - (2*gBL + gBY)*cmath.sin(TWp)))', 
	 order = {'QED':1} ) 
 
GC_791 = Coupling(name = 'GC_791',
	 value = '1./2.*complex(0,1)*(2*(UV34*complexconjugate(UV64) + UV35*complexconjugate(UV65) + UV36*complexconjugate(UV66))*(-(gYB*cmath.cos(TWp)*cmath.sin(TW)) + gBL*cmath.sin(TWp)) + (UV31*complexconjugate(UV61) + UV32*complexconjugate(UV62) + UV33*complexconjugate(UV63))*(g2*cmath.cos(TW)*cmath.cos(TWp) + (g1 + 2*gYB)*cmath.cos(TWp)*cmath.sin(TW) - (2*gBL + gBY)*cmath.sin(TWp)))', 
	 order = {'QED':1} ) 
 
GC_792 = Coupling(name = 'GC_792',
	 value = '-1./2.*complex(0,1)*(2*(UV64*complexconjugate(UV34) + UV65*complexconjugate(UV35) + UV66*complexconjugate(UV36))*(-(gYB*cmath.cos(TWp)*cmath.sin(TW)) + gBL*cmath.sin(TWp)) + (UV61*complexconjugate(UV31) + UV62*complexconjugate(UV32) + UV63*complexconjugate(UV33))*(g2*cmath.cos(TW)*cmath.cos(TWp) + (g1 + 2*gYB)*cmath.cos(TWp)*cmath.sin(TW) - (2*gBL + gBY)*cmath.sin(TWp)))', 
	 order = {'QED':1} ) 
 
GC_793 = Coupling(name = 'GC_793',
	 value = '1./2.*complex(0,1)*(2*(UV44*complexconjugate(UV44) + UV45*complexconjugate(UV45) + UV46*complexconjugate(UV46))*(-(gYB*cmath.cos(TWp)*cmath.sin(TW)) + gBL*cmath.sin(TWp)) + (UV41*complexconjugate(UV41) + UV42*complexconjugate(UV42) + UV43*complexconjugate(UV43))*(g2*cmath.cos(TW)*cmath.cos(TWp) + (g1 + 2*gYB)*cmath.cos(TWp)*cmath.sin(TW) - (2*gBL + gBY)*cmath.sin(TWp)))', 
	 order = {'QED':1} ) 
 
GC_794 = Coupling(name = 'GC_794',
	 value = '-1./2.*complex(0,1)*(2*(UV44*complexconjugate(UV44) + UV45*complexconjugate(UV45) + UV46*complexconjugate(UV46))*(-(gYB*cmath.cos(TWp)*cmath.sin(TW)) + gBL*cmath.sin(TWp)) + (UV41*complexconjugate(UV41) + UV42*complexconjugate(UV42) + UV43*complexconjugate(UV43))*(g2*cmath.cos(TW)*cmath.cos(TWp) + (g1 + 2*gYB)*cmath.cos(TWp)*cmath.sin(TW) - (2*gBL + gBY)*cmath.sin(TWp)))', 
	 order = {'QED':1} ) 
 
GC_795 = Coupling(name = 'GC_795',
	 value = '1./2.*complex(0,1)*(2*(UV44*complexconjugate(UV54) + UV45*complexconjugate(UV55) + UV46*complexconjugate(UV56))*(-(gYB*cmath.cos(TWp)*cmath.sin(TW)) + gBL*cmath.sin(TWp)) + (UV41*complexconjugate(UV51) + UV42*complexconjugate(UV52) + UV43*complexconjugate(UV53))*(g2*cmath.cos(TW)*cmath.cos(TWp) + (g1 + 2*gYB)*cmath.cos(TWp)*cmath.sin(TW) - (2*gBL + gBY)*cmath.sin(TWp)))', 
	 order = {'QED':1} ) 
 
GC_796 = Coupling(name = 'GC_796',
	 value = '-1./2.*complex(0,1)*(2*(UV54*complexconjugate(UV44) + UV55*complexconjugate(UV45) + UV56*complexconjugate(UV46))*(-(gYB*cmath.cos(TWp)*cmath.sin(TW)) + gBL*cmath.sin(TWp)) + (UV51*complexconjugate(UV41) + UV52*complexconjugate(UV42) + UV53*complexconjugate(UV43))*(g2*cmath.cos(TW)*cmath.cos(TWp) + (g1 + 2*gYB)*cmath.cos(TWp)*cmath.sin(TW) - (2*gBL + gBY)*cmath.sin(TWp)))', 
	 order = {'QED':1} ) 
 
GC_797 = Coupling(name = 'GC_797',
	 value = '1./2.*complex(0,1)*(2*(UV44*complexconjugate(UV64) + UV45*complexconjugate(UV65) + UV46*complexconjugate(UV66))*(-(gYB*cmath.cos(TWp)*cmath.sin(TW)) + gBL*cmath.sin(TWp)) + (UV41*complexconjugate(UV61) + UV42*complexconjugate(UV62) + UV43*complexconjugate(UV63))*(g2*cmath.cos(TW)*cmath.cos(TWp) + (g1 + 2*gYB)*cmath.cos(TWp)*cmath.sin(TW) - (2*gBL + gBY)*cmath.sin(TWp)))', 
	 order = {'QED':1} ) 
 
GC_798 = Coupling(name = 'GC_798',
	 value = '-1./2.*complex(0,1)*(2*(UV64*complexconjugate(UV44) + UV65*complexconjugate(UV45) + UV66*complexconjugate(UV46))*(-(gYB*cmath.cos(TWp)*cmath.sin(TW)) + gBL*cmath.sin(TWp)) + (UV61*complexconjugate(UV41) + UV62*complexconjugate(UV42) + UV63*complexconjugate(UV43))*(g2*cmath.cos(TW)*cmath.cos(TWp) + (g1 + 2*gYB)*cmath.cos(TWp)*cmath.sin(TW) - (2*gBL + gBY)*cmath.sin(TWp)))', 
	 order = {'QED':1} ) 
 
GC_799 = Coupling(name = 'GC_799',
	 value = '1./2.*complex(0,1)*(2*(UV54*complexconjugate(UV54) + UV55*complexconjugate(UV55) + UV56*complexconjugate(UV56))*(-(gYB*cmath.cos(TWp)*cmath.sin(TW)) + gBL*cmath.sin(TWp)) + (UV51*complexconjugate(UV51) + UV52*complexconjugate(UV52) + UV53*complexconjugate(UV53))*(g2*cmath.cos(TW)*cmath.cos(TWp) + (g1 + 2*gYB)*cmath.cos(TWp)*cmath.sin(TW) - (2*gBL + gBY)*cmath.sin(TWp)))', 
	 order = {'QED':1} ) 
 
GC_800 = Coupling(name = 'GC_800',
	 value = '-1./2.*complex(0,1)*(2*(UV54*complexconjugate(UV54) + UV55*complexconjugate(UV55) + UV56*complexconjugate(UV56))*(-(gYB*cmath.cos(TWp)*cmath.sin(TW)) + gBL*cmath.sin(TWp)) + (UV51*complexconjugate(UV51) + UV52*complexconjugate(UV52) + UV53*complexconjugate(UV53))*(g2*cmath.cos(TW)*cmath.cos(TWp) + (g1 + 2*gYB)*cmath.cos(TWp)*cmath.sin(TW) - (2*gBL + gBY)*cmath.sin(TWp)))', 
	 order = {'QED':1} ) 
 
GC_801 = Coupling(name = 'GC_801',
	 value = '1./2.*complex(0,1)*(2*(UV54*complexconjugate(UV64) + UV55*complexconjugate(UV65) + UV56*complexconjugate(UV66))*(-(gYB*cmath.cos(TWp)*cmath.sin(TW)) + gBL*cmath.sin(TWp)) + (UV51*complexconjugate(UV61) + UV52*complexconjugate(UV62) + UV53*complexconjugate(UV63))*(g2*cmath.cos(TW)*cmath.cos(TWp) + (g1 + 2*gYB)*cmath.cos(TWp)*cmath.sin(TW) - (2*gBL + gBY)*cmath.sin(TWp)))', 
	 order = {'QED':1} ) 
 
GC_802 = Coupling(name = 'GC_802',
	 value = '-1./2.*complex(0,1)*(2*(UV64*complexconjugate(UV54) + UV65*complexconjugate(UV55) + UV66*complexconjugate(UV56))*(-(gYB*cmath.cos(TWp)*cmath.sin(TW)) + gBL*cmath.sin(TWp)) + (UV61*complexconjugate(UV51) + UV62*complexconjugate(UV52) + UV63*complexconjugate(UV53))*(g2*cmath.cos(TW)*cmath.cos(TWp) + (g1 + 2*gYB)*cmath.cos(TWp)*cmath.sin(TW) - (2*gBL + gBY)*cmath.sin(TWp)))', 
	 order = {'QED':1} ) 
 
GC_803 = Coupling(name = 'GC_803',
	 value = '1./2.*complex(0,1)*(2*(UV64*complexconjugate(UV64) + UV65*complexconjugate(UV65) + UV66*complexconjugate(UV66))*(-(gYB*cmath.cos(TWp)*cmath.sin(TW)) + gBL*cmath.sin(TWp)) + (UV61*complexconjugate(UV61) + UV62*complexconjugate(UV62) + UV63*complexconjugate(UV63))*(g2*cmath.cos(TW)*cmath.cos(TWp) + (g1 + 2*gYB)*cmath.cos(TWp)*cmath.sin(TW) - (2*gBL + gBY)*cmath.sin(TWp)))', 
	 order = {'QED':1} ) 
 
GC_804 = Coupling(name = 'GC_804',
	 value = '-1./2.*complex(0,1)*(2*(UV64*complexconjugate(UV64) + UV65*complexconjugate(UV65) + UV66*complexconjugate(UV66))*(-(gYB*cmath.cos(TWp)*cmath.sin(TW)) + gBL*cmath.sin(TWp)) + (UV61*complexconjugate(UV61) + UV62*complexconjugate(UV62) + UV63*complexconjugate(UV63))*(g2*cmath.cos(TW)*cmath.cos(TWp) + (g1 + 2*gYB)*cmath.cos(TWp)*cmath.sin(TW) - (2*gBL + gBY)*cmath.sin(TWp)))', 
	 order = {'QED':1} ) 
 
GC_805 = Coupling(name = 'GC_805',
	 value = '-1./2.*complex(0,1)*(-2*(UV14*complexconjugate(UV14) + UV15*complexconjugate(UV15) + UV16*complexconjugate(UV16))*(gBL*cmath.cos(TWp) + gYB*cmath.sin(TW)*cmath.sin(TWp)) + (UV11*complexconjugate(UV11) + UV12*complexconjugate(UV12) + UV13*complexconjugate(UV13))*((2*gBL + gBY)*cmath.cos(TWp) + (g2*cmath.cos(TW) + (g1 + 2*gYB)*cmath.sin(TW))*cmath.sin(TWp)))', 
	 order = {'QED':1} ) 
 
GC_806 = Coupling(name = 'GC_806',
	 value = '1./2.*complex(0,1)*(-2*(UV14*complexconjugate(UV14) + UV15*complexconjugate(UV15) + UV16*complexconjugate(UV16))*(gBL*cmath.cos(TWp) + gYB*cmath.sin(TW)*cmath.sin(TWp)) + (UV11*complexconjugate(UV11) + UV12*complexconjugate(UV12) + UV13*complexconjugate(UV13))*((2*gBL + gBY)*cmath.cos(TWp) + (g2*cmath.cos(TW) + (g1 + 2*gYB)*cmath.sin(TW))*cmath.sin(TWp)))', 
	 order = {'QED':1} ) 
 
GC_807 = Coupling(name = 'GC_807',
	 value = '-1./2.*complex(0,1)*(-2*(UV14*complexconjugate(UV24) + UV15*complexconjugate(UV25) + UV16*complexconjugate(UV26))*(gBL*cmath.cos(TWp) + gYB*cmath.sin(TW)*cmath.sin(TWp)) + (UV11*complexconjugate(UV21) + UV12*complexconjugate(UV22) + UV13*complexconjugate(UV23))*((2*gBL + gBY)*cmath.cos(TWp) + (g2*cmath.cos(TW) + (g1 + 2*gYB)*cmath.sin(TW))*cmath.sin(TWp)))', 
	 order = {'QED':1} ) 
 
GC_808 = Coupling(name = 'GC_808',
	 value = '1./2.*complex(0,1)*(-2*(UV24*complexconjugate(UV14) + UV25*complexconjugate(UV15) + UV26*complexconjugate(UV16))*(gBL*cmath.cos(TWp) + gYB*cmath.sin(TW)*cmath.sin(TWp)) + (UV21*complexconjugate(UV11) + UV22*complexconjugate(UV12) + UV23*complexconjugate(UV13))*((2*gBL + gBY)*cmath.cos(TWp) + (g2*cmath.cos(TW) + (g1 + 2*gYB)*cmath.sin(TW))*cmath.sin(TWp)))', 
	 order = {'QED':1} ) 
 
GC_809 = Coupling(name = 'GC_809',
	 value = '-1./2.*complex(0,1)*(-2*(UV14*complexconjugate(UV34) + UV15*complexconjugate(UV35) + UV16*complexconjugate(UV36))*(gBL*cmath.cos(TWp) + gYB*cmath.sin(TW)*cmath.sin(TWp)) + (UV11*complexconjugate(UV31) + UV12*complexconjugate(UV32) + UV13*complexconjugate(UV33))*((2*gBL + gBY)*cmath.cos(TWp) + (g2*cmath.cos(TW) + (g1 + 2*gYB)*cmath.sin(TW))*cmath.sin(TWp)))', 
	 order = {'QED':1} ) 
 
GC_810 = Coupling(name = 'GC_810',
	 value = '1./2.*complex(0,1)*(-2*(UV34*complexconjugate(UV14) + UV35*complexconjugate(UV15) + UV36*complexconjugate(UV16))*(gBL*cmath.cos(TWp) + gYB*cmath.sin(TW)*cmath.sin(TWp)) + (UV31*complexconjugate(UV11) + UV32*complexconjugate(UV12) + UV33*complexconjugate(UV13))*((2*gBL + gBY)*cmath.cos(TWp) + (g2*cmath.cos(TW) + (g1 + 2*gYB)*cmath.sin(TW))*cmath.sin(TWp)))', 
	 order = {'QED':1} ) 
 
GC_811 = Coupling(name = 'GC_811',
	 value = '-1./2.*complex(0,1)*(-2*(UV14*complexconjugate(UV44) + UV15*complexconjugate(UV45) + UV16*complexconjugate(UV46))*(gBL*cmath.cos(TWp) + gYB*cmath.sin(TW)*cmath.sin(TWp)) + (UV11*complexconjugate(UV41) + UV12*complexconjugate(UV42) + UV13*complexconjugate(UV43))*((2*gBL + gBY)*cmath.cos(TWp) + (g2*cmath.cos(TW) + (g1 + 2*gYB)*cmath.sin(TW))*cmath.sin(TWp)))', 
	 order = {'QED':1} ) 
 
GC_812 = Coupling(name = 'GC_812',
	 value = '1./2.*complex(0,1)*(-2*(UV44*complexconjugate(UV14) + UV45*complexconjugate(UV15) + UV46*complexconjugate(UV16))*(gBL*cmath.cos(TWp) + gYB*cmath.sin(TW)*cmath.sin(TWp)) + (UV41*complexconjugate(UV11) + UV42*complexconjugate(UV12) + UV43*complexconjugate(UV13))*((2*gBL + gBY)*cmath.cos(TWp) + (g2*cmath.cos(TW) + (g1 + 2*gYB)*cmath.sin(TW))*cmath.sin(TWp)))', 
	 order = {'QED':1} ) 
 
GC_813 = Coupling(name = 'GC_813',
	 value = '-1./2.*complex(0,1)*(-2*(UV14*complexconjugate(UV54) + UV15*complexconjugate(UV55) + UV16*complexconjugate(UV56))*(gBL*cmath.cos(TWp) + gYB*cmath.sin(TW)*cmath.sin(TWp)) + (UV11*complexconjugate(UV51) + UV12*complexconjugate(UV52) + UV13*complexconjugate(UV53))*((2*gBL + gBY)*cmath.cos(TWp) + (g2*cmath.cos(TW) + (g1 + 2*gYB)*cmath.sin(TW))*cmath.sin(TWp)))', 
	 order = {'QED':1} ) 
 
GC_814 = Coupling(name = 'GC_814',
	 value = '1./2.*complex(0,1)*(-2*(UV54*complexconjugate(UV14) + UV55*complexconjugate(UV15) + UV56*complexconjugate(UV16))*(gBL*cmath.cos(TWp) + gYB*cmath.sin(TW)*cmath.sin(TWp)) + (UV51*complexconjugate(UV11) + UV52*complexconjugate(UV12) + UV53*complexconjugate(UV13))*((2*gBL + gBY)*cmath.cos(TWp) + (g2*cmath.cos(TW) + (g1 + 2*gYB)*cmath.sin(TW))*cmath.sin(TWp)))', 
	 order = {'QED':1} ) 
 
GC_815 = Coupling(name = 'GC_815',
	 value = '-1./2.*complex(0,1)*(-2*(UV14*complexconjugate(UV64) + UV15*complexconjugate(UV65) + UV16*complexconjugate(UV66))*(gBL*cmath.cos(TWp) + gYB*cmath.sin(TW)*cmath.sin(TWp)) + (UV11*complexconjugate(UV61) + UV12*complexconjugate(UV62) + UV13*complexconjugate(UV63))*((2*gBL + gBY)*cmath.cos(TWp) + (g2*cmath.cos(TW) + (g1 + 2*gYB)*cmath.sin(TW))*cmath.sin(TWp)))', 
	 order = {'QED':1} ) 
 
GC_816 = Coupling(name = 'GC_816',
	 value = '1./2.*complex(0,1)*(-2*(UV64*complexconjugate(UV14) + UV65*complexconjugate(UV15) + UV66*complexconjugate(UV16))*(gBL*cmath.cos(TWp) + gYB*cmath.sin(TW)*cmath.sin(TWp)) + (UV61*complexconjugate(UV11) + UV62*complexconjugate(UV12) + UV63*complexconjugate(UV13))*((2*gBL + gBY)*cmath.cos(TWp) + (g2*cmath.cos(TW) + (g1 + 2*gYB)*cmath.sin(TW))*cmath.sin(TWp)))', 
	 order = {'QED':1} ) 
 
GC_817 = Coupling(name = 'GC_817',
	 value = '-1./2.*complex(0,1)*(-2*(UV24*complexconjugate(UV24) + UV25*complexconjugate(UV25) + UV26*complexconjugate(UV26))*(gBL*cmath.cos(TWp) + gYB*cmath.sin(TW)*cmath.sin(TWp)) + (UV21*complexconjugate(UV21) + UV22*complexconjugate(UV22) + UV23*complexconjugate(UV23))*((2*gBL + gBY)*cmath.cos(TWp) + (g2*cmath.cos(TW) + (g1 + 2*gYB)*cmath.sin(TW))*cmath.sin(TWp)))', 
	 order = {'QED':1} ) 
 
GC_818 = Coupling(name = 'GC_818',
	 value = '1./2.*complex(0,1)*(-2*(UV24*complexconjugate(UV24) + UV25*complexconjugate(UV25) + UV26*complexconjugate(UV26))*(gBL*cmath.cos(TWp) + gYB*cmath.sin(TW)*cmath.sin(TWp)) + (UV21*complexconjugate(UV21) + UV22*complexconjugate(UV22) + UV23*complexconjugate(UV23))*((2*gBL + gBY)*cmath.cos(TWp) + (g2*cmath.cos(TW) + (g1 + 2*gYB)*cmath.sin(TW))*cmath.sin(TWp)))', 
	 order = {'QED':1} ) 
 
GC_819 = Coupling(name = 'GC_819',
	 value = '-1./2.*complex(0,1)*(-2*(UV24*complexconjugate(UV34) + UV25*complexconjugate(UV35) + UV26*complexconjugate(UV36))*(gBL*cmath.cos(TWp) + gYB*cmath.sin(TW)*cmath.sin(TWp)) + (UV21*complexconjugate(UV31) + UV22*complexconjugate(UV32) + UV23*complexconjugate(UV33))*((2*gBL + gBY)*cmath.cos(TWp) + (g2*cmath.cos(TW) + (g1 + 2*gYB)*cmath.sin(TW))*cmath.sin(TWp)))', 
	 order = {'QED':1} ) 
 
GC_820 = Coupling(name = 'GC_820',
	 value = '1./2.*complex(0,1)*(-2*(UV34*complexconjugate(UV24) + UV35*complexconjugate(UV25) + UV36*complexconjugate(UV26))*(gBL*cmath.cos(TWp) + gYB*cmath.sin(TW)*cmath.sin(TWp)) + (UV31*complexconjugate(UV21) + UV32*complexconjugate(UV22) + UV33*complexconjugate(UV23))*((2*gBL + gBY)*cmath.cos(TWp) + (g2*cmath.cos(TW) + (g1 + 2*gYB)*cmath.sin(TW))*cmath.sin(TWp)))', 
	 order = {'QED':1} ) 
 
GC_821 = Coupling(name = 'GC_821',
	 value = '-1./2.*complex(0,1)*(-2*(UV24*complexconjugate(UV44) + UV25*complexconjugate(UV45) + UV26*complexconjugate(UV46))*(gBL*cmath.cos(TWp) + gYB*cmath.sin(TW)*cmath.sin(TWp)) + (UV21*complexconjugate(UV41) + UV22*complexconjugate(UV42) + UV23*complexconjugate(UV43))*((2*gBL + gBY)*cmath.cos(TWp) + (g2*cmath.cos(TW) + (g1 + 2*gYB)*cmath.sin(TW))*cmath.sin(TWp)))', 
	 order = {'QED':1} ) 
 
GC_822 = Coupling(name = 'GC_822',
	 value = '1./2.*complex(0,1)*(-2*(UV44*complexconjugate(UV24) + UV45*complexconjugate(UV25) + UV46*complexconjugate(UV26))*(gBL*cmath.cos(TWp) + gYB*cmath.sin(TW)*cmath.sin(TWp)) + (UV41*complexconjugate(UV21) + UV42*complexconjugate(UV22) + UV43*complexconjugate(UV23))*((2*gBL + gBY)*cmath.cos(TWp) + (g2*cmath.cos(TW) + (g1 + 2*gYB)*cmath.sin(TW))*cmath.sin(TWp)))', 
	 order = {'QED':1} ) 
 
GC_823 = Coupling(name = 'GC_823',
	 value = '-1./2.*complex(0,1)*(-2*(UV24*complexconjugate(UV54) + UV25*complexconjugate(UV55) + UV26*complexconjugate(UV56))*(gBL*cmath.cos(TWp) + gYB*cmath.sin(TW)*cmath.sin(TWp)) + (UV21*complexconjugate(UV51) + UV22*complexconjugate(UV52) + UV23*complexconjugate(UV53))*((2*gBL + gBY)*cmath.cos(TWp) + (g2*cmath.cos(TW) + (g1 + 2*gYB)*cmath.sin(TW))*cmath.sin(TWp)))', 
	 order = {'QED':1} ) 
 
GC_824 = Coupling(name = 'GC_824',
	 value = '1./2.*complex(0,1)*(-2*(UV54*complexconjugate(UV24) + UV55*complexconjugate(UV25) + UV56*complexconjugate(UV26))*(gBL*cmath.cos(TWp) + gYB*cmath.sin(TW)*cmath.sin(TWp)) + (UV51*complexconjugate(UV21) + UV52*complexconjugate(UV22) + UV53*complexconjugate(UV23))*((2*gBL + gBY)*cmath.cos(TWp) + (g2*cmath.cos(TW) + (g1 + 2*gYB)*cmath.sin(TW))*cmath.sin(TWp)))', 
	 order = {'QED':1} ) 
 
GC_825 = Coupling(name = 'GC_825',
	 value = '-1./2.*complex(0,1)*(-2*(UV24*complexconjugate(UV64) + UV25*complexconjugate(UV65) + UV26*complexconjugate(UV66))*(gBL*cmath.cos(TWp) + gYB*cmath.sin(TW)*cmath.sin(TWp)) + (UV21*complexconjugate(UV61) + UV22*complexconjugate(UV62) + UV23*complexconjugate(UV63))*((2*gBL + gBY)*cmath.cos(TWp) + (g2*cmath.cos(TW) + (g1 + 2*gYB)*cmath.sin(TW))*cmath.sin(TWp)))', 
	 order = {'QED':1} ) 
 
GC_826 = Coupling(name = 'GC_826',
	 value = '1./2.*complex(0,1)*(-2*(UV64*complexconjugate(UV24) + UV65*complexconjugate(UV25) + UV66*complexconjugate(UV26))*(gBL*cmath.cos(TWp) + gYB*cmath.sin(TW)*cmath.sin(TWp)) + (UV61*complexconjugate(UV21) + UV62*complexconjugate(UV22) + UV63*complexconjugate(UV23))*((2*gBL + gBY)*cmath.cos(TWp) + (g2*cmath.cos(TW) + (g1 + 2*gYB)*cmath.sin(TW))*cmath.sin(TWp)))', 
	 order = {'QED':1} ) 
 
GC_827 = Coupling(name = 'GC_827',
	 value = '-1./2.*complex(0,1)*(-2*(UV34*complexconjugate(UV34) + UV35*complexconjugate(UV35) + UV36*complexconjugate(UV36))*(gBL*cmath.cos(TWp) + gYB*cmath.sin(TW)*cmath.sin(TWp)) + (UV31*complexconjugate(UV31) + UV32*complexconjugate(UV32) + UV33*complexconjugate(UV33))*((2*gBL + gBY)*cmath.cos(TWp) + (g2*cmath.cos(TW) + (g1 + 2*gYB)*cmath.sin(TW))*cmath.sin(TWp)))', 
	 order = {'QED':1} ) 
 
GC_828 = Coupling(name = 'GC_828',
	 value = '1./2.*complex(0,1)*(-2*(UV34*complexconjugate(UV34) + UV35*complexconjugate(UV35) + UV36*complexconjugate(UV36))*(gBL*cmath.cos(TWp) + gYB*cmath.sin(TW)*cmath.sin(TWp)) + (UV31*complexconjugate(UV31) + UV32*complexconjugate(UV32) + UV33*complexconjugate(UV33))*((2*gBL + gBY)*cmath.cos(TWp) + (g2*cmath.cos(TW) + (g1 + 2*gYB)*cmath.sin(TW))*cmath.sin(TWp)))', 
	 order = {'QED':1} ) 
 
GC_829 = Coupling(name = 'GC_829',
	 value = '-1./2.*complex(0,1)*(-2*(UV34*complexconjugate(UV44) + UV35*complexconjugate(UV45) + UV36*complexconjugate(UV46))*(gBL*cmath.cos(TWp) + gYB*cmath.sin(TW)*cmath.sin(TWp)) + (UV31*complexconjugate(UV41) + UV32*complexconjugate(UV42) + UV33*complexconjugate(UV43))*((2*gBL + gBY)*cmath.cos(TWp) + (g2*cmath.cos(TW) + (g1 + 2*gYB)*cmath.sin(TW))*cmath.sin(TWp)))', 
	 order = {'QED':1} ) 
 
GC_830 = Coupling(name = 'GC_830',
	 value = '1./2.*complex(0,1)*(-2*(UV44*complexconjugate(UV34) + UV45*complexconjugate(UV35) + UV46*complexconjugate(UV36))*(gBL*cmath.cos(TWp) + gYB*cmath.sin(TW)*cmath.sin(TWp)) + (UV41*complexconjugate(UV31) + UV42*complexconjugate(UV32) + UV43*complexconjugate(UV33))*((2*gBL + gBY)*cmath.cos(TWp) + (g2*cmath.cos(TW) + (g1 + 2*gYB)*cmath.sin(TW))*cmath.sin(TWp)))', 
	 order = {'QED':1} ) 
 
GC_831 = Coupling(name = 'GC_831',
	 value = '-1./2.*complex(0,1)*(-2*(UV34*complexconjugate(UV54) + UV35*complexconjugate(UV55) + UV36*complexconjugate(UV56))*(gBL*cmath.cos(TWp) + gYB*cmath.sin(TW)*cmath.sin(TWp)) + (UV31*complexconjugate(UV51) + UV32*complexconjugate(UV52) + UV33*complexconjugate(UV53))*((2*gBL + gBY)*cmath.cos(TWp) + (g2*cmath.cos(TW) + (g1 + 2*gYB)*cmath.sin(TW))*cmath.sin(TWp)))', 
	 order = {'QED':1} ) 
 
GC_832 = Coupling(name = 'GC_832',
	 value = '1./2.*complex(0,1)*(-2*(UV54*complexconjugate(UV34) + UV55*complexconjugate(UV35) + UV56*complexconjugate(UV36))*(gBL*cmath.cos(TWp) + gYB*cmath.sin(TW)*cmath.sin(TWp)) + (UV51*complexconjugate(UV31) + UV52*complexconjugate(UV32) + UV53*complexconjugate(UV33))*((2*gBL + gBY)*cmath.cos(TWp) + (g2*cmath.cos(TW) + (g1 + 2*gYB)*cmath.sin(TW))*cmath.sin(TWp)))', 
	 order = {'QED':1} ) 
 
GC_833 = Coupling(name = 'GC_833',
	 value = '-1./2.*complex(0,1)*(-2*(UV34*complexconjugate(UV64) + UV35*complexconjugate(UV65) + UV36*complexconjugate(UV66))*(gBL*cmath.cos(TWp) + gYB*cmath.sin(TW)*cmath.sin(TWp)) + (UV31*complexconjugate(UV61) + UV32*complexconjugate(UV62) + UV33*complexconjugate(UV63))*((2*gBL + gBY)*cmath.cos(TWp) + (g2*cmath.cos(TW) + (g1 + 2*gYB)*cmath.sin(TW))*cmath.sin(TWp)))', 
	 order = {'QED':1} ) 
 
GC_834 = Coupling(name = 'GC_834',
	 value = '1./2.*complex(0,1)*(-2*(UV64*complexconjugate(UV34) + UV65*complexconjugate(UV35) + UV66*complexconjugate(UV36))*(gBL*cmath.cos(TWp) + gYB*cmath.sin(TW)*cmath.sin(TWp)) + (UV61*complexconjugate(UV31) + UV62*complexconjugate(UV32) + UV63*complexconjugate(UV33))*((2*gBL + gBY)*cmath.cos(TWp) + (g2*cmath.cos(TW) + (g1 + 2*gYB)*cmath.sin(TW))*cmath.sin(TWp)))', 
	 order = {'QED':1} ) 
 
GC_835 = Coupling(name = 'GC_835',
	 value = '-1./2.*complex(0,1)*(-2*(UV44*complexconjugate(UV44) + UV45*complexconjugate(UV45) + UV46*complexconjugate(UV46))*(gBL*cmath.cos(TWp) + gYB*cmath.sin(TW)*cmath.sin(TWp)) + (UV41*complexconjugate(UV41) + UV42*complexconjugate(UV42) + UV43*complexconjugate(UV43))*((2*gBL + gBY)*cmath.cos(TWp) + (g2*cmath.cos(TW) + (g1 + 2*gYB)*cmath.sin(TW))*cmath.sin(TWp)))', 
	 order = {'QED':1} ) 
 
GC_836 = Coupling(name = 'GC_836',
	 value = '1./2.*complex(0,1)*(-2*(UV44*complexconjugate(UV44) + UV45*complexconjugate(UV45) + UV46*complexconjugate(UV46))*(gBL*cmath.cos(TWp) + gYB*cmath.sin(TW)*cmath.sin(TWp)) + (UV41*complexconjugate(UV41) + UV42*complexconjugate(UV42) + UV43*complexconjugate(UV43))*((2*gBL + gBY)*cmath.cos(TWp) + (g2*cmath.cos(TW) + (g1 + 2*gYB)*cmath.sin(TW))*cmath.sin(TWp)))', 
	 order = {'QED':1} ) 
 
GC_837 = Coupling(name = 'GC_837',
	 value = '-1./2.*complex(0,1)*(-2*(UV44*complexconjugate(UV54) + UV45*complexconjugate(UV55) + UV46*complexconjugate(UV56))*(gBL*cmath.cos(TWp) + gYB*cmath.sin(TW)*cmath.sin(TWp)) + (UV41*complexconjugate(UV51) + UV42*complexconjugate(UV52) + UV43*complexconjugate(UV53))*((2*gBL + gBY)*cmath.cos(TWp) + (g2*cmath.cos(TW) + (g1 + 2*gYB)*cmath.sin(TW))*cmath.sin(TWp)))', 
	 order = {'QED':1} ) 
 
GC_838 = Coupling(name = 'GC_838',
	 value = '1./2.*complex(0,1)*(-2*(UV54*complexconjugate(UV44) + UV55*complexconjugate(UV45) + UV56*complexconjugate(UV46))*(gBL*cmath.cos(TWp) + gYB*cmath.sin(TW)*cmath.sin(TWp)) + (UV51*complexconjugate(UV41) + UV52*complexconjugate(UV42) + UV53*complexconjugate(UV43))*((2*gBL + gBY)*cmath.cos(TWp) + (g2*cmath.cos(TW) + (g1 + 2*gYB)*cmath.sin(TW))*cmath.sin(TWp)))', 
	 order = {'QED':1} ) 
 
GC_839 = Coupling(name = 'GC_839',
	 value = '-1./2.*complex(0,1)*(-2*(UV44*complexconjugate(UV64) + UV45*complexconjugate(UV65) + UV46*complexconjugate(UV66))*(gBL*cmath.cos(TWp) + gYB*cmath.sin(TW)*cmath.sin(TWp)) + (UV41*complexconjugate(UV61) + UV42*complexconjugate(UV62) + UV43*complexconjugate(UV63))*((2*gBL + gBY)*cmath.cos(TWp) + (g2*cmath.cos(TW) + (g1 + 2*gYB)*cmath.sin(TW))*cmath.sin(TWp)))', 
	 order = {'QED':1} ) 
 
GC_840 = Coupling(name = 'GC_840',
	 value = '1./2.*complex(0,1)*(-2*(UV64*complexconjugate(UV44) + UV65*complexconjugate(UV45) + UV66*complexconjugate(UV46))*(gBL*cmath.cos(TWp) + gYB*cmath.sin(TW)*cmath.sin(TWp)) + (UV61*complexconjugate(UV41) + UV62*complexconjugate(UV42) + UV63*complexconjugate(UV43))*((2*gBL + gBY)*cmath.cos(TWp) + (g2*cmath.cos(TW) + (g1 + 2*gYB)*cmath.sin(TW))*cmath.sin(TWp)))', 
	 order = {'QED':1} ) 
 
GC_841 = Coupling(name = 'GC_841',
	 value = '-1./2.*complex(0,1)*(-2*(UV54*complexconjugate(UV54) + UV55*complexconjugate(UV55) + UV56*complexconjugate(UV56))*(gBL*cmath.cos(TWp) + gYB*cmath.sin(TW)*cmath.sin(TWp)) + (UV51*complexconjugate(UV51) + UV52*complexconjugate(UV52) + UV53*complexconjugate(UV53))*((2*gBL + gBY)*cmath.cos(TWp) + (g2*cmath.cos(TW) + (g1 + 2*gYB)*cmath.sin(TW))*cmath.sin(TWp)))', 
	 order = {'QED':1} ) 
 
GC_842 = Coupling(name = 'GC_842',
	 value = '1./2.*complex(0,1)*(-2*(UV54*complexconjugate(UV54) + UV55*complexconjugate(UV55) + UV56*complexconjugate(UV56))*(gBL*cmath.cos(TWp) + gYB*cmath.sin(TW)*cmath.sin(TWp)) + (UV51*complexconjugate(UV51) + UV52*complexconjugate(UV52) + UV53*complexconjugate(UV53))*((2*gBL + gBY)*cmath.cos(TWp) + (g2*cmath.cos(TW) + (g1 + 2*gYB)*cmath.sin(TW))*cmath.sin(TWp)))', 
	 order = {'QED':1} ) 
 
GC_843 = Coupling(name = 'GC_843',
	 value = '-1./2.*complex(0,1)*(-2*(UV54*complexconjugate(UV64) + UV55*complexconjugate(UV65) + UV56*complexconjugate(UV66))*(gBL*cmath.cos(TWp) + gYB*cmath.sin(TW)*cmath.sin(TWp)) + (UV51*complexconjugate(UV61) + UV52*complexconjugate(UV62) + UV53*complexconjugate(UV63))*((2*gBL + gBY)*cmath.cos(TWp) + (g2*cmath.cos(TW) + (g1 + 2*gYB)*cmath.sin(TW))*cmath.sin(TWp)))', 
	 order = {'QED':1} ) 
 
GC_844 = Coupling(name = 'GC_844',
	 value = '1./2.*complex(0,1)*(-2*(UV64*complexconjugate(UV54) + UV65*complexconjugate(UV55) + UV66*complexconjugate(UV56))*(gBL*cmath.cos(TWp) + gYB*cmath.sin(TW)*cmath.sin(TWp)) + (UV61*complexconjugate(UV51) + UV62*complexconjugate(UV52) + UV63*complexconjugate(UV53))*((2*gBL + gBY)*cmath.cos(TWp) + (g2*cmath.cos(TW) + (g1 + 2*gYB)*cmath.sin(TW))*cmath.sin(TWp)))', 
	 order = {'QED':1} ) 
 
GC_845 = Coupling(name = 'GC_845',
	 value = '-1./2.*complex(0,1)*(-2*(UV64*complexconjugate(UV64) + UV65*complexconjugate(UV65) + UV66*complexconjugate(UV66))*(gBL*cmath.cos(TWp) + gYB*cmath.sin(TW)*cmath.sin(TWp)) + (UV61*complexconjugate(UV61) + UV62*complexconjugate(UV62) + UV63*complexconjugate(UV63))*((2*gBL + gBY)*cmath.cos(TWp) + (g2*cmath.cos(TW) + (g1 + 2*gYB)*cmath.sin(TW))*cmath.sin(TWp)))', 
	 order = {'QED':1} ) 
 
GC_846 = Coupling(name = 'GC_846',
	 value = '1./2.*complex(0,1)*(-2*(UV64*complexconjugate(UV64) + UV65*complexconjugate(UV65) + UV66*complexconjugate(UV66))*(gBL*cmath.cos(TWp) + gYB*cmath.sin(TW)*cmath.sin(TWp)) + (UV61*complexconjugate(UV61) + UV62*complexconjugate(UV62) + UV63*complexconjugate(UV63))*((2*gBL + gBY)*cmath.cos(TWp) + (g2*cmath.cos(TW) + (g1 + 2*gYB)*cmath.sin(TW))*cmath.sin(TWp)))', 
	 order = {'QED':1} ) 
 
GC_847 = Coupling(name = 'GC_847',
	 value = '(1*complex(0,1)*g2*(ZEL11*complexconjugate(UV11) + ZEL12*complexconjugate(UV12) + ZEL13*complexconjugate(UV13)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_848 = Coupling(name = 'GC_848',
	 value = '(1*complex(0,1)*g2*(ZEL11*complexconjugate(UV21) + ZEL12*complexconjugate(UV22) + ZEL13*complexconjugate(UV23)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_849 = Coupling(name = 'GC_849',
	 value = '(1*complex(0,1)*g2*(ZEL11*complexconjugate(UV31) + ZEL12*complexconjugate(UV32) + ZEL13*complexconjugate(UV33)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_850 = Coupling(name = 'GC_850',
	 value = '(1*complex(0,1)*g2*(ZEL11*complexconjugate(UV41) + ZEL12*complexconjugate(UV42) + ZEL13*complexconjugate(UV43)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_851 = Coupling(name = 'GC_851',
	 value = '(1*complex(0,1)*g2*(ZEL11*complexconjugate(UV51) + ZEL12*complexconjugate(UV52) + ZEL13*complexconjugate(UV53)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_852 = Coupling(name = 'GC_852',
	 value = '(1*complex(0,1)*g2*(ZEL11*complexconjugate(UV61) + ZEL12*complexconjugate(UV62) + ZEL13*complexconjugate(UV63)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_853 = Coupling(name = 'GC_853',
	 value = '(1*complex(0,1)*g2*(ZEL21*complexconjugate(UV11) + ZEL22*complexconjugate(UV12) + ZEL23*complexconjugate(UV13)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_854 = Coupling(name = 'GC_854',
	 value = '(1*complex(0,1)*g2*(ZEL21*complexconjugate(UV21) + ZEL22*complexconjugate(UV22) + ZEL23*complexconjugate(UV23)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_855 = Coupling(name = 'GC_855',
	 value = '(1*complex(0,1)*g2*(ZEL21*complexconjugate(UV31) + ZEL22*complexconjugate(UV32) + ZEL23*complexconjugate(UV33)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_856 = Coupling(name = 'GC_856',
	 value = '(1*complex(0,1)*g2*(ZEL21*complexconjugate(UV41) + ZEL22*complexconjugate(UV42) + ZEL23*complexconjugate(UV43)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_857 = Coupling(name = 'GC_857',
	 value = '(1*complex(0,1)*g2*(ZEL21*complexconjugate(UV51) + ZEL22*complexconjugate(UV52) + ZEL23*complexconjugate(UV53)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_858 = Coupling(name = 'GC_858',
	 value = '(1*complex(0,1)*g2*(ZEL21*complexconjugate(UV61) + ZEL22*complexconjugate(UV62) + ZEL23*complexconjugate(UV63)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_859 = Coupling(name = 'GC_859',
	 value = '(1*complex(0,1)*g2*(ZEL31*complexconjugate(UV11) + ZEL32*complexconjugate(UV12) + ZEL33*complexconjugate(UV13)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_860 = Coupling(name = 'GC_860',
	 value = '(1*complex(0,1)*g2*(ZEL31*complexconjugate(UV21) + ZEL32*complexconjugate(UV22) + ZEL33*complexconjugate(UV23)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_861 = Coupling(name = 'GC_861',
	 value = '(1*complex(0,1)*g2*(ZEL31*complexconjugate(UV31) + ZEL32*complexconjugate(UV32) + ZEL33*complexconjugate(UV33)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_862 = Coupling(name = 'GC_862',
	 value = '(1*complex(0,1)*g2*(ZEL31*complexconjugate(UV41) + ZEL32*complexconjugate(UV42) + ZEL33*complexconjugate(UV43)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_863 = Coupling(name = 'GC_863',
	 value = '(1*complex(0,1)*g2*(ZEL31*complexconjugate(UV51) + ZEL32*complexconjugate(UV52) + ZEL33*complexconjugate(UV53)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_864 = Coupling(name = 'GC_864',
	 value = '(1*complex(0,1)*g2*(ZEL31*complexconjugate(UV61) + ZEL32*complexconjugate(UV62) + ZEL33*complexconjugate(UV63)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_865 = Coupling(name = 'GC_865',
	 value = 'G', 
	 order = {'QCD':1} ) 
 
GC_866 = Coupling(name = 'GC_866',
	 value = '-1*complex(0,1)*g2*cmath.sin(TW)', 
	 order = {'QED':1} ) 
 
GC_867 = Coupling(name = 'GC_867',
	 value = '1*complex(0,1)*g2*cmath.cos(TW)*cmath.cos(TWp)', 
	 order = {'QED':1} ) 
 
GC_868 = Coupling(name = 'GC_868',
	 value = '-1*complex(0,1)*g2*cmath.cos(TW)*cmath.sin(TWp)', 
	 order = {'QED':1} ) 
 
GC_869 = Coupling(name = 'GC_869',
	 value = '-1*complex(0,1)*G**2', 
	 order = {'QCD':2} ) 
 
GC_870 = Coupling(name = 'GC_870',
	 value = '-1*complex(0,1)*G**2', 
	 order = {'QCD':2} ) 
 
GC_871 = Coupling(name = 'GC_871',
	 value = '1*complex(0,1)*G**2', 
	 order = {'QCD':2} ) 
 
GC_872 = Coupling(name = 'GC_872',
	 value = '-1*complex(0,1)*G**2', 
	 order = {'QCD':2} ) 
 
GC_873 = Coupling(name = 'GC_873',
	 value = '1*complex(0,1)*G**2', 
	 order = {'QCD':2} ) 
 
GC_874 = Coupling(name = 'GC_874',
	 value = '1*complex(0,1)*G**2', 
	 order = {'QCD':2} ) 
 
GC_875 = Coupling(name = 'GC_875',
	 value = '1*complex(0,1)*g2**2*cmath.sin(TW)**2', 
	 order = {'QED':2} ) 
 
GC_876 = Coupling(name = 'GC_876',
	 value = '1*complex(0,1)*g2**2*cmath.sin(TW)**2', 
	 order = {'QED':2} ) 
 
GC_877 = Coupling(name = 'GC_877',
	 value = '-2*complex(0,1)*g2**2*cmath.sin(TW)**2', 
	 order = {'QED':2} ) 
 
GC_878 = Coupling(name = 'GC_878',
	 value = '1*complex(0,1)*g2**2*cmath.cos(TW)*cmath.cos(TWp)*cmath.sin(TW)', 
	 order = {'QED':2} ) 
 
GC_879 = Coupling(name = 'GC_879',
	 value = '-1*complex(0,1)*g2**2*cmath.cos(TWp)*cmath.sin(2*TW)', 
	 order = {'QED':2} ) 
 
GC_880 = Coupling(name = 'GC_880',
	 value = '1*complex(0,1)*g2**2*cmath.cos(TW)*cmath.cos(TWp)*cmath.sin(TW)', 
	 order = {'QED':2} ) 
 
GC_881 = Coupling(name = 'GC_881',
	 value = '-1*complex(0,1)*g2**2*cmath.cos(TW)*cmath.sin(TW)*cmath.sin(TWp)', 
	 order = {'QED':2} ) 
 
GC_882 = Coupling(name = 'GC_882',
	 value = '1*complex(0,1)*g2**2*cmath.sin(2*TW)*cmath.sin(TWp)', 
	 order = {'QED':2} ) 
 
GC_883 = Coupling(name = 'GC_883',
	 value = '-1*complex(0,1)*g2**2*cmath.cos(TW)*cmath.sin(TW)*cmath.sin(TWp)', 
	 order = {'QED':2} ) 
 
GC_884 = Coupling(name = 'GC_884',
	 value = '2*complex(0,1)*g2**2', 
	 order = {'QED':2} ) 
 
GC_885 = Coupling(name = 'GC_885',
	 value = '-1*complex(0,1)*g2**2', 
	 order = {'QED':2} ) 
 
GC_886 = Coupling(name = 'GC_886',
	 value = '-1*complex(0,1)*g2**2', 
	 order = {'QED':2} ) 
 
GC_887 = Coupling(name = 'GC_887',
	 value = '-2*complex(0,1)*g2**2*cmath.cos(TW)**2*cmath.cos(TWp)**2', 
	 order = {'QED':2} ) 
 
GC_888 = Coupling(name = 'GC_888',
	 value = '1*complex(0,1)*g2**2*cmath.cos(TW)**2*cmath.cos(TWp)**2', 
	 order = {'QED':2} ) 
 
GC_889 = Coupling(name = 'GC_889',
	 value = '1*complex(0,1)*g2**2*cmath.cos(TW)**2*cmath.cos(TWp)**2', 
	 order = {'QED':2} ) 
 
GC_890 = Coupling(name = 'GC_890',
	 value = '1*complex(0,1)*g2**2*cmath.cos(TW)**2*cmath.sin(2*TWp)', 
	 order = {'QED':2} ) 
 
GC_891 = Coupling(name = 'GC_891',
	 value = '-1*complex(0,1)*g2**2*cmath.cos(TW)**2*cmath.cos(TWp)*cmath.sin(TWp)', 
	 order = {'QED':2} ) 
 
GC_892 = Coupling(name = 'GC_892',
	 value = '-1*complex(0,1)*g2**2*cmath.cos(TW)**2*cmath.cos(TWp)*cmath.sin(TWp)', 
	 order = {'QED':2} ) 
 
GC_893 = Coupling(name = 'GC_893',
	 value = '-2*complex(0,1)*g2**2*cmath.cos(TW)**2*cmath.sin(TWp)**2', 
	 order = {'QED':2} ) 
 
GC_894 = Coupling(name = 'GC_894',
	 value = '1*complex(0,1)*g2**2*cmath.cos(TW)**2*cmath.sin(TWp)**2', 
	 order = {'QED':2} ) 
 
GC_895 = Coupling(name = 'GC_895',
	 value = '1*complex(0,1)*g2**2*cmath.cos(TW)**2*cmath.sin(TWp)**2', 
	 order = {'QED':2} ) 
 
GC_896=Coupling(name='GC_896',
	 value='-(HPP1*complex(0,1))', 
	 order={'HIW':1})

GC_897=Coupling(name='GC_897',
	 value='-(HGG1*complex(0,1))', 
	 order={'HIG':1})

GC_898=Coupling(name='GC_898',
	 value='-(HPP2*complex(0,1))', 
	 order={'HIW':1})

GC_899=Coupling(name='GC_899',
	 value='-(HGG2*complex(0,1))', 
	 order={'HIG':1})


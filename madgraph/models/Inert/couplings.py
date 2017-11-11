from object_library import all_couplings,Coupling 
from cmath import exp 
from function_library import complexconjugate,re,im,csc,sec,acsc,asec 
 
 
GC_1 = Coupling(name = 'GC_1',
	 value = '(v*(Lam5 - complexconjugate(Lam5)))/2.', 
	 order = {'QED':1} ) 
 
GC_2 = Coupling(name = 'GC_2',
	 value = '-1./2.*complex(0,1)*v*(-Lam5 + 2*complexconjugate(Lam3) - complexconjugate(Lam5))', 
	 order = {'QED':1} ) 
 
GC_3 = Coupling(name = 'GC_3',
	 value = '1./2.*complex(0,1)*v*(Lam5 + complexconjugate(Lam5))', 
	 order = {'QED':1} ) 
 
GC_4 = Coupling(name = 'GC_4',
	 value = '(v*(-Lam5 + complexconjugate(Lam5)))/2.', 
	 order = {'QED':1} ) 
 
GC_5 = Coupling(name = 'GC_5',
	 value = '(v*(ZP11*ZP12*(Lam5 + complexconjugate(Lam4)) - ZP11*ZP12*(complexconjugate(Lam4) + complexconjugate(Lam5))))/2.', 
	 order = {'QED':1} ) 
 
GC_6 = Coupling(name = 'GC_6',
	 value = '(v*(ZP12*ZP21*(Lam5 + complexconjugate(Lam4)) - ZP11*ZP22*(complexconjugate(Lam4) + complexconjugate(Lam5))))/2.', 
	 order = {'QED':1} ) 
 
GC_7 = Coupling(name = 'GC_7',
	 value = '(v*(ZP11*ZP22*(Lam5 + complexconjugate(Lam4)) - ZP12*ZP21*(complexconjugate(Lam4) + complexconjugate(Lam5))))/2.', 
	 order = {'QED':1} ) 
 
GC_8 = Coupling(name = 'GC_8',
	 value = '(v*(ZP21*ZP22*(Lam5 + complexconjugate(Lam4)) - ZP21*ZP22*(complexconjugate(Lam4) + complexconjugate(Lam5))))/2.', 
	 order = {'QED':1} ) 
 
GC_9 = Coupling(name = 'GC_9',
	 value = '-2*complex(0,1)*v*complexconjugate(Lam1)', 
	 order = {'QED':1} ) 
 
GC_10 = Coupling(name = 'GC_10',
	 value = '(v*(-Lam5 + complexconjugate(Lam5)))/2.', 
	 order = {'QED':1} ) 
 
GC_11 = Coupling(name = 'GC_11',
	 value = '-1./2.*complex(0,1)*v*(Lam5 + 2*complexconjugate(Lam3) + complexconjugate(Lam5))', 
	 order = {'QED':1} ) 
 
GC_12 = Coupling(name = 'GC_12',
	 value = '-1./2.*complex(0,1)*v*(ZP11*ZP12*(-Lam5 + complexconjugate(Lam4)) + ZP11*ZP12*(complexconjugate(Lam4) - complexconjugate(Lam5)))', 
	 order = {'QED':1} ) 
 
GC_13 = Coupling(name = 'GC_13',
	 value = '-1./2.*complex(0,1)*v*(ZP12*ZP21*(-Lam5 + complexconjugate(Lam4)) + ZP11*ZP22*(complexconjugate(Lam4) - complexconjugate(Lam5)))', 
	 order = {'QED':1} ) 
 
GC_14 = Coupling(name = 'GC_14',
	 value = '-1./2.*complex(0,1)*v*(ZP11*ZP22*(-Lam5 + complexconjugate(Lam4)) + ZP12*ZP21*(complexconjugate(Lam4) - complexconjugate(Lam5)))', 
	 order = {'QED':1} ) 
 
GC_15 = Coupling(name = 'GC_15',
	 value = '-1./2.*complex(0,1)*v*(ZP21*ZP22*(-Lam5 + complexconjugate(Lam4)) + ZP21*ZP22*(complexconjugate(Lam4) - complexconjugate(Lam5)))', 
	 order = {'QED':1} ) 
 
GC_16 = Coupling(name = 'GC_16',
	 value = '-6*complex(0,1)*v*complexconjugate(Lam1)', 
	 order = {'QED':1} ) 
 
GC_17 = Coupling(name = 'GC_17',
	 value = '-1*complex(0,1)*v*(2*ZP12**2*complexconjugate(Lam1) + ZP11**2*(complexconjugate(Lam3) + complexconjugate(Lam4)))', 
	 order = {'QED':1} ) 
 
GC_18 = Coupling(name = 'GC_18',
	 value = '-1*complex(0,1)*v*(2*ZP12*ZP22*complexconjugate(Lam1) + ZP11*ZP21*(complexconjugate(Lam3) + complexconjugate(Lam4)))', 
	 order = {'QED':1} ) 
 
GC_19 = Coupling(name = 'GC_19',
	 value = '-1*complex(0,1)*v*(2*ZP12*ZP22*complexconjugate(Lam1) + ZP11*ZP21*(complexconjugate(Lam3) + complexconjugate(Lam4)))', 
	 order = {'QED':1} ) 
 
GC_20 = Coupling(name = 'GC_20',
	 value = '-1*complex(0,1)*v*(2*ZP22**2*complexconjugate(Lam1) + ZP21**2*(complexconjugate(Lam3) + complexconjugate(Lam4)))', 
	 order = {'QED':1} ) 
 
GC_21 = Coupling(name = 'GC_21',
	 value = '1./2.*complex(0,1)*g2**2', 
	 order = {'QED':2} ) 
 
GC_22 = Coupling(name = 'GC_22',
	 value = '1./2.*complex(0,1)*(g2*cmath.cos(TW) + g1*cmath.sin(TW))**2', 
	 order = {'QED':2} ) 
 
GC_23 = Coupling(name = 'GC_23',
	 value = '(g1*g2*ZP11*cmath.cos(TW))/2.', 
	 order = {'QED':2} ) 
 
GC_24 = Coupling(name = 'GC_24',
	 value = '(g1*g2*ZP21*cmath.cos(TW))/2.', 
	 order = {'QED':2} ) 
 
GC_25 = Coupling(name = 'GC_25',
	 value = '-(g1*g2*ZP11*cmath.sin(TW))/2.', 
	 order = {'QED':2} ) 
 
GC_26 = Coupling(name = 'GC_26',
	 value = '-(g1*g2*ZP21*cmath.sin(TW))/2.', 
	 order = {'QED':2} ) 
 
GC_27 = Coupling(name = 'GC_27',
	 value = '-(g1*g2*ZP11*cmath.cos(TW))/2.', 
	 order = {'QED':2} ) 
 
GC_28 = Coupling(name = 'GC_28',
	 value = '-(g1*g2*ZP21*cmath.cos(TW))/2.', 
	 order = {'QED':2} ) 
 
GC_29 = Coupling(name = 'GC_29',
	 value = '(g1*g2*ZP11*cmath.sin(TW))/2.', 
	 order = {'QED':2} ) 
 
GC_30 = Coupling(name = 'GC_30',
	 value = '(g1*g2*ZP21*cmath.sin(TW))/2.', 
	 order = {'QED':2} ) 
 
GC_31 = Coupling(name = 'GC_31',
	 value = '1./2.*complex(0,1)*g2**2', 
	 order = {'QED':2} ) 
 
GC_32 = Coupling(name = 'GC_32',
	 value = '1./2.*complex(0,1)*(g2*cmath.cos(TW) + g1*cmath.sin(TW))**2', 
	 order = {'QED':2} ) 
 
GC_33 = Coupling(name = 'GC_33',
	 value = '(g1*g2*ZP12*cmath.cos(TW))/2.', 
	 order = {'QED':2} ) 
 
GC_34 = Coupling(name = 'GC_34',
	 value = '(g1*g2*ZP22*cmath.cos(TW))/2.', 
	 order = {'QED':2} ) 
 
GC_35 = Coupling(name = 'GC_35',
	 value = '-(g1*g2*ZP12*cmath.sin(TW))/2.', 
	 order = {'QED':2} ) 
 
GC_36 = Coupling(name = 'GC_36',
	 value = '-(g1*g2*ZP22*cmath.sin(TW))/2.', 
	 order = {'QED':2} ) 
 
GC_37 = Coupling(name = 'GC_37',
	 value = '-(g1*g2*ZP12*cmath.cos(TW))/2.', 
	 order = {'QED':2} ) 
 
GC_38 = Coupling(name = 'GC_38',
	 value = '-(g1*g2*ZP22*cmath.cos(TW))/2.', 
	 order = {'QED':2} ) 
 
GC_39 = Coupling(name = 'GC_39',
	 value = '(g1*g2*ZP12*cmath.sin(TW))/2.', 
	 order = {'QED':2} ) 
 
GC_40 = Coupling(name = 'GC_40',
	 value = '(g1*g2*ZP22*cmath.sin(TW))/2.', 
	 order = {'QED':2} ) 
 
GC_41 = Coupling(name = 'GC_41',
	 value = '1./2.*complex(0,1)*g2**2', 
	 order = {'QED':2} ) 
 
GC_42 = Coupling(name = 'GC_42',
	 value = '1./2.*complex(0,1)*(g2*cmath.cos(TW) + g1*cmath.sin(TW))**2', 
	 order = {'QED':2} ) 
 
GC_43 = Coupling(name = 'GC_43',
	 value = '1./2.*complex(0,1)*g1*g2*ZP11*cmath.cos(TW)', 
	 order = {'QED':2} ) 
 
GC_44 = Coupling(name = 'GC_44',
	 value = '1./2.*complex(0,1)*g1*g2*ZP21*cmath.cos(TW)', 
	 order = {'QED':2} ) 
 
GC_45 = Coupling(name = 'GC_45',
	 value = '-1./2.*complex(0,1)*g1*g2*ZP11*cmath.sin(TW)', 
	 order = {'QED':2} ) 
 
GC_46 = Coupling(name = 'GC_46',
	 value = '-1./2.*complex(0,1)*g1*g2*ZP21*cmath.sin(TW)', 
	 order = {'QED':2} ) 
 
GC_47 = Coupling(name = 'GC_47',
	 value = '1./2.*complex(0,1)*g1*g2*ZP11*cmath.cos(TW)', 
	 order = {'QED':2} ) 
 
GC_48 = Coupling(name = 'GC_48',
	 value = '1./2.*complex(0,1)*g1*g2*ZP21*cmath.cos(TW)', 
	 order = {'QED':2} ) 
 
GC_49 = Coupling(name = 'GC_49',
	 value = '-1./2.*complex(0,1)*g1*g2*ZP11*cmath.sin(TW)', 
	 order = {'QED':2} ) 
 
GC_50 = Coupling(name = 'GC_50',
	 value = '-1./2.*complex(0,1)*g1*g2*ZP21*cmath.sin(TW)', 
	 order = {'QED':2} ) 
 
GC_51 = Coupling(name = 'GC_51',
	 value = '1./2.*complex(0,1)*g2**2', 
	 order = {'QED':2} ) 
 
GC_52 = Coupling(name = 'GC_52',
	 value = '1./2.*complex(0,1)*(g2*cmath.cos(TW) + g1*cmath.sin(TW))**2', 
	 order = {'QED':2} ) 
 
GC_53 = Coupling(name = 'GC_53',
	 value = '-1./2.*complex(0,1)*g1*g2*ZP12*cmath.cos(TW)', 
	 order = {'QED':2} ) 
 
GC_54 = Coupling(name = 'GC_54',
	 value = '-1./2.*complex(0,1)*g1*g2*ZP22*cmath.cos(TW)', 
	 order = {'QED':2} ) 
 
GC_55 = Coupling(name = 'GC_55',
	 value = '1./2.*complex(0,1)*g1*g2*ZP12*cmath.sin(TW)', 
	 order = {'QED':2} ) 
 
GC_56 = Coupling(name = 'GC_56',
	 value = '1./2.*complex(0,1)*g1*g2*ZP22*cmath.sin(TW)', 
	 order = {'QED':2} ) 
 
GC_57 = Coupling(name = 'GC_57',
	 value = '-1./2.*complex(0,1)*g1*g2*ZP12*cmath.cos(TW)', 
	 order = {'QED':2} ) 
 
GC_58 = Coupling(name = 'GC_58',
	 value = '-1./2.*complex(0,1)*g1*g2*ZP22*cmath.cos(TW)', 
	 order = {'QED':2} ) 
 
GC_59 = Coupling(name = 'GC_59',
	 value = '1./2.*complex(0,1)*g1*g2*ZP12*cmath.sin(TW)', 
	 order = {'QED':2} ) 
 
GC_60 = Coupling(name = 'GC_60',
	 value = '1./2.*complex(0,1)*g1*g2*ZP22*cmath.sin(TW)', 
	 order = {'QED':2} ) 
 
GC_61 = Coupling(name = 'GC_61',
	 value = '1./2.*complex(0,1)*(ZP11**2 + ZP12**2)*(g1*cmath.cos(TW) + g2*cmath.sin(TW))**2', 
	 order = {'QED':2} ) 
 
GC_62 = Coupling(name = 'GC_62',
	 value = '1./2.*complex(0,1)*(ZP11*ZP21 + ZP12*ZP22)*(g1*cmath.cos(TW) + g2*cmath.sin(TW))**2', 
	 order = {'QED':2} ) 
 
GC_63 = Coupling(name = 'GC_63',
	 value = '1./2.*complex(0,1)*(ZP11*ZP21 + ZP12*ZP22)*(g1*cmath.cos(TW) + g2*cmath.sin(TW))**2', 
	 order = {'QED':2} ) 
 
GC_64 = Coupling(name = 'GC_64',
	 value = '1./2.*complex(0,1)*(ZP21**2 + ZP22**2)*(g1*cmath.cos(TW) + g2*cmath.sin(TW))**2', 
	 order = {'QED':2} ) 
 
GC_65 = Coupling(name = 'GC_65',
	 value = '-1./4.*complex(0,1)*(ZP11**2 + ZP12**2)*(-2*g1*g2*cmath.cos(2*TW) + (g1**2 - g2**2)*cmath.sin(2*TW))', 
	 order = {'QED':2} ) 
 
GC_66 = Coupling(name = 'GC_66',
	 value = '-1./4.*complex(0,1)*(ZP11*ZP21 + ZP12*ZP22)*(-2*g1*g2*cmath.cos(2*TW) + (g1**2 - g2**2)*cmath.sin(2*TW))', 
	 order = {'QED':2} ) 
 
GC_67 = Coupling(name = 'GC_67',
	 value = '-1./4.*complex(0,1)*(ZP11*ZP21 + ZP12*ZP22)*(-2*g1*g2*cmath.cos(2*TW) + (g1**2 - g2**2)*cmath.sin(2*TW))', 
	 order = {'QED':2} ) 
 
GC_68 = Coupling(name = 'GC_68',
	 value = '-1./4.*complex(0,1)*(ZP21**2 + ZP22**2)*(-2*g1*g2*cmath.cos(2*TW) + (g1**2 - g2**2)*cmath.sin(2*TW))', 
	 order = {'QED':2} ) 
 
GC_69 = Coupling(name = 'GC_69',
	 value = '1./2.*complex(0,1)*g2**2*(ZP11**2 + ZP12**2)', 
	 order = {'QED':2} ) 
 
GC_70 = Coupling(name = 'GC_70',
	 value = '1./2.*complex(0,1)*g2**2*(ZP11*ZP21 + ZP12*ZP22)', 
	 order = {'QED':2} ) 
 
GC_71 = Coupling(name = 'GC_71',
	 value = '1./2.*complex(0,1)*g2**2*(ZP11*ZP21 + ZP12*ZP22)', 
	 order = {'QED':2} ) 
 
GC_72 = Coupling(name = 'GC_72',
	 value = '1./2.*complex(0,1)*g2**2*(ZP21**2 + ZP22**2)', 
	 order = {'QED':2} ) 
 
GC_73 = Coupling(name = 'GC_73',
	 value = '1./2.*complex(0,1)*(ZP11**2 + ZP12**2)*(g2*cmath.cos(TW) - g1*cmath.sin(TW))**2', 
	 order = {'QED':2} ) 
 
GC_74 = Coupling(name = 'GC_74',
	 value = '1./2.*complex(0,1)*(ZP11*ZP21 + ZP12*ZP22)*(g2*cmath.cos(TW) - g1*cmath.sin(TW))**2', 
	 order = {'QED':2} ) 
 
GC_75 = Coupling(name = 'GC_75',
	 value = '1./2.*complex(0,1)*(ZP11*ZP21 + ZP12*ZP22)*(g2*cmath.cos(TW) - g1*cmath.sin(TW))**2', 
	 order = {'QED':2} ) 
 
GC_76 = Coupling(name = 'GC_76',
	 value = '1./2.*complex(0,1)*(ZP21**2 + ZP22**2)*(g2*cmath.cos(TW) - g1*cmath.sin(TW))**2', 
	 order = {'QED':2} ) 
 
GC_77 = Coupling(name = 'GC_77',
	 value = '(g2*cmath.cos(TW) + g1*cmath.sin(TW))/2.', 
	 order = {'QED':1} ) 
 
GC_78 = Coupling(name = 'GC_78',
	 value = '-(g2*ZP11)/2.', 
	 order = {'QED':1} ) 
 
GC_79 = Coupling(name = 'GC_79',
	 value = '-(g2*ZP21)/2.', 
	 order = {'QED':1} ) 
 
GC_80 = Coupling(name = 'GC_80',
	 value = '-(g2*ZP11)/2.', 
	 order = {'QED':1} ) 
 
GC_81 = Coupling(name = 'GC_81',
	 value = '-(g2*ZP21)/2.', 
	 order = {'QED':1} ) 
 
GC_82 = Coupling(name = 'GC_82',
	 value = '(-(g2*cmath.cos(TW)) - g1*cmath.sin(TW))/2.', 
	 order = {'QED':1} ) 
 
GC_83 = Coupling(name = 'GC_83',
	 value = '-(g2*ZP12)/2.', 
	 order = {'QED':1} ) 
 
GC_84 = Coupling(name = 'GC_84',
	 value = '-(g2*ZP22)/2.', 
	 order = {'QED':1} ) 
 
GC_85 = Coupling(name = 'GC_85',
	 value = '-(g2*ZP12)/2.', 
	 order = {'QED':1} ) 
 
GC_86 = Coupling(name = 'GC_86',
	 value = '-(g2*ZP22)/2.', 
	 order = {'QED':1} ) 
 
GC_87 = Coupling(name = 'GC_87',
	 value = '-1./2.*complex(0,1)*g2*ZP11', 
	 order = {'QED':1} ) 
 
GC_88 = Coupling(name = 'GC_88',
	 value = '-1./2.*complex(0,1)*g2*ZP21', 
	 order = {'QED':1} ) 
 
GC_89 = Coupling(name = 'GC_89',
	 value = '1./2.*complex(0,1)*g2*ZP11', 
	 order = {'QED':1} ) 
 
GC_90 = Coupling(name = 'GC_90',
	 value = '1./2.*complex(0,1)*g2*ZP21', 
	 order = {'QED':1} ) 
 
GC_91 = Coupling(name = 'GC_91',
	 value = '1./2.*complex(0,1)*g2*ZP12', 
	 order = {'QED':1} ) 
 
GC_92 = Coupling(name = 'GC_92',
	 value = '1./2.*complex(0,1)*g2*ZP22', 
	 order = {'QED':1} ) 
 
GC_93 = Coupling(name = 'GC_93',
	 value = '-1./2.*complex(0,1)*g2*ZP12', 
	 order = {'QED':1} ) 
 
GC_94 = Coupling(name = 'GC_94',
	 value = '-1./2.*complex(0,1)*g2*ZP22', 
	 order = {'QED':1} ) 
 
GC_95 = Coupling(name = 'GC_95',
	 value = '1./2.*complex(0,1)*(ZP11**2 + ZP12**2)*(g1*cmath.cos(TW) + g2*cmath.sin(TW))', 
	 order = {'QED':1} ) 
 
GC_96 = Coupling(name = 'GC_96',
	 value = '1./2.*complex(0,1)*(ZP11*ZP21 + ZP12*ZP22)*(g1*cmath.cos(TW) + g2*cmath.sin(TW))', 
	 order = {'QED':1} ) 
 
GC_97 = Coupling(name = 'GC_97',
	 value = '1./2.*complex(0,1)*(ZP11*ZP21 + ZP12*ZP22)*(g1*cmath.cos(TW) + g2*cmath.sin(TW))', 
	 order = {'QED':1} ) 
 
GC_98 = Coupling(name = 'GC_98',
	 value = '1./2.*complex(0,1)*(ZP21**2 + ZP22**2)*(g1*cmath.cos(TW) + g2*cmath.sin(TW))', 
	 order = {'QED':1} ) 
 
GC_99 = Coupling(name = 'GC_99',
	 value = '1./2.*complex(0,1)*(ZP11**2 + ZP12**2)*(g2*cmath.cos(TW) - g1*cmath.sin(TW))', 
	 order = {'QED':1} ) 
 
GC_100 = Coupling(name = 'GC_100',
	 value = '1./2.*complex(0,1)*(ZP11*ZP21 + ZP12*ZP22)*(g2*cmath.cos(TW) - g1*cmath.sin(TW))', 
	 order = {'QED':1} ) 
 
GC_101 = Coupling(name = 'GC_101',
	 value = '1./2.*complex(0,1)*(ZP11*ZP21 + ZP12*ZP22)*(g2*cmath.cos(TW) - g1*cmath.sin(TW))', 
	 order = {'QED':1} ) 
 
GC_102 = Coupling(name = 'GC_102',
	 value = '1./2.*complex(0,1)*(ZP21**2 + ZP22**2)*(g2*cmath.cos(TW) - g1*cmath.sin(TW))', 
	 order = {'QED':1} ) 
 
GC_103 = Coupling(name = 'GC_103',
	 value = '1./2.*complex(0,1)*g2**2*v', 
	 order = {'QED':1} ) 
 
GC_104 = Coupling(name = 'GC_104',
	 value = '1./2.*complex(0,1)*v*(g2*cmath.cos(TW) + g1*cmath.sin(TW))**2', 
	 order = {'QED':1} ) 
 
GC_105 = Coupling(name = 'GC_105',
	 value = '-1./2.*complex(0,1)*g1*g2*v*ZP12*cmath.cos(TW)', 
	 order = {'QED':1} ) 
 
GC_106 = Coupling(name = 'GC_106',
	 value = '-1./2.*complex(0,1)*g1*g2*v*ZP22*cmath.cos(TW)', 
	 order = {'QED':1} ) 
 
GC_107 = Coupling(name = 'GC_107',
	 value = '1./2.*complex(0,1)*g1*g2*v*ZP12*cmath.sin(TW)', 
	 order = {'QED':1} ) 
 
GC_108 = Coupling(name = 'GC_108',
	 value = '1./2.*complex(0,1)*g1*g2*v*ZP22*cmath.sin(TW)', 
	 order = {'QED':1} ) 
 
GC_109 = Coupling(name = 'GC_109',
	 value = '-1./2.*complex(0,1)*g1*g2*v*ZP12*cmath.cos(TW)', 
	 order = {'QED':1} ) 
 
GC_110 = Coupling(name = 'GC_110',
	 value = '-1./2.*complex(0,1)*g1*g2*v*ZP22*cmath.cos(TW)', 
	 order = {'QED':1} ) 
 
GC_111 = Coupling(name = 'GC_111',
	 value = '1./2.*complex(0,1)*g1*g2*v*ZP12*cmath.sin(TW)', 
	 order = {'QED':1} ) 
 
GC_112 = Coupling(name = 'GC_112',
	 value = '1./2.*complex(0,1)*g1*g2*v*ZP22*cmath.sin(TW)', 
	 order = {'QED':1} ) 
 
GC_113 = Coupling(name = 'GC_113',
	 value = '((Yd11*complexconjugate(ZDL11) + Yd21*complexconjugate(ZDL12) + Yd31*complexconjugate(ZDL13))*complexconjugate(ZDR11) + (Yd12*complexconjugate(ZDL11) + Yd22*complexconjugate(ZDL12) + Yd32*complexconjugate(ZDL13))*complexconjugate(ZDR12) + (Yd13*complexconjugate(ZDL11) + Yd23*complexconjugate(ZDL12) + Yd33*complexconjugate(ZDL13))*complexconjugate(ZDR13))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_114 = Coupling(name = 'GC_114',
	 value = '-((ZDR11*(ZDL11*complexconjugate(Yd11) + ZDL12*complexconjugate(Yd21) + ZDL13*complexconjugate(Yd31)) + ZDR12*(ZDL11*complexconjugate(Yd12) + ZDL12*complexconjugate(Yd22) + ZDL13*complexconjugate(Yd32)) + ZDR13*(ZDL11*complexconjugate(Yd13) + ZDL12*complexconjugate(Yd23) + ZDL13*complexconjugate(Yd33)))/cmath.sqrt(2))', 
	 order = {'QED':1} ) 
 
GC_115 = Coupling(name = 'GC_115',
	 value = '((Yd11*complexconjugate(ZDL21) + Yd21*complexconjugate(ZDL22) + Yd31*complexconjugate(ZDL23))*complexconjugate(ZDR11) + (Yd12*complexconjugate(ZDL21) + Yd22*complexconjugate(ZDL22) + Yd32*complexconjugate(ZDL23))*complexconjugate(ZDR12) + (Yd13*complexconjugate(ZDL21) + Yd23*complexconjugate(ZDL22) + Yd33*complexconjugate(ZDL23))*complexconjugate(ZDR13))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_116 = Coupling(name = 'GC_116',
	 value = '-((ZDR21*(ZDL11*complexconjugate(Yd11) + ZDL12*complexconjugate(Yd21) + ZDL13*complexconjugate(Yd31)) + ZDR22*(ZDL11*complexconjugate(Yd12) + ZDL12*complexconjugate(Yd22) + ZDL13*complexconjugate(Yd32)) + ZDR23*(ZDL11*complexconjugate(Yd13) + ZDL12*complexconjugate(Yd23) + ZDL13*complexconjugate(Yd33)))/cmath.sqrt(2))', 
	 order = {'QED':1} ) 
 
GC_117 = Coupling(name = 'GC_117',
	 value = '((Yd11*complexconjugate(ZDL31) + Yd21*complexconjugate(ZDL32) + Yd31*complexconjugate(ZDL33))*complexconjugate(ZDR11) + (Yd12*complexconjugate(ZDL31) + Yd22*complexconjugate(ZDL32) + Yd32*complexconjugate(ZDL33))*complexconjugate(ZDR12) + (Yd13*complexconjugate(ZDL31) + Yd23*complexconjugate(ZDL32) + Yd33*complexconjugate(ZDL33))*complexconjugate(ZDR13))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_118 = Coupling(name = 'GC_118',
	 value = '-((ZDR31*(ZDL11*complexconjugate(Yd11) + ZDL12*complexconjugate(Yd21) + ZDL13*complexconjugate(Yd31)) + ZDR32*(ZDL11*complexconjugate(Yd12) + ZDL12*complexconjugate(Yd22) + ZDL13*complexconjugate(Yd32)) + ZDR33*(ZDL11*complexconjugate(Yd13) + ZDL12*complexconjugate(Yd23) + ZDL13*complexconjugate(Yd33)))/cmath.sqrt(2))', 
	 order = {'QED':1} ) 
 
GC_119 = Coupling(name = 'GC_119',
	 value = '((Yd11*complexconjugate(ZDL11) + Yd21*complexconjugate(ZDL12) + Yd31*complexconjugate(ZDL13))*complexconjugate(ZDR21) + (Yd12*complexconjugate(ZDL11) + Yd22*complexconjugate(ZDL12) + Yd32*complexconjugate(ZDL13))*complexconjugate(ZDR22) + (Yd13*complexconjugate(ZDL11) + Yd23*complexconjugate(ZDL12) + Yd33*complexconjugate(ZDL13))*complexconjugate(ZDR23))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_120 = Coupling(name = 'GC_120',
	 value = '-((ZDR11*(ZDL21*complexconjugate(Yd11) + ZDL22*complexconjugate(Yd21) + ZDL23*complexconjugate(Yd31)) + ZDR12*(ZDL21*complexconjugate(Yd12) + ZDL22*complexconjugate(Yd22) + ZDL23*complexconjugate(Yd32)) + ZDR13*(ZDL21*complexconjugate(Yd13) + ZDL22*complexconjugate(Yd23) + ZDL23*complexconjugate(Yd33)))/cmath.sqrt(2))', 
	 order = {'QED':1} ) 
 
GC_121 = Coupling(name = 'GC_121',
	 value = '((Yd11*complexconjugate(ZDL21) + Yd21*complexconjugate(ZDL22) + Yd31*complexconjugate(ZDL23))*complexconjugate(ZDR21) + (Yd12*complexconjugate(ZDL21) + Yd22*complexconjugate(ZDL22) + Yd32*complexconjugate(ZDL23))*complexconjugate(ZDR22) + (Yd13*complexconjugate(ZDL21) + Yd23*complexconjugate(ZDL22) + Yd33*complexconjugate(ZDL23))*complexconjugate(ZDR23))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_122 = Coupling(name = 'GC_122',
	 value = '-((ZDR21*(ZDL21*complexconjugate(Yd11) + ZDL22*complexconjugate(Yd21) + ZDL23*complexconjugate(Yd31)) + ZDR22*(ZDL21*complexconjugate(Yd12) + ZDL22*complexconjugate(Yd22) + ZDL23*complexconjugate(Yd32)) + ZDR23*(ZDL21*complexconjugate(Yd13) + ZDL22*complexconjugate(Yd23) + ZDL23*complexconjugate(Yd33)))/cmath.sqrt(2))', 
	 order = {'QED':1} ) 
 
GC_123 = Coupling(name = 'GC_123',
	 value = '((Yd11*complexconjugate(ZDL31) + Yd21*complexconjugate(ZDL32) + Yd31*complexconjugate(ZDL33))*complexconjugate(ZDR21) + (Yd12*complexconjugate(ZDL31) + Yd22*complexconjugate(ZDL32) + Yd32*complexconjugate(ZDL33))*complexconjugate(ZDR22) + (Yd13*complexconjugate(ZDL31) + Yd23*complexconjugate(ZDL32) + Yd33*complexconjugate(ZDL33))*complexconjugate(ZDR23))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_124 = Coupling(name = 'GC_124',
	 value = '-((ZDR31*(ZDL21*complexconjugate(Yd11) + ZDL22*complexconjugate(Yd21) + ZDL23*complexconjugate(Yd31)) + ZDR32*(ZDL21*complexconjugate(Yd12) + ZDL22*complexconjugate(Yd22) + ZDL23*complexconjugate(Yd32)) + ZDR33*(ZDL21*complexconjugate(Yd13) + ZDL22*complexconjugate(Yd23) + ZDL23*complexconjugate(Yd33)))/cmath.sqrt(2))', 
	 order = {'QED':1} ) 
 
GC_125 = Coupling(name = 'GC_125',
	 value = '((Yd11*complexconjugate(ZDL11) + Yd21*complexconjugate(ZDL12) + Yd31*complexconjugate(ZDL13))*complexconjugate(ZDR31) + (Yd12*complexconjugate(ZDL11) + Yd22*complexconjugate(ZDL12) + Yd32*complexconjugate(ZDL13))*complexconjugate(ZDR32) + (Yd13*complexconjugate(ZDL11) + Yd23*complexconjugate(ZDL12) + Yd33*complexconjugate(ZDL13))*complexconjugate(ZDR33))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_126 = Coupling(name = 'GC_126',
	 value = '-((ZDR11*(ZDL31*complexconjugate(Yd11) + ZDL32*complexconjugate(Yd21) + ZDL33*complexconjugate(Yd31)) + ZDR12*(ZDL31*complexconjugate(Yd12) + ZDL32*complexconjugate(Yd22) + ZDL33*complexconjugate(Yd32)) + ZDR13*(ZDL31*complexconjugate(Yd13) + ZDL32*complexconjugate(Yd23) + ZDL33*complexconjugate(Yd33)))/cmath.sqrt(2))', 
	 order = {'QED':1} ) 
 
GC_127 = Coupling(name = 'GC_127',
	 value = '((Yd11*complexconjugate(ZDL21) + Yd21*complexconjugate(ZDL22) + Yd31*complexconjugate(ZDL23))*complexconjugate(ZDR31) + (Yd12*complexconjugate(ZDL21) + Yd22*complexconjugate(ZDL22) + Yd32*complexconjugate(ZDL23))*complexconjugate(ZDR32) + (Yd13*complexconjugate(ZDL21) + Yd23*complexconjugate(ZDL22) + Yd33*complexconjugate(ZDL23))*complexconjugate(ZDR33))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_128 = Coupling(name = 'GC_128',
	 value = '-((ZDR21*(ZDL31*complexconjugate(Yd11) + ZDL32*complexconjugate(Yd21) + ZDL33*complexconjugate(Yd31)) + ZDR22*(ZDL31*complexconjugate(Yd12) + ZDL32*complexconjugate(Yd22) + ZDL33*complexconjugate(Yd32)) + ZDR23*(ZDL31*complexconjugate(Yd13) + ZDL32*complexconjugate(Yd23) + ZDL33*complexconjugate(Yd33)))/cmath.sqrt(2))', 
	 order = {'QED':1} ) 
 
GC_129 = Coupling(name = 'GC_129',
	 value = '((Yd11*complexconjugate(ZDL31) + Yd21*complexconjugate(ZDL32) + Yd31*complexconjugate(ZDL33))*complexconjugate(ZDR31) + (Yd12*complexconjugate(ZDL31) + Yd22*complexconjugate(ZDL32) + Yd32*complexconjugate(ZDL33))*complexconjugate(ZDR32) + (Yd13*complexconjugate(ZDL31) + Yd23*complexconjugate(ZDL32) + Yd33*complexconjugate(ZDL33))*complexconjugate(ZDR33))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_130 = Coupling(name = 'GC_130',
	 value = '-((ZDR31*(ZDL31*complexconjugate(Yd11) + ZDL32*complexconjugate(Yd21) + ZDL33*complexconjugate(Yd31)) + ZDR32*(ZDL31*complexconjugate(Yd12) + ZDL32*complexconjugate(Yd22) + ZDL33*complexconjugate(Yd32)) + ZDR33*(ZDL31*complexconjugate(Yd13) + ZDL32*complexconjugate(Yd23) + ZDL33*complexconjugate(Yd33)))/cmath.sqrt(2))', 
	 order = {'QED':1} ) 
 
GC_131 = Coupling(name = 'GC_131',
	 value = '(-1*complex(0,1)*((Yd11*complexconjugate(ZDL11) + Yd21*complexconjugate(ZDL12) + Yd31*complexconjugate(ZDL13))*complexconjugate(ZDR11) + (Yd12*complexconjugate(ZDL11) + Yd22*complexconjugate(ZDL12) + Yd32*complexconjugate(ZDL13))*complexconjugate(ZDR12) + (Yd13*complexconjugate(ZDL11) + Yd23*complexconjugate(ZDL12) + Yd33*complexconjugate(ZDL13))*complexconjugate(ZDR13)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_132 = Coupling(name = 'GC_132',
	 value = '(-1*complex(0,1)*(ZDR11*(ZDL11*complexconjugate(Yd11) + ZDL12*complexconjugate(Yd21) + ZDL13*complexconjugate(Yd31)) + ZDR12*(ZDL11*complexconjugate(Yd12) + ZDL12*complexconjugate(Yd22) + ZDL13*complexconjugate(Yd32)) + ZDR13*(ZDL11*complexconjugate(Yd13) + ZDL12*complexconjugate(Yd23) + ZDL13*complexconjugate(Yd33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_133 = Coupling(name = 'GC_133',
	 value = '(-1*complex(0,1)*((Yd11*complexconjugate(ZDL21) + Yd21*complexconjugate(ZDL22) + Yd31*complexconjugate(ZDL23))*complexconjugate(ZDR11) + (Yd12*complexconjugate(ZDL21) + Yd22*complexconjugate(ZDL22) + Yd32*complexconjugate(ZDL23))*complexconjugate(ZDR12) + (Yd13*complexconjugate(ZDL21) + Yd23*complexconjugate(ZDL22) + Yd33*complexconjugate(ZDL23))*complexconjugate(ZDR13)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_134 = Coupling(name = 'GC_134',
	 value = '(-1*complex(0,1)*(ZDR21*(ZDL11*complexconjugate(Yd11) + ZDL12*complexconjugate(Yd21) + ZDL13*complexconjugate(Yd31)) + ZDR22*(ZDL11*complexconjugate(Yd12) + ZDL12*complexconjugate(Yd22) + ZDL13*complexconjugate(Yd32)) + ZDR23*(ZDL11*complexconjugate(Yd13) + ZDL12*complexconjugate(Yd23) + ZDL13*complexconjugate(Yd33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_135 = Coupling(name = 'GC_135',
	 value = '(-1*complex(0,1)*((Yd11*complexconjugate(ZDL31) + Yd21*complexconjugate(ZDL32) + Yd31*complexconjugate(ZDL33))*complexconjugate(ZDR11) + (Yd12*complexconjugate(ZDL31) + Yd22*complexconjugate(ZDL32) + Yd32*complexconjugate(ZDL33))*complexconjugate(ZDR12) + (Yd13*complexconjugate(ZDL31) + Yd23*complexconjugate(ZDL32) + Yd33*complexconjugate(ZDL33))*complexconjugate(ZDR13)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_136 = Coupling(name = 'GC_136',
	 value = '(-1*complex(0,1)*(ZDR31*(ZDL11*complexconjugate(Yd11) + ZDL12*complexconjugate(Yd21) + ZDL13*complexconjugate(Yd31)) + ZDR32*(ZDL11*complexconjugate(Yd12) + ZDL12*complexconjugate(Yd22) + ZDL13*complexconjugate(Yd32)) + ZDR33*(ZDL11*complexconjugate(Yd13) + ZDL12*complexconjugate(Yd23) + ZDL13*complexconjugate(Yd33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_137 = Coupling(name = 'GC_137',
	 value = '(-1*complex(0,1)*((Yd11*complexconjugate(ZDL11) + Yd21*complexconjugate(ZDL12) + Yd31*complexconjugate(ZDL13))*complexconjugate(ZDR21) + (Yd12*complexconjugate(ZDL11) + Yd22*complexconjugate(ZDL12) + Yd32*complexconjugate(ZDL13))*complexconjugate(ZDR22) + (Yd13*complexconjugate(ZDL11) + Yd23*complexconjugate(ZDL12) + Yd33*complexconjugate(ZDL13))*complexconjugate(ZDR23)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_138 = Coupling(name = 'GC_138',
	 value = '(-1*complex(0,1)*(ZDR11*(ZDL21*complexconjugate(Yd11) + ZDL22*complexconjugate(Yd21) + ZDL23*complexconjugate(Yd31)) + ZDR12*(ZDL21*complexconjugate(Yd12) + ZDL22*complexconjugate(Yd22) + ZDL23*complexconjugate(Yd32)) + ZDR13*(ZDL21*complexconjugate(Yd13) + ZDL22*complexconjugate(Yd23) + ZDL23*complexconjugate(Yd33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_139 = Coupling(name = 'GC_139',
	 value = '(-1*complex(0,1)*((Yd11*complexconjugate(ZDL21) + Yd21*complexconjugate(ZDL22) + Yd31*complexconjugate(ZDL23))*complexconjugate(ZDR21) + (Yd12*complexconjugate(ZDL21) + Yd22*complexconjugate(ZDL22) + Yd32*complexconjugate(ZDL23))*complexconjugate(ZDR22) + (Yd13*complexconjugate(ZDL21) + Yd23*complexconjugate(ZDL22) + Yd33*complexconjugate(ZDL23))*complexconjugate(ZDR23)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_140 = Coupling(name = 'GC_140',
	 value = '(-1*complex(0,1)*(ZDR21*(ZDL21*complexconjugate(Yd11) + ZDL22*complexconjugate(Yd21) + ZDL23*complexconjugate(Yd31)) + ZDR22*(ZDL21*complexconjugate(Yd12) + ZDL22*complexconjugate(Yd22) + ZDL23*complexconjugate(Yd32)) + ZDR23*(ZDL21*complexconjugate(Yd13) + ZDL22*complexconjugate(Yd23) + ZDL23*complexconjugate(Yd33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_141 = Coupling(name = 'GC_141',
	 value = '(-1*complex(0,1)*((Yd11*complexconjugate(ZDL31) + Yd21*complexconjugate(ZDL32) + Yd31*complexconjugate(ZDL33))*complexconjugate(ZDR21) + (Yd12*complexconjugate(ZDL31) + Yd22*complexconjugate(ZDL32) + Yd32*complexconjugate(ZDL33))*complexconjugate(ZDR22) + (Yd13*complexconjugate(ZDL31) + Yd23*complexconjugate(ZDL32) + Yd33*complexconjugate(ZDL33))*complexconjugate(ZDR23)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_142 = Coupling(name = 'GC_142',
	 value = '(-1*complex(0,1)*(ZDR31*(ZDL21*complexconjugate(Yd11) + ZDL22*complexconjugate(Yd21) + ZDL23*complexconjugate(Yd31)) + ZDR32*(ZDL21*complexconjugate(Yd12) + ZDL22*complexconjugate(Yd22) + ZDL23*complexconjugate(Yd32)) + ZDR33*(ZDL21*complexconjugate(Yd13) + ZDL22*complexconjugate(Yd23) + ZDL23*complexconjugate(Yd33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_143 = Coupling(name = 'GC_143',
	 value = '(-1*complex(0,1)*((Yd11*complexconjugate(ZDL11) + Yd21*complexconjugate(ZDL12) + Yd31*complexconjugate(ZDL13))*complexconjugate(ZDR31) + (Yd12*complexconjugate(ZDL11) + Yd22*complexconjugate(ZDL12) + Yd32*complexconjugate(ZDL13))*complexconjugate(ZDR32) + (Yd13*complexconjugate(ZDL11) + Yd23*complexconjugate(ZDL12) + Yd33*complexconjugate(ZDL13))*complexconjugate(ZDR33)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_144 = Coupling(name = 'GC_144',
	 value = '(-1*complex(0,1)*(ZDR11*(ZDL31*complexconjugate(Yd11) + ZDL32*complexconjugate(Yd21) + ZDL33*complexconjugate(Yd31)) + ZDR12*(ZDL31*complexconjugate(Yd12) + ZDL32*complexconjugate(Yd22) + ZDL33*complexconjugate(Yd32)) + ZDR13*(ZDL31*complexconjugate(Yd13) + ZDL32*complexconjugate(Yd23) + ZDL33*complexconjugate(Yd33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_145 = Coupling(name = 'GC_145',
	 value = '(-1*complex(0,1)*((Yd11*complexconjugate(ZDL21) + Yd21*complexconjugate(ZDL22) + Yd31*complexconjugate(ZDL23))*complexconjugate(ZDR31) + (Yd12*complexconjugate(ZDL21) + Yd22*complexconjugate(ZDL22) + Yd32*complexconjugate(ZDL23))*complexconjugate(ZDR32) + (Yd13*complexconjugate(ZDL21) + Yd23*complexconjugate(ZDL22) + Yd33*complexconjugate(ZDL23))*complexconjugate(ZDR33)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_146 = Coupling(name = 'GC_146',
	 value = '(-1*complex(0,1)*(ZDR21*(ZDL31*complexconjugate(Yd11) + ZDL32*complexconjugate(Yd21) + ZDL33*complexconjugate(Yd31)) + ZDR22*(ZDL31*complexconjugate(Yd12) + ZDL32*complexconjugate(Yd22) + ZDL33*complexconjugate(Yd32)) + ZDR23*(ZDL31*complexconjugate(Yd13) + ZDL32*complexconjugate(Yd23) + ZDL33*complexconjugate(Yd33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_147 = Coupling(name = 'GC_147',
	 value = '(-1*complex(0,1)*((Yd11*complexconjugate(ZDL31) + Yd21*complexconjugate(ZDL32) + Yd31*complexconjugate(ZDL33))*complexconjugate(ZDR31) + (Yd12*complexconjugate(ZDL31) + Yd22*complexconjugate(ZDL32) + Yd32*complexconjugate(ZDL33))*complexconjugate(ZDR32) + (Yd13*complexconjugate(ZDL31) + Yd23*complexconjugate(ZDL32) + Yd33*complexconjugate(ZDL33))*complexconjugate(ZDR33)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_148 = Coupling(name = 'GC_148',
	 value = '(-1*complex(0,1)*(ZDR31*(ZDL31*complexconjugate(Yd11) + ZDL32*complexconjugate(Yd21) + ZDL33*complexconjugate(Yd31)) + ZDR32*(ZDL31*complexconjugate(Yd12) + ZDL32*complexconjugate(Yd22) + ZDL33*complexconjugate(Yd32)) + ZDR33*(ZDL31*complexconjugate(Yd13) + ZDL32*complexconjugate(Yd23) + ZDL33*complexconjugate(Yd33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_149 = Coupling(name = 'GC_149',
	 value = '-1*complex(0,1)*ZP12*((Yu11*complexconjugate(ZDL11) + Yu21*complexconjugate(ZDL12) + Yu31*complexconjugate(ZDL13))*complexconjugate(ZUR11) + (Yu12*complexconjugate(ZDL11) + Yu22*complexconjugate(ZDL12) + Yu32*complexconjugate(ZDL13))*complexconjugate(ZUR12) + (Yu13*complexconjugate(ZDL11) + Yu23*complexconjugate(ZDL12) + Yu33*complexconjugate(ZDL13))*complexconjugate(ZUR13))', 
	 order = {'QED':1} ) 
 
GC_150 = Coupling(name = 'GC_150',
	 value = '1*complex(0,1)*ZP12*(ZDR11*(ZUL11*complexconjugate(Yd11) + ZUL12*complexconjugate(Yd21) + ZUL13*complexconjugate(Yd31)) + ZDR12*(ZUL11*complexconjugate(Yd12) + ZUL12*complexconjugate(Yd22) + ZUL13*complexconjugate(Yd32)) + ZDR13*(ZUL11*complexconjugate(Yd13) + ZUL12*complexconjugate(Yd23) + ZUL13*complexconjugate(Yd33)))', 
	 order = {'QED':1} ) 
 
GC_151 = Coupling(name = 'GC_151',
	 value = '-1*complex(0,1)*ZP22*((Yu11*complexconjugate(ZDL11) + Yu21*complexconjugate(ZDL12) + Yu31*complexconjugate(ZDL13))*complexconjugate(ZUR11) + (Yu12*complexconjugate(ZDL11) + Yu22*complexconjugate(ZDL12) + Yu32*complexconjugate(ZDL13))*complexconjugate(ZUR12) + (Yu13*complexconjugate(ZDL11) + Yu23*complexconjugate(ZDL12) + Yu33*complexconjugate(ZDL13))*complexconjugate(ZUR13))', 
	 order = {'QED':1} ) 
 
GC_152 = Coupling(name = 'GC_152',
	 value = '1*complex(0,1)*ZP22*(ZDR11*(ZUL11*complexconjugate(Yd11) + ZUL12*complexconjugate(Yd21) + ZUL13*complexconjugate(Yd31)) + ZDR12*(ZUL11*complexconjugate(Yd12) + ZUL12*complexconjugate(Yd22) + ZUL13*complexconjugate(Yd32)) + ZDR13*(ZUL11*complexconjugate(Yd13) + ZUL12*complexconjugate(Yd23) + ZUL13*complexconjugate(Yd33)))', 
	 order = {'QED':1} ) 
 
GC_153 = Coupling(name = 'GC_153',
	 value = '-1*complex(0,1)*ZP12*((Yu11*complexconjugate(ZDL21) + Yu21*complexconjugate(ZDL22) + Yu31*complexconjugate(ZDL23))*complexconjugate(ZUR11) + (Yu12*complexconjugate(ZDL21) + Yu22*complexconjugate(ZDL22) + Yu32*complexconjugate(ZDL23))*complexconjugate(ZUR12) + (Yu13*complexconjugate(ZDL21) + Yu23*complexconjugate(ZDL22) + Yu33*complexconjugate(ZDL23))*complexconjugate(ZUR13))', 
	 order = {'QED':1} ) 
 
GC_154 = Coupling(name = 'GC_154',
	 value = '1*complex(0,1)*ZP12*(ZDR21*(ZUL11*complexconjugate(Yd11) + ZUL12*complexconjugate(Yd21) + ZUL13*complexconjugate(Yd31)) + ZDR22*(ZUL11*complexconjugate(Yd12) + ZUL12*complexconjugate(Yd22) + ZUL13*complexconjugate(Yd32)) + ZDR23*(ZUL11*complexconjugate(Yd13) + ZUL12*complexconjugate(Yd23) + ZUL13*complexconjugate(Yd33)))', 
	 order = {'QED':1} ) 
 
GC_155 = Coupling(name = 'GC_155',
	 value = '-1*complex(0,1)*ZP22*((Yu11*complexconjugate(ZDL21) + Yu21*complexconjugate(ZDL22) + Yu31*complexconjugate(ZDL23))*complexconjugate(ZUR11) + (Yu12*complexconjugate(ZDL21) + Yu22*complexconjugate(ZDL22) + Yu32*complexconjugate(ZDL23))*complexconjugate(ZUR12) + (Yu13*complexconjugate(ZDL21) + Yu23*complexconjugate(ZDL22) + Yu33*complexconjugate(ZDL23))*complexconjugate(ZUR13))', 
	 order = {'QED':1} ) 
 
GC_156 = Coupling(name = 'GC_156',
	 value = '1*complex(0,1)*ZP22*(ZDR21*(ZUL11*complexconjugate(Yd11) + ZUL12*complexconjugate(Yd21) + ZUL13*complexconjugate(Yd31)) + ZDR22*(ZUL11*complexconjugate(Yd12) + ZUL12*complexconjugate(Yd22) + ZUL13*complexconjugate(Yd32)) + ZDR23*(ZUL11*complexconjugate(Yd13) + ZUL12*complexconjugate(Yd23) + ZUL13*complexconjugate(Yd33)))', 
	 order = {'QED':1} ) 
 
GC_157 = Coupling(name = 'GC_157',
	 value = '-1*complex(0,1)*ZP12*((Yu11*complexconjugate(ZDL31) + Yu21*complexconjugate(ZDL32) + Yu31*complexconjugate(ZDL33))*complexconjugate(ZUR11) + (Yu12*complexconjugate(ZDL31) + Yu22*complexconjugate(ZDL32) + Yu32*complexconjugate(ZDL33))*complexconjugate(ZUR12) + (Yu13*complexconjugate(ZDL31) + Yu23*complexconjugate(ZDL32) + Yu33*complexconjugate(ZDL33))*complexconjugate(ZUR13))', 
	 order = {'QED':1} ) 
 
GC_158 = Coupling(name = 'GC_158',
	 value = '1*complex(0,1)*ZP12*(ZDR31*(ZUL11*complexconjugate(Yd11) + ZUL12*complexconjugate(Yd21) + ZUL13*complexconjugate(Yd31)) + ZDR32*(ZUL11*complexconjugate(Yd12) + ZUL12*complexconjugate(Yd22) + ZUL13*complexconjugate(Yd32)) + ZDR33*(ZUL11*complexconjugate(Yd13) + ZUL12*complexconjugate(Yd23) + ZUL13*complexconjugate(Yd33)))', 
	 order = {'QED':1} ) 
 
GC_159 = Coupling(name = 'GC_159',
	 value = '-1*complex(0,1)*ZP22*((Yu11*complexconjugate(ZDL31) + Yu21*complexconjugate(ZDL32) + Yu31*complexconjugate(ZDL33))*complexconjugate(ZUR11) + (Yu12*complexconjugate(ZDL31) + Yu22*complexconjugate(ZDL32) + Yu32*complexconjugate(ZDL33))*complexconjugate(ZUR12) + (Yu13*complexconjugate(ZDL31) + Yu23*complexconjugate(ZDL32) + Yu33*complexconjugate(ZDL33))*complexconjugate(ZUR13))', 
	 order = {'QED':1} ) 
 
GC_160 = Coupling(name = 'GC_160',
	 value = '1*complex(0,1)*ZP22*(ZDR31*(ZUL11*complexconjugate(Yd11) + ZUL12*complexconjugate(Yd21) + ZUL13*complexconjugate(Yd31)) + ZDR32*(ZUL11*complexconjugate(Yd12) + ZUL12*complexconjugate(Yd22) + ZUL13*complexconjugate(Yd32)) + ZDR33*(ZUL11*complexconjugate(Yd13) + ZUL12*complexconjugate(Yd23) + ZUL13*complexconjugate(Yd33)))', 
	 order = {'QED':1} ) 
 
GC_161 = Coupling(name = 'GC_161',
	 value = '-1*complex(0,1)*ZP12*((Yu11*complexconjugate(ZDL11) + Yu21*complexconjugate(ZDL12) + Yu31*complexconjugate(ZDL13))*complexconjugate(ZUR21) + (Yu12*complexconjugate(ZDL11) + Yu22*complexconjugate(ZDL12) + Yu32*complexconjugate(ZDL13))*complexconjugate(ZUR22) + (Yu13*complexconjugate(ZDL11) + Yu23*complexconjugate(ZDL12) + Yu33*complexconjugate(ZDL13))*complexconjugate(ZUR23))', 
	 order = {'QED':1} ) 
 
GC_162 = Coupling(name = 'GC_162',
	 value = '1*complex(0,1)*ZP12*(ZDR11*(ZUL21*complexconjugate(Yd11) + ZUL22*complexconjugate(Yd21) + ZUL23*complexconjugate(Yd31)) + ZDR12*(ZUL21*complexconjugate(Yd12) + ZUL22*complexconjugate(Yd22) + ZUL23*complexconjugate(Yd32)) + ZDR13*(ZUL21*complexconjugate(Yd13) + ZUL22*complexconjugate(Yd23) + ZUL23*complexconjugate(Yd33)))', 
	 order = {'QED':1} ) 
 
GC_163 = Coupling(name = 'GC_163',
	 value = '-1*complex(0,1)*ZP22*((Yu11*complexconjugate(ZDL11) + Yu21*complexconjugate(ZDL12) + Yu31*complexconjugate(ZDL13))*complexconjugate(ZUR21) + (Yu12*complexconjugate(ZDL11) + Yu22*complexconjugate(ZDL12) + Yu32*complexconjugate(ZDL13))*complexconjugate(ZUR22) + (Yu13*complexconjugate(ZDL11) + Yu23*complexconjugate(ZDL12) + Yu33*complexconjugate(ZDL13))*complexconjugate(ZUR23))', 
	 order = {'QED':1} ) 
 
GC_164 = Coupling(name = 'GC_164',
	 value = '1*complex(0,1)*ZP22*(ZDR11*(ZUL21*complexconjugate(Yd11) + ZUL22*complexconjugate(Yd21) + ZUL23*complexconjugate(Yd31)) + ZDR12*(ZUL21*complexconjugate(Yd12) + ZUL22*complexconjugate(Yd22) + ZUL23*complexconjugate(Yd32)) + ZDR13*(ZUL21*complexconjugate(Yd13) + ZUL22*complexconjugate(Yd23) + ZUL23*complexconjugate(Yd33)))', 
	 order = {'QED':1} ) 
 
GC_165 = Coupling(name = 'GC_165',
	 value = '-1*complex(0,1)*ZP12*((Yu11*complexconjugate(ZDL21) + Yu21*complexconjugate(ZDL22) + Yu31*complexconjugate(ZDL23))*complexconjugate(ZUR21) + (Yu12*complexconjugate(ZDL21) + Yu22*complexconjugate(ZDL22) + Yu32*complexconjugate(ZDL23))*complexconjugate(ZUR22) + (Yu13*complexconjugate(ZDL21) + Yu23*complexconjugate(ZDL22) + Yu33*complexconjugate(ZDL23))*complexconjugate(ZUR23))', 
	 order = {'QED':1} ) 
 
GC_166 = Coupling(name = 'GC_166',
	 value = '1*complex(0,1)*ZP12*(ZDR21*(ZUL21*complexconjugate(Yd11) + ZUL22*complexconjugate(Yd21) + ZUL23*complexconjugate(Yd31)) + ZDR22*(ZUL21*complexconjugate(Yd12) + ZUL22*complexconjugate(Yd22) + ZUL23*complexconjugate(Yd32)) + ZDR23*(ZUL21*complexconjugate(Yd13) + ZUL22*complexconjugate(Yd23) + ZUL23*complexconjugate(Yd33)))', 
	 order = {'QED':1} ) 
 
GC_167 = Coupling(name = 'GC_167',
	 value = '-1*complex(0,1)*ZP22*((Yu11*complexconjugate(ZDL21) + Yu21*complexconjugate(ZDL22) + Yu31*complexconjugate(ZDL23))*complexconjugate(ZUR21) + (Yu12*complexconjugate(ZDL21) + Yu22*complexconjugate(ZDL22) + Yu32*complexconjugate(ZDL23))*complexconjugate(ZUR22) + (Yu13*complexconjugate(ZDL21) + Yu23*complexconjugate(ZDL22) + Yu33*complexconjugate(ZDL23))*complexconjugate(ZUR23))', 
	 order = {'QED':1} ) 
 
GC_168 = Coupling(name = 'GC_168',
	 value = '1*complex(0,1)*ZP22*(ZDR21*(ZUL21*complexconjugate(Yd11) + ZUL22*complexconjugate(Yd21) + ZUL23*complexconjugate(Yd31)) + ZDR22*(ZUL21*complexconjugate(Yd12) + ZUL22*complexconjugate(Yd22) + ZUL23*complexconjugate(Yd32)) + ZDR23*(ZUL21*complexconjugate(Yd13) + ZUL22*complexconjugate(Yd23) + ZUL23*complexconjugate(Yd33)))', 
	 order = {'QED':1} ) 
 
GC_169 = Coupling(name = 'GC_169',
	 value = '-1*complex(0,1)*ZP12*((Yu11*complexconjugate(ZDL31) + Yu21*complexconjugate(ZDL32) + Yu31*complexconjugate(ZDL33))*complexconjugate(ZUR21) + (Yu12*complexconjugate(ZDL31) + Yu22*complexconjugate(ZDL32) + Yu32*complexconjugate(ZDL33))*complexconjugate(ZUR22) + (Yu13*complexconjugate(ZDL31) + Yu23*complexconjugate(ZDL32) + Yu33*complexconjugate(ZDL33))*complexconjugate(ZUR23))', 
	 order = {'QED':1} ) 
 
GC_170 = Coupling(name = 'GC_170',
	 value = '1*complex(0,1)*ZP12*(ZDR31*(ZUL21*complexconjugate(Yd11) + ZUL22*complexconjugate(Yd21) + ZUL23*complexconjugate(Yd31)) + ZDR32*(ZUL21*complexconjugate(Yd12) + ZUL22*complexconjugate(Yd22) + ZUL23*complexconjugate(Yd32)) + ZDR33*(ZUL21*complexconjugate(Yd13) + ZUL22*complexconjugate(Yd23) + ZUL23*complexconjugate(Yd33)))', 
	 order = {'QED':1} ) 
 
GC_171 = Coupling(name = 'GC_171',
	 value = '-1*complex(0,1)*ZP22*((Yu11*complexconjugate(ZDL31) + Yu21*complexconjugate(ZDL32) + Yu31*complexconjugate(ZDL33))*complexconjugate(ZUR21) + (Yu12*complexconjugate(ZDL31) + Yu22*complexconjugate(ZDL32) + Yu32*complexconjugate(ZDL33))*complexconjugate(ZUR22) + (Yu13*complexconjugate(ZDL31) + Yu23*complexconjugate(ZDL32) + Yu33*complexconjugate(ZDL33))*complexconjugate(ZUR23))', 
	 order = {'QED':1} ) 
 
GC_172 = Coupling(name = 'GC_172',
	 value = '1*complex(0,1)*ZP22*(ZDR31*(ZUL21*complexconjugate(Yd11) + ZUL22*complexconjugate(Yd21) + ZUL23*complexconjugate(Yd31)) + ZDR32*(ZUL21*complexconjugate(Yd12) + ZUL22*complexconjugate(Yd22) + ZUL23*complexconjugate(Yd32)) + ZDR33*(ZUL21*complexconjugate(Yd13) + ZUL22*complexconjugate(Yd23) + ZUL23*complexconjugate(Yd33)))', 
	 order = {'QED':1} ) 
 
GC_173 = Coupling(name = 'GC_173',
	 value = '-1*complex(0,1)*ZP12*((Yu11*complexconjugate(ZDL11) + Yu21*complexconjugate(ZDL12) + Yu31*complexconjugate(ZDL13))*complexconjugate(ZUR31) + (Yu12*complexconjugate(ZDL11) + Yu22*complexconjugate(ZDL12) + Yu32*complexconjugate(ZDL13))*complexconjugate(ZUR32) + (Yu13*complexconjugate(ZDL11) + Yu23*complexconjugate(ZDL12) + Yu33*complexconjugate(ZDL13))*complexconjugate(ZUR33))', 
	 order = {'QED':1} ) 
 
GC_174 = Coupling(name = 'GC_174',
	 value = '1*complex(0,1)*ZP12*(ZDR11*(ZUL31*complexconjugate(Yd11) + ZUL32*complexconjugate(Yd21) + ZUL33*complexconjugate(Yd31)) + ZDR12*(ZUL31*complexconjugate(Yd12) + ZUL32*complexconjugate(Yd22) + ZUL33*complexconjugate(Yd32)) + ZDR13*(ZUL31*complexconjugate(Yd13) + ZUL32*complexconjugate(Yd23) + ZUL33*complexconjugate(Yd33)))', 
	 order = {'QED':1} ) 
 
GC_175 = Coupling(name = 'GC_175',
	 value = '-1*complex(0,1)*ZP22*((Yu11*complexconjugate(ZDL11) + Yu21*complexconjugate(ZDL12) + Yu31*complexconjugate(ZDL13))*complexconjugate(ZUR31) + (Yu12*complexconjugate(ZDL11) + Yu22*complexconjugate(ZDL12) + Yu32*complexconjugate(ZDL13))*complexconjugate(ZUR32) + (Yu13*complexconjugate(ZDL11) + Yu23*complexconjugate(ZDL12) + Yu33*complexconjugate(ZDL13))*complexconjugate(ZUR33))', 
	 order = {'QED':1} ) 
 
GC_176 = Coupling(name = 'GC_176',
	 value = '1*complex(0,1)*ZP22*(ZDR11*(ZUL31*complexconjugate(Yd11) + ZUL32*complexconjugate(Yd21) + ZUL33*complexconjugate(Yd31)) + ZDR12*(ZUL31*complexconjugate(Yd12) + ZUL32*complexconjugate(Yd22) + ZUL33*complexconjugate(Yd32)) + ZDR13*(ZUL31*complexconjugate(Yd13) + ZUL32*complexconjugate(Yd23) + ZUL33*complexconjugate(Yd33)))', 
	 order = {'QED':1} ) 
 
GC_177 = Coupling(name = 'GC_177',
	 value = '-1*complex(0,1)*ZP12*((Yu11*complexconjugate(ZDL21) + Yu21*complexconjugate(ZDL22) + Yu31*complexconjugate(ZDL23))*complexconjugate(ZUR31) + (Yu12*complexconjugate(ZDL21) + Yu22*complexconjugate(ZDL22) + Yu32*complexconjugate(ZDL23))*complexconjugate(ZUR32) + (Yu13*complexconjugate(ZDL21) + Yu23*complexconjugate(ZDL22) + Yu33*complexconjugate(ZDL23))*complexconjugate(ZUR33))', 
	 order = {'QED':1} ) 
 
GC_178 = Coupling(name = 'GC_178',
	 value = '1*complex(0,1)*ZP12*(ZDR21*(ZUL31*complexconjugate(Yd11) + ZUL32*complexconjugate(Yd21) + ZUL33*complexconjugate(Yd31)) + ZDR22*(ZUL31*complexconjugate(Yd12) + ZUL32*complexconjugate(Yd22) + ZUL33*complexconjugate(Yd32)) + ZDR23*(ZUL31*complexconjugate(Yd13) + ZUL32*complexconjugate(Yd23) + ZUL33*complexconjugate(Yd33)))', 
	 order = {'QED':1} ) 
 
GC_179 = Coupling(name = 'GC_179',
	 value = '-1*complex(0,1)*ZP22*((Yu11*complexconjugate(ZDL21) + Yu21*complexconjugate(ZDL22) + Yu31*complexconjugate(ZDL23))*complexconjugate(ZUR31) + (Yu12*complexconjugate(ZDL21) + Yu22*complexconjugate(ZDL22) + Yu32*complexconjugate(ZDL23))*complexconjugate(ZUR32) + (Yu13*complexconjugate(ZDL21) + Yu23*complexconjugate(ZDL22) + Yu33*complexconjugate(ZDL23))*complexconjugate(ZUR33))', 
	 order = {'QED':1} ) 
 
GC_180 = Coupling(name = 'GC_180',
	 value = '1*complex(0,1)*ZP22*(ZDR21*(ZUL31*complexconjugate(Yd11) + ZUL32*complexconjugate(Yd21) + ZUL33*complexconjugate(Yd31)) + ZDR22*(ZUL31*complexconjugate(Yd12) + ZUL32*complexconjugate(Yd22) + ZUL33*complexconjugate(Yd32)) + ZDR23*(ZUL31*complexconjugate(Yd13) + ZUL32*complexconjugate(Yd23) + ZUL33*complexconjugate(Yd33)))', 
	 order = {'QED':1} ) 
 
GC_181 = Coupling(name = 'GC_181',
	 value = '-1*complex(0,1)*ZP12*((Yu11*complexconjugate(ZDL31) + Yu21*complexconjugate(ZDL32) + Yu31*complexconjugate(ZDL33))*complexconjugate(ZUR31) + (Yu12*complexconjugate(ZDL31) + Yu22*complexconjugate(ZDL32) + Yu32*complexconjugate(ZDL33))*complexconjugate(ZUR32) + (Yu13*complexconjugate(ZDL31) + Yu23*complexconjugate(ZDL32) + Yu33*complexconjugate(ZDL33))*complexconjugate(ZUR33))', 
	 order = {'QED':1} ) 
 
GC_182 = Coupling(name = 'GC_182',
	 value = '1*complex(0,1)*ZP12*(ZDR31*(ZUL31*complexconjugate(Yd11) + ZUL32*complexconjugate(Yd21) + ZUL33*complexconjugate(Yd31)) + ZDR32*(ZUL31*complexconjugate(Yd12) + ZUL32*complexconjugate(Yd22) + ZUL33*complexconjugate(Yd32)) + ZDR33*(ZUL31*complexconjugate(Yd13) + ZUL32*complexconjugate(Yd23) + ZUL33*complexconjugate(Yd33)))', 
	 order = {'QED':1} ) 
 
GC_183 = Coupling(name = 'GC_183',
	 value = '-1*complex(0,1)*ZP22*((Yu11*complexconjugate(ZDL31) + Yu21*complexconjugate(ZDL32) + Yu31*complexconjugate(ZDL33))*complexconjugate(ZUR31) + (Yu12*complexconjugate(ZDL31) + Yu22*complexconjugate(ZDL32) + Yu32*complexconjugate(ZDL33))*complexconjugate(ZUR32) + (Yu13*complexconjugate(ZDL31) + Yu23*complexconjugate(ZDL32) + Yu33*complexconjugate(ZDL33))*complexconjugate(ZUR33))', 
	 order = {'QED':1} ) 
 
GC_184 = Coupling(name = 'GC_184',
	 value = '1*complex(0,1)*ZP22*(ZDR31*(ZUL31*complexconjugate(Yd11) + ZUL32*complexconjugate(Yd21) + ZUL33*complexconjugate(Yd31)) + ZDR32*(ZUL31*complexconjugate(Yd12) + ZUL32*complexconjugate(Yd22) + ZUL33*complexconjugate(Yd32)) + ZDR33*(ZUL31*complexconjugate(Yd13) + ZUL32*complexconjugate(Yd23) + ZUL33*complexconjugate(Yd33)))', 
	 order = {'QED':1} ) 
 
GC_185 = Coupling(name = 'GC_185',
	 value = '((Ye11*complexconjugate(ZEL11) + Ye21*complexconjugate(ZEL12) + Ye31*complexconjugate(ZEL13))*complexconjugate(ZER11) + (Ye12*complexconjugate(ZEL11) + Ye22*complexconjugate(ZEL12) + Ye32*complexconjugate(ZEL13))*complexconjugate(ZER12) + (Ye13*complexconjugate(ZEL11) + Ye23*complexconjugate(ZEL12) + Ye33*complexconjugate(ZEL13))*complexconjugate(ZER13))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_186 = Coupling(name = 'GC_186',
	 value = '-((ZER11*(ZEL11*complexconjugate(Ye11) + ZEL12*complexconjugate(Ye21) + ZEL13*complexconjugate(Ye31)) + ZER12*(ZEL11*complexconjugate(Ye12) + ZEL12*complexconjugate(Ye22) + ZEL13*complexconjugate(Ye32)) + ZER13*(ZEL11*complexconjugate(Ye13) + ZEL12*complexconjugate(Ye23) + ZEL13*complexconjugate(Ye33)))/cmath.sqrt(2))', 
	 order = {'QED':1} ) 
 
GC_187 = Coupling(name = 'GC_187',
	 value = '((Ye11*complexconjugate(ZEL21) + Ye21*complexconjugate(ZEL22) + Ye31*complexconjugate(ZEL23))*complexconjugate(ZER11) + (Ye12*complexconjugate(ZEL21) + Ye22*complexconjugate(ZEL22) + Ye32*complexconjugate(ZEL23))*complexconjugate(ZER12) + (Ye13*complexconjugate(ZEL21) + Ye23*complexconjugate(ZEL22) + Ye33*complexconjugate(ZEL23))*complexconjugate(ZER13))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_188 = Coupling(name = 'GC_188',
	 value = '-((ZER21*(ZEL11*complexconjugate(Ye11) + ZEL12*complexconjugate(Ye21) + ZEL13*complexconjugate(Ye31)) + ZER22*(ZEL11*complexconjugate(Ye12) + ZEL12*complexconjugate(Ye22) + ZEL13*complexconjugate(Ye32)) + ZER23*(ZEL11*complexconjugate(Ye13) + ZEL12*complexconjugate(Ye23) + ZEL13*complexconjugate(Ye33)))/cmath.sqrt(2))', 
	 order = {'QED':1} ) 
 
GC_189 = Coupling(name = 'GC_189',
	 value = '((Ye11*complexconjugate(ZEL31) + Ye21*complexconjugate(ZEL32) + Ye31*complexconjugate(ZEL33))*complexconjugate(ZER11) + (Ye12*complexconjugate(ZEL31) + Ye22*complexconjugate(ZEL32) + Ye32*complexconjugate(ZEL33))*complexconjugate(ZER12) + (Ye13*complexconjugate(ZEL31) + Ye23*complexconjugate(ZEL32) + Ye33*complexconjugate(ZEL33))*complexconjugate(ZER13))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_190 = Coupling(name = 'GC_190',
	 value = '-((ZER31*(ZEL11*complexconjugate(Ye11) + ZEL12*complexconjugate(Ye21) + ZEL13*complexconjugate(Ye31)) + ZER32*(ZEL11*complexconjugate(Ye12) + ZEL12*complexconjugate(Ye22) + ZEL13*complexconjugate(Ye32)) + ZER33*(ZEL11*complexconjugate(Ye13) + ZEL12*complexconjugate(Ye23) + ZEL13*complexconjugate(Ye33)))/cmath.sqrt(2))', 
	 order = {'QED':1} ) 
 
GC_191 = Coupling(name = 'GC_191',
	 value = '((Ye11*complexconjugate(ZEL11) + Ye21*complexconjugate(ZEL12) + Ye31*complexconjugate(ZEL13))*complexconjugate(ZER21) + (Ye12*complexconjugate(ZEL11) + Ye22*complexconjugate(ZEL12) + Ye32*complexconjugate(ZEL13))*complexconjugate(ZER22) + (Ye13*complexconjugate(ZEL11) + Ye23*complexconjugate(ZEL12) + Ye33*complexconjugate(ZEL13))*complexconjugate(ZER23))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_192 = Coupling(name = 'GC_192',
	 value = '-((ZER11*(ZEL21*complexconjugate(Ye11) + ZEL22*complexconjugate(Ye21) + ZEL23*complexconjugate(Ye31)) + ZER12*(ZEL21*complexconjugate(Ye12) + ZEL22*complexconjugate(Ye22) + ZEL23*complexconjugate(Ye32)) + ZER13*(ZEL21*complexconjugate(Ye13) + ZEL22*complexconjugate(Ye23) + ZEL23*complexconjugate(Ye33)))/cmath.sqrt(2))', 
	 order = {'QED':1} ) 
 
GC_193 = Coupling(name = 'GC_193',
	 value = '((Ye11*complexconjugate(ZEL21) + Ye21*complexconjugate(ZEL22) + Ye31*complexconjugate(ZEL23))*complexconjugate(ZER21) + (Ye12*complexconjugate(ZEL21) + Ye22*complexconjugate(ZEL22) + Ye32*complexconjugate(ZEL23))*complexconjugate(ZER22) + (Ye13*complexconjugate(ZEL21) + Ye23*complexconjugate(ZEL22) + Ye33*complexconjugate(ZEL23))*complexconjugate(ZER23))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_194 = Coupling(name = 'GC_194',
	 value = '-((ZER21*(ZEL21*complexconjugate(Ye11) + ZEL22*complexconjugate(Ye21) + ZEL23*complexconjugate(Ye31)) + ZER22*(ZEL21*complexconjugate(Ye12) + ZEL22*complexconjugate(Ye22) + ZEL23*complexconjugate(Ye32)) + ZER23*(ZEL21*complexconjugate(Ye13) + ZEL22*complexconjugate(Ye23) + ZEL23*complexconjugate(Ye33)))/cmath.sqrt(2))', 
	 order = {'QED':1} ) 
 
GC_195 = Coupling(name = 'GC_195',
	 value = '((Ye11*complexconjugate(ZEL31) + Ye21*complexconjugate(ZEL32) + Ye31*complexconjugate(ZEL33))*complexconjugate(ZER21) + (Ye12*complexconjugate(ZEL31) + Ye22*complexconjugate(ZEL32) + Ye32*complexconjugate(ZEL33))*complexconjugate(ZER22) + (Ye13*complexconjugate(ZEL31) + Ye23*complexconjugate(ZEL32) + Ye33*complexconjugate(ZEL33))*complexconjugate(ZER23))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_196 = Coupling(name = 'GC_196',
	 value = '-((ZER31*(ZEL21*complexconjugate(Ye11) + ZEL22*complexconjugate(Ye21) + ZEL23*complexconjugate(Ye31)) + ZER32*(ZEL21*complexconjugate(Ye12) + ZEL22*complexconjugate(Ye22) + ZEL23*complexconjugate(Ye32)) + ZER33*(ZEL21*complexconjugate(Ye13) + ZEL22*complexconjugate(Ye23) + ZEL23*complexconjugate(Ye33)))/cmath.sqrt(2))', 
	 order = {'QED':1} ) 
 
GC_197 = Coupling(name = 'GC_197',
	 value = '((Ye11*complexconjugate(ZEL11) + Ye21*complexconjugate(ZEL12) + Ye31*complexconjugate(ZEL13))*complexconjugate(ZER31) + (Ye12*complexconjugate(ZEL11) + Ye22*complexconjugate(ZEL12) + Ye32*complexconjugate(ZEL13))*complexconjugate(ZER32) + (Ye13*complexconjugate(ZEL11) + Ye23*complexconjugate(ZEL12) + Ye33*complexconjugate(ZEL13))*complexconjugate(ZER33))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_198 = Coupling(name = 'GC_198',
	 value = '-((ZER11*(ZEL31*complexconjugate(Ye11) + ZEL32*complexconjugate(Ye21) + ZEL33*complexconjugate(Ye31)) + ZER12*(ZEL31*complexconjugate(Ye12) + ZEL32*complexconjugate(Ye22) + ZEL33*complexconjugate(Ye32)) + ZER13*(ZEL31*complexconjugate(Ye13) + ZEL32*complexconjugate(Ye23) + ZEL33*complexconjugate(Ye33)))/cmath.sqrt(2))', 
	 order = {'QED':1} ) 
 
GC_199 = Coupling(name = 'GC_199',
	 value = '((Ye11*complexconjugate(ZEL21) + Ye21*complexconjugate(ZEL22) + Ye31*complexconjugate(ZEL23))*complexconjugate(ZER31) + (Ye12*complexconjugate(ZEL21) + Ye22*complexconjugate(ZEL22) + Ye32*complexconjugate(ZEL23))*complexconjugate(ZER32) + (Ye13*complexconjugate(ZEL21) + Ye23*complexconjugate(ZEL22) + Ye33*complexconjugate(ZEL23))*complexconjugate(ZER33))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_200 = Coupling(name = 'GC_200',
	 value = '-((ZER21*(ZEL31*complexconjugate(Ye11) + ZEL32*complexconjugate(Ye21) + ZEL33*complexconjugate(Ye31)) + ZER22*(ZEL31*complexconjugate(Ye12) + ZEL32*complexconjugate(Ye22) + ZEL33*complexconjugate(Ye32)) + ZER23*(ZEL31*complexconjugate(Ye13) + ZEL32*complexconjugate(Ye23) + ZEL33*complexconjugate(Ye33)))/cmath.sqrt(2))', 
	 order = {'QED':1} ) 
 
GC_201 = Coupling(name = 'GC_201',
	 value = '((Ye11*complexconjugate(ZEL31) + Ye21*complexconjugate(ZEL32) + Ye31*complexconjugate(ZEL33))*complexconjugate(ZER31) + (Ye12*complexconjugate(ZEL31) + Ye22*complexconjugate(ZEL32) + Ye32*complexconjugate(ZEL33))*complexconjugate(ZER32) + (Ye13*complexconjugate(ZEL31) + Ye23*complexconjugate(ZEL32) + Ye33*complexconjugate(ZEL33))*complexconjugate(ZER33))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_202 = Coupling(name = 'GC_202',
	 value = '-((ZER31*(ZEL31*complexconjugate(Ye11) + ZEL32*complexconjugate(Ye21) + ZEL33*complexconjugate(Ye31)) + ZER32*(ZEL31*complexconjugate(Ye12) + ZEL32*complexconjugate(Ye22) + ZEL33*complexconjugate(Ye32)) + ZER33*(ZEL31*complexconjugate(Ye13) + ZEL32*complexconjugate(Ye23) + ZEL33*complexconjugate(Ye33)))/cmath.sqrt(2))', 
	 order = {'QED':1} ) 
 
GC_203 = Coupling(name = 'GC_203',
	 value = '(-1*complex(0,1)*((Ye11*complexconjugate(ZEL11) + Ye21*complexconjugate(ZEL12) + Ye31*complexconjugate(ZEL13))*complexconjugate(ZER11) + (Ye12*complexconjugate(ZEL11) + Ye22*complexconjugate(ZEL12) + Ye32*complexconjugate(ZEL13))*complexconjugate(ZER12) + (Ye13*complexconjugate(ZEL11) + Ye23*complexconjugate(ZEL12) + Ye33*complexconjugate(ZEL13))*complexconjugate(ZER13)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_204 = Coupling(name = 'GC_204',
	 value = '(-1*complex(0,1)*(ZER11*(ZEL11*complexconjugate(Ye11) + ZEL12*complexconjugate(Ye21) + ZEL13*complexconjugate(Ye31)) + ZER12*(ZEL11*complexconjugate(Ye12) + ZEL12*complexconjugate(Ye22) + ZEL13*complexconjugate(Ye32)) + ZER13*(ZEL11*complexconjugate(Ye13) + ZEL12*complexconjugate(Ye23) + ZEL13*complexconjugate(Ye33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_205 = Coupling(name = 'GC_205',
	 value = '(-1*complex(0,1)*((Ye11*complexconjugate(ZEL21) + Ye21*complexconjugate(ZEL22) + Ye31*complexconjugate(ZEL23))*complexconjugate(ZER11) + (Ye12*complexconjugate(ZEL21) + Ye22*complexconjugate(ZEL22) + Ye32*complexconjugate(ZEL23))*complexconjugate(ZER12) + (Ye13*complexconjugate(ZEL21) + Ye23*complexconjugate(ZEL22) + Ye33*complexconjugate(ZEL23))*complexconjugate(ZER13)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_206 = Coupling(name = 'GC_206',
	 value = '(-1*complex(0,1)*(ZER21*(ZEL11*complexconjugate(Ye11) + ZEL12*complexconjugate(Ye21) + ZEL13*complexconjugate(Ye31)) + ZER22*(ZEL11*complexconjugate(Ye12) + ZEL12*complexconjugate(Ye22) + ZEL13*complexconjugate(Ye32)) + ZER23*(ZEL11*complexconjugate(Ye13) + ZEL12*complexconjugate(Ye23) + ZEL13*complexconjugate(Ye33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_207 = Coupling(name = 'GC_207',
	 value = '(-1*complex(0,1)*((Ye11*complexconjugate(ZEL31) + Ye21*complexconjugate(ZEL32) + Ye31*complexconjugate(ZEL33))*complexconjugate(ZER11) + (Ye12*complexconjugate(ZEL31) + Ye22*complexconjugate(ZEL32) + Ye32*complexconjugate(ZEL33))*complexconjugate(ZER12) + (Ye13*complexconjugate(ZEL31) + Ye23*complexconjugate(ZEL32) + Ye33*complexconjugate(ZEL33))*complexconjugate(ZER13)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_208 = Coupling(name = 'GC_208',
	 value = '(-1*complex(0,1)*(ZER31*(ZEL11*complexconjugate(Ye11) + ZEL12*complexconjugate(Ye21) + ZEL13*complexconjugate(Ye31)) + ZER32*(ZEL11*complexconjugate(Ye12) + ZEL12*complexconjugate(Ye22) + ZEL13*complexconjugate(Ye32)) + ZER33*(ZEL11*complexconjugate(Ye13) + ZEL12*complexconjugate(Ye23) + ZEL13*complexconjugate(Ye33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_209 = Coupling(name = 'GC_209',
	 value = '(-1*complex(0,1)*((Ye11*complexconjugate(ZEL11) + Ye21*complexconjugate(ZEL12) + Ye31*complexconjugate(ZEL13))*complexconjugate(ZER21) + (Ye12*complexconjugate(ZEL11) + Ye22*complexconjugate(ZEL12) + Ye32*complexconjugate(ZEL13))*complexconjugate(ZER22) + (Ye13*complexconjugate(ZEL11) + Ye23*complexconjugate(ZEL12) + Ye33*complexconjugate(ZEL13))*complexconjugate(ZER23)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_210 = Coupling(name = 'GC_210',
	 value = '(-1*complex(0,1)*(ZER11*(ZEL21*complexconjugate(Ye11) + ZEL22*complexconjugate(Ye21) + ZEL23*complexconjugate(Ye31)) + ZER12*(ZEL21*complexconjugate(Ye12) + ZEL22*complexconjugate(Ye22) + ZEL23*complexconjugate(Ye32)) + ZER13*(ZEL21*complexconjugate(Ye13) + ZEL22*complexconjugate(Ye23) + ZEL23*complexconjugate(Ye33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_211 = Coupling(name = 'GC_211',
	 value = '(-1*complex(0,1)*((Ye11*complexconjugate(ZEL21) + Ye21*complexconjugate(ZEL22) + Ye31*complexconjugate(ZEL23))*complexconjugate(ZER21) + (Ye12*complexconjugate(ZEL21) + Ye22*complexconjugate(ZEL22) + Ye32*complexconjugate(ZEL23))*complexconjugate(ZER22) + (Ye13*complexconjugate(ZEL21) + Ye23*complexconjugate(ZEL22) + Ye33*complexconjugate(ZEL23))*complexconjugate(ZER23)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_212 = Coupling(name = 'GC_212',
	 value = '(-1*complex(0,1)*(ZER21*(ZEL21*complexconjugate(Ye11) + ZEL22*complexconjugate(Ye21) + ZEL23*complexconjugate(Ye31)) + ZER22*(ZEL21*complexconjugate(Ye12) + ZEL22*complexconjugate(Ye22) + ZEL23*complexconjugate(Ye32)) + ZER23*(ZEL21*complexconjugate(Ye13) + ZEL22*complexconjugate(Ye23) + ZEL23*complexconjugate(Ye33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_213 = Coupling(name = 'GC_213',
	 value = '(-1*complex(0,1)*((Ye11*complexconjugate(ZEL31) + Ye21*complexconjugate(ZEL32) + Ye31*complexconjugate(ZEL33))*complexconjugate(ZER21) + (Ye12*complexconjugate(ZEL31) + Ye22*complexconjugate(ZEL32) + Ye32*complexconjugate(ZEL33))*complexconjugate(ZER22) + (Ye13*complexconjugate(ZEL31) + Ye23*complexconjugate(ZEL32) + Ye33*complexconjugate(ZEL33))*complexconjugate(ZER23)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_214 = Coupling(name = 'GC_214',
	 value = '(-1*complex(0,1)*(ZER31*(ZEL21*complexconjugate(Ye11) + ZEL22*complexconjugate(Ye21) + ZEL23*complexconjugate(Ye31)) + ZER32*(ZEL21*complexconjugate(Ye12) + ZEL22*complexconjugate(Ye22) + ZEL23*complexconjugate(Ye32)) + ZER33*(ZEL21*complexconjugate(Ye13) + ZEL22*complexconjugate(Ye23) + ZEL23*complexconjugate(Ye33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_215 = Coupling(name = 'GC_215',
	 value = '(-1*complex(0,1)*((Ye11*complexconjugate(ZEL11) + Ye21*complexconjugate(ZEL12) + Ye31*complexconjugate(ZEL13))*complexconjugate(ZER31) + (Ye12*complexconjugate(ZEL11) + Ye22*complexconjugate(ZEL12) + Ye32*complexconjugate(ZEL13))*complexconjugate(ZER32) + (Ye13*complexconjugate(ZEL11) + Ye23*complexconjugate(ZEL12) + Ye33*complexconjugate(ZEL13))*complexconjugate(ZER33)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_216 = Coupling(name = 'GC_216',
	 value = '(-1*complex(0,1)*(ZER11*(ZEL31*complexconjugate(Ye11) + ZEL32*complexconjugate(Ye21) + ZEL33*complexconjugate(Ye31)) + ZER12*(ZEL31*complexconjugate(Ye12) + ZEL32*complexconjugate(Ye22) + ZEL33*complexconjugate(Ye32)) + ZER13*(ZEL31*complexconjugate(Ye13) + ZEL32*complexconjugate(Ye23) + ZEL33*complexconjugate(Ye33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_217 = Coupling(name = 'GC_217',
	 value = '(-1*complex(0,1)*((Ye11*complexconjugate(ZEL21) + Ye21*complexconjugate(ZEL22) + Ye31*complexconjugate(ZEL23))*complexconjugate(ZER31) + (Ye12*complexconjugate(ZEL21) + Ye22*complexconjugate(ZEL22) + Ye32*complexconjugate(ZEL23))*complexconjugate(ZER32) + (Ye13*complexconjugate(ZEL21) + Ye23*complexconjugate(ZEL22) + Ye33*complexconjugate(ZEL23))*complexconjugate(ZER33)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_218 = Coupling(name = 'GC_218',
	 value = '(-1*complex(0,1)*(ZER21*(ZEL31*complexconjugate(Ye11) + ZEL32*complexconjugate(Ye21) + ZEL33*complexconjugate(Ye31)) + ZER22*(ZEL31*complexconjugate(Ye12) + ZEL32*complexconjugate(Ye22) + ZEL33*complexconjugate(Ye32)) + ZER23*(ZEL31*complexconjugate(Ye13) + ZEL32*complexconjugate(Ye23) + ZEL33*complexconjugate(Ye33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_219 = Coupling(name = 'GC_219',
	 value = '(-1*complex(0,1)*((Ye11*complexconjugate(ZEL31) + Ye21*complexconjugate(ZEL32) + Ye31*complexconjugate(ZEL33))*complexconjugate(ZER31) + (Ye12*complexconjugate(ZEL31) + Ye22*complexconjugate(ZEL32) + Ye32*complexconjugate(ZEL33))*complexconjugate(ZER32) + (Ye13*complexconjugate(ZEL31) + Ye23*complexconjugate(ZEL32) + Ye33*complexconjugate(ZEL33))*complexconjugate(ZER33)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_220 = Coupling(name = 'GC_220',
	 value = '(-1*complex(0,1)*(ZER31*(ZEL31*complexconjugate(Ye11) + ZEL32*complexconjugate(Ye21) + ZEL33*complexconjugate(Ye31)) + ZER32*(ZEL31*complexconjugate(Ye12) + ZEL32*complexconjugate(Ye22) + ZEL33*complexconjugate(Ye32)) + ZER33*(ZEL31*complexconjugate(Ye13) + ZEL32*complexconjugate(Ye23) + ZEL33*complexconjugate(Ye33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_221 = Coupling(name = 'GC_221',
	 value = '1*complex(0,1)*ZP12*(ZER11*complexconjugate(Ye11) + ZER12*complexconjugate(Ye12) + ZER13*complexconjugate(Ye13))', 
	 order = {'QED':1} ) 
 
GC_222 = Coupling(name = 'GC_222',
	 value = '1*complex(0,1)*ZP22*(ZER11*complexconjugate(Ye11) + ZER12*complexconjugate(Ye12) + ZER13*complexconjugate(Ye13))', 
	 order = {'QED':1} ) 
 
GC_223 = Coupling(name = 'GC_223',
	 value = '1*complex(0,1)*ZP12*(ZER21*complexconjugate(Ye11) + ZER22*complexconjugate(Ye12) + ZER23*complexconjugate(Ye13))', 
	 order = {'QED':1} ) 
 
GC_224 = Coupling(name = 'GC_224',
	 value = '1*complex(0,1)*ZP22*(ZER21*complexconjugate(Ye11) + ZER22*complexconjugate(Ye12) + ZER23*complexconjugate(Ye13))', 
	 order = {'QED':1} ) 
 
GC_225 = Coupling(name = 'GC_225',
	 value = '1*complex(0,1)*ZP12*(ZER31*complexconjugate(Ye11) + ZER32*complexconjugate(Ye12) + ZER33*complexconjugate(Ye13))', 
	 order = {'QED':1} ) 
 
GC_226 = Coupling(name = 'GC_226',
	 value = '1*complex(0,1)*ZP22*(ZER31*complexconjugate(Ye11) + ZER32*complexconjugate(Ye12) + ZER33*complexconjugate(Ye13))', 
	 order = {'QED':1} ) 
 
GC_227 = Coupling(name = 'GC_227',
	 value = '1*complex(0,1)*ZP12*(ZER11*complexconjugate(Ye21) + ZER12*complexconjugate(Ye22) + ZER13*complexconjugate(Ye23))', 
	 order = {'QED':1} ) 
 
GC_228 = Coupling(name = 'GC_228',
	 value = '1*complex(0,1)*ZP22*(ZER11*complexconjugate(Ye21) + ZER12*complexconjugate(Ye22) + ZER13*complexconjugate(Ye23))', 
	 order = {'QED':1} ) 
 
GC_229 = Coupling(name = 'GC_229',
	 value = '1*complex(0,1)*ZP12*(ZER21*complexconjugate(Ye21) + ZER22*complexconjugate(Ye22) + ZER23*complexconjugate(Ye23))', 
	 order = {'QED':1} ) 
 
GC_230 = Coupling(name = 'GC_230',
	 value = '1*complex(0,1)*ZP22*(ZER21*complexconjugate(Ye21) + ZER22*complexconjugate(Ye22) + ZER23*complexconjugate(Ye23))', 
	 order = {'QED':1} ) 
 
GC_231 = Coupling(name = 'GC_231',
	 value = '1*complex(0,1)*ZP12*(ZER31*complexconjugate(Ye21) + ZER32*complexconjugate(Ye22) + ZER33*complexconjugate(Ye23))', 
	 order = {'QED':1} ) 
 
GC_232 = Coupling(name = 'GC_232',
	 value = '1*complex(0,1)*ZP22*(ZER31*complexconjugate(Ye21) + ZER32*complexconjugate(Ye22) + ZER33*complexconjugate(Ye23))', 
	 order = {'QED':1} ) 
 
GC_233 = Coupling(name = 'GC_233',
	 value = '1*complex(0,1)*ZP12*(ZER11*complexconjugate(Ye31) + ZER12*complexconjugate(Ye32) + ZER13*complexconjugate(Ye33))', 
	 order = {'QED':1} ) 
 
GC_234 = Coupling(name = 'GC_234',
	 value = '1*complex(0,1)*ZP22*(ZER11*complexconjugate(Ye31) + ZER12*complexconjugate(Ye32) + ZER13*complexconjugate(Ye33))', 
	 order = {'QED':1} ) 
 
GC_235 = Coupling(name = 'GC_235',
	 value = '1*complex(0,1)*ZP12*(ZER21*complexconjugate(Ye31) + ZER22*complexconjugate(Ye32) + ZER23*complexconjugate(Ye33))', 
	 order = {'QED':1} ) 
 
GC_236 = Coupling(name = 'GC_236',
	 value = '1*complex(0,1)*ZP22*(ZER21*complexconjugate(Ye31) + ZER22*complexconjugate(Ye32) + ZER23*complexconjugate(Ye33))', 
	 order = {'QED':1} ) 
 
GC_237 = Coupling(name = 'GC_237',
	 value = '1*complex(0,1)*ZP12*(ZER31*complexconjugate(Ye31) + ZER32*complexconjugate(Ye32) + ZER33*complexconjugate(Ye33))', 
	 order = {'QED':1} ) 
 
GC_238 = Coupling(name = 'GC_238',
	 value = '1*complex(0,1)*ZP22*(ZER31*complexconjugate(Ye31) + ZER32*complexconjugate(Ye32) + ZER33*complexconjugate(Ye33))', 
	 order = {'QED':1} ) 
 
GC_239 = Coupling(name = 'GC_239',
	 value = '-(((Yu11*complexconjugate(ZUL11) + Yu21*complexconjugate(ZUL12) + Yu31*complexconjugate(ZUL13))*complexconjugate(ZUR11) + (Yu12*complexconjugate(ZUL11) + Yu22*complexconjugate(ZUL12) + Yu32*complexconjugate(ZUL13))*complexconjugate(ZUR12) + (Yu13*complexconjugate(ZUL11) + Yu23*complexconjugate(ZUL12) + Yu33*complexconjugate(ZUL13))*complexconjugate(ZUR13))/cmath.sqrt(2))', 
	 order = {'QED':1} ) 
 
GC_240 = Coupling(name = 'GC_240',
	 value = '(ZUR11*(ZUL11*complexconjugate(Yu11) + ZUL12*complexconjugate(Yu21) + ZUL13*complexconjugate(Yu31)) + ZUR12*(ZUL11*complexconjugate(Yu12) + ZUL12*complexconjugate(Yu22) + ZUL13*complexconjugate(Yu32)) + ZUR13*(ZUL11*complexconjugate(Yu13) + ZUL12*complexconjugate(Yu23) + ZUL13*complexconjugate(Yu33)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_241 = Coupling(name = 'GC_241',
	 value = '-(((Yu11*complexconjugate(ZUL21) + Yu21*complexconjugate(ZUL22) + Yu31*complexconjugate(ZUL23))*complexconjugate(ZUR11) + (Yu12*complexconjugate(ZUL21) + Yu22*complexconjugate(ZUL22) + Yu32*complexconjugate(ZUL23))*complexconjugate(ZUR12) + (Yu13*complexconjugate(ZUL21) + Yu23*complexconjugate(ZUL22) + Yu33*complexconjugate(ZUL23))*complexconjugate(ZUR13))/cmath.sqrt(2))', 
	 order = {'QED':1} ) 
 
GC_242 = Coupling(name = 'GC_242',
	 value = '(ZUR21*(ZUL11*complexconjugate(Yu11) + ZUL12*complexconjugate(Yu21) + ZUL13*complexconjugate(Yu31)) + ZUR22*(ZUL11*complexconjugate(Yu12) + ZUL12*complexconjugate(Yu22) + ZUL13*complexconjugate(Yu32)) + ZUR23*(ZUL11*complexconjugate(Yu13) + ZUL12*complexconjugate(Yu23) + ZUL13*complexconjugate(Yu33)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_243 = Coupling(name = 'GC_243',
	 value = '-(((Yu11*complexconjugate(ZUL31) + Yu21*complexconjugate(ZUL32) + Yu31*complexconjugate(ZUL33))*complexconjugate(ZUR11) + (Yu12*complexconjugate(ZUL31) + Yu22*complexconjugate(ZUL32) + Yu32*complexconjugate(ZUL33))*complexconjugate(ZUR12) + (Yu13*complexconjugate(ZUL31) + Yu23*complexconjugate(ZUL32) + Yu33*complexconjugate(ZUL33))*complexconjugate(ZUR13))/cmath.sqrt(2))', 
	 order = {'QED':1} ) 
 
GC_244 = Coupling(name = 'GC_244',
	 value = '(ZUR31*(ZUL11*complexconjugate(Yu11) + ZUL12*complexconjugate(Yu21) + ZUL13*complexconjugate(Yu31)) + ZUR32*(ZUL11*complexconjugate(Yu12) + ZUL12*complexconjugate(Yu22) + ZUL13*complexconjugate(Yu32)) + ZUR33*(ZUL11*complexconjugate(Yu13) + ZUL12*complexconjugate(Yu23) + ZUL13*complexconjugate(Yu33)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_245 = Coupling(name = 'GC_245',
	 value = '-(((Yu11*complexconjugate(ZUL11) + Yu21*complexconjugate(ZUL12) + Yu31*complexconjugate(ZUL13))*complexconjugate(ZUR21) + (Yu12*complexconjugate(ZUL11) + Yu22*complexconjugate(ZUL12) + Yu32*complexconjugate(ZUL13))*complexconjugate(ZUR22) + (Yu13*complexconjugate(ZUL11) + Yu23*complexconjugate(ZUL12) + Yu33*complexconjugate(ZUL13))*complexconjugate(ZUR23))/cmath.sqrt(2))', 
	 order = {'QED':1} ) 
 
GC_246 = Coupling(name = 'GC_246',
	 value = '(ZUR11*(ZUL21*complexconjugate(Yu11) + ZUL22*complexconjugate(Yu21) + ZUL23*complexconjugate(Yu31)) + ZUR12*(ZUL21*complexconjugate(Yu12) + ZUL22*complexconjugate(Yu22) + ZUL23*complexconjugate(Yu32)) + ZUR13*(ZUL21*complexconjugate(Yu13) + ZUL22*complexconjugate(Yu23) + ZUL23*complexconjugate(Yu33)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_247 = Coupling(name = 'GC_247',
	 value = '-(((Yu11*complexconjugate(ZUL21) + Yu21*complexconjugate(ZUL22) + Yu31*complexconjugate(ZUL23))*complexconjugate(ZUR21) + (Yu12*complexconjugate(ZUL21) + Yu22*complexconjugate(ZUL22) + Yu32*complexconjugate(ZUL23))*complexconjugate(ZUR22) + (Yu13*complexconjugate(ZUL21) + Yu23*complexconjugate(ZUL22) + Yu33*complexconjugate(ZUL23))*complexconjugate(ZUR23))/cmath.sqrt(2))', 
	 order = {'QED':1} ) 
 
GC_248 = Coupling(name = 'GC_248',
	 value = '(ZUR21*(ZUL21*complexconjugate(Yu11) + ZUL22*complexconjugate(Yu21) + ZUL23*complexconjugate(Yu31)) + ZUR22*(ZUL21*complexconjugate(Yu12) + ZUL22*complexconjugate(Yu22) + ZUL23*complexconjugate(Yu32)) + ZUR23*(ZUL21*complexconjugate(Yu13) + ZUL22*complexconjugate(Yu23) + ZUL23*complexconjugate(Yu33)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_249 = Coupling(name = 'GC_249',
	 value = '-(((Yu11*complexconjugate(ZUL31) + Yu21*complexconjugate(ZUL32) + Yu31*complexconjugate(ZUL33))*complexconjugate(ZUR21) + (Yu12*complexconjugate(ZUL31) + Yu22*complexconjugate(ZUL32) + Yu32*complexconjugate(ZUL33))*complexconjugate(ZUR22) + (Yu13*complexconjugate(ZUL31) + Yu23*complexconjugate(ZUL32) + Yu33*complexconjugate(ZUL33))*complexconjugate(ZUR23))/cmath.sqrt(2))', 
	 order = {'QED':1} ) 
 
GC_250 = Coupling(name = 'GC_250',
	 value = '(ZUR31*(ZUL21*complexconjugate(Yu11) + ZUL22*complexconjugate(Yu21) + ZUL23*complexconjugate(Yu31)) + ZUR32*(ZUL21*complexconjugate(Yu12) + ZUL22*complexconjugate(Yu22) + ZUL23*complexconjugate(Yu32)) + ZUR33*(ZUL21*complexconjugate(Yu13) + ZUL22*complexconjugate(Yu23) + ZUL23*complexconjugate(Yu33)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_251 = Coupling(name = 'GC_251',
	 value = '-(((Yu11*complexconjugate(ZUL11) + Yu21*complexconjugate(ZUL12) + Yu31*complexconjugate(ZUL13))*complexconjugate(ZUR31) + (Yu12*complexconjugate(ZUL11) + Yu22*complexconjugate(ZUL12) + Yu32*complexconjugate(ZUL13))*complexconjugate(ZUR32) + (Yu13*complexconjugate(ZUL11) + Yu23*complexconjugate(ZUL12) + Yu33*complexconjugate(ZUL13))*complexconjugate(ZUR33))/cmath.sqrt(2))', 
	 order = {'QED':1} ) 
 
GC_252 = Coupling(name = 'GC_252',
	 value = '(ZUR11*(ZUL31*complexconjugate(Yu11) + ZUL32*complexconjugate(Yu21) + ZUL33*complexconjugate(Yu31)) + ZUR12*(ZUL31*complexconjugate(Yu12) + ZUL32*complexconjugate(Yu22) + ZUL33*complexconjugate(Yu32)) + ZUR13*(ZUL31*complexconjugate(Yu13) + ZUL32*complexconjugate(Yu23) + ZUL33*complexconjugate(Yu33)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_253 = Coupling(name = 'GC_253',
	 value = '-(((Yu11*complexconjugate(ZUL21) + Yu21*complexconjugate(ZUL22) + Yu31*complexconjugate(ZUL23))*complexconjugate(ZUR31) + (Yu12*complexconjugate(ZUL21) + Yu22*complexconjugate(ZUL22) + Yu32*complexconjugate(ZUL23))*complexconjugate(ZUR32) + (Yu13*complexconjugate(ZUL21) + Yu23*complexconjugate(ZUL22) + Yu33*complexconjugate(ZUL23))*complexconjugate(ZUR33))/cmath.sqrt(2))', 
	 order = {'QED':1} ) 
 
GC_254 = Coupling(name = 'GC_254',
	 value = '(ZUR21*(ZUL31*complexconjugate(Yu11) + ZUL32*complexconjugate(Yu21) + ZUL33*complexconjugate(Yu31)) + ZUR22*(ZUL31*complexconjugate(Yu12) + ZUL32*complexconjugate(Yu22) + ZUL33*complexconjugate(Yu32)) + ZUR23*(ZUL31*complexconjugate(Yu13) + ZUL32*complexconjugate(Yu23) + ZUL33*complexconjugate(Yu33)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_255 = Coupling(name = 'GC_255',
	 value = '-(((Yu11*complexconjugate(ZUL31) + Yu21*complexconjugate(ZUL32) + Yu31*complexconjugate(ZUL33))*complexconjugate(ZUR31) + (Yu12*complexconjugate(ZUL31) + Yu22*complexconjugate(ZUL32) + Yu32*complexconjugate(ZUL33))*complexconjugate(ZUR32) + (Yu13*complexconjugate(ZUL31) + Yu23*complexconjugate(ZUL32) + Yu33*complexconjugate(ZUL33))*complexconjugate(ZUR33))/cmath.sqrt(2))', 
	 order = {'QED':1} ) 
 
GC_256 = Coupling(name = 'GC_256',
	 value = '(ZUR31*(ZUL31*complexconjugate(Yu11) + ZUL32*complexconjugate(Yu21) + ZUL33*complexconjugate(Yu31)) + ZUR32*(ZUL31*complexconjugate(Yu12) + ZUL32*complexconjugate(Yu22) + ZUL33*complexconjugate(Yu32)) + ZUR33*(ZUL31*complexconjugate(Yu13) + ZUL32*complexconjugate(Yu23) + ZUL33*complexconjugate(Yu33)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_257 = Coupling(name = 'GC_257',
	 value = '(-1*complex(0,1)*((Yu11*complexconjugate(ZUL11) + Yu21*complexconjugate(ZUL12) + Yu31*complexconjugate(ZUL13))*complexconjugate(ZUR11) + (Yu12*complexconjugate(ZUL11) + Yu22*complexconjugate(ZUL12) + Yu32*complexconjugate(ZUL13))*complexconjugate(ZUR12) + (Yu13*complexconjugate(ZUL11) + Yu23*complexconjugate(ZUL12) + Yu33*complexconjugate(ZUL13))*complexconjugate(ZUR13)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_258 = Coupling(name = 'GC_258',
	 value = '(-1*complex(0,1)*(ZUR11*(ZUL11*complexconjugate(Yu11) + ZUL12*complexconjugate(Yu21) + ZUL13*complexconjugate(Yu31)) + ZUR12*(ZUL11*complexconjugate(Yu12) + ZUL12*complexconjugate(Yu22) + ZUL13*complexconjugate(Yu32)) + ZUR13*(ZUL11*complexconjugate(Yu13) + ZUL12*complexconjugate(Yu23) + ZUL13*complexconjugate(Yu33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_259 = Coupling(name = 'GC_259',
	 value = '(-1*complex(0,1)*((Yu11*complexconjugate(ZUL21) + Yu21*complexconjugate(ZUL22) + Yu31*complexconjugate(ZUL23))*complexconjugate(ZUR11) + (Yu12*complexconjugate(ZUL21) + Yu22*complexconjugate(ZUL22) + Yu32*complexconjugate(ZUL23))*complexconjugate(ZUR12) + (Yu13*complexconjugate(ZUL21) + Yu23*complexconjugate(ZUL22) + Yu33*complexconjugate(ZUL23))*complexconjugate(ZUR13)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_260 = Coupling(name = 'GC_260',
	 value = '(-1*complex(0,1)*(ZUR21*(ZUL11*complexconjugate(Yu11) + ZUL12*complexconjugate(Yu21) + ZUL13*complexconjugate(Yu31)) + ZUR22*(ZUL11*complexconjugate(Yu12) + ZUL12*complexconjugate(Yu22) + ZUL13*complexconjugate(Yu32)) + ZUR23*(ZUL11*complexconjugate(Yu13) + ZUL12*complexconjugate(Yu23) + ZUL13*complexconjugate(Yu33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_261 = Coupling(name = 'GC_261',
	 value = '(-1*complex(0,1)*((Yu11*complexconjugate(ZUL31) + Yu21*complexconjugate(ZUL32) + Yu31*complexconjugate(ZUL33))*complexconjugate(ZUR11) + (Yu12*complexconjugate(ZUL31) + Yu22*complexconjugate(ZUL32) + Yu32*complexconjugate(ZUL33))*complexconjugate(ZUR12) + (Yu13*complexconjugate(ZUL31) + Yu23*complexconjugate(ZUL32) + Yu33*complexconjugate(ZUL33))*complexconjugate(ZUR13)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_262 = Coupling(name = 'GC_262',
	 value = '(-1*complex(0,1)*(ZUR31*(ZUL11*complexconjugate(Yu11) + ZUL12*complexconjugate(Yu21) + ZUL13*complexconjugate(Yu31)) + ZUR32*(ZUL11*complexconjugate(Yu12) + ZUL12*complexconjugate(Yu22) + ZUL13*complexconjugate(Yu32)) + ZUR33*(ZUL11*complexconjugate(Yu13) + ZUL12*complexconjugate(Yu23) + ZUL13*complexconjugate(Yu33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_263 = Coupling(name = 'GC_263',
	 value = '(-1*complex(0,1)*((Yu11*complexconjugate(ZUL11) + Yu21*complexconjugate(ZUL12) + Yu31*complexconjugate(ZUL13))*complexconjugate(ZUR21) + (Yu12*complexconjugate(ZUL11) + Yu22*complexconjugate(ZUL12) + Yu32*complexconjugate(ZUL13))*complexconjugate(ZUR22) + (Yu13*complexconjugate(ZUL11) + Yu23*complexconjugate(ZUL12) + Yu33*complexconjugate(ZUL13))*complexconjugate(ZUR23)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_264 = Coupling(name = 'GC_264',
	 value = '(-1*complex(0,1)*(ZUR11*(ZUL21*complexconjugate(Yu11) + ZUL22*complexconjugate(Yu21) + ZUL23*complexconjugate(Yu31)) + ZUR12*(ZUL21*complexconjugate(Yu12) + ZUL22*complexconjugate(Yu22) + ZUL23*complexconjugate(Yu32)) + ZUR13*(ZUL21*complexconjugate(Yu13) + ZUL22*complexconjugate(Yu23) + ZUL23*complexconjugate(Yu33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_265 = Coupling(name = 'GC_265',
	 value = '(-1*complex(0,1)*((Yu11*complexconjugate(ZUL21) + Yu21*complexconjugate(ZUL22) + Yu31*complexconjugate(ZUL23))*complexconjugate(ZUR21) + (Yu12*complexconjugate(ZUL21) + Yu22*complexconjugate(ZUL22) + Yu32*complexconjugate(ZUL23))*complexconjugate(ZUR22) + (Yu13*complexconjugate(ZUL21) + Yu23*complexconjugate(ZUL22) + Yu33*complexconjugate(ZUL23))*complexconjugate(ZUR23)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_266 = Coupling(name = 'GC_266',
	 value = '(-1*complex(0,1)*(ZUR21*(ZUL21*complexconjugate(Yu11) + ZUL22*complexconjugate(Yu21) + ZUL23*complexconjugate(Yu31)) + ZUR22*(ZUL21*complexconjugate(Yu12) + ZUL22*complexconjugate(Yu22) + ZUL23*complexconjugate(Yu32)) + ZUR23*(ZUL21*complexconjugate(Yu13) + ZUL22*complexconjugate(Yu23) + ZUL23*complexconjugate(Yu33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_267 = Coupling(name = 'GC_267',
	 value = '(-1*complex(0,1)*((Yu11*complexconjugate(ZUL31) + Yu21*complexconjugate(ZUL32) + Yu31*complexconjugate(ZUL33))*complexconjugate(ZUR21) + (Yu12*complexconjugate(ZUL31) + Yu22*complexconjugate(ZUL32) + Yu32*complexconjugate(ZUL33))*complexconjugate(ZUR22) + (Yu13*complexconjugate(ZUL31) + Yu23*complexconjugate(ZUL32) + Yu33*complexconjugate(ZUL33))*complexconjugate(ZUR23)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_268 = Coupling(name = 'GC_268',
	 value = '(-1*complex(0,1)*(ZUR31*(ZUL21*complexconjugate(Yu11) + ZUL22*complexconjugate(Yu21) + ZUL23*complexconjugate(Yu31)) + ZUR32*(ZUL21*complexconjugate(Yu12) + ZUL22*complexconjugate(Yu22) + ZUL23*complexconjugate(Yu32)) + ZUR33*(ZUL21*complexconjugate(Yu13) + ZUL22*complexconjugate(Yu23) + ZUL23*complexconjugate(Yu33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_269 = Coupling(name = 'GC_269',
	 value = '(-1*complex(0,1)*((Yu11*complexconjugate(ZUL11) + Yu21*complexconjugate(ZUL12) + Yu31*complexconjugate(ZUL13))*complexconjugate(ZUR31) + (Yu12*complexconjugate(ZUL11) + Yu22*complexconjugate(ZUL12) + Yu32*complexconjugate(ZUL13))*complexconjugate(ZUR32) + (Yu13*complexconjugate(ZUL11) + Yu23*complexconjugate(ZUL12) + Yu33*complexconjugate(ZUL13))*complexconjugate(ZUR33)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_270 = Coupling(name = 'GC_270',
	 value = '(-1*complex(0,1)*(ZUR11*(ZUL31*complexconjugate(Yu11) + ZUL32*complexconjugate(Yu21) + ZUL33*complexconjugate(Yu31)) + ZUR12*(ZUL31*complexconjugate(Yu12) + ZUL32*complexconjugate(Yu22) + ZUL33*complexconjugate(Yu32)) + ZUR13*(ZUL31*complexconjugate(Yu13) + ZUL32*complexconjugate(Yu23) + ZUL33*complexconjugate(Yu33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_271 = Coupling(name = 'GC_271',
	 value = '(-1*complex(0,1)*((Yu11*complexconjugate(ZUL21) + Yu21*complexconjugate(ZUL22) + Yu31*complexconjugate(ZUL23))*complexconjugate(ZUR31) + (Yu12*complexconjugate(ZUL21) + Yu22*complexconjugate(ZUL22) + Yu32*complexconjugate(ZUL23))*complexconjugate(ZUR32) + (Yu13*complexconjugate(ZUL21) + Yu23*complexconjugate(ZUL22) + Yu33*complexconjugate(ZUL23))*complexconjugate(ZUR33)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_272 = Coupling(name = 'GC_272',
	 value = '(-1*complex(0,1)*(ZUR21*(ZUL31*complexconjugate(Yu11) + ZUL32*complexconjugate(Yu21) + ZUL33*complexconjugate(Yu31)) + ZUR22*(ZUL31*complexconjugate(Yu12) + ZUL32*complexconjugate(Yu22) + ZUL33*complexconjugate(Yu32)) + ZUR23*(ZUL31*complexconjugate(Yu13) + ZUL32*complexconjugate(Yu23) + ZUL33*complexconjugate(Yu33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_273 = Coupling(name = 'GC_273',
	 value = '(-1*complex(0,1)*((Yu11*complexconjugate(ZUL31) + Yu21*complexconjugate(ZUL32) + Yu31*complexconjugate(ZUL33))*complexconjugate(ZUR31) + (Yu12*complexconjugate(ZUL31) + Yu22*complexconjugate(ZUL32) + Yu32*complexconjugate(ZUL33))*complexconjugate(ZUR32) + (Yu13*complexconjugate(ZUL31) + Yu23*complexconjugate(ZUL32) + Yu33*complexconjugate(ZUL33))*complexconjugate(ZUR33)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_274 = Coupling(name = 'GC_274',
	 value = '(-1*complex(0,1)*(ZUR31*(ZUL31*complexconjugate(Yu11) + ZUL32*complexconjugate(Yu21) + ZUL33*complexconjugate(Yu31)) + ZUR32*(ZUL31*complexconjugate(Yu12) + ZUL32*complexconjugate(Yu22) + ZUL33*complexconjugate(Yu32)) + ZUR33*(ZUL31*complexconjugate(Yu13) + ZUL32*complexconjugate(Yu23) + ZUL33*complexconjugate(Yu33))))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_275 = Coupling(name = 'GC_275',
	 value = '1*complex(0,1)*ZP12*(complexconjugate(ZDR11)*(Yd11*complexconjugate(ZUL11) + Yd21*complexconjugate(ZUL12) + Yd31*complexconjugate(ZUL13)) + complexconjugate(ZDR12)*(Yd12*complexconjugate(ZUL11) + Yd22*complexconjugate(ZUL12) + Yd32*complexconjugate(ZUL13)) + complexconjugate(ZDR13)*(Yd13*complexconjugate(ZUL11) + Yd23*complexconjugate(ZUL12) + Yd33*complexconjugate(ZUL13)))', 
	 order = {'QED':1} ) 
 
GC_276 = Coupling(name = 'GC_276',
	 value = '-1*complex(0,1)*ZP12*(ZUR11*(ZDL11*complexconjugate(Yu11) + ZDL12*complexconjugate(Yu21) + ZDL13*complexconjugate(Yu31)) + ZUR12*(ZDL11*complexconjugate(Yu12) + ZDL12*complexconjugate(Yu22) + ZDL13*complexconjugate(Yu32)) + ZUR13*(ZDL11*complexconjugate(Yu13) + ZDL12*complexconjugate(Yu23) + ZDL13*complexconjugate(Yu33)))', 
	 order = {'QED':1} ) 
 
GC_277 = Coupling(name = 'GC_277',
	 value = '1*complex(0,1)*ZP22*(complexconjugate(ZDR11)*(Yd11*complexconjugate(ZUL11) + Yd21*complexconjugate(ZUL12) + Yd31*complexconjugate(ZUL13)) + complexconjugate(ZDR12)*(Yd12*complexconjugate(ZUL11) + Yd22*complexconjugate(ZUL12) + Yd32*complexconjugate(ZUL13)) + complexconjugate(ZDR13)*(Yd13*complexconjugate(ZUL11) + Yd23*complexconjugate(ZUL12) + Yd33*complexconjugate(ZUL13)))', 
	 order = {'QED':1} ) 
 
GC_278 = Coupling(name = 'GC_278',
	 value = '-1*complex(0,1)*ZP22*(ZUR11*(ZDL11*complexconjugate(Yu11) + ZDL12*complexconjugate(Yu21) + ZDL13*complexconjugate(Yu31)) + ZUR12*(ZDL11*complexconjugate(Yu12) + ZDL12*complexconjugate(Yu22) + ZDL13*complexconjugate(Yu32)) + ZUR13*(ZDL11*complexconjugate(Yu13) + ZDL12*complexconjugate(Yu23) + ZDL13*complexconjugate(Yu33)))', 
	 order = {'QED':1} ) 
 
GC_279 = Coupling(name = 'GC_279',
	 value = '1*complex(0,1)*ZP12*(complexconjugate(ZDR11)*(Yd11*complexconjugate(ZUL21) + Yd21*complexconjugate(ZUL22) + Yd31*complexconjugate(ZUL23)) + complexconjugate(ZDR12)*(Yd12*complexconjugate(ZUL21) + Yd22*complexconjugate(ZUL22) + Yd32*complexconjugate(ZUL23)) + complexconjugate(ZDR13)*(Yd13*complexconjugate(ZUL21) + Yd23*complexconjugate(ZUL22) + Yd33*complexconjugate(ZUL23)))', 
	 order = {'QED':1} ) 
 
GC_280 = Coupling(name = 'GC_280',
	 value = '-1*complex(0,1)*ZP12*(ZUR21*(ZDL11*complexconjugate(Yu11) + ZDL12*complexconjugate(Yu21) + ZDL13*complexconjugate(Yu31)) + ZUR22*(ZDL11*complexconjugate(Yu12) + ZDL12*complexconjugate(Yu22) + ZDL13*complexconjugate(Yu32)) + ZUR23*(ZDL11*complexconjugate(Yu13) + ZDL12*complexconjugate(Yu23) + ZDL13*complexconjugate(Yu33)))', 
	 order = {'QED':1} ) 
 
GC_281 = Coupling(name = 'GC_281',
	 value = '1*complex(0,1)*ZP22*(complexconjugate(ZDR11)*(Yd11*complexconjugate(ZUL21) + Yd21*complexconjugate(ZUL22) + Yd31*complexconjugate(ZUL23)) + complexconjugate(ZDR12)*(Yd12*complexconjugate(ZUL21) + Yd22*complexconjugate(ZUL22) + Yd32*complexconjugate(ZUL23)) + complexconjugate(ZDR13)*(Yd13*complexconjugate(ZUL21) + Yd23*complexconjugate(ZUL22) + Yd33*complexconjugate(ZUL23)))', 
	 order = {'QED':1} ) 
 
GC_282 = Coupling(name = 'GC_282',
	 value = '-1*complex(0,1)*ZP22*(ZUR21*(ZDL11*complexconjugate(Yu11) + ZDL12*complexconjugate(Yu21) + ZDL13*complexconjugate(Yu31)) + ZUR22*(ZDL11*complexconjugate(Yu12) + ZDL12*complexconjugate(Yu22) + ZDL13*complexconjugate(Yu32)) + ZUR23*(ZDL11*complexconjugate(Yu13) + ZDL12*complexconjugate(Yu23) + ZDL13*complexconjugate(Yu33)))', 
	 order = {'QED':1} ) 
 
GC_283 = Coupling(name = 'GC_283',
	 value = '1*complex(0,1)*ZP12*(complexconjugate(ZDR11)*(Yd11*complexconjugate(ZUL31) + Yd21*complexconjugate(ZUL32) + Yd31*complexconjugate(ZUL33)) + complexconjugate(ZDR12)*(Yd12*complexconjugate(ZUL31) + Yd22*complexconjugate(ZUL32) + Yd32*complexconjugate(ZUL33)) + complexconjugate(ZDR13)*(Yd13*complexconjugate(ZUL31) + Yd23*complexconjugate(ZUL32) + Yd33*complexconjugate(ZUL33)))', 
	 order = {'QED':1} ) 
 
GC_284 = Coupling(name = 'GC_284',
	 value = '-1*complex(0,1)*ZP12*(ZUR31*(ZDL11*complexconjugate(Yu11) + ZDL12*complexconjugate(Yu21) + ZDL13*complexconjugate(Yu31)) + ZUR32*(ZDL11*complexconjugate(Yu12) + ZDL12*complexconjugate(Yu22) + ZDL13*complexconjugate(Yu32)) + ZUR33*(ZDL11*complexconjugate(Yu13) + ZDL12*complexconjugate(Yu23) + ZDL13*complexconjugate(Yu33)))', 
	 order = {'QED':1} ) 
 
GC_285 = Coupling(name = 'GC_285',
	 value = '1*complex(0,1)*ZP22*(complexconjugate(ZDR11)*(Yd11*complexconjugate(ZUL31) + Yd21*complexconjugate(ZUL32) + Yd31*complexconjugate(ZUL33)) + complexconjugate(ZDR12)*(Yd12*complexconjugate(ZUL31) + Yd22*complexconjugate(ZUL32) + Yd32*complexconjugate(ZUL33)) + complexconjugate(ZDR13)*(Yd13*complexconjugate(ZUL31) + Yd23*complexconjugate(ZUL32) + Yd33*complexconjugate(ZUL33)))', 
	 order = {'QED':1} ) 
 
GC_286 = Coupling(name = 'GC_286',
	 value = '-1*complex(0,1)*ZP22*(ZUR31*(ZDL11*complexconjugate(Yu11) + ZDL12*complexconjugate(Yu21) + ZDL13*complexconjugate(Yu31)) + ZUR32*(ZDL11*complexconjugate(Yu12) + ZDL12*complexconjugate(Yu22) + ZDL13*complexconjugate(Yu32)) + ZUR33*(ZDL11*complexconjugate(Yu13) + ZDL12*complexconjugate(Yu23) + ZDL13*complexconjugate(Yu33)))', 
	 order = {'QED':1} ) 
 
GC_287 = Coupling(name = 'GC_287',
	 value = '1*complex(0,1)*ZP12*(complexconjugate(ZDR21)*(Yd11*complexconjugate(ZUL11) + Yd21*complexconjugate(ZUL12) + Yd31*complexconjugate(ZUL13)) + complexconjugate(ZDR22)*(Yd12*complexconjugate(ZUL11) + Yd22*complexconjugate(ZUL12) + Yd32*complexconjugate(ZUL13)) + complexconjugate(ZDR23)*(Yd13*complexconjugate(ZUL11) + Yd23*complexconjugate(ZUL12) + Yd33*complexconjugate(ZUL13)))', 
	 order = {'QED':1} ) 
 
GC_288 = Coupling(name = 'GC_288',
	 value = '-1*complex(0,1)*ZP12*(ZUR11*(ZDL21*complexconjugate(Yu11) + ZDL22*complexconjugate(Yu21) + ZDL23*complexconjugate(Yu31)) + ZUR12*(ZDL21*complexconjugate(Yu12) + ZDL22*complexconjugate(Yu22) + ZDL23*complexconjugate(Yu32)) + ZUR13*(ZDL21*complexconjugate(Yu13) + ZDL22*complexconjugate(Yu23) + ZDL23*complexconjugate(Yu33)))', 
	 order = {'QED':1} ) 
 
GC_289 = Coupling(name = 'GC_289',
	 value = '1*complex(0,1)*ZP22*(complexconjugate(ZDR21)*(Yd11*complexconjugate(ZUL11) + Yd21*complexconjugate(ZUL12) + Yd31*complexconjugate(ZUL13)) + complexconjugate(ZDR22)*(Yd12*complexconjugate(ZUL11) + Yd22*complexconjugate(ZUL12) + Yd32*complexconjugate(ZUL13)) + complexconjugate(ZDR23)*(Yd13*complexconjugate(ZUL11) + Yd23*complexconjugate(ZUL12) + Yd33*complexconjugate(ZUL13)))', 
	 order = {'QED':1} ) 
 
GC_290 = Coupling(name = 'GC_290',
	 value = '-1*complex(0,1)*ZP22*(ZUR11*(ZDL21*complexconjugate(Yu11) + ZDL22*complexconjugate(Yu21) + ZDL23*complexconjugate(Yu31)) + ZUR12*(ZDL21*complexconjugate(Yu12) + ZDL22*complexconjugate(Yu22) + ZDL23*complexconjugate(Yu32)) + ZUR13*(ZDL21*complexconjugate(Yu13) + ZDL22*complexconjugate(Yu23) + ZDL23*complexconjugate(Yu33)))', 
	 order = {'QED':1} ) 
 
GC_291 = Coupling(name = 'GC_291',
	 value = '1*complex(0,1)*ZP12*(complexconjugate(ZDR21)*(Yd11*complexconjugate(ZUL21) + Yd21*complexconjugate(ZUL22) + Yd31*complexconjugate(ZUL23)) + complexconjugate(ZDR22)*(Yd12*complexconjugate(ZUL21) + Yd22*complexconjugate(ZUL22) + Yd32*complexconjugate(ZUL23)) + complexconjugate(ZDR23)*(Yd13*complexconjugate(ZUL21) + Yd23*complexconjugate(ZUL22) + Yd33*complexconjugate(ZUL23)))', 
	 order = {'QED':1} ) 
 
GC_292 = Coupling(name = 'GC_292',
	 value = '-1*complex(0,1)*ZP12*(ZUR21*(ZDL21*complexconjugate(Yu11) + ZDL22*complexconjugate(Yu21) + ZDL23*complexconjugate(Yu31)) + ZUR22*(ZDL21*complexconjugate(Yu12) + ZDL22*complexconjugate(Yu22) + ZDL23*complexconjugate(Yu32)) + ZUR23*(ZDL21*complexconjugate(Yu13) + ZDL22*complexconjugate(Yu23) + ZDL23*complexconjugate(Yu33)))', 
	 order = {'QED':1} ) 
 
GC_293 = Coupling(name = 'GC_293',
	 value = '1*complex(0,1)*ZP22*(complexconjugate(ZDR21)*(Yd11*complexconjugate(ZUL21) + Yd21*complexconjugate(ZUL22) + Yd31*complexconjugate(ZUL23)) + complexconjugate(ZDR22)*(Yd12*complexconjugate(ZUL21) + Yd22*complexconjugate(ZUL22) + Yd32*complexconjugate(ZUL23)) + complexconjugate(ZDR23)*(Yd13*complexconjugate(ZUL21) + Yd23*complexconjugate(ZUL22) + Yd33*complexconjugate(ZUL23)))', 
	 order = {'QED':1} ) 
 
GC_294 = Coupling(name = 'GC_294',
	 value = '-1*complex(0,1)*ZP22*(ZUR21*(ZDL21*complexconjugate(Yu11) + ZDL22*complexconjugate(Yu21) + ZDL23*complexconjugate(Yu31)) + ZUR22*(ZDL21*complexconjugate(Yu12) + ZDL22*complexconjugate(Yu22) + ZDL23*complexconjugate(Yu32)) + ZUR23*(ZDL21*complexconjugate(Yu13) + ZDL22*complexconjugate(Yu23) + ZDL23*complexconjugate(Yu33)))', 
	 order = {'QED':1} ) 
 
GC_295 = Coupling(name = 'GC_295',
	 value = '1*complex(0,1)*ZP12*(complexconjugate(ZDR21)*(Yd11*complexconjugate(ZUL31) + Yd21*complexconjugate(ZUL32) + Yd31*complexconjugate(ZUL33)) + complexconjugate(ZDR22)*(Yd12*complexconjugate(ZUL31) + Yd22*complexconjugate(ZUL32) + Yd32*complexconjugate(ZUL33)) + complexconjugate(ZDR23)*(Yd13*complexconjugate(ZUL31) + Yd23*complexconjugate(ZUL32) + Yd33*complexconjugate(ZUL33)))', 
	 order = {'QED':1} ) 
 
GC_296 = Coupling(name = 'GC_296',
	 value = '-1*complex(0,1)*ZP12*(ZUR31*(ZDL21*complexconjugate(Yu11) + ZDL22*complexconjugate(Yu21) + ZDL23*complexconjugate(Yu31)) + ZUR32*(ZDL21*complexconjugate(Yu12) + ZDL22*complexconjugate(Yu22) + ZDL23*complexconjugate(Yu32)) + ZUR33*(ZDL21*complexconjugate(Yu13) + ZDL22*complexconjugate(Yu23) + ZDL23*complexconjugate(Yu33)))', 
	 order = {'QED':1} ) 
 
GC_297 = Coupling(name = 'GC_297',
	 value = '1*complex(0,1)*ZP22*(complexconjugate(ZDR21)*(Yd11*complexconjugate(ZUL31) + Yd21*complexconjugate(ZUL32) + Yd31*complexconjugate(ZUL33)) + complexconjugate(ZDR22)*(Yd12*complexconjugate(ZUL31) + Yd22*complexconjugate(ZUL32) + Yd32*complexconjugate(ZUL33)) + complexconjugate(ZDR23)*(Yd13*complexconjugate(ZUL31) + Yd23*complexconjugate(ZUL32) + Yd33*complexconjugate(ZUL33)))', 
	 order = {'QED':1} ) 
 
GC_298 = Coupling(name = 'GC_298',
	 value = '-1*complex(0,1)*ZP22*(ZUR31*(ZDL21*complexconjugate(Yu11) + ZDL22*complexconjugate(Yu21) + ZDL23*complexconjugate(Yu31)) + ZUR32*(ZDL21*complexconjugate(Yu12) + ZDL22*complexconjugate(Yu22) + ZDL23*complexconjugate(Yu32)) + ZUR33*(ZDL21*complexconjugate(Yu13) + ZDL22*complexconjugate(Yu23) + ZDL23*complexconjugate(Yu33)))', 
	 order = {'QED':1} ) 
 
GC_299 = Coupling(name = 'GC_299',
	 value = '1*complex(0,1)*ZP12*(complexconjugate(ZDR31)*(Yd11*complexconjugate(ZUL11) + Yd21*complexconjugate(ZUL12) + Yd31*complexconjugate(ZUL13)) + complexconjugate(ZDR32)*(Yd12*complexconjugate(ZUL11) + Yd22*complexconjugate(ZUL12) + Yd32*complexconjugate(ZUL13)) + complexconjugate(ZDR33)*(Yd13*complexconjugate(ZUL11) + Yd23*complexconjugate(ZUL12) + Yd33*complexconjugate(ZUL13)))', 
	 order = {'QED':1} ) 
 
GC_300 = Coupling(name = 'GC_300',
	 value = '-1*complex(0,1)*ZP12*(ZUR11*(ZDL31*complexconjugate(Yu11) + ZDL32*complexconjugate(Yu21) + ZDL33*complexconjugate(Yu31)) + ZUR12*(ZDL31*complexconjugate(Yu12) + ZDL32*complexconjugate(Yu22) + ZDL33*complexconjugate(Yu32)) + ZUR13*(ZDL31*complexconjugate(Yu13) + ZDL32*complexconjugate(Yu23) + ZDL33*complexconjugate(Yu33)))', 
	 order = {'QED':1} ) 
 
GC_301 = Coupling(name = 'GC_301',
	 value = '1*complex(0,1)*ZP22*(complexconjugate(ZDR31)*(Yd11*complexconjugate(ZUL11) + Yd21*complexconjugate(ZUL12) + Yd31*complexconjugate(ZUL13)) + complexconjugate(ZDR32)*(Yd12*complexconjugate(ZUL11) + Yd22*complexconjugate(ZUL12) + Yd32*complexconjugate(ZUL13)) + complexconjugate(ZDR33)*(Yd13*complexconjugate(ZUL11) + Yd23*complexconjugate(ZUL12) + Yd33*complexconjugate(ZUL13)))', 
	 order = {'QED':1} ) 
 
GC_302 = Coupling(name = 'GC_302',
	 value = '-1*complex(0,1)*ZP22*(ZUR11*(ZDL31*complexconjugate(Yu11) + ZDL32*complexconjugate(Yu21) + ZDL33*complexconjugate(Yu31)) + ZUR12*(ZDL31*complexconjugate(Yu12) + ZDL32*complexconjugate(Yu22) + ZDL33*complexconjugate(Yu32)) + ZUR13*(ZDL31*complexconjugate(Yu13) + ZDL32*complexconjugate(Yu23) + ZDL33*complexconjugate(Yu33)))', 
	 order = {'QED':1} ) 
 
GC_303 = Coupling(name = 'GC_303',
	 value = '1*complex(0,1)*ZP12*(complexconjugate(ZDR31)*(Yd11*complexconjugate(ZUL21) + Yd21*complexconjugate(ZUL22) + Yd31*complexconjugate(ZUL23)) + complexconjugate(ZDR32)*(Yd12*complexconjugate(ZUL21) + Yd22*complexconjugate(ZUL22) + Yd32*complexconjugate(ZUL23)) + complexconjugate(ZDR33)*(Yd13*complexconjugate(ZUL21) + Yd23*complexconjugate(ZUL22) + Yd33*complexconjugate(ZUL23)))', 
	 order = {'QED':1} ) 
 
GC_304 = Coupling(name = 'GC_304',
	 value = '-1*complex(0,1)*ZP12*(ZUR21*(ZDL31*complexconjugate(Yu11) + ZDL32*complexconjugate(Yu21) + ZDL33*complexconjugate(Yu31)) + ZUR22*(ZDL31*complexconjugate(Yu12) + ZDL32*complexconjugate(Yu22) + ZDL33*complexconjugate(Yu32)) + ZUR23*(ZDL31*complexconjugate(Yu13) + ZDL32*complexconjugate(Yu23) + ZDL33*complexconjugate(Yu33)))', 
	 order = {'QED':1} ) 
 
GC_305 = Coupling(name = 'GC_305',
	 value = '1*complex(0,1)*ZP22*(complexconjugate(ZDR31)*(Yd11*complexconjugate(ZUL21) + Yd21*complexconjugate(ZUL22) + Yd31*complexconjugate(ZUL23)) + complexconjugate(ZDR32)*(Yd12*complexconjugate(ZUL21) + Yd22*complexconjugate(ZUL22) + Yd32*complexconjugate(ZUL23)) + complexconjugate(ZDR33)*(Yd13*complexconjugate(ZUL21) + Yd23*complexconjugate(ZUL22) + Yd33*complexconjugate(ZUL23)))', 
	 order = {'QED':1} ) 
 
GC_306 = Coupling(name = 'GC_306',
	 value = '-1*complex(0,1)*ZP22*(ZUR21*(ZDL31*complexconjugate(Yu11) + ZDL32*complexconjugate(Yu21) + ZDL33*complexconjugate(Yu31)) + ZUR22*(ZDL31*complexconjugate(Yu12) + ZDL32*complexconjugate(Yu22) + ZDL33*complexconjugate(Yu32)) + ZUR23*(ZDL31*complexconjugate(Yu13) + ZDL32*complexconjugate(Yu23) + ZDL33*complexconjugate(Yu33)))', 
	 order = {'QED':1} ) 
 
GC_307 = Coupling(name = 'GC_307',
	 value = '1*complex(0,1)*ZP12*(complexconjugate(ZDR31)*(Yd11*complexconjugate(ZUL31) + Yd21*complexconjugate(ZUL32) + Yd31*complexconjugate(ZUL33)) + complexconjugate(ZDR32)*(Yd12*complexconjugate(ZUL31) + Yd22*complexconjugate(ZUL32) + Yd32*complexconjugate(ZUL33)) + complexconjugate(ZDR33)*(Yd13*complexconjugate(ZUL31) + Yd23*complexconjugate(ZUL32) + Yd33*complexconjugate(ZUL33)))', 
	 order = {'QED':1} ) 
 
GC_308 = Coupling(name = 'GC_308',
	 value = '-1*complex(0,1)*ZP12*(ZUR31*(ZDL31*complexconjugate(Yu11) + ZDL32*complexconjugate(Yu21) + ZDL33*complexconjugate(Yu31)) + ZUR32*(ZDL31*complexconjugate(Yu12) + ZDL32*complexconjugate(Yu22) + ZDL33*complexconjugate(Yu32)) + ZUR33*(ZDL31*complexconjugate(Yu13) + ZDL32*complexconjugate(Yu23) + ZDL33*complexconjugate(Yu33)))', 
	 order = {'QED':1} ) 
 
GC_309 = Coupling(name = 'GC_309',
	 value = '1*complex(0,1)*ZP22*(complexconjugate(ZDR31)*(Yd11*complexconjugate(ZUL31) + Yd21*complexconjugate(ZUL32) + Yd31*complexconjugate(ZUL33)) + complexconjugate(ZDR32)*(Yd12*complexconjugate(ZUL31) + Yd22*complexconjugate(ZUL32) + Yd32*complexconjugate(ZUL33)) + complexconjugate(ZDR33)*(Yd13*complexconjugate(ZUL31) + Yd23*complexconjugate(ZUL32) + Yd33*complexconjugate(ZUL33)))', 
	 order = {'QED':1} ) 
 
GC_310 = Coupling(name = 'GC_310',
	 value = '-1*complex(0,1)*ZP22*(ZUR31*(ZDL31*complexconjugate(Yu11) + ZDL32*complexconjugate(Yu21) + ZDL33*complexconjugate(Yu31)) + ZUR32*(ZDL31*complexconjugate(Yu12) + ZDL32*complexconjugate(Yu22) + ZDL33*complexconjugate(Yu32)) + ZUR33*(ZDL31*complexconjugate(Yu13) + ZDL32*complexconjugate(Yu23) + ZDL33*complexconjugate(Yu33)))', 
	 order = {'QED':1} ) 
 
GC_311 = Coupling(name = 'GC_311',
	 value = '1*complex(0,1)*ZP12*(Ye11*complexconjugate(ZER11) + Ye12*complexconjugate(ZER12) + Ye13*complexconjugate(ZER13))', 
	 order = {'QED':1} ) 
 
GC_312 = Coupling(name = 'GC_312',
	 value = '1*complex(0,1)*ZP22*(Ye11*complexconjugate(ZER11) + Ye12*complexconjugate(ZER12) + Ye13*complexconjugate(ZER13))', 
	 order = {'QED':1} ) 
 
GC_313 = Coupling(name = 'GC_313',
	 value = '1*complex(0,1)*ZP12*(Ye21*complexconjugate(ZER11) + Ye22*complexconjugate(ZER12) + Ye23*complexconjugate(ZER13))', 
	 order = {'QED':1} ) 
 
GC_314 = Coupling(name = 'GC_314',
	 value = '1*complex(0,1)*ZP22*(Ye21*complexconjugate(ZER11) + Ye22*complexconjugate(ZER12) + Ye23*complexconjugate(ZER13))', 
	 order = {'QED':1} ) 
 
GC_315 = Coupling(name = 'GC_315',
	 value = '1*complex(0,1)*ZP12*(Ye31*complexconjugate(ZER11) + Ye32*complexconjugate(ZER12) + Ye33*complexconjugate(ZER13))', 
	 order = {'QED':1} ) 
 
GC_316 = Coupling(name = 'GC_316',
	 value = '1*complex(0,1)*ZP22*(Ye31*complexconjugate(ZER11) + Ye32*complexconjugate(ZER12) + Ye33*complexconjugate(ZER13))', 
	 order = {'QED':1} ) 
 
GC_317 = Coupling(name = 'GC_317',
	 value = '1*complex(0,1)*ZP12*(Ye11*complexconjugate(ZER21) + Ye12*complexconjugate(ZER22) + Ye13*complexconjugate(ZER23))', 
	 order = {'QED':1} ) 
 
GC_318 = Coupling(name = 'GC_318',
	 value = '1*complex(0,1)*ZP22*(Ye11*complexconjugate(ZER21) + Ye12*complexconjugate(ZER22) + Ye13*complexconjugate(ZER23))', 
	 order = {'QED':1} ) 
 
GC_319 = Coupling(name = 'GC_319',
	 value = '1*complex(0,1)*ZP12*(Ye21*complexconjugate(ZER21) + Ye22*complexconjugate(ZER22) + Ye23*complexconjugate(ZER23))', 
	 order = {'QED':1} ) 
 
GC_320 = Coupling(name = 'GC_320',
	 value = '1*complex(0,1)*ZP22*(Ye21*complexconjugate(ZER21) + Ye22*complexconjugate(ZER22) + Ye23*complexconjugate(ZER23))', 
	 order = {'QED':1} ) 
 
GC_321 = Coupling(name = 'GC_321',
	 value = '1*complex(0,1)*ZP12*(Ye31*complexconjugate(ZER21) + Ye32*complexconjugate(ZER22) + Ye33*complexconjugate(ZER23))', 
	 order = {'QED':1} ) 
 
GC_322 = Coupling(name = 'GC_322',
	 value = '1*complex(0,1)*ZP22*(Ye31*complexconjugate(ZER21) + Ye32*complexconjugate(ZER22) + Ye33*complexconjugate(ZER23))', 
	 order = {'QED':1} ) 
 
GC_323 = Coupling(name = 'GC_323',
	 value = '1*complex(0,1)*ZP12*(Ye11*complexconjugate(ZER31) + Ye12*complexconjugate(ZER32) + Ye13*complexconjugate(ZER33))', 
	 order = {'QED':1} ) 
 
GC_324 = Coupling(name = 'GC_324',
	 value = '1*complex(0,1)*ZP22*(Ye11*complexconjugate(ZER31) + Ye12*complexconjugate(ZER32) + Ye13*complexconjugate(ZER33))', 
	 order = {'QED':1} ) 
 
GC_325 = Coupling(name = 'GC_325',
	 value = '1*complex(0,1)*ZP12*(Ye21*complexconjugate(ZER31) + Ye22*complexconjugate(ZER32) + Ye23*complexconjugate(ZER33))', 
	 order = {'QED':1} ) 
 
GC_326 = Coupling(name = 'GC_326',
	 value = '1*complex(0,1)*ZP22*(Ye21*complexconjugate(ZER31) + Ye22*complexconjugate(ZER32) + Ye23*complexconjugate(ZER33))', 
	 order = {'QED':1} ) 
 
GC_327 = Coupling(name = 'GC_327',
	 value = '1*complex(0,1)*ZP12*(Ye31*complexconjugate(ZER31) + Ye32*complexconjugate(ZER32) + Ye33*complexconjugate(ZER33))', 
	 order = {'QED':1} ) 
 
GC_328 = Coupling(name = 'GC_328',
	 value = '1*complex(0,1)*ZP22*(Ye31*complexconjugate(ZER31) + Ye32*complexconjugate(ZER32) + Ye33*complexconjugate(ZER33))', 
	 order = {'QED':1} ) 
 
GC_329 = Coupling(name = 'GC_329',
	 value = '1*complex(0,1)*G', 
	 order = {'QCD':1} ) 
 
GC_330 = Coupling(name = 'GC_330',
	 value = '1*complex(0,1)*G', 
	 order = {'QCD':1} ) 
 
GC_331 = Coupling(name = 'GC_331',
	 value = '1*complex(0,1)*G', 
	 order = {'QCD':1} ) 
 
GC_332 = Coupling(name = 'GC_332',
	 value = '1*complex(0,1)*G', 
	 order = {'QCD':1} ) 
 
GC_333 = Coupling(name = 'GC_333',
	 value = '1*complex(0,1)*G', 
	 order = {'QCD':1} ) 
 
GC_334 = Coupling(name = 'GC_334',
	 value = '1*complex(0,1)*G', 
	 order = {'QCD':1} ) 
 
GC_335 = Coupling(name = 'GC_335',
	 value = '1./6.*complex(0,1)*(g1*cmath.cos(TW) - 3*g2*cmath.sin(TW))', 
	 order = {'QED':1} ) 
 
GC_336 = Coupling(name = 'GC_336',
	 value = '-1./3.*complex(0,1)*g1*cmath.cos(TW)', 
	 order = {'QED':1} ) 
 
GC_337 = Coupling(name = 'GC_337',
	 value = '1./6.*complex(0,1)*(g1*cmath.cos(TW) - 3*g2*cmath.sin(TW))', 
	 order = {'QED':1} ) 
 
GC_338 = Coupling(name = 'GC_338',
	 value = '-1./3.*complex(0,1)*g1*cmath.cos(TW)', 
	 order = {'QED':1} ) 
 
GC_339 = Coupling(name = 'GC_339',
	 value = '1./6.*complex(0,1)*(g1*cmath.cos(TW) - 3*g2*cmath.sin(TW))', 
	 order = {'QED':1} ) 
 
GC_340 = Coupling(name = 'GC_340',
	 value = '-1./3.*complex(0,1)*g1*cmath.cos(TW)', 
	 order = {'QED':1} ) 
 
GC_341 = Coupling(name = 'GC_341',
	 value = '(1*complex(0,1)*g2*(ZUL11*complexconjugate(ZDL11) + ZUL12*complexconjugate(ZDL12) + ZUL13*complexconjugate(ZDL13)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_342 = Coupling(name = 'GC_342',
	 value = '(1*complex(0,1)*g2*(ZUL11*complexconjugate(ZDL21) + ZUL12*complexconjugate(ZDL22) + ZUL13*complexconjugate(ZDL23)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_343 = Coupling(name = 'GC_343',
	 value = '(1*complex(0,1)*g2*(ZUL11*complexconjugate(ZDL31) + ZUL12*complexconjugate(ZDL32) + ZUL13*complexconjugate(ZDL33)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_344 = Coupling(name = 'GC_344',
	 value = '(1*complex(0,1)*g2*(ZUL21*complexconjugate(ZDL11) + ZUL22*complexconjugate(ZDL12) + ZUL23*complexconjugate(ZDL13)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_345 = Coupling(name = 'GC_345',
	 value = '(1*complex(0,1)*g2*(ZUL21*complexconjugate(ZDL21) + ZUL22*complexconjugate(ZDL22) + ZUL23*complexconjugate(ZDL23)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_346 = Coupling(name = 'GC_346',
	 value = '(1*complex(0,1)*g2*(ZUL21*complexconjugate(ZDL31) + ZUL22*complexconjugate(ZDL32) + ZUL23*complexconjugate(ZDL33)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_347 = Coupling(name = 'GC_347',
	 value = '(1*complex(0,1)*g2*(ZUL31*complexconjugate(ZDL11) + ZUL32*complexconjugate(ZDL12) + ZUL33*complexconjugate(ZDL13)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_348 = Coupling(name = 'GC_348',
	 value = '(1*complex(0,1)*g2*(ZUL31*complexconjugate(ZDL21) + ZUL32*complexconjugate(ZDL22) + ZUL33*complexconjugate(ZDL23)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_349 = Coupling(name = 'GC_349',
	 value = '(1*complex(0,1)*g2*(ZUL31*complexconjugate(ZDL31) + ZUL32*complexconjugate(ZDL32) + ZUL33*complexconjugate(ZDL33)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_350 = Coupling(name = 'GC_350',
	 value = '-1./6.*complex(0,1)*(3*g2*cmath.cos(TW) + g1*cmath.sin(TW))', 
	 order = {'QED':1} ) 
 
GC_351 = Coupling(name = 'GC_351',
	 value = '1./3.*complex(0,1)*g1*cmath.sin(TW)', 
	 order = {'QED':1} ) 
 
GC_352 = Coupling(name = 'GC_352',
	 value = '-1./6.*complex(0,1)*(3*g2*cmath.cos(TW) + g1*cmath.sin(TW))', 
	 order = {'QED':1} ) 
 
GC_353 = Coupling(name = 'GC_353',
	 value = '1./3.*complex(0,1)*g1*cmath.sin(TW)', 
	 order = {'QED':1} ) 
 
GC_354 = Coupling(name = 'GC_354',
	 value = '-1./6.*complex(0,1)*(3*g2*cmath.cos(TW) + g1*cmath.sin(TW))', 
	 order = {'QED':1} ) 
 
GC_355 = Coupling(name = 'GC_355',
	 value = '1./3.*complex(0,1)*g1*cmath.sin(TW)', 
	 order = {'QED':1} ) 
 
GC_356 = Coupling(name = 'GC_356',
	 value = '-1./2.*complex(0,1)*(g1*cmath.cos(TW) + g2*cmath.sin(TW))', 
	 order = {'QED':1} ) 
 
GC_357 = Coupling(name = 'GC_357',
	 value = '-1*complex(0,1)*g1*cmath.cos(TW)', 
	 order = {'QED':1} ) 
 
GC_358 = Coupling(name = 'GC_358',
	 value = '-1./2.*complex(0,1)*(g1*cmath.cos(TW) + g2*cmath.sin(TW))', 
	 order = {'QED':1} ) 
 
GC_359 = Coupling(name = 'GC_359',
	 value = '-1*complex(0,1)*g1*cmath.cos(TW)', 
	 order = {'QED':1} ) 
 
GC_360 = Coupling(name = 'GC_360',
	 value = '-1./2.*complex(0,1)*(g1*cmath.cos(TW) + g2*cmath.sin(TW))', 
	 order = {'QED':1} ) 
 
GC_361 = Coupling(name = 'GC_361',
	 value = '-1*complex(0,1)*g1*cmath.cos(TW)', 
	 order = {'QED':1} ) 
 
GC_362 = Coupling(name = 'GC_362',
	 value = '(1*complex(0,1)*g2*ZEL11)/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_363 = Coupling(name = 'GC_363',
	 value = '(1*complex(0,1)*g2*ZEL21)/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_364 = Coupling(name = 'GC_364',
	 value = '(1*complex(0,1)*g2*ZEL31)/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_365 = Coupling(name = 'GC_365',
	 value = '(1*complex(0,1)*g2*ZEL12)/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_366 = Coupling(name = 'GC_366',
	 value = '(1*complex(0,1)*g2*ZEL22)/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_367 = Coupling(name = 'GC_367',
	 value = '(1*complex(0,1)*g2*ZEL32)/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_368 = Coupling(name = 'GC_368',
	 value = '(1*complex(0,1)*g2*ZEL13)/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_369 = Coupling(name = 'GC_369',
	 value = '(1*complex(0,1)*g2*ZEL23)/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_370 = Coupling(name = 'GC_370',
	 value = '(1*complex(0,1)*g2*ZEL33)/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_371 = Coupling(name = 'GC_371',
	 value = '-1./2.*complex(0,1)*(g2*cmath.cos(TW) - g1*cmath.sin(TW))', 
	 order = {'QED':1} ) 
 
GC_372 = Coupling(name = 'GC_372',
	 value = '1*complex(0,1)*g1*cmath.sin(TW)', 
	 order = {'QED':1} ) 
 
GC_373 = Coupling(name = 'GC_373',
	 value = '-1./2.*complex(0,1)*(g2*cmath.cos(TW) - g1*cmath.sin(TW))', 
	 order = {'QED':1} ) 
 
GC_374 = Coupling(name = 'GC_374',
	 value = '1*complex(0,1)*g1*cmath.sin(TW)', 
	 order = {'QED':1} ) 
 
GC_375 = Coupling(name = 'GC_375',
	 value = '-1./2.*complex(0,1)*(g2*cmath.cos(TW) - g1*cmath.sin(TW))', 
	 order = {'QED':1} ) 
 
GC_376 = Coupling(name = 'GC_376',
	 value = '1*complex(0,1)*g1*cmath.sin(TW)', 
	 order = {'QED':1} ) 
 
GC_377 = Coupling(name = 'GC_377',
	 value = '1*complex(0,1)*G', 
	 order = {'QCD':1} ) 
 
GC_378 = Coupling(name = 'GC_378',
	 value = '1*complex(0,1)*G', 
	 order = {'QCD':1} ) 
 
GC_379 = Coupling(name = 'GC_379',
	 value = '1*complex(0,1)*G', 
	 order = {'QCD':1} ) 
 
GC_380 = Coupling(name = 'GC_380',
	 value = '1*complex(0,1)*G', 
	 order = {'QCD':1} ) 
 
GC_381 = Coupling(name = 'GC_381',
	 value = '1*complex(0,1)*G', 
	 order = {'QCD':1} ) 
 
GC_382 = Coupling(name = 'GC_382',
	 value = '1*complex(0,1)*G', 
	 order = {'QCD':1} ) 
 
GC_383 = Coupling(name = 'GC_383',
	 value = '1./6.*complex(0,1)*(g1*cmath.cos(TW) + 3*g2*cmath.sin(TW))', 
	 order = {'QED':1} ) 
 
GC_384 = Coupling(name = 'GC_384',
	 value = '2./3.*complex(0,1)*g1*cmath.cos(TW)', 
	 order = {'QED':1} ) 
 
GC_385 = Coupling(name = 'GC_385',
	 value = '1./6.*complex(0,1)*(g1*cmath.cos(TW) + 3*g2*cmath.sin(TW))', 
	 order = {'QED':1} ) 
 
GC_386 = Coupling(name = 'GC_386',
	 value = '2./3.*complex(0,1)*g1*cmath.cos(TW)', 
	 order = {'QED':1} ) 
 
GC_387 = Coupling(name = 'GC_387',
	 value = '1./6.*complex(0,1)*(g1*cmath.cos(TW) + 3*g2*cmath.sin(TW))', 
	 order = {'QED':1} ) 
 
GC_388 = Coupling(name = 'GC_388',
	 value = '2./3.*complex(0,1)*g1*cmath.cos(TW)', 
	 order = {'QED':1} ) 
 
GC_389 = Coupling(name = 'GC_389',
	 value = '1./6.*complex(0,1)*(3*g2*cmath.cos(TW) - g1*cmath.sin(TW))', 
	 order = {'QED':1} ) 
 
GC_390 = Coupling(name = 'GC_390',
	 value = '-2./3.*complex(0,1)*g1*cmath.sin(TW)', 
	 order = {'QED':1} ) 
 
GC_391 = Coupling(name = 'GC_391',
	 value = '1./6.*complex(0,1)*(3*g2*cmath.cos(TW) - g1*cmath.sin(TW))', 
	 order = {'QED':1} ) 
 
GC_392 = Coupling(name = 'GC_392',
	 value = '-2./3.*complex(0,1)*g1*cmath.sin(TW)', 
	 order = {'QED':1} ) 
 
GC_393 = Coupling(name = 'GC_393',
	 value = '1./6.*complex(0,1)*(3*g2*cmath.cos(TW) - g1*cmath.sin(TW))', 
	 order = {'QED':1} ) 
 
GC_394 = Coupling(name = 'GC_394',
	 value = '-2./3.*complex(0,1)*g1*cmath.sin(TW)', 
	 order = {'QED':1} ) 
 
GC_395 = Coupling(name = 'GC_395',
	 value = '(1*complex(0,1)*g2*(ZDL11*complexconjugate(ZUL11) + ZDL12*complexconjugate(ZUL12) + ZDL13*complexconjugate(ZUL13)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_396 = Coupling(name = 'GC_396',
	 value = '(1*complex(0,1)*g2*(ZDL11*complexconjugate(ZUL21) + ZDL12*complexconjugate(ZUL22) + ZDL13*complexconjugate(ZUL23)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_397 = Coupling(name = 'GC_397',
	 value = '(1*complex(0,1)*g2*(ZDL11*complexconjugate(ZUL31) + ZDL12*complexconjugate(ZUL32) + ZDL13*complexconjugate(ZUL33)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_398 = Coupling(name = 'GC_398',
	 value = '(1*complex(0,1)*g2*(ZDL21*complexconjugate(ZUL11) + ZDL22*complexconjugate(ZUL12) + ZDL23*complexconjugate(ZUL13)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_399 = Coupling(name = 'GC_399',
	 value = '(1*complex(0,1)*g2*(ZDL21*complexconjugate(ZUL21) + ZDL22*complexconjugate(ZUL22) + ZDL23*complexconjugate(ZUL23)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_400 = Coupling(name = 'GC_400',
	 value = '(1*complex(0,1)*g2*(ZDL21*complexconjugate(ZUL31) + ZDL22*complexconjugate(ZUL32) + ZDL23*complexconjugate(ZUL33)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_401 = Coupling(name = 'GC_401',
	 value = '(1*complex(0,1)*g2*(ZDL31*complexconjugate(ZUL11) + ZDL32*complexconjugate(ZUL12) + ZDL33*complexconjugate(ZUL13)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_402 = Coupling(name = 'GC_402',
	 value = '(1*complex(0,1)*g2*(ZDL31*complexconjugate(ZUL21) + ZDL32*complexconjugate(ZUL22) + ZDL33*complexconjugate(ZUL23)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_403 = Coupling(name = 'GC_403',
	 value = '(1*complex(0,1)*g2*(ZDL31*complexconjugate(ZUL31) + ZDL32*complexconjugate(ZUL32) + ZDL33*complexconjugate(ZUL33)))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_404 = Coupling(name = 'GC_404',
	 value = '1./2.*complex(0,1)*(g2*cmath.cos(TW) + g1*cmath.sin(TW))', 
	 order = {'QED':1} ) 
 
GC_405 = Coupling(name = 'GC_405',
	 value = '1./2.*complex(0,1)*(g2*cmath.cos(TW) + g1*cmath.sin(TW))', 
	 order = {'QED':1} ) 
 
GC_406 = Coupling(name = 'GC_406',
	 value = '1./2.*complex(0,1)*(g2*cmath.cos(TW) + g1*cmath.sin(TW))', 
	 order = {'QED':1} ) 
 
GC_407 = Coupling(name = 'GC_407',
	 value = '(1*complex(0,1)*g2*complexconjugate(ZEL11))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_408 = Coupling(name = 'GC_408',
	 value = '(1*complex(0,1)*g2*complexconjugate(ZEL12))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_409 = Coupling(name = 'GC_409',
	 value = '(1*complex(0,1)*g2*complexconjugate(ZEL13))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_410 = Coupling(name = 'GC_410',
	 value = '(1*complex(0,1)*g2*complexconjugate(ZEL21))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_411 = Coupling(name = 'GC_411',
	 value = '(1*complex(0,1)*g2*complexconjugate(ZEL22))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_412 = Coupling(name = 'GC_412',
	 value = '(1*complex(0,1)*g2*complexconjugate(ZEL23))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_413 = Coupling(name = 'GC_413',
	 value = '(1*complex(0,1)*g2*complexconjugate(ZEL31))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_414 = Coupling(name = 'GC_414',
	 value = '(1*complex(0,1)*g2*complexconjugate(ZEL32))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_415 = Coupling(name = 'GC_415',
	 value = '(1*complex(0,1)*g2*complexconjugate(ZEL33))/cmath.sqrt(2)', 
	 order = {'QED':1} ) 
 
GC_416 = Coupling(name = 'GC_416',
	 value = 'G', 
	 order = {'QCD':1} ) 
 
GC_417 = Coupling(name = 'GC_417',
	 value = '1*complex(0,1)*g2*cmath.sin(TW)', 
	 order = {'QED':1} ) 
 
GC_418 = Coupling(name = 'GC_418',
	 value = '-1*complex(0,1)*g2*cmath.cos(TW)', 
	 order = {'QED':1} ) 
 
GC_419 = Coupling(name = 'GC_419',
	 value = '-1*complex(0,1)*G**2', 
	 order = {'QCD':2} ) 
 
GC_420 = Coupling(name = 'GC_420',
	 value = '-1*complex(0,1)*G**2', 
	 order = {'QCD':2} ) 
 
GC_421 = Coupling(name = 'GC_421',
	 value = '1*complex(0,1)*G**2', 
	 order = {'QCD':2} ) 
 
GC_422 = Coupling(name = 'GC_422',
	 value = '-1*complex(0,1)*G**2', 
	 order = {'QCD':2} ) 
 
GC_423 = Coupling(name = 'GC_423',
	 value = '1*complex(0,1)*G**2', 
	 order = {'QCD':2} ) 
 
GC_424 = Coupling(name = 'GC_424',
	 value = '1*complex(0,1)*G**2', 
	 order = {'QCD':2} ) 
 
GC_425 = Coupling(name = 'GC_425',
	 value = '1*complex(0,1)*g2**2*cmath.sin(TW)**2', 
	 order = {'QED':2} ) 
 
GC_426 = Coupling(name = 'GC_426',
	 value = '1*complex(0,1)*g2**2*cmath.sin(TW)**2', 
	 order = {'QED':2} ) 
 
GC_427 = Coupling(name = 'GC_427',
	 value = '-2*complex(0,1)*g2**2*cmath.sin(TW)**2', 
	 order = {'QED':2} ) 
 
GC_428 = Coupling(name = 'GC_428',
	 value = '1*complex(0,1)*g2**2*cmath.cos(TW)*cmath.sin(TW)', 
	 order = {'QED':2} ) 
 
GC_429 = Coupling(name = 'GC_429',
	 value = '-1*complex(0,1)*g2**2*cmath.sin(2*TW)', 
	 order = {'QED':2} ) 
 
GC_430 = Coupling(name = 'GC_430',
	 value = '1*complex(0,1)*g2**2*cmath.cos(TW)*cmath.sin(TW)', 
	 order = {'QED':2} ) 
 
GC_431 = Coupling(name = 'GC_431',
	 value = '2*complex(0,1)*g2**2', 
	 order = {'QED':2} ) 
 
GC_432 = Coupling(name = 'GC_432',
	 value = '-1*complex(0,1)*g2**2', 
	 order = {'QED':2} ) 
 
GC_433 = Coupling(name = 'GC_433',
	 value = '-1*complex(0,1)*g2**2', 
	 order = {'QED':2} ) 
 
GC_434 = Coupling(name = 'GC_434',
	 value = '-2*complex(0,1)*g2**2*cmath.cos(TW)**2', 
	 order = {'QED':2} ) 
 
GC_435 = Coupling(name = 'GC_435',
	 value = '1*complex(0,1)*g2**2*cmath.cos(TW)**2', 
	 order = {'QED':2} ) 
 
GC_436 = Coupling(name = 'GC_436',
	 value = '1*complex(0,1)*g2**2*cmath.cos(TW)**2', 
	 order = {'QED':2} ) 
 
GC_437=Coupling(name='GC_437',
	 value='-(HPP1*complex(0,1))', 
	 order={'HIW':1})

GC_438=Coupling(name='GC_438',
	 value='-(HGG1*complex(0,1))', 
	 order={'HIG':1})


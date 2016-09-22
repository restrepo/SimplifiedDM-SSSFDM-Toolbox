# ------------------------------------------------------------------------------  
# This model file was automatically created by SARAH version4.9.1 
# SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223   
# (c) Florian Staub, 2013  
# -------------------------------------------------------------------------------  
# File created at 19:16 on 21.9.2016   
# ----------------------------------------------------------------------  
 
 
from object_library import all_vertices,Vertex 
import particles as P 
import couplings as C 
import lorentz as L 
 
 
V_1 = Vertex(name = 'V_1', 
	 particles = [P.Ah1, P.Ah1, P.h1], 
	 color = ['1'], 
	 lorentz = [L.SSS1], 
	 couplings = {(0,0):C.GC_1}) 
 
 
V_2 = Vertex(name = 'V_2', 
	 particles = [P.Ah1, P.Ah1, P.h2], 
	 color = ['1'], 
	 lorentz = [L.SSS1], 
	 couplings = {(0,0):C.GC_2}) 
 
 
V_3 = Vertex(name = 'V_3', 
	 particles = [P.Ah1, P.Ah2, P.h1], 
	 color = ['1'], 
	 lorentz = [L.SSS1], 
	 couplings = {(0,0):C.GC_3}) 
 
 
V_4 = Vertex(name = 'V_4', 
	 particles = [P.Ah1, P.Ah2, P.h2], 
	 color = ['1'], 
	 lorentz = [L.SSS1], 
	 couplings = {(0,0):C.GC_4}) 
 
 
V_5 = Vertex(name = 'V_5', 
	 particles = [P.Ah2, P.Ah2, P.h1], 
	 color = ['1'], 
	 lorentz = [L.SSS1], 
	 couplings = {(0,0):C.GC_5}) 
 
 
V_6 = Vertex(name = 'V_6', 
	 particles = [P.Ah2, P.Ah2, P.h2], 
	 color = ['1'], 
	 lorentz = [L.SSS1], 
	 couplings = {(0,0):C.GC_6}) 
 
 
V_7 = Vertex(name = 'V_7', 
	 particles = [P.h1, P.h1, P.h1], 
	 color = ['1'], 
	 lorentz = [L.SSS1], 
	 couplings = {(0,0):C.GC_7}) 
 
 
V_8 = Vertex(name = 'V_8', 
	 particles = [P.h1, P.h1, P.h2], 
	 color = ['1'], 
	 lorentz = [L.SSS1], 
	 couplings = {(0,0):C.GC_8}) 
 
 
V_9 = Vertex(name = 'V_9', 
	 particles = [P.h1, P.h2, P.h2], 
	 color = ['1'], 
	 lorentz = [L.SSS1], 
	 couplings = {(0,0):C.GC_9}) 
 
 
V_10 = Vertex(name = 'V_10', 
	 particles = [P.h2, P.h2, P.h2], 
	 color = ['1'], 
	 lorentz = [L.SSS1], 
	 couplings = {(0,0):C.GC_10}) 
 
 
V_11 = Vertex(name = 'V_11', 
	 particles = [P.h1, P.Hm, P.Hmc], 
	 color = ['1'], 
	 lorentz = [L.SSS1], 
	 couplings = {(0,0):C.GC_11}) 
 
 
V_12 = Vertex(name = 'V_12', 
	 particles = [P.h2, P.Hm, P.Hmc], 
	 color = ['1'], 
	 lorentz = [L.SSS1], 
	 couplings = {(0,0):C.GC_12}) 
 
 
V_13 = Vertex(name = 'V_13', 
	 particles = [P.Ah1, P.Ah1, P.A, P.A], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_13}) 
 
 
V_14 = Vertex(name = 'V_14', 
	 particles = [P.Ah1, P.Ah2, P.A, P.A], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_14}) 
 
 
V_15 = Vertex(name = 'V_15', 
	 particles = [P.Ah2, P.Ah2, P.A, P.A], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_15}) 
 
 
V_16 = Vertex(name = 'V_16', 
	 particles = [P.Ah1, P.Ah1, P.A, P.Z], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_16}) 
 
 
V_17 = Vertex(name = 'V_17', 
	 particles = [P.Ah1, P.Ah2, P.A, P.Z], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_17}) 
 
 
V_18 = Vertex(name = 'V_18', 
	 particles = [P.Ah2, P.Ah2, P.A, P.Z], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_18}) 
 
 
V_19 = Vertex(name = 'V_19', 
	 particles = [P.Ah1, P.Ah1, P.A, P.Zp], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_19}) 
 
 
V_20 = Vertex(name = 'V_20', 
	 particles = [P.Ah1, P.Ah2, P.A, P.Zp], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_20}) 
 
 
V_21 = Vertex(name = 'V_21', 
	 particles = [P.Ah2, P.Ah2, P.A, P.Zp], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_21}) 
 
 
V_22 = Vertex(name = 'V_22', 
	 particles = [P.Ah1, P.Ah1, P.Wmc, P.Wm], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_22}) 
 
 
V_23 = Vertex(name = 'V_23', 
	 particles = [P.Ah1, P.Ah2, P.Wmc, P.Wm], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_23}) 
 
 
V_24 = Vertex(name = 'V_24', 
	 particles = [P.Ah2, P.Ah2, P.Wmc, P.Wm], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_24}) 
 
 
V_25 = Vertex(name = 'V_25', 
	 particles = [P.Ah1, P.Ah1, P.Z, P.Z], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_25}) 
 
 
V_26 = Vertex(name = 'V_26', 
	 particles = [P.Ah1, P.Ah2, P.Z, P.Z], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_26}) 
 
 
V_27 = Vertex(name = 'V_27', 
	 particles = [P.Ah2, P.Ah2, P.Z, P.Z], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_27}) 
 
 
V_28 = Vertex(name = 'V_28', 
	 particles = [P.Ah1, P.Ah1, P.Z, P.Zp], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_28}) 
 
 
V_29 = Vertex(name = 'V_29', 
	 particles = [P.Ah1, P.Ah2, P.Z, P.Zp], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_29}) 
 
 
V_30 = Vertex(name = 'V_30', 
	 particles = [P.Ah2, P.Ah2, P.Z, P.Zp], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_30}) 
 
 
V_31 = Vertex(name = 'V_31', 
	 particles = [P.Ah1, P.Ah1, P.Zp, P.Zp], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_31}) 
 
 
V_32 = Vertex(name = 'V_32', 
	 particles = [P.Ah1, P.Ah2, P.Zp, P.Zp], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_32}) 
 
 
V_33 = Vertex(name = 'V_33', 
	 particles = [P.Ah2, P.Ah2, P.Zp, P.Zp], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_33}) 
 
 
V_34 = Vertex(name = 'V_34', 
	 particles = [P.Ah1, P.Hm, P.Wmc, P.A], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_34}) 
 
 
V_35 = Vertex(name = 'V_35', 
	 particles = [P.Ah2, P.Hm, P.Wmc, P.A], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_35}) 
 
 
V_36 = Vertex(name = 'V_36', 
	 particles = [P.Ah1, P.Hm, P.Wmc, P.Z], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_36}) 
 
 
V_37 = Vertex(name = 'V_37', 
	 particles = [P.Ah2, P.Hm, P.Wmc, P.Z], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_37}) 
 
 
V_38 = Vertex(name = 'V_38', 
	 particles = [P.Ah1, P.Hm, P.Wmc, P.Zp], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_38}) 
 
 
V_39 = Vertex(name = 'V_39', 
	 particles = [P.Ah2, P.Hm, P.Wmc, P.Zp], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_39}) 
 
 
V_40 = Vertex(name = 'V_40', 
	 particles = [P.Ah1, P.Hmc, P.A, P.Wm], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_40}) 
 
 
V_41 = Vertex(name = 'V_41', 
	 particles = [P.Ah2, P.Hmc, P.A, P.Wm], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_41}) 
 
 
V_42 = Vertex(name = 'V_42', 
	 particles = [P.Ah1, P.Hmc, P.Wm, P.Z], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_42}) 
 
 
V_43 = Vertex(name = 'V_43', 
	 particles = [P.Ah2, P.Hmc, P.Wm, P.Z], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_43}) 
 
 
V_44 = Vertex(name = 'V_44', 
	 particles = [P.Ah1, P.Hmc, P.Wm, P.Zp], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_44}) 
 
 
V_45 = Vertex(name = 'V_45', 
	 particles = [P.Ah2, P.Hmc, P.Wm, P.Zp], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_45}) 
 
 
V_46 = Vertex(name = 'V_46', 
	 particles = [P.h1, P.h1, P.A, P.A], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_46}) 
 
 
V_47 = Vertex(name = 'V_47', 
	 particles = [P.h1, P.h2, P.A, P.A], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_47}) 
 
 
V_48 = Vertex(name = 'V_48', 
	 particles = [P.h2, P.h2, P.A, P.A], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_48}) 
 
 
V_49 = Vertex(name = 'V_49', 
	 particles = [P.h1, P.h1, P.A, P.Z], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_49}) 
 
 
V_50 = Vertex(name = 'V_50', 
	 particles = [P.h1, P.h2, P.A, P.Z], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_50}) 
 
 
V_51 = Vertex(name = 'V_51', 
	 particles = [P.h2, P.h2, P.A, P.Z], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_51}) 
 
 
V_52 = Vertex(name = 'V_52', 
	 particles = [P.h1, P.h1, P.A, P.Zp], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_52}) 
 
 
V_53 = Vertex(name = 'V_53', 
	 particles = [P.h1, P.h2, P.A, P.Zp], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_53}) 
 
 
V_54 = Vertex(name = 'V_54', 
	 particles = [P.h2, P.h2, P.A, P.Zp], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_54}) 
 
 
V_55 = Vertex(name = 'V_55', 
	 particles = [P.h1, P.h1, P.Wmc, P.Wm], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_55}) 
 
 
V_56 = Vertex(name = 'V_56', 
	 particles = [P.h1, P.h2, P.Wmc, P.Wm], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_56}) 
 
 
V_57 = Vertex(name = 'V_57', 
	 particles = [P.h2, P.h2, P.Wmc, P.Wm], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_57}) 
 
 
V_58 = Vertex(name = 'V_58', 
	 particles = [P.h1, P.h1, P.Z, P.Z], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_58}) 
 
 
V_59 = Vertex(name = 'V_59', 
	 particles = [P.h1, P.h2, P.Z, P.Z], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_59}) 
 
 
V_60 = Vertex(name = 'V_60', 
	 particles = [P.h2, P.h2, P.Z, P.Z], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_60}) 
 
 
V_61 = Vertex(name = 'V_61', 
	 particles = [P.h1, P.h1, P.Z, P.Zp], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_61}) 
 
 
V_62 = Vertex(name = 'V_62', 
	 particles = [P.h1, P.h2, P.Z, P.Zp], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_62}) 
 
 
V_63 = Vertex(name = 'V_63', 
	 particles = [P.h2, P.h2, P.Z, P.Zp], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_63}) 
 
 
V_64 = Vertex(name = 'V_64', 
	 particles = [P.h1, P.h1, P.Zp, P.Zp], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_64}) 
 
 
V_65 = Vertex(name = 'V_65', 
	 particles = [P.h1, P.h2, P.Zp, P.Zp], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_65}) 
 
 
V_66 = Vertex(name = 'V_66', 
	 particles = [P.h2, P.h2, P.Zp, P.Zp], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_66}) 
 
 
V_67 = Vertex(name = 'V_67', 
	 particles = [P.h1, P.Hm, P.Wmc, P.A], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_67}) 
 
 
V_68 = Vertex(name = 'V_68', 
	 particles = [P.h2, P.Hm, P.Wmc, P.A], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_68}) 
 
 
V_69 = Vertex(name = 'V_69', 
	 particles = [P.h1, P.Hm, P.Wmc, P.Z], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_69}) 
 
 
V_70 = Vertex(name = 'V_70', 
	 particles = [P.h2, P.Hm, P.Wmc, P.Z], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_70}) 
 
 
V_71 = Vertex(name = 'V_71', 
	 particles = [P.h1, P.Hm, P.Wmc, P.Zp], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_71}) 
 
 
V_72 = Vertex(name = 'V_72', 
	 particles = [P.h2, P.Hm, P.Wmc, P.Zp], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_72}) 
 
 
V_73 = Vertex(name = 'V_73', 
	 particles = [P.h1, P.Hmc, P.A, P.Wm], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_73}) 
 
 
V_74 = Vertex(name = 'V_74', 
	 particles = [P.h2, P.Hmc, P.A, P.Wm], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_74}) 
 
 
V_75 = Vertex(name = 'V_75', 
	 particles = [P.h1, P.Hmc, P.Wm, P.Z], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_75}) 
 
 
V_76 = Vertex(name = 'V_76', 
	 particles = [P.h2, P.Hmc, P.Wm, P.Z], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_76}) 
 
 
V_77 = Vertex(name = 'V_77', 
	 particles = [P.h1, P.Hmc, P.Wm, P.Zp], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_77}) 
 
 
V_78 = Vertex(name = 'V_78', 
	 particles = [P.h2, P.Hmc, P.Wm, P.Zp], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_78}) 
 
 
V_79 = Vertex(name = 'V_79', 
	 particles = [P.Hm, P.Hmc, P.A, P.A], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_79}) 
 
 
V_80 = Vertex(name = 'V_80', 
	 particles = [P.Hm, P.Hmc, P.A, P.Z], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_80}) 
 
 
V_81 = Vertex(name = 'V_81', 
	 particles = [P.Hm, P.Hmc, P.A, P.Zp], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_81}) 
 
 
V_82 = Vertex(name = 'V_82', 
	 particles = [P.Hm, P.Hmc, P.Wmc, P.Wm], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_82}) 
 
 
V_83 = Vertex(name = 'V_83', 
	 particles = [P.Hm, P.Hmc, P.Z, P.Z], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_83}) 
 
 
V_84 = Vertex(name = 'V_84', 
	 particles = [P.Hm, P.Hmc, P.Z, P.Zp], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_84}) 
 
 
V_85 = Vertex(name = 'V_85', 
	 particles = [P.Hm, P.Hmc, P.Zp, P.Zp], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_85}) 
 
 
V_86 = Vertex(name = 'V_86', 
	 particles = [P.Ah1, P.h1, P.A], 
	 color = ['1'], 
	 lorentz = [L.SSV1], 
	 couplings = {(0,0):C.GC_86}) 
 
 
V_87 = Vertex(name = 'V_87', 
	 particles = [P.Ah1, P.h2, P.A], 
	 color = ['1'], 
	 lorentz = [L.SSV1], 
	 couplings = {(0,0):C.GC_87}) 
 
 
V_88 = Vertex(name = 'V_88', 
	 particles = [P.Ah2, P.h1, P.A], 
	 color = ['1'], 
	 lorentz = [L.SSV1], 
	 couplings = {(0,0):C.GC_88}) 
 
 
V_89 = Vertex(name = 'V_89', 
	 particles = [P.Ah2, P.h2, P.A], 
	 color = ['1'], 
	 lorentz = [L.SSV1], 
	 couplings = {(0,0):C.GC_89}) 
 
 
V_90 = Vertex(name = 'V_90', 
	 particles = [P.Ah1, P.h1, P.Z], 
	 color = ['1'], 
	 lorentz = [L.SSV1], 
	 couplings = {(0,0):C.GC_90}) 
 
 
V_91 = Vertex(name = 'V_91', 
	 particles = [P.Ah1, P.h2, P.Z], 
	 color = ['1'], 
	 lorentz = [L.SSV1], 
	 couplings = {(0,0):C.GC_91}) 
 
 
V_92 = Vertex(name = 'V_92', 
	 particles = [P.Ah2, P.h1, P.Z], 
	 color = ['1'], 
	 lorentz = [L.SSV1], 
	 couplings = {(0,0):C.GC_92}) 
 
 
V_93 = Vertex(name = 'V_93', 
	 particles = [P.Ah2, P.h2, P.Z], 
	 color = ['1'], 
	 lorentz = [L.SSV1], 
	 couplings = {(0,0):C.GC_93}) 
 
 
V_94 = Vertex(name = 'V_94', 
	 particles = [P.Ah1, P.h1, P.Zp], 
	 color = ['1'], 
	 lorentz = [L.SSV1], 
	 couplings = {(0,0):C.GC_94}) 
 
 
V_95 = Vertex(name = 'V_95', 
	 particles = [P.Ah1, P.h2, P.Zp], 
	 color = ['1'], 
	 lorentz = [L.SSV1], 
	 couplings = {(0,0):C.GC_95}) 
 
 
V_96 = Vertex(name = 'V_96', 
	 particles = [P.Ah2, P.h1, P.Zp], 
	 color = ['1'], 
	 lorentz = [L.SSV1], 
	 couplings = {(0,0):C.GC_96}) 
 
 
V_97 = Vertex(name = 'V_97', 
	 particles = [P.Ah2, P.h2, P.Zp], 
	 color = ['1'], 
	 lorentz = [L.SSV1], 
	 couplings = {(0,0):C.GC_97}) 
 
 
V_98 = Vertex(name = 'V_98', 
	 particles = [P.Ah1, P.Hm, P.Wmc], 
	 color = ['1'], 
	 lorentz = [L.SSV1], 
	 couplings = {(0,0):C.GC_98}) 
 
 
V_99 = Vertex(name = 'V_99', 
	 particles = [P.Ah2, P.Hm, P.Wmc], 
	 color = ['1'], 
	 lorentz = [L.SSV1], 
	 couplings = {(0,0):C.GC_99}) 
 
 
V_100 = Vertex(name = 'V_100', 
	 particles = [P.Ah1, P.Hmc, P.Wm], 
	 color = ['1'], 
	 lorentz = [L.SSV1], 
	 couplings = {(0,0):C.GC_100}) 
 
 
V_101 = Vertex(name = 'V_101', 
	 particles = [P.Ah2, P.Hmc, P.Wm], 
	 color = ['1'], 
	 lorentz = [L.SSV1], 
	 couplings = {(0,0):C.GC_101}) 
 
 
V_102 = Vertex(name = 'V_102', 
	 particles = [P.h1, P.Hm, P.Wmc], 
	 color = ['1'], 
	 lorentz = [L.SSV1], 
	 couplings = {(0,0):C.GC_102}) 
 
 
V_103 = Vertex(name = 'V_103', 
	 particles = [P.h2, P.Hm, P.Wmc], 
	 color = ['1'], 
	 lorentz = [L.SSV1], 
	 couplings = {(0,0):C.GC_103}) 
 
 
V_104 = Vertex(name = 'V_104', 
	 particles = [P.h1, P.Hmc, P.Wm], 
	 color = ['1'], 
	 lorentz = [L.SSV1], 
	 couplings = {(0,0):C.GC_104}) 
 
 
V_105 = Vertex(name = 'V_105', 
	 particles = [P.h2, P.Hmc, P.Wm], 
	 color = ['1'], 
	 lorentz = [L.SSV1], 
	 couplings = {(0,0):C.GC_105}) 
 
 
V_106 = Vertex(name = 'V_106', 
	 particles = [P.Hm, P.Hmc, P.A], 
	 color = ['1'], 
	 lorentz = [L.SSV1], 
	 couplings = {(0,0):C.GC_106}) 
 
 
V_107 = Vertex(name = 'V_107', 
	 particles = [P.Hm, P.Hmc, P.Z], 
	 color = ['1'], 
	 lorentz = [L.SSV1], 
	 couplings = {(0,0):C.GC_107}) 
 
 
V_108 = Vertex(name = 'V_108', 
	 particles = [P.Hm, P.Hmc, P.Zp], 
	 color = ['1'], 
	 lorentz = [L.SSV1], 
	 couplings = {(0,0):C.GC_108}) 
 
 
V_109 = Vertex(name = 'V_109', 
	 particles = [P.h1, P.A, P.Z], 
	 color = ['1'], 
	 lorentz = [L.SVV1], 
	 couplings = {(0,0):C.GC_109}) 
 
 
V_110 = Vertex(name = 'V_110', 
	 particles = [P.h2, P.A, P.Z], 
	 color = ['1'], 
	 lorentz = [L.SVV1], 
	 couplings = {(0,0):C.GC_110}) 
 
 
V_111 = Vertex(name = 'V_111', 
	 particles = [P.h1, P.A, P.Zp], 
	 color = ['1'], 
	 lorentz = [L.SVV1], 
	 couplings = {(0,0):C.GC_111}) 
 
 
V_112 = Vertex(name = 'V_112', 
	 particles = [P.h2, P.A, P.Zp], 
	 color = ['1'], 
	 lorentz = [L.SVV1], 
	 couplings = {(0,0):C.GC_112}) 
 
 
V_113 = Vertex(name = 'V_113', 
	 particles = [P.h1, P.Wmc, P.Wm], 
	 color = ['1'], 
	 lorentz = [L.SVV1], 
	 couplings = {(0,0):C.GC_113}) 
 
 
V_114 = Vertex(name = 'V_114', 
	 particles = [P.h2, P.Wmc, P.Wm], 
	 color = ['1'], 
	 lorentz = [L.SVV1], 
	 couplings = {(0,0):C.GC_114}) 
 
 
V_115 = Vertex(name = 'V_115', 
	 particles = [P.h1, P.Z, P.Z], 
	 color = ['1'], 
	 lorentz = [L.SVV1], 
	 couplings = {(0,0):C.GC_115}) 
 
 
V_116 = Vertex(name = 'V_116', 
	 particles = [P.h2, P.Z, P.Z], 
	 color = ['1'], 
	 lorentz = [L.SVV1], 
	 couplings = {(0,0):C.GC_116}) 
 
 
V_117 = Vertex(name = 'V_117', 
	 particles = [P.h1, P.Z, P.Zp], 
	 color = ['1'], 
	 lorentz = [L.SVV1], 
	 couplings = {(0,0):C.GC_117}) 
 
 
V_118 = Vertex(name = 'V_118', 
	 particles = [P.h2, P.Z, P.Zp], 
	 color = ['1'], 
	 lorentz = [L.SVV1], 
	 couplings = {(0,0):C.GC_118}) 
 
 
V_119 = Vertex(name = 'V_119', 
	 particles = [P.h1, P.Zp, P.Zp], 
	 color = ['1'], 
	 lorentz = [L.SVV1], 
	 couplings = {(0,0):C.GC_119}) 
 
 
V_120 = Vertex(name = 'V_120', 
	 particles = [P.h2, P.Zp, P.Zp], 
	 color = ['1'], 
	 lorentz = [L.SVV1], 
	 couplings = {(0,0):C.GC_120}) 
 
 
V_121 = Vertex(name = 'V_121', 
	 particles = [P.Hm, P.Wmc, P.A], 
	 color = ['1'], 
	 lorentz = [L.SVV1], 
	 couplings = {(0,0):C.GC_121}) 
 
 
V_122 = Vertex(name = 'V_122', 
	 particles = [P.Hm, P.Wmc, P.Z], 
	 color = ['1'], 
	 lorentz = [L.SVV1], 
	 couplings = {(0,0):C.GC_122}) 
 
 
V_123 = Vertex(name = 'V_123', 
	 particles = [P.Hm, P.Wmc, P.Zp], 
	 color = ['1'], 
	 lorentz = [L.SVV1], 
	 couplings = {(0,0):C.GC_123}) 
 
 
V_124 = Vertex(name = 'V_124', 
	 particles = [P.Hmc, P.A, P.Wm], 
	 color = ['1'], 
	 lorentz = [L.SVV1], 
	 couplings = {(0,0):C.GC_124}) 
 
 
V_125 = Vertex(name = 'V_125', 
	 particles = [P.Hmc, P.Wm, P.Z], 
	 color = ['1'], 
	 lorentz = [L.SVV1], 
	 couplings = {(0,0):C.GC_125}) 
 
 
V_126 = Vertex(name = 'V_126', 
	 particles = [P.Hmc, P.Wm, P.Zp], 
	 color = ['1'], 
	 lorentz = [L.SVV1], 
	 couplings = {(0,0):C.GC_126}) 
 
 
V_127 = Vertex(name = 'V_127', 
	 particles = [P.d1bar, P.d1, P.Ah1], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_127,(0,1):C.GC_128}) 
 
 
V_128 = Vertex(name = 'V_128', 
	 particles = [P.d1bar, P.d1, P.Ah2], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_129,(0,1):C.GC_130}) 
 
 
V_129 = Vertex(name = 'V_129', 
	 particles = [P.d1bar, P.d2, P.Ah1], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_131,(0,1):C.GC_132}) 
 
 
V_130 = Vertex(name = 'V_130', 
	 particles = [P.d1bar, P.d2, P.Ah2], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_133,(0,1):C.GC_134}) 
 
 
V_131 = Vertex(name = 'V_131', 
	 particles = [P.d1bar, P.d3, P.Ah1], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_135,(0,1):C.GC_136}) 
 
 
V_132 = Vertex(name = 'V_132', 
	 particles = [P.d1bar, P.d3, P.Ah2], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_137,(0,1):C.GC_138}) 
 
 
V_133 = Vertex(name = 'V_133', 
	 particles = [P.d2bar, P.d1, P.Ah1], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_139,(0,1):C.GC_140}) 
 
 
V_134 = Vertex(name = 'V_134', 
	 particles = [P.d2bar, P.d1, P.Ah2], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_141,(0,1):C.GC_142}) 
 
 
V_135 = Vertex(name = 'V_135', 
	 particles = [P.d2bar, P.d2, P.Ah1], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_143,(0,1):C.GC_144}) 
 
 
V_136 = Vertex(name = 'V_136', 
	 particles = [P.d2bar, P.d2, P.Ah2], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_145,(0,1):C.GC_146}) 
 
 
V_137 = Vertex(name = 'V_137', 
	 particles = [P.d2bar, P.d3, P.Ah1], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_147,(0,1):C.GC_148}) 
 
 
V_138 = Vertex(name = 'V_138', 
	 particles = [P.d2bar, P.d3, P.Ah2], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_149,(0,1):C.GC_150}) 
 
 
V_139 = Vertex(name = 'V_139', 
	 particles = [P.d3bar, P.d1, P.Ah1], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_151,(0,1):C.GC_152}) 
 
 
V_140 = Vertex(name = 'V_140', 
	 particles = [P.d3bar, P.d1, P.Ah2], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_153,(0,1):C.GC_154}) 
 
 
V_141 = Vertex(name = 'V_141', 
	 particles = [P.d3bar, P.d2, P.Ah1], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_155,(0,1):C.GC_156}) 
 
 
V_142 = Vertex(name = 'V_142', 
	 particles = [P.d3bar, P.d2, P.Ah2], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_157,(0,1):C.GC_158}) 
 
 
V_143 = Vertex(name = 'V_143', 
	 particles = [P.d3bar, P.d3, P.Ah1], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_159,(0,1):C.GC_160}) 
 
 
V_144 = Vertex(name = 'V_144', 
	 particles = [P.d3bar, P.d3, P.Ah2], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_161,(0,1):C.GC_162}) 
 
 
V_145 = Vertex(name = 'V_145', 
	 particles = [P.e1bar, P.e1, P.Ah1], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_163,(0,1):C.GC_164}) 
 
 
V_146 = Vertex(name = 'V_146', 
	 particles = [P.e1bar, P.e1, P.Ah2], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_165,(0,1):C.GC_166}) 
 
 
V_147 = Vertex(name = 'V_147', 
	 particles = [P.e1bar, P.e2, P.Ah1], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_167,(0,1):C.GC_168}) 
 
 
V_148 = Vertex(name = 'V_148', 
	 particles = [P.e1bar, P.e2, P.Ah2], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_169,(0,1):C.GC_170}) 
 
 
V_149 = Vertex(name = 'V_149', 
	 particles = [P.e1bar, P.e3, P.Ah1], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_171,(0,1):C.GC_172}) 
 
 
V_150 = Vertex(name = 'V_150', 
	 particles = [P.e1bar, P.e3, P.Ah2], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_173,(0,1):C.GC_174}) 
 
 
V_151 = Vertex(name = 'V_151', 
	 particles = [P.e2bar, P.e1, P.Ah1], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_175,(0,1):C.GC_176}) 
 
 
V_152 = Vertex(name = 'V_152', 
	 particles = [P.e2bar, P.e1, P.Ah2], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_177,(0,1):C.GC_178}) 
 
 
V_153 = Vertex(name = 'V_153', 
	 particles = [P.e2bar, P.e2, P.Ah1], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_179,(0,1):C.GC_180}) 
 
 
V_154 = Vertex(name = 'V_154', 
	 particles = [P.e2bar, P.e2, P.Ah2], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_181,(0,1):C.GC_182}) 
 
 
V_155 = Vertex(name = 'V_155', 
	 particles = [P.e2bar, P.e3, P.Ah1], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_183,(0,1):C.GC_184}) 
 
 
V_156 = Vertex(name = 'V_156', 
	 particles = [P.e2bar, P.e3, P.Ah2], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_185,(0,1):C.GC_186}) 
 
 
V_157 = Vertex(name = 'V_157', 
	 particles = [P.e3bar, P.e1, P.Ah1], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_187,(0,1):C.GC_188}) 
 
 
V_158 = Vertex(name = 'V_158', 
	 particles = [P.e3bar, P.e1, P.Ah2], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_189,(0,1):C.GC_190}) 
 
 
V_159 = Vertex(name = 'V_159', 
	 particles = [P.e3bar, P.e2, P.Ah1], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_191,(0,1):C.GC_192}) 
 
 
V_160 = Vertex(name = 'V_160', 
	 particles = [P.e3bar, P.e2, P.Ah2], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_193,(0,1):C.GC_194}) 
 
 
V_161 = Vertex(name = 'V_161', 
	 particles = [P.e3bar, P.e3, P.Ah1], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_195,(0,1):C.GC_196}) 
 
 
V_162 = Vertex(name = 'V_162', 
	 particles = [P.e3bar, P.e3, P.Ah2], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_197,(0,1):C.GC_198}) 
 
 
V_163 = Vertex(name = 'V_163', 
	 particles = [P.u1bar, P.u1, P.Ah1], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_199,(0,1):C.GC_200}) 
 
 
V_164 = Vertex(name = 'V_164', 
	 particles = [P.u1bar, P.u1, P.Ah2], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_201,(0,1):C.GC_202}) 
 
 
V_165 = Vertex(name = 'V_165', 
	 particles = [P.u1bar, P.u2, P.Ah1], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_203,(0,1):C.GC_204}) 
 
 
V_166 = Vertex(name = 'V_166', 
	 particles = [P.u1bar, P.u2, P.Ah2], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_205,(0,1):C.GC_206}) 
 
 
V_167 = Vertex(name = 'V_167', 
	 particles = [P.u1bar, P.u3, P.Ah1], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_207,(0,1):C.GC_208}) 
 
 
V_168 = Vertex(name = 'V_168', 
	 particles = [P.u1bar, P.u3, P.Ah2], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_209,(0,1):C.GC_210}) 
 
 
V_169 = Vertex(name = 'V_169', 
	 particles = [P.u2bar, P.u1, P.Ah1], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_211,(0,1):C.GC_212}) 
 
 
V_170 = Vertex(name = 'V_170', 
	 particles = [P.u2bar, P.u1, P.Ah2], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_213,(0,1):C.GC_214}) 
 
 
V_171 = Vertex(name = 'V_171', 
	 particles = [P.u2bar, P.u2, P.Ah1], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_215,(0,1):C.GC_216}) 
 
 
V_172 = Vertex(name = 'V_172', 
	 particles = [P.u2bar, P.u2, P.Ah2], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_217,(0,1):C.GC_218}) 
 
 
V_173 = Vertex(name = 'V_173', 
	 particles = [P.u2bar, P.u3, P.Ah1], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_219,(0,1):C.GC_220}) 
 
 
V_174 = Vertex(name = 'V_174', 
	 particles = [P.u2bar, P.u3, P.Ah2], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_221,(0,1):C.GC_222}) 
 
 
V_175 = Vertex(name = 'V_175', 
	 particles = [P.u3bar, P.u1, P.Ah1], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_223,(0,1):C.GC_224}) 
 
 
V_176 = Vertex(name = 'V_176', 
	 particles = [P.u3bar, P.u1, P.Ah2], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_225,(0,1):C.GC_226}) 
 
 
V_177 = Vertex(name = 'V_177', 
	 particles = [P.u3bar, P.u2, P.Ah1], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_227,(0,1):C.GC_228}) 
 
 
V_178 = Vertex(name = 'V_178', 
	 particles = [P.u3bar, P.u2, P.Ah2], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_229,(0,1):C.GC_230}) 
 
 
V_179 = Vertex(name = 'V_179', 
	 particles = [P.u3bar, P.u3, P.Ah1], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_231,(0,1):C.GC_232}) 
 
 
V_180 = Vertex(name = 'V_180', 
	 particles = [P.u3bar, P.u3, P.Ah2], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_233,(0,1):C.GC_234}) 
 
 
V_181 = Vertex(name = 'V_181', 
	 particles = [P.nu1, P.nu1, P.Ah1], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_235,(0,1):C.GC_236}) 
 
 
V_182 = Vertex(name = 'V_182', 
	 particles = [P.nu1, P.nu1, P.Ah2], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_237,(0,1):C.GC_238}) 
 
 
V_183 = Vertex(name = 'V_183', 
	 particles = [P.nu1, P.nu2, P.Ah1], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_239,(0,1):C.GC_240}) 
 
 
V_184 = Vertex(name = 'V_184', 
	 particles = [P.nu1, P.nu2, P.Ah2], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_241,(0,1):C.GC_242}) 
 
 
V_185 = Vertex(name = 'V_185', 
	 particles = [P.nu1, P.nu3, P.Ah1], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_243,(0,1):C.GC_244}) 
 
 
V_186 = Vertex(name = 'V_186', 
	 particles = [P.nu1, P.nu3, P.Ah2], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_245,(0,1):C.GC_246}) 
 
 
V_187 = Vertex(name = 'V_187', 
	 particles = [P.nu1, P.nu4, P.Ah1], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_247,(0,1):C.GC_248}) 
 
 
V_188 = Vertex(name = 'V_188', 
	 particles = [P.nu1, P.nu4, P.Ah2], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_249,(0,1):C.GC_250}) 
 
 
V_189 = Vertex(name = 'V_189', 
	 particles = [P.nu1, P.nu5, P.Ah1], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_251,(0,1):C.GC_252}) 
 
 
V_190 = Vertex(name = 'V_190', 
	 particles = [P.nu1, P.nu5, P.Ah2], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_253,(0,1):C.GC_254}) 
 
 
V_191 = Vertex(name = 'V_191', 
	 particles = [P.nu1, P.nu6, P.Ah1], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_255,(0,1):C.GC_256}) 
 
 
V_192 = Vertex(name = 'V_192', 
	 particles = [P.nu1, P.nu6, P.Ah2], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_257,(0,1):C.GC_258}) 
 
 
V_193 = Vertex(name = 'V_193', 
	 particles = [P.nu2, P.nu2, P.Ah1], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_259,(0,1):C.GC_260}) 
 
 
V_194 = Vertex(name = 'V_194', 
	 particles = [P.nu2, P.nu2, P.Ah2], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_261,(0,1):C.GC_262}) 
 
 
V_195 = Vertex(name = 'V_195', 
	 particles = [P.nu2, P.nu3, P.Ah1], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_263,(0,1):C.GC_264}) 
 
 
V_196 = Vertex(name = 'V_196', 
	 particles = [P.nu2, P.nu3, P.Ah2], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_265,(0,1):C.GC_266}) 
 
 
V_197 = Vertex(name = 'V_197', 
	 particles = [P.nu2, P.nu4, P.Ah1], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_267,(0,1):C.GC_268}) 
 
 
V_198 = Vertex(name = 'V_198', 
	 particles = [P.nu2, P.nu4, P.Ah2], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_269,(0,1):C.GC_270}) 
 
 
V_199 = Vertex(name = 'V_199', 
	 particles = [P.nu2, P.nu5, P.Ah1], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_271,(0,1):C.GC_272}) 
 
 
V_200 = Vertex(name = 'V_200', 
	 particles = [P.nu2, P.nu5, P.Ah2], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_273,(0,1):C.GC_274}) 
 
 
V_201 = Vertex(name = 'V_201', 
	 particles = [P.nu2, P.nu6, P.Ah1], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_275,(0,1):C.GC_276}) 
 
 
V_202 = Vertex(name = 'V_202', 
	 particles = [P.nu2, P.nu6, P.Ah2], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_277,(0,1):C.GC_278}) 
 
 
V_203 = Vertex(name = 'V_203', 
	 particles = [P.nu3, P.nu3, P.Ah1], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_279,(0,1):C.GC_280}) 
 
 
V_204 = Vertex(name = 'V_204', 
	 particles = [P.nu3, P.nu3, P.Ah2], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_281,(0,1):C.GC_282}) 
 
 
V_205 = Vertex(name = 'V_205', 
	 particles = [P.nu3, P.nu4, P.Ah1], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_283,(0,1):C.GC_284}) 
 
 
V_206 = Vertex(name = 'V_206', 
	 particles = [P.nu3, P.nu4, P.Ah2], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_285,(0,1):C.GC_286}) 
 
 
V_207 = Vertex(name = 'V_207', 
	 particles = [P.nu3, P.nu5, P.Ah1], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_287,(0,1):C.GC_288}) 
 
 
V_208 = Vertex(name = 'V_208', 
	 particles = [P.nu3, P.nu5, P.Ah2], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_289,(0,1):C.GC_290}) 
 
 
V_209 = Vertex(name = 'V_209', 
	 particles = [P.nu3, P.nu6, P.Ah1], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_291,(0,1):C.GC_292}) 
 
 
V_210 = Vertex(name = 'V_210', 
	 particles = [P.nu3, P.nu6, P.Ah2], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_293,(0,1):C.GC_294}) 
 
 
V_211 = Vertex(name = 'V_211', 
	 particles = [P.nu4, P.nu4, P.Ah1], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_295,(0,1):C.GC_296}) 
 
 
V_212 = Vertex(name = 'V_212', 
	 particles = [P.nu4, P.nu4, P.Ah2], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_297,(0,1):C.GC_298}) 
 
 
V_213 = Vertex(name = 'V_213', 
	 particles = [P.nu4, P.nu5, P.Ah1], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_299,(0,1):C.GC_300}) 
 
 
V_214 = Vertex(name = 'V_214', 
	 particles = [P.nu4, P.nu5, P.Ah2], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_301,(0,1):C.GC_302}) 
 
 
V_215 = Vertex(name = 'V_215', 
	 particles = [P.nu4, P.nu6, P.Ah1], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_303,(0,1):C.GC_304}) 
 
 
V_216 = Vertex(name = 'V_216', 
	 particles = [P.nu4, P.nu6, P.Ah2], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_305,(0,1):C.GC_306}) 
 
 
V_217 = Vertex(name = 'V_217', 
	 particles = [P.nu5, P.nu5, P.Ah1], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_307,(0,1):C.GC_308}) 
 
 
V_218 = Vertex(name = 'V_218', 
	 particles = [P.nu5, P.nu5, P.Ah2], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_309,(0,1):C.GC_310}) 
 
 
V_219 = Vertex(name = 'V_219', 
	 particles = [P.nu5, P.nu6, P.Ah1], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_311,(0,1):C.GC_312}) 
 
 
V_220 = Vertex(name = 'V_220', 
	 particles = [P.nu5, P.nu6, P.Ah2], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_313,(0,1):C.GC_314}) 
 
 
V_221 = Vertex(name = 'V_221', 
	 particles = [P.nu6, P.nu6, P.Ah1], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_315,(0,1):C.GC_316}) 
 
 
V_222 = Vertex(name = 'V_222', 
	 particles = [P.nu6, P.nu6, P.Ah2], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_317,(0,1):C.GC_318}) 
 
 
V_223 = Vertex(name = 'V_223', 
	 particles = [P.d1bar, P.d1, P.h1], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_319,(0,1):C.GC_320}) 
 
 
V_224 = Vertex(name = 'V_224', 
	 particles = [P.d1bar, P.d1, P.h2], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_321,(0,1):C.GC_322}) 
 
 
V_225 = Vertex(name = 'V_225', 
	 particles = [P.d1bar, P.d2, P.h1], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_323,(0,1):C.GC_324}) 
 
 
V_226 = Vertex(name = 'V_226', 
	 particles = [P.d1bar, P.d2, P.h2], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_325,(0,1):C.GC_326}) 
 
 
V_227 = Vertex(name = 'V_227', 
	 particles = [P.d1bar, P.d3, P.h1], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_327,(0,1):C.GC_328}) 
 
 
V_228 = Vertex(name = 'V_228', 
	 particles = [P.d1bar, P.d3, P.h2], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_329,(0,1):C.GC_330}) 
 
 
V_229 = Vertex(name = 'V_229', 
	 particles = [P.d2bar, P.d1, P.h1], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_331,(0,1):C.GC_332}) 
 
 
V_230 = Vertex(name = 'V_230', 
	 particles = [P.d2bar, P.d1, P.h2], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_333,(0,1):C.GC_334}) 
 
 
V_231 = Vertex(name = 'V_231', 
	 particles = [P.d2bar, P.d2, P.h1], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_335,(0,1):C.GC_336}) 
 
 
V_232 = Vertex(name = 'V_232', 
	 particles = [P.d2bar, P.d2, P.h2], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_337,(0,1):C.GC_338}) 
 
 
V_233 = Vertex(name = 'V_233', 
	 particles = [P.d2bar, P.d3, P.h1], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_339,(0,1):C.GC_340}) 
 
 
V_234 = Vertex(name = 'V_234', 
	 particles = [P.d2bar, P.d3, P.h2], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_341,(0,1):C.GC_342}) 
 
 
V_235 = Vertex(name = 'V_235', 
	 particles = [P.d3bar, P.d1, P.h1], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_343,(0,1):C.GC_344}) 
 
 
V_236 = Vertex(name = 'V_236', 
	 particles = [P.d3bar, P.d1, P.h2], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_345,(0,1):C.GC_346}) 
 
 
V_237 = Vertex(name = 'V_237', 
	 particles = [P.d3bar, P.d2, P.h1], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_347,(0,1):C.GC_348}) 
 
 
V_238 = Vertex(name = 'V_238', 
	 particles = [P.d3bar, P.d2, P.h2], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_349,(0,1):C.GC_350}) 
 
 
V_239 = Vertex(name = 'V_239', 
	 particles = [P.d3bar, P.d3, P.h1], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_351,(0,1):C.GC_352}) 
 
 
V_240 = Vertex(name = 'V_240', 
	 particles = [P.d3bar, P.d3, P.h2], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_353,(0,1):C.GC_354}) 
 
 
V_241 = Vertex(name = 'V_241', 
	 particles = [P.u1bar, P.d1, P.Hmc], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_355,(0,1):C.GC_356}) 
 
 
V_242 = Vertex(name = 'V_242', 
	 particles = [P.u1bar, P.d2, P.Hmc], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_357,(0,1):C.GC_358}) 
 
 
V_243 = Vertex(name = 'V_243', 
	 particles = [P.u1bar, P.d3, P.Hmc], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_359,(0,1):C.GC_360}) 
 
 
V_244 = Vertex(name = 'V_244', 
	 particles = [P.u2bar, P.d1, P.Hmc], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_361,(0,1):C.GC_362}) 
 
 
V_245 = Vertex(name = 'V_245', 
	 particles = [P.u2bar, P.d2, P.Hmc], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_363,(0,1):C.GC_364}) 
 
 
V_246 = Vertex(name = 'V_246', 
	 particles = [P.u2bar, P.d3, P.Hmc], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_365,(0,1):C.GC_366}) 
 
 
V_247 = Vertex(name = 'V_247', 
	 particles = [P.u3bar, P.d1, P.Hmc], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_367,(0,1):C.GC_368}) 
 
 
V_248 = Vertex(name = 'V_248', 
	 particles = [P.u3bar, P.d2, P.Hmc], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_369,(0,1):C.GC_370}) 
 
 
V_249 = Vertex(name = 'V_249', 
	 particles = [P.u3bar, P.d3, P.Hmc], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_371,(0,1):C.GC_372}) 
 
 
V_250 = Vertex(name = 'V_250', 
	 particles = [P.nu1, P.e1, P.Hmc], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_373,(0,1):C.GC_374}) 
 
 
V_251 = Vertex(name = 'V_251', 
	 particles = [P.nu1, P.e2, P.Hmc], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_375,(0,1):C.GC_376}) 
 
 
V_252 = Vertex(name = 'V_252', 
	 particles = [P.nu1, P.e3, P.Hmc], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_377,(0,1):C.GC_378}) 
 
 
V_253 = Vertex(name = 'V_253', 
	 particles = [P.nu2, P.e1, P.Hmc], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_379,(0,1):C.GC_380}) 
 
 
V_254 = Vertex(name = 'V_254', 
	 particles = [P.nu2, P.e2, P.Hmc], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_381,(0,1):C.GC_382}) 
 
 
V_255 = Vertex(name = 'V_255', 
	 particles = [P.nu2, P.e3, P.Hmc], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_383,(0,1):C.GC_384}) 
 
 
V_256 = Vertex(name = 'V_256', 
	 particles = [P.nu3, P.e1, P.Hmc], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_385,(0,1):C.GC_386}) 
 
 
V_257 = Vertex(name = 'V_257', 
	 particles = [P.nu3, P.e2, P.Hmc], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_387,(0,1):C.GC_388}) 
 
 
V_258 = Vertex(name = 'V_258', 
	 particles = [P.nu3, P.e3, P.Hmc], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_389,(0,1):C.GC_390}) 
 
 
V_259 = Vertex(name = 'V_259', 
	 particles = [P.nu4, P.e1, P.Hmc], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_391,(0,1):C.GC_392}) 
 
 
V_260 = Vertex(name = 'V_260', 
	 particles = [P.nu4, P.e2, P.Hmc], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_393,(0,1):C.GC_394}) 
 
 
V_261 = Vertex(name = 'V_261', 
	 particles = [P.nu4, P.e3, P.Hmc], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_395,(0,1):C.GC_396}) 
 
 
V_262 = Vertex(name = 'V_262', 
	 particles = [P.nu5, P.e1, P.Hmc], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_397,(0,1):C.GC_398}) 
 
 
V_263 = Vertex(name = 'V_263', 
	 particles = [P.nu5, P.e2, P.Hmc], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_399,(0,1):C.GC_400}) 
 
 
V_264 = Vertex(name = 'V_264', 
	 particles = [P.nu5, P.e3, P.Hmc], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_401,(0,1):C.GC_402}) 
 
 
V_265 = Vertex(name = 'V_265', 
	 particles = [P.nu6, P.e1, P.Hmc], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_403,(0,1):C.GC_404}) 
 
 
V_266 = Vertex(name = 'V_266', 
	 particles = [P.nu6, P.e2, P.Hmc], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_405,(0,1):C.GC_406}) 
 
 
V_267 = Vertex(name = 'V_267', 
	 particles = [P.nu6, P.e3, P.Hmc], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_407,(0,1):C.GC_408}) 
 
 
V_268 = Vertex(name = 'V_268', 
	 particles = [P.e1bar, P.e1, P.h1], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_409,(0,1):C.GC_410}) 
 
 
V_269 = Vertex(name = 'V_269', 
	 particles = [P.e1bar, P.e1, P.h2], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_411,(0,1):C.GC_412}) 
 
 
V_270 = Vertex(name = 'V_270', 
	 particles = [P.e1bar, P.e2, P.h1], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_413,(0,1):C.GC_414}) 
 
 
V_271 = Vertex(name = 'V_271', 
	 particles = [P.e1bar, P.e2, P.h2], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_415,(0,1):C.GC_416}) 
 
 
V_272 = Vertex(name = 'V_272', 
	 particles = [P.e1bar, P.e3, P.h1], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_417,(0,1):C.GC_418}) 
 
 
V_273 = Vertex(name = 'V_273', 
	 particles = [P.e1bar, P.e3, P.h2], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_419,(0,1):C.GC_420}) 
 
 
V_274 = Vertex(name = 'V_274', 
	 particles = [P.e2bar, P.e1, P.h1], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_421,(0,1):C.GC_422}) 
 
 
V_275 = Vertex(name = 'V_275', 
	 particles = [P.e2bar, P.e1, P.h2], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_423,(0,1):C.GC_424}) 
 
 
V_276 = Vertex(name = 'V_276', 
	 particles = [P.e2bar, P.e2, P.h1], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_425,(0,1):C.GC_426}) 
 
 
V_277 = Vertex(name = 'V_277', 
	 particles = [P.e2bar, P.e2, P.h2], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_427,(0,1):C.GC_428}) 
 
 
V_278 = Vertex(name = 'V_278', 
	 particles = [P.e2bar, P.e3, P.h1], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_429,(0,1):C.GC_430}) 
 
 
V_279 = Vertex(name = 'V_279', 
	 particles = [P.e2bar, P.e3, P.h2], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_431,(0,1):C.GC_432}) 
 
 
V_280 = Vertex(name = 'V_280', 
	 particles = [P.e3bar, P.e1, P.h1], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_433,(0,1):C.GC_434}) 
 
 
V_281 = Vertex(name = 'V_281', 
	 particles = [P.e3bar, P.e1, P.h2], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_435,(0,1):C.GC_436}) 
 
 
V_282 = Vertex(name = 'V_282', 
	 particles = [P.e3bar, P.e2, P.h1], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_437,(0,1):C.GC_438}) 
 
 
V_283 = Vertex(name = 'V_283', 
	 particles = [P.e3bar, P.e2, P.h2], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_439,(0,1):C.GC_440}) 
 
 
V_284 = Vertex(name = 'V_284', 
	 particles = [P.e3bar, P.e3, P.h1], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_441,(0,1):C.GC_442}) 
 
 
V_285 = Vertex(name = 'V_285', 
	 particles = [P.e3bar, P.e3, P.h2], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_443,(0,1):C.GC_444}) 
 
 
V_286 = Vertex(name = 'V_286', 
	 particles = [P.u1bar, P.u1, P.h1], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_445,(0,1):C.GC_446}) 
 
 
V_287 = Vertex(name = 'V_287', 
	 particles = [P.u1bar, P.u1, P.h2], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_447,(0,1):C.GC_448}) 
 
 
V_288 = Vertex(name = 'V_288', 
	 particles = [P.u1bar, P.u2, P.h1], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_449,(0,1):C.GC_450}) 
 
 
V_289 = Vertex(name = 'V_289', 
	 particles = [P.u1bar, P.u2, P.h2], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_451,(0,1):C.GC_452}) 
 
 
V_290 = Vertex(name = 'V_290', 
	 particles = [P.u1bar, P.u3, P.h1], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_453,(0,1):C.GC_454}) 
 
 
V_291 = Vertex(name = 'V_291', 
	 particles = [P.u1bar, P.u3, P.h2], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_455,(0,1):C.GC_456}) 
 
 
V_292 = Vertex(name = 'V_292', 
	 particles = [P.u2bar, P.u1, P.h1], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_457,(0,1):C.GC_458}) 
 
 
V_293 = Vertex(name = 'V_293', 
	 particles = [P.u2bar, P.u1, P.h2], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_459,(0,1):C.GC_460}) 
 
 
V_294 = Vertex(name = 'V_294', 
	 particles = [P.u2bar, P.u2, P.h1], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_461,(0,1):C.GC_462}) 
 
 
V_295 = Vertex(name = 'V_295', 
	 particles = [P.u2bar, P.u2, P.h2], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_463,(0,1):C.GC_464}) 
 
 
V_296 = Vertex(name = 'V_296', 
	 particles = [P.u2bar, P.u3, P.h1], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_465,(0,1):C.GC_466}) 
 
 
V_297 = Vertex(name = 'V_297', 
	 particles = [P.u2bar, P.u3, P.h2], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_467,(0,1):C.GC_468}) 
 
 
V_298 = Vertex(name = 'V_298', 
	 particles = [P.u3bar, P.u1, P.h1], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_469,(0,1):C.GC_470}) 
 
 
V_299 = Vertex(name = 'V_299', 
	 particles = [P.u3bar, P.u1, P.h2], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_471,(0,1):C.GC_472}) 
 
 
V_300 = Vertex(name = 'V_300', 
	 particles = [P.u3bar, P.u2, P.h1], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_473,(0,1):C.GC_474}) 
 
 
V_301 = Vertex(name = 'V_301', 
	 particles = [P.u3bar, P.u2, P.h2], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_475,(0,1):C.GC_476}) 
 
 
V_302 = Vertex(name = 'V_302', 
	 particles = [P.u3bar, P.u3, P.h1], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_477,(0,1):C.GC_478}) 
 
 
V_303 = Vertex(name = 'V_303', 
	 particles = [P.u3bar, P.u3, P.h2], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_479,(0,1):C.GC_480}) 
 
 
V_304 = Vertex(name = 'V_304', 
	 particles = [P.d1bar, P.u1, P.Hm], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_481,(0,1):C.GC_482}) 
 
 
V_305 = Vertex(name = 'V_305', 
	 particles = [P.d1bar, P.u2, P.Hm], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_483,(0,1):C.GC_484}) 
 
 
V_306 = Vertex(name = 'V_306', 
	 particles = [P.d1bar, P.u3, P.Hm], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_485,(0,1):C.GC_486}) 
 
 
V_307 = Vertex(name = 'V_307', 
	 particles = [P.d2bar, P.u1, P.Hm], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_487,(0,1):C.GC_488}) 
 
 
V_308 = Vertex(name = 'V_308', 
	 particles = [P.d2bar, P.u2, P.Hm], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_489,(0,1):C.GC_490}) 
 
 
V_309 = Vertex(name = 'V_309', 
	 particles = [P.d2bar, P.u3, P.Hm], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_491,(0,1):C.GC_492}) 
 
 
V_310 = Vertex(name = 'V_310', 
	 particles = [P.d3bar, P.u1, P.Hm], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_493,(0,1):C.GC_494}) 
 
 
V_311 = Vertex(name = 'V_311', 
	 particles = [P.d3bar, P.u2, P.Hm], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_495,(0,1):C.GC_496}) 
 
 
V_312 = Vertex(name = 'V_312', 
	 particles = [P.d3bar, P.u3, P.Hm], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_497,(0,1):C.GC_498}) 
 
 
V_313 = Vertex(name = 'V_313', 
	 particles = [P.nu1, P.nu1, P.h1], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_499,(0,1):C.GC_500}) 
 
 
V_314 = Vertex(name = 'V_314', 
	 particles = [P.nu1, P.nu1, P.h2], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_501,(0,1):C.GC_502}) 
 
 
V_315 = Vertex(name = 'V_315', 
	 particles = [P.nu1, P.nu2, P.h1], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_503,(0,1):C.GC_504}) 
 
 
V_316 = Vertex(name = 'V_316', 
	 particles = [P.nu1, P.nu2, P.h2], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_505,(0,1):C.GC_506}) 
 
 
V_317 = Vertex(name = 'V_317', 
	 particles = [P.nu1, P.nu3, P.h1], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_507,(0,1):C.GC_508}) 
 
 
V_318 = Vertex(name = 'V_318', 
	 particles = [P.nu1, P.nu3, P.h2], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_509,(0,1):C.GC_510}) 
 
 
V_319 = Vertex(name = 'V_319', 
	 particles = [P.nu1, P.nu4, P.h1], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_511,(0,1):C.GC_512}) 
 
 
V_320 = Vertex(name = 'V_320', 
	 particles = [P.nu1, P.nu4, P.h2], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_513,(0,1):C.GC_514}) 
 
 
V_321 = Vertex(name = 'V_321', 
	 particles = [P.nu1, P.nu5, P.h1], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_515,(0,1):C.GC_516}) 
 
 
V_322 = Vertex(name = 'V_322', 
	 particles = [P.nu1, P.nu5, P.h2], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_517,(0,1):C.GC_518}) 
 
 
V_323 = Vertex(name = 'V_323', 
	 particles = [P.nu1, P.nu6, P.h1], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_519,(0,1):C.GC_520}) 
 
 
V_324 = Vertex(name = 'V_324', 
	 particles = [P.nu1, P.nu6, P.h2], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_521,(0,1):C.GC_522}) 
 
 
V_325 = Vertex(name = 'V_325', 
	 particles = [P.nu2, P.nu2, P.h1], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_523,(0,1):C.GC_524}) 
 
 
V_326 = Vertex(name = 'V_326', 
	 particles = [P.nu2, P.nu2, P.h2], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_525,(0,1):C.GC_526}) 
 
 
V_327 = Vertex(name = 'V_327', 
	 particles = [P.nu2, P.nu3, P.h1], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_527,(0,1):C.GC_528}) 
 
 
V_328 = Vertex(name = 'V_328', 
	 particles = [P.nu2, P.nu3, P.h2], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_529,(0,1):C.GC_530}) 
 
 
V_329 = Vertex(name = 'V_329', 
	 particles = [P.nu2, P.nu4, P.h1], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_531,(0,1):C.GC_532}) 
 
 
V_330 = Vertex(name = 'V_330', 
	 particles = [P.nu2, P.nu4, P.h2], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_533,(0,1):C.GC_534}) 
 
 
V_331 = Vertex(name = 'V_331', 
	 particles = [P.nu2, P.nu5, P.h1], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_535,(0,1):C.GC_536}) 
 
 
V_332 = Vertex(name = 'V_332', 
	 particles = [P.nu2, P.nu5, P.h2], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_537,(0,1):C.GC_538}) 
 
 
V_333 = Vertex(name = 'V_333', 
	 particles = [P.nu2, P.nu6, P.h1], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_539,(0,1):C.GC_540}) 
 
 
V_334 = Vertex(name = 'V_334', 
	 particles = [P.nu2, P.nu6, P.h2], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_541,(0,1):C.GC_542}) 
 
 
V_335 = Vertex(name = 'V_335', 
	 particles = [P.nu3, P.nu3, P.h1], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_543,(0,1):C.GC_544}) 
 
 
V_336 = Vertex(name = 'V_336', 
	 particles = [P.nu3, P.nu3, P.h2], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_545,(0,1):C.GC_546}) 
 
 
V_337 = Vertex(name = 'V_337', 
	 particles = [P.nu3, P.nu4, P.h1], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_547,(0,1):C.GC_548}) 
 
 
V_338 = Vertex(name = 'V_338', 
	 particles = [P.nu3, P.nu4, P.h2], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_549,(0,1):C.GC_550}) 
 
 
V_339 = Vertex(name = 'V_339', 
	 particles = [P.nu3, P.nu5, P.h1], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_551,(0,1):C.GC_552}) 
 
 
V_340 = Vertex(name = 'V_340', 
	 particles = [P.nu3, P.nu5, P.h2], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_553,(0,1):C.GC_554}) 
 
 
V_341 = Vertex(name = 'V_341', 
	 particles = [P.nu3, P.nu6, P.h1], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_555,(0,1):C.GC_556}) 
 
 
V_342 = Vertex(name = 'V_342', 
	 particles = [P.nu3, P.nu6, P.h2], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_557,(0,1):C.GC_558}) 
 
 
V_343 = Vertex(name = 'V_343', 
	 particles = [P.nu4, P.nu4, P.h1], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_559,(0,1):C.GC_560}) 
 
 
V_344 = Vertex(name = 'V_344', 
	 particles = [P.nu4, P.nu4, P.h2], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_561,(0,1):C.GC_562}) 
 
 
V_345 = Vertex(name = 'V_345', 
	 particles = [P.nu4, P.nu5, P.h1], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_563,(0,1):C.GC_564}) 
 
 
V_346 = Vertex(name = 'V_346', 
	 particles = [P.nu4, P.nu5, P.h2], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_565,(0,1):C.GC_566}) 
 
 
V_347 = Vertex(name = 'V_347', 
	 particles = [P.nu4, P.nu6, P.h1], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_567,(0,1):C.GC_568}) 
 
 
V_348 = Vertex(name = 'V_348', 
	 particles = [P.nu4, P.nu6, P.h2], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_569,(0,1):C.GC_570}) 
 
 
V_349 = Vertex(name = 'V_349', 
	 particles = [P.nu5, P.nu5, P.h1], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_571,(0,1):C.GC_572}) 
 
 
V_350 = Vertex(name = 'V_350', 
	 particles = [P.nu5, P.nu5, P.h2], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_573,(0,1):C.GC_574}) 
 
 
V_351 = Vertex(name = 'V_351', 
	 particles = [P.nu5, P.nu6, P.h1], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_575,(0,1):C.GC_576}) 
 
 
V_352 = Vertex(name = 'V_352', 
	 particles = [P.nu5, P.nu6, P.h2], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_577,(0,1):C.GC_578}) 
 
 
V_353 = Vertex(name = 'V_353', 
	 particles = [P.nu6, P.nu6, P.h1], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_579,(0,1):C.GC_580}) 
 
 
V_354 = Vertex(name = 'V_354', 
	 particles = [P.nu6, P.nu6, P.h2], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_581,(0,1):C.GC_582}) 
 
 
V_355 = Vertex(name = 'V_355', 
	 particles = [P.e1bar, P.nu1, P.Hm], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_583,(0,1):C.GC_584}) 
 
 
V_356 = Vertex(name = 'V_356', 
	 particles = [P.e1bar, P.nu2, P.Hm], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_585,(0,1):C.GC_586}) 
 
 
V_357 = Vertex(name = 'V_357', 
	 particles = [P.e1bar, P.nu3, P.Hm], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_587,(0,1):C.GC_588}) 
 
 
V_358 = Vertex(name = 'V_358', 
	 particles = [P.e1bar, P.nu4, P.Hm], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_589,(0,1):C.GC_590}) 
 
 
V_359 = Vertex(name = 'V_359', 
	 particles = [P.e1bar, P.nu5, P.Hm], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_591,(0,1):C.GC_592}) 
 
 
V_360 = Vertex(name = 'V_360', 
	 particles = [P.e1bar, P.nu6, P.Hm], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_593,(0,1):C.GC_594}) 
 
 
V_361 = Vertex(name = 'V_361', 
	 particles = [P.e2bar, P.nu1, P.Hm], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_595,(0,1):C.GC_596}) 
 
 
V_362 = Vertex(name = 'V_362', 
	 particles = [P.e2bar, P.nu2, P.Hm], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_597,(0,1):C.GC_598}) 
 
 
V_363 = Vertex(name = 'V_363', 
	 particles = [P.e2bar, P.nu3, P.Hm], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_599,(0,1):C.GC_600}) 
 
 
V_364 = Vertex(name = 'V_364', 
	 particles = [P.e2bar, P.nu4, P.Hm], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_601,(0,1):C.GC_602}) 
 
 
V_365 = Vertex(name = 'V_365', 
	 particles = [P.e2bar, P.nu5, P.Hm], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_603,(0,1):C.GC_604}) 
 
 
V_366 = Vertex(name = 'V_366', 
	 particles = [P.e2bar, P.nu6, P.Hm], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_605,(0,1):C.GC_606}) 
 
 
V_367 = Vertex(name = 'V_367', 
	 particles = [P.e3bar, P.nu1, P.Hm], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_607,(0,1):C.GC_608}) 
 
 
V_368 = Vertex(name = 'V_368', 
	 particles = [P.e3bar, P.nu2, P.Hm], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_609,(0,1):C.GC_610}) 
 
 
V_369 = Vertex(name = 'V_369', 
	 particles = [P.e3bar, P.nu3, P.Hm], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_611,(0,1):C.GC_612}) 
 
 
V_370 = Vertex(name = 'V_370', 
	 particles = [P.e3bar, P.nu4, P.Hm], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_613,(0,1):C.GC_614}) 
 
 
V_371 = Vertex(name = 'V_371', 
	 particles = [P.e3bar, P.nu5, P.Hm], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_615,(0,1):C.GC_616}) 
 
 
V_372 = Vertex(name = 'V_372', 
	 particles = [P.e3bar, P.nu6, P.Hm], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_617,(0,1):C.GC_618}) 
 
 
V_373 = Vertex(name = 'V_373', 
	 particles = [P.d1bar, P.d1, P.g], 
	 color = ['T(3,2,1)'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_619,(0,0):C.GC_620}) 
 
 
V_374 = Vertex(name = 'V_374', 
	 particles = [P.d2bar, P.d2, P.g], 
	 color = ['T(3,2,1)'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_621,(0,0):C.GC_622}) 
 
 
V_375 = Vertex(name = 'V_375', 
	 particles = [P.d3bar, P.d3, P.g], 
	 color = ['T(3,2,1)'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_623,(0,0):C.GC_624}) 
 
 
V_376 = Vertex(name = 'V_376', 
	 particles = [P.d1bar, P.d1, P.A], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_625,(0,0):C.GC_626}) 
 
 
V_377 = Vertex(name = 'V_377', 
	 particles = [P.d2bar, P.d2, P.A], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_627,(0,0):C.GC_628}) 
 
 
V_378 = Vertex(name = 'V_378', 
	 particles = [P.d3bar, P.d3, P.A], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_629,(0,0):C.GC_630}) 
 
 
V_379 = Vertex(name = 'V_379', 
	 particles = [P.d1bar, P.d1, P.Z], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_631,(0,0):C.GC_632}) 
 
 
V_380 = Vertex(name = 'V_380', 
	 particles = [P.d2bar, P.d2, P.Z], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_633,(0,0):C.GC_634}) 
 
 
V_381 = Vertex(name = 'V_381', 
	 particles = [P.d3bar, P.d3, P.Z], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_635,(0,0):C.GC_636}) 
 
 
V_382 = Vertex(name = 'V_382', 
	 particles = [P.d1bar, P.d1, P.Zp], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_637,(0,0):C.GC_638}) 
 
 
V_383 = Vertex(name = 'V_383', 
	 particles = [P.d2bar, P.d2, P.Zp], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_639,(0,0):C.GC_640}) 
 
 
V_384 = Vertex(name = 'V_384', 
	 particles = [P.d3bar, P.d3, P.Zp], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_641,(0,0):C.GC_642}) 
 
 
V_385 = Vertex(name = 'V_385', 
	 particles = [P.u1bar, P.d1, P.Wmc], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFV3], 
	 couplings = {(0,0):C.GC_643}) 
 
 
V_386 = Vertex(name = 'V_386', 
	 particles = [P.u1bar, P.d2, P.Wmc], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFV3], 
	 couplings = {(0,0):C.GC_644}) 
 
 
V_387 = Vertex(name = 'V_387', 
	 particles = [P.u1bar, P.d3, P.Wmc], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFV3], 
	 couplings = {(0,0):C.GC_645}) 
 
 
V_388 = Vertex(name = 'V_388', 
	 particles = [P.u2bar, P.d1, P.Wmc], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFV3], 
	 couplings = {(0,0):C.GC_646}) 
 
 
V_389 = Vertex(name = 'V_389', 
	 particles = [P.u2bar, P.d2, P.Wmc], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFV3], 
	 couplings = {(0,0):C.GC_647}) 
 
 
V_390 = Vertex(name = 'V_390', 
	 particles = [P.u2bar, P.d3, P.Wmc], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFV3], 
	 couplings = {(0,0):C.GC_648}) 
 
 
V_391 = Vertex(name = 'V_391', 
	 particles = [P.u3bar, P.d1, P.Wmc], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFV3], 
	 couplings = {(0,0):C.GC_649}) 
 
 
V_392 = Vertex(name = 'V_392', 
	 particles = [P.u3bar, P.d2, P.Wmc], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFV3], 
	 couplings = {(0,0):C.GC_650}) 
 
 
V_393 = Vertex(name = 'V_393', 
	 particles = [P.u3bar, P.d3, P.Wmc], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFV3], 
	 couplings = {(0,0):C.GC_651}) 
 
 
V_394 = Vertex(name = 'V_394', 
	 particles = [P.nu1, P.e1, P.Wmc], 
	 color = ['1'], 
	 lorentz = [L.FFV3], 
	 couplings = {(0,0):C.GC_652}) 
 
 
V_395 = Vertex(name = 'V_395', 
	 particles = [P.nu1, P.e2, P.Wmc], 
	 color = ['1'], 
	 lorentz = [L.FFV3], 
	 couplings = {(0,0):C.GC_653}) 
 
 
V_396 = Vertex(name = 'V_396', 
	 particles = [P.nu1, P.e3, P.Wmc], 
	 color = ['1'], 
	 lorentz = [L.FFV3], 
	 couplings = {(0,0):C.GC_654}) 
 
 
V_397 = Vertex(name = 'V_397', 
	 particles = [P.nu2, P.e1, P.Wmc], 
	 color = ['1'], 
	 lorentz = [L.FFV3], 
	 couplings = {(0,0):C.GC_655}) 
 
 
V_398 = Vertex(name = 'V_398', 
	 particles = [P.nu2, P.e2, P.Wmc], 
	 color = ['1'], 
	 lorentz = [L.FFV3], 
	 couplings = {(0,0):C.GC_656}) 
 
 
V_399 = Vertex(name = 'V_399', 
	 particles = [P.nu2, P.e3, P.Wmc], 
	 color = ['1'], 
	 lorentz = [L.FFV3], 
	 couplings = {(0,0):C.GC_657}) 
 
 
V_400 = Vertex(name = 'V_400', 
	 particles = [P.nu3, P.e1, P.Wmc], 
	 color = ['1'], 
	 lorentz = [L.FFV3], 
	 couplings = {(0,0):C.GC_658}) 
 
 
V_401 = Vertex(name = 'V_401', 
	 particles = [P.nu3, P.e2, P.Wmc], 
	 color = ['1'], 
	 lorentz = [L.FFV3], 
	 couplings = {(0,0):C.GC_659}) 
 
 
V_402 = Vertex(name = 'V_402', 
	 particles = [P.nu3, P.e3, P.Wmc], 
	 color = ['1'], 
	 lorentz = [L.FFV3], 
	 couplings = {(0,0):C.GC_660}) 
 
 
V_403 = Vertex(name = 'V_403', 
	 particles = [P.nu4, P.e1, P.Wmc], 
	 color = ['1'], 
	 lorentz = [L.FFV3], 
	 couplings = {(0,0):C.GC_661}) 
 
 
V_404 = Vertex(name = 'V_404', 
	 particles = [P.nu4, P.e2, P.Wmc], 
	 color = ['1'], 
	 lorentz = [L.FFV3], 
	 couplings = {(0,0):C.GC_662}) 
 
 
V_405 = Vertex(name = 'V_405', 
	 particles = [P.nu4, P.e3, P.Wmc], 
	 color = ['1'], 
	 lorentz = [L.FFV3], 
	 couplings = {(0,0):C.GC_663}) 
 
 
V_406 = Vertex(name = 'V_406', 
	 particles = [P.nu5, P.e1, P.Wmc], 
	 color = ['1'], 
	 lorentz = [L.FFV3], 
	 couplings = {(0,0):C.GC_664}) 
 
 
V_407 = Vertex(name = 'V_407', 
	 particles = [P.nu5, P.e2, P.Wmc], 
	 color = ['1'], 
	 lorentz = [L.FFV3], 
	 couplings = {(0,0):C.GC_665}) 
 
 
V_408 = Vertex(name = 'V_408', 
	 particles = [P.nu5, P.e3, P.Wmc], 
	 color = ['1'], 
	 lorentz = [L.FFV3], 
	 couplings = {(0,0):C.GC_666}) 
 
 
V_409 = Vertex(name = 'V_409', 
	 particles = [P.nu6, P.e1, P.Wmc], 
	 color = ['1'], 
	 lorentz = [L.FFV3], 
	 couplings = {(0,0):C.GC_667}) 
 
 
V_410 = Vertex(name = 'V_410', 
	 particles = [P.nu6, P.e2, P.Wmc], 
	 color = ['1'], 
	 lorentz = [L.FFV3], 
	 couplings = {(0,0):C.GC_668}) 
 
 
V_411 = Vertex(name = 'V_411', 
	 particles = [P.nu6, P.e3, P.Wmc], 
	 color = ['1'], 
	 lorentz = [L.FFV3], 
	 couplings = {(0,0):C.GC_669}) 
 
 
V_412 = Vertex(name = 'V_412', 
	 particles = [P.e1bar, P.e1, P.A], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_670,(0,0):C.GC_671}) 
 
 
V_413 = Vertex(name = 'V_413', 
	 particles = [P.e2bar, P.e2, P.A], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_672,(0,0):C.GC_673}) 
 
 
V_414 = Vertex(name = 'V_414', 
	 particles = [P.e3bar, P.e3, P.A], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_674,(0,0):C.GC_675}) 
 
 
V_415 = Vertex(name = 'V_415', 
	 particles = [P.e1bar, P.e1, P.Z], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_676,(0,0):C.GC_677}) 
 
 
V_416 = Vertex(name = 'V_416', 
	 particles = [P.e2bar, P.e2, P.Z], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_678,(0,0):C.GC_679}) 
 
 
V_417 = Vertex(name = 'V_417', 
	 particles = [P.e3bar, P.e3, P.Z], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_680,(0,0):C.GC_681}) 
 
 
V_418 = Vertex(name = 'V_418', 
	 particles = [P.e1bar, P.e1, P.Zp], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_682,(0,0):C.GC_683}) 
 
 
V_419 = Vertex(name = 'V_419', 
	 particles = [P.e2bar, P.e2, P.Zp], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_684,(0,0):C.GC_685}) 
 
 
V_420 = Vertex(name = 'V_420', 
	 particles = [P.e3bar, P.e3, P.Zp], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_686,(0,0):C.GC_687}) 
 
 
V_421 = Vertex(name = 'V_421', 
	 particles = [P.u1bar, P.u1, P.g], 
	 color = ['T(3,2,1)'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_688,(0,0):C.GC_689}) 
 
 
V_422 = Vertex(name = 'V_422', 
	 particles = [P.u2bar, P.u2, P.g], 
	 color = ['T(3,2,1)'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_690,(0,0):C.GC_691}) 
 
 
V_423 = Vertex(name = 'V_423', 
	 particles = [P.u3bar, P.u3, P.g], 
	 color = ['T(3,2,1)'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_692,(0,0):C.GC_693}) 
 
 
V_424 = Vertex(name = 'V_424', 
	 particles = [P.u1bar, P.u1, P.A], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_694,(0,0):C.GC_695}) 
 
 
V_425 = Vertex(name = 'V_425', 
	 particles = [P.u2bar, P.u2, P.A], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_696,(0,0):C.GC_697}) 
 
 
V_426 = Vertex(name = 'V_426', 
	 particles = [P.u3bar, P.u3, P.A], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_698,(0,0):C.GC_699}) 
 
 
V_427 = Vertex(name = 'V_427', 
	 particles = [P.d1bar, P.u1, P.Wm], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFV3], 
	 couplings = {(0,0):C.GC_700}) 
 
 
V_428 = Vertex(name = 'V_428', 
	 particles = [P.d1bar, P.u2, P.Wm], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFV3], 
	 couplings = {(0,0):C.GC_701}) 
 
 
V_429 = Vertex(name = 'V_429', 
	 particles = [P.d1bar, P.u3, P.Wm], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFV3], 
	 couplings = {(0,0):C.GC_702}) 
 
 
V_430 = Vertex(name = 'V_430', 
	 particles = [P.d2bar, P.u1, P.Wm], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFV3], 
	 couplings = {(0,0):C.GC_703}) 
 
 
V_431 = Vertex(name = 'V_431', 
	 particles = [P.d2bar, P.u2, P.Wm], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFV3], 
	 couplings = {(0,0):C.GC_704}) 
 
 
V_432 = Vertex(name = 'V_432', 
	 particles = [P.d2bar, P.u3, P.Wm], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFV3], 
	 couplings = {(0,0):C.GC_705}) 
 
 
V_433 = Vertex(name = 'V_433', 
	 particles = [P.d3bar, P.u1, P.Wm], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFV3], 
	 couplings = {(0,0):C.GC_706}) 
 
 
V_434 = Vertex(name = 'V_434', 
	 particles = [P.d3bar, P.u2, P.Wm], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFV3], 
	 couplings = {(0,0):C.GC_707}) 
 
 
V_435 = Vertex(name = 'V_435', 
	 particles = [P.d3bar, P.u3, P.Wm], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFV3], 
	 couplings = {(0,0):C.GC_708}) 
 
 
V_436 = Vertex(name = 'V_436', 
	 particles = [P.u1bar, P.u1, P.Z], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_709,(0,0):C.GC_710}) 
 
 
V_437 = Vertex(name = 'V_437', 
	 particles = [P.u2bar, P.u2, P.Z], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_711,(0,0):C.GC_712}) 
 
 
V_438 = Vertex(name = 'V_438', 
	 particles = [P.u3bar, P.u3, P.Z], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_713,(0,0):C.GC_714}) 
 
 
V_439 = Vertex(name = 'V_439', 
	 particles = [P.u1bar, P.u1, P.Zp], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_715,(0,0):C.GC_716}) 
 
 
V_440 = Vertex(name = 'V_440', 
	 particles = [P.u2bar, P.u2, P.Zp], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_717,(0,0):C.GC_718}) 
 
 
V_441 = Vertex(name = 'V_441', 
	 particles = [P.u3bar, P.u3, P.Zp], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_719,(0,0):C.GC_720}) 
 
 
V_442 = Vertex(name = 'V_442', 
	 particles = [P.nu1, P.nu1, P.A], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_721,(0,0):C.GC_722}) 
 
 
V_443 = Vertex(name = 'V_443', 
	 particles = [P.nu1, P.nu2, P.A], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_723,(0,0):C.GC_724}) 
 
 
V_444 = Vertex(name = 'V_444', 
	 particles = [P.nu1, P.nu3, P.A], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_725,(0,0):C.GC_726}) 
 
 
V_445 = Vertex(name = 'V_445', 
	 particles = [P.nu1, P.nu4, P.A], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_727,(0,0):C.GC_728}) 
 
 
V_446 = Vertex(name = 'V_446', 
	 particles = [P.nu1, P.nu5, P.A], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_729,(0,0):C.GC_730}) 
 
 
V_447 = Vertex(name = 'V_447', 
	 particles = [P.nu1, P.nu6, P.A], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_731,(0,0):C.GC_732}) 
 
 
V_448 = Vertex(name = 'V_448', 
	 particles = [P.nu2, P.nu2, P.A], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_733,(0,0):C.GC_734}) 
 
 
V_449 = Vertex(name = 'V_449', 
	 particles = [P.nu2, P.nu3, P.A], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_735,(0,0):C.GC_736}) 
 
 
V_450 = Vertex(name = 'V_450', 
	 particles = [P.nu2, P.nu4, P.A], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_737,(0,0):C.GC_738}) 
 
 
V_451 = Vertex(name = 'V_451', 
	 particles = [P.nu2, P.nu5, P.A], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_739,(0,0):C.GC_740}) 
 
 
V_452 = Vertex(name = 'V_452', 
	 particles = [P.nu2, P.nu6, P.A], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_741,(0,0):C.GC_742}) 
 
 
V_453 = Vertex(name = 'V_453', 
	 particles = [P.nu3, P.nu3, P.A], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_743,(0,0):C.GC_744}) 
 
 
V_454 = Vertex(name = 'V_454', 
	 particles = [P.nu3, P.nu4, P.A], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_745,(0,0):C.GC_746}) 
 
 
V_455 = Vertex(name = 'V_455', 
	 particles = [P.nu3, P.nu5, P.A], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_747,(0,0):C.GC_748}) 
 
 
V_456 = Vertex(name = 'V_456', 
	 particles = [P.nu3, P.nu6, P.A], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_749,(0,0):C.GC_750}) 
 
 
V_457 = Vertex(name = 'V_457', 
	 particles = [P.nu4, P.nu4, P.A], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_751,(0,0):C.GC_752}) 
 
 
V_458 = Vertex(name = 'V_458', 
	 particles = [P.nu4, P.nu5, P.A], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_753,(0,0):C.GC_754}) 
 
 
V_459 = Vertex(name = 'V_459', 
	 particles = [P.nu4, P.nu6, P.A], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_755,(0,0):C.GC_756}) 
 
 
V_460 = Vertex(name = 'V_460', 
	 particles = [P.nu5, P.nu5, P.A], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_757,(0,0):C.GC_758}) 
 
 
V_461 = Vertex(name = 'V_461', 
	 particles = [P.nu5, P.nu6, P.A], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_759,(0,0):C.GC_760}) 
 
 
V_462 = Vertex(name = 'V_462', 
	 particles = [P.nu6, P.nu6, P.A], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_761,(0,0):C.GC_762}) 
 
 
V_463 = Vertex(name = 'V_463', 
	 particles = [P.nu1, P.nu1, P.Z], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_763,(0,0):C.GC_764}) 
 
 
V_464 = Vertex(name = 'V_464', 
	 particles = [P.nu1, P.nu2, P.Z], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_765,(0,0):C.GC_766}) 
 
 
V_465 = Vertex(name = 'V_465', 
	 particles = [P.nu1, P.nu3, P.Z], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_767,(0,0):C.GC_768}) 
 
 
V_466 = Vertex(name = 'V_466', 
	 particles = [P.nu1, P.nu4, P.Z], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_769,(0,0):C.GC_770}) 
 
 
V_467 = Vertex(name = 'V_467', 
	 particles = [P.nu1, P.nu5, P.Z], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_771,(0,0):C.GC_772}) 
 
 
V_468 = Vertex(name = 'V_468', 
	 particles = [P.nu1, P.nu6, P.Z], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_773,(0,0):C.GC_774}) 
 
 
V_469 = Vertex(name = 'V_469', 
	 particles = [P.nu2, P.nu2, P.Z], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_775,(0,0):C.GC_776}) 
 
 
V_470 = Vertex(name = 'V_470', 
	 particles = [P.nu2, P.nu3, P.Z], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_777,(0,0):C.GC_778}) 
 
 
V_471 = Vertex(name = 'V_471', 
	 particles = [P.nu2, P.nu4, P.Z], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_779,(0,0):C.GC_780}) 
 
 
V_472 = Vertex(name = 'V_472', 
	 particles = [P.nu2, P.nu5, P.Z], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_781,(0,0):C.GC_782}) 
 
 
V_473 = Vertex(name = 'V_473', 
	 particles = [P.nu2, P.nu6, P.Z], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_783,(0,0):C.GC_784}) 
 
 
V_474 = Vertex(name = 'V_474', 
	 particles = [P.nu3, P.nu3, P.Z], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_785,(0,0):C.GC_786}) 
 
 
V_475 = Vertex(name = 'V_475', 
	 particles = [P.nu3, P.nu4, P.Z], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_787,(0,0):C.GC_788}) 
 
 
V_476 = Vertex(name = 'V_476', 
	 particles = [P.nu3, P.nu5, P.Z], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_789,(0,0):C.GC_790}) 
 
 
V_477 = Vertex(name = 'V_477', 
	 particles = [P.nu3, P.nu6, P.Z], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_791,(0,0):C.GC_792}) 
 
 
V_478 = Vertex(name = 'V_478', 
	 particles = [P.nu4, P.nu4, P.Z], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_793,(0,0):C.GC_794}) 
 
 
V_479 = Vertex(name = 'V_479', 
	 particles = [P.nu4, P.nu5, P.Z], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_795,(0,0):C.GC_796}) 
 
 
V_480 = Vertex(name = 'V_480', 
	 particles = [P.nu4, P.nu6, P.Z], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_797,(0,0):C.GC_798}) 
 
 
V_481 = Vertex(name = 'V_481', 
	 particles = [P.nu5, P.nu5, P.Z], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_799,(0,0):C.GC_800}) 
 
 
V_482 = Vertex(name = 'V_482', 
	 particles = [P.nu5, P.nu6, P.Z], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_801,(0,0):C.GC_802}) 
 
 
V_483 = Vertex(name = 'V_483', 
	 particles = [P.nu6, P.nu6, P.Z], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_803,(0,0):C.GC_804}) 
 
 
V_484 = Vertex(name = 'V_484', 
	 particles = [P.nu1, P.nu1, P.Zp], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_805,(0,0):C.GC_806}) 
 
 
V_485 = Vertex(name = 'V_485', 
	 particles = [P.nu1, P.nu2, P.Zp], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_807,(0,0):C.GC_808}) 
 
 
V_486 = Vertex(name = 'V_486', 
	 particles = [P.nu1, P.nu3, P.Zp], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_809,(0,0):C.GC_810}) 
 
 
V_487 = Vertex(name = 'V_487', 
	 particles = [P.nu1, P.nu4, P.Zp], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_811,(0,0):C.GC_812}) 
 
 
V_488 = Vertex(name = 'V_488', 
	 particles = [P.nu1, P.nu5, P.Zp], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_813,(0,0):C.GC_814}) 
 
 
V_489 = Vertex(name = 'V_489', 
	 particles = [P.nu1, P.nu6, P.Zp], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_815,(0,0):C.GC_816}) 
 
 
V_490 = Vertex(name = 'V_490', 
	 particles = [P.nu2, P.nu2, P.Zp], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_817,(0,0):C.GC_818}) 
 
 
V_491 = Vertex(name = 'V_491', 
	 particles = [P.nu2, P.nu3, P.Zp], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_819,(0,0):C.GC_820}) 
 
 
V_492 = Vertex(name = 'V_492', 
	 particles = [P.nu2, P.nu4, P.Zp], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_821,(0,0):C.GC_822}) 
 
 
V_493 = Vertex(name = 'V_493', 
	 particles = [P.nu2, P.nu5, P.Zp], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_823,(0,0):C.GC_824}) 
 
 
V_494 = Vertex(name = 'V_494', 
	 particles = [P.nu2, P.nu6, P.Zp], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_825,(0,0):C.GC_826}) 
 
 
V_495 = Vertex(name = 'V_495', 
	 particles = [P.nu3, P.nu3, P.Zp], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_827,(0,0):C.GC_828}) 
 
 
V_496 = Vertex(name = 'V_496', 
	 particles = [P.nu3, P.nu4, P.Zp], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_829,(0,0):C.GC_830}) 
 
 
V_497 = Vertex(name = 'V_497', 
	 particles = [P.nu3, P.nu5, P.Zp], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_831,(0,0):C.GC_832}) 
 
 
V_498 = Vertex(name = 'V_498', 
	 particles = [P.nu3, P.nu6, P.Zp], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_833,(0,0):C.GC_834}) 
 
 
V_499 = Vertex(name = 'V_499', 
	 particles = [P.nu4, P.nu4, P.Zp], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_835,(0,0):C.GC_836}) 
 
 
V_500 = Vertex(name = 'V_500', 
	 particles = [P.nu4, P.nu5, P.Zp], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_837,(0,0):C.GC_838}) 
 
 
V_501 = Vertex(name = 'V_501', 
	 particles = [P.nu4, P.nu6, P.Zp], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_839,(0,0):C.GC_840}) 
 
 
V_502 = Vertex(name = 'V_502', 
	 particles = [P.nu5, P.nu5, P.Zp], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_841,(0,0):C.GC_842}) 
 
 
V_503 = Vertex(name = 'V_503', 
	 particles = [P.nu5, P.nu6, P.Zp], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_843,(0,0):C.GC_844}) 
 
 
V_504 = Vertex(name = 'V_504', 
	 particles = [P.nu6, P.nu6, P.Zp], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_845,(0,0):C.GC_846}) 
 
 
V_505 = Vertex(name = 'V_505', 
	 particles = [P.e1bar, P.nu1, P.Wm], 
	 color = ['1'], 
	 lorentz = [L.FFV3], 
	 couplings = {(0,0):C.GC_847}) 
 
 
V_506 = Vertex(name = 'V_506', 
	 particles = [P.e1bar, P.nu2, P.Wm], 
	 color = ['1'], 
	 lorentz = [L.FFV3], 
	 couplings = {(0,0):C.GC_848}) 
 
 
V_507 = Vertex(name = 'V_507', 
	 particles = [P.e1bar, P.nu3, P.Wm], 
	 color = ['1'], 
	 lorentz = [L.FFV3], 
	 couplings = {(0,0):C.GC_849}) 
 
 
V_508 = Vertex(name = 'V_508', 
	 particles = [P.e1bar, P.nu4, P.Wm], 
	 color = ['1'], 
	 lorentz = [L.FFV3], 
	 couplings = {(0,0):C.GC_850}) 
 
 
V_509 = Vertex(name = 'V_509', 
	 particles = [P.e1bar, P.nu5, P.Wm], 
	 color = ['1'], 
	 lorentz = [L.FFV3], 
	 couplings = {(0,0):C.GC_851}) 
 
 
V_510 = Vertex(name = 'V_510', 
	 particles = [P.e1bar, P.nu6, P.Wm], 
	 color = ['1'], 
	 lorentz = [L.FFV3], 
	 couplings = {(0,0):C.GC_852}) 
 
 
V_511 = Vertex(name = 'V_511', 
	 particles = [P.e2bar, P.nu1, P.Wm], 
	 color = ['1'], 
	 lorentz = [L.FFV3], 
	 couplings = {(0,0):C.GC_853}) 
 
 
V_512 = Vertex(name = 'V_512', 
	 particles = [P.e2bar, P.nu2, P.Wm], 
	 color = ['1'], 
	 lorentz = [L.FFV3], 
	 couplings = {(0,0):C.GC_854}) 
 
 
V_513 = Vertex(name = 'V_513', 
	 particles = [P.e2bar, P.nu3, P.Wm], 
	 color = ['1'], 
	 lorentz = [L.FFV3], 
	 couplings = {(0,0):C.GC_855}) 
 
 
V_514 = Vertex(name = 'V_514', 
	 particles = [P.e2bar, P.nu4, P.Wm], 
	 color = ['1'], 
	 lorentz = [L.FFV3], 
	 couplings = {(0,0):C.GC_856}) 
 
 
V_515 = Vertex(name = 'V_515', 
	 particles = [P.e2bar, P.nu5, P.Wm], 
	 color = ['1'], 
	 lorentz = [L.FFV3], 
	 couplings = {(0,0):C.GC_857}) 
 
 
V_516 = Vertex(name = 'V_516', 
	 particles = [P.e2bar, P.nu6, P.Wm], 
	 color = ['1'], 
	 lorentz = [L.FFV3], 
	 couplings = {(0,0):C.GC_858}) 
 
 
V_517 = Vertex(name = 'V_517', 
	 particles = [P.e3bar, P.nu1, P.Wm], 
	 color = ['1'], 
	 lorentz = [L.FFV3], 
	 couplings = {(0,0):C.GC_859}) 
 
 
V_518 = Vertex(name = 'V_518', 
	 particles = [P.e3bar, P.nu2, P.Wm], 
	 color = ['1'], 
	 lorentz = [L.FFV3], 
	 couplings = {(0,0):C.GC_860}) 
 
 
V_519 = Vertex(name = 'V_519', 
	 particles = [P.e3bar, P.nu3, P.Wm], 
	 color = ['1'], 
	 lorentz = [L.FFV3], 
	 couplings = {(0,0):C.GC_861}) 
 
 
V_520 = Vertex(name = 'V_520', 
	 particles = [P.e3bar, P.nu4, P.Wm], 
	 color = ['1'], 
	 lorentz = [L.FFV3], 
	 couplings = {(0,0):C.GC_862}) 
 
 
V_521 = Vertex(name = 'V_521', 
	 particles = [P.e3bar, P.nu5, P.Wm], 
	 color = ['1'], 
	 lorentz = [L.FFV3], 
	 couplings = {(0,0):C.GC_863}) 
 
 
V_522 = Vertex(name = 'V_522', 
	 particles = [P.e3bar, P.nu6, P.Wm], 
	 color = ['1'], 
	 lorentz = [L.FFV3], 
	 couplings = {(0,0):C.GC_864}) 
 
 
V_523 = Vertex(name = 'V_523', 
	 particles = [P.g, P.g, P.g], 
	 color = ['f(1,2,3)'], 
	 lorentz = [L.VVV1], 
	 couplings = {(0,0):C.GC_865}) 
 
 
V_524 = Vertex(name = 'V_524', 
	 particles = [P.Wmc, P.A, P.Wm], 
	 color = ['1'], 
	 lorentz = [L.VVV1], 
	 couplings = {(0,0):C.GC_866}) 
 
 
V_525 = Vertex(name = 'V_525', 
	 particles = [P.Wmc, P.Wm, P.Z], 
	 color = ['1'], 
	 lorentz = [L.VVV1], 
	 couplings = {(0,0):C.GC_867}) 
 
 
V_526 = Vertex(name = 'V_526', 
	 particles = [P.Wmc, P.Wm, P.Zp], 
	 color = ['1'], 
	 lorentz = [L.VVV1], 
	 couplings = {(0,0):C.GC_868}) 
 
 
V_527 = Vertex(name = 'V_527', 
	 particles = [P.g, P.g, P.g, P.g], 
	 color = ['f(-1,1,4)*f(-1,2,3)', 'f(-1,1,3)*f(-1,2,4)', 'f(-1,1,2)*f(-1,3,4)'], 
	 lorentz = [L.VVVV1,L.VVVV2,L.VVVV3], 
	 couplings = {(0,0):C.GC_869,(1,0):C.GC_870,(0,1):C.GC_871,(2,1):C.GC_872,(1,2):C.GC_873,(2,2):C.GC_874}) 
 
 
V_528 = Vertex(name = 'V_528', 
	 particles = [P.Wmc, P.A, P.A, P.Wm], 
	 color = ['1'], 
	 lorentz = [L.VVVV1,L.VVVV2,L.VVVV3], 
	 couplings = {(0,0):C.GC_875,(0,1):C.GC_876,(0,2):C.GC_877}) 
 
 
V_529 = Vertex(name = 'V_529', 
	 particles = [P.Wmc, P.A, P.Wm, P.Z], 
	 color = ['1'], 
	 lorentz = [L.VVVV1,L.VVVV2,L.VVVV3], 
	 couplings = {(0,0):C.GC_878,(0,1):C.GC_879,(0,2):C.GC_880}) 
 
 
V_530 = Vertex(name = 'V_530', 
	 particles = [P.Wmc, P.A, P.Wm, P.Zp], 
	 color = ['1'], 
	 lorentz = [L.VVVV1,L.VVVV2,L.VVVV3], 
	 couplings = {(0,0):C.GC_881,(0,1):C.GC_882,(0,2):C.GC_883}) 
 
 
V_531 = Vertex(name = 'V_531', 
	 particles = [P.Wmc, P.Wmc, P.Wm, P.Wm], 
	 color = ['1'], 
	 lorentz = [L.VVVV1,L.VVVV2,L.VVVV3], 
	 couplings = {(0,0):C.GC_884,(0,1):C.GC_885,(0,2):C.GC_886}) 
 
 
V_532 = Vertex(name = 'V_532', 
	 particles = [P.Wmc, P.Wm, P.Z, P.Z], 
	 color = ['1'], 
	 lorentz = [L.VVVV1,L.VVVV2,L.VVVV3], 
	 couplings = {(0,0):C.GC_887,(0,1):C.GC_888,(0,2):C.GC_889}) 
 
 
V_533 = Vertex(name = 'V_533', 
	 particles = [P.Wmc, P.Wm, P.Z, P.Zp], 
	 color = ['1'], 
	 lorentz = [L.VVVV1,L.VVVV2,L.VVVV3], 
	 couplings = {(0,0):C.GC_890,(0,1):C.GC_891,(0,2):C.GC_892}) 
 
 
V_534 = Vertex(name = 'V_534', 
	 particles = [P.Wmc, P.Wm, P.Zp, P.Zp], 
	 color = ['1'], 
	 lorentz = [L.VVVV1,L.VVVV2,L.VVVV3], 
	 couplings = {(0,0):C.GC_893,(0,1):C.GC_894,(0,2):C.GC_895}) 
 
 
V_535 = Vertex(name = 'V_535', 
	 particles = [P.A, P.A, P.h1], 
	 color = ['1'], 
	 lorentz = [L.VVS99], 
	 couplings = {(0,0):C.GC_896}) 
 
 
V_536 = Vertex(name = 'V_536', 
	 particles = [P.g, P.g, P.h1], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.VVS99], 
	 couplings = {(0,0):C.GC_897}) 
 
 
V_537 = Vertex(name = 'V_537', 
	 particles = [P.A, P.A, P.h2], 
	 color = ['1'], 
	 lorentz = [L.VVS99], 
	 couplings = {(0,0):C.GC_898}) 
 
 
V_538 = Vertex(name = 'V_538', 
	 particles = [P.g, P.g, P.h2], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.VVS99], 
	 couplings = {(0,0):C.GC_899}) 
 
 

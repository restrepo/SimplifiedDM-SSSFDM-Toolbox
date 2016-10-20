# ----------------------------------------------------------------------  
# This model file was automatically created by SARAH version4.9.1 
# SARAH References: arXiv:0806.0538, arXiv:0909.2863, arXiv:1002.0840    
# (c) Florian Staub, 2011  
# ----------------------------------------------------------------------  
# File created at 23:57 on 19.10.2016   
# ----------------------------------------------------------------------  
 
 
from object_library import all_lorentz,Lorentz 
from function_library import complexconjugate,re,im,csc,sec,acsc,asec 
 
 
SSS1 = Lorentz(name = 'SSS1', 
	 spins = [1, 1, 1],
	 structure = '1' ) 
 
 
SSVV1 = Lorentz(name = 'SSVV1', 
	 spins = [1, 1, 3, 3],
	 structure = 'Metric(3,4)' ) 
 
 
SSV1 = Lorentz(name = 'SSV1', 
	 spins = [1, 1, 3],
	 structure = 'P(3,1) - P(3,2)' ) 
 
 
SVV1 = Lorentz(name = 'SVV1', 
	 spins = [1, 3, 3],
	 structure = 'Metric(2,3)' ) 
 
 
FFS1 = Lorentz(name = 'FFS1', 
	 spins = [2, 2, 1],
	 structure = 'ProjP(2,1)' ) 
 
 
FFS2 = Lorentz(name = 'FFS2', 
	 spins = [2, 2, 1],
	 structure = 'ProjM(2,1)' ) 
 
 
FFV1 = Lorentz(name = 'FFV1', 
	 spins = [2, 2, 3],
	 structure = 'ProjP(2,1)' ) 
 
 
FFV2 = Lorentz(name = 'FFV2', 
	 spins = [2, 2, 3],
	 structure = 'Gamma(3,2,-1)*ProjP(-1,1)' ) 
 
 
FFV3 = Lorentz(name = 'FFV3', 
	 spins = [2, 2, 3],
	 structure = 'Gamma(3,2,-1)*ProjM(-1,1)' ) 
 
 
VVV1 = Lorentz(name = 'VVV1', 
	 spins = [3, 3, 3],
	 structure = '-(Metric(2,3)*P(1,2)) + Metric(2,3)*P(1,3) + Metric(1,3)*P(2,1) - Metric(1,3)*P(2,3) - Metric(1,2)*P(3,1) + Metric(1,2)*P(3,2)' ) 
 
 
VVVV1 = Lorentz(name = 'VVVV1', 
	 spins = [3, 3, 3, 3],
	 structure = 'Metric(1,2)*Metric(3,4)' ) 
 
 
VVVV2 = Lorentz(name = 'VVVV2', 
	 spins = [3, 3, 3, 3],
	 structure = 'Metric(1,3)*Metric(2,4)' ) 
 
 
VVVV3 = Lorentz(name = 'VVVV3', 
	 spins = [3, 3, 3, 3],
	 structure = 'Metric(1,4)*Metric(2,3)' ) 
 
 
VVS99 = Lorentz(name='VVSpp', 
spins=[3,3,1], 
structure='P(1,2)*P(2,1)-P(-1,1)*P(-1,2)*Metric(1,2)')

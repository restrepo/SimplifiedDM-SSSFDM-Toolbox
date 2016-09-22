# ----------------------------------------------------------------------  
# This model file was automatically created by SARAH version4.8.1 
# SARAH References: arXiv:0806.0538, arXiv:0909.2863, arXiv:1002.0840    
# (c) Florian Staub, 2011  
# ----------------------------------------------------------------------  
# File created at 16:59 on 21.3.2016   
# ----------------------------------------------------------------------  
 
 
from object_library import all_parameters,Parameter 
 
from function_library import complexconjugate,re,im,csc,sec,acsc,asec 
 
ZERO=Parameter(name='ZERO', 
                      nature='internal', 
                      type='real', 
                      value='0.0', 
                      texname='0') 
 
Mcp = 	 Parameter(name = 'Mcp', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{Mcp}', 
	 lhablock = 'MASS', 
	 lhacode = [17]) 
 
Wcp = 	 Parameter(name = 'Wcp', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Wcp}', 
	 lhablock = 'DECAY', 
	 lhacode = [17]) 
 
Mcpp = 	 Parameter(name = 'Mcpp', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{Mcpp}', 
	 lhablock = 'MASS', 
	 lhacode = [6000055]) 
 
Wcpp = 	 Parameter(name = 'Wcpp', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Wcpp}', 
	 lhablock = 'DECAY', 
	 lhacode = [6000055]) 
 
Md1 = 	 Parameter(name = 'Md1', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0.0035, 
	 texname = '\\text{Md1}', 
	 lhablock = 'MASS', 
	 lhacode = [1]) 
 
Md2 = 	 Parameter(name = 'Md2', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0.104, 
	 texname = '\\text{Md2}', 
	 lhablock = 'MASS', 
	 lhacode = [3]) 
 
Md3 = 	 Parameter(name = 'Md3', 
	 nature = 'external', 
	 type = 'real', 
	 value = 4.2, 
	 texname = '\\text{Md3}', 
	 lhablock = 'MASS', 
	 lhacode = [5]) 
 
Mu1 = 	 Parameter(name = 'Mu1', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0.0015, 
	 texname = '\\text{Mu1}', 
	 lhablock = 'MASS', 
	 lhacode = [2]) 
 
Mu2 = 	 Parameter(name = 'Mu2', 
	 nature = 'external', 
	 type = 'real', 
	 value = 1.27, 
	 texname = '\\text{Mu2}', 
	 lhablock = 'MASS', 
	 lhacode = [4]) 
 
Mu3 = 	 Parameter(name = 'Mu3', 
	 nature = 'external', 
	 type = 'real', 
	 value = 171.2, 
	 texname = '\\text{Mu3}', 
	 lhablock = 'MASS', 
	 lhacode = [6]) 
 
Wu3 = 	 Parameter(name = 'Wu3', 
	 nature = 'external', 
	 type = 'real', 
	 value = 1.51, 
	 texname = '\\text{Wu3}', 
	 lhablock = 'DECAY', 
	 lhacode = [6]) 
 
Me1 = 	 Parameter(name = 'Me1', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0.000511, 
	 texname = '\\text{Me1}', 
	 lhablock = 'MASS', 
	 lhacode = [11]) 
 
Me2 = 	 Parameter(name = 'Me2', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0.105, 
	 texname = '\\text{Me2}', 
	 lhablock = 'MASS', 
	 lhacode = [13]) 
 
Me3 = 	 Parameter(name = 'Me3', 
	 nature = 'external', 
	 type = 'real', 
	 value = 1.776, 
	 texname = '\\text{Me3}', 
	 lhablock = 'MASS', 
	 lhacode = [15]) 
 
Mnu1 = 	 Parameter(name = 'Mnu1', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{Mnu1}', 
	 lhablock = 'MASS', 
	 lhacode = [12]) 
 
Wnu1 = 	 Parameter(name = 'Wnu1', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Wnu1}', 
	 lhablock = 'DECAY', 
	 lhacode = [12]) 
 
Mnu2 = 	 Parameter(name = 'Mnu2', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{Mnu2}', 
	 lhablock = 'MASS', 
	 lhacode = [14]) 
 
Wnu2 = 	 Parameter(name = 'Wnu2', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Wnu2}', 
	 lhablock = 'DECAY', 
	 lhacode = [14]) 
 
Mnu3 = 	 Parameter(name = 'Mnu3', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{Mnu3}', 
	 lhablock = 'MASS', 
	 lhacode = [16]) 
 
Wnu3 = 	 Parameter(name = 'Wnu3', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Wnu3}', 
	 lhablock = 'DECAY', 
	 lhacode = [16]) 
 
Mnu4 = 	 Parameter(name = 'Mnu4', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{Mnu4}', 
	 lhablock = 'MASS', 
	 lhacode = [6000012]) 
 
Wnu4 = 	 Parameter(name = 'Wnu4', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Wnu4}', 
	 lhablock = 'DECAY', 
	 lhacode = [6000012]) 
 
Mnu5 = 	 Parameter(name = 'Mnu5', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{Mnu5}', 
	 lhablock = 'MASS', 
	 lhacode = [6000014]) 
 
Wnu5 = 	 Parameter(name = 'Wnu5', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Wnu5}', 
	 lhablock = 'DECAY', 
	 lhacode = [6000014]) 
 
Mnu6 = 	 Parameter(name = 'Mnu6', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{Mnu6}', 
	 lhablock = 'MASS', 
	 lhacode = [6000016]) 
 
Wnu6 = 	 Parameter(name = 'Wnu6', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Wnu6}', 
	 lhablock = 'DECAY', 
	 lhacode = [6000016]) 
 
Mc01 = 	 Parameter(name = 'Mc01', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{Mc01}', 
	 lhablock = 'MASS', 
	 lhacode = [9000012]) 
 
Wc01 = 	 Parameter(name = 'Wc01', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Wc01}', 
	 lhablock = 'DECAY', 
	 lhacode = [9000012]) 
 
Mc02 = 	 Parameter(name = 'Mc02', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{Mc02}', 
	 lhablock = 'MASS', 
	 lhacode = [9000014]) 
 
Wc02 = 	 Parameter(name = 'Wc02', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Wc02}', 
	 lhablock = 'DECAY', 
	 lhacode = [9000014]) 
 
MHmm = 	 Parameter(name = 'MHmm', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{MHmm}', 
	 lhablock = 'MASS', 
	 lhacode = [9000055]) 
 
WHmm = 	 Parameter(name = 'WHmm', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{WHmm}', 
	 lhablock = 'DECAY', 
	 lhacode = [9000055]) 
 
Mhh1 = 	 Parameter(name = 'Mhh1', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{Mhh1}', 
	 lhablock = 'MASS', 
	 lhacode = [25]) 
 
Whh1 = 	 Parameter(name = 'Whh1', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Whh1}', 
	 lhablock = 'DECAY', 
	 lhacode = [25]) 
 
Mhh2 = 	 Parameter(name = 'Mhh2', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{Mhh2}', 
	 lhablock = 'MASS', 
	 lhacode = [35]) 
 
Whh2 = 	 Parameter(name = 'Whh2', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Whh2}', 
	 lhablock = 'DECAY', 
	 lhacode = [35]) 
 
Mhh3 = 	 Parameter(name = 'Mhh3', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{Mhh3}', 
	 lhablock = 'MASS', 
	 lhacode = [335]) 
 
Whh3 = 	 Parameter(name = 'Whh3', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Whh3}', 
	 lhablock = 'DECAY', 
	 lhacode = [335]) 
 
MAh3 = 	 Parameter(name = 'MAh3', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{MAh3}', 
	 lhablock = 'MASS', 
	 lhacode = [36]) 
 
WAh3 = 	 Parameter(name = 'WAh3', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{WAh3}', 
	 lhablock = 'DECAY', 
	 lhacode = [36]) 
 
MHm3 = 	 Parameter(name = 'MHm3', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{MHm3}', 
	 lhablock = 'MASS', 
	 lhacode = [37]) 
 
WHm3 = 	 Parameter(name = 'WHm3', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{WHm3}', 
	 lhablock = 'DECAY', 
	 lhacode = [37]) 
 
MZ = 	 Parameter(name = 'MZ', 
	 nature = 'external', 
	 type = 'real', 
	 value = 91.1876, 
	 texname = '\\text{MZ}', 
	 lhablock = 'MASS', 
	 lhacode = [23]) 
 
WZ = 	 Parameter(name = 'WZ', 
	 nature = 'external', 
	 type = 'real', 
	 value = 2.4952, 
	 texname = '\\text{WZ}', 
	 lhablock = 'DECAY', 
	 lhacode = [23]) 
 
MZp = 	 Parameter(name = 'MZp', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{MZp}', 
	 lhablock = 'MASS', 
	 lhacode = [32]) 
 
WZp = 	 Parameter(name = 'WZp', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{WZp}', 
	 lhablock = 'DECAY', 
	 lhacode = [32]) 
 
WWLm = 	 Parameter(name = 'WWLm', 
	 nature = 'external', 
	 type = 'real', 
	 value = 2.141, 
	 texname = '\\text{WWLm}', 
	 lhablock = 'DECAY', 
	 lhacode = [24]) 
 
MWRm = 	 Parameter(name = 'MWRm', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{MWRm}', 
	 lhablock = 'MASS', 
	 lhacode = [34]) 
 
WWRm = 	 Parameter(name = 'WWRm', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{WWRm}', 
	 lhablock = 'DECAY', 
	 lhacode = [34]) 
 
gBL = 	 Parameter(name='gBL', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{gBL}', 
	 lhablock = 'GAUGE', 
	 lhacode = [4] ) 
 
gR = 	 Parameter(name='gR', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{gR}', 
	 lhablock = 'GAUGE', 
	 lhacode = [5] ) 
 
rYDR11 = 	 Parameter(name='rYDR11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YDR11}', 
	 lhablock = 'YDR', 
	 lhacode = [1, 1] ) 
 
iYDR11 = 	 Parameter(name='iYDR11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YDR11}', 
	 lhablock = 'IMYDR', 
	 lhacode = [1, 1] ) 
 
rYDR12 = 	 Parameter(name='rYDR12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YDR12}', 
	 lhablock = 'YDR', 
	 lhacode = [1, 2] ) 
 
iYDR12 = 	 Parameter(name='iYDR12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YDR12}', 
	 lhablock = 'IMYDR', 
	 lhacode = [1, 2] ) 
 
rYDR13 = 	 Parameter(name='rYDR13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YDR13}', 
	 lhablock = 'YDR', 
	 lhacode = [1, 3] ) 
 
iYDR13 = 	 Parameter(name='iYDR13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YDR13}', 
	 lhablock = 'IMYDR', 
	 lhacode = [1, 3] ) 
 
rYDR21 = 	 Parameter(name='rYDR21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YDR21}', 
	 lhablock = 'YDR', 
	 lhacode = [2, 1] ) 
 
iYDR21 = 	 Parameter(name='iYDR21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YDR21}', 
	 lhablock = 'IMYDR', 
	 lhacode = [2, 1] ) 
 
rYDR22 = 	 Parameter(name='rYDR22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YDR22}', 
	 lhablock = 'YDR', 
	 lhacode = [2, 2] ) 
 
iYDR22 = 	 Parameter(name='iYDR22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YDR22}', 
	 lhablock = 'IMYDR', 
	 lhacode = [2, 2] ) 
 
rYDR23 = 	 Parameter(name='rYDR23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YDR23}', 
	 lhablock = 'YDR', 
	 lhacode = [2, 3] ) 
 
iYDR23 = 	 Parameter(name='iYDR23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YDR23}', 
	 lhablock = 'IMYDR', 
	 lhacode = [2, 3] ) 
 
rYDR31 = 	 Parameter(name='rYDR31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YDR31}', 
	 lhablock = 'YDR', 
	 lhacode = [3, 1] ) 
 
iYDR31 = 	 Parameter(name='iYDR31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YDR31}', 
	 lhablock = 'IMYDR', 
	 lhacode = [3, 1] ) 
 
rYDR32 = 	 Parameter(name='rYDR32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YDR32}', 
	 lhablock = 'YDR', 
	 lhacode = [3, 2] ) 
 
iYDR32 = 	 Parameter(name='iYDR32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YDR32}', 
	 lhablock = 'IMYDR', 
	 lhacode = [3, 2] ) 
 
rYDR33 = 	 Parameter(name='rYDR33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YDR33}', 
	 lhablock = 'YDR', 
	 lhacode = [3, 3] ) 
 
iYDR33 = 	 Parameter(name='iYDR33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YDR33}', 
	 lhablock = 'IMYDR', 
	 lhacode = [3, 3] ) 
 
rYL111 = 	 Parameter(name='rYL111', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YL111}', 
	 lhablock = 'YL1', 
	 lhacode = [1, 1] ) 
 
iYL111 = 	 Parameter(name='iYL111', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YL111}', 
	 lhablock = 'IMYL1', 
	 lhacode = [1, 1] ) 
 
rYL112 = 	 Parameter(name='rYL112', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YL112}', 
	 lhablock = 'YL1', 
	 lhacode = [1, 2] ) 
 
iYL112 = 	 Parameter(name='iYL112', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YL112}', 
	 lhablock = 'IMYL1', 
	 lhacode = [1, 2] ) 
 
rYL113 = 	 Parameter(name='rYL113', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YL113}', 
	 lhablock = 'YL1', 
	 lhacode = [1, 3] ) 
 
iYL113 = 	 Parameter(name='iYL113', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YL113}', 
	 lhablock = 'IMYL1', 
	 lhacode = [1, 3] ) 
 
rYL121 = 	 Parameter(name='rYL121', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YL121}', 
	 lhablock = 'YL1', 
	 lhacode = [2, 1] ) 
 
iYL121 = 	 Parameter(name='iYL121', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YL121}', 
	 lhablock = 'IMYL1', 
	 lhacode = [2, 1] ) 
 
rYL122 = 	 Parameter(name='rYL122', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YL122}', 
	 lhablock = 'YL1', 
	 lhacode = [2, 2] ) 
 
iYL122 = 	 Parameter(name='iYL122', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YL122}', 
	 lhablock = 'IMYL1', 
	 lhacode = [2, 2] ) 
 
rYL123 = 	 Parameter(name='rYL123', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YL123}', 
	 lhablock = 'YL1', 
	 lhacode = [2, 3] ) 
 
iYL123 = 	 Parameter(name='iYL123', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YL123}', 
	 lhablock = 'IMYL1', 
	 lhacode = [2, 3] ) 
 
rYL131 = 	 Parameter(name='rYL131', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YL131}', 
	 lhablock = 'YL1', 
	 lhacode = [3, 1] ) 
 
iYL131 = 	 Parameter(name='iYL131', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YL131}', 
	 lhablock = 'IMYL1', 
	 lhacode = [3, 1] ) 
 
rYL132 = 	 Parameter(name='rYL132', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YL132}', 
	 lhablock = 'YL1', 
	 lhacode = [3, 2] ) 
 
iYL132 = 	 Parameter(name='iYL132', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YL132}', 
	 lhablock = 'IMYL1', 
	 lhacode = [3, 2] ) 
 
rYL133 = 	 Parameter(name='rYL133', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YL133}', 
	 lhablock = 'YL1', 
	 lhacode = [3, 3] ) 
 
iYL133 = 	 Parameter(name='iYL133', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YL133}', 
	 lhablock = 'IMYL1', 
	 lhacode = [3, 3] ) 
 
rYQ111 = 	 Parameter(name='rYQ111', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YQ111}', 
	 lhablock = 'YQ1', 
	 lhacode = [1, 1] ) 
 
iYQ111 = 	 Parameter(name='iYQ111', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YQ111}', 
	 lhablock = 'IMYQ1', 
	 lhacode = [1, 1] ) 
 
rYQ112 = 	 Parameter(name='rYQ112', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YQ112}', 
	 lhablock = 'YQ1', 
	 lhacode = [1, 2] ) 
 
iYQ112 = 	 Parameter(name='iYQ112', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YQ112}', 
	 lhablock = 'IMYQ1', 
	 lhacode = [1, 2] ) 
 
rYQ113 = 	 Parameter(name='rYQ113', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YQ113}', 
	 lhablock = 'YQ1', 
	 lhacode = [1, 3] ) 
 
iYQ113 = 	 Parameter(name='iYQ113', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YQ113}', 
	 lhablock = 'IMYQ1', 
	 lhacode = [1, 3] ) 
 
rYQ121 = 	 Parameter(name='rYQ121', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YQ121}', 
	 lhablock = 'YQ1', 
	 lhacode = [2, 1] ) 
 
iYQ121 = 	 Parameter(name='iYQ121', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YQ121}', 
	 lhablock = 'IMYQ1', 
	 lhacode = [2, 1] ) 
 
rYQ122 = 	 Parameter(name='rYQ122', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YQ122}', 
	 lhablock = 'YQ1', 
	 lhacode = [2, 2] ) 
 
iYQ122 = 	 Parameter(name='iYQ122', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YQ122}', 
	 lhablock = 'IMYQ1', 
	 lhacode = [2, 2] ) 
 
rYQ123 = 	 Parameter(name='rYQ123', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YQ123}', 
	 lhablock = 'YQ1', 
	 lhacode = [2, 3] ) 
 
iYQ123 = 	 Parameter(name='iYQ123', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YQ123}', 
	 lhablock = 'IMYQ1', 
	 lhacode = [2, 3] ) 
 
rYQ131 = 	 Parameter(name='rYQ131', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YQ131}', 
	 lhablock = 'YQ1', 
	 lhacode = [3, 1] ) 
 
iYQ131 = 	 Parameter(name='iYQ131', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YQ131}', 
	 lhablock = 'IMYQ1', 
	 lhacode = [3, 1] ) 
 
rYQ132 = 	 Parameter(name='rYQ132', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YQ132}', 
	 lhablock = 'YQ1', 
	 lhacode = [3, 2] ) 
 
iYQ132 = 	 Parameter(name='iYQ132', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YQ132}', 
	 lhablock = 'IMYQ1', 
	 lhacode = [3, 2] ) 
 
rYQ133 = 	 Parameter(name='rYQ133', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YQ133}', 
	 lhablock = 'YQ1', 
	 lhacode = [3, 3] ) 
 
iYQ133 = 	 Parameter(name='iYQ133', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YQ133}', 
	 lhablock = 'IMYQ1', 
	 lhacode = [3, 3] ) 
 
rYL211 = 	 Parameter(name='rYL211', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YL211}', 
	 lhablock = 'YL2', 
	 lhacode = [1, 1] ) 
 
iYL211 = 	 Parameter(name='iYL211', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YL211}', 
	 lhablock = 'IMYL2', 
	 lhacode = [1, 1] ) 
 
rYL212 = 	 Parameter(name='rYL212', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YL212}', 
	 lhablock = 'YL2', 
	 lhacode = [1, 2] ) 
 
iYL212 = 	 Parameter(name='iYL212', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YL212}', 
	 lhablock = 'IMYL2', 
	 lhacode = [1, 2] ) 
 
rYL213 = 	 Parameter(name='rYL213', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YL213}', 
	 lhablock = 'YL2', 
	 lhacode = [1, 3] ) 
 
iYL213 = 	 Parameter(name='iYL213', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YL213}', 
	 lhablock = 'IMYL2', 
	 lhacode = [1, 3] ) 
 
rYL221 = 	 Parameter(name='rYL221', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YL221}', 
	 lhablock = 'YL2', 
	 lhacode = [2, 1] ) 
 
iYL221 = 	 Parameter(name='iYL221', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YL221}', 
	 lhablock = 'IMYL2', 
	 lhacode = [2, 1] ) 
 
rYL222 = 	 Parameter(name='rYL222', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YL222}', 
	 lhablock = 'YL2', 
	 lhacode = [2, 2] ) 
 
iYL222 = 	 Parameter(name='iYL222', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YL222}', 
	 lhablock = 'IMYL2', 
	 lhacode = [2, 2] ) 
 
rYL223 = 	 Parameter(name='rYL223', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YL223}', 
	 lhablock = 'YL2', 
	 lhacode = [2, 3] ) 
 
iYL223 = 	 Parameter(name='iYL223', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YL223}', 
	 lhablock = 'IMYL2', 
	 lhacode = [2, 3] ) 
 
rYL231 = 	 Parameter(name='rYL231', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YL231}', 
	 lhablock = 'YL2', 
	 lhacode = [3, 1] ) 
 
iYL231 = 	 Parameter(name='iYL231', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YL231}', 
	 lhablock = 'IMYL2', 
	 lhacode = [3, 1] ) 
 
rYL232 = 	 Parameter(name='rYL232', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YL232}', 
	 lhablock = 'YL2', 
	 lhacode = [3, 2] ) 
 
iYL232 = 	 Parameter(name='iYL232', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YL232}', 
	 lhablock = 'IMYL2', 
	 lhacode = [3, 2] ) 
 
rYL233 = 	 Parameter(name='rYL233', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YL233}', 
	 lhablock = 'YL2', 
	 lhacode = [3, 3] ) 
 
iYL233 = 	 Parameter(name='iYL233', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YL233}', 
	 lhablock = 'IMYL2', 
	 lhacode = [3, 3] ) 
 
rYQ211 = 	 Parameter(name='rYQ211', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YQ211}', 
	 lhablock = 'YQ2', 
	 lhacode = [1, 1] ) 
 
iYQ211 = 	 Parameter(name='iYQ211', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YQ211}', 
	 lhablock = 'IMYQ2', 
	 lhacode = [1, 1] ) 
 
rYQ212 = 	 Parameter(name='rYQ212', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YQ212}', 
	 lhablock = 'YQ2', 
	 lhacode = [1, 2] ) 
 
iYQ212 = 	 Parameter(name='iYQ212', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YQ212}', 
	 lhablock = 'IMYQ2', 
	 lhacode = [1, 2] ) 
 
rYQ213 = 	 Parameter(name='rYQ213', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YQ213}', 
	 lhablock = 'YQ2', 
	 lhacode = [1, 3] ) 
 
iYQ213 = 	 Parameter(name='iYQ213', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YQ213}', 
	 lhablock = 'IMYQ2', 
	 lhacode = [1, 3] ) 
 
rYQ221 = 	 Parameter(name='rYQ221', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YQ221}', 
	 lhablock = 'YQ2', 
	 lhacode = [2, 1] ) 
 
iYQ221 = 	 Parameter(name='iYQ221', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YQ221}', 
	 lhablock = 'IMYQ2', 
	 lhacode = [2, 1] ) 
 
rYQ222 = 	 Parameter(name='rYQ222', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YQ222}', 
	 lhablock = 'YQ2', 
	 lhacode = [2, 2] ) 
 
iYQ222 = 	 Parameter(name='iYQ222', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YQ222}', 
	 lhablock = 'IMYQ2', 
	 lhacode = [2, 2] ) 
 
rYQ223 = 	 Parameter(name='rYQ223', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YQ223}', 
	 lhablock = 'YQ2', 
	 lhacode = [2, 3] ) 
 
iYQ223 = 	 Parameter(name='iYQ223', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YQ223}', 
	 lhablock = 'IMYQ2', 
	 lhacode = [2, 3] ) 
 
rYQ231 = 	 Parameter(name='rYQ231', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YQ231}', 
	 lhablock = 'YQ2', 
	 lhacode = [3, 1] ) 
 
iYQ231 = 	 Parameter(name='iYQ231', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YQ231}', 
	 lhablock = 'IMYQ2', 
	 lhacode = [3, 1] ) 
 
rYQ232 = 	 Parameter(name='rYQ232', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YQ232}', 
	 lhablock = 'YQ2', 
	 lhacode = [3, 2] ) 
 
iYQ232 = 	 Parameter(name='iYQ232', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YQ232}', 
	 lhablock = 'IMYQ2', 
	 lhacode = [3, 2] ) 
 
rYQ233 = 	 Parameter(name='rYQ233', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YQ233}', 
	 lhablock = 'YQ2', 
	 lhacode = [3, 3] ) 
 
iYQ233 = 	 Parameter(name='iYQ233', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YQ233}', 
	 lhablock = 'IMYQ2', 
	 lhacode = [3, 3] ) 
 
RHO2 = 	 Parameter(name='RHO2', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{RHO2}', 
	 lhablock = 'LRINPUT', 
	 lhacode = [9] ) 
 
RHO1 = 	 Parameter(name='RHO1', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{RHO1}', 
	 lhablock = 'LRINPUT', 
	 lhacode = [7] ) 
 
ALP1 = 	 Parameter(name='ALP1', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ALP1}', 
	 lhablock = 'LRINPUT', 
	 lhacode = [14] ) 
 
LAM1 = 	 Parameter(name='LAM1', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{LAM1}', 
	 lhablock = 'LRINPUT', 
	 lhacode = [1] ) 
 
ALP3 = 	 Parameter(name='ALP3', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ALP3}', 
	 lhablock = 'LRINPUT', 
	 lhacode = [20] ) 
 
ALP2 = 	 Parameter(name='ALP2', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ALP2}', 
	 lhablock = 'LRINPUT', 
	 lhacode = [16] ) 
 
LAM4 = 	 Parameter(name='LAM4', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{LAM4}', 
	 lhablock = 'LRINPUT', 
	 lhacode = [5] ) 
 
LAM2 = 	 Parameter(name='LAM2', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{LAM2}', 
	 lhablock = 'LRINPUT', 
	 lhacode = [2] ) 
 
LAM3 = 	 Parameter(name='LAM3', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{LAM3}', 
	 lhablock = 'LRINPUT', 
	 lhacode = [4] ) 
 
vd = 	 Parameter(name='vd', 
	 nature = 'external', 
	 type = 'real', 
	 value = 1., 
	 texname = '\\text{vd}', 
	 lhablock = 'VEV', 
	 lhacode = [1] ) 
 
vu = 	 Parameter(name='vu', 
	 nature = 'external', 
	 type = 'real', 
	 value = 1., 
	 texname = '\\text{vu}', 
	 lhablock = 'VEV', 
	 lhacode = [2] ) 
 
vR = 	 Parameter(name='vR', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{vR}', 
	 lhablock = 'VEV', 
	 lhacode = [4] ) 
 
rZZ11 = 	 Parameter(name='rZZ11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZZ11}', 
	 lhablock = 'ZZMIX', 
	 lhacode = [1, 1] ) 
 
iZZ11 = 	 Parameter(name='iZZ11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZZ11}', 
	 lhablock = 'IMZZMIX', 
	 lhacode = [1, 1] ) 
 
rZZ12 = 	 Parameter(name='rZZ12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZZ12}', 
	 lhablock = 'ZZMIX', 
	 lhacode = [1, 2] ) 
 
iZZ12 = 	 Parameter(name='iZZ12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZZ12}', 
	 lhablock = 'IMZZMIX', 
	 lhacode = [1, 2] ) 
 
rZZ13 = 	 Parameter(name='rZZ13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZZ13}', 
	 lhablock = 'ZZMIX', 
	 lhacode = [1, 3] ) 
 
iZZ13 = 	 Parameter(name='iZZ13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZZ13}', 
	 lhablock = 'IMZZMIX', 
	 lhacode = [1, 3] ) 
 
rZZ21 = 	 Parameter(name='rZZ21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZZ21}', 
	 lhablock = 'ZZMIX', 
	 lhacode = [2, 1] ) 
 
iZZ21 = 	 Parameter(name='iZZ21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZZ21}', 
	 lhablock = 'IMZZMIX', 
	 lhacode = [2, 1] ) 
 
rZZ22 = 	 Parameter(name='rZZ22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZZ22}', 
	 lhablock = 'ZZMIX', 
	 lhacode = [2, 2] ) 
 
iZZ22 = 	 Parameter(name='iZZ22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZZ22}', 
	 lhablock = 'IMZZMIX', 
	 lhacode = [2, 2] ) 
 
rZZ23 = 	 Parameter(name='rZZ23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZZ23}', 
	 lhablock = 'ZZMIX', 
	 lhacode = [2, 3] ) 
 
iZZ23 = 	 Parameter(name='iZZ23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZZ23}', 
	 lhablock = 'IMZZMIX', 
	 lhacode = [2, 3] ) 
 
rZZ31 = 	 Parameter(name='rZZ31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZZ31}', 
	 lhablock = 'ZZMIX', 
	 lhacode = [3, 1] ) 
 
iZZ31 = 	 Parameter(name='iZZ31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZZ31}', 
	 lhablock = 'IMZZMIX', 
	 lhacode = [3, 1] ) 
 
rZZ32 = 	 Parameter(name='rZZ32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZZ32}', 
	 lhablock = 'ZZMIX', 
	 lhacode = [3, 2] ) 
 
iZZ32 = 	 Parameter(name='iZZ32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZZ32}', 
	 lhablock = 'IMZZMIX', 
	 lhacode = [3, 2] ) 
 
rZZ33 = 	 Parameter(name='rZZ33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZZ33}', 
	 lhablock = 'ZZMIX', 
	 lhacode = [3, 3] ) 
 
iZZ33 = 	 Parameter(name='iZZ33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZZ33}', 
	 lhablock = 'IMZZMIX', 
	 lhacode = [3, 3] ) 
 
rphaT = 	 Parameter(name='rphaT', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{phaT}', 
	 lhablock = 'PHASET', 
	 lhacode = [1] ) 
 
iphaT = 	 Parameter(name='iphaT', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{phaT}', 
	 lhablock = 'IMPHASET', 
	 lhacode = [1] ) 
 
ZH11 = 	 Parameter(name='ZH11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZH11}', 
	 lhablock = 'SCALARMIX', 
	 lhacode = [1, 1] ) 
 
ZH12 = 	 Parameter(name='ZH12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZH12}', 
	 lhablock = 'SCALARMIX', 
	 lhacode = [1, 2] ) 
 
ZH13 = 	 Parameter(name='ZH13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZH13}', 
	 lhablock = 'SCALARMIX', 
	 lhacode = [1, 3] ) 
 
ZH21 = 	 Parameter(name='ZH21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZH21}', 
	 lhablock = 'SCALARMIX', 
	 lhacode = [2, 1] ) 
 
ZH22 = 	 Parameter(name='ZH22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZH22}', 
	 lhablock = 'SCALARMIX', 
	 lhacode = [2, 2] ) 
 
ZH23 = 	 Parameter(name='ZH23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZH23}', 
	 lhablock = 'SCALARMIX', 
	 lhacode = [2, 3] ) 
 
ZH31 = 	 Parameter(name='ZH31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZH31}', 
	 lhablock = 'SCALARMIX', 
	 lhacode = [3, 1] ) 
 
ZH32 = 	 Parameter(name='ZH32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZH32}', 
	 lhablock = 'SCALARMIX', 
	 lhacode = [3, 2] ) 
 
ZH33 = 	 Parameter(name='ZH33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZH33}', 
	 lhablock = 'SCALARMIX', 
	 lhacode = [3, 3] ) 
 
UP11 = 	 Parameter(name='UP11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UP11}', 
	 lhablock = 'AMIX', 
	 lhacode = [1, 1] ) 
 
UP12 = 	 Parameter(name='UP12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UP12}', 
	 lhablock = 'AMIX', 
	 lhacode = [1, 2] ) 
 
UP13 = 	 Parameter(name='UP13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UP13}', 
	 lhablock = 'AMIX', 
	 lhacode = [1, 3] ) 
 
UP21 = 	 Parameter(name='UP21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UP21}', 
	 lhablock = 'AMIX', 
	 lhacode = [2, 1] ) 
 
UP22 = 	 Parameter(name='UP22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UP22}', 
	 lhablock = 'AMIX', 
	 lhacode = [2, 2] ) 
 
UP23 = 	 Parameter(name='UP23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UP23}', 
	 lhablock = 'AMIX', 
	 lhacode = [2, 3] ) 
 
UP31 = 	 Parameter(name='UP31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UP31}', 
	 lhablock = 'AMIX', 
	 lhacode = [3, 1] ) 
 
UP32 = 	 Parameter(name='UP32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UP32}', 
	 lhablock = 'AMIX', 
	 lhacode = [3, 2] ) 
 
UP33 = 	 Parameter(name='UP33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UP33}', 
	 lhablock = 'AMIX', 
	 lhacode = [3, 3] ) 
 
UC11 = 	 Parameter(name='UC11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UC11}', 
	 lhablock = 'CHMIX', 
	 lhacode = [1, 1] ) 
 
UC12 = 	 Parameter(name='UC12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UC12}', 
	 lhablock = 'CHMIX', 
	 lhacode = [1, 2] ) 
 
UC13 = 	 Parameter(name='UC13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UC13}', 
	 lhablock = 'CHMIX', 
	 lhacode = [1, 3] ) 
 
UC21 = 	 Parameter(name='UC21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UC21}', 
	 lhablock = 'CHMIX', 
	 lhacode = [2, 1] ) 
 
UC22 = 	 Parameter(name='UC22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UC22}', 
	 lhablock = 'CHMIX', 
	 lhacode = [2, 2] ) 
 
UC23 = 	 Parameter(name='UC23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UC23}', 
	 lhablock = 'CHMIX', 
	 lhacode = [2, 3] ) 
 
UC31 = 	 Parameter(name='UC31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UC31}', 
	 lhablock = 'CHMIX', 
	 lhacode = [3, 1] ) 
 
UC32 = 	 Parameter(name='UC32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UC32}', 
	 lhablock = 'CHMIX', 
	 lhacode = [3, 2] ) 
 
UC33 = 	 Parameter(name='UC33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UC33}', 
	 lhablock = 'CHMIX', 
	 lhacode = [3, 3] ) 
 
rZDL11 = 	 Parameter(name='rZDL11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDL11}', 
	 lhablock = 'UDLMIX', 
	 lhacode = [1, 1] ) 
 
iZDL11 = 	 Parameter(name='iZDL11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDL11}', 
	 lhablock = 'IMUDLMIX', 
	 lhacode = [1, 1] ) 
 
rZDL12 = 	 Parameter(name='rZDL12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDL12}', 
	 lhablock = 'UDLMIX', 
	 lhacode = [1, 2] ) 
 
iZDL12 = 	 Parameter(name='iZDL12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDL12}', 
	 lhablock = 'IMUDLMIX', 
	 lhacode = [1, 2] ) 
 
rZDL13 = 	 Parameter(name='rZDL13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDL13}', 
	 lhablock = 'UDLMIX', 
	 lhacode = [1, 3] ) 
 
iZDL13 = 	 Parameter(name='iZDL13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDL13}', 
	 lhablock = 'IMUDLMIX', 
	 lhacode = [1, 3] ) 
 
rZDL21 = 	 Parameter(name='rZDL21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDL21}', 
	 lhablock = 'UDLMIX', 
	 lhacode = [2, 1] ) 
 
iZDL21 = 	 Parameter(name='iZDL21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDL21}', 
	 lhablock = 'IMUDLMIX', 
	 lhacode = [2, 1] ) 
 
rZDL22 = 	 Parameter(name='rZDL22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDL22}', 
	 lhablock = 'UDLMIX', 
	 lhacode = [2, 2] ) 
 
iZDL22 = 	 Parameter(name='iZDL22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDL22}', 
	 lhablock = 'IMUDLMIX', 
	 lhacode = [2, 2] ) 
 
rZDL23 = 	 Parameter(name='rZDL23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDL23}', 
	 lhablock = 'UDLMIX', 
	 lhacode = [2, 3] ) 
 
iZDL23 = 	 Parameter(name='iZDL23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDL23}', 
	 lhablock = 'IMUDLMIX', 
	 lhacode = [2, 3] ) 
 
rZDL31 = 	 Parameter(name='rZDL31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDL31}', 
	 lhablock = 'UDLMIX', 
	 lhacode = [3, 1] ) 
 
iZDL31 = 	 Parameter(name='iZDL31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDL31}', 
	 lhablock = 'IMUDLMIX', 
	 lhacode = [3, 1] ) 
 
rZDL32 = 	 Parameter(name='rZDL32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDL32}', 
	 lhablock = 'UDLMIX', 
	 lhacode = [3, 2] ) 
 
iZDL32 = 	 Parameter(name='iZDL32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDL32}', 
	 lhablock = 'IMUDLMIX', 
	 lhacode = [3, 2] ) 
 
rZDL33 = 	 Parameter(name='rZDL33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDL33}', 
	 lhablock = 'UDLMIX', 
	 lhacode = [3, 3] ) 
 
iZDL33 = 	 Parameter(name='iZDL33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDL33}', 
	 lhablock = 'IMUDLMIX', 
	 lhacode = [3, 3] ) 
 
rZDR11 = 	 Parameter(name='rZDR11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDR11}', 
	 lhablock = 'UDRMIX', 
	 lhacode = [1, 1] ) 
 
iZDR11 = 	 Parameter(name='iZDR11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDR11}', 
	 lhablock = 'IMUDRMIX', 
	 lhacode = [1, 1] ) 
 
rZDR12 = 	 Parameter(name='rZDR12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDR12}', 
	 lhablock = 'UDRMIX', 
	 lhacode = [1, 2] ) 
 
iZDR12 = 	 Parameter(name='iZDR12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDR12}', 
	 lhablock = 'IMUDRMIX', 
	 lhacode = [1, 2] ) 
 
rZDR13 = 	 Parameter(name='rZDR13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDR13}', 
	 lhablock = 'UDRMIX', 
	 lhacode = [1, 3] ) 
 
iZDR13 = 	 Parameter(name='iZDR13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDR13}', 
	 lhablock = 'IMUDRMIX', 
	 lhacode = [1, 3] ) 
 
rZDR21 = 	 Parameter(name='rZDR21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDR21}', 
	 lhablock = 'UDRMIX', 
	 lhacode = [2, 1] ) 
 
iZDR21 = 	 Parameter(name='iZDR21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDR21}', 
	 lhablock = 'IMUDRMIX', 
	 lhacode = [2, 1] ) 
 
rZDR22 = 	 Parameter(name='rZDR22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDR22}', 
	 lhablock = 'UDRMIX', 
	 lhacode = [2, 2] ) 
 
iZDR22 = 	 Parameter(name='iZDR22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDR22}', 
	 lhablock = 'IMUDRMIX', 
	 lhacode = [2, 2] ) 
 
rZDR23 = 	 Parameter(name='rZDR23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDR23}', 
	 lhablock = 'UDRMIX', 
	 lhacode = [2, 3] ) 
 
iZDR23 = 	 Parameter(name='iZDR23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDR23}', 
	 lhablock = 'IMUDRMIX', 
	 lhacode = [2, 3] ) 
 
rZDR31 = 	 Parameter(name='rZDR31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDR31}', 
	 lhablock = 'UDRMIX', 
	 lhacode = [3, 1] ) 
 
iZDR31 = 	 Parameter(name='iZDR31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDR31}', 
	 lhablock = 'IMUDRMIX', 
	 lhacode = [3, 1] ) 
 
rZDR32 = 	 Parameter(name='rZDR32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDR32}', 
	 lhablock = 'UDRMIX', 
	 lhacode = [3, 2] ) 
 
iZDR32 = 	 Parameter(name='iZDR32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDR32}', 
	 lhablock = 'IMUDRMIX', 
	 lhacode = [3, 2] ) 
 
rZDR33 = 	 Parameter(name='rZDR33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDR33}', 
	 lhablock = 'UDRMIX', 
	 lhacode = [3, 3] ) 
 
iZDR33 = 	 Parameter(name='iZDR33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDR33}', 
	 lhablock = 'IMUDRMIX', 
	 lhacode = [3, 3] ) 
 
rZUL11 = 	 Parameter(name='rZUL11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUL11}', 
	 lhablock = 'UULMIX', 
	 lhacode = [1, 1] ) 
 
iZUL11 = 	 Parameter(name='iZUL11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUL11}', 
	 lhablock = 'IMUULMIX', 
	 lhacode = [1, 1] ) 
 
rZUL12 = 	 Parameter(name='rZUL12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUL12}', 
	 lhablock = 'UULMIX', 
	 lhacode = [1, 2] ) 
 
iZUL12 = 	 Parameter(name='iZUL12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUL12}', 
	 lhablock = 'IMUULMIX', 
	 lhacode = [1, 2] ) 
 
rZUL13 = 	 Parameter(name='rZUL13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUL13}', 
	 lhablock = 'UULMIX', 
	 lhacode = [1, 3] ) 
 
iZUL13 = 	 Parameter(name='iZUL13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUL13}', 
	 lhablock = 'IMUULMIX', 
	 lhacode = [1, 3] ) 
 
rZUL21 = 	 Parameter(name='rZUL21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUL21}', 
	 lhablock = 'UULMIX', 
	 lhacode = [2, 1] ) 
 
iZUL21 = 	 Parameter(name='iZUL21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUL21}', 
	 lhablock = 'IMUULMIX', 
	 lhacode = [2, 1] ) 
 
rZUL22 = 	 Parameter(name='rZUL22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUL22}', 
	 lhablock = 'UULMIX', 
	 lhacode = [2, 2] ) 
 
iZUL22 = 	 Parameter(name='iZUL22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUL22}', 
	 lhablock = 'IMUULMIX', 
	 lhacode = [2, 2] ) 
 
rZUL23 = 	 Parameter(name='rZUL23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUL23}', 
	 lhablock = 'UULMIX', 
	 lhacode = [2, 3] ) 
 
iZUL23 = 	 Parameter(name='iZUL23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUL23}', 
	 lhablock = 'IMUULMIX', 
	 lhacode = [2, 3] ) 
 
rZUL31 = 	 Parameter(name='rZUL31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUL31}', 
	 lhablock = 'UULMIX', 
	 lhacode = [3, 1] ) 
 
iZUL31 = 	 Parameter(name='iZUL31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUL31}', 
	 lhablock = 'IMUULMIX', 
	 lhacode = [3, 1] ) 
 
rZUL32 = 	 Parameter(name='rZUL32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUL32}', 
	 lhablock = 'UULMIX', 
	 lhacode = [3, 2] ) 
 
iZUL32 = 	 Parameter(name='iZUL32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUL32}', 
	 lhablock = 'IMUULMIX', 
	 lhacode = [3, 2] ) 
 
rZUL33 = 	 Parameter(name='rZUL33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUL33}', 
	 lhablock = 'UULMIX', 
	 lhacode = [3, 3] ) 
 
iZUL33 = 	 Parameter(name='iZUL33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUL33}', 
	 lhablock = 'IMUULMIX', 
	 lhacode = [3, 3] ) 
 
rZUR11 = 	 Parameter(name='rZUR11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUR11}', 
	 lhablock = 'UURMIX', 
	 lhacode = [1, 1] ) 
 
iZUR11 = 	 Parameter(name='iZUR11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUR11}', 
	 lhablock = 'IMUURMIX', 
	 lhacode = [1, 1] ) 
 
rZUR12 = 	 Parameter(name='rZUR12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUR12}', 
	 lhablock = 'UURMIX', 
	 lhacode = [1, 2] ) 
 
iZUR12 = 	 Parameter(name='iZUR12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUR12}', 
	 lhablock = 'IMUURMIX', 
	 lhacode = [1, 2] ) 
 
rZUR13 = 	 Parameter(name='rZUR13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUR13}', 
	 lhablock = 'UURMIX', 
	 lhacode = [1, 3] ) 
 
iZUR13 = 	 Parameter(name='iZUR13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUR13}', 
	 lhablock = 'IMUURMIX', 
	 lhacode = [1, 3] ) 
 
rZUR21 = 	 Parameter(name='rZUR21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUR21}', 
	 lhablock = 'UURMIX', 
	 lhacode = [2, 1] ) 
 
iZUR21 = 	 Parameter(name='iZUR21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUR21}', 
	 lhablock = 'IMUURMIX', 
	 lhacode = [2, 1] ) 
 
rZUR22 = 	 Parameter(name='rZUR22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUR22}', 
	 lhablock = 'UURMIX', 
	 lhacode = [2, 2] ) 
 
iZUR22 = 	 Parameter(name='iZUR22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUR22}', 
	 lhablock = 'IMUURMIX', 
	 lhacode = [2, 2] ) 
 
rZUR23 = 	 Parameter(name='rZUR23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUR23}', 
	 lhablock = 'UURMIX', 
	 lhacode = [2, 3] ) 
 
iZUR23 = 	 Parameter(name='iZUR23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUR23}', 
	 lhablock = 'IMUURMIX', 
	 lhacode = [2, 3] ) 
 
rZUR31 = 	 Parameter(name='rZUR31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUR31}', 
	 lhablock = 'UURMIX', 
	 lhacode = [3, 1] ) 
 
iZUR31 = 	 Parameter(name='iZUR31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUR31}', 
	 lhablock = 'IMUURMIX', 
	 lhacode = [3, 1] ) 
 
rZUR32 = 	 Parameter(name='rZUR32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUR32}', 
	 lhablock = 'UURMIX', 
	 lhacode = [3, 2] ) 
 
iZUR32 = 	 Parameter(name='iZUR32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUR32}', 
	 lhablock = 'IMUURMIX', 
	 lhacode = [3, 2] ) 
 
rZUR33 = 	 Parameter(name='rZUR33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUR33}', 
	 lhablock = 'UURMIX', 
	 lhacode = [3, 3] ) 
 
iZUR33 = 	 Parameter(name='iZUR33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUR33}', 
	 lhablock = 'IMUURMIX', 
	 lhacode = [3, 3] ) 
 
rZEL11 = 	 Parameter(name='rZEL11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZEL11}', 
	 lhablock = 'UELMIX', 
	 lhacode = [1, 1] ) 
 
iZEL11 = 	 Parameter(name='iZEL11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZEL11}', 
	 lhablock = 'IMUELMIX', 
	 lhacode = [1, 1] ) 
 
rZEL12 = 	 Parameter(name='rZEL12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZEL12}', 
	 lhablock = 'UELMIX', 
	 lhacode = [1, 2] ) 
 
iZEL12 = 	 Parameter(name='iZEL12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZEL12}', 
	 lhablock = 'IMUELMIX', 
	 lhacode = [1, 2] ) 
 
rZEL13 = 	 Parameter(name='rZEL13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZEL13}', 
	 lhablock = 'UELMIX', 
	 lhacode = [1, 3] ) 
 
iZEL13 = 	 Parameter(name='iZEL13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZEL13}', 
	 lhablock = 'IMUELMIX', 
	 lhacode = [1, 3] ) 
 
rZEL21 = 	 Parameter(name='rZEL21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZEL21}', 
	 lhablock = 'UELMIX', 
	 lhacode = [2, 1] ) 
 
iZEL21 = 	 Parameter(name='iZEL21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZEL21}', 
	 lhablock = 'IMUELMIX', 
	 lhacode = [2, 1] ) 
 
rZEL22 = 	 Parameter(name='rZEL22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZEL22}', 
	 lhablock = 'UELMIX', 
	 lhacode = [2, 2] ) 
 
iZEL22 = 	 Parameter(name='iZEL22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZEL22}', 
	 lhablock = 'IMUELMIX', 
	 lhacode = [2, 2] ) 
 
rZEL23 = 	 Parameter(name='rZEL23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZEL23}', 
	 lhablock = 'UELMIX', 
	 lhacode = [2, 3] ) 
 
iZEL23 = 	 Parameter(name='iZEL23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZEL23}', 
	 lhablock = 'IMUELMIX', 
	 lhacode = [2, 3] ) 
 
rZEL31 = 	 Parameter(name='rZEL31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZEL31}', 
	 lhablock = 'UELMIX', 
	 lhacode = [3, 1] ) 
 
iZEL31 = 	 Parameter(name='iZEL31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZEL31}', 
	 lhablock = 'IMUELMIX', 
	 lhacode = [3, 1] ) 
 
rZEL32 = 	 Parameter(name='rZEL32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZEL32}', 
	 lhablock = 'UELMIX', 
	 lhacode = [3, 2] ) 
 
iZEL32 = 	 Parameter(name='iZEL32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZEL32}', 
	 lhablock = 'IMUELMIX', 
	 lhacode = [3, 2] ) 
 
rZEL33 = 	 Parameter(name='rZEL33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZEL33}', 
	 lhablock = 'UELMIX', 
	 lhacode = [3, 3] ) 
 
iZEL33 = 	 Parameter(name='iZEL33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZEL33}', 
	 lhablock = 'IMUELMIX', 
	 lhacode = [3, 3] ) 
 
rZER11 = 	 Parameter(name='rZER11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZER11}', 
	 lhablock = 'UERMIX', 
	 lhacode = [1, 1] ) 
 
iZER11 = 	 Parameter(name='iZER11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZER11}', 
	 lhablock = 'IMUERMIX', 
	 lhacode = [1, 1] ) 
 
rZER12 = 	 Parameter(name='rZER12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZER12}', 
	 lhablock = 'UERMIX', 
	 lhacode = [1, 2] ) 
 
iZER12 = 	 Parameter(name='iZER12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZER12}', 
	 lhablock = 'IMUERMIX', 
	 lhacode = [1, 2] ) 
 
rZER13 = 	 Parameter(name='rZER13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZER13}', 
	 lhablock = 'UERMIX', 
	 lhacode = [1, 3] ) 
 
iZER13 = 	 Parameter(name='iZER13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZER13}', 
	 lhablock = 'IMUERMIX', 
	 lhacode = [1, 3] ) 
 
rZER21 = 	 Parameter(name='rZER21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZER21}', 
	 lhablock = 'UERMIX', 
	 lhacode = [2, 1] ) 
 
iZER21 = 	 Parameter(name='iZER21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZER21}', 
	 lhablock = 'IMUERMIX', 
	 lhacode = [2, 1] ) 
 
rZER22 = 	 Parameter(name='rZER22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZER22}', 
	 lhablock = 'UERMIX', 
	 lhacode = [2, 2] ) 
 
iZER22 = 	 Parameter(name='iZER22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZER22}', 
	 lhablock = 'IMUERMIX', 
	 lhacode = [2, 2] ) 
 
rZER23 = 	 Parameter(name='rZER23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZER23}', 
	 lhablock = 'UERMIX', 
	 lhacode = [2, 3] ) 
 
iZER23 = 	 Parameter(name='iZER23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZER23}', 
	 lhablock = 'IMUERMIX', 
	 lhacode = [2, 3] ) 
 
rZER31 = 	 Parameter(name='rZER31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZER31}', 
	 lhablock = 'UERMIX', 
	 lhacode = [3, 1] ) 
 
iZER31 = 	 Parameter(name='iZER31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZER31}', 
	 lhablock = 'IMUERMIX', 
	 lhacode = [3, 1] ) 
 
rZER32 = 	 Parameter(name='rZER32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZER32}', 
	 lhablock = 'UERMIX', 
	 lhacode = [3, 2] ) 
 
iZER32 = 	 Parameter(name='iZER32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZER32}', 
	 lhablock = 'IMUERMIX', 
	 lhacode = [3, 2] ) 
 
rZER33 = 	 Parameter(name='rZER33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZER33}', 
	 lhablock = 'UERMIX', 
	 lhacode = [3, 3] ) 
 
iZER33 = 	 Parameter(name='iZER33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZER33}', 
	 lhablock = 'IMUERMIX', 
	 lhacode = [3, 3] ) 
 
rUV11 = 	 Parameter(name='rUV11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UV11}', 
	 lhablock = 'UVMIX', 
	 lhacode = [1, 1] ) 
 
iUV11 = 	 Parameter(name='iUV11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UV11}', 
	 lhablock = 'IMUVMIX', 
	 lhacode = [1, 1] ) 
 
rUV12 = 	 Parameter(name='rUV12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UV12}', 
	 lhablock = 'UVMIX', 
	 lhacode = [1, 2] ) 
 
iUV12 = 	 Parameter(name='iUV12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UV12}', 
	 lhablock = 'IMUVMIX', 
	 lhacode = [1, 2] ) 
 
rUV13 = 	 Parameter(name='rUV13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UV13}', 
	 lhablock = 'UVMIX', 
	 lhacode = [1, 3] ) 
 
iUV13 = 	 Parameter(name='iUV13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UV13}', 
	 lhablock = 'IMUVMIX', 
	 lhacode = [1, 3] ) 
 
rUV14 = 	 Parameter(name='rUV14', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UV14}', 
	 lhablock = 'UVMIX', 
	 lhacode = [1, 4] ) 
 
iUV14 = 	 Parameter(name='iUV14', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UV14}', 
	 lhablock = 'IMUVMIX', 
	 lhacode = [1, 4] ) 
 
rUV15 = 	 Parameter(name='rUV15', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UV15}', 
	 lhablock = 'UVMIX', 
	 lhacode = [1, 5] ) 
 
iUV15 = 	 Parameter(name='iUV15', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UV15}', 
	 lhablock = 'IMUVMIX', 
	 lhacode = [1, 5] ) 
 
rUV16 = 	 Parameter(name='rUV16', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UV16}', 
	 lhablock = 'UVMIX', 
	 lhacode = [1, 6] ) 
 
iUV16 = 	 Parameter(name='iUV16', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UV16}', 
	 lhablock = 'IMUVMIX', 
	 lhacode = [1, 6] ) 
 
rUV21 = 	 Parameter(name='rUV21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UV21}', 
	 lhablock = 'UVMIX', 
	 lhacode = [2, 1] ) 
 
iUV21 = 	 Parameter(name='iUV21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UV21}', 
	 lhablock = 'IMUVMIX', 
	 lhacode = [2, 1] ) 
 
rUV22 = 	 Parameter(name='rUV22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UV22}', 
	 lhablock = 'UVMIX', 
	 lhacode = [2, 2] ) 
 
iUV22 = 	 Parameter(name='iUV22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UV22}', 
	 lhablock = 'IMUVMIX', 
	 lhacode = [2, 2] ) 
 
rUV23 = 	 Parameter(name='rUV23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UV23}', 
	 lhablock = 'UVMIX', 
	 lhacode = [2, 3] ) 
 
iUV23 = 	 Parameter(name='iUV23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UV23}', 
	 lhablock = 'IMUVMIX', 
	 lhacode = [2, 3] ) 
 
rUV24 = 	 Parameter(name='rUV24', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UV24}', 
	 lhablock = 'UVMIX', 
	 lhacode = [2, 4] ) 
 
iUV24 = 	 Parameter(name='iUV24', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UV24}', 
	 lhablock = 'IMUVMIX', 
	 lhacode = [2, 4] ) 
 
rUV25 = 	 Parameter(name='rUV25', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UV25}', 
	 lhablock = 'UVMIX', 
	 lhacode = [2, 5] ) 
 
iUV25 = 	 Parameter(name='iUV25', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UV25}', 
	 lhablock = 'IMUVMIX', 
	 lhacode = [2, 5] ) 
 
rUV26 = 	 Parameter(name='rUV26', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UV26}', 
	 lhablock = 'UVMIX', 
	 lhacode = [2, 6] ) 
 
iUV26 = 	 Parameter(name='iUV26', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UV26}', 
	 lhablock = 'IMUVMIX', 
	 lhacode = [2, 6] ) 
 
rUV31 = 	 Parameter(name='rUV31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UV31}', 
	 lhablock = 'UVMIX', 
	 lhacode = [3, 1] ) 
 
iUV31 = 	 Parameter(name='iUV31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UV31}', 
	 lhablock = 'IMUVMIX', 
	 lhacode = [3, 1] ) 
 
rUV32 = 	 Parameter(name='rUV32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UV32}', 
	 lhablock = 'UVMIX', 
	 lhacode = [3, 2] ) 
 
iUV32 = 	 Parameter(name='iUV32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UV32}', 
	 lhablock = 'IMUVMIX', 
	 lhacode = [3, 2] ) 
 
rUV33 = 	 Parameter(name='rUV33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UV33}', 
	 lhablock = 'UVMIX', 
	 lhacode = [3, 3] ) 
 
iUV33 = 	 Parameter(name='iUV33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UV33}', 
	 lhablock = 'IMUVMIX', 
	 lhacode = [3, 3] ) 
 
rUV34 = 	 Parameter(name='rUV34', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UV34}', 
	 lhablock = 'UVMIX', 
	 lhacode = [3, 4] ) 
 
iUV34 = 	 Parameter(name='iUV34', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UV34}', 
	 lhablock = 'IMUVMIX', 
	 lhacode = [3, 4] ) 
 
rUV35 = 	 Parameter(name='rUV35', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UV35}', 
	 lhablock = 'UVMIX', 
	 lhacode = [3, 5] ) 
 
iUV35 = 	 Parameter(name='iUV35', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UV35}', 
	 lhablock = 'IMUVMIX', 
	 lhacode = [3, 5] ) 
 
rUV36 = 	 Parameter(name='rUV36', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UV36}', 
	 lhablock = 'UVMIX', 
	 lhacode = [3, 6] ) 
 
iUV36 = 	 Parameter(name='iUV36', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UV36}', 
	 lhablock = 'IMUVMIX', 
	 lhacode = [3, 6] ) 
 
rUV41 = 	 Parameter(name='rUV41', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UV41}', 
	 lhablock = 'UVMIX', 
	 lhacode = [4, 1] ) 
 
iUV41 = 	 Parameter(name='iUV41', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UV41}', 
	 lhablock = 'IMUVMIX', 
	 lhacode = [4, 1] ) 
 
rUV42 = 	 Parameter(name='rUV42', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UV42}', 
	 lhablock = 'UVMIX', 
	 lhacode = [4, 2] ) 
 
iUV42 = 	 Parameter(name='iUV42', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UV42}', 
	 lhablock = 'IMUVMIX', 
	 lhacode = [4, 2] ) 
 
rUV43 = 	 Parameter(name='rUV43', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UV43}', 
	 lhablock = 'UVMIX', 
	 lhacode = [4, 3] ) 
 
iUV43 = 	 Parameter(name='iUV43', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UV43}', 
	 lhablock = 'IMUVMIX', 
	 lhacode = [4, 3] ) 
 
rUV44 = 	 Parameter(name='rUV44', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UV44}', 
	 lhablock = 'UVMIX', 
	 lhacode = [4, 4] ) 
 
iUV44 = 	 Parameter(name='iUV44', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UV44}', 
	 lhablock = 'IMUVMIX', 
	 lhacode = [4, 4] ) 
 
rUV45 = 	 Parameter(name='rUV45', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UV45}', 
	 lhablock = 'UVMIX', 
	 lhacode = [4, 5] ) 
 
iUV45 = 	 Parameter(name='iUV45', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UV45}', 
	 lhablock = 'IMUVMIX', 
	 lhacode = [4, 5] ) 
 
rUV46 = 	 Parameter(name='rUV46', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UV46}', 
	 lhablock = 'UVMIX', 
	 lhacode = [4, 6] ) 
 
iUV46 = 	 Parameter(name='iUV46', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UV46}', 
	 lhablock = 'IMUVMIX', 
	 lhacode = [4, 6] ) 
 
rUV51 = 	 Parameter(name='rUV51', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UV51}', 
	 lhablock = 'UVMIX', 
	 lhacode = [5, 1] ) 
 
iUV51 = 	 Parameter(name='iUV51', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UV51}', 
	 lhablock = 'IMUVMIX', 
	 lhacode = [5, 1] ) 
 
rUV52 = 	 Parameter(name='rUV52', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UV52}', 
	 lhablock = 'UVMIX', 
	 lhacode = [5, 2] ) 
 
iUV52 = 	 Parameter(name='iUV52', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UV52}', 
	 lhablock = 'IMUVMIX', 
	 lhacode = [5, 2] ) 
 
rUV53 = 	 Parameter(name='rUV53', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UV53}', 
	 lhablock = 'UVMIX', 
	 lhacode = [5, 3] ) 
 
iUV53 = 	 Parameter(name='iUV53', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UV53}', 
	 lhablock = 'IMUVMIX', 
	 lhacode = [5, 3] ) 
 
rUV54 = 	 Parameter(name='rUV54', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UV54}', 
	 lhablock = 'UVMIX', 
	 lhacode = [5, 4] ) 
 
iUV54 = 	 Parameter(name='iUV54', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UV54}', 
	 lhablock = 'IMUVMIX', 
	 lhacode = [5, 4] ) 
 
rUV55 = 	 Parameter(name='rUV55', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UV55}', 
	 lhablock = 'UVMIX', 
	 lhacode = [5, 5] ) 
 
iUV55 = 	 Parameter(name='iUV55', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UV55}', 
	 lhablock = 'IMUVMIX', 
	 lhacode = [5, 5] ) 
 
rUV56 = 	 Parameter(name='rUV56', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UV56}', 
	 lhablock = 'UVMIX', 
	 lhacode = [5, 6] ) 
 
iUV56 = 	 Parameter(name='iUV56', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UV56}', 
	 lhablock = 'IMUVMIX', 
	 lhacode = [5, 6] ) 
 
rUV61 = 	 Parameter(name='rUV61', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UV61}', 
	 lhablock = 'UVMIX', 
	 lhacode = [6, 1] ) 
 
iUV61 = 	 Parameter(name='iUV61', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UV61}', 
	 lhablock = 'IMUVMIX', 
	 lhacode = [6, 1] ) 
 
rUV62 = 	 Parameter(name='rUV62', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UV62}', 
	 lhablock = 'UVMIX', 
	 lhacode = [6, 2] ) 
 
iUV62 = 	 Parameter(name='iUV62', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UV62}', 
	 lhablock = 'IMUVMIX', 
	 lhacode = [6, 2] ) 
 
rUV63 = 	 Parameter(name='rUV63', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UV63}', 
	 lhablock = 'UVMIX', 
	 lhacode = [6, 3] ) 
 
iUV63 = 	 Parameter(name='iUV63', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UV63}', 
	 lhablock = 'IMUVMIX', 
	 lhacode = [6, 3] ) 
 
rUV64 = 	 Parameter(name='rUV64', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UV64}', 
	 lhablock = 'UVMIX', 
	 lhacode = [6, 4] ) 
 
iUV64 = 	 Parameter(name='iUV64', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UV64}', 
	 lhablock = 'IMUVMIX', 
	 lhacode = [6, 4] ) 
 
rUV65 = 	 Parameter(name='rUV65', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UV65}', 
	 lhablock = 'UVMIX', 
	 lhacode = [6, 5] ) 
 
iUV65 = 	 Parameter(name='iUV65', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UV65}', 
	 lhablock = 'IMUVMIX', 
	 lhacode = [6, 5] ) 
 
rUV66 = 	 Parameter(name='rUV66', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UV66}', 
	 lhablock = 'UVMIX', 
	 lhacode = [6, 6] ) 
 
iUV66 = 	 Parameter(name='iUV66', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UV66}', 
	 lhablock = 'IMUVMIX', 
	 lhacode = [6, 6] ) 
 
rUT11 = 	 Parameter(name='rUT11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UT11}', 
	 lhablock = 'UTMIX', 
	 lhacode = [1, 1] ) 
 
iUT11 = 	 Parameter(name='iUT11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UT11}', 
	 lhablock = 'IMUTMIX', 
	 lhacode = [1, 1] ) 
 
rUT12 = 	 Parameter(name='rUT12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UT12}', 
	 lhablock = 'UTMIX', 
	 lhacode = [1, 2] ) 
 
iUT12 = 	 Parameter(name='iUT12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UT12}', 
	 lhablock = 'IMUTMIX', 
	 lhacode = [1, 2] ) 
 
rUT21 = 	 Parameter(name='rUT21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UT21}', 
	 lhablock = 'UTMIX', 
	 lhacode = [2, 1] ) 
 
iUT21 = 	 Parameter(name='iUT21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UT21}', 
	 lhablock = 'IMUTMIX', 
	 lhacode = [2, 1] ) 
 
rUT22 = 	 Parameter(name='rUT22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UT22}', 
	 lhablock = 'UTMIX', 
	 lhacode = [2, 2] ) 
 
iUT22 = 	 Parameter(name='iUT22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UT22}', 
	 lhablock = 'IMUTMIX', 
	 lhacode = [2, 2] ) 
 
TW = 	 Parameter(name='TW', 
	 nature = 'external', 
	 type = 'real', 
	 value = 1., 
	 texname = '\\text{TW}', 
	 lhablock = 'THETAW', 
	 lhacode = [1] ) 
 
PhiW = 	 Parameter(name='PhiW', 
	 nature = 'external', 
	 type = 'real', 
	 value = 1., 
	 texname = '\\text{PhiW}', 
	 lhablock = 'PHIW', 
	 lhacode = [1] ) 
 
aS = 	 Parameter(name='aS', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0.119, 
	 texname = '\\text{aS}', 
	 lhablock = 'SMINPUTS', 
	 lhacode = [3] ) 
 
aEWM1 = 	 Parameter(name='aEWM1', 
	 nature = 'external', 
	 type = 'real', 
	 value = 137.035999679, 
	 texname = '\\text{aEWM1}', 
	 lhablock = 'SMINPUTS', 
	 lhacode = [1] ) 
 
Gf = 	 Parameter(name='Gf', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0.0000116639, 
	 texname = '\\text{Gf}', 
	 lhablock = 'SMINPUTS', 
	 lhacode = [2] ) 
 
YDR11 = 	 Parameter(name='YDR11', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYDR11 + complex(0,1)*iYDR11', 
	 texname = '\\text{YDR11}' ) 
 
YDR12 = 	 Parameter(name='YDR12', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYDR12 + complex(0,1)*iYDR12', 
	 texname = '\\text{YDR12}' ) 
 
YDR13 = 	 Parameter(name='YDR13', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYDR13 + complex(0,1)*iYDR13', 
	 texname = '\\text{YDR13}' ) 
 
YDR21 = 	 Parameter(name='YDR21', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYDR21 + complex(0,1)*iYDR21', 
	 texname = '\\text{YDR21}' ) 
 
YDR22 = 	 Parameter(name='YDR22', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYDR22 + complex(0,1)*iYDR22', 
	 texname = '\\text{YDR22}' ) 
 
YDR23 = 	 Parameter(name='YDR23', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYDR23 + complex(0,1)*iYDR23', 
	 texname = '\\text{YDR23}' ) 
 
YDR31 = 	 Parameter(name='YDR31', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYDR31 + complex(0,1)*iYDR31', 
	 texname = '\\text{YDR31}' ) 
 
YDR32 = 	 Parameter(name='YDR32', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYDR32 + complex(0,1)*iYDR32', 
	 texname = '\\text{YDR32}' ) 
 
YDR33 = 	 Parameter(name='YDR33', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYDR33 + complex(0,1)*iYDR33', 
	 texname = '\\text{YDR33}' ) 
 
YL111 = 	 Parameter(name='YL111', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYL111 + complex(0,1)*iYL111', 
	 texname = '\\text{YL111}' ) 
 
YL112 = 	 Parameter(name='YL112', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYL112 + complex(0,1)*iYL112', 
	 texname = '\\text{YL112}' ) 
 
YL113 = 	 Parameter(name='YL113', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYL113 + complex(0,1)*iYL113', 
	 texname = '\\text{YL113}' ) 
 
YL121 = 	 Parameter(name='YL121', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYL121 + complex(0,1)*iYL121', 
	 texname = '\\text{YL121}' ) 
 
YL122 = 	 Parameter(name='YL122', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYL122 + complex(0,1)*iYL122', 
	 texname = '\\text{YL122}' ) 
 
YL123 = 	 Parameter(name='YL123', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYL123 + complex(0,1)*iYL123', 
	 texname = '\\text{YL123}' ) 
 
YL131 = 	 Parameter(name='YL131', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYL131 + complex(0,1)*iYL131', 
	 texname = '\\text{YL131}' ) 
 
YL132 = 	 Parameter(name='YL132', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYL132 + complex(0,1)*iYL132', 
	 texname = '\\text{YL132}' ) 
 
YL133 = 	 Parameter(name='YL133', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYL133 + complex(0,1)*iYL133', 
	 texname = '\\text{YL133}' ) 
 
YQ111 = 	 Parameter(name='YQ111', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYQ111 + complex(0,1)*iYQ111', 
	 texname = '\\text{YQ111}' ) 
 
YQ112 = 	 Parameter(name='YQ112', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYQ112 + complex(0,1)*iYQ112', 
	 texname = '\\text{YQ112}' ) 
 
YQ113 = 	 Parameter(name='YQ113', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYQ113 + complex(0,1)*iYQ113', 
	 texname = '\\text{YQ113}' ) 
 
YQ121 = 	 Parameter(name='YQ121', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYQ121 + complex(0,1)*iYQ121', 
	 texname = '\\text{YQ121}' ) 
 
YQ122 = 	 Parameter(name='YQ122', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYQ122 + complex(0,1)*iYQ122', 
	 texname = '\\text{YQ122}' ) 
 
YQ123 = 	 Parameter(name='YQ123', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYQ123 + complex(0,1)*iYQ123', 
	 texname = '\\text{YQ123}' ) 
 
YQ131 = 	 Parameter(name='YQ131', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYQ131 + complex(0,1)*iYQ131', 
	 texname = '\\text{YQ131}' ) 
 
YQ132 = 	 Parameter(name='YQ132', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYQ132 + complex(0,1)*iYQ132', 
	 texname = '\\text{YQ132}' ) 
 
YQ133 = 	 Parameter(name='YQ133', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYQ133 + complex(0,1)*iYQ133', 
	 texname = '\\text{YQ133}' ) 
 
YL211 = 	 Parameter(name='YL211', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYL211 + complex(0,1)*iYL211', 
	 texname = '\\text{YL211}' ) 
 
YL212 = 	 Parameter(name='YL212', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYL212 + complex(0,1)*iYL212', 
	 texname = '\\text{YL212}' ) 
 
YL213 = 	 Parameter(name='YL213', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYL213 + complex(0,1)*iYL213', 
	 texname = '\\text{YL213}' ) 
 
YL221 = 	 Parameter(name='YL221', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYL221 + complex(0,1)*iYL221', 
	 texname = '\\text{YL221}' ) 
 
YL222 = 	 Parameter(name='YL222', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYL222 + complex(0,1)*iYL222', 
	 texname = '\\text{YL222}' ) 
 
YL223 = 	 Parameter(name='YL223', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYL223 + complex(0,1)*iYL223', 
	 texname = '\\text{YL223}' ) 
 
YL231 = 	 Parameter(name='YL231', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYL231 + complex(0,1)*iYL231', 
	 texname = '\\text{YL231}' ) 
 
YL232 = 	 Parameter(name='YL232', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYL232 + complex(0,1)*iYL232', 
	 texname = '\\text{YL232}' ) 
 
YL233 = 	 Parameter(name='YL233', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYL233 + complex(0,1)*iYL233', 
	 texname = '\\text{YL233}' ) 
 
YQ211 = 	 Parameter(name='YQ211', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYQ211 + complex(0,1)*iYQ211', 
	 texname = '\\text{YQ211}' ) 
 
YQ212 = 	 Parameter(name='YQ212', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYQ212 + complex(0,1)*iYQ212', 
	 texname = '\\text{YQ212}' ) 
 
YQ213 = 	 Parameter(name='YQ213', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYQ213 + complex(0,1)*iYQ213', 
	 texname = '\\text{YQ213}' ) 
 
YQ221 = 	 Parameter(name='YQ221', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYQ221 + complex(0,1)*iYQ221', 
	 texname = '\\text{YQ221}' ) 
 
YQ222 = 	 Parameter(name='YQ222', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYQ222 + complex(0,1)*iYQ222', 
	 texname = '\\text{YQ222}' ) 
 
YQ223 = 	 Parameter(name='YQ223', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYQ223 + complex(0,1)*iYQ223', 
	 texname = '\\text{YQ223}' ) 
 
YQ231 = 	 Parameter(name='YQ231', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYQ231 + complex(0,1)*iYQ231', 
	 texname = '\\text{YQ231}' ) 
 
YQ232 = 	 Parameter(name='YQ232', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYQ232 + complex(0,1)*iYQ232', 
	 texname = '\\text{YQ232}' ) 
 
YQ233 = 	 Parameter(name='YQ233', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYQ233 + complex(0,1)*iYQ233', 
	 texname = '\\text{YQ233}' ) 
 
ZZ11 = 	 Parameter(name='ZZ11', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZZ11 + complex(0,1)*iZZ11', 
	 texname = '\\text{ZZ11}' ) 
 
ZZ12 = 	 Parameter(name='ZZ12', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZZ12 + complex(0,1)*iZZ12', 
	 texname = '\\text{ZZ12}' ) 
 
ZZ13 = 	 Parameter(name='ZZ13', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZZ13 + complex(0,1)*iZZ13', 
	 texname = '\\text{ZZ13}' ) 
 
ZZ21 = 	 Parameter(name='ZZ21', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZZ21 + complex(0,1)*iZZ21', 
	 texname = '\\text{ZZ21}' ) 
 
ZZ22 = 	 Parameter(name='ZZ22', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZZ22 + complex(0,1)*iZZ22', 
	 texname = '\\text{ZZ22}' ) 
 
ZZ23 = 	 Parameter(name='ZZ23', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZZ23 + complex(0,1)*iZZ23', 
	 texname = '\\text{ZZ23}' ) 
 
ZZ31 = 	 Parameter(name='ZZ31', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZZ31 + complex(0,1)*iZZ31', 
	 texname = '\\text{ZZ31}' ) 
 
ZZ32 = 	 Parameter(name='ZZ32', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZZ32 + complex(0,1)*iZZ32', 
	 texname = '\\text{ZZ32}' ) 
 
ZZ33 = 	 Parameter(name='ZZ33', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZZ33 + complex(0,1)*iZZ33', 
	 texname = '\\text{ZZ33}' ) 
 
phaT = 	 Parameter(name='phaT', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rphaT + complex(0,1)*iphaT', 
	 texname = '\\text{phaT}' ) 
 
ZDL11 = 	 Parameter(name='ZDL11', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZDL11 + complex(0,1)*iZDL11', 
	 texname = '\\text{ZDL11}' ) 
 
ZDL12 = 	 Parameter(name='ZDL12', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZDL12 + complex(0,1)*iZDL12', 
	 texname = '\\text{ZDL12}' ) 
 
ZDL13 = 	 Parameter(name='ZDL13', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZDL13 + complex(0,1)*iZDL13', 
	 texname = '\\text{ZDL13}' ) 
 
ZDL21 = 	 Parameter(name='ZDL21', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZDL21 + complex(0,1)*iZDL21', 
	 texname = '\\text{ZDL21}' ) 
 
ZDL22 = 	 Parameter(name='ZDL22', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZDL22 + complex(0,1)*iZDL22', 
	 texname = '\\text{ZDL22}' ) 
 
ZDL23 = 	 Parameter(name='ZDL23', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZDL23 + complex(0,1)*iZDL23', 
	 texname = '\\text{ZDL23}' ) 
 
ZDL31 = 	 Parameter(name='ZDL31', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZDL31 + complex(0,1)*iZDL31', 
	 texname = '\\text{ZDL31}' ) 
 
ZDL32 = 	 Parameter(name='ZDL32', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZDL32 + complex(0,1)*iZDL32', 
	 texname = '\\text{ZDL32}' ) 
 
ZDL33 = 	 Parameter(name='ZDL33', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZDL33 + complex(0,1)*iZDL33', 
	 texname = '\\text{ZDL33}' ) 
 
ZDR11 = 	 Parameter(name='ZDR11', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZDR11 + complex(0,1)*iZDR11', 
	 texname = '\\text{ZDR11}' ) 
 
ZDR12 = 	 Parameter(name='ZDR12', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZDR12 + complex(0,1)*iZDR12', 
	 texname = '\\text{ZDR12}' ) 
 
ZDR13 = 	 Parameter(name='ZDR13', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZDR13 + complex(0,1)*iZDR13', 
	 texname = '\\text{ZDR13}' ) 
 
ZDR21 = 	 Parameter(name='ZDR21', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZDR21 + complex(0,1)*iZDR21', 
	 texname = '\\text{ZDR21}' ) 
 
ZDR22 = 	 Parameter(name='ZDR22', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZDR22 + complex(0,1)*iZDR22', 
	 texname = '\\text{ZDR22}' ) 
 
ZDR23 = 	 Parameter(name='ZDR23', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZDR23 + complex(0,1)*iZDR23', 
	 texname = '\\text{ZDR23}' ) 
 
ZDR31 = 	 Parameter(name='ZDR31', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZDR31 + complex(0,1)*iZDR31', 
	 texname = '\\text{ZDR31}' ) 
 
ZDR32 = 	 Parameter(name='ZDR32', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZDR32 + complex(0,1)*iZDR32', 
	 texname = '\\text{ZDR32}' ) 
 
ZDR33 = 	 Parameter(name='ZDR33', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZDR33 + complex(0,1)*iZDR33', 
	 texname = '\\text{ZDR33}' ) 
 
ZUL11 = 	 Parameter(name='ZUL11', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZUL11 + complex(0,1)*iZUL11', 
	 texname = '\\text{ZUL11}' ) 
 
ZUL12 = 	 Parameter(name='ZUL12', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZUL12 + complex(0,1)*iZUL12', 
	 texname = '\\text{ZUL12}' ) 
 
ZUL13 = 	 Parameter(name='ZUL13', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZUL13 + complex(0,1)*iZUL13', 
	 texname = '\\text{ZUL13}' ) 
 
ZUL21 = 	 Parameter(name='ZUL21', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZUL21 + complex(0,1)*iZUL21', 
	 texname = '\\text{ZUL21}' ) 
 
ZUL22 = 	 Parameter(name='ZUL22', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZUL22 + complex(0,1)*iZUL22', 
	 texname = '\\text{ZUL22}' ) 
 
ZUL23 = 	 Parameter(name='ZUL23', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZUL23 + complex(0,1)*iZUL23', 
	 texname = '\\text{ZUL23}' ) 
 
ZUL31 = 	 Parameter(name='ZUL31', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZUL31 + complex(0,1)*iZUL31', 
	 texname = '\\text{ZUL31}' ) 
 
ZUL32 = 	 Parameter(name='ZUL32', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZUL32 + complex(0,1)*iZUL32', 
	 texname = '\\text{ZUL32}' ) 
 
ZUL33 = 	 Parameter(name='ZUL33', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZUL33 + complex(0,1)*iZUL33', 
	 texname = '\\text{ZUL33}' ) 
 
ZUR11 = 	 Parameter(name='ZUR11', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZUR11 + complex(0,1)*iZUR11', 
	 texname = '\\text{ZUR11}' ) 
 
ZUR12 = 	 Parameter(name='ZUR12', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZUR12 + complex(0,1)*iZUR12', 
	 texname = '\\text{ZUR12}' ) 
 
ZUR13 = 	 Parameter(name='ZUR13', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZUR13 + complex(0,1)*iZUR13', 
	 texname = '\\text{ZUR13}' ) 
 
ZUR21 = 	 Parameter(name='ZUR21', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZUR21 + complex(0,1)*iZUR21', 
	 texname = '\\text{ZUR21}' ) 
 
ZUR22 = 	 Parameter(name='ZUR22', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZUR22 + complex(0,1)*iZUR22', 
	 texname = '\\text{ZUR22}' ) 
 
ZUR23 = 	 Parameter(name='ZUR23', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZUR23 + complex(0,1)*iZUR23', 
	 texname = '\\text{ZUR23}' ) 
 
ZUR31 = 	 Parameter(name='ZUR31', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZUR31 + complex(0,1)*iZUR31', 
	 texname = '\\text{ZUR31}' ) 
 
ZUR32 = 	 Parameter(name='ZUR32', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZUR32 + complex(0,1)*iZUR32', 
	 texname = '\\text{ZUR32}' ) 
 
ZUR33 = 	 Parameter(name='ZUR33', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZUR33 + complex(0,1)*iZUR33', 
	 texname = '\\text{ZUR33}' ) 
 
ZEL11 = 	 Parameter(name='ZEL11', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZEL11 + complex(0,1)*iZEL11', 
	 texname = '\\text{ZEL11}' ) 
 
ZEL12 = 	 Parameter(name='ZEL12', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZEL12 + complex(0,1)*iZEL12', 
	 texname = '\\text{ZEL12}' ) 
 
ZEL13 = 	 Parameter(name='ZEL13', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZEL13 + complex(0,1)*iZEL13', 
	 texname = '\\text{ZEL13}' ) 
 
ZEL21 = 	 Parameter(name='ZEL21', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZEL21 + complex(0,1)*iZEL21', 
	 texname = '\\text{ZEL21}' ) 
 
ZEL22 = 	 Parameter(name='ZEL22', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZEL22 + complex(0,1)*iZEL22', 
	 texname = '\\text{ZEL22}' ) 
 
ZEL23 = 	 Parameter(name='ZEL23', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZEL23 + complex(0,1)*iZEL23', 
	 texname = '\\text{ZEL23}' ) 
 
ZEL31 = 	 Parameter(name='ZEL31', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZEL31 + complex(0,1)*iZEL31', 
	 texname = '\\text{ZEL31}' ) 
 
ZEL32 = 	 Parameter(name='ZEL32', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZEL32 + complex(0,1)*iZEL32', 
	 texname = '\\text{ZEL32}' ) 
 
ZEL33 = 	 Parameter(name='ZEL33', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZEL33 + complex(0,1)*iZEL33', 
	 texname = '\\text{ZEL33}' ) 
 
ZER11 = 	 Parameter(name='ZER11', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZER11 + complex(0,1)*iZER11', 
	 texname = '\\text{ZER11}' ) 
 
ZER12 = 	 Parameter(name='ZER12', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZER12 + complex(0,1)*iZER12', 
	 texname = '\\text{ZER12}' ) 
 
ZER13 = 	 Parameter(name='ZER13', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZER13 + complex(0,1)*iZER13', 
	 texname = '\\text{ZER13}' ) 
 
ZER21 = 	 Parameter(name='ZER21', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZER21 + complex(0,1)*iZER21', 
	 texname = '\\text{ZER21}' ) 
 
ZER22 = 	 Parameter(name='ZER22', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZER22 + complex(0,1)*iZER22', 
	 texname = '\\text{ZER22}' ) 
 
ZER23 = 	 Parameter(name='ZER23', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZER23 + complex(0,1)*iZER23', 
	 texname = '\\text{ZER23}' ) 
 
ZER31 = 	 Parameter(name='ZER31', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZER31 + complex(0,1)*iZER31', 
	 texname = '\\text{ZER31}' ) 
 
ZER32 = 	 Parameter(name='ZER32', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZER32 + complex(0,1)*iZER32', 
	 texname = '\\text{ZER32}' ) 
 
ZER33 = 	 Parameter(name='ZER33', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZER33 + complex(0,1)*iZER33', 
	 texname = '\\text{ZER33}' ) 
 
UV11 = 	 Parameter(name='UV11', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rUV11 + complex(0,1)*iUV11', 
	 texname = '\\text{UV11}' ) 
 
UV12 = 	 Parameter(name='UV12', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rUV12 + complex(0,1)*iUV12', 
	 texname = '\\text{UV12}' ) 
 
UV13 = 	 Parameter(name='UV13', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rUV13 + complex(0,1)*iUV13', 
	 texname = '\\text{UV13}' ) 
 
UV14 = 	 Parameter(name='UV14', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rUV14 + complex(0,1)*iUV14', 
	 texname = '\\text{UV14}' ) 
 
UV15 = 	 Parameter(name='UV15', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rUV15 + complex(0,1)*iUV15', 
	 texname = '\\text{UV15}' ) 
 
UV16 = 	 Parameter(name='UV16', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rUV16 + complex(0,1)*iUV16', 
	 texname = '\\text{UV16}' ) 
 
UV21 = 	 Parameter(name='UV21', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rUV21 + complex(0,1)*iUV21', 
	 texname = '\\text{UV21}' ) 
 
UV22 = 	 Parameter(name='UV22', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rUV22 + complex(0,1)*iUV22', 
	 texname = '\\text{UV22}' ) 
 
UV23 = 	 Parameter(name='UV23', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rUV23 + complex(0,1)*iUV23', 
	 texname = '\\text{UV23}' ) 
 
UV24 = 	 Parameter(name='UV24', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rUV24 + complex(0,1)*iUV24', 
	 texname = '\\text{UV24}' ) 
 
UV25 = 	 Parameter(name='UV25', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rUV25 + complex(0,1)*iUV25', 
	 texname = '\\text{UV25}' ) 
 
UV26 = 	 Parameter(name='UV26', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rUV26 + complex(0,1)*iUV26', 
	 texname = '\\text{UV26}' ) 
 
UV31 = 	 Parameter(name='UV31', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rUV31 + complex(0,1)*iUV31', 
	 texname = '\\text{UV31}' ) 
 
UV32 = 	 Parameter(name='UV32', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rUV32 + complex(0,1)*iUV32', 
	 texname = '\\text{UV32}' ) 
 
UV33 = 	 Parameter(name='UV33', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rUV33 + complex(0,1)*iUV33', 
	 texname = '\\text{UV33}' ) 
 
UV34 = 	 Parameter(name='UV34', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rUV34 + complex(0,1)*iUV34', 
	 texname = '\\text{UV34}' ) 
 
UV35 = 	 Parameter(name='UV35', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rUV35 + complex(0,1)*iUV35', 
	 texname = '\\text{UV35}' ) 
 
UV36 = 	 Parameter(name='UV36', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rUV36 + complex(0,1)*iUV36', 
	 texname = '\\text{UV36}' ) 
 
UV41 = 	 Parameter(name='UV41', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rUV41 + complex(0,1)*iUV41', 
	 texname = '\\text{UV41}' ) 
 
UV42 = 	 Parameter(name='UV42', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rUV42 + complex(0,1)*iUV42', 
	 texname = '\\text{UV42}' ) 
 
UV43 = 	 Parameter(name='UV43', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rUV43 + complex(0,1)*iUV43', 
	 texname = '\\text{UV43}' ) 
 
UV44 = 	 Parameter(name='UV44', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rUV44 + complex(0,1)*iUV44', 
	 texname = '\\text{UV44}' ) 
 
UV45 = 	 Parameter(name='UV45', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rUV45 + complex(0,1)*iUV45', 
	 texname = '\\text{UV45}' ) 
 
UV46 = 	 Parameter(name='UV46', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rUV46 + complex(0,1)*iUV46', 
	 texname = '\\text{UV46}' ) 
 
UV51 = 	 Parameter(name='UV51', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rUV51 + complex(0,1)*iUV51', 
	 texname = '\\text{UV51}' ) 
 
UV52 = 	 Parameter(name='UV52', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rUV52 + complex(0,1)*iUV52', 
	 texname = '\\text{UV52}' ) 
 
UV53 = 	 Parameter(name='UV53', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rUV53 + complex(0,1)*iUV53', 
	 texname = '\\text{UV53}' ) 
 
UV54 = 	 Parameter(name='UV54', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rUV54 + complex(0,1)*iUV54', 
	 texname = '\\text{UV54}' ) 
 
UV55 = 	 Parameter(name='UV55', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rUV55 + complex(0,1)*iUV55', 
	 texname = '\\text{UV55}' ) 
 
UV56 = 	 Parameter(name='UV56', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rUV56 + complex(0,1)*iUV56', 
	 texname = '\\text{UV56}' ) 
 
UV61 = 	 Parameter(name='UV61', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rUV61 + complex(0,1)*iUV61', 
	 texname = '\\text{UV61}' ) 
 
UV62 = 	 Parameter(name='UV62', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rUV62 + complex(0,1)*iUV62', 
	 texname = '\\text{UV62}' ) 
 
UV63 = 	 Parameter(name='UV63', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rUV63 + complex(0,1)*iUV63', 
	 texname = '\\text{UV63}' ) 
 
UV64 = 	 Parameter(name='UV64', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rUV64 + complex(0,1)*iUV64', 
	 texname = '\\text{UV64}' ) 
 
UV65 = 	 Parameter(name='UV65', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rUV65 + complex(0,1)*iUV65', 
	 texname = '\\text{UV65}' ) 
 
UV66 = 	 Parameter(name='UV66', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rUV66 + complex(0,1)*iUV66', 
	 texname = '\\text{UV66}' ) 
 
UT11 = 	 Parameter(name='UT11', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rUT11 + complex(0,1)*iUT11', 
	 texname = '\\text{UT11}' ) 
 
UT12 = 	 Parameter(name='UT12', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rUT12 + complex(0,1)*iUT12', 
	 texname = '\\text{UT12}' ) 
 
UT21 = 	 Parameter(name='UT21', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rUT21 + complex(0,1)*iUT21', 
	 texname = '\\text{UT21}' ) 
 
UT22 = 	 Parameter(name='UT22', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rUT22 + complex(0,1)*iUT22', 
	 texname = '\\text{UT22}' ) 
 
G = 	 Parameter(name='G', 
	 nature = 'internal', 
	 type = 'real', 
	 value = '2*cmath.sqrt(aS)*cmath.sqrt(cmath.pi)', 
	 texname = 'G') 
 
el = 	 Parameter(name='el', 
	 nature = 'internal', 
	 type = 'real', 
	 value = '2*cmath.sqrt(1/aEWM1)*cmath.sqrt(cmath.pi)', 
	 texname = 'el') 
 
MWLm = 	 Parameter(name='MWLm', 
	 nature = 'internal', 
	 type = 'real', 
	 value = 'cmath.sqrt(MZ**2/2. + cmath.sqrt(MZ**4/4. - (MZ**2*cmath.pi)/(cmath.sqrt(2)*aEWM1*Gf)))', 
	 texname = 'MWLm') 
 
g2 = 	 Parameter(name='g2', 
	 nature = 'internal', 
	 type = 'real', 
	 value = 'el*1./cmath.sin(TW)', 
	 texname = 'g2') 
 
RXiWLm = 	 Parameter(name='RXiWLm', 
	 nature = 'internal', 
	 type = 'real', 
	 value = '1.', 
	 texname = 'RXiWLm') 
 
RXiWRm = 	 Parameter(name='RXiWRm', 
	 nature = 'internal', 
	 type = 'real', 
	 value = '1.', 
	 texname = 'RXiWRm') 
 
RXiZ = 	 Parameter(name='RXiZ', 
	 nature = 'internal', 
	 type = 'real', 
	 value = '1.', 
	 texname = 'RXiZ') 
 
RXiZR = 	 Parameter(name='RXiZR', 
	 nature = 'internal', 
	 type = 'real', 
	 value = '1.', 
	 texname = 'RXiZR') 
 
HPP1 = 	 Parameter(name='HPP1', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{HPP1}', 
	 lhablock = 'EFFHIGGSCOUPLINGS', 
	 lhacode = [25,22,22] ) 
 
HGG1 = 	 Parameter(name='HGG1', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{HGG1}', 
	 lhablock = 'EFFHIGGSCOUPLINGS', 
	 lhacode = [25,21,21] ) 
 
HPP2 = 	 Parameter(name='HPP2', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{HPP2}', 
	 lhablock = 'EFFHIGGSCOUPLINGS', 
	 lhacode = [35,22,22] ) 
 
HGG2 = 	 Parameter(name='HGG2', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{HGG2}', 
	 lhablock = 'EFFHIGGSCOUPLINGS', 
	 lhacode = [35,21,21] ) 
 
HPP3 = 	 Parameter(name='HPP3', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{HPP3}', 
	 lhablock = 'EFFHIGGSCOUPLINGS', 
	 lhacode = [335,22,22] ) 
 
HGG3 = 	 Parameter(name='HGG3', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{HGG3}', 
	 lhablock = 'EFFHIGGSCOUPLINGS', 
	 lhacode = [335,21,21] ) 
 
APP3 = 	 Parameter(name='APP3', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{APP3}', 
	 lhablock = 'EFFHIGGSCOUPLINGS', 
	 lhacode = [36,22,22] ) 
 
AGG3 = 	 Parameter(name='AGG3', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{AGG3}', 
	 lhablock = 'EFFHIGGSCOUPLINGS', 
	 lhacode = [36,21,21] ) 
 

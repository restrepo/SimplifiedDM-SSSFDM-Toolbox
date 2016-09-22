# ----------------------------------------------------------------------  
# This model file was automatically created by SARAH version4.5.8 
# SARAH References: arXiv:0806.0538, arXiv:0909.2863, arXiv:1002.0840    
# (c) Florian Staub, 2011  
# ----------------------------------------------------------------------  
# File created at 15:26 on 21.8.2015   
# ----------------------------------------------------------------------  
 
 
from object_library import all_parameters,Parameter 
 
from function_library import complexconjugate,re,im,csc,sec,acsc,asec 
 
ZERO=Parameter(name='ZERO', 
                      nature='internal', 
                      type='real', 
                      value='0.0', 
                      texname='0') 
 
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
 
Mh1 = 	 Parameter(name = 'Mh1', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{Mh1}', 
	 lhablock = 'MASS', 
	 lhacode = [25]) 
 
Wh1 = 	 Parameter(name = 'Wh1', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Wh1}', 
	 lhablock = 'DECAY', 
	 lhacode = [25]) 
 
Mh2 = 	 Parameter(name = 'Mh2', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{Mh2}', 
	 lhablock = 'MASS', 
	 lhacode = [35]) 
 
Wh2 = 	 Parameter(name = 'Wh2', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Wh2}', 
	 lhablock = 'DECAY', 
	 lhacode = [35]) 
 
Mh3 = 	 Parameter(name = 'Mh3', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{Mh3}', 
	 lhablock = 'MASS', 
	 lhacode = [335]) 
 
Wh3 = 	 Parameter(name = 'Wh3', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Wh3}', 
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
 
MHpm3 = 	 Parameter(name = 'MHpm3', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{MHpm3}', 
	 lhablock = 'MASS', 
	 lhacode = [37]) 
 
WHpm3 = 	 Parameter(name = 'WHpm3', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{WHpm3}', 
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
 
WWp = 	 Parameter(name = 'WWp', 
	 nature = 'external', 
	 type = 'real', 
	 value = 2.141, 
	 texname = '\\text{WWp}', 
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
	 value = 0.6, 
	 texname = '\\text{gR}', 
	 lhablock = 'LRINPUT', 
	 lhacode = [1] ) 
 
YL211 = 	 Parameter(name='YL211', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YL211}', 
	 lhablock = 'YL2', 
	 lhacode = [1, 1] ) 
 
YL212 = 	 Parameter(name='YL212', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YL212}', 
	 lhablock = 'YL2', 
	 lhacode = [1, 2] ) 
 
YL213 = 	 Parameter(name='YL213', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YL213}', 
	 lhablock = 'YL2', 
	 lhacode = [1, 3] ) 
 
YL221 = 	 Parameter(name='YL221', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YL221}', 
	 lhablock = 'YL2', 
	 lhacode = [2, 1] ) 
 
YL222 = 	 Parameter(name='YL222', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YL222}', 
	 lhablock = 'YL2', 
	 lhacode = [2, 2] ) 
 
YL223 = 	 Parameter(name='YL223', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YL223}', 
	 lhablock = 'YL2', 
	 lhacode = [2, 3] ) 
 
YL231 = 	 Parameter(name='YL231', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YL231}', 
	 lhablock = 'YL2', 
	 lhacode = [3, 1] ) 
 
YL232 = 	 Parameter(name='YL232', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YL232}', 
	 lhablock = 'YL2', 
	 lhacode = [3, 2] ) 
 
YL233 = 	 Parameter(name='YL233', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YL233}', 
	 lhablock = 'YL2', 
	 lhacode = [3, 3] ) 
 
rYQ11 = 	 Parameter(name='rYQ11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YQ11}', 
	 lhablock = 'YQ', 
	 lhacode = [1, 1] ) 
 
iYQ11 = 	 Parameter(name='iYQ11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YQ11}', 
	 lhablock = 'IMYQ', 
	 lhacode = [1, 1] ) 
 
rYQ12 = 	 Parameter(name='rYQ12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YQ12}', 
	 lhablock = 'YQ', 
	 lhacode = [1, 2] ) 
 
iYQ12 = 	 Parameter(name='iYQ12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YQ12}', 
	 lhablock = 'IMYQ', 
	 lhacode = [1, 2] ) 
 
rYQ13 = 	 Parameter(name='rYQ13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YQ13}', 
	 lhablock = 'YQ', 
	 lhacode = [1, 3] ) 
 
iYQ13 = 	 Parameter(name='iYQ13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YQ13}', 
	 lhablock = 'IMYQ', 
	 lhacode = [1, 3] ) 
 
rYQ21 = 	 Parameter(name='rYQ21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YQ21}', 
	 lhablock = 'YQ', 
	 lhacode = [2, 1] ) 
 
iYQ21 = 	 Parameter(name='iYQ21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YQ21}', 
	 lhablock = 'IMYQ', 
	 lhacode = [2, 1] ) 
 
rYQ22 = 	 Parameter(name='rYQ22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YQ22}', 
	 lhablock = 'YQ', 
	 lhacode = [2, 2] ) 
 
iYQ22 = 	 Parameter(name='iYQ22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YQ22}', 
	 lhablock = 'IMYQ', 
	 lhacode = [2, 2] ) 
 
rYQ23 = 	 Parameter(name='rYQ23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YQ23}', 
	 lhablock = 'YQ', 
	 lhacode = [2, 3] ) 
 
iYQ23 = 	 Parameter(name='iYQ23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YQ23}', 
	 lhablock = 'IMYQ', 
	 lhacode = [2, 3] ) 
 
rYQ31 = 	 Parameter(name='rYQ31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YQ31}', 
	 lhablock = 'YQ', 
	 lhacode = [3, 1] ) 
 
iYQ31 = 	 Parameter(name='iYQ31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YQ31}', 
	 lhablock = 'IMYQ', 
	 lhacode = [3, 1] ) 
 
rYQ32 = 	 Parameter(name='rYQ32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YQ32}', 
	 lhablock = 'YQ', 
	 lhacode = [3, 2] ) 
 
iYQ32 = 	 Parameter(name='iYQ32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YQ32}', 
	 lhablock = 'IMYQ', 
	 lhacode = [3, 2] ) 
 
rYQ33 = 	 Parameter(name='rYQ33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YQ33}', 
	 lhablock = 'YQ', 
	 lhacode = [3, 3] ) 
 
iYQ33 = 	 Parameter(name='iYQ33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YQ33}', 
	 lhablock = 'IMYQ', 
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
 
rYTL11 = 	 Parameter(name='rYTL11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YTL11}', 
	 lhablock = 'None', 
	 lhacode = [1, 1] ) 
 
iYTL11 = 	 Parameter(name='iYTL11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YTL11}', 
	 lhablock = 'IMNone', 
	 lhacode = [1, 1] ) 
 
rYTL12 = 	 Parameter(name='rYTL12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YTL12}', 
	 lhablock = 'None', 
	 lhacode = [1, 2] ) 
 
iYTL12 = 	 Parameter(name='iYTL12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YTL12}', 
	 lhablock = 'IMNone', 
	 lhacode = [1, 2] ) 
 
rYTL13 = 	 Parameter(name='rYTL13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YTL13}', 
	 lhablock = 'None', 
	 lhacode = [1, 3] ) 
 
iYTL13 = 	 Parameter(name='iYTL13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YTL13}', 
	 lhablock = 'IMNone', 
	 lhacode = [1, 3] ) 
 
rYTL21 = 	 Parameter(name='rYTL21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YTL21}', 
	 lhablock = 'None', 
	 lhacode = [2, 1] ) 
 
iYTL21 = 	 Parameter(name='iYTL21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YTL21}', 
	 lhablock = 'IMNone', 
	 lhacode = [2, 1] ) 
 
rYTL22 = 	 Parameter(name='rYTL22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YTL22}', 
	 lhablock = 'None', 
	 lhacode = [2, 2] ) 
 
iYTL22 = 	 Parameter(name='iYTL22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YTL22}', 
	 lhablock = 'IMNone', 
	 lhacode = [2, 2] ) 
 
rYTL23 = 	 Parameter(name='rYTL23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YTL23}', 
	 lhablock = 'None', 
	 lhacode = [2, 3] ) 
 
iYTL23 = 	 Parameter(name='iYTL23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YTL23}', 
	 lhablock = 'IMNone', 
	 lhacode = [2, 3] ) 
 
rYTL31 = 	 Parameter(name='rYTL31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YTL31}', 
	 lhablock = 'None', 
	 lhacode = [3, 1] ) 
 
iYTL31 = 	 Parameter(name='iYTL31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YTL31}', 
	 lhablock = 'IMNone', 
	 lhacode = [3, 1] ) 
 
rYTL32 = 	 Parameter(name='rYTL32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YTL32}', 
	 lhablock = 'None', 
	 lhacode = [3, 2] ) 
 
iYTL32 = 	 Parameter(name='iYTL32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YTL32}', 
	 lhablock = 'IMNone', 
	 lhacode = [3, 2] ) 
 
rYTL33 = 	 Parameter(name='rYTL33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YTL33}', 
	 lhablock = 'None', 
	 lhacode = [3, 3] ) 
 
iYTL33 = 	 Parameter(name='iYTL33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{YTL33}', 
	 lhablock = 'IMNone', 
	 lhacode = [3, 3] ) 
 
LAM3 = 	 Parameter(name='LAM3', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{LAM3}', 
	 lhablock = 'LRINPUT', 
	 lhacode = [2] ) 
 
LAM4 = 	 Parameter(name='LAM4', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{LAM4}', 
	 lhablock = 'LRINPUT', 
	 lhacode = [3] ) 
 
rLam = 	 Parameter(name='rLam', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Lam}', 
	 lhablock = 'SM', 
	 lhacode = [2] ) 
 
iLam = 	 Parameter(name='iLam', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Lam}', 
	 lhablock = 'IMSM', 
	 lhacode = [2] ) 
 
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
 
rZW11 = 	 Parameter(name='rZW11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZW11}', 
	 lhablock = 'ZWMIX', 
	 lhacode = [1, 1] ) 
 
iZW11 = 	 Parameter(name='iZW11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZW11}', 
	 lhablock = 'IMZWMIX', 
	 lhacode = [1, 1] ) 
 
rZW12 = 	 Parameter(name='rZW12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZW12}', 
	 lhablock = 'ZWMIX', 
	 lhacode = [1, 2] ) 
 
iZW12 = 	 Parameter(name='iZW12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZW12}', 
	 lhablock = 'IMZWMIX', 
	 lhacode = [1, 2] ) 
 
rZW13 = 	 Parameter(name='rZW13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZW13}', 
	 lhablock = 'ZWMIX', 
	 lhacode = [1, 3] ) 
 
iZW13 = 	 Parameter(name='iZW13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZW13}', 
	 lhablock = 'IMZWMIX', 
	 lhacode = [1, 3] ) 
 
rZW14 = 	 Parameter(name='rZW14', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZW14}', 
	 lhablock = 'ZWMIX', 
	 lhacode = [1, 4] ) 
 
iZW14 = 	 Parameter(name='iZW14', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZW14}', 
	 lhablock = 'IMZWMIX', 
	 lhacode = [1, 4] ) 
 
rZW21 = 	 Parameter(name='rZW21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZW21}', 
	 lhablock = 'ZWMIX', 
	 lhacode = [2, 1] ) 
 
iZW21 = 	 Parameter(name='iZW21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZW21}', 
	 lhablock = 'IMZWMIX', 
	 lhacode = [2, 1] ) 
 
rZW22 = 	 Parameter(name='rZW22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZW22}', 
	 lhablock = 'ZWMIX', 
	 lhacode = [2, 2] ) 
 
iZW22 = 	 Parameter(name='iZW22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZW22}', 
	 lhablock = 'IMZWMIX', 
	 lhacode = [2, 2] ) 
 
rZW23 = 	 Parameter(name='rZW23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZW23}', 
	 lhablock = 'ZWMIX', 
	 lhacode = [2, 3] ) 
 
iZW23 = 	 Parameter(name='iZW23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZW23}', 
	 lhablock = 'IMZWMIX', 
	 lhacode = [2, 3] ) 
 
rZW24 = 	 Parameter(name='rZW24', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZW24}', 
	 lhablock = 'ZWMIX', 
	 lhacode = [2, 4] ) 
 
iZW24 = 	 Parameter(name='iZW24', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZW24}', 
	 lhablock = 'IMZWMIX', 
	 lhacode = [2, 4] ) 
 
rZW31 = 	 Parameter(name='rZW31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZW31}', 
	 lhablock = 'ZWMIX', 
	 lhacode = [3, 1] ) 
 
iZW31 = 	 Parameter(name='iZW31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZW31}', 
	 lhablock = 'IMZWMIX', 
	 lhacode = [3, 1] ) 
 
rZW32 = 	 Parameter(name='rZW32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZW32}', 
	 lhablock = 'ZWMIX', 
	 lhacode = [3, 2] ) 
 
iZW32 = 	 Parameter(name='iZW32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZW32}', 
	 lhablock = 'IMZWMIX', 
	 lhacode = [3, 2] ) 
 
rZW33 = 	 Parameter(name='rZW33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZW33}', 
	 lhablock = 'ZWMIX', 
	 lhacode = [3, 3] ) 
 
iZW33 = 	 Parameter(name='iZW33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZW33}', 
	 lhablock = 'IMZWMIX', 
	 lhacode = [3, 3] ) 
 
rZW34 = 	 Parameter(name='rZW34', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZW34}', 
	 lhablock = 'ZWMIX', 
	 lhacode = [3, 4] ) 
 
iZW34 = 	 Parameter(name='iZW34', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZW34}', 
	 lhablock = 'IMZWMIX', 
	 lhacode = [3, 4] ) 
 
rZW41 = 	 Parameter(name='rZW41', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZW41}', 
	 lhablock = 'ZWMIX', 
	 lhacode = [4, 1] ) 
 
iZW41 = 	 Parameter(name='iZW41', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZW41}', 
	 lhablock = 'IMZWMIX', 
	 lhacode = [4, 1] ) 
 
rZW42 = 	 Parameter(name='rZW42', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZW42}', 
	 lhablock = 'ZWMIX', 
	 lhacode = [4, 2] ) 
 
iZW42 = 	 Parameter(name='iZW42', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZW42}', 
	 lhablock = 'IMZWMIX', 
	 lhacode = [4, 2] ) 
 
rZW43 = 	 Parameter(name='rZW43', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZW43}', 
	 lhablock = 'ZWMIX', 
	 lhacode = [4, 3] ) 
 
iZW43 = 	 Parameter(name='iZW43', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZW43}', 
	 lhablock = 'IMZWMIX', 
	 lhacode = [4, 3] ) 
 
rZW44 = 	 Parameter(name='rZW44', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZW44}', 
	 lhablock = 'ZWMIX', 
	 lhacode = [4, 4] ) 
 
iZW44 = 	 Parameter(name='iZW44', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZW44}', 
	 lhablock = 'IMZWMIX', 
	 lhacode = [4, 4] ) 
 
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
 
betaH = 	 Parameter(name='betaH', 
	 nature = 'external', 
	 type = 'real', 
	 value = 1., 
	 texname = '\\text{betaH}', 
	 lhablock = 'HMIX', 
	 lhacode = [10] ) 
 
Gf = 	 Parameter(name='Gf', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0.0000116639, 
	 texname = '\\text{Gf}', 
	 lhablock = 'SMINPUTS', 
	 lhacode = [2] ) 
 
YQ11 = 	 Parameter(name='YQ11', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYQ11 + complex(0,1)*iYQ11', 
	 texname = '\\text{YQ11}' ) 
 
YQ12 = 	 Parameter(name='YQ12', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYQ12 + complex(0,1)*iYQ12', 
	 texname = '\\text{YQ12}' ) 
 
YQ13 = 	 Parameter(name='YQ13', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYQ13 + complex(0,1)*iYQ13', 
	 texname = '\\text{YQ13}' ) 
 
YQ21 = 	 Parameter(name='YQ21', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYQ21 + complex(0,1)*iYQ21', 
	 texname = '\\text{YQ21}' ) 
 
YQ22 = 	 Parameter(name='YQ22', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYQ22 + complex(0,1)*iYQ22', 
	 texname = '\\text{YQ22}' ) 
 
YQ23 = 	 Parameter(name='YQ23', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYQ23 + complex(0,1)*iYQ23', 
	 texname = '\\text{YQ23}' ) 
 
YQ31 = 	 Parameter(name='YQ31', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYQ31 + complex(0,1)*iYQ31', 
	 texname = '\\text{YQ31}' ) 
 
YQ32 = 	 Parameter(name='YQ32', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYQ32 + complex(0,1)*iYQ32', 
	 texname = '\\text{YQ32}' ) 
 
YQ33 = 	 Parameter(name='YQ33', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYQ33 + complex(0,1)*iYQ33', 
	 texname = '\\text{YQ33}' ) 
 
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
 
YTL11 = 	 Parameter(name='YTL11', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYTL11 + complex(0,1)*iYTL11', 
	 texname = '\\text{YTL11}' ) 
 
YTL12 = 	 Parameter(name='YTL12', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYTL12 + complex(0,1)*iYTL12', 
	 texname = '\\text{YTL12}' ) 
 
YTL13 = 	 Parameter(name='YTL13', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYTL13 + complex(0,1)*iYTL13', 
	 texname = '\\text{YTL13}' ) 
 
YTL21 = 	 Parameter(name='YTL21', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYTL21 + complex(0,1)*iYTL21', 
	 texname = '\\text{YTL21}' ) 
 
YTL22 = 	 Parameter(name='YTL22', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYTL22 + complex(0,1)*iYTL22', 
	 texname = '\\text{YTL22}' ) 
 
YTL23 = 	 Parameter(name='YTL23', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYTL23 + complex(0,1)*iYTL23', 
	 texname = '\\text{YTL23}' ) 
 
YTL31 = 	 Parameter(name='YTL31', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYTL31 + complex(0,1)*iYTL31', 
	 texname = '\\text{YTL31}' ) 
 
YTL32 = 	 Parameter(name='YTL32', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYTL32 + complex(0,1)*iYTL32', 
	 texname = '\\text{YTL32}' ) 
 
YTL33 = 	 Parameter(name='YTL33', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYTL33 + complex(0,1)*iYTL33', 
	 texname = '\\text{YTL33}' ) 
 
Lam = 	 Parameter(name='Lam', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rLam + complex(0,1)*iLam', 
	 texname = '\\text{Lam}' ) 
 
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
 
ZW11 = 	 Parameter(name='ZW11', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZW11 + complex(0,1)*iZW11', 
	 texname = '\\text{ZW11}' ) 
 
ZW12 = 	 Parameter(name='ZW12', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZW12 + complex(0,1)*iZW12', 
	 texname = '\\text{ZW12}' ) 
 
ZW13 = 	 Parameter(name='ZW13', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZW13 + complex(0,1)*iZW13', 
	 texname = '\\text{ZW13}' ) 
 
ZW14 = 	 Parameter(name='ZW14', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZW14 + complex(0,1)*iZW14', 
	 texname = '\\text{ZW14}' ) 
 
ZW21 = 	 Parameter(name='ZW21', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZW21 + complex(0,1)*iZW21', 
	 texname = '\\text{ZW21}' ) 
 
ZW22 = 	 Parameter(name='ZW22', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZW22 + complex(0,1)*iZW22', 
	 texname = '\\text{ZW22}' ) 
 
ZW23 = 	 Parameter(name='ZW23', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZW23 + complex(0,1)*iZW23', 
	 texname = '\\text{ZW23}' ) 
 
ZW24 = 	 Parameter(name='ZW24', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZW24 + complex(0,1)*iZW24', 
	 texname = '\\text{ZW24}' ) 
 
ZW31 = 	 Parameter(name='ZW31', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZW31 + complex(0,1)*iZW31', 
	 texname = '\\text{ZW31}' ) 
 
ZW32 = 	 Parameter(name='ZW32', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZW32 + complex(0,1)*iZW32', 
	 texname = '\\text{ZW32}' ) 
 
ZW33 = 	 Parameter(name='ZW33', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZW33 + complex(0,1)*iZW33', 
	 texname = '\\text{ZW33}' ) 
 
ZW34 = 	 Parameter(name='ZW34', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZW34 + complex(0,1)*iZW34', 
	 texname = '\\text{ZW34}' ) 
 
ZW41 = 	 Parameter(name='ZW41', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZW41 + complex(0,1)*iZW41', 
	 texname = '\\text{ZW41}' ) 
 
ZW42 = 	 Parameter(name='ZW42', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZW42 + complex(0,1)*iZW42', 
	 texname = '\\text{ZW42}' ) 
 
ZW43 = 	 Parameter(name='ZW43', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZW43 + complex(0,1)*iZW43', 
	 texname = '\\text{ZW43}' ) 
 
ZW44 = 	 Parameter(name='ZW44', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZW44 + complex(0,1)*iZW44', 
	 texname = '\\text{ZW44}' ) 
 
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
 
G = 	 Parameter(name='G', 
	 nature = 'internal', 
	 type = 'real', 
	 value = '2*cmath.sqrt(aS)*cmath.sqrt(cmath.pi)', 
	 texname = 'G') 
 
v1R = 	 Parameter(name='v1R', 
	 nature = 'internal', 
	 type = 'real', 
	 value = '1.*(2000)', 
	 texname = 'v1R') 
 
el = 	 Parameter(name='el', 
	 nature = 'internal', 
	 type = 'real', 
	 value = '2*cmath.sqrt(1/aEWM1)*cmath.sqrt(cmath.pi)', 
	 texname = 'el') 
 
MWp = 	 Parameter(name='MWp', 
	 nature = 'internal', 
	 type = 'real', 
	 value = 'cmath.sqrt(MZ**2/2. + cmath.sqrt(MZ**4/4. - (MZ**2*cmath.pi)/(cmath.sqrt(2)*aEWM1*Gf)))', 
	 texname = 'MWp') 
 
TW = 	 Parameter(name='TW', 
	 nature = 'internal', 
	 type = 'real', 
	 value = 'cmath.asin(cmath.sqrt(1 - MWp**2/MZ**2))', 
	 texname = 'TW') 
 
g2 = 	 Parameter(name='g2', 
	 nature = 'internal', 
	 type = 'real', 
	 value = 'el*1./cmath.sin(TW)', 
	 texname = 'g2') 
 
v = 	 Parameter(name='v', 
	 nature = 'internal', 
	 type = 'real', 
	 value = '2*cmath.sqrt($Failed**2/g2**2)', 
	 texname = 'v') 
 
vd = 	 Parameter(name='vd', 
	 nature = 'internal', 
	 type = 'real', 
	 value = 'v*cmath.cos(betaH)', 
	 texname = 'vd') 
 
vu = 	 Parameter(name='vu', 
	 nature = 'internal', 
	 type = 'real', 
	 value = 'v*cmath.sin(betaH)', 
	 texname = 'vu') 
 
RXiWp = 	 Parameter(name='RXiWp', 
	 nature = 'internal', 
	 type = 'real', 
	 value = '1.', 
	 texname = 'RXiWp') 
 
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
 

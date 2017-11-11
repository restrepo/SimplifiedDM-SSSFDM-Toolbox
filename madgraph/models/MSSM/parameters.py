# ----------------------------------------------------------------------  
# This model file was automatically created by SARAH version4.9.1 
# SARAH References: arXiv:0806.0538, arXiv:0909.2863, arXiv:1002.0840    
# (c) Florian Staub, 2011  
# ----------------------------------------------------------------------  
# File created at 13:25 on 17.2.2017   
# ----------------------------------------------------------------------  
 
 
from object_library import all_parameters,Parameter 
 
from function_library import complexconjugate,re,im,csc,sec,acsc,asec 
 
ZERO=Parameter(name='ZERO', 
                      nature='internal', 
                      type='real', 
                      value='0.0', 
                      texname='0') 
 
Mgo = 	 Parameter(name = 'Mgo', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{Mgo}', 
	 lhablock = 'MASS', 
	 lhacode = [1000021]) 
 
Wgo = 	 Parameter(name = 'Wgo', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Wgo}', 
	 lhablock = 'DECAY', 
	 lhacode = [1000021]) 
 
MN1 = 	 Parameter(name = 'MN1', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{MN1}', 
	 lhablock = 'MASS', 
	 lhacode = [1000022]) 
 
WN1 = 	 Parameter(name = 'WN1', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{WN1}', 
	 lhablock = 'DECAY', 
	 lhacode = [1000022]) 
 
MN2 = 	 Parameter(name = 'MN2', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{MN2}', 
	 lhablock = 'MASS', 
	 lhacode = [1000023]) 
 
WN2 = 	 Parameter(name = 'WN2', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{WN2}', 
	 lhablock = 'DECAY', 
	 lhacode = [1000023]) 
 
MN3 = 	 Parameter(name = 'MN3', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{MN3}', 
	 lhablock = 'MASS', 
	 lhacode = [1000025]) 
 
WN3 = 	 Parameter(name = 'WN3', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{WN3}', 
	 lhablock = 'DECAY', 
	 lhacode = [1000025]) 
 
MN4 = 	 Parameter(name = 'MN4', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{MN4}', 
	 lhablock = 'MASS', 
	 lhacode = [1000035]) 
 
WN4 = 	 Parameter(name = 'WN4', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{WN4}', 
	 lhablock = 'DECAY', 
	 lhacode = [1000035]) 
 
MC1 = 	 Parameter(name = 'MC1', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{MC1}', 
	 lhablock = 'MASS', 
	 lhacode = [1000024]) 
 
WC1 = 	 Parameter(name = 'WC1', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{WC1}', 
	 lhablock = 'DECAY', 
	 lhacode = [1000024]) 
 
MC2 = 	 Parameter(name = 'MC2', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{MC2}', 
	 lhablock = 'MASS', 
	 lhacode = [1000037]) 
 
WC2 = 	 Parameter(name = 'WC2', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{WC2}', 
	 lhablock = 'DECAY', 
	 lhacode = [1000037]) 
 
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
 
Msd1 = 	 Parameter(name = 'Msd1', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{Msd1}', 
	 lhablock = 'MASS', 
	 lhacode = [1000001]) 
 
Wsd1 = 	 Parameter(name = 'Wsd1', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Wsd1}', 
	 lhablock = 'DECAY', 
	 lhacode = [1000001]) 
 
Msd2 = 	 Parameter(name = 'Msd2', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{Msd2}', 
	 lhablock = 'MASS', 
	 lhacode = [1000003]) 
 
Wsd2 = 	 Parameter(name = 'Wsd2', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Wsd2}', 
	 lhablock = 'DECAY', 
	 lhacode = [1000003]) 
 
Msd3 = 	 Parameter(name = 'Msd3', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{Msd3}', 
	 lhablock = 'MASS', 
	 lhacode = [1000005]) 
 
Wsd3 = 	 Parameter(name = 'Wsd3', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Wsd3}', 
	 lhablock = 'DECAY', 
	 lhacode = [1000005]) 
 
Msd4 = 	 Parameter(name = 'Msd4', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{Msd4}', 
	 lhablock = 'MASS', 
	 lhacode = [2000001]) 
 
Wsd4 = 	 Parameter(name = 'Wsd4', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Wsd4}', 
	 lhablock = 'DECAY', 
	 lhacode = [2000001]) 
 
Msd5 = 	 Parameter(name = 'Msd5', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{Msd5}', 
	 lhablock = 'MASS', 
	 lhacode = [2000003]) 
 
Wsd5 = 	 Parameter(name = 'Wsd5', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Wsd5}', 
	 lhablock = 'DECAY', 
	 lhacode = [2000003]) 
 
Msd6 = 	 Parameter(name = 'Msd6', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{Msd6}', 
	 lhablock = 'MASS', 
	 lhacode = [2000005]) 
 
Wsd6 = 	 Parameter(name = 'Wsd6', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Wsd6}', 
	 lhablock = 'DECAY', 
	 lhacode = [2000005]) 
 
Msv1 = 	 Parameter(name = 'Msv1', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{Msv1}', 
	 lhablock = 'MASS', 
	 lhacode = [1000012]) 
 
Wsv1 = 	 Parameter(name = 'Wsv1', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Wsv1}', 
	 lhablock = 'DECAY', 
	 lhacode = [1000012]) 
 
Msv2 = 	 Parameter(name = 'Msv2', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{Msv2}', 
	 lhablock = 'MASS', 
	 lhacode = [1000014]) 
 
Wsv2 = 	 Parameter(name = 'Wsv2', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Wsv2}', 
	 lhablock = 'DECAY', 
	 lhacode = [1000014]) 
 
Msv3 = 	 Parameter(name = 'Msv3', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{Msv3}', 
	 lhablock = 'MASS', 
	 lhacode = [1000016]) 
 
Wsv3 = 	 Parameter(name = 'Wsv3', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Wsv3}', 
	 lhablock = 'DECAY', 
	 lhacode = [1000016]) 
 
Msu1 = 	 Parameter(name = 'Msu1', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{Msu1}', 
	 lhablock = 'MASS', 
	 lhacode = [1000002]) 
 
Wsu1 = 	 Parameter(name = 'Wsu1', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Wsu1}', 
	 lhablock = 'DECAY', 
	 lhacode = [1000002]) 
 
Msu2 = 	 Parameter(name = 'Msu2', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{Msu2}', 
	 lhablock = 'MASS', 
	 lhacode = [1000004]) 
 
Wsu2 = 	 Parameter(name = 'Wsu2', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Wsu2}', 
	 lhablock = 'DECAY', 
	 lhacode = [1000004]) 
 
Msu3 = 	 Parameter(name = 'Msu3', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{Msu3}', 
	 lhablock = 'MASS', 
	 lhacode = [1000006]) 
 
Wsu3 = 	 Parameter(name = 'Wsu3', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Wsu3}', 
	 lhablock = 'DECAY', 
	 lhacode = [1000006]) 
 
Msu4 = 	 Parameter(name = 'Msu4', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{Msu4}', 
	 lhablock = 'MASS', 
	 lhacode = [2000002]) 
 
Wsu4 = 	 Parameter(name = 'Wsu4', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Wsu4}', 
	 lhablock = 'DECAY', 
	 lhacode = [2000002]) 
 
Msu5 = 	 Parameter(name = 'Msu5', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{Msu5}', 
	 lhablock = 'MASS', 
	 lhacode = [2000004]) 
 
Wsu5 = 	 Parameter(name = 'Wsu5', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Wsu5}', 
	 lhablock = 'DECAY', 
	 lhacode = [2000004]) 
 
Msu6 = 	 Parameter(name = 'Msu6', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{Msu6}', 
	 lhablock = 'MASS', 
	 lhacode = [2000006]) 
 
Wsu6 = 	 Parameter(name = 'Wsu6', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Wsu6}', 
	 lhablock = 'DECAY', 
	 lhacode = [2000006]) 
 
Mse1 = 	 Parameter(name = 'Mse1', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{Mse1}', 
	 lhablock = 'MASS', 
	 lhacode = [1000011]) 
 
Wse1 = 	 Parameter(name = 'Wse1', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Wse1}', 
	 lhablock = 'DECAY', 
	 lhacode = [1000011]) 
 
Mse2 = 	 Parameter(name = 'Mse2', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{Mse2}', 
	 lhablock = 'MASS', 
	 lhacode = [1000013]) 
 
Wse2 = 	 Parameter(name = 'Wse2', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Wse2}', 
	 lhablock = 'DECAY', 
	 lhacode = [1000013]) 
 
Mse3 = 	 Parameter(name = 'Mse3', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{Mse3}', 
	 lhablock = 'MASS', 
	 lhacode = [1000015]) 
 
Wse3 = 	 Parameter(name = 'Wse3', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Wse3}', 
	 lhablock = 'DECAY', 
	 lhacode = [1000015]) 
 
Mse4 = 	 Parameter(name = 'Mse4', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{Mse4}', 
	 lhablock = 'MASS', 
	 lhacode = [2000011]) 
 
Wse4 = 	 Parameter(name = 'Wse4', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Wse4}', 
	 lhablock = 'DECAY', 
	 lhacode = [2000011]) 
 
Mse5 = 	 Parameter(name = 'Mse5', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{Mse5}', 
	 lhablock = 'MASS', 
	 lhacode = [2000013]) 
 
Wse5 = 	 Parameter(name = 'Wse5', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Wse5}', 
	 lhablock = 'DECAY', 
	 lhacode = [2000013]) 
 
Mse6 = 	 Parameter(name = 'Mse6', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{Mse6}', 
	 lhablock = 'MASS', 
	 lhacode = [2000015]) 
 
Wse6 = 	 Parameter(name = 'Wse6', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Wse6}', 
	 lhablock = 'DECAY', 
	 lhacode = [2000015]) 
 
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
 
MAh2 = 	 Parameter(name = 'MAh2', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{MAh2}', 
	 lhablock = 'MASS', 
	 lhacode = [36]) 
 
WAh2 = 	 Parameter(name = 'WAh2', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{WAh2}', 
	 lhablock = 'DECAY', 
	 lhacode = [36]) 
 
MHm2 = 	 Parameter(name = 'MHm2', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{MHm2}', 
	 lhablock = 'MASS', 
	 lhacode = [37]) 
 
WHm2 = 	 Parameter(name = 'WHm2', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{WHm2}', 
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
 
WWm = 	 Parameter(name = 'WWm', 
	 nature = 'external', 
	 type = 'real', 
	 value = 2.141, 
	 texname = '\\text{WWm}', 
	 lhablock = 'DECAY', 
	 lhacode = [24]) 
 
rMu = 	 Parameter(name='rMu', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Mu}', 
	 lhablock = 'HMIX', 
	 lhacode = [1] ) 
 
iMu = 	 Parameter(name='iMu', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Mu}', 
	 lhablock = 'IMHMIX', 
	 lhacode = [1] ) 
 
rYd11 = 	 Parameter(name='rYd11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yd11}', 
	 lhablock = 'YD', 
	 lhacode = [1, 1] ) 
 
iYd11 = 	 Parameter(name='iYd11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yd11}', 
	 lhablock = 'IMYD', 
	 lhacode = [1, 1] ) 
 
rYd12 = 	 Parameter(name='rYd12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yd12}', 
	 lhablock = 'YD', 
	 lhacode = [1, 2] ) 
 
iYd12 = 	 Parameter(name='iYd12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yd12}', 
	 lhablock = 'IMYD', 
	 lhacode = [1, 2] ) 
 
rYd13 = 	 Parameter(name='rYd13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yd13}', 
	 lhablock = 'YD', 
	 lhacode = [1, 3] ) 
 
iYd13 = 	 Parameter(name='iYd13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yd13}', 
	 lhablock = 'IMYD', 
	 lhacode = [1, 3] ) 
 
rYd21 = 	 Parameter(name='rYd21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yd21}', 
	 lhablock = 'YD', 
	 lhacode = [2, 1] ) 
 
iYd21 = 	 Parameter(name='iYd21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yd21}', 
	 lhablock = 'IMYD', 
	 lhacode = [2, 1] ) 
 
rYd22 = 	 Parameter(name='rYd22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yd22}', 
	 lhablock = 'YD', 
	 lhacode = [2, 2] ) 
 
iYd22 = 	 Parameter(name='iYd22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yd22}', 
	 lhablock = 'IMYD', 
	 lhacode = [2, 2] ) 
 
rYd23 = 	 Parameter(name='rYd23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yd23}', 
	 lhablock = 'YD', 
	 lhacode = [2, 3] ) 
 
iYd23 = 	 Parameter(name='iYd23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yd23}', 
	 lhablock = 'IMYD', 
	 lhacode = [2, 3] ) 
 
rYd31 = 	 Parameter(name='rYd31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yd31}', 
	 lhablock = 'YD', 
	 lhacode = [3, 1] ) 
 
iYd31 = 	 Parameter(name='iYd31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yd31}', 
	 lhablock = 'IMYD', 
	 lhacode = [3, 1] ) 
 
rYd32 = 	 Parameter(name='rYd32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yd32}', 
	 lhablock = 'YD', 
	 lhacode = [3, 2] ) 
 
iYd32 = 	 Parameter(name='iYd32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yd32}', 
	 lhablock = 'IMYD', 
	 lhacode = [3, 2] ) 
 
rYd33 = 	 Parameter(name='rYd33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yd33}', 
	 lhablock = 'YD', 
	 lhacode = [3, 3] ) 
 
iYd33 = 	 Parameter(name='iYd33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yd33}', 
	 lhablock = 'IMYD', 
	 lhacode = [3, 3] ) 
 
rTd11 = 	 Parameter(name='rTd11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Td11}', 
	 lhablock = 'TD', 
	 lhacode = [1, 1] ) 
 
iTd11 = 	 Parameter(name='iTd11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Td11}', 
	 lhablock = 'IMTD', 
	 lhacode = [1, 1] ) 
 
rTd12 = 	 Parameter(name='rTd12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Td12}', 
	 lhablock = 'TD', 
	 lhacode = [1, 2] ) 
 
iTd12 = 	 Parameter(name='iTd12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Td12}', 
	 lhablock = 'IMTD', 
	 lhacode = [1, 2] ) 
 
rTd13 = 	 Parameter(name='rTd13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Td13}', 
	 lhablock = 'TD', 
	 lhacode = [1, 3] ) 
 
iTd13 = 	 Parameter(name='iTd13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Td13}', 
	 lhablock = 'IMTD', 
	 lhacode = [1, 3] ) 
 
rTd21 = 	 Parameter(name='rTd21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Td21}', 
	 lhablock = 'TD', 
	 lhacode = [2, 1] ) 
 
iTd21 = 	 Parameter(name='iTd21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Td21}', 
	 lhablock = 'IMTD', 
	 lhacode = [2, 1] ) 
 
rTd22 = 	 Parameter(name='rTd22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Td22}', 
	 lhablock = 'TD', 
	 lhacode = [2, 2] ) 
 
iTd22 = 	 Parameter(name='iTd22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Td22}', 
	 lhablock = 'IMTD', 
	 lhacode = [2, 2] ) 
 
rTd23 = 	 Parameter(name='rTd23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Td23}', 
	 lhablock = 'TD', 
	 lhacode = [2, 3] ) 
 
iTd23 = 	 Parameter(name='iTd23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Td23}', 
	 lhablock = 'IMTD', 
	 lhacode = [2, 3] ) 
 
rTd31 = 	 Parameter(name='rTd31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Td31}', 
	 lhablock = 'TD', 
	 lhacode = [3, 1] ) 
 
iTd31 = 	 Parameter(name='iTd31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Td31}', 
	 lhablock = 'IMTD', 
	 lhacode = [3, 1] ) 
 
rTd32 = 	 Parameter(name='rTd32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Td32}', 
	 lhablock = 'TD', 
	 lhacode = [3, 2] ) 
 
iTd32 = 	 Parameter(name='iTd32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Td32}', 
	 lhablock = 'IMTD', 
	 lhacode = [3, 2] ) 
 
rTd33 = 	 Parameter(name='rTd33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Td33}', 
	 lhablock = 'TD', 
	 lhacode = [3, 3] ) 
 
iTd33 = 	 Parameter(name='iTd33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Td33}', 
	 lhablock = 'IMTD', 
	 lhacode = [3, 3] ) 
 
rYe11 = 	 Parameter(name='rYe11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Ye11}', 
	 lhablock = 'YE', 
	 lhacode = [1, 1] ) 
 
iYe11 = 	 Parameter(name='iYe11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Ye11}', 
	 lhablock = 'IMYE', 
	 lhacode = [1, 1] ) 
 
rYe12 = 	 Parameter(name='rYe12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Ye12}', 
	 lhablock = 'YE', 
	 lhacode = [1, 2] ) 
 
iYe12 = 	 Parameter(name='iYe12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Ye12}', 
	 lhablock = 'IMYE', 
	 lhacode = [1, 2] ) 
 
rYe13 = 	 Parameter(name='rYe13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Ye13}', 
	 lhablock = 'YE', 
	 lhacode = [1, 3] ) 
 
iYe13 = 	 Parameter(name='iYe13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Ye13}', 
	 lhablock = 'IMYE', 
	 lhacode = [1, 3] ) 
 
rYe21 = 	 Parameter(name='rYe21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Ye21}', 
	 lhablock = 'YE', 
	 lhacode = [2, 1] ) 
 
iYe21 = 	 Parameter(name='iYe21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Ye21}', 
	 lhablock = 'IMYE', 
	 lhacode = [2, 1] ) 
 
rYe22 = 	 Parameter(name='rYe22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Ye22}', 
	 lhablock = 'YE', 
	 lhacode = [2, 2] ) 
 
iYe22 = 	 Parameter(name='iYe22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Ye22}', 
	 lhablock = 'IMYE', 
	 lhacode = [2, 2] ) 
 
rYe23 = 	 Parameter(name='rYe23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Ye23}', 
	 lhablock = 'YE', 
	 lhacode = [2, 3] ) 
 
iYe23 = 	 Parameter(name='iYe23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Ye23}', 
	 lhablock = 'IMYE', 
	 lhacode = [2, 3] ) 
 
rYe31 = 	 Parameter(name='rYe31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Ye31}', 
	 lhablock = 'YE', 
	 lhacode = [3, 1] ) 
 
iYe31 = 	 Parameter(name='iYe31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Ye31}', 
	 lhablock = 'IMYE', 
	 lhacode = [3, 1] ) 
 
rYe32 = 	 Parameter(name='rYe32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Ye32}', 
	 lhablock = 'YE', 
	 lhacode = [3, 2] ) 
 
iYe32 = 	 Parameter(name='iYe32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Ye32}', 
	 lhablock = 'IMYE', 
	 lhacode = [3, 2] ) 
 
rYe33 = 	 Parameter(name='rYe33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Ye33}', 
	 lhablock = 'YE', 
	 lhacode = [3, 3] ) 
 
iYe33 = 	 Parameter(name='iYe33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Ye33}', 
	 lhablock = 'IMYE', 
	 lhacode = [3, 3] ) 
 
rTe11 = 	 Parameter(name='rTe11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Te11}', 
	 lhablock = 'TE', 
	 lhacode = [1, 1] ) 
 
iTe11 = 	 Parameter(name='iTe11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Te11}', 
	 lhablock = 'IMTE', 
	 lhacode = [1, 1] ) 
 
rTe12 = 	 Parameter(name='rTe12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Te12}', 
	 lhablock = 'TE', 
	 lhacode = [1, 2] ) 
 
iTe12 = 	 Parameter(name='iTe12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Te12}', 
	 lhablock = 'IMTE', 
	 lhacode = [1, 2] ) 
 
rTe13 = 	 Parameter(name='rTe13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Te13}', 
	 lhablock = 'TE', 
	 lhacode = [1, 3] ) 
 
iTe13 = 	 Parameter(name='iTe13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Te13}', 
	 lhablock = 'IMTE', 
	 lhacode = [1, 3] ) 
 
rTe21 = 	 Parameter(name='rTe21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Te21}', 
	 lhablock = 'TE', 
	 lhacode = [2, 1] ) 
 
iTe21 = 	 Parameter(name='iTe21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Te21}', 
	 lhablock = 'IMTE', 
	 lhacode = [2, 1] ) 
 
rTe22 = 	 Parameter(name='rTe22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Te22}', 
	 lhablock = 'TE', 
	 lhacode = [2, 2] ) 
 
iTe22 = 	 Parameter(name='iTe22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Te22}', 
	 lhablock = 'IMTE', 
	 lhacode = [2, 2] ) 
 
rTe23 = 	 Parameter(name='rTe23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Te23}', 
	 lhablock = 'TE', 
	 lhacode = [2, 3] ) 
 
iTe23 = 	 Parameter(name='iTe23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Te23}', 
	 lhablock = 'IMTE', 
	 lhacode = [2, 3] ) 
 
rTe31 = 	 Parameter(name='rTe31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Te31}', 
	 lhablock = 'TE', 
	 lhacode = [3, 1] ) 
 
iTe31 = 	 Parameter(name='iTe31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Te31}', 
	 lhablock = 'IMTE', 
	 lhacode = [3, 1] ) 
 
rTe32 = 	 Parameter(name='rTe32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Te32}', 
	 lhablock = 'TE', 
	 lhacode = [3, 2] ) 
 
iTe32 = 	 Parameter(name='iTe32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Te32}', 
	 lhablock = 'IMTE', 
	 lhacode = [3, 2] ) 
 
rTe33 = 	 Parameter(name='rTe33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Te33}', 
	 lhablock = 'TE', 
	 lhacode = [3, 3] ) 
 
iTe33 = 	 Parameter(name='iTe33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Te33}', 
	 lhablock = 'IMTE', 
	 lhacode = [3, 3] ) 
 
rYu11 = 	 Parameter(name='rYu11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yu11}', 
	 lhablock = 'YU', 
	 lhacode = [1, 1] ) 
 
iYu11 = 	 Parameter(name='iYu11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yu11}', 
	 lhablock = 'IMYU', 
	 lhacode = [1, 1] ) 
 
rYu12 = 	 Parameter(name='rYu12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yu12}', 
	 lhablock = 'YU', 
	 lhacode = [1, 2] ) 
 
iYu12 = 	 Parameter(name='iYu12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yu12}', 
	 lhablock = 'IMYU', 
	 lhacode = [1, 2] ) 
 
rYu13 = 	 Parameter(name='rYu13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yu13}', 
	 lhablock = 'YU', 
	 lhacode = [1, 3] ) 
 
iYu13 = 	 Parameter(name='iYu13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yu13}', 
	 lhablock = 'IMYU', 
	 lhacode = [1, 3] ) 
 
rYu21 = 	 Parameter(name='rYu21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yu21}', 
	 lhablock = 'YU', 
	 lhacode = [2, 1] ) 
 
iYu21 = 	 Parameter(name='iYu21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yu21}', 
	 lhablock = 'IMYU', 
	 lhacode = [2, 1] ) 
 
rYu22 = 	 Parameter(name='rYu22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yu22}', 
	 lhablock = 'YU', 
	 lhacode = [2, 2] ) 
 
iYu22 = 	 Parameter(name='iYu22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yu22}', 
	 lhablock = 'IMYU', 
	 lhacode = [2, 2] ) 
 
rYu23 = 	 Parameter(name='rYu23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yu23}', 
	 lhablock = 'YU', 
	 lhacode = [2, 3] ) 
 
iYu23 = 	 Parameter(name='iYu23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yu23}', 
	 lhablock = 'IMYU', 
	 lhacode = [2, 3] ) 
 
rYu31 = 	 Parameter(name='rYu31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yu31}', 
	 lhablock = 'YU', 
	 lhacode = [3, 1] ) 
 
iYu31 = 	 Parameter(name='iYu31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yu31}', 
	 lhablock = 'IMYU', 
	 lhacode = [3, 1] ) 
 
rYu32 = 	 Parameter(name='rYu32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yu32}', 
	 lhablock = 'YU', 
	 lhacode = [3, 2] ) 
 
iYu32 = 	 Parameter(name='iYu32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yu32}', 
	 lhablock = 'IMYU', 
	 lhacode = [3, 2] ) 
 
rYu33 = 	 Parameter(name='rYu33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yu33}', 
	 lhablock = 'YU', 
	 lhacode = [3, 3] ) 
 
iYu33 = 	 Parameter(name='iYu33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yu33}', 
	 lhablock = 'IMYU', 
	 lhacode = [3, 3] ) 
 
rTu11 = 	 Parameter(name='rTu11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Tu11}', 
	 lhablock = 'TU', 
	 lhacode = [1, 1] ) 
 
iTu11 = 	 Parameter(name='iTu11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Tu11}', 
	 lhablock = 'IMTU', 
	 lhacode = [1, 1] ) 
 
rTu12 = 	 Parameter(name='rTu12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Tu12}', 
	 lhablock = 'TU', 
	 lhacode = [1, 2] ) 
 
iTu12 = 	 Parameter(name='iTu12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Tu12}', 
	 lhablock = 'IMTU', 
	 lhacode = [1, 2] ) 
 
rTu13 = 	 Parameter(name='rTu13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Tu13}', 
	 lhablock = 'TU', 
	 lhacode = [1, 3] ) 
 
iTu13 = 	 Parameter(name='iTu13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Tu13}', 
	 lhablock = 'IMTU', 
	 lhacode = [1, 3] ) 
 
rTu21 = 	 Parameter(name='rTu21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Tu21}', 
	 lhablock = 'TU', 
	 lhacode = [2, 1] ) 
 
iTu21 = 	 Parameter(name='iTu21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Tu21}', 
	 lhablock = 'IMTU', 
	 lhacode = [2, 1] ) 
 
rTu22 = 	 Parameter(name='rTu22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Tu22}', 
	 lhablock = 'TU', 
	 lhacode = [2, 2] ) 
 
iTu22 = 	 Parameter(name='iTu22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Tu22}', 
	 lhablock = 'IMTU', 
	 lhacode = [2, 2] ) 
 
rTu23 = 	 Parameter(name='rTu23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Tu23}', 
	 lhablock = 'TU', 
	 lhacode = [2, 3] ) 
 
iTu23 = 	 Parameter(name='iTu23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Tu23}', 
	 lhablock = 'IMTU', 
	 lhacode = [2, 3] ) 
 
rTu31 = 	 Parameter(name='rTu31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Tu31}', 
	 lhablock = 'TU', 
	 lhacode = [3, 1] ) 
 
iTu31 = 	 Parameter(name='iTu31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Tu31}', 
	 lhablock = 'IMTU', 
	 lhacode = [3, 1] ) 
 
rTu32 = 	 Parameter(name='rTu32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Tu32}', 
	 lhablock = 'TU', 
	 lhacode = [3, 2] ) 
 
iTu32 = 	 Parameter(name='iTu32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Tu32}', 
	 lhablock = 'IMTU', 
	 lhacode = [3, 2] ) 
 
rTu33 = 	 Parameter(name='rTu33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Tu33}', 
	 lhablock = 'TU', 
	 lhacode = [3, 3] ) 
 
iTu33 = 	 Parameter(name='iTu33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Tu33}', 
	 lhablock = 'IMTU', 
	 lhacode = [3, 3] ) 
 
rpG = 	 Parameter(name='rpG', 
	 nature = 'external', 
	 type = 'real', 
	 value = 1., 
	 texname = '\\text{pG}', 
	 lhablock = 'PHASES', 
	 lhacode = [1] ) 
 
ipG = 	 Parameter(name='ipG', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{pG}', 
	 lhablock = 'IMPHASES', 
	 lhacode = [1] ) 
 
rZD11 = 	 Parameter(name='rZD11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD11}', 
	 lhablock = 'DSQMIX', 
	 lhacode = [1, 1] ) 
 
iZD11 = 	 Parameter(name='iZD11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD11}', 
	 lhablock = 'IMDSQMIX', 
	 lhacode = [1, 1] ) 
 
rZD12 = 	 Parameter(name='rZD12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD12}', 
	 lhablock = 'DSQMIX', 
	 lhacode = [1, 2] ) 
 
iZD12 = 	 Parameter(name='iZD12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD12}', 
	 lhablock = 'IMDSQMIX', 
	 lhacode = [1, 2] ) 
 
rZD13 = 	 Parameter(name='rZD13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD13}', 
	 lhablock = 'DSQMIX', 
	 lhacode = [1, 3] ) 
 
iZD13 = 	 Parameter(name='iZD13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD13}', 
	 lhablock = 'IMDSQMIX', 
	 lhacode = [1, 3] ) 
 
rZD14 = 	 Parameter(name='rZD14', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD14}', 
	 lhablock = 'DSQMIX', 
	 lhacode = [1, 4] ) 
 
iZD14 = 	 Parameter(name='iZD14', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD14}', 
	 lhablock = 'IMDSQMIX', 
	 lhacode = [1, 4] ) 
 
rZD15 = 	 Parameter(name='rZD15', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD15}', 
	 lhablock = 'DSQMIX', 
	 lhacode = [1, 5] ) 
 
iZD15 = 	 Parameter(name='iZD15', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD15}', 
	 lhablock = 'IMDSQMIX', 
	 lhacode = [1, 5] ) 
 
rZD16 = 	 Parameter(name='rZD16', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD16}', 
	 lhablock = 'DSQMIX', 
	 lhacode = [1, 6] ) 
 
iZD16 = 	 Parameter(name='iZD16', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD16}', 
	 lhablock = 'IMDSQMIX', 
	 lhacode = [1, 6] ) 
 
rZD21 = 	 Parameter(name='rZD21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD21}', 
	 lhablock = 'DSQMIX', 
	 lhacode = [2, 1] ) 
 
iZD21 = 	 Parameter(name='iZD21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD21}', 
	 lhablock = 'IMDSQMIX', 
	 lhacode = [2, 1] ) 
 
rZD22 = 	 Parameter(name='rZD22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD22}', 
	 lhablock = 'DSQMIX', 
	 lhacode = [2, 2] ) 
 
iZD22 = 	 Parameter(name='iZD22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD22}', 
	 lhablock = 'IMDSQMIX', 
	 lhacode = [2, 2] ) 
 
rZD23 = 	 Parameter(name='rZD23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD23}', 
	 lhablock = 'DSQMIX', 
	 lhacode = [2, 3] ) 
 
iZD23 = 	 Parameter(name='iZD23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD23}', 
	 lhablock = 'IMDSQMIX', 
	 lhacode = [2, 3] ) 
 
rZD24 = 	 Parameter(name='rZD24', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD24}', 
	 lhablock = 'DSQMIX', 
	 lhacode = [2, 4] ) 
 
iZD24 = 	 Parameter(name='iZD24', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD24}', 
	 lhablock = 'IMDSQMIX', 
	 lhacode = [2, 4] ) 
 
rZD25 = 	 Parameter(name='rZD25', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD25}', 
	 lhablock = 'DSQMIX', 
	 lhacode = [2, 5] ) 
 
iZD25 = 	 Parameter(name='iZD25', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD25}', 
	 lhablock = 'IMDSQMIX', 
	 lhacode = [2, 5] ) 
 
rZD26 = 	 Parameter(name='rZD26', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD26}', 
	 lhablock = 'DSQMIX', 
	 lhacode = [2, 6] ) 
 
iZD26 = 	 Parameter(name='iZD26', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD26}', 
	 lhablock = 'IMDSQMIX', 
	 lhacode = [2, 6] ) 
 
rZD31 = 	 Parameter(name='rZD31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD31}', 
	 lhablock = 'DSQMIX', 
	 lhacode = [3, 1] ) 
 
iZD31 = 	 Parameter(name='iZD31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD31}', 
	 lhablock = 'IMDSQMIX', 
	 lhacode = [3, 1] ) 
 
rZD32 = 	 Parameter(name='rZD32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD32}', 
	 lhablock = 'DSQMIX', 
	 lhacode = [3, 2] ) 
 
iZD32 = 	 Parameter(name='iZD32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD32}', 
	 lhablock = 'IMDSQMIX', 
	 lhacode = [3, 2] ) 
 
rZD33 = 	 Parameter(name='rZD33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD33}', 
	 lhablock = 'DSQMIX', 
	 lhacode = [3, 3] ) 
 
iZD33 = 	 Parameter(name='iZD33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD33}', 
	 lhablock = 'IMDSQMIX', 
	 lhacode = [3, 3] ) 
 
rZD34 = 	 Parameter(name='rZD34', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD34}', 
	 lhablock = 'DSQMIX', 
	 lhacode = [3, 4] ) 
 
iZD34 = 	 Parameter(name='iZD34', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD34}', 
	 lhablock = 'IMDSQMIX', 
	 lhacode = [3, 4] ) 
 
rZD35 = 	 Parameter(name='rZD35', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD35}', 
	 lhablock = 'DSQMIX', 
	 lhacode = [3, 5] ) 
 
iZD35 = 	 Parameter(name='iZD35', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD35}', 
	 lhablock = 'IMDSQMIX', 
	 lhacode = [3, 5] ) 
 
rZD36 = 	 Parameter(name='rZD36', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD36}', 
	 lhablock = 'DSQMIX', 
	 lhacode = [3, 6] ) 
 
iZD36 = 	 Parameter(name='iZD36', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD36}', 
	 lhablock = 'IMDSQMIX', 
	 lhacode = [3, 6] ) 
 
rZD41 = 	 Parameter(name='rZD41', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD41}', 
	 lhablock = 'DSQMIX', 
	 lhacode = [4, 1] ) 
 
iZD41 = 	 Parameter(name='iZD41', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD41}', 
	 lhablock = 'IMDSQMIX', 
	 lhacode = [4, 1] ) 
 
rZD42 = 	 Parameter(name='rZD42', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD42}', 
	 lhablock = 'DSQMIX', 
	 lhacode = [4, 2] ) 
 
iZD42 = 	 Parameter(name='iZD42', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD42}', 
	 lhablock = 'IMDSQMIX', 
	 lhacode = [4, 2] ) 
 
rZD43 = 	 Parameter(name='rZD43', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD43}', 
	 lhablock = 'DSQMIX', 
	 lhacode = [4, 3] ) 
 
iZD43 = 	 Parameter(name='iZD43', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD43}', 
	 lhablock = 'IMDSQMIX', 
	 lhacode = [4, 3] ) 
 
rZD44 = 	 Parameter(name='rZD44', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD44}', 
	 lhablock = 'DSQMIX', 
	 lhacode = [4, 4] ) 
 
iZD44 = 	 Parameter(name='iZD44', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD44}', 
	 lhablock = 'IMDSQMIX', 
	 lhacode = [4, 4] ) 
 
rZD45 = 	 Parameter(name='rZD45', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD45}', 
	 lhablock = 'DSQMIX', 
	 lhacode = [4, 5] ) 
 
iZD45 = 	 Parameter(name='iZD45', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD45}', 
	 lhablock = 'IMDSQMIX', 
	 lhacode = [4, 5] ) 
 
rZD46 = 	 Parameter(name='rZD46', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD46}', 
	 lhablock = 'DSQMIX', 
	 lhacode = [4, 6] ) 
 
iZD46 = 	 Parameter(name='iZD46', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD46}', 
	 lhablock = 'IMDSQMIX', 
	 lhacode = [4, 6] ) 
 
rZD51 = 	 Parameter(name='rZD51', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD51}', 
	 lhablock = 'DSQMIX', 
	 lhacode = [5, 1] ) 
 
iZD51 = 	 Parameter(name='iZD51', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD51}', 
	 lhablock = 'IMDSQMIX', 
	 lhacode = [5, 1] ) 
 
rZD52 = 	 Parameter(name='rZD52', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD52}', 
	 lhablock = 'DSQMIX', 
	 lhacode = [5, 2] ) 
 
iZD52 = 	 Parameter(name='iZD52', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD52}', 
	 lhablock = 'IMDSQMIX', 
	 lhacode = [5, 2] ) 
 
rZD53 = 	 Parameter(name='rZD53', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD53}', 
	 lhablock = 'DSQMIX', 
	 lhacode = [5, 3] ) 
 
iZD53 = 	 Parameter(name='iZD53', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD53}', 
	 lhablock = 'IMDSQMIX', 
	 lhacode = [5, 3] ) 
 
rZD54 = 	 Parameter(name='rZD54', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD54}', 
	 lhablock = 'DSQMIX', 
	 lhacode = [5, 4] ) 
 
iZD54 = 	 Parameter(name='iZD54', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD54}', 
	 lhablock = 'IMDSQMIX', 
	 lhacode = [5, 4] ) 
 
rZD55 = 	 Parameter(name='rZD55', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD55}', 
	 lhablock = 'DSQMIX', 
	 lhacode = [5, 5] ) 
 
iZD55 = 	 Parameter(name='iZD55', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD55}', 
	 lhablock = 'IMDSQMIX', 
	 lhacode = [5, 5] ) 
 
rZD56 = 	 Parameter(name='rZD56', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD56}', 
	 lhablock = 'DSQMIX', 
	 lhacode = [5, 6] ) 
 
iZD56 = 	 Parameter(name='iZD56', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD56}', 
	 lhablock = 'IMDSQMIX', 
	 lhacode = [5, 6] ) 
 
rZD61 = 	 Parameter(name='rZD61', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD61}', 
	 lhablock = 'DSQMIX', 
	 lhacode = [6, 1] ) 
 
iZD61 = 	 Parameter(name='iZD61', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD61}', 
	 lhablock = 'IMDSQMIX', 
	 lhacode = [6, 1] ) 
 
rZD62 = 	 Parameter(name='rZD62', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD62}', 
	 lhablock = 'DSQMIX', 
	 lhacode = [6, 2] ) 
 
iZD62 = 	 Parameter(name='iZD62', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD62}', 
	 lhablock = 'IMDSQMIX', 
	 lhacode = [6, 2] ) 
 
rZD63 = 	 Parameter(name='rZD63', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD63}', 
	 lhablock = 'DSQMIX', 
	 lhacode = [6, 3] ) 
 
iZD63 = 	 Parameter(name='iZD63', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD63}', 
	 lhablock = 'IMDSQMIX', 
	 lhacode = [6, 3] ) 
 
rZD64 = 	 Parameter(name='rZD64', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD64}', 
	 lhablock = 'DSQMIX', 
	 lhacode = [6, 4] ) 
 
iZD64 = 	 Parameter(name='iZD64', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD64}', 
	 lhablock = 'IMDSQMIX', 
	 lhacode = [6, 4] ) 
 
rZD65 = 	 Parameter(name='rZD65', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD65}', 
	 lhablock = 'DSQMIX', 
	 lhacode = [6, 5] ) 
 
iZD65 = 	 Parameter(name='iZD65', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD65}', 
	 lhablock = 'IMDSQMIX', 
	 lhacode = [6, 5] ) 
 
rZD66 = 	 Parameter(name='rZD66', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD66}', 
	 lhablock = 'DSQMIX', 
	 lhacode = [6, 6] ) 
 
iZD66 = 	 Parameter(name='iZD66', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD66}', 
	 lhablock = 'IMDSQMIX', 
	 lhacode = [6, 6] ) 
 
rZV11 = 	 Parameter(name='rZV11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZV11}', 
	 lhablock = 'SNUMIX', 
	 lhacode = [1, 1] ) 
 
iZV11 = 	 Parameter(name='iZV11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZV11}', 
	 lhablock = 'IMSNUMIX', 
	 lhacode = [1, 1] ) 
 
rZV12 = 	 Parameter(name='rZV12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZV12}', 
	 lhablock = 'SNUMIX', 
	 lhacode = [1, 2] ) 
 
iZV12 = 	 Parameter(name='iZV12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZV12}', 
	 lhablock = 'IMSNUMIX', 
	 lhacode = [1, 2] ) 
 
rZV13 = 	 Parameter(name='rZV13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZV13}', 
	 lhablock = 'SNUMIX', 
	 lhacode = [1, 3] ) 
 
iZV13 = 	 Parameter(name='iZV13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZV13}', 
	 lhablock = 'IMSNUMIX', 
	 lhacode = [1, 3] ) 
 
rZV21 = 	 Parameter(name='rZV21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZV21}', 
	 lhablock = 'SNUMIX', 
	 lhacode = [2, 1] ) 
 
iZV21 = 	 Parameter(name='iZV21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZV21}', 
	 lhablock = 'IMSNUMIX', 
	 lhacode = [2, 1] ) 
 
rZV22 = 	 Parameter(name='rZV22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZV22}', 
	 lhablock = 'SNUMIX', 
	 lhacode = [2, 2] ) 
 
iZV22 = 	 Parameter(name='iZV22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZV22}', 
	 lhablock = 'IMSNUMIX', 
	 lhacode = [2, 2] ) 
 
rZV23 = 	 Parameter(name='rZV23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZV23}', 
	 lhablock = 'SNUMIX', 
	 lhacode = [2, 3] ) 
 
iZV23 = 	 Parameter(name='iZV23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZV23}', 
	 lhablock = 'IMSNUMIX', 
	 lhacode = [2, 3] ) 
 
rZV31 = 	 Parameter(name='rZV31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZV31}', 
	 lhablock = 'SNUMIX', 
	 lhacode = [3, 1] ) 
 
iZV31 = 	 Parameter(name='iZV31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZV31}', 
	 lhablock = 'IMSNUMIX', 
	 lhacode = [3, 1] ) 
 
rZV32 = 	 Parameter(name='rZV32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZV32}', 
	 lhablock = 'SNUMIX', 
	 lhacode = [3, 2] ) 
 
iZV32 = 	 Parameter(name='iZV32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZV32}', 
	 lhablock = 'IMSNUMIX', 
	 lhacode = [3, 2] ) 
 
rZV33 = 	 Parameter(name='rZV33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZV33}', 
	 lhablock = 'SNUMIX', 
	 lhacode = [3, 3] ) 
 
iZV33 = 	 Parameter(name='iZV33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZV33}', 
	 lhablock = 'IMSNUMIX', 
	 lhacode = [3, 3] ) 
 
rZU11 = 	 Parameter(name='rZU11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU11}', 
	 lhablock = 'USQMIX', 
	 lhacode = [1, 1] ) 
 
iZU11 = 	 Parameter(name='iZU11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU11}', 
	 lhablock = 'IMUSQMIX', 
	 lhacode = [1, 1] ) 
 
rZU12 = 	 Parameter(name='rZU12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU12}', 
	 lhablock = 'USQMIX', 
	 lhacode = [1, 2] ) 
 
iZU12 = 	 Parameter(name='iZU12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU12}', 
	 lhablock = 'IMUSQMIX', 
	 lhacode = [1, 2] ) 
 
rZU13 = 	 Parameter(name='rZU13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU13}', 
	 lhablock = 'USQMIX', 
	 lhacode = [1, 3] ) 
 
iZU13 = 	 Parameter(name='iZU13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU13}', 
	 lhablock = 'IMUSQMIX', 
	 lhacode = [1, 3] ) 
 
rZU14 = 	 Parameter(name='rZU14', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU14}', 
	 lhablock = 'USQMIX', 
	 lhacode = [1, 4] ) 
 
iZU14 = 	 Parameter(name='iZU14', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU14}', 
	 lhablock = 'IMUSQMIX', 
	 lhacode = [1, 4] ) 
 
rZU15 = 	 Parameter(name='rZU15', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU15}', 
	 lhablock = 'USQMIX', 
	 lhacode = [1, 5] ) 
 
iZU15 = 	 Parameter(name='iZU15', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU15}', 
	 lhablock = 'IMUSQMIX', 
	 lhacode = [1, 5] ) 
 
rZU16 = 	 Parameter(name='rZU16', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU16}', 
	 lhablock = 'USQMIX', 
	 lhacode = [1, 6] ) 
 
iZU16 = 	 Parameter(name='iZU16', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU16}', 
	 lhablock = 'IMUSQMIX', 
	 lhacode = [1, 6] ) 
 
rZU21 = 	 Parameter(name='rZU21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU21}', 
	 lhablock = 'USQMIX', 
	 lhacode = [2, 1] ) 
 
iZU21 = 	 Parameter(name='iZU21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU21}', 
	 lhablock = 'IMUSQMIX', 
	 lhacode = [2, 1] ) 
 
rZU22 = 	 Parameter(name='rZU22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU22}', 
	 lhablock = 'USQMIX', 
	 lhacode = [2, 2] ) 
 
iZU22 = 	 Parameter(name='iZU22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU22}', 
	 lhablock = 'IMUSQMIX', 
	 lhacode = [2, 2] ) 
 
rZU23 = 	 Parameter(name='rZU23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU23}', 
	 lhablock = 'USQMIX', 
	 lhacode = [2, 3] ) 
 
iZU23 = 	 Parameter(name='iZU23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU23}', 
	 lhablock = 'IMUSQMIX', 
	 lhacode = [2, 3] ) 
 
rZU24 = 	 Parameter(name='rZU24', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU24}', 
	 lhablock = 'USQMIX', 
	 lhacode = [2, 4] ) 
 
iZU24 = 	 Parameter(name='iZU24', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU24}', 
	 lhablock = 'IMUSQMIX', 
	 lhacode = [2, 4] ) 
 
rZU25 = 	 Parameter(name='rZU25', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU25}', 
	 lhablock = 'USQMIX', 
	 lhacode = [2, 5] ) 
 
iZU25 = 	 Parameter(name='iZU25', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU25}', 
	 lhablock = 'IMUSQMIX', 
	 lhacode = [2, 5] ) 
 
rZU26 = 	 Parameter(name='rZU26', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU26}', 
	 lhablock = 'USQMIX', 
	 lhacode = [2, 6] ) 
 
iZU26 = 	 Parameter(name='iZU26', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU26}', 
	 lhablock = 'IMUSQMIX', 
	 lhacode = [2, 6] ) 
 
rZU31 = 	 Parameter(name='rZU31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU31}', 
	 lhablock = 'USQMIX', 
	 lhacode = [3, 1] ) 
 
iZU31 = 	 Parameter(name='iZU31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU31}', 
	 lhablock = 'IMUSQMIX', 
	 lhacode = [3, 1] ) 
 
rZU32 = 	 Parameter(name='rZU32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU32}', 
	 lhablock = 'USQMIX', 
	 lhacode = [3, 2] ) 
 
iZU32 = 	 Parameter(name='iZU32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU32}', 
	 lhablock = 'IMUSQMIX', 
	 lhacode = [3, 2] ) 
 
rZU33 = 	 Parameter(name='rZU33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU33}', 
	 lhablock = 'USQMIX', 
	 lhacode = [3, 3] ) 
 
iZU33 = 	 Parameter(name='iZU33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU33}', 
	 lhablock = 'IMUSQMIX', 
	 lhacode = [3, 3] ) 
 
rZU34 = 	 Parameter(name='rZU34', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU34}', 
	 lhablock = 'USQMIX', 
	 lhacode = [3, 4] ) 
 
iZU34 = 	 Parameter(name='iZU34', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU34}', 
	 lhablock = 'IMUSQMIX', 
	 lhacode = [3, 4] ) 
 
rZU35 = 	 Parameter(name='rZU35', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU35}', 
	 lhablock = 'USQMIX', 
	 lhacode = [3, 5] ) 
 
iZU35 = 	 Parameter(name='iZU35', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU35}', 
	 lhablock = 'IMUSQMIX', 
	 lhacode = [3, 5] ) 
 
rZU36 = 	 Parameter(name='rZU36', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU36}', 
	 lhablock = 'USQMIX', 
	 lhacode = [3, 6] ) 
 
iZU36 = 	 Parameter(name='iZU36', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU36}', 
	 lhablock = 'IMUSQMIX', 
	 lhacode = [3, 6] ) 
 
rZU41 = 	 Parameter(name='rZU41', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU41}', 
	 lhablock = 'USQMIX', 
	 lhacode = [4, 1] ) 
 
iZU41 = 	 Parameter(name='iZU41', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU41}', 
	 lhablock = 'IMUSQMIX', 
	 lhacode = [4, 1] ) 
 
rZU42 = 	 Parameter(name='rZU42', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU42}', 
	 lhablock = 'USQMIX', 
	 lhacode = [4, 2] ) 
 
iZU42 = 	 Parameter(name='iZU42', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU42}', 
	 lhablock = 'IMUSQMIX', 
	 lhacode = [4, 2] ) 
 
rZU43 = 	 Parameter(name='rZU43', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU43}', 
	 lhablock = 'USQMIX', 
	 lhacode = [4, 3] ) 
 
iZU43 = 	 Parameter(name='iZU43', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU43}', 
	 lhablock = 'IMUSQMIX', 
	 lhacode = [4, 3] ) 
 
rZU44 = 	 Parameter(name='rZU44', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU44}', 
	 lhablock = 'USQMIX', 
	 lhacode = [4, 4] ) 
 
iZU44 = 	 Parameter(name='iZU44', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU44}', 
	 lhablock = 'IMUSQMIX', 
	 lhacode = [4, 4] ) 
 
rZU45 = 	 Parameter(name='rZU45', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU45}', 
	 lhablock = 'USQMIX', 
	 lhacode = [4, 5] ) 
 
iZU45 = 	 Parameter(name='iZU45', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU45}', 
	 lhablock = 'IMUSQMIX', 
	 lhacode = [4, 5] ) 
 
rZU46 = 	 Parameter(name='rZU46', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU46}', 
	 lhablock = 'USQMIX', 
	 lhacode = [4, 6] ) 
 
iZU46 = 	 Parameter(name='iZU46', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU46}', 
	 lhablock = 'IMUSQMIX', 
	 lhacode = [4, 6] ) 
 
rZU51 = 	 Parameter(name='rZU51', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU51}', 
	 lhablock = 'USQMIX', 
	 lhacode = [5, 1] ) 
 
iZU51 = 	 Parameter(name='iZU51', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU51}', 
	 lhablock = 'IMUSQMIX', 
	 lhacode = [5, 1] ) 
 
rZU52 = 	 Parameter(name='rZU52', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU52}', 
	 lhablock = 'USQMIX', 
	 lhacode = [5, 2] ) 
 
iZU52 = 	 Parameter(name='iZU52', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU52}', 
	 lhablock = 'IMUSQMIX', 
	 lhacode = [5, 2] ) 
 
rZU53 = 	 Parameter(name='rZU53', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU53}', 
	 lhablock = 'USQMIX', 
	 lhacode = [5, 3] ) 
 
iZU53 = 	 Parameter(name='iZU53', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU53}', 
	 lhablock = 'IMUSQMIX', 
	 lhacode = [5, 3] ) 
 
rZU54 = 	 Parameter(name='rZU54', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU54}', 
	 lhablock = 'USQMIX', 
	 lhacode = [5, 4] ) 
 
iZU54 = 	 Parameter(name='iZU54', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU54}', 
	 lhablock = 'IMUSQMIX', 
	 lhacode = [5, 4] ) 
 
rZU55 = 	 Parameter(name='rZU55', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU55}', 
	 lhablock = 'USQMIX', 
	 lhacode = [5, 5] ) 
 
iZU55 = 	 Parameter(name='iZU55', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU55}', 
	 lhablock = 'IMUSQMIX', 
	 lhacode = [5, 5] ) 
 
rZU56 = 	 Parameter(name='rZU56', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU56}', 
	 lhablock = 'USQMIX', 
	 lhacode = [5, 6] ) 
 
iZU56 = 	 Parameter(name='iZU56', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU56}', 
	 lhablock = 'IMUSQMIX', 
	 lhacode = [5, 6] ) 
 
rZU61 = 	 Parameter(name='rZU61', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU61}', 
	 lhablock = 'USQMIX', 
	 lhacode = [6, 1] ) 
 
iZU61 = 	 Parameter(name='iZU61', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU61}', 
	 lhablock = 'IMUSQMIX', 
	 lhacode = [6, 1] ) 
 
rZU62 = 	 Parameter(name='rZU62', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU62}', 
	 lhablock = 'USQMIX', 
	 lhacode = [6, 2] ) 
 
iZU62 = 	 Parameter(name='iZU62', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU62}', 
	 lhablock = 'IMUSQMIX', 
	 lhacode = [6, 2] ) 
 
rZU63 = 	 Parameter(name='rZU63', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU63}', 
	 lhablock = 'USQMIX', 
	 lhacode = [6, 3] ) 
 
iZU63 = 	 Parameter(name='iZU63', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU63}', 
	 lhablock = 'IMUSQMIX', 
	 lhacode = [6, 3] ) 
 
rZU64 = 	 Parameter(name='rZU64', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU64}', 
	 lhablock = 'USQMIX', 
	 lhacode = [6, 4] ) 
 
iZU64 = 	 Parameter(name='iZU64', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU64}', 
	 lhablock = 'IMUSQMIX', 
	 lhacode = [6, 4] ) 
 
rZU65 = 	 Parameter(name='rZU65', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU65}', 
	 lhablock = 'USQMIX', 
	 lhacode = [6, 5] ) 
 
iZU65 = 	 Parameter(name='iZU65', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU65}', 
	 lhablock = 'IMUSQMIX', 
	 lhacode = [6, 5] ) 
 
rZU66 = 	 Parameter(name='rZU66', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU66}', 
	 lhablock = 'USQMIX', 
	 lhacode = [6, 6] ) 
 
iZU66 = 	 Parameter(name='iZU66', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU66}', 
	 lhablock = 'IMUSQMIX', 
	 lhacode = [6, 6] ) 
 
rZE11 = 	 Parameter(name='rZE11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE11}', 
	 lhablock = 'SELMIX', 
	 lhacode = [1, 1] ) 
 
iZE11 = 	 Parameter(name='iZE11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE11}', 
	 lhablock = 'IMSELMIX', 
	 lhacode = [1, 1] ) 
 
rZE12 = 	 Parameter(name='rZE12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE12}', 
	 lhablock = 'SELMIX', 
	 lhacode = [1, 2] ) 
 
iZE12 = 	 Parameter(name='iZE12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE12}', 
	 lhablock = 'IMSELMIX', 
	 lhacode = [1, 2] ) 
 
rZE13 = 	 Parameter(name='rZE13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE13}', 
	 lhablock = 'SELMIX', 
	 lhacode = [1, 3] ) 
 
iZE13 = 	 Parameter(name='iZE13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE13}', 
	 lhablock = 'IMSELMIX', 
	 lhacode = [1, 3] ) 
 
rZE14 = 	 Parameter(name='rZE14', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE14}', 
	 lhablock = 'SELMIX', 
	 lhacode = [1, 4] ) 
 
iZE14 = 	 Parameter(name='iZE14', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE14}', 
	 lhablock = 'IMSELMIX', 
	 lhacode = [1, 4] ) 
 
rZE15 = 	 Parameter(name='rZE15', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE15}', 
	 lhablock = 'SELMIX', 
	 lhacode = [1, 5] ) 
 
iZE15 = 	 Parameter(name='iZE15', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE15}', 
	 lhablock = 'IMSELMIX', 
	 lhacode = [1, 5] ) 
 
rZE16 = 	 Parameter(name='rZE16', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE16}', 
	 lhablock = 'SELMIX', 
	 lhacode = [1, 6] ) 
 
iZE16 = 	 Parameter(name='iZE16', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE16}', 
	 lhablock = 'IMSELMIX', 
	 lhacode = [1, 6] ) 
 
rZE21 = 	 Parameter(name='rZE21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE21}', 
	 lhablock = 'SELMIX', 
	 lhacode = [2, 1] ) 
 
iZE21 = 	 Parameter(name='iZE21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE21}', 
	 lhablock = 'IMSELMIX', 
	 lhacode = [2, 1] ) 
 
rZE22 = 	 Parameter(name='rZE22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE22}', 
	 lhablock = 'SELMIX', 
	 lhacode = [2, 2] ) 
 
iZE22 = 	 Parameter(name='iZE22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE22}', 
	 lhablock = 'IMSELMIX', 
	 lhacode = [2, 2] ) 
 
rZE23 = 	 Parameter(name='rZE23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE23}', 
	 lhablock = 'SELMIX', 
	 lhacode = [2, 3] ) 
 
iZE23 = 	 Parameter(name='iZE23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE23}', 
	 lhablock = 'IMSELMIX', 
	 lhacode = [2, 3] ) 
 
rZE24 = 	 Parameter(name='rZE24', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE24}', 
	 lhablock = 'SELMIX', 
	 lhacode = [2, 4] ) 
 
iZE24 = 	 Parameter(name='iZE24', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE24}', 
	 lhablock = 'IMSELMIX', 
	 lhacode = [2, 4] ) 
 
rZE25 = 	 Parameter(name='rZE25', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE25}', 
	 lhablock = 'SELMIX', 
	 lhacode = [2, 5] ) 
 
iZE25 = 	 Parameter(name='iZE25', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE25}', 
	 lhablock = 'IMSELMIX', 
	 lhacode = [2, 5] ) 
 
rZE26 = 	 Parameter(name='rZE26', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE26}', 
	 lhablock = 'SELMIX', 
	 lhacode = [2, 6] ) 
 
iZE26 = 	 Parameter(name='iZE26', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE26}', 
	 lhablock = 'IMSELMIX', 
	 lhacode = [2, 6] ) 
 
rZE31 = 	 Parameter(name='rZE31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE31}', 
	 lhablock = 'SELMIX', 
	 lhacode = [3, 1] ) 
 
iZE31 = 	 Parameter(name='iZE31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE31}', 
	 lhablock = 'IMSELMIX', 
	 lhacode = [3, 1] ) 
 
rZE32 = 	 Parameter(name='rZE32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE32}', 
	 lhablock = 'SELMIX', 
	 lhacode = [3, 2] ) 
 
iZE32 = 	 Parameter(name='iZE32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE32}', 
	 lhablock = 'IMSELMIX', 
	 lhacode = [3, 2] ) 
 
rZE33 = 	 Parameter(name='rZE33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE33}', 
	 lhablock = 'SELMIX', 
	 lhacode = [3, 3] ) 
 
iZE33 = 	 Parameter(name='iZE33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE33}', 
	 lhablock = 'IMSELMIX', 
	 lhacode = [3, 3] ) 
 
rZE34 = 	 Parameter(name='rZE34', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE34}', 
	 lhablock = 'SELMIX', 
	 lhacode = [3, 4] ) 
 
iZE34 = 	 Parameter(name='iZE34', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE34}', 
	 lhablock = 'IMSELMIX', 
	 lhacode = [3, 4] ) 
 
rZE35 = 	 Parameter(name='rZE35', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE35}', 
	 lhablock = 'SELMIX', 
	 lhacode = [3, 5] ) 
 
iZE35 = 	 Parameter(name='iZE35', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE35}', 
	 lhablock = 'IMSELMIX', 
	 lhacode = [3, 5] ) 
 
rZE36 = 	 Parameter(name='rZE36', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE36}', 
	 lhablock = 'SELMIX', 
	 lhacode = [3, 6] ) 
 
iZE36 = 	 Parameter(name='iZE36', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE36}', 
	 lhablock = 'IMSELMIX', 
	 lhacode = [3, 6] ) 
 
rZE41 = 	 Parameter(name='rZE41', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE41}', 
	 lhablock = 'SELMIX', 
	 lhacode = [4, 1] ) 
 
iZE41 = 	 Parameter(name='iZE41', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE41}', 
	 lhablock = 'IMSELMIX', 
	 lhacode = [4, 1] ) 
 
rZE42 = 	 Parameter(name='rZE42', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE42}', 
	 lhablock = 'SELMIX', 
	 lhacode = [4, 2] ) 
 
iZE42 = 	 Parameter(name='iZE42', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE42}', 
	 lhablock = 'IMSELMIX', 
	 lhacode = [4, 2] ) 
 
rZE43 = 	 Parameter(name='rZE43', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE43}', 
	 lhablock = 'SELMIX', 
	 lhacode = [4, 3] ) 
 
iZE43 = 	 Parameter(name='iZE43', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE43}', 
	 lhablock = 'IMSELMIX', 
	 lhacode = [4, 3] ) 
 
rZE44 = 	 Parameter(name='rZE44', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE44}', 
	 lhablock = 'SELMIX', 
	 lhacode = [4, 4] ) 
 
iZE44 = 	 Parameter(name='iZE44', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE44}', 
	 lhablock = 'IMSELMIX', 
	 lhacode = [4, 4] ) 
 
rZE45 = 	 Parameter(name='rZE45', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE45}', 
	 lhablock = 'SELMIX', 
	 lhacode = [4, 5] ) 
 
iZE45 = 	 Parameter(name='iZE45', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE45}', 
	 lhablock = 'IMSELMIX', 
	 lhacode = [4, 5] ) 
 
rZE46 = 	 Parameter(name='rZE46', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE46}', 
	 lhablock = 'SELMIX', 
	 lhacode = [4, 6] ) 
 
iZE46 = 	 Parameter(name='iZE46', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE46}', 
	 lhablock = 'IMSELMIX', 
	 lhacode = [4, 6] ) 
 
rZE51 = 	 Parameter(name='rZE51', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE51}', 
	 lhablock = 'SELMIX', 
	 lhacode = [5, 1] ) 
 
iZE51 = 	 Parameter(name='iZE51', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE51}', 
	 lhablock = 'IMSELMIX', 
	 lhacode = [5, 1] ) 
 
rZE52 = 	 Parameter(name='rZE52', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE52}', 
	 lhablock = 'SELMIX', 
	 lhacode = [5, 2] ) 
 
iZE52 = 	 Parameter(name='iZE52', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE52}', 
	 lhablock = 'IMSELMIX', 
	 lhacode = [5, 2] ) 
 
rZE53 = 	 Parameter(name='rZE53', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE53}', 
	 lhablock = 'SELMIX', 
	 lhacode = [5, 3] ) 
 
iZE53 = 	 Parameter(name='iZE53', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE53}', 
	 lhablock = 'IMSELMIX', 
	 lhacode = [5, 3] ) 
 
rZE54 = 	 Parameter(name='rZE54', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE54}', 
	 lhablock = 'SELMIX', 
	 lhacode = [5, 4] ) 
 
iZE54 = 	 Parameter(name='iZE54', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE54}', 
	 lhablock = 'IMSELMIX', 
	 lhacode = [5, 4] ) 
 
rZE55 = 	 Parameter(name='rZE55', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE55}', 
	 lhablock = 'SELMIX', 
	 lhacode = [5, 5] ) 
 
iZE55 = 	 Parameter(name='iZE55', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE55}', 
	 lhablock = 'IMSELMIX', 
	 lhacode = [5, 5] ) 
 
rZE56 = 	 Parameter(name='rZE56', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE56}', 
	 lhablock = 'SELMIX', 
	 lhacode = [5, 6] ) 
 
iZE56 = 	 Parameter(name='iZE56', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE56}', 
	 lhablock = 'IMSELMIX', 
	 lhacode = [5, 6] ) 
 
rZE61 = 	 Parameter(name='rZE61', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE61}', 
	 lhablock = 'SELMIX', 
	 lhacode = [6, 1] ) 
 
iZE61 = 	 Parameter(name='iZE61', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE61}', 
	 lhablock = 'IMSELMIX', 
	 lhacode = [6, 1] ) 
 
rZE62 = 	 Parameter(name='rZE62', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE62}', 
	 lhablock = 'SELMIX', 
	 lhacode = [6, 2] ) 
 
iZE62 = 	 Parameter(name='iZE62', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE62}', 
	 lhablock = 'IMSELMIX', 
	 lhacode = [6, 2] ) 
 
rZE63 = 	 Parameter(name='rZE63', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE63}', 
	 lhablock = 'SELMIX', 
	 lhacode = [6, 3] ) 
 
iZE63 = 	 Parameter(name='iZE63', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE63}', 
	 lhablock = 'IMSELMIX', 
	 lhacode = [6, 3] ) 
 
rZE64 = 	 Parameter(name='rZE64', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE64}', 
	 lhablock = 'SELMIX', 
	 lhacode = [6, 4] ) 
 
iZE64 = 	 Parameter(name='iZE64', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE64}', 
	 lhablock = 'IMSELMIX', 
	 lhacode = [6, 4] ) 
 
rZE65 = 	 Parameter(name='rZE65', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE65}', 
	 lhablock = 'SELMIX', 
	 lhacode = [6, 5] ) 
 
iZE65 = 	 Parameter(name='iZE65', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE65}', 
	 lhablock = 'IMSELMIX', 
	 lhacode = [6, 5] ) 
 
rZE66 = 	 Parameter(name='rZE66', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE66}', 
	 lhablock = 'SELMIX', 
	 lhacode = [6, 6] ) 
 
iZE66 = 	 Parameter(name='iZE66', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE66}', 
	 lhablock = 'IMSELMIX', 
	 lhacode = [6, 6] ) 
 
rZN11 = 	 Parameter(name='rZN11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN11}', 
	 lhablock = 'NMIX', 
	 lhacode = [1, 1] ) 
 
iZN11 = 	 Parameter(name='iZN11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN11}', 
	 lhablock = 'IMNMIX', 
	 lhacode = [1, 1] ) 
 
rZN12 = 	 Parameter(name='rZN12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN12}', 
	 lhablock = 'NMIX', 
	 lhacode = [1, 2] ) 
 
iZN12 = 	 Parameter(name='iZN12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN12}', 
	 lhablock = 'IMNMIX', 
	 lhacode = [1, 2] ) 
 
rZN13 = 	 Parameter(name='rZN13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN13}', 
	 lhablock = 'NMIX', 
	 lhacode = [1, 3] ) 
 
iZN13 = 	 Parameter(name='iZN13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN13}', 
	 lhablock = 'IMNMIX', 
	 lhacode = [1, 3] ) 
 
rZN14 = 	 Parameter(name='rZN14', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN14}', 
	 lhablock = 'NMIX', 
	 lhacode = [1, 4] ) 
 
iZN14 = 	 Parameter(name='iZN14', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN14}', 
	 lhablock = 'IMNMIX', 
	 lhacode = [1, 4] ) 
 
rZN21 = 	 Parameter(name='rZN21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN21}', 
	 lhablock = 'NMIX', 
	 lhacode = [2, 1] ) 
 
iZN21 = 	 Parameter(name='iZN21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN21}', 
	 lhablock = 'IMNMIX', 
	 lhacode = [2, 1] ) 
 
rZN22 = 	 Parameter(name='rZN22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN22}', 
	 lhablock = 'NMIX', 
	 lhacode = [2, 2] ) 
 
iZN22 = 	 Parameter(name='iZN22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN22}', 
	 lhablock = 'IMNMIX', 
	 lhacode = [2, 2] ) 
 
rZN23 = 	 Parameter(name='rZN23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN23}', 
	 lhablock = 'NMIX', 
	 lhacode = [2, 3] ) 
 
iZN23 = 	 Parameter(name='iZN23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN23}', 
	 lhablock = 'IMNMIX', 
	 lhacode = [2, 3] ) 
 
rZN24 = 	 Parameter(name='rZN24', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN24}', 
	 lhablock = 'NMIX', 
	 lhacode = [2, 4] ) 
 
iZN24 = 	 Parameter(name='iZN24', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN24}', 
	 lhablock = 'IMNMIX', 
	 lhacode = [2, 4] ) 
 
rZN31 = 	 Parameter(name='rZN31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN31}', 
	 lhablock = 'NMIX', 
	 lhacode = [3, 1] ) 
 
iZN31 = 	 Parameter(name='iZN31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN31}', 
	 lhablock = 'IMNMIX', 
	 lhacode = [3, 1] ) 
 
rZN32 = 	 Parameter(name='rZN32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN32}', 
	 lhablock = 'NMIX', 
	 lhacode = [3, 2] ) 
 
iZN32 = 	 Parameter(name='iZN32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN32}', 
	 lhablock = 'IMNMIX', 
	 lhacode = [3, 2] ) 
 
rZN33 = 	 Parameter(name='rZN33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN33}', 
	 lhablock = 'NMIX', 
	 lhacode = [3, 3] ) 
 
iZN33 = 	 Parameter(name='iZN33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN33}', 
	 lhablock = 'IMNMIX', 
	 lhacode = [3, 3] ) 
 
rZN34 = 	 Parameter(name='rZN34', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN34}', 
	 lhablock = 'NMIX', 
	 lhacode = [3, 4] ) 
 
iZN34 = 	 Parameter(name='iZN34', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN34}', 
	 lhablock = 'IMNMIX', 
	 lhacode = [3, 4] ) 
 
rZN41 = 	 Parameter(name='rZN41', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN41}', 
	 lhablock = 'NMIX', 
	 lhacode = [4, 1] ) 
 
iZN41 = 	 Parameter(name='iZN41', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN41}', 
	 lhablock = 'IMNMIX', 
	 lhacode = [4, 1] ) 
 
rZN42 = 	 Parameter(name='rZN42', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN42}', 
	 lhablock = 'NMIX', 
	 lhacode = [4, 2] ) 
 
iZN42 = 	 Parameter(name='iZN42', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN42}', 
	 lhablock = 'IMNMIX', 
	 lhacode = [4, 2] ) 
 
rZN43 = 	 Parameter(name='rZN43', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN43}', 
	 lhablock = 'NMIX', 
	 lhacode = [4, 3] ) 
 
iZN43 = 	 Parameter(name='iZN43', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN43}', 
	 lhablock = 'IMNMIX', 
	 lhacode = [4, 3] ) 
 
rZN44 = 	 Parameter(name='rZN44', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN44}', 
	 lhablock = 'NMIX', 
	 lhacode = [4, 4] ) 
 
iZN44 = 	 Parameter(name='iZN44', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN44}', 
	 lhablock = 'IMNMIX', 
	 lhacode = [4, 4] ) 
 
rUM11 = 	 Parameter(name='rUM11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UM11}', 
	 lhablock = 'UMIX', 
	 lhacode = [1, 1] ) 
 
iUM11 = 	 Parameter(name='iUM11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UM11}', 
	 lhablock = 'IMUMIX', 
	 lhacode = [1, 1] ) 
 
rUM12 = 	 Parameter(name='rUM12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UM12}', 
	 lhablock = 'UMIX', 
	 lhacode = [1, 2] ) 
 
iUM12 = 	 Parameter(name='iUM12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UM12}', 
	 lhablock = 'IMUMIX', 
	 lhacode = [1, 2] ) 
 
rUM21 = 	 Parameter(name='rUM21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UM21}', 
	 lhablock = 'UMIX', 
	 lhacode = [2, 1] ) 
 
iUM21 = 	 Parameter(name='iUM21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UM21}', 
	 lhablock = 'IMUMIX', 
	 lhacode = [2, 1] ) 
 
rUM22 = 	 Parameter(name='rUM22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UM22}', 
	 lhablock = 'UMIX', 
	 lhacode = [2, 2] ) 
 
iUM22 = 	 Parameter(name='iUM22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UM22}', 
	 lhablock = 'IMUMIX', 
	 lhacode = [2, 2] ) 
 
rUP11 = 	 Parameter(name='rUP11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UP11}', 
	 lhablock = 'VMIX', 
	 lhacode = [1, 1] ) 
 
iUP11 = 	 Parameter(name='iUP11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UP11}', 
	 lhablock = 'IMVMIX', 
	 lhacode = [1, 1] ) 
 
rUP12 = 	 Parameter(name='rUP12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UP12}', 
	 lhablock = 'VMIX', 
	 lhacode = [1, 2] ) 
 
iUP12 = 	 Parameter(name='iUP12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UP12}', 
	 lhablock = 'IMVMIX', 
	 lhacode = [1, 2] ) 
 
rUP21 = 	 Parameter(name='rUP21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UP21}', 
	 lhablock = 'VMIX', 
	 lhacode = [2, 1] ) 
 
iUP21 = 	 Parameter(name='iUP21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UP21}', 
	 lhablock = 'IMVMIX', 
	 lhacode = [2, 1] ) 
 
rUP22 = 	 Parameter(name='rUP22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UP22}', 
	 lhablock = 'VMIX', 
	 lhacode = [2, 2] ) 
 
iUP22 = 	 Parameter(name='iUP22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UP22}', 
	 lhablock = 'IMVMIX', 
	 lhacode = [2, 2] ) 
 
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
 
alphaH = 	 Parameter(name='alphaH', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{alphaH}', 
	 lhablock = 'HMIX', 
	 lhacode = [11] ) 
 
betaH = 	 Parameter(name='betaH', 
	 nature = 'external', 
	 type = 'real', 
	 value = 1., 
	 texname = '\\text{betaH}', 
	 lhablock = 'HMIX', 
	 lhacode = [10] ) 
 
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
 
Mu = 	 Parameter(name='Mu', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rMu + complex(0,1)*iMu', 
	 texname = '\\text{Mu}' ) 
 
Yd11 = 	 Parameter(name='Yd11', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYd11 + complex(0,1)*iYd11', 
	 texname = '\\text{Yd11}' ) 
 
Yd12 = 	 Parameter(name='Yd12', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYd12 + complex(0,1)*iYd12', 
	 texname = '\\text{Yd12}' ) 
 
Yd13 = 	 Parameter(name='Yd13', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYd13 + complex(0,1)*iYd13', 
	 texname = '\\text{Yd13}' ) 
 
Yd21 = 	 Parameter(name='Yd21', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYd21 + complex(0,1)*iYd21', 
	 texname = '\\text{Yd21}' ) 
 
Yd22 = 	 Parameter(name='Yd22', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYd22 + complex(0,1)*iYd22', 
	 texname = '\\text{Yd22}' ) 
 
Yd23 = 	 Parameter(name='Yd23', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYd23 + complex(0,1)*iYd23', 
	 texname = '\\text{Yd23}' ) 
 
Yd31 = 	 Parameter(name='Yd31', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYd31 + complex(0,1)*iYd31', 
	 texname = '\\text{Yd31}' ) 
 
Yd32 = 	 Parameter(name='Yd32', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYd32 + complex(0,1)*iYd32', 
	 texname = '\\text{Yd32}' ) 
 
Yd33 = 	 Parameter(name='Yd33', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYd33 + complex(0,1)*iYd33', 
	 texname = '\\text{Yd33}' ) 
 
Td11 = 	 Parameter(name='Td11', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rTd11 + complex(0,1)*iTd11', 
	 texname = '\\text{Td11}' ) 
 
Td12 = 	 Parameter(name='Td12', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rTd12 + complex(0,1)*iTd12', 
	 texname = '\\text{Td12}' ) 
 
Td13 = 	 Parameter(name='Td13', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rTd13 + complex(0,1)*iTd13', 
	 texname = '\\text{Td13}' ) 
 
Td21 = 	 Parameter(name='Td21', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rTd21 + complex(0,1)*iTd21', 
	 texname = '\\text{Td21}' ) 
 
Td22 = 	 Parameter(name='Td22', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rTd22 + complex(0,1)*iTd22', 
	 texname = '\\text{Td22}' ) 
 
Td23 = 	 Parameter(name='Td23', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rTd23 + complex(0,1)*iTd23', 
	 texname = '\\text{Td23}' ) 
 
Td31 = 	 Parameter(name='Td31', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rTd31 + complex(0,1)*iTd31', 
	 texname = '\\text{Td31}' ) 
 
Td32 = 	 Parameter(name='Td32', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rTd32 + complex(0,1)*iTd32', 
	 texname = '\\text{Td32}' ) 
 
Td33 = 	 Parameter(name='Td33', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rTd33 + complex(0,1)*iTd33', 
	 texname = '\\text{Td33}' ) 
 
Ye11 = 	 Parameter(name='Ye11', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYe11 + complex(0,1)*iYe11', 
	 texname = '\\text{Ye11}' ) 
 
Ye12 = 	 Parameter(name='Ye12', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYe12 + complex(0,1)*iYe12', 
	 texname = '\\text{Ye12}' ) 
 
Ye13 = 	 Parameter(name='Ye13', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYe13 + complex(0,1)*iYe13', 
	 texname = '\\text{Ye13}' ) 
 
Ye21 = 	 Parameter(name='Ye21', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYe21 + complex(0,1)*iYe21', 
	 texname = '\\text{Ye21}' ) 
 
Ye22 = 	 Parameter(name='Ye22', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYe22 + complex(0,1)*iYe22', 
	 texname = '\\text{Ye22}' ) 
 
Ye23 = 	 Parameter(name='Ye23', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYe23 + complex(0,1)*iYe23', 
	 texname = '\\text{Ye23}' ) 
 
Ye31 = 	 Parameter(name='Ye31', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYe31 + complex(0,1)*iYe31', 
	 texname = '\\text{Ye31}' ) 
 
Ye32 = 	 Parameter(name='Ye32', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYe32 + complex(0,1)*iYe32', 
	 texname = '\\text{Ye32}' ) 
 
Ye33 = 	 Parameter(name='Ye33', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYe33 + complex(0,1)*iYe33', 
	 texname = '\\text{Ye33}' ) 
 
Te11 = 	 Parameter(name='Te11', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rTe11 + complex(0,1)*iTe11', 
	 texname = '\\text{Te11}' ) 
 
Te12 = 	 Parameter(name='Te12', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rTe12 + complex(0,1)*iTe12', 
	 texname = '\\text{Te12}' ) 
 
Te13 = 	 Parameter(name='Te13', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rTe13 + complex(0,1)*iTe13', 
	 texname = '\\text{Te13}' ) 
 
Te21 = 	 Parameter(name='Te21', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rTe21 + complex(0,1)*iTe21', 
	 texname = '\\text{Te21}' ) 
 
Te22 = 	 Parameter(name='Te22', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rTe22 + complex(0,1)*iTe22', 
	 texname = '\\text{Te22}' ) 
 
Te23 = 	 Parameter(name='Te23', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rTe23 + complex(0,1)*iTe23', 
	 texname = '\\text{Te23}' ) 
 
Te31 = 	 Parameter(name='Te31', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rTe31 + complex(0,1)*iTe31', 
	 texname = '\\text{Te31}' ) 
 
Te32 = 	 Parameter(name='Te32', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rTe32 + complex(0,1)*iTe32', 
	 texname = '\\text{Te32}' ) 
 
Te33 = 	 Parameter(name='Te33', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rTe33 + complex(0,1)*iTe33', 
	 texname = '\\text{Te33}' ) 
 
Yu11 = 	 Parameter(name='Yu11', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYu11 + complex(0,1)*iYu11', 
	 texname = '\\text{Yu11}' ) 
 
Yu12 = 	 Parameter(name='Yu12', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYu12 + complex(0,1)*iYu12', 
	 texname = '\\text{Yu12}' ) 
 
Yu13 = 	 Parameter(name='Yu13', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYu13 + complex(0,1)*iYu13', 
	 texname = '\\text{Yu13}' ) 
 
Yu21 = 	 Parameter(name='Yu21', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYu21 + complex(0,1)*iYu21', 
	 texname = '\\text{Yu21}' ) 
 
Yu22 = 	 Parameter(name='Yu22', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYu22 + complex(0,1)*iYu22', 
	 texname = '\\text{Yu22}' ) 
 
Yu23 = 	 Parameter(name='Yu23', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYu23 + complex(0,1)*iYu23', 
	 texname = '\\text{Yu23}' ) 
 
Yu31 = 	 Parameter(name='Yu31', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYu31 + complex(0,1)*iYu31', 
	 texname = '\\text{Yu31}' ) 
 
Yu32 = 	 Parameter(name='Yu32', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYu32 + complex(0,1)*iYu32', 
	 texname = '\\text{Yu32}' ) 
 
Yu33 = 	 Parameter(name='Yu33', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYu33 + complex(0,1)*iYu33', 
	 texname = '\\text{Yu33}' ) 
 
Tu11 = 	 Parameter(name='Tu11', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rTu11 + complex(0,1)*iTu11', 
	 texname = '\\text{Tu11}' ) 
 
Tu12 = 	 Parameter(name='Tu12', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rTu12 + complex(0,1)*iTu12', 
	 texname = '\\text{Tu12}' ) 
 
Tu13 = 	 Parameter(name='Tu13', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rTu13 + complex(0,1)*iTu13', 
	 texname = '\\text{Tu13}' ) 
 
Tu21 = 	 Parameter(name='Tu21', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rTu21 + complex(0,1)*iTu21', 
	 texname = '\\text{Tu21}' ) 
 
Tu22 = 	 Parameter(name='Tu22', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rTu22 + complex(0,1)*iTu22', 
	 texname = '\\text{Tu22}' ) 
 
Tu23 = 	 Parameter(name='Tu23', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rTu23 + complex(0,1)*iTu23', 
	 texname = '\\text{Tu23}' ) 
 
Tu31 = 	 Parameter(name='Tu31', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rTu31 + complex(0,1)*iTu31', 
	 texname = '\\text{Tu31}' ) 
 
Tu32 = 	 Parameter(name='Tu32', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rTu32 + complex(0,1)*iTu32', 
	 texname = '\\text{Tu32}' ) 
 
Tu33 = 	 Parameter(name='Tu33', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rTu33 + complex(0,1)*iTu33', 
	 texname = '\\text{Tu33}' ) 
 
pG = 	 Parameter(name='pG', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rpG + complex(0,1)*ipG', 
	 texname = '\\text{pG}' ) 
 
ZD11 = 	 Parameter(name='ZD11', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZD11 + complex(0,1)*iZD11', 
	 texname = '\\text{ZD11}' ) 
 
ZD12 = 	 Parameter(name='ZD12', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZD12 + complex(0,1)*iZD12', 
	 texname = '\\text{ZD12}' ) 
 
ZD13 = 	 Parameter(name='ZD13', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZD13 + complex(0,1)*iZD13', 
	 texname = '\\text{ZD13}' ) 
 
ZD14 = 	 Parameter(name='ZD14', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZD14 + complex(0,1)*iZD14', 
	 texname = '\\text{ZD14}' ) 
 
ZD15 = 	 Parameter(name='ZD15', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZD15 + complex(0,1)*iZD15', 
	 texname = '\\text{ZD15}' ) 
 
ZD16 = 	 Parameter(name='ZD16', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZD16 + complex(0,1)*iZD16', 
	 texname = '\\text{ZD16}' ) 
 
ZD21 = 	 Parameter(name='ZD21', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZD21 + complex(0,1)*iZD21', 
	 texname = '\\text{ZD21}' ) 
 
ZD22 = 	 Parameter(name='ZD22', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZD22 + complex(0,1)*iZD22', 
	 texname = '\\text{ZD22}' ) 
 
ZD23 = 	 Parameter(name='ZD23', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZD23 + complex(0,1)*iZD23', 
	 texname = '\\text{ZD23}' ) 
 
ZD24 = 	 Parameter(name='ZD24', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZD24 + complex(0,1)*iZD24', 
	 texname = '\\text{ZD24}' ) 
 
ZD25 = 	 Parameter(name='ZD25', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZD25 + complex(0,1)*iZD25', 
	 texname = '\\text{ZD25}' ) 
 
ZD26 = 	 Parameter(name='ZD26', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZD26 + complex(0,1)*iZD26', 
	 texname = '\\text{ZD26}' ) 
 
ZD31 = 	 Parameter(name='ZD31', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZD31 + complex(0,1)*iZD31', 
	 texname = '\\text{ZD31}' ) 
 
ZD32 = 	 Parameter(name='ZD32', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZD32 + complex(0,1)*iZD32', 
	 texname = '\\text{ZD32}' ) 
 
ZD33 = 	 Parameter(name='ZD33', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZD33 + complex(0,1)*iZD33', 
	 texname = '\\text{ZD33}' ) 
 
ZD34 = 	 Parameter(name='ZD34', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZD34 + complex(0,1)*iZD34', 
	 texname = '\\text{ZD34}' ) 
 
ZD35 = 	 Parameter(name='ZD35', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZD35 + complex(0,1)*iZD35', 
	 texname = '\\text{ZD35}' ) 
 
ZD36 = 	 Parameter(name='ZD36', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZD36 + complex(0,1)*iZD36', 
	 texname = '\\text{ZD36}' ) 
 
ZD41 = 	 Parameter(name='ZD41', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZD41 + complex(0,1)*iZD41', 
	 texname = '\\text{ZD41}' ) 
 
ZD42 = 	 Parameter(name='ZD42', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZD42 + complex(0,1)*iZD42', 
	 texname = '\\text{ZD42}' ) 
 
ZD43 = 	 Parameter(name='ZD43', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZD43 + complex(0,1)*iZD43', 
	 texname = '\\text{ZD43}' ) 
 
ZD44 = 	 Parameter(name='ZD44', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZD44 + complex(0,1)*iZD44', 
	 texname = '\\text{ZD44}' ) 
 
ZD45 = 	 Parameter(name='ZD45', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZD45 + complex(0,1)*iZD45', 
	 texname = '\\text{ZD45}' ) 
 
ZD46 = 	 Parameter(name='ZD46', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZD46 + complex(0,1)*iZD46', 
	 texname = '\\text{ZD46}' ) 
 
ZD51 = 	 Parameter(name='ZD51', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZD51 + complex(0,1)*iZD51', 
	 texname = '\\text{ZD51}' ) 
 
ZD52 = 	 Parameter(name='ZD52', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZD52 + complex(0,1)*iZD52', 
	 texname = '\\text{ZD52}' ) 
 
ZD53 = 	 Parameter(name='ZD53', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZD53 + complex(0,1)*iZD53', 
	 texname = '\\text{ZD53}' ) 
 
ZD54 = 	 Parameter(name='ZD54', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZD54 + complex(0,1)*iZD54', 
	 texname = '\\text{ZD54}' ) 
 
ZD55 = 	 Parameter(name='ZD55', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZD55 + complex(0,1)*iZD55', 
	 texname = '\\text{ZD55}' ) 
 
ZD56 = 	 Parameter(name='ZD56', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZD56 + complex(0,1)*iZD56', 
	 texname = '\\text{ZD56}' ) 
 
ZD61 = 	 Parameter(name='ZD61', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZD61 + complex(0,1)*iZD61', 
	 texname = '\\text{ZD61}' ) 
 
ZD62 = 	 Parameter(name='ZD62', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZD62 + complex(0,1)*iZD62', 
	 texname = '\\text{ZD62}' ) 
 
ZD63 = 	 Parameter(name='ZD63', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZD63 + complex(0,1)*iZD63', 
	 texname = '\\text{ZD63}' ) 
 
ZD64 = 	 Parameter(name='ZD64', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZD64 + complex(0,1)*iZD64', 
	 texname = '\\text{ZD64}' ) 
 
ZD65 = 	 Parameter(name='ZD65', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZD65 + complex(0,1)*iZD65', 
	 texname = '\\text{ZD65}' ) 
 
ZD66 = 	 Parameter(name='ZD66', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZD66 + complex(0,1)*iZD66', 
	 texname = '\\text{ZD66}' ) 
 
ZV11 = 	 Parameter(name='ZV11', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZV11 + complex(0,1)*iZV11', 
	 texname = '\\text{ZV11}' ) 
 
ZV12 = 	 Parameter(name='ZV12', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZV12 + complex(0,1)*iZV12', 
	 texname = '\\text{ZV12}' ) 
 
ZV13 = 	 Parameter(name='ZV13', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZV13 + complex(0,1)*iZV13', 
	 texname = '\\text{ZV13}' ) 
 
ZV21 = 	 Parameter(name='ZV21', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZV21 + complex(0,1)*iZV21', 
	 texname = '\\text{ZV21}' ) 
 
ZV22 = 	 Parameter(name='ZV22', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZV22 + complex(0,1)*iZV22', 
	 texname = '\\text{ZV22}' ) 
 
ZV23 = 	 Parameter(name='ZV23', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZV23 + complex(0,1)*iZV23', 
	 texname = '\\text{ZV23}' ) 
 
ZV31 = 	 Parameter(name='ZV31', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZV31 + complex(0,1)*iZV31', 
	 texname = '\\text{ZV31}' ) 
 
ZV32 = 	 Parameter(name='ZV32', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZV32 + complex(0,1)*iZV32', 
	 texname = '\\text{ZV32}' ) 
 
ZV33 = 	 Parameter(name='ZV33', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZV33 + complex(0,1)*iZV33', 
	 texname = '\\text{ZV33}' ) 
 
ZU11 = 	 Parameter(name='ZU11', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZU11 + complex(0,1)*iZU11', 
	 texname = '\\text{ZU11}' ) 
 
ZU12 = 	 Parameter(name='ZU12', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZU12 + complex(0,1)*iZU12', 
	 texname = '\\text{ZU12}' ) 
 
ZU13 = 	 Parameter(name='ZU13', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZU13 + complex(0,1)*iZU13', 
	 texname = '\\text{ZU13}' ) 
 
ZU14 = 	 Parameter(name='ZU14', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZU14 + complex(0,1)*iZU14', 
	 texname = '\\text{ZU14}' ) 
 
ZU15 = 	 Parameter(name='ZU15', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZU15 + complex(0,1)*iZU15', 
	 texname = '\\text{ZU15}' ) 
 
ZU16 = 	 Parameter(name='ZU16', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZU16 + complex(0,1)*iZU16', 
	 texname = '\\text{ZU16}' ) 
 
ZU21 = 	 Parameter(name='ZU21', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZU21 + complex(0,1)*iZU21', 
	 texname = '\\text{ZU21}' ) 
 
ZU22 = 	 Parameter(name='ZU22', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZU22 + complex(0,1)*iZU22', 
	 texname = '\\text{ZU22}' ) 
 
ZU23 = 	 Parameter(name='ZU23', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZU23 + complex(0,1)*iZU23', 
	 texname = '\\text{ZU23}' ) 
 
ZU24 = 	 Parameter(name='ZU24', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZU24 + complex(0,1)*iZU24', 
	 texname = '\\text{ZU24}' ) 
 
ZU25 = 	 Parameter(name='ZU25', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZU25 + complex(0,1)*iZU25', 
	 texname = '\\text{ZU25}' ) 
 
ZU26 = 	 Parameter(name='ZU26', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZU26 + complex(0,1)*iZU26', 
	 texname = '\\text{ZU26}' ) 
 
ZU31 = 	 Parameter(name='ZU31', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZU31 + complex(0,1)*iZU31', 
	 texname = '\\text{ZU31}' ) 
 
ZU32 = 	 Parameter(name='ZU32', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZU32 + complex(0,1)*iZU32', 
	 texname = '\\text{ZU32}' ) 
 
ZU33 = 	 Parameter(name='ZU33', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZU33 + complex(0,1)*iZU33', 
	 texname = '\\text{ZU33}' ) 
 
ZU34 = 	 Parameter(name='ZU34', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZU34 + complex(0,1)*iZU34', 
	 texname = '\\text{ZU34}' ) 
 
ZU35 = 	 Parameter(name='ZU35', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZU35 + complex(0,1)*iZU35', 
	 texname = '\\text{ZU35}' ) 
 
ZU36 = 	 Parameter(name='ZU36', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZU36 + complex(0,1)*iZU36', 
	 texname = '\\text{ZU36}' ) 
 
ZU41 = 	 Parameter(name='ZU41', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZU41 + complex(0,1)*iZU41', 
	 texname = '\\text{ZU41}' ) 
 
ZU42 = 	 Parameter(name='ZU42', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZU42 + complex(0,1)*iZU42', 
	 texname = '\\text{ZU42}' ) 
 
ZU43 = 	 Parameter(name='ZU43', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZU43 + complex(0,1)*iZU43', 
	 texname = '\\text{ZU43}' ) 
 
ZU44 = 	 Parameter(name='ZU44', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZU44 + complex(0,1)*iZU44', 
	 texname = '\\text{ZU44}' ) 
 
ZU45 = 	 Parameter(name='ZU45', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZU45 + complex(0,1)*iZU45', 
	 texname = '\\text{ZU45}' ) 
 
ZU46 = 	 Parameter(name='ZU46', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZU46 + complex(0,1)*iZU46', 
	 texname = '\\text{ZU46}' ) 
 
ZU51 = 	 Parameter(name='ZU51', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZU51 + complex(0,1)*iZU51', 
	 texname = '\\text{ZU51}' ) 
 
ZU52 = 	 Parameter(name='ZU52', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZU52 + complex(0,1)*iZU52', 
	 texname = '\\text{ZU52}' ) 
 
ZU53 = 	 Parameter(name='ZU53', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZU53 + complex(0,1)*iZU53', 
	 texname = '\\text{ZU53}' ) 
 
ZU54 = 	 Parameter(name='ZU54', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZU54 + complex(0,1)*iZU54', 
	 texname = '\\text{ZU54}' ) 
 
ZU55 = 	 Parameter(name='ZU55', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZU55 + complex(0,1)*iZU55', 
	 texname = '\\text{ZU55}' ) 
 
ZU56 = 	 Parameter(name='ZU56', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZU56 + complex(0,1)*iZU56', 
	 texname = '\\text{ZU56}' ) 
 
ZU61 = 	 Parameter(name='ZU61', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZU61 + complex(0,1)*iZU61', 
	 texname = '\\text{ZU61}' ) 
 
ZU62 = 	 Parameter(name='ZU62', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZU62 + complex(0,1)*iZU62', 
	 texname = '\\text{ZU62}' ) 
 
ZU63 = 	 Parameter(name='ZU63', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZU63 + complex(0,1)*iZU63', 
	 texname = '\\text{ZU63}' ) 
 
ZU64 = 	 Parameter(name='ZU64', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZU64 + complex(0,1)*iZU64', 
	 texname = '\\text{ZU64}' ) 
 
ZU65 = 	 Parameter(name='ZU65', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZU65 + complex(0,1)*iZU65', 
	 texname = '\\text{ZU65}' ) 
 
ZU66 = 	 Parameter(name='ZU66', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZU66 + complex(0,1)*iZU66', 
	 texname = '\\text{ZU66}' ) 
 
ZE11 = 	 Parameter(name='ZE11', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZE11 + complex(0,1)*iZE11', 
	 texname = '\\text{ZE11}' ) 
 
ZE12 = 	 Parameter(name='ZE12', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZE12 + complex(0,1)*iZE12', 
	 texname = '\\text{ZE12}' ) 
 
ZE13 = 	 Parameter(name='ZE13', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZE13 + complex(0,1)*iZE13', 
	 texname = '\\text{ZE13}' ) 
 
ZE14 = 	 Parameter(name='ZE14', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZE14 + complex(0,1)*iZE14', 
	 texname = '\\text{ZE14}' ) 
 
ZE15 = 	 Parameter(name='ZE15', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZE15 + complex(0,1)*iZE15', 
	 texname = '\\text{ZE15}' ) 
 
ZE16 = 	 Parameter(name='ZE16', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZE16 + complex(0,1)*iZE16', 
	 texname = '\\text{ZE16}' ) 
 
ZE21 = 	 Parameter(name='ZE21', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZE21 + complex(0,1)*iZE21', 
	 texname = '\\text{ZE21}' ) 
 
ZE22 = 	 Parameter(name='ZE22', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZE22 + complex(0,1)*iZE22', 
	 texname = '\\text{ZE22}' ) 
 
ZE23 = 	 Parameter(name='ZE23', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZE23 + complex(0,1)*iZE23', 
	 texname = '\\text{ZE23}' ) 
 
ZE24 = 	 Parameter(name='ZE24', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZE24 + complex(0,1)*iZE24', 
	 texname = '\\text{ZE24}' ) 
 
ZE25 = 	 Parameter(name='ZE25', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZE25 + complex(0,1)*iZE25', 
	 texname = '\\text{ZE25}' ) 
 
ZE26 = 	 Parameter(name='ZE26', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZE26 + complex(0,1)*iZE26', 
	 texname = '\\text{ZE26}' ) 
 
ZE31 = 	 Parameter(name='ZE31', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZE31 + complex(0,1)*iZE31', 
	 texname = '\\text{ZE31}' ) 
 
ZE32 = 	 Parameter(name='ZE32', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZE32 + complex(0,1)*iZE32', 
	 texname = '\\text{ZE32}' ) 
 
ZE33 = 	 Parameter(name='ZE33', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZE33 + complex(0,1)*iZE33', 
	 texname = '\\text{ZE33}' ) 
 
ZE34 = 	 Parameter(name='ZE34', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZE34 + complex(0,1)*iZE34', 
	 texname = '\\text{ZE34}' ) 
 
ZE35 = 	 Parameter(name='ZE35', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZE35 + complex(0,1)*iZE35', 
	 texname = '\\text{ZE35}' ) 
 
ZE36 = 	 Parameter(name='ZE36', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZE36 + complex(0,1)*iZE36', 
	 texname = '\\text{ZE36}' ) 
 
ZE41 = 	 Parameter(name='ZE41', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZE41 + complex(0,1)*iZE41', 
	 texname = '\\text{ZE41}' ) 
 
ZE42 = 	 Parameter(name='ZE42', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZE42 + complex(0,1)*iZE42', 
	 texname = '\\text{ZE42}' ) 
 
ZE43 = 	 Parameter(name='ZE43', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZE43 + complex(0,1)*iZE43', 
	 texname = '\\text{ZE43}' ) 
 
ZE44 = 	 Parameter(name='ZE44', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZE44 + complex(0,1)*iZE44', 
	 texname = '\\text{ZE44}' ) 
 
ZE45 = 	 Parameter(name='ZE45', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZE45 + complex(0,1)*iZE45', 
	 texname = '\\text{ZE45}' ) 
 
ZE46 = 	 Parameter(name='ZE46', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZE46 + complex(0,1)*iZE46', 
	 texname = '\\text{ZE46}' ) 
 
ZE51 = 	 Parameter(name='ZE51', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZE51 + complex(0,1)*iZE51', 
	 texname = '\\text{ZE51}' ) 
 
ZE52 = 	 Parameter(name='ZE52', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZE52 + complex(0,1)*iZE52', 
	 texname = '\\text{ZE52}' ) 
 
ZE53 = 	 Parameter(name='ZE53', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZE53 + complex(0,1)*iZE53', 
	 texname = '\\text{ZE53}' ) 
 
ZE54 = 	 Parameter(name='ZE54', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZE54 + complex(0,1)*iZE54', 
	 texname = '\\text{ZE54}' ) 
 
ZE55 = 	 Parameter(name='ZE55', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZE55 + complex(0,1)*iZE55', 
	 texname = '\\text{ZE55}' ) 
 
ZE56 = 	 Parameter(name='ZE56', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZE56 + complex(0,1)*iZE56', 
	 texname = '\\text{ZE56}' ) 
 
ZE61 = 	 Parameter(name='ZE61', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZE61 + complex(0,1)*iZE61', 
	 texname = '\\text{ZE61}' ) 
 
ZE62 = 	 Parameter(name='ZE62', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZE62 + complex(0,1)*iZE62', 
	 texname = '\\text{ZE62}' ) 
 
ZE63 = 	 Parameter(name='ZE63', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZE63 + complex(0,1)*iZE63', 
	 texname = '\\text{ZE63}' ) 
 
ZE64 = 	 Parameter(name='ZE64', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZE64 + complex(0,1)*iZE64', 
	 texname = '\\text{ZE64}' ) 
 
ZE65 = 	 Parameter(name='ZE65', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZE65 + complex(0,1)*iZE65', 
	 texname = '\\text{ZE65}' ) 
 
ZE66 = 	 Parameter(name='ZE66', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZE66 + complex(0,1)*iZE66', 
	 texname = '\\text{ZE66}' ) 
 
ZN11 = 	 Parameter(name='ZN11', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN11 + complex(0,1)*iZN11', 
	 texname = '\\text{ZN11}' ) 
 
ZN12 = 	 Parameter(name='ZN12', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN12 + complex(0,1)*iZN12', 
	 texname = '\\text{ZN12}' ) 
 
ZN13 = 	 Parameter(name='ZN13', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN13 + complex(0,1)*iZN13', 
	 texname = '\\text{ZN13}' ) 
 
ZN14 = 	 Parameter(name='ZN14', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN14 + complex(0,1)*iZN14', 
	 texname = '\\text{ZN14}' ) 
 
ZN21 = 	 Parameter(name='ZN21', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN21 + complex(0,1)*iZN21', 
	 texname = '\\text{ZN21}' ) 
 
ZN22 = 	 Parameter(name='ZN22', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN22 + complex(0,1)*iZN22', 
	 texname = '\\text{ZN22}' ) 
 
ZN23 = 	 Parameter(name='ZN23', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN23 + complex(0,1)*iZN23', 
	 texname = '\\text{ZN23}' ) 
 
ZN24 = 	 Parameter(name='ZN24', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN24 + complex(0,1)*iZN24', 
	 texname = '\\text{ZN24}' ) 
 
ZN31 = 	 Parameter(name='ZN31', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN31 + complex(0,1)*iZN31', 
	 texname = '\\text{ZN31}' ) 
 
ZN32 = 	 Parameter(name='ZN32', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN32 + complex(0,1)*iZN32', 
	 texname = '\\text{ZN32}' ) 
 
ZN33 = 	 Parameter(name='ZN33', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN33 + complex(0,1)*iZN33', 
	 texname = '\\text{ZN33}' ) 
 
ZN34 = 	 Parameter(name='ZN34', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN34 + complex(0,1)*iZN34', 
	 texname = '\\text{ZN34}' ) 
 
ZN41 = 	 Parameter(name='ZN41', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN41 + complex(0,1)*iZN41', 
	 texname = '\\text{ZN41}' ) 
 
ZN42 = 	 Parameter(name='ZN42', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN42 + complex(0,1)*iZN42', 
	 texname = '\\text{ZN42}' ) 
 
ZN43 = 	 Parameter(name='ZN43', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN43 + complex(0,1)*iZN43', 
	 texname = '\\text{ZN43}' ) 
 
ZN44 = 	 Parameter(name='ZN44', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN44 + complex(0,1)*iZN44', 
	 texname = '\\text{ZN44}' ) 
 
UM11 = 	 Parameter(name='UM11', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rUM11 + complex(0,1)*iUM11', 
	 texname = '\\text{UM11}' ) 
 
UM12 = 	 Parameter(name='UM12', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rUM12 + complex(0,1)*iUM12', 
	 texname = '\\text{UM12}' ) 
 
UM21 = 	 Parameter(name='UM21', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rUM21 + complex(0,1)*iUM21', 
	 texname = '\\text{UM21}' ) 
 
UM22 = 	 Parameter(name='UM22', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rUM22 + complex(0,1)*iUM22', 
	 texname = '\\text{UM22}' ) 
 
UP11 = 	 Parameter(name='UP11', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rUP11 + complex(0,1)*iUP11', 
	 texname = '\\text{UP11}' ) 
 
UP12 = 	 Parameter(name='UP12', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rUP12 + complex(0,1)*iUP12', 
	 texname = '\\text{UP12}' ) 
 
UP21 = 	 Parameter(name='UP21', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rUP21 + complex(0,1)*iUP21', 
	 texname = '\\text{UP21}' ) 
 
UP22 = 	 Parameter(name='UP22', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rUP22 + complex(0,1)*iUP22', 
	 texname = '\\text{UP22}' ) 
 
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
 
G = 	 Parameter(name='G', 
	 nature = 'internal', 
	 type = 'real', 
	 value = '2*cmath.sqrt(aS)*cmath.sqrt(cmath.pi)', 
	 texname = 'G') 
 
ZH11 = 	 Parameter(name='ZH11', 
	 nature = 'internal', 
	 type = 'real', 
	 value = '-cmath.sin(alphaH)', 
	 texname = 'ZH11') 
 
ZH12 = 	 Parameter(name='ZH12', 
	 nature = 'internal', 
	 type = 'real', 
	 value = 'cmath.cos(alphaH)', 
	 texname = 'ZH12') 
 
ZH21 = 	 Parameter(name='ZH21', 
	 nature = 'internal', 
	 type = 'real', 
	 value = 'cmath.cos(alphaH)', 
	 texname = 'ZH21') 
 
ZH22 = 	 Parameter(name='ZH22', 
	 nature = 'internal', 
	 type = 'real', 
	 value = 'cmath.sin(alphaH)', 
	 texname = 'ZH22') 
 
ZA11 = 	 Parameter(name='ZA11', 
	 nature = 'internal', 
	 type = 'real', 
	 value = '-cmath.cos(betaH)', 
	 texname = 'ZA11') 
 
ZA12 = 	 Parameter(name='ZA12', 
	 nature = 'internal', 
	 type = 'real', 
	 value = 'cmath.sin(betaH)', 
	 texname = 'ZA12') 
 
ZA21 = 	 Parameter(name='ZA21', 
	 nature = 'internal', 
	 type = 'real', 
	 value = 'cmath.sin(betaH)', 
	 texname = 'ZA21') 
 
ZA22 = 	 Parameter(name='ZA22', 
	 nature = 'internal', 
	 type = 'real', 
	 value = 'cmath.cos(betaH)', 
	 texname = 'ZA22') 
 
ZP11 = 	 Parameter(name='ZP11', 
	 nature = 'internal', 
	 type = 'real', 
	 value = '-cmath.cos(betaH)', 
	 texname = 'ZP11') 
 
ZP12 = 	 Parameter(name='ZP12', 
	 nature = 'internal', 
	 type = 'real', 
	 value = 'cmath.sin(betaH)', 
	 texname = 'ZP12') 
 
ZP21 = 	 Parameter(name='ZP21', 
	 nature = 'internal', 
	 type = 'real', 
	 value = 'cmath.sin(betaH)', 
	 texname = 'ZP21') 
 
ZP22 = 	 Parameter(name='ZP22', 
	 nature = 'internal', 
	 type = 'real', 
	 value = 'cmath.cos(betaH)', 
	 texname = 'ZP22') 
 
el = 	 Parameter(name='el', 
	 nature = 'internal', 
	 type = 'real', 
	 value = '2*cmath.sqrt(1/aEWM1)*cmath.sqrt(cmath.pi)', 
	 texname = 'el') 
 
MWm = 	 Parameter(name='MWm', 
	 nature = 'internal', 
	 type = 'real', 
	 value = 'cmath.sqrt(MZ**2/2. + cmath.sqrt(MZ**4/4. - (MZ**2*cmath.pi)/(cmath.sqrt(2)*aEWM1*Gf)))', 
	 texname = 'MWm') 
 
TW = 	 Parameter(name='TW', 
	 nature = 'internal', 
	 type = 'real', 
	 value = 'cmath.asin(cmath.sqrt(1 - MWm**2/MZ**2))', 
	 texname = 'TW') 
 
g1 = 	 Parameter(name='g1', 
	 nature = 'internal', 
	 type = 'real', 
	 value = 'el*1./cmath.cos(TW)', 
	 texname = 'g1') 
 
g2 = 	 Parameter(name='g2', 
	 nature = 'internal', 
	 type = 'real', 
	 value = 'el*1./cmath.sin(TW)', 
	 texname = 'g2') 
 
v = 	 Parameter(name='v', 
	 nature = 'internal', 
	 type = 'real', 
	 value = '2*cmath.sqrt(MWm**2/g2**2)', 
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
 
RXiWm = 	 Parameter(name='RXiWm', 
	 nature = 'internal', 
	 type = 'real', 
	 value = '1.', 
	 texname = 'RXiWm') 
 
RXiZ = 	 Parameter(name='RXiZ', 
	 nature = 'internal', 
	 type = 'real', 
	 value = '1.', 
	 texname = 'RXiZ') 
 
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
 
APP2 = 	 Parameter(name='APP2', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{APP2}', 
	 lhablock = 'EFFHIGGSCOUPLINGS', 
	 lhacode = [36,22,22] ) 
 
AGG2 = 	 Parameter(name='AGG2', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{AGG2}', 
	 lhablock = 'EFFHIGGSCOUPLINGS', 
	 lhacode = [36,21,21] ) 
 

# ----------------------------------------------------------------------  
# This model file was automatically created by SARAH version4.8.1 
# SARAH References: arXiv:0806.0538, arXiv:0909.2863, arXiv:1002.0840    
# (c) Florian Staub, 2011  
# ----------------------------------------------------------------------  
# File created at 16:59 on 21.3.2016   
# ----------------------------------------------------------------------  
 
 
from __future__ import division 
from object_library import all_particles,Particle 
import parameters as Param 


cp = Particle(pdg_code =17, 
	 name = 'cp' ,
	 antiname = 'cpbar' ,
	 spin = 2 ,
	 color = 1 ,
	 mass = Param.Mcp ,
	 width = Param.Wcp ,
	 GhostNumber = 0, 
	 line = 'swavy' ,
	 charge = 1 ,
	 texname = 'cp' ,
	 antitexname = 'cpbar' ) 
 
cpbar = cp.anti() 
 
 
cpp = Particle(pdg_code =6000055, 
	 name = 'cpp' ,
	 antiname = 'cppbar' ,
	 spin = 2 ,
	 color = 1 ,
	 mass = Param.Mcpp ,
	 width = Param.Wcpp ,
	 GhostNumber = 0, 
	 line = 'swavy' ,
	 charge = 2 ,
	 texname = 'cpp' ,
	 antitexname = 'cppbar' ) 
 
cppbar = cpp.anti() 
 
 
d1 = Particle(pdg_code =1, 
	 name = 'd1' ,
	 antiname = 'd1bar' ,
	 spin = 2 ,
	 color = 3 ,
	 mass = Param.Md1 ,
	 width = Param.ZERO ,
	 GhostNumber = 0, 
	 line = 'swavy' ,
	 charge = -1/3 ,
	 texname = 'd1' ,
	 antitexname = 'd1bar' ) 
 
d1bar = d1.anti() 
 
 
d2 = Particle(pdg_code =3, 
	 name = 'd2' ,
	 antiname = 'd2bar' ,
	 spin = 2 ,
	 color = 3 ,
	 mass = Param.Md2 ,
	 width = Param.ZERO ,
	 GhostNumber = 0, 
	 line = 'swavy' ,
	 charge = -1/3 ,
	 texname = 'd2' ,
	 antitexname = 'd2bar' ) 
 
d2bar = d2.anti() 
 
 
d3 = Particle(pdg_code =5, 
	 name = 'd3' ,
	 antiname = 'd3bar' ,
	 spin = 2 ,
	 color = 3 ,
	 mass = Param.Md3 ,
	 width = Param.ZERO ,
	 GhostNumber = 0, 
	 line = 'swavy' ,
	 charge = -1/3 ,
	 texname = 'd3' ,
	 antitexname = 'd3bar' ) 
 
d3bar = d3.anti() 
 
 
u1 = Particle(pdg_code =2, 
	 name = 'u1' ,
	 antiname = 'u1bar' ,
	 spin = 2 ,
	 color = 3 ,
	 mass = Param.Mu1 ,
	 width = Param.ZERO ,
	 GhostNumber = 0, 
	 line = 'swavy' ,
	 charge = 2/3 ,
	 texname = 'u1' ,
	 antitexname = 'u1bar' ) 
 
u1bar = u1.anti() 
 
 
u2 = Particle(pdg_code =4, 
	 name = 'u2' ,
	 antiname = 'u2bar' ,
	 spin = 2 ,
	 color = 3 ,
	 mass = Param.Mu2 ,
	 width = Param.ZERO ,
	 GhostNumber = 0, 
	 line = 'swavy' ,
	 charge = 2/3 ,
	 texname = 'u2' ,
	 antitexname = 'u2bar' ) 
 
u2bar = u2.anti() 
 
 
u3 = Particle(pdg_code =6, 
	 name = 'u3' ,
	 antiname = 'u3bar' ,
	 spin = 2 ,
	 color = 3 ,
	 mass = Param.Mu3 ,
	 width = Param.Wu3 ,
	 GhostNumber = 0, 
	 line = 'swavy' ,
	 charge = 2/3 ,
	 texname = 'u3' ,
	 antitexname = 'u3bar' ) 
 
u3bar = u3.anti() 
 
 
e1 = Particle(pdg_code =11, 
	 name = 'e1' ,
	 antiname = 'e1bar' ,
	 spin = 2 ,
	 color = 1 ,
	 mass = Param.Me1 ,
	 width = Param.ZERO ,
	 GhostNumber = 0, 
	 line = 'swavy' ,
	 charge = 1 ,
	 texname = 'e1' ,
	 antitexname = 'e1bar' ) 
 
e1bar = e1.anti() 
 
 
e2 = Particle(pdg_code =13, 
	 name = 'e2' ,
	 antiname = 'e2bar' ,
	 spin = 2 ,
	 color = 1 ,
	 mass = Param.Me2 ,
	 width = Param.ZERO ,
	 GhostNumber = 0, 
	 line = 'swavy' ,
	 charge = 1 ,
	 texname = 'e2' ,
	 antitexname = 'e2bar' ) 
 
e2bar = e2.anti() 
 
 
e3 = Particle(pdg_code =15, 
	 name = 'e3' ,
	 antiname = 'e3bar' ,
	 spin = 2 ,
	 color = 1 ,
	 mass = Param.Me3 ,
	 width = Param.ZERO ,
	 GhostNumber = 0, 
	 line = 'swavy' ,
	 charge = 1 ,
	 texname = 'e3' ,
	 antitexname = 'e3bar' ) 
 
e3bar = e3.anti() 
 
 
nu1 = Particle(pdg_code =12, 
	 name = 'nu1' ,
	 antiname = 'nu1' ,
	 spin = 2 ,
	 color = 1 ,
	 mass = Param.Mnu1 ,
	 width = Param.Wnu1 ,
	 GhostNumber = 0, 
	 line = 'swavy' ,
	 charge = 0 ,
	 texname = 'nu1' ,
	 antitexname = 'nu1' ) 
 
nu2 = Particle(pdg_code =14, 
	 name = 'nu2' ,
	 antiname = 'nu2' ,
	 spin = 2 ,
	 color = 1 ,
	 mass = Param.Mnu2 ,
	 width = Param.Wnu2 ,
	 GhostNumber = 0, 
	 line = 'swavy' ,
	 charge = 0 ,
	 texname = 'nu2' ,
	 antitexname = 'nu2' ) 
 
nu3 = Particle(pdg_code =16, 
	 name = 'nu3' ,
	 antiname = 'nu3' ,
	 spin = 2 ,
	 color = 1 ,
	 mass = Param.Mnu3 ,
	 width = Param.Wnu3 ,
	 GhostNumber = 0, 
	 line = 'swavy' ,
	 charge = 0 ,
	 texname = 'nu3' ,
	 antitexname = 'nu3' ) 
 
nu4 = Particle(pdg_code =6000012, 
	 name = 'nu4' ,
	 antiname = 'nu4' ,
	 spin = 2 ,
	 color = 1 ,
	 mass = Param.Mnu4 ,
	 width = Param.Wnu4 ,
	 GhostNumber = 0, 
	 line = 'swavy' ,
	 charge = 0 ,
	 texname = 'nu4' ,
	 antitexname = 'nu4' ) 
 
nu5 = Particle(pdg_code =6000014, 
	 name = 'nu5' ,
	 antiname = 'nu5' ,
	 spin = 2 ,
	 color = 1 ,
	 mass = Param.Mnu5 ,
	 width = Param.Wnu5 ,
	 GhostNumber = 0, 
	 line = 'swavy' ,
	 charge = 0 ,
	 texname = 'nu5' ,
	 antitexname = 'nu5' ) 
 
nu6 = Particle(pdg_code =6000016, 
	 name = 'nu6' ,
	 antiname = 'nu6' ,
	 spin = 2 ,
	 color = 1 ,
	 mass = Param.Mnu6 ,
	 width = Param.Wnu6 ,
	 GhostNumber = 0, 
	 line = 'swavy' ,
	 charge = 0 ,
	 texname = 'nu6' ,
	 antitexname = 'nu6' ) 
 
c01 = Particle(pdg_code =9000012, 
	 name = 'c01' ,
	 antiname = 'c01' ,
	 spin = 2 ,
	 color = 1 ,
	 mass = Param.Mc01 ,
	 width = Param.Wc01 ,
	 GhostNumber = 0, 
	 line = 'swavy' ,
	 charge = 0 ,
	 texname = 'c01' ,
	 antitexname = 'c01' ) 
 
c02 = Particle(pdg_code =9000014, 
	 name = 'c02' ,
	 antiname = 'c02' ,
	 spin = 2 ,
	 color = 1 ,
	 mass = Param.Mc02 ,
	 width = Param.Wc02 ,
	 GhostNumber = 0, 
	 line = 'swavy' ,
	 charge = 0 ,
	 texname = 'c02' ,
	 antitexname = 'c02' ) 
 
Hmm = Particle(pdg_code =9000055, 
	 name = 'Hmm' ,
	 antiname = 'Hmmc' ,
	 spin = 1 ,
	 color = 1 ,
	 mass = Param.MHmm ,
	 width = Param.WHmm ,
	 GhostNumber = 0, 
	 line = 'dashed' ,
	 charge = 2 ,
	 texname = 'Hmm' ,
	 antitexname = 'Hmmc' ) 
 
Hmmc = Hmm.anti() 
 
 
hh1 = Particle(pdg_code =25, 
	 name = 'hh1' ,
	 antiname = 'hh1' ,
	 spin = 1 ,
	 color = 1 ,
	 mass = Param.Mhh1 ,
	 width = Param.Whh1 ,
	 GhostNumber = 0, 
	 line = 'dashed' ,
	 charge = 0 ,
	 texname = 'hh1' ,
	 antitexname = 'hh1' ) 
 
hh2 = Particle(pdg_code =35, 
	 name = 'hh2' ,
	 antiname = 'hh2' ,
	 spin = 1 ,
	 color = 1 ,
	 mass = Param.Mhh2 ,
	 width = Param.Whh2 ,
	 GhostNumber = 0, 
	 line = 'dashed' ,
	 charge = 0 ,
	 texname = 'hh2' ,
	 antitexname = 'hh2' ) 
 
hh3 = Particle(pdg_code =335, 
	 name = 'hh3' ,
	 antiname = 'hh3' ,
	 spin = 1 ,
	 color = 1 ,
	 mass = Param.Mhh3 ,
	 width = Param.Whh3 ,
	 GhostNumber = 0, 
	 line = 'dashed' ,
	 charge = 0 ,
	 texname = 'hh3' ,
	 antitexname = 'hh3' ) 
 
Ah1 = Particle(pdg_code =999900, 
	 name = 'Ah1' ,
	 antiname = 'Ah1' ,
	 spin = 1 ,
	 color = 1 ,
	 mass = Param.ZERO ,
	 width = Param.ZERO ,
	 GhostNumber = 0, 
	 line = 'dashed' ,
	 charge = 0 ,
	 GoldstoneBoson = True ,
	 texname = 'Ah1' ,
	 antitexname = 'Ah1' ) 
 
Ah2 = Particle(pdg_code =999901, 
	 name = 'Ah2' ,
	 antiname = 'Ah2' ,
	 spin = 1 ,
	 color = 1 ,
	 mass = Param.ZERO ,
	 width = Param.ZERO ,
	 GhostNumber = 0, 
	 line = 'dashed' ,
	 charge = 0 ,
	 GoldstoneBoson = True ,
	 texname = 'Ah2' ,
	 antitexname = 'Ah2' ) 
 
Ah3 = Particle(pdg_code =36, 
	 name = 'Ah3' ,
	 antiname = 'Ah3' ,
	 spin = 1 ,
	 color = 1 ,
	 mass = Param.MAh3 ,
	 width = Param.WAh3 ,
	 GhostNumber = 0, 
	 line = 'dashed' ,
	 charge = 0 ,
	 texname = 'Ah3' ,
	 antitexname = 'Ah3' ) 
 
Hm1 = Particle(pdg_code =999902, 
	 name = 'Hm1' ,
	 antiname = 'Hm1c' ,
	 spin = 1 ,
	 color = 1 ,
	 mass = Param.ZERO ,
	 width = Param.ZERO ,
	 GhostNumber = 0, 
	 line = 'dashed' ,
	 charge = -1 ,
	 GoldstoneBoson = True ,
	 texname = 'Hm1' ,
	 antitexname = 'Hm1c' ) 
 
Hm1c = Hm1.anti() 
 
 
Hm2 = Particle(pdg_code =999903, 
	 name = 'Hm2' ,
	 antiname = 'Hm2c' ,
	 spin = 1 ,
	 color = 1 ,
	 mass = Param.ZERO ,
	 width = Param.ZERO ,
	 GhostNumber = 0, 
	 line = 'dashed' ,
	 charge = -1 ,
	 GoldstoneBoson = True ,
	 texname = 'Hm2' ,
	 antitexname = 'Hm2c' ) 
 
Hm2c = Hm2.anti() 
 
 
Hm3 = Particle(pdg_code =-37, 
	 name = 'Hm3' ,
	 antiname = 'Hm3c' ,
	 spin = 1 ,
	 color = 1 ,
	 mass = Param.MHm3 ,
	 width = Param.WHm3 ,
	 GhostNumber = 0, 
	 line = 'dashed' ,
	 charge = -1 ,
	 texname = 'Hm3' ,
	 antitexname = 'Hm3c' ) 
 
Hm3c = Hm3.anti() 
 
 
g = Particle(pdg_code =21, 
	 name = 'g' ,
	 antiname = 'g' ,
	 spin = 3 ,
	 color = 8 ,
	 mass = Param.ZERO ,
	 width = Param.ZERO ,
	 GhostNumber = 0, 
	 line = 'wavy' ,
	 charge = 0 ,
	 texname = 'g' ,
	 antitexname = 'g' ) 
 
A = Particle(pdg_code =22, 
	 name = 'A' ,
	 antiname = 'A' ,
	 spin = 3 ,
	 color = 1 ,
	 mass = Param.ZERO ,
	 width = Param.ZERO ,
	 GhostNumber = 0, 
	 line = 'wavy' ,
	 charge = 0 ,
	 texname = 'A' ,
	 antitexname = 'A' ) 
 
Z = Particle(pdg_code =23, 
	 name = 'Z' ,
	 antiname = 'Z' ,
	 spin = 3 ,
	 color = 1 ,
	 mass = Param.MZ ,
	 width = Param.WZ ,
	 GhostNumber = 0, 
	 line = 'wavy' ,
	 charge = 0 ,
	 texname = 'Z' ,
	 antitexname = 'Z' ) 
 
Zp = Particle(pdg_code =32, 
	 name = 'Zp' ,
	 antiname = 'Zp' ,
	 spin = 3 ,
	 color = 1 ,
	 mass = Param.MZp ,
	 width = Param.WZp ,
	 GhostNumber = 0, 
	 line = 'wavy' ,
	 charge = 0 ,
	 texname = 'Zp' ,
	 antitexname = 'Zp' ) 
 
WLm = Particle(pdg_code =-24, 
	 name = 'WLm' ,
	 antiname = 'WLmc' ,
	 spin = 3 ,
	 color = 1 ,
	 mass = Param.MWLm ,
	 width = Param.WWLm ,
	 GhostNumber = 0, 
	 line = 'wavy' ,
	 charge = -1 ,
	 texname = 'WLm' ,
	 antitexname = 'WLmc' ) 
 
WLmc = WLm.anti() 
 
 
WRm = Particle(pdg_code =34, 
	 name = 'WRm' ,
	 antiname = 'WRmc' ,
	 spin = 3 ,
	 color = 1 ,
	 mass = Param.MWRm ,
	 width = Param.WWRm ,
	 GhostNumber = 0, 
	 line = 'wavy' ,
	 charge = -1 ,
	 texname = 'WRm' ,
	 antitexname = 'WRmc' ) 
 
WRmc = WRm.anti() 
 
 
gG = Particle(pdg_code =999904, 
	 name = 'gG' ,
	 antiname = 'gGc' ,
	 spin = -1 ,
	 color = 8 ,
	 mass = Param.ZERO ,
	 width = Param.ZERO ,
	 GhostNumber = 1, 
	 line = 'dotted' ,
	 charge = 0 ,
	 texname = 'gG' ,
	 antitexname = 'gGc' ) 
 
gGc = gG.anti() 
 
 
gP = Particle(pdg_code =999905, 
	 name = 'gP' ,
	 antiname = 'gPc' ,
	 spin = -1 ,
	 color = 1 ,
	 mass = Param.ZERO ,
	 width = Param.ZERO ,
	 GhostNumber = 1, 
	 line = 'dotted' ,
	 charge = 0 ,
	 texname = 'gP' ,
	 antitexname = 'gPc' ) 
 
gPc = gP.anti() 
 
 
gZ = Particle(pdg_code =999906, 
	 name = 'gZ' ,
	 antiname = 'gZc' ,
	 spin = -1 ,
	 color = 1 ,
	 mass = Param.MZ ,
	 width = Param.WZ ,
	 GhostNumber = 1, 
	 line = 'dotted' ,
	 charge = 0 ,
	 texname = 'gZ' ,
	 antitexname = 'gZc' ) 
 
gZc = gZ.anti() 
 
 
gZp = Particle(pdg_code =999907, 
	 name = 'gZp' ,
	 antiname = 'gZpc' ,
	 spin = -1 ,
	 color = 1 ,
	 mass = Param.MZp ,
	 width = Param.WZp ,
	 GhostNumber = 1, 
	 line = 'dotted' ,
	 charge = 0 ,
	 texname = 'gZp' ,
	 antitexname = 'gZpc' ) 
 
gZpc = gZp.anti() 
 
 
gWLm = Particle(pdg_code =999908, 
	 name = 'gWLm' ,
	 antiname = 'gWLmc' ,
	 spin = -1 ,
	 color = 1 ,
	 mass = Param.MWLm ,
	 width = Param.WWLm ,
	 GhostNumber = 1, 
	 line = 'dotted' ,
	 charge = -1 ,
	 texname = 'gWLm' ,
	 antitexname = 'gWLmc' ) 
 
gWLmc = gWLm.anti() 
 
 
gWLp = Particle(pdg_code =999909, 
	 name = 'gWLp' ,
	 antiname = 'gWLpc' ,
	 spin = -1 ,
	 color = 1 ,
	 mass = Param.MWLm ,
	 width = Param.WWLm ,
	 GhostNumber = 1, 
	 line = 'dotted' ,
	 charge = 1 ,
	 texname = 'gWLp' ,
	 antitexname = 'gWLpc' ) 
 
gWLpc = gWLp.anti() 
 
 
gWRm = Particle(pdg_code =999910, 
	 name = 'gWRm' ,
	 antiname = 'gWRmc' ,
	 spin = -1 ,
	 color = 1 ,
	 mass = Param.MWRm ,
	 width = Param.WWRm ,
	 GhostNumber = 1, 
	 line = 'dotted' ,
	 charge = -1 ,
	 texname = 'gWRm' ,
	 antitexname = 'gWRmc' ) 
 
gWRmc = gWRm.anti() 
 
 
gWRp = Particle(pdg_code =999911, 
	 name = 'gWRp' ,
	 antiname = 'gWRpc' ,
	 spin = -1 ,
	 color = 1 ,
	 mass = Param.MWRm ,
	 width = Param.WWRm ,
	 GhostNumber = 1, 
	 line = 'dotted' ,
	 charge = 1 ,
	 texname = 'gWRp' ,
	 antitexname = 'gWRpc' ) 
 
gWRpc = gWRp.anti() 
 
 

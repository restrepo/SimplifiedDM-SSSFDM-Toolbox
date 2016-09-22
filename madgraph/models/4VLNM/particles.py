# ----------------------------------------------------------------------  
# This model file was automatically created by SARAH version4.5.8 
# SARAH References: arXiv:0806.0538, arXiv:0909.2863, arXiv:1002.0840    
# (c) Florian Staub, 2011  
# ----------------------------------------------------------------------  
# File created at 13:39 on 14.10.2015   
# ----------------------------------------------------------------------  
 
 
from __future__ import division 
from object_library import all_particles,Particle 
import parameters as Param 


nu1 = Particle(pdg_code =12, 
	 name = 'nu1' ,
	 antiname = 'nu1bar' ,
	 spin = 2 ,
	 color = 1 ,
	 mass = Param.ZERO ,
	 width = Param.ZERO ,
	 GhostNumber = 0, 
	 line = 'straight' ,
	 charge = 0 ,
	 texname = 'nu1' ,
	 antitexname = 'nu1bar' ) 
 
nu1bar = nu1.anti() 
 
 
nu2 = Particle(pdg_code =14, 
	 name = 'nu2' ,
	 antiname = 'nu2bar' ,
	 spin = 2 ,
	 color = 1 ,
	 mass = Param.ZERO ,
	 width = Param.ZERO ,
	 GhostNumber = 0, 
	 line = 'straight' ,
	 charge = 0 ,
	 texname = 'nu2' ,
	 antitexname = 'nu2bar' ) 
 
nu2bar = nu2.anti() 
 
 
nu3 = Particle(pdg_code =16, 
	 name = 'nu3' ,
	 antiname = 'nu3bar' ,
	 spin = 2 ,
	 color = 1 ,
	 mass = Param.ZERO ,
	 width = Param.ZERO ,
	 GhostNumber = 0, 
	 line = 'straight' ,
	 charge = 0 ,
	 texname = 'nu3' ,
	 antitexname = 'nu3bar' ) 
 
nu3bar = nu3.anti() 
 
 
d1 = Particle(pdg_code =1, 
	 name = 'd1' ,
	 antiname = 'd1bar' ,
	 spin = 2 ,
	 color = 3 ,
	 mass = Param.Md1 ,
	 width = Param.ZERO ,
	 GhostNumber = 0, 
	 line = 'straight' ,
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
	 line = 'straight' ,
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
	 line = 'straight' ,
	 charge = -1/3 ,
	 texname = 'd3' ,
	 antitexname = 'd3bar' ) 
 
d3bar = d3.anti() 
 
 
d41 = Particle(pdg_code =100007, 
	 name = 'd41' ,
	 antiname = 'd41bar' ,
	 spin = 2 ,
	 color = 6 ,
	 mass = Param.Md41 ,
	 width = Param.ZERO ,
	 GhostNumber = 0, 
	 line = 'swavy' ,
	 charge = -1/3 ,
	 texname = 'd41' ,
	 antitexname = 'd41bar' ) 
 
d41bar = d41.anti() 
 
 
d42 = Particle(pdg_code =100009, 
	 name = 'd42' ,
	 antiname = 'd42bar' ,
	 spin = 2 ,
	 color = 6 ,
	 mass = Param.Md42 ,
	 width = Param.ZERO ,
	 GhostNumber = 0, 
	 line = 'swavy' ,
	 charge = -1/3 ,
	 texname = 'd42' ,
	 antitexname = 'd42bar' ) 
 
d42bar = d42.anti() 
 
 
u1 = Particle(pdg_code =2, 
	 name = 'u1' ,
	 antiname = 'u1bar' ,
	 spin = 2 ,
	 color = 3 ,
	 mass = Param.Mu1 ,
	 width = Param.ZERO ,
	 GhostNumber = 0, 
	 line = 'straight' ,
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
	 line = 'straight' ,
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
	 line = 'straight' ,
	 charge = 2/3 ,
	 texname = 'u3' ,
	 antitexname = 'u3bar' ) 
 
u3bar = u3.anti() 
 
 
u41 = Particle(pdg_code =100008, 
	 name = 'u41' ,
	 antiname = 'u41bar' ,
	 spin = 2 ,
	 color = 6 ,
	 mass = Param.Mu41 ,
	 width = Param.ZERO ,
	 GhostNumber = 0, 
	 line = 'swavy' ,
	 charge = 2/3 ,
	 texname = 'u41' ,
	 antitexname = 'u41bar' ) 
 
u41bar = u41.anti() 
 
 
u42 = Particle(pdg_code =100010, 
	 name = 'u42' ,
	 antiname = 'u42bar' ,
	 spin = 2 ,
	 color = 6 ,
	 mass = Param.Mu42 ,
	 width = Param.ZERO ,
	 GhostNumber = 0, 
	 line = 'swavy' ,
	 charge = 2/3 ,
	 texname = 'u42' ,
	 antitexname = 'u42bar' ) 
 
u42bar = u42.anti() 
 
 
e1 = Particle(pdg_code =11, 
	 name = 'e1' ,
	 antiname = 'e1bar' ,
	 spin = 2 ,
	 color = 1 ,
	 mass = Param.Me1 ,
	 width = Param.ZERO ,
	 GhostNumber = 0, 
	 line = 'straight' ,
	 charge = -1 ,
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
	 line = 'straight' ,
	 charge = -1 ,
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
	 line = 'straight' ,
	 charge = -1 ,
	 texname = 'e3' ,
	 antitexname = 'e3bar' ) 
 
e3bar = e3.anti() 
 
 
h1 = Particle(pdg_code =25, 
	 name = 'h1' ,
	 antiname = 'h1' ,
	 spin = 1 ,
	 color = 1 ,
	 mass = Param.Mh1 ,
	 width = Param.Wh1 ,
	 GhostNumber = 0, 
	 line = 'dashed' ,
	 charge = 0 ,
	 texname = 'h1' ,
	 antitexname = 'h1' ) 
 
h2 = Particle(pdg_code =35, 
	 name = 'h2' ,
	 antiname = 'h2' ,
	 spin = 1 ,
	 color = 1 ,
	 mass = Param.Mh2 ,
	 width = Param.Wh2 ,
	 GhostNumber = 0, 
	 line = 'dashed' ,
	 charge = 0 ,
	 texname = 'h2' ,
	 antitexname = 'h2' ) 
 
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
 
Ah2 = Particle(pdg_code =36, 
	 name = 'Ah2' ,
	 antiname = 'Ah2' ,
	 spin = 1 ,
	 color = 1 ,
	 mass = Param.MAh2 ,
	 width = Param.WAh2 ,
	 GhostNumber = 0, 
	 line = 'dashed' ,
	 charge = 0 ,
	 texname = 'Ah2' ,
	 antitexname = 'Ah2' ) 
 
Hm1 = Particle(pdg_code =999901, 
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
 
 
Hm2 = Particle(pdg_code =-37, 
	 name = 'Hm2' ,
	 antiname = 'Hm2c' ,
	 spin = 1 ,
	 color = 1 ,
	 mass = Param.MHm2 ,
	 width = Param.WHm2 ,
	 GhostNumber = 0, 
	 line = 'dashed' ,
	 charge = -1 ,
	 texname = 'Hm2' ,
	 antitexname = 'Hm2c' ) 
 
Hm2c = Hm2.anti() 
 
 
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
 
Wm = Particle(pdg_code =-24, 
	 name = 'Wm' ,
	 antiname = 'Wmc' ,
	 spin = 3 ,
	 color = 1 ,
	 mass = Param.MWm ,
	 width = Param.WWm ,
	 GhostNumber = 0, 
	 line = 'wavy' ,
	 charge = -1 ,
	 texname = 'Wm' ,
	 antitexname = 'Wmc' ) 
 
Wmc = Wm.anti() 
 
 
gG = Particle(pdg_code =999902, 
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
 
 
gA = Particle(pdg_code =999903, 
	 name = 'gA' ,
	 antiname = 'gAc' ,
	 spin = -1 ,
	 color = 1 ,
	 mass = Param.ZERO ,
	 width = Param.ZERO ,
	 GhostNumber = 1, 
	 line = 'dotted' ,
	 charge = 0 ,
	 texname = 'gA' ,
	 antitexname = 'gAc' ) 
 
gAc = gA.anti() 
 
 
gZ = Particle(pdg_code =999904, 
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
 
 
gWm = Particle(pdg_code =999905, 
	 name = 'gWm' ,
	 antiname = 'gWmc' ,
	 spin = -1 ,
	 color = 1 ,
	 mass = Param.MWm ,
	 width = Param.WWm ,
	 GhostNumber = 1, 
	 line = 'dotted' ,
	 charge = -1 ,
	 texname = 'gWm' ,
	 antitexname = 'gWmc' ) 
 
gWmc = gWm.anti() 
 
 
gWpC = Particle(pdg_code =999906, 
	 name = 'gWpC' ,
	 antiname = 'gWpCc' ,
	 spin = -1 ,
	 color = 1 ,
	 mass = Param.MWm ,
	 width = Param.WWm ,
	 GhostNumber = 1, 
	 line = 'dotted' ,
	 charge = 1 ,
	 texname = 'gWpC' ,
	 antitexname = 'gWpCc' ) 
 
gWpCc = gWpC.anti() 
 
 

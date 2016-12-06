

ParticleDefinitions[GaugeES] = {
      {H0,  {    PDG -> {0},
                 Width -> 0, 
                 Mass -> Automatic,
                 FeynArtsNr -> 1,
                 LaTeX -> "H^0",
                 OutputName -> "H0" }},                         
      
      
      {Hp,  {    PDG -> {0},
                 Width -> 0, 
                 Mass -> Automatic,
                 FeynArtsNr -> 2,
                 LaTeX -> "H^+",
                 OutputName -> "Hp" }}, 
                 
               
    
      {VB,   { Description -> "B-Boson"}},                                                   
      {VG,   { Description -> "Gluon"}},          
      {VWB,  { Description -> "W-Bosons"}},          
      {gB,   { Description -> "B-Boson Ghost"}},                                                   
      {gG,   { Description -> "Gluon Ghost" }},          
      {gWB,  { Description -> "W-Boson Ghost"}}
      
      };
      
      
      
      
  ParticleDefinitions[EWSB] = {
            
      
     {hh   ,  {  Description -> "Higgs",
                 PDG -> {25},
                 PDG.IX -> {101000001} }},

     {ss   , {  Description -> "Singlet",
	       PDG -> {6666635},
	       PDG.IX -> {101000002},
               FeynArtsNr -> 10,
               Mass -> LesHouches,               
               LaTeX -> "S",
               ElectricCharge -> 0,
               LHPC -> {"gold"},
       	       OutputName -> "Ss" }},

                 
     {Ah   ,  {  Description -> "Pseudo-Scalar Higgs",
                 PDG -> {0},
                 PDG.IX ->{0},
                 Mass -> {0},
                 Width -> {0} }},                       
     {Hp,     { Description -> "Charged Higgs", 
                 PDG -> {0},
                 PDG.IX ->{0},
                 Width -> {0}, 
                 Mass -> {0},
                 LaTeX -> {"H^+","H^-"},
                 OutputName -> {"Hp","Hm"}
                 }},                                                   
      
      {VP,   { Description -> "Photon"}}, 
      {VZ,   { Description -> "Z-Boson", Goldstone -> Ah }}, 
      {VG,   { Description -> "Gluon" }},          
      {VWp,  { Description -> "W+ - Boson", Goldstone -> Hp }},         
 
      {gP,   { Description -> "Photon Ghost"}},                                                   
      {gWp,  { Description -> "Positive W+ - Boson Ghost"}}, 
      {gWpC, { Description -> "Negative W+ - Boson Ghost" }}, 
      {gZ,   { Description -> "Z-Boson Ghost" }},
      {gG,   { Description -> "Gluon Ghost" }},          
                 
      {Fd,   { Description -> "Down-Quarks"}},   
      {Fu,   { Description -> "Up-Quarks"}},   
      {Fe,   { Description -> "Leptons" }},
      {Fv,   { Description -> "Neutrinos" }} ,
    
    
      (* New Fermion Sector *)
      
       {Ft0,  { PDG -> {6000059},
              Width -> External,
	      Mass -> LesHouches,
              ElectricCharge -> 0,
              LaTeX -> "Ft0",
	      OutputName -> "Ft0" }},

      {Fre,  { PDG -> {6000061},
              Width -> External,
	      Mass -> LesHouches,
	      ElectricCharge -> -1,
              LaTeX -> "\psi",
	      OutputName -> "Fre" }}
      
      };    
        
        
        
 WeylFermionAndIndermediate = {
     
    {H,      {   PDG -> {0},
                 Width -> 0, 
                 Mass -> Automatic,
                 LaTeX -> "H",
                 OutputName -> "H" }},


    {S,      {   PDG -> {0},
                 Width -> 0, 
                 Mass -> Automatic,
                 LaTeX -> "S",
                 OutputName -> "" }},
   {dR,     {LaTeX -> "d_R" }},
   {eR,     {LaTeX -> "e_R" }},
   {lep,     {LaTeX -> "l" }},
   {uR,     {LaTeX -> "u_R" }},
   {q,     {LaTeX -> "q" }},
   {eL,     {LaTeX -> "e_L" }},
   {dL,     {LaTeX -> "d_L" }},
   {uL,     {LaTeX -> "u_L" }},
   {vL,     {LaTeX -> "\\nu_L" }},

   {DR,     {LaTeX -> "D_R" }},
   {ER,     {LaTeX -> "E_R" }},
   {UR,     {LaTeX -> "U_R" }},
   {EL,     {LaTeX -> "E_L" }},
   {DL,     {LaTeX -> "D_L" }},
   {UL,     {LaTeX -> "U_L" }},
   {VL,     {LaTeX -> "V_L" }},
   
   {T,     {LaTeX -> "T^F" }},
   {t0,     {LaTeX -> "T^0" }},
   {ed,     {LaTeX -> "e_d^+" }},
   {eu,     {LaTeX -> "e_u^-" }}
 
    };       



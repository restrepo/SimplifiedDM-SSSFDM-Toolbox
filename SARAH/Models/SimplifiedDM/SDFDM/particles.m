
(* check feynarts *)
ParticleDefinitions[GaugeES] = {
      {H0,  {    PDG -> 0,
                 Width -> 0, 
                 Mass -> Automatic,
                 FeynArtsNr -> 1,
                 LaTeX -> "H^0",
                 OutputName -> "H0" }},                         
      
      
      {Hp,  {    PDG -> 0,
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
      {gWB,  { Description -> "W-Boson Ghost"}},

(* Right handed neutrinos *)                        
      {Fn,   { LaTeX -> "N",
               OutputName -> "FN",
	       PDG -> {0,0,0} }}
      };
      
      
      
      
  ParticleDefinitions[EWSB] = {
            
      
    {hh   ,  {  Description -> "Higgs",
                PDG -> {25},
		PDG.IX -> {101000001},
                Mass -> LesHouches,
                FeynArtsNr -> 1,
                LaTeX -> "h",
                ElectricCharge -> 0,
                LHPC -> {1},
		OutputName -> "h"  }}, 

    {Ss   , {  Description -> "Singlet",
	       PDG -> {6666637, 6666638, 6666639},
	       PDG.IX -> {101000004,101000003,101000002},
               FeynArtsNr -> 4,
               LaTeX -> "S",
               ElectricCharge -> 0,
               LHPC -> {"gold"},
       	       OutputName -> "Ss" }},

(*To recover a single family scalar singlet, uncomment the next
     particle and comment the mixing definition in main file. 
     May be comment sss deifinition in WeylFermionAndIndermediate*)
 (*  {sss   , {  Description -> "Singlet",
	       PDG -> 6666637,
	       PDG.IX -> 101000004,
               FeynArtsNr -> 2,
               LaTeX -> "S",
               ElectricCharge -> 0,
               LHPC -> {"gold"},
       	       OutputName -> "Ss" }},*)

                 
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
      {VZ,   { Description -> "Z-Boson",
      			 Goldstone -> Ah }}, 
      {VG,   { Description -> "Gluon" }},          
      {VWp,  { Description -> "W+ - Boson",
      			Goldstone -> Hp }},         
      {gP,   { Description -> "Photon Ghost"}},                                                   
      {gWp,  { Description -> "Positive W+ - Boson Ghost"}}, 
      {gWpC, { Description -> "Negative W+ - Boson Ghost" }}, 
      {gZ,   { Description -> "Z-Boson Ghost" }},
      {gG,   { Description -> "Gluon Ghost" }},          
                               
                 
      {Fd,   { Description -> "Down-Quarks"}},   
      {Fu,   { Description -> "Up-Quarks"}},   
      {Fe,   { Description -> "Leptons" }},
      {Fv,   { Description -> "Neutrinos" }},

      {Fre, {PDG -> {210000601},
                 PDG.IX -> {-111100601},
                 Mass -> {LesHouches},
	         Width -> {0},
                 LaTeX -> "R_e",
                 ElectricCharge -> -1,
                 OutputName -> "Re" 
        	}},
     (* Right handed neutrinos *)                        
    (* {Fn,   {  PDG -> {1013,1014,1015},
              PDG.IX ->{-116600001,-116600002,-116600003},
              Width -> {0,0,0}, 
              Mass -> {LesHouches,LesHouches,LesHouches},
              FeynArtsNr -> 1,
              ElectricCharge -> 0,
              LaTeX -> "N",
              OutputName -> "Fn"
        	}},

      {Frn, {  PDG -> {210000001,210000002},
              PDG.IX ->{-117700001,-117700002},
              Width -> {0,0}, 
              Mass -> {LesHouches,LesHouches},
              FeynArtsNr -> 1,
              ElectricCharge -> 0,
              LaTeX -> "R_\\nu",
              OutputName -> "Rv"
	}},*)
       {Nv0,  {  LaTeX ->"\\tilde{\\chi}^0",
	           OutputName -> "Nv0",
		    PDG -> {210000001,210000002,210000003} }}

};   
        
 WeylFermionAndIndermediate = {
     
    {H,      {   PDG -> 0,
                 Width -> 0, 
                 Mass -> Automatic,
                 LaTeX -> "H",
                 OutputName -> "" }},
(* May be commnet next line to have a single family scalar singlet *)   
   {sss,     {LaTeX -> "\\phi" }},
   {dR,     {LaTeX -> "d_R" }},
   {eR,     {LaTeX -> "e_R" }},
   {l,     {LaTeX -> "l" }},
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
   (* Right handed neutrinos *)                        
   {nR,     {LaTeX -> "N_R" }},
   {VL,     {LaTeX -> "\\nu_L" }},
   (* Vector-like fields *)
   {rd,     {LaTeX -> "R^d" }},
   {vd,     {LaTeX -> "R_v^d" }},
   {ed,     {LaTeX -> "R_e^d" }},
   {ru,     {LaTeX -> "R^u" }},
   {vu,     {LaTeX -> "R_v^u" }},
   {eu,     {LaTeX -> "R_e^u" }},
   {Rv0,   {LaTeX -> "R_\\nu^0",
             OutputName -> "Rv0",
	    PDG -> 0 }}

        };       



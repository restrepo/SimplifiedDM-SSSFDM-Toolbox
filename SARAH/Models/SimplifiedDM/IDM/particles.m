(* ::Package:: *)
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

      {et0, {    PDG -> {0},
                 Width -> 0, 
                 Mass -> Automatic,
                 LaTeX -> "\\eta^0",
                 OutputName -> "et0" }},

      {etp, {    PDG -> {0},
                 Width -> 0, 
                 Mass -> Automatic,
                 LaTeX -> "\\eta^+",
                 OutputName -> "etp" }}, 

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
                  PDG.IX -> {101000001},
	          Mass -> Automatic }},                  
      {Ah   ,  {  Description -> "Pseudo-Scalar Higgs",
                  PDG -> {0},
                  PDG.IX ->{0},
                  Mass -> {0},
                  Width -> {0} }}, 
      {Hp,     {  Description -> "Charged Higgs", 
                  PDG -> {0},
                  PDG.IX ->{0},
                  Width -> {0}, 
                  Mass -> {0},
                  LaTeX -> {"H^+","H^-"},
                  OutputName -> {"Hp","Hm"} }},

      {etR,   {  Description -> "CP-even eta scalar", 
		 PDG -> {1001},
		 Mass -> LesHouches,
		 ElectricCharge -> 0,
		 LaTeX -> "\\eta_R",
		 OutputName -> "etR" }}, 
      {etI,   {  Description -> "CP-odd eta scalar", 
		 PDG -> {1002},
		 Mass -> LesHouches,
		 ElectricCharge -> 0,
		 LaTeX -> "\\eta_I",
		 OutputName -> "etI" }}, 
      {etp,   {  Description -> "Charged eta scalar", 
		 PDG -> {1003},
		 Mass -> LesHouches,
		 ElectricCharge -> 1,
		 LaTeX -> "\\eta^+",
                 OutputName -> "etp" }}, 

      {VP,   { Description -> "Photon"}}, 
      {VZ,   { Description -> "Z-Boson", Goldstone -> Ah }}, 
      {VWp,  { Description -> "W+ - Boson", Goldstone -> Hp}},
      {VG,   { Description -> "Gluon" }},

      {gP,   { Description -> "Photon Ghost"}},
      {gWp,  { Description -> "Positive W+ - Boson Ghost"}}, 
      {gWpC, { Description -> "Negative W+ - Boson Ghost" }}, 
      {gZ,   { Description -> "Z-Boson Ghost" }},
      {gG,   { Description -> "Gluon Ghost" }},
                 
      {Fd,   { Description -> "Down-Quarks"}},
      {Fu,   { Description -> "Up-Quarks"}},
      {Fe,   { Description -> "Leptons" }},
      {Fv,   { Description -> "Neutrinos" }},
      {Chi,  { Description -> "Singlet Fermions",
	       PDG -> {1012,1014,1016},
	       Mass -> LesHouches,
	       ElectricCharge -> 0,
	       LaTeX -> "N",
	       OutputName -> "N" }}

};

WeylFermionAndIndermediate =
{
   {H,      {LaTeX -> "H"}},
   {Et,     {LaTeX -> "\\eta"}},
   {dR,     {LaTeX -> "d_R" }},
   {eR,     {LaTeX -> "e_R" }},
   {lep,    {LaTeX -> "l" }},
   {uR,     {LaTeX -> "u_R" }},
   {q,      {LaTeX -> "q" }},
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
   {X0,     {LaTeX -> "X^0"}},
   {VL,     {LaTeX -> "V_L" }},
   {n,      {LaTeX -> "N" }},
   {nR,     {LaTeX -> "\\nu_R" }}
};

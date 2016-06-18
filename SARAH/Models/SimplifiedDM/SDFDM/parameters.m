ParameterDefinitions = { 

{g1,        { Description -> "Hypercharge-Coupling"}},
{g2,        { Description -> "Left-Coupling"}},
{g3,        { Description -> "Strong-Coupling"}},    
{AlphaS,    { Description -> "Alpha Strong"}},	
{e,         { Description -> "electric charge"}}, 

{Gf,        { Description -> "Fermi's constant"}},
{aEWinv,    { Description -> "inverse weak coupling constant at mZ"}},

{Yu,        { Description -> "Up-Yukawa-Coupling",
	      DependenceNum ->  Sqrt[2]/v* {{Mass[Fu,1],0,0},
						{0, Mass[Fu,2],0},
						{0, 0, Mass[Fu,3]}}}}, 
             									
{Yd,        { Description -> "Down-Yukawa-Coupling",
			  DependenceNum ->  Sqrt[2]/v* {{Mass[Fd,1],0,0},
							{0, Mass[Fd,2],0},
							{0, 0, Mass[Fd,3]}}}},
							
{Ye,        { Description -> "Lepton-Yukawa-Coupling",
	      DependenceNum ->  Sqrt[2]/v* {{Mass[Fe,1],0,0},
						{0, Mass[Fe,2],0},
						{0, 0, Mass[Fe,3]}}}},                                                                                                             
{v,         { Description -> "EW-VEV",
              DependenceNum -> Sqrt[4*Mass[VWp]^2/(g2^2)],
              DependenceSPheno -> None  }},

{ThetaW,    { Description -> "Weinberg-Angle",
              DependenceNum -> ArcSin[Sqrt[1 - Mass[VWp]^2/Mass[VZ]^2]]}},

{ZZ,        { Description -> "Photon-Z Mixing Matrix"}},
{ZW,        { Description -> "W Mixing Matrix",
              Dependence ->   1/Sqrt[2] {{1, 1},
                  {\[ImaginaryI],-\[ImaginaryI]}} }},

{Vu,        { Description ->"Left-Up-Mixing-Matrix"}},
{Vd,        { Description ->"Left-Down-Mixing-Matrix"}},
{Uu,        { Description ->"Right-Up-Mixing-Matrix"}},
{Ud,        { Description ->"Right-Down-Mixing-Matrix"}}, 
{Ve,        { Description ->"Left-Lepton-Mixing-Matrix"}},
{Ue,        { Description ->"Right-Lepton-Mixing-Matrix"}},

(* Scalar sector *)
{mu2,       { Description -> "SM Mu Parameter",
              LaTeX -> "\\mu^2",
	      OutputName -> mu2}},

{MS2,       { Description -> "Softbreaking Up-Higgs Mass",
              LaTeX -> "M_S^2",
	      OutputName-> MS2}}, 

{Lambda1,   { Description -> "SM Higgs Selfcouplings",
              DependenceNum -> Mass[hh]^2/(2 v^2)}},

{LamSH,     { OutputName ->"LSH",
              LesHouches -> LSH}},

{LamS,      { OutputName ->"LS",
              Form -> Diagonal,
              LesHouches -> LS}},

(* New Mixing matrix in the scalar sector *)
{VSs,       { LaTeX -> "VS",
              LesHouches ->  VSs,
	      OutputName-> VSs }},

(*New Yukawas*)

{YR1,       { LaTeX -> "hia",
              LesHouches -> YR1,
              Real->True,
              OutputName-> YR1 }}, 

{YR3,       { LaTeX -> "\\lambda_d",
              Real->True,       
              LesHouches -> YR3,
              OutputName-> YR3 }}, 

{YR4,       { LaTeX -> "\\lambda_u",
              Real->True,       
              LesHouches -> YR4,
              OutputName-> YR4 }}, 

(* Mixing matrices *)
{Vv,        { Description ->"Neutrino-Mixing-Matrix",
              LesHouches -> VVMIX,
              OutputName-> Vv}},

(* Doublet fermion *)
{MDF,       { LaTeX -> "M_D",
              OutputName -> MDF,
              LesHouches -> MDF}},

(* Right handed neutrinos *)
{Mn,        { LaTeX -> "M_N",
              OutputName -> Mn,
              LesHouches -> Mn}},

{ZvN,       { LaTeX -> "Z_\\mu^N",
              LesHouches ->  ZvN,
	      OutputName->ZvN }}

 }; 
 


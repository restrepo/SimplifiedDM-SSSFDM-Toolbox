
(* Load the file which defines the properties of the different tools *)
LoadSettings="DefaultSettings.m.MSSM";


(* Several scans can be done in a row. Give each one a name... *)
RunScans = {mcmcHiggsAndDM};


(* ---------------------------------------------------------------------------------------- *)
(* Define the parameter ranges and all other information for the LesHouches input file *)
(* ---------------------------------------------------------------------------------------- *)

DEFINITION[a_][IncludeMicrOmegas] = True;

(* Run a Markov Chain Monta Carlo *)
 DEFINITION[a_][MCMC] = True;
 
(* Define the constraints *)

 DEFINITION[a_][ConstraintsMCMC]={
  If[DARKMATTER[1]<0,0,Exp[-(0.11 - DARKMATTER[1])^2/(2*0.02^2)]],
  Exp[-(MASS[35]-120)^2/(2*3^2)],
  Exp[-(SPHENOLOWENERGY[1]*10^4-2.95)^2/(2*0.05^2)],
  1./(1 + Exp[+(120 - MASS[1000024])/5]) 
  };

MaximalTimeMO = 10;


(* Define the jump probability *)

DEFINITION[a_][MCMCjumpingQ][new_, old_] = 
  If[new > old, True, 
   If[(new/old) > Random[], True, False]
    ];


(* Define convergence criteria *)

DEFINITION[a_][MCMCconvergenceCheck][like_] =  If[like> 0.9 || MCMC`Steps > 5000, True,False];



(* Names of all blocks *)
DEFINITION[a_][Blocks]={MODSEL,SMINPUTS,MINPAR,SPhenoInput};

(* parameter ranges *)
(* Possible Distributions: FIXED, LINEAR, LOG, RANDOM *)


DEFINITION[a_][MODSEL]={
  {{1},{Value->1}},
  {{6},{Value->1}}
};

DEFINITION[a_][SMINPUTS]={
  {{2},{Value->1.166390*10^-5}},
  {{3},{Value->0.1172}},
  {{4},{Value->91.18760}},
  {{5},{Value->4.2}},
  {{6},{Value->172.9}},
  {{7},{Value->1.777}}
};


DEFINITION[a_][MINPAR]={
  {{1}, {Min->0, Max->2500,NextStep->Hold[RandomReal[NormalDistribution[MINPAR[1], 50]]]}},
  {{2}, {Min->0, Max->2500,NextStep->Hold[RandomReal[NormalDistribution[MINPAR[2], 50]]]}},
  {{3}, {Min->5, Max->50,NextStep->Hold[RandomReal[NormalDistribution[MINPAR[3], 1]]]}},
  {{4}, {Value->1}},
  {{5}, {Min->-5000, Max->5000,NextStep->Hold[RandomReal[NormalDistribution[MINPAR[5], 100]]]}}
  };


DEFINITION[a_][SPhenoInput]={
  {{1},{Value->-1}},
  {{2},{Value->0}},
  {{11},{Value->0}},
  {{12},{Value->0}},
  {{13},{Value->0}},
  {{21},{Value->0}},
  {{50},{Value->0}},
  {{75},{Value->1}},
  {{76},{Value->1}}
};



(* ---------------------------------------------------------------------------------------- *)
(* Define what should be plotted                                                            *)
(* ---------------------------------------------------------------------------------------- *)

DEFINITION[a_][Plots]={
  {P2D, {MCMCINFO[1],{MASS[25]}},{Frame->True, Axes->False,FrameLabel->{UseLaTeX["step"],UseLaTeX["$m_h$ [GeV]"]}},"step_mH.eps"},
  {P2D, {MCMCINFO[1],{DARKMATTER[1]}},{Frame->True, Axes->False,FrameLabel->{UseLaTeX["step"],UseLaTeX["$\\Omega h^2$"]}},"step_relic.eps"},
  {P2D, {MCMCINFO[1],{SPHENOLOWENERGY[1]}},{Frame->True, Axes->False,FrameLabel->{UseLaTeX["step"],UseLaTeX["$Br(b\\rightarrow s \\gamma$"]}},"step_bsgamma.eps"}, 
  {P2D, {MCMCINFO[1],{MINPAR[1]}},{Frame->True, Axes->False,FrameLabel->{UseLaTeX["step"],UseLaTeX["$m_0$~[GeV]"]}},"step_m0.eps"},
  {P2D, {MCMCINFO[1],{MINPAR[2]}},{Frame->True, Axes->False,FrameLabel->{UseLaTeX["step"],UseLaTeX["$M_{1/2}$ [GeV]"]}},"step_m12.eps"},
  {P2D, {MCMCINFO[1],{MINPAR[3]}},{Frame->True, Axes->False,FrameLabel->{UseLaTeX["step"],UseLaTeX["$\\tan(\\beta)$"]}},"step_tb.eps"},
  {P2D, {MCMCINFO[1],{MINPAR[5]}},{Frame->True, Axes->False,FrameLabel->{UseLaTeX["step"],UseLaTeX["$A_0$ [GeV]"]}},"step_A0.eps"},
  {P2D, {MCMCINFO[1],{Log[10,MCMCINFO[2]]}},{Frame->True, Axes->False,FrameLabel->{UseLaTeX["step"],UseLaTeX["$log(\\chi^2)$"]}},"step_L.eps"}
};

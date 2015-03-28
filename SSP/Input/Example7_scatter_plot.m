(* ::Package:: *)

(* Here, we make contour plot of the Higgs mass in the A0/TanBeta plan and check at each point the Higgs constraints using HiggsBounds *)



(* Load the file which defines the properties of the different tools *)
LoadSettings="DefaultSettings.m.MSSM";


(* Several scans can be done in a row. Give each one a name... *)
RunScans = {ScatterMSSM};


(* ---------------------------------------------------------------------------------------- *)
(* Define the parameter ranges and all other information for the LesHouches input file *)
(* ---------------------------------------------------------------------------------------- *)

(* Use the scatter plot function *)
 DEFINITION[a_][ScatterPlot] = True;
 DEFINITION[a_][ScatterPoints] = 2500;

(* save only points with Higgs masses larger than 118 GeV *)

DEFINITION[a_][UseCheckSavingPoints]=True;
DEFINITION[a_][CheckSavingPoints][spc_]:=If[(MASS[25]/.spc)>118,True,False];





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
  {{1}, {Min->0, Max->2500}},
  {{2}, {Min->0, Max->2500}},
  {{3}, {Min->5, Max->50}},
  {{4}, {Value->1}},
  {{5}, {Min->-5000, Max->5000}}
  };


DEFINITION[a_][SPhenoInput]={
  {{1},{Value->-1}},
  {{2},{Value->1}},
  {{11},{Value->1}},
  {{12},{Value->0}},
  {{13},{Value->0}},
  {{21},{Value->0}},
  {{75},{Value->1}},
  {{76},{Value->1}}
};



(* ---------------------------------------------------------------------------------------- *)
(* Define what should be plotted                                                            *)
(* ---------------------------------------------------------------------------------------- *)

DEFINITION[a_][Plots]={
  {P2D, {MINPAR[1],{MASS[25]}},{Frame->True, Axes->False,FrameLabel->{UseLaTeX["$m_0$ [GeV]"],UseLaTeX["$m_h$ [GeV]"]}},"m0_mH.eps"},
  {P2D, {MINPAR[1],{MASS[25]}},{Frame->True, Axes->False,FrameLabel->{UseLaTeX["$M_{1/2}$ [GeV]"],UseLaTeX["$m_h$ [GeV]"]}},"m12_mH.eps"},
  {P2D, {MINPAR[1],{MASS[25]}},{Frame->True, Axes->False,FrameLabel->{UseLaTeX["$\\tan(\\beta)$"],UseLaTeX["$m_h$ [GeV]"]}},"tb_mH.eps"}, 
  {P2D, {MINPAR[1],{MASS[25]}},{Frame->True, Axes->False,FrameLabel->{UseLaTeX["$A_0$ [GeV]"],UseLaTeX["$m_h$ [GeV]"]}},"A0_mH.eps"}
};

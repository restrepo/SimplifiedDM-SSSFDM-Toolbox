(* ::Package:: *)

(* Several scans can be done in a row. Give each one a name... *)
 RunScans = {TANBm0}; 

(* Load the file which defines the properties of the different tools *)
LoadSettings="DefaultSettings.m.MSSM";



(* ---------------------------------------------------------------------------------------- *)
(* Define the parameter ranges and all other information for the LesHouches input file *)
(* ---------------------------------------------------------------------------------------- *)

(* Names of all blocks *)

DEFINITION[a_][Blocks]={MODSEL,SMINPUTS,MINPAR,SPhenoInput};


(* Include MicrOmegas and define the dark matter candidate *)

DEFINITION[TANBm0][IncludeMicrOmegas]=True;
DEFINITION[TANBm0][DarkMatterCandidate]=1000022;


(* parameter ranges *)
(* Possible Distributions: FIXED, LINEAR, LOG, RANDOM *)



DEFINITION[TANBm0][MODSEL]={
  {{1},{Value->1}},
  {{6},{Value->1}}
};

DEFINITION[TANBm0][SMINPUTS]={
  {{2},{Value->1.166390*10^-5}},
  {{3},{Value->0.1172}},
  {{4},{Value->91.18760}},
  {{5},{Value->4.2}},
  {{6},{Value->172.9}},
  {{7},{Value->1.777}}
};

DEFINITION[TANBm0][MINPAR]={
  {{1}, {Min->300,Max->1500, Steps->25,Distribution->LINEAR}},
  {{2}, {Value->500}},
  {{3}, {Min->45,Max->55, Steps->10,Distribution->LINEAR}},
  {{4}, {Value->1}},
  {{5}, {Min->-250,Max->250,Steps->3,Distribution->LINEAR}}
  };


DEFINITION[TANBm0][SPhenoInput]={
  {{1},{Value->-1}},
  {{2},{Value->1}},
  {{11},{Value->0}},
  {{12},{Value->12}},
  {{21},{Value->0}},
  {{75},{Value->1}},
  {{76},{Value->1}}
};


(* Define what should be plotted *)

DEFINITION[TANBm0][Plots]={
  {P2D, {MINPAR[1],{MASS[36]-2*MASS[1000022]}},Style1,"DeltaM_A0-2N.eps"},
  {P2D, {MINPAR[1],{Log[10,DARKMATTER[1]]}},Style2,"Omegah2.eps"}	
};

Style1= {{Frame->True, Axes->False,FrameLabel->{UseLaTeX["$m_0$~[GeV]"],UseLaTeX["$\\Delta M$~[GeV]"]},Joined->False, FrameTicksStyle -> Directive[Black, 14]}};
Style2= {{Frame->True, Axes->False,FrameLabel->{UseLaTeX["$m_0$~[GeV]"],UseLaTeX["$\\Omega h^2$"]},Joined->False, FrameTicksStyle -> Directive[Black, 14]}};




(* ::Package:: *)

(* For a variation of A_ 0 the check of two e^+ e^- cross sections is included *)

RunScans = {MCm0};

(* Load the file which defines the properties of the different tools *)
LoadSettings="DefaultSettings.m.MSSM";


(* --------------------------------------------------------- *)
(* Initialize WHIZARD *)
(* --------------------------------------------------------- *)

DEFINITION[a_][IncludeWHIZARD]=True;
DEFINITION[a_][WHIZARDruns]={
ToFileName[SSP`InputDir,"Input_for_Example5.sin"]
};



(* ---------------------------------------------------------------------------------------- *)
(* Define the parameter ranges and all other information for the LesHouches input file *)
(* ---------------------------------------------------------------------------------------- *)

(* Name of all blocks *)
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
  {{1}, {Min->500,Max->1000, Steps->3,Distribution->LINEAR}},
  {{2}, {Value->500}},
  {{3}, {Value->10}},
  {{4}, {Value->1}},
  {{5}, {Value->0}}
  };




DEFINITION[a_][SPhenoInput]={
  {{1},{Value->-1}},
  {{2},{Value->1}},
  {{11},{Value->0}},
  {{12},{Value->12}},
  {{21},{Value->0}},
  {{75},{Value->1}},
  {{76},{Value->1}}
};



DEFINITION[a_][Plots]={ };


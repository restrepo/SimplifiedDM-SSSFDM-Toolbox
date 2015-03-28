(* ::Package:: *)

(* Here, we make contour plot of the Higgs mass in the A0/TanBeta plan and check at each point the Higgs constraints using HiggsBounds *)



(* Load the file which defines the properties of the different tools *)
LoadSettings="DefaultSettings.m.MSSM";


(* Several scans can be done in a row. Give each one a name... *)
RunScans = {ScanA0TB};


(* Include HiggsBounds *)
DEFINITION[a_][IncludeHiggsBounds]=True;
DEFINITION[a_][IncludeHiggsSignals]=True;

(* ---------------------------------------------------------------------------------------- *)
(* Define the parameter ranges and all other information for the LesHouches input file *)
(* ---------------------------------------------------------------------------------------- *)

(* Names of all blocks *)


DEFINITION[a_][Blocks]={MODSEL,SMINPUTS,MINPAR,SPhenoInput};

(* parameter ranges *)
(* Possible Distributions: FIXED, LINEAR, LOG, RANDOM *)

DEFINITION[ScanA0TB][MakeCountourScan]=True;
DEFINITION[ScanA0TB][CountourScan]={MASS[25],{CONTOURSCANPARAMTER[1],5,50},{CONTOURSCANPARAMTER[2],-1500,1500},CStyle,"M25_TB_A0.eps"};
CStyle={PlotPoints->5, PrecisionGoal->"Speed", ContourLabels->True};

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
  {{1}, {Value->500}},
  {{2}, {Value->500}},
  {{3}, {Value->CONTOURSCANPARAMTER[1]}},
  {{4}, {Value->1}},
  {{5}, {Value->CONTOURSCANPARAMTER[2]}}
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

(* Existing types so far:    
       P2D: (x,y)-Plot;   
       P3D: Contour plot;
*) 

DEFINITION[a_][Plots]={
  {P2D, {MASS[25],{HIGGSBOUNDS[5]}},Style1,"m25_HB-bounds.eps"},
  {P2D, {MASS[25],{HIGGSBOUNDS[7]}},Style1,"m25_HB-saturation.eps"},
  {P3D, {MINPAR[3],MINPAR[5],HIGGSBOUNDS[5]},Style2,"HB_bound_A0_TB.eps"},
  {P3D, {MINPAR[3],MINPAR[5],HIGGSBOUNDS[7]},Style2,"HB_saturation_A0_TB.eps"}
};


BasicStyle= {Frame->True, Axes->False,FrameLabel->{UseLaTeX["$m_h$ [GeV]"],Style["HB result",14]},PlotJoined->False, FrameTicksStyle -> Directive[Black, 14]};
Style1 = Map[Join[BasicStyle,{PlotStyle->#}]&,{Red}];
Style2= {Frame->True, Axes->False,FrameLabel->{UseLaTeX["$\\tan(\\beta)$"],UseLaTeX["$A_0$ [GeV]"]},FrameTicksStyle -> Directive[Black, 14],ContourLabels->False,Contours -> {1}};


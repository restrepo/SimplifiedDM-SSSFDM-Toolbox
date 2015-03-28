(* ::Package:: *)

(* This example performs two different runs:
   1) m0 from 0 to 1000; A_ 0 and tan\beta are fitted to get a Higgs mass of 115 GeV
   2) m0 from 50 to 1000; M12 is fitted to get the same mass for the lightest neutralino and stau
 *)



(* Several scans can be done in a row. Give each one a name... *)
RunScans = {FITHIGGS,FITNeutralino};


(* Load the file which defines the properties of the different tools *)
LoadSettings="DefaultSettings.m.MSSM";



(* ---------------------------------------------------------------------------------------- *)
(* Define the parameter ranges and all other information for the LesHouches input file *)
(* ---------------------------------------------------------------------------------------- *)

(* Names of all blocks *)
DEFINITION[a_][Blocks]={MODSEL,SMINPUTS,MINPAR,SPhenoInput};


(* parameter ranges *)
(* Possible Distributions: FIXED, LINEAR, LOG, RANDOM *)


DEFINITION[FITHIGGS][FitOptions]={Method->"NelderMead"};
DEFINITION[FITHIGGS][FitValues]={
 {MASS[25],115,0.1}
 };
DEFINITION[FITHIGGS][FreeParameters]={
 {TANBFIT,{5,15}},
 {A0FIT,{0,100}}
};


DEFINITION[FITNeutralino][FitOptions]={};
DEFINITION[FITNeutralino][FitValues]={
 {MASS[1000022],MASS[1000011],1}
 };
DEFINITION[FITNeutralino][FreeParameters]={
 {M12FIT,{2*MINPAR[1],8*MINPAR[1]}}
};


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

DEFINITION[FITHIGGS][MINPAR]={
  {{1}, {Min->0.,Max->1000, Steps->50,Distribution->LINEAR}},
  {{2}, {Value->500.}},
  {{3}, {Value->TANBFIT}},
  {{4}, {Value->1.}},
  {{5}, {Value->A0FIT}}
  };

DEFINITION[FITNeutralino][MINPAR]={
  {{1}, {Min->50.,Max->500, Steps->10,Distribution->LINEAR}},
  {{2}, {Value->M12FIT}},
  {{3}, {Min->10.,Max->20, Steps->10,Distribution->LINEAR}},
  {{4}, {Value->1.}},
  {{5}, {Value->0.}}
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


(* Define what should be plotted *)
(* Existing types so far:    
       P2D: (x,y)-Plot;   
       P2DLog: log (x,y)-Plot;       
	   P3D: Contour plot;
       P3DLog: log Contour plot;
*) 

DEFINITION[FITHIGGS][Plots]={
  {P2D, {MINPAR[1],{MASS[25]}},Style1a,"m0_25-Higgs-Fit.eps"},
  {P2D, {MINPAR[1],{MASS[35],MASS[36],MASS[37]}},Style1b,"m0_35-37-Higgs-Fit.eps"},
  {P2D, {MINPAR[1],{MINPAR[3]}},Style2a,"m0_tb-Higgs-Fit.eps"},
  {P2D, {MINPAR[1],{MINPAR[5]}},Style2b,"m0_A0-Higgs-Fit.eps"}
};

DEFINITION[FITNeutralino][Plots]={
  {P2D, {MINPAR[1],{MASS[1000022]-MASS[1000011]}},Style3,"m0_1000022_1000011-N-Fit.eps"},
  {P2D, {MINPAR[1],{MINPAR[2]}},Style5,"m0_m12-N-Fit.eps"},
  {P3D, {MINPAR[1],MINPAR[3],MASS[1000023]},Style4,"m0_m12_1000023-N-Fit.eps"},
  {P3D, {MINPAR[1],MINPAR[3],MASS[1000025]},Style4,"m0_m12_1000025-N-Fit.eps"},
  {P3D, {MINPAR[1],MINPAR[3],MASS[1000035]},Style4,"m0_m12_1000035-N-Fit.eps"}
};


BasicStyle= {Frame->True, Axes->False,FrameLabel->{UseLaTeX["$m_0$~[GeV]"],UseLaTeX["$m_h$~[GeV]"]},PlotJoined->False, FrameTicksStyle -> Directive[Black, 14]};
Style1a = Map[Join[BasicStyle,{PlotStyle->#}]&,{Blue}];
Style1b = Map[Join[BasicStyle,{PlotStyle->#}]&,{Blue,Green,Red}];

Style2a = {{Frame->True, Axes->False,FrameLabel->{UseLaTeX["$m_0$~[GeV]"],UseLaTeX["$\\tan(\\beta)$"]},PlotJoined->True, FrameTicksStyle -> Directive[Black, 14]}}
Style2b = {{Frame->True, Axes->False,FrameLabel->{UseLaTeX["$m_0$~[GeV]"],UseLaTeX["$A_0$~[GeV]"]},PlotJoined->True, FrameTicksStyle -> Directive[Black, 14]}}
Style3 = Map[Join[BasicStyle,{PlotStyle->#}]&,{Green,Blue}];
Style4={Frame->True, Axes->False,FrameLabel->{UseLaTeX["$m_0$~[GeV]"],UseLaTeX["$M_{1/2}$~[GeV]"]},ContourLabels->True};
Style5 = {{Frame -> True, Axes -> False, FrameLabel -> {UseLaTeX["$m_0$~[GeV]"], UseLaTeX["$M_{1/2}$~[GeV]"]}}};

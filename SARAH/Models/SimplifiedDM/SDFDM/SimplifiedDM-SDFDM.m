Off[General::spell]

Model`Name      = "SimplifiedDMSDFDM";
Model`NameLaTeX = "Singlet Doublet Fermion Dark Matter";
Model`Authors   = "N. Rojas, A. Vicente";
Model`Date      = "2015-04-28";

(* "28-04-2015 (first implementation)" *)
(* "25-05-2015 (removed mixings in scalar sector)" *)
(* "10-06-2015 (fixed conventions)" *)
(* Following the conventions of hep-ph/0603188 *)


(*------------Particle Content---------------*)

(* Global Symmetries *)
Global[[1]] = {Z[2], Z2};

(*--------------Gauge Groups-----------------*)

Gauge[[1]]={B,   U[1], hypercharge, g1, False, 1};
Gauge[[2]]={WB, SU[2], left,        g2, True , 1};
Gauge[[3]]={G,  SU[3], color,       g3, False, 1};

(*--------------Matter Fields----------------*)

FermionFields[[1]] = {q , 3, {uL, dL},     1/6, 2,  3, 1};
FermionFields[[2]] = {l , 3, {vL, eL},    -1/2, 2,  1, 1};
FermionFields[[3]] = {d , 3, conj[dR],     1/3, 1, -3, 1};
FermionFields[[4]] = {u , 3, conj[uR],    -2/3, 1, -3, 1};
FermionFields[[5]] = {e , 3, conj[eR],       1, 1,  1, 1};
FermionFields[[6]] = {rd, 1, {vd, ed},   -1/2, 2,  1,-1}; 
FermionFields[[7]] = {ru, 1, {- eu,vu},     1/2, 2,  1,-1};
FermionFields[[8]] = {n , 1, conj[nR],       0, 1,  1,-1};

ScalarFields[[1]] =  {H,  1, {Hp, H0},     1/2, 2,  1,  1};

(*---------------DEFINITION------------------*)

NameOfStates={GaugeES, EWSB};

(* ----- Before EWSB ----- *)

DEFINITION[GaugeES][LagrangianInput]= 
{
  {LagFer   ,      {AddHC->True}},
  {LagH     ,      {AddHC->False}},
  {LagNV    ,      {AddHC->True}},
  {LagIFD, {AddHC->True}}  
};

(* With the conventions of arXiv:1504.07892 and arxiv:1509.06313 *)

LagFer   = Yd conj[H].d.q + Ye conj[H].e.l + Yu H.u.q;
LagH     = -(+ mH2 conj[H].H     +  lambda1 conj[H].H.conj[H].H );
LagIFD =  -(- MDF rd.ru + lamd H.n.rd + lamu conj[H].n.ru);
LagNV    = - Mn/2 n.n;

(* Gauge Sector *)

DEFINITION[EWSB][GaugeSector] =
{ 
  {{VB,VWB[3]},{VP,VZ},ZZ},
  {{VWB[1],VWB[2]},{VWp,conj[VWp]},ZW}
};

(* ----- VEVs ---- *)

DEFINITION[EWSB][VEVs]= 
{
    {H0,  {v, 1/Sqrt[2]}, {Ah, \[ImaginaryI]/Sqrt[2]}, {hh, 1/Sqrt[2]}}
};

DEFINITION[EWSB][MatterSector]=
{
  {{{dL}, {conj[dR]}}, {{DL,Vd}, {DR,Ud}}},
  {{{uL}, {conj[uR]}}, {{UL,Vu}, {UR,Uu}}},
  {{{eL}, {conj[eR]}}, {{EL,Ve}, {ER,Ue}}},
  {{conj[nR], vd, vu},{X0, ZX}} 
};

(*------------------------------------------------------*)
(* Dirac-Spinors *)
(*------------------------------------------------------*)

DEFINITION[EWSB][DiracSpinors]=
{
  Fd  -> {  DL, conj[DR]},
  Fe  -> {  EL, conj[ER]},
  Fu  -> {  UL, conj[UR]},
  Fv  -> {  vL, 0},
  Fre ->{  ed, conj[eu]}, 
  Chi ->{  X0, conj[X0]}  
};

DEFINITION[EWSB][GaugeES]=
{
  Fd1 ->{  FdL, 0},
  Fd2 ->{  0, FdR},
  Fu1 ->{  Fu1, 0},
  Fu2 ->{  0, Fu2},
  Fe1 ->{  Fe1, 0},
  Fe2 ->{  0, Fe2}
};

SetOptions[MakeCHep,UseRunningCoupling -> False];
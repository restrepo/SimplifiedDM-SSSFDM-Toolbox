#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "../../CalcHEP_src/include/extern.h"
#include "../../CalcHEP_src/include/VandP.h"
#include "autoprot.h"
extern int  FError;
/*  Special model functions  */

int nModelParticles=33;
static ModelPrtclsStr ModelPrtcls_[33]=
{
  {"Hmm","Hpp", 9000055, "MHmm","WHmm",0,1,6}
, {"hh1","hh1", 25, "Mhh1","Whh1",0,1,0}
, {"hh2","hh2", 35, "Mhh2","Whh2",0,1,0}
, {"hh3","hh3", 335, "Mhh3","Whh3",0,1,0}
, {"Ah3","Ah3", 36, "MAh3","WAh3",0,1,0}
, {"Hm3","Hp3", -37, "MHm3","WHm3",0,1,-3}
, {"g","g", 21, "0","0",2,8,0}
, {"A","A", 22, "0","0",2,1,0}
, {"Z","Z", 23, "MZ","WZ",2,1,0}
, {"Zp","Zp", 32, "MZp","WZp",2,1,0}
, {"WLm","WLp", -24, "MWLm","WWLm",2,1,-3}
, {"WRm","WRp", 34, "MWRm","WWRm",2,1,-3}
, {"cpp","Cpp", 6000055, "Mcpp","Wcpp",1,1,6}
, {"d1","D1", 1, "Md1","Wd1",1,3,-1}
, {"d2","D2", 3, "Md2","Wd2",1,3,-1}
, {"d3","D3", 5, "Md3","Wd3",1,3,-1}
, {"u1","U1", 2, "Mu1","Wu1",1,3,2}
, {"u2","U2", 4, "Mu2","Wu2",1,3,2}
, {"u3","U3", 6, "Mu3","Wu3",1,3,2}
, {"e1","E1", 11, "Me1","We1",1,1,3}
, {"e2","E2", 13, "Me2","We2",1,1,3}
, {"e3","E3", 15, "Me3","We3",1,1,3}
, {"nu1","nu1", 12, "Mnu1","Wnu1",1,1,0}
, {"nu2","nu2", 14, "Mnu2","Wnu2",1,1,0}
, {"nu3","nu3", 16, "Mnu3","Wnu3",1,1,0}
, {"nu4","nu4", 6000012, "Mnu4","Wnu4",1,1,0}
, {"nu5","nu5", 6000014, "Mnu5","Wnu5",1,1,0}
, {"nu6","nu6", 6000016, "Mnu6","Wnu6",1,1,0}
, {"c01","c01", 9000012, "Mc01","Wc01",1,1,0}
, {"c02","c02", 9000014, "Mc02","Wc02",1,1,0}
, {"c03","c03", 9000016, "Mc03","Wc03",1,1,0}
, {"cp1","Cp1", 17, "Mcp1","Wcp1",1,1,3}
, {"cp2","Cp2", 19, "Mcp2","Wcp2",1,1,3}
};
ModelPrtclsStr *ModelPrtcls=ModelPrtcls_; 
int nModelVars=19;
int nModelFunc=257;
static char*varNames_[276]={
 "WZ","WWLm","Wd1","Wd2","Wd3","Wu1","Wu2","Wu3","We1","We2"
,"We3","Maux","sqrt2","Pi","Q","alfSMZ","aS","aEWinv","Gf","rd"
,"MHmm","Mhh1","Mhh2","Mhh3","MAh3","MHm3","MZ","MZp","MWRm","Mcpp"
,"Md1","Md2","Md3","Mu1","Mu2","Mu3","Me1","Me2","Me3","Mnu1"
,"Mnu2","Mnu3","Mnu4","Mnu5","Mnu6","Mc01","Mc02","Mc03","Mcp1","Mcp2"
,"gBL","gR","LAMT1","YDR11","YDR12","YDR13","YDR21","YDR22","YDR23","YDR31"
,"YDR32","YDR33","YL111","YL112","YL113","YL121","YL122","YL123","YL131","YL132"
,"YL133","YQ111","YQ112","YQ113","YQ121","YQ122","YQ123","YQ131","YQ132","YQ133"
,"LAMT2","YL211","YL212","YL213","YL221","YL222","YL223","YL231","YL232","YL233"
,"YQ211","YQ212","YQ213","YQ221","YQ222","YQ223","YQ231","YQ232","YQ233","RHO2"
,"RHO1","ALP1","LAM1","ALP3","ALP2","LAM4","LAM2","LAM3","vd","vu"
,"vR","ZZ11","ZZ12","ZZ13","ZZ21","ZZ22","ZZ23","ZZ31","ZZ32","ZZ33"
,"phaT","ZH11","ZH12","ZH13","ZH21","ZH22","ZH23","ZH31","ZH32","ZH33"
,"UP11","UP12","UP13","UP21","UP22","UP23","UP31","UP32","UP33","UC11"
,"UC12","UC13","UC21","UC22","UC23","UC31","UC32","UC33","ZDL11","ZDL12"
,"ZDL13","ZDL21","ZDL22","ZDL23","ZDL31","ZDL32","ZDL33","ZDR11","ZDR12","ZDR13"
,"ZDR21","ZDR22","ZDR23","ZDR31","ZDR32","ZDR33","ZUL11","ZUL12","ZUL13","ZUL21"
,"ZUL22","ZUL23","ZUL31","ZUL32","ZUL33","ZUR11","ZUR12","ZUR13","ZUR21","ZUR22"
,"ZUR23","ZUR31","ZUR32","ZUR33","ZEL11","ZEL12","ZEL13","ZEL21","ZEL22","ZEL23"
,"ZEL31","ZEL32","ZEL33","ZER11","ZER12","ZER13","ZER21","ZER22","ZER23","ZER31"
,"ZER32","ZER33","UV11","UV12","UV13","UV14","UV15","UV16","UV21","UV22"
,"UV23","UV24","UV25","UV26","UV31","UV32","UV33","UV34","UV35","UV36"
,"UV41","UV42","UV43","UV44","UV45","UV46","UV51","UV52","UV53","UV54"
,"UV55","UV56","UV61","UV62","UV63","UV64","UV65","UV66","UT11","UT12"
,"UT13","UT21","UT22","UT23","UT31","UT32","UT33","VTE11","VTE12","VTE21"
,"VTE22","UTE11","UTE12","UTE21","UTE22","TW","PhiW","HPP1","HGG1","HPP2"
,"HGG2","HPP3","HGG3","APP3","AGG3","QCDok","g3","SPh","CPh","TPh"
,"STW","CTW","TTW","el","g2","MWLm"};
char**varNames=varNames_;
static REAL varValues_[276]={
   2.495200E+00,  2.141000E+00,  0.000000E+00,  0.000000E+00,  0.000000E+00,  0.000000E+00,  0.000000E+00,  1.510000E+00,  0.000000E+00,  0.000000E+00
,  0.000000E+00,  1.000000E+00,  1.414214E+00,  3.141593E+00,  1.000000E+02,  1.172000E-01,  1.190000E-01,  1.370360E+02,  1.166390E-05};
REAL*varValues=varValues_;
int calcMainFunc(void)
{
   int i;
   static REAL * VV=NULL;
   static int iQ=-1;
   static int cErr=1;
   REAL *V=varValues;
   FError=0;
   if(VV && cErr==0)
   { for(i=0;i<nModelVars;i++) if(i!=iQ && VV[i]!=V[i]) break;
     if(i==nModelVars)      {if(iQ>=0 && VV[iQ]!=V[iQ]) goto FirstQ; else return 0;} 
   }
  cErr=1;
   V[19]=slhaRead("SPheno.spc.tripletLR",0);
   if(!isfinite(V[19]) || FError) return 19;
 FirstQ:
 cErr=1;
   V[20]=slhaVal("MASS",V[14],1,9000055);
   if(!isfinite(V[20]) || FError) return 20;
   V[21]=slhaVal("MASS",V[14],1,25);
   if(!isfinite(V[21]) || FError) return 21;
   V[22]=slhaVal("MASS",V[14],1,35);
   if(!isfinite(V[22]) || FError) return 22;
   V[23]=slhaVal("MASS",V[14],1,335);
   if(!isfinite(V[23]) || FError) return 23;
   V[24]=slhaVal("MASS",V[14],1,36);
   if(!isfinite(V[24]) || FError) return 24;
   V[25]=slhaVal("MASS",V[14],1,37);
   if(!isfinite(V[25]) || FError) return 25;
   V[26]=slhaVal("MASS",V[14],1,23);
   if(!isfinite(V[26]) || FError) return 26;
   V[27]=slhaVal("MASS",V[14],1,32);
   if(!isfinite(V[27]) || FError) return 27;
   V[28]=slhaVal("MASS",V[14],1,34);
   if(!isfinite(V[28]) || FError) return 28;
   V[29]=slhaVal("MASS",V[14],1,6000055);
   if(!isfinite(V[29]) || FError) return 29;
   V[30]=slhaVal("MASS",V[14],1,1);
   if(!isfinite(V[30]) || FError) return 30;
   V[31]=slhaVal("MASS",V[14],1,3);
   if(!isfinite(V[31]) || FError) return 31;
   V[32]=slhaVal("MASS",V[14],1,5);
   if(!isfinite(V[32]) || FError) return 32;
   V[33]=slhaVal("MASS",V[14],1,2);
   if(!isfinite(V[33]) || FError) return 33;
   V[34]=slhaVal("MASS",V[14],1,4);
   if(!isfinite(V[34]) || FError) return 34;
   V[35]=slhaVal("MASS",V[14],1,6);
   if(!isfinite(V[35]) || FError) return 35;
   V[36]=slhaVal("MASS",V[14],1,11);
   if(!isfinite(V[36]) || FError) return 36;
   V[37]=slhaVal("MASS",V[14],1,13);
   if(!isfinite(V[37]) || FError) return 37;
   V[38]=slhaVal("MASS",V[14],1,15);
   if(!isfinite(V[38]) || FError) return 38;
   V[39]=slhaVal("MASS",V[14],1,12);
   if(!isfinite(V[39]) || FError) return 39;
   V[40]=slhaVal("MASS",V[14],1,14);
   if(!isfinite(V[40]) || FError) return 40;
   V[41]=slhaVal("MASS",V[14],1,16);
   if(!isfinite(V[41]) || FError) return 41;
   V[42]=slhaVal("MASS",V[14],1,6000012);
   if(!isfinite(V[42]) || FError) return 42;
   V[43]=slhaVal("MASS",V[14],1,6000014);
   if(!isfinite(V[43]) || FError) return 43;
   V[44]=slhaVal("MASS",V[14],1,6000016);
   if(!isfinite(V[44]) || FError) return 44;
   V[45]=slhaVal("MASS",V[14],1,9000012);
   if(!isfinite(V[45]) || FError) return 45;
   V[46]=slhaVal("MASS",V[14],1,9000014);
   if(!isfinite(V[46]) || FError) return 46;
   V[47]=slhaVal("MASS",V[14],1,9000016);
   if(!isfinite(V[47]) || FError) return 47;
   V[48]=slhaVal("MASS",V[14],1,17);
   if(!isfinite(V[48]) || FError) return 48;
   V[49]=slhaVal("MASS",V[14],1,19);
   if(!isfinite(V[49]) || FError) return 49;
   V[50]=slhaVal("GAUGE",V[14],1,4);
   if(!isfinite(V[50]) || FError) return 50;
   V[51]=slhaVal("GAUGE",V[14],1,5);
   if(!isfinite(V[51]) || FError) return 51;
   V[52]=slhaVal("LRINPUT",V[14],1,202);
   if(!isfinite(V[52]) || FError) return 52;
   V[53]=slhaVal("YDR",V[14],2,1,1);
   if(!isfinite(V[53]) || FError) return 53;
   V[54]=slhaVal("YDR",V[14],2,1,2);
   if(!isfinite(V[54]) || FError) return 54;
   V[55]=slhaVal("YDR",V[14],2,1,3);
   if(!isfinite(V[55]) || FError) return 55;
   V[56]=slhaVal("YDR",V[14],2,2,1);
   if(!isfinite(V[56]) || FError) return 56;
   V[57]=slhaVal("YDR",V[14],2,2,2);
   if(!isfinite(V[57]) || FError) return 57;
   V[58]=slhaVal("YDR",V[14],2,2,3);
   if(!isfinite(V[58]) || FError) return 58;
   V[59]=slhaVal("YDR",V[14],2,3,1);
   if(!isfinite(V[59]) || FError) return 59;
   V[60]=slhaVal("YDR",V[14],2,3,2);
   if(!isfinite(V[60]) || FError) return 60;
   V[61]=slhaVal("YDR",V[14],2,3,3);
   if(!isfinite(V[61]) || FError) return 61;
   V[62]=slhaVal("YL1",V[14],2,1,1);
   if(!isfinite(V[62]) || FError) return 62;
   V[63]=slhaVal("YL1",V[14],2,1,2);
   if(!isfinite(V[63]) || FError) return 63;
   V[64]=slhaVal("YL1",V[14],2,1,3);
   if(!isfinite(V[64]) || FError) return 64;
   V[65]=slhaVal("YL1",V[14],2,2,1);
   if(!isfinite(V[65]) || FError) return 65;
   V[66]=slhaVal("YL1",V[14],2,2,2);
   if(!isfinite(V[66]) || FError) return 66;
   V[67]=slhaVal("YL1",V[14],2,2,3);
   if(!isfinite(V[67]) || FError) return 67;
   V[68]=slhaVal("YL1",V[14],2,3,1);
   if(!isfinite(V[68]) || FError) return 68;
   V[69]=slhaVal("YL1",V[14],2,3,2);
   if(!isfinite(V[69]) || FError) return 69;
   V[70]=slhaVal("YL1",V[14],2,3,3);
   if(!isfinite(V[70]) || FError) return 70;
   V[71]=slhaVal("YQ1",V[14],2,1,1);
   if(!isfinite(V[71]) || FError) return 71;
   V[72]=slhaVal("YQ1",V[14],2,1,2);
   if(!isfinite(V[72]) || FError) return 72;
   V[73]=slhaVal("YQ1",V[14],2,1,3);
   if(!isfinite(V[73]) || FError) return 73;
   V[74]=slhaVal("YQ1",V[14],2,2,1);
   if(!isfinite(V[74]) || FError) return 74;
   V[75]=slhaVal("YQ1",V[14],2,2,2);
   if(!isfinite(V[75]) || FError) return 75;
   V[76]=slhaVal("YQ1",V[14],2,2,3);
   if(!isfinite(V[76]) || FError) return 76;
   V[77]=slhaVal("YQ1",V[14],2,3,1);
   if(!isfinite(V[77]) || FError) return 77;
   V[78]=slhaVal("YQ1",V[14],2,3,2);
   if(!isfinite(V[78]) || FError) return 78;
   V[79]=slhaVal("YQ1",V[14],2,3,3);
   if(!isfinite(V[79]) || FError) return 79;
   V[80]=slhaVal("LRINPUT",V[14],1,203);
   if(!isfinite(V[80]) || FError) return 80;
   V[81]=slhaVal("YL2",V[14],2,1,1);
   if(!isfinite(V[81]) || FError) return 81;
   V[82]=slhaVal("YL2",V[14],2,1,2);
   if(!isfinite(V[82]) || FError) return 82;
   V[83]=slhaVal("YL2",V[14],2,1,3);
   if(!isfinite(V[83]) || FError) return 83;
   V[84]=slhaVal("YL2",V[14],2,2,1);
   if(!isfinite(V[84]) || FError) return 84;
   V[85]=slhaVal("YL2",V[14],2,2,2);
   if(!isfinite(V[85]) || FError) return 85;
   V[86]=slhaVal("YL2",V[14],2,2,3);
   if(!isfinite(V[86]) || FError) return 86;
   V[87]=slhaVal("YL2",V[14],2,3,1);
   if(!isfinite(V[87]) || FError) return 87;
   V[88]=slhaVal("YL2",V[14],2,3,2);
   if(!isfinite(V[88]) || FError) return 88;
   V[89]=slhaVal("YL2",V[14],2,3,3);
   if(!isfinite(V[89]) || FError) return 89;
   V[90]=slhaVal("YQ2",V[14],2,1,1);
   if(!isfinite(V[90]) || FError) return 90;
   V[91]=slhaVal("YQ2",V[14],2,1,2);
   if(!isfinite(V[91]) || FError) return 91;
   V[92]=slhaVal("YQ2",V[14],2,1,3);
   if(!isfinite(V[92]) || FError) return 92;
   V[93]=slhaVal("YQ2",V[14],2,2,1);
   if(!isfinite(V[93]) || FError) return 93;
   V[94]=slhaVal("YQ2",V[14],2,2,2);
   if(!isfinite(V[94]) || FError) return 94;
   V[95]=slhaVal("YQ2",V[14],2,2,3);
   if(!isfinite(V[95]) || FError) return 95;
   V[96]=slhaVal("YQ2",V[14],2,3,1);
   if(!isfinite(V[96]) || FError) return 96;
   V[97]=slhaVal("YQ2",V[14],2,3,2);
   if(!isfinite(V[97]) || FError) return 97;
   V[98]=slhaVal("YQ2",V[14],2,3,3);
   if(!isfinite(V[98]) || FError) return 98;
   V[99]=slhaVal("LRINPUT",V[14],1,9);
   if(!isfinite(V[99]) || FError) return 99;
   V[100]=slhaVal("LRINPUT",V[14],1,7);
   if(!isfinite(V[100]) || FError) return 100;
   V[101]=slhaVal("LRINPUT",V[14],1,14);
   if(!isfinite(V[101]) || FError) return 101;
   V[102]=slhaVal("LRINPUT",V[14],1,1);
   if(!isfinite(V[102]) || FError) return 102;
   V[103]=slhaVal("LRINPUT",V[14],1,20);
   if(!isfinite(V[103]) || FError) return 103;
   V[104]=slhaVal("LRINPUT",V[14],1,16);
   if(!isfinite(V[104]) || FError) return 104;
   V[105]=slhaVal("LRINPUT",V[14],1,5);
   if(!isfinite(V[105]) || FError) return 105;
   V[106]=slhaVal("LRINPUT",V[14],1,2);
   if(!isfinite(V[106]) || FError) return 106;
   V[107]=slhaVal("LRINPUT",V[14],1,4);
   if(!isfinite(V[107]) || FError) return 107;
   V[108]=slhaVal("VEV",V[14],1,1);
   if(!isfinite(V[108]) || FError) return 108;
   V[109]=slhaVal("VEV",V[14],1,2);
   if(!isfinite(V[109]) || FError) return 109;
   V[110]=slhaVal("VEV",V[14],1,4);
   if(!isfinite(V[110]) || FError) return 110;
   V[111]=slhaVal("ZZMIX",V[14],2,1,1);
   if(!isfinite(V[111]) || FError) return 111;
   V[112]=slhaVal("ZZMIX",V[14],2,1,2);
   if(!isfinite(V[112]) || FError) return 112;
   V[113]=slhaVal("ZZMIX",V[14],2,1,3);
   if(!isfinite(V[113]) || FError) return 113;
   V[114]=slhaVal("ZZMIX",V[14],2,2,1);
   if(!isfinite(V[114]) || FError) return 114;
   V[115]=slhaVal("ZZMIX",V[14],2,2,2);
   if(!isfinite(V[115]) || FError) return 115;
   V[116]=slhaVal("ZZMIX",V[14],2,2,3);
   if(!isfinite(V[116]) || FError) return 116;
   V[117]=slhaVal("ZZMIX",V[14],2,3,1);
   if(!isfinite(V[117]) || FError) return 117;
   V[118]=slhaVal("ZZMIX",V[14],2,3,2);
   if(!isfinite(V[118]) || FError) return 118;
   V[119]=slhaVal("ZZMIX",V[14],2,3,3);
   if(!isfinite(V[119]) || FError) return 119;
   V[120]=slhaVal("PHASET",V[14],1,1);
   if(!isfinite(V[120]) || FError) return 120;
   V[121]=slhaVal("SCALARMIX",V[14],2,1,1);
   if(!isfinite(V[121]) || FError) return 121;
   V[122]=slhaVal("SCALARMIX",V[14],2,1,2);
   if(!isfinite(V[122]) || FError) return 122;
   V[123]=slhaVal("SCALARMIX",V[14],2,1,3);
   if(!isfinite(V[123]) || FError) return 123;
   V[124]=slhaVal("SCALARMIX",V[14],2,2,1);
   if(!isfinite(V[124]) || FError) return 124;
   V[125]=slhaVal("SCALARMIX",V[14],2,2,2);
   if(!isfinite(V[125]) || FError) return 125;
   V[126]=slhaVal("SCALARMIX",V[14],2,2,3);
   if(!isfinite(V[126]) || FError) return 126;
   V[127]=slhaVal("SCALARMIX",V[14],2,3,1);
   if(!isfinite(V[127]) || FError) return 127;
   V[128]=slhaVal("SCALARMIX",V[14],2,3,2);
   if(!isfinite(V[128]) || FError) return 128;
   V[129]=slhaVal("SCALARMIX",V[14],2,3,3);
   if(!isfinite(V[129]) || FError) return 129;
   V[130]=slhaVal("AMIX",V[14],2,1,1);
   if(!isfinite(V[130]) || FError) return 130;
   V[131]=slhaVal("AMIX",V[14],2,1,2);
   if(!isfinite(V[131]) || FError) return 131;
   V[132]=slhaVal("AMIX",V[14],2,1,3);
   if(!isfinite(V[132]) || FError) return 132;
   V[133]=slhaVal("AMIX",V[14],2,2,1);
   if(!isfinite(V[133]) || FError) return 133;
   V[134]=slhaVal("AMIX",V[14],2,2,2);
   if(!isfinite(V[134]) || FError) return 134;
   V[135]=slhaVal("AMIX",V[14],2,2,3);
   if(!isfinite(V[135]) || FError) return 135;
   V[136]=slhaVal("AMIX",V[14],2,3,1);
   if(!isfinite(V[136]) || FError) return 136;
   V[137]=slhaVal("AMIX",V[14],2,3,2);
   if(!isfinite(V[137]) || FError) return 137;
   V[138]=slhaVal("AMIX",V[14],2,3,3);
   if(!isfinite(V[138]) || FError) return 138;
   V[139]=slhaVal("CHMIX",V[14],2,1,1);
   if(!isfinite(V[139]) || FError) return 139;
   V[140]=slhaVal("CHMIX",V[14],2,1,2);
   if(!isfinite(V[140]) || FError) return 140;
   V[141]=slhaVal("CHMIX",V[14],2,1,3);
   if(!isfinite(V[141]) || FError) return 141;
   V[142]=slhaVal("CHMIX",V[14],2,2,1);
   if(!isfinite(V[142]) || FError) return 142;
   V[143]=slhaVal("CHMIX",V[14],2,2,2);
   if(!isfinite(V[143]) || FError) return 143;
   V[144]=slhaVal("CHMIX",V[14],2,2,3);
   if(!isfinite(V[144]) || FError) return 144;
   V[145]=slhaVal("CHMIX",V[14],2,3,1);
   if(!isfinite(V[145]) || FError) return 145;
   V[146]=slhaVal("CHMIX",V[14],2,3,2);
   if(!isfinite(V[146]) || FError) return 146;
   V[147]=slhaVal("CHMIX",V[14],2,3,3);
   if(!isfinite(V[147]) || FError) return 147;
   V[148]=slhaVal("UDLMIX",V[14],2,1,1);
   if(!isfinite(V[148]) || FError) return 148;
   V[149]=slhaVal("UDLMIX",V[14],2,1,2);
   if(!isfinite(V[149]) || FError) return 149;
   V[150]=slhaVal("UDLMIX",V[14],2,1,3);
   if(!isfinite(V[150]) || FError) return 150;
   V[151]=slhaVal("UDLMIX",V[14],2,2,1);
   if(!isfinite(V[151]) || FError) return 151;
   V[152]=slhaVal("UDLMIX",V[14],2,2,2);
   if(!isfinite(V[152]) || FError) return 152;
   V[153]=slhaVal("UDLMIX",V[14],2,2,3);
   if(!isfinite(V[153]) || FError) return 153;
   V[154]=slhaVal("UDLMIX",V[14],2,3,1);
   if(!isfinite(V[154]) || FError) return 154;
   V[155]=slhaVal("UDLMIX",V[14],2,3,2);
   if(!isfinite(V[155]) || FError) return 155;
   V[156]=slhaVal("UDLMIX",V[14],2,3,3);
   if(!isfinite(V[156]) || FError) return 156;
   V[157]=slhaVal("UDRMIX",V[14],2,1,1);
   if(!isfinite(V[157]) || FError) return 157;
   V[158]=slhaVal("UDRMIX",V[14],2,1,2);
   if(!isfinite(V[158]) || FError) return 158;
   V[159]=slhaVal("UDRMIX",V[14],2,1,3);
   if(!isfinite(V[159]) || FError) return 159;
   V[160]=slhaVal("UDRMIX",V[14],2,2,1);
   if(!isfinite(V[160]) || FError) return 160;
   V[161]=slhaVal("UDRMIX",V[14],2,2,2);
   if(!isfinite(V[161]) || FError) return 161;
   V[162]=slhaVal("UDRMIX",V[14],2,2,3);
   if(!isfinite(V[162]) || FError) return 162;
   V[163]=slhaVal("UDRMIX",V[14],2,3,1);
   if(!isfinite(V[163]) || FError) return 163;
   V[164]=slhaVal("UDRMIX",V[14],2,3,2);
   if(!isfinite(V[164]) || FError) return 164;
   V[165]=slhaVal("UDRMIX",V[14],2,3,3);
   if(!isfinite(V[165]) || FError) return 165;
   V[166]=slhaVal("UULMIX",V[14],2,1,1);
   if(!isfinite(V[166]) || FError) return 166;
   V[167]=slhaVal("UULMIX",V[14],2,1,2);
   if(!isfinite(V[167]) || FError) return 167;
   V[168]=slhaVal("UULMIX",V[14],2,1,3);
   if(!isfinite(V[168]) || FError) return 168;
   V[169]=slhaVal("UULMIX",V[14],2,2,1);
   if(!isfinite(V[169]) || FError) return 169;
   V[170]=slhaVal("UULMIX",V[14],2,2,2);
   if(!isfinite(V[170]) || FError) return 170;
   V[171]=slhaVal("UULMIX",V[14],2,2,3);
   if(!isfinite(V[171]) || FError) return 171;
   V[172]=slhaVal("UULMIX",V[14],2,3,1);
   if(!isfinite(V[172]) || FError) return 172;
   V[173]=slhaVal("UULMIX",V[14],2,3,2);
   if(!isfinite(V[173]) || FError) return 173;
   V[174]=slhaVal("UULMIX",V[14],2,3,3);
   if(!isfinite(V[174]) || FError) return 174;
   V[175]=slhaVal("UURMIX",V[14],2,1,1);
   if(!isfinite(V[175]) || FError) return 175;
   V[176]=slhaVal("UURMIX",V[14],2,1,2);
   if(!isfinite(V[176]) || FError) return 176;
   V[177]=slhaVal("UURMIX",V[14],2,1,3);
   if(!isfinite(V[177]) || FError) return 177;
   V[178]=slhaVal("UURMIX",V[14],2,2,1);
   if(!isfinite(V[178]) || FError) return 178;
   V[179]=slhaVal("UURMIX",V[14],2,2,2);
   if(!isfinite(V[179]) || FError) return 179;
   V[180]=slhaVal("UURMIX",V[14],2,2,3);
   if(!isfinite(V[180]) || FError) return 180;
   V[181]=slhaVal("UURMIX",V[14],2,3,1);
   if(!isfinite(V[181]) || FError) return 181;
   V[182]=slhaVal("UURMIX",V[14],2,3,2);
   if(!isfinite(V[182]) || FError) return 182;
   V[183]=slhaVal("UURMIX",V[14],2,3,3);
   if(!isfinite(V[183]) || FError) return 183;
   V[184]=slhaVal("UELMIX",V[14],2,1,1);
   if(!isfinite(V[184]) || FError) return 184;
   V[185]=slhaVal("UELMIX",V[14],2,1,2);
   if(!isfinite(V[185]) || FError) return 185;
   V[186]=slhaVal("UELMIX",V[14],2,1,3);
   if(!isfinite(V[186]) || FError) return 186;
   V[187]=slhaVal("UELMIX",V[14],2,2,1);
   if(!isfinite(V[187]) || FError) return 187;
   V[188]=slhaVal("UELMIX",V[14],2,2,2);
   if(!isfinite(V[188]) || FError) return 188;
   V[189]=slhaVal("UELMIX",V[14],2,2,3);
   if(!isfinite(V[189]) || FError) return 189;
   V[190]=slhaVal("UELMIX",V[14],2,3,1);
   if(!isfinite(V[190]) || FError) return 190;
   V[191]=slhaVal("UELMIX",V[14],2,3,2);
   if(!isfinite(V[191]) || FError) return 191;
   V[192]=slhaVal("UELMIX",V[14],2,3,3);
   if(!isfinite(V[192]) || FError) return 192;
   V[193]=slhaVal("UERMIX",V[14],2,1,1);
   if(!isfinite(V[193]) || FError) return 193;
   V[194]=slhaVal("UERMIX",V[14],2,1,2);
   if(!isfinite(V[194]) || FError) return 194;
   V[195]=slhaVal("UERMIX",V[14],2,1,3);
   if(!isfinite(V[195]) || FError) return 195;
   V[196]=slhaVal("UERMIX",V[14],2,2,1);
   if(!isfinite(V[196]) || FError) return 196;
   V[197]=slhaVal("UERMIX",V[14],2,2,2);
   if(!isfinite(V[197]) || FError) return 197;
   V[198]=slhaVal("UERMIX",V[14],2,2,3);
   if(!isfinite(V[198]) || FError) return 198;
   V[199]=slhaVal("UERMIX",V[14],2,3,1);
   if(!isfinite(V[199]) || FError) return 199;
   V[200]=slhaVal("UERMIX",V[14],2,3,2);
   if(!isfinite(V[200]) || FError) return 200;
   V[201]=slhaVal("UERMIX",V[14],2,3,3);
   if(!isfinite(V[201]) || FError) return 201;
   V[202]=slhaVal("UVMIX",V[14],2,1,1);
   if(!isfinite(V[202]) || FError) return 202;
   V[203]=slhaVal("UVMIX",V[14],2,1,2);
   if(!isfinite(V[203]) || FError) return 203;
   V[204]=slhaVal("UVMIX",V[14],2,1,3);
   if(!isfinite(V[204]) || FError) return 204;
   V[205]=slhaVal("UVMIX",V[14],2,1,4);
   if(!isfinite(V[205]) || FError) return 205;
   V[206]=slhaVal("UVMIX",V[14],2,1,5);
   if(!isfinite(V[206]) || FError) return 206;
   V[207]=slhaVal("UVMIX",V[14],2,1,6);
   if(!isfinite(V[207]) || FError) return 207;
   V[208]=slhaVal("UVMIX",V[14],2,2,1);
   if(!isfinite(V[208]) || FError) return 208;
   V[209]=slhaVal("UVMIX",V[14],2,2,2);
   if(!isfinite(V[209]) || FError) return 209;
   V[210]=slhaVal("UVMIX",V[14],2,2,3);
   if(!isfinite(V[210]) || FError) return 210;
   V[211]=slhaVal("UVMIX",V[14],2,2,4);
   if(!isfinite(V[211]) || FError) return 211;
   V[212]=slhaVal("UVMIX",V[14],2,2,5);
   if(!isfinite(V[212]) || FError) return 212;
   V[213]=slhaVal("UVMIX",V[14],2,2,6);
   if(!isfinite(V[213]) || FError) return 213;
   V[214]=slhaVal("UVMIX",V[14],2,3,1);
   if(!isfinite(V[214]) || FError) return 214;
   V[215]=slhaVal("UVMIX",V[14],2,3,2);
   if(!isfinite(V[215]) || FError) return 215;
   V[216]=slhaVal("UVMIX",V[14],2,3,3);
   if(!isfinite(V[216]) || FError) return 216;
   V[217]=slhaVal("UVMIX",V[14],2,3,4);
   if(!isfinite(V[217]) || FError) return 217;
   V[218]=slhaVal("UVMIX",V[14],2,3,5);
   if(!isfinite(V[218]) || FError) return 218;
   V[219]=slhaVal("UVMIX",V[14],2,3,6);
   if(!isfinite(V[219]) || FError) return 219;
   V[220]=slhaVal("UVMIX",V[14],2,4,1);
   if(!isfinite(V[220]) || FError) return 220;
   V[221]=slhaVal("UVMIX",V[14],2,4,2);
   if(!isfinite(V[221]) || FError) return 221;
   V[222]=slhaVal("UVMIX",V[14],2,4,3);
   if(!isfinite(V[222]) || FError) return 222;
   V[223]=slhaVal("UVMIX",V[14],2,4,4);
   if(!isfinite(V[223]) || FError) return 223;
   V[224]=slhaVal("UVMIX",V[14],2,4,5);
   if(!isfinite(V[224]) || FError) return 224;
   V[225]=slhaVal("UVMIX",V[14],2,4,6);
   if(!isfinite(V[225]) || FError) return 225;
   V[226]=slhaVal("UVMIX",V[14],2,5,1);
   if(!isfinite(V[226]) || FError) return 226;
   V[227]=slhaVal("UVMIX",V[14],2,5,2);
   if(!isfinite(V[227]) || FError) return 227;
   V[228]=slhaVal("UVMIX",V[14],2,5,3);
   if(!isfinite(V[228]) || FError) return 228;
   V[229]=slhaVal("UVMIX",V[14],2,5,4);
   if(!isfinite(V[229]) || FError) return 229;
   V[230]=slhaVal("UVMIX",V[14],2,5,5);
   if(!isfinite(V[230]) || FError) return 230;
   V[231]=slhaVal("UVMIX",V[14],2,5,6);
   if(!isfinite(V[231]) || FError) return 231;
   V[232]=slhaVal("UVMIX",V[14],2,6,1);
   if(!isfinite(V[232]) || FError) return 232;
   V[233]=slhaVal("UVMIX",V[14],2,6,2);
   if(!isfinite(V[233]) || FError) return 233;
   V[234]=slhaVal("UVMIX",V[14],2,6,3);
   if(!isfinite(V[234]) || FError) return 234;
   V[235]=slhaVal("UVMIX",V[14],2,6,4);
   if(!isfinite(V[235]) || FError) return 235;
   V[236]=slhaVal("UVMIX",V[14],2,6,5);
   if(!isfinite(V[236]) || FError) return 236;
   V[237]=slhaVal("UVMIX",V[14],2,6,6);
   if(!isfinite(V[237]) || FError) return 237;
   V[238]=slhaVal("UTMIX",V[14],2,1,1);
   if(!isfinite(V[238]) || FError) return 238;
   V[239]=slhaVal("UTMIX",V[14],2,1,2);
   if(!isfinite(V[239]) || FError) return 239;
   V[240]=slhaVal("UTMIX",V[14],2,1,3);
   if(!isfinite(V[240]) || FError) return 240;
   V[241]=slhaVal("UTMIX",V[14],2,2,1);
   if(!isfinite(V[241]) || FError) return 241;
   V[242]=slhaVal("UTMIX",V[14],2,2,2);
   if(!isfinite(V[242]) || FError) return 242;
   V[243]=slhaVal("UTMIX",V[14],2,2,3);
   if(!isfinite(V[243]) || FError) return 243;
   V[244]=slhaVal("UTMIX",V[14],2,3,1);
   if(!isfinite(V[244]) || FError) return 244;
   V[245]=slhaVal("UTMIX",V[14],2,3,2);
   if(!isfinite(V[245]) || FError) return 245;
   V[246]=slhaVal("UTMIX",V[14],2,3,3);
   if(!isfinite(V[246]) || FError) return 246;
   V[247]=slhaVal("VTEMIX",V[14],2,1,1);
   if(!isfinite(V[247]) || FError) return 247;
   V[248]=slhaVal("VTEMIX",V[14],2,1,2);
   if(!isfinite(V[248]) || FError) return 248;
   V[249]=slhaVal("VTEMIX",V[14],2,2,1);
   if(!isfinite(V[249]) || FError) return 249;
   V[250]=slhaVal("VTEMIX",V[14],2,2,2);
   if(!isfinite(V[250]) || FError) return 250;
   V[251]=slhaVal("UTEMIX",V[14],2,1,1);
   if(!isfinite(V[251]) || FError) return 251;
   V[252]=slhaVal("UTEMIX",V[14],2,1,2);
   if(!isfinite(V[252]) || FError) return 252;
   V[253]=slhaVal("UTEMIX",V[14],2,2,1);
   if(!isfinite(V[253]) || FError) return 253;
   V[254]=slhaVal("UTEMIX",V[14],2,2,2);
   if(!isfinite(V[254]) || FError) return 254;
   V[255]=slhaVal("THETAW",V[14],1,1);
   if(!isfinite(V[255]) || FError) return 255;
   V[256]=slhaVal("PHIW",V[14],1,1);
   if(!isfinite(V[256]) || FError) return 256;
   V[257]=slhaVal("EFFHIGGSCOUPLINGS",V[14],3,25,22,22);
   if(!isfinite(V[257]) || FError) return 257;
   V[258]=slhaVal("EFFHIGGSCOUPLINGS",V[14],3,25,21,21);
   if(!isfinite(V[258]) || FError) return 258;
   V[259]=slhaVal("EFFHIGGSCOUPLINGS",V[14],3,35,22,22);
   if(!isfinite(V[259]) || FError) return 259;
   V[260]=slhaVal("EFFHIGGSCOUPLINGS",V[14],3,35,21,21);
   if(!isfinite(V[260]) || FError) return 260;
   V[261]=slhaVal("EFFHIGGSCOUPLINGS",V[14],3,335,22,22);
   if(!isfinite(V[261]) || FError) return 261;
   V[262]=slhaVal("EFFHIGGSCOUPLINGS",V[14],3,335,21,21);
   if(!isfinite(V[262]) || FError) return 262;
   V[263]=slhaVal("EFFHIGGSCOUPLINGS",V[14],3,36,22,22);
   if(!isfinite(V[263]) || FError) return 263;
   V[264]=slhaVal("EFFHIGGSCOUPLINGS",V[14],3,36,21,21);
   if(!isfinite(V[264]) || FError) return 264;
   V[265]=initQCD(V[15],V[34],V[32],V[35]);
   if(!isfinite(V[265]) || FError) return 265;
   V[266]=sqrt(alphaQCD(V[14])*4*3.1415927)*1;
   if(!isfinite(V[266]) || FError) return 266;
   V[267]=sin(V[256]);
   if(!isfinite(V[267]) || FError) return 267;
   V[268]=cos(V[256]);
   if(!isfinite(V[268]) || FError) return 268;
   V[269]=tan(V[256]);
   if(!isfinite(V[269]) || FError) return 269;
   V[270]=sin(V[255]);
   if(!isfinite(V[270]) || FError) return 270;
   V[271]=cos(V[255]);
   if(!isfinite(V[271]) || FError) return 271;
   V[272]=tan(V[255]);
   if(!isfinite(V[272]) || FError) return 272;
   V[273]=2*sqrt(1/(V[17]))*sqrt(V[13]);
   if(!isfinite(V[273]) || FError) return 273;
   V[274]=V[273]*1/(sin(V[255]));
   if(!isfinite(V[274]) || FError) return 274;
   V[275]=sqrt(pow(V[26],2)/(2.)+sqrt(pow(V[26],4)/(4.)-pow(V[26],2)*V[13]/(V[12]*V[17]*V[18])));
   if(!isfinite(V[275]) || FError) return 275;
   if(VV==NULL) 
   {  VV=malloc(sizeof(REAL)*nModelVars);
      for(i=0;i<nModelVars;i++) if(strcmp(varNames[i],"Q")==0) iQ=i;
   }
   for(i=0;i<nModelVars;i++) VV[i]=V[i];
   cErr=0;
   return 0;
}

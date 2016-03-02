#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "../../CalcHEP_src/include/extern.h"
#include "../../CalcHEP_src/include/VandP.h"
#include "autoprot.h"
extern int  FError;
/*  Special model functions  */

int nModelParticles=40;
static ModelPrtclsStr ModelPrtcls_[40]=
{
  {"hh1","hh1", 25, "Mhh1","Whh1",0,1,0}
, {"hh2","hh2", 35, "Mhh2","Whh2",0,1,0}
, {"hh3","hh3", 335, "Mhh3","Whh3",0,1,0}
, {"hh4","hh4", 6000029, "Mhh4","Whh4",0,1,0}
, {"hh5","hh5", 6000030, "Mhh5","Whh5",0,1,0}
, {"hh6","hh6", 6000031, "Mhh6","Whh6",0,1,0}
, {"Ah3","Ah3", 36, "MAh3","WAh3",0,1,0}
, {"Ah4","Ah4", 6000021, "MAh4","WAh4",0,1,0}
, {"Ah5","Ah5", 6000022, "MAh5","WAh5",0,1,0}
, {"Ah6","Ah6", 6000023, "MAh6","WAh6",0,1,0}
, {"Hm3","Hp3", -37, "MHm3","WHm3",0,1,-3}
, {"Hm4","Hp4", -6000034, "MHm4","WHm4",0,1,-3}
, {"Hm5","Hp5", -6000035, "MHm5","WHm5",0,1,-3}
, {"Hm6","Hp6", -6000036, "MHm6","WHm6",0,1,-3}
, {"Hmm1","Hpp1", -9000055, "MHmm1","WHmm1",0,1,-6}
, {"Hmm2","Hpp2", -9000065, "MHmm2","WHmm2",0,1,-6}
, {"g","g", 21, "0","0",2,8,0}
, {"A","A", 22, "0","0",2,1,0}
, {"Z","Z", 23, "MZ","WZ",2,1,0}
, {"Zp","Zp", 32, "MZp","WZp",2,1,0}
, {"WLm","WLp", -24, "MWLm","WWLm",2,1,-3}
, {"WRm","WRp", -34, "MWRm","WWRm",2,1,-3}
, {"d1","D1", 1, "Md1","Wd1",1,3,-1}
, {"d2","D2", 3, "Md2","Wd2",1,3,-1}
, {"d3","D3", 5, "Md3","Wd3",1,3,-1}
, {"d4","D4", 6000001, "Md4","Wd4",1,3,-1}
, {"d5","D5", 6000003, "Md5","Wd5",1,3,-1}
, {"d6","D6", 6000005, "Md6","Wd6",1,3,-1}
, {"u1","U1", 2, "Mu1","Wu1",1,3,2}
, {"u2","U2", 4, "Mu2","Wu2",1,3,2}
, {"u3","U3", 6, "Mu3","Wu3",1,3,2}
, {"e1","E1", 11, "Me1","We1",1,1,-3}
, {"e2","E2", 13, "Me2","We2",1,1,-3}
, {"e3","E3", 15, "Me3","We3",1,1,-3}
, {"nu1","nu1", 12, "Mnu1","Wnu1",1,1,0}
, {"nu2","nu2", 14, "Mnu2","Wnu2",1,1,0}
, {"nu3","nu3", 16, "Mnu3","Wnu3",1,1,0}
, {"nu4","nu4", 6000012, "Mnu4","Wnu4",1,1,0}
, {"nu5","nu5", 6000014, "Mnu5","Wnu5",1,1,0}
, {"nu6","nu6", 6000016, "Mnu6","Wnu6",1,1,0}
};
ModelPrtclsStr *ModelPrtcls=ModelPrtcls_; 
int nModelVars=19;
int nModelFunc=420;
static char*varNames_[439]={
 "WZ","WWLm","Wd1","Wd2","Wd3","Wu1","Wu2","Wu3","We1","We2"
,"We3","Maux","sqrt2","Pi","Q","alfSMZ","aEWinv","aS","Gf","rd"
,"Mhh1","Mhh2","Mhh3","Mhh4","Mhh5","Mhh6","MAh3","MAh4","MAh5","MAh6"
,"MHm3","MHm4","MHm5","MHm6","MHmm1","MHmm2","MZ","MZp","MWRm","Md1"
,"Md2","Md3","Md4","Md5","Md6","Mu1","Mu2","Mu3","Me1","Me2"
,"Me3","Mnu1","Mnu2","Mnu3","Mnu4","Mnu5","Mnu6","gBL","gR","YQ211"
,"YQ212","YQ213","YQ221","YQ222","YQ223","YQ231","YQ232","YQ233","xiLR","xiR"
,"YDR11","YDR12","YDR13","YDR21","YDR22","YDR23","YDR31","YDR32","YDR33","YL111"
,"YL112","YL113","YL121","YL122","YL123","YL131","YL132","YL133","yq311","yq312"
,"yq313","yq321","yq322","yq323","yq331","yq332","yq333","YDL11","YDL12","YDL13"
,"YDL21","YDL22","YDL23","YDL31","YDL32","YDL33","YQ111","YQ112","YQ113","YQ121"
,"YQ122","YQ123","YQ131","YQ132","YQ133","alp","RHO2","RHO1","rh3","ALP3"
,"ALP1","LAM1","etall","etalr","laml","lamlr","betl","err2","etarl","etarr"
,"lamr","betr","err1","BETA2","LAM3","v1","v2","vtl","vtr","vhl"
,"vhr","ZZ11","ZZ12","ZZ13","ZZ21","ZZ22","ZZ23","ZZ31","ZZ32","ZZ33"
,"ZH11","ZH12","ZH13","ZH14","ZH15","ZH16","ZH21","ZH22","ZH23","ZH24"
,"ZH25","ZH26","ZH31","ZH32","ZH33","ZH34","ZH35","ZH36","ZH41","ZH42"
,"ZH43","ZH44","ZH45","ZH46","ZH51","ZH52","ZH53","ZH54","ZH55","ZH56"
,"ZH61","ZH62","ZH63","ZH64","ZH65","ZH66","UP11","UP12","UP13","UP14"
,"UP15","UP16","UP21","UP22","UP23","UP24","UP25","UP26","UP31","UP32"
,"UP33","UP34","UP35","UP36","UP41","UP42","UP43","UP44","UP45","UP46"
,"UP51","UP52","UP53","UP54","UP55","UP56","UP61","UP62","UP63","UP64"
,"UP65","UP66","UC11","UC12","UC13","UC14","UC15","UC16","UC21","UC22"
,"UC23","UC24","UC25","UC26","UC31","UC32","UC33","UC34","UC35","UC36"
,"UC41","UC42","UC43","UC44","UC45","UC46","UC51","UC52","UC53","UC54"
,"UC55","UC56","UC61","UC62","UC63","UC64","UC65","UC66","UCC11","UCC12"
,"UCC21","UCC22","ZDL11","ZDL12","ZDL13","ZDL14","ZDL15","ZDL16","ZDL21","ZDL22"
,"ZDL23","ZDL24","ZDL25","ZDL26","ZDL31","ZDL32","ZDL33","ZDL34","ZDL35","ZDL36"
,"ZDL41","ZDL42","ZDL43","ZDL44","ZDL45","ZDL46","ZDL51","ZDL52","ZDL53","ZDL54"
,"ZDL55","ZDL56","ZDL61","ZDL62","ZDL63","ZDL64","ZDL65","ZDL66","ZDR11","ZDR12"
,"ZDR13","ZDR14","ZDR15","ZDR16","ZDR21","ZDR22","ZDR23","ZDR24","ZDR25","ZDR26"
,"ZDR31","ZDR32","ZDR33","ZDR34","ZDR35","ZDR36","ZDR41","ZDR42","ZDR43","ZDR44"
,"ZDR45","ZDR46","ZDR51","ZDR52","ZDR53","ZDR54","ZDR55","ZDR56","ZDR61","ZDR62"
,"ZDR63","ZDR64","ZDR65","ZDR66","ZUL11","ZUL12","ZUL13","ZUL21","ZUL22","ZUL23"
,"ZUL31","ZUL32","ZUL33","ZUR11","ZUR12","ZUR13","ZUR21","ZUR22","ZUR23","ZUR31"
,"ZUR32","ZUR33","ZEL11","ZEL12","ZEL13","ZEL21","ZEL22","ZEL23","ZEL31","ZEL32"
,"ZEL33","ZER11","ZER12","ZER13","ZER21","ZER22","ZER23","ZER31","ZER32","ZER33"
,"UV11","UV12","UV13","UV14","UV15","UV16","UV21","UV22","UV23","UV24"
,"UV25","UV26","UV31","UV32","UV33","UV34","UV35","UV36","UV41","UV42"
,"UV43","UV44","UV45","UV46","UV51","UV52","UV53","UV54","UV55","UV56"
,"UV61","UV62","UV63","UV64","UV65","UV66","TW","PhiW","HPP1","HGG1"
,"HPP2","HGG2","HPP3","HGG3","HPP4","HGG4","HPP5","HGG5","HPP6","HGG6"
,"APP3","AGG3","APP4","AGG4","APP5","AGG5","APP6","AGG6","QCDok","g3"
,"SPh","CPh","TPh","STW","CTW","TTW","el","g2","MWLm"};
char**varNames=varNames_;
static REAL varValues_[439]={
   2.495200E+00,  2.141000E+00,  0.000000E+00,  0.000000E+00,  0.000000E+00,  0.000000E+00,  0.000000E+00,  1.510000E+00,  0.000000E+00,  0.000000E+00
,  0.000000E+00,  1.000000E+00,  1.414214E+00,  3.141593E+00,  1.000000E+02,  1.172000E-01,  1.370360E+02,  1.190000E-01,  1.166390E-05};
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
   V[19]=slhaRead("SPheno.spc.darkLR",0);
   if(!isfinite(V[19]) || FError) return 19;
 FirstQ:
 cErr=1;
   V[20]=slhaVal("MASS",V[14],1,25);
   if(!isfinite(V[20]) || FError) return 20;
   V[21]=slhaVal("MASS",V[14],1,35);
   if(!isfinite(V[21]) || FError) return 21;
   V[22]=slhaVal("MASS",V[14],1,335);
   if(!isfinite(V[22]) || FError) return 22;
   V[23]=slhaVal("MASS",V[14],1,6000029);
   if(!isfinite(V[23]) || FError) return 23;
   V[24]=slhaVal("MASS",V[14],1,6000030);
   if(!isfinite(V[24]) || FError) return 24;
   V[25]=slhaVal("MASS",V[14],1,6000031);
   if(!isfinite(V[25]) || FError) return 25;
   V[26]=slhaVal("MASS",V[14],1,36);
   if(!isfinite(V[26]) || FError) return 26;
   V[27]=slhaVal("MASS",V[14],1,6000021);
   if(!isfinite(V[27]) || FError) return 27;
   V[28]=slhaVal("MASS",V[14],1,6000022);
   if(!isfinite(V[28]) || FError) return 28;
   V[29]=slhaVal("MASS",V[14],1,6000023);
   if(!isfinite(V[29]) || FError) return 29;
   V[30]=slhaVal("MASS",V[14],1,37);
   if(!isfinite(V[30]) || FError) return 30;
   V[31]=slhaVal("MASS",V[14],1,6000034);
   if(!isfinite(V[31]) || FError) return 31;
   V[32]=slhaVal("MASS",V[14],1,6000035);
   if(!isfinite(V[32]) || FError) return 32;
   V[33]=slhaVal("MASS",V[14],1,6000036);
   if(!isfinite(V[33]) || FError) return 33;
   V[34]=slhaVal("MASS",V[14],1,9000055);
   if(!isfinite(V[34]) || FError) return 34;
   V[35]=slhaVal("MASS",V[14],1,9000065);
   if(!isfinite(V[35]) || FError) return 35;
   V[36]=slhaVal("MASS",V[14],1,23);
   if(!isfinite(V[36]) || FError) return 36;
   V[37]=slhaVal("MASS",V[14],1,32);
   if(!isfinite(V[37]) || FError) return 37;
   V[38]=slhaVal("MASS",V[14],1,34);
   if(!isfinite(V[38]) || FError) return 38;
   V[39]=slhaVal("MASS",V[14],1,1);
   if(!isfinite(V[39]) || FError) return 39;
   V[40]=slhaVal("MASS",V[14],1,3);
   if(!isfinite(V[40]) || FError) return 40;
   V[41]=slhaVal("MASS",V[14],1,5);
   if(!isfinite(V[41]) || FError) return 41;
   V[42]=slhaVal("MASS",V[14],1,6000001);
   if(!isfinite(V[42]) || FError) return 42;
   V[43]=slhaVal("MASS",V[14],1,6000003);
   if(!isfinite(V[43]) || FError) return 43;
   V[44]=slhaVal("MASS",V[14],1,6000005);
   if(!isfinite(V[44]) || FError) return 44;
   V[45]=slhaVal("MASS",V[14],1,2);
   if(!isfinite(V[45]) || FError) return 45;
   V[46]=slhaVal("MASS",V[14],1,4);
   if(!isfinite(V[46]) || FError) return 46;
   V[47]=slhaVal("MASS",V[14],1,6);
   if(!isfinite(V[47]) || FError) return 47;
   V[48]=slhaVal("MASS",V[14],1,11);
   if(!isfinite(V[48]) || FError) return 48;
   V[49]=slhaVal("MASS",V[14],1,13);
   if(!isfinite(V[49]) || FError) return 49;
   V[50]=slhaVal("MASS",V[14],1,15);
   if(!isfinite(V[50]) || FError) return 50;
   V[51]=slhaVal("MASS",V[14],1,12);
   if(!isfinite(V[51]) || FError) return 51;
   V[52]=slhaVal("MASS",V[14],1,14);
   if(!isfinite(V[52]) || FError) return 52;
   V[53]=slhaVal("MASS",V[14],1,16);
   if(!isfinite(V[53]) || FError) return 53;
   V[54]=slhaVal("MASS",V[14],1,6000012);
   if(!isfinite(V[54]) || FError) return 54;
   V[55]=slhaVal("MASS",V[14],1,6000014);
   if(!isfinite(V[55]) || FError) return 55;
   V[56]=slhaVal("MASS",V[14],1,6000016);
   if(!isfinite(V[56]) || FError) return 56;
   V[57]=slhaVal("GAUGE",V[14],1,4);
   if(!isfinite(V[57]) || FError) return 57;
   V[58]=slhaVal("GAUGE",V[14],1,5);
   if(!isfinite(V[58]) || FError) return 58;
   V[59]=slhaVal("YQ2",V[14],2,1,1);
   if(!isfinite(V[59]) || FError) return 59;
   V[60]=slhaVal("YQ2",V[14],2,1,2);
   if(!isfinite(V[60]) || FError) return 60;
   V[61]=slhaVal("YQ2",V[14],2,1,3);
   if(!isfinite(V[61]) || FError) return 61;
   V[62]=slhaVal("YQ2",V[14],2,2,1);
   if(!isfinite(V[62]) || FError) return 62;
   V[63]=slhaVal("YQ2",V[14],2,2,2);
   if(!isfinite(V[63]) || FError) return 63;
   V[64]=slhaVal("YQ2",V[14],2,2,3);
   if(!isfinite(V[64]) || FError) return 64;
   V[65]=slhaVal("YQ2",V[14],2,3,1);
   if(!isfinite(V[65]) || FError) return 65;
   V[66]=slhaVal("YQ2",V[14],2,3,2);
   if(!isfinite(V[66]) || FError) return 66;
   V[67]=slhaVal("YQ2",V[14],2,3,3);
   if(!isfinite(V[67]) || FError) return 67;
   V[68]=slhaVal("DARKLR",V[14],1,5);
   if(!isfinite(V[68]) || FError) return 68;
   V[69]=slhaVal("DARKLR",V[14],1,3);
   if(!isfinite(V[69]) || FError) return 69;
   V[70]=slhaVal("YDR",V[14],2,1,1);
   if(!isfinite(V[70]) || FError) return 70;
   V[71]=slhaVal("YDR",V[14],2,1,2);
   if(!isfinite(V[71]) || FError) return 71;
   V[72]=slhaVal("YDR",V[14],2,1,3);
   if(!isfinite(V[72]) || FError) return 72;
   V[73]=slhaVal("YDR",V[14],2,2,1);
   if(!isfinite(V[73]) || FError) return 73;
   V[74]=slhaVal("YDR",V[14],2,2,2);
   if(!isfinite(V[74]) || FError) return 74;
   V[75]=slhaVal("YDR",V[14],2,2,3);
   if(!isfinite(V[75]) || FError) return 75;
   V[76]=slhaVal("YDR",V[14],2,3,1);
   if(!isfinite(V[76]) || FError) return 76;
   V[77]=slhaVal("YDR",V[14],2,3,2);
   if(!isfinite(V[77]) || FError) return 77;
   V[78]=slhaVal("YDR",V[14],2,3,3);
   if(!isfinite(V[78]) || FError) return 78;
   V[79]=slhaVal("YL1",V[14],2,1,1);
   if(!isfinite(V[79]) || FError) return 79;
   V[80]=slhaVal("YL1",V[14],2,1,2);
   if(!isfinite(V[80]) || FError) return 80;
   V[81]=slhaVal("YL1",V[14],2,1,3);
   if(!isfinite(V[81]) || FError) return 81;
   V[82]=slhaVal("YL1",V[14],2,2,1);
   if(!isfinite(V[82]) || FError) return 82;
   V[83]=slhaVal("YL1",V[14],2,2,2);
   if(!isfinite(V[83]) || FError) return 83;
   V[84]=slhaVal("YL1",V[14],2,2,3);
   if(!isfinite(V[84]) || FError) return 84;
   V[85]=slhaVal("YL1",V[14],2,3,1);
   if(!isfinite(V[85]) || FError) return 85;
   V[86]=slhaVal("YL1",V[14],2,3,2);
   if(!isfinite(V[86]) || FError) return 86;
   V[87]=slhaVal("YL1",V[14],2,3,3);
   if(!isfinite(V[87]) || FError) return 87;
   V[88]=slhaVal("YQ3",V[14],2,1,1);
   if(!isfinite(V[88]) || FError) return 88;
   V[89]=slhaVal("YQ3",V[14],2,1,2);
   if(!isfinite(V[89]) || FError) return 89;
   V[90]=slhaVal("YQ3",V[14],2,1,3);
   if(!isfinite(V[90]) || FError) return 90;
   V[91]=slhaVal("YQ3",V[14],2,2,1);
   if(!isfinite(V[91]) || FError) return 91;
   V[92]=slhaVal("YQ3",V[14],2,2,2);
   if(!isfinite(V[92]) || FError) return 92;
   V[93]=slhaVal("YQ3",V[14],2,2,3);
   if(!isfinite(V[93]) || FError) return 93;
   V[94]=slhaVal("YQ3",V[14],2,3,1);
   if(!isfinite(V[94]) || FError) return 94;
   V[95]=slhaVal("YQ3",V[14],2,3,2);
   if(!isfinite(V[95]) || FError) return 95;
   V[96]=slhaVal("YQ3",V[14],2,3,3);
   if(!isfinite(V[96]) || FError) return 96;
   V[97]=slhaVal("YDL",V[14],2,1,1);
   if(!isfinite(V[97]) || FError) return 97;
   V[98]=slhaVal("YDL",V[14],2,1,2);
   if(!isfinite(V[98]) || FError) return 98;
   V[99]=slhaVal("YDL",V[14],2,1,3);
   if(!isfinite(V[99]) || FError) return 99;
   V[100]=slhaVal("YDL",V[14],2,2,1);
   if(!isfinite(V[100]) || FError) return 100;
   V[101]=slhaVal("YDL",V[14],2,2,2);
   if(!isfinite(V[101]) || FError) return 101;
   V[102]=slhaVal("YDL",V[14],2,2,3);
   if(!isfinite(V[102]) || FError) return 102;
   V[103]=slhaVal("YDL",V[14],2,3,1);
   if(!isfinite(V[103]) || FError) return 103;
   V[104]=slhaVal("YDL",V[14],2,3,2);
   if(!isfinite(V[104]) || FError) return 104;
   V[105]=slhaVal("YDL",V[14],2,3,3);
   if(!isfinite(V[105]) || FError) return 105;
   V[106]=slhaVal("YQ1",V[14],2,1,1);
   if(!isfinite(V[106]) || FError) return 106;
   V[107]=slhaVal("YQ1",V[14],2,1,2);
   if(!isfinite(V[107]) || FError) return 107;
   V[108]=slhaVal("YQ1",V[14],2,1,3);
   if(!isfinite(V[108]) || FError) return 108;
   V[109]=slhaVal("YQ1",V[14],2,2,1);
   if(!isfinite(V[109]) || FError) return 109;
   V[110]=slhaVal("YQ1",V[14],2,2,2);
   if(!isfinite(V[110]) || FError) return 110;
   V[111]=slhaVal("YQ1",V[14],2,2,3);
   if(!isfinite(V[111]) || FError) return 111;
   V[112]=slhaVal("YQ1",V[14],2,3,1);
   if(!isfinite(V[112]) || FError) return 112;
   V[113]=slhaVal("YQ1",V[14],2,3,2);
   if(!isfinite(V[113]) || FError) return 113;
   V[114]=slhaVal("YQ1",V[14],2,3,3);
   if(!isfinite(V[114]) || FError) return 114;
   V[115]=slhaVal("DARKLR",V[14],1,2);
   if(!isfinite(V[115]) || FError) return 115;
   V[116]=slhaVal("LRINPUT",V[14],1,9);
   if(!isfinite(V[116]) || FError) return 116;
   V[117]=slhaVal("LRINPUT",V[14],1,7);
   if(!isfinite(V[117]) || FError) return 117;
   V[118]=slhaVal("DARKLR",V[14],1,4);
   if(!isfinite(V[118]) || FError) return 118;
   V[119]=slhaVal("LRINPUT",V[14],1,20);
   if(!isfinite(V[119]) || FError) return 119;
   V[120]=slhaVal("LRINPUT",V[14],1,14);
   if(!isfinite(V[120]) || FError) return 120;
   V[121]=slhaVal("LRINPUT",V[14],1,1);
   if(!isfinite(V[121]) || FError) return 121;
   V[122]=slhaVal("DARKLR",V[14],1,17);
   if(!isfinite(V[122]) || FError) return 122;
   V[123]=slhaVal("DARKLR",V[14],1,16);
   if(!isfinite(V[123]) || FError) return 123;
   V[124]=slhaVal("DARKLR",V[14],1,6);
   if(!isfinite(V[124]) || FError) return 124;
   V[125]=slhaVal("DARKLR",V[14],1,8);
   if(!isfinite(V[125]) || FError) return 125;
   V[126]=slhaVal("DARKLR",V[14],1,10);
   if(!isfinite(V[126]) || FError) return 126;
   V[127]=slhaVal("DARKLR",V[14],1,18);
   if(!isfinite(V[127]) || FError) return 127;
   V[128]=slhaVal("DARKLR",V[14],1,20);
   if(!isfinite(V[128]) || FError) return 128;
   V[129]=slhaVal("DARKLR",V[14],1,22);
   if(!isfinite(V[129]) || FError) return 129;
   V[130]=slhaVal("DARKLR",V[14],1,12);
   if(!isfinite(V[130]) || FError) return 130;
   V[131]=slhaVal("DARKLR",V[14],1,14);
   if(!isfinite(V[131]) || FError) return 131;
   V[132]=slhaVal("DARKLR",V[14],1,24);
   if(!isfinite(V[132]) || FError) return 132;
   V[133]=slhaVal("LRINPUT",V[14],1,24);
   if(!isfinite(V[133]) || FError) return 133;
   V[134]=slhaVal("LRINPUT",V[14],1,4);
   if(!isfinite(V[134]) || FError) return 134;
   V[135]=slhaVal("VEV",V[14],1,1);
   if(!isfinite(V[135]) || FError) return 135;
   V[136]=slhaVal("VEV",V[14],1,2);
   if(!isfinite(V[136]) || FError) return 136;
   V[137]=slhaVal("DARKLR",V[14],1,26);
   if(!isfinite(V[137]) || FError) return 137;
   V[138]=slhaVal("DARKLR",V[14],1,28);
   if(!isfinite(V[138]) || FError) return 138;
   V[139]=slhaVal("DARKLR",V[14],1,30);
   if(!isfinite(V[139]) || FError) return 139;
   V[140]=slhaVal("DARKLR",V[14],1,32);
   if(!isfinite(V[140]) || FError) return 140;
   V[141]=slhaVal("ZZMIX",V[14],2,1,1);
   if(!isfinite(V[141]) || FError) return 141;
   V[142]=slhaVal("ZZMIX",V[14],2,1,2);
   if(!isfinite(V[142]) || FError) return 142;
   V[143]=slhaVal("ZZMIX",V[14],2,1,3);
   if(!isfinite(V[143]) || FError) return 143;
   V[144]=slhaVal("ZZMIX",V[14],2,2,1);
   if(!isfinite(V[144]) || FError) return 144;
   V[145]=slhaVal("ZZMIX",V[14],2,2,2);
   if(!isfinite(V[145]) || FError) return 145;
   V[146]=slhaVal("ZZMIX",V[14],2,2,3);
   if(!isfinite(V[146]) || FError) return 146;
   V[147]=slhaVal("ZZMIX",V[14],2,3,1);
   if(!isfinite(V[147]) || FError) return 147;
   V[148]=slhaVal("ZZMIX",V[14],2,3,2);
   if(!isfinite(V[148]) || FError) return 148;
   V[149]=slhaVal("ZZMIX",V[14],2,3,3);
   if(!isfinite(V[149]) || FError) return 149;
   V[150]=slhaVal("SCALARMIX",V[14],2,1,1);
   if(!isfinite(V[150]) || FError) return 150;
   V[151]=slhaVal("SCALARMIX",V[14],2,1,2);
   if(!isfinite(V[151]) || FError) return 151;
   V[152]=slhaVal("SCALARMIX",V[14],2,1,3);
   if(!isfinite(V[152]) || FError) return 152;
   V[153]=slhaVal("SCALARMIX",V[14],2,1,4);
   if(!isfinite(V[153]) || FError) return 153;
   V[154]=slhaVal("SCALARMIX",V[14],2,1,5);
   if(!isfinite(V[154]) || FError) return 154;
   V[155]=slhaVal("SCALARMIX",V[14],2,1,6);
   if(!isfinite(V[155]) || FError) return 155;
   V[156]=slhaVal("SCALARMIX",V[14],2,2,1);
   if(!isfinite(V[156]) || FError) return 156;
   V[157]=slhaVal("SCALARMIX",V[14],2,2,2);
   if(!isfinite(V[157]) || FError) return 157;
   V[158]=slhaVal("SCALARMIX",V[14],2,2,3);
   if(!isfinite(V[158]) || FError) return 158;
   V[159]=slhaVal("SCALARMIX",V[14],2,2,4);
   if(!isfinite(V[159]) || FError) return 159;
   V[160]=slhaVal("SCALARMIX",V[14],2,2,5);
   if(!isfinite(V[160]) || FError) return 160;
   V[161]=slhaVal("SCALARMIX",V[14],2,2,6);
   if(!isfinite(V[161]) || FError) return 161;
   V[162]=slhaVal("SCALARMIX",V[14],2,3,1);
   if(!isfinite(V[162]) || FError) return 162;
   V[163]=slhaVal("SCALARMIX",V[14],2,3,2);
   if(!isfinite(V[163]) || FError) return 163;
   V[164]=slhaVal("SCALARMIX",V[14],2,3,3);
   if(!isfinite(V[164]) || FError) return 164;
   V[165]=slhaVal("SCALARMIX",V[14],2,3,4);
   if(!isfinite(V[165]) || FError) return 165;
   V[166]=slhaVal("SCALARMIX",V[14],2,3,5);
   if(!isfinite(V[166]) || FError) return 166;
   V[167]=slhaVal("SCALARMIX",V[14],2,3,6);
   if(!isfinite(V[167]) || FError) return 167;
   V[168]=slhaVal("SCALARMIX",V[14],2,4,1);
   if(!isfinite(V[168]) || FError) return 168;
   V[169]=slhaVal("SCALARMIX",V[14],2,4,2);
   if(!isfinite(V[169]) || FError) return 169;
   V[170]=slhaVal("SCALARMIX",V[14],2,4,3);
   if(!isfinite(V[170]) || FError) return 170;
   V[171]=slhaVal("SCALARMIX",V[14],2,4,4);
   if(!isfinite(V[171]) || FError) return 171;
   V[172]=slhaVal("SCALARMIX",V[14],2,4,5);
   if(!isfinite(V[172]) || FError) return 172;
   V[173]=slhaVal("SCALARMIX",V[14],2,4,6);
   if(!isfinite(V[173]) || FError) return 173;
   V[174]=slhaVal("SCALARMIX",V[14],2,5,1);
   if(!isfinite(V[174]) || FError) return 174;
   V[175]=slhaVal("SCALARMIX",V[14],2,5,2);
   if(!isfinite(V[175]) || FError) return 175;
   V[176]=slhaVal("SCALARMIX",V[14],2,5,3);
   if(!isfinite(V[176]) || FError) return 176;
   V[177]=slhaVal("SCALARMIX",V[14],2,5,4);
   if(!isfinite(V[177]) || FError) return 177;
   V[178]=slhaVal("SCALARMIX",V[14],2,5,5);
   if(!isfinite(V[178]) || FError) return 178;
   V[179]=slhaVal("SCALARMIX",V[14],2,5,6);
   if(!isfinite(V[179]) || FError) return 179;
   V[180]=slhaVal("SCALARMIX",V[14],2,6,1);
   if(!isfinite(V[180]) || FError) return 180;
   V[181]=slhaVal("SCALARMIX",V[14],2,6,2);
   if(!isfinite(V[181]) || FError) return 181;
   V[182]=slhaVal("SCALARMIX",V[14],2,6,3);
   if(!isfinite(V[182]) || FError) return 182;
   V[183]=slhaVal("SCALARMIX",V[14],2,6,4);
   if(!isfinite(V[183]) || FError) return 183;
   V[184]=slhaVal("SCALARMIX",V[14],2,6,5);
   if(!isfinite(V[184]) || FError) return 184;
   V[185]=slhaVal("SCALARMIX",V[14],2,6,6);
   if(!isfinite(V[185]) || FError) return 185;
   V[186]=slhaVal("AMIX",V[14],2,1,1);
   if(!isfinite(V[186]) || FError) return 186;
   V[187]=slhaVal("AMIX",V[14],2,1,2);
   if(!isfinite(V[187]) || FError) return 187;
   V[188]=slhaVal("AMIX",V[14],2,1,3);
   if(!isfinite(V[188]) || FError) return 188;
   V[189]=slhaVal("AMIX",V[14],2,1,4);
   if(!isfinite(V[189]) || FError) return 189;
   V[190]=slhaVal("AMIX",V[14],2,1,5);
   if(!isfinite(V[190]) || FError) return 190;
   V[191]=slhaVal("AMIX",V[14],2,1,6);
   if(!isfinite(V[191]) || FError) return 191;
   V[192]=slhaVal("AMIX",V[14],2,2,1);
   if(!isfinite(V[192]) || FError) return 192;
   V[193]=slhaVal("AMIX",V[14],2,2,2);
   if(!isfinite(V[193]) || FError) return 193;
   V[194]=slhaVal("AMIX",V[14],2,2,3);
   if(!isfinite(V[194]) || FError) return 194;
   V[195]=slhaVal("AMIX",V[14],2,2,4);
   if(!isfinite(V[195]) || FError) return 195;
   V[196]=slhaVal("AMIX",V[14],2,2,5);
   if(!isfinite(V[196]) || FError) return 196;
   V[197]=slhaVal("AMIX",V[14],2,2,6);
   if(!isfinite(V[197]) || FError) return 197;
   V[198]=slhaVal("AMIX",V[14],2,3,1);
   if(!isfinite(V[198]) || FError) return 198;
   V[199]=slhaVal("AMIX",V[14],2,3,2);
   if(!isfinite(V[199]) || FError) return 199;
   V[200]=slhaVal("AMIX",V[14],2,3,3);
   if(!isfinite(V[200]) || FError) return 200;
   V[201]=slhaVal("AMIX",V[14],2,3,4);
   if(!isfinite(V[201]) || FError) return 201;
   V[202]=slhaVal("AMIX",V[14],2,3,5);
   if(!isfinite(V[202]) || FError) return 202;
   V[203]=slhaVal("AMIX",V[14],2,3,6);
   if(!isfinite(V[203]) || FError) return 203;
   V[204]=slhaVal("AMIX",V[14],2,4,1);
   if(!isfinite(V[204]) || FError) return 204;
   V[205]=slhaVal("AMIX",V[14],2,4,2);
   if(!isfinite(V[205]) || FError) return 205;
   V[206]=slhaVal("AMIX",V[14],2,4,3);
   if(!isfinite(V[206]) || FError) return 206;
   V[207]=slhaVal("AMIX",V[14],2,4,4);
   if(!isfinite(V[207]) || FError) return 207;
   V[208]=slhaVal("AMIX",V[14],2,4,5);
   if(!isfinite(V[208]) || FError) return 208;
   V[209]=slhaVal("AMIX",V[14],2,4,6);
   if(!isfinite(V[209]) || FError) return 209;
   V[210]=slhaVal("AMIX",V[14],2,5,1);
   if(!isfinite(V[210]) || FError) return 210;
   V[211]=slhaVal("AMIX",V[14],2,5,2);
   if(!isfinite(V[211]) || FError) return 211;
   V[212]=slhaVal("AMIX",V[14],2,5,3);
   if(!isfinite(V[212]) || FError) return 212;
   V[213]=slhaVal("AMIX",V[14],2,5,4);
   if(!isfinite(V[213]) || FError) return 213;
   V[214]=slhaVal("AMIX",V[14],2,5,5);
   if(!isfinite(V[214]) || FError) return 214;
   V[215]=slhaVal("AMIX",V[14],2,5,6);
   if(!isfinite(V[215]) || FError) return 215;
   V[216]=slhaVal("AMIX",V[14],2,6,1);
   if(!isfinite(V[216]) || FError) return 216;
   V[217]=slhaVal("AMIX",V[14],2,6,2);
   if(!isfinite(V[217]) || FError) return 217;
   V[218]=slhaVal("AMIX",V[14],2,6,3);
   if(!isfinite(V[218]) || FError) return 218;
   V[219]=slhaVal("AMIX",V[14],2,6,4);
   if(!isfinite(V[219]) || FError) return 219;
   V[220]=slhaVal("AMIX",V[14],2,6,5);
   if(!isfinite(V[220]) || FError) return 220;
   V[221]=slhaVal("AMIX",V[14],2,6,6);
   if(!isfinite(V[221]) || FError) return 221;
   V[222]=slhaVal("CHMIX",V[14],2,1,1);
   if(!isfinite(V[222]) || FError) return 222;
   V[223]=slhaVal("CHMIX",V[14],2,1,2);
   if(!isfinite(V[223]) || FError) return 223;
   V[224]=slhaVal("CHMIX",V[14],2,1,3);
   if(!isfinite(V[224]) || FError) return 224;
   V[225]=slhaVal("CHMIX",V[14],2,1,4);
   if(!isfinite(V[225]) || FError) return 225;
   V[226]=slhaVal("CHMIX",V[14],2,1,5);
   if(!isfinite(V[226]) || FError) return 226;
   V[227]=slhaVal("CHMIX",V[14],2,1,6);
   if(!isfinite(V[227]) || FError) return 227;
   V[228]=slhaVal("CHMIX",V[14],2,2,1);
   if(!isfinite(V[228]) || FError) return 228;
   V[229]=slhaVal("CHMIX",V[14],2,2,2);
   if(!isfinite(V[229]) || FError) return 229;
   V[230]=slhaVal("CHMIX",V[14],2,2,3);
   if(!isfinite(V[230]) || FError) return 230;
   V[231]=slhaVal("CHMIX",V[14],2,2,4);
   if(!isfinite(V[231]) || FError) return 231;
   V[232]=slhaVal("CHMIX",V[14],2,2,5);
   if(!isfinite(V[232]) || FError) return 232;
   V[233]=slhaVal("CHMIX",V[14],2,2,6);
   if(!isfinite(V[233]) || FError) return 233;
   V[234]=slhaVal("CHMIX",V[14],2,3,1);
   if(!isfinite(V[234]) || FError) return 234;
   V[235]=slhaVal("CHMIX",V[14],2,3,2);
   if(!isfinite(V[235]) || FError) return 235;
   V[236]=slhaVal("CHMIX",V[14],2,3,3);
   if(!isfinite(V[236]) || FError) return 236;
   V[237]=slhaVal("CHMIX",V[14],2,3,4);
   if(!isfinite(V[237]) || FError) return 237;
   V[238]=slhaVal("CHMIX",V[14],2,3,5);
   if(!isfinite(V[238]) || FError) return 238;
   V[239]=slhaVal("CHMIX",V[14],2,3,6);
   if(!isfinite(V[239]) || FError) return 239;
   V[240]=slhaVal("CHMIX",V[14],2,4,1);
   if(!isfinite(V[240]) || FError) return 240;
   V[241]=slhaVal("CHMIX",V[14],2,4,2);
   if(!isfinite(V[241]) || FError) return 241;
   V[242]=slhaVal("CHMIX",V[14],2,4,3);
   if(!isfinite(V[242]) || FError) return 242;
   V[243]=slhaVal("CHMIX",V[14],2,4,4);
   if(!isfinite(V[243]) || FError) return 243;
   V[244]=slhaVal("CHMIX",V[14],2,4,5);
   if(!isfinite(V[244]) || FError) return 244;
   V[245]=slhaVal("CHMIX",V[14],2,4,6);
   if(!isfinite(V[245]) || FError) return 245;
   V[246]=slhaVal("CHMIX",V[14],2,5,1);
   if(!isfinite(V[246]) || FError) return 246;
   V[247]=slhaVal("CHMIX",V[14],2,5,2);
   if(!isfinite(V[247]) || FError) return 247;
   V[248]=slhaVal("CHMIX",V[14],2,5,3);
   if(!isfinite(V[248]) || FError) return 248;
   V[249]=slhaVal("CHMIX",V[14],2,5,4);
   if(!isfinite(V[249]) || FError) return 249;
   V[250]=slhaVal("CHMIX",V[14],2,5,5);
   if(!isfinite(V[250]) || FError) return 250;
   V[251]=slhaVal("CHMIX",V[14],2,5,6);
   if(!isfinite(V[251]) || FError) return 251;
   V[252]=slhaVal("CHMIX",V[14],2,6,1);
   if(!isfinite(V[252]) || FError) return 252;
   V[253]=slhaVal("CHMIX",V[14],2,6,2);
   if(!isfinite(V[253]) || FError) return 253;
   V[254]=slhaVal("CHMIX",V[14],2,6,3);
   if(!isfinite(V[254]) || FError) return 254;
   V[255]=slhaVal("CHMIX",V[14],2,6,4);
   if(!isfinite(V[255]) || FError) return 255;
   V[256]=slhaVal("CHMIX",V[14],2,6,5);
   if(!isfinite(V[256]) || FError) return 256;
   V[257]=slhaVal("CHMIX",V[14],2,6,6);
   if(!isfinite(V[257]) || FError) return 257;
   V[258]=slhaVal("CHCHMIX",V[14],2,1,1);
   if(!isfinite(V[258]) || FError) return 258;
   V[259]=slhaVal("CHCHMIX",V[14],2,1,2);
   if(!isfinite(V[259]) || FError) return 259;
   V[260]=slhaVal("CHCHMIX",V[14],2,2,1);
   if(!isfinite(V[260]) || FError) return 260;
   V[261]=slhaVal("CHCHMIX",V[14],2,2,2);
   if(!isfinite(V[261]) || FError) return 261;
   V[262]=slhaVal("UDLMIX",V[14],2,1,1);
   if(!isfinite(V[262]) || FError) return 262;
   V[263]=slhaVal("UDLMIX",V[14],2,1,2);
   if(!isfinite(V[263]) || FError) return 263;
   V[264]=slhaVal("UDLMIX",V[14],2,1,3);
   if(!isfinite(V[264]) || FError) return 264;
   V[265]=slhaVal("UDLMIX",V[14],2,1,4);
   if(!isfinite(V[265]) || FError) return 265;
   V[266]=slhaVal("UDLMIX",V[14],2,1,5);
   if(!isfinite(V[266]) || FError) return 266;
   V[267]=slhaVal("UDLMIX",V[14],2,1,6);
   if(!isfinite(V[267]) || FError) return 267;
   V[268]=slhaVal("UDLMIX",V[14],2,2,1);
   if(!isfinite(V[268]) || FError) return 268;
   V[269]=slhaVal("UDLMIX",V[14],2,2,2);
   if(!isfinite(V[269]) || FError) return 269;
   V[270]=slhaVal("UDLMIX",V[14],2,2,3);
   if(!isfinite(V[270]) || FError) return 270;
   V[271]=slhaVal("UDLMIX",V[14],2,2,4);
   if(!isfinite(V[271]) || FError) return 271;
   V[272]=slhaVal("UDLMIX",V[14],2,2,5);
   if(!isfinite(V[272]) || FError) return 272;
   V[273]=slhaVal("UDLMIX",V[14],2,2,6);
   if(!isfinite(V[273]) || FError) return 273;
   V[274]=slhaVal("UDLMIX",V[14],2,3,1);
   if(!isfinite(V[274]) || FError) return 274;
   V[275]=slhaVal("UDLMIX",V[14],2,3,2);
   if(!isfinite(V[275]) || FError) return 275;
   V[276]=slhaVal("UDLMIX",V[14],2,3,3);
   if(!isfinite(V[276]) || FError) return 276;
   V[277]=slhaVal("UDLMIX",V[14],2,3,4);
   if(!isfinite(V[277]) || FError) return 277;
   V[278]=slhaVal("UDLMIX",V[14],2,3,5);
   if(!isfinite(V[278]) || FError) return 278;
   V[279]=slhaVal("UDLMIX",V[14],2,3,6);
   if(!isfinite(V[279]) || FError) return 279;
   V[280]=slhaVal("UDLMIX",V[14],2,4,1);
   if(!isfinite(V[280]) || FError) return 280;
   V[281]=slhaVal("UDLMIX",V[14],2,4,2);
   if(!isfinite(V[281]) || FError) return 281;
   V[282]=slhaVal("UDLMIX",V[14],2,4,3);
   if(!isfinite(V[282]) || FError) return 282;
   V[283]=slhaVal("UDLMIX",V[14],2,4,4);
   if(!isfinite(V[283]) || FError) return 283;
   V[284]=slhaVal("UDLMIX",V[14],2,4,5);
   if(!isfinite(V[284]) || FError) return 284;
   V[285]=slhaVal("UDLMIX",V[14],2,4,6);
   if(!isfinite(V[285]) || FError) return 285;
   V[286]=slhaVal("UDLMIX",V[14],2,5,1);
   if(!isfinite(V[286]) || FError) return 286;
   V[287]=slhaVal("UDLMIX",V[14],2,5,2);
   if(!isfinite(V[287]) || FError) return 287;
   V[288]=slhaVal("UDLMIX",V[14],2,5,3);
   if(!isfinite(V[288]) || FError) return 288;
   V[289]=slhaVal("UDLMIX",V[14],2,5,4);
   if(!isfinite(V[289]) || FError) return 289;
   V[290]=slhaVal("UDLMIX",V[14],2,5,5);
   if(!isfinite(V[290]) || FError) return 290;
   V[291]=slhaVal("UDLMIX",V[14],2,5,6);
   if(!isfinite(V[291]) || FError) return 291;
   V[292]=slhaVal("UDLMIX",V[14],2,6,1);
   if(!isfinite(V[292]) || FError) return 292;
   V[293]=slhaVal("UDLMIX",V[14],2,6,2);
   if(!isfinite(V[293]) || FError) return 293;
   V[294]=slhaVal("UDLMIX",V[14],2,6,3);
   if(!isfinite(V[294]) || FError) return 294;
   V[295]=slhaVal("UDLMIX",V[14],2,6,4);
   if(!isfinite(V[295]) || FError) return 295;
   V[296]=slhaVal("UDLMIX",V[14],2,6,5);
   if(!isfinite(V[296]) || FError) return 296;
   V[297]=slhaVal("UDLMIX",V[14],2,6,6);
   if(!isfinite(V[297]) || FError) return 297;
   V[298]=slhaVal("UDRMIX",V[14],2,1,1);
   if(!isfinite(V[298]) || FError) return 298;
   V[299]=slhaVal("UDRMIX",V[14],2,1,2);
   if(!isfinite(V[299]) || FError) return 299;
   V[300]=slhaVal("UDRMIX",V[14],2,1,3);
   if(!isfinite(V[300]) || FError) return 300;
   V[301]=slhaVal("UDRMIX",V[14],2,1,4);
   if(!isfinite(V[301]) || FError) return 301;
   V[302]=slhaVal("UDRMIX",V[14],2,1,5);
   if(!isfinite(V[302]) || FError) return 302;
   V[303]=slhaVal("UDRMIX",V[14],2,1,6);
   if(!isfinite(V[303]) || FError) return 303;
   V[304]=slhaVal("UDRMIX",V[14],2,2,1);
   if(!isfinite(V[304]) || FError) return 304;
   V[305]=slhaVal("UDRMIX",V[14],2,2,2);
   if(!isfinite(V[305]) || FError) return 305;
   V[306]=slhaVal("UDRMIX",V[14],2,2,3);
   if(!isfinite(V[306]) || FError) return 306;
   V[307]=slhaVal("UDRMIX",V[14],2,2,4);
   if(!isfinite(V[307]) || FError) return 307;
   V[308]=slhaVal("UDRMIX",V[14],2,2,5);
   if(!isfinite(V[308]) || FError) return 308;
   V[309]=slhaVal("UDRMIX",V[14],2,2,6);
   if(!isfinite(V[309]) || FError) return 309;
   V[310]=slhaVal("UDRMIX",V[14],2,3,1);
   if(!isfinite(V[310]) || FError) return 310;
   V[311]=slhaVal("UDRMIX",V[14],2,3,2);
   if(!isfinite(V[311]) || FError) return 311;
   V[312]=slhaVal("UDRMIX",V[14],2,3,3);
   if(!isfinite(V[312]) || FError) return 312;
   V[313]=slhaVal("UDRMIX",V[14],2,3,4);
   if(!isfinite(V[313]) || FError) return 313;
   V[314]=slhaVal("UDRMIX",V[14],2,3,5);
   if(!isfinite(V[314]) || FError) return 314;
   V[315]=slhaVal("UDRMIX",V[14],2,3,6);
   if(!isfinite(V[315]) || FError) return 315;
   V[316]=slhaVal("UDRMIX",V[14],2,4,1);
   if(!isfinite(V[316]) || FError) return 316;
   V[317]=slhaVal("UDRMIX",V[14],2,4,2);
   if(!isfinite(V[317]) || FError) return 317;
   V[318]=slhaVal("UDRMIX",V[14],2,4,3);
   if(!isfinite(V[318]) || FError) return 318;
   V[319]=slhaVal("UDRMIX",V[14],2,4,4);
   if(!isfinite(V[319]) || FError) return 319;
   V[320]=slhaVal("UDRMIX",V[14],2,4,5);
   if(!isfinite(V[320]) || FError) return 320;
   V[321]=slhaVal("UDRMIX",V[14],2,4,6);
   if(!isfinite(V[321]) || FError) return 321;
   V[322]=slhaVal("UDRMIX",V[14],2,5,1);
   if(!isfinite(V[322]) || FError) return 322;
   V[323]=slhaVal("UDRMIX",V[14],2,5,2);
   if(!isfinite(V[323]) || FError) return 323;
   V[324]=slhaVal("UDRMIX",V[14],2,5,3);
   if(!isfinite(V[324]) || FError) return 324;
   V[325]=slhaVal("UDRMIX",V[14],2,5,4);
   if(!isfinite(V[325]) || FError) return 325;
   V[326]=slhaVal("UDRMIX",V[14],2,5,5);
   if(!isfinite(V[326]) || FError) return 326;
   V[327]=slhaVal("UDRMIX",V[14],2,5,6);
   if(!isfinite(V[327]) || FError) return 327;
   V[328]=slhaVal("UDRMIX",V[14],2,6,1);
   if(!isfinite(V[328]) || FError) return 328;
   V[329]=slhaVal("UDRMIX",V[14],2,6,2);
   if(!isfinite(V[329]) || FError) return 329;
   V[330]=slhaVal("UDRMIX",V[14],2,6,3);
   if(!isfinite(V[330]) || FError) return 330;
   V[331]=slhaVal("UDRMIX",V[14],2,6,4);
   if(!isfinite(V[331]) || FError) return 331;
   V[332]=slhaVal("UDRMIX",V[14],2,6,5);
   if(!isfinite(V[332]) || FError) return 332;
   V[333]=slhaVal("UDRMIX",V[14],2,6,6);
   if(!isfinite(V[333]) || FError) return 333;
   V[334]=slhaVal("UULMIX",V[14],2,1,1);
   if(!isfinite(V[334]) || FError) return 334;
   V[335]=slhaVal("UULMIX",V[14],2,1,2);
   if(!isfinite(V[335]) || FError) return 335;
   V[336]=slhaVal("UULMIX",V[14],2,1,3);
   if(!isfinite(V[336]) || FError) return 336;
   V[337]=slhaVal("UULMIX",V[14],2,2,1);
   if(!isfinite(V[337]) || FError) return 337;
   V[338]=slhaVal("UULMIX",V[14],2,2,2);
   if(!isfinite(V[338]) || FError) return 338;
   V[339]=slhaVal("UULMIX",V[14],2,2,3);
   if(!isfinite(V[339]) || FError) return 339;
   V[340]=slhaVal("UULMIX",V[14],2,3,1);
   if(!isfinite(V[340]) || FError) return 340;
   V[341]=slhaVal("UULMIX",V[14],2,3,2);
   if(!isfinite(V[341]) || FError) return 341;
   V[342]=slhaVal("UULMIX",V[14],2,3,3);
   if(!isfinite(V[342]) || FError) return 342;
   V[343]=slhaVal("UURMIX",V[14],2,1,1);
   if(!isfinite(V[343]) || FError) return 343;
   V[344]=slhaVal("UURMIX",V[14],2,1,2);
   if(!isfinite(V[344]) || FError) return 344;
   V[345]=slhaVal("UURMIX",V[14],2,1,3);
   if(!isfinite(V[345]) || FError) return 345;
   V[346]=slhaVal("UURMIX",V[14],2,2,1);
   if(!isfinite(V[346]) || FError) return 346;
   V[347]=slhaVal("UURMIX",V[14],2,2,2);
   if(!isfinite(V[347]) || FError) return 347;
   V[348]=slhaVal("UURMIX",V[14],2,2,3);
   if(!isfinite(V[348]) || FError) return 348;
   V[349]=slhaVal("UURMIX",V[14],2,3,1);
   if(!isfinite(V[349]) || FError) return 349;
   V[350]=slhaVal("UURMIX",V[14],2,3,2);
   if(!isfinite(V[350]) || FError) return 350;
   V[351]=slhaVal("UURMIX",V[14],2,3,3);
   if(!isfinite(V[351]) || FError) return 351;
   V[352]=slhaVal("UELMIX",V[14],2,1,1);
   if(!isfinite(V[352]) || FError) return 352;
   V[353]=slhaVal("UELMIX",V[14],2,1,2);
   if(!isfinite(V[353]) || FError) return 353;
   V[354]=slhaVal("UELMIX",V[14],2,1,3);
   if(!isfinite(V[354]) || FError) return 354;
   V[355]=slhaVal("UELMIX",V[14],2,2,1);
   if(!isfinite(V[355]) || FError) return 355;
   V[356]=slhaVal("UELMIX",V[14],2,2,2);
   if(!isfinite(V[356]) || FError) return 356;
   V[357]=slhaVal("UELMIX",V[14],2,2,3);
   if(!isfinite(V[357]) || FError) return 357;
   V[358]=slhaVal("UELMIX",V[14],2,3,1);
   if(!isfinite(V[358]) || FError) return 358;
   V[359]=slhaVal("UELMIX",V[14],2,3,2);
   if(!isfinite(V[359]) || FError) return 359;
   V[360]=slhaVal("UELMIX",V[14],2,3,3);
   if(!isfinite(V[360]) || FError) return 360;
   V[361]=slhaVal("UERMIX",V[14],2,1,1);
   if(!isfinite(V[361]) || FError) return 361;
   V[362]=slhaVal("UERMIX",V[14],2,1,2);
   if(!isfinite(V[362]) || FError) return 362;
   V[363]=slhaVal("UERMIX",V[14],2,1,3);
   if(!isfinite(V[363]) || FError) return 363;
   V[364]=slhaVal("UERMIX",V[14],2,2,1);
   if(!isfinite(V[364]) || FError) return 364;
   V[365]=slhaVal("UERMIX",V[14],2,2,2);
   if(!isfinite(V[365]) || FError) return 365;
   V[366]=slhaVal("UERMIX",V[14],2,2,3);
   if(!isfinite(V[366]) || FError) return 366;
   V[367]=slhaVal("UERMIX",V[14],2,3,1);
   if(!isfinite(V[367]) || FError) return 367;
   V[368]=slhaVal("UERMIX",V[14],2,3,2);
   if(!isfinite(V[368]) || FError) return 368;
   V[369]=slhaVal("UERMIX",V[14],2,3,3);
   if(!isfinite(V[369]) || FError) return 369;
   V[370]=slhaVal("UVMIX",V[14],2,1,1);
   if(!isfinite(V[370]) || FError) return 370;
   V[371]=slhaVal("UVMIX",V[14],2,1,2);
   if(!isfinite(V[371]) || FError) return 371;
   V[372]=slhaVal("UVMIX",V[14],2,1,3);
   if(!isfinite(V[372]) || FError) return 372;
   V[373]=slhaVal("UVMIX",V[14],2,1,4);
   if(!isfinite(V[373]) || FError) return 373;
   V[374]=slhaVal("UVMIX",V[14],2,1,5);
   if(!isfinite(V[374]) || FError) return 374;
   V[375]=slhaVal("UVMIX",V[14],2,1,6);
   if(!isfinite(V[375]) || FError) return 375;
   V[376]=slhaVal("UVMIX",V[14],2,2,1);
   if(!isfinite(V[376]) || FError) return 376;
   V[377]=slhaVal("UVMIX",V[14],2,2,2);
   if(!isfinite(V[377]) || FError) return 377;
   V[378]=slhaVal("UVMIX",V[14],2,2,3);
   if(!isfinite(V[378]) || FError) return 378;
   V[379]=slhaVal("UVMIX",V[14],2,2,4);
   if(!isfinite(V[379]) || FError) return 379;
   V[380]=slhaVal("UVMIX",V[14],2,2,5);
   if(!isfinite(V[380]) || FError) return 380;
   V[381]=slhaVal("UVMIX",V[14],2,2,6);
   if(!isfinite(V[381]) || FError) return 381;
   V[382]=slhaVal("UVMIX",V[14],2,3,1);
   if(!isfinite(V[382]) || FError) return 382;
   V[383]=slhaVal("UVMIX",V[14],2,3,2);
   if(!isfinite(V[383]) || FError) return 383;
   V[384]=slhaVal("UVMIX",V[14],2,3,3);
   if(!isfinite(V[384]) || FError) return 384;
   V[385]=slhaVal("UVMIX",V[14],2,3,4);
   if(!isfinite(V[385]) || FError) return 385;
   V[386]=slhaVal("UVMIX",V[14],2,3,5);
   if(!isfinite(V[386]) || FError) return 386;
   V[387]=slhaVal("UVMIX",V[14],2,3,6);
   if(!isfinite(V[387]) || FError) return 387;
   V[388]=slhaVal("UVMIX",V[14],2,4,1);
   if(!isfinite(V[388]) || FError) return 388;
   V[389]=slhaVal("UVMIX",V[14],2,4,2);
   if(!isfinite(V[389]) || FError) return 389;
   V[390]=slhaVal("UVMIX",V[14],2,4,3);
   if(!isfinite(V[390]) || FError) return 390;
   V[391]=slhaVal("UVMIX",V[14],2,4,4);
   if(!isfinite(V[391]) || FError) return 391;
   V[392]=slhaVal("UVMIX",V[14],2,4,5);
   if(!isfinite(V[392]) || FError) return 392;
   V[393]=slhaVal("UVMIX",V[14],2,4,6);
   if(!isfinite(V[393]) || FError) return 393;
   V[394]=slhaVal("UVMIX",V[14],2,5,1);
   if(!isfinite(V[394]) || FError) return 394;
   V[395]=slhaVal("UVMIX",V[14],2,5,2);
   if(!isfinite(V[395]) || FError) return 395;
   V[396]=slhaVal("UVMIX",V[14],2,5,3);
   if(!isfinite(V[396]) || FError) return 396;
   V[397]=slhaVal("UVMIX",V[14],2,5,4);
   if(!isfinite(V[397]) || FError) return 397;
   V[398]=slhaVal("UVMIX",V[14],2,5,5);
   if(!isfinite(V[398]) || FError) return 398;
   V[399]=slhaVal("UVMIX",V[14],2,5,6);
   if(!isfinite(V[399]) || FError) return 399;
   V[400]=slhaVal("UVMIX",V[14],2,6,1);
   if(!isfinite(V[400]) || FError) return 400;
   V[401]=slhaVal("UVMIX",V[14],2,6,2);
   if(!isfinite(V[401]) || FError) return 401;
   V[402]=slhaVal("UVMIX",V[14],2,6,3);
   if(!isfinite(V[402]) || FError) return 402;
   V[403]=slhaVal("UVMIX",V[14],2,6,4);
   if(!isfinite(V[403]) || FError) return 403;
   V[404]=slhaVal("UVMIX",V[14],2,6,5);
   if(!isfinite(V[404]) || FError) return 404;
   V[405]=slhaVal("UVMIX",V[14],2,6,6);
   if(!isfinite(V[405]) || FError) return 405;
   V[406]=slhaVal("THETAW",V[14],1,1);
   if(!isfinite(V[406]) || FError) return 406;
   V[407]=slhaVal("PHIW",V[14],1,1);
   if(!isfinite(V[407]) || FError) return 407;
   V[408]=slhaVal("EFFHIGGSCOUPLINGS",V[14],3,25,22,22);
   if(!isfinite(V[408]) || FError) return 408;
   V[409]=slhaVal("EFFHIGGSCOUPLINGS",V[14],3,25,21,21);
   if(!isfinite(V[409]) || FError) return 409;
   V[410]=slhaVal("EFFHIGGSCOUPLINGS",V[14],3,35,22,22);
   if(!isfinite(V[410]) || FError) return 410;
   V[411]=slhaVal("EFFHIGGSCOUPLINGS",V[14],3,35,21,21);
   if(!isfinite(V[411]) || FError) return 411;
   V[412]=slhaVal("EFFHIGGSCOUPLINGS",V[14],3,335,22,22);
   if(!isfinite(V[412]) || FError) return 412;
   V[413]=slhaVal("EFFHIGGSCOUPLINGS",V[14],3,335,21,21);
   if(!isfinite(V[413]) || FError) return 413;
   V[414]=slhaVal("EFFHIGGSCOUPLINGS",V[14],3,6000029,22,22);
   if(!isfinite(V[414]) || FError) return 414;
   V[415]=slhaVal("EFFHIGGSCOUPLINGS",V[14],3,6000029,21,21);
   if(!isfinite(V[415]) || FError) return 415;
   V[416]=slhaVal("EFFHIGGSCOUPLINGS",V[14],3,6000030,22,22);
   if(!isfinite(V[416]) || FError) return 416;
   V[417]=slhaVal("EFFHIGGSCOUPLINGS",V[14],3,6000030,21,21);
   if(!isfinite(V[417]) || FError) return 417;
   V[418]=slhaVal("EFFHIGGSCOUPLINGS",V[14],3,6000031,22,22);
   if(!isfinite(V[418]) || FError) return 418;
   V[419]=slhaVal("EFFHIGGSCOUPLINGS",V[14],3,6000031,21,21);
   if(!isfinite(V[419]) || FError) return 419;
   V[420]=slhaVal("EFFHIGGSCOUPLINGS",V[14],3,36,22,22);
   if(!isfinite(V[420]) || FError) return 420;
   V[421]=slhaVal("EFFHIGGSCOUPLINGS",V[14],3,36,21,21);
   if(!isfinite(V[421]) || FError) return 421;
   V[422]=slhaVal("EFFHIGGSCOUPLINGS",V[14],3,6000021,22,22);
   if(!isfinite(V[422]) || FError) return 422;
   V[423]=slhaVal("EFFHIGGSCOUPLINGS",V[14],3,6000021,21,21);
   if(!isfinite(V[423]) || FError) return 423;
   V[424]=slhaVal("EFFHIGGSCOUPLINGS",V[14],3,6000022,22,22);
   if(!isfinite(V[424]) || FError) return 424;
   V[425]=slhaVal("EFFHIGGSCOUPLINGS",V[14],3,6000022,21,21);
   if(!isfinite(V[425]) || FError) return 425;
   V[426]=slhaVal("EFFHIGGSCOUPLINGS",V[14],3,6000023,22,22);
   if(!isfinite(V[426]) || FError) return 426;
   V[427]=slhaVal("EFFHIGGSCOUPLINGS",V[14],3,6000023,21,21);
   if(!isfinite(V[427]) || FError) return 427;
   V[428]=initQCD(V[15],V[46],V[41],V[47]);
   if(!isfinite(V[428]) || FError) return 428;
   V[429]=sqrt(alphaQCD(V[14])*4*3.1415927)*1;
   if(!isfinite(V[429]) || FError) return 429;
   V[430]=sin(V[407]);
   if(!isfinite(V[430]) || FError) return 430;
   V[431]=cos(V[407]);
   if(!isfinite(V[431]) || FError) return 431;
   V[432]=tan(V[407]);
   if(!isfinite(V[432]) || FError) return 432;
   V[433]=sin(V[406]);
   if(!isfinite(V[433]) || FError) return 433;
   V[434]=cos(V[406]);
   if(!isfinite(V[434]) || FError) return 434;
   V[435]=tan(V[406]);
   if(!isfinite(V[435]) || FError) return 435;
   V[436]=2*sqrt(1/(V[16]))*sqrt(V[13]);
   if(!isfinite(V[436]) || FError) return 436;
   V[437]=V[436]*1/(sin(V[406]));
   if(!isfinite(V[437]) || FError) return 437;
   V[438]=sqrt(pow(V[36],2)/(2.)+sqrt(pow(V[36],4)/(4.)-pow(V[36],2)*V[13]/(V[12]*V[16]*V[18])));
   if(!isfinite(V[438]) || FError) return 438;
   if(VV==NULL) 
   {  VV=malloc(sizeof(REAL)*nModelVars);
      for(i=0;i<nModelVars;i++) if(strcmp(varNames[i],"Q")==0) iQ=i;
   }
   for(i=0;i<nModelVars;i++) VV[i]=V[i];
   cErr=0;
   return 0;
}

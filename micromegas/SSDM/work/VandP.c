#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "../../CalcHEP_src/include/extern.h"
#include "../../CalcHEP_src/include/VandP.h"
#include "autoprot.h"
extern int  FError;
/*  Special model functions  */

int nModelParticles=18;
static ModelPrtclsStr ModelPrtcls_[18]=
{
  {"~Ss","~Ss", 6666635, "MSs","WSs",0,1,0}
, {"h","h", 25, "Mh","Wh",0,1,0}
, {"g","g", 21, "0","0",2,8,0}
, {"A","A", 22, "0","0",2,1,0}
, {"Z","Z", 23, "MZ","WZ",2,1,0}
, {"Wp","Wm", 24, "MWp","WWp",2,1,3}
, {"nu1","Nu1", 12, "0","0",1,1,0}
, {"nu2","Nu2", 14, "0","0",1,1,0}
, {"nu3","Nu3", 16, "0","0",1,1,0}
, {"d1","D1", 1, "Md1","Wd1",1,3,-1}
, {"d2","D2", 3, "Md2","Wd2",1,3,-1}
, {"d3","D3", 5, "Md3","Wd3",1,3,-1}
, {"u1","U1", 2, "Mu1","Wu1",1,3,2}
, {"u2","U2", 4, "Mu2","Wu2",1,3,2}
, {"u3","U3", 6, "Mu3","Wu3",1,3,2}
, {"e1","E1", 11, "Me1","We1",1,1,-3}
, {"e2","E2", 13, "Me2","We2",1,1,-3}
, {"e3","E3", 15, "Me3","We3",1,1,-3}
};
ModelPrtclsStr *ModelPrtcls=ModelPrtcls_; 
int nModelVars=20;
int nModelFunc=109;
static char*varNames_[129]={
 "WSs","WZ","WWp","Wd1","Wd2","Wd3","Wu1","Wu2","Wu3","We1"
,"We2","We3","Maux","sqrt2","Pi","Q","alfSMZ","aS","aEWinv","Gf"
,"rd","MSs","Mh","MZ","Md1","Md2","Md3","Mu1","Mu2","Mu3"
,"Me1","Me2","Me3","LS","LSH","ZDL11","ZDL12","ZDL13","ZDL21","ZDL22"
,"ZDL23","ZDL31","ZDL32","ZDL33","ZDR11","ZDR12","ZDR13","ZDR21","ZDR22","ZDR23"
,"ZDR31","ZDR32","ZDR33","ZUL11","ZUL12","ZUL13","ZUL21","ZUL22","ZUL23","ZUL31"
,"ZUL32","ZUL33","ZUR11","ZUR12","ZUR13","ZUR21","ZUR22","ZUR23","ZUR31","ZUR32"
,"ZUR33","ZEL11","ZEL12","ZEL13","ZEL21","ZEL22","ZEL23","ZEL31","ZEL32","ZEL33"
,"ZER11","ZER12","ZER13","ZER21","ZER22","ZER23","ZER31","ZER32","ZER33","HPP1"
,"HGG1","QCDok","g3","el","MWp","TW","STW","CTW","TTW","g1"
,"g2","v","Yd11","Yd12","Yd13","Yd21","Yd22","Yd23","Yd31","Yd32"
,"Yd33","Ye11","Ye12","Ye13","Ye21","Ye22","Ye23","Ye31","Ye32","Ye33"
,"Yu11","Yu12","Yu13","Yu21","Yu22","Yu23","Yu31","Yu32","Yu33"};
char**varNames=varNames_;
static REAL varValues_[129]={
   0.000000E+00,  2.495200E+00,  2.141000E+00,  0.000000E+00,  0.000000E+00,  0.000000E+00,  0.000000E+00,  0.000000E+00,  1.510000E+00,  0.000000E+00
,  0.000000E+00,  0.000000E+00,  1.000000E+00,  1.414214E+00,  3.141593E+00,  1.000000E+02,  1.172000E-01,  1.190000E-01,  1.370360E+02,  1.166390E-05
};
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
   V[20]=slhaRead("SPheno.spc.SSDM",0);
   if(!isfinite(V[20]) || FError) return 20;
 FirstQ:
 cErr=1;
   V[21]=slhaVal("MASS",V[15],1,6666635);
   if(!isfinite(V[21]) || FError) return 21;
   V[22]=slhaVal("MASS",V[15],1,25);
   if(!isfinite(V[22]) || FError) return 22;
   V[23]=slhaVal("MASS",V[15],1,23);
   if(!isfinite(V[23]) || FError) return 23;
   V[24]=slhaVal("MASS",V[15],1,1);
   if(!isfinite(V[24]) || FError) return 24;
   V[25]=slhaVal("MASS",V[15],1,3);
   if(!isfinite(V[25]) || FError) return 25;
   V[26]=slhaVal("MASS",V[15],1,5);
   if(!isfinite(V[26]) || FError) return 26;
   V[27]=slhaVal("MASS",V[15],1,2);
   if(!isfinite(V[27]) || FError) return 27;
   V[28]=slhaVal("MASS",V[15],1,4);
   if(!isfinite(V[28]) || FError) return 28;
   V[29]=slhaVal("MASS",V[15],1,6);
   if(!isfinite(V[29]) || FError) return 29;
   V[30]=slhaVal("MASS",V[15],1,11);
   if(!isfinite(V[30]) || FError) return 30;
   V[31]=slhaVal("MASS",V[15],1,13);
   if(!isfinite(V[31]) || FError) return 31;
   V[32]=slhaVal("MASS",V[15],1,15);
   if(!isfinite(V[32]) || FError) return 32;
   V[33]=slhaVal("HDM",V[15],1,3);
   if(!isfinite(V[33]) || FError) return 33;
   V[34]=slhaVal("HDM",V[15],1,2);
   if(!isfinite(V[34]) || FError) return 34;
   V[35]=slhaVal("UDLMIX",V[15],2,1,1);
   if(!isfinite(V[35]) || FError) return 35;
   V[36]=slhaVal("UDLMIX",V[15],2,1,2);
   if(!isfinite(V[36]) || FError) return 36;
   V[37]=slhaVal("UDLMIX",V[15],2,1,3);
   if(!isfinite(V[37]) || FError) return 37;
   V[38]=slhaVal("UDLMIX",V[15],2,2,1);
   if(!isfinite(V[38]) || FError) return 38;
   V[39]=slhaVal("UDLMIX",V[15],2,2,2);
   if(!isfinite(V[39]) || FError) return 39;
   V[40]=slhaVal("UDLMIX",V[15],2,2,3);
   if(!isfinite(V[40]) || FError) return 40;
   V[41]=slhaVal("UDLMIX",V[15],2,3,1);
   if(!isfinite(V[41]) || FError) return 41;
   V[42]=slhaVal("UDLMIX",V[15],2,3,2);
   if(!isfinite(V[42]) || FError) return 42;
   V[43]=slhaVal("UDLMIX",V[15],2,3,3);
   if(!isfinite(V[43]) || FError) return 43;
   V[44]=slhaVal("UDRMIX",V[15],2,1,1);
   if(!isfinite(V[44]) || FError) return 44;
   V[45]=slhaVal("UDRMIX",V[15],2,1,2);
   if(!isfinite(V[45]) || FError) return 45;
   V[46]=slhaVal("UDRMIX",V[15],2,1,3);
   if(!isfinite(V[46]) || FError) return 46;
   V[47]=slhaVal("UDRMIX",V[15],2,2,1);
   if(!isfinite(V[47]) || FError) return 47;
   V[48]=slhaVal("UDRMIX",V[15],2,2,2);
   if(!isfinite(V[48]) || FError) return 48;
   V[49]=slhaVal("UDRMIX",V[15],2,2,3);
   if(!isfinite(V[49]) || FError) return 49;
   V[50]=slhaVal("UDRMIX",V[15],2,3,1);
   if(!isfinite(V[50]) || FError) return 50;
   V[51]=slhaVal("UDRMIX",V[15],2,3,2);
   if(!isfinite(V[51]) || FError) return 51;
   V[52]=slhaVal("UDRMIX",V[15],2,3,3);
   if(!isfinite(V[52]) || FError) return 52;
   V[53]=slhaVal("UULMIX",V[15],2,1,1);
   if(!isfinite(V[53]) || FError) return 53;
   V[54]=slhaVal("UULMIX",V[15],2,1,2);
   if(!isfinite(V[54]) || FError) return 54;
   V[55]=slhaVal("UULMIX",V[15],2,1,3);
   if(!isfinite(V[55]) || FError) return 55;
   V[56]=slhaVal("UULMIX",V[15],2,2,1);
   if(!isfinite(V[56]) || FError) return 56;
   V[57]=slhaVal("UULMIX",V[15],2,2,2);
   if(!isfinite(V[57]) || FError) return 57;
   V[58]=slhaVal("UULMIX",V[15],2,2,3);
   if(!isfinite(V[58]) || FError) return 58;
   V[59]=slhaVal("UULMIX",V[15],2,3,1);
   if(!isfinite(V[59]) || FError) return 59;
   V[60]=slhaVal("UULMIX",V[15],2,3,2);
   if(!isfinite(V[60]) || FError) return 60;
   V[61]=slhaVal("UULMIX",V[15],2,3,3);
   if(!isfinite(V[61]) || FError) return 61;
   V[62]=slhaVal("UURMIX",V[15],2,1,1);
   if(!isfinite(V[62]) || FError) return 62;
   V[63]=slhaVal("UURMIX",V[15],2,1,2);
   if(!isfinite(V[63]) || FError) return 63;
   V[64]=slhaVal("UURMIX",V[15],2,1,3);
   if(!isfinite(V[64]) || FError) return 64;
   V[65]=slhaVal("UURMIX",V[15],2,2,1);
   if(!isfinite(V[65]) || FError) return 65;
   V[66]=slhaVal("UURMIX",V[15],2,2,2);
   if(!isfinite(V[66]) || FError) return 66;
   V[67]=slhaVal("UURMIX",V[15],2,2,3);
   if(!isfinite(V[67]) || FError) return 67;
   V[68]=slhaVal("UURMIX",V[15],2,3,1);
   if(!isfinite(V[68]) || FError) return 68;
   V[69]=slhaVal("UURMIX",V[15],2,3,2);
   if(!isfinite(V[69]) || FError) return 69;
   V[70]=slhaVal("UURMIX",V[15],2,3,3);
   if(!isfinite(V[70]) || FError) return 70;
   V[71]=slhaVal("UELMIX",V[15],2,1,1);
   if(!isfinite(V[71]) || FError) return 71;
   V[72]=slhaVal("UELMIX",V[15],2,1,2);
   if(!isfinite(V[72]) || FError) return 72;
   V[73]=slhaVal("UELMIX",V[15],2,1,3);
   if(!isfinite(V[73]) || FError) return 73;
   V[74]=slhaVal("UELMIX",V[15],2,2,1);
   if(!isfinite(V[74]) || FError) return 74;
   V[75]=slhaVal("UELMIX",V[15],2,2,2);
   if(!isfinite(V[75]) || FError) return 75;
   V[76]=slhaVal("UELMIX",V[15],2,2,3);
   if(!isfinite(V[76]) || FError) return 76;
   V[77]=slhaVal("UELMIX",V[15],2,3,1);
   if(!isfinite(V[77]) || FError) return 77;
   V[78]=slhaVal("UELMIX",V[15],2,3,2);
   if(!isfinite(V[78]) || FError) return 78;
   V[79]=slhaVal("UELMIX",V[15],2,3,3);
   if(!isfinite(V[79]) || FError) return 79;
   V[80]=slhaVal("UERMIX",V[15],2,1,1);
   if(!isfinite(V[80]) || FError) return 80;
   V[81]=slhaVal("UERMIX",V[15],2,1,2);
   if(!isfinite(V[81]) || FError) return 81;
   V[82]=slhaVal("UERMIX",V[15],2,1,3);
   if(!isfinite(V[82]) || FError) return 82;
   V[83]=slhaVal("UERMIX",V[15],2,2,1);
   if(!isfinite(V[83]) || FError) return 83;
   V[84]=slhaVal("UERMIX",V[15],2,2,2);
   if(!isfinite(V[84]) || FError) return 84;
   V[85]=slhaVal("UERMIX",V[15],2,2,3);
   if(!isfinite(V[85]) || FError) return 85;
   V[86]=slhaVal("UERMIX",V[15],2,3,1);
   if(!isfinite(V[86]) || FError) return 86;
   V[87]=slhaVal("UERMIX",V[15],2,3,2);
   if(!isfinite(V[87]) || FError) return 87;
   V[88]=slhaVal("UERMIX",V[15],2,3,3);
   if(!isfinite(V[88]) || FError) return 88;
   V[89]=slhaVal("EFFHIGGSCOUPLINGS",V[15],3,25,22,22);
   if(!isfinite(V[89]) || FError) return 89;
   V[90]=slhaVal("EFFHIGGSCOUPLINGS",V[15],3,25,21,21);
   if(!isfinite(V[90]) || FError) return 90;
   V[91]=initQCD(V[16],V[28],V[26],V[29]);
   if(!isfinite(V[91]) || FError) return 91;
   V[92]=sqrt(alphaQCD(V[15])*4*3.1415927)*1;
   if(!isfinite(V[92]) || FError) return 92;
   V[93]=2*sqrt(1/(V[18]))*sqrt(V[14]);
   if(!isfinite(V[93]) || FError) return 93;
   V[94]=sqrt(pow(V[23],2)/(2.)+sqrt(pow(V[23],4)/(4.)-pow(V[23],2)*V[14]/(V[13]*V[18]*V[19])));
   if(!isfinite(V[94]) || FError) return 94;
   V[95]=asin(sqrt(1-pow(V[94],2)/(pow(V[23],2))));
   if(!isfinite(V[95]) || FError) return 95;
   V[96]=sin(V[95]);
   if(!isfinite(V[96]) || FError) return 96;
   V[97]=cos(V[95]);
   if(!isfinite(V[97]) || FError) return 97;
   V[98]=tan(V[95]);
   if(!isfinite(V[98]) || FError) return 98;
   V[99]=V[93]*1/(cos(V[95]));
   if(!isfinite(V[99]) || FError) return 99;
   V[100]=V[93]*1/(sin(V[95]));
   if(!isfinite(V[100]) || FError) return 100;
   V[101]=2*sqrt(pow(V[94],2)/(pow(V[100],2)));
   if(!isfinite(V[101]) || FError) return 101;
   V[102]=V[13]*V[24]/(V[101]);
   if(!isfinite(V[102]) || FError) return 102;
   V[103]=0;

   V[104]=0;

   V[105]=0;

   V[106]=V[13]*V[25]/(V[101]);
   if(!isfinite(V[106]) || FError) return 106;
   V[107]=0;

   V[108]=0;

   V[109]=0;

   V[110]=V[13]*MbEff(V[15])*1/(V[101]);
   if(!isfinite(V[110]) || FError) return 110;
   V[111]=V[13]*V[30]/(V[101]);
   if(!isfinite(V[111]) || FError) return 111;
   V[112]=0;

   V[113]=0;

   V[114]=0;

   V[115]=V[13]*V[31]/(V[101]);
   if(!isfinite(V[115]) || FError) return 115;
   V[116]=0;

   V[117]=0;

   V[118]=0;

   V[119]=V[13]*V[32]/(V[101]);
   if(!isfinite(V[119]) || FError) return 119;
   V[120]=V[13]*V[27]/(V[101]);
   if(!isfinite(V[120]) || FError) return 120;
   V[121]=0;

   V[122]=0;

   V[123]=0;

   V[124]=V[13]*McEff(V[15])*1/(V[101]);
   if(!isfinite(V[124]) || FError) return 124;
   V[125]=0;

   V[126]=0;

   V[127]=0;

   V[128]=V[13]*MtEff(V[15])*1/(V[101]);
   if(!isfinite(V[128]) || FError) return 128;
   if(VV==NULL) 
   {  VV=malloc(sizeof(REAL)*nModelVars);
      for(i=0;i<nModelVars;i++) if(strcmp(varNames[i],"Q")==0) iQ=i;
   }
   for(i=0;i<nModelVars;i++) VV[i]=V[i];
   cErr=0;
   return 0;
}

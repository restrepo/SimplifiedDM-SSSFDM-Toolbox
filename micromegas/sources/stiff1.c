#include <math.h>
#include <stdlib.h>
#include<stdio.h>
#include"micromegas_aux.h"

#define NRANSI
#define SAFETY 0.9
#define GROW 1.5
#define PGROW -0.25
#define SHRNK 0.5
#define PSHRNK (-1.0/3.0)
#define ERRCON 0.1296
#define MAXTRY 40
#define GAM (1.0/2.0)
#define A21 2.0
#define A31 (48.0/25.0)
#define A32 (6.0/25.0)
#define C21 -8.0
#define C31 (372.0/25.0)
#define C32 (12.0/5.0)
#define C41 (-112.0/125.0)
#define C42 (-54.0/125.0)
#define C43 (-2.0/5.0)
#define B1 (19.0/9.0)
#define B2 (1.0/2.0)
#define B3 (25.0/108.0)
#define B4 (125.0/108.0)
#define E1 (17.0/54.0)
#define E2 (7.0/36.0)
#define E3 0.0
#define E4 (125.0/108.0)
#define C1X (1.0/2.0)
#define C2X (-3.0/2.0)
#define C3X (121.0/50.0)
#define C4X (29.0/250.0)
#define A2X 1.0
#define A3X (3.0/5.0)
#define TINY 1.0e-20

static int*indx=NULL;
static double*a=NULL;
static double*dfdx=NULL;
static double*dfdy=NULL;
static double*dysav=NULL;
static double*err=NULL;
static double*g1=NULL;
static double*g2=NULL;
static double*g3=NULL;
static double*g4=NULL;
static double*ysav=NULL;
static double*vv=NULL;   
static double*dydx=NULL;

static int ludcmp(double*a, int n, int* indx, double* d)
{
   int i,imax,j,k;
   double big,dum,sum,temp;

   *d=1.0;
   for(i=0;i<n;i++) 
   {
      big=0.0;
      for(j=0;j<n;j++)if ((temp=fabs(a[i*n+j])) > big) big=temp;
      if (big == 0.0) return 1;
      vv[i]=1.0/big;
   }
   for(j=0;j<n;j++) 
   {
     for (i=0;i<j;i++) 
     { 
        sum=a[i*n+j];
        for (k=0;k<i;k++) sum -= a[i*n+k]*a[k*n+j];
        a[i*n+j]=sum;
     }
     big=0;
     for(i=j;i<n;i++) 
     {
        sum=a[i*n+j];
        for(k=0;k<j;k++)sum -= a[i*n+k]*a[k*n+j];
	a[i*n+j]=sum;
        if( (dum=vv[i]*fabs(sum)) >= big) {big=dum; imax=i;}
     }
     if(j != imax) 
     {   for (k=0;k<n;k++) 
         {   
	     dum=a[imax*n+k];
	     a[imax*n+k]=a[j*n+k];
	     a[j*n+k]=dum;
	}
	*d = -(*d);
	vv[imax]=vv[j];
     }
     indx[j]=imax;
     if (a[j*n+j] == 0.0) a[j*n+j]=(double) TINY;
     if (j != n-1) 
     {
        dum= (1.0/(a[j*n+j]));
        for (i=j+1;i<n;i++) a[i*n+j] *= dum;
     }
   }
}


static void lubksb(double* a, int n, int* indx, double b[])
{
   int i,ii=-1,ip,j;
   double sum;

   for (i=0;i<n;i++) 
   {
      ip=indx[i];     
      sum=b[ip];
      b[ip]=b[i];
      if(ii>=0) for (j=ii;j<=i-1;j++) sum -= a[i*n+j]*b[j]; else if (sum) ii=i;
      b[i]=sum;
   }
   for (i=n-1;i>=0;i--) 
   {
      sum=b[i];
      for (j=i+1;j<n;j++) sum -= a[i*n+j]*b[j];
      b[i]=sum/a[i*n+i];
   }
}



static int  stiff_1(double y[], int n, double *x, double htry, double eps,
	double yscal[], double *hdid, double *hnext,
	void (*derivs)(double,double*,double*,double,double*,double*))
{
    int i,j,jtry;
    double d,errmax,h,xsav;

    xsav=(*x);    
    derivs(xsav,y,dydx,htry,dfdx,dfdy);

    for (i=0;i<n;i++) 
    {
       ysav[i]=y[i];
       dysav[i]=dydx[i];
    }
    h=htry;
    for (jtry=1;jtry<=MAXTRY;jtry++) 
    {    
    
      for(i=0;i<n;i++) 
      {
         for (j=0;j<n;j++) a[i*n+j] = -dfdy[i*n+j];
         a[i*n+i] += 1.0/(GAM*h);
      }
      ludcmp(a,n,indx,&d);
      for (i=0;i<n;i++) g1[i]=dysav[i]+h*C1X*dfdx[i];
      lubksb(a,n,indx,g1);
      for (i=0;i<n;i++) y[i]=ysav[i]+A21*g1[i];
      *x=xsav+A2X*h;
      derivs(*x,y,dydx,h,NULL,NULL);
      for(i=0;i<n;i++) g2[i]=dydx[i]+h*C2X*dfdx[i]+C21*g1[i]/h;
      lubksb(a,n,indx,g2);
      for (i=0;i<n;i++) y[i]=ysav[i]+A31*g1[i]+A32*g2[i];
      *x=xsav+A3X*h;
      derivs(*x,y,dydx,h,NULL,NULL);
      for (i=0;i<n;i++) g3[i]=dydx[i]+h*C3X*dfdx[i]+(C31*g1[i]+C32*g2[i])/h;
      lubksb(a,n,indx,g3);
      for(i=0;i<n;i++) g4[i]=dydx[i]+h*C4X*dfdx[i]+(C41*g1[i]+C42*g2[i]+C43*g3[i])/h;
      lubksb(a,n,indx,g4);
      for(i=0;i<n;i++) 
      {
        y[i]=ysav[i]+B1*g1[i]+B2*g2[i]+B3*g3[i]+B4*g4[i];
        err[i]=E1*g1[i]+E2*g2[i]+E3*g3[i]+E4*g4[i];
      }
      *x=xsav+h;
      if (*x == xsav) { printf("stepsize not significant in stiff\n"); return 1;}
      errmax=0.0;
      for(i=0;i<n;i++) if(errmax<fabs(err[i]/yscal[i])) errmax=fabs(err[i]/yscal[i]) ;
      errmax /= eps;
       
      if (errmax <= 1) 
      {
        *hdid=h;
        *hnext=(errmax > ERRCON ? SAFETY*h*pow(errmax,PGROW) : GROW*h);
        return 0;
      } else 
      {
         *hnext=SAFETY*h*pow(errmax,PSHRNK);
         if (*hnext < SHRNK*h) *hnext=SHRNK*h;
         h=(*hnext); 
      }
    }
    printf("exceeded MAXTRY in stiff\n");
    return 2;
}

#undef SAFETY
#undef GROW
#undef PGROW
#undef SHRNK
#undef PSHRNK
#undef ERRCON
#undef MAXTRY
#undef GAM
#undef A21
#undef A31
#undef A32
#undef C21
#undef C31
#undef C32
#undef C41
#undef C42
#undef C43
#undef B1
#undef B2
#undef B3
#undef B4
#undef E1
#undef E2
#undef E3
#undef E4
#undef C1X
#undef C2X
#undef C3X
#undef C4X
#undef A2X
#undef A3X
#undef NRANSI
/* (C) Copr. 1986-92 Numerical Recipes Software ?421.1-9. */


int stiff(double xstart, double xend, int n, double*y, double *yscal, double eps, double*htry, 
    void (*derivs)(double, double*, double*, double,double*,double*))
{ 
  double x=xstart;  
  double _h,h,h_;
  int cerr;
  h=*htry;
  
    indx =realloc(indx ,n*sizeof(double));
    a    =realloc(a    ,n*n*sizeof(double));
    dfdx =realloc(dfdx ,n*sizeof(double));
    dfdy =realloc(dfdy ,n*n*sizeof(double));
    dysav=realloc(dysav,n*sizeof(double));
    err  =realloc(err  ,n*sizeof(double));
    g1   =realloc(g1   ,n*sizeof(double));
    g2   =realloc(g2   ,n*sizeof(double));
    g3   =realloc(g3   ,n*sizeof(double));
    g4   =realloc(g4   ,n*sizeof(double));
    ysav =realloc(ysav ,n*sizeof(double));
    vv   =realloc(vv   ,n*sizeof(double));
    dydx =realloc(dydx ,n*sizeof(double)); 
    err  =realloc(err,  n*sizeof(double));    
  for(; fabs(x-xend)>1.E-5*(fabs(xstart)+fabs(xend)); )
  { 
    h=fabs(h);
    if(h>fabs(x-xend)) h=fabs(x-xend);
    if(x>xend) h*=-1;
    cerr=stiff_1(y,n,&x,h,eps,yscal,&_h,&h_,derivs);
    if(cerr) return cerr;
    h=h_;
//     printf("T=%e Y= %e %e hdid=%e hnext %e\n",x, y[0],y[1],_h,h_);
  }
  *htry=h;
  return 0; 
}

/*

void derivs(double x,  double*y, double*f,double h,double*dfdx,double*dfdy)
{ 
  int i,n=3;
  f[0]= -0.013*y[0]-1000*y[0]*y[2];
  f[1]= -2500*y[1]*y[2];
  f[2]= -0.013*y[0]-1000*y[0]*y[2]-2500*y[1]*y[2];
  
  if(dfdx) for(i=0;i<3;i++) dfdx[i]=0;
  if(dfdy)
  {
    dfdy[0*n+0]= -0.013-1000*y[2];
    dfdy[0*n+1]=  0;
    dfdy[0*n+2]= -1000*y[0];
    dfdy[1*n+0]=  0;
    dfdy[1*n+1]= -2500*y[2];
    dfdy[1*n+2]= -2500*y[1];
    dfdy[2*n+0]= -0.013-1000*y[2];
    dfdy[2*n+1]= -2500*y[2];
    dfdy[2*n+2]= -1000*y[0]-2500*y[1];  
  }  
}


int main(void)
{
  int n=3;
  double x=0;
  double eps=1E-4;
  double h=2.9E-4;
  double y[3]={1,1,0};
  double yscal[3]={1,1,1};
  double dy[3];

 
stiff(0, 50, n, y,yscal,eps,h,derivs);  

                 
}

*/

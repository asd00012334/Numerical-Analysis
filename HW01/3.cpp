#include <bits/stdc++.h>

using namespace std;

inline double g1(double x){return powl(x,2)-2;}
inline double g2(double x){return sqrtl(x+2);}
inline double g3(double x){return 1+2/x;}
inline double g4(double x){return (powl(x,2)+2)/(2*x-1);}

bool isConv(double init, double (*g)(double)){
    double a=init;
    while(1){
        a=g(a);
        if(abs(2-a)<1e-5) return true;
        if(abs(2-a)==INFINITY) return false;
    }
}

int ofConvRate(double r, double init, double (*g)(double)){
    /// return 1 for faster conv
    /// return 0 for the same conv rate
    /// return -1 for the slower conv
    /// result under the assumption of convergence
    double a=init;
    double errorRatio=1;
    while(1){
        double prev=a;
        a=g(a);
        errorRatio=abs(a-2)/pow(abs(prev-2),r);
        if(abs(a-2)<1e-10 || a==INFINITY)break;
            ///This eval an error bound
    }
    if(errorRatio<1e-6) return 1;
    if(errorRatio>1) return -1;
    return 0;
}

/// Given a Convergence Rate, one can determine
/// if the convergence speed is faster or slower
/// than the given rate. Therefore, we perform
/// Bisection Search on Convergence Rates in integer
/// level of precision.
int main(){
    double(*g[4])(double)={g1,g2,g3,g4};
    for(int gi=0;gi<4;gi++){
        double init=2.5;
        if(!isConv(init,g[gi])){
            printf("g%d is divergent\n",gi+1);
            continue;
        }
        int lower=0;
        int upper=10;
        for(;ofConvRate(upper,init,g[gi])>=0;upper*=2);
        bool over=false;
        while(!over){
            int middle=(upper+lower)/2;
            switch(ofConvRate(middle,init,g[gi])){
                case -1: upper=middle; break;
                case 1: lower=middle; break;
                default: over=true; upper=lower=middle; break;
            }

        }
        printf("g%d's rate is ",gi+1);
        cout<<(upper+lower)/2<<"\n";
    }
    return 0;
}

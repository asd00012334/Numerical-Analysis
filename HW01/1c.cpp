#include <bits/stdc++.h>

#define PI (acos(0)*2)
using namespace std;

inline double f(double x){
    /// f(x)=pow(x,3)-sin(x)
    return powl(x,3)-sinl(x)-1;
}

inline double df(double x){
    /// f'(x)=3*pow(x,2)-cos(x)
    return 3*powl(x,2)-cosl(x);
}

inline double g(double x){
    /// g(x)=x-f(x)/f'(x)
    return x-f(x)/df(x);
}

template<typename T0, typename T1>
inline bool differSign(T0 x0, T1 x1){
    return (x0<=0&&x1>=0)||(x0>=0&&x1<=0);
}

int main(){
    /// Solve for the root of f(x) in (PI/6,PI/2)
    double x=1;
    while(1){
        x=g(x);
        if(differSign(f(x-1e-6),f(x+1e-6)))
            ///This eval an error bound
            break;
    }
    cout<<fixed<<setprecision(6);
    cout<<x<<"\n";
}

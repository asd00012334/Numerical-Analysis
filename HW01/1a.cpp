#include <bits/stdc++.h>

#define PI (acos(0)*2)
using namespace std;

inline double f(double x){
    /// Compute f(x)=pow(x,3)-sin(x)
    return powl(x,3)-sinl(x)-1;
}

template<typename T0, typename T1>
inline bool differSign(T0 x0, T1 x1){
    return (x0<=0&&x1>=0)||(x0>=0&&x1<=0);
}

int main(){
    /// Solve for the root of f(x) in (PI/6,PI/2)
    double lowerBound=0;
    double upperBound=2;
    while(1){
        double middle=(lowerBound+upperBound)/2;
        if(differSign(f(lowerBound),f(middle)))
           upperBound=middle;
        else lowerBound=middle;
        if(upperBound-lowerBound<=1e-6) break;
            /// This eval an error bound
    }
    cout<<fixed<<setprecision(6);
    cout<<(lowerBound+upperBound)/2<<"\n";
    return 0;
}

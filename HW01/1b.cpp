#include <bits/stdc++.h>

#define PI (acos(0)*2)
using namespace std;

inline double f(double x){
    /// f(x)=pow(x,3)-sin(x)
    return powl(x,3)-sinl(x)-1;
}

inline double interSection(double l, double u){
    return l-f(l)*(l-u)/(f(l)-f(u));
}

template<typename T0, typename T1>
inline bool differSign(T0 x0, T1 x1){
    return (x0<=0&&x1>=0)||(x0>=0&&x1<=0);
}

int main(){
    /// Solve for the root of f(x) in (PI/6,PI/2)
    double middle=2;
    double prev=0;
    while(1){
        double next=interSection(middle,prev);
        prev=middle;
        middle=next;
        if(differSign(f(middle-1e-6),f(middle+1e-6)))
            ///This eval an error bound
            break;
    }
    cout<<fixed<<setprecision(6);
    cout<<middle<<"\n";
    return 0;
}


#include <bits/stdc++.h>

using namespace std;

inline double P(double x){
    return powl(x-2,3)*powl(x-4,2);
}

inline double dP(double x){
    return 3*powl(x-2,2)*powl(x-4,2)+powl(x-2,3)*(x-4)*2;
}

inline double g(double x){
    return x-P(x)/dP(x);
}

template<typename T0, typename T1>
inline bool differSign(T0 x0, T1 x1){
    return (x0<=0&&x1>=0)||(x0>=0&&x1<=0);
}

int main(){
    double x=3;
    int iterationCount=0;
    while(1){
        x=g(x);
        iterationCount++;
        cout<<x<<endl;
        if(differSign(P(x-1e-6),P(x+1e-6)))
            ///This eval an error bound
            break;
    }
    printf("Iteration Count: %d\n",iterationCount);
    return 0;
}

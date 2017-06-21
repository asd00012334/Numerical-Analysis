#include <iostream>
#include <vector>
#include <algorithm>
#include <cstdio>

using namespace std;

int main()
{
    while(1)
    {
        int len, i, j, samec = 1, ans = 0, temp;
        vector <int> arr;
        scanf("%d", &len);
        vector <int> sum(len);
        if(len==0) return 0;
        arr.push_back(0);
        for(i=0;i<len;i++){
            scanf("%d", &temp);
            arr.push_back(temp);
        }
        //printf("scan over\n");
        sum[0]=0;
        for(i=1;i<len;i++)
            sum[i] = sum[i-1] + arr[i];
        for(i=0;i<len;i++) cout << "sum[" << i << "] = " << sum[i] << '\n';
        sort(sum.begin(), sum.end());
        for(i=0;i<len;i++) cout << "!!!sum[" << i << "] = " << sum.at(i) << '\n';
        //printf("sort over \n");
        if(sum.size()==1) cout << "!!! ans = 0" << '\n';
        for(i=1;i<len;i++){
            if(sum[i-1] != sum[i]){
                // samec!
                if(samec != 1){
                    ans += samec*(samec-1)/2;
                }
                samec = 1;
            }else samec++;
        }
        cout << "ans = " << ans << '\n';
    }
    return 0;
}

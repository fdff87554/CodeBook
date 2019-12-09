#include <bits/stdc++.h>
using namespace std;
#define N 1000000
long long int not_prime[N];
vector<long long int> prime;
void prime_sieve(){
    memset(not_prime,0,sizeof(not_prime));
    not_prime[1]=1;
    for(long long int i=2;i<N;i++){
        if(!not_prime[i]){
            prime.push_back(i);
        }
        for(long long int j=0;j<prime.size()&&i*prime[j]<N;j++){
            not_prime[i*prime[j]]=1;
            if(i%prime[j]==0)
                break;
        }
    }
}
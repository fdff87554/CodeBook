#include<bits/stdc++.h> 
using namespace std; 
#define maxn 46340 //bcz sqrt(2^31-1)~=46340.95 and 46341 not prime
bool prime[maxn];
void prime_table(){
	memset(prime,true,sizeof(prime));
	prime[0]=prime[1]=false;
	for (int i = 2; i < maxn; ++i)
		if (prime[i])
			for (int j = i*i; j < maxn; j+=i)
				prime[j]=false;
		}

int eularphi(int n) 
{
	if (n==0)	return n;
	int ans=n;
	for (int i = 2; i < maxn; ++i)
	{
		if(prime[i] && n%i==0){
			ans=ans/i*(i-1);
			while(n%i==0&&n)
				n/=i;
		}
	}
	if (n!=1){
		ans=ans/n*(n-1);
	}
	return ans;
} 

int main() 
{ 	
	prime_table();
	int in;
	while(~scanf("%d",&in)){
		printf("%d\n", eularphi(in));
	}
	return 0; 
}
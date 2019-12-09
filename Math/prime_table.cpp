#define maxn 46340
//bcz sqrt(2^31-1)~=46340.95 and 46341 46340 not prime
bool prime[maxn];
void prime_table(){
	memset(prime,true,sizeof(prime));
	prime[0]=prime[1]=false;
	for (int i = 2; i < maxn; ++i)
		if (prime[i])
			for (int j = i*i; j < maxn; j+=i)
				prime[j]=false;
		}
#include <iostream> 
#include <cstring> 
using namespace std;
#define LL long long
//注意，f0=1,f1=1,f2=2...
const LL mod=1e9+7; // 避免數值過大造成 overflow，因此將所有數值都 mod 10^9+7 

struct Matrix  { 
	LL a[2][2];
	void all_0() // 清空矩陣 
	{
		memset(a, 0, sizeof(a));
	}
	void I() // 讓矩陣變成單位方陣 
	{
		a[0][0]=1; a[0][1]=0;
		a[1][0]=0; a[1][1]=1;
	}
	void X() // 讓矩陣變成文章中的矩陣 A
	{
		a[0][0]=1; a[0][1]=1;
		a[1][0]=1; a[1][1]=0;
	}
};

Matrix operator*(const Matrix &a, const Matrix &b) // 矩陣乘法
{
	Matrix ret;
	ret.all_0();
	for (LL i=0; i<2; i++)  {
		for (LL j=0; j<2; j++)  {
			for (LL k=0; k<2; k++)  {
				ret.a[i][j]+=a.a[i][k]*b.a[k][j];
				ret.a[i][j]%=mod;
			}
		}
	}
	return ret;
}

Matrix power(Matrix a, LL n) // 快速冪 
{
	Matrix ret;
	ret.I();
	if (n==0)  return ret;
	ret.X();
	if (n==1)  return ret;
	ret=power(a, n/2);
	ret=ret*ret;
	if (n%2==1)  ret=ret*a;
	return ret;
}

LL query(LL n)
{
	Matrix tmp;
	tmp.X();
	tmp=power(tmp, n);
	LL ret=tmp.a[1][0]+tmp.a[1][1]; // 因為初始的矩陣 X[0] 的兩個元的值都是 1，所以矩陣相乘的結果相當於把矩陣 A 下面的兩個元加起來 
	ret%=mod;
	return ret;
}

int main()
{
	LL n;
	while (cin >> n)  {
		cout << query(n) << endl;
	}
	return 0;
}
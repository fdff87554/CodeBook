#include<bits/stdc++.h>

using namespace std;

#define ll long long

const int size = 1000;
const int carrySys = 10;


struct BigNum{
	
	int len;
	int bgNum[size];
	bool sign;

	void reset(){

		len = 1;
		memset(bgNum, 0, sizeof(bgNum));
	}


	BigNum add(const BigNum lhs, const BigNum rhs){

		BigNum sum;
		sum.reset();

		int l = std::max(rhs.len, lhs.len);

		for (int i = 0; i < l; i++)
		{

			sum.bgNum[i] += lhs.bgNum[i] + rhs.bgNum[i];
			if (sum.bgNum[i] >= carrySys)
			{

				sum.bgNum[i + 1]++;
				sum.bgNum[i] -= carrySys;
			}
		}
		if (sum.bgNum[l])
			l++;
		sum.len = l;

		if (!lhs.sign && !rhs.sign)
			sum.sign = false;
		else
			sum.sign = true;

		return sum;
	}

	BigNum sub(const BigNum lhs, const BigNum rhs, bool s){

		BigNum ans;
		ans.reset();

		int l = max(rhs.len, lhs.len);
		int tmp[size];
		memset(tmp, 0, sizeof(tmp));
		copy(lhs.bgNum, lhs.bgNum + lhs.len, tmp);
		for (int i = 0; i < l; i++)
		{

			if (tmp[i] < rhs.bgNum[i] && i != l - 1)
			{

				tmp[i + 1] -= 1;
				tmp[i] += carrySys;
			}
			ans.bgNum[i] = tmp[i] - rhs.bgNum[i];
		}

		if (ans.bgNum[l - 1] < 0)
		{

			ans.bgNum[l - 1] = abs(ans.bgNum[l - 1]);
			ans.sign = false;
		}
		else
			ans.sign = true;

		ans.len = l;

		while (ans.len > 1 && !ans.bgNum[ans.len - 1])
		{

			ans.len--;
		}

		ans.sign = s;

		return ans;
	}
	void intToBigNum(ll x){

		if(x < 0){
			sign = false;
			x *= -1;
		}
		else
			sign = true;

		reset();
		if(x == 0)
			return;
		
		len = 0;
		while(x){

			bgNum[len++] = x % 10;
			x /= 10;
		}
	}
	void strToBigNum(char x[]){
		
		reset();
		len = strlen(x);
		int l = 0;
		int a = -1;
		if(x[0] == '-'){

			sign = false;
			a++;
		}
		else{

			sign = true;
		}


		for(int i = len-1 ; i > a ; i--){

			bgNum[l++] = x[i] - '0';
		}
		if(!sign){

			len--;
		}
	}

	void strToBigNum(string x){
		
		reset();
		
		if(x[0] == '-')
			sign = false;
		else
			sign = true;

		reverse(x.begin(), x.end());
		len = x.size();
		if(!sign)
			len--;

		for(int i = 0 ; i < len ; i++){

			bgNum[i] = x[i]-'0';
		}
	}

	BigNum operator+(const BigNum &rhs){

		BigNum a = *this;
		BigNum b = rhs;

		if(sign && rhs.sign)
			return add(*this, rhs);
		else if(!sign && rhs.sign){

			a.sign = true;
			return (a > b ? sub(a, b, false) : sub(b, a, true));
		}
		else if(sign && !rhs.sign){

			b.sign = true;
			return (a > b ? sub(a, b, true) : sub(b, a, false));
		}
		else//!sign && !rhs.sign
			return add(*this, rhs);

	}

	BigNum operator-(const BigNum &rhs){

		BigNum a = *this;
		BigNum b = rhs;

		if(sign && rhs.sign)
			return ((*this >= rhs) ? sub(*this, rhs, true) : sub(rhs, *this, false));
		else if(!sign && rhs.sign){

			b.sign = false;	
			return add(a, b);
		}
		else if(sign && !rhs.sign){

			b.sign = true;
			return add(a, b);
		}
		else{

			a.sign = true;
			b.sign = true;
			if(a > b){
				
				return sub(a, b, false);
			}
			else{

				return sub(b, a, true);
			}
		}
	}

	// BigNum operator * (const BigNum &rhs){

	// 	// cout<< "mul" << endl;
	// 	BigNum ans;
	// 	ans.reset();
	// 	for(int i = 0 ; i < len ; i++){

	// 		for(int j = 0 ; j < rhs.len ; j++){


	// 			int l = i + j;
	// 			ans.bgNum[l] += bgNum[i] * rhs.bgNum[j];
	// 			while(ans.bgNum[l] >= carrySys){

	// 				ans.bgNum[l+1] += ans.bgNum[l] / carrySys;
	// 				ans.bgNum[l] = ans.bgNum[l] % carrySys;
	// 			}
	// 		}
	// 	}

	// 	ans.len = len + rhs.len;
	// 	if(!ans.bgNum[ans.len-1]){

	// 		ans.len--;
	// 	}
	// 	return ans;
	// }

	friend bool operator < (const BigNum &lhs, const BigNum &rhs){

		// cout << lhs.len << rhs.len << endl;
		if(lhs.sign < rhs.sign)
			return true;
		else if(lhs.sign > rhs.sign)
			return false;
		else{

			if(lhs.len < rhs.len)
				return true;
			else if(lhs.len == rhs.len){

				for(int i = 0 ; i < lhs.len ; i++){

					if(lhs.bgNum[i] < rhs.bgNum[i])
						return true;
				}
				return false;
			}
			else
				return false;
		}
	}

	friend bool operator > (const BigNum &lhs, const BigNum &rhs){

		if(lhs.sign > rhs.sign)
			return true;
		else if(lhs.sign < rhs.sign)
			return false;
		else{

			if (lhs.len > rhs.len)
				return true;
			else if (lhs.len == rhs.len){

				for (int i = 0; i < lhs.len; i++){

					if (lhs.bgNum[i] > rhs.bgNum[i])
						return true;
				}
				return false;
			}
			else
				return false;
		}

	}

	friend bool operator >= (const BigNum &lhs, const BigNum &rhs){

		return !(lhs < rhs);
	}

	friend bool operator <= (const BigNum &lhs, const BigNum &rhs){

		return !(lhs > rhs);
	}
	BigNum operator = (const BigNum &rhs){

		len = rhs.len;
		copy(rhs.bgNum, rhs.bgNum+rhs.len, bgNum);
		sign = rhs.sign;
	}

	friend ostream& operator<<(ostream &out, const BigNum &num){

		if(!num.sign){

			cout << "-";
		}

		out << num.bgNum[num.len-1];
		for(int i = num.len-2 ; i >= 0 ; i--)
			out << num.bgNum[i];
		return out;
	}

	BigNum(){ reset(); }
	BigNum(int x){	reset(); intToBigNum(x);	}
	BigNum(ll x){	reset(); intToBigNum(x); }
	BigNum(string x){	

		reset();
		strToBigNum(x); 
	}
	BigNum(char x[]){	

		reset();
		strToBigNum(x); 
	}

};

int main(){

	#ifdef DBG
	freopen("1.in", "r", stdin);
	freopen("2.out", "w", stdout);
	#endif // DEBUG


	// char a[] = "12345";
	// char b[] = "-2345";

	// BigNum x = a;
	// BigNum y = b;

	// cout << x << " " << y << endl;

	string a, b;

	while(cin >> a >> b){

		BigNum x, y;
		// cout << "aaa: ";
		x = a;
		y = b;

		BigNum z = x - y;
		cout << z << endl;
		// cout << z.len << endl;
	}


	return 0;
}
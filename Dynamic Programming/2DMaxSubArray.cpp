#include<bits/stdc++.h>

using namespace std;

#define size 4

int arr[size][size];

int maxSubArr(){

	int b[size];
	int MAX = -11111111;

	for(int i = 0 ; i < size; i++){

		memset(b, 0, sizeof(b));
		for(int j = i ; j < size ; j++){

			int s = 0;
			for(int k = 0 ; k < size ; k++){

				b[k] += arr[j][k];
				s += b[k];
				if(s <= 0)
					s = b[k];
				if(s > MAX)
					MAX = s;
			}
		}
	}
	return MAX;
}	

int main(){

	#ifdef DBG
	freopen("1.in", "r", stdin);
	freopen("2.out", "w", stdout);
    #endif

	for(int i = 0 ; i < size ; i++)
		for(int j = 0 ; j < size ; j++)
			cin >> arr[i][j];

	maxSubArr();

	return 0;
}
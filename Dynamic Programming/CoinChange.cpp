#include<bits/stdc++.h>

using namespace std;

int coin[] = {1, 5, 10, 25, 50};
int arr[100000];

void build(){

	memset(arr, 0, sizeof(arr));
	arr[0] = 1;
	for (int i = 0; i < 5; i++){

		for (int j = 1; j < 10000; j++){

			if (j >= coin[i]){

				arr[j] = arr[j] + arr[j - coin[i]];
			}
		}
	}
}
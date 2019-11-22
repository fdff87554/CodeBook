#include<bits/stdc++.h>

using namespace std;

int arr[1500][1500];

void LCS(string str1, string str2){

	memset(arr, 0, sizeof(arr));
	for (int i = 1; i <= str1.size(); i++){

		for (int j = 1; j <= str2.size(); j++){

			if (str1[i - 1] == str2[j - 1]){

				arr[i][j] = arr[i - 1][j - 1] + 1;
			}
			else{

				arr[i][j] = max(arr[i - 1][j], arr[i][j - 1]);
			}
		}
	}
}
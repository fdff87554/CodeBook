#include <iostream>
#include <cstdio>
#include <algorithm>
#include <vector>
using namespace std;

#define maxn 10000

int main(void)
{
	int n;
	int find;
	vector <int> arr;

	scanf("%d", &n);

	for(int i = 0; i < n; i++)
	{
		int tmp;
		scanf("%d", &tmp);
		arr.push_back(tmp);
	}

	sort(arr.begin(), arr.end());

	scanf("%d", &find);

	//兩者都在<algorithm> header file

	//找數字是否在array裡面 true = 1, false = 0
	cout << binary_search(arr.begin(), arr.end(), find) << endl;

	//找大於或等於那個數的最小'位子'
	printf("%d\n", *lower_bound(arr.begin(), arr.end(), find));

	return 0;
}


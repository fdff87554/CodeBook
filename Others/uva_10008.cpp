#include <bits/stdc++.h>

using namespace std;

struct ALPHABET{
	char alphabet;
	int num;

	ALPHABET(){
		num = 0;
	}

	bool operator < ( ALPHABET &rhs ){
		if( num == rhs.num ){
			return alphabet < rhs.alphabet;
		}
		return num > rhs.num;
	};
};

int main(){
	int testCases;
	ALPHABET table[30];
	cin >> testCases;
	
	string input;
	getline( cin, input );
	while( testCases-- > 0 ){
		getline( cin, input );
		transform(input.begin(), input.end(), input.begin(), ::toupper);
		for( int i = 0; i < input.size(); i++ ){
			if( input.at(i) >= 'A' && input.at(i) <= 'Z' ){
				table[ input.at(i) - 'A' ].num++;
				table[ input.at(i) - 'A'].alphabet = input.at(i);
			}
		}
	}

	sort( &table[0], &table[26] );

	for( int i = 0; i < 26; i++ ){
		if( table[i].num > 0 ){
			cout << table[i].alphabet << " " << table[i].num << endl;
		}
	}

	return 0;
}
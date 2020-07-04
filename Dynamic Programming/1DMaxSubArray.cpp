#include <bits/stdc++.h>

#define size 10005
#define ll long long

using namespace std;

int arr[size];

int maxSub( int numSize ){
    int MAX = -11111111; int s = 0;
    for( int i = 0; i < numSize; i++ ){
        s += arr[i];
        if( s <= 0 ){
            s = 0;
        } else if( s > MAX ) {
            MAX = s;
        }
    }
    return MAX;
}

int main(){
    int num; int output;
    while(cin >> num && num){
        memset( arr, 0, sizeof(arr) );
        for( int i = 0; i < num; i++ ){
            cin >> arr[i];
        }
        output = maxSub( num );
        if( output < 0 ){
            cout << "Losing streak." << endl;
        } else {
            cout << "The maximum winning streak is " << output << "." << endl;
        }
    }

    return 0;
}
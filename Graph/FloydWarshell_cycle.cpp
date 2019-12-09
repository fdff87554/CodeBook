#include <bits/stdc++.h>

using namespace std;

#define maxn 100 + 5

int n;
int ans;
int dis[maxn][maxn];

int main(void){
	while( cin >> n ){
		ans = 1e9;
		for( int i = 1; i <= n; i++ ){
			for( int j = 1; j <= n; j++ ){
				cin >> dis[i][j];
				if( !dis[i][j] ){
					dis[i][j] = 1e9;
				}
			}
		}

		for( int k = 1; k <= n; k++ ){
			for( int i = 1; i <= n; i++ ){
				for( int j = 1; j <= n; j++ ){
					if( dis[i][j] > dis[i][k] + dis[k][j] ){
						// 如果可以以 k 為中繼點，更新 i, j 的最短距離
						dis[i][j] = dis[i][k] + dis[k][j];
					}
				}
				if( i == j ){
					ans = min( ans, dis[i][j] );
				}
			}
		}

		if( ans == 1e9 ){
			cout << -1 << endl;
		}
		else{
			cout << ans << endl;
		}
	}
}
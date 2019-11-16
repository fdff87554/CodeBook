#include <bits/stdc++.h>

using namespace std;

int n, dp[N][2], visited[N];
bool visited[N];
vector<int > g[N];

void dfs(int u){
 visited[u] = true;
 dp[u][0] = 0;
 dp[u][1] = 1;

 for (int i = 0; i < g[u].size(); ++i){
  int v = g[u][i];
  if(visited[v]) continue;

  dfs(v);
  dp[u][0] += dp[v][1];
  dp[u][1] += min(dp[v][0], dp[v][1]);
 }
}

int solve(){
 int ans = 0;
 memset(visited, false, sizeof(visited));

 for (int i = 0; i < n; ++i){
  if(visited[i]) continue;
  dfs(i);
  ans += min(dp[i][0], dp[i][1]);
 }
 return ans;
}

int main(int argc, char const *argv[]){
 while(~scanf("%d", &n)){
  memset(g, 0, sizeof(g));
  int u, num, v;
  for (int i = 0; i < n; ++i){
   scanf("%d%*c%*c%d%*c", &u, &num);
   while(num--){
    scanf("%d", &v);
    g[u].push_back(v);
    g[v].push_back(u);
   }
  }
  printf("%d\n", solve);

 }
 return 0;
}
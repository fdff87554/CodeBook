#include <bits/stdc++.h>
using namespace std;

#define maxn
#define LG //LG = log2n
#define PB push_back
#define MP make_pair

int f[LG][maxn];
int dep[maxn]; // dep[i] 是點 i 的深度，root 深度是 0，下一層的深度是 1...
int depw[maxn];
int n, m;

// if no weight
// int e[maxn]; 

//if the edge with weight
vector< pair<int, int> > e[maxn];

void dfs(int cur,int fa) { // 多帶一個父節點的參數，是在樹上 dfs 常見的技巧，可以省去平常 dfs 需要的 vis 陣列
    f[0][cur] = fa;
    for (auto i: e[cur]) if (i != fa) {
    dep[i] = dep[cur]+1;
    dfs(i, cur);
    }
}

int lca(int x,int y) {
    // 跟 swap(x,y) 是一樣的意思
    if (dep[x] < dep[y]) return lca(y,x); 
    // 這裡開始 dep[x] >= dep[y] 一定成立

    for (int i=LG-1; i>=0; i--) 
        if (dep[x]-(1<<i) >= dep[y]) // 先想辦法把 x,y 調到同深度
            x = f[i][x];
        if (x==y) return x; // 如果發現同深度時，是同一個點就回傳找到 LCA 了

    // 否則盡量想辦法往上走，只要 x,y 同時往上走 2^i 步還不是相同的點，就 greedy 走
    for (int i=LG-1; i>=0; i--) 
        if (f[i][x] != f[i][y]) 
        {
            x = f[i][x];
            y = f[i][y];
        }
  assert(f[0][x] == f[0][y]); // 走完以後，會發現 x,y 停在 lca 的正下方一個點
  return f[0][x];
}
void make_lca() {
  dep[1] = depw[1] = 0;
  dfs(1, 1); // 拿 1 當 root，且 1 的父節點是 1
  for (int i=1; i<LG; i++)
    for (int j=1; j<=n; j++)
      f[i][j] = f[i-1][f[i-1][j]]; // j 往上走 2^(i-1) 再往上走 2^(i-1) = 往上走 2^i 步
}

int main(void)
{
    while(cin >> n >> m)
    {
        //init
        for(int i = 0; i < maxn; i++)
            e[i].clear();
        
        int x, y, z;

        for(int i = 0; i < n-1; i++)
        {
            // if no weight
            // cin >> x >> y;
            // e[x].PB(y);
            // e[y].PB(x);

            cin >> x >> y >> z;
            e[x].PB(MP(y, z));
            e[y].PB(MP(x, z));
        }

        //make LCA
        make_lca();

        for(int i = 0; i < m; i++)
        {
            cin >> x >> y;
            cout << dep[x]+dep[y]-2*dep[lca(x, y)] << '\n';
        }
    }
    return 0;
}
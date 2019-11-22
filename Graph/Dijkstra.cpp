#include <bits/stdc++.h>
using namespace std;

#define MP make_pair
#define PII pair<int, int>
#define maxn 50000+5

int dis[maxn]; // 預設都是 INF
vector<PII > e[maxn]; // (連到的點， 邊的距離)

void dijk(int cur) // dijk(起點)
{ 
  int d;
  priority_queue<PII,vector<PII>,greater<PII>> q; // 放 (距離, 點編號)，每次會拿距離最小的點出來
  q.push( MP(0, cur) );
    
  while (!q.empty()) 
  {
    tie(d, cur) = q.top();
    q.pop();
    if (dis[cur] != 1e9) 
        continue; // 如果之前就拜訪過，無視

    dis[cur] = d;

    for (auto i: e[cur])
        if (dis[i.first] == 1e9) 
        {
            q.push( MP(d+i.second, i.first) );
        }
    }
}

void init(void)
{
    fill(dis, dis+maxn, 1e9);

    for(int i = 0; i < maxn; i++)
    {
        e[i].clear();
    }
}
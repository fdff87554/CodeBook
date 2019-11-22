#include <bits/stdc++.h>
using namespace std;

#define MP make_pair
#define PII pair<int, int>
#define maxn 500+5

const int INF = 1e9; //比最大可能的距離更大

bool inq[maxn]; // inq[i] 代表 i 在 queue 裡面
int dis[maxn]; // 預設都是 INF
int updateCount[maxn];
int vis[maxn];
vector<PII> e[maxn]; // (連到的點， 邊的距離)
int n, m;

void spfa(int cur) 
{
	queue<int> q;
	dis[cur] = 0;
	q.push(cur);
		
	while (!q.empty()) 
	{
	    cur = q.front();
	    q.pop();
	    inq[cur] = false;

	    for (auto i: e[cur])
	    {
	    	// 如果點 cur，經過權重 i.S 這條邊，走到 i.F 可以更短，就更新
	      	if (i.second + dis[cur] < dis[i.first]) 
	      	{ 
		        dis[i.first] = dis[cur] + i.second;
		        if (!inq[i.first]) 
		        {
		        	// updateCount 紀錄一個點被放到 queue 幾次
		        	updateCount[i.first]++; 
		        	if(updateCount[i.first] > n)
		        	{
		        		continue;
		        	}
		          	inq[i.first] = true;
		          	q.push( i.first );
	        	}
	    	}
	    }
	}
}

void init(void)
{
	fill(dis, dis+maxn, INF);
	for(int i = 0; i < maxn; i++)
	{
		e[i].clear();
	}
	memset(updateCount, 0, sizeof(updateCount));
	memset(inq, false, sizeof(inq));
}

bool dfs(int cur)
{
    vis[cur]=true;
    if(cur==n)return true;
     
    for(int i = 0; i < e[cur].size(); i++)
        if(!vis[e[cur][i].first])
            if(dfs(e[cur][i].first))
                return true;
    return false;
}

bool check()
{
    memset(vis,false, sizeof(vis));
    for(int i = 1; i <= n; i++)
        if(updateCount[i]>n && dfs(i))
            return true;
    return false;
}

int main(void)
{
	int x, y, z;
	while(cin >> n >> m)
	{
		init();

		for(int i = 0; i < m; i++)
		{
			cin >> x >> y >> z;
			e[x].push_back(MP(y, z));
		}

		spfa(1);

		if(dis[n]!=INF && !check())
			cout << dis[n] << '\n';
		else
			cout << "There a negative cycle or no path\n";
	}
	return 0;
}
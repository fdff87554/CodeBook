#include <bits/stdc++.h>
using namespace std;

#define MP make_pair
#define PII pair<int, int>
#define maxn 500+5

const int INF = 1e9; //比最大可能的距離更大

bool inq[maxn]; // inq[i] 代表 i 在 queue 裡面
int dis[maxn]; // 預設都是 INF
vector<PII> e[maxn]; // (連到的點， 邊的距離)

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

	memset(inq, false, sizeof(inq));
}
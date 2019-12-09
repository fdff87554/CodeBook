#include <bits/stdc++.h>
using namespace std;

#define MP make_pair
#define PB push_back
#define maxn 50005

struct edge
{
    int t,next;
}   in[maxn*8];

int n,m,e,first[maxn];
bool vis[maxn],fail,side[maxn];

void add(int x,int y)
{
    in[e].t=y;
    in[e].next=first[x];
    first[x]=e++;
}

void dfs(int cur,bool tf)
{
    vis[cur]=true;
    side[cur]=tf;
    for(int i = first[cur]; ~i; i = in[i].next)
    {
        if(fail)
            return;
        if(vis[in[i].t] && side[in[i].t]==tf)
            fail=true;
        else if(!vis[in[i].t])
            dfs(in[i].t, !tf);
    }
}

int main(void)
{
    int x,y;
    while(cin >> n >> m)
    {
        e = 0;
        fail = false;
        memset(first, -1, sizeof(first));
        memset(vis, false, sizeof(vis));

        for(int i = 0;i < m; i++)
        {
            cin >> x >> y;

            add(x,y);
            add(y,x);
        }

        for(int i = 1; i <= n; i++)
            if(!vis[i])
                dfs(i,false);

        if(fail)
            puts("no");
        else 
            puts("yes");
    }
    return 0;
}
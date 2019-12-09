#include <bits/stdc++.h>
#define maxn 50005
using namespace std;
struct edge
{
    int t,next;
}   in[maxn*4];    
//n vertex has n*4 maximum edges

int n,m,e,first[maxn],s[maxn],top;
//  first   紀錄是否有固定順序 
//  s 紀錄順序

bool fail,ins[maxn],vis[maxn];
//  vis 是否訪問
//  ins 在做dfs的當下 那點是否被訪問過

void add(int x,int y)
{
    in[e].t=y;
    in[e].next=first[x];
    first[x]=e++;
}
void dfs(int cur)
{
    ins[cur]=vis[cur]=true;
    for(int i=first[cur]; ~i; i=in[i].next)
    {
        if(!vis[in[i].t])
            dfs(in[i].t);
        else if(ins[in[i].t])
            fail=true;
    }
    ins[cur]=false;
    s[top++]=cur;
}
int main(void)
{
    int x,y;
    while(cin >> n >> m)
    {
        //init  
        e = 0;
        top = 0;
        fail = false;
        memset(first, -1, sizeof(first));
        memset(ins, false, sizeof(ins));
        memset(vis, false, sizeof(vis));
         
        for(int i = 1; i <= m; i++)
        {
            scanf("%d %d",&x,&y);
            add(x,y);
        }
         
        for(int i = 1; i <= n; i++)
            if(!vis[i])
                dfs(i);
         
        if(fail)
            puts("-1");
        else 
            for(int i = top-1; i >= 0; i--)
                printf("%d\n",s[i]);
    }
    return 0;
}
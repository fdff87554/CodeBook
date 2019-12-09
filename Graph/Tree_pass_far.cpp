#include <bits/stdc++.h>
using namespace std;

#define ll long long
#define PB push_back
#define PII pair<int, int>
#define MP make_pair
#define IOS ios_base::sync_with_stdio(false); cin.tie(0)
#define all(x) x.begin(), x.end()
#define REP(x, y, z) for(int x = y; x <= z; x++)
#define maxn 100000+5

//structure

//declaration
int n;
vector<PII> e[maxn];
PII first;

//functions
void dfs(int ver, int fa, int dep)
{
    if(dep > first.second)
    {
        first.first = ver;
        first.second = dep;
    }

    for(auto i : e[ver])
    {
        if(i.first != fa)
        {
            dfs(i.first, ver, dep+i.second);
        }
    }

    return;
}

int main(void)
{
    IOS;
    
    while(cin >> n)
    {
        //init
        REP(i, 1, n)
        {
            e[i].clear();
        }

        first.second = 0;


        int x, y, z;

        REP(i, 1, n-1)
        {
            cin >> x >> y >> z;

            e[x].PB(MP(y, z));
            e[y].PB(MP(x, z));
        }

        dfs(1, 1, 0);

        first.second = 0;

        dfs(first.first, first.first, 0);

        printf("%.1f\n", (float)(first.second)/2);
    }

    return 0;
}
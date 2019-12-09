#include <bits/stdc++.h>
using namespace std;

#define maxn 100000
#define maxm 100000

int coins[maxn];
int table[maxm];
int n, target;

int minCoins(int n, int tar) 
{ 
    table[0] = 0; 
  
    for (int i = 1; i <= tar; i++) 
        table[i] = 1e9; 
  
    // Compute minimum coins required for all 
    // values from 1 to V 
    for (int i = 1; i <= tar; i++) 
    { 
        // Go through all coins smaller than i 
        for (int j=  0; j < n; j++) 
            if (coins[j] <= i) 
            { 
                int sub_res = table[i-coins[j]]; 
                if (sub_res != 1e9 && sub_res + 1 < table[i]) 
                    table[i] = sub_res + 1; 
            } 
    } 
}

int main(void)
{
    while(cin >> n >> target)
    {
        for(int i = 0; i < n; i++)
        {
            cin >> coins[i];
        }

        minCoins(n, target);
    }
}
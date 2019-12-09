for (int k = 1; k <= n; k++)
  	for (int i = 1; i <= n; i++)
    	for (int j = 1; j <= n; j++)
      		if (dis[i][j] > dis[i][k] + dis[k][j]) 
      		{ 
      			// 如果可以以 k 為中繼點，更新 i,j 的最短距離
        		dis[i][j] = dis[i][k] + dis[k][j];
			}
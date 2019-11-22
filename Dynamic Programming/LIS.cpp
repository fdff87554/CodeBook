int main(int argc, char const *argv[])
{
    int ls[100050];
    int dp[100050];
    int x;
 
    cin >> x;
 
    for(int i = 0; i < x; i++)
    {
        cin >> ls[i];
    }
 
    memset(dp, 0, x+5);
    dp[0] = ls[0];
    int top = 0;
 
    for(int i = 1; i < x; i++)
    {   
        int left = 0, right = top;
		bool found = false;

		while(left <= right)
		{
			if(ls[i] > dp[(left+right)/2])	left = (left+right)/2+1;
			else if(ls[i] < dp[(left+right)/2])		right = (left+right)/2-1;
			else if(ls[i] == dp[(left+right)/2])	
			{
				found = true;
				break;
			}
		}
		if(found)	continue;
		dp[right+1] = ls[i];

		if(right == top)	top++;
    }

    //test
    for(int i = 0; i < x; i++)
    {
    	printf("%d ", dp[i]);
    }
    cout << endl;
 
    cout << top+1 << endl;
    return 0;
}
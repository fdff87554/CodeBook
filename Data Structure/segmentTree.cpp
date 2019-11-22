#define SIZE 100000

int st[SIZE];
int st_val[SIZE];

void st_build(int *st, int *st_val, int now, int ls, int rs)
{
	if(ls == rs)
		st[now] = st_val[ls];
	else
	{
		st_build(st, st_val, now*2, ls, (ls+rs)/2);
		st_build(st, st_val, now*2+1, (ls+rs)/2+1, rs);
		st[now] = max(st[now*2], st[now*2+1]);
	}
}

// ls and rs are query range, begin and end is whole st[] range
int query(int now, int ls, int rs, int begin, int end)
{
	int mid = (begin+end)/2;
	int ret = 0;

	if(ls <= begin && rs >= end)
		return st[now];
	
	// it is find max now (modify here)
	if(ls <= mid)
		ret = max(ret, query(now*2, ls, rs, begin, mid));
	
	if(rs > mid)
		ret = max(ret, query(now*2+1, ls, rs, mid+1, end));

	return ret;
}
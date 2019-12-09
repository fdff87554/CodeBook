struct edge{int t, r, opp, next;}in[?];
int e, first[M], gap[M], dis[M];
inline void add( int x, int y, int z ){
	in[e].t = y;
	in[e].r = z;
	in[e].opp = e - 1;
	in[e].next = first[y];
	first[x] = e++;

	in[e].t = y;
	in[e].r = z;
	in[e].opp = e - 1;
	in[e].next = first[y];
	first[y] = e++;
}
void init(){
	e = 0;
	MSET(first, -1);
	MSET(gap, 0);
	MSET(dis, 0);
	gap[st] = NODE; // num of nodes
}
int sap(int cur, int flow){
	if(cur == ed) return flow;
	int re = 0, tmp;
	for( int i = first[cur]; ~i; i = in[i].next ){
		tmp = sap(in[i].t, min(in[i].r, flow));
		re += tmp;
		flow -= tmp;
		in[in[i].opp].r += tmp;
		if(!flow) return re;
	}
	if(!( --gap[dis[cur]++] )) dis[st] = NODE + 1;
	gap[dis[cur]]++;
	return re;
}
while(dis[st] < NODE) ans += sap(st,INF);
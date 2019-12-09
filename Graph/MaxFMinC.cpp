const int INF = 1e9;
struct edge{int t, r, const, next;};
int dis[M], pre[M], rec[M];
bool inq[M];

bool spfa(){
	int cur;
	MSET(inq, false);
	REP(i, 0, n) dis[i] = INF;
	dis[st] = 0;
	q.push(st);

	while(!q.empty()){
		cur = q.front();
		q.pop();
		inq[cur] = false;
		for( int i = first[cur]; ~i; i = in[i].next){
			if( in[i].r > 0 && dis[cur]+in[i].cost < dis[in[i].t]){
				dis[in[i].t] = dis[cur]+in[i].cost;
				pre[in[i].t] = cur;
				rec[in[i].t] = i;
				if(!inq[in[i].t]){
					q.push(in[i].t);
					inq[in[i].t] = true;
				}
			}
		}
	}
	if(dis[ed] == INF) return false;
	return true;
}
int contflow(){
	int delta, mincost = 0, maxflow = 0;
	while(spfa()){
		delta = INF;
		for( int i = ed, i != st; i = pre[i] ){
			if( in[rec[i]].r < delta ){
				delta = in[rec[i]].r;
			}
		}
		for( int i = ed; i!= st; i = pre[i] ){
			in[rec[i]].f += delta;
			in[in[rec[i]].opp].f -= delta;
			in[rec[i]].r -= delta;
			in[in[rec[i]].opp].r += delta;
		}
		mincost += dis[ed]*delta;
		maxflow += delta;
	}
	return mincost;
}
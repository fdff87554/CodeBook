Fenwick Tree
Lowbit(k) = k & -k
void add (int x, int d){
   while (x<=n){
 c[x]+=d; x+=lowbit(x);
}
}
int sum(int x){
   int ret=0;
while (x>0){
 ret+=c[x];
 x-=lowbit(x);
}
return ret;
}
int rsum(int x, int y){
   return( sum(y)-sum(x-1) );
}
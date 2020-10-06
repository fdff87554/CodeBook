// Template
typedef struct{dou x,y;}dot;
dot operator−(dot a,dot b){
    return(dot){a.x−b.x,a.y−b.y};}
dot operator+(dot a,dot b){
    return(dot){a.x+b.x,a.y+b.y};}
dot operator*(dot a,dou k){
	return(dot){a.x*k,a.y*k};}
dou operator*(dot a,dot b){
	return a.x*b.y−a.y*b.x;}
dou operator%(dot a,dot b){
	return a.x*b.x+a.y*b.y;}
dou diss(dot a){return a%a;}
dou dis(dot a){return sqrt(a%a);}
// 簡單多邊形刪去重覆點和邊上點
void clean(dot*a,int&n){
	int tn=1;
	for(int i=1;i<n;i++){
		if(a[i].x!=a[i−1].x || a[i].y!=a[i−1].y){
			a[tn++]=a[i];
		}
	}
	a[tn+0]=a[0];a[tn+1]=a[1];n=0;
	for(int i=1;i<=tn;i++){
		if((a[i]−a[i−1])*(a[i+1]−a[i])!=0){
			a[n++]=a[i];
		}
	}
}
// 判斷點在簡單多邊形內
int isinp(dot d,dot*a,int n){
	int cnt=0;
	a[n]=a[0];
	for(int i=0;i<n;i++){
		if((a[i+0].y>=d.y&&a[i+1].y<d.y||a[i+1].y>=d.y&&a[i+0].y<d.y)
		&&(a[i+0].x<=d.x||a[i+1].x<=d.x)
		&&a[i].x+(d.y−a[i].y)
		/(a[i+1].y−a[i].y)
		*(a[i+1].x−a[i].x)<d.x){
			cnt^=1;
		}
	}
	return cnt;
}
// 找線段交點
int getjiao(dot&jd,dot a,dot b,dot c,dot d){
	//t1*(b−a)+t2*(c−d)=c−a
	dou d1=(b−a)*(c−d);
	if(fabs(d1)<eps)return 0;
	dou d2=(b−a)*(c−a);
	dou d3=(c−a)*(c−d);
	jd=a+(b−a)*(d2/d1);
	return 1;
	//jd between [a,b] & [c,d]
	return fabs(d2/d1)<0.5+eps && fabs(d3/d1)<0.5+eps;
}
// 找投影點
// • a 為平面或線通過的點
// • dv 直線投影時為直線方向向量
// • dv 平面投影時為平面法向量
// • b 為要投影的點
void getproject(dot&pd,dot a,dot dv,dot b){
	//(a+t*dv-b)%dv=0
	dou t =((a-b)%dv)/(dv%dv);
	//if(LineProject)
	pd=a+dv*t;
	//if(PlanProject)
	pd=b-dv*t;
}
// 找射線和圓或球的交點
// • d 為線通過的點
// • dv 為直線方向向量
// • o 為圓心，r 為半徑
int getjiaoc(dot&j1,dot&j2,dot d,dot dv,dot o,dou r){
	dou a=dv%dv;
	dou b=(d-o)%dv*2;
	dou c=(d-o)%(d-o)-r*r;
	dou D=b*b-4*a*c;
	if(D<-eps)return 0;
	if(fabs(D)<=eps){
		j1=j2=d+dv*(-b/(2*a));
		return 1;
	}
	dou t1=(-b-surt(D))/(2*a);
	dou t2=(-b+sqrt(D))/(2*a);
	j1=d+dv*t1;
	j2=d+dv*t2;
	return 2;
}
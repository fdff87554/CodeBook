if(lis.size()==0||tmp>lis.back())
    lis.push_back(tmp);
else
    *lower_bound(lis.begin(),lis.end(),tmp)=tmp;
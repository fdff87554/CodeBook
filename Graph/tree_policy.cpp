#include <ext/pb_ds/assoc_container.hpp>
#include <ext/pb_ds/tree_policy.hpp>
//或者直接用
#include <bits/extc++.h>

using namespace std;
using namespace __gnu_pbds;

tree<double, null_type, greater<double>, rb_tree_tag, tree_order_statistics_node_update> T;
//第一個參數是數據類型
//第二個要填null_type，低版本編譯器填null_mapped_type
//第三個填比較函數 std::greater<> or std::less<> or cmp
//第四個填樹的類型，有rb_tree_tag紅黑樹和splay_tree_tag
//第五個是為了支持查詢第k大和排名的一個參數 tree_order_statistics_node_update

T.insert(x + i * 1e-6);	 //插入一個數
T.erase(T.lower_bound(x));  //刪除一個數
printf("%d\n", (int)T.order_of_key(x) + 1);  //查詢一個數的排名
printf("%d\n", (int)*T.find_by_order(x - 1));
//查詢第k小的數, 返回的是一個迭代器, 這里k是從0開始算的，意思是最小的數是第0小的
printf("%d\n", (int)round(*(-- T.lower_bound(x))));  //查詢一個數的前驅
printf("%d\n", (int)round(*T.lower_bound(x + 1)));  //查詢一個數的后繼
#include <ext/pb_ds/assoc_container.hpp>
#include <ext/pb_ds/tree_policy.hpp>

#include <bits/extc++.h>

using namespace std;
using namespace __gnu_pbds;

tree<double, null_type, greater<double>, rb_tree_tag, tree_order_statistics_node_update> T;

T.insert(x + i * 1e-6);
T.erase(T.lower_bound(x));
printf("%d\n", (int)T.order_of_key(x) + 1);
printf("%d\n", (int)*T.find_by_order(x - 1));
printf("%d\n", (int)round(*(-- T.lower_bound(x))));
printf("%d\n", (int)round(*T.lower_bound(x + 1)));
#include <bits/stdc++.h>

using namespace std;

// Containers
vector<data_type> variable_name;
    // Tools of containers
    .size();        // vector size
    .capacity();    // vector memory size
    .clear();
    .push_back();
    .pop_back();
    .at();
    .begin();
    .end();
    .erase(iterator);
queue<data_type> variable_name;
    .push();
    .pop();
    .front();
    .back();
    .size();
        int main(){
            queue<int> q;   // 一個空的 queue
            q.push(10);
            q.push(20);
            q.push(30);     // [10, 20, 30]

            cout << q.front() << endl;  // 10
            cout << q.back() << endl;   // 30

            q.pop();                    // [20, 30]
            cout << q.size() << endl;   // 2
        }
stack<data_type> variable_name;
    .push();
    .pop();
    .top();
        int main(){
            stack<int> s;
            s.push(10);     //  | 30 |
            s.push(20);     //  | 20 |   疊三個盤子
            s.push(30);     //  |_10_|   10 在最下面
            for(int i=0 ; i<s.size() ; i++){    // s.size() = 3
                cout << s.top() << endl;
                s.pop();
            }                                   // 輸出 30, 20, 10
        }
set<data_type> variable_name;
    .insert();
    .erase();
    .count();
        int main(){
            set<int> mySet;
            mySet.insert(20);   // mySet = {20}
            mySet.insert(10);   // mySet = {10, 20}
            mySet.insert(30);   // mySet = {10, 20, 30}
            cout << mySet.count(20) << endl;    // 存在 -> 1
            cout << mySet.count(100) << endl;   // 不存在 -> 0
            mySet.erase(20);                    // mySet = {10, 30}
            cout << mySet.count(20) << endl;    // 0
        }
map<data_type, data_type> variable_name;
    .at();
    .count();
        int main(){
            map<string, int> m;     // 從 string 對應到 int
                                // 設定對應的值
            m["one"] = 1;       // "one" -> 1
            m["two"] = 2;       // "two" -> 2
            m["three"] = 3;     // "three" -> 3

            cout << m.count("two") << endl;     // 1 -> 有對應
            cout << m.count("ten") << endl;     // 0 -> 沒有對應
        }
list<data_type> variable_name;
    .push_front();
    .push_back();
    .pop_front();
    .pop_back();
    .remove();
    .swap();
    .sort();
pair<data_type, data_type> variable_name;
// Tools of containers
.size();
.clear();
// Algorithms
// small to big
sort(array_begin, array_least);
// big to small
sort(array_begin, array_least, greater()<data_type> );
swap(a, b);
min(a, b);
max(a, b);
// Iterators
iterators variable = Constainer_name.begin();

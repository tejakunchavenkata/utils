#include <iostream>
#include <vector>

using namespace std;
void show (vector<int> data) {
        for (vector<int>::size_type i=0; i<data.size(); i++) {
                cout << data[i] << endl;
        }
}

int main () {
        vector<int> vec;
        vector<int>::size_type s;
        vec.push_back(1);
        for (s=0; s<vec.size(); s++) {cout << vec[s] << endl;}
        return 0;
}

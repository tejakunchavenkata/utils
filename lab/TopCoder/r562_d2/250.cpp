#include <iostream>
#include <algorithm>
#include <vector>
#include <string>

using namespace std;

struct myclass {
  bool operator() (int i,int j) { return (i<j);}
} myobject;

class CucumberMarket {
        public:
        string check (vector <int> price, int budget, int k) {
                int sum = 0;
                sort (price.begin(), price.end());
                //for (vector<int>::iterator it = price.begin(); it != price.end(); it++) cout << *it << '\n';
                for (vector<int>::iterator it = price.end() - 1; k>0; it--, k--) {
                        sum += *(it);
                }
                if (sum <= budget) return "YES"; else return "NO";
        }
};

int main () {
        CucumberMarket c;

        int ps[] = {1000,1,10,100}; // "NO"
        int b = 1109;
        int k = 3;
        vector <int> myPs (ps, ps+4);
        
        //int ps[] = {33,4}; // "YES"
        //int b = 33;
        //int k = 1;
        //vector <int> myPs (ps, ps+2);
        
        //int ps[] = {1,1,1,1,1,1}; // "NO"
        //int b = 2;
        //int k = 4;
        //vector <int> myPs (ps, ps+6);
        
        //int ps[] = {1000,1000,1000,1000,1000,1000,1000,1000,1000}; //"YES"
        //int b = 10000;
        //int k = 9;
        //vector <int> myPs (ps, ps+9);

        cout << c.check (myPs, b, k) << '\n';

        return 0;
}

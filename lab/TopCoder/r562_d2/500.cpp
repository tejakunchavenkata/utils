#include <iostream>
#include <algorithm>
#include <vector>
#include <string>

using namespace std;

class PastingPaintingDivTwo {
        public:
        long long countColors(vector <string> clipboard, int T) {
                long long cnt = 0;
                int h = clipboard.size();
                int l = clipboard[0].length();

                cout << h << ' ' << l << '\n';
                return cnt;
        }
};

int main () {
        vector <string> cb;
        cb.push_back ("B...");
        cb.push_back ("....");
        cb.push_back ("....");
        cb.push_back ("...B");
        int k = 2; // 4

        /*
2)

    
{"BBB"}
10000
Returns: 30000

3)

    
{"."}
1000000000
Returns: 0

4)

    
{
"BB.",
".B."
}
100
Returns: 201

5)

    
{
"..........B..........",
".........B.B.........",
"........B...B........",
".......B.....B.......",
"......B..B.B..B......",
".....B...B.B...B.....",
"....B...........B....",
"...B...B.....B...B...",
"..B.....BBBBBB....B..",
".B..........BB.....B.",
"BBBBBBBBBBBBBBBBBBBBB"
}
1000000000
21000000071
*/
        class PastingPaintingDivTwo c;
        cout << c.countColors (cb, k) << '\n';

        return 0;
}

#include <inttypes.h>
#include <iostream>
#include <map>
#include <list>
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <vector>

using namespace std;

typedef pair < unsigned, unsigned > xy_t;

int main () {
  unsigned n, m;
  cin >> n >> m;

  char field[500][501];
  string buf;
  for (unsigned i=0; i<n; i++)
    cin >> field[i];

  //for (unsigned i=0; i<n; i++) cout << field[i] << '\n';
  
  unsigned q;
  cin >> q;
  xy_t myLoc;
  unsigned x1, y1, x2, y2;
  while (q--) {
    list < xy_t > scouts;
    cin >> x1 >> y1 >> x2 >> y2;
    scouts.push_back (xy_t (x1, y1));
    while (!scouts.empty() && field[x2-1][y2-1] == '.') {
      myLoc = scouts.front();

      if (myLoc.first + 1 <= x2 && field[myLoc.first][myLoc.second - 1] == '.')
        scouts.push_back (xy_t (myLoc.first + 1, myLoc.second));

      if (myLoc.second + 1 <= y2 && field[myLoc.first - 1][myLoc.second] == '.')
        scouts.push_back (xy_t (myLoc.first, myLoc.second + 1));
      
      field[myLoc.first - 1][myLoc.second - 1] = 'X';
      scouts.pop_front();
      //cout << "\033[H\033[2J"; 
      for (unsigned i=0; i<n; i++) cout << field[i] << '\n'; cout << "----------\n";
    }

    if (field[x2-1][y2-1] == '.')
      cout << "No\n";
    else
      cout << "Yes\n";

    //for (unsigned i=0; i<n; i++) cout << field[i] << '\n'; cout << "----------\n";
  }
  
  return 0;
}

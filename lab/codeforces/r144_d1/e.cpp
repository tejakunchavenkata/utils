#include <bitset>
#include <inttypes.h>
#include <iostream>
#include <map>
#include <list>
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string>
#include <string.h>
#include <vector>

#define MAX_N 500
#define MAX_M 512

using namespace std;

typedef pair < unsigned, unsigned > xy_t;

unsigned n, m, q;
bitset <MAX_M> field[MAX_N];

static void run (unsigned x1, unsigned y1, unsigned x2, unsigned y2) {
  bitset <MAX_M> virField[MAX_N];
  for (unsigned i=0; i<n; i++)
    virField[i] = field[i];

  list < xy_t > scouts; 
  scouts.push_back (xy_t (x1, y1));
  virField[x1 - 1][y1 - 1] = 'X';
    
  xy_t myLoc;
  while (!scouts.empty()) {
    myLoc = scouts.front();

    if (myLoc.first + 1 <= x2 && virField[myLoc.first][myLoc.second - 1]) {
      virField[myLoc.first][myLoc.second - 1] = 0;
      scouts.push_back (xy_t (myLoc.first + 1, myLoc.second));
    }

    if (myLoc.second + 1 <= y2 && virField[myLoc.first - 1][myLoc.second]) {
      virField[myLoc.first - 1][myLoc.second] = 0;
      scouts.push_back (xy_t (myLoc.first, myLoc.second + 1));
    }
      
    scouts.pop_front();
  }
}

int main () {
  unsigned x1, y1, x2, y2;

#ifdef DEBUGMODE

  n = m = MAX_N;
  for (unsigned i=0; i<n; i++)
    field[i] = 0;
  q = 600000;

#else
  
  string buf;
  cin >> n >> m;
  cin >> buf;
  for (unsigned i=0; i<n; i++) {
    cin >> buf;
    for (unsigned j=0; j<buf.length(); j++)
      buf[i] = buf[i] == '.' ? '1' : '0';

    field[i] = (bitset <MAX_M>) buf;
  }
  cin >> q;

#endif
  
  return 0;
}

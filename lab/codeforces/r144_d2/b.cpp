#include <inttypes.h>
#include <iostream>
#include <math.h>
#include <vector>
#include <map>
#include <stdlib.h>

#define ERROR 100
using namespace std;


inline unsigned s_x (uint64_t x) {
  unsigned s = 0;
  while (x) {
    s += x % 10;
    x /= 10;
  }
  return s;
}

int main () {
  uint64_t n;
  cin >> n;
 
  uint64_t x = sqrt(n);
  x = x-ERROR > 0 ? x-ERROR : 0;
  for (int i=0; i<(ERROR<<1); i++, x++)
    if (n == x*(x+s_x(x))) {
      cout << x << '\n';
      return 0;
    }
  
  cout << "-1\n";
  return 0;
}

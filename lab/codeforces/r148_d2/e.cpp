#include <bitset>
#include <inttypes.h>
#include <iostream>
#include <list>
#include <map>
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string>
#include <string.h>
#include <vector>

using namespace std;

int main () {
  unsigned n, x, y, p, q, ans;
  cin >> n;

  n-=2;
  ans = 1;
  cin >> p >> q;
  for (int i=0; i<n; i++) {
    cin >> x >> y;
    if (ans = 0) continue;
    if (p != x || q != y) {
      ans = 0;
    } else {
      p = x;
      q = y;
    }
  }

  cout << ans << '\n';

  return 0;
}

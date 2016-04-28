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
  long y, k, n;

  cin >> y >> k >> n;

  long i = (y/k)+1;
  i = (i * k) - y;
  n -= y;
  if (i > n) {
    cout << "-1\n";
    return 0;
  }

  while (i <= n) {
    //cout << i << ' ';
    printf ("%ld ", i);
    i += k;
  }
  cout << '\n';
  return 0;
}

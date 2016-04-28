#include <iostream>

using namespace std;

inline long fact (unsigned n) {
  long f=1;
  while (n>1) {
    f *= n;
    n--;
  }
  return f;
}

inline long ncr (int n, int r) {
  r = r < n-r ? r : n-r;
  long den = fact (r), num=1;
  while (r > 0) {
    r--;
    num *= n-r;
  }
  return num / den;
}

int main () {
  for (int i=3; i<20; i++) {
    cout << i << " " << ncr (i, 3) << "\n";
  }
  return 0;
}

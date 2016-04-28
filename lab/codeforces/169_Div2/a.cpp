#include <iostream>

using namespace std;

int main () {
  long n, k, f, t, sol, curSol, i;

  cin >> n >> k;

  cin >> f >> t;
  if (t > k)
    sol = f - (t - k);
  else
    sol = f;

  for (i=1; i<n; i++) {
    cin >> f >> t;
    if (t > k)
      curSol = f - (t - k);
    else
      curSol = f;

    sol = sol > curSol ? sol : curSol;
  }

  cout << sol;
  return 0;
}

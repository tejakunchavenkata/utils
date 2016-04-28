#include <iostream>

using namespace std;

int main () {
  int n;
  cin >> n;

  if (n & 1) {
          cout << "-1";
  } else {
    for (unsigned int i=1; i<=n; i+=2)
      cout << i+1 << " " << i << " ";
  }

  cout << "\n";
  return 0;
}

#include <iostream>

using namespace std;

int main () {
  unsigned n, cnt=0, buf, b;
  
  cin >> n;
  for (unsigned i=0; i<n; i++) {
    buf = 0;
    cin >> b; if (b) buf++;
    cin >> b; if (b) buf++;
    cin >> b; if (b) buf++;
    if (buf>=2) cnt++;
  }

  cout << cnt << "\n";
  return 0;
}

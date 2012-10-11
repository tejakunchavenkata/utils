#include <iostream>
#include <stdio.h>
#include <stdlib.h>
#include <vector>

using namespace std;
unsigned n, l;

void solve (int d, vector < int > op) {
  cout << "." ;
  if (op.size() < n-2) {

    for (unsigned i=1; i<=l; i++) {
      op.push_back (i);
      solve (i-d, op);    
      op.pop_back ();
    }

  } else if (op.size() == n-2) {

    for (unsigned i=1; i<=l; i++) {
      if (i-d <= l && i-d > 0) {
        for (unsigned j=0; j<op.size(); j++)
          cout << op[j] << " ";
        cout << i << " " << i-d << "\n";
        exit (0);
      }
    }

  } else {

    cout << "\nFATAL\n";
    exit (1);

  }  
}

int main () {
  int d;
  cin >> n >> d >> l;

  vector < int > blank;
  solve (d, blank);

  cout << "-1\n";
  return 0;
}

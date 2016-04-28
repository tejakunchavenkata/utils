#include <iostream>
#include <stdio.h>
#include <stdlib.h>
#include <vector>

using namespace std;

int main () {
  int n, D, d, l;

  while (1) {

    cin >> n >> D >> l;
    if (n == -1) break;
    d = D;

    vector < int > op;
    int e; // Error
    for (int i=1; i; i++) {

      if (!d) break;
      //if ((d >= 1 && d <= l) || (d <= -1 && d >= -l)) break;

      if (d > 0) {

        e = d < l ? d : l;
        op.push_back (e);
        d -= e;
        if (!d) break;

        op.push_back (1);
        d += 1;
      } else {
        op.push_back (1);
        d -= 1;
        
        e = -d < l ? -d : l;
        op.push_back (e);
        d += e;
        if (!d) break;
      }

    }


    int rem_ele = n - op.size ();

    if (rem_ele < 0) {
      cout << "-1\n";
      continue;
    } else if (rem_ele & 1) {
    } else {
      while (rem_ele--)
        op.push_back (1);
    }

    printf ("%6d %6d %6d -- ", n, D, l);
    for (unsigned j=0; j<op.size(); j++)
      cout << op[j] << " ";
    cout << "\n";

  }
  return 0;
}
/*
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
*/

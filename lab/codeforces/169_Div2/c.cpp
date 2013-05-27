#include <iostream>
#include <list>
#include <vector>

using namespace std;

int main () {
  unsigned long n, q, x;
  list <unsigned long> arr;

  cin >> n >> q;
  for (unsigned long i=0; i<n; i++) {
    cin >> x;
    arr.push_back (x);
  }
  arr.sort();

  //for (list<unsigned long>::iterator it=arr.begin(); it!=arr.end(); ++it) cout << *it;
  
  unsigned long a, b;
  vector<unsigned long> weights (n+1, 0);

  for (unsigned long i=0; i<q; i++) {
    cin >> a >> b;
    for (;a<=b; a++) weights[a]++;
  }

  //for (unsigned long i=0; i<weights.size(); i++) cout << weights[i] << ' '; cout << '\n';

  // *************
  list <unsigned long> w;
  for (unsigned long i=1; i<weights.size(); i++) w.push_back (weights[i]);

  w.sort ();
  //for (list<unsigned long>::iterator it=w.begin(); it!=w.end(); ++it) cout << *it << ' '; cout << '\n';
  //for (list<unsigned long>::iterator it=arr.begin(); it!=arr.end(); ++it) cout << *it << ' '; cout << '\n';

  unsigned long sol=0;
  list<unsigned long>::iterator itx;
  for (list<unsigned long>::iterator it=arr.end(); it!=arr.begin(); ) {
    itx = w.end();
    --it;
    --itx;
    sol += (*it * *itx);
    //cout << *it << ' ' << *itx << '\n';
    w.pop_back();
  }

  cout << sol ;

  return 0;
}

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
  unsigned cnt[10];
  string cmd, subcmd;

  unsigned n, q, l, r;
  int CP, DP;

  cin >> n >> q;
  cin >> cmd;

  while (q--) {
    cin >> l >> r;

    subcmd = cmd.substr (l-1, r-l+1);
    CP = 0; DP = 1;
    for (int i=0; i<10; i++) cnt[i] = 0;

    while (CP < subcmd.length() && CP >= 0) {
      if (subcmd[CP] == '0') {
        cnt[subcmd[CP] - '0']++;
        subcmd.erase (CP, 1);
      } else if (subcmd[CP] > '0' && subcmd[CP] <= '9') {
        cnt[subcmd[CP] - '0']++;
        subcmd[CP]--;
        CP += DP;
      } else if (subcmd[CP] == '<') {
        DP = -1;
        if (CP+DP < 0 || CP+DP >= subcmd.length()) break;
        if (subcmd[CP+DP] == '<' || subcmd[CP+DP] == '>') subcmd.erase (CP, 1);
        CP += DP;
      } else if (subcmd[CP] == '>') {
        DP = 1;
        if (CP+DP < 0 || CP+DP >= subcmd.length()) break;
        if (subcmd[CP+DP] == '<' || subcmd[CP+DP] == '>') subcmd.erase (CP, 1);
        CP += DP;
      }
    }

    for (int i=0; i<10; i++) cout << cnt[i] << ' ';
    cout << '\n';
  }

  return 0;
}

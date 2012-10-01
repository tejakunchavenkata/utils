#include <iostream>
#include <math.h>
#include <vector>

using namespace std;

int calc ( long long num ) {
  int w = int(log10(num));
  int l = int(num/pow(10,w)), r = num%10;
  long long int cnt = 0;

  //cout << num << " ";
  if (l>r) {
    long long tmp = int(pow(10,w));
    num = max(tmp, num-r-1);
    l = int(num/pow(10,w)); r = num%10;
  }

  if (l<=r && w) {
    long long i=num/10, c=1;
    for (; i>10; i/=10)
      c *= 1 + i%10;
    cnt += c;
  }
  //cout << cnt << " ";

  while (--l)             // 3xxx(2*10*10): 2xx2, 1xx1
    cnt += pow(10,w-1);
  //cout << cnt << " ";

  if (w>=2)
    cnt += pow(10,w-1) - 1;
  //cout << cnt << " ";

  if (w)
    cnt += 9;
  //cout << cnt << " ";

  if (w==0)
    cnt += num;
  //cout << cnt << "\n";

  return cnt;
}

int main () {
  long long from = 1000, till = 1200;
  int cur, pre = calc(from);
  for (from++; from<=till; from++) {
    cur = calc(from);
    switch (cur-pre) {
      case 1:
        cout << "Incremented at  " << from << " " << cur << "\n";
        break;
      case 0:
        break;
      default:
        cout << "Error at " << from << " " << cur << "\n";
        return -1;
        break;
    }
    pre = cur;
  }
  return 0;
}

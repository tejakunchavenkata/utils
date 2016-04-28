#include <bitset>
#include <inttypes.h>
#include <iostream>
#include <list>
#include <map>
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <vector>

#define DIST 20

using namespace std;

inline uint64_t gcf (uint64_t x, uint64_t y) {
  uint64_t t;
  while (y) {
    t = x;
    x = y;
    y = t%y;
  }
  return x;
}

inline uint64_t lcm (uint64_t x, uint64_t y) {
  return (x * y / gcf (x,y));
}

inline uint64_t multigcf (vector<uint64_t> nums) {
  uint64_t x = nums[0];
  for (unsigned i=1; i<nums.size(); i++)
    x = gcf (x, nums[i]);
  return x;
}

inline uint64_t multilcm (vector<uint64_t> nums) {
  uint64_t x = nums[0];
  for (unsigned i=1; i<nums.size(); i++)
    x = lcm (x, nums[i]);
  return x;
}

inline int64_t max (int64_t x, int64_t y) {
  return x > y ? x : y;
}

int main () {
  uint64_t num, op = 1;
  cin >> num;

  for (unsigned i = max(1, num-DIST); i <= num; i++)
    for (unsigned j = max(1, num-DIST); j <= num; j++)
      for (unsigned k = max(1, num-DIST); k <= num; k++) {
        vector <uint64_t> nums;
        nums.push_back (i);
        nums.push_back (j);
        nums.push_back (k);
        op = max (op, multilcm (nums));
      }
 
  cout << op << '\n';
  return 0;
}

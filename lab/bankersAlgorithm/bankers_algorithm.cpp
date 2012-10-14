#include <iostream>
#include <vector>

#define NO_OF_PROCESSES 5
#define NO_OF_RESOURCES 3

using namespace std;

int main () {
  vector< vector<unsigned> > Max, Allocation, Need;
  vector< unsigned > Available, tmp;

  tmp.push_back (7); tmp.push_back (5); tmp.push_back (3); Max.push_back (tmp);
  tmp.push_back (3); tmp.push_back (2); tmp.push_back (2); Max.push_back (tmp);
  tmp.push_back (9); tmp.push_back (0); tmp.push_back (2); Max.push_back (tmp);
  tmp.push_back (2); tmp.push_back (2); tmp.push_back (2); Max.push_back (tmp);
  tmp.push_back (4); tmp.push_back (3); tmp.push_back (3); Max.push_back (tmp);

  tmp.push_back (0); tmp.push_back (1); tmp.push_back (0); Allocation.push_back (tmp);
  tmp.push_back (2); tmp.push_back (0); tmp.push_back (0); Allocation.push_back (tmp);
  tmp.push_back (3); tmp.push_back (0); tmp.push_back (2); Allocation.push_back (tmp);
  tmp.push_back (2); tmp.push_back (1); tmp.push_back (1); Allocation.push_back (tmp);
  tmp.push_back (0); tmp.push_back (0); tmp.push_back (2); Allocation.push_back (tmp);

  Available.push_back (3);
  Available.push_back (3);
  Available.push_back (2);

  for (unsigned i=0; i<NO_OF_PROCESSES; i++)
    for (unsigned j=0; j<NO_OF_RESOURCES; j++)
      Need[i][j] = Max[i][j] - Allocation[i][j];

  show (Need, NO_OF_PROCESSES, NO_OF_RESOURCES);

  return 0;
}

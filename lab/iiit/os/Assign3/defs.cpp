#include <iostream>
#include <dirent.h>
#include <pwd.h>
#include <grp.h>
#include <time.h>
#include <vector>
#include <string>
#include <queue>
#include <list>
#include <cstring>
#include <string.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <algorithm>
#include <time.h>
#include <stdio.h>
#include <stdlib.h>
#include <sstream>
#include <stdexcept>

using namespace std;

enum sortOn { NAME, SIZE, MTIME };

struct opts {
  bool   longList;
  bool   recursive;
  bool   listAll;
  bool   dirEntry;
  sortOn sortType; 
};

struct lsPacket {
  string name;
  struct stat info;
};

string IntToStr (int n) {
  ostringstream result;
  result << n;
  return result.str();
}

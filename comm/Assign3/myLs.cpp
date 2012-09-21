#include "defs.cpp"
#include "debug.cpp"
#include "comparators.cpp"
#include "phraseargs.cpp"
#include "longlist.cpp"

void display (vector <string> paths, opts o, string prefix);

void dispFiles (list <lsPacket> items, opts o) {
  switch (o.sortType) {
    case NAME:  items.sort (compareName);       break;
    case SIZE:  items.sort (compareSize);       break;
    case MTIME: items.sort (compareTime);       break;
    default:    cerr << "Unknown 'sortType'\n"; break;
  }
  
  if (o.longList)
    dispLongList (items);
  else
    for (list <lsPacket>::iterator it = items.begin(); it != items.end(); ++it) cout << it->name << " ";
}

void dispDirs (list <lsPacket> items, opts o) {
  for (list <lsPacket>::iterator it = items.begin(); it != items.end(); ++it) {
    cout << "\n" << it->name << ":\n";

    struct dirent **namelist;
    int n;

    n = scandir(it->name.c_str(), &namelist, 0, alphasort);
    if (n < 0)
      perror("scandir");
    else {
      vector <string> subPaths;
      while (n--) {
        if (not (! o.listAll && *(namelist[n]->d_name) == '.'))
          subPaths.push_back (namelist[n]->d_name);
        free(namelist[n]);
      }
      free(namelist);
      o.dirEntry = true;
      display (subPaths, o, it->name + '/');
    }
  }
}

void display (vector <string> paths, opts o, string prefix) {
  list <lsPacket> files, dirs;
  lsPacket obj;

  for (unsigned int i=0; i<paths.size(); i++) {
    if (lstat ((prefix + paths[i]).c_str(), &(obj.info)) == -1) {
      perror("stat");
      exit(EXIT_FAILURE);
    }
    obj.name = paths[i];
    //dispLsPacket (obj);

    switch (obj.info.st_mode & S_IFMT) {
      case S_IFDIR:    dirs.push_back(obj);        break;
      case S_IFREG:  //files.push_back(obj);       break;
      case S_IFIFO:  //slinks.push_back(obj)       break;
      case S_IFSOCK: //slinks.push_back(obj)       break;
      case S_IFBLK:  //slinks.push_back(obj)       break;
      case S_IFCHR:  //slinks.push_back(obj)       break;
      case S_IFLNK:    files.push_back(obj);       break;
      default:         cerr << "unknown?\n";       break;
    }
  }

  if (o.dirEntry) {
    for (list <lsPacket>::iterator it=dirs.begin(); it != dirs.end(); ++it)
      files.push_back(*it);
  }

  if (files.size()) {
    dispFiles (files, o);
    cout << "\n";
  }
  
  if (! o.dirEntry && dirs.size()) {
    dispDirs (dirs, o);
  }
}

int main (int argc, char* argv[]) {
  opts opt = {false, false, false, false, NAME};
  vector <string> paths = phraseArgs (argc, argv, &opt);

  // Display options
  // disp (paths, o);
  
  // Implications
  if (opt.dirEntry) opt.recursive = false;
  if (paths.size() == 0) paths.push_back(".");

  display (paths, opt, "");

  return (0);
}

#include "defs.cpp"
#include "debug.cpp"
#include "comparators.cpp"
#include "phraseargs.cpp"
#include "longlist.cpp"

void dispDirs (string prefix, string dirName, opts o);

vector <string> getDirContents (string dir, bool lAll) {
  struct dirent **namelist;
  int n = scandir (dir.c_str(), &namelist, 0, alphasort);

  if (n < 0) {
    cout << "scandir call failed on: " << dir << "\n" ;
    perror("scandir");
    exit (EXIT_FAILURE);
  } else {
    vector <string> subPaths;
    while (n--) {
      if (lAll || *(namelist[n]->d_name) != '.')
        subPaths.push_back (namelist[n]->d_name);
      free(namelist[n]);
    }
    free(namelist);
    reverse (subPaths.begin(), subPaths.end());
    return subPaths;
  }
}

list <lsPacket> getLsPackets (string prefix, vector <string> paths) {
  list <lsPacket> packets;
  lsPacket obj;

  for (unsigned int i=0; i<paths.size(); i++) {
    if (lstat ((prefix + paths[i]).c_str(), &(obj.info)) == -1) {
      cout << "Error on: " << prefix + paths[i] << "\n";
      perror("stat");
      exit(EXIT_FAILURE);
    }
    obj.name = paths[i];
    packets.push_back(obj);
  }
  return packets;
}

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

  cout << "\n";
}

void dispDirs (string prefix, string dirName, opts o) {
  //cout << "dispDirs:-\n\tprefix: " << prefix << "\n";
  list <lsPacket> contents = getLsPackets (prefix + dirName + '/', getDirContents (prefix + dirName, o.listAll));

  unsigned total = 0;
  for (list <lsPacket>::iterator it = contents.begin(); it != contents.end(); ++it) total += it->info.st_blocks;

  if (! o.longList) cout << "\n";
  cout << prefix + dirName << ":\ntotal " << (total>>1) << "\n";

  dispFiles (contents, o);

  if (o.recursive) {
    for (list <lsPacket>::iterator it = contents.begin(); it != contents.end(); ++it)
      if (S_IFDIR == (S_IFMT & (it->info.st_mode))) {
        string newPrefix = prefix + dirName + '/';
        //cout << "\nDEBUG recursing dispDirs: recursing in... -> " << prefix << " - " << it->name << "\n";
        dispDirs (newPrefix, it->name, o);
      }
  }
}

void display (vector <string> paths, opts o) {
  list <lsPacket> all, files, dirs;

  all = getLsPackets ("", paths);
  for (list <lsPacket>::iterator it = all.begin(); it != all.end(); ++it) {
    switch (it->info.st_mode & S_IFMT) {
      case S_IFDIR:    dirs.push_back(*it);        break;
      case S_IFREG: 
      case S_IFIFO: 
      case S_IFSOCK:
      case S_IFBLK: 
      case S_IFCHR: 
      case S_IFLNK:    files.push_back(*it);       break;
      default:         cerr << "unknown?\n";       break;
    }
  }

  if (o.dirEntry) {
    for (list <lsPacket>::iterator it=dirs.begin(); it != dirs.end(); ++it)
      files.push_back(*it);
  }

  if (files.size())
    dispFiles (files, o);

  if (! o.dirEntry && dirs.size()) {
    for (list <lsPacket>::iterator it=dirs.begin(); it != dirs.end(); ++it)
      dispDirs ("", it->name, o);
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

  display (paths, opt);
  return (0);
}

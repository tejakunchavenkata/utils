#ifndef _LONGLIST
#define _LONGLIST

/*
  S_IFMT     0170 000   bit mask for the file type bit fields
  S_IFSOCK   0140 000   socket                                 s
  S_IFLNK    0120 000   symbolic link                          l
  S_IFREG    0100 000   regular file                           -
  S_IFBLK    0060 000   block device                           b
  S_IFDIR    0040 000   directory                              d
  S_IFCHR    0020 000   character device                       c
  S_IFIFO    0010 000   FIFO                                   p
  
  S_ISUID    0004 000   set UID bit
  S_ISGID    0002 000   set-group-ID bit (see below)
  S_ISVTX    0001 000   sticky bit (see below)

  S_IRWXU      00 700   mask for file owner permissions
  S_IRUSR      00 400   owner has read permission
  S_IWUSR      00 200   owner has write permission
  S_IXUSR      00 100   owner has execute permission
  
  S_IRWXG      00 070   mask for group permissions
  S_IRGRP      00 040   group has read permission
  S_IWGRP      00 020   group has write permission
  S_IXGRP      00 010   group has execute permission
  
  S_IRWXO      00 007   mask for permissions for others (not in group)
  S_IROTH      00 004   others have read permission
  S_IWOTH      00 002   others have write permission
  S_IXOTH      00 001   others have execute permission
*/

string permissions (mode_t mode) {
  string perm;
  switch (mode & S_IFMT) {
    case S_IFBLK:  perm += 'b';         break;
    case S_IFCHR:  perm += 'c';         break;
    case S_IFDIR:  perm += 'd';         break;
    case S_IFIFO:  perm += 'p';         break;
    case S_IFLNK:  perm += 'l';         break;
    case S_IFREG:  perm += '-';         break;
    case S_IFSOCK: perm += 's';         break;
    default: cerr << "unknown?\n";      break;
  }
  
  if (mode & S_IRUSR) perm += 'r'; else perm += '-';
  if (mode & S_IWUSR) perm += 'w'; else perm += '-';
  if (mode & S_IXUSR) perm += 'x'; else perm += '-';
  if (mode & S_IRGRP) perm += 'r'; else perm += '-';
  if (mode & S_IWGRP) perm += 'w'; else perm += '-';
  if (mode & S_IXGRP) perm += 'x'; else perm += '-';
  if (mode & S_IROTH) perm += 'r'; else perm += '-';
  if (mode & S_IWOTH) perm += 'w'; else perm += '-';
  if (mode & S_IXOTH) perm += 'x'; else perm += '-';

  return perm;
}

inline string nom (unsigned i) {
  switch (i) {
    case  0: return (string) ("Jan");
    case  1: return (string) ("Feb");
    case  2: return (string) ("Mar");
    case  3: return (string) ("Apr");
    case  4: return (string) ("May");
    case  5: return (string) ("Jun");
    case  6: return (string) ("Jul");
    case  7: return (string) ("Aug");
    case  8: return (string) ("Sep");
    case  9: return (string) ("Oct");
    case 10: return (string) ("Nov");
    case 11: return (string) ("Dec");
    default: return (string) ("---");
  }
}

void dispLongList (list <lsPacket> items) {
  vector <vector <string> > op;
  vector <string> buf;
  vector <unsigned> length (9, 0);

  struct tm * mytm;
  char tstr[6];
  for (list <lsPacket>::iterator it = items.begin(); it != items.end(); ++it) {
    unsigned  i=0;
    mytm = localtime (&(it->info.st_mtime));
    sprintf (tstr, "%02d:%02d", mytm->tm_hour, mytm->tm_min);
    buf.push_back (permissions(it->info.st_mode));                      length[i] = length[i] > buf.back().length() ? length[i] : buf.back().length(); ++i;
    buf.push_back (IntToStr (it->info.st_nlink));                       length[i] = length[i] > buf.back().length() ? length[i] : buf.back().length(); ++i;
    buf.push_back ((string) getpwuid(it->info.st_uid)->pw_name);        length[i] = length[i] > buf.back().length() ? length[i] : buf.back().length(); ++i;
    buf.push_back ((string) getgrgid(it->info.st_gid)->gr_name);        length[i] = length[i] > buf.back().length() ? length[i] : buf.back().length(); ++i;
    buf.push_back (IntToStr (it->info.st_size));                        length[i] = length[i] > buf.back().length() ? length[i] : buf.back().length(); ++i;
    buf.push_back (IntToStr (1900 + mytm->tm_year));                    length[i] = length[i] > buf.back().length() ? length[i] : buf.back().length(); ++i;
    buf.push_back (nom (mytm->tm_mon));                                 length[i] = length[i] > buf.back().length() ? length[i] : buf.back().length(); ++i;
    buf.push_back (IntToStr (mytm->tm_mday));                           length[i] = length[i] > buf.back().length() ? length[i] : buf.back().length(); ++i;
    buf.push_back (tstr);                                               length[i] = length[i] > buf.back().length() ? length[i] : buf.back().length(); ++i;
    buf.push_back ((string) it->name);

    if ((S_IFMT & it->info.st_mode) == S_IFLNK) {
      char * linkname = (char*) malloc(it->info.st_size + 1);
      if (linkname == NULL) {
        cerr << "insufficient memory\n";
        exit(EXIT_FAILURE);
      }

      ssize_t r = readlink(it->name.c_str(), linkname, it->info.st_size + 1);
      if (r < 0) {
        perror("lstat");
        exit(EXIT_FAILURE);
      }
           
      linkname[it->info.st_size] = '\0';
      buf.back() += " -> " + (string) linkname;
    }

    op.push_back(buf);
    buf.clear();
  }

  /*
  for (unsigned i=0; i<length.size(); i++)
    cout << length[i] << " ";
  cout << "\n";
  */

  for (unsigned i=0; i<op.size(); i++) {
    buf = op[i];
    unsigned j=0;
    for (; j<buf.size() - 1; j++) {
      for (unsigned k=length[j]-buf[j].length(); k>0; k--)
        cout << " ";
      cout << buf[j] << " ";
    }
    cout << buf[j] << "\n";
  }
}

#endif

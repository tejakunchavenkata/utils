#ifndef _MY_DEBUG
#define _MY_DEBUG
/*
 * print the opts phrased
 */
void disp (vector<string> p, opts o) {
  cout << "longList : " << o.longList  << "\n";
  cout << "recursive: " << o.recursive << "\n";
  cout << "listAll  : " << o.listAll   << "\n";
  cout << "dirEntry : " << o.dirEntry  << "\n";
  cout << "sortType : " << o.sortType  << "\n";

  for (unsigned int i=0; i<p.size(); i++)
    cout << i << "\t" << p[i] << "\n";
}

/*
 * display stat struct
 */
void dispLsPacket (lsPacket* ptr) {
  cout << "Name      : " << ptr->name << "\n";            /* Name */
  //cout << "st_dev    : " << ptr->info.st_dev << "\n";     /* ID of device containing file */
  //cout << "st_ino    : " << ptr->info.st_ino << "\n";     /* inode number */
  //cout << "st_mode   : " << ptr->info.st_mode << "\n";    /* protection */
  //cout << "st_nlink  : " << ptr->info.st_nlink << "\n";   /* number of hard links */
  //cout << "st_uid    : " << ptr->info.st_uid << "\n";     /* user ID of owner */
  //cout << "st_gid    : " << ptr->info.st_gid << "\n";     /* group ID of owner */
  //cout << "st_rdev   : " << ptr->info.st_rdev << "\n";    /* device ID (if special file) */
  //cout << "st_size   : " << ptr->info.st_size << "\n";    /* total size, in bytes */
  //cout << "st_blksize: " << ptr->info.st_blksize << "\n"; /* blocksize for file system I/O */
  //cout << "st_blocks : " << ptr->info.st_blocks << "\n";  /* number of 512B blocks allocated */
  //cout << "st_atime  : " << ptr->info.st_atime << "\n";   /* time of last access */
  //cout << "st_mtime  : " << ptr->info.st_mtime << "\n";   /* time of last modification */
  //cout << "st_ctime  : " << ptr->info.st_ctime << "\n";   /* time of last status change */
}
#endif

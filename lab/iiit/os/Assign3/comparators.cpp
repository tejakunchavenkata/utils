#ifndef _COMPARATORS
#define _COMPARATORS

bool compareName (lsPacket p1, lsPacket p2) {
  for (unsigned i=0; i < p1.name.length() && i < p2.name.length(); i++) {
    if (tolower (p1.name[i]) < tolower (p2.name[i])) return true;
    if (tolower (p1.name[i]) > tolower (p2.name[i])) return false;
  }
  if (p1.name.length() < p2.name.length()) return true;
  return false;
}

bool compareSize (lsPacket p1, lsPacket p2) {
  if (p1.info.st_size > p2.info.st_size) return true;
  return false;
}

bool compareTime (lsPacket p1, lsPacket p2) {
  if (p1.info.st_mtime > p2.info.st_mtime) return true;
  return false;
}

#endif

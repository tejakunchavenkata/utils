#ifndef _PHRASEARGS
#define _PHRASEARGS
/*
 * phraseArgs
 */
vector<string> phraseArgs (int c, char* v[], opts* o) {
  vector <string> arg;
  for (int i=1; i<c; i++) {
    //cout << i << "\t" << argv[i] << "\n";
    if (*v[i] == '-') {
      for (char* j=1+v[i]; *j != '\0'; j++) {
        switch (*j) {
          case 'l': o->longList       = true;                           break;
          case 'R': o->recursive      = true;                           break;
          case 'a': o->listAll        = true;                           break;
          case 'd': o->dirEntry       = true;                           break;
          case 'S': o->sortType       = SIZE;                           break;
          case 't': o->sortType       = MTIME;                          break;
          default : cerr << "Ignoring unknown option: " << *j << "\n";  break;
        }
      }
    } else {
      arg.push_back(string(v[i]));
    }
  }
  return (arg);
}
#endif

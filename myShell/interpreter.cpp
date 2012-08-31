#ifndef INTERPRETER
#define INTERPRETER

int interpreter (char *buf, int n, char **a) {
  int i, nsplit=0;
  char *tbuf;

  while ((tbuf = strpbrk(buf, seperators)) != NULL) {
    if (*tbuf != '\t' && *tbuf != '\n' && *(tbuf-1) == '\\') {
      strcpy (tbuf-1, tbuf);
      if ((tbuf = strpbrk(tbuf+1, seperators)) == NULL)
        continue;
    }
    *tbuf = '\0';

    if (tbuf != buf) {
      a[nsplit++] = buf;
      if (nsplit == n - 1) break;
    }
    buf = ++tbuf;
  }

  return(nsplit);
}

#endif

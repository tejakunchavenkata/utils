#ifndef RC
#define RC

int loadRc (void) {
  FILE *fp;
  char *line = NULL, *varName = NULL, *varVal = NULL, *ptr = NULL;
  size_t len = 0;
  ssize_t read;

  char rcFile[PATH_MAX];
  strcpy (rcFile, getenv("HOME"));
  strcpy (rcFile + strlen(rcFile), "/.shellrc");

  fp = fopen(rcFile, "r");
  if (fp == NULL) {
    printf ("Failed to Open %s\n", rcFile);
    return(EXIT_FAILURE);
  }

  while ((read = getline(&line, &len, fp)) != -1) {
    varName = line;
    if ((varName = strpbrk(line, nameStrtCh)) == NULL) continue;
    if ((ptr = strpbrk(line, spaceCh)) == NULL) continue;
    *(ptr++) = '\0';
    if ((varVal  = strpbrk(ptr, valStrtCh))  == NULL) continue;
    if ((ptr = strpbrk(ptr, spaceCh)) == NULL) continue;
    *(ptr++) = '\0';
    if (setenv (varName, varVal, 1) == -1) {
      printf ("Error while setting %s : %s", varName, varVal);
      continue;
    }
    //printf ("Value of %s : %s\n", varName, getenv(varName));
  }

  free(line);
  fclose(fp);
  return(EXIT_SUCCESS);
}

#endif

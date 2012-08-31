#include "def.cpp"
#include "globs.cpp"
#include "interpreter.cpp"
#include "rc.cpp"

using namespace std;

class history {
private:
  queue<string> cmds;
public:
  void insert (char *buf) {
    if (cmds.size() == 10 )
      cmds.pop();
    cmds.push(buf);
  }

  void show (void ) {
    queue<string> tmp = cmds;
    while (!tmp.empty()) {
     printf ("%s\n", tmp.front());
     tmp.pop();
    }
  }
};

int main (int argc, char *arg[]) {
  int pid;
  string shName = "Vj84529: ";  // Shell Name
  char cmdBuf[BUFSIZ];          // 8192
  char cwd[PATH_MAX];           // 4096
  char *cmdArgs[MAXARGS];       // 64
  int status, n;
  history H;

  //printf ("%d %d %d\n", BUFSIZ, PATH_MAX, MAXARGS); return (0);
  status = loadRc();
  
  for (;;) {
    // Prompt
    getcwd(cwd, PATH_MAX);
    cout << shName << cwd << ": ";

    // get Cmd
    if (fgets(cmdBuf, sizeof(cmdBuf), stdin) == NULL) {
      putchar('\n');
      exit(0);
    }
    
    H.insert(cmdBuf);
    n = interpreter (cmdBuf, MAXARGS, cmdArgs);
    if (n == 0) continue;
    cmdArgs[n] = NULL;

    if (0 == strcmp ("exit", cmdArgs[0])) {
      if (cmdArgs[1] == NULL)
        return (0);
      else
        return (atoi(cmdArgs[1]));
    } else if (0 == strcmp ("cd", cmdArgs[0])) {
      chdir (cmdArgs[1]);
    } else if (0 == strcmp ("pwd", cmdArgs[0])) {
      printf ("%s\n", cwd);
    } else if (0 == strcmp ("echo", cmdArgs[0])) {
      if (getenv(cmdArgs[1]) == NULL) {
        printf ("No environment variable exists with given name: %s\n", cmdArgs[1]);
      } else {
        printf ("%s\n", getenv(cmdArgs[1]));
      }
    } else {
      if (pid = fork() > 0) { // parent continues here
        //waitpid(pid, &status, 0); // To get printing done before shell prompt shows
        wait(NULL);
      } else if (pid == 0) { // child got here!
        execvp (cmdArgs[0], cmdArgs);
      } else { // only if there was a problem with fork
        exit(-1);
      }
    }
  }
  cout << endl;
  return 0;
}

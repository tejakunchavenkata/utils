#include <stdio.h>
#include <string.h>
#include <pthread.h>
#include <stdlib.h>
#include <unistd.h>

#define MAX_ITRS 9
#define STEP 1000000

pthread_mutex_t xLock, yLock;
int x, y;

void * procA () {
  int flag = MAX_ITRS, step;
  while (flag--) {
    printf ("A: Incrementing x\n");
    pthread_mutex_lock (&xLock);
      for (step = STEP; step > 0; step--) x++;
    pthread_mutex_unlock (&xLock);

    pthread_mutex_lock (&yLock);
      printf ("A: Reading y: %d\n", y);
    pthread_mutex_unlock (&yLock);
  }
}

void * procB () {
  int flag = MAX_ITRS, step;
  while (flag--) {
    pthread_mutex_lock (&xLock);
      printf ("B: Reading x: %d\n", x);
    pthread_mutex_unlock (&xLock);

    pthread_mutex_lock (&yLock);
      printf ("B: Incrementing y\n");
      for (step = STEP; step > 0; step--) y++;
    pthread_mutex_unlock (&yLock);
  }
}

int main () {
  pthread_t tid[2];

  if (pthread_mutex_init (&xLock, NULL) != 0) return 1;
  if (pthread_mutex_init (&yLock, NULL) != 0) { pthread_mutex_destroy (&xLock); return 1; }
  
  pthread_create ((tid+0), NULL, procA, NULL);
  pthread_create ((tid+1), NULL, procB, NULL);

  pthread_join (tid[0], NULL);
  pthread_join (tid[1], NULL);
  
  pthread_mutex_destroy (&xLock);
  pthread_mutex_destroy (&yLock);

  return 0;
}

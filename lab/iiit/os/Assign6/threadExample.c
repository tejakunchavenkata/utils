#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#define NUM_THREADS 5

void *PrintHello (void *threadid) {
   long tid;
   unsigned i;
   tid = (long)threadid;
  /* 
   for (i=0; i<10; i++) {
     printf("thread #%ld! (%d)\n", tid, i);
   }
   */
   while (1) { tid = tid; sleep (1); }
   printf ("Thread %ld not cancelled\n", tid);
   pthread_exit(NULL);
}

int main (int argc, char *argv[]) {
   pthread_t threads[NUM_THREADS];
   int rc;
   long t;
  
   for(t=0; t<NUM_THREADS; t++) {
      printf("In main: creating thread %ld\n", t);
      rc = pthread_create(&threads[t], NULL, PrintHello, (void *)t);
      if (rc){
         printf("ERROR; return code from pthread_create() is %d\n", rc);
         exit(-1);
      }
   }

   //sleep (10);
   for(t=0; t<NUM_THREADS; t++) {
     pthread_cancel (threads[t]);
     pthread_join (threads[t], NULL);
     printf ("Thread %ld joined\n", t);
   }

   /* Last thing that main() should do */
   pthread_exit(NULL);
}

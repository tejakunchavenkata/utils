#include <pthread.h>
#include <stdlib.h>
#include <stdio.h>
#include <time.h>

int acc1Bal, acc2Bal;

void *pull2A (void *t) {
  unsigned counter = 0, temp1, temp2, amount;
  //pthread_setcancelstate(PTHREAD_CANCEL_ENABLE, NULL);
  do {
    temp1 = acc1Bal;
    temp2 = acc2Bal;
    amount = rand();
    acc1Bal = temp1 - amount;
    acc2Bal = temp2 + amount;
    counter++;
    //printf ("pull2A: acc1Bal %-32d acc2Bal %-32d counter %-32d\n", acc1Bal, acc2Bal, counter);
  } while (acc1Bal + acc2Bal == 0 && counter < 1000000);
  printf ("Exiting pull2A\tCounter: %-32u acc1Bal: %-32d acc2Bal: %-32d\n", counter, acc1Bal, acc2Bal);
  pthread_exit (NULL);
}

void *pull2B (void *t) {
  unsigned counter = 0, temp1, temp2, amount;
  //pthread_setcancelstate(PTHREAD_CANCEL_ENABLE, NULL);
  do {
    temp1 = acc1Bal;
    temp2 = acc2Bal;
    amount = rand();
    acc1Bal = temp1 + amount;
    acc2Bal = temp2 - amount;
    counter++;
    //printf ("pull2B: acc1Bal %-32d acc2Bal %-32d counter %-32d\n", acc1Bal, acc2Bal, counter);
  } while (acc1Bal + acc2Bal == 0 && counter < 1000000);
  printf ("Exiting pull2B\tCounter: %-32u acc1Bal: %-32d acc2Bal: %-32d\n", counter, acc1Bal, acc2Bal);
  pthread_exit (NULL);
}

int main (int argc, char *argv[]) {
   acc1Bal = acc2Bal = 0;
   pthread_t threads[2];
   struct timespec wait_time = {1, 0};
   
   int rc;
   rc = pthread_create ((threads+0), NULL, pull2A, (void *)(threads+0));
   if (rc) {
     printf ("ERROR; return code from pthread_create() is %d\n", rc);
     exit (-1);
   }

   rc = pthread_create ((threads+1), NULL, pull2B, (void *)(threads+1));
   if (rc) {
     printf ("ERROR; return code from pthread_create() is %d\n", rc);
     exit (-1);
   }

/*
   while (1) {
     if (0 == pthread_timedjoin_np (threads[0], NULL, &wait_time)) {
       rc = pthread_cancel (threads[1]);
       printf ("Thread 1 Cancelled with status %d\n", rc);
       printf ("Trying to Join Thread 1\n");
       pthread_join (threads[1], NULL);
       printf ("Joined Thread 1\n");
       break;
     }
     if (0 == pthread_timedjoin_np (threads[1], NULL, &wait_time)) {
       pthread_cancel (threads[0]);
       printf ("Thread 0 Cancelled with status %d\n", rc);
       printf ("Trying to Join Thread 0\n");
       pthread_join (threads[0], NULL);
       printf ("Joined Thread 0\n");
       break;
     }
   }
   printf ("Threads should have joined by now\n");
*/

   pthread_exit (NULL);
}

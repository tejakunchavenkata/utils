#include <stdio.h>
#include <string.h>
#include <pthread.h>
#include <stdlib.h>
#include <unistd.h>
#include <time.h>
#include <semaphore.h>

#define N 90                    // Number of Patrons
#define C 10                    // Number of Seats
#define T 5                     // Number of Shows
#define MAX_SLEEP_TME 4
#define MIN_SLEEP_TME 2
#define SHOW_LENGTH 0

pthread_t patron[N], theaterMan;
pthread_mutex_t Entrance, Exit;
sem_t Seats;

void wander () { sleep (MIN_SLEEP_TME + (rand() % MAX_SLEEP_TME)); }

void *patronJob (void *id) {
  long myNo = (long)id;
  int gotSeat;
  
  while (1) {
    // Wander until entrance is open
    do {
      wander ();
    } while (0 != pthread_mutex_trylock (&Entrance));
    printf ("%-16ld: %-6ld: Got lock on Entrance\n", time (NULL), myNo);

    // Try to get a Seat
    gotSeat = sem_trywait (&Seats);

    // Release Entrance
    pthread_mutex_unlock (&Entrance);
    printf ("%-16ld: %-6ld: Released lock on Entrance\n", time (NULL), myNo);

    if (gotSeat == 0) {
      printf ("%-16ld: %-6ld: Got a Seat\n", time (NULL), myNo);

      // No way out Until show finishes
      pthread_mutex_lock (&Exit);
      printf ("%-16ld: %-6ld: Exit is Open\n", time (NULL), myNo);

      // run like hell...
      sem_post (&Seats);

      // ...out of the door
      pthread_mutex_unlock (&Exit);
      printf ("%-16ld: %-6ld: Out of Hall\n", time (NULL), myNo);
    } else {
      printf ("%-16ld: %-6ld: Failed to get a seat\n", time (NULL), myNo);
    }
  }
}

void *theaterManJob (void *id) {
  int i, emptySeats = C;

  for (i=0; i<T; i++) {
    // Open Entrance
    pthread_mutex_unlock (&Entrance);
    printf ("%-16ld: %-6s: Opened the Entrance\n", time (NULL), "Owner");
    
    // Wait until theater is full
    while (emptySeats > 0) {
      sem_getvalue (&Seats, &emptySeats);
      sleep (2);
    }
    printf ("%-16ld: %-6s: Theater is full\n", time (NULL), "Owner");

    // Close Entrance
    pthread_mutex_lock (&Entrance);
    
    printf ("%-16ld: %-6s: Show %d Started\n", time (NULL), "Owner", i);
    // Show time
    sleep (SHOW_LENGTH);
    printf ("%-16ld: %-6s: Show %d finished\n", time (NULL), "Owner", i);

    // Open Exit
    pthread_mutex_unlock (&Exit);
    printf ("%-16ld: %-6s: Opened Exit\n", time (NULL), "Owner");

    // Wait until theater is empty
    while (emptySeats < C) {
      sem_getvalue (&Seats, &emptySeats);
      sleep (2);
    }
    printf ("%-16ld: %-6s: Theater is empty\n", time (NULL), "Owner");

    // Close Exit
    pthread_mutex_lock (&Exit);
    printf ("%-16ld: %-6s: Closed Exit\n", time (NULL), "Owner");
  }
}

int main (void) {
  int i;

  srand (time(NULL));

  // Build Theater
  sem_init (&Seats, 0, C);
  pthread_mutex_init (&Entrance, NULL);
  pthread_mutex_init (&Exit, NULL);

  // Theater not yet opened
  pthread_mutex_lock (&Entrance);
  pthread_mutex_lock (&Exit);

  // Appoint a theater man
  pthread_create (&theaterMan, NULL, theaterManJob, NULL);

  // Populate the mall & broadcast Teaser
  for (i=0; i<N; i++)
    pthread_create ((patron+i), NULL, patronJob, (void *)(long)i);

  // Show time finished
  pthread_join (theaterMan, NULL);

  // Patrons are no more needed
  for (i=0; i<N; i++) {
    pthread_cancel (patron[i]);
    pthread_join (patron[i], NULL);
  }

  // DoomsDay!!! Theater Destroyed!!!
  sem_destroy (&Seats);
  pthread_mutex_destroy (&Entrance);
  pthread_mutex_destroy (&Exit);

  return 0;
}

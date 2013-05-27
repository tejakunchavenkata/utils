Items used for synchronization...


        PART A

                To create a thread...
                        pthread_create ((tid+1), NULL, procB, NULL);

                To exit a thread...
                        pthread_exit (NULL);

XXX             To send cancel request to a thread...
                        pthread_cancel (threads[0]);

XXX             To enable or disable cancellation of a thread...
                        pthread_setcancelstate(PTHREAD_CANCEL_ENABLE, NULL);

                To join a thread with other thread...
                        pthread_join (tid[1], NULL);

XXX             To try joining thread for some time and exit if not possible until then...
                        pthread_timedjoin_np (threads[1], NULL, &wait_time);


        PART B

                To initialize a mutex...
                        pthread_mutex_init (&xLock, NULL);

                To destroy a mutex...
                        pthread_mutex_destroy (&xLock);

                To lock a mutex...
                        pthread_mutex_lock (&yLock);

                To unlock a mutex...
                        pthread_mutex_unlock (&yLock);



XXX: Not used in final solution

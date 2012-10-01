#include<iostream>
using namespace std;

int main () {
        unsigned short i;
        char chararr[5] = {'A', 'B', 'C', 'D', 'E'};
        for (i = 0; i < 5; i++ ) {
                printf ("%c\n", *(chararr+i));
        }
        unsigned int *intarr = int* (chararr);
        for (i = 0; i < 5; i++ ) {
                printf ("%c\n", *(intarr+i));
        }
        return 0;
}

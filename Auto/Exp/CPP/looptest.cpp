#include <iostream>
#include <ctime>

using namespace std;

int main () {
        int a, b, i, j;
        time_t start, end;

        time(&start);
        for (i=0; i<10; i++) {
                for (j=0; j<1000000000; j++) {
                        a = i * j;
                }
        }
        time(&end);
        cout << difftime(end, start) << endl;
        time(&start);
        for (i=0; i<1000000000; i++) {
                for (j=0; j<10; j++) {
                        b = i * j;
                }
        }
        time(&end);
        cout << difftime(end, start) << endl;
        cout << a << " " << b << endl;
        return 0;
}

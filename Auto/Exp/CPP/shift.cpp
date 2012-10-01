#include <iostream>

using namespace std;

int main () {
        unsigned int a = 0x12345678;
        unsigned b = (a & 0xFF000000);
        printf ("0x%X \t 0x%X\n", a, b);
        return 0;
}

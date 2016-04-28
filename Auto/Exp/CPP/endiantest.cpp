#include <iostream>

using namespace std;

union IntOrChar {
        unsigned char arr[8];
        unsigned long int integer;
};

int main () {
        IntOrChar element;
        element.integer = 0x0123456789ABCDEF;
        printf("%02X %02X %02X %02X %02X %02X %02X %02X\n",element.arr[7], element.arr[6], element.arr[5], element.arr[4], element.arr[3], element.arr[2], element.arr[1], element.arr[0]);
        element.arr[0] = 0x10;
        element.arr[1] = 0x32;
        element.arr[2] = 0x54;
        element.arr[3] = 0x76;
        element.arr[4] = 0x98;
        element.arr[5] = 0xBA;
        element.arr[6] = 0xDC;
        element.arr[7] = 0xFE;
        cout << element.integer << endl;
        return 0;
}

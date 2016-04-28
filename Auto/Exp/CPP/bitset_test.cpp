#include <bitset>
#include <iostream>
#include <limits>

using namespace std;

int main () {
        cout << "int:\t" << sizeof(int) << endl;
        cout << "long:\t" << sizeof(long int) << endl;
        cout << "1: " << sizeof(bitset<1>) << endl;
        cout << "64: " << sizeof(bitset<64>) << endl;
        cout << "65: " << sizeof(bitset<65>) << endl;
        cout << "128: " << sizeof(bitset<128>) << endl;
        cout << "129: " << sizeof(bitset<129>) << endl;
        return 0;
}

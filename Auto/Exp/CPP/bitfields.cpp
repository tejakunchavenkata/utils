#include <iostream>

using namespace std;

class under_test {
        private:
                union pointer {
                        struct pointer_element {
                                unsigned offset : 3;
                                unsigned byte   : 22;
                                unsigned unused : 7;
                        } field;
                        unsigned addr;
                };
        public:
                int run () {
                        pointer my_pointer;
                        my_pointer.field.byte = 0;
                        my_pointer.field.offset = 0;
                        cout << sizeof(my_pointer) << "\n";
                        cout << sizeof(pointer) << "\n";
                        cout << my_pointer.field.byte << "\t" << my_pointer.field.offset << "\t" << my_pointer.addr++ << "\n";
                        cout << my_pointer.field.byte << "\t" << my_pointer.field.offset << "\t" << my_pointer.addr++ << "\n";
                        cout << my_pointer.field.byte << "\t" << my_pointer.field.offset << "\t" << my_pointer.addr++ << "\n";
                        cout << my_pointer.field.byte << "\t" << my_pointer.field.offset << "\t" << my_pointer.addr++ << "\n";
                        cout << my_pointer.field.byte << "\t" << my_pointer.field.offset << "\t" << my_pointer.addr++ << "\n";
                        cout << my_pointer.field.byte << "\t" << my_pointer.field.offset << "\t" << my_pointer.addr++ << "\n";
                        cout << my_pointer.field.byte << "\t" << my_pointer.field.offset << "\t" << my_pointer.addr++ << "\n";
                        cout << my_pointer.field.byte << "\t" << my_pointer.field.offset << "\t" << my_pointer.addr++ << "\n";
                        cout << my_pointer.field.byte << "\t" << my_pointer.field.offset << "\t" << my_pointer.addr++ << "\n";
                        cout << my_pointer.field.byte << "\t" << my_pointer.field.offset << "\t" << my_pointer.addr++ << "\n";
                        return 0;
                }                
};

int main () {
        under_test *my_pointer = new(under_test);
        my_pointer->run();
        return 0 ;
}

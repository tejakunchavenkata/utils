#include <iostream>

using namespace std;

int main () {
	char Buf[128] = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa";
	scanf ("%[^,]", Buf);
	printf ("%s\n", Buf);
	return 0;
}

#include <iostream>
#include <math.h>

using namespace std;

int main () {
	int i, j, m, n, root;
	int primes[700000] = {3}, ps = 1;
	m = 1;
	n = 10000000;
	
	switch (m) {
		case 1:	;
		case 2:	printf ("2\n");
		case 3:	printf ("3\n");
		default: ;
	}
	
	if (m & 1 == 0)	m++;
	if (m < 5)		m=5;

	for (i=m; i<=n; i+=2) {
		root = int (sqrt(i));
		for (j=0; primes[j]<=root; j++)
			if (i%primes[j] == 0)
				break;

		if (primes[j] > root) {
			primes[ps] = i;
			ps++;
			printf ("%d\n",i);
		}
	}
					
	return 0;
}

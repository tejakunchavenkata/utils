#include <iostream>
#include <vector>
#include <string.h>

using namespace std;

vector<unsigned long> primes;

void get_primes (unsigned long max){
    char *sieve;
    sieve = new char[max/8+1];
    memset(sieve, 0xFF, (max/8+1) * sizeof(char));
    for(unsigned long x = 2; x <= max; x++)
        if(sieve[x/8] & (0x01 << (x % 8))){
            primes.push_back(x);
            for(unsigned long j = 2*x; j <= max; j += x)
                sieve[j/8] &= ~(0x01 << (j % 8));
        }
    delete[] sieve;
}

unsigned no_of_primes_between (unsigned a, unsigned b) {
  unsigned cnt = 0;
  
  for (unsigned i=0; i<primes.size(); i++) {
    if (primes[i] > b) break;
    if (primes[i] >= a) cnt++;
  }
  
  return cnt;
}

int main(void){
    unsigned a, b, k;
    cin >> a >> b >> k;
    get_primes (b);
    
    unsigned l, x;
    for (l = 1; l <= b - a + 1; l++) {
      for (x = a; x <= b - l + 1; x++) {
        if (no_of_primes_between (x, x+l-1) < k) break;
      }
      if (x > b-l+1) {
        cout << l << '\n';
        return 0;
      }
    }
    
    cout << -1 << '\n';
    return 0;
}

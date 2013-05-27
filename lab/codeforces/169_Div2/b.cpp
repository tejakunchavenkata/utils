#include <iostream>
#include <string>

using namespace std;

inline bool isPalindrome (unsigned* cnt, unsigned len) {
  unsigned uCharCnt=0, adamCnt=0;

  for (unsigned x=0; x<26; x++) {
   if (*(cnt+x)) uCharCnt++;
   adamCnt += cnt[x] & 1;
  }

  if (uCharCnt == 1) return 1;

  if (len & 1) {
    if (adamCnt == 1) return 1; else return 0;
  } else {
    if (adamCnt == 0) return 1; else return 0;
  }
}

int main () {
  string str;
  unsigned Cnt[26] = {0}, Len;

  cin >> str;

  Len = str.length();
  for (unsigned y=0; y<str.length(); y++) Cnt[str[y]-'a']++;
  //for (unsigned y=0; y<26; y++) cout << char (y+'a') << ' ' << Cnt[y] << '\n';

  bool turn=1;
  while (1) {
    if (isPalindrome (Cnt, Len)) {
      if (turn)
        cout << "First";
      else
        cout << "Second";
      return 0;
    }
  
    Len--;
    unsigned i=0;
    for (i=0; i<26; i++) {
      if (Cnt[i] > 0) {
        Cnt[i]--;
        if (! isPalindrome (Cnt, Len))
          break;
        else
          Cnt[i]++;
      }
    }

    if (i==26) {
      if (turn)
        cout << "Second";
      else
        cout << "First";
      return 0;
    }
    
    turn = !turn;
  }
  return 0;
}

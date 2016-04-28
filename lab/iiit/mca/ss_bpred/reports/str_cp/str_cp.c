int main () {
  char str1[] = "this is a long string this is a long string this is a long string this is a long string this is a long string";
  char str2[] = "this is also a string this is also a string this is also a string this is also a string this is also a string";
  int i = 100;
  while (i--) strcpy (str1, str2);
  return 0;
}

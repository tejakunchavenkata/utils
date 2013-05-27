int main () {
  int i=0, x=1;
  while (i < 10000) {
    if (i & 1) x++;
    i++;
  }
  return x;
}

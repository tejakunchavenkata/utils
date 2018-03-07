#! /usr/bin/env python3
'''
Author:    krishna
Created:   Tue Mar  6 20:59:45 2018 IST
File Name: c.py
USAGE:
      c.py
Description:

'''
import sys, os


def main():
    '''The Main'''

    ans = sys.stdin.readline().rstrip()

    chars = [ord(i) for i in list(ans)]
    idxes = []
    char = ord('a')
    minIdx = 0

    def findFirst(minIdx, char):
        for i in range(minIdx, len(chars)):
            if chars[i] <= char:
                return i

        return -1

    while (len(idxes) < 26):
        x = findFirst(minIdx, char)
        if x == -1:
            break
        else:
            idxes.append(x)
            minIdx = x + 1
            char += 1

        if (minIdx >= len(chars)):
            break

        if (char == ord('z') + 1):
            break

    if (len(idxes) == 26):
        x = ord('a')
        for i in idxes:
            chars[i] = x
            x += 1
        print("".join(map(chr, chars)))
        return

    print(-1)


if __name__ == '__main__':
    main()

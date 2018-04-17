#! /usr/bin/env python3
'''
Author:    krishna
Created:   Sun Apr 15 16:09:52 2018 IST
File Name: e.py
USAGE:
      e.py
Description:

'''
import os, sys
import collections


def decr(x, minIdx):
    l = len(x)
    if l & 1:
        return '9' * (l - 1)

    idx = -1

    while x[idx] == '0':
        x[idx] = '9'
        idx -= 1

    x[idx] = str(int(x[idx]) - 1)

    if x[0] == '0':
        return x[1:]

    return x


def isPP(x):

    for i in collections.Counter(x).values():
        if i & 1:
            return False

    return True


def calc(x):

    x = decr(x)
    while not isPP(x):
        x = decr(x)

    return x


def main():
    '''The Main'''

    a = int(sys.stdin.readline().rstrip())

    for i in range(a):
        print("".join(calc(list(sys.stdin.readline().rstrip()))))



if __name__ == '__main__':
    main()

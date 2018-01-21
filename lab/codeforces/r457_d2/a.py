#! /usr/bin/env python3
'''
Author:    krishna
Created:   Fri Jan 19 20:09:55 2018 IST
File Name: a.py
USAGE:
      a.py
Description:

'''
import sys, os


def has7(i):
    if (i % 10 == 7):
        return 1

    i /= 10

    if (i % 10 == 7):
        return 1

    return 0


def main():
    '''
    The Main
    '''
    n = int(sys.stdin.readline())
    h, m = map(int, sys.stdin.readline().split())

    i = 0

    while (1):
        if (has7(h)):
            break
        if (has7(m)):
            break

        i += 1

        m -= n
        if (m < 0):
            m += 60
            h -= 1

        if (h < 0):
            h += 24

    print(i)


if __name__ == '__main__':
   main()

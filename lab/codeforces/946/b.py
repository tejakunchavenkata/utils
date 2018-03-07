#! /usr/bin/env python3
'''
Author:    krishna
Created:   Tue Mar  6 20:44:36 2018 IST
File Name: b.py
USAGE:
      b.py
Description:

'''
import sys, os


def main():
    '''The Main'''
    (a, b) = list(map(int, sys.stdin.readline().rstrip().split()))

    # x = 10
    # while(x):
    #     x -= 1
    #     print(a, b)
    while(1):
        if (a == 0) or (b == 0):
            break

        if (a >= (b << 1)):
            a = a % (b << 1)
        else:
            if (b >= (a << 1)):
                b = b % (a << 1)
            else:
                break

    print(a, b)


if __name__ == '__main__':
    main()

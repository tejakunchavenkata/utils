#! /usr/bin/env python3
'''
Author:    krishna
Created:   Tue Mar  6 20:36:24 2018 IST
File Name: a.py
USAGE:
      a.py
Description:

'''
import sys, os


def main():
    '''The Main'''
    a = sys.stdin.readline()
    a = list(map(int, sys.stdin.readline().rstrip().split()))
    b = sum([x for x in a if x < 0])
    c = sum([x for x in a if x > 0])
    print(c-b)


if __name__ == '__main__':
    main()

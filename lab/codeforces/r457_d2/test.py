#! /usr/bin/env python3
'''
Author:    krishna
Created:   Sat Jan 20 11:26:44 2018 IST
File Name: test.py
USAGE:
      test.py
Description:

'''
import sys, os


def main():
    '''
    The Main
    '''
    arr = list(map(int, sys.stdin.readline().split()))
    print(len(arr))
    print(arr[0], arr[-1])


if __name__ == '__main__':
   main()

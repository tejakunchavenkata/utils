#! /usr/bin/env python3
'''
Author:    krishna
Created:   Mon Jan  8 21:43:50 2018 IST
File Name: 892b.py
USAGE:
      892b.py
Description:

'''
import sys, os


def main():
    '''
    The Main
    '''
    n = sys.stdin.readline()
    arr = list(reversed(list((map(int, sys.stdin.readline().split())))))

    sol = [1] * len(arr)
    ptr = 1

    for i in range(len(arr)):
        for j in range(max(i+1, ptr), min(len(arr), 1+i+arr[i])):
            sol[j] = 0
            ptr += 1

    print(sum(sol))

if __name__ == '__main__':
   main()

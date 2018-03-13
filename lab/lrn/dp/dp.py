#! /usr/bin/env python3
'''
Author:    krishna
Created:   Thu Mar  8 07:19:57 2018 IST
File Name: dp.py
USAGE:
      dp.py
Description:

'''
import sys, timeit


dp = {0:0, 1:1}


def fib(x):
    # if not x in dp:
    #     dp[x] = fib(x-1) + fib(x-2)
    # return dp[x]

    if (x == 0) or (x == 1):
        return dp[x]

    return fib(x-1) - fib(x-2)


def main():
    '''The Main'''

    fib(9)


if __name__ == '__main__':
    print(timeit.timeit(main))

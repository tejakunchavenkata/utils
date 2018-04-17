#! /usr/bin/env python3
'''
Author:    krishna
Created:   Fri Mar 23 22:21:02 2018 IST
File Name: c.py
USAGE:
      c.py
Description:

'''
import os, sys, math


def exactRoot(x, y):
    i = math.floor(math.pow(x, 1/y))

    if ((i+1) ** y) > x:
        return i
    else:
        return i+1


def solve(x):
    barrier = exactRoot(x, 2)
    sol = 0

    curPower = 3
    while (barrier >= 2):
        newBarrier = exactRoot(x, curPower)
        sol += (barrier - newBarrier - 1) * (curPower - 2)
        print(sol, barrier, newBarrier, curPower)
        curPower += 1
        barrier = newBarrier

    return sol


def main():
    '''The Main'''

    q = int(sys.stdin.readline().rstrip())

    for i in range(q):
        (x, y) = list(map(int, sys.stdin.readline().rstrip().split()))

        print(x, y)


    print(solve(y) - solve(x-1))


if __name__ == '__main__':
    main()

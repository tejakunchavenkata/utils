#! /usr/bin/env python3
'''
Author:    krishna
Created:   Tue Mar  6 22:28:30 2018 IST
File Name: d.py
USAGE:
      d.py
Description:

'''
import sys, os


def main():
    '''The Main'''

    (m, n, k) = list(map(int, sys.stdin.readline().rstrip().split()))
    print(m, n, k)

    data = []
    for i in range(m):
        data.append(list(map (int, list(sys.stdin.readline().rstrip()))))

    def findFirst(arr, minIdx):
        for i in range(minIdx, len(arr)):
            if arr[i]:
                return i
        return -1

    def findLast(arr, maxIdx):
        for i in reversed(range(maxIdx + 1)):
            if arr[i]:
                return i
        return -1

    def calcLeft(x):
        i = findFirst(data[x], 0)
        if i == -1:
            return (x, i, -1)

        j = findFirst(data[x], i + 1)
        if j == -1:
            return (x, i, 1)

        return (x, i, j - i)

    def calcRight(x):
        i = findLast(data[x], len(data[x]) - 1)
        if i == -1:
            return (x, i, -1)

        j = findLast(data[x], i - 1)
        if j == -1:
            return (x, i, 1)

        return (x, i, i - j)

    def fixBest():
        res = []
        for x in range(len(data)):
            res.append(calcLeft(x))
            res.append(calcRight(x))
        
        print(res)
        print(sorted(res, key=lambda i : i[2]))

    for i in range(k):
        fixBest()


if __name__ == '__main__':
    main()

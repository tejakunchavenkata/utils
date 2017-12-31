#! /usr/bin/env python3
#------------------------------------------------
# Author:    krishna
# Created:   Fri Dec 29 21:24:33 IST 2017
# File Name: b.py
# USAGE:
#       b.py
# Description:
# 
#------------------------------------------------
import sys, itertools


def getNextIdx(x, y, d):
    move = {
        'U' : (-1,  0),
        'D' : ( 1,  0),
        'R' : ( 0,  1),
        'L' : ( 0, -1)
    }

    return (x + move[d][0], y + move[d][1])


def tryComb(comb, sol, sx, sy, ex, ey):

    for i in sol:
        (sx, sy) = getNextIdx(sx, sy, comb[int(i)])

        if (sx == ex) and (sy == ey):
            return 1

        if (sx < 0) or (sy < 0) or (sx >= n) or (sy >= m):
            return 0

        if (data[sx][sy] == '#'):
            return 0

    return 0

data = []
count = 0
(n, m) = map(int, sys.stdin.readline().rstrip().split())

for i in range(n):
    data.append(sys.stdin.readline().rstrip())

sol = sys.stdin.readline().rstrip()

# Find S
for x in range(n):
    for y in range(m):
        if data[x][y] == 'S':
            (sx, sy) = (x, y)

        if data[x][y] == 'E':
            (ex, ey) = (x, y)

for comb in (itertools.permutations(['U', 'D', 'R', 'L'])):
    if tryComb(comb, sol, sx, sy, ex, ey):
        count += 1

# print(getNextIdx(3, 3, 'U'))
# print(getNextIdx(3, 3, 'D'))
# print(getNextIdx(3, 3, 'L'))
# print(getNextIdx(3, 3, 'R'))
print(count)

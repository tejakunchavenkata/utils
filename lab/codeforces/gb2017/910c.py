#! /usr/bin/env python3
#------------------------------------------------
# Author:    krishna
# Created:   Sun Dec 24 17:45:40 IST 2017
# File Name: 910c.py
# USAGE:
#       910c.py
# Description:
# 
#------------------------------------------------
import sys, operator


data = []

c = int(sys.stdin.readline().rstrip())
for i in range(c):
    data.append(sys.stdin.readline().rstrip())

maxLen = max(len(line) for line in data)
cantTakeZero = [line[0] for line in data]

for i in range(len(data)):
    data[i] = ('0' * (maxLen - len(data[i]))) + data[i]

count = {chr(i):0 for i in range(ord('a'), ord('k'))}

for i in range(maxLen):
    for line in data:
        if (line[i] == '0'):
            continue

        count[line[i]] += 1

    count = {k: v * 10 for (k,v) in count.items()}

count = {k: int(v / 10) for (k,v) in count.items()}

code = {}
counter = 1
zeroUsed = 0

# For given column, fix the values
for k in (sorted(count.items(), key=operator.itemgetter(1), reverse=True)):
    if (k[0] in code):
        continue

    if (zeroUsed == 0) and ((k[0] in cantTakeZero) == False):
        code[k[0]] = 0
        zeroUsed = 1
    else:
        code[k[0]] = counter
        counter += 1

s = 0
for i in range(maxLen):
    for line in data:
        if (line[i] != '0'):
            s += code[line[i]]

    s *= 10

# print(sorted(code.items()))
print(int(s / 10))

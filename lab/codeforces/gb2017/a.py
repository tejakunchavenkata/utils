#! /usr/bin/env python3
#------------------------------------------------
# Author:    krishna
# Created:   Fri Dec 29 22:02:11 IST 2017
# File Name: a.py
# USAGE:
#       a.py
# Description:
# 
#------------------------------------------------
import sys


s = sys.stdin.readline().rstrip()

count = 0

for i in s:
    if i in 'aeiou':
        if (1 & (ord(i) - ord('a'))) == 0:
            count += 1
            continue
    if i in '0123456789':
        if (1 & int(i)):
            count += 1

print (count)

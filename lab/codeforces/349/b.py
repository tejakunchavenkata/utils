#! /usr/bin/env python3
'''
Author:    krishna
Created:   Sat Sep 22 07:59:59 2018 IST
USAGE:
      b.py
Description:


'''


def main():
    '''The Main'''

    v = int(input())
    w = list(map(int, input().rstrip().split()))
    cost = dict(zip(range(1, 10), w))
    tsoc = dict(zip(w, range(1, 10)))

    minCost = min(tsoc.keys())
    if minCost > v:
        print(-1)
        return

    l = int(v/minCost)
    ans = [tsoc[minCost]] * l
    v -= (l * minCost)

    for i in range(len(ans)):
        for n in reversed(range(ans[i] + 1, 10)):
            d = cost[n] - cost[ans[i]]
            if v >= d:
                ans[i] = n
                v -= d
                break

    print("".join(map(str, ans)))
    return


if __name__ == '__main__':
    main()

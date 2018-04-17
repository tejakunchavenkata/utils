#! /usr/bin/env python3
'''
Author:    krishna
Created:   Fri Apr  6 09:58:55 2018 IST
File Name: loading.py
USAGE:
      loading.py
Description:

'''
import time


def main():
    '''The Main'''

    chars = ['-', '\\', '|', '/']

    i = 0
    while 1:
        print('Loading ... {}'.format(chars[i]), end='\r')
        time.sleep(.1)
        i = (i + 1) % 4


if __name__ == '__main__':
    main()

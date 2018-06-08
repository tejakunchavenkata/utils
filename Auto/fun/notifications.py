#! /usr/bin/env python3
'''
Author:    krishna
Created:   Sat May  5 23:43:07 2018 IST
USAGE:
      notifications.py
Description:


'''
import gi
gi.require_version('Notify', '0.7')
from gi.repository import Notify

def main():
    '''The Main'''

    Notify.init("App Name")
    Notify.Notification.new("Hello World").show()


if __name__ == '__main__':
    main()

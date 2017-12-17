#! /usr/bin/env python3
#------------------------------------------------
# Author:    krishna
# Created:   Sat Dec 16 19:16:28 IST 2017
# File Name: show.py
# USAGE:
#       show.py logFile
# Description:
# 
#------------------------------------------------
import csv
import sys
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.animation as animation

def plotFrame(idx, fig, data):
    '''
    Plots one frame
    '''

    fig.clear()
    axes = plt.gca()
    axes.set_ylim(0, 320)
    plt.bar(np.arange(len(data[idx])), data[idx])


def show(data):
    '''
    Plots full animation
    '''

    Writer = animation.writers['ffmpeg']
    writer = Writer(fps=15, bitrate=1800)

    fig = plt.figure()
    ani = animation.FuncAnimation(
        fig, plotFrame, np.arange(len(data)), fargs=(fig, data), interval=100
    )


    plt.xlabel('Job')
    plt.ylabel('Count')
    # plt.legend()

    ani.save('emergence.mp4', writer=writer)

    # plt.show()


def main():
    content = []

    with open(sys.argv[1]) as csvFile:
        data = csv.reader(csvFile, delimiter=',')

        for row in (data):
            content.append(list(map(int, row)))

    show(content)

if __name__ == '__main__':
    main()

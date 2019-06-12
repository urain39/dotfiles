#!/usr/bin/python3

def main():
    with open('blacklist.txt') as f1, open('tracker.txt') as f2:
        blacklist = f1.read().split('\n')
        trackerlist = f2.read().split('\n')

        for t in trackerlist:
            if t in blacklist:
                continue
            print(t)

main()


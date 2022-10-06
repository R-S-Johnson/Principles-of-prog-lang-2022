import sys

N = 3
fileName = sys.argv[-1]
file = open(fileName, 'r')
wordDict = {}


if len(sys.argv) == 3:
    N = sys.argv[1]



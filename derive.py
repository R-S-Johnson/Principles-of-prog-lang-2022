import sys

N = 3
fileName = sys.argv[-1]
file = open(fileName, 'r')
wordDict = {}
nonTerminals = []


if len(sys.argv) == 3:
    N = sys.argv[1]


for line in file:
    args = line.strip().split(' ')
    if args[0] in wordDict.keys():
        wordDict[args[0]] = [wordDict[args[0]], args[2:]]
    else:
        wordDict[args[0]] = args[2:]


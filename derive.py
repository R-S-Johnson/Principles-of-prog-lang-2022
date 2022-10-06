import sys

N = 3
fileName = None
wordDict = {}
nonTerminals = []


if len(sys.argv) == 3:
    if sys.argv[1][0:2] == "-l":
        N = sys.argv[1]
        fileName = sys.argv[-1]
    else:
        N = sys.argv[-1]
        fileName = sys.argv[1]

file = open(fileName, 'r')


for line in file:
    args = line.strip().split(' ')
    nonTerminals.append(args[0])
    if args[0] in wordDict.keys():
        wordDict[args[0]] = [wordDict[args[0]], args[2:]]
    else:
        wordDict[args[0]] = args[2:]



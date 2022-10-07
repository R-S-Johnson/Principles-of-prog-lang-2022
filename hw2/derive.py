import sys

N = 3
fileName = None
wordDict = {}
nonTerminals = []
wordSet = set()


# function called a few times
# used to check if an itterable
# input has any non-terminals
def hasNonTerminal(s):
    for elem in s:
        if elem in nonTerminals:
            return True
    return False


# read command line arguments
# set the word size
# open the file
if len(sys.argv) == 3:
    if sys.argv[1][0:2] == "-l":
        N = int(sys.argv[1][2:])
        fileName = sys.argv[-1]
    else:
        N = sys.argv[-1]
        fileName = sys.argv[1]
else:
    fileName = sys.argv[1]

file = open(fileName, 'r')


# setup the dictionary
for line in file:
    args = line.strip().split(' ')
    nonTerminals.append(args[0])
    if args[0] in wordDict.keys():
        wordDict[args[0]].append(args[2:])
    else:
        wordDict[args[0]] = [args[2:]]

# init worklist
workList = [list(wordDict.keys())[0]]

while len(workList) != 0:
    s = workList.pop(0).split(' ')

    # outer cases of algorithm:
    # if word is too long
    # or if it has no non terminals
    if len(s) > N:
        continue
    if not hasNonTerminal(s):
        if len(s) == N:
            wordSet.add(' '.join(s))
        continue

    # break down string
    # and add the result(s)
    # to the worklist
    NT = None
    NTIndex = 0
    for index in range(len(s)):
        if hasNonTerminal([s[index]]):
            NT = s[index]
            break
        NTIndex += 1

    for rhs in wordDict[NT]:
        tmp = s[:NTIndex] + rhs + s[NTIndex+1:]
        workList.append(' '.join(tmp))

# sort set and print
sortedList = sorted(wordSet)
print('')
for elem in sortedList:
    print(elem)
print('')
print("Total generated strings:", len(sortedList))
print('')
print('')

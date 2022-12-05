def getInput():
    with open('input') as inputFile:
        return inputFile.readlines()

def parseInput(rawInput):
    finalList = []
    workingList = []
    length = len(rawInput)
    i = 0
    while i < length:
        if rawInput[i] == '\n':
            finalList.append(workingList)
            workingList = []
        else:
            workingList.append(int(rawInput[i]))
        i = i + 1
    return(finalList)

def main():
    rawInput = getInput()
    parsedInput = parseInput(rawInput)

main()
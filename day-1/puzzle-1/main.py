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

def sumEach(parsedInput):
    finalList = []
    parsedLength = len(parsedInput)
    parsedi = 0
    while parsedi < parsedLength:
        itemLength = len(parsedInput[parsedi])
        itemi = 0
        itemSum = 0
        while itemi < itemLength:
            itemSum = itemSum + parsedInput[parsedi][itemi]
            itemi = itemi + 1
        finalList.append(itemSum)
        parsedi = parsedi + 1
    return finalList

def main():
    rawInput = getInput()
    parsedInput = parseInput(rawInput)
    summedInput = sumEach(parsedInput)
    print(max(summedInput))

main()
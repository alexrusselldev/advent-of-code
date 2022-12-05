def getInput():
    with open('input.txt') as inputFile:
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

def sortSummed(summedInput):
    # attempting a bubble sort algorithm
    inputList = summedInput
    inputLength = len(inputList)
    i = 0
    sorted = False
    while sorted == False:
        sorted = True
        i = 0
        while i < inputLength - 1:
            if inputList[i] < inputList[i + 1]:
                inputList[i], inputList[i + 1] = inputList[i + 1], inputList[i]
                sorted = False
            i = i + 1
    return inputList

def main():
    rawInput = getInput()
    parsedInput = parseInput(rawInput)
    summedInput = sumEach(parsedInput)
    sortedInput = sortSummed(summedInput)
    print(sortedInput[0] + sortedInput[1] + sortedInput[2])

main()
function LoadInput () 
    local input = io.open("input.txt", "r")
    return input
end

function ParseInput (rawInput)
    local result = {}
    local working = {{}, {}, {}}
    io.input(rawInput)
    local insert = 1
    local lines = rawInput:lines()
    for line in lines do
        local length = string.len(line)
        for i = 1, length do
            table.insert(working[insert], string.sub(line, i, i))
        end
        if insert == 3 then
            table.insert(result, working)
            working = {{}, {}, {}}
            insert = 1
        else
            insert = insert + 1
        end
    end
    return result
end

function GetItemPrio (item)
    local charcode = string.byte(item)
    if charcode > 96 and charcode < 123 then
        return charcode - 96
    end
    if charcode > 64 and charcode < 91 then
        return charcode - 38
    end

    return 0
end

function FindIntersections (parsedInput)
    local intersections = {}
    for _, backpack in pairs(parsedInput) do
        local done = false
        for _, firstItem in pairs(backpack[1]) do
            if done == true then
                break
            end
            for _, secondItem in pairs(backpack[2]) do
                if firstItem == secondItem then
                    table.insert(intersections, firstItem)
                    done = true
                    break
                end
            end
        end
    end
    return intersections
end

function SumIntersections (intersections)
    local result = 0
    for _, intersection in pairs(intersections) do
        result = result + GetItemPrio(intersection)
    end
    return result
end

RawInput = LoadInput()
ParsedInput = ParseInput(RawInput)
Intersections = FindIntersections(ParsedInput)
print(SumIntersections(Intersections))
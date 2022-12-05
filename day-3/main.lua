function LoadInput () 
    local input = io.open("input.txt", "r")
    return input
end

function ParseInput (rawInput)
    local result = {}
    local working = {{},{}}
    io.input(rawInput)
    local lines = rawInput:lines()
    for line in lines do
        local length = string.len(line)
        for i = 1, length do
            if i < (length / 2) + 1 then
                print('working 1', string.sub(line, i, i))
                table.insert(working[1], string.sub(line, i, i))
            else
                print('working 2', string.sub(line, i, i))
                table.insert(working[2], string.sub(line, i, i))
            end
        end
        table.insert(result, working)
        working = {{},{}}
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
        for _, firstItem in pairs(backpack[1]) do
            for _, secondItem in pairs(backpack[2]) do
                if firstItem == secondItem then
                    table.insert(intersections, firstItem)
                end
            end
        end
    end
    return intersections
end

RawInput = LoadInput()
ParsedInput = ParseInput(RawInput)
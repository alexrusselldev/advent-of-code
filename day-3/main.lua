function LoadInput () 
    local input = io.open("input.txt", "r")
    return input
end

function ParseInput (rawInput)
    local result = {}
    io.input(rawInput)
    local lines = rawInput:lines()
    for line in lines do
        local length = string.len(line)
        local working = {}
        table.insert(working, string.sub(line, 1, length / 2))
        table.insert(working, string.sub(line, (length / 2) + 1, length))
        table.insert(result, working)
    end
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

RawInput = LoadInput()
ParsedInput = ParseInput(RawInput)
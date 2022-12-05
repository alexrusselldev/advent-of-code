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


local open = io.open

function GetLines ()
    local lines = {}
    local temp = ""
    local ctr = 1
    for line in io.lines("input.txt") do
        if line ~= "" then
            temp = temp .. ' ' .. line
        else 
            lines[ctr] = temp
            temp = ""
            ctr = ctr + 1
        end
    end
    if temp ~= "" then
        lines[ctr] = temp
    end
    return lines
end

function InterpretPassports ()
    local correctPps = 0
    local lines = GetLines()
    for _, passport in pairs(lines) do
        local _, entries = string.gsub(passport, ":", "");
        print(passport)
        print("Occurences: "..entries)
        if entries < 8 then
            if entries == 7 and passport.find(passport,"cid") == nil then
                correctPps = correctPps + 1
            end
        else 
            correctPps = correctPps + 1
        end
    end

    print("Correct: "..correctPps)
end

InterpretPassports()
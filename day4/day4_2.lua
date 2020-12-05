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

function GetEntries (passport)
    local entries = {}
    for k in string.gmatch(passport, "%S+") do
        if k ~= nil then
            local key = string.sub(k, 1, 3)
            local value = string.sub(k, 5, #k)
            entries[#entries+1] = {key, value}
        end
    end
    return entries
end

function IsNrBetween(input, low, up)
    local bool = false
    if input ~= nil then
        bool = (input > low and input < up)
    end
    return bool
end

function ValidatePassport (passport)
    local entries = GetEntries(passport)
    --- I am so, so sorry for this piece of code. I really am.
    if #entries == 8 or (#entries == 7 and passport.find(passport,"cid") == nil) then
        local correctEntries = 0
        if (#entries == 7 or string.find(passport, "cid") ~= nil) then correctEntries = 1 end
        for k, v in ipairs(entries) do
            local key = v[1]
            local value = v[2]
            local valNum = tonumber(value)
            --- Really. I am sorry.
            if key == "byr" then 
                if IsNrBetween(valNum, 1919, 2003) then correctEntries = correctEntries + 1 end   
            elseif key == "iyr" then 
                if IsNrBetween(valNum, 2009, 2021) then correctEntries = correctEntries + 1 end  
            elseif key == "eyr" then 
                if IsNrBetween(valNum, 2019, 2031) then correctEntries = correctEntries + 1 end  
            elseif key == "hgt" then
                if string.match(value, "cm") ~= nil and #value < 6 then
                    valNum = tonumber(string.sub(value, 1, 3))
                    if IsNrBetween(valNum, 149, 194) then correctEntries = correctEntries + 1 end
                elseif string.match(value, "in") ~= nil and #value < 5 then
                    valNum = tonumber(string.sub(value, 1, 2))
                    if IsNrBetween(valNum, 58, 77) then correctEntries = correctEntries + 1 end
                end
            elseif key == "hcl" then
                if string.sub(value, 1, 1) == "#" and #value == 7 then correctEntries = correctEntries + 1 end
            elseif key == "ecl" then
                if value == "amb" or value == "blu" or value == "brn" or value == "gry" or value == "grn" or value == "hzl" or value == "oth" then
                    correctEntries = correctEntries + 1
                end
            elseif key == "pid" then
                if #value == 9 and valNum ~= nil then correctEntries = correctEntries + 1 end
            end
            --- Lord forgive me.
        end
        return (correctEntries == 8)
    end
    return false
end

function InterpretPassports ()
    local correctPps = 0
    local lines = GetLines()
    for _, passport in pairs(lines) do
        if ValidatePassport (passport) then
            correctPps = correctPps + 1
        end
    end

    print("Correct: "..correctPps)
end

InterpretPassports()
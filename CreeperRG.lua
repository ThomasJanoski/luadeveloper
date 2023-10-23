os.execute("chcp 65001")

local CardBorder = "|"

local MonsterData = {
    ["Name"] = "Creeper",
    ["Description"] = "Um monstro furtivo",
    ["Som"] = "Tssss",
    ["Tempo Favorito"] = "Noturno",
    ["Item"] = "Pólvora"
}

local Attributes = {
    ["Ataque"] = 10,
    ["Defesa"] = 2,
    ["Vida"] = 5,
    ["Velocidade"] = 7,
    ["Inteligência"] = 2
}

local function GenerateCardBorder()
    print("========================")
end

local function PrintInfo(InfoName, HasSpace)
    print(HasSpace and "     " or "" .. CardBorder .. " " .. InfoName .. ": " .. MonsterData[InfoName])
end

local function PrintEmptyLine()
    print(CardBorder .. " ")
end

local function PrintSoloInfo(Description, HasSpace)
    print(HasSpace and "     " or "" .. CardBorder .. " " .. Description)
end

local function GenerateAttribute(Value)
    local FullChar = "⬜"
    local EmptyChar = "⬛"

    local FinalAttribute = ""
    for i = 1, 10 do 
        FinalAttribute = FinalAttribute .. ((Value >= i) and FullChar or EmptyChar) 
    end

    return FinalAttribute
end

local function PrintAttribute(AttributeName, HasSpace)
    local LongestAttribute = ""
    for AttributeName, _ in pairs(Attributes) do
        if #AttributeName > #LongestAttribute then LongestAttribute = AttributeName end
    end
    local SpacesRemaining = #LongestAttribute - #AttributeName
    local SpaceString = ""
    for i = 0, SpacesRemaining do SpaceString = SpaceString .. " " end
    if SpacesRemaining == 0 then SpaceString = "  " end

    print(CardBorder .. " " .. (HasSpace and "  " or "") .. AttributeName .. ": " 
        .. SpaceString .. GenerateAttribute(Attributes[AttributeName]))
end

GenerateCardBorder()
PrintEmptyLine()

PrintSoloInfo(string.upper(MonsterData.Name))
PrintSoloInfo(MonsterData.Description)

PrintEmptyLine()

for InfoName, _ in pairs(MonsterData) do 
    if InfoName ~= "Name" and InfoName ~= "Description" then 
        PrintInfo(InfoName)  
    end  
end

PrintEmptyLine()
PrintSoloInfo("Atributos")

for AttributeName, _ in pairs(Attributes) do
    PrintAttribute(AttributeName, true)
end

PrintEmptyLine()
GenerateCardBorder()
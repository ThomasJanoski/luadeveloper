os.execute("chcp 65001")

function SplitString(inputstr, sep)
    if sep == nil then
            sep = "%s"
    end
    local t = {}
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        table.insert(t, str)
    end
    return t
end

local function PrintHeader()
    print("========================")
    print("Você empunha sua espada e se prepara para lutar.")
    print("É hora da batalha!")
    print("")
end

local function PrintString(String)
    print("| " .. String)
end

local function PrintEmptyLine()
    PrintString("")
end

local CreatureInfo = {
    Name = "Prismarine Colossus",
    Description = "Enormes estátuas de prismarine que medem mais de 20 metros de altura. " 
    .. "Sua aparência ameaçadora pode assustar até os mais bravos guerreiros. " 
    .. "'/' Eles têm olhos turquesa brilhantes, mas um elogio não vai te ajudar muito durante a batalha.",

    Attributes = {
        Vida = 10,
        Ataque = 4,
        Defesa = 10,
        Agilidade = 1
    }
}

local function PrintCreatureInfo()
    PrintString(CreatureInfo.Name)
    PrintEmptyLine()

    local DescriptionSplit = SplitString(CreatureInfo.Description, "'/'")
    for _, DescriptionLine in pairs(DescriptionSplit) do 
        PrintString(DescriptionLine) 
    end
    PrintEmptyLine()

    local Attributes_PrintOrder = {"Vida", "Ataque", "Defesa", "Agilidade"}
    for _, AttributeName in pairs(Attributes_PrintOrder) do
        local Quantity = CreatureInfo.Attributes[AttributeName]
        local SpaceQuantity = 9 - #AttributeName
        local FinalAttributeName = AttributeName
        for i = 1, SpaceQuantity do FinalAttributeName = FinalAttributeName .. " " end

        PrintString(FinalAttributeName .. " " .. Quantity)
    end

    PrintEmptyLine()
end

PrintHeader()
PrintCreatureInfo()

local PrintModule = require("SimuladorBatalhas.Modules.PrintModule")
local Utils = require("SimuladorBatalhas.Modules.Utils")

local BossModule = {
    Name = "Prismarine Colossus",
    Description = [[
 | Enormes estátuas de prismarine que medem mais de 20 metros de altura.
 | Sua aparência ameaçadora pode assustar até os mais bravos guerreiros.
 | Eles têm olhos turquesa brilhantes, mas um elogio não vai te ajudar muito durante a batalha.
    ]],

    Attributes = {
        Vida = 10,
        Ataque = 4,
        Defesa = 10,
        Agilidade = 1
    },

    CurrentDamage = {Min = 2, Max = 5}
}

BossModule.MaxHealth = BossModule.Attributes.Vida
BossModule.CurrentHealth = BossModule.MaxHealth

function BossModule.IsAlive()
    return BossModule.CurrentHealth > 0
end

function BossModule.DisplayBossHealth()
    print(" | Vida do Boss " 
        .. Utils.GetAttString(BossModule.MaxHealth, BossModule.CurrentHealth))
end

function BossModule.PrintCreatureInfo()
    PrintModule.PrintString(BossModule.Name)
    PrintModule.PrintEmptyLine()

    print(BossModule.Description)
    PrintModule.PrintEmptyLine()
    
    local Attributes_PrintOrder = {"Vida", "Ataque", "Defesa", "Agilidade"}
    for _, AttributeName in pairs(Attributes_PrintOrder) do
        local Quantity = BossModule.Attributes[AttributeName]
        local SpaceQuantity = 11 - #AttributeName
        local FinalAttributeName = AttributeName
        for i = 1, SpaceQuantity do FinalAttributeName = FinalAttributeName .. " " end

        Utils.PrintAttributes(FinalAttributeName, Quantity)
    end

    PrintModule.PrintEmptyLine()
end

function BossModule.TakeDamage(CurrentDamage)
    BossModule.CurrentHealth = math.max(0, BossModule.CurrentHealth - CurrentDamage)
end

return BossModule
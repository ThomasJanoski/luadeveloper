local PlayerModule = {}

local Utils = require("SimuladorBatalhas.Modules.Utils")
local BossModule = require("SimuladorBatalhas.Modules.BossModule")
local PrintModule = require("SimuladorBatalhas.Modules.PrintModule")

PlayerModule.MaxHealth = 10
PlayerModule.CurrentHealth = PlayerModule.MaxHealth 

PlayerModule.AttackDamage = {Min = 1, Max = 3}

function PlayerModule.IsAlive()
    return PlayerModule.CurrentHealth > 0
end

function PlayerModule.DisplayPlayerHealth()
    print(" | Vida do Jogador " 
        .. Utils.GetAttString(PlayerModule.MaxHealth, PlayerModule.CurrentHealth))
end

function PlayerModule.GetAttackDamage()
    return math.random(PlayerModule.AttackDamage.Min, PlayerModule.AttackDamage.Max)
end

function PlayerModule.TakeDamage(CurrentDamage)
    PlayerModule.CurrentHealth = math.max(0, PlayerModule.CurrentHealth - CurrentDamage)
end

local Actions = {
    ["1"] = {
        Description = "Atacar com a espada.",
        Execute = function()
            local AttackDamage = PlayerModule.GetAttackDamage()
            BossModule.TakeDamage(AttackDamage)
            PrintModule.PrintEmptyLine()
            PrintModule.PrintString(string.format(
                "Jogador atacou o Boss com a espada, causando %d de dano", AttackDamage)
            )
        end
    },
    ["2"] = {
        Description = "Usar uma poção de vida.",
        Execute = function()
            PlayerModule.CurrentHealth = PlayerModule.MaxHealth
        end
    }
}
local MaxActions = 0
for _, _ in pairs(Actions) do MaxActions = MaxActions + 1 end

function PlayerModule.PrintPossibleActions()
    print(" | ")
    
    for ActionNumber = 1, MaxActions do
        local Info = Actions[tostring(ActionNumber)]
        print(string.format(" | %d. %s", ActionNumber, Info.Description))
    end

    print(" | ")
end

function PlayerModule.IsValidAction(ActionNumber)
    if ActionNumber ~= "2" and ActionNumber ~= "1" then return false end
    return true
end

function PlayerModule.RegisterAction(ActionNumber)
    Actions[ActionNumber].Execute()
end

return PlayerModule
local PlayerModule = {}

local Utils = require("SimuladorBatalhas.Modules.Utils")
local BossModule = require("SimuladorBatalhas.Modules.BossModule")

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

local Actions = {
    [1] = {
        Description = "Atacar com a espada.",
        Execute = function()
            BossModule.TakeDamage(PlayerModule.GetAttackDamage())
        end
    },
    [2] = {
        Description = "Usar uma poção de vida.",
        Execute = function()
            PlayerModule.CurrentHealth = PlayerModule.MaxHealth
        end
    }
}

function PlayerModule.PrintPossibleActions()
    print(" | ")
    for ActionNumber = 1, #Actions do
        local Info = Actions[ActionNumber]

        print(string.format(" | %d. %s", ActionNumber, Info.Description))
    end
end

function PlayerModule.IsValidAction(ActionNumber)
    if ActionNumber ~= 2 and ActionNumber ~= 1 then return false end
    return true
end

function PlayerModule.GetAttackDamage()
    return math.random(PlayerModule.AttackDamage.Min, PlayerModule.AttackDamage.Max)
end

function PlayerModule.RegisterAction(ActionNumber)
    Actions[ActionNumber].Execute()
end


return PlayerModule
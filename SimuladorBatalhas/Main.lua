

local Utils = require("SimuladorBatalhas.Modules.Utils")
local BossModule = require("SimuladorBatalhas.Modules.BossModule")
local PlayerModule = require("SimuladorBatalhas.Modules.PlayerModule")
local PrintModule = require("SimuladorBatalhas.Modules.PrintModule")

Utils.EnableUTF8()

PrintModule.PrintHeader()
BossModule.PrintCreatureInfo()

while PlayerModule.IsAlive() and BossModule.IsAlive() do
    PlayerModule.DisplayPlayerHealth() 
    BossModule.DisplayBossHealth()

    PlayerModule.PrintPossibleActions()

    print(" | Digite a sua próxima ação: ")
    local ActionNumber = io.read()
    while type(ActionNumber) ~= "number" or not PlayerModule.IsValidAction(ActionNumber) do
        print(" | Ação inválida, por favor, tente novamente.")
        print(" | Digite a sua próxima ação: ")

        local ActionNumber = io.read()
    end

    PlayerModule.RegisterAction(ActionNumber)
end
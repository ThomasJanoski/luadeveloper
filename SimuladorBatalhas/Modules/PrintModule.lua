local PrintModule = {}

function PrintModule.PrintHeader()
    print([[
    ========================================================
                    SIMULADOR DE BATALHA
    ========================================================
        Você empunha sua espada e se prepara para lutar.
                     É hora da batalha!
    ]])
end

function PrintModule.PrintString(String)
    print(" | " .. String)
end

function PrintModule.PrintEmptyLine()
    PrintModule.PrintString("")
end

function PrintModule.PrintDefeat()
    PrintModule.PrintString("Você perdeu! Tente melhor da próxima vez.")
end

function PrintModule.PrintVictory()
    PrintModule.PrintString("Você venceu! Um bravo guerreiro!")
end

return PrintModule
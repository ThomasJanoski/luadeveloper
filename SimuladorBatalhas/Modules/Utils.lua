local Utils = {}

local EmptyAtt, FullAtt = "⬛", "⬜"

function Utils.EnableUTF8()
    os.execute("chcp 65001")
end

function Utils.GetAttString(MaxQuantity, CurrentQuantity)
    local FinalString = ""
    for i = 1, MaxQuantity do
        FinalString = FinalString .. (CurrentQuantity >= i and FullAtt or EmptyAtt)
    end

    return FinalString
end

function Utils.PrintAttributes(AttributeName, Quantity)
    local QuantitySting = Utils.GetAttString(10, Quantity)
    print(" | " .. AttributeName .. QuantitySting)
end

return Utils
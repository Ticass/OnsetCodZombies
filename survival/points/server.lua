survivor = {
    {
        id = 1,
        cash = 200,
        balance = 0,
    }
}



local function OnPlayerJoin(player, cash) do
for k,v in pairs(survivor) do
    SetPlayerMoney(player, v.cash)
    AddPlayerChat(player, "Welcome, here's $"..v.cash.." to start")
    print("SCRIPT LOADED ENJOY")
        end    
    end
end
AddEvent("OnPlayerJoin", OnPlayerJoin)


function AddPlayerMoney(player, amount)
for k,v in pairs(survivor) do
    if v.id == player then
     v.balance = v.balance + tonumber(amount)
     AddPlayerChat(1, "Your Balance Is Now: $"..v.balance)
        end
    end
end
AddCommand("addmoney", AddPlayerMoney)
AddFunctionExport("AddPlayerMoney", AddPlayerMoney)



function SetPlayerMoney(player,amount)
    for k,v in pairs(survivor) do
        if v.id == player then 
            v.balance = tonumber(amount)
            AddPlayerChat(1, "somebody set your money to $"..v.balance)
        end
    end
end
AddCommand("setmoney", SetPlayerMoney)
AddFunctionExport("SetPlayerMoney", SetPlayerMoney)




function ViewBalance(player, balance)
    for k,v in pairs(survivor) do
        if v.id == player then
            AddPlayerChat(player, "You currently have $"..v.balance.." in your account")
        end
    end
end
AddCommand("balance", ViewBalance)
AddFunctionExport("ViewBalance", ViewBalance)



function RemovePlayerMoney(player, amount)
    for k,v in pairs(survivor) do
        if v.id == player then 
            v.balance = v.balance - tonumber(amount)
            AddPlayerChat(player, "You were removed $"..amount.." from your account, you now have $"..v.balance )
        end
    end
end
AddCommand("removemoney", RemovePlayerMoney)
AddFunctionExport("RemovePlayerMoney", RemovePlayerMoney)



AddRemoteEvent("OnPlayerGoBroke", function(player, balance) --To fix
    for k,v in pairs(survivor) do
        if v.balance <= 0 then
            AddPlayerChat("You are broke, you had to sell a kidney to substain !")
            local hp = GetPlayerHealth(player)
            local health = tonumber(hp) - 10
            SetPlayerHealth(player, health)
            AddPlayerMoney(player, 200)
        else
            return
        end
    end
end)




Account = {}

function CreateSurvivor(playerid)
    table.insert(Account, { id = playerid, balance = 0})
end

function DeleteSurvivor(playerid)
    for k,v in pairs(Account) do
        if v.id == playerid then
            v = nil 
        end
    end
end


function GetSurvivor(player)
    for k,v in pairs(Account) do
        if v.id == player then
            return v
        end
    end
end

function Points_Balance(playerid, amount)
    for k,v in pairs(Account) do
        if v.id == playerid then
            return v.balance
        end
    end
end
AddCommand("bal", Points_Balance)

function Points_Add(playerid, amount)
    for k,v in pairs(Account) do
        if v.id == playerid then
            v.balance = v.balance + tonumber(amount)
            AddPlayerChat(playerid, "Your balance is now ".. v.balance)
        else AddPlayerChat(playerid, "You are not registered what the heck")
        end
    end
end
AddCommand("add", Points_Add)

function Points_Add_All(playerid, amount)
    
end



function PointR(playerid, amount)
    for k,v in pairs(Account) do
        if v.id == playerid then
            if v.balance > tonumber(amount) then
                v.balance = v.balance - tonumber(amount)
                AddPlayerChat(playerid, "Your balance is now ".. v.balance)
            end
        end
    end                                                                  
end
AddCommand("remove", PointR)


function Debug(playerid)
    for k,v in pairs(Account) do
        if v.id == playerid then
            print(v)
        end
    end
end
AddCommand("debug", Debug)

function Debugply(playerid)
    for k,v in pairs(Account) do
        if v.id == playerid then
            print(v.balance)
        end
    end
end
AddCommand("debugply", Debug)



local function OnPlayerJoin(player)
    CreateSurvivor(player)
    AddPlayerChatAll("Survivor #"..tonumber(player).." has joined the game")
end
AddEvent("OnPlayerJoin", OnPlayerJoin)


local function OnPlayerQuit(player)
    DeleteSurvivor(player)
end
AddEvent("OnPlayerQuit", OnPlayerQuit)


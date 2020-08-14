Box = ImportPackage("misterybox")
PlayerData = {}
SQL = nil


local sql_host = "localhost"
local sql_port = 3306
local sql_user = "root"
local sql_pass = "toor"
local sql_db = "codzombies"


function init_database()
    mariadb_log('debug')

    SQL = mariadb_connect(sql_host .. ":" .. sql_port, sql_user, sql_pass, sql_db )

    if (SQL ~= nil) then
        print("Established Connection to the database sucessfully")
    else
        print("Failed")
        ServerExit()
    end
end
AddEvent("OnPackageStart", init_database)

function GetAccount(player)
    local name = GetPlayerName(player)
    local steamid = GetPlayerSteamId(player)
    local query = mariadb_prepare("SELECT * playerdata WHERE steamid='".. steamid .."';")
    mariadb_query(SQL, query, GetAccountCallback, player)
end
AddEvent("OnPlayerSteamAuth", GetAccount)

function GetAccountCallback(player)
    if mariadb_get_row_count() > 0 then
        AddPlayerChatAll(name.." (#".. mariadb_get_value_int(1, "id")..") joined the server!")
    else
        local query = mariadb_prepare("INSERT INTO `playerdata`(`id`, `balance`, `name`,  `steamid` ) VALUES ('"..mariadb_escape_string(SQL, name)"','".. steamid .."','".. id .."', '".. cash .."');")
        mariadb_query(SQL, query, onAccountMade, player)
    end
end

function onAccountMade(player)
print("Account made for a new player !")
end

function CreatePlayerData(player)
    PlayerData = {}
    PlayerData[player] = {}

    PlayerData[player].id = 0
    PlayerData[player].balance = 500
    PlayerData[player].xp = 10
    PlayerData[player].level = 1

    print("Data Created for : " .. player)
end

--END DATABASE


survivor = {
    {
        id = 1,
        cash = 200,
        balance = 0,
        item = 0
    }
}

items = {
    {
        id = 1,
        name = "MisteryBox",
        price = 400,
    }
}

itemsBought = {}

-- local function OnPackageStart()
--     for i=items.length,items.length do
--         [i]CreateItems()
--     end
-- end
-- AddEvent("OnPackageStart", OnPackageStart)





local function OnPlayerJoin(player, cash) do
    for k, v in pairs(survivor) do
        CreatePlayerData()
        balance = PlayerData[player].balance
        AddPlayerChat(player, "Welcome, here's $" .. v.cash .. " to start")
        print("SCRIPT LOADED ENJOY")
    end
end
end
AddEvent("OnPlayerJoin", OnPlayerJoin)


function AddPlayerMoney(player, amount)
    for k, v in pairs(survivor) do
        if v.id == player then
            v.balance = v.balance + tonumber(amount)
            AddPlayerChat(1, "Your Balance Is Now: $" .. v.balance)
            local query = mariadb_prepare(SQL, "SELECT DISTINC(id)* FROM playerdata WHERE points = '?';", points)
        end
    end
end
AddCommand("addmoney", AddPlayerMoney)
AddFunctionExport("AddPlayerMoney", AddPlayerMoney)





function SetPlayerMoney(player, amount)
    for k, v in pairs(survivor) do
        if v.id == player then
            v.balance = tonumber(amount)
            AddPlayerChat(1, "somebody set your money to $" .. v.balance)
        end
    end
end
AddCommand("setmoney", SetPlayerMoney)
AddFunctionExport("SetPlayerMoney", SetPlayerMoney)




function ViewBalance(player, balance)
    for k, v in pairs(survivor) do
        if v.id == player then
            AddPlayerChat(player, "You currently have $" .. v.balance .. " in your account")
            return v.balance
        end
    end
end
AddCommand("balance", ViewBalance)
AddFunctionExport("ViewBalance", ViewBalance)



function RemovePlayerMoney(player, amount)
    for k, v in pairs(survivor) do
        if tonumber(amount) > v.balance then
            AddPlayerChat(player, "Not Enough Points")
            return false
        end
        
        if v.id == player and tonumber(amount) < v.balance and true then
            v.balance = v.balance - tonumber(amount)
            AddPlayerChat(player, "You were removed $" .. amount .. " from your account, you now have $" .. v.balance)
        end
    end
end
AddCommand("removemoney", RemovePlayerMoney)
AddFunctionExport("RemovePlayerMoney", RemovePlayerMoney)



-- function OnPlayerGoBroke(player, balance)--To fix
--     for k, v in pairs(survivor) do
--         while v.balance <= 0 do
--             AddPlayerChat("You are broke, you had to sell a kidney to substain !")
--             hp = tonumber(GetPlayerHealth(player))
--             health = tonumber(hp) - 10
--             SetPlayerHealth(player, health)
--             AddPlayerMoney(player, 200)
--         end
--     end
-- end
-- AddEvent("OnPlayerGoBroke", OnPlayerGoBroke)

function Buy(player, balance, item, price)
    for k,v in pairs(items) do
        price = v.price
        item = v.name
        print(price)
        print(item)
    end
    if v.id == player and balance >= price then
        balance = balance - price
        print("You bought"..item)
    end
end
AddCommand("buy", Buy)
AddFunctionExport("Buy", Buy)


function CreateItems(player, name, price)
    for k,v in pairs(items) do
    local name = v.name
    local price = v.price
    end
end



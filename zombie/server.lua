--ZOMBIE CLASS

zombie = {}
zombie.npc = {}
zombie.npc.id = 1
zombie.npc.health = 100
zombie.npc.attackSpeed = 0.5
zombie.npc.damage = 5
zombie.npc.count = 20
zombie.locationX = 127890
zombie.locationY = 80300
zombie.locationZ = 1645


local function InitVariables(zombie)   
    for k,v in pairs(zombie) do
        zID = v.id
        zHealth = v.health
        zAttackSpeed = v.attackSpeed
        zDamage = v.damage
        zCount = v.count
        ZombieX, ZombieY, ZombieZ = v.locationX,v.locationY,v.locationZ
    end
end

local function OnPackageStart()
    print(GetPackageName().." Started !")
end
AddEvent("OnPackageStart", OnPackageStart)

--END OF THE CLASS


--ZOMBIE METHODS
function CPU()
    for k,zombie in pairs(GetAllNPC()) do
        SetNPCPropertyValue(zombie, "IS_ZOMBIE", true)
        SetNPCPropertyValue(zombie, "health", 100)
        SetNPCPropertyValue(zombie, "damage", 5)
    end
end
AddEvent("CPU", CPU)

function Bite(playerid)
    local pHealth = GetPlayerHealth(1)
    for k,zombie in pairs(GetAllNPC()) do
    local npcDamage = GetNPCPropertyValue(zombie, "damage")
    local damage = pHealth - npcDamage
    SetNPCAnimation(zombieNPC, "PICKAXE_SWING", false)
    SetPlayerHealth(1, tonumber(damage))
    end
end
AddEvent("Bite", Bite)

function ZombieFollow(playerid)
    for k,npcId in pairs(GetAllNPC()) do
        for k,playerid in pairs(GetAllPlayers()) do
        SetNPCFollowPlayer(npcId, playerid)
        end
    end
end
AddEvent("zombieFollow", ZombieFollow)

function SpawnZombie(x, y, z)
    zombieNPC = CreateNPC(tonumber(x), tonumber(y), tonumber(z), 0)
    CPU()
end
AddEvent("SpawnZombie", SpawnZombie)


function GetDistance()
    for k,npcID in pairs(GetAllNPC()) do
        local npcX, npcY, npcZ = GetNPCLocation(npcID)

        for k,playerid in pairs(GetAllPlayers()) do
            local playerX, playerY, playerZ = GetPlayerLocation(playerid)

            distance = math.sqrt(((playerX - npcX) ^2) + ((playerY - npcY) ^2) + ((playerZ - npcZ) ^2))
            SetNPCPropertyValue(npcID, "Distance", distance)
            distancebpz = GetNPCPropertyValue(npcID, "Distance")

            

            print(distancebpz)
            if distancebpz < 1000 then
                AddPlayerChat(1, "Zombie near you")
                Delay(2000, Bite)
            end
        end
    end
end
AddEvent("GetDistance", GetDistance)


function SetupZombies()
    for i=1,20 do
        a = math.random(2000, 6000)
        SpawnZombie(127890 + a, 80100, 1645 + a, 0)
    end
end
AddEvent("SetupZombies", SetupZombies)


--END OF THE METHODS

function Game()
    if zID == player then
    SetupZombies()
    GetDistance()
    ZombieFollow()
    end
    
end
AddEvent("Game", Game)

local function OnNPCReachTarget(npcId)
    ZombieFollow()
end
AddEvent("OnNPCReachTarget", OnNPCReachTarget)

local function OnPlayerJoin(player)
    AddPlayerChat(1, "Hello my children")
    Game()
end
AddEvent("OnPlayerJoin", OnPlayerJoin)


local function OnGameTick()
    Delay(4000, GetDistance)
end
AddEvent("OnGameTick", OnGameTick)




















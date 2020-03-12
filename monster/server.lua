ZoneObjectsCached = { }


ZoneDefaultEnnemies = {
    zombie = 100,
    ghoul = 200,
    demon = 300
}

ZoneTable = {                                       
    {

        ennemies = ZoneDefaultEnnemies,
        location = {125773, 80246, 1645, 180},
        ennemyspawn = {127890, 80363, 1645, 180}
    }
}

AddEvent("OnPackageStart", function()
    for k,v in pairs(ZoneTable) do
        v.npc = CreateNPC(v.location[1], v.location[2], v.location[3], v.location[4])
        CreateText3D(_("Zombie"), 18, v.location[1], v.location[2], v.location[3] + 120, 0, 0)
        table.insert(ZoneObjectsCached, v.npc)
    end
end)

AddEvent("OnPlayerJoin", function(player)
    CallRemoteEvent("player", "ZoneCreation", ZoneObjectsCached)
end)

AddRemoteEvent("PlayerEnteredZone", function(player, zoneobject)
    local zombie = GetMonsterByZoneObject(zoneobject)

    if zombie then
        local x,y,z = GetNpcLocation(zombie.npc)
        local x2,y2,z2 = GetPlayerLocation(player)
        local dist = GetDistance3D(x, y, z, x2, y2, z2)
        SetNPCHealth(v.npc, 100)
        SetNPCRespawnTime(v.npc, 5000)


        if dist < 250 then
            for k,v in pairs(ZoneTable) do
                if zoneobject.npc == v.npc then
                    SetNPCFollowPlayer(zombie.npc, player, speed (4))
                end
            end
        end
    end
end)


function GetMonsterByZoneObject(zoneobject)
    for k,v in pairs (ZoneTable) do
        if v.npc == zombie then
            return v
        end
    end
    return nil
end

function tablefind(tab, el)
    for index, value in pairs(tab) do
        if value == el then
            return index
        end
    end
end











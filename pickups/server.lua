pickup = {}
pickup.types = {"NONE", "MAX_AMMO"}


function Create_Pickup(type)
    for i,v in ipairs(pickup) do
        if type == v.types[i] then
            return v.types[i]
        end
    end
end


-----> "NONE, MAX_AMMO"


function spawnPickup(type)
    if Create_Pickup() == "MAX_AMMO" then
        for k,v in pairs(Account) do
            if v.id == player then 
            local x,y,z = GetPlayerLocation(player)
            
            end
        end
    end
end




-- Table avec les types de Pickups 
-- -type = "MAX_AMMO"
-- -
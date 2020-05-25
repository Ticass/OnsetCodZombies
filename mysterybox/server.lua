local function OnPackageStart()
    print("Mystery Box has been loaded")
end


Currency = ImportPackage("points")


mysterybox = {
    {
        id = 1,
        price = 950,
        used = 0,
        maxuses = 9
    }
}



function BuyMysteryBox(player)
    for k,v in pairs(mysterybox) do
        if v.used == v.maxuses then
            return AddPlayerChat(player, "Not Enough Cash")
        end
    if v.id == player and v.used < v.maxuses then
        Currency.RemovePlayerMoney(player, v.price)
        AddPlayerChat(player, "Please Wait For The Mystery Box To Open")
        for i=1,19 do 
            weprng = i - math.random( 1, 18 )
        end            
        PlayerWeapon = SetPlayerWeapon(player, weprng, 250, true, 1, true)
        AddPlayerChat(player,"The Mystery Box Gave you the weapon number: "..weprng)
        v.used = v.used + 1
        end
    end
end
AddEvent("BuyMysteryBox", BuyMysteryBox)
AddCommand("box", BuyMysteryBox)












--DEBUGGING SECTION
function Debug(player)
for k,v in pairs(mysterybox) do 
    print(weprng)
    end
end
AddCommand("debug", Debug)



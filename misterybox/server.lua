local function OnPackageStart()
    print("Mistery Box has been loaded")
end


Currency = ImportPackage("points")


Misterybox = {
    {
        id = 1,
        price = 950,
        used = 0,
        maxuses = 9
    }
}





function BuyMisteryBox(player)
    for k,v in pairs(Misterybox) do
        if v.used == v.maxuses then
            return AddPlayerChat(player, "Max uses !")
        end
    if v.id == player and v.used < v.maxuses then
        Currency.AcceptDeny(player, v.price)
        Currency.RemovePlayerMoney(player, v.price)
        AddPlayerChat(player, "Please Wait For The Mistery Box To Open")
        for i=1,19 do 
            weprng = i - math.random( 1, 18 )
        end            
        PlayerWeapon = SetPlayerWeapon(player, weprng, 250, true, 1, true)
        AddPlayerChat(player,"The Mistery Box Gave you the weapon number: "..weprng)
        v.used = v.used + 1
        end
    end
end
AddEvent("BuyMisteryBox", BuyMisteryBox)
AddCommand("box", BuyMisteryBox)
AddFunctionExport("BuyMisteryBox", BuyMisteryBox)









--DEBUGGING SECTION
function Debug(player)
for k,v in pairs(Misterybox) do 
    print("allo")
    end
end
AddCommand("debug", Debug)



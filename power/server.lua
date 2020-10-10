PowerEnabled = false


Power = {}

Power.price = 200


function BuyPower(player)
for k,v in pairs(Account) do
    for k,p in pairs(Power) do
    if p.id == player and p.balance > p.price then
        Points_Remove(player, p.price)
            AddPlayerChatAll("The Power Has been Activated by player #"..v.id)
            PowerEnabled = true
            end
        end
    end
end
AddCommand("power", BuyPower)




function PowerOn()
    if PowerEnabled then
        return true
    end
end
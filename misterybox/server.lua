
MetaObjects = ImportPackage("metaobjects")






function CreateMysterBoxObject()
    boxObject = CreateObject(1, 130482.0234375, 80778.4765625, 1502.5679931641)
    SetObjectScale(boxObject, 0.49996739625931, 2.4999985694885, 0.69998675584793)
    SetObjectTexture(boxObject, "misterybox/mbox.jpg")
end

function GetBoxDistance(player, boxObject)
    for k,v in pairs(Account) do
        if v.id == GetPlayersInRange3D(130482.0234375, 80778.4765625, 1502.5679931641, 300) then
            AddPlayerChat(player, "Press E To Use The Mistery Box")
            print(v.id.." Used The misterybox")
        end
    end
end


function PlayAnimation()
    for i=2,21 do 
        animRNG = i - math.random( 2, 21 )
        animGun = CreateObject(animRNG, 130487.0859375, 80780.3359375, 1551.5791015625)
        Delay(1000, CreateObject, animGun)
        Delay(1000, DestroyObject, animGun)
    end
end



function BuyMisteryBox(player)

end
AddRemoteEvent("BuyBox", BuyMisteryBox)
AddCommand("box", BuyMisteryBox)








MisteryBox = {}

function MisteryBox()
    table.insert(MisteryBox, {used = 0, price = 950, location = {130482.0234375, 80778.4765625, 1502.5679931641}})
end






local function OnPackageStart()
    MisteryBox()
    CreateMysterBoxObject()
end
AddEvent("OnPackageStart", OnPackageStart)




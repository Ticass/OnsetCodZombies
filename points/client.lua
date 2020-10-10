AddEvent("OnRenderHUD", function ()
    for k,v in pairs(Account) do
        if v.id == player then
	    local w, h = GetScreenSize() -- Gets the screen size of the client
        DrawText(w / 2, h / 2, "" .. v.balance) -- Creates the text in the center of the client's screen
        end
    end
end)

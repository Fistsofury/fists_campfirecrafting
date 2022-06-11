local sharedItems = exports['qbr-core']:GetItems()

exports['qbr-core']:CreateUseableItem("cookkit", function(source, item)
	local Player = exports['qbr-core']:GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("fists_campfirecrafting:client:cookinggrill", source, item.name)
    end
end)


RSGCore = exports['rsg-core']:GetCoreObject()

RSGCore.Commands.Add('fixinventory', 'Reset stuck inventory (use if inventory won\'t open)', {}, false, function(source, args)
    local player = RSGCore.Functions.GetPlayer(source)
    if not player then return end

    -- Clear stuck death state from dying before logging out
    if player.PlayerData.metadata['isdead'] then
        player.Functions.SetMetaData('isdead', false)
    end
    if player.PlayerData.metadata['inlaststand'] then
        player.Functions.SetMetaData('inlaststand', false)
    end

    exports['rsg-inventory']:CloseInventory(source)

    TriggerClientEvent('ox_lib:notify', source, {
        title = 'Inventory Reset',
        description = 'Your inventory has been unlocked.',
        type = 'success',
        duration = 5000
    })
end)

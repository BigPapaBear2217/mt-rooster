local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('mt-rooster:server:PegarFrangos', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local quantity = math.random(1, 2)
    local item = 'rooster_frango'

    Player.Functions.AddItem(item, quantity)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add")
end)

RegisterNetEvent('mt-rooster:server:DepenarFrangos', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local rooster_frango_morto = Player.Functions.GetItemByName('rooster_frango_morto')

    if rooster_frango_morto ~= nil then

        Player.Functions.RemoveItem('rooster_frango_morto', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['rooster_frango_morto'], "remove")

        Player.Functions.AddItem('rooster_frango_depenado', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['rooster_frango_depenado'], "add")
    end
end)

RegisterNetEvent('mt-rooster:server:MatarFrangos', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local rooster_frango = Player.Functions.GetItemByName('rooster_frango')

    if rooster_frango ~= nil then

        Player.Functions.RemoveItem('rooster_frango', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['rooster_frango'], "remove")

        Player.Functions.AddItem('rooster_frango_morto', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['rooster_frango_morto'], "add")
    end
end)

RegisterNetEvent('mt-rooster:server:CortarFrangos', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local rooster_frango_depenado = Player.Functions.GetItemByName('rooster_frango_depenado')

    if rooster_frango_depenado ~= nil then

        Player.Functions.RemoveItem('rooster_frango_depenado', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['rooster_frango_depenado'], "remove")

        Player.Functions.AddItem('rooster_frango_carne', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['rooster_frango_carne'], "add")
    end
end)

RegisterNetEvent('mt-rooster:server:VenderFrangos', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local rooster_frango_carne = Player.Functions.GetItemByName('rooster_frango_carne')
    local price = Config.ChickenSellPrice

    if rooster_frango_carne ~= nil then

        Player.Functions.RemoveItem('rooster_frango_carne', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['rooster_frango_carne'], "remove")

        Player.Functions.AddMoney('cash', price)
    else
        TriggerClientEvent('QBCore:Notify', src, 'You do not have any meat to sell', 'error')
    end
end)
local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('mt-rooster:client:PegarFrangos', function()
    QBCore.Functions.Progressbar('name_here', 'PICKING SOME CHICKENS...', 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = 'anim@gangops@facility@servers@',
        anim = 'hotwire',
        flags = 16,
    }, {}, {}, function()
        TriggerServerEvent('mt-rooster:server:PegarFrangos')
        QBCore.Functions.Notify('You plcuk a chicken', 'primary', 7500)
        ClearPedTasks(PlayerPedId())
    end)
end)

RegisterNetEvent('mt-rooster:client:DepenarFrangos', function()
    QBCore.Functions.Progressbar('name_here', 'PLUCKING SOME CHICKENS...', 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = 'anim@gangops@facility@servers@',
        anim = 'hotwire',
        flags = 16,
    }, {}, {}, function()
        TriggerServerEvent('mt-rooster:server:DepenarFrangos')
        QBCore.Functions.Notify('You recive a chicken', 'primary', 7500)
        ClearPedTasks(PlayerPedId())
    end)
end)

RegisterNetEvent('mt-rooster:client:MatarFrangos', function()
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
        if HasItem then

            QBCore.Functions.Progressbar('name_here', 'KILLING SOME CHICKENS...', 5000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = 'mini@repair',
                anim = 'fixing_a_ped',
                flags = 16,
            }, {}, {}, function()
                TriggerServerEvent('mt-rooster:server:MatarFrangos')
                QBCore.Functions.Notify('You killed a chicken', 'primary', 7500)
                QBCore.Functions.Notify('You have your hands with blood', 'primary', 7500)
                ClearPedTasks(PlayerPedId())
            end)
        else
            QBCore.Functions.Notify('You need a switch blade to kill chickens', 'error', 7500)
        end
    end, 'weapon_switchblade')
end)

RegisterNetEvent('mt-rooster:client:CortarFrangos', function()
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
        if HasItem then

            QBCore.Functions.Progressbar('name_here', 'CUTTING SOME CHICKENS...', 5000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = 'mini@repair',
                anim = 'fixing_a_ped',
                flags = 16,
            }, {}, {}, function()
                TriggerServerEvent('mt-rooster:server:CortarFrangos')
                QBCore.Functions.Notify('You cutt a chicken', 'primary', 7500)
                ClearPedTasks(PlayerPedId())
            end)
        else
            QBCore.Functions.Notify('You need a switch blade to kill chickens', 'error', 7500)
        end
    end, 'weapon_switchblade')
end)

RegisterNetEvent('mt-rooster:client:VenderFrangos', function()
    TriggerServerEvent('mt-rooster:server:VenderFrangos')
end)

CreateThread(function()
    if Config.UseJob == true then
        exports['qb-target']:AddBoxZone("Gaiola", Config.ChickenPickLoc1, 2, 2, {
            name="Gaiola",
            heading=335,
            debugpoly = false,
        }, {
            options = {
                {
                    event = "mt-rooster:client:PegarFrangos",
                    icon = "fas fa-turkey",
                    label = "Pick Chickens",
                    job = "rooster",
                },
            },
            distance = 1.5
        })

        exports['qb-target']:AddBoxZone("Gaiola2", Config.ChickenPickLoc2, 2, 2, {
            name="Gaiola2",
            heading=35,
            debugpoly = false,
        }, {
            options = {
                {
                    event = "mt-rooster:client:PegarFrangos",
                    icon = "fas fa-turkey",
                    label = "Pick Chickens",
                    job = "rooster",
                },
            },
            distance = 1.5
        })

        exports['qb-target']:AddBoxZone("Matador", Config.KillLoc, 2, 1, {
            name="Matador",
            heading=30,
            debugpoly = false,
        }, {
            options = {
                {
                    event = "mt-rooster:client:MatarFrangos",
                    icon = "fas fa-turkey",
                    label = "Kill Chickens",
                    job = "rooster",
                },
            },
            distance = 1.5
        })

        exports['qb-target']:AddBoxZone("Depenador", Config.PluckerSpotLoc, 3, 1, {
            name="Depenador",
            heading=30,
            debugpoly = false,
        }, {
            options = {
                {
                    event = "mt-rooster:client:DepenarFrangos",
                    icon = "fas fa-turkey",
                    label = "Pluck Chickens",
                    job = "rooster",
                },
            },
            distance = 1.5
        })

        exports['qb-target']:AddBoxZone("Cortador", Config.ChickenCutLoc, 8, 1, {
            name="Cortador",
            heading=315,
            debugpoly = false,
        }, {
            options = {
                {
                    event = "mt-rooster:client:CortarFrangos",
                    icon = "fas fa-turkey",
                    label = "Pluck Chickens",
                    job = "rooster",
                },
            },
            distance = 1.5
        })

        exports['qb-target']:AddBoxZone("Vendedor", Config.SellPedTarget, 1, 1, {
            name="Vendedor",
            heading=0,
            debugpoly = false,
        }, {
            options = {
                {
                    event = "mt-rooster:client:VenderFrangos",
                    icon = "fas fa-turkey",
                    label = "Sell Chickens",
                    job = "rooster",
                },
            },
            distance = 1.5
        })
    else
        exports['qb-target']:AddBoxZone("Gaiola", Config.ChickenPickLoc1, 2, 2, {
            name="Gaiola",
            heading=335,
            debugpoly = false,
        }, {
            options = {
                {
                    event = "mt-rooster:client:PegarFrangos",
                    icon = "fas fa-turkey",
                    label = "Pick Chickens",
                },
            },
            distance = 1.5
        })

        exports['qb-target']:AddBoxZone("Gaiola2", Config.ChickenPickLoc2, 2, 2, {
            name="Gaiola2",
            heading=35,
            debugpoly = false,
        }, {
            options = {
                {
                    event = "mt-rooster:client:PegarFrangos",
                    icon = "fas fa-turkey",
                    label = "Pick Chickens",
                },
            },
            distance = 1.5
        })

        exports['qb-target']:AddBoxZone("Matador", Config.KillLoc, 2, 1, {
            name="Matador",
            heading=30,
            debugpoly = false,
        }, {
            options = {
                {
                    event = "mt-rooster:client:MatarFrangos",
                    icon = "fas fa-turkey",
                    label = "Kill Chickens",
                },
            },
            distance = 1.5
        })

        exports['qb-target']:AddBoxZone("Depenador", Config.PluckerSpotLoc, 3, 1, {
            name="Depenador",
            heading=30,
            debugpoly = false,
        }, {
            options = {
                {
                    event = "mt-rooster:client:DepenarFrangos",
                    icon = "fas fa-turkey",
                    label = "Pluck Chickens",
                },
            },
            distance = 1.5
        })

        exports['qb-target']:AddBoxZone("Cortador", Config.ChickenCutLoc, 8, 1, {
            name="Cortador",
            heading=315,
            debugpoly = false,
        }, {
            options = {
                {
                    event = "mt-rooster:client:CortarFrangos",
                    icon = "fas fa-turkey",
                    label = "Pluck Chickens",
                },
            },
            distance = 1.5
        })

        exports['qb-target']:AddBoxZone("Vendedor", Config.SellPedTarget, 1, 1, {
            name="Vendedor",
            heading=0,
            debugpoly = false,
        }, {
            options = {
                {
                    event = "mt-rooster:client:VenderFrangos",
                    icon = "fas fa-turkey",
                    label = "Sell Chickens",
                },
            },
            distance = 1.5
        })
    end
end)

CreateThread(function()
    RequestModel(`g_m_m_armboss_01`)
      while not HasModelLoaded(`g_m_m_armboss_01`) do
      Wait(1)
    end
      RoosterSellPed = CreatePed(2, `g_m_m_armboss_01`, Config.SellPedLoc, false, false)
      SetPedFleeAttributes(RoosterSellPed, 0, 0)
      SetPedDiesWhenInjured(RoosterSellPed, false)
      TaskStartScenarioInPlace(RoosterSellPed, "WORLD_HUMAN_STAND_IMPATIENT", 0, true)
      SetPedKeepTask(RoosterSellPed, true)
      SetBlockingOfNonTemporaryEvents(RoosterSellPed, true)
      SetEntityInvincible(RoosterSellPed, true)
      FreezeEntityPosition(RoosterSellPed, true)
end)
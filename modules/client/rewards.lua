return function(config)
    if not config.vehicle.enable then
        local max <const>, timer = 5000

        local function ForceRemove()
            timer = GetGameTimer()
            while not (GetGameTimer() - timer) > max do
                DisablePlayerVehicleRewards(supv.cache.ped)
                Wait(1)
            end
        end
    
        local list = {}
        for k,v in pairs(config.vehicle.list) do
            list[joaat(k)] = v
        end
        CreateThread(function()
            while true do
                if list[GetEntityModel(GetVehiclePedIsTryingToEnter(supv.cache.ped))] then
                    ForceRemove()
                end
                Wait(500)
            end
        end)
    end

    if not config.npc.enable then
        supv.onCache('playerid', function(value)
            for i = 1, #config.npc.list do
                local pickup = config.npc.list[i]
                ToggleUsePickupsForPlayer(value, pickup, false)
            end
        end)

        if config.npc.clear_pickups then
            CreateThread(function()
                while true do
                    Wait((6*10000)*30) -- every 30min
                    RemoveAllPickupsOfType(0xA9355DCD) -- shotgun
                    RemoveAllPickupsOfType(0xDF711959) -- carbine-rifle
                    RemoveAllPickupsOfType(0xF9AFB48F) -- pistol
                end
            end)
        end
    end
end
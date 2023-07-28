local DisplayRadar <const> = DisplayRadar
local GetEntityModel <const> = GetEntityModel
local InvalidateIdleCam <const> = InvalidateIdleCam
local InvalidateVehicleIdleCam <const> = InvalidateVehicleIdleCam
local IsHudComponentActive <const> = IsHudComponentActive
local HideHudComponentThisFrame <const> = HideHudComponentThisFrame
local SetPlayerCanDoDriveBy <const> = SetPlayerCanDoDriveBy
local SetPedCanRagdoll <const> = SetPedCanRagdoll
local SetEntityOnlyDamagedByPlayer <const> = SetEntityOnlyDamagedByPlayer
local SetPedConfigFlag <const> = SetPedConfigFlag

local thread = {}

local function HideRadarInVehicle(config, task)
    if thread[task] then return end
    thread[task] = true
    local blacklisted, onActive = {}, false
    for k, v in pairs(config.show_radar.vehicle) do
        blacklisted[joaat(k)] = v
    end
    CreateThread(function()
        while true do
            if not onActive and supv.cache.vehicle and not blacklisted[GetEntityModel(supv.cache.vehicle)] then
                onActive = true
                DisplayRadar(true)
            elseif onActive and not supv.cache.vehicle then
                onActive = false
                DisplayRadar(false)
            end
            Wait(850)
        end
    end)
end

local function StopAfkCam(task)
    if thread[task] then return end
    thread[task] = true
    CreateThread(function()
        while true do
            Wait(2000)
            InvalidateIdleCam()
		    InvalidateVehicleIdleCam()
        end
    end)
end

local function TurnOffCrossHit(task) -- await some update coming from supv_core
    if thread[task] then return end
    thread[task] = true
    local sleep, controls = 850, supv.disable_control.new({140, 141, 142})
    CreateThread(function()
        while true do
            sleep = 850
            if supv.cache.weapon then sleep = 0
                controls:play()
            end
            Wait(sleep)
        end
    end)
end

return function(config)
    if not config.afk_cam then
        StopAfkCam('cam')
    end

    if not config.cross_hit then -- await some update coming from supv_core
        TurnOffCrossHit('cross')
    end

    if type(config.show_radar.type) == 'string' and config.show_radar.type == 'vehicle' then
        DisplayRadar(false)
        HideRadarInVehicle(config, 'radar')
    end

    if config.hide_hud.enable then
        local sleep, list = 850, config.hide_hud.list

        CreateThread(function()
            while true do
                for i = 1, #list do
                    local hud = list[i]
                    if hud ~= 14 then
                        if IsHudComponentActive(hud) then sleep = 1
                            HideHudComponentThisFrame(hud)
                        end
                    else
                        if supv.cache.weapon and not config.hide_hud.scope_list[supv.cache.weapon] then sleep = 1
                            HideHudComponentThisFrame(14)
                        end
                    end
                end
                Wait(sleep)
            end
        end)
    end

    supv.onCache('playerid', function(value)
        SetPlayerCanDoDriveBy(value, config.can_do_drive_by)
        if type(config.show_radar.type) == 'boolean' then DisplayRadar(config.show_radar.type) end
    end)

    supv.onCache('ped', function(value)
        SetPedCanRagdoll(value, config.can_ragdoll)
        SetEntityOnlyDamagedByPlayer(value, config.can_damaged_only_by_player)
        if config.flags.enable then
            local list = config.flags.list
            for i = 1, #list do
                local flag = list[i]
                SetPedConfigFlag(value, flag.id, flag.value)
            end
        end
    end)
end
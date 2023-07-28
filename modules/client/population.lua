local SetRandomBoats <const> = SetRandomBoats
local SetRandomTrains <const> = SetRandomTrains
local SetGarbageTrucks <const> = SetGarbageTrucks
local SetCreateRandomCops <const> = SetCreateRandomCops
local SetCreateRandomCopsNotOnScenarios <const> = SetCreateRandomCopsNotOnScenarios
local SetCreateRandomCopsOnScenarios <const> = SetCreateRandomCopsOnScenarios
local SetDispatchCopsForPlayer <const> = SetDispatchCopsForPlayer
local SetPedPopulationBudget <const> = SetPedPopulationBudget
local SetVehiclePopulationBudget <const> = SetVehiclePopulationBudget
local SetNumberOfParkedVehicles <const> = SetNumberOfParkedVehicles

return function(config)
    supv.onCache('playerid', function(value)
        SetRandomBoats(config.enable.boats)
        SetRandomTrains(config.enable.trains)
        SetGarbageTrucks(config.enable.garbage_truck)
        SetCreateRandomCops(config.enable.cops)
        SetCreateRandomCopsNotOnScenarios(config.enable.cops)
        SetCreateRandomCopsOnScenarios(config.enable.cops)
        SetDispatchCopsForPlayer(value, config.enable.cops)
        SetPedPopulationBudget(config.traffic.npc)
        SetVehiclePopulationBudget(config.traffic.vehicle)
        SetNumberOfParkedVehicles(config.traffic.parked)
    end)
end
local config <const> = require 'config.client.population'

return function()
    supv.updateCache('serverid', function(value)
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
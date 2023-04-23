local config <const> = require 'config.server.entity_ceating'

return function()
    AddEventHandler("entityCreating", function(entity)
        if next(config.blacklist) then
            if config.blacklist[GetEntityModel(entity)] then
                CancelEvent()
            end
        end
    end)
end
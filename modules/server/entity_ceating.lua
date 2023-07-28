return function(config)
    AddEventHandler("entityCreating", function(entity)
        if next(config.blacklist) then
            if config.blacklist[GetEntityModel(entity)] then
                CancelEvent()
            end
        end
    end)
end
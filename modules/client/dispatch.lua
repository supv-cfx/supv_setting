local config <const> = require 'config.client.dispatch'

return function()
    supv.updateCache('ped', function(value)
        for i = 0, #config do
            local v = config[i]
            EnableDispatchService(v, i)
            v = not v
            BlockDispatchServiceResourceCreation(i, v)
        end
    end)
end
local EnableDispatchService <const> = EnableDispatchService
local BlockDispatchServiceResourceCreation <const> = BlockDispatchServiceResourceCreation

return function(config)
    supv.onCache('ped', function(value)
        for i = 0, #config do
            local v = config[i]
            EnableDispatchService(v, i)
            v = not v
            BlockDispatchServiceResourceCreation(i, v)
        end
    end)
end
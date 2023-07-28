local EnableDispatchService <const> = EnableDispatchService
local BlockDispatchServiceResourceCreation <const> = BlockDispatchServiceResourceCreation

---@param value boolean
---@param index integer
local function ManageDispatch(value, index)
    EnableDispatchService(value, index)
    BlockDispatchServiceResourceCreation(index, not value)
end

return function(config)
    supv.onCache('ped', function(value)
        for i = 0, #config do
            local v = config[i]
            ManageDispatch(v, i)
        end
    end)

    CreateThread(function()
        for i = 0, #config do
            local v = config[i]
            ManageDispatch(v, i)
        end
    end)
end
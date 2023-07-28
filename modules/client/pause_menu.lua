local AddTextEntry <const> = AddTextEntry

return function(config)
    CreateThread(function()
        for k,v in pairs(config) do
            AddTextEntry(k, v)
        end
    end)
end
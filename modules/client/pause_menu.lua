local config <const> = require 'config.client.pause_menu'

return function()
    CreateThread(function()
        for k,v in pairs(config) do
            AddTextEntry(k, v)
        end
    end)
end
if not supv then return end

if supv.service == 'client' then
    local config <const> = require 'config'
    for k, v in pairs(config) do
        if v == true then
            local modname = ('modules.%s.%s'):format(supv.service, k)
            local module = require(modname)
            if type(module) == 'function' then
                module(supv.json.load(('data.%s.%s'):format(supv.service, k)))
            end
        end
    end
elseif supv.service == 'server' then
    local config = require 'config'

    if config.rm then
        require 'server.resource_manager'(config.client, config.server)
    end

    for k, v in pairs(config.server) do
        if v == true then
            local modname = ('modules.%s.%s'):format(supv.service, k)
            local module = require(modname)
            if type(module) == 'function' then
                module(supv.json.load(('data.%s.%s'):format(supv.service, k)))
            end
        end
    end
end
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
    local data, c = config.rm and {server = {}, client = {}}
    for k, v in pairs(config.server) do
        if v == true then
            local modname = ('modules.%s.%s'):format(supv.service, k)
            local module = require(modname)
            if type(module) == 'function' then
                c = supv.json.load(('data.%s.%s'):format(supv.service, k))
                module(c)
                if data and not data.server[k] then
                    data.server[k] = c
                end
            end
        end
    end

    if not data then return end

    for k,v in pairs(config.client) do
        c = supv.json.load(('data.%s.%s'):format('client', k))
        if not data.client[k] then
            data.client[k] = c
        end
    end

    require 'modules.server.resource_manager'(data.client, data.server, config)
end
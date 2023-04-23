if not supv then return end

local config <const> = require 'config'

for k, v in pairs(config) do
    if v == true then
        local modname = ('modules.%s.%s'):format(supv.service, k)
        local module = require(modname)
        if type(module) == 'function' then
            module()
        end
    end
end
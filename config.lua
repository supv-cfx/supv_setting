--[[
    fr: Pour activer des module(s), configurez les modules activer dans le dossier config
    en: To turn on module(s), config module you activate in config folder
--]]
if not supv then return end
local ResourceManager <const> = true

if supv.service == 'client' then
    return supv.json.load 'data.client'
elseif supv.service == 'server' then
    return {
        server = supv.json.load 'data.server',
        client = supv.json.load 'data.client',
        rm = ResourceManager
    }
end
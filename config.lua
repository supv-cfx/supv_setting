--[[
    fr: Pour activer des module(s), configurez les modules activer dans le dossier config
    en: To turn on module(s), config module you activate in config folder
--]]
if not supv then return end

if supv.service == 'client' then
    return {
        population = true,
        dispatch = true,
        rewards = true,
        player = true,
    }
elseif supv.service == 'server' then
    return {

    }
end
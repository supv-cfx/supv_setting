--[[
    fr: Pour activer des module(s)
    en: To turn on module(s)
--]]
if not supv then return end

if supv.service == 'client' then
    return {
        population = true,
    }
elseif supv.service == 'server' then
    return {

    }
end